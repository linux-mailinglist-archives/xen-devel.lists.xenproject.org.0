Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C579AF8031
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 20:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032430.1406089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXOmD-0006g2-7t; Thu, 03 Jul 2025 18:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032430.1406089; Thu, 03 Jul 2025 18:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXOmD-0006eJ-4j; Thu, 03 Jul 2025 18:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1032430;
 Thu, 03 Jul 2025 18:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rtJm=ZQ=aol.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1uXOmA-0006eA-Vy
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 18:35:15 +0000
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71200d79-583c-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 20:35:08 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Thu, 3 Jul 2025 18:35:06 +0000
Received: by hermes--production-bf1-689c4795f-895qn (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 074e72aac6a3c642c4975b8914dc21bf; 
 Thu, 03 Jul 2025 18:35:02 +0000 (UTC)
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
X-Inumbo-ID: 71200d79-583c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751567706; bh=EXHlWa5asA9Z4RCqSrFnCiNHYAx1soLe4UthSuVCGas=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Yz+UzLtfI9XxeD/hu1qZpZfySzMWZrRhTK5rq85W39ZrjIgTj5OcTqaUMAmVjNA93M89NttPSevoOtVL8XZgJrAwZtGMpwDFfMr4sYXMXw8V8ukK88EI5QUyAEwGCJbPW8+4189k0QyqmCVX0fEg2HUBY24KUvVaJW4AU1feLMvzCCGHIOW1MHQhuh4gkt6qoEIhxwhWbFrUT+EFd+iPrLawb+Fb6ym3MDt4j86MYEGd6HPKBKnDnZ5Wkp5RWqJ+DNUS2F84kIGtJKwAFC0tIwmP2g2AB1+5mC6Sn70lazDX/hka8eNX8ZLDeCf7jE6+j45LeKoBBBlyUl9lb/hCew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751567706; bh=Hrhy2ni07h5gydNEaQVhBeWfqsOHYuYGLunqIgvcQ9h=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=N0g343I3cz1J4rJZ/+nhdwFtWCgb2KXND5cLSqjKej+WvfoABDpNSFxSzP4USDALK631zugk+P6z760va/ixV6V4766jGafjmNNh/+8Hc8gBiBX+nhnVRIOqUmPGHC9MMLni6q+8EHvNUQtOZMzBVsfAwXOPESTyW2SdFzG/w3TiFTOm37upniz57FXtkED0QohFRBnYr0ouoU8frlnMAZtUUElkJHnzd4FkIV9yIEPhv4jYFvX8RDA571aj1cZJiaPjhbsHe0cXpBglasKMoM0O2PGKSnoLkgTalJVUdmK3R+SacPedGkd+iiU5cDPobqFqwbHZdr4fVPOe8u7x4Q==
X-YMail-OSG: vcvWGOoVM1mgQsyzXm1E58.xLt2_4SWqk4fBZkRJTMlJMbcanRo09FUCHdczfwr
 .0r0S3L6hxwsj9ZYHcCA0ckjlEaPbtsi18npxhrRFDqkxXl78VVr5hHl_LBlDJkqlGaPY6CMBMHT
 rjXguqa91TtKbP5QzK0jCQNWvogt5FUeKqLSpQMhOft5f_.dERjKDU3pv98H5LX3Ek1Us3XWHCMH
 7qKpoQaV659CdS96cKtsmWreHyLiJFCbXDNUdnfYYAb7cnWKUZmnStWCaOD1a4Ft5Ogjx5KmFnY7
 TpHvLezmNRNd9IGF2uqg6wnbkXEa1cARuRUF97JJcmlEA5NsQeM_s.IfSdjgKgMINbxj58wlUNta
 r6XGfqf0jTKGP6jSbQIGe9avwPwnqzTZgqb1E0L8SYSSZFQa7XeYvjClNc9EyCYOJkQ5q1uR.a9s
 Qq3ApymDoUUuG8Ua4KnZ1HMF19Xg0ejUZMIdU2MUkpCTY5ie46MXvN4h.piyk8FAHxrJ0L4_9.Xm
 38GwRxBxGZ.he5Ovrybxd.6KCROg8fMzaYh0Gs1dCMcAtzYO6Byy9GolUx5_derQu4I3aQ3LvRpc
 Ds37RDxbImRtt6ASeCdo2g5zLaa3LD7OadOHZOhRAvl8Uc_GoxLYcKOy2zZuPi81lpnW_tz6U9rN
 MMnVkl..JK0eTDCG0q1DJMAnSgcQ8Abvm9D6_zwVbSVqaY5EXWH_8R4cTXCirNYDHeIvXPPSinB2
 FZF5t3g1xOTsK32DGXw3XJkHXg99GeNM91tNtAclDE9KVVxB6MvgnPTpAT0fHuVVR.FBFhYHJVm6
 17ueM2yT.3h8Tjqia6rY6_au7GGTyngiRplYXgyU6ah968QfrpIo1PCgxM8T1_5o9lckJznVA4LQ
 zqh9r6IdNMqdtTXwW2a730D1WlelZ_LySj3NKvarxahcPgb2Vm9xSH2BMjCxA0gECxDE3n6oow4e
 CRhbmCt_y6b8WLai8MB22TdrYn_dfn1Jz1uli1EUeO5wisuIg9y9Z2YewcFAAzrffw0ylhtLetnT
 xWmpOdEjPq383uJWCGuOBFAqAfTjlYplg.ZmFDU2xz30.nLlfeOXdC.eMsxcVUO1taR4H7OX8Nzj
 vW2KxE9VsrEz8QjmOH.SeCSXfwxIkr4kDtfyrIRMQ.v20jnIbwFhBrlClrQaCKyC7_ztPLQAHiGM
 3eC3uuNzZn8eZhgpgZw6rc65LATqaGWctFDA_IvOZezDAClzUxQVT7tE0pxRBTLa7uPUjYDhRNbX
 bMOPGBisJ04fZ.bmKc9TPdJjg5w6GIXdZwsJd9kvyw.HU.RLhgGiYB7vfXjtuoIzkWLSLomQhSKw
 rZ7eG35U85inedg0xSpFrw4H0_Lhwf.t4rmMq7K6ueuSPYXQmwqgVaor2FWUyu6w7xGaIZDmDT4e
 _UwYIwWUN8pEcfMbk4RjWgoFIJhVjhz5c5NK.aaBpgegikAF3FRWrAMK7YFauzI7II83qK1kJo2t
 EupynnoYKyBMTPDJsACpbg.p9fFl2gX3GJ5fgX.HipphYAER0RFHfftUxHgQzch1gzYS9Rxbc8Xd
 D7BtVxUlSdlBPdXXSMDSMPq1C0Q1NCN0rM8CXDF6R_41In7TxpWnO4DAj4bTqjTxELKi9tUH90aS
 LDBejKO3KQ6K9GT517.5JCUq8MBn_TYoY7AWr4kFvs9_S7VcooUqYXN3dZZyTvEqrmtkEaZ_Vlv_
 xxruWhr714_cPb5J6yIm36xvcvWPRZVYUQKthyYr.QO.F3GzQ86eo0DxE3XXEAsbMiUEFk0_c.NX
 B2MZxTzQcwj_DnAxf3wQsqdBfbkNiscAF7WOPSLtHmGqwDLldh.DGoGj81_YjejyyRICIUHyNOpD
 ftawoUQa08a0.kCpeH..a6jc31tnKwXOJHEA_wv9v9vKqAuK4jfWvdypkDrWxD8x79.KNac_2KKw
 jU50Om0v7gOMizNzOCbcfJx7fGmK1ELsb3l2_uN85l6UI27eGJDdp5.zBZMbRptNpPj2gfndO_mD
 h3wir7WfsasYPX7tZL.XDilylr8qtfBuSfweHx2MQvOeojJiyYOMqbX1Q6UlueMiRuWQ.EGObedd
 x4sayS0REOpgMaV0NQ0apLWpcvlK9R.LJ_83Gc0JlNKDsQcLlHfQ65sKR6sfM1TojZTKN6Yl3d7p
 AVtm8DbkymbW0LbkbATPxKRi0Jm4kiTNTyK_HBV01aKK_l5EpHzIrmncmXyKJ8t5X6WzjIwV4IsO
 Y54QPpVzuedkSNUXUGZm.mU43u.YJ
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: dc7a2c9f-f440-4691-8260-e4cb2c65db45
Message-ID: <6b15fd25-5f42-43fe-81b6-ac7d0d9f1b3b@aol.com>
Date: Thu, 3 Jul 2025 14:35:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Linux 6.15.1 xen/dom0 domain_crash_sync called from
 entry.S
To: Chuck Zmudzinski <brchuckz@netscape.net>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40.ref@netscape.net>
 <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>
 <8ad4304d-43bc-4584-bc69-822eb0661e7b@suse.com>
 <5a962cae-b65d-4a27-9189-20027344567e@netscape.net>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <5a962cae-b65d-4a27-9189-20027344567e@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24099 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 6/11/25 5:34 PM, Chuck Zmudzinski wrote:
> On 6/10/25 12:22 AM, Jürgen Groß wrote:
>> On 10.06.25 00:43, Chuck Zmudzinski wrote:
>>> Hi,
>>> 
>>> I am seeing the following regression between Linux 6.14.8 and 6.15.1.
>>> 
>>> Kernel version 6.14.8 boots fine but version 6.15.1 crashes and
>>> reboots on Xen. I don't know if 6.14.9 or 6.14.10 is affected, or
>>> if 6.15 or the 6.15 release candidates are affected because I did
>>> not test them.
>>> 
>>> Also, Linux 6.15.1 boots fine on bare metal without Xen.
>>> 
>>> Hardware: Intel i5-14500 Raptor Lake CPU, and ASRock B760M PG motherboard and 32 GB RAM.
>>> 
>>> Xen version: 4.19.2 (mockbuild@dynavirt.com) (gcc (GCC) 13.3.1 20240611 (Red Hat 13.3.1-2)) debug=n Sun Apr 13 15:24:29 PDT 2025
>>> 
>>> Xen Command line: placeholder dom0_mem=2G,max:2G conring_size=32k com1=9600,8n1,0x40c0,16,1:0.0 console=com1
>>> 
>>> Linux version 6.15.1-1.el9.elrepo.x86_64 (mockbuild@5b7a5dab3b71429898b4f8474fab8fa0) (gcc (GCC) 11.5.0 20240719 (Red Hat 11.5.0-5), GNU ld version 2.35.2-63.el9) #1 SMP PREEMPT_DYNAMIC Wed Jun  4 16:42:58 EDT 2025
>>> 
>>> Linux Kernel Command line: placeholder root=/dev/mapper/systems-rootalma ro crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=UUID=2ddc2e3b-8f7b-498b-a4e8-bb4d33a1e5a7 console=hvc0
>>> 
>>> The Linux 6.15.1 dom0 kernel causes Xen to crash and reboot, here are
>>> the last messages on the serial console (includes messages from both
>>> dom0 and Xen) before crash:
>>> 
>>> [    0.301573] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
>>> 
>>> [    0.301577] Register File Data Sampling: Vulnerable: No microcode
>>> 
>>> [    0.301581] ITS: Mitigation: Aligned branch/return thunks
>>> 
>>> [    0.301594] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
>>> 
>>> [    0.301598] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
>>> 
>>> [    0.301602] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
>>> 
>>> [    0.301605] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
>>> 
>>> [    0.301609] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
>>> 
>>> (XEN) Pagetable walk from ffffc9003ffffff8:
>>> (XEN)  L4[0x192] = 0000000855bee067 0000000000060e56
>>> (XEN)  L3[0x000] = 0000000855bed067 0000000000060e55
>>> (XEN)  L2[0x1ff] = 0000000855bf0067 0000000000060e58
>>> (XEN)  L1[0x1ff] = 8010000855bf2025 0000000000060e5a
>>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d04036e5b0 x86_64/entry.S#domain_crash_page_fault_6x8+0/0x4
>>> (XEN) Domain 0 (vcpu#0) crashed on cpu#11:
>>> (XEN) ----[ Xen-4.19.2  x86_64  debug=n  Not tainted ]----
>>> (XEN) CPU:    11
>>> (XEN) RIP:    e033:[<ffffffff810014fe>]
>>> (XEN) RFLAGS: 0000000000010206   EM: 1   CONTEXT: pv guest (d0v0)
>>> (XEN) rax: ffffffff81fb12d0   rbx: 000000000000029a   rcx: 000000000000000c
>>> (XEN) rdx: 000000000000029a   rsi: ffffffff81000b99   rdi: ffffc900400000f0
>>> (XEN) rbp: 000000000000014d   rsp: ffffc90040000000   r8:  0000000000000f9c
>>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>>> (XEN) r12: 000000000000000c   r13: ffffffff82771530   r14: ffffffff827724cc
>>> (XEN) r15: ffffc900400000f0   cr0: 0000000080050033   cr4: 0000000000b526e0
>>> (XEN) cr3: 000000086ae24000   cr2: ffffc9003ffffff8
>>> (XEN) fsb: 0000000000000000   gsb: ffff88819ac55000   gss: 0000000000000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
>>> (XEN) Guest stack trace from rsp=ffffc90040000000:
>>> (XEN)   Stack empty.
>>> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>>> (XEN) Resetting with ACPI MEMORY or I/O RESET_REG.
>>> 
>>> I searched mailing lists but could not find a report similar to what I am
>>> seeing here.
>>> 
>>> I don't know what to try except to git bisect, but I have not done that yet.
>> 
>> This is a known issue.
>> 
>> A patch series to fix that has been posted:
>> 
>> https://lore.kernel.org/lkml/20250603111446.2609381-1-rppt@kernel.org/
>> 
>> 
>> Juergen
> 
> Yes, that patch set (the original 5 patches) fixes this issue (I
> tested it on top of 6.15.2 released yesterday).
> 
> There is a suggested sixth patch in the thread, and I tried that
> also but it caused a kernel panic in Xen PV dom0.
> 
> Thanks,
> 
> Chuck Zmudzinski

The fix for this issue landed in Linux 6.15.4. Thanks!

Chuck Zmudzinski


