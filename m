Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427FB637B26
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 15:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447959.704640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyCyt-0007Ot-Ja; Thu, 24 Nov 2022 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447959.704640; Thu, 24 Nov 2022 14:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyCyt-0007M0-FL; Thu, 24 Nov 2022 14:13:35 +0000
Received: by outflank-mailman (input) for mailman id 447959;
 Thu, 24 Nov 2022 14:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYuI=3Y=citrix.com=prvs=3202d56cf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oyCys-0007Lu-55
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 14:13:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c0a3e01-6c02-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 15:13:32 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 09:13:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5796.namprd03.prod.outlook.com (2603:10b6:303:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 14:13:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 14:13:23 +0000
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
X-Inumbo-ID: 2c0a3e01-6c02-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669299212;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=q9TIv+jBGRgt6msmGG+uhMUtu7e+mTwRPLnsSDmlyO0=;
  b=h/1UPQPxhpY4TM4cUhNw8opVTShGG+8aukrRoO1KljVXXcrs2Y76IDyP
   H7CvKk8/+NrD3ZERA75CnNEwPBjkliLtTAPGFismiLF29QG1xE4FMmTWR
   YbSiPqrargkxiv0MxKsNzp982799lqa0/X36E6qXG6OQlk5rHMfOfbIEE
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 85071288
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E8T8w68K6MRlibfya3JGDrUDnH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2pODDjQPv+IMGDzKo1xbYS+/RgHucfXnIJmG1Q6+Ho8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklwq
 uwhcRYSbymohtqs0Z2JCflMo+cKeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN9KS+Tipq4CbFu7+zQjNyEPRVWAi/ykpG2eXNFiK
 Fcyw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMM/WzECz
 FKCmNLtQzt1v9WopWm1876VqXa4P3gTJGpbPCscF1Jbsp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:K23XRahaFAdC6XGVbmNFkW5OAnBQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl/CmQXiHlltb2Q3LD6FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85071288"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhVUspRE4C3Fy2r1O4s3rI1mmDh6l1S1nolq7Wa6T0T1QRWptfhJdGTh2RckftYyJkENJL7WhDpqfWWX0D7cZ+HHAp6JJzzIF87JdTSwvk5cQzVAytnIRA7Djmsa68i/4PcYNu4XOykpLHUqe+Uaco6fTb80e05hid9aTwkmQCFcKMmpIeqbLT1p2jsfJV9+3VmkiXkr/hx6lMU2R5WoS/0faB2DMyYD2IyQSSg3JzuvbHVq8m6wT61PEUE38h+j5xI3sVGjpw27LPbLKDqfcQLgPKVAfrKbc71SJAjyd5ZiK5jxLhN03FGw+c/M1aecpy9012gf/volV4zrkCoI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9TIv+jBGRgt6msmGG+uhMUtu7e+mTwRPLnsSDmlyO0=;
 b=C/kHCjcrbJPEEzkCNpKpmA8L8JZKHXXLzobPG1J92dWtKieIEHulTR8WbLgWtFnzZv6KlVNNLe/sV7UeADJ/T6AxCbxaxzXN53tD+CaLcDwkKycPvf7rshFq7duF4PcJPxNG47Ndwz1NZ1yduuVf1b4UpM0CBcv+8zTsBQlYVpcroclS3rVwRH63d9DQTGzqjQnbDS63mdOArGV1IKfjcV83APSxinp84Z1GB8nJ/iDFE8wXm5FODSVIzWVQhgJTX8MUZ/NLvH9XKAxM9xG3ok6EgHvaCvRKa4DFK6dPBF96oHmb6paqeA/8lnuvNtfWSgs7HpT9tS50LmUb+G0R5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9TIv+jBGRgt6msmGG+uhMUtu7e+mTwRPLnsSDmlyO0=;
 b=cFGfa4OThK2PrjNas/jfvYi9DMT6VIP3jztLaMdgT3sWdyU4lVr4QwWxVFj8HTKxj2huNNiGjcv12UQ8toGAIlCX40HBkhmC52XLiDwSvC4vGz0CMFrasZ7x0ygI/MDrW7hN2pCUpJHSVAp3MOaQ62uWlruZbj0UHuLGINW4WNY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Topic: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Index: AQHY/4p9GINVmjprlEGx5iAuzyYE1a5NyDSAgABOFgCAAAXHgIAAAqyA
Date: Thu, 24 Nov 2022 14:13:23 +0000
Message-ID: <d40fb83d-309e-ed4d-8ee3-443e472bcdcf@citrix.com>
References: <20221123222517.12140-1-andrew.cooper3@citrix.com>
 <D28C9584-F900-479E-AD23-64B8CEB879B2@citrix.com>
 <a49b5770-fc6f-0044-8e03-7162996257bd@citrix.com>
 <B682A627-4DD1-4D4E-8DBE-4503B53DFC9C@citrix.com>
In-Reply-To: <B682A627-4DD1-4D4E-8DBE-4503B53DFC9C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5796:EE_
x-ms-office365-filtering-correlation-id: be514375-36d4-4a26-6631-08dace260c6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 79djMSfgbY+9M1edXp2akG1cp9fhoCguLzMHIJaTXhVX1TfqBRJ5Z58YdSMfD9BYnPa+H73u94gkBHUKaTKMilz1xEaWOLT9fAircpgwKqXviRCHFcUbs8IzdU1UN0DRGufRNlBSfUjcBK4FslitiYqqOdkO8VUOU7Ln+mR7hfGCSCHyf3H3GMC7hlPBFtvyCuSiDUYBFvh3bWX9fsaMALn5t3tQWAQM2E0n1J/AlqBD6bWViTnbssE87+/5X/+tjp/b+IqGatx4gliSf9Tpuk32mLuUNVf2w0pxz7Chc4UM1rVUJfezbCgCX6dQ8aPUxbAYn36IiAquexTvZgivIkL5PvH3qvuT7y3iDdAzcnVsMFh1HE1hTJPpFfCuv9dg9smThQg70ebuOK1xOKGQFnRY5eBy1PAOM5FENcrK1GmkpQoYU2i0rhR/rrqug/4DCbcYIfLGu5aX4GDkaquxZuqvmekdNiadgRuvr7GEAFM+8GsGyfw2jPVHkw3AefWtWmi6X/2Ga/ihDmgjq8WTgUQGjXNZ3Vi3MFnkdo4tsj/EMV+sZ0vLZtDu9NhxRyZud/N2uBh9+0A7DLh8q8fBCMmDSzPDVM7EcFrqdbZACA/IBKaF7l7gGYtX1p0Ywfsp8G4lDxKqNtF7w6r51LTN1TaYNxvE82wdm5Diyzs/HxNj5cxfmxPckDEB176WXYiqFKViQFs5equJij5bRbMk0N7WF7y7Tdwpob4DBoGc5BM//QClzCPNP+qI0NqFINnAX50TRiDC1KloO5gY4eKBfISWg7LGBr7OaRnFKFIELno=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(36756003)(31686004)(86362001)(26005)(31696002)(38070700005)(8676002)(71200400001)(66946007)(64756008)(66556008)(4326008)(66446008)(66476007)(6636002)(76116006)(91956017)(38100700002)(122000001)(82960400001)(478600001)(6506007)(83380400001)(107886003)(2616005)(53546011)(6512007)(2906002)(6862004)(41300700001)(37006003)(54906003)(316002)(5660300002)(186003)(6486002)(8936002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXhjdjc1MUdUNko0T1lHMllHSGh1dzlxZmcwYjRXSFQrT0JXMFF2Z3ZUL1dp?=
 =?utf-8?B?d1lRcGdkNnNEekRkSjJpZlVLdHNyK3BsWmgzdEFpdGJ3d081MExvSXN2THZx?=
 =?utf-8?B?VDRyRkQ0UXZwWVI3TTRWN2lpMnRua2oyZ0lHYWRMRC9DaG9XMS9xZ0NsTXFW?=
 =?utf-8?B?SG5rOUZ1ai9JUGlEK1JGMDFGQUFxKzg2bkhYR1RHZnZacEJodmd2Q1dIckpT?=
 =?utf-8?B?WVZLL1hDMTh4SVdSeU80MG91bDk2dG5Rb29MOEpvYzh6OUt6aGxKUitZQ2Mr?=
 =?utf-8?B?WStIaFNLa3llblNUektpMmlyVVJSWGpHd011OWNmNlZ5blR3SEM3WG8vNW5j?=
 =?utf-8?B?QkphR3VoOUZtVEFUMmdURXZlaXhRZitKQU1Mc0VOODdhdTgrQTEwSEFqUDlx?=
 =?utf-8?B?V0kzSE9uaFV2SWoyQ3Q5UzBsVnAxS0NJRHZrZUcwTUdpSUVMc2hWY2NWUkJ0?=
 =?utf-8?B?TjRZWm1QVVVJdHc3ZXBWeVpaRXBrNWdEVTNIanFSMFJoMlBKSVBNVUF1aU9B?=
 =?utf-8?B?SFlxUURpNnRmS3hBR1BuNHFjVGpVODk3ellTRkRYbFUyY2t2RlVFNVlrK0Js?=
 =?utf-8?B?YjRiekFQK2VjOTNGOHBaTHlBbHQ2dTRaSjZ1S3NabEY1VEd6cjhtR3N3V29w?=
 =?utf-8?B?NFdFQVN5alZFMHRHRExvYUJwWEY1YWMvQ3RudjVZR3BOck5ERHp6NU1zenNk?=
 =?utf-8?B?UURMMERpbVBjQVNMZDJLdXJxZ3BiekQ5MTFZT3BrdEhNRkhhcjZ4RUxmelhu?=
 =?utf-8?B?SERhemZ2bHlvRmdBRXRrdmluR1g0ZFFRNzFSMFFHbUprUExvK3RPTS9xNFV5?=
 =?utf-8?B?VXhPY2xoUWhWMitNZklLV0hoWDBrZWJFOWgzUy9EeTNWZ2tLQW1iU3c5SHZI?=
 =?utf-8?B?OU9FdXhDVlpRUnh2OHBWM2trUndMbmhEZzh0SnRnRStYblB0elVDcG9pZnVq?=
 =?utf-8?B?eEZOZmdmWlhkRjNNT3pqK2NpTi9PMXBvd2ltRmdRSUtZT2hlNnhOL2NaUytU?=
 =?utf-8?B?WW9jTlptN3k2V0hTOEx4M3dsL2pOR1gwVmFHOXg1eFZzRXRnMkt6b0Zpc2Jo?=
 =?utf-8?B?a1NqN0tFSUJ0THR2M0h3MC84Q2RBU0lLWnJrckdrTWZEazZHSjZOMElpdU82?=
 =?utf-8?B?ZnBRVnZROVllZ1VXZ2dHU1BjU0M5dkxsWVN4ZVZtR3I2Ky82bko5UUlla2dy?=
 =?utf-8?B?TmFDbWM1MnY3MmV6VENRdFlFeUhIZDhRTERpVDQrZEFpOXg2WXpPUHNFNHhW?=
 =?utf-8?B?MFJjYUU0SndORHh2b05JbG52ZjJHVFFVVDRaSHZEWFUwaWJKRUkyaTY3THph?=
 =?utf-8?B?OXBJcTRweUxOSTRhMXBMRzc0Zlhya2hmU0JvOU1uNDUyUlNacUZ6eVgrVmsy?=
 =?utf-8?B?ZWlZa3hBeGx0cGl2R3dwU3dkRHcrbHJTNDhtTXVLOEc1ZEJVcVhvYy9FMTRl?=
 =?utf-8?B?VG0xakNZVlFZTm9qWk1yaTZyOGNKTmdKYk5iMFd5dmQzQ1V6ZGxna09OR2di?=
 =?utf-8?B?dHdybkVEM1pVWXpVZlhaL2JZQlNnUXNOSk1PTnMybWxtMlJoejJUOEQ2cTB5?=
 =?utf-8?B?Q3B5dlM4eUU2S1Bxb09iMW1FU3p3bWt0a2dWZkttUHB5MDdabENBU0xzaG13?=
 =?utf-8?B?SVZsa1ZqaU5za1ozSjVqdUR1d3R6WkQ4WXl3ay9CTjNKenlKbUVkNS9JbmYx?=
 =?utf-8?B?elJJWTQzOFEvUDIwV1RhNUF3WVVHcmlnSWdQN3lZWGNUbGhXWUNRWXh2Y0hN?=
 =?utf-8?B?Q1VneFNvZTVRYi85TVczVmlaVkN3elVWTzQ3ZHNtSHExYTdEMDNZL2c3NVYv?=
 =?utf-8?B?clNOR21YV1RjTURWY3BLenBNNlpJUE5Ba1RtcWJHQjcxL1B2UUpGVERaYjJE?=
 =?utf-8?B?czZENGlabUJ1dTVieDFBT1gxeHlwQnMxdEtESkZIcndnZ1pXOGxKWTQrSGZE?=
 =?utf-8?B?YWI5ME1MeVQ1TmFNQlZqNCtCaW1BUGlreUtXUFI5aVVzQm1kZU0rVnIvQjZS?=
 =?utf-8?B?a0piK05TODN6UFNTSG40bFlpaXVyTGgzZVdkMGpmMVJOcWNTbldJTFFOVnQ4?=
 =?utf-8?B?SmNIaUdtcG40V0FLd1NYRWloemlPWFhIT1JuTHoxVUYwOFprelJRTnRQdW1z?=
 =?utf-8?Q?1bLjRF054jf+CZgvqhAz9QNE8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64927878DBF4F144BE99D009A6CE5CAB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nYhr3CNe271eL3am7aGnrV50EspZJ1KDW+i9S2VYWbb7d2mWG1Dd1RJ/cun0eU4uqesXgAbQM9UnvswYjOyXszrbWLfIt5PW8jamHt6nse5OTEhTR5Zbjuf9o7SC3fobyH6u6RRT0bJD0tdXsZNNnRK/GH5YbVMSUAtBLtId1dFLaqnU7OcGzJbQNmTsKONXg0T5qUxh2sAPxJdQ07dbcDh+4FqRsREd4MsHMtccw3rxtj/IvtGPsgZ/6cCFh6opA3H47C9CuYx+V1++7e6rIyZPmZdnJ0DA+JfoiDFyTSAJlXZp5tIJrTOw5CbFON012517ECY/+ugHY5TjT7S5NEe2yn7ytpzW2NFUPzGypn3vV2IcSUOBJNVFcy1W+JyT1QoMJKBSkw+BQBhiNkKcGXbpALhXKBdGedm122Ho9QhXLjzQlnc0SmURpNgTg7Ep2alFpE2fVc4glB6BO2yLBAfmyH2MiCRzQxED47o+slR2RisZKeb6IA6zeQ/iq8neAE7TT++HyubcyhYTt92AVaNXCwr/2RqypJT9wvyCyYor8F0DBUw88ujYcyeCP06+AItKLbUTVL6elaojK9jPZaDWLzXHDsPd5rBdRWHyEuLXtOMYCvTV3G6/r4uTvThIoD//P8GwXMHAsKfSt+OxwlR7RgapzjFxIn1UbPyUMbYy8CSuT/vd44CtB5eiDOEdZ4FKjYSepbVcwelsxewzPiwdgcvxvI2w9nNh9m0z6/znK1bZap1PeYOe1zvkMKFIAwVdh6sz/UB6QyVW+gwimSCblEEyCgJm6JddWZvKyJhx+9npPmTIZIgUk0ADI4x2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be514375-36d4-4a26-6631-08dace260c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 14:13:23.8412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpA6DetIiRCM5VcAXTptxSBou359UjfRoCZkAsdKajt3iDcjq9aRQRAPrCi5JXyL3OWOhO9Zq3l+9HWLSjqgQnfb8EGc58wepLePWk6RB/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5796

T24gMjQvMTEvMjAyMiAxNDowMywgRWR3aW4gVG9yb2sgd3JvdGU6DQo+DQo+PiBPbiAyNCBOb3Yg
MjAyMiwgYXQgMTM6NDMsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOg0KPj4NCj4+IE9uIDI0LzExLzIwMjIgMDk6MDMsIEVkd2luIFRvcm9rIHdyb3RlOg0K
Pj4+PiBPbiAyMyBOb3YgMjAyMiwgYXQgMjI6MjUsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBUaGUgYmluZGluZyBmb3IgeGNfaW50
ZXJmYWNlX2Nsb3NlKCkgZnJlZSB0aGUgdW5kZXJseWluZyBoYW5kbGUgd2hpbGUgbGVhdmluZw0K
Pj4+PiB0aGUgT2NhbWwgb2JqZWN0IHN0aWxsIGluIHNjb3BlIGFuZCB1c2FibGUuICBUaGlzIHdv
dWxkIG1ha2UgaXQgZWFzeSB0byBzdWZmZXINCj4+Pj4gYSB1c2UtYWZ0ZXItZnJlZSwgaWYgaXQg
d2VyZW4ndCBmb3IgdGhlIGZhY3QgdGhhdCB0aGUgdHlwaWNhbCB1c2FnZSBpcyBhcyBhDQo+Pj4+
IHNpbmdsZXRvbiB0aGF0IGxpdmVzIGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIHByb2dyYW0uDQo+
Pj4+DQo+Pj4+IE9jYW1sIDUgbm8gbG9uZ2VyIHBlcm1pdHMgc3RvcmluZyBhIG5ha2VkIEMgcG9p
bnRlciBpbiBhbiBPY2FtbCB2YWx1ZS4NCj4+Pj4NCj4+Pj4gVGhlcmVmb3JlLCB1c2UgYSBDdXN0
b20gYmxvY2suICBUaGlzIGFsbG93cyB1cyB0byB1c2UgdGhlIGZpbmFsaXNlciBjYWxsYmFjaw0K
Pj4+PiB0byBjYWxsIHhjX2ludGVyZmFjZV9jbG9zZSgpLCBpZiB0aGUgT2NhbWwgb2JqZWN0IGdv
ZXMgb3V0IG9mIHNjb3BlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ0M6IENocmlzdGlh
biBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4+Pj4gQ0M6IERhdmlkIFNj
b3R0IDxkYXZlQHJlY29pbC5vcmc+DQo+Pj4+IENDOiBFZHdpbiBUb3JvayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbT4NCj4+Pj4gQ0M6IFJvYiBIb2VzIDxSb2IuSG9lc0BjaXRyaXguY29tPg0KPj4+
Pg0KPj4+PiBJJ3ZlIGNvbmZpcm1lZCB0aGF0IFhlbmN0cmwuY2xvc2VfaGFuZGxlIGRvZXMgY2F1
c2UgdGhlIGZpbmFsaXNlciB0byBiZQ0KPj4+PiBjYWxsZWQsIHNpbXBseSBieSBkcm9wcGluZyB0
aGUgaGFuZGxlIHJlZmVyZW5jZS4NCj4+PiBUaGFua3MsIGEgZ29vZCB3YXkgdG8gdGVzdCB0aGlz
IGlzIHdpdGggT0NBTUxSVU5QQVJBTT1jLCBwb3NzaWJsZSB1bmRlciB2YWxncmluZCwgd2hpY2gg
Y2F1c2VzIGFsbCBmaW5hbGlzZXJzIHRvIGJlIGNhbGxlZCBvbiBleGl0DQo+Pj4gKG5vcm1hbGx5
IHRoZXkgYXJlIG5vdCBiZWNhdXNlIHRoZSBwcm9ncmFtIGlzIGV4aXRpbmcgYW55d2F5KQ0KPj4g
SSBkbyB0aGF0IGFueXdheSwgYnV0IGl0J3Mgbm90IHJlbGV2YW50IGhlcmUuDQo+Pg0KPj4gV2hh
dCBtYXR0ZXJzIGlzIGNoZWNraW5nIHRoYXQgY2FsbGluZyBjbG9zZV9oYW5kbGUgcmVsZWFzZXMg
dGhlIG9iamVjdA0KPj4gKGFsYmVpdCB3aXRoIGEgZm9yY2VkIEdDIHN3ZWVwKSBiZWZvcmUgdGhl
IHByb2dyYW0gZW5kcy4NCj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+
Pj4+IGluZGV4IGYzNzg0OGFlMGJiMy4uNGUxMjA0MDg1NDIyIDEwMDY0NA0KPj4+PiAtLS0gYS90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPj4+PiArKysgYi90b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPj4+PiBAQCAtMzcsMTMgKzM3LDI4IEBADQo+Pj4+
DQo+Pj4+ICNpbmNsdWRlICJtbWFwX3N0dWJzLmgiDQo+Pj4+DQo+Pj4+IC0jZGVmaW5lIF9IKF9f
aCkgKCh4Y19pbnRlcmZhY2UgKikoX19oKSkNCj4+Pj4gKyNkZWZpbmUgX0goX19oKSAoKigoeGNf
aW50ZXJmYWNlICoqKURhdGFfY3VzdG9tX3ZhbChfX2gpKSkNCj4+Pj4gI2RlZmluZSBfRChfX2Qp
ICgodWludDMyX3QpSW50X3ZhbChfX2QpKQ0KPj4+IEkgdGhpbmsgdGhpcyByZXF1aXJlcyBhbiB1
cGRhdGUgaW4geGVub3BzZCB0b28gdG8gbWF0Y2gsIG90aGVyd2lzZSBpdCdsbCBjcmFzaDoNCj4+
PiBodHRwczovL2dpdGh1Yi5jb20veGFwaS1wcm9qZWN0L3hlbm9wc2QvYmxvYi9tYXN0ZXIvY19z
dHVicy94ZW5jdHJsZXh0X3N0dWJzLmMjTDMyDQo+PiBVcmdoLiAgSSdsbCB0YWtlIGEgbm90ZSB0
byBkbyB0aGF0IHdoZW4gYnJpbmdpbmcgaW4gdGhlIGNoYW5nZS4NCj4+DQo+Pj4gVGhpcyB3YXNu
J3QgYW4gaXNzdWUgd2l0aCB0aGUgb3JpZ2luYWwgcGF0Y2ggd2hpY2ggdXNlZCBEYXRhX2Fic3Ry
YWN0X3ZhbCBoZXJlLCBiZWNhdXNlDQo+Pj4gdGhhdCAoY3VycmVudGx5KSBoYXBwZW5zIHRvIGJv
aWwgZG93biB0byBqdXN0IGEgY2FzdCAod2l0aCBzb21lIEdDIG1ldGFkYXRhICpiZWZvcmUqIGl0
KSwNCj4+PiBzbyB0aGUgb2xkIHdheSBvZiBqdXN0IGNhc3RpbmcgT0NhbWwgdmFsdWUgdG8gQyBw
b2ludGVyIHN0aWxsIHdvcmtlZC4NCj4+Pg0KPj4+IEhvd2V2ZXIgRGF0YV9jdXN0b21fdmFsIGJv
aWxzIGRvd24gdG8gYWNjZXNzaW5nIGEgdmFsdWUgYXQgK3NpemVvZih2YWx1ZSkgb2Zmc2V0LA0K
Pj4+IHNvIHhlbm9wc2Qgd291bGQgbm93IHJlYWQgdGhlIHdyb25nIHBvaW50ZXIuDQo+Pj4gUGVy
aGFwcyBpdCB3b3VsZCd2ZSBiZWVuIGJldHRlciB0byBoYXZlIHRoaXMgX0ggZGVmaW5lZCBpbiBz
b21lIGhlYWRlciwgb3RoZXJ3aXNlIGV4dGVuZGluZyBYZW5jdHJsIHRoZSB3YXkgeGVub3BzZCBk
b2VzIGl0IGlzIHF1aXRlIGJyaXR0bGUuDQo+PiBFeHBvcnRpbmcgX0ggd29uJ3QgaGVscCBiZWNh
dXNlIGV2ZXJ5dGhpbmcgaXMgc3RhdGljYWxseSBidWlsdC4gDQo+DQo+IEFzIGxvbmcgYXMgeW91
IGRvbid0IHJlYnVpbHQgeGVub3BzZCB5b3Ugd2lsbCBrZWVwIHVzaW5nIHRoZSBvbGQgQyBzdHVi
cyB0aGF0IHhlbm9wc2QgZ290IGNvbXBpbGVkIHdpdGgsIHRoZSBjaGFuZ2UgaW4gWGVuIHdpbGwg
aGF2ZSBubyBlZmZlY3QgdW50aWwgeGVub3BzZCBpcyByZWNvbXBpbGVkLA0KPiBhdCB3aGljaCBw
b2ludCBpdCBjb3VsZCBwaWNrIHVwIHRoZSBuZXcgX0ggaWYgYXZhaWxhYmxlLCBidXQgSSBhZ3Jl
ZSB3aXRoIHlvdXIgcG9pbnQgYmVsb3cuDQo+DQo+DQo+PiBJdCdzDQo+PiBicml0dGxlIGJlY2F1
c2UgeGVub3BzZCBoYXMgZ290IGEgbG9jYWwgcGllY2Ugb2YgQyBwbGF5aW5nIGFyb3VuZCB3aXRo
DQo+PiB0aGUgaW50ZXJuYWxzIG9mIHNvbWVvbmUgZWxzZSdzIGxpYnJhcnkuICBUaGlzIHZpb2xh
dGVzIG1vcmUgcnVsZXMgdGhhbg0KPj4gSSBjYXJlIHRvIGxpc3QuDQo+Pg0KPj4gV2UgKFhlblNl
cnZlcikgc2hvdWxkIGRlZmluaXRlbHkgd29yayB0byBpbXByb3ZlIHRoaW5ncywgYnV0IHRoaXMg
aXMNCj4+IGVudGlyZWx5IGEgeGVub3BzZCBwcm9ibGVtLCBub3QgYW4gdXBzdHJlYW0gWGVuIHBy
b2JsZW0uDQo+DQo+IEl0IGlzIGEgbG90IGVhc2llciB0byBhZGQgbmV3IHhlbmN0cmwgYmluZGlu
Z3MgYW5kIHRlc3QgdGhlbSBvdXQgaW4geGVub3BzZCB0aGFuIGl0IGlzIHRvIGFkZCB0aGVtIHRv
IFhlbi4NCj4gV2Ugc2hvdWxkIHRyeSB0byBlaXRoZXIgdXBzdHJlYW0gYWxsIHhlbm9wc2QgeGVu
Y3RybCBiaW5kaW5ncyB0byBYZW4sIGFuZCBtYWtlIGl0IGVhc2llciB0byBhZGQgdGhlbSB0byBY
ZW4gZ29pbmcgZm9yd2FyZDsNCj4gb3IgbW92ZSBhbGwgdGhlIFhlbmN0cmwgYmluZGluZ3MgdG8g
eGVub3BzZCwgdGhlbiBhdCBsZWFzdCB5b3Ugb25seSBuZWVkIHRvIHJlYnVpbGQgdGhlIG9uZSBw
aWVjZSB5b3UgYXJlIGNoYW5naW5nLg0KPg0KPiBCdXQgdG8gZG8gdGhlIGxhdHRlciB3ZSBmaXJz
dCBuZWVkIHRvIGdldCBldmVyeXRoaW5nIHRoYXQgcmVsaWVzIG9uIHhlbmN0cmwgdG8gbW92ZSB0
byBtb3JlIHN0YWJsZSBpbnRlcmZhY2VzIChpbmNsdWRpbmcgb3hlbnN0b3JlZCkuDQo+IFRoZXJl
IGFyZSBzb21lIE1pcmFnZSBsaWJyYXJpZXMgYXMgd2VsbCB0aGF0IHVzZSB4ZW5jdHJsLCB3aGVu
IGEgbW9yZSBzdWl0YWJsZSBzdGFibGUgaW50ZXJmYWNlIGV4aXN0cyBpbiBuZXdlciB2ZXJzaW9u
cyBvZiBYZW4gdGhhdCB0aGV5IHNob3VsZCB1c2UgaW5zdGVhZC4NCj4NCj4gUGVyaGFwcyBhIGNv
bXByb21pc2UgYmV0d2VlbiB0aGUgMiBleHRyZW1lcyB3b3VsZCBiZSBmb3IgeGVub3BzZCB0byBv
cGVuIGFuZCBoYXZlIGl0cyBvd24geGVuY3RybCBoYW5kbGUsIGV2ZW4gaWYgdGhhdCBsZWFkcyB0
byBzb21lIGNvZGUgZHVwbGljYXRpb24sIGl0IHdvdWxkIGF0IGxlYXN0IG5vdCByZWx5IG9uIGFu
IHVuZG9jdW1lbnRlZCBhbmQgdW5zdGFibGUgaW50ZXJuYWwgZGV0YWlsIG9mIGFuIGFscmVhZHkg
dW5zdGFibGUgQUJJLiBBbmQgdGhhdCB3b3VsZCBzdGlsbCBhbGxvdyB4ZW5vcHNkIHRvIGV4dGVu
ZCB4ZW5jdHJsIHdpdGggYmluZGluZ3MgdGhhdCBhcmUgbm90ICh5ZXQpIHByZXNlbnQgaW4gWGVu
Lg0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KTWFueSBvZiB0aGVzZSBwcm9ibGVtcyB3aWxsIGRp
c2FwcGVhciB3aXRoIGEgc3RhYmxlIHRvb2xzIGludGVyZmFjZS7CoA0KQnV0IHllcywgaW4gdGhl
IHNob3J0IHRlcm0sIHhjZXh0IG9wZW5pbmcgaXRzIG93biBoYW5kbGUgd291bGQNCmRlZmluaXRl
bHkgaW1wcm92ZSB0aGluZ3MgYnkga2VlcGluZyB0aGUgdHdvIHNldHMgb2YgYmluZGluZ3Mgc2Vw
YXJhdGUuDQoNCn5BbmRyZXcNCg==

