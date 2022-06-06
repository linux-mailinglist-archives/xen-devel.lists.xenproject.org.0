Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9353E4BD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342536.567575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyClW-0007M3-3X; Mon, 06 Jun 2022 13:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342536.567575; Mon, 06 Jun 2022 13:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyClW-0007Ig-02; Mon, 06 Jun 2022 13:27:30 +0000
Received: by outflank-mailman (input) for mailman id 342536;
 Mon, 06 Jun 2022 13:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh0U=WN=citrix.com=prvs=149ed92ed=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nyClU-0007Ia-Io
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:27:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6739e078-e59c-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 15:27:26 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2022 09:27:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6086.namprd03.prod.outlook.com (2603:10b6:208:31c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 13:27:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 13:27:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6739e078-e59c-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654522046;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4WNgenD7RO/Hdtc9C1WsobotvwJWZeqx6euE/GeXOac=;
  b=VKrOdYny9FZXvoCh0TGdGMvJq1wGlHMoLieSU/rmkYqLl0qTHxMxdD0V
   QE8Z11DnngewtgLjCGmWBkqO8S0Hd1GswLHbYFwVDtZvc2L9Lqfb8eNFD
   bhhkPvfnEit/tW4FKtGWCNaRWPwt3EsplF+SPULE+j5HhpVe3yKfCs52f
   o=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 72939774
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1s5EWqjFVxPbgyOhxBn0T0QHX161QREKZh0ujC45NGQN5FlHY01je
 htvCjyEb/+DYmP8LdxxaIuzpkxS75PTmIA1TFY+qSFjRiwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQYvZ/zsl/YwaDBZCn1bBLR/0rXjYkHq5KR/z2WeG5ft69NHKRhseKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI4ehWhr7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJouTmInVMujNABNvLYWNCOTPpxtXyFt
 2edxGbkCysdLoSmnG/tHnWEw7WncTnAcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ8+Dco664790WpT9z0dxy+vHOA+BUbXrJ4EOAk6QfL1qvd5S6YAHQJSnhKb9lOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfHuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:cvyZb6zrIq7oGTwD95UuKrPxc+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMYs1MSZLXPbUQyTXc9fBOrZsnHd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadg/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZcbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESvtu/oXvUlZ1SxhkFznAid0idtrD
 AKmWZ4Ay1H0QKUQohym2q05+Cv6kd015ao8y7kvZKqm72EeNt9MbsAuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGrf2x4Uh37D30XklWavoJhiKoLzP0d
 Meef309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy83BreDQQFy+oXgV4ridiuRaBNHHUP
 CuP58TC+P/LALVaPJ04zE=
X-IronPort-AV: E=Sophos;i="5.91,280,1647316800"; 
   d="scan'208";a="72939774"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNEuvxGjjMbo6BDoRXqF1ZiG/77L9DVq3auEl3LOpOBjV09uEajVRKIX7IZlmWUJyiKpdGsCts7PwaIulNMvEeqXv2bTLTAAP3ghHpCRvi23nVOHUoKwOwFvYnzZNjn451yD4EBN1D3vJHkbCc4ip3Q8LQs+RJ750JUvLQa5xhbREqpN/4kHTgkSvV3YoTy0goympwqVLKciWDjJsXHrup7XBaVxq9/s9icLXmTVgUwS8b5ZduH+R9ogg9HO4b8hfDInbiM6+o/Q0LCGHpJcV+73quTDGDMk/I1ZCH9cTx7hgg1RG9kb4Rv650lFJcrHwqf0uEM2vT83nBWT1hEo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WNgenD7RO/Hdtc9C1WsobotvwJWZeqx6euE/GeXOac=;
 b=YPLjZNn33gm/5nYKo3OoiVSuZ9onxF+zicugQlPYmNVHAtX2kWRc43S4ZhfwDhwpzXh4dcl2LqeGsbMXArcz6CX2XcWvL/NTlNNLr0bkxaBNO0SRYiOqO6whtGgeyreufF2WvfvPxrqY4QSNhpjswOB2uk9ev3Y6r1wurr9RNFFdFREFLv+CeoSOgQpY2GSUToE72A/d5oEyxQ8PreGBQIdD2j3a3kzCl+O2JMRtZJaFvCwvJYw4fM4ssKj6Aj89mxqEq2NKjbvXJYl5XbyzVP741deluGuXOPYSQnjL0MP3vplSg+yAQ8bsuvoqX8XbjhuBNexS+/c7s6Csv2aJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WNgenD7RO/Hdtc9C1WsobotvwJWZeqx6euE/GeXOac=;
 b=xbo56kkYP6pQAIQbifuX90PK8St1/WmjfcsVWkGXvlVIPdz6LA4p0oOpaynNTbX23/86Rokk/vExTtuaDGvh8Vz1wIz+zjqJMfiypKRKuVNv7O6l573lxD/GZaQs/xTgj8Pwg3FF299MMn1vaZX+jk2p2pPK2UA1OvsiExMtKIA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Thread-Topic: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Thread-Index: AQHYcPF6ki4pJ9UKm0etGSMPsHK7Oa1CcGeA
Date: Mon, 6 Jun 2022 13:27:19 +0000
Message-ID: <3c8b0b72-0a9a-3dfd-bf5c-b6cc40a4ce3a@citrix.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-2-roger.pau@citrix.com>
In-Reply-To: <20220526111157.24479-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c0abd9d-603f-42f6-899d-08da47c0485e
x-ms-traffictypediagnostic: BL1PR03MB6086:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <BL1PR03MB6086A237CADB4551BE278F94BAA29@BL1PR03MB6086.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3eGB1zlqdkbZjV7wLCj80zjBC0mDY5pinOpEt8oHH6e5ghoY1OWQ++xGbJD2cdTAA0lEUrr+r+RAyF2UdtiSrVAtoR/pEGJCmueQ6pB06AlZ4lnm8Xm5J+ol12YHIuB/kdsrA5QpfZtYeZDRYZ9mpPVf1EvPXc45askbTpQcp8Kwm3CFQgHKGpW5sCH56onyKhvnl5fiRAqoszXGF/FMxJ0ZVYtTDqIz5MsZKJtgG32zOh1R8JAIqpJ84vo5rq8mqKvAni9gIsk7ZbAq+w1dY8hmVFEqdnycPyl1dfPnH+jT+osjO8o/y6CAkz5LCMCx033nWklZKxf2DhcthEW/jSbXIILjHliXpyg0H8FUJEGP2RxNCqTAkdrMPzQwnl0a1ZKQ2vEevP7DFRnQWMcNJhovbYtNABtC08iUGrr00egXFL98asOEPFkvFtsPGsCFgjYKTWnkiOmFoIZ++yo03pNXY5DLKXhnq3HMdQrWDpKZj+wIWugSpOQAjRIJrbhEipFkn4lzpbdizum3I0w40SP50qnqprq1Sm3mtpSoxXtAgdOy0YSMBMppc95AG+Pr0gMVdnUnALsSsH8JHmKFyUgiNiEQ8e1VFIFwapOA9ar9S9Z8Ke4TLH7qiVpTenZVAh6hktUVK3rdCZCaVn9fnV39FKLdLrZZM9JCUtv1e0rr6WKs2tPF+uPNy0Pwj7mFxg/1gpPj1Z/JN8qfNnrcXvFoejRR3q5/Y1dgkOf7oP9SWK7WS4dX1niwcjtyZ/4FBeKEnx5XzloCtcS9IDHF7Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2616005)(53546011)(31686004)(71200400001)(54906003)(83380400001)(36756003)(6506007)(2906002)(86362001)(31696002)(5660300002)(64756008)(4326008)(122000001)(316002)(8676002)(66446008)(38070700005)(508600001)(186003)(6486002)(66556008)(76116006)(8936002)(66476007)(110136005)(91956017)(66946007)(26005)(6512007)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFVDUVFLNXQ5bmNDRytNTTZKaElTcE1pWkJlQkVIUG56MktUckRmOWQ2THNx?=
 =?utf-8?B?ZlVlWnRPMHQ1dDlvQ2hFOGNDZk1qZXh5eXRld3FocW5HaFFBVEloMXhqajYy?=
 =?utf-8?B?K2NMeHA0S1Uva3dDZEdFYzczdHhMVEZybFVTNHJzN2ZNeWVScnFhbFEvQk1N?=
 =?utf-8?B?d1RDeTVMeldpaEpZQXJuMFBHQ1RlQytXcUFNMnlpVEJmdDhrN3pNOXIyMUpC?=
 =?utf-8?B?RmZ1R2syV3VpTHhEbzdzZWphRnZudmIxZHVJNktFMHpGenZJUnlQbzVacmZP?=
 =?utf-8?B?RDcyTkdyNVFqaGtXeTF2elNpNDdwSDVEb1RTRVM2VkdkREtiTXh5c09rcEpH?=
 =?utf-8?B?Y1VRem81K2JseHFCT0ZyOW5iNVZIREF5QlFrUllEM0lDRmJqc3g2ZWdjSjRo?=
 =?utf-8?B?cFBQU29Bem9QU2pad0NidHlhcG0wT0t3bk4vZm1nYklUNHJlOHBya3U4WXRI?=
 =?utf-8?B?eDlYMmVSaUJMRWZKWlNMTnNIOFpzeFRtcTdLWEM5RjU5QjNRSGtQS1hkeGVj?=
 =?utf-8?B?cnoycU9yQnJ6cXpKM1Z5QlZRaC90aURZSk9yT1ZIbGNEeWQ3YWp4NmNKSGtG?=
 =?utf-8?B?aS8zb2FmWGFWVzJocUYzUllEL2R0TUVwKzRFSEZ4WWxnTndWRzNWaVNmRnZm?=
 =?utf-8?B?SUM0UFlvSmVyZW9HYWhEMG0zZ3h4cjJ6cWVVT1FNN2FuWC81WWx5ZVdnWnU0?=
 =?utf-8?B?TWJHY0RwTkFVaHc2RXVlNFNUcVVtVHJrZlBabmYvQXZId0ZpNmxXRnNZZlNu?=
 =?utf-8?B?RHlNWkhGd05GYVB0aXE5cDRScFZqRlFEbHBLL3JFbzJMZ3FiNEVWU3hPS0dx?=
 =?utf-8?B?YXNXVjFFc1htdTB4VnBIZzh0MnJJb1ZBUWtDeE9zamUrRFYyeXAzVGpBd3Zn?=
 =?utf-8?B?UkFNTndFL0F0anBIVDZoQ051eXdyMWROQjhUWHdmc2FYWnBUN2YzY3EyQXpH?=
 =?utf-8?B?RENIbWM3NmZMaGloVGprV0ZFMlFUMVFWR3BqQTgwS25kbXVZbDBQYWNnZXl6?=
 =?utf-8?B?RHFyc1BRY1d6TTJvaGNUd0VjMC9odCtKbENITXpkSWJEbU5hbGcxK0ZxZm81?=
 =?utf-8?B?ckg1TDN2Y0ZGazVjWU4rQUJYYUZCZkNySy9zL2tzTkgyUmZRSVJocUJEbzVh?=
 =?utf-8?B?b3RsZ0NGVWlKd1FJemEyekhZZzc2UFE4ZzVRWUlzOVI5T05qV2pRNEhJZkVS?=
 =?utf-8?B?M1FBVmswaWgvamw2bGFTOEJ2V2dBL2F0YnJjcjY0YmF6VENXRnRjTk16UlhU?=
 =?utf-8?B?MUhrRnB4STRrNys2RkVDWWREb2E5L3dMaG95QWFyM2EyMHdoUklSZmw5Zkx3?=
 =?utf-8?B?dFRYMTBXd3hudmxGUWtIMjcvYW5TcjZjOEpab0tFLzVRNFNONThFYVZ0S2pI?=
 =?utf-8?B?ZFY1d3VMd01raTlvbnhrcXBzcWcwODdGVnp2NlN2QnJZbG01ckRmSERwd1p6?=
 =?utf-8?B?VCtJa24rWnp1R2d4ZXBmZi91V0VnODdDZnQ4V2JHclhhSCtqUXZEV082T09P?=
 =?utf-8?B?aWJqbGFmZFMrd3k1OGpxMjJDTXpvREN4aDRlUVZ2VjFQYmwvV2tJd1I0ZHZv?=
 =?utf-8?B?Z2ZVTmpCTDMyRk5taVVaYkNHbEtlU2pCaVdKNHN2SFRpbXU2OGxJT3NvNXQv?=
 =?utf-8?B?RGp4OWZQb0JVbWVERnZrblhDWXVjOXVjcmlKUThvcXdpQlQrWkRzRzQ4SUhv?=
 =?utf-8?B?anhNWU1Da0lwTWFvdGs1SllKbURPMjJGOU9YcmlFTnUxRWNXTGsvZDZOMW9l?=
 =?utf-8?B?Tkl5aEI0endaYy80WDY1ankrN3VuQTJnSVVLUVNWcktWYlRtY05adkRnT3RD?=
 =?utf-8?B?VVNDYmVPL0ozbXJITGR0Mnd2ZlJ2TXRreHpzZmxGb0dXc0FBYVVkazFLWnJq?=
 =?utf-8?B?clpOdnhDYnVmNEcxU1R5cWZncHg0YUxxZkdNVUdXR2dPTkZEQUt0MTBOSkJr?=
 =?utf-8?B?MU9mQjZ0RXVTNk1KTlBMQTl2cGpoT2t5TS9taFNPQ1Y5bWlydjVacXBTMTZ6?=
 =?utf-8?B?OEt5ckE0TldNemVCQ1ZKOXowK1I3SWx5V05yMFJnNkF0ZVo1amNFZndpRTV6?=
 =?utf-8?B?ZEk1NGl4WHNKeUZVUHY3NDFjUy8xVGZWc2pRN2poTGx0SjVrQWxRZkJGMlVT?=
 =?utf-8?B?ajZYam1UUk91QzdPZmF5UlhpbmlxQmFNTUpFTlN0OE56QTNNL2VRa3lxbnI3?=
 =?utf-8?B?Q3gxRmN6Znd0UlFDQmd1dm5aSHRBQW9iL2xxMUw1VlpUZUR6ZlF4MTJmY2ty?=
 =?utf-8?B?OCtBOThxRlhBQjVzdy9FRW1KaGM4NUdnNEsrVVUzeTRSTUt2K1g2RUVKQTJj?=
 =?utf-8?B?UTVLVlV3U3hsOXlIeG5RbHBQbDBnaTc5dE1IamVDMURxVWdObElwaXp1MSsv?=
 =?utf-8?Q?pcoElInAoLe11efw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15688EEA390DE446941CA5FADAB2988C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0abd9d-603f-42f6-899d-08da47c0485e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 13:27:19.9638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbSXwq4LUmi3LzFUEGEa9pbEDy5d+TZrPG6iECwCAQ6ChToTIMv5RC49EIACYTwMi1HDbzvodjVeaLxnYwkzwV5D3t62QMQ2PqtUJYXgyF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6086

T24gMjYvMDUvMjAyMiAxMjoxMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
Yw0KPiBpbmRleCBmMDhhMDBkY2JiLi40NzZhYjcyNDYzIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0K
PiBAQCAtNDA2NSw2ICs0MDY1LDE2IEBAIHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQ0KPiAgDQo+ICAgICAgaWYgKCB1bmxpa2VseShleGl0X3JlYXNv
biAmIFZNWF9FWElUX1JFQVNPTlNfRkFJTEVEX1ZNRU5UUlkpICkNCj4gICAgICAgICAgcmV0dXJu
IHZteF9mYWlsZWRfdm1lbnRyeShleGl0X3JlYXNvbiwgcmVncyk7DQo+ICsgICAgaWYgKCB1bmxp
a2VseShleGl0X3JlYXNvbiAmIFZNWF9FWElUX1JFQVNPTlNfQlVTX0xPQ0spICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIERlbGl2ZXJ5IG9mIEJ1cyBMb2NrIFZNIGV4
aXQgd2FzIHByZS1lbXB0ZWQgYnkgYSBoaWdoZXIgcHJpb3JpdHkgVk0NCj4gKyAgICAgICAgICog
ZXhpdC4NCj4gKyAgICAgICAgICovDQo+ICsgICAgICAgIGV4aXRfcmVhc29uICY9IH5WTVhfRVhJ
VF9SRUFTT05TX0JVU19MT0NLOw0KPiArICAgICAgICBpZiAoIGV4aXRfcmVhc29uICE9IEVYSVRf
UkVBU09OX0JVU19MT0NLICkNCj4gKyAgICAgICAgICAgIHBlcmZjX2luY3IoYnVzbG9jayk7DQo+
ICsgICAgfQ0KDQpJIGtub3cgdGhpcyBwb3N0LWRhdGVzIHlvdSBwb3N0aW5nIHYyLCBidXQgZ2l2
ZW4gdGhlIGxhdGVzdCB1cGRhdGUgZnJvbQ0KSW50ZWwsIFZNWF9FWElUX1JFQVNPTlNfQlVTX0xP
Q0sgd2lsbCBiZSBzZXQgb24gYWxsIGV4aXRzLg0KDQpTbyB0aGUgY29kZSBsb2dpYyB3b3VsZCBi
ZSBzaW1wbGVyIGFzOg0KDQppZiAoIGV4aXRfcmVhc29uICYgVk1YX0VYSVRfUkVBU09OU19CVVNf
TE9DSyApDQp7DQrCoMKgwqAgcGVyZmNfaW5jcihidXNsb2NrKTsNCsKgwqDCoCBleGl0X3JlYXNv
biAmPSB+Vk1YX0VYSVRfUkVBU09OU19CVVNfTE9DSzsNCn0NCg0KYW5kIC4uLg0KDQo+ICANCj4g
ICAgICBpZiAoIHYtPmFyY2guaHZtLnZteC52bXhfcmVhbG1vZGUgKQ0KPiAgICAgIHsNCj4gQEAg
LTQ1NjEsNiArNDU3MSwxNCBAQCB2b2lkIHZteF92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncykNCj4gICAgICAgICAgdm14X2hhbmRsZV9kZXNjcmlwdG9yX2FjY2Vzcyhl
eGl0X3JlYXNvbik7DQo+ICAgICAgICAgIGJyZWFrOw0KPiAgDQo+ICsgICAgY2FzZSBFWElUX1JF
QVNPTl9CVVNfTE9DSzoNCj4gKyAgICAgICAgcGVyZmNfaW5jcihidXNsb2NrKTsNCg0KLi4uIGRy
b3BwaW5nIHRoaXMgcGVyZiBjb3VudGVyLg0KDQpXaXRoIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBs
aW5lcywgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXINCjxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0K

