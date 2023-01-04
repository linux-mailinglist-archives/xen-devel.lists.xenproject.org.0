Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FE65DAE9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 18:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471359.731184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD7Bt-0007YG-CT; Wed, 04 Jan 2023 17:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471359.731184; Wed, 04 Jan 2023 17:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD7Bt-0007W3-8V; Wed, 04 Jan 2023 17:04:37 +0000
Received: by outflank-mailman (input) for mailman id 471359;
 Wed, 04 Jan 2023 17:04:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD7Bs-0007Vx-0y
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 17:04:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2089.outbound.protection.outlook.com [40.107.14.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc43f200-8c51-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 18:04:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9676.eurprd04.prod.outlook.com (2603:10a6:10:308::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 17:04:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 17:04:31 +0000
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
X-Inumbo-ID: dc43f200-8c51-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPyu6UHebCGyvPMdGlvnMEOnCDrvTE0VjL6ZB9MToYvCOMmiOr8T4r296TNmDVAdTo9yq4wNhBQZCNuNlHRbevMjX6FWpYGIK9G11Ent188TDy2cLu61byLLjJ/oGb5HBMiDgUI6EXWowexnIf1EMzoe3twddbIpK+RGQUJ1+xaJiFZKQ1mBZ9cWlZWllbX6LTzPCt7CmMLgrdtoLdkdbP0eDUJQzaXq0qNIXMr7J5ec9i0i9Bodt6CMnFJVhihdhF3OpHyWaeWWr4GChZpyUjCI4kL+U2nTqDX5aBqeBw+uFjw2ZFwFp+HdpnSbdR77JUeMLjXx0Iklfk5PsTmgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTxVePJt05zGmcAekCz40ZmvpoevLyoOtQJxIKsCzm8=;
 b=E0vNktuH22uBUt5578eWUBpsB0n8QttkP2ZI/s84JPB0tDgQNN7H4mMyEoazdaeoRWnVQB/7SWMXsqFvqlE9SnlIgdco5a1UI71dfAT4xaHJN3wpNr+PykVnlM0Ob8GG3I2VQ+wce+vf2SKOX0QR7rj1lXqiAMpwXA/BX8/Adso9gFDObWL5EVVkiwPu66uaEk1wFHZLZptN5Zx1o60yXQIBRCMex8JcYR7kQFzpdFeIj4V3m89EkmBxO5aKvLroKeO55nHsaZuwW2ptXoFGSMTKszXwku59qhUO01YaDeGcqzvVUA+WQ462PgVsBcRfeOuMbaQdQcDI4G+ir63FGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTxVePJt05zGmcAekCz40ZmvpoevLyoOtQJxIKsCzm8=;
 b=Sny63Sz/PpvfUFjXIIbGh1AoyCy2k0tXOXKfrniijkccUmGotk7lY4wQnx001USzfLHohpUxTvXPCdZWpfEK/qmvFpL2cWeKaSBkEOf+aMKfyD7mpxUPUfSjmEgmzN7bRRSFyBpCOAq7lIQQWt74+zwiwtrHU0JCK4wWVttRtAVf3VSV5/mK4MZi+LdRAsTsM7Edt3W6B2u1ybymH50iRZsb1+oXA+iExVCuAJ5uiyQbjGamYhXDJCyshQ/GEbE2jgBoBM5d7njKuZRG7II//YHTpqqgAFWZv5FRNXhssiDnYd6D8YQTFiIQE49D1f5IYjsCYsqyTsMV0AlP9VOxOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0cb9c83-dc4d-5f03-0f65-3756fadfde0b@suse.com>
Date: Wed, 4 Jan 2023 18:04:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230103200943.5801-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: a85aab11-6941-48cd-78aa-08daee75bee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MMUfiKKMjf9g2sg6L3bMGYcH8OxT3stgJaBjqVMQslzvgzAJZdrKe3lvUo9MpKSyJEl49dAEq8JGq2PGtu4PQedWJqJICa70+ymQ2xWtQzuYWUu0SEDHKaKsYBBMzkPLhSMwjfSubnljX/wPZqq5dSayrAQkHpGUBQ3E5k2fUKbg3bWdH1mSYV/pq2XMJhtkDe0brdz7wSmpiJSyJxPqHqprp4EYW72qF4rrxzALnNr5xU2rBL4JWcyEsug1dUadbT0ky/YB3fTuI6HGRSazU+j62nWeBCDzo5BAM3Uv+97d2yYxplAUPLEVlWTZ5MHgBqR05E1jtKN5sKnHufZOgV77dqpamsEAcKMgQgBac69XTADbGozjC4Jmb5LaIHyo1AKCyvfldYXZMtrUrGC2/CKlOIveg05nKWUBOOvguwOLMFSZrhmmauO9T+NYQn0qygj6/xkIMYkoFaas6cZeYQOMSd/kinZOXnbhNEVf0z7Lmc+MVp37SEQQrrwIxiudRCiSp/1NDZKGYlmjlkSNdI5VgWdrdtBBzeG1qcDpDqJi9mG4XpjvrHhdisCPNvLLsytjlW6mLBrESg5gIZZ4HhxZv870DdvQBZTljdP9I2j+PsmfzoBenXSUlYmiR9d3y+7MtuJTleeTjyqIIiNsELMIChKaJQoCKK5Hkx0OxTPRvGpzjS1oe0XTB8xaScvLng4MkIELXZq33ppesTGD4wxcMOoWvQU7fcVWpRfFuK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(5660300002)(2906002)(8936002)(41300700001)(4326008)(478600001)(316002)(8676002)(66899015)(54906003)(66476007)(66946007)(6916009)(66556008)(6486002)(31686004)(6512007)(26005)(6506007)(83380400001)(186003)(38100700002)(53546011)(2616005)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTNTNlBmLzE1cTVvSDcvZ0ExTVFUN0dCc0p0NEhRSUErNVVkSkJGemsvamFM?=
 =?utf-8?B?WUhlSFVUeWhQamlUclFBeDBPWGhPZ1BlWlJvS3hSTXZnUFAvTFNiN3FrTVhh?=
 =?utf-8?B?eS9aZHNEbzUyQk1FbzRBMExtSkVxRCtES1JsYURGSStlR1ZkclByY0syeG9n?=
 =?utf-8?B?RlNxVlpLdWxrdnlNMTRteWdHaHlFR05ZQlBLU2xJWDdBMFA0SHpYb0l6d0l6?=
 =?utf-8?B?U3paamQzS3BHN3hXU2VpWVJMbU45ME1qQlZzYzFXbDVTT2hVenBVLzZobnZT?=
 =?utf-8?B?NFp4SE1CMXAzaWdTeFM0MGJjK0tVVGNmMS9tclJ4dUdwQnF6aFVqazNvS1lP?=
 =?utf-8?B?bkQ2c0dwRjhyYkxqWitjZG5BTVJsQ1VVbFFxMHZYUVAwVEZmT1daeGFzeWZw?=
 =?utf-8?B?UVFJNFZTUFlCbktDMzNndDRoTDUvM3grQ29ZbVE0ZGYxMWpPdWhpb3V0YjVx?=
 =?utf-8?B?WjJFTjFIdFN0ZGdUdzBjOG4wQ2NYcGxUOHk0amp5M2d1eVR0Y0FNbVozNDlN?=
 =?utf-8?B?OGQzbHlrNmFpRFltRHFjSTFQRWhXUnFEQjRrbHhyNDVibmVOYUlJMkpueThV?=
 =?utf-8?B?Mno0V2NoS2VCQmNtclEzajlCNjNzNUU1MW4xdXpkcVY0a0Y0ZXp3ZEx1Y1ZD?=
 =?utf-8?B?bEdJTnJFUDFHdDNkQytOdFFFUHNpanUvWGtTR1J0dzZESWI1eGNzVWMzcml5?=
 =?utf-8?B?MnBPSWxNWHVNaStnVVZuNVorSStWcUJUeW1HTjJkaVMzZzQ3VkJhTkw4aUJv?=
 =?utf-8?B?ZFU5V2EvT3BReEdkTFJHOUhkckUvUy9YbU54MmI3K2o5RzVWSmVhUFg0dW00?=
 =?utf-8?B?ZEVPTm9rN3R2d2Q4OCtIMmZiQjVUVFRMNzZuNEJrenBzT0dwK3FOaHRWNHVB?=
 =?utf-8?B?emN6akp2UHFVK1lKSFpJUHVMMTFqYzRzb0NidFUveWlrSk53UW4yVnhWajRy?=
 =?utf-8?B?Uy80em9jRGtyZld3NTBIYUx4RTdLMDRxQi9abVh4MXFObjhSS2Y2Ylc2U3Z5?=
 =?utf-8?B?YWFtb2J3QVI3MnFIL3dZYjlLN1prWjg3cGlOblZQTFpmOFlON08ybnVVTC9u?=
 =?utf-8?B?SDU1dnpvSzdrUWNCMXRLTDUxU21heVVZWFF1aFFqVDBvSEY4c3NBdk9IbGxy?=
 =?utf-8?B?RUh3OUVYajVzTytlMGtOSkhVeDJsa24zcS9RZWU1elhJcytmTTU1MDlPWWEx?=
 =?utf-8?B?MWNic3VpUXRVb25GT2F0K0p5S3JWNGpyZ05SWGdNWDJhdGpNamJQUVhBSVU4?=
 =?utf-8?B?d2V2R3hieTBZUjBFU2t0aGszQzZOSkZMTjN0eHBESWIxN1lVMXJxTzdZV3FD?=
 =?utf-8?B?dng2UUtNYXhoRWlUKzNhMTIxSDUyK1ZDSWlQZTVVa2xNSnBoQkk5c1dzZWdI?=
 =?utf-8?B?alUwcmdpemFyakxtQ0VwQ1hNNEpFVXh2ekMrNjgvZXFoY2JweTlxdmhEVTN5?=
 =?utf-8?B?QVJkUjVkSGZndUs3OVBweG1qRVd3bGV3cFBtZUVKbWt5azdlU3B4SGtyKzZp?=
 =?utf-8?B?OUZKM1ZSa284UWphVXBuZm9PUXQ2Q1ptRGhlaGlrR3JhZ3FJUU1iN0N1V1pZ?=
 =?utf-8?B?Y2U4WjZ2NW5QN2NVSW9lY3lqWmZWOGx2cXdCM2dCNGVCQzRLZEl5KzNPQVFz?=
 =?utf-8?B?ZE9iVTdpQlB4ZUs1T3Q0cUdwM0c0NWtRWmtDd04xT01tR0dxNW4wRjhKTFRs?=
 =?utf-8?B?MGlMbzNyTEVuQ0Z1dGxsM1N0UXZmdFVneE02eTBWVStyU2VYYTBsWHpZbTdX?=
 =?utf-8?B?ZnBORFJKOVQxRmh0NkIxVjNxdXlkdnM3ZVFTOU1FQjBqTUJVSHJtdTFmb1M1?=
 =?utf-8?B?SXRjdUlZb2xJRjF6UFVxdStaZkxzbkE1OVFkTTRITkpXWGVnQmNOdmVjYlVn?=
 =?utf-8?B?ei9aeEJuRVVVeUVSTFp1V1JOdEtpQlhlSGhwN1c2RGNlaGJOdEczNDcvbDlw?=
 =?utf-8?B?WndpWFA1MFNaU2xaVzVmaDc2NHR2U0tWdkNIWUJ4ZWc1eEFycnJoelN1SmRk?=
 =?utf-8?B?cHA3cXRycGg5a1dydVplRTErcWZtL3RJRTNoSmJCOHJnbkdsRENMNTlsZUJk?=
 =?utf-8?B?dVZmbEFCQlRDMCtwblptTFV1Q2tsRnE4R3ZQSHl5YWZ0SkZlNnIxeEd4c3o3?=
 =?utf-8?Q?zoGubOIaoj2w0WvhHd56dG1lD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85aab11-6941-48cd-78aa-08daee75bee8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 17:04:31.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMyhFq+BNHT8TirD4HgWUM2NNjbHyskQCtgpKWnsKSIgananpBHJGmQI9igVr68rrpBrXxceWKE5iJ0Y2vT+rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9676

On 03.01.2023 21:09, Andrew Cooper wrote:
> Recently in XenServer, we have encountered problems caused by both
> XENVER_extraversion and XENVER_commandline having fixed bounds.
> 
> More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
> array, and using an unqualified 'char' which has implementation-specific
> signed-ness.

Which is fine as long as only ASCII is returned. If non-ASCII can be returned,
I agree "unsigned char" is better, but then we also need to spell out what
encoding the strings use (UTF-8 presumably).

> API/ABI wise, XENVER_build_id could be merged into xenver_varstring_op(), but
> the internal infrastructure is awkward.

I guess build-id also doesn't fit the rest because of not returning strings,
but indeed an array of bytes. You also couldn't use strlen() on the array.

> @@ -469,6 +470,66 @@ static int __init cf_check param_init(void)
>  __initcall(param_init);
>  #endif
>  
> +static long xenver_varstring_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    const char *str = NULL;
> +    size_t sz = 0;
> +    union {
> +        xen_capabilities_info_t info;
> +    } u;
> +    struct xen_var_string user_str;
> +
> +    switch ( cmd )
> +    {
> +    case XENVER_extraversion2:
> +        str = xen_extra_version();
> +        break;
> +
> +    case XENVER_changeset2:
> +        str = xen_changeset();
> +        break;
> +
> +    case XENVER_commandline2:
> +        str = saved_cmdline;
> +        break;
> +
> +    case XENVER_capabilities2:
> +        memset(u.info, 0, sizeof(u.info));
> +        arch_get_xen_caps(&u.info);
> +        str = u.info;
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +
> +    if ( !str ||
> +         !(sz = strlen(str)) )
> +        return -ENODATA; /* failsafe */

Is this really appropriate for e.g. an empty command line?

> +    if ( sz > INT32_MAX )
> +        return -E2BIG; /* Compat guests.  2G ought to be plenty. */

While the comment here and in the public header mention compat guests,
the check is uniform. What's the deal?

> +    if ( guest_handle_is_null(arg) ) /* Length request */
> +        return sz;
> +
> +    if ( copy_from_guest(&user_str, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( user_str.len == 0 )
> +        return -EINVAL;
> +
> +    if ( sz > user_str.len )
> +        return -ENOBUFS;
> +
> +    if ( copy_to_guest_offset(arg, offsetof(struct xen_var_string, buf),
> +                              str, sz) )
> +        return -EFAULT;

Not inserting a nul terminator is going to make this slightly awkward to
use.

> @@ -103,6 +126,35 @@ struct xen_build_id {
>  };
>  typedef struct xen_build_id xen_build_id_t;
>  
> +/*
> + * Container for an arbitrary variable length string.
> + */
> +struct xen_var_string {
> +    uint32_t len;                          /* IN:  size of buf[] in bytes. */
> +    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */
> +};
> +typedef struct xen_var_string xen_var_string_t;
> +
> +/*
> + * arg == xenver_string_t

Nit: xen_var_string_t (also again in the following text).

> + * Equivalent to the original ops, but with a non-truncating API/ABI.
> + *
> + * Passing arg == NULL is a request for size.  The returned size does not
> + * include a NUL terminator, and has a practical upper limit of INT32_MAX for
> + * 32bit guests.  This is expected to be plenty for the purpose.

As said above, the limit applies to all guests, which the wording here
doesn't suggest.

Jan

> + * Otherwise, the input xenver_string_t provides the size of the following
> + * buffer.  Xen will fill the buffer, and return the number of bytes written
> + * (e.g. if the input buffer was longer than necessary).
> + *
> + * These hypercalls can fail, in which case they'll return -XEN_Exx.
> + */
> +#define XENVER_extraversion2 11
> +#define XENVER_capabilities2 12
> +#define XENVER_changeset2    13
> +#define XENVER_commandline2  14
> +
>  #endif /* __XEN_PUBLIC_VERSION_H__ */
>  
>  /*


