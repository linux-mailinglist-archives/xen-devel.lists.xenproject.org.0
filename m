Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53007ADCC2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 18:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607931.946258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qko8m-0006cw-Lb; Mon, 25 Sep 2023 16:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607931.946258; Mon, 25 Sep 2023 16:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qko8m-0006bC-It; Mon, 25 Sep 2023 16:08:56 +0000
Received: by outflank-mailman (input) for mailman id 607931;
 Mon, 25 Sep 2023 16:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e0KE=FJ=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qko8l-0006Yh-0j
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 16:08:55 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1af8555-5bbd-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 18:08:53 +0200 (CEST)
Received: from [127.0.0.1] ([99.8.153.148]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 38PG7vwg1512316
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 25 Sep 2023 09:07:58 -0700
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
X-Inumbo-ID: d1af8555-5bbd-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 38PG7vwg1512316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1695658079;
	bh=D4dkY7ib239sJgAi09Fyq922U7t4CmCadoRO6xTmuuw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=m+YYgtMYbvG0oSi6qazn8+RQFHlQXxy4UY2F0Rjs+LlWVTXbJbLPUJNxUdaSMUJq+
	 b7/To74zymNcjg+EeY5RtIp7nST07IEQfhIeHothUwS4zDyLxItkTUc7ZPCdMuN6BB
	 QRaFihbHEYpIbAfr/55Q5ZC5HWI0PCGLeubKxlwLdb8R4e9SC2t4rY7hPGQxGO8Nii
	 qQxaxc6FPDuDh2d7sdIIUuXNsw+noU3Xhr4VJg/M8+Fd03my+G3N4jdPz6q+N1Fzm2
	 kZF9LFH7Je5OllJOyYS8lR7SKuvShm49bOICGyBzUkB+iYLoG0co28aUJ0lbcNNhc1
	 sdrrP/d4qsEWQ==
Date: Mon, 25 Sep 2023 09:07:47 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
CC: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, luto@kernel.org,
        pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
        nik.borisov@suse.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v11_35/37=5D_x86/syscall=3A_Split_ID?= =?US-ASCII?Q?T_syscall_setup_code_into_idt=5Fsyscall=5Finit=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230923094212.26520-36-xin3.li@intel.com>
References: <20230923094212.26520-1-xin3.li@intel.com> <20230923094212.26520-36-xin3.li@intel.com>
Message-ID: <D4167CD5-B619-448D-B660-24ABC0786E0A@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 23, 2023 2:42:10 AM PDT, Xin Li <xin3=2Eli@intel=2Ecom> wrote:
>Because FRED uses the ring 3 FRED entrypoint for SYSCALL and SYSENTER and
>ERETU is the only legit instruction to return to ring 3, there is NO need
>to setup SYSCALL and SYSENTER MSRs for FRED, except the IA32_STAR MSR=2E
>
>Split IDT syscall setup code into idt_syscall_init() to make it easy to
>skip syscall setup code when FRED is enabled=2E
>
>Suggested-by: Thomas Gleixner <tglx@linutronix=2Ede>
>Tested-by: Shan Kang <shan=2Ekang@intel=2Ecom>
>Signed-off-by: Xin Li <xin3=2Eli@intel=2Ecom>
>---
> arch/x86/kernel/cpu/common=2Ec | 13 ++++++++++---
> 1 file changed, 10 insertions(+), 3 deletions(-)
>
>diff --git a/arch/x86/kernel/cpu/common=2Ec b/arch/x86/kernel/cpu/common=
=2Ec
>index 20bbedbf6dcb=2E=2E2ee4e7b597a3 100644
>--- a/arch/x86/kernel/cpu/common=2Ec
>+++ b/arch/x86/kernel/cpu/common=2Ec
>@@ -2071,10 +2071,8 @@ static void wrmsrl_cstar(unsigned long val)
> 		wrmsrl(MSR_CSTAR, val);
> }
>=20
>-/* May not be marked __init: used by software suspend */
>-void syscall_init(void)
>+static inline void idt_syscall_init(void)
> {
>-	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
> 	wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64);
>=20
> 	if (ia32_enabled()) {
>@@ -2108,6 +2106,15 @@ void syscall_init(void)
> 	       X86_EFLAGS_AC|X86_EFLAGS_ID);
> }
>=20
>+/* May not be marked __init: used by software suspend */
>+void syscall_init(void)
>+{
>+	/* The default user and kernel segments */
>+	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
>+
>+	idt_syscall_init();
>+}
>+
> #else	/* CONFIG_X86_64 */
>=20
> #ifdef CONFIG_STACKPROTECTOR

Am I missing something, or is this patch a noop?

