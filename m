Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092E6CBBF9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515624.798681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6G2-0003AN-QM; Tue, 28 Mar 2023 10:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515624.798681; Tue, 28 Mar 2023 10:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6G2-00037s-Ms; Tue, 28 Mar 2023 10:08:50 +0000
Received: by outflank-mailman (input) for mailman id 515624;
 Tue, 28 Mar 2023 10:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph6G0-00037m-MN
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:08:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86fdd308-cd50-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:08:46 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8911.eurprd04.prod.outlook.com (2603:10a6:102:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 10:08:44 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 10:08:44 +0000
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
X-Inumbo-ID: 86fdd308-cd50-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlZiggdq47b3MIBhb39p0MNpOjiv7b1wi3a/QcVh7j/TmRdrydm/HJGAX0XgdPY9PTKSLvwa+DIzIZmofjkwDR2Ejaac2iXUzBYstg1mThcTJgE7+2Wk52anZwAxVUnkya5HhRz3teGw2b8yzmuQTquPrsSXEQji+pkf42ruMuKGmc1OiVLt+0KkaEiuBcE1h2/Tp5bCA6wmngezHQTadkeyM93WOEdoVNMu6P0CqBNaRgossXBS5vxJuuYPdoDs7ZKWiREXz81kMIxs9XP7bNyIShPaOCZaD1nHMp9fX89iI+5VFNcn9/rAKbTvpeUyT6jUrjxvIxHpXrFimdQXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6zFHA3w8KKR0hHfVv+GK0s4e+pE9WXzqKnnVmruR0U=;
 b=LysIyBfLhKmKIGTnnDcx2uVOZR4SHgi1OwQLZZSK/J51UDopByyJ2FUjnL7PM76IBm7r2hNCLtlvhG19ZqOTfGt+EXWEBHS6BL4tn/yQhiN99ZQA/6ibGlQ4kjxrSArntSLoFVD+TK/lDQPF/q2PO9kkxjWVcyEKSDKR5AsA+F2osqW2//uILVPBsjbaoI9A7rRo4mVOQQBaoKREuRufofdxUMDmFpVh/1tvMjnT/Lw0IDSHFL9YpEe7CYm+kTpdfSb+pKp7fPPr4HzWLwCY0OzqhsmIMJ4/uP6WveQ/fed+NMOpxJm76usc5sohMEjGqPbp2NlCUw0b8Hx6xmrmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6zFHA3w8KKR0hHfVv+GK0s4e+pE9WXzqKnnVmruR0U=;
 b=2QFmUXXLufRSSzqO2BFgo5dmYEwFdx6NcNz98X4FaiRS0w/fHBTae6cyRkKGx21JUtqlyOj6S6w3+FiYdB5fwo1Elly8Pzp2DxHvDllVzz4fEXM70FCScK8Y1cnG5b1InF87r15TbZHCDXfUea0oIVAajs7Bi78SOXk/9fdbAeZQ0JH8VofznSVwJRmdcNoLTfrvIphSCHcwH40tlQPGJpDsdJ6AAOReTCH9/x8k4q4imaXyfbK1BS3PvcIoqX7H5Twnk38+O87f+IPkvi5KK/+1nJ6jcgjhaIhsPF4hEmCQQDveK9FPN7p7ct9ILQpJHxP1m8NkEY6QPc9ImxxdMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
Date: Tue, 28 Mar 2023 12:08:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327105944.1360856-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: cab65a54-df25-4096-074b-08db2f7469a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQYLH4TuQ7tyAD8z0+mBoCUtZNUaq+Wr2QbknWWMFegBFgIcA1y5FzhS8ycd40SAZ1sHiPao77Y+SxSVWHFk33yqz/cKZ+9kaIFEwNDG2g4dL0OnVi8tzlnGXOaJUDP5xWoqq83xXknwbPW5Oqglsi7A2wHa3G/aapYWExcuWao5ed2BIyHHskoYZxbkpoLF4ua8kW+GSb+Xnz3QH3rRhJTpj1YGLViTUXBSsT3mT7KhLBSrcj1uxDoZr9K2U7yk2GNwuv0Do1LbA4aSwTAn8jPcb72VB1UjfOyKe8DQxscFYrhOoN89CzpqXzKPZVro/GrNQS9WWPiZyb/d++TnqBmDvUwBi+pNQw5frG/Fve4Si8Ur80+VcifjVQZ2dDE3WaOTtcbQSVl1G1rH3cya0IRLdOKELmjITUFHcGTLdy7Zfb0pW0qY5QU5rZkfQN+lIbQ7YG3CzDIr43ptrk11P8DG20oFFsrdEH4Sm/v3A8PEZf/DFXdF5CB5upRHZeuElitsgVyXKOBNUQCxhSS2oWYFc4CqwUljWYWHTrvE5AGj+m7Wg8FC0E6DydoA8CNJjnCJuc91PffOHQakZ48Zh/lpe932Zfpzri1ulDcXUMYQiY2gfAwMEc6pBM0+LwwfoWyoQEq8AvMsR3zrcxaeeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(31686004)(36756003)(186003)(53546011)(6512007)(6506007)(26005)(83380400001)(2616005)(8676002)(4326008)(5660300002)(66556008)(41300700001)(66946007)(6916009)(66476007)(316002)(54906003)(8936002)(7416002)(478600001)(38100700002)(2906002)(6486002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3lvTmVYRy9NRDZyOCtSM09RVlY2aHZEZnk4a2c2d2xhVk5WZTVtVHEySklS?=
 =?utf-8?B?eTNBYnQ2MTRRakFMYjlpVW4wMGlRUGxaQlQ4K0R5ZTY2ZUg5RXNZWDlQN1l5?=
 =?utf-8?B?cDM2Slo0Z0NkR2hGOU5yWktYUndLSlFpZG9iN0dpTFJUVllBRTNtWHRiaXI2?=
 =?utf-8?B?Nm1udFdqRUlZS2JBRmUwL3pqWFQ2a2l2S0NXSGoxZnZtNTRnUTQ3TEdySUI2?=
 =?utf-8?B?RU8vbDZ1QnloREpId1lzZjFjU05kSE8rbTN4dVJRT0sraDlhTnJrSE1rR3NU?=
 =?utf-8?B?SmtBUlZMWU5UQ003VlRVUXVlekUzNmFqR0RCcjI4UHpubWI4VmhnOEEwNlFh?=
 =?utf-8?B?aGdSR3Y1QkxOQnhicG0yZzJQVitpRVBRdzFVblZBd0lwbGYwcUVxaXloRlh1?=
 =?utf-8?B?c2ZNUUpoTml6MU9GZ2t1NUdKUkUrV2xtd1JXMVpCaHhYS0JUWFhzQmlxd2sr?=
 =?utf-8?B?WnlaTUFrckNZeFBBcmhLeEZrT0MxRkU4TXdlRFJYYmIxTnRPMWpGTks2ajgv?=
 =?utf-8?B?cjg5TllvVG5ZT1NRelFmZmJJajhVZHlXZzczVUptU0l1ZnUvRExqUzBRZTRC?=
 =?utf-8?B?Y1RzR09DUVN4WVZ2aTlTblZxSWdaWFcwN2YyQ01lY3pPVmQrUmtlYnpDV1dY?=
 =?utf-8?B?djlJRUpWQnJFaUlLWHdMQjU5L2Fwd3pQOE90RUwwZmp3RVkzeEJ6dndnVHlG?=
 =?utf-8?B?UFRvMWphU3NnYlhZL3U4L1VYbU4vK083UjlkM0tXay9ad0dUMWluMld0YlJ1?=
 =?utf-8?B?U21RVE9sc3pYUTNra0tNSFVscU8rRHRqbmJMSDJlS2lnUFAzMEx6cjdic2dr?=
 =?utf-8?B?SzBXRGdFV2UvWHE2SFM1TXVDVzdMYkprdllrdmNXZXArTTdYcGh1akZMK2s0?=
 =?utf-8?B?NTg1VXkxemlWS0Nlcm5YVng3cmhZWTlHc1pVdTJqa1hZTTJRUjFqRlJKT2hu?=
 =?utf-8?B?Tk1xbU9WSW95Uk0xRXJ2OHpMK1k3UFEzOEVRRjlhdXpIcklJbXRrUjVKclYv?=
 =?utf-8?B?dmhMRmd3V1BzSWFxUnFmV2xqL0xSVlVJdDRNQ0VBclJWaTJrLyt3MW4wbFI2?=
 =?utf-8?B?NkFka0p5bUVGdVdlTXNmRGMxZUVaVTdybHBjb0xWRFUxUmdDbG96RVhrOE9q?=
 =?utf-8?B?MWhaZVpINHE0Q0F2WUw3L3BobTBacmRXNzY0RitGeFR5UDhRanZDQWZPelg1?=
 =?utf-8?B?bkZtUlYzbjIzWjNkQ3d1ZjI1UUtrN2R4MXJZTkhzaHhlWUx6UFZKcm4vcTdm?=
 =?utf-8?B?Yk5keFJ1NGZ5Z1VkQTFJbGFvZHZkOXZuK2JRdm5BQVJhTXV4TE5CN2k4Z1JM?=
 =?utf-8?B?Mkd6RkVrR2dubDJYNXVMeUNqV0drOGs4bW1DWDFERWhiWHRsN0JPb1MzQmFy?=
 =?utf-8?B?Q3I3VjNyd0R3dHlmRlM5RGZhUHI0aEJzZTdpT0NodXA5Ym9rb3pwbmV3OUdq?=
 =?utf-8?B?blZCMHM1ZlJKUk5KS05Day90OHpNeDRKYkl4cUUzTnY2WEVuZE9zZjNLaUhh?=
 =?utf-8?B?SkFjZFoyalB3ZFZVOVcvZjRnVjh0S2ZqQk5RU2RuMndIakl4SFdNK0I1bTIx?=
 =?utf-8?B?bjlGQ0tSRzNUaVp6VDJEVlVQdVVUTkVPbWZDOGFxWnpwK0hRbzl0UEZSeURO?=
 =?utf-8?B?TWVzU1J4M29iZTY3Q0d0QkI0UXhxYjg4RHU1S1dmU01yRVg4RXdxeVBFVWRr?=
 =?utf-8?B?RkZlR01jczRmMUZSTloxdG81T3RnQ2ZtOElEd0RnQ3pHTXBMbUo4UHo5OFJZ?=
 =?utf-8?B?R29yRzNnbkJXbHNIOWplNTZ5KzdZZER3bm9RV25GbXNwcWFQZVNMKzlBdnI4?=
 =?utf-8?B?QXJKV0VYbmEzVDBUZGVSNG9qMlk4VjBPV2xHaENCYXl5RE12WnY5aUo0cVBY?=
 =?utf-8?B?S01iK3NwYncwWUk3cnJpQWlGV1ZnSWQ1T2dFRnpmMEw0WktVQUxtWWtYMnFX?=
 =?utf-8?B?UGVuckZGR0VPQmIxOGNFL0J1cWNhNmZMN05US091cER0M1dkZG8xc2FjMEtp?=
 =?utf-8?B?Y1ErZW0wTXg5Y2QybGh1VFRxVUR1NC9OSVF0czl5a0RPQzlPOFg1VEs0MFJo?=
 =?utf-8?B?WGxGWG1iaXQ2cFNCYVN1SGlRVGZtbG45Q3Jsd2ZuTzd6NHh3d2Vubms5U3NS?=
 =?utf-8?Q?pBE9YtZ65Sd+fjtXNi16VNzVI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab65a54-df25-4096-074b-08db2f7469a2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:08:43.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEPmP0675T4ITmB8Bs6RlYsix9ot9cXB8i8szZOgBYN70/Yop2VvlDdQVz7AvOHYBT7cNII1q1eltZJc415SdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8911

On 27.03.2023 12:59, Luca Fancellu wrote:
> @@ -838,6 +838,18 @@ Controls for how dom0 is constructed on x86 systems.
>  
>      If using this option is necessary to fix an issue, please report a bug.
>  
> +Enables features on dom0 on Arm systems.
> +
> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
> +    the maximum SVE vector length.
> +    Values above 0 means feature is enabled for Dom0, otherwise feature is
> +    disabled.

Nit: "above" suggests negative values may also enable the feature, which
I'm sure isn't intended. You may want to consider using negative values
to signal "use length supported by hardware".

> +    Possible values are from 0 to maximum 2048, being multiple of 128, that will
> +    be the maximum vector length.

It may be advisable to also state the default here.

> +    Please note that the platform can supports a lower value, if the requested

Maybe better "... may only support ..."?

> +    value is above the supported one, the domain creation will fail and the
> +    system will stop.

Such behavior may be acceptable for DomU-s which aren't essential for the
system (i.e. possibly excluding ones in dom0less scenarios), but I don't
think that's very nice for Dom0. I'd rather suggest falling back to no
SVE in such an event.

> @@ -115,3 +119,8 @@ void sve_restore_state(struct vcpu *v)
>  
>      sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
>  }
> +
> +int __init sve_parse_dom0_param(const char *str_begin, const char *str_end)
> +{
> +    return parse_integer("sve", str_begin, str_end, (int*)&opt_dom0_sve);

Please can you avoid introducing casts like this? If you're after an unsigned
value, make a function which only parses (and returns) an unsigned one. Also
why ...

> @@ -61,7 +62,12 @@ custom_param("dom0_mem", parse_dom0_mem);
>  
>  int __init parse_arch_dom0_param(const char *str_begin, const char *str_end)
>  {
> -    return -1;
> +    int rc = 0;
> +
> +    if ( sve_parse_dom0_param(str_begin, str_end) < 0 )
> +        rc = -EINVAL;

... can't you call parse_integer() right here? opt_dom0_sve isn't static,
so ought to be accessible here (provided the necessary header was included).

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -314,6 +314,30 @@ int parse_boolean(const char *name, const char *s, const char *e)
>      return -1;
>  }
>  
> +int parse_integer(const char *name, const char *s, const char *e,
> +                  int *val)
> +{
> +    size_t slen, nlen;
> +    const char *str;
> +    long long pval;
> +
> +    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
> +    nlen = strlen(name);
> +
> +    /* Does s start with name or contains only the name? */
> +    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
> +        return -1;
> +
> +    pval = simple_strtoll(&s[nlen + 1], &str, 0);
> +
> +    if ( (str != e) || (pval < INT_MIN) || (pval > INT_MAX) )
> +        return -2;

Like its counterpart in parse_boolean() (which I understand you've
derived parts of the function from) this if+return wants a comment.
Also - why strtoll() when you're only after an int? Yet then another
question is whether we really want to gain parse_long() and
parse_longlong() functions subsequently, or whether instead we
limit ourselves to (e.g.) parse_signed_integer() and
parse_unsigned_integer(), taking long long * and unsigned long long *
respectively to store their outputs. (Of course right now you'd
implement only one of the two.)

Finally, for the purposes right now the function can (and should) be
__init.

> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -94,6 +94,16 @@ int parse_bool(const char *s, const char *e);
>   */
>  int parse_boolean(const char *name, const char *s, const char *e);
>  
> +/**
> + * Given a specific name, parses a string of the form:
> + *   $NAME[=...]
> + * returning 0 and a value in val, for a recognised integer.
> + * Returns -1 for name not found, general errors, or -2 if name is found but
> + * not recognised/overflow/underflow value.
> + */
> +int parse_integer(const char *name, const char *s, const char *e,
> +                  int *val);

The comment wants to match function behavior: The '=' and the value
aren't optional as per the implementation, unlike for parse_boolean().
Also please be precise and say "... and a value in *val, ..."

Jan

