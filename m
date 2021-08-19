Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486D3F1C1B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 17:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168900.308444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGjWD-0008QG-T9; Thu, 19 Aug 2021 14:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168900.308444; Thu, 19 Aug 2021 14:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGjWD-0008Ni-Pt; Thu, 19 Aug 2021 14:59:45 +0000
Received: by outflank-mailman (input) for mailman id 168900;
 Thu, 19 Aug 2021 14:59:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGjWC-0008Nb-T1
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:59:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15e8f57e-00fe-11ec-a62f-12813bfff9fa;
 Thu, 19 Aug 2021 14:59:43 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14--09PwKKLMRerBltu4fCyjQ-1; Thu, 19 Aug 2021 16:59:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 14:59:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 14:59:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 14:59:40 +0000
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
X-Inumbo-ID: 15e8f57e-00fe-11ec-a62f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629385182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaqTGpIseiymaGgJz3/lZYw8fD50FDo3wl4e7ApZd7A=;
	b=NT5uQHMTHPoi363TuHT8FNC+aZphoPtuWJtPiWez92SlgZ0hzvtNvOQFj9VSs3v08ZkWmp
	j62Adz4hkSnAdz5BOV5P+MZxCjXIt85mjSIFI69pJsgBlgKnWnS10W3VTsbIo3lvS1hBxw
	/Gu/E3+qIxIi+UpUVvFkou/6QWB16UI=
X-MC-Unique: -09PwKKLMRerBltu4fCyjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFKMWH0C2Pc3yG+GdDDHrZNWc93aquCHNYaIrIQV6xcn8mU8q5917TR7vdeNGbvBvgaETL8kG4b5KC/ne7nQCz/Q0FP7MeMG/dnNRt6OWAk7FCY/LaSfy1iWAXlTM/GRFC/Jw/2U+T0nHUMuYcbrwHY3fQe2Cjv8nOvZQaFh7Df2GTyW5mCu8CO7nSVUSGNdUa/NAfHB7gaSqVgT1Yu+TG3C1e24xcK/PzqykgTPSitosW3pn7B2X/BgVQdJ7jWvw8MHIwBZXBYl3q1F0gY+Ti2g1dEJ6lbBbe9J6wGMQ7eocpWU6MXhf02OqXw+RlewF8oZOM9c51REERnqCNIwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaqTGpIseiymaGgJz3/lZYw8fD50FDo3wl4e7ApZd7A=;
 b=SnhsGQn1vu5k1MZWOTPwnNelY7JLBq9v6YblXUH+xYuLGEg5jTLcq8N9YlQeFzYUlCW8SJBBRWMohuq0WKN7q4rw2DLeTdyWEtYdBfx2STzvP+hfvaXw7o40Hj+UlycpRtHIHxm3Wq3utFRoWf/2qQUspF8QSzxt6n5CHW6y46coMuhDw1XdwccdF+WPMqT4bknM9lMGwUXa506OZyX81XHYV15V1g/REN/FtxRnXtQEU1EsGicfley+QKBvscytmtzT8LnTvXLPkOpYTHMWIYsqBw40zFEe2/1s7cnN11rTu0W6qMVQnXf8IVlLhawy91qU2Yc+Gp1T/nxNw/7N2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/3] x86/amd: Use newer SSBD mechanisms if they exist
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35356c32-46a1-815e-0ecd-bd2b4b77519d@suse.com>
Date: Thu, 19 Aug 2021 16:59:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210817143006.2821-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0b8867a-5461-43b1-8062-08d96321f89e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46083A3DD5AE937218C3CF65B3C09@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	whCEfXvbhpLS+hHdBNFmTqBfr0ohJvzzXTBhG8aKr+Yqi6y5yKY221FxbZCAqVH0dL17n1mXNA3slZubNcgCqKGEPZjC/zicBzxcqwHI6HlznjD4jbbw9QXKU9PpnJ6dRz48hKkdMtm9sIaKRUGYPtBYDbpRm3a+eiq75IyHW5BhonCNASzweE9RZeaLcLUCZnFl8qS8acS6NgqdJpNqAV1lUhFwXYDg0gfmOjMjLc7qsMeMIwMHw6Zpg6Wqz9KLfJxs5cOOgZe73ZMDs4mWG8Ags86juDJMtCEET9+kMkB11v8kAIug1HFDEduKLiYGfCGZWG2NQRQhxA1nIh3TTYNLY6BxmdRbxbNaq6gXrojAdGlIgf7YfpGh3e3OSBWxHiyo06kT65Arv2CB1XTNRnkLHCV/oBX92XmElEAffzd20iU4zHOZ15IahTZY/m93upk0g49wpJTlHKv9Jo+xOtwRkc+cut6a04zri3yy7HsPefnzCZkirfLzbl5BfHbCGYKEVXzp7juSiWfkzKCTuQywI0IKyHsj7LwiLmRp6SFstEALv+OGXlhieogQS+CgADWAYcvWvWkTIUZSLpNzi8WX8nsul0q+GU8l1eYgHBAYlX6nZ4UaL594EYG/e/obNLUGVnlvr4e+adpD+ZUEZGk2oO5HD2TsCj93t6RTfSHTKD8cO4E+M5p+IKd5xdY7wenqmr8JNBn+pv/3wlE0wp736IO3j73dWOenHQcWAmzHOG/s2LegYhTKzPcTmYU0F5GywGAXT+M1GknbPl9DqID8ZpUI4vT5KRO40EfgYdZxFPvh0Pyb0OkSGeJ8cLsI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(36756003)(54906003)(2906002)(53546011)(66946007)(966005)(86362001)(5660300002)(956004)(6916009)(478600001)(31686004)(31696002)(66476007)(8936002)(26005)(66556008)(2616005)(6486002)(4326008)(316002)(8676002)(186003)(16576012)(38100700002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU52MW52ZUZXd2lYZXVWaDFUaGF2NW5nZG91ZVl4NkFTeHhhbVB1aUJtbElz?=
 =?utf-8?B?OVZvRmpaQ0lXZzhtUU9UY3ozWG9aa3h5VXlBeHJ6dXl6UkdPVFVBTWllQmpU?=
 =?utf-8?B?UXNLeW5WRGJHMW1NOXl4NXNUYmJqU2ptWlU2TUIxeUhJUlNTd0VRUnRtY0py?=
 =?utf-8?B?Q015UElTNEc1VkMwZ216MkJnN0tNYlhVd1JOeE9JSnVjbnlKeW5LbnhScGtt?=
 =?utf-8?B?SGlzbU1GU1BJeGpJUmR3Ujg1blNKSmlPZ29xd0QvTVBoc0lzcllYUmxleW5O?=
 =?utf-8?B?eXRGTlZSajFJT2RxRHdLSkU4VThJcmVRMUdqczVDY3J1NUoxcUF4SnBlNVJJ?=
 =?utf-8?B?dElJdVo3aWQ5TmpxSnhKMk9lZHROdGpDQm1NeTYzYW5JNWZwUHgra3BreUx2?=
 =?utf-8?B?RWlYRUQ0RzVwa0tDRXFhOThmZ3ExOUtMV0lBQ0U2RVpaMDZFSlo3L01xZnVt?=
 =?utf-8?B?ZWNEaGZSTlNTYVBGZFBzVFlMR1FxUjhKV1pVSnY5TGxBaWdGUzkwL0xoQVVz?=
 =?utf-8?B?aEhickQwYzBnd1BSc0o0aXFtZVl2cUE2ZjB2ZmQwK0grcFdlUE5wdkVNUlEr?=
 =?utf-8?B?aG85YS8ybHl6SXl0c0FvNk0yaEpoNFpnOGhiM0M3VzZJQU4rclZ4MTljaHZH?=
 =?utf-8?B?UU5MOWE0NVg2RFN6MURiQUFSeXFjeTE1VWl2ZGNIR3htR3BQWE11eWk4RlpV?=
 =?utf-8?B?NGhhSklnZjBxL242SzdBL0tUZlpJQ3QyTXVTTmxMeUpPV1UvbjBkOEF3M0dV?=
 =?utf-8?B?RG5XME5iQUhraEY0MmlxR05ENS8yR2ZYd0N0N1pOY24yeUxsZURSTFI0eG41?=
 =?utf-8?B?cXJNSWgwODJFQStNZEdwU3lXRTEzczY0TmxXZkRMVkpWbEd6V09MaFhMNWJL?=
 =?utf-8?B?MjFnUVpyNlVMR25BUUU4ZTdFU0FYNUtoNlorSmpzWnZtN0hSaVJ6QjZ3MWtr?=
 =?utf-8?B?bjlTdktoOFVmdWpucHlqbksvS1krWElWaVRwQnV2T0FlWDZsNHJ5Z2NCZ0tY?=
 =?utf-8?B?K3BSckcyK0F6WkdWOU91NnB5cE5UeVJnV0dLTTkxdW1ZL3dHUGpnWERaRkQr?=
 =?utf-8?B?Q0phb0x1dFlHTU1vdTh1QUNnUGtHRnFqN25JQUN2VWFJQmc1R2ExckpYWWFz?=
 =?utf-8?B?eXBWV2QyNGd3bm9RTG1RL0Q3aXUxZTZ4YVhRVGI4K2FJL2RLRmZYNFlZclNi?=
 =?utf-8?B?b1JSZmI2VDFuQ3Nlck5TaVdLSmhxcjR0UjAxRWpESmNzbUljckRnTFVwUklK?=
 =?utf-8?B?RkprOSsvRkpPa3RYeFE1OFZUcmFhOXRXb2RJWDhGU0J4NDRqbFlObWNneFUy?=
 =?utf-8?B?cVo5TWlhQWpySFA5RGdnaU1SdWZhRTRkckwvQjI4V3NKQWVGdEl0UU9velow?=
 =?utf-8?B?TndnWlZtdUdreVhhZlZhZmp3dHVxWW15MytHNlVaMDFDM1l6MDhlM0d3WThV?=
 =?utf-8?B?dnFtRFZHSTNONFJMVHVSaWpnY2dhOGw2QWNlbEZtbVJ4Y0VkOVQ1OUl3TVMx?=
 =?utf-8?B?enBBWVhiVDYyd0l6UnYwZUVOaW5HdTdUS0dlMWMxOU5nMXlLWS9lNEgwRkpO?=
 =?utf-8?B?VGhGRzN4WWxyUU1xQnZaZHZnRkdEZnA4OU9XUmpkeWxJZGtKU0dGKzBBcktj?=
 =?utf-8?B?S1d6RFdpbHYwem9jRG9GajQvRGJGdTI1TDBnTEJ4b0dJaTg2QTRuUUlEbDFJ?=
 =?utf-8?B?dGNldUdtNS9GNEt3cnk3YWs4Rk5zU08vUnIxRGhVRElrT014bjUzd2lRbzZB?=
 =?utf-8?Q?Kmqs5M9Zb49aPaOk0o1KvWzOaS8vCQINwceLS6Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b8867a-5461-43b1-8062-08d96321f89e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:59:40.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayvYPv8HDrPmc6n2d2na15W7CrJuyVDxXK4Ndm7RgBRsN+kVmbJ9clKQvt8sOBxvxgO0E/gbVEbyFFZLD3PoNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 17.08.2021 16:30, Andrew Cooper wrote:
> The opencoded legacy Memory Disambiguation logic in init_amd() neglected
> Fam19h for the Zen3 microarchitecture.
> 
> In practice, all Zen2 based system (AMD Fam17h Model >= 0x30 and Hygon Fam18h
> Model >= 0x4) have the architectural MSR_SPEC_CTRL and the SSBD bit within it.
> 
> Implement the algorithm given in AMD's SSBD whitepaper, and leave a
> printk_once() behind in the case that no controls can be found.
> 
> This now means that a user choosing `spec-ctrl=no-ssb` will actually turn off
> Memory Disambiguation on Fam19h/Zen3 systems.

Aiui you mean `spec-ctrl=no-ssbd` here? And the effect would then be
to turn _on_ Memory Disambiguation, unless the original comment was
the wrong way round? I'm also concerned by this behavioral change:
I think opt_ssbd would want to become a tristate, such that not
specifying the option at all will not also result in turning the bit
off even if it was on for some reason (firmware?). Similarly
"spec-ctrl=no" and "spec-ctrl=no-xen" imo shouldn't have this effect.

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -681,6 +681,56 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>  			  c->x86_capability);
>  }
>  
> +/*
> + * Refer to the AMD Speculative Store Bypass whitepaper:
> + * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
> + */
> +void amd_init_ssbd(const struct cpuinfo_x86 *c)
> +{
> +	int bit = -1;
> +
> +	if (cpu_has_ssb_no)
> +		return;
> +
> +	if (cpu_has_amd_ssbd) {
> +		wrmsrl(MSR_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
> +		return;
> +	}
> +
> +	if (cpu_has_virt_ssbd) {
> +		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
> +		return;
> +	}
> +
> +	switch (c->x86) {
> +	case 0x15: bit = 54; break;
> +	case 0x16: bit = 33; break;
> +	case 0x17:
> +	case 0x18: bit = 10; break;
> +	}
> +
> +	if (bit >= 0) {
> +		uint64_t val, mask = 1ull << bit;
> +
> +		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
> +		    ({
> +			    val &= ~mask;
> +			    if ( opt_ssbd )

Nit: No spaces inside the parentheses here.

Jan


