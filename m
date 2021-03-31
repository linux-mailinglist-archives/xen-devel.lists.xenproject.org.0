Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451E3507EA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 22:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104057.198593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRhAX-0000U2-Ok; Wed, 31 Mar 2021 20:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104057.198593; Wed, 31 Mar 2021 20:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRhAX-0000Th-LT; Wed, 31 Mar 2021 20:10:25 +0000
Received: by outflank-mailman (input) for mailman id 104057;
 Wed, 31 Mar 2021 20:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRhAW-0000Tc-83
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 20:10:24 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9df1e0c-024d-4da7-aa4f-8e10a55dea1c;
 Wed, 31 Mar 2021 20:10:22 +0000 (UTC)
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
X-Inumbo-ID: d9df1e0c-024d-4da7-aa4f-8e10a55dea1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617221422;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B6GHuyVmMhiSJNcskPiK0lbFVY0nsWzhpHNVDXd4y1w=;
  b=iPig2xyQTpLMlVkWaq2Zp+rimtQ5xyy/or236dy7lxmxMmqniMySe6Ij
   Zy0IbYes11YvVY5nnJNT+EnBjaUI0PNjbIKXiw5vrKc17xIPOqWQ/TtZp
   VNxjK7zikDHkh/UwV+aJQt12/hjZwYWyUfz+WYS67BOaT0awpa6ENnsbz
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZlJ77bSq1IiLsy8msoCCjKzWWs8hQwUU9oFk247V2EVEWoa1fXWh3bnptF3jUeJ4lTh/RKoinP
 Ux9cfPwEhJV8c8p2JMT38kL26QMEqaxD2w2qM9IKIiknaRcDsYhiVWT+AwsGvnupstpEKIjm1Z
 2cOMnO5u0qMLNR4yS6su/Im0JOQE56EeGjjD4Jsh5Xd9YIhmkpmTFV3xqBYH76DjLpjhedUDmP
 aMmXsK64dMEbqVhdcyV+2FHrG/R9pqSKEmEuC9uDKDBi11FwNJsHcfmU0pww+VUBgtm4m+fzoS
 mIM=
X-SBRS: 5.2
X-MesageID: 40592358
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HXv3P6hHyfTw/MerL5dyPtqS73BQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40592358"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiPb9oxl2lUR/VJgyMiBEk5Jjl7p7zYlDLVpMHe8rAVLaooIpqFlDIbssL1+C4XyKmSmXd/cQDaATVXcogSxInHv/JZTnhldDskS3khwtg8HDEyRfAnJPWC8W6NdOPw46mUh7nYq2ooHIfhMz0WxrqTRBhTNAf8zlNBZgah/VLDtaxQ3CSOlg0Ok1I0LAuj/onEYiyWPj/sqwez/27TTEiE4gf2rBY8edog3bR/YokRK5CzI8CrsEm4pTkDWFBPX+li2t/lyqa3uD1vS0E7Vgq33VLYzCaa3t6pAlGHFIbtQEoVOhub/Rfwb0btJmyyUC6++R6njiknhATpgPtkuMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29YlNYnM2DdZ+kxuHHV6vjXlNq+Y15PLPSQmAkLDxyU=;
 b=bSPXZfILyXkj1zcpWDintGqsplLd6WiELjy21OYPbTfPZUSp8exKZa64XH3tZQljA5lq35o6WU/1aAfp9/gasWPBEyqPCI13HwHuDm3rhSUd0Ed5je5zUHi/fJWRyj2aNv0M13BXXUT/u74kPHjL5VixdrlKLW+PSM8XSddYr7blIAtUsfm4GIw00OmW5pClE5UJiPz35Q/vligntd+vky5GymlQqqbHo/5WV3g1FNw2pCxoSN3WJlx9u9QotJxJtq27S6QKu20f78Ry0QryxfSoLqs4z4eQ0jjk/BEnI9pt3zH033J6jPxDTzauYgEo1aMagdmVpDjVIFPoA7xc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29YlNYnM2DdZ+kxuHHV6vjXlNq+Y15PLPSQmAkLDxyU=;
 b=o5rZHibsXebY/sFx/H+jgbOr4j3rnRzuteuXYh0R6oevbhOOKm1OLfaQhnQo6PUAxQMWuD0PhEw06Inf2+t0YC5UoyZAuZ2Cl/KyWLrVhP53N2dwU7SRXr3N+XqNCgm6UJvY+wpjr2mFHjttzV0v7x1Yo1t1NfKXA9DfAvPgUbU=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-4-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 03/21] libs/guest: introduce xc_cpu_policy_t
Message-ID: <7f52bd98-24fd-95ba-f8c6-05a331941b49@citrix.com>
Date: Wed, 31 Mar 2021 21:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a7262ed-d330-455e-dbc7-08d8f481014a
X-MS-TrafficTypeDiagnostic: BN6PR03MB2514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2514C28DA31769A8E4B6BB0FBA7C9@BN6PR03MB2514.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvxmBcic+4PqIiUxI6TFUMo6WtfDmoYQQBPTUXSn5L3wVR7Qi9nddqRXyB/HFRSLZ2P9Vsx+WLDQoK2TqPqMJc2rjAo6+kw3QR5xHMBOZs9SoZBOQTX1pHt/S1LCogqtKaJu5JHzSbY2EBEcbpdBjU5ujvQhrCA2zBnja0CkZk9Eg9Mu5XqgrSgQtZvhYmlfYz5ApFkRljpO9iTTNHVGZD4tieMsztrc1jQ0i1YGA58QpcIq2LOT8IRj+uHMYqtCUsh7DlAXKfCWtI+XHGODkDnecU6HoNnQTbria9G84YkwAY2ZK/VBugMD9rRKeWTNKXpOZC6JnTtg/pg4MSmqTD3hev/mvgEIaWhJ7KKLojPNcoC+pDrDPnFzMM632k7zfXRzRM1+74czjz0Wz+Woov/d7krj5yiXKUff0MwfXJi1B4TolNpyteWlj7UJb715mk9FunKFPeNJ1/tOkczlpeuY+1m3+18rW9smdzkf20etJNzKAp/+K6WaPLmYzPBuYfN365d0cqXlt1Jvd9oLEqekrX6mEoV7iI9HBeqgHtDmUvTYBbTPfALQvLfFzDcPhmBhfkXPZIGXhij7fqlU1uz5ZoKtNjn8E71aOk0gvz82Bz8CvsAxLZ2N7RTLFx1XoWpPJSEjpIJBzgfCNf2v4itZJ7Tdt9FDAcf8XdeoEDM0PVTbKEigUG+bgYrZdAwEC81THlpfVW9qr6EwvifKqZkbG0+Zoeg9LiMU4ZAv20U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(16526019)(36756003)(186003)(2616005)(956004)(6486002)(31686004)(16576012)(4326008)(478600001)(66476007)(66556008)(316002)(26005)(54906003)(5660300002)(66946007)(8936002)(53546011)(86362001)(31696002)(8676002)(38100700001)(2906002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnllV25wSTA0bkI0ZlJSeWtuZWRLZDlqOEo2Qk1relY4Skpmem85ZkVONXZJ?=
 =?utf-8?B?VWpsZXZsMmtmVFlUTGRiNWVCcHRhUkM3Q3NWK3lrWXNrbytJOHdBNFIyTk41?=
 =?utf-8?B?Z0F2bjJ3NlFTc2RzM09yTnp2a05Eb3Nha1dla1dmSmRIb25BQk5Ud0xvRE01?=
 =?utf-8?B?WVJyTWlJS21INjc2L293L1RVN2dHQWlzMFhOWEJrTTE0RHp2OU5LQ1luT3F2?=
 =?utf-8?B?SFA2WlNDbzIxV2p5WDdlV0dLenQwbmt6dllrTTRZc0EycmozVURzTkZvUFdY?=
 =?utf-8?B?ZjlRSy8xdkp6b1pjRjk4cnRWZ0NNKzJQUXlmTW93ZkJTN0o3REk1Um9wbDh2?=
 =?utf-8?B?MmR4cTkrdmNiU0dKNUdxZEEyTXZHUEFzcnQ3dmkrQUI0NDNjVFdjWEdFdkdu?=
 =?utf-8?B?TDdQdDF4YVl3MVRtenlPbVlPMWc0ZnBzMmtnWDA1Smt6YWhvald6eStJUitn?=
 =?utf-8?B?a2ZUV2tXTTBvOUJuR1AxTUlsQTZUK1ZyK2djYllsWFQ4WVdyK1V6bVhEeXUz?=
 =?utf-8?B?ZWVPdXdGcTYxRndPV0hvRnJQWXdxYXZEUHhnRzVuTDlFdkthVDdRQUVoRFRY?=
 =?utf-8?B?SW1sNzh6MllhMm5zSlozMWRJTEFXUnNKUmFDUVp4cDYwd05uWFd2eXBINGhp?=
 =?utf-8?B?WERnOGNkamNmQmZqaVlubzBmNnZ5YU9tei9FM3NOSE1sUUhlVURQcXJHbU42?=
 =?utf-8?B?aEMrN1BxeTNzZ3hJckRLWnkwMDIxZGp6VEJWUUphT2pUZEhwZXVTNERJUDZi?=
 =?utf-8?B?dzcxNkNxQzc3N0xOZkpvVC9lQ1BnNk85dUZtcSszeUFiZGJWMlI3QURVVXFY?=
 =?utf-8?B?QUVZV3RVeEpXRWlIbnQ1b2drTlI5OHJyalFBMjRPVXZuSVppYTRFQ2REQWNI?=
 =?utf-8?B?N2dCMW4vVHVIa24wOTIzSVBoSmVJNy9nYURJY1VReTZJNEdyWUc0WHRPWlFN?=
 =?utf-8?B?S1NENmcxS3pRL2x0bWRKK0tpVktZTlE0SUxyVFVRWFl3dVBPQkxoK2xjV25v?=
 =?utf-8?B?Z0YxYlBBTE40Nmp1WTJlOTZwemJlRnZCazMxejVtZUhQL2FCczJDbWdndHpM?=
 =?utf-8?B?WHRXTUNHZ3d5bUM0YzIxZTlqRkMxNVpQYVJlWG81aXhSSkIrUG5PQlBublZl?=
 =?utf-8?B?N0RVUnBFc01wR1BoYlhuM0hha1UzT2hhbTRTV3Ixb0lQQzA2dkEwaCtFM2dN?=
 =?utf-8?B?QUw4VnYxWGRXNnVzSGxQczVPVnYwTkF3dTJmSEpuUVdLUjNHQm82akhPSEZp?=
 =?utf-8?B?b0VZMW5DdTZKQmRpUFBGU2d1TURhUmVqcVk3TDhjN0UxM3NTekZ3RE9TalA4?=
 =?utf-8?B?ckd5d1pPT0dmLzhyOWhOUDIwT2UwSkhNRER6anJGbEZLcW8vY2hZc3FzdHho?=
 =?utf-8?B?WHRwdlBpa2xxcHdXZFVCc2dBaDk4ZGgwcGR5WmpVOC9lVDQ5c0I2YjJHYmRD?=
 =?utf-8?B?QithRHVLcTBGQ1gvc2MyZG9TZDEyRlM5UWRSa3FTNGhFQUdZTXZDaHFBWXB3?=
 =?utf-8?B?YUNyYlEzMEVmcUQyQ3YyamwxNzhycWRveUVOaHk4U0pZUThzRjVRc3ZmVmxl?=
 =?utf-8?B?Z3IvaG43T2UwYTZmVGhFZ29qUUdXRTk3N25JN1BUcllVMWZqREZMZkQyQTdV?=
 =?utf-8?B?NmVkUmFSRU42TG9YQ3pvTTF6UDFyZG5mTmt6QWROblI3MVJaMjBzOHRQblkx?=
 =?utf-8?B?b2RwOC8xQ2dGajlPM3dDRzVneHhhT3g5NDZDaTZtUjNoU1MxU0ZXa1gyaXB4?=
 =?utf-8?Q?VL94mx2QHHBBM8my0wk2ujpZfuApDYAn6NBdSBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7262ed-d330-455e-dbc7-08d8f481014a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 20:10:18.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vw5nEBKeO678Y8xXmwvzV0703MLhOgghR8i3F9bwalD82qGau5gvUdypxCGGPE5zqyXJrpuenEJvaTMq7dHu6P2SjdZZq4lPZUv4yyS6+R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2514
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Introduce an opaque type that is used to store the CPUID and MSRs
> policies of a domain. Such type uses the existing cpu_policy structure
> to store the data, but doesn't expose the type to the users of the
> xenguest library.
>
> Introduce an allocation (init) and freeing function (destroy) to
> manage the type.
>
> Note the type is not yet used anywhere.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/include/xenctrl.h         |  6 ++++++
>  tools/libs/guest/xg_cpuid_x86.c | 28 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index e91ff92b9b1..ffb3024bfeb 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2590,6 +2590,12 @@ int xc_psr_get_domain_data(xc_interface *xch, uint=
32_t domid,
>  int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
>                         xc_psr_feat_type type, xc_psr_hw_info *hw_info);
> =20
> +typedef struct cpu_policy *xc_cpu_policy_t;
> +
> +/* Create and free a xc_cpu_policy object. */
> +xc_cpu_policy_t xc_cpu_policy_init(void);
> +void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
> +
>  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
>  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
>                            uint32_t *nr_features, uint32_t *featureset);
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_=
x86.c
> index 9846f81e1f1..ade5281c178 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -659,3 +659,31 @@ out:
> =20
>      return rc;
>  }
> +
> +xc_cpu_policy_t xc_cpu_policy_init(void)
> +{
> +    xc_cpu_policy_t policy =3D calloc(1, sizeof(*policy));
> +
> +    if ( !policy )
> +        return NULL;
> +
> +    policy->cpuid =3D calloc(1, sizeof(*policy->cpuid));
> +    policy->msr =3D calloc(1, sizeof(*policy->msr));
> +    if ( !policy->cpuid || !policy->msr )
> +    {
> +        xc_cpu_policy_destroy(policy);
> +        return NULL;
> +    }
> +
> +    return policy;
> +}
> +
> +void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
> +{
> +    if ( !policy )
> +        return;
> +
> +    free(policy->cpuid);
> +    free(policy->msr);
> +    free(policy);
> +}

Looking at the series as a whole, we have a fair quantity of complexity
from short-lived dynamic allocations.

I suspect that the code would be rather better if we had

struct xc_cpu_policy {
=C2=A0=C2=A0=C2=A0 struct cpuid_policy cpuid;
=C2=A0=C2=A0=C2=A0 struct msr_policy msr;
=C2=A0=C2=A0=C2=A0 xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
=C2=A0=C2=A0=C2=A0 xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
=C2=A0=C2=A0=C2=A0 /* Names perhaps subject to improvement */
};

and just made one memory allocation.

This is userspace after all, and we're taking about <4k at the moment.

All operations with Xen need to bounce through the leaves/msrs encoding
(so we're using the space a minimum of twice for any logical operation
at the higher level), and several userspace-only operations use them too.

~Andrew


