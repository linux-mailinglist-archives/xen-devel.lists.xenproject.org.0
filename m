Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84A4D6383
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 15:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289095.490456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgLr-00040L-OK; Fri, 11 Mar 2022 14:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289095.490456; Fri, 11 Mar 2022 14:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgLr-0003xM-KL; Fri, 11 Mar 2022 14:34:43 +0000
Received: by outflank-mailman (input) for mailman id 289095;
 Fri, 11 Mar 2022 14:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSgLq-0003xG-2v
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 14:34:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61d2e8e3-a148-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 15:34:40 +0100 (CET)
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
X-Inumbo-ID: 61d2e8e3-a148-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647009280;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nq4wrcwMrV7c3NzsFGvzT106QaKejpF7C1oT0qx1HjE=;
  b=Deazh868aW7BBYQclEeNUTe1/zldc3f1HKLqReoCkKPvUFnO3c7WAXDM
   rxiLnqGLM0im1Wr094Npk+in0QNTr/qCO70eqSqQRrbVHDr0nWeElPWIP
   BXZAUDdAFNgbWy6wriReucRu3JWqr0cXJeOVlJzOPwGppZKttjpNH0Jk3
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66415741
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/Rz0qaj3rjRt997EIyVNqE7sX161dhAKZh0ujC45NGQN5FlHY01je
 htvUT2BO/jcM2ajet92aYTko04Ev5PXytViHQI4pCowRiwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSkLJrDGlL4UaAJBNiR5N7BXoKbMHmfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiAO
 5NENmY2BPjGSx8QHAtGKIwMp92LoiPELh8EmHmsnINitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4Pc8i9QuBkKPv+B+8A28OUy8ZcdcZq5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uDA3Dt4ade51q2VtW
 lBdyqByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3Y51bJm+xO
 BaN0e+02HO1FCL7BUOQS9jsY/nGMIC6TYi1PhwqRoYmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKOoNBJcgxScyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:yJWeu6DFTQAgUQ3lHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dC/DDEytHRuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJunfwivZv3Evoz6hNO6Ws19
 60Q5iAq4s+PfP+TZgNc9vpEvHHfFAkf3r3QRCvyBLcZeQ6B04=
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="66415741"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ9Rw2oVhIQS1ZuDBjbcnlsYNwvHPeXAouxW4PPaXQUrcv3a0HN5t67QifkcFS/ZqL7f/9nkteFd2DDj3YccsIhQbmPmjfHrVy6lrYCycZcorMqItTqLVlqNzcGdFNaI7t/3zuFR5C6vhD02LDnucd/VIHS2B53bfvdhTK2jDG0pKrDBatPimGpZDpLC47Qyr6sWui1SElW9/guC3IlbqpsOprjmajiIDR3/fyUqsdycrGRf0p3FdkHM8EnJT3DrAkymxixZ80+zbvjEeK8OJKAwAiLE4Hwt7JPT9ymrvAg9gNKAyXtLZEnToZaPJnbAHF2/If9iQbPzH02LlWY4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIp9enZ6Td5IPjrl0a4wgylfAVxySYGj9CkFtleIuvw=;
 b=TQfL8TFGGOuQltlG9+l2LO0lF1PUNVnlDf8aP3+Vksj9qhjaVcPhE9ivNRgVZ6Ltu0eHNNq+5OT6idpyH3phQEw5yBAWsYeYWcjreSkf57SvTI0EHpPf6P/Sn9YvZlHHPPlBvzCETXJDzJzC1qiyTAvdn9FF9GkgD4uLD1imqBhZKt4CH6smghWNgliwyGKVZJ8gSWaDtAQiQpy3cVp67t/rtQM3X/WksvIpPcXd53eC2ztUyDOq5fpF08nypk8WYiVBYju8NO4qUG3vpnAeCDA1O2X8ak4y62yIn6uAVx6f++Kb3dByw6xDbTLhDiFblYWGWUwlOC3PfB0s3HyzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIp9enZ6Td5IPjrl0a4wgylfAVxySYGj9CkFtleIuvw=;
 b=FXbgGV+dEmwf6DKUjiVfUy09D/bziTE8+qh7aZeRUUScnbYw97IDlNpMBC+y2qkqsJVs97oTq6PDp4FVeM674NOFDMUefiO0nHwTKpVb+ODRZ0zHcA+IdsnuPQW53WwoScjwbOPEHfJFDNmtFta27/GfWL/lbojUQUT5v2+WFio=
Date: Fri, 11 Mar 2022 15:34:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <Yitd9RNJf1vvOsf4@Air-de-Roger>
References: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
X-ClientProxiedBy: LO4P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7326ee2a-ba87-4e22-aafa-08da036c4356
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5774:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5774E16BA1D01255B17772858F0C9@SJ0PR03MB5774.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYg2pFZcaVY+ILsh1JsBajdUvm/aVm5n0btDKpk+P15fvYncW4Bbg2VfUrHGOKm5OE7mso2pJ92bc4pSKSrYqBoDfHjgXv7rJiqaXAgXCk69fdeUvSWGXif+Zvf6EjuzzlO57iYsBG80ZxerTuBz/a63m68zss663M+9Ol4udIddRmhu7BNF55z3kheSk3LuCBPtdO/yMT1kpPy1vPe8f9UKgQqCTlXv+AKLZFYypjsd01b0vShJRILt9TJ3DGML6g/upQjp7Sy0JLVfXUg98pmT7U03nTINEe8QrU845OvTIRSJ87s8PWDqWobiD81gRAbpbBPvs7wme4YJduOsFMhu/lp9WzEw6eZ2Nc/tlhhw/PAoG19yRNDyTUAvXyNpqTmiKvmEo3naWvw2UQoXgtl6PZhQ2MXWcDbL+c6rPBikLZHU/f4Npt57wCKxzQ7ypPvU0aZAZ+4PCTvdu4dAB4ivef17lpRZQtjNrmL4ndqZyWpk3FemsI8jWfZvS0o+Wz4Ta6JIKCifA1kBrSP3au4ur75rbWSWSrU5046L+etWu91P16664N3lXaqkvEKDsexGnRsQLTPl2z+Aq4QI7RaDmE1LqsrkBc7cUP9U6gkdcmngUEa05S5yP+vXylexig8f6IZEgpFme1SAvnJcMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(6486002)(54906003)(38100700002)(26005)(186003)(9686003)(85182001)(6666004)(6512007)(6506007)(33716001)(508600001)(316002)(6916009)(8936002)(8676002)(4326008)(66476007)(66556008)(66946007)(2906002)(5660300002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9rNHpmN3NFZ2FmQlYxS1JuNno5NWpEYS94Y0pQUUN5Z1VqUHRGcDFGOXMz?=
 =?utf-8?B?dlA5YlJza3k2ZkN2SW0zVytSbFhPZGk3WUtZSk40bTl1MjVwdWV6Uk9BbExz?=
 =?utf-8?B?VFZjVDA2YVZPNm1VNE1RbVh6N0lFWjIwVVVhNXJGVkppbUhnOW5ERU9zQlVt?=
 =?utf-8?B?S2NMcGtNbzZUWkZIUmEwT0dQN0pYMUo2blVqSlRGNkpFREtuQktDS1hDSzlr?=
 =?utf-8?B?YlEwL0RJc0dBSjVpYWJ6RTFMb0IzVWxEV2hSSFdtb2t4OE9wSjZUZ0xoY1Zv?=
 =?utf-8?B?SEg1cU5IVjRLZWUveEZzWGdCbk01djVzUkdETlZaanBpTTJZb2diNmRKbUtq?=
 =?utf-8?B?UGZTaFZTT0F2MkVYdnFsUEtXUEo3R3pLcDRwdUNUZDBNeG5RNURzM1loM0lk?=
 =?utf-8?B?ZXo5V3pXS2cvdEM2eUFjVHlERG45ZzhXZXFrdE82SXlVaHhJM0dpZjhqVTJE?=
 =?utf-8?B?VDRDN09hWUZuMTRoSEZjUWJ2VXVUQlRCaExuTUNLSDEySFNlVk4xcUkvS1Rm?=
 =?utf-8?B?RHFKblMvVDNFYWtJTUQ4SnV3WEZWdzFJcUJPR2VHTEJZejUrZDNEeW5Kb1hl?=
 =?utf-8?B?WnF2Ykw2K2RLQUxEY2NqTWltWnFBaytYQ2tlL3VORHJONVQ1S3lGNXFKTVZj?=
 =?utf-8?B?NFE1aStweVVuQUpqKzhsM2JKem1ZQWZ2NVRMSjMvd29EWSs0cHNoR2lKS0Z4?=
 =?utf-8?B?TTJ5WkVQMFRMNmREVDZ4VzhrL0N5NlZBN3owNlRCdWlHbGh4V2d5WVowSDMv?=
 =?utf-8?B?RmNLWjU0L3pSdXpyd2M3Y2hLQ2FnSUJlYUc1UERkY08wK1Z2ckM0dmc3TWRL?=
 =?utf-8?B?czM5WXlvRE9pSXN1V0E5RWEyNENab2NVSm5pcEYrb3ZuMnI2UXdBc1d3Yzhq?=
 =?utf-8?B?MWsydmwxUnB0VWFmb0lTaWw5TmhVT043V1pWZTJxV2llQmdQckhBSUpHdFJZ?=
 =?utf-8?B?cnZ4czhoeGFLWlhNM015VWpBVHl0VFN6WVlwTTRMVmtJemhlT2ZhSXIrRTQz?=
 =?utf-8?B?SGlSVW9YRE1qeTIreU5SOHlKWFhEWk5WS0treGVGT2xoTVE1aHBNWG05T3lw?=
 =?utf-8?B?NStURmxrMXhlb3BNZnI3dDk4MWxPVFNDdlRnNXpZc2l1RVdRd2p5amhrQmx0?=
 =?utf-8?B?Ty80NXdNRy91OGRnamlqRDlna2JyQlIyMUJjRHZwNUFOTHF1aCt4R0tiRXh5?=
 =?utf-8?B?YmZUbmxNdC9LTWlzZHRJeVBYS2ZOb3dyVDQ1MXg2eXdGZHNWL1E1Njl3blEy?=
 =?utf-8?B?c2tka0lPMTlJMnA5Uy9QajlHUW1ySFd2ang2Y0plQkhJYUhTY1V5ME1xbXNG?=
 =?utf-8?B?SzRKYktlQ25wWHBSb1lUTS9PSzlzZTR4UWhpenJWdzdXZHFKdEVPWUpHVDFS?=
 =?utf-8?B?dmhpZHBqMGxMbTVPL0FzYmJSSGFjek83MXBlcnMzUld4SDB3aUlsTWFVS3Uw?=
 =?utf-8?B?UkZ5U3ZFNXZGUDhqUHA0dHJmU3hhVDBmeTJiSjQxcTB0cWVtNFV5d1pZRnpO?=
 =?utf-8?B?VE9ERThBMTFGSkpJeUtlM2cvK0tyMHNzWjRPQUt2Wnova3psVVVLVTVSZ004?=
 =?utf-8?B?aE14UU1xOEJkSzhnNjRmb01tQTZVbXd2VVp2YnJmT3U2S3BaQm9JdytFN2J0?=
 =?utf-8?B?OXVMZlY3SWgyNVRqRkp3YUFaVlBFU1BpSTgzUWk2eGN4aTdLNjBlcTk0aFBl?=
 =?utf-8?B?SHRnSHNVdjg2UUdxazVLS0gxVjJ5OFEwaHozMFZHQ0hsZVZwZXJZMDBvZFN2?=
 =?utf-8?B?TjMyci94dm1pQlpmamhoR3lwMjBlaTAwZW4zS1F3a2JvWHpacVc1ZEgrd3Zu?=
 =?utf-8?B?c1ZXTCtFNkpWdTRTSFFNbkdWcmdVemdCR3pQWEgyWHBnRlJNamlKdkluMmlO?=
 =?utf-8?B?SDVRbldCS3h2WElVNVBqRmZtT0FUY1lMYVptS2tncU1YTjVscCtUWTdaMC90?=
 =?utf-8?B?NlFDYTJCRnQrc0RJVDFqQWtQaTNnTTloYkY4RDVrNTNXY3prb2VxUm9keGZY?=
 =?utf-8?B?d05tcjM1dUVnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7326ee2a-ba87-4e22-aafa-08da036c4356
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 14:34:34.9638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ato1MXIhRimbA2Ezdmxv666JiQjqVtybpoRp4WcEsatat/facuguOQQozJ8xaB7p9rH5kv2J+RU4RoK19ILYtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5774
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 02:28:40PM +0100, Jan Beulich wrote:
> Support for this construct was added in 2.22 only. Avoid the need to
> introduce logic to probe for linker script capabilities by (ab)using the
> probe for a command line option having appeared at about the same time.
> 
> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
>  endif
>  
> +ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"),y)

You are not going to like this, but I think this should live in
xen/Kconfig together with CC_IS_{GCC,CLANG}, ie: LD_IS_GNU or similar.

It's possible we will need this in the future in other places, so
having it in Kconfig makes sense.

> +# While not much better than going by raw GNU ld version, utilize that the
> +# feature we're after has appeared in the same release as the
> +# --print-output-format command line option.
> +AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY

That's fine to have here IMO.

Thanks, Roger.

