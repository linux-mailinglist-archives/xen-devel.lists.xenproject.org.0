Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB42534C94
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 11:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337498.562102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu9vB-00072y-KL; Thu, 26 May 2022 09:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337498.562102; Thu, 26 May 2022 09:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu9vB-00070m-GR; Thu, 26 May 2022 09:36:45 +0000
Received: by outflank-mailman (input) for mailman id 337498;
 Thu, 26 May 2022 09:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nu9v9-00070g-66
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 09:36:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f35319-dcd7-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 11:36:41 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2172.outbound.protection.outlook.com [104.47.51.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-W8lZ0ma_MtWVww-Enc-wUQ-1; Thu, 26 May 2022 11:36:39 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 09:36:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 09:36:37 +0000
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
X-Inumbo-ID: 58f35319-dcd7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653557800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTWnOnCCxRJdUmzhd0yegnSe2HliVI7Uh5L4Y6nV/Qo=;
	b=QQPnWrKns83SohrbeMLYP//rgOOf8MgUOs30hByss5085+cAqc0SXQf9tF2oxpLM3KAdkf
	Nk4TiuVm7nOlY20lDTV6Ki/ynTGSvkVwvsVZCr8AVl74nxTmF/GZ9Dtrnumguhbp+67gNV
	a07uuXXN7y9yLje5BYvg3CAL7roB/oE=
X-MC-Unique: W8lZ0ma_MtWVww-Enc-wUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj84rQGGDzJi3/jkzmzlh4E0IBy1Yk0yfGIvGVkwFAgelxsadZ5hhZyGuG3AQEdL6CmtNbsdwfaP6QtU7dEazEjPq9xdvNUdQ8iSROhw3faz7S9hc7yZGwRMzANsAUJRW/DNmgmFVoLf0z6UiWlVbGFAREGfksv2sBQBRudHL1FVzqw062ZZe0FStQxVo0a9EUBoPD4WxTgk9b/UCV7ZYDETxGLE6FcKpEol+yiYSqcn+O27XhNU+sy0R842LQwknxZ1DGadUaW6RqihXWLPICrqnmMIBH25tr5yYGBTpI4+vl+m+VDEbTBfqBDTp6kug4eeDHMqjOmn2wpaGATyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTWnOnCCxRJdUmzhd0yegnSe2HliVI7Uh5L4Y6nV/Qo=;
 b=J7X/VFwcCvuVctGuJWjfBOACukDnxLbB7uM/mwkcMbaLhvoXDdfL5YdujKzrhbtJbRcLsLDEKrJbwIloApB1FmXNt9xLub/v99YMdEnv1g1IPHO/RqU9OBQJJZI722YIql1qH/fKR4/EgnRNwVoFbv7FgpjXaXqFG7fX9PwSSkilmBkhoLJbDAZtoh39gniP5Wdehhd5RG6ioLdc6xqXYTOBZpjd5XApw/6f9GayvpsJuVRRJSO9vSBLKn2/2mEsyC0Nc4x/dkF5ZP2e2v4O+3g1RH/l6c35S6ztOOzmNI3w/8hmA/bGms042txEXQfle4+y4Zw8CPf426xKYpLN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d71af01-dbfa-d5ab-c55c-faa3693674bc@suse.com>
Date: Thu, 26 May 2022 11:36:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <62f142e3-02c7-22e0-3917-3a29fa2630b1@suse.com>
 <alpine.DEB.2.22.394.2205251746250.1905099@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205251746250.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0052.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0490881-6108-4a0a-d932-08da3efb3ab3
X-MS-TrafficTypeDiagnostic: AS8PR04MB7703:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB77030DD7EB7EBB0557F2D211B3D99@AS8PR04MB7703.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KOGU7PaSxD3d6b2skAS1P/WMic7hfQpMALEXyYLIrINiabhA2oQx+NPmCtjCn15zsHgValIkxuzp4kVpg+NiuEM0JNo+O245zsagmL642BOt1yRVUZ4PiKyD6Wlbhv+RjD5406Hfb8alDX+Z8KDTSZGsUD8jzwr6Qu6JJCJsqG+mhn+/XYC5ENhe612im67Ql52OjWCL2AcdV3Mzxy/mfMluzv55zw562AyFElhpnU2parH0Jx8nnZ41aDhwwgd7MYAJKyWF3bGCFj1qV+Zw/fFv8JkaDeUpWtMjazEOji+rhf+nYgQO6K248QbC805zaBB1/exUmAkvfIjUFXkvGOp13Y3EE0yh4vvIaUwHu78Q9TSOSjzS9J05TOHTQkguchmf89sikzs+DuEHzmme/hZo1nlU4vMuGNAczP/gLznOedHsqEjGYBmwAWih5avQhvpIrSoKes0Ga2gwxf77E27gqCNmVhQnb202M55NdLxmm76Ede3UFaBoZGSCnfmtusJDZAfTHbPOipEHziKg8oHFMNvdtorBTFC76L4uo6fKlmEoR9FtokYWvrtIDCjCtkp5+MMN24rg2KQe7DTlckLzhxPPVjik5v53W1VvopRpGztlEFBah+C7zq7baJPxTovQoRN1s1+OnfFAF928T7GoxCHUOQSmq0op6GnooXNO+SDOdy34xVDSwR+fYJ0oVmWvKJm3YiwAqfh3klepoTXp1r4DVRzQZz1kcylPropMaiHomWJPZ8djxtIRvFuerHQ8G1+wxZW1bP9Wuli7HAnZ2ToUyQU7rld+6UdEX6+cE+2Z4r0cLsuC7Lp9HN9IM5TfUVbu/w1qAMTmlAQXadZW3KHnXk2X7LD1QkaBkaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(508600001)(6486002)(86362001)(8676002)(4326008)(66476007)(66946007)(66556008)(6512007)(6916009)(316002)(83380400001)(186003)(5660300002)(2906002)(53546011)(2616005)(38100700002)(8936002)(31696002)(6506007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1lIVWJUOEZUd011cWFWSzg2MUcrVHIram5iakoxNW8yRU9XeE5XbmZPejZ5?=
 =?utf-8?B?cFRKUUNIZW5hcEJMOGk1NXhXTVc0R0RKYTFvYzB3OUlrbEVYSzdWdXllRFhp?=
 =?utf-8?B?Z3BsUzlmVnVBNk02NElTdVZmSnBBM3owUTMxWGRMTndtQXVhQ21KMVBudGhs?=
 =?utf-8?B?bm1rZmg3MTJwQnpCenNRRHhNVXhsUE5FUUQvVkphdmJjZXVvSGo3c3lFRUxM?=
 =?utf-8?B?WTEvOXJ2bjV3cWltSklSVFF3VTlOWkppU1U5WGpQSHZBSTk0L3ZKck9WRis1?=
 =?utf-8?B?bWZ2NmhqR1AzRjNudmJWQ1FHNWVwY2xXS0VvaVZjTVQrTkVBVXg2a1I0QzY5?=
 =?utf-8?B?NDM2YmJRcDNqQ0hvQ3JQOWxwdk5lcllOaEtsQjRxcmVua0x4UVN2ZXdQS3V3?=
 =?utf-8?B?V2pCdU5vbkY4RjBSb3FjK1JzOGxEQVlsc0hLaGtOamdmL2VDMWlrZzYvd0pz?=
 =?utf-8?B?cUZtKy9Iald1OVhvNE1PTk1heW5WdU91M3NhMGx2NEx6UVJhQVJSQXk2Mlhm?=
 =?utf-8?B?M0xGV25YZVNCVDdRYTk4b2lzSHBQYjRBb013K1VSeFlvRXFtTUo4dk5HOFFL?=
 =?utf-8?B?ZlNFUUNMdzllRGUyVmNhWmkzMlRQTlhlU2hsUStQdEpUK0lVQXhSbGNFUzJF?=
 =?utf-8?B?eTFpdHV4Sm84STBPL3BFTUNNS1dzQnRZNzFjb0lXWHN2bUg5UnNjdStaaEg3?=
 =?utf-8?B?OC84ME8veDdEZXZrZGZNYjRXRXJUUE04U2NTRy8yTFZiMW5LZXc2RE40Q1Zi?=
 =?utf-8?B?WTVWTE94ZW5tNzJBQlVEU00vQlQvQnFYdHhRa3lROWVBeW1ITmFrOWUydEJF?=
 =?utf-8?B?elpqZTloc3EyZThtV2tWTnVQbXhxcXpjWDRnM1ZKaStyVmxCS2FKQUJoVnFF?=
 =?utf-8?B?VWRUVkE0WGdsRmVJQm13d2w0WUJQZXduaDdXVm9paG9OcXpLMkRYZk10cnky?=
 =?utf-8?B?L1hHTm1melFLYVYzMnI3cHJGZ0J6Z3pCOWs0dWRSQ09mMVRmRDg1OCtKSVVt?=
 =?utf-8?B?MVJYRkxqQXdoR3FEZ3F2d3pBNkNyM20xMlBSNG5jL2VZTVRiOFpyWTNtWlo0?=
 =?utf-8?B?WjcrQTFqNDljY0M1SmR5MHZpbTc1UDZ0UWpOeHZVb3ZxMlJUOTRSc2xlcjZj?=
 =?utf-8?B?Wm1xUG03VVBuNWVhMHZkQUJuYnFGbjVRQmwvcnBVZWNzZGRXVnExaW5qRGpo?=
 =?utf-8?B?Rk9NZ0k3OXlqN285cjQ5bENNODEreUU3TG13NDVYZVI1dDNiSzBsUkpKcUV4?=
 =?utf-8?B?WXlseTdZUElXT0d0Q2dtcFZnRnB5VGpNcWdhZjBjTmNxUFMzSXZ0V2Z5WDNq?=
 =?utf-8?B?V1I0aUVpczFvZzlmY0FGdWpIVndPRFB1dVpDbFNVMFRGeHluR3NUdzBmd3Zi?=
 =?utf-8?B?V3B6NWczcFVrZDZIUy9EZnlxNFFNRENqajk4b24xSHVHU1BrTFgyVnFZWklB?=
 =?utf-8?B?cVlqZ0k2L3AyVmJhZzF5YnprQk56VHB1YlU4alVURHowNm9jV296TW0va01F?=
 =?utf-8?B?a1NERS9MN2RHSlYyc2Rzd1U5MDR6WkVPeEVMRnpnTTRLejgzS3VCemFaVURw?=
 =?utf-8?B?NVQ3eG5EVE02RFBxRWNNeHVIYzladmNQeWx1Q3dBbmU0ZzFDNTg2SWw4Vlg5?=
 =?utf-8?B?b2x4K3cvckdKMFUwNGpPZ1dXNk1QaEdUTVRqT3REbE5PbnJqS2tuZVZZMkJW?=
 =?utf-8?B?NmJWRCswZzdHZHUwVURSaXN1NW81R1FLeXRLV0FsdWhoREN1Wi82UDMwV0FT?=
 =?utf-8?B?MTN4NEJSekRCbDdpSDdidW9FclhEVWhCY1cwdXFCL1pNRmJNNFA1MGMvbWpH?=
 =?utf-8?B?R04rRDRkMmRueU9Tek8waUxhL0pqZFNwVTNnZG9HNXV5RHVUcVJqREE3elJU?=
 =?utf-8?B?TTlZNFp5dUp5NU0yWmtPMWwrWmowQnVFOUdMcjd2dmhYd09teU5JQWhjMlBP?=
 =?utf-8?B?U2JreGF2a0ltL1ZrN0h0ZGpqR2NETkFSN0dTemNGVnRJdzZJMEJDMWhtNS8r?=
 =?utf-8?B?cExvOWdmODNNRVoyeEdMQzR4aCtqV0hnZDBxbGlLU3o5SEFJVXhnMTFCbWVN?=
 =?utf-8?B?clVIT1RvTW9yRE5lWW9na0pVcXZ1YUFVaU1xeW5tQlJJUEYyUHdrSW5INVdn?=
 =?utf-8?B?WFBiZlZyVXd3S1JydWpwY3JiYVhrRERSaWY5UEZnY1FPSHdSM2tZaTZzYUJC?=
 =?utf-8?B?cnZjbEdlOGxuaS9xMnVSOHdBbHlUY2Y4SUdKTlFEN3FQUWx3STVDKzNBZXpC?=
 =?utf-8?B?Y29MNDhrOXVNczBoQnBCcHZMZGIxbURkVGdubTMwZHJUL2sxVnpscmRjdDVH?=
 =?utf-8?B?dkxNNm43aTVETjd5a0VkSE9PTVZEcmF1ZmVHODJ0ajJQdHdDbDAzcTBmeG0w?=
 =?utf-8?Q?BifJR1XeiHv3CRx0wRk4kjw1Oi6I5zU87Rp/LLCyK3XZg?=
X-MS-Exchange-AntiSpam-MessageData-1: rR/lrdNRG4pXmA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0490881-6108-4a0a-d932-08da3efb3ab3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 09:36:37.0331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xx8AzuB2+5uJbjREgTTUrBB5eyFgZ19E9K9/ga42/jm6k56FxfQ+Rw2+e10VJN70Nb717t6Acso4DYqIyLW3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 26.05.2022 03:12, Stefano Stabellini wrote:
> On Wed, 25 May 2022, Jan Beulich wrote:
>> On 25.05.2022 02:35, Stefano Stabellini wrote:
>>> --- /dev/null
>>> +++ b/docs/misra/rules.rst
>>> @@ -0,0 +1,65 @@
>>> +=====================
>>> +MISRA C rules for Xen
>>> +=====================
>>> +
>>> +**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
>>> +MISRA Consortium Limited and used with permission.
>>> +
>>> +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
>>> +licensing options for other use of the rules.
>>> +
>>> +The following is the list of MISRA C rules that apply to the Xen Project
>>> +hypervisor.
>>> +
>>> +- Rule: Dir 2.1
>>> +  - Severity:  Required
>>> +  - Summary:  All source files shall compile without any compilation errors
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
>>> +- Rule: Dir 4.7
>>> +  - Severity:  Required
>>> +  - Summary:  If a function returns error information then that error information shall be tested
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
>>> +- Rule: Dir 4.10
>>> +  - Severity:  Required
>>> +  - Summary:  Precautions shall be taken in order to prevent the contents of a header file being included more than once
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_10.c
>>
>> Like Julien has already pointed out for 4.7, this and perhaps other ones
>> also want clarifying somewhere that we expect certain exceptions. Without
>> saying so explicitly, someone could come forward with a patch eliminating
>> some uses (and perhaps crippling the code) just to satisfy such a rule.
>> This would then be a waste of both their and our time.
> 
> Yes, and also Julien pointed out something similar. I'll add a statement
> at the top of the file to say that there can be deviations as long as
> they are commented.

We need to determine where such comments are to go. I hope you don't
mean code comments on each and every instance of similar-kind
deviations.

> I wouldn't go as far as adding a note to each specific rule where we
> expect deviations because I actually imagine that many of them will end
> up having at least one deviation or two. It would be easier to mark the
> ones where we expect to have 100% compliance and intend to keep it that
> way (once we reach 100% compliance).
> 
> We are still in the early days of this process. For now, what about
> adding the following statement at the top of the file (in addition to
> the one saying that deviations are permissible):
> 
> """
> The existing codebase is not 100% compliant with the rules. Some of the
> violations are meant to be documented as deviations, while some others
> should be fixed. Both compliance and documenting deviations on the
> existing codebase is work-in-progress.
> """
> 
> 
>>> +- Rule: Dir 4.14
>>> +  - Severity:  Required
>>> +  - Summary:  The validity of values received from external sources shall be checked
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c
>>> +- Rule: Rule 1.3
>>> +  - Severity:  Required
>>> +  - Summary:  There shall be no occurrence of undefined or critical unspecified behaviour
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c
>>> +- Rule: Rule 3.2
>>> +  - Severity:  Required
>>> +  - Summary:  Line-splicing shall not be used in // comments
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c
>>
>> To aid easily looking up presence of a rule here, I think the table wants
>> sorting numerically.
> 
> They are sorted numerically, first the "Dir" (directives) then the
> "Rules".

Oh, I see. I didn't recognize the distinction. Maybe have a visual
separator between the two classes?

>>> +- Rule: Rule 6.2
>>> +  - Severity:  Required
>>> +  - Summary:  Single-bit named bit fields shall not be of a signed type
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c
>>> +- Rule: Rule 8.1
>>> +  - Severity:  Required
>>> +  - Summary:  Types shall be explicitly specified
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c
>>> +- Rule: Rule 8.4
>>> +  - Severity:  Required
>>> +  - Summary:  A compatible declaration shall be visible when an object or function with external linkage is defined
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c
>>> +- Rule: Rule 8.5
>>> +  - Severity:  Required
>>> +  - Summary:  An external object or function shall be declared once in one and only one file
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c
>>> +- Rule: Rule 8.6
>>> +  - Severity:  Required
>>> +  - Summary:  An identifier with external linkage shall have exactly one external definition
>>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_06_2.c
>>
>> I don't think this was uncontroversial, as we've got a lot of uses of
>> declarations when we expect DCE to actually take out all uses. There
>> are also almost a thousand violations, which - imo - by itself speaks
>> against adoption.
> 
> Ah yes, good catch. We spoke about DCE in the context of Rule 2.1, not
> this one. My preference would be to keep Rule 8.6 with a note allowing
> DCE:
> 
> - Note: declarations without definitions are allowed (specifically when
>   the definition is compiled-out or optimized-out by the compiler)

I'd be fine with that.

Jan


