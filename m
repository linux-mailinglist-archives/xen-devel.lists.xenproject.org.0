Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E946401F98
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180190.326739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJOr-0002lL-1i; Mon, 06 Sep 2021 18:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180190.326739; Mon, 06 Sep 2021 18:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJOq-0002iY-Uq; Mon, 06 Sep 2021 18:31:20 +0000
Received: by outflank-mailman (input) for mailman id 180190;
 Mon, 06 Sep 2021 18:31:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNJOp-0002iS-B7
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 18:31:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a00a8fe2-0f40-11ec-b0b5-12813bfff9fa;
 Mon, 06 Sep 2021 18:31:18 +0000 (UTC)
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
X-Inumbo-ID: a00a8fe2-0f40-11ec-b0b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630953078;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8cVMSSNJXfkVJJAEzk8daSd7j4AUn+dcJl/UkByNwW4=;
  b=ILqVKZtmchjMuajH10PxIaNDcKCvA5XhwLsP9aTGG421mzUYyXt6JkxI
   yV5EnYe7C28URzDQ4KoQnL9d3/LYrtuVhcSOscFRJiHM75QegNpmO3jLA
   OOdpyERrOOlqbcq2GRS3fz194kjf52DKFAeXcy2a1XUgUDEI2JANl6r9S
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f3l083uFU2Pk3PCfh8bZTRZZkEJr1TAghVd2Qds3PcS9aZydkc7hSGIgAfpN+ADcCypXcj6BzB
 hAFqmkCxg+NWgJaNECHrLiMa2Yy/0EMjzNBd6GAaC9MRXj2HNy9yudc7rXhg3T969k+REy6lCF
 e0T2PFBG8pDXi38jy3PKWfUftAj6P7em3DY8Bc2nDC9D3Zp85FZjrTIDS23BOHOfweNz/0mY6m
 3XvGqfZ+V+xUIiwoM93KMMN88RlcZrnf65ryGZiN9gyErKQLkIE8iGYsEoE2hX/rHq3D114UaS
 CdXmpda65LNNHIyBLcJK3QBY
X-SBRS: 5.1
X-MesageID: 52507244
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6q6oeaMOWHKamMBcT1P155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/exoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyZygcZ79
 YcT0EcMqyCMbEZt7eD3ODQKb9Jq7PrgcPY55at854ud3AMV0gJ1XYINu/xKDwOeOApP+tdKH
 PR3Ls8m9L2Ek5nH/hTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2mdfVmGZ6VMt1xCPdfOla9NC4kD1jiVmgPNJt3cU4l+KSHrYnc2omRCeo1Jd0J6c
 z8bG8=
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52507244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwa9ylUfSuABZrSS4VpoSNl8yzUqMZFvQLdcnji+e7Z4yYxOTjomuz+gLD8XwjBZUYFLlw6DCM49OWNf7IeIciCrNG7H0YAGHM/5leksFZ4FtmzTiO+ChYA0gRty1tZODKDjcNIHC/LAe9HiqfTxrfnK4EH8ReqSJf0oVurJCDWHRPh9CxPyuvChpZhc74MtAN/RDSQfJPS09HKncGBHM6JXK867EOWFzH3YjwouQKM/5klr66W4+QSKnqVYDmy5Kkv1ETusf7IZJJpJLt07PF0DFFLOL+weG+TRZCE78CM087X5gPgYUdXALNHXsDp7LFbouVccxicmtARACx4Cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UygBNLCUMU/3ZqHyK+ayd1mRTwySTUAf+mwn1mECLiE=;
 b=CSSVsWFQk6N3WwQGZemL4ItwcNOfTYDoPBsq8CK/wiArGQ9xZP85j7XN1QHeo+JkN5TdfVJFE3CWkiBRpNMYPRrH4c8uD9GkLJMpeQmPhNw1E3Rl/rz4pukuXXjfeoIwYbsxHBDB1I/oHfk1z2k2+j3xzHXtPHv0g+8GHLfBqotOlX35tVMVBb8ZwYb714m6TwFJsnr4MGT8Lid0oVVf5GnTX/h/zv4UCO6vvORQoG4yoCNiSz8HdN1bE8ZRWtsFkCEqtckbcNeF4MWWvqn4zsPtM464XYs/1ViQEvSboW7OCbLAAL/3G0JOxIesbcIncyMP9gbxeGSrfkNqsZSsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UygBNLCUMU/3ZqHyK+ayd1mRTwySTUAf+mwn1mECLiE=;
 b=H1L7UWXsM6V4y6upF2osuLaLzEZVcTuD4eyaO0jpF7LE3BwkjyErma9wJiGwKyVJUD3ZVMkvKgPGkRH9Q9FtncARmnWxb2PZQHpgQ6M/H1xKfNzulvc7RV8DEzJLm1jkSZL5wYVKk7GB7TN9mC6t8qTRO809NvTnu8fvd900Odk=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-6-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 05/11] xsm: refactor xsm_ops handling
Message-ID: <6924c3ea-de14-60e5-d3dc-eaff6c228f1c@citrix.com>
Date: Mon, 6 Sep 2021 19:31:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dba57e0-6047-412d-26ff-08d971648152
X-MS-TrafficTypeDiagnostic: BYAPR03MB3670:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3670B3BD362C2134D712D0F4BAD29@BYAPR03MB3670.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dT1eH4rIP3aS86VlDkv2x5BJ60C/cH1bVZw+toenIapafmdyTK5v/m6cil3uDwYU0XW7v+Jpms3TWwCKnc0j2G9pJUQt+EMgPV8xwEnKNcEJP2xK8x6IS51rAIxH2gAP1bH9sado7MBTUFatQs9v2PhmOfe/dWwEnqsyH/EpOAs7WO0OIl4M5/7IAbiucc1tOZBxA/pTsw/Jx/NpSaHs0o0CSEgINk3Gu2EP8yOvzCOYF7CZEoRg+gGNbGgdWI3JW2jA+HPrcnlaHi+nnk5vgHbQhWjN3n9ldlA18j4cRUFv+s/eWpQqHUCuDSjUtexJ8/4YskW/OsrKQbzC3WQbiWtj6pYOs4/M+o4teEQuc/L23N+ICVdktLtXZSus5lM3KgvwVp45lr9MUObjLFl/KoCglQ9CAxSGX/geGeAVrQmssUN5FyNxCHAyQ0wFfaLO6JhSbEKKTZdTes/rxQYdqjfosG75cI6UgbR+Ewt2HqM7MoRzDcbaKtG0PfB6no+rcyv+YPWlTjCyGXJfRj0H5ji+UxcWMJqYk48KDVcTAZzk5N3E94U4jIse5Yfn7AxiH5hIiSCG3HzgZkLI1bp1Sw5NI1/Lh5COxnO++IT8dMB8P/pyhIQv1dgQ9TkZSIDcoSFqguV/fe3x++Nnc5jtIGRWUUaPxot1vau5eiTPmuk5PV4o+C9iFB1fANsuGuUR1tURv5JrazOLsvOmDg2BafvmUulwd42Kl2jIyjUG2p8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(6486002)(55236004)(31696002)(86362001)(53546011)(2616005)(66556008)(66476007)(66946007)(8676002)(6666004)(186003)(956004)(316002)(16576012)(5660300002)(4326008)(8936002)(478600001)(2906002)(31686004)(83380400001)(38100700002)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUV0UnRWcVovMWNsalFzQnB3MWhlZ2J5Rlc1cWdSSzBxZWU0aHJjUTBoVFAr?=
 =?utf-8?B?d21SVjIydXk1QUVWdmgrbGdEYzlDOGROeTJsNDhieXQ5VlgyTnAyRWdsNTJw?=
 =?utf-8?B?S1owTHRZRmxyMGRlK1dVR2hLM0F2SllGUG9ITDJZZURhaFVJVXo3eVpIOTNs?=
 =?utf-8?B?c1lsM1pJTUFhQStWZGNGWVRsV2crS1ZkcGJQTUREZ05HeHNMTzNlbUxTd2da?=
 =?utf-8?B?N1hpaFhPS2tuMURrU1dNMmxpZHVYeWsrajRVZG5KamtzSlNnZmc0SU1mL0tZ?=
 =?utf-8?B?TzdkaFlpcmFyK2FKa0pXdkpuY2Y2dThnUElwQy9GQjVNQ3pqSS8vR3cwTXVu?=
 =?utf-8?B?R1RBVFRjTTJqWVQrUlpJbWNVc25hMUpGN0Q4c1lMbVkreUpNZnV3YXNBYnhw?=
 =?utf-8?B?cy9SeTByb2RHR1VEUUViNGtoRHdyR040SnRxQkRwOTVHNW04SXBnS1N0T0xU?=
 =?utf-8?B?dDZqMjIzbm5ZSmdDNTdPTGF3S3pWd0JVcXNRS2ZhemNyOVNwdVZDMzlqcGpx?=
 =?utf-8?B?SE5XM2FId1I5K1BuU0NCZDdlTXhnbVRQS08rUFFJamdkVmR1ckZmNjZkMUlp?=
 =?utf-8?B?bnBpRm1aWmg2SWJUTUxKb1h1OWc0aUcrY09lQnhLUXlrcjBGRjJzNy9VN0o3?=
 =?utf-8?B?a1o4SjJ4MDVNS0luR3R2QmtOYlBLeTJDSFV3MU5UQjkyZFB5K1JUVWRMa2Rv?=
 =?utf-8?B?OUhqTU04VmpYQ05ub0M3aklFaGtYQ01RTUh4c3dpeURydUhxaHpBVkJGVEY0?=
 =?utf-8?B?eEwvSTBrajQ3dkozcUpvQ1BKQXF1TnBhV3NKVXFkWlZCSTZCbDlCNUtDMTB6?=
 =?utf-8?B?V2lOc3EwWVRkYzNzZHhIbEhnZ3g1WGNiQnVSMjJGcVBKNzVWS01xaHNWb0xh?=
 =?utf-8?B?b24rRE5XZTJuZnhlNmJKNEgvMTExODg5aXB1RDBaWVczbFJPREFGcHVwcnIy?=
 =?utf-8?B?NTVnR2pZeXZyN0xPWWF1andkaGdadEFpSmNRcGlBREVtWHBTYm5jTWk1d3Vk?=
 =?utf-8?B?bEdHK29DOEcrdEdJdy9ZRS91dk0vQ3pkUXBxQm1yWjFPWVZ5N2lqTlFlKzk1?=
 =?utf-8?B?ZENsWnhSNFRveDgvaU5DeXpwL3p2ZnRLVE9TL0NTcDV5aHVNY2x5SCtOMmRV?=
 =?utf-8?B?NVBoMjIrUFRNNDdiZzlSWWJwcEpFQXhVYi9VNjZUcE82OVhnb29ERmJleG53?=
 =?utf-8?B?Wnloc0JVLy9GVld4SDJTOEprNThVWDByQXgxbDQ1UUxSSGkwRmRCNkJ2M0c1?=
 =?utf-8?B?dTNsS1RGUEM4TkQrbzBpQlpZYnQrRmRJaVFYUERidGloRkl0TkRTdUFoTkFi?=
 =?utf-8?B?SXhkN0dXNkVzTjFldlhBeTlkWXgxd0FaM3hFZGY2MzNFSmE2U0ZmZlhSSUl4?=
 =?utf-8?B?RHNuU0hUL0ZrY21wUEhvYThhYXhuWjU0K29PYmFCcDgrY3orazNEQ2N2QWpo?=
 =?utf-8?B?aEZoQVJaa3p2V0MybklRbmJ5em5xWGxjaVVHTXh3MVYvTmlRMmU2ckJuU2FK?=
 =?utf-8?B?ajdWYmtaYk1yQllJaktJR1VhTm9LM29NNDExYXBMbmw5SUpwVjc4QitCUWhI?=
 =?utf-8?B?Uko3aXZrOXUxM04wd2RQVFR1Z3dTL0VNSEJGMHlkM2VJN01ieWFkMllKb0Rj?=
 =?utf-8?B?M1FxZGs1TnQyeXEyNm0xV2JRU3VWaVFLR3pGbjkzM0MvVFBXeS9xd1ZxRTJI?=
 =?utf-8?B?N3JiTm9OUzk5eUVqYmtIaFVJUXYxUVBWdXlLRkE4UENWV3lVZUlFSHlNSCtU?=
 =?utf-8?Q?PyNVQupjJsp1upH/dTCmWPxOppur4HzznyqVfEX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dba57e0-6047-412d-26ff-08d971648152
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 18:31:13.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 868MW9CBky2jNc+ruARLvLc5apMjSc72Ah+7sGhQ/frFMy1I92p9jUuAEe1gEtJaSLAnGnBGYF3YeiQp0x/bj/JBREdngnVqFwWQKS63/RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3670
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> This renames the `struct xsm_operations` to the shorter `struct xsm_ops` =
and
> converts the global xsm_ops from being a pointer to an explicit instance.=
 As
> part of this conversion, it reworks the XSM modules init function to retu=
rn
> their xsm_ops struct which is copied in to the global xsm_ops instance.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, some suggestions...

> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
> index 55483292c5..859af3fe9a 100644
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -28,9 +28,17 @@
>  #include <asm/setup.h>
>  #endif
> =20
> -#define XSM_FRAMEWORK_VERSION    "1.0.0"
> +#define XSM_FRAMEWORK_VERSION    "1.0.1"
> =20
> -struct xsm_operations *xsm_ops;
> +struct xsm_ops __read_mostly xsm_ops;
> +
> +enum xsm_ops_state {
> +    XSM_OPS_UNREGISTERED,
> +    XSM_OPS_REG_FAILED,
> +    XSM_OPS_REGISTERED,
> +};
> +
> +static enum xsm_ops_state xsm_ops_registered =3D XSM_OPS_UNREGISTERED;

__read_mostly, or can this be __initdata ?

> @@ -87,25 +88,35 @@ static int __init xsm_core_init(const void *policy_bu=
ffer, size_t policy_size)
>      }
>  #endif
> =20
> -    if ( verify(&dummy_xsm_ops) )
> +    if ( xsm_ops_registered !=3D XSM_OPS_UNREGISTERED )
>      {
> -        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
> +        printk(XENLOG_ERR
> +               "Could not init XSM, xsm_ops register already attempted\n=
");
>          return -EIO;
>      }
> =20
> -    xsm_ops =3D &dummy_xsm_ops;
> -
>      switch ( xsm_bootparam )
>      {
>      case XSM_BOOTPARAM_DUMMY:
> +        xsm_ops_registered =3D XSM_OPS_REGISTERED;
>          break;
> =20
>      case XSM_BOOTPARAM_FLASK:
> -        flask_init(policy_buffer, policy_size);
> +        ops =3D flask_init(policy_buffer, policy_size);
> +        if ( ops )
> +        {
> +            xsm_ops_registered =3D XSM_OPS_REGISTERED;
> +            xsm_ops =3D *ops;
> +        }
>          break;
> =20
>      case XSM_BOOTPARAM_SILO:
> -        silo_init();
> +        ops =3D silo_init();
> +        if ( ops )
> +        {
> +            xsm_ops_registered =3D XSM_OPS_REGISTERED;
> +            xsm_ops =3D *ops;
> +        }

This if ( ops ) block can be deduplicated by moving after the switch()
statement.=C2=A0 It's going to be common to all everything except dummy.

~Andrew


