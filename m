Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8F592AF8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387173.623303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVR4-0006rK-VU; Mon, 15 Aug 2022 08:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387173.623303; Mon, 15 Aug 2022 08:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVR4-0006pC-SY; Mon, 15 Aug 2022 08:26:58 +0000
Received: by outflank-mailman (input) for mailman id 387173;
 Mon, 15 Aug 2022 08:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNVR3-0006p6-1w
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:26:57 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20077.outbound.protection.outlook.com [40.107.2.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05acae0d-1c74-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 10:26:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2634.eurprd04.prod.outlook.com (2603:10a6:3:87::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 08:26:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 08:26:53 +0000
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
X-Inumbo-ID: 05acae0d-1c74-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzofW9Mxik1BxuG+nRC76K2JteZ6LBGFmSnb1hZB/LRqgi0AGW4J0RQzVs/NYOrCTlvGcMSM+rbWaeGCmyfAs3uIHxjAKsL5pBwM0jyD1qRC8Lk+HyyQYR0EC5WzgFxw6/Q68vKmu/1rbQ/mX5bcTEK+e17uDZyyLy1sRQnMQYezSXMXur7E82ct9+Cv47sOg1M+ZtsQqEHrrRUQS2VnmIkBGpNjubW819yq1e0jMGd6xtxeFKIA/MWskZRfCVaVTE9rHBqfv8VsY1gTRxOUYvq7+4/mp1+z8LyIa328LHTOAM+PiHIVDsQQ4MuIzw3iOq9sevr/qvSYHsYzrK7vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCQCyyLFFfrG6dQRFRh2PvV1OSYPMnaeEIoDz+lY5ZE=;
 b=bHY53VAvuYJl9NmS7aOffbe7e2GJ3oQ6UNRsjU6QClpSq3v5YMXqv1I8oLjU6Ls2cK2LbKVIbuTHvnlV7iLTeSoD+hNe6wikw40ErX1JGc+KErAhVaqtI5HHwM1yHJB/pM34VjgJLIEI0VO13fDURmdvghfPaDfXnOu0pEK5CYAYK4+zT7g/wjfdNyokNV8dQsgDxNi6AyHTIsZnqMT01+6Shvof4TgHuF3UOi7epweGOFSidooAIp6d8Fl/tKrWWhQkAVO+Eqn/p5fmVPPvOi3RR9F85iPWPHvpI03fMOn8zR8GItrIP+atP9XSds5TOdnRRbdS9EAtCwPOwDhgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCQCyyLFFfrG6dQRFRh2PvV1OSYPMnaeEIoDz+lY5ZE=;
 b=WeQ4XHG3n5dv+CBiU9DdMfgxZ7lVjdUPFwDxWVR5jbFT3qLNmOs8v2x/dtHvXEhn+Nd9v/OqqFL4A3Po2hDMLiYDamksBLwP7srNGihwzamF0OsW6rMzYVSWXvy+Lr2AB1DlHVObJcPiMj5jLQCOYPx0CxhgxaJODZb/ZnzzCJ0+ZqQgwPDD7JEDhJCIdjqc0EIxo6qgWAw8hmY3RFjVYVojr6XkppS5mdsErSQDdFKWNN5mOntROVSwQXiWCJO6WwhKXm7KHbIlcXdtjXCFbbJB3aecQEoeomUH6h+U5nz94tZtnMUzoUTbfxtbMnoMA61bW0OurcGBAINcueTQ4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c8fd8b4-85ed-6599-5761-a3f6e9fdeb36@suse.com>
Date: Mon, 15 Aug 2022 10:26:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/spec-ctrl: Use IST RSB protection for !SVM systems
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220805103814.23032-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220805103814.23032-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b70ad77-0e72-4b9b-8c4c-08da7e97e8a5
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2634:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DDoIjPPgK3Pam5F+38Y5/b7lx5pGPy2RfBypJOlKYY85sg1mW2A3FombDYpCB86AVVe6ZV7iewJxXSmzMkzFLBTdX/jTQbcRavBPJMLXJ1ltUXebH7epicDAoWnOScO9Di4eKMHLrjxV3LphG3d+Cq/U+f7zEOM1q87ytB+QAQqfj+wy8DSU+yIC9EVR9lnib86XM1sjZ8yFy/IQtdLh955imtlWpyilyvSxovG9ti3cxg4aIQEr9lZN/dNLQ1AdJLUNp0immNhzRoReZe4UGXqB71uNV5dSXF/eiqnZZq1pOBKBRLHWrn32xNVDQlKj2bg1uMG5Ij7ZXjJtL6yndGBOajbceSTrC5acVrPEER6mCl0FDJLu0RS1xIHY3VObFl+bVVanukZ6fzOIDAnSMMl389ace4eOj2Yrz5G3OBatRa5MksQZ4QXSd1AqKPWRn/dtFk0GfEaboSuFMmogELFWjAPtaL2MRLexZmcAXaKtqSAmpbV42rIUQzbJKGyAERQtryz85seOYnCMmFWO9RE4pA56e3JGxiOZTLPvgfzyO9SMRb8GooFZN6yOvFGxtHiw5QiUG2jN1Bbg5ej1kIYDC9cPiBDdvRWk4k7MP7uaq8gweK6w/z9weUjXcYGbQYe9/d/IyrJWfsuqCS7HD0ZnYGIywd1DGoSR+Ltvd2cVSGysFGu+4LeC6bKmUuI2in52HHP9j/ShMkRBuSOsIhdMkT4FuuTq1ItZmorbPhy9mr11ReTO49/r0k23aJwcGlb8Rk9E22G8r44eeloOJqLOafHBWpmPsV3qo1ro6pfWG0tvLQJyICrosz0h5is5lgZjEpsy+/A2Ycu1ADRWBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(346002)(366004)(136003)(86362001)(31696002)(31686004)(36756003)(186003)(2616005)(26005)(6506007)(6512007)(53546011)(6486002)(54906003)(41300700001)(6916009)(478600001)(316002)(8936002)(8676002)(66946007)(38100700002)(66556008)(5660300002)(66476007)(4326008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlFieHNoRzFwaFVuN2FXUXFGQjNSYlZpMi9CZW1IZ0paSElaMC83UlJGbU04?=
 =?utf-8?B?YjZqWHFtV0oyb0tzMjVWc05HMFZHSlJXRjBVTFlQZTNwVERKenNoSVQ4d1lh?=
 =?utf-8?B?ZnhNTnJEWDRKNC8xNlAxZk5rYlpmVU1GZVJpU2E2U1hXQ2NRUzk1VGlFWVlp?=
 =?utf-8?B?bkZ6ZTEzaFdRcTRRNDY4KzZ0MzUzaWsxRmttVmhxM2V3SmNqeEZpZFBGNVlE?=
 =?utf-8?B?a055bklvVk5XU0R3MnVydmMvSEdFVUt0YUhVZ1JFa3VqaSsxY3N6OWxSN1Zl?=
 =?utf-8?B?L3pPRFVJaHExS215cmxocW9VaUwrVDJwa3FlTFUvVzM5bThLSDFJc2VWdUdE?=
 =?utf-8?B?MDZYdTZ2TS9oc3dyTGhpRHFSdFB3dFNSZ2lwYTlHaWRlQ3FKMERLYjJiTGIw?=
 =?utf-8?B?cEViaC9CcjE0ZzdqOXdEWFpjRERJODFRZU5Wejdra3cyaHc3ckxLM21tSTRl?=
 =?utf-8?B?eGV3N2l2MnJnZ0NjczZKMEkvZSs1WmdrWU9VN3JPODJxZGs4WFF1WXRaOXAy?=
 =?utf-8?B?RzBrZTBGY3g2MFR6NmhTbGlkTnZzaXpDMVB4TE1qVGtmVHk0SDFOOWUwVE5h?=
 =?utf-8?B?c2cvQVZ0R2VpM1pOOVo2dWc5VXd4RU03QzVUVlZLMXRGQ04zOUVrd0gybjNn?=
 =?utf-8?B?eTVOWDZiZjhBSTZoVUt6akVRK05aVWkzUnl5cVY1Ym9jVlc3Zzl6S1hVRUU0?=
 =?utf-8?B?aG9pd3paNEhUZzVHUzV6RWw0eUIyaHNacE92bTRJSGRCZ0IyQTJ5RGw2MlVu?=
 =?utf-8?B?eFhrVDlwRDhkSWtUZ01HT3ErUkQrWE1wSEtpazdLOXNCL3QvZFFjNnBIQ25D?=
 =?utf-8?B?aUZvM0R6cmQzaU9kU3oreVdNdno1TlQ4ZUdneW54NHJKbjNJV24vd1ZjQWZ2?=
 =?utf-8?B?alBrWU1RTUp1MGVKOTlqc0ZtcEw5L1Q4VHZ4TzUvQUJ4VXNKT0l1aTN5WDZS?=
 =?utf-8?B?ZG4raHNxUndiQ3MxQUlGeFJhTG5Qd0M4dng0SzBLeUJrOEtaQWoxZVBDUEFC?=
 =?utf-8?B?ZSs4TUhZMkJuWmpDbUtmdk90eXE0b0ZmN0ZOSjkxUVVSTEx5WVQ3WVcyNHZz?=
 =?utf-8?B?enFlMnBDcGhYa2tJQ1IrcHM4bkFBZXVMKzVrL05HVVhOOXFoN1p2UitKekYw?=
 =?utf-8?B?UU9UU0R2Q0UrVmpoUFVWWHVsYTQ1SXR0Z0ZHM1lVN3pDbGVxaHJBaFEvYVJn?=
 =?utf-8?B?eXBwV1BDVy9BUUZvdk9YcCttUzBuTjd2bStHcGVzWXFWNDZEWm8rcWtkVVlu?=
 =?utf-8?B?NURrQU9MZzU3T0Jzekw3aWFZWHFNQXE4aVoyOHVjckNqbjRrVDdZNVJtNXUx?=
 =?utf-8?B?WE1uOGNtcmJ1ODJrRzFlQUhxbnhWakdUa21qUEo1YjVFaDc5UXVGMXpNenNv?=
 =?utf-8?B?YzhIa0Y3SVNDSWx5NVdFT0F3TDY4M1lZdDF0aWFxUFJ4UVJtTVJEbWFQUTJy?=
 =?utf-8?B?MlBVNXg0N2d5VkJVZGU5NGVBYVUrT1RSZXJlVk8zOWJSU2RwMmVEWlZMREFO?=
 =?utf-8?B?dzYzTDRtZG4zZHcvSE1acnJZb0FKZzc3bDBYR05OTThNUzNjeTRHRVlWZ1dt?=
 =?utf-8?B?ckxoTHovOXVITHJQTGxEUlp5anU0bVJaMGpuOWxCeGhGdjlnMUtaaGc1cUFm?=
 =?utf-8?B?Z3lUK2xqN1Z6NjkxSkxvUjhYOEV2U3dKUXc1Wmt1N3kzb2IwbFcyd2hOMEts?=
 =?utf-8?B?eG4wUUc1UzFjVCtMUWxpcHJKa3ArOERIS0FLZWhjdzlQM0RzMjdhVFE0MytN?=
 =?utf-8?B?ZUtYYXkwWXg3eExPVE1QTlJ0MFN4MndnWGhKcWlFajZMb0xiclZ0QmRTUXly?=
 =?utf-8?B?R1lQeEhWc1ZyeXhpQ2tlaU84MSs3T2JUWXpBYjhBSk5DQURzR2RobVIvTk9h?=
 =?utf-8?B?MmRpdlVzS3BnblZOWmlEcVIzYmp2VVJnWHRNWHF0SnQ5ME4wWFNYNDBVYklj?=
 =?utf-8?B?OFp1b2tndlhybUNCdGszOGhMa3MzblhublRZYU5PdC9rajNxWStQSHA5N05Y?=
 =?utf-8?B?R3pJZVhRd2RUKy9Sdk1Mc3BuUmN6aHRVUUxuRmgzcXd5T1Q3MHhET1RvN1hD?=
 =?utf-8?B?K09SMjlnR3JRZzhvbGUxNFRScTdQWU94TjlLSHBOOXpUTkpQZkNZNTZQQlR6?=
 =?utf-8?Q?Ux11bCU2++qv1+6TopDnSCIcz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b70ad77-0e72-4b9b-8c4c-08da7e97e8a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 08:26:53.5921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4xLL2ynjl0tb15/BCPBexKczTJ1goxEuyVgTV9vjFn9myqwkgWvgtM4UFbL1k197QMTJnBW53BYIaRFW8AnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2634

On 05.08.2022 12:38, Andrew Cooper wrote:
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -1327,8 +1327,24 @@ void __init init_speculation_mitigations(void)
>       * mappings.
>       */
>      if ( opt_rsb_hvm )
> +    {
>          setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
>  
> +        /*
> +         * For SVM, Xen's RSB safety actions are performed before STGI, so
> +         * behave atomically with respect to IST sources.
> +         *
> +         * For VT-x, NMIs are atomic with VMExit (the NMI gets queued but not
> +         * delivered) whereas other IST sources are not atomic.  Specifically,
> +         * #MC can hit ahead the RSB safety action in the vmexit path.
> +         *
> +         * Therefore, it is necessary for the IST logic to protect Xen against
> +         * possible rogue RSB speculation.
> +         */
> +        if ( !cpu_has_svm )
> +            default_spec_ctrl_flags |= SCF_ist_rsb;

Only now, when I'm about to backport this, it occurs to me to ask: Why
is this !cpu_has_svm rather than cpu_has_vmx? Plus shouldn't this further
be gated upon HVM actually being in use (i.e. in particular CONFIG_HVM=y
in the first place)?

Jan

