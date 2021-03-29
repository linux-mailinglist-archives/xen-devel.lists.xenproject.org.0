Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3934CE02
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 12:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102933.196474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpBE-0002Sf-Q7; Mon, 29 Mar 2021 10:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102933.196474; Mon, 29 Mar 2021 10:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpBE-0002SI-M9; Mon, 29 Mar 2021 10:31:32 +0000
Received: by outflank-mailman (input) for mailman id 102933;
 Mon, 29 Mar 2021 10:31:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQpBC-0002S7-1X
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 10:31:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31a5af57-5739-4827-b8a4-0da5774e7aaa;
 Mon, 29 Mar 2021 10:31:28 +0000 (UTC)
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
X-Inumbo-ID: 31a5af57-5739-4827-b8a4-0da5774e7aaa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617013887;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2nb+IktYmurXxKAkwpddUG9ewSLY5+OvI6LU6HUoWNk=;
  b=ijNAS3fpY1e1Wms1YTaOuDdgfDkEMMQFJyg0hCt8UxgFVnnTA6FhpiAe
   cWEep8iO063avJhNphH7gAb0BMRG+3NghoG2tWK5AOA8uAQxkhMKxbNk4
   t9vZsncOGGDADje5NJxJSJMb0WfLaylkpK70UGvUroz+CWHAjgs7QkxYN
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1divU9kWANyTkM6K86xItzMAjAqMPveCtVC4eXF9+Zkv78y77VpbFEj4M2425VmHiodALCPIOE
 gG2Z1hAbJ8Qgurzoco0qCnOpkTuVShMw3cOUe+QQFVO3HWms8cVNQsSjxKgSYgbvKfT/yiqwMG
 G/f7YStsqAgzcGP8vTEjvlQKN9kUPy3059d01GBzhyaMjwLXj8AK/pyiAf7vRAUo9Fcc+9gxWu
 1u75McpLvoOsweOkFxuvNN3dqihsf98q9WItGs9/K9Q2myHrrORluiUO4G92TGr0+ISO1c5XzI
 U2s=
X-SBRS: 5.2
X-MesageID: 41777567
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KD7aNKmX275P2XZz7mk7XFNDDDzpDfOej2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW97LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm/m/TgkpX6bRkaQyM94A6Vgj+yrJL8GR6U3hAROgk/vYsK22
 7DjgD/++Gfo+i2oyWsrVP7wrZ3vJ/aytVFDNGRkcR9EFTRoyuheYgJYczmgBkbu+eqgWxa9O
 XkgxBlBMhr7mOUQ2fdm2qT5yDF8BIDr0Dv0kWZh3yLm72LeBsfB9BajYxUNjv1gnBQxO1U66
 5A02KHu5c/N3qp906Rlru4NWAeqmOOrXUviuIVhXBEOLFuE4N5loAD4FhTVK4JASOS0vFWLM
 BVEMre6PxKGGnqFkzxg28H+q3KYl0DWj2CQkQEp/WP1SlXkH1T3yIjtb0it0ZF25QnR5Ze4e
 PYdoxuibFVV8cTKZlwHeEbXKKMeyPwaCOJFFjXDUXsFakBNX6Ig5nr4I8t7OXvXJAT1pM9lL
 nITVswjx99R2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCyqUjkV4oidisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXAWUCUfcSps0wVzu104L2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gFwVusXlP+nRjNS1LgckHy5vtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7AL6PqNL+mUCGuULzq0l5MBtUCUhYpJ/6VWlRmAMMO0ToNZIKu9CVf3FuzGKKTyUPCP/+IU
 p6nRBa6Ki3J5ufyWQJENS8KF+XiHMVuTasQ4oDnLaAoePoYIkxAJpjeKEZL3SLKzVF3SJR7E
 tTYg4NQUHSUhn0j7++sZASDObDM/9mgAmqJsZQgWnFtVqVoPwuQndzZU/tbeenxSIVAxZEjF
 x49KESxJCanyy0FGc5iOMkdGFXZH+vG7JABgSdbIBykrTmETsAC1uitHi/sVUea2Dq/0Idii
 jEITePcf/GOFZbp0tVy73n6l9ya2WbcX9hc3wSi/wOKU32/lJIlcObbKu61GWcLmEPxewQKx
 npSzofKAEG/aH86Del3BK5UVk2zJQnOeLQSIk5e7bIw3W3NcmjjqcdBcJZ+55jKfHjuuIGSv
 ikZgeQNT/0YtlZgjC9lzIAAm1ZuXMkmfTn1FnZ92C+xmc4GueXD1J8Rb0XSuvsplTMdrKt6t
 Fegt00t+frbTm0Rd6C1K3NbzlMbjnUunW7Suk0qZZS+YI+3YEDaKXzYH/t7jVg2h57EeLf0G
 U5a45/6KraOoBuc9cJEhgptWYBpZCqFg8TrgfyAuUCZlkjgH/QAsOR79Pz2M4SK3zEgDG1BE
 KW/CJc9crURiev1bYVDKQrPGRdAXJMnkhKzaend4fKDh+tePwG1F2mMmWleLs1ctnJJZwg6j
 J76cqPhemZam7R3x3RpyJyJuZr/3y8Sc2/RCKKFuggya33BX28xo+r6tW0ljH5VH+SbFkZn5
 RMcQgoVft44wNSxLEf42yVUaz4okUsjltY73VGrzfWq/abyVaeO1pHPw3fiohRRh9JPBGz/J
 z4zdQ=
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="41777567"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8c8wA9tuzMpPUH3vUK7Oli0BmooeTUtPN8M7nykxT1iK4XtRsJ3dLkedaFzs1lx0vJeVFcH8XcRYBXDk+OUW9qi8GlbW5Up/OdaPNy5BlN0Rlq0/t5qc/peAzzzVefq4Pgs5wft2SVsV/gvUNdq3WVBqoCRA4nSBbbtnwBW7tzTmZfItZ6zzMqI0vxjbDIhZjInEgIXzf43TRhdAYZ50yBCc0N2bnygZ8PKz0pRDogC6UkHAC/pxxxOIZS9DDVQLp7HrqW/D/eCf3z76oqFNAFW6L0Z2jdYC2XmPDuzUClE7HWwL+Mu40Y5vZEAgtSHFyheStF/npNH9FEQVm+NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGJeBm3UaA8G4RqQ+ge9B57rYVXALhNtPu9waKz7J74=;
 b=ByTLiDczHFvF7AIuCTJqmPGlyezABMQ97D/Vw1j/NGBT+dGFikC/z6GWjVcKtN3na/fvZ9olonDAh9BJE6h5WqcFIo/e4uB/A3CtC1JBrWubxLtW5T4g5gLn8IBo1Wr2xtNnZJSaH0lx+W9TmbwvjzL/rfSF4Kaza9LV6dxAJuw3PBzcct9entel6jdxPvvP3gHhbBUmeDZ8bfR1WF7rNYFheRCEtJfHK8UN216m5pAOmDqNw/7ENkNs/38SIL57WEnOy6tb3yTpkTGHeIUti7NyNhYyXb9flnXQxQcoPaKAeU6PMXCBzbsOFUVPz+xEZT2wTf5tz3OhkNRYb2d0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGJeBm3UaA8G4RqQ+ge9B57rYVXALhNtPu9waKz7J74=;
 b=S62tCxLDqRWNZRQxXSxii6A7HxEWWmjJ7M1qw/zl9lpNM/FetjmaFCoLvpblTz5QlDEJYYie6itnRR9hE4com3oel35fZVnhikBk/H/Ys4i0x1xOg+kXvo/opCHYAkAIPqUFn9Hlaiosi/4JQztK3uLyrWezL2vqyO6Xje4JMPk=
Date: Mon, 29 Mar 2021 12:31:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <wl@xen.org>, <stephen.s.brennan@oracle.com>,
	<iwj@xenproject.org>
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
Message-ID: <YGGsdd01M4HarxQc@Air-de-Roger>
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: MRXP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 176038c5-a60f-47ac-9c0a-08d8f29dcd6a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB48415AB4B7B9F2090A72407E8F7E9@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: myH8/DrX/ho9kdcycXcqVrrPi35LgHLdCFyiwLKKnRUD4DDOCI5C9jFLel0n0iO+pndp96pb7KcUqAJhO3fM865DrkIokwBDhEEwFWEw+WGymprUFYhosw5UmT4/v2wKoLsZQTPK5sDi77uGFHx5if19I4Tkda4rwzrOc9ovIoA4dc1MOXQ2TKqWZ984KsYgSIN9LJEfmKOclx0Ots42vTfqrVhUTeMRjFc4ybWCcIwnH0UnrZvF0Yn+Zz9WXusfQlEmJC2DlIiFkqZ/cjmLEPctTeopeSkTrdaN+EkJdtJsnc53HYeXHfIKTd7MobPVP73MBTQyfh8d2Br56dMhXYugAworOZhWCRXuNDm3M85//+qVhsIQgBXiKWPAEUmX9E48RRfff6XwkrwCPF8LtTLvgWnWVSDiOCFTgiT1DiVrVSEsmi50iQ+q/B4WHJ8LfKKYrxyKkhaTb/3MKAK8DCf4DvK0Nudi08p5mvX7sCFDwECD7gYLxMhoKUSn0qDxrKgOVrUxQBckmjrQTBe2zb+w0aVeSNuTcT3YcuvM47+RcwnTRTs6kpxIdxI315Nw3H7bqSNFUg8/TJuWeETCrwGBBaSePJCb7ufxUJMaSKwvVtRTC3GtU4edTQNRQv4LVZeFiVfYOX+/mGEP47i3F3RdcvRec6DWFfMOpN4El2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(4326008)(66946007)(66556008)(956004)(66476007)(478600001)(26005)(83380400001)(9686003)(86362001)(8676002)(6916009)(6666004)(316002)(8936002)(6496006)(38100700001)(85182001)(5660300002)(6486002)(16526019)(186003)(2906002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTJzcnh4dlVTd0dHdDc4K0x3QkI2RWE1ZVdDeVRDeWkwbm1Jb3JOelNVS2hQ?=
 =?utf-8?B?bGFhcXdqTi9DdGIycW9DaVpNdXVjbDJhYlltOExCOStTOWlEM0NuMlR0eDRD?=
 =?utf-8?B?QVYxdXRqMks0ci9mdU5VaFRmSmM2NzlVM3RickZXQ3JFajBldDE3Q3dNbEtR?=
 =?utf-8?B?eTY1R2JvTC9MVlVUOFJPUmZHQVJSZEtsTG94ajg4WXhEZHlETnFFTzgvZ3Ar?=
 =?utf-8?B?WGRIN2JNMWVwdHRGQUVqMng4eTIzc1dsV2lTeFp5OFE0N1hPNTlvSWlBNmdJ?=
 =?utf-8?B?aWVIZndXSWo1aXRITHBFbEFQNEhnUlZWTTZVQ25aRFlCZFk5M3JKT3h2a1Rr?=
 =?utf-8?B?dEQ0UFJHalJsUHE4TFRxMjVYOXVBVkcyTWhNUXJtVU1FS2toUmRNVFllaDNE?=
 =?utf-8?B?VjI2NzFtRUNXb3ptN3l4TnBtZ09aKy9JdGU5bFRqL1pTR1pwSC90YTNYRDhq?=
 =?utf-8?B?K1N1dkRKeUE5bk5WeitUWnIreGExZVlmaUxFSitPYW1nd0QxMXBndCtyNjl1?=
 =?utf-8?B?Zzh2ZzkzK0hCT211OFl1SUFTRGUvdDM2cHVYK0VoNXpRdXBQOHhLZjNtSXF3?=
 =?utf-8?B?K3c5d056YzhEbHoxY08zUGRaQ3Zock1aN2lPU0VJVDI2cEJNVGFSTVZRSUVk?=
 =?utf-8?B?ZWtHeGh4S2pGVVdIMVR0MnlUSVU2WHMzd0k0WEhxV1p4MjZ0bUgrb3lubW82?=
 =?utf-8?B?UmxHQk92SEgxSjYwcU1LQVp1L1FmNy9QR25ZbklDYXlOWktud3VTQ3Mwd1dr?=
 =?utf-8?B?cnBKRjV0SUJSQXFBbHNsL2ZUb3QwcXNNQTI0dXA3Z1dkeEx3RDR3UkIzTFpv?=
 =?utf-8?B?MWhKUDNxZHlxL1lEMUtIZkdYL2JWOXdUNm40ajlJcmY5VVpkVjlRcHpnYlcv?=
 =?utf-8?B?Smx4Y05IK3VSOW42MkRBUFpQZ1pPSDMxb1lKZU1KN2JjUGN4RTJjMk9ZUHdS?=
 =?utf-8?B?dEtkWUN1WHphMm9XSmZ3aFQ2ZElJVmF3S1p1dEdpUFlISlpRK1ZNekR3Q3RD?=
 =?utf-8?B?U2grbmxYV0JlMkVveU4yc2pBdlBBQ3JiSCtsODBwMFVXdWIwTVBxSUVtMHh1?=
 =?utf-8?B?VFhuYlR4NWVlK1cxbVU5ZHNkSUJEOTNBRFdSejNJS1JyY3M0WGljbmt5MExr?=
 =?utf-8?B?alhIbTcyWXJ6aE9NQjhMNy9sWTRLaXI0VG5LTlgwYzR1UEdSaDhwMjg4NDRS?=
 =?utf-8?B?T1Y0ZENZYi9wMUVSaG9hNWozaUpYN3ZGbE5lM3pSZlNIZzZGNHFUR0RrQy9S?=
 =?utf-8?B?UmNSM2VOd1pNbmNmemxJdlVsM01RaUtXOXM3d0dKU29vZ0oxVFYwQjVGaVNv?=
 =?utf-8?B?bWRTZ1NTRnRScnA5dDdCVUpKamFyRy90Y3dlWklPS0JkV1c4b2Y4VUR0Y2pu?=
 =?utf-8?B?WG9VMlluL2xwdUhFMElhdy9XSEJYN2txUWFRc3pSQWhodlV4dHQ2bndiZmVV?=
 =?utf-8?B?SjJUUW4wRUdLeGFHL04xWDVqNG82VHVKMmNVZWEzdXJZOHRPem55V0wwdllM?=
 =?utf-8?B?cVdYMjBTb29ZYjE4ZXk3bnFTd1JicE4vWTh3T2VORVVKN2ZKZWM1MGJIOXo1?=
 =?utf-8?B?ZytqMGNxdjVrVnlqejU0QmZkSm5CNGgzSlBYVjIyZXpoQVY4a1FMZjllMmQy?=
 =?utf-8?B?Y0dhZ2FOMXhpWGRQek13V2VSMFZocVZ6ZnFodGljdmVTc0RoNEYzL3NXOWUr?=
 =?utf-8?B?TlVzL09tVGs2czRLOUMvY05LZ0M2NUNKYlZGK1pVbTk2cG1MeHdBTVI2MEY0?=
 =?utf-8?Q?gKQv4cP6zYecqGeLj2FR3IRS+/Ix/uMLopPfToy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 176038c5-a60f-47ac-9c0a-08d8f29dcd6a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 10:31:24.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E/aEzcKOG7y3vcnyOJckRSTci/FL9TJiDrCZAG5LkuCYjHXF7V7skEoHu5ZHzwbBiROcIsSvVTysdVz1kblDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Fri, Mar 26, 2021 at 09:51:06PM -0400, Boris Ostrovsky wrote:
> Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
> vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
> intended to protect periodic timer during VCPU migration. Since such
> migration is an infrequent event no performance impact was expected.
> 
> Unfortunately this turned out not to be the case: on a fairly large
> guest (92 VCPUs) we've observed as much as 40% TPCC performance
> regression with some guest kernels. Further investigation pointed to
> pt_migrate read lock taken in pt_update_irq() as the largest contributor
> to this regression. With large number of VCPUs and large number of VMEXITs
> (from where pt_update_irq() is always called) the update of an atomic in
> read_lock() is thought to be the main cause.
> 
> Stephen Brennan analyzed locking pattern and classified lock users as
> follows:
> 
> 1. Functions which read (maybe write) all periodic_time instances
> attached to a particular vCPU. These are functions which use pt_vcpu_lock()
> after the commit, such as pt_restore_timer(), pt_save_timer(), etc.
> 2. Functions which want to modify a particular periodic_time object.
> These guys lock whichever vCPU the periodic_time is attached to, but
> since the vCPU could be modified without holding any lock, they are
> vulnerable to the bug. Functions in this group use pt_lock(), such as
> pt_timer_fn() or destroy_periodic_time().
> 3. Functions which not only want to modify the periodic_time, but also
> would like to modify the =vcpu= fields. These are create_periodic_time()
> or pt_adjust_vcpu(). They create the locking imbalance bug for group 2,
> but we can't simply hold 2 vcpu locks due to the deadlock risk.
> 
> Roger Monné then pointed out that group 1 functions don't really need

Roger alone is fine, or else it would have to be Roger Pau (Monné is
my second surname).

> to hold the pt_migrate rwlock and that group 3 should be hardened by
> holding appropriate vcpu's tm_lock when adding or deleting a timer
> from its list.
> 
> Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some nits below.

> ---
> v2: Drop per-periodic_time spinlock and keep pt_migrate rwlock (and thus
>     change patch subject)
> 
>  xen/arch/x86/hvm/vpt.c        | 40 +++++++++++++++++++++++++++++++---------
>  xen/include/asm-x86/hvm/vpt.h |  8 ++++----
>  2 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
> index 4c2afe2e9154..893641f20e1c 100644
> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -153,32 +153,43 @@ static int pt_irq_masked(struct periodic_time *pt)
>      return 1;
>  }
>  
> +/*
> + * Functions which read (maybe write) all periodic_time instances
> + * attached to a particular vCPU use these locking helpers.

I would replace 'these' with pt_vcpu_{un}lock, to make it clearer.

> + *
> + * Such users are explicitly forbidden from changing the value of the
> + * pt->vcpu field, because another thread holding the pt_migrate lock
> + * may already be spinning waiting for your vcpu lock.
> + */
>  static void pt_vcpu_lock(struct vcpu *v)
>  {
> -    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
>      spin_lock(&v->arch.hvm.tm_lock);
>  }
>  
>  static void pt_vcpu_unlock(struct vcpu *v)
>  {
>      spin_unlock(&v->arch.hvm.tm_lock);
> -    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
>  }
>  
> +/*
> + * Functions which want to modify a particular periodic_time object
> + * use these locking helpers.

Same here, I would use pt_{un}lock instead of 'these' to make it
clearer.

> + *
> + * These users lock whichever vCPU the periodic_time is attached to,
> + * but since the vCPU could be modified without holding any lock, they
> + * need to take an additional lock that protects against pt->vcpu
> + * changing.
> + */
>  static void pt_lock(struct periodic_time *pt)
>  {
> -    /*
> -     * We cannot use pt_vcpu_lock here, because we need to acquire the
> -     * per-domain lock first and then (re-)fetch the value of pt->vcpu, or
> -     * else we might be using a stale value of pt->vcpu.
> -     */
>      read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>      spin_lock(&pt->vcpu->arch.hvm.tm_lock);
>  }
>  
>  static void pt_unlock(struct periodic_time *pt)
>  {
> -    pt_vcpu_unlock(pt->vcpu);
> +    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
> +    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>  }
>  
>  static void pt_process_missed_ticks(struct periodic_time *pt)
> @@ -543,8 +554,10 @@ void create_periodic_time(
>      pt->cb = cb;
>      pt->priv = data;
>  
> +    pt_vcpu_lock(pt->vcpu);
>      pt->on_list = 1;
>      list_add(&pt->list, &v->arch.hvm.tm_list);
> +    pt_vcpu_unlock(pt->vcpu);
>  
>      init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
>      set_timer(&pt->timer, pt->scheduled);
> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>          return;
>  
>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
> +
> +    pt_vcpu_lock(pt->vcpu);
> +    if ( pt->on_list )
> +        list_del(&pt->list);
> +    pt_vcpu_unlock(pt->vcpu);
> +
>      pt->vcpu = v;
> +
> +    pt_vcpu_lock(pt->vcpu);
>      if ( pt->on_list )
>      {
> -        list_del(&pt->list);
>          list_add(&pt->list, &v->arch.hvm.tm_list);
>          migrate_timer(&pt->timer, v->processor);
>      }
> +    pt_vcpu_unlock(pt->vcpu);
> +
>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
>  }
>  
> diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
> index 39d26cbda496..f3c2a439630a 100644
> --- a/xen/include/asm-x86/hvm/vpt.h
> +++ b/xen/include/asm-x86/hvm/vpt.h
> @@ -129,10 +129,10 @@ struct pl_time {    /* platform time */
>      struct HPETState vhpet;
>      struct PMTState  vpmt;
>      /*
> -     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
> -     * mode in order to prevent the vcpu field of periodic_time from changing.
> -     * Lock must be taken in write mode when changes to the vcpu field are
> -     * performed, as it allows exclusive access to all the timers of a domain.
> +     * Functions which want to modify the vcpu field of the vpt need to
> +     * hold the global lock (pt_migrate) in write mode together with the
> +     * per-vcpu locks of the lists being modified. Note that two vcpu
> +     * locks cannot be held at the same time to avoid a deadlock.

I would maybe word this as:

    /*
     * Functions which want to modify the vcpu field of the vpt need
     * to hold the global lock (pt_migrate) in write mode together
     * with the per-vcpu locks of the lists being modified. Functions
     * that want to lock a periodic_timer that's possibly on a
     * different vCPU list need to take the lock in read mode first in
     * order to prevent the vcpu filed of periodic_timer from
     * changing.
     *
     * Note that two vcpu locks cannot be held at the same time to
     * avoid a deadlock.
     */

Thanks, Roger.

