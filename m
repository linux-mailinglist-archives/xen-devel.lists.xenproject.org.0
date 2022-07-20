Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542557B2BA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 10:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371461.603388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4vm-0000E2-Ue; Wed, 20 Jul 2022 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371461.603388; Wed, 20 Jul 2022 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4vm-0000Bn-R7; Wed, 20 Jul 2022 08:19:42 +0000
Received: by outflank-mailman (input) for mailman id 371461;
 Wed, 20 Jul 2022 08:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE4vk-0000Bh-To
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 08:19:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b32a47f0-0804-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 10:19:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7923.eurprd04.prod.outlook.com (2603:10a6:20b:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 08:19:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:19:38 +0000
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
X-Inumbo-ID: b32a47f0-0804-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyEXuDD6RnCpn7gz+8xQjhXMaru+6hfV1sBNj200eiw8H8hczmCjMMpq7R9/S7Gr42EzaKjbV45ZVBN2pu79DJFWKf6lM4gHZOO2PuAvyBIKZTRW/+dDgTkZUiSviYhfQe9oaZBtEmfUjBmdHDcYPSZ//mZ8qdRUiv6OCw9UxcVKBozQgOKXz3BNL6IHEffLYGCPbiuU5/UsJ9tl+mhFvlAnbttu5jECKA6K+4ENbz0szj6BIm5Yhxw72OCBJJjfSHizSzbPqclQwBoW0shGPGr1ZZASfmwfK9cvELSoZxjn6AzgX4D/bb8c8vDC4i4vUkMFpZqJ4uwSCxrLkczWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3qwqajteK8X3OW0YwCJ1++ZMwIZAiGjw8tuRQcVOKA=;
 b=oUc8oQIX96jcwQc3C8Tf13/wOOWN6wKTlNyl5YyWRr5JfGPDXm0QrHsZap5RBTYPL6p0+zdL3n04qkJZo3mRtmXbTZ+Mz1C9Hvpnb84bot47RtTl/K7N2KYnVgXgDpU7/p1Rlqjp/9saOyK660fO17HpvzpkaT2MQsXAKuggS2GR7HN8b2wtNt4HiU1Tt3wczsDzHr6ZJd9dykqma61mIPlZk60XZ2wGMlUs5vOpWNL040Os9Zrm0S1OkViFoEGgZaFwjFGcXlCZ6Rvaq2U0ZM71edoFgJxjwzYZIdEwn0lanHWXGJOXr/hFwf+WhdLur5ETMjlxkRs9CmH/d+qQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3qwqajteK8X3OW0YwCJ1++ZMwIZAiGjw8tuRQcVOKA=;
 b=E2kVhg2PzM0tsgVeDfLlOfvxlt196dP/mljumJ0Cs3IusH5pux8WUvEB9D5NxuzRCC5fdedDN00Va8AWuCN24ayxTEtPBi/frooir0ZN6IEcNpQin507EQoLLK7urjEbA5FuwU80DsZRLeLj09U3KAN1ODxCULP5OvIqUIBd8v+WQo/0w60jy6bEZrfuCgcVPoWj43iqU+HeoUEo3ukvkjD11j5h1XIINeqX4KAjuSM6pyaXs3CI3ar5JDYN/VZ+nlMpHBbQK3PtXrMg4UI2nXBondpDuKKOyPanlP1wt3ySrSTwnjtNOs2yNjwmkFLobsBQt70su3iDnhTNy9l8nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
Date: Wed, 20 Jul 2022 10:19:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Content-Language: en-US
To: ChrisD <chris@dalessio.org>
Cc: Michael Young <m.a.young@durham.ac.uk>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37de2691-2a16-4d9b-c942-08da6a2896a3
X-MS-TrafficTypeDiagnostic: AM8PR04MB7923:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yVLVQ5DCLEFDR7njv8eRvQwQchW/UIGufGhxsygo6tW4YyJsgxc597aelcWxCUjl+1UKutXMxsZGwA2C3CWmRQabX13oPYJKzU3LjCe/3uSUgErsso9zA4o9GSoRBTu4AXdvO4LJVbDXPsdSharA+vjMThHQ3rDwHThBuJ7H546f8jVA5w+nr8N4JHTOVY+wljzIzoQiS3dqPeOelZL5CTLxvtGOdGYljuoy1MFHwc15DLXGFzw4Ysf1yIVMZHE1wx5XW2UDTSuog2ttH3U3t+mR44EbXy7Nyrnn4liEGCnmCWm9iWdtLaN6dygCL29xsfGEjLNn47jD+MvPXu9m437yOqwsHKYron/IoekgROgmjdjhmtdgERN2DPiU1kimY3O94OxQjVH1CxJriqGgyWikVZfzRcYDkmWbt7WIJmsbR4W66iDN14YOirJi7raQCy7r3p6+KNmcIlAyHQran30OoP/d7CKey0MvZISw+3kgz5hQ7du/EHUvAtahz0vQ0KYz8X0Wo49y3palNFtEmD1yiPS35a7UpsByeip2ECnPgkev6dRq2NKtUkgkjh4QmA5dYrPbKSm0Sxyz/cmst+CNRWZAsSuDRxF5g/L8Yfn1jPxo2szTssXKRFBpH9JmRcWhcq/dr2XGL5WPHw0x+7SS9gJHPS6YqYqOmDGYCMLTJP8e2Iz+tAGs7ah3BGgN1eWCENoXDaLnBBGs5ww1D4mzEh+xTnGfTtkcVLAvHF9p6HENb+FlhlLmyWyCGIl3EAEMxgdCMR/qhjhtJSuAOSKU7YuJIUrLqyt+ojlXce8WBlO6YwzHyaugRUmJlbWcVoRLBDrly8cWxD1FKms/2aecuJ13vVLVQ1Zuj/ccaYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(376002)(366004)(5660300002)(6486002)(6512007)(86362001)(8936002)(2616005)(6506007)(53546011)(2906002)(478600001)(6666004)(31696002)(4326008)(26005)(31686004)(41300700001)(966005)(83380400001)(38100700002)(36756003)(316002)(66476007)(66556008)(66946007)(8676002)(54906003)(186003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk5yTzh3ZS9xVEgwZUVZMmhwMFhCTFp1VjlpcDNwemliSXJDS1JqaTczbTVS?=
 =?utf-8?B?ajJYeDRnVTR6UFkwb3AwN0lhNFJGTmMwRlFNdDAxanpvZVo3TC9tMHgrMk11?=
 =?utf-8?B?UzRZSi8rTll3RGxKeGtRMzd1NnAxQnVqRXJ5RlN3VnpIODJRWFZlL0tRc1p5?=
 =?utf-8?B?QXhGTlE2SzhOZ21PR3JxUzVjSldENzdSUVArSDBCNmx5d1A4dDJlb2lxTnc4?=
 =?utf-8?B?b282Rlk0WU1GUzZ4UUw3SnpMWEVLRHRDREsrU0FsN3psUG52dEpSYzZQMzZy?=
 =?utf-8?B?VjI0anhKMjVIWUpSSFI2T3FZNEJLVDFJR2VoNVkrdkExdUM4K01kUFRUUFRP?=
 =?utf-8?B?MlNQR0V2V1FOTFlYdzhQUy91NmpWNkM4VjRFVEZUNGRuQXdlSzhTK09HS2Va?=
 =?utf-8?B?WVFpQktENW9yd2ZZTXk1OVpXdHRRQStsbjB0OEF6K0NYb24wSEFmK1NaQ1Zh?=
 =?utf-8?B?ZTlYbW5qMGFvNEl2MlExUFE5SG1RVmU2Q1JxNzBPZ0FrajhFWDc2QmMrS05S?=
 =?utf-8?B?VmRmRUpGbVdINnQ0SGhuVHlTWVMrWWtma2FhUktWNllndnVncUdIZEdXSWR0?=
 =?utf-8?B?ZlVtMUZuMHhvME9OY2ViOWlZVEFXdkM4QW1ONUsxZFFucjVJWDhKOVJpQjVG?=
 =?utf-8?B?dzJxQk40c3ZVMnQ1azkxaUVUd1JlMTRoeHlkdWtvYjZpYjgvOVhhZHVsSVBn?=
 =?utf-8?B?MUZBS0t1SWlaYVZ1MXBSeTA2Qm1DbCs1dy9jTWQ4T2tibHlxYTl2ank2Sm8z?=
 =?utf-8?B?RlVKS2ZybVVTbkF2YTJuVitUU3d6QXk0YkRGRnYwL0hKWlJ0WWFvaWRwOVZj?=
 =?utf-8?B?Mk01V1NDR3hVTy9WZkc2eEp0SVFMS3JWUkFsczYzYXIva0FBUFVjSFR6T3hp?=
 =?utf-8?B?bnp6MFJTYWNTK2NTMGxBb1ZNSGZLdTI1V1NJZmVoWWdxR2Z3K3kzODNhMXhx?=
 =?utf-8?B?Q3ZDcytiY0h2Rlc1cFdiVjkzdjA5cGxic2VKVVNLeTMzS3oxVUlZeDByMkVP?=
 =?utf-8?B?d3hDWW9NSnZmVG9yU3I2VEtueitDNkpRdlNTR0I2Wnc2YmFNbXpQRFdlcEtQ?=
 =?utf-8?B?dE1hT1MzQ0lQbDBhOFBNQlBibzJROW1ldE9iYmIva1dGT2E3RnpyL0h1em5o?=
 =?utf-8?B?MUp0emlraTA0U3AyMmFMV2xKUU4wRXFQUkJHVzZqdUtTeHJYVk1GTGJndGQr?=
 =?utf-8?B?cG9DZnlRVVNianRhVlRQd1EvVmlIVlpMbEZOQjQ4aGp3Y3FrV29GdlhQS1Rn?=
 =?utf-8?B?ZHRMV3RQU29rZzJWZnNFK0tsdFJNZmdzaGViMDBxV0FTeHlaYmRJV2lSb2ZJ?=
 =?utf-8?B?cWRaMk5FRUQ0QlNqditpejlCOXZLV2JFbXlyamRMNmluYWZTb3NucVo1eE1j?=
 =?utf-8?B?WElFNTFUVCtVdWRKd0MwczROZWRhT1RTKzJnREtIanN1Q1RKZCtoSXRZdmsv?=
 =?utf-8?B?NVp2aWFoZCtUKzNEU0FXUFZlMGpmVlBHNngrZXI4MW8vZ25nUWhwUStnRnZV?=
 =?utf-8?B?VUg1MHU1RDNESFBxZ3N3L0pUV2wzRHJuc2drc0xBRk5zSjlpR0VCM2t3WmxW?=
 =?utf-8?B?Smg0T1RyTGZhaXJpWWFCek9yRERmYm1GZXpjMksvUVE0RFE2cVdONFM3NlBy?=
 =?utf-8?B?UUorT0V0U2FhN3BzSHFNbUxOZThZemI0QzdwUjM1MXhlQnpnZ1RHM2d1T3Rj?=
 =?utf-8?B?cU5TR09QbUJuU3IwSm1BRVFLTm9wS0RlY25nTElGUkRXWWxLcDBsbUVPN0M3?=
 =?utf-8?B?RUQzaUUyZ1NjeE1vKzA3OUdEOFR4bXB3aEwwdktiSTR0RWJhek4zc3BRYi9p?=
 =?utf-8?B?em5wQ1pRb3dwcFhNZjVEZmNvVC9hQnFvTTBaNXdVZXRaOEFFUUVDU3J0ZmZY?=
 =?utf-8?B?dHR6V251WXcyc21lMERCRUZTcjlDN25LcmFlaC9jeDY2Qmp4eW5mOG9GVEEr?=
 =?utf-8?B?TzhWWDRyQitFbkFmRWxCYUZKVERzc3BqenRRZk9RT3VVeHNwWnU5c0N6MjJY?=
 =?utf-8?B?ZUprUVlQNlVHY1hYZ3pWSllZK0xHQkN4d0N6MGszTmJwaDc2MTMzUHUvR1ov?=
 =?utf-8?B?a0FDcno0a0tGY2VXN1ZzUTVUY091TlBHcFVjYjNaaHpEZldoUDVFb0x0VjNQ?=
 =?utf-8?Q?eJ/E6WdE5YHtewxlTw9cEyuNP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37de2691-2a16-4d9b-c942-08da6a2896a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:19:38.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRQ8n4oK0HUqzl2/ZvfPm3D3FOntxFrG70STGL26t1Iq8iIrpnLsopf8zeG9WH+4zOS+gV2OndUn2AxHm8Amfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7923

On 20.07.2022 06:48, ChrisD wrote:
> So, you think it's a problem with fc36?

Well, if that's where the binary came from, then yes.

And btw please don't top-post and please don't send html mail
(see the almost unreadable stuff below that was how your mail
came through when read as plain-text).

Jan

> -------- Original message --------From: Andrew Cooper <Andrew.Cooper3@cit=
rix.com> Date: 7/18/22  6:25 PM  (GMT-05:00) To: chris@dalessio.org, xen-de=
vel@lists.xenproject.org Cc: Jan Beulich <jbeulich@suse.com>, Michael Young=
 <m.a.young@durham.ac.uk> Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #=
NM[0000] On 18/07/2022 22:31, chris@dalessio.org wrote:> I am trying to run=
 Xen-4.16.1-4.fc36 on Fedora 36 on a brand new Lenovo> ThinkStation p620, b=
ut I keep getting the following error booting the> Xen kernel.> > Panic on =
CPU 0:> FATAL TRAP: vec 7, #NM[0000]>> Version info:> Name =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: xen> Version =C2=A0 =C2=A0 : 4.16.1> Release =C2=A0 =C2=A0 :=
 4.fc36So https://koji.fedoraproject.org/koji/buildinfo?buildID=3D1991182 s=
houldbe the binary build in use, and looking at the debug syms, it reallydo=
es have:ffff82d040439c80 <amd_iommu_init>:...ffff82d04043a00c:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0f 6e c2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 movd=C2=A0=C2=A0 %edx,%mm0=
ffff82d04043a00f:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0f 62 c0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 punpckldq %mm0,%mm0ffff82d04043a012:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 49 89 87 c0 00 00 00=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %rax,0xc0(=
%r15)ffff82d04043a019:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41 0f 7f 87 d0 0=
0 00=C2=A0=C2=A0=C2=A0 movq=C2=A0=C2=A0 %mm0,0xd0(%r15)ffff82d04043a020:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00So hardware is correct - this build of =
Xen is nonsense.The binary is also full of .annobin_ stuff which appears to=
 be some kindof GCC plugin for watermarking.Michael: Any idea what's going =
on here?=C2=A0 Something has caused GCC toemit some MMX logic which is ulti=
mately why things exploded, but thisprobably means that some of the build C=
FLAGS got dropped.Thanks,~Andrew


