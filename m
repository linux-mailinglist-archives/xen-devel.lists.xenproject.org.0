Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7284CF674
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 10:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285750.485004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR9oF-00089A-HF; Mon, 07 Mar 2022 09:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285750.485004; Mon, 07 Mar 2022 09:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR9oF-00085g-Dm; Mon, 07 Mar 2022 09:37:43 +0000
Received: by outflank-mailman (input) for mailman id 285750;
 Mon, 07 Mar 2022 09:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR9oE-00085a-9N
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 09:37:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b5f87e3-9dfa-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 10:37:40 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-A8VZ_E0hMv2KEuToyjIY6Q-1; Mon, 07 Mar 2022 10:37:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 09:37:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 09:37:37 +0000
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
X-Inumbo-ID: 3b5f87e3-9dfa-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646645860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/uHqtRAO9dlYDP5J95RWFP4BjApNFAFlG2TEmino1QM=;
	b=BAEgcB9isxUZC+Ralvfbsd9qeDtz3t1MxVxq0sJZmOmsHIqDgCfP/pmO6ap//Ze8JHZtZV
	rz+V4nrApN/atK0ggvZi8bekfYULZiXm3KdQtSamgcNVrU1tIiXNAYvnmTztyStfRIiP7Y
	q9CYciDzovQve91Nr3CLJajIbC1dVgI=
X-MC-Unique: A8VZ_E0hMv2KEuToyjIY6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL7Th8EZooU594QLeJKC1ka54w/mZMKRpyCI5yKxpfkIlEYG3UNMDSfNz+9bDyurrELLvAYd1IykKi/NdtgdQvPoJwj/P6EDbHOFor8mjgUdW9X+9PpFHPsQBKQj1SOy2c/2jHSjOeChT6s2jIhgNh3frJzI5IVtUzK6Pb+BsQz3eVfyKCpGvy/eepM27K3bIwhD90dTiWAWbpuVACDeYIN7lGGEr5lCf6O5+uLvNSbXA5+0zm5fD2mE15ICiSn4JG6ZXxCVz5iTIlBkJUVLvKZOeCeXBuJktvQWpXBZjKM6M7PMaZAapoQuygY4ll6nQJUhFz3Btbxa8VWo/cIXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uHqtRAO9dlYDP5J95RWFP4BjApNFAFlG2TEmino1QM=;
 b=BrGLVpu0RUBVtISkk69VvFeBDTlJzJ6+uqCVTzEHIT6F3bWpdLWlqxCGLoVy2NOARHTPanN0X4a9a8KFCL/2N+p4abJt1jClCfyxJf7T/gttoGsy/o6lUFQqjKG0KYmPLkjTFmXwmZkBqE4aRuZObOBPHAOlJBRTt7iCirUESkIWPohTaXfJGOZIwsYGzOzyCMI0ggnPRwC1D4YG7SAjBXmh2PbzJZCAH/7A//jcVqfyC1AtH56e3lkSD4vTMwxPzq217a4iAris7pS5yUW4Jh0QjSx8RXFRmxX1rab2EktQLVLYeUrkNEKKx9cocBXSztfYGXn6OTf5GUZyi15BFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9a608be-8aea-9116-fcd7-15a197073f8d@suse.com>
Date: Mon, 7 Mar 2022 10:37:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <fd56d3713b873bb00f7fca80e86ee7466057be3c.1646643967.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fd56d3713b873bb00f7fca80e86ee7466057be3c.1646643967.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:203:68::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 658d0244-13ed-4b56-6584-08da001e1d45
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB231820754F2EE7682787E2CDB3089@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LnSK1u/QdK2UpyJqx/aB/BHIghd0Q1Ro9yQv+VRFiJ3Bx3Ar3TVzJjv5Sz4PTAESjJPi8BUhWsg51BRJQ0APJJUV19jM0Xe3QkDAm4mc5YyJiq/lEaKIfXn4CjCsC+LcZbWhHJWA+DJlY1JijKrhG0Ql9saSASN8CdrJafamuH0M2y3DqL/c+PzTMyXejBy76IOAEyIkEsyIDPbHTeTilswYsohS1zqYwfzv1n0QRnNKGcStnjbOroDXlg0Il8/Yn6G+McqSgCdZVflMOhKxNZlP7w7MyXhax/Qpq3wiCc7o7z2Js2EU8G+hW36v6KhWh622AUmYbgLhrnALKS0mTjOTIk6fBxnZRgwMmnSWVRgik+jFxiMPwZwJpCJh29RapeEvSOevghbdsONKib4fKhzhSJA297OdOVsADuWujZupjq8qbWtpusMQ0QzyK5m3pfblt1ZNYHaBlQpPDtF7+doGGCQglVR0f0MeUrZrcF/qz54FaeURu3F6DPDZdOKPN+VVqwTRc7VT+IGCri2ofAB2mDKPNqpZTI8fZBpDxN4eZcCf+QlhVE1yD92ye1Tn3GzvV1HFnHXy8yfYIrsqmhZSTCdsy2HvbW144R8+6fljN9HS9T/myS093imldQ5ODQneGE9pWGTVgv/GkMNuTzcWJyuvV5hOlMY+2S+UmeifPw0JQi9Y2sEjHp3CDMu0vuLequB60RbXk1KqR96Obg3FHxhiXdTWGXt27eq9trc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6486002)(2616005)(8936002)(4326008)(8676002)(66556008)(31696002)(508600001)(5660300002)(66476007)(83380400001)(36756003)(86362001)(2906002)(26005)(66946007)(6512007)(316002)(6506007)(186003)(54906003)(6916009)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGFKMjJmWmFtMHFUbUI4QlNtTHd6ekxIL2xTeDlLSXc2TDNWbHJYSGNCcGFV?=
 =?utf-8?B?OVg2WXZJSmNoeitCbm82dlYyNCtsRitoRUlSWFVIL1hKTnJ0S0xFMWh1dDJD?=
 =?utf-8?B?ME9zNFc3N1M4S055TXpWak01UGVFTUtmZ09QeStSRVVXTXlHcTRFMFAvQmZx?=
 =?utf-8?B?T29Od3lIamg5NURqU3d3Z25KVnhWdXRuOWZ2Z01IMk5KbzFpQ0RCVzJqUWsv?=
 =?utf-8?B?YzNDVEh5a29vMlhPMTZHOUFwVUxjNHYyT05ZU0VLNHVjUUR2L1NlWFBubXNL?=
 =?utf-8?B?Vm9MbXBMV1doU25ldGdUNHZTZHpOdmh2UzZTWjNZaTBpcW5rZGJmZ05EVE1W?=
 =?utf-8?B?bWhHaXBaaEFVTXMzYUpkdktqdWd3M01PTW9ISnZiWkorNGJkcG00WXArcXN3?=
 =?utf-8?B?enhIbW1EUmpqVDU5d3ZSUVIzazVzZ1hkZzcwQkVoOXhTZ1MrU0JjbGJFdEdO?=
 =?utf-8?B?OXdRaWc1TW1MRHlCaGNGOE1GaEhiVmt3YkJsaU5WSzJQczhVNTBiL0hjVDU3?=
 =?utf-8?B?dyt2Q0JmUDRBZ016U3JhdGVPaW95SjFtVVRkWnNqamFHenZyYVRKYVNwdXBL?=
 =?utf-8?B?VWxEQVoxdEQxT3l6T2RhZjBWQjlVMEFuZnAzUkMxZ0lPQTBTZTdic0dWeHpo?=
 =?utf-8?B?dGZVYTRySjdBUUI2Uit0ZnRBM0tsUEFtY0xKZEV2NEJHeEcySC8rbGw2SnIy?=
 =?utf-8?B?cFp5ckRTc3ZxNDg1UUhzQTZRa085clEzamhyYUxlMHJMMVVpYmNGaUxPNUsr?=
 =?utf-8?B?cFFEY2NZdEZ2NGs4bGFnVUhnQnJORi82aStnZDVDV2JNcDJKUXYzNjRkWkwx?=
 =?utf-8?B?WksrbmxlZXB4OHJxNEt5NTdvdkFUZEdwVXR3MlZueWdnVDRBRzgyQlJCVjlI?=
 =?utf-8?B?cWlZclROdHRmSHY1am5NR1ozV1NaeDQyUHl4U1NCK2VRUTUwWDdUZkh2dnpB?=
 =?utf-8?B?cGpRWnozSUJQVFFoMENEOFgycHhiSlFpRVlUTFJpYzVUQndERzdtZlRCN0g1?=
 =?utf-8?B?eXdLdXplcW5RWFRGdnpWQ2VKQUVoRW5aV3U3bFNwVVNUVTdTemhYL25JbWpB?=
 =?utf-8?B?QUhNQkhtVHJESFdYQnZ2anRmd2t2TUVMcGxPV2lZcm1keEx3cGlLQXJ6NEF6?=
 =?utf-8?B?RG5RaTFveUQyTjZFdGp5QUZIZFZWWUQ1WUQ4N29CL0djSjA4ZWFPWU8vVHQ4?=
 =?utf-8?B?UStPTEVhb0QvOW1KZXVyV1RGWXNaUFdlSGQzcTdodU1nTUpIMkVHckI3Unlm?=
 =?utf-8?B?M1JxYytNYlljMHA4a2hwWEsvellUZU5CUDhpTE5xaWdsbC9Fa2g3RlBvR3lx?=
 =?utf-8?B?ekJ1cC9ud3p3WnFhTkwwN01CeGRRNFdNeXlyTjd3T0VHOHJHb2FRS2lkYkoy?=
 =?utf-8?B?Q01HcTdadVZtUjVIUExyTjhLeWZPQnNwZTlPN09Wb0FHSzRIcXZiRTV3MmtE?=
 =?utf-8?B?TFcwOG1vYkhGbXZnNXJXelVST0RhTGxBbEIwQnoxelZvZG5rWXZtSzFocUx6?=
 =?utf-8?B?eFZUeml4Vis3QTNiM0FBUUdMV2J0SnI0MTFjb2JZZG1wS0pmY0ZhQXVGd2RO?=
 =?utf-8?B?cmlFZTNpWXpOM1RwdlVkUHpjWTRlOHRzcGVMUWZ2R3pDVUVLK2dVQUZsSXVt?=
 =?utf-8?B?Uit3QmNGUW43Y084MGVIdjd0M2hxTXpyVCtWeUdHT014RjNYK005NzF6NUxh?=
 =?utf-8?B?Znc3b0M5aDI5cURUV1N3SW9zODduUGovY29yTERTcTM4Q0l1T3dVT3BFU2Zv?=
 =?utf-8?B?ZTBPdWMrWHF2eUFDZW5WTnN5YzZnL0FPeEVlTjZvbjg4dG5vaytjWVlneVlD?=
 =?utf-8?B?L3orTU5OQmc1R0VueE5kaHllTzZISVhxalU2dkNWMjZ5YWVDdW1rcjhid0tp?=
 =?utf-8?B?YXVic0drOTJKcHBET2psbDRiUzJENUVmcU9uSnhUc1RHT29iYVBTYmhFOTV0?=
 =?utf-8?B?eTVmMXdwaWhpYjFzQU1UMnRRanRENHNnN0ZFR2tWRklOcVB6MFFFM1g2NjI5?=
 =?utf-8?B?bkdmYTZ6MDNhb3JYbWFQd2dCSVQ4WE1oOTgwcS8rTll0Z2VFTnNtTDY2bkg3?=
 =?utf-8?B?Rnd3VVE4bHV4c29JM05zQzhSMFBueUpaY3BmUWJVdk0yS3R6dkduSlNETWg1?=
 =?utf-8?B?RkJTOVhGMjRPZmN5UTJ4V1R3QTdRZDc0VEQ2VjA2bVN5bXdGUUtjdmlsZ0Z5?=
 =?utf-8?Q?JcEjoLmJQ47OOpECP/sRUzs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658d0244-13ed-4b56-6584-08da001e1d45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 09:37:36.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFL9SGX3GzwKkLDUqZu43BNalXj/lDFDkIrxvmYGDFn0QnJXVcMqx8wdw5SEV4yuDNyTlWfC1zyf0BFHIvSdQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318

On 07.03.2022 10:17, Bjoern Doebel wrote:
> Xen enabled CET for supporting architectures. The control flow aspect of
> CET expects functions that can be called indirectly (i.e., via function
> pointers) to start with an ENDBR64 instruction. Otherwise a control flow
> exception is raised.
> 
> This expectation breaks livepatching flows because we patch functions by
> overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
> ENDBR64. We fix this by checking the start of a patched function for
> being ENDBR64. In the positive case we move the livepatch JMP to start
> behind the ENDBR64 instruction.
> 
> To avoid having to guess the ENDBR64 offset again on patch reversal
> (which might race with other mechanisms adding/removing ENDBR
> dynamically), use the livepatch metadata to store the computed offset
> along with the saved bytes of the overwritten function.
> 
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Note that on top of livepatching functions, Xen supports an additional
> mode where we can "remove" a function by overwriting it with NOPs. This
> is only supported for functions up to 31 bytes in size and this patch
> reduces this limit to 27 bytes.

Is this intended to be part of the description (then it should move up)
or a post-commit-message remark (then there should be a --- separator
ahead of it)?

> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -14,11 +14,28 @@
>  #include <xen/vm_event.h>
>  #include <xen/virtual_region.h>
>  
> +#include <asm/endbr.h>
>  #include <asm/fixmap.h>
>  #include <asm/nmi.h>
>  #include <asm/livepatch.h>
>  #include <asm/setup.h>
>  
> +/*
> + * CET hotpatching support: We may have functions starting with an ENDBR64 instruction
> + * that MUST remain the first instruction of the function, hence we need to move any
> + * hotpatch trampoline further into the function. For that we need to keep track of the
> + * patching offset used for any loaded hotpatch (to avoid racing against other fixups
> + * adding/removing ENDBR64 or similar instructions).
> + *
> + * We do so by making use of the existing opaque metadata area. We use its first 4 bytes
> + * to track the offset into the function used for patching and the remainder of the data
> + * to store overwritten code bytes.
> + */

Style: Line length (also elsewhere).

> +struct __packed x86_livepatch_meta {
> +    int32_t patch_offset;

I was first going to suggest to use plain int here to comply with
./CODING_STYLE, but it looks like int8_t or uint8_t will do, leaving
more space for the insn. I'm also not convinced you really need the
__packed annotation. Furthermore, to avoid the need for casts,
simply using the ->opaque[] directly would look to be an option then
(with suitable #define-s to identify the two parts).

> @@ -104,11 +121,14 @@ void noinline arch_livepatch_revive(void)
>  
>  int arch_livepatch_verify_func(const struct livepatch_func *func)
>  {
> +    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
> +
>      /* If NOPing.. */
>      if ( !func->new_addr )
>      {
> +        struct x86_livepatch_meta *lp = (struct x86_livepatch_meta*)func->opaque;

_If_ there is to remain a struct, please insert the missing blank before
the star (applicable elsewhere as well), and please separate declaration(s)
from statement(s) by a blank line.

> -        if ( func->new_size > sizeof(func->opaque) )
> +        if ( func->new_size > sizeof(lp->instruction) )

This being the only use of the new variable, I expect compilers to warn
about the variable being actually unused.


> @@ -127,15 +147,20 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
>  void noinline arch_livepatch_apply(struct livepatch_func *func)
>  {
>      uint8_t *old_ptr;
> -    uint8_t insn[sizeof(func->opaque)];
> +    struct x86_livepatch_meta *lp = (struct x86_livepatch_meta*)func->opaque;
> +    uint8_t insn[sizeof(lp->instruction)];
>      unsigned int len;
>  
> +    lp->patch_offset = 0;
>      old_ptr = func->old_addr;
>      len = livepatch_insn_len(func);
>      if ( !len )
>          return;
>  
> -    memcpy(func->opaque, old_ptr, len);
> +    if ( is_endbr64( old_ptr ) )

Style: No blanks inside the inner parentheses, please.

> @@ -159,7 +184,9 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
>   */
>  void noinline arch_livepatch_revert(const struct livepatch_func *func)
>  {
> -    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
> +    struct x86_livepatch_meta *lp = (struct x86_livepatch_meta*)func->opaque;

const (if the variable was to remain in the first place).

Jan

> +    memcpy(func->old_addr + lp->patch_offset, lp->instruction, livepatch_insn_len(func));
>  }
>  
>  /*


