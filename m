Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE2494DA7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 13:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259050.446763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAWIK-0002OU-Eq; Thu, 20 Jan 2022 12:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259050.446763; Thu, 20 Jan 2022 12:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAWIK-0002Ld-BB; Thu, 20 Jan 2022 12:12:00 +0000
Received: by outflank-mailman (input) for mailman id 259050;
 Thu, 20 Jan 2022 12:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAWII-0002LX-2a
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 12:11:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29773efd-79ea-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 13:11:56 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-2JZvl0YSNYKAEJmZ6860pg-1; Thu, 20 Jan 2022 13:11:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Thu, 20 Jan
 2022 12:11:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 12:11:53 +0000
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
X-Inumbo-ID: 29773efd-79ea-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642680716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMFhlv/jVLmaztbXUrwP4iQBATdsre24+z2M6YAYe2M=;
	b=k1AgtwQOkOOdCRAe48nDA3zFHV6f3ThAES9TaEP9ZekjHJvP6QgpOcOpHdA8uEUfQ4jEX/
	CSJ3wHmFSDdU2cBWE7dtlSVfb57VjWI8SuluyL/PEqiFX3RFpDcND678ZeJyWaDZNjiYPc
	XtVNHTdDsaaFLh63LCVESR0jLQ+aP1U=
X-MC-Unique: 2JZvl0YSNYKAEJmZ6860pg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXGLwOsTsGZ4G6L+v1mT59ezz03Jw3a/OKN1R9ctR6Mw6rTIkwcx5w3km8xuMk2+7qN/PixDgyRO53IXjRAJK7cUykmG9W9lz+a+2aKv5bV861ZOyy0bMp7gzew/SQG2SdmfMV89CGUdA6hOxUtCZe1HYXM7enLhzcvzm/JxOKmJl1phY9Bo4Bw2UYy+3jZI5D7FsYBfF73cmasvwZ0SLyt3DJgeDFfNTFBCpgQWFCg9MXGmZtG1KHMzZqvgSZXoQsmXoEABypx4negb7hTURNksVPhfcuxhQph6XbGNuPR91JDBU9e04AEvudvkm6BezbS0M7j+W3wG9kVz80AKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czqdFnZttwMubhs8eB3lB+M+pU60vueqHCcOymGIL20=;
 b=d2f1PHeXNGSKpwgxWpj0Sbhlj9qxQ9TQfxH4u6zKT2dhIaMWkEguxHS0eJ4btD8XyVKhVfRp5n8R0bWPcKCme/RpKj/yrH5y+jXIbM2Vtwkocmhv6zE56Ba5NNmhCBzAJoFSMYLagNOY5ak6g16jUIv0EsEd4Ak0sXiA3ztT5O9mIKX07uMa+X6IfAZZ3jk7zkSJzJd1tfqVEe7WCASyT5WGcywIl99I8DLxCDJq9DBmTZT3++9EnoslpxBUYKNP0LpVIDzhPMllEbFiNzKm7feY/cE2Qj6F+m+iShwawZsoO+xRlHOqQ7msZ4OiqJWcj5l6QqZPYG7cLsMmmeuyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9415e194-3c31-b7cb-3a6a-3ab6aa432908@suse.com>
Date: Thu, 20 Jan 2022 13:11:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-5-andrew.cooper3@citrix.com>
 <3395e756-fa47-8d94-148a-03a573331e5a@suse.com>
 <74c2961b-29e1-9641-8a8b-b7cb0598b7be@srcf.net>
 <ad0c183a-ff7b-c560-ed3b-469d3f5c5b0a@suse.com>
 <914f2264-d424-e42b-31ac-1832224cc1d9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <914f2264-d424-e42b-31ac-1832224cc1d9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0056.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9aff40c-7485-42a8-0e7d-08d9dc0e0b9c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6640B2ACB77E14F2E2EB2958B35A9@VE1PR04MB6640.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u8ZmlPsXziCQF5EjGpZDqHwcJoUPbYdYpUzgYBT00Xm5pZ7MOQyADjlolODGDXp2QSrEmSkQp+yjf+ZmEui2Nwis7iwnnKrF97qyb+jSeoUWVRl8cLkL+IHHoRFJ47hF5Kf2ycgYBonnO1LFtDF21OWHbqQhpFQm3y5xckJCPx0ONwPZg8ZLCucPTVE+i5kEgnss2RRWHAIx3BBkIMyy82//3DJpgglZgs8ThbLatB7+GW1ufliAAknU7TllBlP+e+m1/RvxsVbdxi/uoU89NdeJbMixrHPEedX2QJF8SE3MXoxWg9IYv5YQvyz/oauLVicS+fh/gYTt/Z1dxfGFEtzm7ifJqzAuUQne8pZkTehscuqcUKZMepEhxf6v0c3HBQQZ8Zw3Sxx9MatGaosJ5sqUkbRp1OwHCXpUdSZAGGTLI0LAqBlyV1ipn/JUgO4aaDRWCgV2Wd2YxPTKUqCkwXVhE/odIPx2PY4AVE/7VhfoyCw98hXciWoQ9AYc54raIgD33RGsS5MpE+ALwnZXRCQHhPosemKexNsNjABANr1+nhtkXRUVhnI7nA/jGsvLqxQIOUKW0f/B5g0RqJekhgFuNTNbjg+UWmCNkM3P8ql9je7pRg2/rCiyaHNfNc5fsuywEti/LDaKFVx0rO+DD9VV0zo0BpoWMpQNoRgT23gECIvAZCP6zhmL4nqRtnpJ4ujE/xuINnU005uxE6pr7m/6m9pEmcupwN+gFRpXM0I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(31686004)(6486002)(2616005)(316002)(66946007)(66476007)(8936002)(83380400001)(66556008)(38100700002)(8676002)(36756003)(110136005)(53546011)(26005)(2906002)(6506007)(86362001)(5660300002)(508600001)(31696002)(6512007)(186003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWmw0nLE40S0pK+Nmxq2OZalF+p5yd7O5G//eQH+lWeIRJCUmMgEtVSedlxK?=
 =?us-ascii?Q?FntYEZXQFJV+tNr/1nKxAuHQNOlqY6vTJ1Q9pZphOSygsOTQNXc/M3l2/he7?=
 =?us-ascii?Q?V5PRfJXUZ6iHtfoM0v+6VjQImS7oT9iQidhewccgic4ilCEHnWtbqJ5ItfQ5?=
 =?us-ascii?Q?MiA02wTj0/HVcDRes0ovNF87rIbLHABDaTdHgjNWQ917WUcxRYdKaAt1ByaY?=
 =?us-ascii?Q?H0XOV+4W70AuZ6/NnRHhaW/MW/ITRhz18iphKro3HUTmFIwLeHjnwaMs0AdL?=
 =?us-ascii?Q?wXOF1728pSSscLWbvtlBEwuONnSJpXQQMwjmxOpq/V4Qor9laQhshhERpaDm?=
 =?us-ascii?Q?5kPA47QImgqh7EqfrYvhkAcqzJqOiatCXtx7iXexDz1ebTje8t5wn1zMakzZ?=
 =?us-ascii?Q?ounX8En7EKkw9HgLZZmp5Ao98gvH5/IBGr7nF43TgXqG5xCwepaz41VluiKk?=
 =?us-ascii?Q?HRbKvDCK4CF4HprIelwY9UuirupU3M4iGWK2kqoh/rvfAooViUoMHX9JZg5X?=
 =?us-ascii?Q?zcYTzu9Ct6yZWK1hw2aVvmGEM/5/vv/MicL6Ycc+0GS+Ge02HXkNgcMDA/39?=
 =?us-ascii?Q?Dx5Z+juQ2JqRbcKx7VLTeovhRQk/2Z2ljI59xUrjm8ivX1Wk7aikXdbKDMbC?=
 =?us-ascii?Q?/JmhUDKx4enP4B4f9tcoM1JCnDv8ujqeYcHiVHpjxubWo6w3nx/0ARRVhKzT?=
 =?us-ascii?Q?FInRdBiPmkXYFuUdvmuT3pSYKRh8nyJKjmRkldexn/+cDOep3Hf7POl+hbfk?=
 =?us-ascii?Q?IBEwM9drmBnhbQZA3nLYxnBO5J8rYtFAlcBG7VGqgw51cAAlSnO0/FrAhuBJ?=
 =?us-ascii?Q?FiHIzYtwFaRoY1WYWuLQxN1CDKnMYo2WJ/WsQOuqrbxLaFAlRn8Rhp7Zsr1I?=
 =?us-ascii?Q?J3EJ2NlDeU64k6MvzOX8nQbns8GW8duticE9u+vbw07TQS3LICdtovSZ0yJC?=
 =?us-ascii?Q?21z/WCJUytDcWXjJazNi5l0TzxHow6B1VOcJxAh3UREzcWmiOUzTywt6AWLC?=
 =?us-ascii?Q?ZCmv4v9+gABYFg8R4VwIR4dq+P2ntmQbYrrI2oQNwqSwvPJTLg+WmVC/alfd?=
 =?us-ascii?Q?QgPIxjhEPaciA8qI4UXU4XkaqZQe7YwFmHjSglf/vi7F3+x9TkQ13AiZJIHW?=
 =?us-ascii?Q?2Mj56sIaWaBhT031LJLh0m1W8TNGlepbpC4KkFZC4+AtWLVcO2adTsWoAyTA?=
 =?us-ascii?Q?TGDEFQUs6H40ee2BzkVo7SMOp/OHak9TcccU5CanYPpma+CfbgzrXIwmqhhZ?=
 =?us-ascii?Q?xvox59R+TMif7LpVzG1A/JYUwCFpsDBWME8cp002S0XHSRhXdEmSRmPxGc8Y?=
 =?us-ascii?Q?Cr82MJpc2JOawl0qHEh1dtSvXHZANxhEOyNMI+OV90ozBKcx6jXGpyiSRJFF?=
 =?us-ascii?Q?xj/ugYDGySP69+JimCIPOJzbUtE+DVqy1Uy7HnJ5/FcYQEA/dWbT1MWVIzbs?=
 =?us-ascii?Q?im2zjCHtvoHg0YdUDFvtstrtQlFEt694/bnH39hj07rCrSJ3l7GlDC3PvUNp?=
 =?us-ascii?Q?IUloboZ9cUYZYHLTpMqVyR6iWR00o34U7Kc3OdiGs7C/ULOLVOSUkX+6uy2K?=
 =?us-ascii?Q?rChzbPEO/liy7U0Y2pmQDC+pM92WA7cF0/iggaOhvVZuK6SuOINx65Ta8nN0?=
 =?us-ascii?Q?ZIObK3Tpw2wb5/3TcII2RUE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aff40c-7485-42a8-0e7d-08d9dc0e0b9c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 12:11:53.3594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EorCGWfQFTskfn7kROZsq4tHOK/d7efewvfvPXrdNuKKjQJIxWtlJNQYxBLQdSu93yg50Ed3OCthDRg8cOtl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640

On 20.01.2022 12:55, Andrew Cooper wrote:
> On 20/01/2022 08:14, Jan Beulich wrote:
>> On 19.01.2022 18:00, Andrew Cooper wrote:
>>> On 19/01/2022 13:42, Jan Beulich wrote:
>>>> On 17.01.2022 19:34, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/hvm/vmx/entry.S
>>>>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>>>>> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>>>>> =20
>>>>>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=3Dcurr %rsp=3Dregs/cpu=
info, Clob: acd */
>>>>>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
>>>>> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_=
MSR_HVM
>>>>> +
>>>>> +        .macro restore_spec_ctrl
>>>>> +            mov    $MSR_SPEC_CTRL, %ecx
>>>>> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>>>>> +            xor    %edx, %edx
>>>>> +            wrmsr
>>>>> +        .endm
>>>>> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this po=
int. */
>>>>> =20
>>>>>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if =
debugging Xen. */
>>>>> @@ -82,8 +89,7 @@ UNLIKELY_END(realmode)
>>>>>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>>>>> =20
>>>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this po=
int. */
>>>>> -        /* SPEC_CTRL_EXIT_TO_VMX   Req: a=3Dspec_ctrl %rsp=3Dregs/cp=
uinfo, Clob: cd */
>>>>> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_M=
SR_HVM
>>>>> +        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=3Dregs/cpuinfo         =
     Clob:    */
>>>>>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X8=
6_FEATURE_SC_VERW_HVM
>>>> I notice you did update this clobber remark, but what about the one fu=
rther
>>>> up in context?
>>> What about it?=C2=A0 It still clobbers %eax, %ecx and %edx.
>> Oh, sorry - I did look at DO_OVERWRITE_RSB only, not paying attention
>> to the now open-coded 2nd part, which - due to the blank line - doesn't
>> appear connected to the comment anymore.
>=20
> Yeah - it's a little harder now that it isn't a single line.=C2=A0 The
> req/clob information really is most useful at the start of the block,
> because that's where it is important to get the context correct.
>=20
> Can I take this as an R-by then?

Please do; I should have said so earlier on.

Jan


