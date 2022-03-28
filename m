Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE964E994F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 16:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295467.502793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqFB-0005aJ-9H; Mon, 28 Mar 2022 14:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295467.502793; Mon, 28 Mar 2022 14:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqFB-0005YW-5w; Mon, 28 Mar 2022 14:21:17 +0000
Received: by outflank-mailman (input) for mailman id 295467;
 Mon, 28 Mar 2022 14:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYqF9-0005YQ-NX
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 14:21:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a579eb-aea2-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 16:21:14 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-sHUIwSQ2PACdjnnxoY_SjQ-1; Mon, 28 Mar 2022 16:21:02 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6866.eurprd04.prod.outlook.com (2603:10a6:208:183::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:21:00 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:21:00 +0000
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
X-Inumbo-ID: 52a579eb-aea2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648477273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqau9UMD9Tc1ibK5Jy2h5Q5tLsuBLxxdQ61AUbcFoRw=;
	b=OPb/QJREF9YDaAz864yhRCZJ8Oej+9IzWwADq0SOoR9RMluIDM7eCVbTDodyLl6te7bCtw
	J9SPFxxcgtk7RAf2ad+8XQIKhxxZqJXR3LUxkBXEigeo9WwpN5SDnIup672+ViWR4RLcGt
	Oyw1KWlwQa5EBcUM08XFf22OokT+7+0=
X-MC-Unique: sHUIwSQ2PACdjnnxoY_SjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igWD9o+JyWw/KFURXz85/tfRGDR7U1BTNHksYLdUE8qhx39JaLpybd1kn5rTHF4XyeRzSIlwClhg5KsrPSCdYolzGwCOdoIpIqf8bPcs/JGf9U4gD+YIus0K0qIMwW8K0sMJUTqt+K7XDM1gH8laPELP03SodJBzkbzn5ZT7cp4D0SAZPL4RIi4C4rD7K08hPNajM1OE9UJ+QB45bingWdRnbwT+aie1e87wSOHcm60Si8gfW4K84HDPTE6WPNaqf3acaKsde7nwYJDHZtRJCRLL2Cw9BNWYc5tbvyBGvpzekFIxPWo78WNdvvZX4vf72BCR41rwtOuJ+eU6T/RT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqau9UMD9Tc1ibK5Jy2h5Q5tLsuBLxxdQ61AUbcFoRw=;
 b=hCsK3m8A9CKs1vnmMuwNAGFONKaDaiNgkLOGceOoVGdUSOVv0fx7hpIBsEbkiYDa05dDPhccCmehcpRSIZi6EtlDSEYl6CsFsgI0iu7pTVBAxsnAjVUZ3DBsxYfkMtgAYZ2CwVL+5qFPqcg6f1jo3hloWAUENHUG7C1AopupXsKCumOiBXONOteYC9b9L0qmh3nX0XK2S16KIgH3BTrcWToguZG6SG+SYQY4JnKFvSpYTMB7GNVT2vf2sqdyyFwS/U03+uFsSljzYQDdypAomt/mlALPjm6G7DRYNYAfkgfCiMiU/ZWiLKu3DfbCbEDQHDEpkEBFIQ9LsHa44RtL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81e90bb0-bcc0-563b-eda0-9979164aaad2@suse.com>
Date: Mon, 28 Mar 2022 16:21:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220315141807.22770-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b0c3549-0328-4131-242e-08da10c62f19
X-MS-TrafficTypeDiagnostic: AM0PR04MB6866:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6866EEBD1F45D0C8E3B77289B31D9@AM0PR04MB6866.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6idCNjaypr3zwXd3m7kFOAw11H6pmtblqSChLAz+UNlIL+EFszLrm2Ae7dD+Xkpp0WH5SzfW0taNvpX9s4WVqcCje7G8rSiIBkAIyKXVJeR6Q+oNYEXG5owgbHdpfVNu0mrHn+UQ13ed2RZo2vRpsQx5bAnuvW2+XMkYZbjygqPGoeidD0skkerAmBdgG/bXfrucnOQSzYXbE7v6jKErhQC7IPv8oHa8go8KZ5i+vg5KtvoibMgjye7PZn/EQ0P08s7x2lFEy6qAX/ePwMfi9dvK7h95FfowzToXFiqj64aGFzUe4BVxkCnzfOrszucbL6T0d3HnWvdYKD7GeSGfEAMgcoEGnOw8kiyM2Hfy2pmUvd1uM1NZ1ewxYZ6XMsoHPfiSqiXHYIeiYNgcQh6pFL0F90U6W3Tl9tvmFmypR6H0kDu6nwh3Qm7yzcpFPUuPSThpAPAcQYlMzMKvWwnlEv5tc6Ls2E0iGzqYYLGqGmDCKpypeBQEoreaGgK6eJowQAcKTiramfvY7Ok539JVj6GbMX4oAIg21sWiekkF5dUoC8eIZoYZLjSOlhZyML4hRtMO+pUfkT5BjA59FB5oA6T5RUSkAqbo+Tl+GI0PfbmPRRubNHYvm5Lxs1tTjxSSwUwkB6u5CI/1UVozLcRX+VQQHCDFeenWlY+jkbF3JkWVEL8uQhGO0IEePkz6u+1mqjkAgkK4MUPfwAZ9LCzlSvd7n7p8GiEDpig7G7LqYvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(4326008)(8936002)(31686004)(6512007)(53546011)(316002)(2906002)(54906003)(36756003)(83380400001)(6486002)(2616005)(26005)(6916009)(6506007)(186003)(508600001)(38100700002)(86362001)(8676002)(31696002)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2ozRlhuU3pPTkFyajh1T3FvSDJUN2l6YmppNFdaOXdqc01kVW1Sck1OOXJV?=
 =?utf-8?B?OTlVc25LUy9ycmVPeXQycGVrTHloZTFzaXhNTUlJQ3l6NWdhVGZPdUtCcnYv?=
 =?utf-8?B?THJ2czgvTzJSUlVxQkZJdE5NRDlNUlRHZW15TFl4MHNPNUVUK0NndTV6S2tF?=
 =?utf-8?B?NVhwdmZjenM2YUZ2SEQ2enQ4ZWZWQlJud3BxU0RGdXBCNjFVZU9xRSs0VGlm?=
 =?utf-8?B?bnE3WG12NU01UURlMWRoQ0loOHhjKzRjN3EzRUk4T1U5MnJvaGd6WHRQMngv?=
 =?utf-8?B?ZHlVc1lIV3JiNWV2ckdiNnJscW9maEprc1NTVXdGd1BXYkh3OVRHcHc1bkN2?=
 =?utf-8?B?MVBORzlzM2c5MEo0KzZ1K3p1STViSXVXZjEzRDU2SDBIZnZnN0lRZitaczNF?=
 =?utf-8?B?TExieXdGZ2pzeExRd2l5cVlkSU90Z1VHMEVEYmhHcno3Zkcxc2UyL3lKWTBL?=
 =?utf-8?B?WVJVbjRSRGkzMnhrbzNtU3JzSmc3aWhTempYZVVhQnE0T1BVNVFCZDdVVmZp?=
 =?utf-8?B?aWpxYzhRcERtSDV3dW1SMXBIYm14NjJWNjRHOWxSMllOUS94U1dGTlRSRXkr?=
 =?utf-8?B?RnRZNUlWd0JhZFN2UTViQ3IrZ3ZlSGFMd3ZoWkFidHFOalVWcE4ySVJHSWIx?=
 =?utf-8?B?eDJSRVNrUEg2Ny9wN3Y5NkR4VmpnRGJidnpNSXRjKzBkOERxMThKWDl4R1Rq?=
 =?utf-8?B?TWhxUm9nZWxuT1JPL2trVXR1ZUxmNGtsWGxsd20raGdCMXlZL0pybFc4WHRC?=
 =?utf-8?B?bUhqd1JiNjRBK2VPYkM5YjhrWnExUW42cWlucUQrOGdlTTR5aFcvT1pNc1hE?=
 =?utf-8?B?SDVycjN0Vmh4R2JZeWdlZkZTZG9GekM4bklNOHM0ZHk2R1NzdTNDZUhFazdC?=
 =?utf-8?B?M1ViblJQeDMwdkxIUU85ZkxjYklTSnBZbGE2VXZvdEdBOGZ4ajcyYWszRXNJ?=
 =?utf-8?B?cCtTWmgyTCtBTEFXa0JvZjJGdzI2blFSWmNjQWxrY1VzaWdOY29qLzdTRjQ3?=
 =?utf-8?B?ME1VanlUWWZ4SVo0Mjg3VGFoZ3k1aUVwWllsNDMvWXB4VTRoS3kvWWtRQWsy?=
 =?utf-8?B?NndLUGhHaW51VjJSejhQRlcyYW5nQnZFODA2VDNUYWI5M3o3NFNjbUdKYVFD?=
 =?utf-8?B?eFpDa1crWDdDRk53S2hyNGFjdXg2Z1hvL1gwenlaYjJBVXdlUC80di84NkUv?=
 =?utf-8?B?WnB0aVkrN2p4c2ZLTTlSaE40UnJJc1ZFMnhvR1JNbHROS3ArQW5mN3dHTm1z?=
 =?utf-8?B?OGdFdWZsRG5wN3FCeFVaUC9WN2gyejV3N1kyTlBiYUhYSjBBN1VPWTR5UUFz?=
 =?utf-8?B?MHZCQU00ZTF2akRuVHUrSmwweDNiWkJyN2w0SDk5bmgvMVVvRjd1a1lOK05p?=
 =?utf-8?B?czliTFpxWXh4RmdYamVBZFhlWEJPRnFpUGFwRjZzL0VydjFNK3UrUXFxN2h3?=
 =?utf-8?B?Q3lyZ2laWXFyWjhjZ1hWTEU5MTBPS2FqQ0JVVUpScUFEcVlhdFNNWXVHUFQ2?=
 =?utf-8?B?dU5taUtLejY3UTBtM2ltTmxHTWNCTVRBSzFDM0ZXVUtqVENuTWNQNGp1Ty9J?=
 =?utf-8?B?VzZoSnV5ajRIeTZwZ3dRdTh3S3FyWTV3M2tjekdxalpqZ2xNb2Q0WXUvbmpz?=
 =?utf-8?B?Ky8ydlZMUytHMHFoVTFLL1Z0MUtnblhheUFIaFhiazBhbVJZcHZzaEJZcE11?=
 =?utf-8?B?SkorbFRMM0lCQi9OSGNVTFlVQklQekJYZUppK1pGcndzdlhZY0UrUGdIVkMy?=
 =?utf-8?B?eSs4dzZaNURleTBuRVgrUWFwckg0ZGRyaWE3UDJOOU5IdzJ6amZKWGZMbU9Z?=
 =?utf-8?B?dnpad29Qd2cvWUhodUtjdWdETjdWeHJTSSsrV2xWVjJGYVdTZlZkeDBHNXJy?=
 =?utf-8?B?L0pWdlRETWtsRDdETHVoTmNrOTRQblVtYWJFSlQ1Y3graUloUTBkN0pzTm5Q?=
 =?utf-8?B?WXdVcWV6UkxzTHRSUTA5TzJpL2NNa1A5UWI1M2NmelpkdlpYOVpXcFNiMjFI?=
 =?utf-8?B?cFBoQzhHYjNDR3Y1MUV6OTVsNEllSG45bllZaGdiaTdQb04vaEpSVExJaVBl?=
 =?utf-8?B?Rk5mM1o0YWorOEpiNGZMRkNLdzRmWHdwWWt0a1YrODBGd1ZWUXgvMGJNU3Qw?=
 =?utf-8?B?dHQ1QVZGNXBmMkNXRDVoc2R2cDJSTWZoNUY0TlEzMng5UlNha2EwQ0pQVU1o?=
 =?utf-8?B?YmdQcnJwcDJLcHd3V215S2NYMERJS2RkQnRMUWRBbTA1THdWaVNmeExhM3Jh?=
 =?utf-8?B?aTZDTWNwMEh4dmxsa2lSN2toNnh5ZzBLcWtMWlRhQkJncUpoSjIwaGF2bzZN?=
 =?utf-8?B?d2krWVpoYW9QYkFFbmhOWjg3RGI5MEJuLzNkUUM1TmM0b0QzdnJ3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0c3549-0328-4131-242e-08da10c62f19
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:21:00.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATtK+WwYUFW2NvNQYDEQHSIvSYRuCK6TddNGtScku+hwWvREc5oD6+IAtg6MvJOv0KW7Rpkh8c0QBmocqAsqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866

On 15.03.2022 15:18, Roger Pau Monne wrote:
> +void amd_init_ssbd(const struct cpuinfo_x86 *c)
> +{
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
> +		return;
> +	}
> +
> +	if (!set_legacy_ssbd(c, opt_ssbd))
> +	{

Nit: In this file the brace belongs on the earlier line and ...

>  		printk_once(XENLOG_ERR "No SSBD controls available\n");
> +		if (amd_legacy_ssbd)
> +			panic("CPU feature mismatch: no legacy SSBD\n");
> +	}
> +	else if ( c == &boot_cpu_data )

... you want to omit the blanks immediately inside the parentheses here.

> +		amd_legacy_ssbd = true;
> +}
> +
> +static struct ssbd_core {
> +    spinlock_t lock;
> +    unsigned int count;
> +} *ssbd_core;
> +static unsigned int __ro_after_init ssbd_max_cores;
> +
> +bool __init amd_setup_legacy_ssbd(void)
> +{
> +	unsigned int i;
> +
> +	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings <= 1)
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
> +	}
> +	if (!ssbd_max_cores)
> +		return false;
> +
> +	/* Max is two sockets for Fam17h hardware. */
> +	ssbd_core = xzalloc_array(struct ssbd_core, ssbd_max_cores * 2);

If I'm not mistaken this literal 2, ...

> +	if (!ssbd_core)
> +		return false;
> +
> +	for (i = 0; i < ssbd_max_cores * 2; i++) {

... this one, and ...

> +		spin_lock_init(&ssbd_core[i].lock);
> +		/* Record initial state, also applies to any hotplug CPU. */
> +		if (opt_ssbd)
> +			ssbd_core[i].count = boot_cpu_data.x86_num_siblings;
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
> +	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
> +		BUG_ON(!set_legacy_ssbd(c, enable));
> +		return;
> +	}
> +
> +	BUG_ON(c->phys_proc_id >= 2);

.. this one are all referring to the same thing. Please use a #define to
make the connection obvious.

> @@ -677,14 +680,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          if ( !cp->extd.virt_ssbd )
>              goto gp_fault;
>  
> -        /*
> -         * Only supports SSBD bit, the rest are ignored. Only modify the SSBD
> -         * bit in case other bits are set.
> -         */
> -        if ( val & SPEC_CTRL_SSBD )
> -            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
> +        /* Only supports SSBD bit, the rest are ignored. */
> +        if ( cpu_has_amd_ssbd )
> +        {
> +            /* Only modify the SSBD bit in case other bits are set. */

While more a comment on the earlier patch introducing this wording, it
occurred to me only here that this is ambiguous: It can also be read as
"Only modify the SSBD bit as long as other bits are set."

> +            if ( val & SPEC_CTRL_SSBD )
> +                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
> +            else
> +                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
> +        }
>          else
> -            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
> +            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;

I also think the comment applies equally to the "else" logic, so perhaps
the comment would best remain as is (and merely be re-worded in the
earlier patch)?

Jan


