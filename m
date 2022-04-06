Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057984F4DAE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 03:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299402.510097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbuWE-0000av-Ns; Wed, 06 Apr 2022 01:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299402.510097; Wed, 06 Apr 2022 01:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbuWE-0000Z8-Jv; Wed, 06 Apr 2022 01:31:34 +0000
Received: by outflank-mailman (input) for mailman id 299402;
 Wed, 06 Apr 2022 01:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAr8=UQ=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nbuWC-0000Z2-CI
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 01:31:32 +0000
Received: from sonic304-25.consmr.mail.gq1.yahoo.com
 (sonic304-25.consmr.mail.gq1.yahoo.com [98.137.68.206])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 476b3c3d-b549-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 03:31:30 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Wed, 6 Apr 2022 01:31:27 +0000
Received: by kubenode529.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 149fb5b1fc5630c388f8b6f306422338; 
 Wed, 06 Apr 2022 01:31:23 +0000 (UTC)
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
X-Inumbo-ID: 476b3c3d-b549-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1649208687; bh=M50utAv4SKw76Dadh1ktNQdCUssot3FLhk4FTRVN5vc=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=KGcm7iM6aRt2rdg4dWJ1tVwHXc0crimG7FT76tDwYxoJtFY1KoyGxQUy044UP+cgxAYKDi8yqSj0ldqbgOiqC32+kasPigJbhYp+P5ZLKiW/HQl8CswUbHaZtByhPUBURTMIZiW72HCgKbS3MpoyK4aUjKwxwUQQr2Xc8Gdb+SAeyzpps4IFyZIr0P0NwgKZVC6zXpuUiXFjkisiyKJXpA5xA3Oq3Go5Bx+HNZICslgiKdD7i70wRiiwwbByVxrlFlBGyidx+AiI+scyj92zNSi/PdEEAsKOq7S3f0CkXVb34gfVKCvNuEu35muA2eVnrQe3A4NKwEK6FCDF7EsMVw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649208687; bh=im/TSAB8tGI4Y39psC0Z8KOTPpzONjUnVLFaOuDY9xN=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=b7iOuUw7qciP0Dq3/r7S1I05S2Wz2WeCzAFiwjUXhzOdTUZnHecLQ3tEsWAaNmQNZzGp8aUktNfNKhK1AqYsv9f9cOVU5xFITmZfoLzM95XFQYFhVsoHaQHpbXQX1b8K6fEk1mWnOZ7G4mgswpAwcyJFXknx/eu4p4xUsT78tXCdg2YhpDe08dFi0IXU+6Xv3DBPd59tPv+ax7BouFzHExfLnC8UGFmetscVRvB7WR5DcDoJxRpnUShdySdx4idM6PMwfJ/4/22EtJPeT9bK2i/BHRxIgJyZPIQM4QKD7RKARGNugKXqqaopaD8LjlikWFYs9urJuDaaAQ0xBBWXDA==
X-YMail-OSG: KPLtfN8VM1nwvOUJNg84GSjLHH01pOEDqIvL_gOjLtoaHKHRqiMmi4s1dPo2PEU
 cQ70qEtB85B4lKawEsgAIU.BhKeEqUIPx2g0IYCAGD07CIfC1pEN6ThuX8ta3rrLHe0IkyJN5uxY
 Dy6Pt.fiDZnDO2mAvMIrkZ2n4B1BlQ7tI61t8dpvJzgcYXw1I1h_ul.lKkUfjiQq5cTK2iPKW533
 04gaAmJGs7nil2QkWJEPD.ghFxIyNq5pgjp6tZmcYyMdRzz3fVCv4Yyk9QMnW4GNB7ifu2_YMuUO
 k5UQr6DtNIiuMEAtK9EUEATtmxo8ca0Og9U0rFJHzaf1WhqWHxwbqf496l8yE.KuVhJzPGMTbDbj
 GfmEcOY_luujbk7dquTxsDdLbOtYeT2P9lolZ190QDFDIKwmokOjGQOriUIZzj6Vx2ge0LbsxT.v
 CEUaeqh03E.F2HEvJzVXMdQiAIy2LBoKhXD63lHxpXvdO16rHrDKCHBn1m.xF84oEUYixk_3WaPP
 VHQObIo96w6ugr5Q7r4mHvo9Lu9KSBt4Xd2TS2Zmrdvv3YeK4ylEwL__xmlLefQuxkEWcjNUai8h
 Wkgj71mXsNBDt1KJZBxzTPLUkIpFo21utpNoO9g3c2THod9J.2eRV.DHVftoMTpPH_HKJ3RzEWEu
 gVQ93LdqXC5hkiKAusrIXD4pWGE.M46w8X.lQ2xyfYKE8PxR33upd7toY992Py4fXp83CUIlNbSZ
 fVP4eehsDwM7a3B0YOP5Ae8ytOUJLJJhSCXRY.RZdb3YgFv0NdFb_GVau9NfEJNW43.Ng89eWHaS
 OM.pgtD8bxUZnW70Foi4oF7y2p7glnmH_z5pZ2c9m_Jtp219UO1PWCygVygQRC5I32R2OS5SjNVO
 duftGI8eDxmFkYRiiQhUMsgQqF8F92WxMfirR_XuQLloOvLY8FuUDZoq8PTLqi_FbAzM3hae1RMa
 oTmWapveuYKjDYdE8esWAtHysZ4LEfHB3E2.lreOYSJ.m95wPX688vNe0Yupmma2J3OMB7fpPfAK
 pDq2kGEQevuqz3EjFLi3_6ndmIylFkJ4t5jQ_MbkeeDY7LKT0B7.UHrfeDDcR.mqfff5PCbLL12b
 0VBZZnqYtUE3.fFTMdFliSbI4B3UplA0BBogIw6lOc8O0sC7wtwQ3anJ.y8O6._fbERZUHsr0pRf
 P6Lh.Yi.3YC16dt.6iBuytJ_qFlgZlWjEDEtOeMO4cCg.cmQPv7BPqEMRQpW7EcG3PLr4KKiHXZ1
 Gxu4pVus7aZXnfWe1hHS8Pm5Z2sbTYEir9feTqlfEiMGLgVWRpXDoWB90kgVmTpy462mBgqhMYBv
 rdSsbVWFQpK_wxyH04NGsuJyzQ9vKOYlUK.qv6Q0hDrVYTiFTFsuz7Tps4M3PNLllcFaRVADFeSm
 UHibMfpjsKwR9vnLhLJuA7zH1au5Cw4gjgdkXFmxlG6RI2fAwU6ne4jQJ4e2igyMFm_h6mT_bvwp
 WKQ8MBfQxyrLAZKh0nnqvu_X7l_RkHEkycPRa1AYhFKLfKHVd1HKTKgOoydffrEVO3B9lUAfwvsL
 lscwaWgmydmtYftOBAIBF9T7VckQXmhYGEkvKXQuY5g6nKnlCmUpDsYtzF9yH._Kjlck3iTWjzU.
 3XYOlCFkb3J2GeJnIZlnIwI5KlAW7GR3XhfBTk9cHNUzKv7XX8.rQxiTkaeJw1oXsAQE3HJznOwJ
 nDvAiK5cgJ75HxovXWWobBiZWcI3.eGlokgWFArMepKuJ.ZZ_ydJLPrnRU97f.HNXf6g6Wbxsw6A
 UHp0FmVi6QCye99Px1jTiGrDcnlSCidKxQ95VsgZbwcgmQSfbTEmN5cFBTCicdRAZ2mARyF_lK89
 2cMqAR3gyuV22klKQeni3i7ThTLgIgRVcHAI1fAFsooUq8ZGPyGmV._dBc7sueXMCIunWc3EoiHJ
 sKGuImZ.IIcl49QgSLTapmNJsPRlCClX14pO8Q2Q_T1B64RrTeRqNb58MSfxJ90O0wOADfTXlQUW
 h3_EtAbachwWkFTIbaJqsvHZklyNL_g5WVzUGPGQrZonZso8l_UI4vz0QXAWVN9JtyKAlvTb2alO
 S1G_T3cNddla_vMzE1fRb17c4PIwLWhX5_GLfZp4B_9xwuXGK1GDFuzaOyr65GcEmu4hEMO87DZQ
 2mJWhMEKV.R8CThUY8SlQOiNG46srC2xsKQPTe_3MKq6J4MIf5Xt976w76.CjbGlNjIz1kqt9e5l
 NuctmNasIhw--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <5d14eeb8-038f-e99a-31b8-f6b3b562c2c4@netscape.net>
Date: Tue, 5 Apr 2022 21:31:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
 <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net>
In-Reply-To: <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20050 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol



On 4/1/22 9:21 AM, Chuck Zmudzinski wrote:
> On 3/30/22 2:45 PM, Jason Andryuk wrote:
>> On Fri, Mar 18, 2022 at 4:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>>>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>>>> opregion to the guest but libxl does not grant the guest permission to
>>>> access the mapped memory region. This results in a crash of the 
>>>> i915.ko
>>>> kernel module in a Linux HVM guest when it needs to access the IGD
>>>> opregion:
>>>>
>>>> Oct 23 11:36:33 domU kernel: Call Trace:
>>>> Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
>>>> Oct 23 11:36:33 domU kernel: drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
>>>> Oct 23 11:36:33 domU kernel: drm_reset_vblank_timestamp+0x5b/0xd0 
>>>> [drm]
>>>> Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
>>>> Oct 23 11:36:33 domU kernel: 
>>>> intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
>>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
>>>> Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
>>>> Oct 23 11:36:33 domU kernel: intel_modeset_init_nogem+0x867/0x1d30 
>>>> [i915]
>>>> Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
>>>> Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 
>>>> [i915]
>>>> Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
>>>> Oct 23 11:36:33 domU kernel:  ? 
>>>> vga_switcheroo_client_probe_defer+0x1f/0x40
>>>> Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
>>>> Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
>>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
>>>> Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
>>>> Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
>>>> Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
>>>> Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
>>>> Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
>>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
>>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
>>>> Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
>>>> Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
>>>> Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
>>>> Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
>>>> Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
>>>> Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
>>>> Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
>>>> Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
>>>> Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
>>>> Oct 23 11:36:33 domU kernel: __do_sys_finit_module+0xb1/0x110
>>>> Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
>>>> Oct 23 11:36:33 domU kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> The call trace alone leaves open where exactly the crash occurred.
>>> Looking at 5.17 I notice that the first thing the driver does
>>> after mapping the range it to check the signature (both in
>>> intel_opregion_setup()). As the signature can't possibly match
>>> with no access granted to the underlying mappings, there shouldn't
>>> be any further attempts to use the region in the driver; if there
>>> are, I'd view this as a driver bug.
>> Yes.  i915_driver_hw_probe does not check the return value of
>> intel_opregion_setup(dev_priv) and just continues on.
>>
>> Chuck, the attached patch may help if you want to test it.
>>
>> Regards,
>> Jason
>
> I tested the patch - it made no noticeable difference.

Correction (sorry for the confusion):

I didn't know I needed to replace more than just a
re-built i915.ko module to enable the patch
for testing. When I updated the entire Debian kernel
package including all the modules and the kernel
image with the patched kernel package, it made
quite a difference.

With Jason's patch, the three call traces just became a
much shorter error message:

Apr 05 20:46:18 debian kernel: xen: --> pirq=16 -> irq=24 (gsi=24)
Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] VT-d active for 
gfx access
Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: vgaarb: deactivate vga 
console
Apr 05 20:46:18 debian kernel: Console: switching to colour dummy device 
80x25
Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] DMAR active, 
disabling use of stolen memory
Apr 05 20:46:18 debian kernel: resource sanity check: requesting [mem 
0xffffffff-0x100001ffe], which spans more than Reserved [mem 
0xfdfff000-0xffffffff]
Apr 05 20:46:18 debian kernel: caller memremap+0xeb/0x1c0 mapping 
multiple BARs
Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Device initialization 
failed (-22)
Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Please file a bug on 
drm/i915; see 
https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs 
for details.
Apr 05 20:46:18 debian kernel: i915: probe of 0000:00:02.0 failed with 
error -22
--------------------- End of Kernel Error Log ----------------------

So I think the patch does propagate the error up the
stack and bails out before producing the Call traces,

and...

I even had output after booting - the gdm3 Gnome display
manager login page displayed, but when I tried to login to
the Gnome desktop, the screen went dark and I could
not even login to the headless Xen Dom0 control domain
via ssh after that and I just used the reset button on the
machine to reboot it, so the patch causes some trouble
with the Dom0 when the guest cannot access the
opregion. The patch works fine when the guest can
access the opregion and in that case I was able to
login to the Gnome session, but it caused quite a bit of
trouble and apparently crashed the Dom0 or at
least caused networking in the Dom0 to stop working
when I tried to login to the Gnome session in the
guest for the case when the guest cannot access
the opregion. So I would not recommend Jason's
patch as is for the Linux kernel. The main reason
is that it looks like it is working at first with a
login screen displayed, but when a user tries to login,
the whole system crashes.

Regards,

Chuck

