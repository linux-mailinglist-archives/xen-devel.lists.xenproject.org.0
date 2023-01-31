Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC76836A8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 20:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487813.755516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMwQ2-0001uA-9x; Tue, 31 Jan 2023 19:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487813.755516; Tue, 31 Jan 2023 19:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMwQ2-0001sI-6o; Tue, 31 Jan 2023 19:35:50 +0000
Received: by outflank-mailman (input) for mailman id 487813;
 Tue, 31 Jan 2023 19:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8ra6=54=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pMwQ0-0001sC-I9
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 19:35:48 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73953587-a19e-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 20:35:46 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Tue, 31 Jan 2023 19:35:42 +0000
Received: by hermes--production-bf1-57c96c66f6-thr8d (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3630b60c4b8d5aee2b4f4bc210d4b88a; 
 Tue, 31 Jan 2023 19:35:39 +0000 (UTC)
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
X-Inumbo-ID: 73953587-a19e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1675193742; bh=TcT1YLmDGMvqANZil3o3s8Huix+Bg0YzehzcamGdlf8=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=Qi/bBEwZFhU/LxhIdJmnAmZTqAsychYutnrghCnmzIiCUaAwIfedPUTiHaR+cqz33nJrQjMzTv9ecilMKBR6CL9mFHCDmFpvY5kvQUG8JUL1rgAgYunepSyhxIQxuRNz5QCn73NLvAk8/py/U8D5sir9jozSloFGVNBRav6TsSWzbuXKoWq2oIXvmh8fyylXb/Xtzsj++9FrXWdLm4sLJVnwh69bNQlEUv63WlxZqMJV+q3S1vd8zWrV5LlkfgSiQ4pGCfj0eeEH6fmvHCpwyDHTJ6EMHtTNv+ztz/BlNOq0VaR3587LPj+zuKP6m6i/xPBG0pjPSg/mUzlb8n5U3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1675193742; bh=Vqs+NHE+qz2hmhRgzHF2LDUclXDDCON5zo+WbbQiIPm=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=Alp83Kv0TJdYJg0PSlSLvaSklAbcUR67w+GHazmKWp6rFIr58qqjkDlU/f4lqZhgWrt7+3gagWP4kZyZFayEubtGl20wRp0AkFRdQwrQgEfeu53YIkTreEXHiIFs+xtwan1Yy3dbWzbPJN6EsBi22bOGNlY7GkivZ51GMvBO0P/miQalWOmTB5gBvqdtUl0p/ymrfDlaFF5YQoaMo4fuwtbNV32jpL2OijAQYDraB9Hvv7qMN14jYQTMIJZYfdDAwuczJ2qLCjwT7xXcF1Usy7DlrBoGoLNNCtZpxiqq9TP20fRH7tl1NT86J6e8nee6YK/etntdq73eZLjTQDb3Zw==
X-YMail-OSG: bhJnv9EVM1n26u3qMRQeyZccSawdEKiv0NT6ya4GEOjSs48Tiq82GezNLFy9GVf
 qoVqnf0YtKXebF9NLH4iuYsbXUmQNpKanxLJ8GsMOf5vzyOzY9I5kFkyiunkYfHpctk6WE2gXmNQ
 ALjcKqPxBCSsX9z3btgP2VxgnZqPuVU2_Q3JjSJWPXSfwOb9iIliBOoqtb.QD30oCpv8IN8_7Ubk
 ZxwkmrOBmiBU1u9EYjtnUBScMmvAfWXNf.uETOV8h5ZjhmJg.t9hiCu.oTj3oF042FF4fntXzgtw
 HEWAwNfrEx1sfsovBhclkwNWmlKdzJ7ymX2zJN41fFhPLTPuwjwb5oYfpohEurESM2CVBEoPRhc2
 ZDz5CZb.hc95u0A_VPcCURe3Rw_2Ps6bm3dEsrYby36KU_6WFSDnbgylk73uCrnjfuiZJzmNJuV.
 y4GEO51MvfiX7skKpvkvXy7SCdOJ09oiQF.w.vvHVbCwpbgBLw_Dovj1_XSooXWWcVaH6lFdQIHh
 sivBgzXwy9hcmecCD5YnzvD6maoGmSSUHiGXDKqvzMISy0xkWXhfLgenUI0.Dkb2VZbIHBFq_shf
 _vMi_a0w.Wmn_w89MUIE_BlQ7wLfS2Pg33xMkcs9ycuqSnbaAtTHL1QYRh50_xBr7lUHh6utgNzN
 YAnS2cgqL3QkO1VUEKc9848ZW3vvfZoggwnki1fMyrYCgLrCW1aCoAwFikSdULXRnUDGAwi7cVFX
 GlcOmR4.MOQOswyRjCKsAzkEcmMBdz9TJ8hRW.GQxhxkxCPwidI6BMdFPTFBTk1_Bu62XmueDpHH
 ZsoDlaAWFX5CUABabLTmzW_27jzcBuk9DQ56YhXDXR0yynXBRyUaq3pEXcU5qw3V6jO57WYWdLAb
 roGAn4QLVX_TGVmc8DpOi6OgUUS6GqrURJHOImmB7ZbNhW6dim7UD4VGhq4rtSTaNpC.GdneRhHN
 _6QFjQI9PQLXHZOognUIf95CyPK4ZbwfhuvXAQkUj_elk08.whGPiMOxIjIE0xjKJ6Yjrku.WW84
 PlQO9.Sn1QmHMrBXkUIVmgnvE_eCx8tbDZRETgScrdaqmz9Xyejjxa2QNNoJwi1Ny1h2JMeq_kb8
 tp.HC0CP4MyqSoQ.q965bvTnxUXn1CUoV9fR2qMz36brRaxIOxxKOCRT0G_Ehg0EDMfzWaYcTJkj
 qbWPDxZ.4VF1DEZlosjv9Df1MIc3y.mfEk.uAfmNfnSfHm_S1Yoq6vkGUXTzaz171hWWgDlkT7BF
 6FZbY_InTrBCIRaWJXb_Ch6u2Xk909TJc3fC88nlTVjYo1FVBTvJ9LXa7cDEsg6hICw22cvuWhTq
 NpMEePQYHzPh__7IeuPlEXXTh.S5Ax8GlV3.2yrhMeu5wXruho3zjnBlvfnFMarnrkRO6_VwsupV
 Z_YZhJ.EsznOB24aFZWhT_RISGK.PQmls33Swg0NdOhOLOtO8vE5Hs945GWD_SgZ2excwA7c_YAU
 b3wbL8dkwsiAWIlr32wc3_rG7YH8ghCl6QGE.Y5f0ViupQ8CSvr3r2pyDGYPyBLT0BJCS7Y_fr7E
 VksqZUdOhdeN06ioqe0svtbmaIe4yTUgFgAwO.f5mi5NpzWlcF9j4scI19FOqOh4hcAgkDBRg8bD
 9S8gsRUyfaL0CQGnj4CqvNJNOL8i559VOsXlnL5rhyyGjiOI7LGFf_tGIJz_Q6TV5ZtQ5RVfF3Gu
 O9fU6b7402Xm2.E4_t6mR0Hufsi2hMpXHl7jBm2JUik5e403UPe__IGokQYjy.N6L_e3AvkuJRez
 WwnhPt8BdM7hYr.c3trLp_mygmXZUWmlaEM0K6KEE53Cir2nEmNtVgZjtAFVNt1GpaMB1Cg.Tv.I
 nkOjvBfOuSJEBH60IZ0.bPJulUZbAAS.pifsi04I_QDOIcXY0n0ff7DztmGdlBlFhuufKHLtsBlW
 G9N8nos80hjSGI5uCdVwBiEd7cmFGlb7NAosvZE.nEXlGzL9q9FsD2jNX8LaUjDWngpATKSbKVPT
 XeGnHaMgdgFkT0w.N18S5Ks282EkLGkAFq4iHPUGlphwmKZxxfVqHjOuYZuVyql.6LtnaQ8Oogyf
 vATUBK.fWhpIkSLXhe8f6jIkzOucOVdQzFG91t.JtmC6R.Zj9eBd8pdBKCEiO3XXz7V95GPGsljl
 RBBc6o_367jgwZnQCjv1eAq1BAKp3hj_dIKew0DvMDgV3s_avLj2SGhwhHBy3.G_rnwmNk9r_C7k
 a75fJtXSfBw--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <af419213-ba65-c9dc-9191-006d908339eb@aol.com>
Date: Tue, 31 Jan 2023 14:35:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH v2 0/3] Configure qemu upstream correctly by default
 for igd-passthru
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
References: <cover.1673300848.git.brchuckz.ref@aol.com>
 <cover.1673300848.git.brchuckz@aol.com>
 <Y9EUarVVWr223API@perard.uk.xensource.com>
 <de3a3992-8f56-086a-e19e-bac9233d4265@aol.com>
 <a2a927bd-a764-8676-68c9-4c53cb86af3e@aol.com>
Content-Language: en-US
In-Reply-To: <a2a927bd-a764-8676-68c9-4c53cb86af3e@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/29/23 7:38 PM, Chuck Zmudzinski wrote:
> On 1/25/23 6:19 PM, Chuck Zmudzinski wrote:
>> On 1/25/2023 6:37 AM, Anthony PERARD wrote:
>>> On Tue, Jan 10, 2023 at 02:32:01AM -0500, Chuck Zmudzinski wrote:
>>> > I call attention to the commit message of the first patch which points
>>> > out that using the "pc" machine and adding the xen platform device on
>>> > the qemu upstream command line is not functionally equivalent to using
>>> > the "xenfv" machine which automatically adds the xen platform device
>>> > earlier in the guest creation process. As a result, there is a noticeable
>>> > reduction in the performance of the guest during startup with the "pc"
>>> > machne type even if the xen platform device is added via the qemu
>>> > command line options, although eventually both Linux and Windows guests
>>> > perform equally well once the guest operating system is fully loaded.
>>>
>>> There shouldn't be a difference between "xenfv" machine or using the
>>> "pc" machine while adding the "xen-platform" device, at least with
>>> regards to access to disk or network.
>>>
>>> The first patch of the series is using the "pc" machine without any
>>> "xen-platform" device, so we can't compare startup performance based on
>>> that.
>>>
>>> > Specifically, startup time is longer and neither the grub vga drivers
>>> > nor the windows vga drivers in early startup perform as well when the
>>> > xen platform device is added via the qemu command line instead of being
>>> > added immediately after the other emulated i440fx pci devices when the
>>> > "xenfv" machine type is used.
>>>
>>> The "xen-platform" device is mostly an hint to a guest that they can use
>>> pv-disk and pv-network devices. I don't think it would change anything
>>> with regards to graphics.
>>>
>>> > For example, when using the "pc" machine, which adds the xen platform
>>> > device using a command line option, the Linux guest could not display
>>> > the grub boot menu at the native resolution of the monitor, but with the
>>> > "xenfv" machine, the grub menu is displayed at the full 1920x1080
>>> > native resolution of the monitor for testing. So improved startup
>>> > performance is an advantage for the patch for qemu.
>>>
>>> I've just found out that when doing IGD passthrough, both machine
>>> "xenfv" and "pc" are much more different than I though ... :-(
>>> pc_xen_hvm_init_pci() in QEMU changes the pci-host device, which in
>>> turns copy some informations from the real host bridge.
>>> I guess this new host bridge help when the firmware setup the graphic
>>> for grub.
> 
> Yes, it is needed - see below for the very simple patch to Qemu
> upstream that fixes it for the "pc" machine!
> 
>> 
>> I am surprised it works at all with the "pc" machine, that is, without the
>> TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE that is used in the "xenfv"
>> machine. This only seems to affect the legacy grub vga driver and the legacy
>> Windows vga driver during early boot. Still, I much prefer keeping the "xenfv"
>> machine for Intel IGD than this workaround of patching libxl to use the "pc"
>> machine.
>> 
>>>
>>> > I also call attention to the last point of the commit message of the
>>> > second patch and the comments for reviewers section of the second patch.
>>> > This approach, as opposed to fixing this in qemu upstream, makes
>>> > maintaining the code in libxl__build_device_model_args_new more
>>> > difficult and therefore increases the chances of problems caused by
>>> > coding errors and typos for users of libxl. So that is another advantage
>>> > of the patch for qemu.
>>>
>>> We would just needs to use a different approach in libxl when generating
>>> the command line. We could probably avoid duplications.
> 
> I was thinking we could also either write a test to verify the correctness
> of the second patch to ensure it generates the correct Qemu command line
> or take the time to verify the second patch's accuracy before committing it.
> 
>>> I was hopping to
>>> have patch series for libxl that would change the machine used to start
>>> using "pc" instead of "xenfv" for all configurations, but based on the
>>> point above (IGD specific change to "xenfv"), then I guess we can't
>>> really do anything from libxl to fix IGD passthrough.
>> 
>> We could switch to the "pc" machine, but we would need to patch
>> qemu also so the "pc" machine uses the special device the "xenfv"
>> machine uses (TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE).
>> ...
> 
> I just tested a very simple patch to Qemu upstream to fix the
> difference between the upstream Qemu "pc" machine and the upstream
> Qemu "xenfv" machine:
> 
> --- a/hw/i386/pc_piix.c	2023-01-28 13:22:15.714595514 -0500
> +++ b/hw/i386/pc_piix.c	2023-01-29 18:08:34.668491593 -0500
> @@ -434,6 +434,8 @@
>              compat(machine); \
>          } \
>          pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, \
> +                 xen_igd_gfx_pt_enabled() ? \
> +                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : \
>                   TYPE_I440FX_PCI_DEVICE); \
>      } \
>      DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
> ----- snip -------
> 
> With this simple two-line patch to upstream Qemu, we can use the "pc"
> machine without any regressions such as the startup performance
> degradation I observed without this small patch to fix the "pc" machine
> with igd passthru!

Hi Anthony,

Actually, to implement the fix for the "pc" machine and IGD in Qemu
upstream and not break builds for configurations such as --disable-xen
the patch to Qemu needs to add four lines instead of two (still trivial!):


--- a/hw/i386/pc_piix.c	2023-01-29 18:05:15.714595514 -0500
+++ b/hw/i386/pc_piix.c	2023-01-29 18:08:34.668491593 -0500
@@ -434,6 +434,8 @@
             compat(machine); \
         } \
         pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, \
+                 pc_xen_igd_gfx_pt_enabled() ? \
+                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : \
                  TYPE_I440FX_PCI_DEVICE); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
--- a/include/sysemu/xen.h	2023-01-20 08:17:55.000000000 -0500
+++ b/include/sysemu/xen.h	2023-01-30 00:18:29.276886734 -0500
@@ -23,6 +23,7 @@
 extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
+#define pc_xen_igd_gfx_pt_enabled()    xen_igd_gfx_pt_enabled()
 
 #ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
@@ -33,6 +34,7 @@
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
+#define pc_xen_igd_gfx_pt_enabled() 0
 #ifndef CONFIG_USER_ONLY
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
------- snip -------

Would you support this patch to Qemu if I formally submitted it to
Qemu as a replacement for the current more complicated patch to Qemu
that I proposed to reserve slot 2 for the IGD?

Thanks,

Chuck

> 
> The "pc" machine maintainers for upstream Qemu would need to accept
> this small patch to Qemu upstream. They might prefer this to the
> other Qemu patch that reserves slot 2 for the Qemu upstream "xenfv"
> machine when the guest is configured for igd passthru.
> 
>>>
>>> ...
>>>
>>> So overall, unfortunately the "pc" machine in QEMU isn't suitable to do
>>> IGD passthrough as the "xenfv" machine has already some workaround to
>>> make IGD work and just need some more.
> 
> Well, the little patch to upstream shown above fixes the "pc" machine
> with IGD so maybe this approach of patching libxl to use the "pc" machine
> will be a viable fix for the IGD.
> 
>>>
>>> I've seen that the patch for QEMU is now reviewed, so I look at having
>>> it merged soonish.
>>>
>>> Thanks,
>>>
>> 
> 
> I just added the bit of information above to help you decide which
> approach to use to improve the support for the igd passthru feature
> with Xen and Qemu upstream. I think the test of the small patch to
> Qemu to fix the "pc" machine with igd passthru makes this patch to
> libxl a viable alternative to the other patch to Qemu upstream that
> reserves slot 2 when using the "xenfv" machine and igd passthru.
> 
> Thanks,
> 
> Chuck


