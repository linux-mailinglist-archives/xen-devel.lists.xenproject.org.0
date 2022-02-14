Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59484B574E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272533.467416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeSP-0005Nc-7d; Mon, 14 Feb 2022 16:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272533.467416; Mon, 14 Feb 2022 16:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeSP-0005Kq-46; Mon, 14 Feb 2022 16:44:09 +0000
Received: by outflank-mailman (input) for mailman id 272533;
 Mon, 14 Feb 2022 16:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJeSO-0005KP-3U
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:44:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532cb538-8db5-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:44:06 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-7zfxyVZDPuKQ662Z7mkf5g-1; Mon, 14 Feb 2022 17:44:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3571.eurprd04.prod.outlook.com (2603:10a6:208:18::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 16:44:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 16:44:03 +0000
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
X-Inumbo-ID: 532cb538-8db5-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644857046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bff7v+lpgspQyUld7FOjCTcfFtIh5sKSqb7POcarn3g=;
	b=IsP27eCYqDR6JF+xOsUU1hxsHwBE/MT3bou1SLaakVqsDytAzxP4doozGoV2Imw4kdKbZ/
	q8uktsDdo3VpklbuqyXMpQMhjdwfrKdHOysw+LLGcJWYxF3Rg+2GsSiTsDw4xCPXufyYe4
	+W0CaIqK5Y1rN8eiNpiyMoFItFyaWB0=
X-MC-Unique: 7zfxyVZDPuKQ662Z7mkf5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCJKGAkpYL5GfMUU/ACYAY/nk4doy8FsH+Zjywfddx0fKXno8dhUFhcOTD3gTLTh6obVNg/ZFuvx8ImOrH9VQkeh9JZwJPBXUxAQyWETeJQ+ElSsYAKJhmp3iq8uTug/u1tbid1mOrJb1Y+JeRyPmnhsAnPj7ecK9PjOnJ2ROEYR0ODIb6agb6hLuldAGDavmpTOhfnytj2OIY14CTyFUAxtmVs8Lwmh9ZGvBihh0i2KVHaYw4SnvACH1KbxZgVyklw4//OzdTnsgJBtU6/b3isvZy8f/mM+WgnlLWO8KH+rayQBA3atUQMzehHNjbe1J0k7XQnyVAf24KjN5MsJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bff7v+lpgspQyUld7FOjCTcfFtIh5sKSqb7POcarn3g=;
 b=DZ4v5z5eFKDOVpSnzDH7kfA9m+3vC8KLWNRMfEeRaCT1Ew2VfdGSu0k2RiEZIE74djkPYcYxMVEMQ/SGYnGhdfVvyJnNs0lbSHUSpfhgMBITNt7enXnFTZnbUYuKEkWiyDKMnT+DEmSs5X/XwtEQLWBctGKWxdg+yXVGRJsJsraqT0hV4Fln9CzUFoiWZsG1zCmlaDMtIdiDSbP8D1kJh1yRWODncVsCsgM6iTZk886xYYc26b/B30f6vMnCEO879k0rpCNxndfKZyQTL2MtY3ElN2mxYbP+l7j7bsTB+vk9YAos5R1bucFmOaRtPzgvng1pA3QZVy60sCtNzvQpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63da71fb-820f-bab5-4cec-f9ec54ffbce1@suse.com>
Date: Mon, 14 Feb 2022 17:44:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201164651.6369-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0099.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a8abef5-4521-4e46-b867-08d9efd9354a
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3571:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3571C6FB7777504046991725B3339@AM0PR0402MB3571.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FVL/94z0j7/LmqwQV3nyfKgB+YxmIeBisRDozgljp0UYlNQPSi1lmzp1dEjmqHkPxYjAIA3KVxYCWZsAOo2HYXMfbGs8r86c9UQyoblsKrGIWz38M8qGsv5fSK89MFT4iWP/t7qknDaiGp2AIGXTF4o7VQE2PbO7Kjgx5hee1ptR6N4WRWqQImvm3h9cfIXvZ4uQvkH4m7GihWXjHtizyrZkQ2NhacHtLvoKJDdowDkl+/DV3QrHLLBebQvo5PT4rHZ5NK7B6PeHcuOTCCp1g1EW5bXa61qaFJnvHoIyLv+/O2HWDOpvyBq9Sz/+/xVmVsaQd5Gu6kRWMDZFpk8vIv5ZdH+dxlSxQWt76YQydgs3zIQV2z6fj9uo9ytP7CG9ck2Q0UyCqgA/58OjKbSMZvoSGDzi6miO7zQznnpkYj9tJ0ShZ6eQ+h1UI+YKLBNtndFV6gdEdRP8Gjgrt2AGuJsLWE1rTmA/d7uYzmaGJ5C2vA8alKbTP0uEgi+iTQZQR8/84qxKZuw1QsyIR8JokKOYcm4Hglt/m5Ih0CaiB2OFqFeSdE8pMfckmwwOfOSRCxZo93Vl1Vb6HFOwm7FNzUUAN1gjIFiHqRSND7IoICu8RiX7/J1hK6jpblJG41IrDuu4V9u3fddlDyU49bhlciYJM0ilWvEZozVc2C1ejpUyzGzeUQfJvryXp0khU+6MP6xEoDPtHCG9iI4mSV9OFlx7OSMJfyaQCLRPcbSED3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(8936002)(83380400001)(31686004)(86362001)(36756003)(5660300002)(31696002)(2616005)(66556008)(8676002)(66946007)(6486002)(26005)(186003)(6916009)(54906003)(316002)(4326008)(6512007)(2906002)(38100700002)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTlBZmN4My8zNE5FY1NRMm9vRFZHTFJSanBCTFdlMUtMZ1NPM0tLV3pLcXJW?=
 =?utf-8?B?Z1I3cStRNGhJVTgvdVpMUDVvaE5YM2JTN1B0UFZKbHdQVDB1Uy9FVHF0WHd0?=
 =?utf-8?B?cE1MMjB2bmg3YkZ6MHQ1Rk5mWGNRVW9rMktGR09LNDRPQzVSQnpMcGE2UE56?=
 =?utf-8?B?dU5pKytpdUttbXBWcFVxaHEyRlRNTENMUEt0aFNQUjQ0TVk5cUxGdHFxcGt5?=
 =?utf-8?B?aHJQbDdxMWpTT3I1bThLSVVBVmMyQjNYTWpvTjVUcEhjWE9CN0dSSmlQeVFH?=
 =?utf-8?B?YSt0anJDY3hRWWp3REhrM3dVRjJzVTRhUkQ2S1dvWVg5MDFzUmdWZndRNElO?=
 =?utf-8?B?L0pNcmpTN25CT0U4b1FzWkhFSmcvMGhpQXkzSkRFSHlqZlJnaW54VDd5Vnl3?=
 =?utf-8?B?SkVrRkU0VkJ2ZlFuVjlWcU0za1l4Z2hiNHN4UHlkand6VmFBSEJIQ1FVSUxt?=
 =?utf-8?B?SWxvM0pVUDFMZ3JSenpsQjNFVXcwR1hPdzdaMWFJSWp4ajFjTFlwODllbm9p?=
 =?utf-8?B?ci9xRThHdEljMzVQYyt1RkpkQVNEeUFvK0tQdjU2YzlhaUlFNEMrT0FUOFEx?=
 =?utf-8?B?QzJlOXBXcE1BTHN4YWJ6d0dJTTViUlErKzVUV0Jja2diUnFyd1kxbWVUU1Nl?=
 =?utf-8?B?UFFKdS82ajExOXNuVDdob25kb2JXRU5mV3lucmxIaXhzSVNQVFN6bVgxcllp?=
 =?utf-8?B?K3c2Ry95SkswaEp1YStrQkRXa2x1cVdnRzQxRlhGQzFCZ0NRRkZnSEE0Q2NN?=
 =?utf-8?B?VU1mQkczUy9tZFU3M3hvVGNKcFFJNWh6QXpJQlQ2MU5CVlpndldwTWFOaXBV?=
 =?utf-8?B?SDdsTDdOUmZCcUFsdVlJRE8vTS8wS0JTSXZxVXgySzlVNzIzYm5Yb1daT2xn?=
 =?utf-8?B?Tzc0cGVSNXhFWXZsS010Y0JTUklJTWdMOXR0RVU1eWJ5aThxNGNMTjh5VkQz?=
 =?utf-8?B?VC8vYVE0TlBQSjlzVWRVRWdtU1llb2g2RFR1Rk9CT2p2NnhmNXdUKy9uSGp4?=
 =?utf-8?B?Q3lUMy9qaTF0TnZhdEpza253dmdMa3QyLzJ2MWtvSzFCdnRZY2FYYSt1SXl4?=
 =?utf-8?B?Rk15c1BoWE9qK1hiUFVtQ1drMTZ6aEhsZ2VWc1VYMis4Q2tPN2ExVVlKODFI?=
 =?utf-8?B?cXgvK1VHZW1MZmo3M1h4S2l4NTliYzhZdlp1TGdiOXR6YVN0eUJldWd1Um5O?=
 =?utf-8?B?QjZ5SGRpaG82N1BLRVl6L3JnS2hyd3d4UWk3SCtDY3YzcUg3VnA0RmhPRmdR?=
 =?utf-8?B?TDJ2SHRwNFdYcHhBYWo0a1FSeG9pdyt4YkRFNVFuUmxyVDUwTVhGVVdYQ2FR?=
 =?utf-8?B?US9CK2ZWZUhGM2tWVStheHI1clN4aGlvTDl5NEt1VFFsbmlBeThKeUpIY29R?=
 =?utf-8?B?T285OUtKUS9wbVpJU0QyUGFKL3RIRTM0cUlpYnliMTFsdDhBQ3FoU3BvUmxU?=
 =?utf-8?B?OWJJcVJoRmwyQ2V4djVLejRJa2ZYODQvWHo1Wlo2YlpNbm9aNVg2U1lNUVY4?=
 =?utf-8?B?ZHlTQkVuNVgxTXdPV3RkeHZRZ3BBVURCMkE2dGFRY3hHc1VWN2F1NDRvbnJz?=
 =?utf-8?B?ZUMwNTM3WTBNMXJXZjVYYkdmLzU3dGIwbk0wcDAzT0JPMjA5MmgyemZRWUU3?=
 =?utf-8?B?eUYvQ2IvU1FvcDcvM1pLQWZaeHBTam1pVUJOYlFMNEVKS2VDYjdIUFhxZU8x?=
 =?utf-8?B?Rjg5cjlUSm9wTS9rOWV4Q0FOQ3JHT2JxZXRoUmhVR21RUTd2UHlpMUw4VFkx?=
 =?utf-8?B?eUlybkF5aXpBYW1ia3ZsV0krazRsbjVibHZ5eE9xS1R0Y2NVaENyZmpBMnho?=
 =?utf-8?B?a05Deks3UU9DMG9wS1ZDeFJrNkt0eVpORHZ1UFBrdHowQXYvZC81aGVNTndw?=
 =?utf-8?B?Q1A2NkE1M0x1VUVnZXAxZm5wWFNxN0prcDZyaXBmbzlMYzc1VlNxNyt1Vjl6?=
 =?utf-8?B?ZVZHQ2U4MjM1UnI5bmRkN3hKd29IdGZDeEZsNlZHRmZNTzdvaWUrRnlsQ0JR?=
 =?utf-8?B?RlpzSnZXTzVENEVzWHFHV1NNZVE0OUpZT3JvN0M1dFh4ZWFwVDZ6VkpZT2tO?=
 =?utf-8?B?LytlcUpWZWxNZHptREVDRjJMMlpxNndHbWovemhRek1va3J4dXdGaGFsdTVo?=
 =?utf-8?B?endkZWNQcjI4b24rQ1VxUVp2NmJ1cTlodWlmdHFRNjE0K2xWUWRLNG80aEpa?=
 =?utf-8?Q?KkZwmftmoYi+sFMlFzkipd8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8abef5-4521-4e46-b867-08d9efd9354a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:44:03.1760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFkz1k04f+5uH5m6AadDO0BG2coYBDCc3USqkRjPTedO2wwgG5P5yfAs2ALXyKm1XOU7AN5w3d4K2zQNGTKrww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3571

On 01.02.2022 17:46, Roger Pau Monne wrote:
> @@ -716,26 +702,117 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
>  		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
>  		    ({
>  			    val &= ~mask;
> -			    if (opt_ssbd)
> +			    if (enable)
>  				    val |= mask;
>  			    false;
>  		    }) ||
>  		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
>  		    ({
>  			    rdmsrl(MSR_AMD64_LS_CFG, val);
> -			    (val & mask) != (opt_ssbd * mask);
> +			    (val & mask) != (enable * mask);
>  		    }))
>  			bit = -1;
>  	}
>  
> -	if (bit < 0)
> +	return bit >= 0;
> +}
> +
> +void amd_init_ssbd(const struct cpuinfo_x86 *c)
> +{
> +	struct cpu_info *info = get_cpu_info();
> +
> +	if (cpu_has_ssb_no)
> +		return;
> +
> +	if (cpu_has_amd_ssbd) {
> +		/* Handled by common MSR_SPEC_CTRL logic */
> +		return;
> +	}
> +
> +	if (cpu_has_virt_ssbd) {
> +		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
> +		goto out;
> +	}
> +
> +	if (!set_legacy_ssbd(c, opt_ssbd)) {
>  		printk_once(XENLOG_ERR "No SSBD controls available\n");
> +		return;
> +	}
> +
> +	if (!smp_processor_id())
> +		setup_force_cpu_cap(X86_FEATURE_LEGACY_SSBD);

I don't think you need a new feature flag here: You only ever use it
with boot_cpu_has() and there's no alternatives patching keyed to it,
so a single global flag will likely do.

>   out:
>  	info->last_spec_ctrl = info->xen_spec_ctrl = opt_ssbd ? SPEC_CTRL_SSBD
>  							      : 0;
>  }
>  
> +static struct ssbd_core {
> +    spinlock_t lock;
> +    unsigned int count;
> +} *ssbd_core;
> +static unsigned int __read_mostly ssbd_max_cores;

__ro_after_init?

> +bool __init amd_setup_legacy_ssbd(void)
> +{
> +	unsigned int i;
> +
> +	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings == 1)

Maybe better "<= 1", not the least ...

> +		return true;
> +
> +	/*
> +	 * One could be forgiven for thinking that c->x86_max_cores is the
> +	 * correct value to use here.
> +	 *
> +	 * However, that value is derived from the current configuration, and
> +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> +	 */
> +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;

... because of this division. I don't know whether we're also susceptible
to this, but I've seen Linux (on top of Xen) being confused enough about
the topology related CPUID data we expose that it ended up running with
the value set to zero (and then exploding e.g. on a similar use).

> +	}
> +	if (!ssbd_max_cores)
> +		return false;
> +
> +	/* Max is two sockets for Fam17h hardware. */
> +	ssbd_core = xzalloc_array(struct ssbd_core, ssbd_max_cores * 2);
> +	if (!ssbd_core)
> +		return false;
> +
> +	for (i = 0; i < ssbd_max_cores * 2; i++) {
> +		spin_lock_init(&ssbd_core[i].lock);
> +		/* Record the current state. */
> +		ssbd_core[i].count = opt_ssbd ?
> +				     boot_cpu_data.x86_num_siblings : 0;
> +	}
> +
> +	return true;
> +}
> +
> +void amd_set_legacy_ssbd(bool enable)
> +{
> +	const struct cpuinfo_x86 *c = &current_cpu_data;
> +	struct ssbd_core *core;
> +	unsigned long flags;
> +
> +	if (c->x86 != 0x17 || c->x86_num_siblings == 1) {
> +		set_legacy_ssbd(c, enable);
> +		return;
> +	}
> +
> +	ASSERT(c->phys_proc_id < 2);
> +	ASSERT(c->cpu_core_id < ssbd_max_cores);
> +	core = &ssbd_core[c->phys_proc_id * ssbd_max_cores + c->cpu_core_id];
> +	spin_lock_irqsave(&core->lock, flags);

May I suggest a brief comment on the irqsave aspect here? Aiui when
called from vmexit_virt_spec_ctrl() while we're still in a GIF=0
section, IF is 1 and hence check_lock() would be unhappy (albeit in
a false positive way).

> +	core->count += enable ? 1 : -1;
> +	ASSERT(core->count <= c->x86_num_siblings);
> +	if ((enable  && core->count == 1) ||
> +	    (!enable && core->count == 0))

Maybe simply "if ( core->count == enable )"? Or do compilers not like
comparisons with booleans?

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -22,6 +22,7 @@
>  #include <xen/param.h>
>  #include <xen/warning.h>
>  
> +#include <asm/amd.h>
>  #include <asm/hvm/svm/svm.h>
>  #include <asm/microcode.h>
>  #include <asm/msr.h>
> @@ -1056,7 +1057,8 @@ void __init init_speculation_mitigations(void)
>              setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
>      }
>  
> -    if ( opt_msr_sc_hvm && cpu_has_virt_ssbd )
> +    if ( opt_msr_sc_hvm && (cpu_has_virt_ssbd ||
> +         (boot_cpu_has(X86_FEATURE_LEGACY_SSBD) && amd_setup_legacy_ssbd())) )

Nit: I think such expressions are better wrapped such that
indentation expresses the number of pending open parentheses.

Jan


