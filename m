Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B285649071A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258118.444153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Q69-0000DW-74; Mon, 17 Jan 2022 11:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258118.444153; Mon, 17 Jan 2022 11:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Q69-0000AD-3C; Mon, 17 Jan 2022 11:22:53 +0000
Received: by outflank-mailman (input) for mailman id 258118;
 Mon, 17 Jan 2022 11:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9Q67-0000A1-EB
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:22:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd9da4e5-7787-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 12:22:50 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-kLfYRzsmOjuWh4zHr0hPJg-1; Mon, 17 Jan 2022 12:22:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 11:22:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 11:22:45 +0000
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
X-Inumbo-ID: cd9da4e5-7787-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642418569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ7ESBHdjDXa59A0M0501jtwdXB0Smdsc0zNZ+4Ggy8=;
	b=Z+Wst87VuRDUAWa5iaUwDXqfyhYLNLg8PR/G24jKNf3S+EiBtHn/Gv8vUwxA3K+t125/sK
	JLZGgQ/FDPR0Phnj7WwMK2SwM9NeLnwRczBUJR5mziZNR/rqCCp1RIVZ93bf0DdD7j3unx
	qNvTgLMtCLr1QwJxcxp/7MjCDtXmUsY=
X-MC-Unique: kLfYRzsmOjuWh4zHr0hPJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XagqIlPjubytHun8e/EjHBx8Vun0EGqy7D7Fa8zBce+8mEKgUVtKX//WmjLml3EoxFj3pJMQuaYNGLq3dKtfTewGlHmCfJOibG/xzCMgPkBWJCkivlMBu0JW6Z1HfgId0Rl0aW5RvNzL3vjbpgorOqC28wlH6uSOUrfDGmNrdcm3djw6FfSaMMAfa6MVcysvLXBKaBuCKUaI/UnHL0XFkZeGlTfC+VIvaXusaxbMWA2H7RL9rxQG1fCHJAa0g4YRFqYWyTvOQDlGhxOBkflq5VPLioyxDxOAGMBPoym0uQmmaBK9DkCBXZi7MJA/bGHMyJS8HzeIhf+Dz5/5dntV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQ7ESBHdjDXa59A0M0501jtwdXB0Smdsc0zNZ+4Ggy8=;
 b=NMiTr43WpTfBDqrktoeM1EHrWAhwICNgobjLCZhEjWPMU9r/xDurS3Q9p6L2OWXHKn7ZJLuwoR1d0UTH/y6wxVJfgb9J9NIkL3BL7l0OPomRnBYZ/fMA/wce5yEsoBM2/Kv7EczN/4TTbC6S4h6zXTJ4M548QUZJ5ZrsHEOVqtkwO9W+0GvJVvpHiQsl5GNRgtLHeMa1lF33WtcQsqXtuJNYn2YFBxQ5B3oQQFt5tWrIv3k83Aohxrb3cvfVzOyqa1F1THNpHSC7vp43TObp5utghVzzB6Y5wUCLllAK5UfGIC16ZJUC3Q55pQGxJYa/5JPFyrNgdXxZPbwwaTGnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aebd4542-8eb8-5073-a578-5b96a6354b84@suse.com>
Date: Mon, 17 Jan 2022 12:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] x86/spec-ctrl: Drop
 SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220113163833.3831-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0031.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61d22e53-2281-4d51-dc15-08d9d9abaef1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2430D6BBCC94FB8FEC39E202B3579@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d97kUhRwFPFGxvN91ftyXhm6Qrq565HQN/5tTSktrqKo8hPJvUOOpZ73dEhi+AgRuvPj42++aezZgeLwCZh3hfds6hGdaweesLSv/zBWaGmmi7WB+ni5iCrk4z1e6QqMsKbzR+U9uPxa/AwatVLLxwccs1sQ+pkymr+ySrH5TdXIUit7NUgbnvMDiINtZODQMp6o56Tv4od7/nQN3bimU0EaM12j2qMUSCoNlCDuKXpi/yYTDsUROpmG9dWR/bSSA/N2tWqY+uu6eI7yg4bpT6qpBV8h3TG8MfyuLajG68G/Mw3mcdt0/oMrAbDr8dPrJEBANVyBRDvFK9ELO8OsnU4e3R673uD0Beku7h79UTfE8IA0PqxnNFaNUPLiqPQwz+PJitp8S+K6JuG/ReNNGZ9he1ZWXprqG4VpZdW3S0FJJBN8Ugmf3aYg8fXpJkXsbMmbBVX2t2C+cnqg4T5WmpYksUC0oZRj7TeuGdywAlnmuerf25sUNN/2b5zpo34xKcopN9FFgrhXu6I14NL2qXtPZIzOic54y947hhVQIJU/8L4Y9imLMeJjaUSc0DjeJNGq0BWoLFl3W5Kp9vTPkHWppzOkq6JVIEAH3wCa2e+2LiSlwOFKF0sucmJSAXbL1t9EsG5I2A6wqkZmrGUl3GP+Z9aASiudYziHocvw7qyIxsAPx86HVnGx2NIZQpgrP4N1T9nRiSEEgXY6La8cohtvlFjqaVycpbj2OuBlt2HTaQaL05R8FlYr5UgZ//uO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31686004)(86362001)(316002)(8676002)(6512007)(8936002)(2906002)(83380400001)(4326008)(38100700002)(54906003)(6666004)(31696002)(5660300002)(2616005)(6916009)(66946007)(66556008)(6506007)(53546011)(66476007)(508600001)(186003)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVhuSzBVajgvQUpreDRLYytiSTdMbkNqcFVwcEVFaEY0YS9BVWtKRGtiV1BU?=
 =?utf-8?B?eHJibkZNN3JRMzNhL3hzdHFaeEZOVFFtYnlpQkxKWUMzVlJoM3owNXZBbmE2?=
 =?utf-8?B?TGJ6dHhYR1VZT09iN05ob292SVcvMnlnZEpLSS9kSngva1pjQ2t1TmNjdE4w?=
 =?utf-8?B?bm1oVkg3SzI4U3NhYnIzUUFSdXdIdnJ2YUxRT2pEZWRyaENhZGJiNFUwSUg3?=
 =?utf-8?B?WW9mUm5rZThwdStNME1RNzNRUHFNbStCMk1jci9GNFNqZU9YeXNYZXhtMHdD?=
 =?utf-8?B?NkdSakVhWmlNb0dPaEY5MHRvVnBUYXFoNkg2UGN5T2p6UW9aRG1XcGtGWEln?=
 =?utf-8?B?RHBwQk5nTmdyaGpKWU94Z3h0MXdDV3JtNHVmL0NiUHZ1OTFOejZuaU45MEMv?=
 =?utf-8?B?MnVEMUVxMWQ0RFNtQzBWaUZEckQ1czZST0JWTWJWT1BKTHdsZ2hid2FoOE1m?=
 =?utf-8?B?RDdDa0ErNVF1eTlYMEpWSGhJOG50YzJJbVo5dzM2SkFjMjZLRkszdFVFOEdR?=
 =?utf-8?B?UVNsUXBwRm1ZMnZRZ0NjR0xPRkdXSDJSOFlmSkhWeE9YN1BpbFBOOWdYNU0x?=
 =?utf-8?B?bmJhT0lFb2xsNmFVc2tpK0JXMWllcHBMbTN6WWh5dVJ6cDV0dXpTSStlMnpM?=
 =?utf-8?B?SG16KytZQVVpaC9yWU9XVk82U2tIbnJqR0trYXFGKzVuZndRTkt4a0VSaXJ0?=
 =?utf-8?B?YlJyOUNyZWxTRjNCVHRvZ25YRkk1UkRlTDl2amV4M3NBWTNqSGsxUU9DcE9k?=
 =?utf-8?B?VmdEOGpHaXJqQTlBemhMY2VOQVczUGxJbTJ3dXJYN3MzSmJSMXJ6L0JldmFx?=
 =?utf-8?B?YVovOHRsM3ZlSSsxN0V1dmZZSU5FOWVUMDBUZjNwcEpuZWhhYkxhZ3B1MXNx?=
 =?utf-8?B?a2lqdXR3aWFPcmR0SFlFTVU1NE1aaDY3QjZNTTRrUTdrZkppYytXY25lZndO?=
 =?utf-8?B?b1VQTDJoY1R3OG5RRCtlZTgvSkxYcHFjSmdIU25veFlGVlVIVWdTRTZ6dGNZ?=
 =?utf-8?B?aENwWnluTHpGUkVrNE9Nb0g4VmdtUEl1SFExVWMyR0ZoTUgwdnY2MFRmTS9X?=
 =?utf-8?B?bXplUmhoMU1RTDFoM3FLWDMzQlovV2VINkhONTVxcFFqNHBGQVFBZkFORHp0?=
 =?utf-8?B?ekUyR29FZFI5TFdac2JQY0hkMTFPYmg1MThxcGN3OUJWWFNSWjJhRlRIUWly?=
 =?utf-8?B?TzcvWS9CMWwxUFlzc0F5VjVHeXFlbUsvTWxraVRxZHpKSjI3bFJJbzBEVDdr?=
 =?utf-8?B?aFl3ejAyQW04ODFjeGp0aHp2WWR6RENFSlg5eXZEd2ViWGRnWnA3ZE95ZzR6?=
 =?utf-8?B?ZHVRNzFEZXV0ekZ2ZnoxcEtvbVNWbzJYY1RhbnpGN2M1YnZyRjI3TGNLcW5Z?=
 =?utf-8?B?TURvMWw5SW5GSUxJdTNlZXlGTGYxNnVnOEMxV012WUQ2VU1MUVNza3I5S1NX?=
 =?utf-8?B?eHVCM1NsU0toTGlpbERVV0laeDRYbExIV0hHRTIxaVNtaFg1Y1N4a3BzeGlT?=
 =?utf-8?B?aVZLVWFxZTN2SUlJc0dRTGFHSkVkd1dhem1qd2RxZkxiak9UNUJmclZ0LzJr?=
 =?utf-8?B?NzkzWklMTUtOcnNwN1I4ZEpSUnpQWkJxZkl6ZDNyRnZHdlNTRnpaQ1dtVFFO?=
 =?utf-8?B?OW5WbU5EMXZTcTdEbDBsTWtlZTkzWGNpUnZ0b0JYbmE2TnZhQnE0aE1FU1R4?=
 =?utf-8?B?MENYWFFQNHhXNlBTdnAwMlAwdkFOYUNIY2lWMk12Sm9MNTY5QU1GZGwzbDR4?=
 =?utf-8?B?dmhHZ0RMa1U5Ni9XbkwzeFBxa2NrNnhlZXNKTWw1K1pselhCM1VMeG03eHBm?=
 =?utf-8?B?My9nR1FoQVYwQ3ZuWERrM1IzQ0hkWUFRaHcrVVdsZEd1Y0pDZFNtcUoyMHF1?=
 =?utf-8?B?SVIyWDlVZEdaQ1Z5UFloTGF1cHdwNU14UUhmSElua1JjeGszQUxwbThxb0Rw?=
 =?utf-8?B?VzVhZXdLM1NkOTlPaGpJWFpvSHVNd1hWTm82dGhoZDNFdi8rdkN3SStXSFFk?=
 =?utf-8?B?ZzZEcnpxRkxTMnQ4QmdKYnc0eWFsTzV4eDQ0bGRVNHRYNzZuSzlsMW55TE1O?=
 =?utf-8?B?VWt0SURLeXU0ZU5Ed0ZwMDhzeUtOd0NkM3RMMTV4VmhRQjFTM2tRSzhTY0ti?=
 =?utf-8?B?TFltMGRZVHplQjl4cGNDY2Z4bTBxQVdkRWhLZktOaEZ4ZlFkZnYyYVZ2Y1RP?=
 =?utf-8?Q?A+fS2KP5nkFGmajnDoRV+DY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d22e53-2281-4d51-dc15-08d9d9abaef1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:22:45.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssqJ5JVvnYLJ6zil2p7OU0Ts5r0iJ7ik5cOXhly5z2SEqhZyHVrUxrrvnzCqwgXJO5ujufoWA37r/qvjfI1haQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430

On 13.01.2022 17:38, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -59,7 +59,7 @@ __UNLIKELY_END(nsvm_hap)
>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
> -        SPEC_CTRL_EXIT_TO_HVM   /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
> +        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
>  
>          pop  %r15
>          pop  %r14
> @@ -86,7 +86,8 @@ __UNLIKELY_END(nsvm_hap)
>  
>          GET_CURRENT(bx)
>  
> -        SPEC_CTRL_ENTRY_FROM_HVM    /* Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
> +        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
> +        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM

Just for my own understanding: The comments you add aren't commented
out macro invocations (as I did read it first), but comments naming
would-be-macros which are then expanded "manually"? That is partly
because initially I read the description saying "Expand and drop the
macros" as meaning that the macros grow in what they contain, which
looked contradictory to them getting dropped at the same time.
Perhaps me not sufficiently understanding the difference between all
possible meanings of "expand" vs "extend" ...

Jan


