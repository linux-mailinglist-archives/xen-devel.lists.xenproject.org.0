Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09949492F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 09:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258985.446574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nASaI-0004S4-Ix; Thu, 20 Jan 2022 08:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258985.446574; Thu, 20 Jan 2022 08:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nASaI-0004QC-EQ; Thu, 20 Jan 2022 08:14:18 +0000
Received: by outflank-mailman (input) for mailman id 258985;
 Thu, 20 Jan 2022 08:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nASaG-0004Q6-H0
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 08:14:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f490c5ea-79c8-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 09:14:15 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-ik-nS1s0O0uqvhw2ZgDs2A-1; Thu, 20 Jan 2022 09:14:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 08:14:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 08:14:11 +0000
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
X-Inumbo-ID: f490c5ea-79c8-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642666454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOexWuRP+a4nNbGsQFwHnkFkOyyaYXZnRWWHsSi/nNo=;
	b=bnSUqmE6jqWIFAogxfUoVeUuF6KHA+FLT6eftVFfN7p5NLbo/oOyKhYDKvaRskQtvbwrg2
	XjL05d2oWpd8p6EodNo8iMi4/gaQeJrhc9W7UlhGq2YCPdU3QbjfV1lM8Vkefpo5Ul1NRu
	zWeYwHeJBY6nPU961hgK9vJhUBuVAeU=
X-MC-Unique: ik-nS1s0O0uqvhw2ZgDs2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbUAxqKcStDTe0DiJ5Qy8oEd6wqUJze3OhKej/jdQg4VCUUVnSivdOrce9KtIxNm7U0zuTuym2OAEJ8C+9vs/QhzfEB4nf7JRZRTOlIw3ySxckhJ1PZH9av5FHraUL8R4/uabipvftqcsxfCfORyVGYpfMBoiJ7EBBn8Tey4Jiko6RLA3OIvH8opKy3etDHqGYfqc3G7+NVUCVJQryUb9zbwauIhvjSIOjHS4zP5OAGiVkLO1FJ5+OHk1E7FuWozqqNB+7DzdH/dxWBzFN49YVsZwCwjwvp+OM5rEegpzy2OxRSNFKG20j0bbHoSY1teiry4PoTu0Xtjk8uweV7J9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0x7qwCjE9UBVPjoPWKclpkFOfPmomR+s1KzDPSfnTc=;
 b=etkMdg3kjeVllB6H+Qu8kHUp06L3il1VPSfwWiHbL+vsymZYF85yS01d0tLZtQUoacGPdihyhMqRWIt1KwJORmsI1k3gEQueaZ7pXxeanP2CCfAcjwExyM8qBooleppx4jA9qj0E9B2HUiIf35NLQxJsKS5zKGCVFoYCMVhYc5KMFJwiDPFpKtYAmPmUTdzBTjet0ihyGj6TJEJb5FwyHJ0AHDDKzPnRsGoQyLhcKptnl2Z78v9FNfnwu2bY31yJPxv1HeRUSU9Sm5GmfrmLjktnrhAtMMGJT+TufdelWn2oSSBvyQcKX6+8LvnkGRoG5xihxe5sx1nVGdzhWdhsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad0c183a-ff7b-c560-ed3b-469d3f5c5b0a@suse.com>
Date: Thu, 20 Jan 2022 09:14:09 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74c2961b-29e1-9641-8a8b-b7cb0598b7be@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f830a537-d1d0-4e89-b042-08d9dbecd689
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741BB1890939831F7ADC808B35A9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RWnJt/h8tvIoZCqKoZoeQs27R/7UxkAUPpjTyMT5AmSIYlZ/DlCV3ft3ZPK/iUU0ENKqGeAC5HEXZU4z8iQcXOrHvdlxKoNnJ2Hnam/JSIeZK7JOib57TGKJIYISb7TfkXhpds0nv5TlKGvQsMIPG1LWafUOOQmM2iF7w3/eAAIce4Tj+1NALgpdR1SOcuswLlBp5rLsrrlDRPXrCDi14xn9UpBuYj13lDLbkheIyQrD8wKX9s+nl5jQNI7ExdPUzpAL03we4l5v4Q0yz7u7J0hvMauX9tx1j3Qr2YlOonfOvGnJjjtWvQrkzFwaN9qWaoViGwas/h4N0rNZZbk8tNcBUdQEV1KD1oatAl9KbWMoKY1qfZDZaLUotGxH/N7jcNrbEjj5OuuPhxpW4vJ3EvVDktaBeemu4iHyg1vOFGnqfbkPA4Jy0IiujNbR/chK4ErTVtIgDHksi8L2v3YjdNGsw+LKrE4mscBVJYvvHsCrQm9GfQvkTXl34j1JF3OThy/sTfnV1dxp0gS9u7aNGOYzaRuyYr74BdquvN+YyezbFTaRNOzKRGZv1ecYs1dJV9Q/s64w69k429dn7+sSoGBAKxwFtiLftvPRaewVq9hKckxC4MRooVRZz3BXMio9E0cpBw44ejUW1dHYzceaN79vHXmihogUeFeNnXGvQLtT7XnsQT6cJdEfdbBcfa1owBhrZ07XqTVnlM612vxyB5tjOrEFFMvrilwwIFm0k6E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(508600001)(31696002)(86362001)(316002)(6512007)(26005)(5660300002)(36756003)(110136005)(54906003)(8676002)(53546011)(8936002)(66476007)(66556008)(186003)(6486002)(31686004)(2616005)(6506007)(2906002)(83380400001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VdzegPPkq+yWX09P2sEgjuf5V87uDpdJgqmoQ+QPExMwDS+x9JcBuQIVCqDj?=
 =?us-ascii?Q?qqKaYdaC9MTg9t2OcC1CBJU56/sIhjkAHIQgbrPGUhTNEUObTBR9VOZePwWd?=
 =?us-ascii?Q?MrxvmpYhzPmnH0AU34ycYATHp65xQkGxpcCK8ly9ZS/+4mvh9hYTQ8edyBMS?=
 =?us-ascii?Q?YuljCc8Mj5HrEhOqvIp/sZas2+KkE5W76qdXzBGAMuzb6JZih83uw4uoazsl?=
 =?us-ascii?Q?FXY4CM2WgMrZQRB9OXftn9taqxfoqfCJD4bb2/LkVXYRnDwtUqA9xf8pM03U?=
 =?us-ascii?Q?ZNzfxJDgeblfP9X4UT11iae3ereW07xJ5HB/XWCFXy31h189dLydzChfOKu3?=
 =?us-ascii?Q?p8CFkyn23GNOw3rJLQ80PAZL2quLNvx0PyYuD0xMKb3jVOwUtuUYMCsK51W5?=
 =?us-ascii?Q?5OXerNkHS9lryADYZLHLcvo1LpEJS2WNOEwm61aOwn26fW9X9ij8UcXq7Av+?=
 =?us-ascii?Q?KFA8Vue0dPPAIWgGO9p4RNgd6wqhSCA1tW02Hk54SpN5ZBd3340CTt6uFsyk?=
 =?us-ascii?Q?aNaU36HjTeSydW/V6Nq2VFcwYU7SODw83Lw+yX4KplADywxQD+H815WLDqrg?=
 =?us-ascii?Q?FDzp3RpKo0piGXn3ekkWSbxJKSuDyVG5R0U3/OmFkV9pU6HrAuMv+PDCR1LE?=
 =?us-ascii?Q?aOusyprF9eQW8x/QytMSuRk+rnTEKP0Oveeddqrqew4ZLU1TSWjc1LVSqANa?=
 =?us-ascii?Q?kjZrisYXbEA8v9+Jlo8KGu2SdWiAPg49uik5Z1OKGSVkNtbIdvTANhNwnqzU?=
 =?us-ascii?Q?4sQHbwQeQjkm0EB3tZzGsXGjGandpzALa7bl0F0SELQXGfYwfxvMYnOgqkuw?=
 =?us-ascii?Q?K3QG51sahO0Wp9g6ce89RQVVzj3z6+U4O++fF4moR+xhtvjmpHNICjBNpF/L?=
 =?us-ascii?Q?mZib/ep38gFJFeC/cMadVFJeOQw+n/3hb1d0BZT+F6/W0vddp4La48Iv+gxF?=
 =?us-ascii?Q?YOLGfscW7/UpHWLTgU0CvxXOwihNr7qZzYjAqHmzi6QSFNCuxSu9o/pR5yZ3?=
 =?us-ascii?Q?96kYhvrb/aDw/84doxFN41QcKfARka/aFfXHEYa1IkI2zR3w3ZlqRbFXUUTb?=
 =?us-ascii?Q?HCZQ+F5YzoKKovirTyN9hwLAaDN/jzpPFqBVogvVct+4Gp9ORvdX+10uDX+U?=
 =?us-ascii?Q?CeB0/2VQyAWG+okQofEt89sdpzCX78q6ydisIucP9Vtx2CqA0pG+k4Z0OrLp?=
 =?us-ascii?Q?JwQ/dWG2tpkqAWpY7m/NUpCZavziHtHBsOYUoe0ZJ0+8nC71rmeN0oIC9MHx?=
 =?us-ascii?Q?FdAI1Sx71OnUPPogaUFaQ8xHoP7RT51xrURMUBhbluUFn6DxvlYflj/H+qhS?=
 =?us-ascii?Q?wS+7phHpadks8auAQG26vf4qe/ZCcXkyDT0slcMl+ZF67rBSRv/dPNBHqSlr?=
 =?us-ascii?Q?1p/l6X/VQi2UqPUCxm5NjWDgtQVE11/CNnnmraQtwgdOIyr+zt+RzaMRw0RO?=
 =?us-ascii?Q?Tj6ntKfpyZiY8vM7ufSABGUn4JsVL7K/kLKO58E7GV3cjTTR9UspckEkssC+?=
 =?us-ascii?Q?/8vGY+TkHLJD1a17dO+etuLO12NhcZrHvNOit+moKdwRwixBRXacU3/TWYxV?=
 =?us-ascii?Q?CXmW8xvyxwdUjNG8AYTs2xpctDn1u+H7E2vb+iF0iiua/w0mpvl6KRO62rL+?=
 =?us-ascii?Q?wg5x4sGpzwYf4nKqEn8rzAc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f830a537-d1d0-4e89-b042-08d9dbecd689
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 08:14:10.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfZDFpe19X1b3x8JOZI9ltJ14b2pEBylt5kmIZgbLstACS9SzPMbL7XoCKlBI1ckfCEXb9CsdnhBIBG/gZwTjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 19.01.2022 18:00, Andrew Cooper wrote:
> On 19/01/2022 13:42, Jan Beulich wrote:
>> On 17.01.2022 19:34, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/vmx/entry.S
>>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>>> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>>> =20
>>>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=3Dcurr %rsp=3Dregs/cpuin=
fo, Clob: acd */
>>>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
>>> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MS=
R_HVM
>>> +
>>> +        .macro restore_spec_ctrl
>>> +            mov    $MSR_SPEC_CTRL, %ecx
>>> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>>> +            xor    %edx, %edx
>>> +            wrmsr
>>> +        .endm
>>> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this poin=
t. */
>>> =20
>>>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if de=
bugging Xen. */
>>> @@ -82,8 +89,7 @@ UNLIKELY_END(realmode)
>>>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>>> =20
>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this poin=
t. */
>>> -        /* SPEC_CTRL_EXIT_TO_VMX   Req: a=3Dspec_ctrl %rsp=3Dregs/cpui=
nfo, Clob: cd */
>>> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR=
_HVM
>>> +        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=3Dregs/cpuinfo           =
   Clob:    */
>>>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_=
FEATURE_SC_VERW_HVM
>> I notice you did update this clobber remark, but what about the one furt=
her
>> up in context?
>=20
> What about it?=C2=A0 It still clobbers %eax, %ecx and %edx.

Oh, sorry - I did look at DO_OVERWRITE_RSB only, not paying attention
to the now open-coded 2nd part, which - due to the blank line - doesn't
appear connected to the comment anymore.

Jan


