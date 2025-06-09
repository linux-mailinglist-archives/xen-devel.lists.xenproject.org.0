Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83722AD297B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 00:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010452.1388547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOlDg-0001J4-Ue; Mon, 09 Jun 2025 22:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010452.1388547; Mon, 09 Jun 2025 22:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOlDg-0001Hd-Rz; Mon, 09 Jun 2025 22:43:56 +0000
Received: by outflank-mailman (input) for mailman id 1010452;
 Mon, 09 Jun 2025 22:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=InIE=YY=netscape.net=brchuckz@srs-se1.protection.inumbo.net>)
 id 1uOlDf-0001HX-4B
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 22:43:55 +0000
Received: from sonic310-22.consmr.mail.gq1.yahoo.com
 (sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33ed73cf-4583-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 00:43:48 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Mon, 9 Jun 2025 22:43:45 +0000
Received: by hermes--production-ne1-9495dc4d7-jhk9q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2aa59b495c54eb04322430ca52fe5ded; 
 Mon, 09 Jun 2025 22:43:43 +0000 (UTC)
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
X-Inumbo-ID: 33ed73cf-4583-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1749509025; bh=7Bw3jXhW+wkA/wUNZMtibMU2KmDX3Hvp9ZvGY8+23r8=; h=Date:To:Cc:From:Subject:References:From:Subject:Reply-To; b=jl9FmF7JAkKQccD47YpFJdCq+k7/D9Tv2CegMDHO7qHIhIC/25Kf5mJjYilhydcAi6PvjEIC1aklanjKlqkfd9BHc3Zf3mXUao1oqo9ch6f0WP78j7fJMTCD6+HyISeLQaP4S+1F8vBDnWcCV0VLbQkzikmjMnYIIWadI8l0Fst5Uu+c9v1O3L+dG4/NMK0BT/g4Ii4tAdpOvNtUocdt4e3Do2AliCZ93AzVpp4/sai2EJV9QT8AQ5fBNjPrlFcmAShACwdbLRsgYbNXx4lsntSZpwD9CYtR0RfkXCYZ35yZJHlbHav3+C0kJ7zcgWmc6Y4kFZkduBNpNktw5jGCeg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749509025; bh=nG2iMdVHZOX6wNMXyzYfBxmJDHQT5MDJHts4/Ckhamu=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=jnZNGEWa2zZ4Ly0kE+uVpLprnJC0zieGpSrko/3KdHu/AXJ27DWx8Em5+y9kWkKoricJxJU4scEXLXcpHh3AE9InKooBpqmlCiy/k8Of239Qy/f3AyOsu19sZjuNSirZUNEsDfAz9pQpTX4VmgSCQc8Z+mFJg19uYLFJfJlI1lIBtJfKxfkC2dvQCnWMFr2FFsNobQ6Xu+sHWpzJZ/uGZeq3b8mtStyt6iysrcBufqKNeYMGqYfIZYlcSlwUQwGf4itbS+PG6U0RGzmA8oV6taKDnXmGtKiI/opl1ZUOUnOJ6AHS+fCekvnJHnFL/tpKEGDUjYxZPfg4A+XmoPFPxw==
X-YMail-OSG: mjaEBDUVM1mziT1Wc_IHByQDroBWuuSdqxLiyffktXS2f60l5XiDlzQmO4Jjiqj
 ZF8VdF4G6jsvrZLhzbeToJsDbucH8ZLaV0oaptyCGenBCdr5hghGIIw6lYaGXAzOTvvYRjnNmfxk
 FEMFARgLGh_0d.a8gmqVplelCWaF9EPn5ztqivpRojwxfSrLFs.xxXr4aoPU7YxUbepR1nKblICj
 FwWeXS3bofHTg7iibwG4ihaMcDwaVhHdQ.GqIpztBW2obqChBiDZVr9fueSCuamOqZGTykwuFNvu
 .8oXPig.jkcLO5oZODMdqE26TCXLpWwiWhGS3bEUqO9BX5NneWUIIPCaATgmZJUJCH_4oshvJtUD
 u1PI1agO904f_ZyxOX709s11gMj4upYrHQaCh78jrBPS7lpjVPvqSes5V25bNvYB5IJa29.6BRNh
 _XQtzc670TgoDdkF63nvnrmRfTFmH0xhBMbJioubHf84OXMDWmweRL8d4KgaRPGD_eWvO7HgEgsz
 6LXVnHYSmHNPwnW3rS8DygBbtkdPSHA9.4QX21yG6NFKbGOmDOLXfcUkSvO01Yo8NMniRz1GvleX
 J59LYgR3bwSn1PuFcevahQmEK5DA0IzpULg5I7ooD23e2pp1V7mggDlweDorpij1kvaCiR87IBNt
 ql6TVMoMxDli_RbKdGdWjbtS554NAlCrCsrEqyfI6CDreNW3dhQpcXGy7ac.2NWNa9CW0NajpKCB
 q4uJj86ODy47CIyli2bp38wr2AkgAxVnrmSmXfPEXq1gk_WarsaZ2wYz.FXHgoeum4Cal5ha.bOP
 Z6lZ0H4b_OaxhvLZoz1Z0iSLeH.XDvQNL7UwQZPAct2XLY3X4Yw1nz47kF1kqBlrvssijrkLty4j
 J9KTGPbA8kBMqmjpRojyjYP7hRM8rSA8YsGG48Bp9Aq21i4VKVKJX3hc1YsG4hLAssvgv9yqdoWy
 FdInki_jHETdTk_v_SfR10Wh_y1ErwY0QxQcwZM.mjXKTTdDo.5KGbBRCS9YKmoQ1dCcMSmRX11M
 6Dq.qLmHXO60r7PeQi0bbGBwFYgnpgDquIDUadEm6GXNqp3iuPOZKYlXrPHHgb5J_Pkb9zVXAAju
 tfVmVSDOFs750Fpy2fwb7.QjBCK5vGX0QWegpyUc_aAxkd4csxwtcVBbKVjenr4wJBlKmKiQushF
 SpcIw77gyfInhyEDz8aqxygyTtD3G1qmrb.59G3p81g1maejkDHA9U3puHqos8BSQj7vXH4s9jdS
 WFgiwSmeHaIFHr4nzda4DGD6KrDazLvh3t8ybS6VqmEyhDAzYdugy2kLVhDk5b.EttQx6I0mY9qE
 9JVuT42QnG1VovAYmKtywa3jQaas9.C.DJw9cCUbAnhPGzdUVWAp_U78MslHNUyKIv0hmwZwVe6h
 f5Nwz69P9w193cvlqCjl2jWeuCShpIDKlLxgOAbDFxD3RcO_FTWnfMQkWyssixzeNh0TlT_cLHON
 84_QQ_GmlCT35GUbjS0vobb4neQpLUz7074XPMgZ.YFIalOYeXB2UjqvpAVLa7GMjWnd3CPGMBI8
 fe9fkMc3uhPnRaHUYq1GLJ1WTMO._oGdw3IjEuro4aflxBaa9Ecp7vPouZ4oAhmONRToEL0DUuJO
 E0pwr1OMbouqhT8.6vD4V_tEJdrTN6Z8swMXomJ9A37qoAr7t1eJ00GmTcj.nRJXQLloTMD3Y1FM
 byJlFyu9ml6VgOofu0ZmBHep6hK96H91XgKSRx1tyqhX0gIfQ2qbaDC5UN2a3E6HDzXg_8C_osdb
 BJRZy7ONjfqMBik2NU4bH5Go9gNYjtJiG8zYMfRGpwGU0564NyZWixkPYL.UtiXm480ST0BmS.aS
 S8ZjMpgf7r5gbiZgJ5wkSviGDSHiHTmlzWbATN_e7sAzRGh7Yw6XQqj7dwcWxHa5EwV2qHaic4DY
 Ac_8sywHkWW18dYNdpcuPIK7wfwc1ZXSeYSePIoVHCt4WFRQ6ftvquk_655G7wmAQdS296kEGjjO
 FNO_dEfnLeQiVT27HYXgz0c1J0CjwsxBXdRg8oNCpx7N73XUYhFghndZR3znIULKyaKsNXpnGGCI
 XMLmlJIsAubhZ0TI1BNXot1mTsE_pu8Y5uf8ASf_2vMVYkZub2K.Nrboa.PZRn9E6ZCzz0JY6wru
 XKC71sbfDjcY8o8ewpwvQkCs_ju638IRhC.4k2JRvI6EHwKYuVejGxFIpkqHmq0EMrW3KVmBV__U
 _l2GGc9dwTA--
X-Sonic-MF: <brchuckz@netscape.net>
X-Sonic-ID: 4b775504-7aeb-456f-8c31-c4ffb8f0136c
Message-ID: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>
Date: Mon, 9 Jun 2025 18:43:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
Subject: [REGRESSION] Linux 6.15.1 xen/dom0 domain_crash_sync called from
 entry.S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40.ref@netscape.net>
X-Mailer: WebService/1.1.23956 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

Hi,

I am seeing the following regression between Linux 6.14.8 and 6.15.1.

Kernel version 6.14.8 boots fine but version 6.15.1 crashes and
reboots on Xen. I don't know if 6.14.9 or 6.14.10 is affected, or
if 6.15 or the 6.15 release candidates are affected because I did
not test them.

Also, Linux 6.15.1 boots fine on bare metal without Xen.

Hardware: Intel i5-14500 Raptor Lake CPU, and ASRock B760M PG motherboard and 32 GB RAM.

Xen version: 4.19.2 (mockbuild@dynavirt.com) (gcc (GCC) 13.3.1 20240611 (Red Hat 13.3.1-2)) debug=n Sun Apr 13 15:24:29 PDT 2025

Xen Command line: placeholder dom0_mem=2G,max:2G conring_size=32k com1=9600,8n1,0x40c0,16,1:0.0 console=com1

Linux version 6.15.1-1.el9.elrepo.x86_64 (mockbuild@5b7a5dab3b71429898b4f8474fab8fa0) (gcc (GCC) 11.5.0 20240719 (Red Hat 11.5.0-5), GNU ld version 2.35.2-63.el9) #1 SMP PREEMPT_DYNAMIC Wed Jun  4 16:42:58 EDT 2025

Linux Kernel Command line: placeholder root=/dev/mapper/systems-rootalma ro crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=UUID=2ddc2e3b-8f7b-498b-a4e8-bb4d33a1e5a7 console=hvc0

The Linux 6.15.1 dom0 kernel causes Xen to crash and reboot, here are
the last messages on the serial console (includes messages from both
dom0 and Xen) before crash:

[    0.301573] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl

[    0.301577] Register File Data Sampling: Vulnerable: No microcode

[    0.301581] ITS: Mitigation: Aligned branch/return thunks

[    0.301594] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'

[    0.301598] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'

[    0.301602] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'

[    0.301605] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256

[    0.301609] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.

(XEN) Pagetable walk from ffffc9003ffffff8:
(XEN)  L4[0x192] = 0000000855bee067 0000000000060e56
(XEN)  L3[0x000] = 0000000855bed067 0000000000060e55
(XEN)  L2[0x1ff] = 0000000855bf0067 0000000000060e58
(XEN)  L1[0x1ff] = 8010000855bf2025 0000000000060e5a
(XEN) domain_crash_sync called from entry.S: fault at ffff82d04036e5b0 x86_64/entry.S#domain_crash_page_fault_6x8+0/0x4
(XEN) Domain 0 (vcpu#0) crashed on cpu#11:
(XEN) ----[ Xen-4.19.2  x86_64  debug=n  Not tainted ]----
(XEN) CPU:    11
(XEN) RIP:    e033:[<ffffffff810014fe>]
(XEN) RFLAGS: 0000000000010206   EM: 1   CONTEXT: pv guest (d0v0)
(XEN) rax: ffffffff81fb12d0   rbx: 000000000000029a   rcx: 000000000000000c
(XEN) rdx: 000000000000029a   rsi: ffffffff81000b99   rdi: ffffc900400000f0
(XEN) rbp: 000000000000014d   rsp: ffffc90040000000   r8:  0000000000000f9c
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 000000000000000c   r13: ffffffff82771530   r14: ffffffff827724cc
(XEN) r15: ffffc900400000f0   cr0: 0000000080050033   cr4: 0000000000b526e0
(XEN) cr3: 000000086ae24000   cr2: ffffc9003ffffff8
(XEN) fsb: 0000000000000000   gsb: ffff88819ac55000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=ffffc90040000000:
(XEN)   Stack empty.
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

I searched mailing lists but could not find a report similar to what I am
seeing here.

I don't know what to try except to git bisect, but I have not done that yet.

Chuck Zmudzinski

