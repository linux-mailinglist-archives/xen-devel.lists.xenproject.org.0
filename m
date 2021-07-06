Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D503BC773
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150855.278881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fos-00030V-0q; Tue, 06 Jul 2021 07:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150855.278881; Tue, 06 Jul 2021 07:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0for-0002yB-Tt; Tue, 06 Jul 2021 07:48:37 +0000
Received: by outflank-mailman (input) for mailman id 150855;
 Tue, 06 Jul 2021 07:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0foq-0002y3-O1
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:48:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90f3153a-de2e-11eb-847a-12813bfff9fa;
 Tue, 06 Jul 2021 07:48:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-tq2uS7CAMqS-ihXASyAiGw-1; Tue, 06 Jul 2021 09:48:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 07:48:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:48:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0227.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 07:48:32 +0000
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
X-Inumbo-ID: 90f3153a-de2e-11eb-847a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625557714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdeViXpNFqqsmIMbQEWHKqDd9f0h1ZPI4tHSJtfYxFo=;
	b=LsxwDoZVaF9aUNojgTrc2ypJTiuAfUFwQutEsaR9NegtRJSjKeO97FaKyjpDhkWNZOkSWY
	tj1us7iDdKuALJnZ6jk23zyUJNHhS1goZGGv0IaIRmyC7Po5/XCEX/QkeZv2NstB8r+TmI
	lqd6x5GcNOZm+sTqyBDxGdNxq/O3Hfg=
X-MC-Unique: tq2uS7CAMqS-ihXASyAiGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya+NmQM1o5Nnt1Zm+rKzw3Cu/yZlJcLkegVVEcuJAmb4EQxHXJVb8N3ds2XC2f9FQdms3HY8En6PXD2OQDOnq1KzsQ2gV7q5yyFU2pUjZEWNVbpgP1I+S6cTVOdXFO9t+0D6HqLyhLtWmh/voV4zPwvCPe0IEVQs4Qo6dwEab+zGpHMhb7WiggeMWti8XSEd9r9/S8QUYZF6US9CHn74SKydvG44fTaW4OpAuNfn+XHAHqVoZ4X1s4hAr5pQ4cOvJhsMRZx6ReW8Q4JaN+ho1WD30d7u9ZfzgH9+qVJkM2PrO9avpW9fB620DyOYafz5lplSGVvBnnaqtEU1h2pBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdeViXpNFqqsmIMbQEWHKqDd9f0h1ZPI4tHSJtfYxFo=;
 b=lATi2ugOO8vWt2bmjxJkZog20BCd4RH8qxtlbqVfNSeCDxFGta+J96+VwWTA6VOZxOe2EG6WHqWLB1ClCiLD3iJA+QBt8TfobQnVNTcs6Jec+XYLBA3qKhLh6Oj2hswesfjs24LpN2bjUKAeNOqHvt4VogvjYXXnKdESmkiLrptymLr1AGfuc5FoV6DVf72+RW0j2EreI7JkhWtj+TgLImI66xLqeYOl1K87VqOwVh/Ds99MYescWq5NorcyrPUtJU5PU7a/54h2q5Er//W6mlIlma8e80FvGzPEZ2yygb3whyGRxh8sltovjzQgF3imgbiswl5bVQzmOpA4tlzgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH] x86/CPUID: don't shrink hypervisor leaves
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
Message-ID: <03f80bf0-047d-f940-72e7-7065e55d0d25@suse.com>
Date: Tue, 6 Jul 2021 09:48:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0227.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df5782f0-8a69-4a43-f52c-08d9405273e9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3933683E4F67EEAF5C8F1923B31B9@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DNHjLI5psomhXagZ0cAMTjm2GcXZkLmBPRIJPbly+lLQpQ8fIXHpJ0nglc0i8LM5homIPwXE2eeS82wy3rxpOVOos+deqGKOocE8xhtUypslXatNooU7OJ0pTv2EoCN7wXnxmsuttaIyXWB/+Vud+Gu6gd5HB2MQb5Rd6i9szeZEIivuKaXvOA/rZI+ylBfhD3ISZs8bUPmk4M0GvA5YF3hRogIv0zzwJKJRWGC9hCEOd/Ho6Iz36F8SgWsS1yx5FmV370z/VhKBXLD23iM1vuxTWyUP8xhQQOxW8VAYOMrq4XAxKEVEttfnUFOBJ/tEIGFrnribajw2s6b8MSjwS4Ltyzzss7WlEPe3DYsYoYYnaA1doFngg9X61Huklh2f2CBDxXUIyAkm1LvWVbD389KdJkYGrGQy72zc+EcsSQuS9rdgkXB0Ih2mP7s7RD/jg9wrIb2w56B6TjItU/LZsm6+BiLvkXqDsR/+wlGXanGL6zygN+whX4xX7sYbB1OIY6OdpyYKjxfwe6E0ER0NJ3Htw4w9hsX7YBYNMGTcElhZxrrXfcIIBe1S0bJa9rXzDxxqqEFBaC2SfWDGyg6AsO/ZyA5+2Z9G2dazJMaA0knWFnnqpurbQ3VvELE3oYePVWD+mhmsxEXHwu6s13JEabypHdsE0PJ1e81pdt9qlJoEiMPcI3Kwino82fWK36ux2uO4tUgkOcotMWdoTp2zO4ROhtO6ulJbQpL+hAdIYQUt8FcXDGw7lE9lY7ruhJ3H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(376002)(346002)(366004)(396003)(26005)(31696002)(38100700002)(8936002)(31686004)(478600001)(66476007)(4326008)(2906002)(6916009)(186003)(36756003)(54906003)(16526019)(66946007)(956004)(2616005)(53546011)(83380400001)(16576012)(86362001)(8676002)(66556008)(6486002)(5660300002)(316002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?biswTVdHYlhBTVAwTHVoRlBScFM2ajFtYjVNOVlKaENrbDd5Q2wxUXFmYTFF?=
 =?utf-8?B?UWx4SUZrQUtlU09VVG05eGVFSHpLNi9OYnBiUHZHbWYrVnV4NlJkWk5Dd2pT?=
 =?utf-8?B?NWE4bEh5WlVNazVUa3FCYUQ0VVN6ejUxdjdFQldCdHBiN3FMS3VvOHcxNFBV?=
 =?utf-8?B?K1ZMeEh6azlWaUhzNm52ZHlDNnE2SlA3REtQTDFZOGVOZndVWU9pWTZxbnBa?=
 =?utf-8?B?WC9yRDZTeEN0ZkRJZzlXRlVOd2ZvbW9GNUJZVTlNSHNSNy9vWTBwYUg2VUZi?=
 =?utf-8?B?ODNjV1dhQThhTk9LRXlUZm5SQlUzRDhNVm1QOURldENmL0ZIMlJRNTlScm1y?=
 =?utf-8?B?QWYyRE5ob2kzTGJ5bHZtRGFSYmxxN1l0Y0VZMEQ4SnlBU1VHdUF5V2p4Y09i?=
 =?utf-8?B?NkkzWWhwZ01pMzV4dldEVWkzRzJsQ21jb3BCTW5DSC9TL0tKMnpnLzVKeE5V?=
 =?utf-8?B?QUZBanZ4NXdIT1pCN0NvQVNTNHRIWjlxaWRmVk1GRHkvRUtYa3VIQWY4SEJm?=
 =?utf-8?B?ZEQxTU9RUElEZ3V5NE54MHFCcWFGYzBpdUU2eS9Tc256OXpuTlFzZTUrQk1D?=
 =?utf-8?B?L3dWS2tuYkpYalliSjZkMFZMbTUvUzNzQVlsNGFpUXdTaHRuanZ1Q3luOGxR?=
 =?utf-8?B?RUVmK2tWbFdpVmlpRzVMcDl5SFIrKzB6K1lFRDk0cEUvTEluWjA2aUJyOUlx?=
 =?utf-8?B?N01JZ2MxL1dlNStoT3k3U25HNzJpb2dUZXh2cXVBd3phZXpWelZRYWt0b1Nk?=
 =?utf-8?B?UXArUlRUS09Wd2tJMWFsWEUrZmNzRVpNd1IyNC92cTRacnNUZlpncGFLckVs?=
 =?utf-8?B?MWpxcGRNVUZsT1BzcnBBSUlGckVEMi8rRExUMU1DTERzWnkvT3MyNlZBeDZZ?=
 =?utf-8?B?bGxmN2hiNGkxMGwxU2w2Q0U0cFQzb1ZHK0lFWUtyWWR5UXFWaC9maVM4ZzBM?=
 =?utf-8?B?dTBPcUNNN0ZoTUJob2ExK0Yvc0hNLzVybVRHVTNqTkNhM2M5NFkyNXcvV2dZ?=
 =?utf-8?B?VHdHZkozZmt6U29iVFNweUxnQk1pR2Y5dExvMElSdDZVSFNRVnNJb2c5d3NM?=
 =?utf-8?B?Q0NuZ091UmNEWXEvNVlmTEhXS3BmU0ZKb2c4SHdWM2dxSkN3b2JRY0xsS2t2?=
 =?utf-8?B?UFRqRkxWU0FWamlTTzVtRlVRNG5ONnZVaU9vSWFkUUYvVzJjT1FsdHdKdldU?=
 =?utf-8?B?eW4rTTdVNUZFOWhLaFlWZ1ZmUk0rK1ZXaVBWQWVoRFMvS2xtNUVmbVZBb21a?=
 =?utf-8?B?WCs2V0NLZ3pvQVhIeUoxNkVMc2JGQUZBVW5GMGcydFlvRVo1YzJuQnZYaDR3?=
 =?utf-8?B?MWc4aW52Y0ZtdUg2bk0wTzRveVZQQ3lHeWk3WjAyRWZNVWMvekVOYXFIMzFm?=
 =?utf-8?B?THBLSWt6OGVsSDBGNVVDeWh5QzZtOWdhMHNQczBMYXlQMFBENStlb28xazZV?=
 =?utf-8?B?VnFQaVRPL2FxYms1b1NFZDdwditSOVVRdDdLQ0JhcjQzWk55QXE2TGdoYWdv?=
 =?utf-8?B?RWs2MjMreXR3R241aFZlQjQyR1lORkNWRS9JZCswK0cyMWErVzVxMDRDTUFx?=
 =?utf-8?B?UEZRMDlKdmxmRzFXN3VpenJQb1Z0dmh4bFpHamQxZmZCd3B0MGZ4Skh4NVUx?=
 =?utf-8?B?U09VRjFzaGZrcjE4bVlIMG9Ramh5eTdvcU9SS1l0dU52UElERFpSc05rR1pJ?=
 =?utf-8?B?KzhxeFZvZzhWMGdnbWNkbzBvNjdPZHNmaXdCUnYvQ0VMTmp0WWk3dFlwcDFV?=
 =?utf-8?Q?vGt7/E5XZbq66tISVnlxXtjCAMvIQy/Ipn7mtSf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5782f0-8a69-4a43-f52c-08d9405273e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:48:32.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvdgqo/FENF7oZ2gsvUHiZuzgBm74KNGqCC0zR8x1i2b7dSgzYQ22D4CfPhTmO0fm5K+VdtA87BWBwJW8YRjYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

Andrew,

On 07.05.2021 10:40, Jan Beulich wrote:
> This is a partial revert of 540d911c2813 ("x86/CPUID: shrink
> max_{,sub}leaf fields according to actual leaf contents"). Andrew points
> out that XXX.

if you still think the original change was wrong, would you please take
the time to fill in the XXX above. It was you who asked for the revert,
so I hope you can explain the reasons (I'm sorry for not being able to
deduce these from your [informal iirc] revert request), and I expect
you can find this much of time when I've already taken care of
everything else. If I don't hear back within a couple of days, I'll
assume you've changed your mind, and I'd then drop this patch.

Thanks, Jan

> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Obviously the XXX wants filling in. So far I did not really understand
> what bad consequences there might be, but I can agree with the undoing
> of this part of the original change along the lines of why the Viridian
> side adjustment was also requested to be dropped (before the patch went
> in).
> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -964,15 +964,13 @@ void cpuid_hypervisor_leaves(const struc
>      uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
>      uint32_t idx  = leaf - base;
>      unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
> -    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
> -                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
>  
>      if ( limit == 0 )
>          /* Default number of leaves */
> -        limit = dflt;
> +        limit = XEN_CPUID_MAX_NUM_LEAVES;
>      else
>          /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
> -        limit = min(max(limit, 2u), dflt);
> +        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
>  
>      if ( idx > limit )
>          return;
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -113,10 +113,6 @@
>  /* Max. address width in bits taking memory hotplug into account. */
>  #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
>  
> -#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
> -#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
> -#define XEN_CPUID_MAX_NUM_LEAVES \
> -    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
> -     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
> +#define XEN_CPUID_MAX_NUM_LEAVES 5
>  
>  #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
> 


