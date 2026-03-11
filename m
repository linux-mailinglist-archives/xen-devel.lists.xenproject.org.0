Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN7MFolCsWlCtAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:23:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25872620AE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250974.1548301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Ghi-00017b-4J; Wed, 11 Mar 2026 10:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250974.1548301; Wed, 11 Mar 2026 10:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Ghi-00015B-1c; Wed, 11 Mar 2026 10:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1250974;
 Wed, 11 Mar 2026 10:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0Ghg-000155-DC
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 10:22:12 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27533957-1d34-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 11:22:06 +0100 (CET)
Received: from PH8P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::29)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 10:22:00 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::a6) by PH8P220CA0023.outlook.office365.com
 (2603:10b6:510:345::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 10:21:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 10:21:59 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 05:21:57 -0500
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
X-Inumbo-ID: 27533957-1d34-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXEdklrnRd4sUqss9M3PN8MrQXFWE6qqnXjleYHmjsKWU6+IaKrSM0Oie4XOuL8pJi+M6govn/aWf3KpypukKctBnhuotPRjhErR6MXFt93wN+XXTAPsMSGS5A45bghaa/BeD7USuHt6M6GgBcxibh1nB+VgnLx4bQSCW4b9EbjmzMwaY1CewA7losLDHZUXQ5jo62YY44I6uv05p+IKYLaeUjWHMYXScuMpwc9L/nNpon+T2Gk/4Mq7tyzQu6lWSPSEEoMCeugVoMmBKKcT1UlB7jVG5KRFDBN9VqVwspjzDz9vfP0YVwGXXeZ3iNHc3ruv6jjpxHxspnuxDcuC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZTB3cT2ASH/74OHAs4DUZkRTc5eEWFt1tnPBwff3Jw=;
 b=ItkKREbAaR0JyunTS/upadzsdumk7XgZUn/nswKKdAm7IWUbbI+guvBDNwft5SwCS2nIHDJ5HvYtjjJ8jIuFaFmQIwCtsvM6i/pwQAd2J71Gd5QyXMr5RL/7o8KTuiEQmPXcuHqQsWuM13b59ByybWO7QS2HO9fNQZTQHS7KNpQRINgNkPkcsX38R/dTgsaGNKo3MTBmq93UE6MYVj9kgDRWnxqZvVLcQSQfSOc+7uAMoxxM2stwCLsNNSNkFdX3nt9cFZfzO4bgmr6BmiCsIm3fy9w2AlbYh5CpFTiGNaSZ77ocmNGgG8tkHq1puAf9EZOVnoFcHe68WFSza27jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZTB3cT2ASH/74OHAs4DUZkRTc5eEWFt1tnPBwff3Jw=;
 b=MI6xaYzJ+wGatWBMEYcGqNn6wWzsAzjO5mLRkT0EDU/fqc7XbsUYuTeCEbU0hHIU6e6sfcmN1OONzMwGRnj+fwFqAzkBw06vyD5GXk1C01aeqeEJTJLQuTzO4d3t2hHUcPc/roxin6D6+CAULPhxnDzSAo5QDUWSoeET49dF+iE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 11:21:56 +0100
Message-ID: <DGZVMOYWFGY5.3NSQ9DUBFDOLR@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
 <813d3fc9-170a-4f25-872a-3688946c236d@suse.com>
 <DGZUFMGSILDF.3ES3YACXM6AG4@amd.com>
 <f5b74658-3a5f-47ac-8eaa-3f7fbf431a32@suse.com>
In-Reply-To: <f5b74658-3a5f-47ac-8eaa-3f7fbf431a32@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c92e5a5-2e2f-4032-932f-08de7f5807ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sqGV86/D8xf0tXLbsYYt0CV+cjqte7UD44HtVL5SmP5A3j7LA8izuUuZ/ksA5QB19KJQXwEQFRL5nLY1hnrokBpOoQsR33pixGcuMkceayOqQ70vu4ma1sFVcr+5jGbXFwWoNhqWRdtfOZbk59YXJcYrOJUPuE4w74ekTNx37qPJ209PbqGKLgPJ/Rfnd02pbeJ2s+Kj6ySoI/L2gAM1d7zO+UwWJfWx3eY7vkziMPad6NKRGEWdJpKZ02f781KcnI/81G7ISMe/XJNIED03ibj7WyyepOaYEFDbK5NLInp4R0FEiCaIBkTaZzoT7HwYRorEo3QY1YSnjTfuKtj3esLmSQa2d0iPW/880ntJShwLSXk9Mp62cnzFHz547+ztPnoP0sWg00leH2eJF/8UBMjcqTtaZqkpMyLjDuGGPpmTuWzxOSf4d/hFblzX6NOxOk5SQFGr3KPscowIVZjO73gMHadZ/JsHSq7lIXYEAC4w3JfVhnmI16c3MTfVpS2tD7UPt+apZ5nl6wd7iHUJy4mkcB8lDYK+M2ORDF8vZG+wXOOPb9Veosu8IiPIUGTw7B01e6PpvP0f2uhCEE6O1tNAyLBnRHCKvmLyAr56vIFFN4+lpqXrvhF9wHyV3LAjIiuCOiAZyn8F5tXKs67n/SpqrClU/QrdIunVgENlsv5kGTLlHyYd+hbD4IKlwW2oKQEFnu6vR/LTPdIzmIPqZnWQfCZroxIr7DYq9+IOc7T4qvUWT9jfuVlMtBrDyHZBp8a71+lP9KQ8dsAB7q4S3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TEUPcQ/HxDkKwjAwm3c9i0HuXu0suNOo+KNDsGVt8W2tgtBmThTHPluaRPaqTZm8XlsJt1TcfMqzwZoGkdXlFMKgLtKOXMLKJyrMq/KKrj09BpNfQUBd6ad2jaKOVx+cLQjHql+CrfJtwEPjHPdGr4nosJBGbg3Pi2HE/4htoieLbxEa8+za+ZPtuwm3zA9ThHHQszR0Exi9CdP9mm0KHmUu6r8+504q52QTxwpziABSVrUsQ3ztg6+maWOWotzWB+/JiaEcvk7OVPnZtGR0TDx0wdxN3R16X/q2i110mtRwfQnHDAGgE6laBD1UiTrhFcQ41KWNomWA+zVtMf7HrKjP87ctF/59iix0H+6TTTtK7/JN1Sxr9q/xV4Qfez+VQKEK8YeyGG61mm/QgCkjOkhmEmj2WjmzN3aDK+Kp3W/6n0hfKNFUFKjcqMI2yiiL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 10:21:59.6055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c92e5a5-2e2f-4032-932f-08de7f5807ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054
X-Rspamd-Queue-Id: C25872620AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 10:30 AM CET, Jan Beulich wrote:
> On 11.03.2026 10:25, Alejandro Vallejo wrote:
>> On Wed Mar 11, 2026 at 9:35 AM CET, Jan Beulich wrote:
>>> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -3832,69 +3832,47 @@ int hvm_descriptor_access_intercept(uint64_t e=
xit_info,
>>>>      return X86EMUL_OKAY;
>>>>  }
>>>> =20
>>>> -static bool cf_check is_cross_vendor(
>>>> -    const struct x86_emulate_state *state, const struct x86_emulate_c=
txt *ctxt)
>>>> -{
>>>> -    switch ( ctxt->opcode )
>>>> -    {
>>>> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
>>>> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
>>>> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
>>>> -        return true;
>>>> -    }
>>>> -
>>>> -    return false;
>>>> -}
>>>> -
>>>>  void hvm_ud_intercept(struct cpu_user_regs *regs)
>>>>  {
>>>>      struct vcpu *cur =3D current;
>>>> -    bool should_emulate =3D
>>>> -        cur->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_ve=
ndor;
>>>>      struct hvm_emulate_ctxt ctxt;
>>>> +    const struct segment_register *cs =3D &ctxt.seg_reg[x86_seg_cs];
>>>> +    uint32_t walk =3D PFEC_insn_fetch;
>>>> +    unsigned long addr;
>>>> +    char sig[5]; /* ud2; .ascii "xen" */
>>>> =20
>>>> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor=
, regs);
>>>> +    if ( !opt_hvm_fep )
>>>> +        goto reinject;
>>>
>>> Is this possible at all, i.e. shouldn't there be ASSERT_UNREACHABLE() i=
n
>>> addition if already the check is kept?
>>=20
>> It isn't.
>>=20
>> v2 used to BUG_ON() at VMEXIT when !HVM_FEP and compile out this handler
>> altogether, but Andrew was unhappy with it because he uses it occasional=
ly and
>> it'd be more of a PITA to undo the removal or force a HVM_FEP-enabled hy=
pervisor
>> for the #UD handler to be present at all.
>>=20
>> I have no strong views on the ASSERT. It's not expected to happen, but I=
 don't
>> expect the existing conditions to change either, and if they do that wil=
l warrant
>> a change in the handler too.=20
>>=20
>> If you want it I can add it, but if we're not killing the handler in rel=
ease I
>> don't think it's very helpful to assert/bug_on.
>
> I see two options: Drop the if() or add ASSERT_UNREACHABLE() to its body.

I'll go for that second option then.

>
>>>> -    if ( opt_hvm_fep )
>>>> -    {
>>>> -        const struct segment_register *cs =3D &ctxt.seg_reg[x86_seg_c=
s];
>>>> -        uint32_t walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>>>> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>>>
>>> Why is this initializer not retained?
>>=20
>> It is, it's just that the diff is terrible. An unfortunate side effect o=
f the
>> removal of the braces. The scope collapsing forces it on top of the func=
tion,
>> before the emulation context is initialised.
>>=20
>> It's set up in steps. walk is unconditionally initialised as isnsn_fetch=
, and
>> later (after emulate_init_once()), OR'd with PFEC_user_mode for DPL =3D=
=3D 3. See...
>>=20
>>>
>>>> -        unsigned long addr;
>>>> -        char sig[5]; /* ud2; .ascii "xen" */
>>>> -
>>>> -        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>>>> -                                        sizeof(sig), hvm_access_insn_=
fetch,
>>>> -                                        cs, &addr) &&
>>>> -             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>>>> -                                         walk, NULL) =3D=3D HVMTRANS_=
okay) &&
>>>> -             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) =3D=3D 0) )
>>>> -        {
>>>> -            regs->rip +=3D sizeof(sig);
>>>> -            regs->eflags &=3D ~X86_EFLAGS_RF;
>>>> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>>>> =20
>>>> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. *=
/
>>>> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
>>>> -                regs->rip =3D (uint32_t)regs->rip;
>>>> +    if ( ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3 )
>>>> +        walk |=3D PFEC_user_mode;
>>=20
>> ... here.
>
> But that's the point of my question: Why did you split it? All you mean t=
o
> do is re-indentation.

Because I need to declare "walk" ahead of the statements. Thus this...

    uint32_t walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
                     ? PFEC_user_mode : 0) | PFEC_insn_fetch;

must (by necessity) have the declaration placed on top before the emulator
context initialisation. The options are...

    uint32_t walk;
    [... lines ...]
    walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
            ? PFEC_user_mode : 0) | PFEC_insn_fetch;

... or...

    uint32_t walk =3D PFEC_insn_fetch;
    [... lines ...]
    if ( ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3 )
        walk |=3D PFEC_user_mode;

Line count remains at 3 in both cases, but in the former case there's a
comparison, a ternary operator and an OR all adding cognitive load to the
same statement. In the latter case there's an assignment in the 1st stateme=
nt,
an if+comparison in a separate line, and a separate OR in the final stateme=
nt.
It's just simpler to meantally parse because the complexity is evenly
distributed.

I can see how the current form was preferred to avoid a third line (and
then a forth due to the required newline, doubling the total). But with the
rearrangement that's no longer relevant.

If you have a very strong preference for the prior form I could keep it, th=
ough
I do have a preference myself for the latter out of improved readability.

Cheers,
Alejandro

