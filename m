Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884667972D8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597368.931597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF7K-0007VR-Af; Thu, 07 Sep 2023 13:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597368.931597; Thu, 07 Sep 2023 13:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF7K-0007TV-6c; Thu, 07 Sep 2023 13:32:18 +0000
Received: by outflank-mailman (input) for mailman id 597368;
 Thu, 07 Sep 2023 13:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeF7I-0007TP-9q
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:32:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f532b272-4d82-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 15:32:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9059.eurprd04.prod.outlook.com (2603:10a6:102:220::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:32:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:32:13 +0000
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
X-Inumbo-ID: f532b272-4d82-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELivh1qQZZ1iCrLon1c6PerbKNY7vqvzoPCFrgkcucDQErWzP71/5o/NwTY0wxG0GsKzO4HpJLHyaxtgetmNnnFpawKaQnGb4BBCQeI8+fAReKr0C4jHy45pxeGehUzypYD2o/ZhlaAIOtnAjLiVCxytwAo3YbtMsQKZne/Puu4kOIiTVw7x67OevV8sLKJ/BxSWOeTotk00ZcJPuWpHKgq8C7P0Yvy51nKC+MsX1akxUHuLRdJ5o7DJG/t0NdDtnnmN3+/Y7+ctboTO4l3P27vBovtepfrudaUgt6OFZfDTUMH2Pc3NUoKQHdUgPqbIVn/30TTduFmJKy7L/3aqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV6hFc8kkfNLjI+EvQ52nGlucU71Gwfh6T5nrw61Ffs=;
 b=STig0WBGTrMjrdD8YJrjRasNdZtT1W0BX+tmAnu/40lTIX236OIcAggBCBr9MZ5RT3Vn8w44T16rpM/ZT9+RcqikJz5U/qhIwItCzNW1vwBnwR+T2G66yyqkjU7KydkgtS50rzgswDcWY+hhEgHQnvZos6n9DFkeJiklbNLZ0fAGHW6+uYDE31fmWTpwpqm1mSwbDx+euTGHaeRlqNbiFd7MZ7AtdbJHbmKvr4LUQ3XQX/31Xv9FpwlJEoLQZvmDAb08z2/JBdmyUhOWY19g1feMZptqN6JAXAw48bhVH4ZbQpr3d5cuF8eWHznsgeakY5zAVBbHQH8UB07utMVmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV6hFc8kkfNLjI+EvQ52nGlucU71Gwfh6T5nrw61Ffs=;
 b=yJhYHMCsVGRARpqYknJKZbVmaPj7cseTmqFoWbT21QWyYghJo9IAENUz/8eyWrsM4uSReB9Jk4A0+gh2vfzwj8IkAX7x2ssjuS5uPNAF8DU/SS/9BpY/Zf70GiSKjc3IlaaIQ/o4qhkmkRvDJCSmx7k0azzbxE1SPmGjUNS/zw/OhwJsAThORpS3DfKYBu8POMO3gjqFp723kYvx84RlNEtyb8dBuj3y3WJtP+KejtmVhEaL7r4Le6sGn6Fd/AcnPnbgMv7Ep09ihIiHuiGoiHC/V7gZF3Z9uydDkhJ9mGhyOabXSec5z+h36IBJe6LYqJgvrwl1RwnFiHDZWMFBxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4009ad33-2d37-47c8-6e37-c24d8aeb005d@suse.com>
Date: Thu, 7 Sep 2023 15:32:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 4/4] xen/vpci: address a violation of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693990010.git.federico.serafini@bugseng.com>
 <f5de24818596d88da1c27075c674a823670ee44c.1693990010.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5de24818596d88da1c27075c674a823670ee44c.1693990010.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b83915-fcb2-4033-2486-08dbafa6d864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ni78HIC2w0A2qhBH1B522RadoJ5jCLYCGqEmhPXr4esrLbz2mRZ/MRxhCrKUlSAgFxaEiabp5f0J+pHID6rn8lyIPRS2qMjUxn6Y7P8oEU8KIiteqjg1/Rc3K+MdNI9D/2Cz+XwTKVZ5P3c5IlzC1i4/OEZNlfxMUgSoEajXCMzIfqUOD7M8cq+/asXIZKmz+KaAIobZfmSJZdAJxE8gawVI4x5Xb69xwu9MRlHSn5yCXlkhIgrdy/BZnS7sod7zDAdSNHP7UcZSyFYIBkYzww6uF3ayqliYzK5DBle8JhS4y4GY6RP7LmJdZcHGu6AQ2cLQ+9PtpYzOjUu3Ov0yPDqk3Kgoh1BoOiFaiBmZhZroacnztb+QqCktvxz4qOJ7FQ4PumCsxwnwVn90XqbxmW0cp+tAMLnEgSE9Q0mIRqhudJoc7gDnEtPO41cpPNcx9VusT9NmbG9ssWstNYzpICdnmqGlZKufHif4vCdlN2mV07qn9WenvNr7dqFvXnpFU0AWKBjgE1I0bRdv1gIYP0Ghysqsq3oCt8LIo1WrYKI2WHu6MOJU+rFxnSHsRq9whJbxVCd/0Ykg223oSC6xD+ld3eBZVLEZtC4buaLyXcOWuppv4xWQKY+hxtROg3Pb3h7poxUUwRuCd+Zd/xeFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199024)(1800799009)(186009)(53546011)(6486002)(6506007)(6666004)(6512007)(478600001)(4744005)(2616005)(26005)(2906002)(316002)(6916009)(66556008)(54906003)(66946007)(8936002)(8676002)(41300700001)(66476007)(5660300002)(4326008)(31696002)(38100700002)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekY3eGpJMjlPSmEyY3BJTDMxM1NCMDBVeG9vS05NdlpJejlhNWFiSE1MTzhT?=
 =?utf-8?B?TFViQk5OOWNUN3NkSTZ4WTA2SnRXeFpyMit0Qm9nb2JMUnZINEZaWEliYXE0?=
 =?utf-8?B?eUFyVTNFNFlldnFHSnY5cGVYR081L0svQU55RnJreUpaTTFEZTJucFpGUGl4?=
 =?utf-8?B?dTlmNU9aaWZXSjAzUEI2SnhWL1RGcWwvWmhEb0I4UktZK0VEaWhSdnhWandL?=
 =?utf-8?B?VS9YQkNpTlFxa1FJS3B0UWV1WUxtbUxmZXNrTkNBaXI0QWQwMHB3MVIwVVZC?=
 =?utf-8?B?T0Nib1lrWUx0N2xRU0NnVEVJVllxL1MwaWFmYnhUZis0SHZlK2VwUjd6WTl3?=
 =?utf-8?B?WnNzRUN3NDZ4TWtZZzNNY1NvSUc0bVBPUlpUVlVOSk9kVE1QUlZQY3ZsM2h1?=
 =?utf-8?B?alRZZXFWVGk0NUR5c3JwdUEwSmV1QW9OMTA3R3dCd1FQelp4V3pjdDVUNFc0?=
 =?utf-8?B?Tlcyd0dyTlc5Q3YwMk5oYXdPcDI4dkJocE82bC9RR3FmZUo4NHNGblp5R1dz?=
 =?utf-8?B?RFRnMW14Y3dsQzRvVHNzaHFnNXI5V2tVMEdIUFB6R1lSeWM0dDh5enhTUDR6?=
 =?utf-8?B?YUd5aExkVTNLVnpqTGo0N2Y2NUh0Tmd5REhOcUxTNDNuOWFrOXBzdnRNSDZt?=
 =?utf-8?B?VVdJSjNqdElaOFEzcG0xb1VSbGlxU1pPcHpBalBhdnFybDkvQWFWTlhPaG5U?=
 =?utf-8?B?Ukc0WklCUjJvMlNlRTI2dHlXUmtWRzNKUzhBSVFNZ1REbmprQmQwcFY0YnNK?=
 =?utf-8?B?UW1GK1B2N1pJM1BkSXBwRzN0OExTelVoMDNmMUdPUXZJdDlIVys1em1WVEZx?=
 =?utf-8?B?ZzV5Ly9CV1BnV2s5SmxucEF1Si9hWGRPVXVxOXRKZXU1YXBvY0svUnExNmFO?=
 =?utf-8?B?SGdlczc1Z0lrRGJCYlZEaWVENmtld3pxbC80TGNXOTdEaEtmT1BzajJRRkY2?=
 =?utf-8?B?bGFHT2I0TlQyWER2NDVFTW9uWlRBVmg1a0ozb3VRYTFKMXpRVnZuVUJaRHMx?=
 =?utf-8?B?MTdaUXlHZmx3a2d0RnpKblgzczRyQjBaN295NkorUmg0dzN0SnpXbnRmUjhZ?=
 =?utf-8?B?R1FxZ2pMVHR0MnBVajNFSjNWekVOdHRQN1ZMN2ZDN2FlUlUxMWY3SjZDZmhw?=
 =?utf-8?B?UTJ2Nk1raVpMTWlPOEZHOU5SWmFWYTE5Y2NSQldtSklHY1RsMkIrL2NEditU?=
 =?utf-8?B?WVNUUEJwcy8vQUI2d1hrY3g4OHN0UDdDNjNMY3MrTFhGSGQ4MkJWWWpzRXAr?=
 =?utf-8?B?TXJ4cThsQURxa2JWYW5BalNyVy9iaG1hNnZ4THhGdytFM0lLRU5tTjM4S2pY?=
 =?utf-8?B?Y201Z0IzTFlBYThPTldteWVpT1ZFZXppV3NMSVoydk9qZ2VqRkVHMnBwSklI?=
 =?utf-8?B?ZFBBMWpXTytLQ0diL25ZVDI2bklSNzA2M0ZKWlN3QzVMK1l6WnV3UG55RGhR?=
 =?utf-8?B?ZlRpeHVCSW5pRHIwUjkyQXdmWWRVaGE3eHpXSEZiSkFwTGQyTFEyVFVtWk9G?=
 =?utf-8?B?aGZUbm5JdXVJOXA1UkxTNW54cEtNcjFGOXNNNGpPSGhIeEQ0VW4rRE1qekpK?=
 =?utf-8?B?cnN0ZDZmcThLVGFBWUNKK3dMNjY4ZncxYyttcWs1MllyWDZXSDVOQVJKSldM?=
 =?utf-8?B?azZVQ2lxdXpCUms0K09UbjZXSC9DOXNtM0k2QW1nMlo4UUo1czJqK2UrM1kv?=
 =?utf-8?B?ZzluZjF6Q1RRemRCcU5DOWRiWWxCQTdVaWRVdlB4ejBFZmU5bW1LcHZwdDNP?=
 =?utf-8?B?aHhkQ3VnK2JiNUV3UDBDTC9uZ3FpQytvcWFic1VqL0lkRmpwb2ZnNWtEMGVw?=
 =?utf-8?B?YmxHc25MdENHU1VManlBc25Fd2p2NlB5ajNuaUgyY0p0cG9OOCtnN250eEdD?=
 =?utf-8?B?TWNDcTVLbHhOdUgwUWtsdHo3MDVXUTh4Z2h6OGtJVUdWZU8xRjl2QzdBYlZ2?=
 =?utf-8?B?bWlsSGVsaG1wVG9xMmpYTEF4UVZramFmNGxsMDN4d2R3UXlHWERZbnZLN1pZ?=
 =?utf-8?B?c1I2SFR6Z1Iydm1BUTBpdVpWWWxBSm9QQjlzODlPOGlQTWtuRWRndEQzQWxv?=
 =?utf-8?B?QlU3Njl5L2k2ZTJjR1Q4V0lLckY2N09jZFBzZjlscS9XQ20wZ0s2RWhIWWd4?=
 =?utf-8?Q?2lZLruNVtizENbDjuj7UZ25Mz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b83915-fcb2-4033-2486-08dbafa6d864
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:32:13.4502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+hknhIQkXSWM7pirdIXihScJKmEEPPwQnl1/3C0AvwfmMNcQMCU7A7dMxUBPLHBFoTo8wbfi4DTz74/ZhcT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9059

On 06.09.2023 10:57, Federico Serafini wrote:
> --- a/xen/arch/x86/include/asm/hap.h
> +++ b/xen/arch/x86/include/asm/hap.h
> @@ -30,7 +30,7 @@ void  hap_vcpu_init(struct vcpu *v);
>  int   hap_track_dirty_vram(struct domain *d,
>                             unsigned long begin_pfn,
>                             unsigned int nr_frames,
> -                           XEN_GUEST_HANDLE(void) dirty_bitmap);
> +                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
>  
>  extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
>  int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);

How is this related to vPCI? Plus if you change the HAP function, please
adjust its shadow counterpart too.

Jan

