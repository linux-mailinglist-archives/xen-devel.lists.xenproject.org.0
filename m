Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2B50671B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307871.523217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjVS-0003fu-Vq; Tue, 19 Apr 2022 08:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307871.523217; Tue, 19 Apr 2022 08:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjVS-0003dc-SI; Tue, 19 Apr 2022 08:46:42 +0000
Received: by outflank-mailman (input) for mailman id 307871;
 Tue, 19 Apr 2022 08:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngjVR-0003dW-Ba
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:46:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b0788d9-bfbd-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 10:46:40 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-30kMAKx-ME69Q3IEkq9Xbg-1; Tue, 19 Apr 2022 10:46:35 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6318.eurprd04.prod.outlook.com (2603:10a6:803:f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 08:46:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 08:46:33 +0000
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
X-Inumbo-ID: 3b0788d9-bfbd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650358000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7PxaHUOrgYXxz8Eg25NMAmP24bRqiAmVQlVEwg2qVk=;
	b=UUEs9jd2V8keZHboo75dz8w6yLih+9CfBJnbjcLC7AM18smdbJiV+fl/SJb33c+NxjZ4Tk
	QINZocNUzErRNnIxVob0s/Ty76sWvKVyuA1nbygsbzg1g5iNNAYt9/biiOWdPM2wDVGRRp
	Le9rK3ytfmm1I2CV9LARlpAx+8heWlc=
X-MC-Unique: 30kMAKx-ME69Q3IEkq9Xbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4gk/5AjEc6xmnf/TsAhPlNUhanmqu+Kh8HKZbJjdMBJTE+YtMIK90ls312f6OSU25qR5RuV/k2oddHo8c2YwylMSKG99ase/tZO/JDjHmkrdpQohski5YziJmR7FOm8HxGxrik6xi5LlRYBOKT6heo0icd8Cylvhscj1+AcRcx4eELTLxOtrHdveNAov92xRMfrgppW9jfUqevqa7s5auf8ZuMkGat5jA48VtK6bg3ACjMDodkKYrRyPbouNuDSjLxcMVcG4ktrXvD2XxYMPKXZsK0crbOhjUN8rK+/r1zydXLza9TGwXE2xGJ2ZHiVZ3bh4/cWkG6x68KBvXKsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7PxaHUOrgYXxz8Eg25NMAmP24bRqiAmVQlVEwg2qVk=;
 b=KZEmQqvhcH/ND0/eDGegIKFrGIX74wWDEj5druJvv9VlcisIGxjv91KGHglZKg/0YeYIqgA13oO+gGTffTAAxJR5GKjSSSx8ciuqDl71HylJ9oByNmYYawFs3MfFCjfl+kL/dsoXn3uWJWZppCGMn94LQkc2bhMS8hCSSwKxJtNDAjxO13dB5IdM03rrnVyBA1RQNleobff7YaYGxJOQdJTxv2OJoYa3z465YFQoMB2syOJjOhUp6iBKOPLKKpKGroOWGUno3DS38Wd7jz2zQzaiBRGgODKdFZoekSF25ACRfiGWsUulwDQ8699GYj/kUxt7Mo1bw/oP1FtElcl0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <505f2900-4f0b-e3ca-93c3-705028c1e826@suse.com>
Date: Tue, 19 Apr 2022 10:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2 0/6] populate/unpopulate memory when domain on static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0036.eurprd03.prod.outlook.com
 (2603:10a6:206:14::49) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2427c996-22e7-48b9-563e-08da21e11b51
X-MS-TrafficTypeDiagnostic: VI1PR04MB6318:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB631838A0C299E9D629D7E57DB3F29@VI1PR04MB6318.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D+0JlO2JjmG/D5oZpJWvF2biemaA5ztG+UcVvfCnwR8QeIzPGEOfNX/p1r1dogQTuAy+hdgJOS/0aosLY/PZn0FI4KfOS4oYoHaLytsH4EJQk0nyOe+xjam2aKiAgTreaNDNWUAUH4EggMVGxtZGLR9TrV/mnXLRHd3BFNPZBqPARyhUOdf0aXwRLT4ZF81zBHUUlej9wOaenwUISFNy01YZym0Ex8oAKJkS9t/EOMya1OobmUFbPbptq/GxLuSUD18lGwqD3juAt2ngXgkWBpZ6ZqWhyZiwf8emJHkWmfK6zEGCOohkx8NWlekSJKuICprfb9u2x6uMyWC3o2LwoLOqhsU6GOhHFVou4UxNT6IIfwrxTnbLSbeZvWscIjpC9kRnt8dOkpRkJuF1f66MipCP2RDWYEBfxtYEVnLeiPytzEnGacFn6tpnavoy3+Ts56GxWL8PF2aciJ4yMJDC9NFo3NFEaPNK3uBOfJgFVprPV3Zf8R46Pds6o1azTjt/d4AWB/hBMsMb1ZGB0MeiqMiEgFnWFQFSoxXzXe6DHa5fuAamjqALBR7xPhYjBwYVdMaIcYw1SiB+PYBp9Ch5XqzV/RbzidpQkpdDvm4O67G1R7j21U8q6rmGV19TpjblZNb/qv2ULWVflxoqw6DVBtOXSf7NXyAKwTbPeTRVWK6crp2nhYmfJ9LWWtQWvrpQ1/8A1HAK1pybpEy2bongVb9kdtZpasOGfpwQ0MMo5FVrj79HiYv41TYgCQAQuq0W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(86362001)(508600001)(186003)(6486002)(6512007)(8936002)(2616005)(2906002)(5660300002)(53546011)(6506007)(31696002)(7416002)(36756003)(66476007)(66946007)(4326008)(8676002)(66556008)(31686004)(54906003)(6916009)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0R3Rzk1dUdPNmt0ZDVaZjAwNE5sajd1SW0wQlJQRW9nS3BQQzBoc21qQVNk?=
 =?utf-8?B?Sm95cXdweVI5YjR5THRKVkJrQ3FGeVNYMzVMSUFHb0NTYzlSZ0cyUERxNGxh?=
 =?utf-8?B?K3FvTFVOQnNSYU85QkIvaGdTdXI1dDI0QUFLRFFMSXFRM05vbXBLMWFzMnQw?=
 =?utf-8?B?b25ySHh2TFRRSHVEclpkQ0JCNXVZc1RYb1JIayttTFVGdlJkb3RybC83OEs3?=
 =?utf-8?B?WE4rRUI2Ymw5bTMxRlhHZlhxaFB2TStZWFpmMThmdnNwTitYbXA5L0xoQUFi?=
 =?utf-8?B?dmJmOVVXYytQU0lIVGlNTzd2SFlaeWVZWEVUSUpYSDJwMTQxQ1NSRjNMYXp6?=
 =?utf-8?B?MVFXUWMxTndMTG1TbklMWjdLR1hPRi9nRHRJcUV3QndXdWVQaUg5SmthWVp0?=
 =?utf-8?B?VXVyMDhhQTlTYXpINVdvUlNqcnJxNXZPL2tEZ2JtelNqakdpQXMrUmRucXJk?=
 =?utf-8?B?dmpjbmtjZ3UyT2VYYi9mMWp5eFh0T3NKZ2x6OVlORVNwd1ZBdXY5OHVWOHF5?=
 =?utf-8?B?clZrd0tIOHNaS2VIeGR6MGZNNVhwME92Q21GMFErMjhkZjFBcnlyVHZrbnpK?=
 =?utf-8?B?YmV4NXFKdm9vcDV5Sld0SEVkeDFnSGpLeGxzam9IT1F6QVVPQXpudUdMUDdu?=
 =?utf-8?B?eUljNFg5RlV6Q2NValpFdDZCQUNKcmdZY2pCeGpJZnNEbTBPWTFKbXFVRjB2?=
 =?utf-8?B?eUk3U1R3K2NQWWVqaksxTzdaTjA3ZUs1aTJsT2wrRHVZMzRNelFYeVpSUkNR?=
 =?utf-8?B?SDQ4SFREOTgvVGxKTXFnUk5iMGxyVms1alBsZG9hdVJBNitFcC83V1ZTRStF?=
 =?utf-8?B?RDI0VklQdFdvYzU4emF3L3l2TnVabEs1RHRtMjlxT2NKSTkzKzdNSElFMGw0?=
 =?utf-8?B?NW5hb2VqdmMvSDk1Ym5WWFNXNnVFaVczK2JESC9KZFVXVEhRS2dpdWkwZGV5?=
 =?utf-8?B?c0wvV05SVnhxS2NmK0lpcTdiMnFmWnA1di9NR29Cems0OTZZMEFCYmp6Vmha?=
 =?utf-8?B?M1VycGRkQkROUUJkOVhmekhsZUdlckZMbWZja3RoWWhHUDd5S1JpdnNVVysy?=
 =?utf-8?B?QWF3Q09OSlB3VzhrZnJLS1krV2t3ZkZYd0JUc3VZT0ZaVzUxbFNndEthUFg2?=
 =?utf-8?B?b1pUdjBoM25ydHR5ckxjTW9CNVp4OWZCdU1jeTdXN2J2TitIc1h6NkIwdURv?=
 =?utf-8?B?OURvakJDWXhzT0U1Zm1hL3c2dFBKeG9YS2FFNGFmTldJczZqTGwvYmRZcS85?=
 =?utf-8?B?bFY1bDlESXZ4ZXA4Vm1nTkc5NGNwSTFwNENya2FIbk9tZVdUUFVabXduNm14?=
 =?utf-8?B?L1ZBUXoyTkpCWnhjQ1RVSzVrcGNiaTBqY3Zsb2JjSkd0ejViTWJpbmN3bkts?=
 =?utf-8?B?OFgwYkpsVnhlMGVRVWIvcmU2OTJHY3Z6NkZZd0wzNVJKUjQwR1VUWkp0cjhi?=
 =?utf-8?B?ZFFrQUIwVEtJcnIxWWE2dnY4ZDlNdTg1MUdaOXBDa2RQS0JiNE9xcWJYUXRl?=
 =?utf-8?B?TjU5U1kycGJCLzFRZ0xuTTQrZjhKWk5UM0drSEZ6cnZDaFRvRHh4RHpITytw?=
 =?utf-8?B?M25na21FcGpSNTdPclBpKytrS0hxZXk2VVhEekhVSHl1dXRxWlRSc29UTmIy?=
 =?utf-8?B?RnVkaVpjcHNEdnZsWmNPMlFFcGZEKysrOW9KY2hCc05LeGhwTi9udVlzMExO?=
 =?utf-8?B?TzZFVkhsQWw3WTg2Ylp3NldHRDA1RjNiQWNZOFRmT09XcmlFQW9GT1B2cEtk?=
 =?utf-8?B?TWdXYTNZSHVmZjRXSVgraWVJZWxZd1g4ZXlGdHlkZ3YvZFBLZnpLSm5EcGh6?=
 =?utf-8?B?d1JMQitVZllRZEFkQzNlbEcvMVNna3dWSTl5djZsY3BlT3pKclJNZ2ZCZGR1?=
 =?utf-8?B?cVBIa1A3Q2lKYkFlN29zL1FHaDBWc2FYeURTcHN4OHdVV2Q5N2l6cHphcWky?=
 =?utf-8?B?SmNMY05uRDdTVDl5QmllTUtEVElSSmRLd2JBSkRQVFlwS3hubEh5eU9zZjFq?=
 =?utf-8?B?b0l5Y21KT1JEZi9SVmR4TFBvU3lkdGkrZTMrMnBuenp5MnpHRHZGaENPblBC?=
 =?utf-8?B?SHZGQ0VOQmxxMUJ4Z3hlaGFUNkJwdU93c1V6ZG55djFUYjh6cjFEcjFxOHBG?=
 =?utf-8?B?WnRWbTVsZDBBS3RWc1E2NVFUekRlNi9VRTVXZFJWOHlyQTNhVWdmRndrcnBp?=
 =?utf-8?B?YnlhSVhaWDJPTVc0a1I0SW1PVXJiQTJ1MHlOTnUzaWVMd0NRSTdIS1pwam01?=
 =?utf-8?B?aUl6ZEZKVVFiZEpERWIycTZUTmF2Z3hQWHN5a1BPMFlDeXpWNFM2VFUwUzNt?=
 =?utf-8?B?aU9VcDVtaWh6R241N2NBZS9OMlJGdXRlWjQxZ2tFTFNsUDJqQVo3QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2427c996-22e7-48b9-563e-08da21e11b51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 08:46:33.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUNmUmsfmfRvV8g2WUsRiBmem5h7QF0uPAeM7pjxkpvFL3WBuoi7Nv3eaDDtc43Q9JM3mq7AkYaz/LsvCC0+ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6318

On 18.04.2022 14:22, Penny Zheng wrote:
> Today when a domain unpopulates the memory on runtime, they will always
> hand the memory over to the heap allocator. And it will be a problem if it
> is a static domain. Pages as guest RAM for static domain shall always be
> reserved to only this domain and not be used for any other purposes, so
> they shall never go back to heap allocator.
> 
> This patch serie intends to fix this issue, by adding pages on the new list
> resv_page_list after having taken them off the "normal" list, when unpopulating
> memory, and retrieving pages from resv page list(resv_page_list) when
> populating memory.
> 
> ---
> v2 changes:
> - let "flags" live in the struct domain. So other arch can take
> advantage of it in the future
> - change name from "is_domain_on_static_allocation" to "is_domain_static()"

I have reservations against this new name: This could mean far more aspects
of the domain are static than just its memory assignment. Was this intended
(or at least considered)?

Jan


