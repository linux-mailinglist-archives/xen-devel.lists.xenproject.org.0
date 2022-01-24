Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3634984AF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:25:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259920.448711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC29J-0002wQ-Bw; Mon, 24 Jan 2022 16:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259920.448711; Mon, 24 Jan 2022 16:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC29J-0002tX-8D; Mon, 24 Jan 2022 16:24:57 +0000
Received: by outflank-mailman (input) for mailman id 259920;
 Mon, 24 Jan 2022 16:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC29H-0002tR-Dm
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:24:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 292c2866-7d32-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 17:24:53 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-FVMDoZwRNOWNThcwuZG_8Q-1; Mon, 24 Jan 2022 17:24:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7273.eurprd04.prod.outlook.com (2603:10a6:102:89::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 16:24:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 16:24:50 +0000
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
X-Inumbo-ID: 292c2866-7d32-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643041493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJCpdDZul5aslzNFf+cOi/5hQjqSyEBcGBEvuVE1lGs=;
	b=BP4m3ZB3osTL8x6WHuDktMEHSYFQpLarWlRbfpK7vspPiUKoMVoHsnKHwnXJDBoA7AoJ8w
	6dK7eSSrXuEwuInzLklZqyrcbi5Se4w2n+hCTlbZlxoIJjPzLtb6G1CUl+5aWuYrfFjuoV
	+SyixZQ2oUHHB4BUmbg6/juDcHHF9gU=
X-MC-Unique: FVMDoZwRNOWNThcwuZG_8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf/C3pk5uufXXxXCJOfVZEa+lArlCDfQgwsoR3Kr98Bin890kVAygXbfBNoZPvy63PfLpo+IfZaWB8slyxEkjhAGP+4Elt/kl05a9QH0AXmiod0vc90CO1oRNDtqG6zbvXmgHvYGa1gK+akheS4j2IMqOmiroaaUiIaObJymjUCHA6YfRYcp1B1FVxmhtMunVAOp4oPYJWr9m09L4TSKpBH1w81sLIb3fwXFKDNPnc7Jb6sf+gnrAB9np5IsCLDZkZaL88viB7WNXPnVYkGWqrcutmldOLKojH4Uulkz4Xjn3PIEUhoAOQCeQ6hxkrwrbg9gZun7nHVNZDr2OcUwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJCpdDZul5aslzNFf+cOi/5hQjqSyEBcGBEvuVE1lGs=;
 b=jDC/M7HZusL7YjXhx4/4KNdltAZEKDuK72nK3eplq7MC3cYbQbuSqlP/nfcv5puP/r36ffl/Zgg2rGXzsEKfPaUmYDQzAl6fgPtF3JYsiVA4bovIVjbpyqQjKObOvUHHiqcMGauaLAq3tnhFqwrdQyKdOJxLIkiPZNnTHc8y74Qy4kcmcjHvCmVEOV5BPk2bR/hA8cBDaAPdfDugr4qcwrCJygj/i+Slz7g3ny/VT+ktg1eNpyi2JW2NmZiZLUwp1uE0uaxm4fktsduqq78ECTIn5ILG3H53LtOcu7mW/pp4WLeMCw0dcNmSD8BC133iW85MwPN2W6ko5vhf30BA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b5756ec-2ec8-c796-e894-4cf4cfa67ff8@suse.com>
Date: Mon, 24 Jan 2022 17:24:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/37] xen/x86: introduce two helpers to access memory
 hotplug end
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-10-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-10-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3100017e-2ea2-4e0d-d5bd-08d9df560b92
X-MS-TrafficTypeDiagnostic: PR3PR04MB7273:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7273534DF258B8594BCF5FA9B35E9@PR3PR04MB7273.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KnAld3YBWUZ+Za7DEQczkpSvf3avc6ZAQbUz1bs2wUv0elzriyZLMxyGCzFoEGrg1TrD/0vG5nHLY7X254JOAOI2LEPS+bH5RFLBDiNwFEeEOlHZTpU73sqNzQyC9aoHEyBIH/YuruLl5jZSvSP3gno4jd3IrgOcJil8mjnwXoI3UJRk/GU/TtpnTrmOzL9rFJz0LkfJFidvf4E9ylaiJDKfsIVh/ej4gvMHo9yCfrSNqH1B9gP2uy0fV3goVet4Rm0kcD6qMgCeGVbqDnXUERdJC/9dvl4Weglx7+b2IY8kXSsgROAe3K3AXUQFqN0i4B9YiVCW95LvOWZasX9OVb9bLUlNE3ZQerKz+eLZbDQ0ThJ42cyhuU5eBgDgR4d9x0wkTztzwLxqF/Em6KxHyLqhbeOUSygxoRU+3BwIgttOsYuMnOKVxxCfyHqAu3aetO45wyQ9Qvp70vUcQdt5mTspgIgARaqrngTNbiCJf0vvdvdO2NGJDSID/v1/jF1u6765/5s9M6/ZEM43vJeAOIfoQdhUZYQXQXCwRs9HnBFKOTmGEZf2FSJNJluBx6G4RkNyXIn1okxwa6noQWGaiL7OJrVrN+nkAfRoV3N7IFWArhNcI2TrxFEakGQPXBQTLmTTHNMnTRkU8O3Sg4SUZ1LgpxpnUXmn/otDkIUuhxe0thZ4IPA1E7rVeoVDEZ0iG1DfxYaflAYznwRdw6NYZGnHULOm3Njtsb6Rs3fA9laYbsyYVyJvrHBAq1E66ipb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6916009)(6506007)(8936002)(31686004)(83380400001)(66946007)(8676002)(26005)(186003)(53546011)(508600001)(31696002)(4326008)(2616005)(86362001)(5660300002)(38100700002)(316002)(6512007)(6486002)(2906002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2Z0UGI5ZFI0K0NRbFlRSmdxQWZPS1gxRDJ6Q2xXaHRFcnpZdVhNTFhac0lQ?=
 =?utf-8?B?TkdUQ2FjVmd4aGpwbE5XVHliUEdsS2xraElpS01wanBLOHlDOWlmNVN3VXRB?=
 =?utf-8?B?ZlU4aGpFdnVWcVQyckovL2Fya1pOOGJpZUpRTnZaTXQ1c3FNN1haaWZIVnJH?=
 =?utf-8?B?TmN0TDFaR2oyOTVSdHhQVGFURTNpT21XV2JBVmZEdWlST1JDTFczSzNOUmlC?=
 =?utf-8?B?dDRLejdVWGtYVklnZHlDYVJkRElnNjMxbzhRdjFLc29icitlZlBwdDJISmda?=
 =?utf-8?B?N3FKTk55VHlXb2p5UjI5UG1MN2hsSDYvcSt2Sjk1TjNJc3J0ME54U2IxVCtq?=
 =?utf-8?B?bWpVNXBLVlAzVmtwcUN0VGxDSThzSWFXTjU2Umk1bjFYK1U3a0tpaDgvRVRa?=
 =?utf-8?B?ak5NVTEydGxCbDJTS0hNZWxDMEpuUDRiR1BCUFlaZ1ZzTlJTTjNHVGlmaXJU?=
 =?utf-8?B?QmEvS0hvVjU3TytmMHFWU2Y4aFUxby9aalBhdnYwaktkZzVUbVh0bU51UEMz?=
 =?utf-8?B?cE44cGZrcXhHTzEzQ1p3VDIwYWZRTFNOOFAvcHVYcEpmM0dRTXZYTERQMDJK?=
 =?utf-8?B?Mk85T1FiMUk0Um5rT0ZTRVJNcEpnL0IxTFZFc2xGSGp3bnVZUXFRdHZ6VGt2?=
 =?utf-8?B?UktUbDl5VWM4RGJPQU8wdFNzNDF3ekJkbDZOZ2o1bjN0SERUWXhOR1BscVVL?=
 =?utf-8?B?LzdjTmxXdmdiUmRDcnJacXJ6QkhNaG9JYTMzdEROL1VRRy9QMjNyUDhEblJS?=
 =?utf-8?B?WjlBa2RQNG1GZ0VUaEtuZFc3VWZYR3dRUWZEK2FxMC9RTXZUNURpQ0ZKYjZP?=
 =?utf-8?B?S3FCamkxZ0orNXdOQWo3bFNacGU4dy9IVVIveVg4UTh2bS8vbjB6TFczYXlD?=
 =?utf-8?B?UngvQWFGYmtCczM4VXg5RmdKNWxkekVWUHh5dkNlTVRpOTlnY29ua0JtRGEy?=
 =?utf-8?B?d1pWcFQ1RlFYcC9FR01PWk9KRDN2Z3BVSjFzUXpTZjR3Q25KamF5dTcvck9S?=
 =?utf-8?B?aXowNXZLbFNob2tzU1RtQmxmOVRtMkx4b3ZtWkpVZVJPMlIzUjBjc1FYdE1u?=
 =?utf-8?B?RjBFRzRJUnlManM5MTVkbmZmbFliVzhjbmYzU2NPTXNHS3hQbnpGN2N0K0dH?=
 =?utf-8?B?Qi9PK2huY1hWbkVvbDJ5NTcwM3BPbUdzTXMvL1hFTVNFZ0srRkgxdXVIOENT?=
 =?utf-8?B?RUFxLzhtZjJ5a1FzMGNDNlRwQ3ZPUi83WkRJbkEvNWJDcS9OcmxPWHh4Nmtq?=
 =?utf-8?B?RkpycTFmRmk4RjFSc0Fiem5HQSsvT25QMWRlRkdIVjZnVUE5K2RvdkZnTkdZ?=
 =?utf-8?B?M2I1cXBNN0tjVVVFT0hiSHNDS1FydEZqV2VCZUJEenVFYnVlUHkyRmFQRzdO?=
 =?utf-8?B?VUhIUmc5aWhxZkE5ZkxvRndLcjRuRlYwVE9Pc29RMXorc2NpVkJjNVhQOFVG?=
 =?utf-8?B?OHpVRG1Lc2FlWVVzQlRqUWVDYzFvQ1NvcTNPaE51bkt5djIrOE5ZSVlUdVRp?=
 =?utf-8?B?NGRXZTlINmhQelFvS1A4M3VTczhNV1ZucDQ4eFIwS0cxMUFQNVJVVUQ4Q2lD?=
 =?utf-8?B?ZjRuV05nTUJtUm5zeG1oS1VieUlqRUYwTExQM0NTKzRXVGdVZlNad3JlVW92?=
 =?utf-8?B?OE5zbkR2NVNCaWNUalkwRzF4c1cwZXQ5Zk9KNGU0WjkrdDUxaVB2dDY4UnZR?=
 =?utf-8?B?K1dCVGdzZnloK1pBbS9jcElKZHVUY2I2VHM4YkNqcnVOY3p5Z3hUdjY1OG8v?=
 =?utf-8?B?Vy9sOFhKQ1ZGWUNwTzhuV3N5VWgwUHBXdUZESmFuR0xncEszb0o3cExxYkpL?=
 =?utf-8?B?eEJLVVJBczZoSTdISEF1dFg5V0NwZkFyOWkzemQ4Tk4zeXhJU3NreWw1blFM?=
 =?utf-8?B?b3dYQmJSek9JSnZnWGZaY1ZxOFI2dFM1ZVpENkNaaTRXWVNZTzc0MExRMkJC?=
 =?utf-8?B?SWZvZ1MzNGlIdDcxS2RVU2IyY0w2MXRaWUZtMGwySVRiR3BudmQrUXJsK2lr?=
 =?utf-8?B?ZG9xTVl5MnQxZEdrYW4rKzk2L1FsOFBUZExob1J0cFhYQVFJZkR0ODJkTUdV?=
 =?utf-8?B?T3pZQkF6eXFYcU8xS2ZabUpZWkRlMmtMQy84QWtOaTFJVHB0ZTArbm4vMmVm?=
 =?utf-8?B?Uml1MzN1NU5zeHRUVmxrU1IrUksxbGs0cnpaWVRXbXArSkx2Q256c1pDckVa?=
 =?utf-8?Q?Knga/r8/Zrs7kCzcZNSmQFk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3100017e-2ea2-4e0d-d5bd-08d9df560b92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:24:50.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMSfS3EyX90ZzJljg5ad3WDv2jFoGPCL6cKhUa2jg4AcRUdOPAMVu/SwgMCVm3WXyWMnEt0PBEjU9zTmN9dLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7273

On 23.09.2021 14:02, Wei Chen wrote:
> x86 provides a mem_hotplug to maintain the end of memory hotplug
> end address. This variable can be accessed out of mm.c. We want
> some code out of mm.c can be reused by other architectures without
> memory hotplug ability. So in this patch, we introduce these two
> helpers to replace mem_hotplug direct access. This will give the
> ability to stub these two API.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/include/asm-x86/mm.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index cb90527499..af2fc4b0cd 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -475,6 +475,16 @@ static inline int get_page_and_type(struct page_info *page,
>  
>  extern paddr_t mem_hotplug;
>  
> +static inline void mem_hotplug_update_boundary(paddr_t end)
> +{
> +    mem_hotplug = end;
> +}
> +
> +static inline paddr_t mem_hotplug_boundary(void)
> +{
> +    return mem_hotplug;
> +}
> +
>  /******************************************************************************
>   * With shadow pagetables, the different kinds of address start
>   * to get get confusing.

Imo for this to make sense you want to also use the new functions
right away in the place(s) where the direct access(es) get(s) in
your way.

Jan


