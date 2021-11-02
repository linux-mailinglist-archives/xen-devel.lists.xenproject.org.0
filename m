Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC7A442D08
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220138.381285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsD1-000518-U7; Tue, 02 Nov 2021 11:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220138.381285; Tue, 02 Nov 2021 11:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsD1-0004yk-Qd; Tue, 02 Nov 2021 11:44:07 +0000
Received: by outflank-mailman (input) for mailman id 220138;
 Tue, 02 Nov 2021 11:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DlrU=PV=zytor.com=hpa@srs-us1.protection.inumbo.net>)
 id 1mhsCz-0004yT-Dr
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:44:06 +0000
Received: from mail.zytor.com (unknown [198.137.202.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d3556dc-3bd2-11ec-8555-12813bfff9fa;
 Tue, 02 Nov 2021 11:44:03 +0000 (UTC)
Received: from [127.0.0.1] (81-227-32-128-no2212.tbcn.telia.com
 [81.227.32.128]) (authenticated bits=0)
 by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 1A2BN0kw425542
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 2 Nov 2021 04:23:02 -0700
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
X-Inumbo-ID: 2d3556dc-3bd2-11ec-8555-12813bfff9fa
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 1A2BN0kw425542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2021103101; t=1635852184;
	bh=zKQeGXfsP+l5tBAkLhe3Tvi3JuMR+eopIE+9EA1wQsM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=t9G1OOot4B9uuHrdKAMpalUcHST3KZcHpw4b1zNsOTmPFQzEzjgkW4i9MQCCPvQDq
	 Tl7sNQ99i7b+Yy/NXeGs0sWc540J4Mxq0YVt4kBOl0yB5VBz9I+uc5Tp9Q8LPyrjz7
	 lV2GoRLP6LMDOh9gkMeNYxovtOHZSNE8AnMf+2KVpqsrpxnjGNJVAA08FWqiFu18o1
	 TXFFpkt9pODi0BDJm/xLoO1e43DDJf0MW14h0337K7fkxXncb4u4r/DhlxuPdHIbsy
	 Yzu8cxfYydoC8lPVacveRu9yAl2L1nwIRqd7Kx23zXXsc0c25w7pOvBxRWLsLERShX
	 ywQ5nXMbngBFw==
Date: Tue, 02 Nov 2021 12:22:50 +0100
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, Lai Jiangshan <laijs@linux.alibaba.com>
CC: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, Jan Beulich <jbeulich@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
        xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_V4_04/50=5D_x86/xen=3A_Add_xenp?= =?US-ASCII?Q?v=5Frestore=5Fregs=5Fand=5Freturn=5Fto=5Fusermode=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <YYEJuIgQukcDzy1R@zn.tnic>
References: <20211026141420.17138-1-jiangshanlai@gmail.com> <20211026141420.17138-5-jiangshanlai@gmail.com> <YYD9ohN2Zcy4EdMb@zn.tnic> <d4ae23dd-377e-8316-909b-d5bdeacc0904@linux.alibaba.com> <YYEJuIgQukcDzy1R@zn.tnic>
Message-ID: <6F6D3FEC-9AF1-40E1-A7C2-394D21C40114@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 2, 2021 10:49:44 AM GMT+01:00, Borislav Petkov <bp@alien8=2Ede=
> wrote:
>On Tue, Nov 02, 2021 at 05:19:46PM +0800, Lai Jiangshan wrote:
>> It will add a 5-byte NOP at the beginning of the native
>> swapgs_restore_regs_and_return_to_usermode=2E
>
>So?
>

It would be interesting to have an "override function with jmp" alternativ=
es macro=2E It doesn't require any changes to the alternatives mechanism pr=
oper (but possibly to objtool): it would just insert an alternatives entry =
without adding any code including nops to the main path=2E It would of cour=
se only be applicable to a jmp, so a syntax like OVERRIDE_JMP feature, targ=
et rather than open-coding the instruction would probably be a good idea=2E

That would reduce the trade-off to zero=2E

>> I avoided adding unneeded code in the native code even if it is NOPs
>> and avoided melting xenpv-one into the native one which will reduce
>> the code readability=2E
>
>How does this reduce code readability?!
>
>diff --git a/arch/x86/entry/entry_64=2ES b/arch/x86/entry/entry_64=2ES
>index e38a4cf795d9=2E=2Ebf1de54a1fca 100644
>--- a/arch/x86/entry/entry_64=2ES
>+++ b/arch/x86/entry/entry_64=2ES
>@@ -567,6 +567,10 @@ __irqentry_text_end:
>=20
> SYM_CODE_START_LOCAL(common_interrupt_return)
> SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL=
)
>+
>+	ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", \
>+                X86_FEATURE_XENPV
>+
> #ifdef CONFIG_DEBUG_ENTRY
> 	/* Assert that pt_regs indicates user mode=2E */
> 	testb	$3, CS(%rsp)
>
>> I will follow your preference since a 5-byte NOP is so negligible in th=
e slow
>> path with an iret instruction=2E
>
>Yes, we do already gazillion things on those entry and exit paths=2E
>
>> Or other option that adds macros to wrap the ALTERNATIVE=2E
>> RESTORE_REGS_AND_RETURN_TO_USERMODE and
>> COND_RESTORE_REGS_AND_RETURN_TO_USERMODE (test %eax before jmp in nativ=
e case)
>
>No, the main goal is to keep the asm code as readable and as simple as
>possible=2E
>
>If macros or whatever need to be added, there better be a good reason
>for them=2E Saving a NOP is not one of them=2E
>
>Thx=2E
>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

