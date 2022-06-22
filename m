Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FD5544B6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 10:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353569.580512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3w11-0005gn-2r; Wed, 22 Jun 2022 08:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353569.580512; Wed, 22 Jun 2022 08:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3w10-0005dZ-Ve; Wed, 22 Jun 2022 08:47:10 +0000
Received: by outflank-mailman (input) for mailman id 353569;
 Wed, 22 Jun 2022 08:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rPuW=W5=citrix.com=prvs=165a25834=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o3w0y-000578-R8
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 08:47:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4cb24b6-f207-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 10:47:07 +0200 (CEST)
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 04:47:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5450.namprd03.prod.outlook.com (2603:10b6:806:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 08:47:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:47:00 +0000
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
X-Inumbo-ID: e4cb24b6-f207-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655887627;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GMfMvkMpQPLVBYrmcJSMiy4wwMLRqvsXWZamxUW258s=;
  b=J5R1gargjo1Krb+sIZAVDl86WJ+R1GXDEDcHRLOa4nXem1sKMZkB7zJI
   WYJEv6EvrUsRoBAQVTIPBhXU/XwAcTScb2PwThjvRbeSi+tLiXpm+actw
   DlXv81GnSr0s7d5YyRWAXsrldVSOjOxJOeKVVb4CBehps2Khembpz6lIj
   k=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 73487308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:geOLQK5NddH2BFbqZOQ5zQxRtDjGchMFZxGqfqrLsTDasY5as4F+v
 mQYWz2CMq6KMTTzedAkPt+x8BsF7ZeEz4U3SwBqrnozHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSOcwE3YfDSyd0saBMFGgFTBZJD+oT+dC3XXcy7lyUqclPK6tA2VgQNG9Rd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiVo4MFtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK/vZnvDOLnGSd1pDtacuLIOHRHflTvWKFn
 TLd2ULEUwMVYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUdUl6+oOWlh1Slc8JSL
 VQO/SgjprR081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nMo/RDhvz
 VnQltXgAGQ1tKXPES7AsLCJsTm1JC4Za3cYYjMJRhcE5N+lp5wvihXITZBoF6vdYsDJJAwcC
 gui9EAW74j/R+ZSv0ln1TgrWw6Rm6U=
IronPort-HdrOrdr: A9a23:t5XWZaDILx8yQBflHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="scan'208";a="73487308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrljG9YRm2AexZzdgDQ4ehZSsUiT5XmOUEBzXCpV3ABY/s5lKiRtEeQ+eyO8lkWee6lL39aawESRS9PjP2yhD4jHkPgNKtpKV88/D7sZ2y/BoVh7W/F8u+PIeUj75RvfrBwkx8RYEnRvKS2JYHy2qsFpltUyh3KmQfpZRat2y3Bdr97yb8Nzkxgga1ttd55eGGnigUYPaioMEqu3PQ4arla4MCIXiXS7Ov39QP/jz8fe84cgYj2P9zEtN84EnDnxgxoqGEdC8+DOqem+Rus8mTpgNsjHbkqiQlrUU1tO0a14BZoK5VKmgt7YsGy88pOcW1xD7xpkm7i1CSSj1ry3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMfMvkMpQPLVBYrmcJSMiy4wwMLRqvsXWZamxUW258s=;
 b=dKx2ikpqN1R/18rhnFlhBYWxyp44ZxGt1u6u7wBtHPwH1zySIcI6wGOrxh1D+fe2rOACzdevX+iu4syYtw369bABvYTrwCAi3Jz3EPGxyxHhjiwukHO0RPJVG/4wq/xUZMuIIyjnjcsZlNwf1v4fAWNaF7GiD1fQybup3QdcTFN05tzP+yG+NxFnTok3z1U94bp10zV1S8qSXgRVAxOauZxgzUKgsMTn2C2L+1NVBkQ+7HUDpHCzld8NACw3k2waWAvfbJ+bgT+kfD4+P7GINaXulsOza7Eqsa459kAjOe3Xzm+WdzIdmdgeYR5FCMP4fLgc701c1w7fAGlLuwqhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMfMvkMpQPLVBYrmcJSMiy4wwMLRqvsXWZamxUW258s=;
 b=AGSw2m9zBRnLrx9pegOnGj2ZMAbK5OkOG661Q4NIs1B2F4W62hJOicE9wPoQKBhJAaagviXn3IBr1Rqff6qLAyi1V0DYxqLds3Wbk1m2ji2IGrCb6FCgvFLdWmwgnjLlaSqQkQ/FpvuaO0y0sQpPJLPvxsjlPxANPhNKzVQTQcE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: "committers@xenproject.org" <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: disabling mercurial repositories
Thread-Topic: disabling mercurial repositories
Thread-Index: AQHYhXXQrdr64fwrwEqfZHy5KYkmJq1bHNMAgAABhoA=
Date: Wed, 22 Jun 2022 08:47:00 +0000
Message-ID: <10a33bef-bcef-9ec4-5171-a579019a69f1@citrix.com>
References: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
 <aaea6105-e83d-feba-edf3-3d7e26b90769@suse.com>
In-Reply-To: <aaea6105-e83d-feba-edf3-3d7e26b90769@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09ac4e29-f9a5-4974-6568-08da542bc5d6
x-ms-traffictypediagnostic: SA0PR03MB5450:EE_
x-microsoft-antispam-prvs:
 <SA0PR03MB5450FE3EB30DF4FDAAF81325BAB29@SA0PR03MB5450.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VoYag12EyJyNv8MDXqYi/lJWL+EZeK0uFfAP3S6fX9uRZSVRnQePTQM47H35UQdiz0VINtY74Hh1pjYS9ZSti0ZkyajWEx1ouY2+BX4rjfTEAZ2+Ic2TZTZJDg6r8lYb0MTkbUBtdht1C8/D9yTM2ANkHWc4guI1qnWXJfl2/U8yOcOd1Ysm5HuXVZzzXh05DjIDtOSoccDJn0kiXp1OPJi9cGyoPX2lLVRJPQAIk5e1hrnMCvtzYAazYej/hnBL2p12m8c3uC1obTv9tvXJHef8LJsmJhZXxuWveoIh1rxsAE/TCbnJbOWTOUeDIEBBunCjXQCKAdWfqbAV06csjRP+KS6XaVFzRJzR9VlT3hLUCJjdqDJJ6vHAl4i5oV3MbWxj/PC3WPFaRpL5Xt3Nzdw3jr3FKx2lUiO6u8wwEE1MkckGno8ViL3fzyik1zWD0iOE9jklv8dr/ovN7vWkvkadWIkgnMQcQj6KU0bJk3bSXkMcEjof4r7qankqXhi6ayozOYpzm1dVtuaRfn2AbETLdduEdB1cXWZ8IZOoaRHQN6TcVfrg5mG2OyOToubRpOuGCXvS5yEGALsyJw/NEsKj27QpNsbyXzRPgpOljxNrx7lE89i3IHO7fQ1ufEZswtrdf4NdeMOZKR8K/7bPWncn3cDBsPLbgMzbskMuVY+TPcA2Xrd4BvEQQVY9F2NpbArXmg3ijvAuMYJURJuwMsjQYWPubjWAtKu1b0ycTv9yUV5Bin5L9DlaBkFkOOPG67nmVZMXVtb2bInYPeJ5ioBUS3YAmHBf3nOp9LhcSN3JgaeWJOVuWcQZ1CwINlpTW00niU8Ygn32VsbYh1W9SA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(2616005)(41300700001)(6636002)(316002)(38100700002)(478600001)(31686004)(71200400001)(26005)(31696002)(6486002)(36756003)(83380400001)(2906002)(6512007)(186003)(54906003)(91956017)(122000001)(6506007)(66946007)(64756008)(76116006)(82960400001)(8676002)(53546011)(66556008)(86362001)(5660300002)(66446008)(8936002)(3480700007)(66476007)(38070700005)(7116003)(4326008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGZYby9jMHpKcjNsRnJTZE1GZkl3VDNKeitYNXAwQWFWa2F0UGY2WHFiSDMx?=
 =?utf-8?B?dG5zT3lXMUpXY0s1TjhwZEJzYzI2QVlIRVVtbzk2ZzFMcXVtamJOMDhwdVp1?=
 =?utf-8?B?aGMvMUVlZU9sSzhaY0tyUWhRYzBnV2FrdDE1S05nVDFmbENFakdMQ3g5b3VO?=
 =?utf-8?B?UzN4K0pyZTQyL3NSN3VKZmZGOHNnSDVIM1NyZ2JxSWZZUWpvU01wZ2sxZXJ0?=
 =?utf-8?B?QldaeVBDTkZBMERSVGczMGNGMWorMGJXdGVWNS9TcVBCa2toZ2hGZjMxaUp3?=
 =?utf-8?B?aE5DREkvb0pIeEJhdCttekdKQmlRT2RkRElrcDgrK3k1VFlRNk00RzVuTjZW?=
 =?utf-8?B?aWdlZzFRZDl5a2pSZzlKb0lJT1l1UUxVbEVKV0dvYnJMUjZuWHB0VllRYUFJ?=
 =?utf-8?B?NnVBNzRkTFJZb1E3UnA2amlBdHNrWFEzZGd2ek8zM2JvUGRVR284bHRvTTNT?=
 =?utf-8?B?MHZ3YXVhME1kWDlBbm00Sjd3THkrSzZNNXlmVDhkRXZSV1ZpMjh2aS82TURF?=
 =?utf-8?B?VDh5bG1HQmRhcCs5TjE0SGQwS3ZnNHUzekVYVDZ2UmRiZURqM3g3aHoxemF6?=
 =?utf-8?B?NFpCcnl3WHdtOXB3enJzTVpiQmdnQXRKd0FZTHY3VG0vSHY4cTNSRFBRbG5X?=
 =?utf-8?B?NkYvYmpRbzNNNE9iSGJMQmFpbG5INkwxaDJUeWZJL0ZPVkFFWi9hRXJYVkN5?=
 =?utf-8?B?d1JtdkFsUHBGWnIva0tBdHFLcWdDK0MxRDZ4cGQrRzFIN29NNTJKc2g4dU1K?=
 =?utf-8?B?VDNmdmZ6ZXV2RlRnN0FzWWgyb2VvRWFFbDA0WGtOM1FwWXF0SFpBSm80Z0E5?=
 =?utf-8?B?eXRudGZjNVBPODNrRDE5UkpLTHlBU3NaR2R0eVEzNmNIQ3dJQTBjRUkzQTVi?=
 =?utf-8?B?Uk5UaFR5NHpJTnVKazBXVGxmdDJwQVEwZ3dvUTE0QUxTbUk0R3g0V0RmamZy?=
 =?utf-8?B?K0FrYTJQeHNKUGFQc3JGalV5VkRja29OSS80ZGVDNTZKMW1YcGRrK25rVjdI?=
 =?utf-8?B?MUNvSnRXQ09FdDFnSHloaThWMDhLbFJ2aitzSkphZTcrWTQxWVBkRzNDclJG?=
 =?utf-8?B?RnB3V2Z4UEYva0IyMTFLdFpQc21VSG5QdHBZQ241Mk9WdzdCaC8yUks0dDhN?=
 =?utf-8?B?RjlPckl6bWt4bllaNVAyZmZVSlRhZmRMaWt1QUlPejdkTFVQbmRsOGx0bDln?=
 =?utf-8?B?UW1iODVCSzlRbHFaTkZmWnNraE03ZjRzdDIzQzhkWXVhek1iQVVXLy9adjNj?=
 =?utf-8?B?TzE2aW54dVhyRUZNTUkzU2MvU3loWnE0Z1Iyb05uRkV2TWZ5TnVQWXFvSk13?=
 =?utf-8?B?RHZwMURxdWZMODE5QkxCUVdtdGxINzhmd0Q3V2tGQ1hJS2lrZFp0YWpWMzNr?=
 =?utf-8?B?cmM1OXVaNmVPOWF1Wkw0Zys2SExCMUNybkZ2U2g2SEZaRExWL1NOYUM5dTN5?=
 =?utf-8?B?SlZsSjlIYmlTb2dVckRMKzYzMkMvM3ZnK2tGaXJDWENNVEU4aE9ZT3o3ZmZI?=
 =?utf-8?B?KzJnUk1PcmFQNSs0WFE3Y1RCT1l0dHp3aHBhcURZMWxCSXI5dy9lNjZBQWRY?=
 =?utf-8?B?QTloYlM1TkhTVFRGZWoyTWNJT3FtTjVHV0tzRVdGb2xrd1MzU1JLN3p6eStp?=
 =?utf-8?B?d1hzNUIvTHFyMXo0NlBUam1Mc1FwNWtTV05xL2tCY3pqYzZjRTRPWjVoNUx5?=
 =?utf-8?B?UjhkelY0dEhVV3hmTzI3Z1FjaW5ZLzFEdCtKaU16T1NpRkZBbHdsdE1XVjc1?=
 =?utf-8?B?TzEzSWFhNTJ3clF4WHhyS0JOSlpFeVZoTUJkb1hnVFpNa3NKanB3RXZMTlY5?=
 =?utf-8?B?a2VidzBXenFSRnpqNkR0cHNXNzRvYmFObWpRSGJQUjIwQ3ZEUWx1Qlo3Rzh0?=
 =?utf-8?B?VjAvdFZnQXlya1VrcU00Qm5sdFdHc2xJcjhvTHM2SUcxcVhxdHBRcVlEa3VD?=
 =?utf-8?B?eE16Q1hrZnlmOCttOTVoTDdvUVdld1BoK1FRU0kwazNUSTVPS2RCOTRhRTln?=
 =?utf-8?B?ZU5GUGxqTmxJQllDZHdNT3VhSFN0cmdxWlhwa1hqUVRGQ0toaFVGTmRNTHlR?=
 =?utf-8?B?T01ZYlllcldlUlRIRmV6bURIQ0ZLMmtXZEtrYUZsdU4zK0Y0ZEw5SXRQVkht?=
 =?utf-8?B?a28zeVlJTlBVcWlRU25IWTF5aW9nSzRLNExra1cwNHI2RHZ6WjNEMWYxcU1i?=
 =?utf-8?B?KzMvOUxUMmZVb2I1eW1EWDFCWVB0TkJZSUhmZUpHaTZIUVUvZDVHQjV3dDlK?=
 =?utf-8?B?UkRJbXM4R1I4KzRaa2NjS1NLdkt0VEhIZ1F4a2NtMVU2enZ1TkVwTzlJbmJL?=
 =?utf-8?B?SWxNSHg2L3NSWUkzM1BQZlQ0T0VGL0w2citGV0dkTWg0ZHk0dEdKMnhmRkk1?=
 =?utf-8?Q?A76NOlZam9qzrYhc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67671BD8CEAF504C9F8B36D3939CDF13@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ac4e29-f9a5-4974-6568-08da542bc5d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 08:47:00.5210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/jCfv2buW+J80r5W7B8mIzpld9wxKGFSUr4fXMwgS4KKPLJofLUMrvjeAOTacPD62mF9s5FfWlO6UcwpWBY/yg8EKlDHo2FxwjXjK4pDQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5450

T24gMjIvMDYvMjAyMiAwOTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIxLjA2LjIwMjIg
MTU6NDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBMYXN0IHdlZWsgd2UgaGFkIGEgYml0
IG9mIGFuIGVtZXJnZW5jeSB3aGVuIGEgd2ViIGNyYXdsZXIgc3RhcnRlZA0KPj4gaW5kZXhpbmcg
YWxsIG91ciBtZXJjdXJpYWwgcmVwb3NpdG9yaWVzIG9uIHhlbmJpdHMsIGFzIGNhdXNlZCB0aGUg
bG9hZA0KPj4gb24geGVuYml0cyB0byBnbyBiZXlvbmQgd2hhdCBpdCBjYW4gaGFuZGxlLg0KPj4N
Cj4+IEFzIGEgdGVtcG9yYXJ5IHNvbHV0aW9uIHdlIGRlY2lkZWQgdG8gcmVtb3ZlIGFjY2VzcyB0
byBtZXJjdXJpYWwNCj4+IHJlcG9zaXRvcmllcywgYnV0IHRoZSBjb250ZW50cyB0aGVyZSBhcmUg
QUZBSUsgb25seSBmb3IgaGlzdG9yaWNhbA0KPj4gcmVwb3NpdG9yaWVzLCBzbyB3ZSBtaWdodCBj
b25zaWRlciBjb21wbGV0ZWx5IHJlbW92aW5nIGFjY2VzcyB0bw0KPj4gbWVyY3VyaWFsIHJlcG9z
aXRvcmllcy4gIFRoaXMgd291bGQgaG93ZXZlciByZXF1aXJlIG1pZ3JhdGluZyBhbnkNCj4+IHJl
cG9zaXRvcnkgd2UgY2FyZSBhYm91dCB0byBnaXQuDQo+Pg0KPj4gSSB3b3VsZCBsaWtlIGFuIG9w
aW5pb24gZnJvbSBjb21taXR0ZXJzIGFzIHdlbGwgYXMgdGhlIGJyb2FkIGNvbW11bml0eQ0KPj4g
d2hldGhlciBzaHV0dGluZyBkb3duIG1lcmN1cmlhbCByZXBvc2l0b3JpZXMgYW5kIG1pZ3JhdGlu
ZyB3aGF0ZXZlciB3ZQ0KPj4gY2FyZSBhYm91dCBpcyBhcHByb3ByaWF0ZS4gIE90aGVyd2lzZSB3
ZSB3aWxsIG5lZWQgdG8gaW1wbGVtZW50IHNvbWUNCj4+IHRocm90dGxpbmcgdG8gbWVyY3VyaWFs
IGFjY2Vzc2VzIGluIG9yZGVyIHRvIGF2b2lkIG92ZXJsb2FkaW5nDQo+PiB4ZW5iaXRzLg0KPiBX
aGlsZSBJIHdvdWxkbid0IHN0cmljdGx5IG1pbmQgaXRzIHNodXR0aW5nIG9mZiBvciB0aGUgZGlz
YWJsaW5nIG9mDQo+IGhnd2ViIGFzIHdhcyBzdWdnZXN0ZWQgaW4gYSByZXBseSwgZWl0aGVyIHdv
dWxkIG1lYW4gdG8gbWUgcGVyc29uYWxseQ0KPiB0aGF0IGl0IHdvdWxkbid0IGJlIGVhc3kgZW5v
dWdoIGFueW1vcmUgdG8gd2FycmFudCB0cnlpbmcgdG8gaHVudA0KPiBkb3duIHRoZSBvcmlnaW4g
b2YgY2VydGFpbiBMaW51eCBzaWRlIGFzcGVjdHMgaW4gdGhlIDIuNi4xOC14ZW4gdHJlZS4NCj4g
QWRtaXR0ZWRseSBtZSBkb2luZyBzbyBoYXMgYmVjb21lIGluY3JlYXNpbmdseSByYXJlIG92ZXIg
dGltZSAuLi4NCg0KV2UgY291bGQgY29udmVydCB0aGF0IGludG8gYSBnaXQgcmVwbyAocHJvYmFi
bHkgYSBicmFuY2ggb24gYW4gZXhpc3RpbmcNCkxpbnV4LmdpdCB0byBzYXZlIG1vc3Qgb2YgdGhl
IGNvbnZlcnNpb24gd29yaykgYW5kIG1ha2UgaXQgYXZhaWxhYmxlIHZpYQ0KZ2l0d2ViIGlmIGl0
J3Mgc3RpbGwgdXNlZnVsPw0KDQp+QW5kcmV3DQo=

