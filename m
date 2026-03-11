Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOQLKDU1sWnxsQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:26:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842F260674
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250900.1548238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0FpH-000770-OI; Wed, 11 Mar 2026 09:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250900.1548238; Wed, 11 Mar 2026 09:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0FpH-00074N-LN; Wed, 11 Mar 2026 09:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1250900;
 Wed, 11 Mar 2026 09:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0FpF-00074B-LS
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 09:25:57 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e42b940-1d2c-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 10:25:55 +0100 (CET)
Received: from CH2PR04CA0030.namprd04.prod.outlook.com (2603:10b6:610:52::40)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:25:50 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::ca) by CH2PR04CA0030.outlook.office365.com
 (2603:10b6:610:52::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 09:25:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 09:25:50 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 04:25:48 -0500
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
X-Inumbo-ID: 4e42b940-1d2c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOx4SZn4AatKtIlfHsnZPcb00TzI+P8uldrOpJ9AOlvd8FqBJfh3OB431YfZSpAX/89yzXl75NnmPPOcLffbofwWbuavqDHZG+CRiaszC4vNtaiGUqzCekJya1BFSa9uNQJsJDt8uM/4tJS5HOMnq19ir/otQLL2GeyOiDNQtOgEpUns6qXYt2WtOelDviARpYaa4LJ0r+Q/X6ykbKwuP0dS4jJSW90VwPbov1cQOQb0Uav5SIiUjO4l4niLDMfYITmply1oAYUf2wuwHqwCliObLqmho07/mKDqaBZjdGoPXjZcE8ej/GzbvCddRtJNbzn0irztCjbCUsi48ySc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLoPqqk2GbJd+TGmLW1ceGwAgHSMyplTDrP7Rk8/y5E=;
 b=e1Rd9NyYDFleyDFFRJPNee9cKdGsm1+u3k2fplEZ6IkTIs1q/rl9C2pU0cj2qVrPqeGW4pWnDjrUxbwKl39SyocKYDj3krUvHc4U6GDJjXGrIsPFnZRFSy2Qhdi+IDMbwIqP6mNSSv+6shzUsgZorX/QQZtDvNw8/8f1BB0M3EjvVo+IHc2MUfJSzxr25m6ZWIASFiREkQfSzCWkysY+nu57jikGWfqM8mklPTmUw3jFuRHmJtgvt2HBP2MyzLuYkPqlFCXiz2tj80LoY5x8wg0q1z3rmRFqB4bCnw/4gmb/XPepQMSX8hCBr8/0cI9natmHUb/bf0TyxEbNJb52oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLoPqqk2GbJd+TGmLW1ceGwAgHSMyplTDrP7Rk8/y5E=;
 b=UxEuOJ7bT7+vyIQ6OJ/1U7dNAT/ISDHs2fzBNYy3KpoM8EzIjVqqDw5NblK4Ku1+p3LoRuV/rShyKI8zlFKMwe5A5tnL/M7q0LeS5brFi1tlL5LiqO+/dWdWHyQDBD4f/ipK5+VjbX2rDcxwlNIi6/z5V5V5J2fJPmJ+jHJ6KGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 10:25:41 +0100
Message-ID: <DGZUFMGSILDF.3ES3YACXM6AG4@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
X-Mailer: aerc 0.20.1
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
 <813d3fc9-170a-4f25-872a-3688946c236d@suse.com>
In-Reply-To: <813d3fc9-170a-4f25-872a-3688946c236d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7edca8-cc75-4196-a885-08de7f502f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8zfur7QN5nECEbhWh7dW/az+PDaB9NABwK1nRl0zcqZw0Rg5w+IQN7YiCTeHcVXkV7wm8gw7Rxmi/vJGX4pSZwxQB+b7UTqch34bW+ZIV2NsvWGdagoB8S60FSIT2BMPwB+BQ8HqkrxAML4fJ26RZThkASF3GrzJy9/UcDU3PtyO6djSqA68S4aDN3I946IQRcFy2ypyokTOn3j37OatsA6PpSYO/XlkjPBKl5a616wBIcx9OUHhydu8Z1mvXqdaCaRL/DGm1mvH7ucBixTRDcUi8ChVZX94cQVvGpFRs489E9DRQUIBg7sUduhiRchJG6yoHedNeRayj11tXi6ayOUeLHPATxnvBTDQWowv7sI7XC2jvMqDKZ/HGXaZzrf/gFDnBe4b8OWCdGU88wM7ZzYLiehdKQq0dO0lHkUemF3oLbHvc9AHtM5/k5UeUp2HM6G9ppuMzr02MDWJprgQ2p8V57V8uwv0Tz9QZ2L308Jzp24l6nYEX5mKooPZP2fPQCNlSVUihpIaq0cPzsgHTEI0URfQLF1DB+M9IoSFuzUeMgad+ASt01wTWhC8iIa+VtORfjan9IVJjNmgzjOpGUXT2UfwawSTBmeEFuoSqBiXYfn9Lrw9+UngklKdQ1ftGXsL5Uw48u1yzuba9ceLNVvzGV6MltCJOSmu6G3Zlj/ZLzpKykpjWLvrkofGPtnt8KpDD9py1OfoaKhyUcSEIb9ATlN/7Um84f1CLWdmx/CNdmsKZxOsdWG+wwqb8URWTIrFrKUUZ66j509BCMI7vg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2vWd5F5t4ewEj8tvFzBbUfVBaYO3eiF5vT54cc3QjAnRiS691cnWo8rvBOEhL2Wqg4VjVIx8OzmFBMEPe2cEJLXGuzOceJp3doTxQ6IZ/Ssch1XxkRjMUdbHSicelkeqD5O9jpm0Q7HOWiN+cnwO4QenjWsjDDH2jPximrlqcrrFbsL23AzSN5HaHuKmDEhkRIqJdd0yrQW0XJkB4qY+uTlzMLC1ZXVVdBga0mDWzicwcCtIMeEfh8V2En8L7sXRiTj8zGXisvM5+j9hEBJk37McYgODFRyfVP6fhn3TCGpKKoyC04nnGudf76PsYMmOF+DaVCUzEq8T6En0bP9+RNmpwQPU1y36M/HaGyojjR+s9EwJ+cJzTWnProiSl2XLKbFuB1XVIgsavTwq76DAFj6eIlLnGrgZLb/YZwUP1pWNdYzOt1ImT0YhaN2Zj84x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:25:50.0774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7edca8-cc75-4196-a885-08de7f502f53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260
X-Rspamd-Queue-Id: 1842F260674
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:mid];
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

On Wed Mar 11, 2026 at 9:35 AM CET, Jan Beulich wrote:
> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3832,69 +3832,47 @@ int hvm_descriptor_access_intercept(uint64_t exi=
t_info,
>>      return X86EMUL_OKAY;
>>  }
>> =20
>> -static bool cf_check is_cross_vendor(
>> -    const struct x86_emulate_state *state, const struct x86_emulate_ctx=
t *ctxt)
>> -{
>> -    switch ( ctxt->opcode )
>> -    {
>> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
>> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
>> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
>> -        return true;
>> -    }
>> -
>> -    return false;
>> -}
>> -
>>  void hvm_ud_intercept(struct cpu_user_regs *regs)
>>  {
>>      struct vcpu *cur =3D current;
>> -    bool should_emulate =3D
>> -        cur->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_vend=
or;
>>      struct hvm_emulate_ctxt ctxt;
>> +    const struct segment_register *cs =3D &ctxt.seg_reg[x86_seg_cs];
>> +    uint32_t walk =3D PFEC_insn_fetch;
>> +    unsigned long addr;
>> +    char sig[5]; /* ud2; .ascii "xen" */
>> =20
>> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, =
regs);
>> +    if ( !opt_hvm_fep )
>> +        goto reinject;
>
> Is this possible at all, i.e. shouldn't there be ASSERT_UNREACHABLE() in
> addition if already the check is kept?

It isn't.

v2 used to BUG_ON() at VMEXIT when !HVM_FEP and compile out this handler
altogether, but Andrew was unhappy with it because he uses it occasionally =
and
it'd be more of a PITA to undo the removal or force a HVM_FEP-enabled hyper=
visor
for the #UD handler to be present at all.

I have no strong views on the ASSERT. It's not expected to happen, but I do=
n't
expect the existing conditions to change either, and if they do that will w=
arrant
a change in the handler too.=20

If you want it I can add it, but if we're not killing the handler in releas=
e I
don't think it's very helpful to assert/bug_on.

>
>> -    if ( opt_hvm_fep )
>> -    {
>> -        const struct segment_register *cs =3D &ctxt.seg_reg[x86_seg_cs]=
;
>> -        uint32_t walk =3D ((ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3)
>> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>
> Why is this initializer not retained?

It is, it's just that the diff is terrible. An unfortunate side effect of t=
he
removal of the braces. The scope collapsing forces it on top of the functio=
n,
before the emulation context is initialised.

It's set up in steps. walk is unconditionally initialised as isnsn_fetch, a=
nd
later (after emulate_init_once()), OR'd with PFEC_user_mode for DPL =3D=3D =
3. See...

>
>> -        unsigned long addr;
>> -        char sig[5]; /* ud2; .ascii "xen" */
>> -
>> -        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>> -                                        sizeof(sig), hvm_access_insn_fe=
tch,
>> -                                        cs, &addr) &&
>> -             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>> -                                         walk, NULL) =3D=3D HVMTRANS_ok=
ay) &&
>> -             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) =3D=3D 0) )
>> -        {
>> -            regs->rip +=3D sizeof(sig);
>> -            regs->eflags &=3D ~X86_EFLAGS_RF;
>> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>> =20
>> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
>> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
>> -                regs->rip =3D (uint32_t)regs->rip;
>> +    if ( ctxt.seg_reg[x86_seg_ss].dpl =3D=3D 3 )
>> +        walk |=3D PFEC_user_mode;

... here.

>> =20
>> -            add_taint(TAINT_HVM_FEP);
>> +    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>> +                                    sizeof(sig), hvm_access_insn_fetch,
>> +                                    cs, &addr) &&
>> +         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>> +                                     walk, NULL) =3D=3D HVMTRANS_okay) =
&&
>> +         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) =3D=3D 0) )
>> +    {
>> +        regs->rip +=3D sizeof(sig);
>> +        regs->eflags &=3D ~X86_EFLAGS_RF;
>> =20
>> -            should_emulate =3D true;
>> -        }
>> -    }
>> +        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
>> +        if ( !(hvm_long_mode_active(cur) && cs->l) )
>> +            regs->rip =3D (uint32_t)regs->rip;
>> =20
>> -    if ( !should_emulate )
>> -    {
>> -        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>> -        return;
>> +        add_taint(TAINT_HVM_FEP);
>>      }
>> +    else
>> +        goto reinject;
>> =20
>>      switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
>>      {
>>      case X86EMUL_UNHANDLEABLE:
>>      case X86EMUL_UNIMPLEMENTED:
>> -        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>> -        break;
>> +        goto reinject;
>
> How about placing the reinject label here, along with the two case one?
>
> Jan

Sure. That works too.

Cheers,
Alejandro

