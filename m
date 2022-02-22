Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F14BF7ED
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 13:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276751.473027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMU01-0006iH-WA; Tue, 22 Feb 2022 12:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276751.473027; Tue, 22 Feb 2022 12:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMU01-0006gU-T1; Tue, 22 Feb 2022 12:10:33 +0000
Received: by outflank-mailman (input) for mailman id 276751;
 Tue, 22 Feb 2022 12:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMU00-0006gO-74
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 12:10:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c466d01-93d8-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 13:09:34 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29--tQ7vCIIOzyVDo8zK9234Q-1; Tue, 22 Feb 2022 13:10:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9254.eurprd04.prod.outlook.com (2603:10a6:102:2bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Tue, 22 Feb
 2022 12:10:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 12:10:27 +0000
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
X-Inumbo-ID: 4c466d01-93d8-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645531830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMSs3Mnykf+UVOFzLYEo/yZydukXZAZCFOlc+Trqxms=;
	b=AkMRoeYWRItECvdyMwT0n/6Br/naOztSfOF3OJ6e9xnVVi/NTs+DsKR6NoYlIJHaDaS1k0
	nfaE6HsXTA2VqbFegFBXRij3m76twhdEOr6qfZeeJ8OHKFnmnjP4Y/hg5d5U3LqsBq3p8l
	iNHehBfjKinkxEBwV79oh3i3Vev1G60=
X-MC-Unique: -tQ7vCIIOzyVDo8zK9234Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IH+OBYVTQ+6+S5mKAPRp+zV6HtAlpCNLRLMgW5MeEIGS4CpA0EB9jxpMm69cdjxYxaZPVvFDg/X0wZ4Si32aNACglV3mMniRdnd9oW7K9gH+Tj6GhjN8EA+TVZcCT57HVYZd1oXzzNb3KbVnNpVpRveM16qdgI99ty4enQ4jZJI/u9IHkezvogf2f0TuaIq6SCVaDH2nXfMQ+yJ79Io43772ySW1DhDe79LPaO+NHzE5qNqzHtZ1TMhH8tBq2cCLcZ9KN2btuxNS2yHnX2DKITH82t/Jz9xyILl2wkj3FV7UXHtJmKZ4RwecvvZmNZhnIVIzU4T7mpu+VLDymdVezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMSs3Mnykf+UVOFzLYEo/yZydukXZAZCFOlc+Trqxms=;
 b=Mdh40Yj6N0FLEizutUbQktv+bdLW/2dXeC08MfgE9mo2HTHC0eQepHyO4XssH02QguU4UESwqLtocB4W2i/yjD7I4M4zk/dfwrvB6yX3SUOCianRePWfqglR+H5nGU4F8zbBSWcno0GYa80eLCzM/4EmiD0Y4YqNyEmrT5ud54fDTnYNNMPmqa26aRatRZfY/K8ZeaBTa4DuLWmm2xVGeJpzPLOjxIOgU+Eh2W6YypreqfpFO7iBwl9AIyUapwGjQEwM8PHpdrSErtwu1h1kmfd4PLpfwuHjSuDJvpcj9/hLxeVZRGzIHlMu0Vp56711HKiy5i2nzJu0hTjSv09QlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <877ea1c3-d542-de98-3863-86f559f4f6cc@suse.com>
Date: Tue, 22 Feb 2022 13:10:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222114711.19209-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35494f43-8a74-4a41-26e1-08d9f5fc5039
X-MS-TrafficTypeDiagnostic: PAXPR04MB9254:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9254CF79703FCEF15CE2ADF1B33B9@PAXPR04MB9254.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ohj9JscMkeRwyJUyuvccPqK/Zdtlt09TJ5NGGejQIdL3HX0j83q92B2CgQVTfQ9sQddTfRx62qe5hOb0NYAJakZlaivf/vhV9Z28PkwPRcADXIsye+DanJf2hSdd9FsgAkSzvrUWwwRb4q4XEC4xe7GTOc5Wb15Sgwx4BfHcPrSlPbbp8+MQ+6aeQnKxgMK4i0IQ6EGGg8kN5AROjSu0iKbkBxuHSNKPvPQ52PFgGMQYit1Pq146mVAcpq8On3yOUqwifXlQtrGYkDnCOJ4nCvOrTSSNMmiD5++ZE9OKFIIeT4N0A1ujGGOA8jS197nHNvD0IYUg2yClzfToj9bZSN8THEa31RHdGjE9fsWD5SrxzEr3pUybmdt+8btHael1UtD1xe/4AppeOgRO37zX4fYC36e2j6il3vIg7XG1r6Ny1Q22JrTkc+a7nCEo4vKjl61xoIUyOYrcNnANPcw57TXc+CpDP9g3NMxW0b1EEnZf4JemMJJeP9GsjsRKB1nLHMV7FaYCbtcrzpg0SmEKIxC5RqqLrrzTPlqZ7OJioOR6NLJAfzxjtnEsr3p55+PGdZ1Gyfq9lS/jHC3bYQZEKorSIKIFfffeVbaOKU/FpilycACkruQ8HcdzM5gYCJOvpflGEy53IL8l0KTLqgutQrjT6PoCaFekegpoYBQdnxmDLM6UFE5+SoA29NxipDwCFM9VHDyz6rCG7ezB8i0/bs9LQmxJPWCcJmX2B8W7ccs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(6486002)(6916009)(53546011)(316002)(508600001)(54906003)(2906002)(31686004)(2616005)(36756003)(4326008)(8676002)(186003)(26005)(4744005)(66946007)(66476007)(66556008)(8936002)(31696002)(86362001)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDRnK2I2UUdNQTNXRmNUYSsxakdQTnRYZDJnaW9UVklrYk9TVFQvRmFFTnRM?=
 =?utf-8?B?TFV0SUQ0SDJ3SkU0L2loWDQxRUpOYlBOYTQ0Q05xY3NnbnBCNXF4VTl5STdz?=
 =?utf-8?B?N2NCbUZCZ1c0dWlFNDJOM3JmMGV1T3h4RVVhVmlWdmJ5MWY2NXRLMnQ2Nmlz?=
 =?utf-8?B?b2wvUFpMTWI5TjFOTFdIaW1uUTM0RW1wa1E5VFZSSVd4V1FNNnl0YVBUdmNR?=
 =?utf-8?B?T2dYSzhWYVNaaVJZdlg3M0pUakxEVGI5ZkRIZ3BITWtNdGI0MGJjSlhQS0xs?=
 =?utf-8?B?WDE2ZUdQK0gzaUlEWjlqZ2d1aVpGQlNTVWJ1bWdQc2grbXR6d0poZ2tIWEdF?=
 =?utf-8?B?RnVaSGJBcWY3OXNqZnFxRG0wdXUvWEFadzFhMjJiK0Zqd3pKWEpFdC9hazhJ?=
 =?utf-8?B?Q2hhcXgyNkFGR3NpZkRwNEZaS3dnVHhwTFRLWFJ3Z3pPU3hOQU1pRi9TcWc0?=
 =?utf-8?B?alBSYnE5QUJUUXN0Y1N1bmhYTzdveHZiUDJ4K1QySWMzMCt3WndvWVZObVA2?=
 =?utf-8?B?M21EaTAvWlRpYkFLQVMybDBzeTFPMGxxSFNxdkovYUR2VGJiQkJnSlZURzVi?=
 =?utf-8?B?ZFRoVGFmTDR0SU9TODRncHlqM0NJQmdsdkdwYTk4ZUk4QWxHM1JJN0V0RnY4?=
 =?utf-8?B?djY3MXJwZUFFeDU2eDV5UTBPUWVTWDF5Tm1yM0FBeVlBd0JoNHNkaWNWaE8r?=
 =?utf-8?B?RWlsUThCcEdYMnVFWmtlMEowWGNWMHFWVEU2NG53N1cyL2lXeXgybngwZjhI?=
 =?utf-8?B?SGxXZlR6SHA5NzRxSDk3NmRIdys4Uys2QzM1emR6dDc5VTdqU2ovcEpUanlz?=
 =?utf-8?B?d2NwYWF1dUFBSExsaTA0S1E2WWF0OG10ZUcvZ3RnOFdQTFpNS2NGeUFDRURj?=
 =?utf-8?B?SFJmQVdvenYxR29JZVArZ1lldTdTRjJMVnFCY2l5YUJ5R21vNEVYdk00ZG4y?=
 =?utf-8?B?V21GS00zSG5UZU5sL1k4SHNjU1hXMjZwK0VwU0lYVlZvcEd2bUV5UGk2U3Ry?=
 =?utf-8?B?UnJRN2phMnc0K0FGeEtPNUszK3UxUEoxM3NLSzdrTHRuZVNOMG9zL0NJaDh5?=
 =?utf-8?B?Q0xsTURWdFlEVXVxYXM3dkFLL1pILzVvWjh1b0pIbUZCUlMrSHg3cUVLamRo?=
 =?utf-8?B?LzFHd1d4VDlNK2s2SGlNUFdiSjVwcHhSTGtMWnJscnNnNFdvY1h4R3FtT1Zu?=
 =?utf-8?B?enBEZk5jbmx4dFR5M1NCOGdRanFIV29KQnZXbTdib1o1eU1IWnRPTFcwL1ZT?=
 =?utf-8?B?bHhHSHM1VGxVRnN3cTNFRHpyV0ZXV3YzVVVQSWtadmlVaXhES0pJaDhtcU8z?=
 =?utf-8?B?bkV6NXpjMHl2azRuZ0JhQWZod2tINCtZMXVJQnhnTG02Z05MamdnQStNc1NX?=
 =?utf-8?B?a1pxc1ZUSGVTUk0wSE9PMVRJQXhJWlM2empOVnF6a1c3NFpFRWQ5aTlkRVNn?=
 =?utf-8?B?N3J6L3BKMndVUm1PVlRldHo1eG9uN2t1d3NPdnFDOUl1WWNKT0FYUlFmUmFu?=
 =?utf-8?B?TWJLb2dxdnZBNmNBaE91VVVuSmViZFZEaFdzK052Z2lqUUpoTXlBQlZ2b00x?=
 =?utf-8?B?b1NMdHVQMTYrWmVmemtIWWVPRk5vYVhtK1M4ZEFYY2lSOE5WV3dOVW5NZnlH?=
 =?utf-8?B?TUcxc3NtYmJhODRDaW1qT1JtM1NhL0xMTjdmOVlad3hUdWlMeS85aEErN296?=
 =?utf-8?B?UWpZSTlyNm1zOEp5enhHZkdMWmtESnlaV3doTXduN1IxVVN1ZVBnSE90V3Vk?=
 =?utf-8?B?WUdleWRjbWdKK3FyODBURnNmRk9FVS9CaGVvc0N1ZjJRUDV6UUlaRFhEdE1U?=
 =?utf-8?B?b0pEaVBVdnMvdkR3dUtzOTJuVDFSeTJvZjJReSsrNGoxRm1IZGhhZ212QzJx?=
 =?utf-8?B?a0NsTXlTaTZuQUc2NEN2d3U3QzlxdmlZSEFQdGpXelo4eEdheWdUSk1oRHhW?=
 =?utf-8?B?Sm9FVHNsd01LQlJRMStLUk9FY0lsVHo3YVQrMDZjYThjclZxaDdYR2E4ak5H?=
 =?utf-8?B?cjBtaFFpOGRYM0JOekZ2bUJMYTVsclNBSTZ6U0Jod0FjcmRDOXpxL3lsK2wy?=
 =?utf-8?B?OFJGMWhsZU4xdWt1SG5INGVIS2pwQUQxMHZ5anRvN0hEdzROcTkxclVVMGdM?=
 =?utf-8?B?RnhhQXFhdkpTejI1NXR0MTFSM2ppWUQ1ZGZmK3VFbUkwcFpCNHNhSS9uVnlX?=
 =?utf-8?Q?ARNiZgezvvrN7wSPhpRG2L0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35494f43-8a74-4a41-26e1-08d9f5fc5039
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 12:10:27.8309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tfi9WrSa9+Mmwizd9V9iMxKYLIpMzkKhWXJ+r1vwUsAI1DFcMtBd6tA7x1ckgZxN6iTmS8FeAG9YsREk8RsQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9254

On 22.02.2022 12:47, Andrew Cooper wrote:
> Most IOMMU hooks are already altcall for performance reasons.  Convert the
> rest of them so we can harden all the hooks in Control Flow Integrity
> configurations.  This necessitates the use of iommu_{v,}call() in debug builds
> too.  Switch to using an ASSERT() as all forms should resolve to &iommu_ops.
> 
> Move the root iommu_ops from __read_mostly to __ro_after_init now that the
> latter exists.
> 
> Since c/s 3330013e6739 ("VT-d / x86: re-arrange cache syncing"), vtd_ops is
> not modified and doesn't need a forward declaration, so we can use
> __initconst_cf_clobber for both VT-d and AMD.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


