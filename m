Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D0AD6172
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 23:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012191.1390729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPT5N-0004l3-1d; Wed, 11 Jun 2025 21:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012191.1390729; Wed, 11 Jun 2025 21:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPT5M-0004i2-Ub; Wed, 11 Jun 2025 21:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1012191;
 Wed, 11 Jun 2025 21:34:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZpM=Y2=netscape.net=brchuckz@srs-se1.protection.inumbo.net>)
 id 1uPT5L-0004hu-3b
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 21:34:15 +0000
Received: from sonic303-25.consmr.mail.gq1.yahoo.com
 (sonic303-25.consmr.mail.gq1.yahoo.com [98.137.64.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf7287f4-470b-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 23:34:12 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Wed, 11 Jun 2025 21:34:09 +0000
Received: by hermes--production-bf1-689c4795f-jdp75 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e03b77c830db9585637eaa713f2d4c56; 
 Wed, 11 Jun 2025 21:34:06 +0000 (UTC)
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
X-Inumbo-ID: cf7287f4-470b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1749677649; bh=wWH7KPjcVhgpUMexTZNPLdNB6wSybQPzcHjpjkYzRaM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=i0tXk9QJ3cqYT2NL89KZK86yUMQVGAXc9b3W55iOZxnpN6DvuhI3G+TzCfwn1VstXzm8VtS2pFxFwwlp+4xb5pf17LMUxOwHkXZ9Ap2oXq/okTDGSJdJQsWxOYYtHjGaZ/nG1LsJ1buZXFom0NaVSWGKB46u6ykdhwx8X0EZl3I9z8gtvGg3CgrdS3qgwtW692aDVJuaa0z5Ueo0URgTuTUMCs2WgQvytIos2NFqPAcL1Ps/qC4ZKkk8ddG/rrp9SgXsxwCB1DgmlceenEkyWm6cZYgWhRU7z8ikTl5EQW+sglqaMJkAH1r+5NrlALE1i2LmtORWY8OZ5IMH96MPMg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749677649; bh=kfWJ5z2j5M+tdghUhpWueu2RKWmdznTovMpniCMylDU=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=a/v38PB10wJwJz5ctznAgX6983n4C7lm6psnYKAAPn92Us5zz2I6DIFvGDoEG5xqZu1l7b7paJqUBZyxQuHmGN5PKGQvotxtBDqdvAMKwMCqJjwjhyNPLxYss0qtd4Vjdixny7XUDCzt7Lc7eELu7WG9cHMwmOQyD3Sd54zKJnt4mJ0KX6/fOhbBW1s7zEcQWGZaCyM4AfpsJ7xrt5U+6jNSihTwPjWUx0B+9cwQOlsyxoUJ3fPosQFadg0zldJKaPfuL05maatJVBsbWy4vI0TjKp8ehfAy9AUu7aylJoJy+KaXkQ0H2WlDpGgIie8zvR3D6XB3//qYP3P15ecxpQ==
X-YMail-OSG: FBZ6b1sVM1nyyR46kNL_Xyjcyvrmyq6y3qf31DsLQekhOLNJa9frx8er6L5zYHd
 TvkFOaAE5IJpz6k6NSe7j1w1tgJE0_gMoYoNC.tfPS7IIQwPEmro.p2AzgDkBKjd21mvv4Vg63_Q
 sCJ1FX5KkYV6bF1CpRfUwH48ATbJblSQ0XOQfw16osxs9FObgCFwdZJI6fHo9nqhydBNGoyIQSZz
 LDJRRx.VYsJVIZo_b5zU70Do_nBemYXSA6v8l8GQJ3pAxhPQ3vTGIx7_3cI3iVip5nGKnrbJmBhk
 DkTqKFAlCg3hXtwXIsa81FCA8tVqu7O5FgdfQYO2ogaIqqcL4GWQRpZpusLa2Gsx7397_1HAeSGj
 Fk6IioIXWJUiqVH_1jzWGrvMVk.6C2t3GHggphsQbrP0q22JMOpbLiQ00qXvi6H9ShNQCudoOGA9
 Skk3gTuuigcvbc027DsEfF5P5HYgnFtNUIyY5gnyzFtmpKeruqT8g6Qg2DInuirQk0FCcOFT0jMW
 DAed4dhI3fY8OcfH8KHxZCYm2wrsng.TmGMYadiP8PvfU9BC_g3p8.yONrkq9tUet68gksuHkcBW
 s3LBa30x90I2PunUiyQl2ux5nBXHzhmAI0hp6GIEYOhseq2P9GPr0ddAWQdBrSH4xntjY5uKuFMn
 HKAiRQfo_snqJbL4i1rZ2_DkSmGsqPMgnfQoKQA9HzvKw_0vqiyJxPSHrBm0PehnsbGXMaiOcydU
 yWB0eDuWYMiqrHmRL2fQqGTyY6N7gO4e3m6Xh1GWqx2YgqcZpgxVBl.xI3rpBMp.DK97OnDC62pT
 BVacOszhoGnaimJt_BILrqROnY5BI3lkyzMbG35mIjlmzqm.VbJ4eqvuw9yHbUvSVzHKQyOSNM2n
 w4EClczuvQIboHKGRhUHXXWYh6YXHiCRTG8z.KPijav4UJaA4o4xh5JUT8BdJUIVCbQSPQ4__GFt
 6V38RC.3_EZ.fnCW0hdAilCaTzNoQ8SRwO0eLi8AqHWPFAQ08TcCgeI6dp_.4XtDULt2bFrvRncD
 stapdRv2lNmAGpWuraJc2cl3EPWJr1bkHc5SJXeQGJohNlfh9FuxOQ6h0gesi_yiPnGnmGwxWl1x
 4rxCNVkw0wTBpSMzy3yAHiVqkD_SL3LDhrP0pkeplw89DU7hQKBrrZiV5zpiZgyUaep1VYZnyAXY
 kA2_XIQNjXEv9IR1DhqzJJ17BBo.OHA9hhlm9gRukbMLb2Xjfodm9Fw38ZppZWzBgcdthXY_bm4J
 ITjXbFah_ZrzRpemRuDFvyJmgn31ibi.Mr_NHg6BV90PwxzPsW_u5iiWImRqU5vyLhUPdrKs6qzK
 JxcQMzFvzfRo7ZnHsJL2mKlZFFcWUiS6710cJA0QiDvCVOnatDVtZIUhaAGBLJrG1LOj.mm810tc
 .EpOLcIZ8E2wEa1pu8oMitpAHTrIh6jPJ3VnSkGMwrzfCYb9iRtRUEJpkc1QDO_IkVGpCff7X1n_
 xs5xTkenGJXIMxgC266cxo5iRA4mEiZODZl9osyvOWpKPsJU_isB8.s9IMMB6f.IUPg3Qk5J2ftb
 x_wN8l9OymgjF8ydTIM92Q.p0g3lQbMCU1eSBOplsK8WUBNSIPNR.IrsRx.Ha8MooGkDXqOrzPvb
 C50TJnDaXPm9gg8saRGlLQDxu5fFBSs1PWOreMs_88MvMq0vTDww1.860faWgxZUYvlyM7A4vG8M
 nweJ7J2cuaYOtW2d.wZWpcRXIJdijV34hdd0sgMZ.ZvJzIy2Ioo6nlTr5sNk3Qhq9.LbyKsseD_.
 dQzIijHFkv1FjDK_bgzn4dCEtukMoXG0Kg2B.oP.VDk9Rferj5rrLwrW7En1GK7pmTSOYmrHFb4y
 Un6qaGQlJ_4ehym6wFOqVmMrwxvtpamijl.mKOE5OXKVL.z3iVZzRBO2ZurMXPfbF7oEYhh3yesN
 D8e45CGOHETBuzpG7.F.7GZ1ZQj7ROeacTTYpu43O0idypFgJICtjIkJqY9fwCQBTRSQfjluHouL
 OL0vYckQwvUxMZ_OMEuEy5aRvztAF9O_.AlG39YY7NPZKoQZb3O3dLwbEyFyb28QDHflTLXTvRj6
 j8o8qoX0yv15hPXtleOSc0b.00vcVfB4ivum02tfx3e8hv_SM7LRPhN9jm7J4LLoMVADxiYGnlpG
 puS5W2vFExO8Z4Rj2bo_DAbLgHJRyUtC1b5aSTf7Esc9J.u9TO7c-
X-Sonic-MF: <brchuckz@netscape.net>
X-Sonic-ID: fcf916ff-d536-430b-8478-a9f085b6798a
Message-ID: <5a962cae-b65d-4a27-9189-20027344567e@netscape.net>
Date: Wed, 11 Jun 2025 17:34:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Linux 6.15.1 xen/dom0 domain_crash_sync called from
 entry.S
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40.ref@netscape.net>
 <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>
 <8ad4304d-43bc-4584-bc69-822eb0661e7b@suse.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <8ad4304d-43bc-4584-bc69-822eb0661e7b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.23956 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 6/10/25 12:22 AM, Jürgen Groß wrote:
> On 10.06.25 00:43, Chuck Zmudzinski wrote:
>> Hi,
>> 
>> I am seeing the following regression between Linux 6.14.8 and 6.15.1.
>> 
>> Kernel version 6.14.8 boots fine but version 6.15.1 crashes and
>> reboots on Xen. I don't know if 6.14.9 or 6.14.10 is affected, or
>> if 6.15 or the 6.15 release candidates are affected because I did
>> not test them.
>> 
>> Also, Linux 6.15.1 boots fine on bare metal without Xen.
>> 
>> Hardware: Intel i5-14500 Raptor Lake CPU, and ASRock B760M PG motherboard and 32 GB RAM.
>> 
>> Xen version: 4.19.2 (mockbuild@dynavirt.com) (gcc (GCC) 13.3.1 20240611 (Red Hat 13.3.1-2)) debug=n Sun Apr 13 15:24:29 PDT 2025
>> 
>> Xen Command line: placeholder dom0_mem=2G,max:2G conring_size=32k com1=9600,8n1,0x40c0,16,1:0.0 console=com1
>> 
>> Linux version 6.15.1-1.el9.elrepo.x86_64 (mockbuild@5b7a5dab3b71429898b4f8474fab8fa0) (gcc (GCC) 11.5.0 20240719 (Red Hat 11.5.0-5), GNU ld version 2.35.2-63.el9) #1 SMP PREEMPT_DYNAMIC Wed Jun  4 16:42:58 EDT 2025
>> 
>> Linux Kernel Command line: placeholder root=/dev/mapper/systems-rootalma ro crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=UUID=2ddc2e3b-8f7b-498b-a4e8-bb4d33a1e5a7 console=hvc0
>> 
>> The Linux 6.15.1 dom0 kernel causes Xen to crash and reboot, here are
>> the last messages on the serial console (includes messages from both
>> dom0 and Xen) before crash:
>> 
>> [    0.301573] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
>> 
>> [    0.301577] Register File Data Sampling: Vulnerable: No microcode
>> 
>> [    0.301581] ITS: Mitigation: Aligned branch/return thunks
>> 
>> [    0.301594] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
>> 
>> [    0.301598] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
>> 
>> [    0.301602] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
>> 
>> [    0.301605] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
>> 
>> [    0.301609] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
>> 
>> (XEN) Pagetable walk from ffffc9003ffffff8:
>> (XEN)  L4[0x192] = 0000000855bee067 0000000000060e56
>> (XEN)  L3[0x000] = 0000000855bed067 0000000000060e55
>> (XEN)  L2[0x1ff] = 0000000855bf0067 0000000000060e58
>> (XEN)  L1[0x1ff] = 8010000855bf2025 0000000000060e5a
>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d04036e5b0 x86_64/entry.S#domain_crash_page_fault_6x8+0/0x4
>> (XEN) Domain 0 (vcpu#0) crashed on cpu#11:
>> (XEN) ----[ Xen-4.19.2  x86_64  debug=n  Not tainted ]----
>> (XEN) CPU:    11
>> (XEN) RIP:    e033:[<ffffffff810014fe>]
>> (XEN) RFLAGS: 0000000000010206   EM: 1   CONTEXT: pv guest (d0v0)
>> (XEN) rax: ffffffff81fb12d0   rbx: 000000000000029a   rcx: 000000000000000c
>> (XEN) rdx: 000000000000029a   rsi: ffffffff81000b99   rdi: ffffc900400000f0
>> (XEN) rbp: 000000000000014d   rsp: ffffc90040000000   r8:  0000000000000f9c
>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>> (XEN) r12: 000000000000000c   r13: ffffffff82771530   r14: ffffffff827724cc
>> (XEN) r15: ffffc900400000f0   cr0: 0000000080050033   cr4: 0000000000b526e0
>> (XEN) cr3: 000000086ae24000   cr2: ffffc9003ffffff8
>> (XEN) fsb: 0000000000000000   gsb: ffff88819ac55000   gss: 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
>> (XEN) Guest stack trace from rsp=ffffc90040000000:
>> (XEN)   Stack empty.
>> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>> (XEN) Resetting with ACPI MEMORY or I/O RESET_REG.
>> 
>> I searched mailing lists but could not find a report similar to what I am
>> seeing here.
>> 
>> I don't know what to try except to git bisect, but I have not done that yet.
> 
> This is a known issue.
> 
> A patch series to fix that has been posted:
> 
> https://lore.kernel.org/lkml/20250603111446.2609381-1-rppt@kernel.org/
> 
> 
> Juergen

Yes, that patch set (the original 5 patches) fixes this issue (I
tested it on top of 6.15.2 released yesterday).

There is a suggested sixth patch in the thread, and I tried that
also but it caused a kernel panic in Xen PV dom0.

Thanks,

Chuck Zmudzinski

