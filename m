Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19F6E442A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521890.810877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLMi-0004Es-9N; Mon, 17 Apr 2023 09:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521890.810877; Mon, 17 Apr 2023 09:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLMi-0004CX-6O; Mon, 17 Apr 2023 09:41:40 +0000
Received: by outflank-mailman (input) for mailman id 521890;
 Mon, 17 Apr 2023 09:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poLMg-0004CR-J6
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:41:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2074.outbound.protection.outlook.com [40.107.15.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c0b1633-dd04-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:41:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8720.eurprd04.prod.outlook.com (2603:10a6:102:21f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:41:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:41:08 +0000
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
X-Inumbo-ID: 0c0b1633-dd04-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bur95Hb1q/fQwpes+AuHsehsBkDgR7yFszEILMZtlODqtl02SBIV38q51zoy8oo9eqMJPCtNdmWOfSZ6SHGxdZN/aNj5x5M/p+8pDQPsiuKEH4DF8oa3YpiISwggPxkbf8Kc9g9LBSqFq8E6qL0PgFknDOBVxYtzJky7rzDUZpiPE89JoDbVvUj1MclvjTtbTfnStV/yZ7ksUi6/ajGIS3u4pD4xUR3OYdmBiOBg6YK/99EZK9iLuNH4iC8Ah63JpJyQpMu62oQ077EK0Ha1hRpCH9LKAx/iJgyAo+XGIdINwo5UnsqKZrdgC1b5xMRzjUtY46z4xIUX67pshzNAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeJ9IpgG3hpzefEguhPJJZdIxX2C1mp+5Y717kuIISQ=;
 b=g3nG4sbb4Zx4ncGwIJX67w2TmJocsEraZpIHZ+BpDVPP6pF1UvH7ITsgRgkkxLUG+4dqt584ZhFUXjjYz46ZvlJ4zLsWYVD1m/AXCYxbod7LQlDHWa5FnmlJJTYzU7cr9S5bEeBT4pVA1ZkrP9fg+HlHhJYx483ne+VHbl446eehuN6kL+l9by0GSllghowrQTL8erMENir9CKzgkvN4jVp3ACPQJchh2IcPiWc4vclSW+9DV+uM+MxrVoGsC+IpfHhM/wXg/Jw23h0GZqlHyiK5CoGS2HJl/hXt+BPBul8tOS3NPS84IOYqqgl8O+HeXZ+ojtiWNCTJEbG2VlsPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeJ9IpgG3hpzefEguhPJJZdIxX2C1mp+5Y717kuIISQ=;
 b=JsV5ybDJaisauEUvqU6hRMJ1cMGdvUOK+2Ek6IGZr4L6XitP4wzVcFxWLTubMOvEjK9zJZg0jGnHYGh1gCOFJHDgS5hQc6+SD6K50aaLg3Iq6JGCmMKuNg7ay4xYIJe+G9DzDE3KIUL1WJnZ2NhS6e2SY19vKUAR69nN4hy6Yg8BHEs/uU7kJaLo5e4xuefZkFRUmT2/72dmPzjhOiCOEt/tI6vQmT4yBAkbEXBGLUWzEgD0rwCT7VhezGgr6xGa6KBKmJsUhQ+1G3uCFtuawQHyqnl/7Lg+INGo7sYqo9O47dKMMWOiND31aqF9Xh76mUGcC7wvMP5u2FVkRkvSMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2978b495-c222-a3f2-16e1-ff577c7b699c@suse.com>
Date: Mon, 17 Apr 2023 11:41:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230412094938.2693890-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5b409d-4b92-4062-45e6-08db3f27df53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MIHeXiP3UdXsCOJh/WycINw9HSjTc5yVrVbpgdUgBA1VxjjoPsz+kIv4gbuJZGl0qKi7Sk0isHWWgSLyDNcJbU5Z/nmxCHWc1GTocSPuSgvoNqYfn31+qbLTn0/v5LEwqbwUCIAriIZbP0l4HMx8oppfI9lGao9Uhq7F1rsjC14Fp82g72BKpSPwVKUil0ZyRH6zIRDdpQYIWlD+9g+ENzmLelNhdDxnRQuiAggWPDuNjWeAiHLa0YBq8vK0+18NJt4TOO1n34G8cg/KYkSbMJ53zsof20zTKsY68QBO4JCOWOBbojBNZeKgDDUlNQwaP8fBAGw1WD2GvMZSL9w7/Acd6/HzZV7Ysn6iJ69l49LsJDQMuHXGSenUaTDiSfSctUK1EZuctRG23rMG4WsThTgvvS+u/mzJ6hcLnOupt4Ti8HDE3fw5kpxh9ANkM0bVOolRAY+QGjiyJLSzNXFe6CHj1MAVmeMidDTjSvNnGClClPxhKASMZv5fmLA9B+kxjqoYYpJdU1nkGX/fNeClZ5Q2hJeHp2UXTXxBBM7k0DqBCj0BGNiClesqohJ7t/mwWRLC8cJmUDKviq14xZAojRqFBNN5VDeKj21lSpUOgitiY7plX/JvsTNOqxFokGMhfEeIeDPpGCnfce7KzTVF1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(478600001)(2906002)(38100700002)(7416002)(53546011)(5660300002)(6506007)(6512007)(26005)(83380400001)(6486002)(316002)(186003)(8936002)(31686004)(2616005)(86362001)(66946007)(36756003)(41300700001)(66556008)(66476007)(54906003)(8676002)(4326008)(6916009)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2NiRWRkKzFVUnliMDFDOEdNcm0rM3RZQnFiN2MzRHR6aUtkdXY1K01ZMCty?=
 =?utf-8?B?disyZ01RTTBoeWZWR1VieVpaOFcvbytWRURVUlBBdVA0Z3ZGSG1zcWdNNDhJ?=
 =?utf-8?B?NTZpL200bnEvWTN2NllKSk5qYXVrTXpHMGQzVUlSTmNrOUlGV1B3a1F2OWJG?=
 =?utf-8?B?dGYrdHQrR0VaemRCbzgrMDN6b2lobmJPZnJUelppVnNDMlprdW9nOHROZE9k?=
 =?utf-8?B?ZHpTOFpvRlYwZWlkYi9GNTdEaWZFSEhNMjdHVWx6VzBsSWVTdU83Lys0TVNl?=
 =?utf-8?B?bElkMU1VTjFURVExSmJ5aXl5bHk0emFIYUY4VGxwd09QOEN3TGdWWTNPZC9P?=
 =?utf-8?B?WE1zSEtsUmxVUnVpNFp3V1YzOVQyelVuamJyQXhxbE42dVRvTmNWV1lONlVP?=
 =?utf-8?B?OUJUUXZjd1pkb0JwMHVPYVFwNzJvS3ZRRWdVdnZHbTdFelM5NW94WEs0anE5?=
 =?utf-8?B?QWo1dWlNRllaNVhTRUhkYTBmN2RaeitvaHpvemRDc2ErQ0gzVVBtOGs5T2NI?=
 =?utf-8?B?WVlPRFJ5c05CU1d5RmdrbGRkVCtTT2VOMngwc2NweEFCNzVveVJuK0lNaVl4?=
 =?utf-8?B?elN3bFJKZ3UrN0RzN2NzeDR3R2ErNkJRK2h5WHpwOGhLWjRlMlNLSzZnZGtZ?=
 =?utf-8?B?V1ZxSEtrLytibDFCMGJDc2VLdTlBYXZaT0UrNzVlaEdQcDQ1U044azhIYkpZ?=
 =?utf-8?B?Vm1CNkd0a0hvQW1rS1BFcTJPZmZsazZ2T2gwUTEvOWFpT2daNU8vK1MybTlG?=
 =?utf-8?B?N2NBYUEwVnNaZzJCWitKaFJPYk1uNWNHWEJvY0RFeGtJUUZaVE4vSnQ5VUtn?=
 =?utf-8?B?akNPaTRZVVk1anB3SUNlaUYzamNycG13Q1dFTFpXV0VVRWJkTEtoVXpNS3hR?=
 =?utf-8?B?MnZuQnliWnJIbU1BQ1hzOWRyTG1VVFBmTkRsQkFmRHZMWWhHTThTcGdpaE1S?=
 =?utf-8?B?b0xaYXE3cHlXS2hRc2pYZzFyQTZiZ1Jwa1dVamtTQ21OdG5lTG9haHI3YlFO?=
 =?utf-8?B?ZXJIOHcyN3J3WWxCQktvTWZ3V3d5OTl5SVI4UFlwRUsxMlBrT3UzV250a1Mz?=
 =?utf-8?B?U1oyVndJUk5WaGdRRE9DdkFnd3F4RVFUMnY2UHQwaTZaOUdnc0l1bU4zdzZK?=
 =?utf-8?B?SkJZRXhPZ29WRzFJMlV6ckRHNGpJeEw3ZEtwUXd6OStyRHJSQm5yMG93T0gr?=
 =?utf-8?B?UVdiTTRmdFZsRGxsbFVic2NpSVcvdTRjMmtxU2MvWmMxTXZJSGJqbWxEK29p?=
 =?utf-8?B?M095dHZqSERqOU5RaEM5RkUwT2tHVDBIMXdYVDNDTkdzbEdzTG1CWm5KUzA0?=
 =?utf-8?B?cUNLMGloU1ZQUURrV3Fmalp1ODhYMlJvcUNnNzlHUENrTFMwRGl6RDZ5R1pP?=
 =?utf-8?B?L3ZpcmxqbjdtYUh4R0R5SzZ5amFIeHRlZjd6VW1LTHJyZytVNlliTEZJTW81?=
 =?utf-8?B?T1BRR3FVMEk3c2VSNW1pN3hzMzgvaVo4R2JtY2ZtaWRROXE2aXF0VXFCZnpL?=
 =?utf-8?B?VzBTaUlJYkxUZ1lTczFmcThBdE5QV0FkTmdXY2pUL1NEUVArNkUzQXlTbXI2?=
 =?utf-8?B?Y2dYYzcyZ2IrTytZMVBuMStxQXFab2ZBaVNFSXRwdFBicmZubVlmVFBBYjBl?=
 =?utf-8?B?WmVmRlhyN1g4RjgvbHIvaGNnNG1zTmJlNG9rVlY0WEtkK2djMkZJZURmK0to?=
 =?utf-8?B?SXlkU2VpYXE2ZUN2L05BMFk1SlcyZWV4NzI2L2FBZXB3YllWN3pTWkxQa1dB?=
 =?utf-8?B?WFY1SHpLeXdIVXpYNUloR2Jpc1NtajBoTU0yUXhiSTBWbXNocnRoMnpCZWpo?=
 =?utf-8?B?NVFwNjE0amgyVVlYRklKSEhxNnpnYm9BSW9mc0tkd3NRRVFDVytRRmVrS0Vr?=
 =?utf-8?B?RWhlczA5TTZZeVg1Qml3L2NCeWxqMU5YdFYrYzR0SE51ODgySVJid1lsTGRU?=
 =?utf-8?B?Vm91b2FEMC9CVlk1ZExLY2xPSHhwNzc5eXlNdWx1MUk4aUxiclhEeG1zY2dN?=
 =?utf-8?B?bFJnekM1a0k2enRjaHcrQ3ZJaWV3MDdJZXFOcldTR1RKOEhsSHY2SXBNbHpK?=
 =?utf-8?B?cjBkMzYySVhvckJncXpwVjlRK1Znc1JBTFI3VE94TDRPNlhLYTdLMzNWUTJC?=
 =?utf-8?Q?Iqxon3MhCyT6QfBOEBbBRNEmL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5b409d-4b92-4062-45e6-08db3f27df53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:41:08.7519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrxM/NmDEuZYc9f8V3i8olEhxDop2vyuT5Fre1zhLS/WnStljuzFHLfS0rglhQYXkY7b4DEWjZfoNIfwdgKlzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8720

On 12.04.2023 11:49, Luca Fancellu wrote:
> @@ -118,3 +121,21 @@ void sve_restore_state(struct vcpu *v)
>  
>      sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
>  }
> +
> +int __init sve_sanitize_vl_param(int val, unsigned int *out)
> +{
> +    /*
> +     * Negative SVE parameter value means to use the maximum supported
> +     * vector length, otherwise if a positive value is provided, check if the
> +     * vector length is a multiple of 128 and not bigger than the maximum value
> +     * 2048
> +     */
> +    if ( val < 0 )
> +        *out = get_sys_vl_len();
> +    else if ( ((val % SVE_VL_MULTIPLE_VAL) == 0) && (val <= SVE_VL_MAX_BITS) )
> +        *out = val;
> +    else
> +        return -1;
> +
> +    return 0;
> +}

I think such a function wants to either return boolean, or -E... in the
error case. Boolean would ...

> @@ -4109,6 +4125,17 @@ void __init create_dom0(void)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> +    if ( opt_dom0_sve )
> +    {
> +        unsigned int vl;
> +
> +        if ( !sve_sanitize_vl_param(opt_dom0_sve, &vl) )

... yield a slightly better call site here, imo.

> +            dom0_cfg.arch.sve_vl = sve_encode_vl(vl);
> +        else
> +            printk(XENLOG_WARNING
> +                   "SVE vector length error, disable feature for Dom0\n");

I appreciate the now better behavior here, but I think the respective part
of the doc is now stale?

> @@ -28,9 +35,12 @@ int sve_context_init(struct vcpu *v);
>  void sve_context_free(struct vcpu *v);
>  void sve_save_state(struct vcpu *v);
>  void sve_restore_state(struct vcpu *v);
> +int sve_sanitize_vl_param(int val, unsigned int *out);
>  
>  #else /* !CONFIG_ARM64_SVE */
>  
> +#define opt_dom0_sve (0)

With this I don't think you need ...

> @@ -55,6 +65,11 @@ static inline void sve_context_free(struct vcpu *v) {}
>  static inline void sve_save_state(struct vcpu *v) {}
>  static inline void sve_restore_state(struct vcpu *v) {}
>  
> +static inline int sve_sanitize_vl_param(int val, unsigned int *out)
> +{
> +    return -1;
> +}

... such a stub function; having the declaration visible should be
enough for things to build (thanks to DCE, which we use for similar
purposes on many other places).

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -314,6 +314,31 @@ int parse_boolean(const char *name, const char *s, const char *e)
>      return -1;
>  }
>  
> +int __init parse_signed_integer(const char *name, const char *s, const char *e,
> +                                long long *val)
> +{
> +    size_t slen, nlen;
> +    const char *str;
> +    long long pval;

What use is this extra variable?

> +    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
> +    nlen = strlen(name);
> +
> +    /* Does s start with name or contains only the name? */
> +    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
> +        return -1;

The comment imo wants wording consistently positive or consistently
negative. IOW either you say what you're looking for, or you say
what you're meaning to reject.

> +    pval = simple_strtoll(&s[nlen + 1], &str, 0);

I wonder whether, when potentially expecting negative numbers,
accepting other than decimal numbers here is useful.

Jan

