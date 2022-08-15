Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F65935E1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 20:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387765.624148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNf9Q-0003YP-FO; Mon, 15 Aug 2022 18:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387765.624148; Mon, 15 Aug 2022 18:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNf9Q-0003Vy-C6; Mon, 15 Aug 2022 18:49:24 +0000
Received: by outflank-mailman (input) for mailman id 387765;
 Mon, 15 Aug 2022 18:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+x6=YT=citrix.com=prvs=219f4dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oNf9O-0003Vs-Uj
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 18:49:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7f3d004-1cca-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 20:49:20 +0200 (CEST)
Received: from mail-dm3nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2022 14:49:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5085.namprd03.prod.outlook.com (2603:10b6:208:1ab::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 18:49:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 18:49:08 +0000
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
X-Inumbo-ID: f7f3d004-1cca-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660589360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dF6/qURbhmt6Z+WJD25SEozLwoud50IxPMT5z6t9o0s=;
  b=cnGqCtUx+Ou5RmP/7e9O8VdH9wkd3t4hMpzH8yp3RA13q7a5uU0yHSge
   Srt9Zcl1aC3PVNOdY4pDSvXYdXRGVqMQhgbwqU1EVnr2vqgy3fYZWNFbL
   JmcFZtV3vxo9zwYaXTiOYvCAnSjlwgrCeRKdgEn3vXgdJVDDE+Sk284Yz
   c=;
X-IronPort-RemoteIP: 104.47.56.48
X-IronPort-MID: 77371797
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8vUAjKPsD3m9Oa7vrR1xlsFynXyQoLVcMsEvi/4bfWQNrUolgTwPn
 GYdWGiCM/vfZTGkeI8iPtjgo01Q6J+GnIA2HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/ve8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPd6qlFDkJrGbdB4+91ID0Vr
 c4TIQokO0Xra+KemNpXS8FKr+F7dozHGdhavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr2wCWvG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFa4fAkGXUrRpAgMfowQbDB7lKHoa91fA7qnCymFc/EicvAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFabujYMVtwWFPc1gCmtx6zO8kCmD24LZjdbbZots8pebTct0
 1qUmdL1FHpqubucRn+H3qeZqyuoPioYJnNEYjULJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7sCIQ/6Cy/FSCjzf3oJHMFlQx/l+PAjLj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:U0Pt5a+GER81T4mCW+9uk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+/3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqj9T7krJ9R7GkmjJl+miR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.93,239,1654574400"; 
   d="scan'208";a="77371797"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqZ1yCl9TyXDtI1KnedHvioFGAE8VdKINEG16Y2OHzoWkfRtRa6/qdq5x5mG7We/qBeOI6evrfaLuZqH997xkKtn9TFw2aBPG++qaQsItnTgx8twamVd6OCJEJ1Q9OqNCmk/L6DP+UR7VTCVpP/tD6M/LcjpekCQLjqV9b49L++JZE0P7ADVLQlWJA1uKlE5OGOdWUMFE+Re7WtfQJ/0hkGU+JPPLDdKFZrUb6FrknPaVFi0Va4vzTazFMgc9RV+EoXw3dHomzq7toLPvNFjaSo62O37N49apFtrmReNxSJth3EAi/thhG0FIya96PLOEQYJW2vX0mzdMRbyWzZT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF6/qURbhmt6Z+WJD25SEozLwoud50IxPMT5z6t9o0s=;
 b=OUYbqgz0bET2KXtIUXKKBdDa5OwScDmAKy+amqHMRxTwYY8TWaUx1GaK4Lb5AM92aNndXsk0sArNwlL7lgJ6KXwal248rmVbFTJmnPvQGQfe6B2Nl++/FkBRwCQPaRAnHQqE/KjgXAagbFYlcFqANcEPEHTK+SMHezGa3JHvBWCsYmUeiV2Xb+fzl1OXuZw7lFnOckMBs309efiJKG1tvAJgivxjsVY8Df/GwazTIeudtdFOIQ7fMkNZ0eNeOnlSu/4osa17eHdg2cg9FNoH6iUd21tjf0GtFVbz69TMPQXPimXGrYBZb4OkWwYZ6yQcSip0dqQaKvB++iU7jWyvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6/qURbhmt6Z+WJD25SEozLwoud50IxPMT5z6t9o0s=;
 b=w7byQkZde0Tk6oL6MRpS2wFkoSLC5/SIX7leIJLsKmkLNpc+zIHw96CJrkqJZEGaqR8wf14wztoydkYET/Bru1iru2O9OjplkqWX/+8KEra7iT9kr0teOjdBNBWQbklKFWd/2OHiTtRJeE8fRlTLDZ8PQ2rcA5pn/Xg+Kb4Bxuw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Topic: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Index: AQHYagMx4yaKKSDaVEqrb6mC4jE4eK2wJomAgAADuACAABCxAIAAoG2A
Date: Mon, 15 Aug 2022 18:49:08 +0000
Message-ID: <07176f1c-2759-ddb0-1d59-38b4504d0ed4@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
 <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
 <3a975638-9675-9a95-fead-91120edefee1@suse.com>
In-Reply-To: <3a975638-9675-9a95-fead-91120edefee1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c79e6202-4a9c-458d-a8b6-08da7eeed5ef
x-ms-traffictypediagnostic: MN2PR03MB5085:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2C/u1yb7KA1MVnnZAntSI/16Fb3hF70j7T+AmNa77eiPjRi9bpekJq+6PfyqZoj0J/x9+hYqVHm0VwGcIvBUa1Z6IUIHWOSaS4fBzF6Vf2J05pec4tIroVzbSFGyxwD+wvQ7kKoL7XjEitm/Ow9G09SJEoe54dagC0u/wSH9JfJJAGs5n/PFn05jcB5NU72muWi1MRCbL1UFserpdCh/ItgxRv7NS7Tv/i/P2IXrTMpQBjKSdjfbl51ay/xL8fFsVLLL2tgc/wQ/toVBF3J/1+cFmuPaZ044vAez0Q955PpdAOjvTwf0IWJIrJ0/G1iCX8PWDwtOLqFY1vl+IcV3dDKqTpFyuFivjyjH2mBU/k1F19RhYUI3vU/lDBxLlcAHUbnmyWPk/dEAwgNnADgKmvgX6mDqIYoSlf5tBoRU1g3X+J7oV75Ytid7p5CyjhvXp825sd14Z2bTFEbkA5uCRH+ginYx3zf+Bng6RPoYguzXi7KUOGDhaAHznUlh4ZBFAMbtGdhD2Wal3lMvaUqnPQbgP8uJq90W3q3u1UPLFJvrAuh1KNGqHTy2ZkBTe+Km4Lr7UY+OQ0uE9pY/xyR51sgktZBzVAW/C2FvX6RPo+Rzi6gX8fHnUau1VX6g9t8o5EVw2oxjfaL7ejMYw1smU5Y2SQxqN4YRI0oyBo4ZYT0L/Gd3F942TUAMYRttNzSZ6KHxLPeI++cLq3gJF6U9roP9TGQC9jaPZJ1UBop3Ygu/5sZIftJDhQbiRGeNnpPPvppKrDp79UYD8fYvjN9s/waqsj/snKLTjmg1dSj4c/Ht3pOK6fRwE9CiUycteA5M2ZUaxYLCQ9NAaWpP1Id/UcFjzkz6CvVwp2NhvJ2GpFL54D+mo6crqxiNLBFNDEOE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(478600001)(66556008)(316002)(6916009)(107886003)(4326008)(83380400001)(64756008)(8676002)(38100700002)(36756003)(54906003)(66946007)(76116006)(91956017)(6486002)(66446008)(31686004)(4744005)(31696002)(26005)(86362001)(2906002)(8936002)(71200400001)(6512007)(6506007)(2616005)(53546011)(41300700001)(186003)(82960400001)(38070700005)(5660300002)(66476007)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2s0MFduazZ3RkZLQ2pIZTBaMTIwRUVmS1o1c2xyV041LzRqSDNTYmp3azYv?=
 =?utf-8?B?eXFHQS9wT2VYSVdQMkErVGY3aHY1TExaekd4WlZEc1pGMm1HY2lJUTh5Y2lS?=
 =?utf-8?B?UHY3Y29rRUVHWHpwS1pMTGZHWDF3eTNVQmdXV1BWOTFnVEF4cHM2Y2kxcVRk?=
 =?utf-8?B?MDZaeE5yMDNoQVZxSW5jVThVWVBPU1BRUmFOQkozTXlGY2lTU0hqUjcxcjdi?=
 =?utf-8?B?ZVlLVTFOdTVZWk9xc0tHRllwaStlejNPVEpmRFVLc0RJeWROME9Bakw4ZEY1?=
 =?utf-8?B?RHdBQ3NOQWJXbEhVSTFIUk9KMXJGTjBwSTZpZWJkYXNkeXdtV2xISTQ0dlZ0?=
 =?utf-8?B?VTNJOUVwWlM0QzZuQXU2ZkJZb21wdFNCbnRLMFBwS0UvVHc3WTBSSElrU2xS?=
 =?utf-8?B?V3NNS3ltTmZBcklsM0Ntd2trSkRFOHBTdmdOQmZLS0p0eWtGYUhwVFRha1Zn?=
 =?utf-8?B?bEN6S0FjbEYyRklZaGJQUVQvRVVvR21aT3BOZENmUXZ1L0VQait3WnRyWGU0?=
 =?utf-8?B?NjQ1N0k2N2dCV1hjb3BjOElFWi9jSVNkbEJqVVVzRVI3OTJzOGRRRnNtbWxq?=
 =?utf-8?B?UkFYNkR6bkRUcWJWa1RIWnZWRE1wZHNpSktZZDVuLzB2YlhtSmlQT3VUVzRW?=
 =?utf-8?B?d2ZMN3BSclh5UE4wWDczN3JnR2dOTE9JTXg4NmEwL3VaNllJcm1XQ0g4blpE?=
 =?utf-8?B?RSt1U0xCWSs1RGEzb2RUMFkvNzhsL0IzVi9WVzRSZEJmaTRhRGRkSEJSenpr?=
 =?utf-8?B?bXByL01qcEloUlg1dUpUbXE5V2h5QnVzdHNYdk1oYUUvaUZ3YitQVUtZT2NY?=
 =?utf-8?B?Wm9pWldXSEJWQ2NqTjlDdVpKUlMrMFlVWFIyWXovN205ckxOdzMra2tlMzdU?=
 =?utf-8?B?eGQwMXdDSUNad0cwcFVFbWRKa1l1d29qMlZpWkVGZjcwcEhEZkxPQVE1SDB5?=
 =?utf-8?B?bGJxeDh3UlRWUzR2bS94OE1obGhHVUFEQlFRT1BtQllJcDdacEVnMEp5QzNl?=
 =?utf-8?B?UXRwbElEaHNwcFROb29IdkJvaklQNkF2ODJ4ZDlVZjQ2QXVRanhhRHBvdXVy?=
 =?utf-8?B?MWpVRkdYQmJ3b0ZZSEd4TDZFdDVHUDNJL0ZCZDB4SDRGYkt2T0NQMTJiRUtC?=
 =?utf-8?B?RExPUE80c2VtNXlCRHlDbnowTjhSQi9yNG4wZElSdDZWRUZabDlrb2Y2QTkw?=
 =?utf-8?B?VDRMYzNmV2pOTVdNazhQK2FPK05WdlgvZ3daaG9STnp1SytDUEdMdUE1ZE5a?=
 =?utf-8?B?MllGVGd4OVpvTjJPYmNUVkJZN0ZPVHlrSjRiU1FaSStrakVDbHJxaStxeENj?=
 =?utf-8?B?a1hPUlhrZ1RHM2E0ZkRTd2NoRi9vV28yQnhFWmhTQWRUeEdSRTRTekg2cU10?=
 =?utf-8?B?RjRmdHdWM2xuUENkbElJZmxZTHlzWGNabVMyaVRPR2pYL09uUkVxWjlqT2ZT?=
 =?utf-8?B?TnRkV1RsZmE0K1Q2UHlqeVp0Ykp3UE9NYVBFZUUyQVBXcFFVNHRtR21IS0hI?=
 =?utf-8?B?UlhieUNGL0xOd1V0VWNtbkU3a1BxUDJ3eURicmFWTThOUzZHaGdwTy9zSW1s?=
 =?utf-8?B?b1ZZV25yaEFmblkxcndwT1U3RndabU41eWNjNGs0ek8ra2xPTnBDeXlBblhB?=
 =?utf-8?B?UW9kMk1FMGVIMS9wNFBLQmNFR3lFYk53amxWenV1bitQVkJsNXI4cXJENGFI?=
 =?utf-8?B?NWd2SGIwajlDS3ZVMTZPY0xucXl1VW8wN3dRYTlmcHB0MUxhS0xJVExKL3NL?=
 =?utf-8?B?cnhOU3RaSnpocjZpWTZrSTJ1Wnp3SXpsNmVrcHM4YTI4Vm1xbjduUGRVdWlO?=
 =?utf-8?B?NG9TcTdMbW01QnQvK3UvRlhVdVovUE9tMmZvbkhoc1ByNnFtRGRPMDVmMy8z?=
 =?utf-8?B?UXlDWWRCZlNJbk85WW4wSEtJUDJKek1vMWM3VnQrcmdUTEpWVnVyK1JyMFdl?=
 =?utf-8?B?S01NUW5jS1EyTXYrQncxeDBzQlF2T2kwTGJqNFVERVZwOHY0alNZNlhwM0xw?=
 =?utf-8?B?ci8zUVcxOXlxNldJdHN5MUNuK2U5cFhVNVZ5VENlVDlRcXhhdmVuSHdUOC9z?=
 =?utf-8?B?QXgzRHdQUExOd2k4NDlJL2RPNThBNDR2RE1USFpBRE53VlMvOThsQXlISzJE?=
 =?utf-8?Q?YRPvkZ2DlUESX7Lw9yg8wELK+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE3356F1F3F99145BD94D021F3C97517@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?ZDFBVmNCNlVzcS9YRFR5MW5ZQlJ3Siszc3NhQi9iKy81Z29Ma0cvVWlYc1pQ?=
 =?utf-8?B?Q0daYVlmTjJTcCtuRW5vVjg1MWVORG00dWMxZ0FsSUZTeHJNcys5Sk0ycHpS?=
 =?utf-8?B?Q0NISmJFbW42V0tIVy9mNmYvVDNIV2NVQzRNY2JqME9ITlVYZWVzVGFZQnFI?=
 =?utf-8?B?QjZkUDUrbzRSclJ4VjgwZzNaVzlYbEI4NFNKc3RLcnVWN0RadnVJVmYxRUM2?=
 =?utf-8?B?LzhLdEpINkk5QkVCeUVJemx0MUw5WTRoMSt6VGtDeE85dEVnT1l3RStUS25O?=
 =?utf-8?B?VFVNSTRVZnUwK0UxWXBmLzFUcEhCUEhjWmZuTWp3WVNZNmNOTkVsYkFtb20z?=
 =?utf-8?B?dmNQakw5SDMwQ29mbWZkUjZxVGgrL1dMZC93MEg2UU4rNXluNlRoeXpjN1Fm?=
 =?utf-8?B?bmd3VjZqNnNuSytWV0l0RC9XaTNNYTRiKzNXb3FhdzI2MjNLOFFLTll3TUU2?=
 =?utf-8?B?QldReGl4N2wyczBYVjhzdWlSdEFZa1pmRjg4dmFYS3ovTHVtQWVHWmxJV1JN?=
 =?utf-8?B?NDAvMkhYdHRtYVZqd0MyaU5SODEyc3lwSjQ2WWxOZFVydzVQbXo1Y28vN01k?=
 =?utf-8?B?U2Uxb2FEdGdxVDdKcDg0dGVBV2V2NG5kdWdLMzBBcVZTazRhME9hY1VxWDB1?=
 =?utf-8?B?OHlaOWZ2cFpVV1RtVklkcW9ZUzcxL01pSytSSlpQb3hHdE55cWxQRlY3NU9K?=
 =?utf-8?B?NjFwZTRBQldDZGQvQnh0Z3pWMWNsVHBQM3E4TGxiZ21aeU5xRWo5RG8weDF1?=
 =?utf-8?B?OWdvbnM1QnlxNWFYZUNzamtOeU9kV2VyMEJ3YlRaSHhGYWwwSjlwWmgwaHJq?=
 =?utf-8?B?UkVDZ0dsc1pwWTM4cStZOFVERVNFNWZsVXdJYUw4Nk9yL1VKM0puV2ptaDdB?=
 =?utf-8?B?ZUFkVTNpWVl5WmFqSWZ6d3F6Y3RZR1EvSEM3VDNoV0hnT2l6SVNIcTFReklG?=
 =?utf-8?B?aThudDZSVWZJU0YzT1Q5SHhsQmg0WURqejBhZFVWRi9VU01oblNRN09UdWZV?=
 =?utf-8?B?NmdpcnM0WEI3VENMVmJaUUdwQUdMWTBjV2REaXZ1N1Z0SU1QcFR1a0cvaTd4?=
 =?utf-8?B?ZVZ3azl6cURKeC9VbWt4ZjV2ckZQbUJFRlhEbHZMcWx2TjhoakVzSG5aNENI?=
 =?utf-8?B?NnZZVW5lalpvWGppa3lCZXMxbjhWdjNuL2NwQTJBcnhtSmVQc3h0N2xwVzVq?=
 =?utf-8?B?c0d0NFdzNVplUkRFUlVBOWpIeDVaUW4rZ0dSbHE5SlQrVkZVcDhPSndDMi80?=
 =?utf-8?Q?XdldSaPCSc2yddp?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79e6202-4a9c-458d-a8b6-08da7eeed5ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 18:49:08.2603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 331Y6sOFBsJ2j7Lc2jRselFf1r6HPgonmb8JVXoyouCK7zkoKpcrjdrX7HpqY7UYCjS8clMTuvH60XUkR6GXUEBKBVtT+7OWUvaVNxK5L34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5085

T24gMTUvMDgvMjAyMiAxMDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjA4LjIwMjIg
MTA6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNS8wOC8yMDIyIDA5OjAxLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNS4yMDIyIDE3OjMxLCBSb2dlciBQYXUgTW9ubmUg
d3JvdGU6DQo+Pj4+IFJvZ2VyIFBhdSBNb25uZSAoMyk6DQo+Pj4+ICAgYW1kL21zcjogaW1wbGVt
ZW50IFZJUlRfU1BFQ19DVFJMIGZvciBIVk0gZ3Vlc3RzIG9uIHRvcCBvZiBTUEVDX0NUUkwNCj4+
Pj4gICBhbWQvbXNyOiBhbGxvdyBwYXNzdGhyb3VnaCBvZiBWSVJUX1NQRUNfQ1RSTCBmb3IgSFZN
IGd1ZXN0cw0KPj4+PiAgIGFtZC9tc3I6IGltcGxlbWVudCBWSVJUX1NQRUNfQ1RSTCBmb3IgSFZN
IGd1ZXN0cyB1c2luZyBsZWdhY3kgU1NCRA0KPj4+IEkgY2FtZSB0byByZWFsaXplIHRoYXQgSSBo
YWQgYW5ub3VuY2VkIHRoYXQgSSB3b3VsZCBjb21taXQgdGhpcyBhYm91dCBhDQo+Pj4gbW9udGgg
YWdvLiBJJ3ZlIGRvbmUgc28gbm93LCBidXQgdGhlcmUgd2FzIHF1aXRlIGEgYml0IG9mIHJlLWJh
c2luZw0KPj4+IG5lY2Vzc2FyeSwgdG8gYSBmYWlyIGRlZ3JlZSBiZWNhdXNlIG9mIHRoaXMgZGVs
YXkgdGhhdCBJIGRpZCBpbnRyb2R1Y2UNCj4+PiBieSBvdmVyc2lnaHQuIEkgaG9wZSBJIGRpZG4n
dCBzY3JldyB1cCBhbnl3aGVyZS4NCj4+IFJldmVydCB0aGVtLCBvciBJIHdpbGwuDQo+IFRoZXJl
IGlzIG5vIGJhc2lzIGZvciByZXZlcnRpbmcNCg0KWW91IGhhdmUgZmFsc2lmaWVkIHRhZ3MgZnJv
bSBtZSwgd2hpY2ggaXMgYSBjb25zZXF1ZW5jZSBvZiB0aGUgc2VyaWVzDQpub3QgaGF2aW5nIGJl
ZW4gcmV2aWV3ZWQgY29ycmVjdGx5Lg0KDQp+QW5kcmV3DQo=

