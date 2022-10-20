Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C361B605FBD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426692.675301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUKJ-0004yJ-J2; Thu, 20 Oct 2022 12:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426692.675301; Thu, 20 Oct 2022 12:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUKJ-0004vF-Ff; Thu, 20 Oct 2022 12:07:07 +0000
Received: by outflank-mailman (input) for mailman id 426692;
 Thu, 20 Oct 2022 12:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvJe=2V=citrix.com=prvs=2859d115b=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1olUKH-0004v9-Um
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 12:07:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0515b8d-506f-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 14:06:56 +0200 (CEST)
Received: from mail-bn1nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 08:07:00 -0400
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SJ0PR03MB6568.namprd03.prod.outlook.com (2603:10b6:a03:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 12:06:57 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bc54:e6d5:2052:ddb4]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bc54:e6d5:2052:ddb4%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 12:06:54 +0000
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
X-Inumbo-ID: b0515b8d-506f-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666267623;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ZrNAD7hDxWjwb+MMEErtxcdy4MmdgrAl6LptHBDyi0c=;
  b=Oa/VDAy0bTFPZIdI/+5COX270SR0MR/+iOJ+mJ/X/mxTGUh8PXzM4Rcx
   pGspYC5OA+FN2dBKqKvGqNHT8pUDbUrCLyXmkkIe/GEn+IKDGqnjMqmj4
   h2zUCNyN/YRcb+9ohuHTPS1oypUiTZ+h1Xf+D/cz/DircWkvDcyf7P00V
   g=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 83143555
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lc7uCKm72LNHaIvgtdH3eU/o5gyuJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXGiAPPffZWagLdhwPIvn9ksE7MWEm981HQpr/y00QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHEV38
 Ps4OWg2VTOeh+6ZmY+CWMVnv5F2RCXrFNt3VnBI6xj8Vaxja7aaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqui6PlmSd05C0WDbRUteKX8ROgkeRo
 CTC/mL1Ax4yP92D0zuVtHmrg4cjmAurA9tOT+Dlq5aGhnWDylc+UwYWdWe74tvkh0fuZ/tbG
 WIbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2JW1RHSH5/GrpDW9ESEPKCkJYipscOcey9zqoYV2hBSWSN9mSPGxloetRWu2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:b7CFRq1bM04xyOvgFLKgpgqjBQRyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLUPbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy8MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njAsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqu9jIDPr3MtiEmEESutu+aXvUiZ1REhkFxnAib0idrrD
 ALmWZlAy080QKXQoj/m2qR5+Cp6kdT15al8y7VvZKrm72GeBsqT8VGno5XaR3f9g4pu8x9yr
 tC2yaDu4NQFg6oplW12zBZPysa6XZcjEBS5tL7tUYvJ7c2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFUgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve8PcV
 T6ISZlXEIJCjHT4Je1rex2Gzj2MRWAdCWozN1C7J5kvbC5TKb3MES4OSITr/c=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208,217";a="83143555"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg+jIcAXHcGZtJQyau0GZWo79r+KuVQutwPer2xVrHQhCYmPNupv3CBqNUOFKTKBb/OeX91XPSimPYOcx74qfGpxbm6NlCeJd2aKxVoFMSwwhK8O65g760U5U1KX1utfgo88zb/SI3b0Cj6peJQlGuhcsAyTZ/liK5uxo10AxI9zEzDPStdm5zNwMra/3nRv8EXYusM2npNYDG5EvihwrfZRwXkdPypl3lBXXHwk0inyromXrR2DPBtYNPwuib3DQby/91bt7XM6v9tl+yXrwLaE0PGGssMEySF70Qy8/TnjZijaMLVarROWUba5QgcYpgSz9OEUm0Fu5GwmhmNjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrNAD7hDxWjwb+MMEErtxcdy4MmdgrAl6LptHBDyi0c=;
 b=Jsthe6HW366ETCqVm78Iz6kFkNKj9dqplhwsQfkqW17Dj3J5pgeQsWPGg39Mx/LhPvzIw/OLujM6qWO0dOngBH43c1SlICfEo3KsFzz1iizvKjm5u2q1cE/zfOlOd0+j0JxmMgXk3n2RqnmA/p0octzlr+8XeYpndj0JoD9ljha5kVAsjDgApkIUMzMdqLwoGmG77SJaqqaB5C3fXLNx3ygmHPaAlbvVO6k04LptsvMij1ehAmwBYRuE+/dz4gLKEtprcFeKBp2fzDNPGyixHzBkMhf72azhx1036tuGRmoSAkuTJGa7dN7OdvdW/7jSOjIKMx/xJRqFZxrZHGItNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrNAD7hDxWjwb+MMEErtxcdy4MmdgrAl6LptHBDyi0c=;
 b=k2Um9xqrw7bVjWtS1bhH94QEBgKIz7Qo6Zmtm8fMoAa82cXz0Ky29eVL9y4mb5LOOr85pzADcYZu0Wr4RNhRg/OMbJIlhN7R3xmseo7nVRFBph4QPC5MhZXLTdYvLwD3M6N8Jxu/t+vTJa2Hs63s+xCSyA6IlTp3mKnbfibt8EA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Topic: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Index: AQHY5HiAcD24hk9GgUi1cSkdE1Fmrq4XL/IA
Date: Thu, 20 Oct 2022 12:06:54 +0000
Message-ID: <D2ADDC94-44D1-4854-B17C-A1D065E5D2FB@citrix.com>
References: <20221020113810.20844-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221020113810.20844-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SJ0PR03MB6568:EE_
x-ms-office365-filtering-correlation-id: 8ad65d39-7abf-4116-011a-08dab293948e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N6O6rasRenZNQdyecbL9PY+q5Fupfe+5vaaIiYRyVxPVHz/Y2/WsCJ2gpKoU13fVYRSeW3/u+oKJTgXS7SzjqK0iGf0hUGI07XpcNRhmriwijUh11Obkls69Ilm5k4/bGxctS2U8gPn+FjyiEBOZgGQgqvPWCMZN8jKv3jBR1UkbELXz97HMYXizzD3//HiiCl1Fasi8ul+vCPtvmeiSw2drgqIJ64WEr9MqnxVQurXuTkcB3g4GbenWvK/wgDztIsg3IIJ+euNyLgtuQuvJh4yWPYnTaQcGuxvagrPdsEZA+m1l9NfV96kW/vRVZP8ZFHQqOmpG26/TMCBr6gUHuF3MNQkKrrNT2NXiQHFw0ndzEcpx/WRiwVC6WbpDTXrvzY3JOu3BQBR5ZZ40e7j+0n0a4piz3ZZClWSYPjhvH37R5rWxrdBk71lJwZJMQVU6mQ6wk6xglzjIZB1llob5z+0zeqyji77nbb0VQ8kZg+FTY9EFggHDZcOtYQ1X9BSAfsiUH035tbg1JeCAipd12+9+z+ucgU4JZbg7sIqVIl3Lh7twqPEY7dhXnJU7tk09u6Y/T7rJuZMpbjj/vBzP/xYsaU7DVarl+L8qZD1TR05ioNxJI1FnKTIKHdZqoYQTYTdLbnrEWofmnXR/o/n9Cuvk3TMGKBieQb315xg6Iezl/OV/1hmuz+prkDcbvghVUqWkZjWNqFQlWwLX9VQlDORCi4jPjmkezNcArnQztr+5JShDsN7R3uSXYgg3/X0qerkRCAE+JAJtnA8ke0UhUdDQ3ON+5Y68MUrGeJ6gT2AxPpqDEmL1e3SgT673O0KLwZy+95G2R+HQ0E9IrDTcweCVJTSxgMKklEXROYdMlDOGiVk/dxHjysgAcMrJ2Gej
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(33656002)(6506007)(83380400001)(316002)(38070700005)(86362001)(38100700002)(44832011)(8936002)(166002)(478600001)(4744005)(82960400001)(6486002)(5660300002)(122000001)(2906002)(76116006)(66946007)(66556008)(66476007)(66446008)(6862004)(15650500001)(71200400001)(26005)(41300700001)(64756008)(8676002)(4326008)(6636002)(6512007)(2616005)(54906003)(91956017)(186003)(966005)(53546011)(37006003)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eY72af/0jMYDTv/aUxDclkyWm9wuGN93OC5EDgsxYU7TN7YcPENmCuPbUU3L?=
 =?us-ascii?Q?JnBy/oojeF1NfSwEOdoWK7fj/Y0WYwHZY+XqwKMJFIMSBSWvcqHKrZu+MvML?=
 =?us-ascii?Q?uC3WoCLtiZu3QHbqvPUn4DIW8z/MD5RnvV9Duy5Dtkv81HjjnB2eAEXsJloc?=
 =?us-ascii?Q?K1EPP4uF/nDr+ndwlyIN2A2bUoYzvnOnLx5cZ/I8q78pTgQS8ftKvL3jdIHX?=
 =?us-ascii?Q?dm9NRhsf+ZWVkd9jLsb6QX8sOE+L/YLUcUbq8Yvrm1x8nHHHjPn6R1soyPhd?=
 =?us-ascii?Q?CR873eKu0jCpQEiif9nMDVXp99J4dFDvLxuWPVys+M+Na839N1Nhhx9l+20J?=
 =?us-ascii?Q?ChB0GbAK0JeBwJowo1Kutf2kyuXDBZvR9XN8KR1SacIQYoWTaf7hb7GqTFo7?=
 =?us-ascii?Q?rNHO53WPKHTeAwp2kaz3cFAIaot57ER9T48wegB3aeEPgaN5ttSGMVAIW0xE?=
 =?us-ascii?Q?ctW8pAw1aTOLIavNuAJoYzSdf+AyNWaz/GwmQTEkIuCL6GWfWg4lNt2yXzBq?=
 =?us-ascii?Q?P9KYVKlsCRPhqRmdqTfQR0HOp9BRguB5BHMXJEmXYrIvqfnVFG+8vVR0vRM5?=
 =?us-ascii?Q?D7dl2LriQbouWPwBGM/GU/Pd+VO7msZViNvCJR/6G/NjdcwFns3cPpUBk6Du?=
 =?us-ascii?Q?ZfJPNPrxwzMxJY4B4bPDzDkDu5pimzsgqW5kplEW4GpaAUDIDjs7tZ4jYFMS?=
 =?us-ascii?Q?AMp4d4eJqb7cF1V4tvXIiYFkTecF5iB6g74fzhr91NRkuepoU4XWJzonVrhM?=
 =?us-ascii?Q?rT+ZV3R527zeo11CFx3F25O8zM12pPnhR9BZ+Y2YYgZhIBWdmJ4a/G4XZUpV?=
 =?us-ascii?Q?uerkcv7ZhCFYhutEhTMQ0CfRpnhl8b2qFZulObnCbI+zmqOU9p/hNjOlJwPq?=
 =?us-ascii?Q?SYWuJW7SxMCQcuGxiadm1e+lj7nQzGy0YWPcomUPBLcCv1mFF1R5ql9wFSXR?=
 =?us-ascii?Q?mHtxTfHebDfK5baugWIG53yw6tjoCV4yIX/FAlJ03du9L5MFyiWCIS7xYJ83?=
 =?us-ascii?Q?OUO16gRmlY5JFdpZnObKKqdcKIQZ9dhfuybwWmdG2aZnOVw8xcs0HR9PZOpX?=
 =?us-ascii?Q?Cft/N7RIzVslTCplnUutNyitTg4CI1NMOFin8H5KRAANBDJRVEz5u9fw/fV3?=
 =?us-ascii?Q?yM68n63GKg1q5Zirx7IwuvB50JVXnO+oBh5HGu9yNgibF8eoPy78ubR+ocTH?=
 =?us-ascii?Q?Qf1OhnLVxi2bEDV7OUD/aPfyRevr0DBRgUnal9nQZaBeMylxadQ2HXFQYfP4?=
 =?us-ascii?Q?zYhLlJZ0PfTIX75WyrC+XhypuWiN/njaFf8Fz/5MwVYNCIoiMJVEE/H67eUN?=
 =?us-ascii?Q?J/IhE/2+y9PPrFez4AGgOJ5OqadPrCib4O19Xzu4LR/2glWbbTLp/xKAHiPD?=
 =?us-ascii?Q?Vzzz9+fCdm5yowOzkUMJp0QaV4q8hmzKYAsD7MNiW+qE5zSbDPIBfsOjs+2e?=
 =?us-ascii?Q?Qgnbqm2OIzBHHTrcj4Bvlx9XyJHSBaYLIrpXcz+fyfhLaUWkeopUr5ZhQFAC?=
 =?us-ascii?Q?7yUeL+OBQxBdyB0SXIOF6/ouOSWb0s4yy9rze+FmXAH2q37yke71laUv7Ebk?=
 =?us-ascii?Q?ltmyj+/Bu1l9QRDnGYxZ+4zjlxmKEvpOk7EjG3ByfVwaQphW3iGmRCBVpEwa?=
 =?us-ascii?Q?pfN4WQZDvAYxYfDjg/GwnZk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_D2ADDC9444D14854B17CA1D065E5D2FBcitrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad65d39-7abf-4116-011a-08dab293948e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 12:06:54.8461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kkkyzSUspglUQKZjq++Q5KH942h5iBdLUPtNVmGIBNk3VHpyBeMNfhUD0I2Qxh5iA6wDPbIuwCTnekFKQKVMe1CXxn4gGxWz3/jb27xG2kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6568

--_000_D2ADDC9444D14854B17CA1D065E5D2FBcitrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 20 Oct 2022, at 12:38, Andrew Cooper <andrew.cooper3@citrix.com<mailto:a=
ndrew.cooper3@citrix.com>> wrote:

tl;dr This hunk was part of the patch emailed to xen-devel, but was missing
from what ultimately got committed.

https://lore.kernel.org/xen-devel/4164cb728313c3b9fc38cf5e9ecb790ac93a9600.=
1610748224.git.edvin.torok@citrix.com/
is the patch in question, but was part of a series that had threading issue=
s.
I have a vague recollection that I sourced the commits from a local branch,
which clearly wasn't as up-to-date as I had thought.

Either way, it's my fault/mistake, and this hunk should have been part of w=
hat
got comitted.

Fixes: 00c48f57ab36 ("tools/oxenstored: Start live update process")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com<mailto:andrew.coope=
r3@citrix.com>>

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>


--_000_D2ADDC9444D14854B17CA1D065E5D2FBcitrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <596D39167362E34F81E4B8EA0297C892@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 20 Oct 2022, at 12:38, Andrew Cooper &lt;<a href=3D"mail=
to:andrew.cooper3@citrix.com" class=3D"">andrew.cooper3@citrix.com</a>&gt; =
wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Menl=
o-Regular; font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">tl;dr
 This hunk was part of the patch emailed to xen-devel, but was missing</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">from
 what ultimately got committed.</span><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Menlo-Regular; font-size: 11px; font-style: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D=
"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<a href=3D"https://lore.kernel.org/xen-devel/4164cb728313c3b9fc38cf5e9ecb79=
0ac93a9600.1610748224.git.edvin.torok@citrix.com/" style=3D"font-family: Me=
nlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: normal=
; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; widows: aut=
o; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-w=
idth: 0px;" class=3D"">https://lore.kernel.org/xen-devel/4164cb728313c3b9fc=
38cf5e9ecb790ac93a9600.1610748224.git.edvin.torok@citrix.com/</a><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">is
 the patch in question, but was part of a series that had threading issues.=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">I
 have a vague recollection that I sourced the commits from a local branch,<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; f=
ont-size: 11px; font-style: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">which
 clearly wasn't as up-to-date as I had thought.</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Either
 way, it's my fault/mistake, and this hunk should have been part of what</s=
pan><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; fon=
t-size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">got
 comitted.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo=
-Regular; font-size: 11px; font-style: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Fixes:
 00c48f57ab36 (&quot;tools/oxenstored: Start live update process&quot;)</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font=
-size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Signed-off-by:
 Andrew Cooper &lt;</span><a href=3D"mailto:andrew.cooper3@citrix.com" styl=
e=3D"font-family: Menlo-Regular; font-size: 11px; font-style: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: au=
to; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -=
webkit-text-stroke-width: 0px;" class=3D"">andrew.cooper3@citrix.com</a><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-siz=
e: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none; float: none; display: inline !important;" class=
=3D"">&gt;</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
</div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</body>
</html>

--_000_D2ADDC9444D14854B17CA1D065E5D2FBcitrixcom_--

