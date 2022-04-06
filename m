Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06B4F6798
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 19:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300086.511671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9co-0007SD-SE; Wed, 06 Apr 2022 17:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300086.511671; Wed, 06 Apr 2022 17:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9co-0007QA-P8; Wed, 06 Apr 2022 17:39:22 +0000
Received: by outflank-mailman (input) for mailman id 300086;
 Wed, 06 Apr 2022 17:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAr8=UQ=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nc9cm-0007Q2-UW
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 17:39:21 +0000
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b5d0e1b-b5d0-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 19:39:18 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Wed, 6 Apr 2022 17:39:16 +0000
Received: by kubenode506.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID e883bea2c2e34d2ecd8f0cd69bbd1f21; 
 Wed, 06 Apr 2022 17:39:13 +0000 (UTC)
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
X-Inumbo-ID: 7b5d0e1b-b5d0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1649266756; bh=3PeypdmH4glC5ef2u2jFBuZ4aBnsPgvGQpKC5zTBAW0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=hSMQ7Ulw9w57Tg+yXFXDsRacPOIhTL+0+cQ4kMvlm3ISzi9r8ZbLzM43prHslg1p0YW3v+NTjFv9XRoh62twhLiFiuAvlldb7p5vEeYbtuBeMCaXLk6Dl1pJEV40jTK9Idajm7fSOj2haKdrpByjNdkLTY5HVfofUtMRBe39fOsS6Crniun1o0iERQJdXHjVVfHPjuFhc0P5ZSqWZ8ZxYEaQJtvfa7qL1/3uEZWRkUpkwnqqL1BYrMb0Rdq2pt/31DQBN/RLma/cW6pEplciAJpUQIhntoAG+VgBM6htgw6sFPCup5lw/cqgRknnQqyhlS019k5a5+fa8HWJZPGetA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649266756; bh=/1yH25az6C0Z9qbPNPHGtYWnYU/r0UdmvlENNLV3FzP=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=s50eZXRt1DiSGRU9rpsMkAjxsDlMie7QlJJ5k16Z/BnSDOph8NhPzdRcnCR4sEMm2qiNky6SktAuw594xftt+bvd5xT8+GJX+82tGerqF5JLq/36SnEXpJIcNYx0uI2EUN+l2nbunAe7DlYLn8uZwEOVzuz4uyB+okjC+mGBGfq11oqJctq8eYZU8R08uGAVYn8lV66jKCIwIqaP/rY9rfIfoAL31RibZKby3W3gyOQ27glB8fSNSrxS5mA3wV8FngtmrHEZK0JYLvopkITFvfp/NuMhIIY6iRnr/VEdmo763sL7hyagGuH4adkWCn24FYd/bMn1+N3355drXaXEbg==
X-YMail-OSG: 1ETbDkUVM1nqJp3AF7H1DmYHWfK9Bf3vmarGOcN0A2t40TEAKGrrXXqSDrHWyVZ
 yuBdPZoWP0PERcJzVJLjDWepr3zx91MG_t_gzI7Evw998_7VPs84LM9pNztSJY6_VPjd3bB5J132
 2VIV3ekhoUOpcxYrZD5Nj_UGFP5hOP7S3MqQpDyvMmvq5Cuas8EPM_FzT2JVWrWIdnFsxicNHWFr
 Skv4VTKdCbLRviYOA3Jjhkouv2Cnlam.Byfymt9dYHEQXyg7.waEzaATeHAQdc5Pk78o0R.cHRor
 OqJ3M4rdmCuwKcXfhhLAz9xAC4zJvDIuQuU31u9pu1ucOifrdnBB8iQkj0YzbroC81nKiG7HpYno
 zrZYZlG5WFRKsxD4OVZsNIvhmOovgF82JDI7rYhdIAuBIZQAmMQBCLjHjQtyEg1BmufF_HBGBTgY
 ODqoXvtI8q96__7pWDQxD9Qwtdjuvf15I5.r5ahtz7_fzmxkkbsSQ25HlQv9W0lWdDd40hUGQ15S
 NLlvrEXhdDmdRGxqW._3yHSs8dsR2unhNNQCBoLc7O4EGLUlYni2SMyc70h1_qmPzelmQRnr19oY
 Lk4BAB6EjCmtdh115JkSJ6Ih.xH7B2xOfm_jJWGn8CgbusUonFBTBKtsmHs5VD_TKzNtClH52tlG
 WW5C1yruiOdso4IyaDP4vZln.xXo6piEM.v0wKVnHNYhN1tpITuUubRH774Jhh_5dEEEiHvRp17W
 KZCCsL2LEgQDUZz1bYHnAD3xfDKbd.hIQt3_IBQrVI7Nf96HBP1Ub3MIlaJvwTB5kxCWoie83vBj
 6gj67eNbBjWjEHhM2lN53elybAgy9w9DySWgIjlzlJ2nxV0_wff9pTcqpf9QPMzZOIrRsQdxDrQE
 OMulWFd8U0wTjXLNc4ltpN4NxiIBlqCsBVRM8IMLjTNX_LW9eyTD_efp7I9XQSoPzl3CzgA_w8qO
 UrvJzWullRu._qI3juWM9iczwgN9Kf5q7ZPM52cVDjipkT5m0d6OTB5_4VBQnMIFZsrOizkrB.1y
 pXXrcqEFhdrP.kVxsY8uAd3x_1WC6hUFx8kZglMU.xQSEQ_FJHlW1.n58Z93xgzkc471R60ONYHq
 x2.CXGi5yjSeXxkARE_TyGEZcpSSwTeZR5_aI3QDpaY9Zrru0Wh38S2BkAb51XILFnxoIuo.VX.x
 qOdjYz6PMllfdRV.HTifm3a_6vJIVEqDhIKNlQtKw0aHUfh3hRnudwzWtkLSSux849rUCqRspO.3
 gNdicTfqvAnO8QVeWNHS2UqSjXx5iTMnMkSk9ITMA_o8Xq0PwHC6JhkCQOi9PSf4YjMsjnM5zSIf
 uIN_tgovaGe9q.ukVd1bKhFhyqAH.fWtMnTEqiC2wO6sS0opMKmc3dgdx3TjOiAoTLPoqHu3.wYZ
 dYdutrIC.0XGVNUb9mbokKs6DzmVhSVtLrYUBGrcwtBIGM2rd0ogD5ggMJa7lQDkpUK86406haBC
 52YEkBWcHXN.wWVmXYHuUyiAlov4DDZtz_sjpi1lGK2YpNTCf2WE1HQoeojxYwnw7KryBLqvbGEZ
 4AkVwFFcyypCChVWZ5Rld.iJNHc5e6DgD702a9mB9AXZvspGfTFnMsdVoK2ErH_1C5JxYzsOY1up
 DTyFAC5Rm3_lmzm_ZX5orNmhZOxgesK7LWUyIGlofpBC_NnyyBiSZ0oCcRv0YMg0ode55s8wBYI6
 b0CWIGjnv.ekRkhlxmyztKkbd3GwDe0ek8qkAEvDAvI3zckGO0PJNGou695fGNWEvTfHmzTU8kNt
 a3g4IVw0u4LX5HZx_MnDusgwv6vUHmcPcNx4xOUhoYzSK0HrpgyTKNiIGgsJOKdf6SQO72FB52W.
 DJaf25JADPdg1gV6ALi.TF_AdaCeu.vKV6IiQdyLflzZvb5rN_DBrCHeco1dxzb1FNAcqWo6Wp_x
 VhBf5ReurQp6NzHxeuDimXBspIAWIwt28jrewrk93AnpKqBZZmJbr1sgGdPkRFDyQ.ww4Bo1KAm_
 qT_EI2KTIgp_mQZLnMmkFnx2_1uqvFKF71kG_piZZ0vI9mVE63jQ3qpxbmKdLXyV4U5VMqK58iXt
 NopRbU5ApVXgCWgYDxSg1iKFK6079ZlP7vM3AfPc6l20uhUozSLqkDtdsldfn.YzqpNv.9iJgVV9
 gvAW1.VTswP3CMsOKQmBrYccfjcCfYo4MG9iSD5ICEmu5s6C2Kc1vJfwT4V3z1pYaw.qVq5k7WS9
 RQd36HSn6
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <a899ee6d-14e6-9218-2f8d-a98d5f3bf6b2@netscape.net>
Date: Wed, 6 Apr 2022 13:39:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
 <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net>
 <5d14eeb8-038f-e99a-31b8-f6b3b562c2c4@netscape.net>
 <CAKf6xpsNsYM=fHb4DwiLmsH+Nz+0UF5RvjWr=GeYo5d+6Rmi_Q@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAKf6xpsNsYM=fHb4DwiLmsH+Nz+0UF5RvjWr=GeYo5d+6Rmi_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 4/6/22 9:10 AM, Jason Andryuk wrote:
> On Tue, Apr 5, 2022 at 9:31 PM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>> Correction (sorry for the confusion):
>>
>> I didn't know I needed to replace more than just a
>> re-built i915.ko module to enable the patch
>> for testing. When I updated the entire Debian kernel
>> package including all the modules and the kernel
>> image with the patched kernel package, it made
>> quite a difference.
>>
>> With Jason's patch, the three call traces just became a
>> much shorter error message:
>>
>> Apr 05 20:46:18 debian kernel: xen: --> pirq=16 -> irq=24 (gsi=24)
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] VT-d active for
>> gfx access
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: vgaarb: deactivate vga
>> console
>> Apr 05 20:46:18 debian kernel: Console: switching to colour dummy device
>> 80x25
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] DMAR active,
>> disabling use of stolen memory
>> Apr 05 20:46:18 debian kernel: resource sanity check: requesting [mem
>> 0xffffffff-0x100001ffe], which spans more than Reserved [mem
>> 0xfdfff000-0xffffffff]
>> Apr 05 20:46:18 debian kernel: caller memremap+0xeb/0x1c0 mapping
>> multiple BARs
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Device initialization
>> failed (-22)
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Please file a bug on
>> drm/i915; see
>> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
>> for details.
>> Apr 05 20:46:18 debian kernel: i915: probe of 0000:00:02.0 failed with
>> error -22
>> --------------------- End of Kernel Error Log ----------------------
>>
>> So I think the patch does propagate the error up the
>> stack and bails out before producing the Call traces,
> Thanks for re-testing.
>
> I'm a little surprised you still had output from the VM & display with
> the i915 driver not binding.  I guess Linux fell back to another VGA
> or Framebuffer driver for the display.

By looking at journal entries in the guest, it is clear the Xorg
driver fell back from the kms modesetting driver to the vesa
driver, as shown by the following journal entries.

When guest can access opregion gdm:

Apr 05 20:42:45 debian /usr/libexec/gdm-x-session[1226]: (II) modeset(0):
  Serial No: LX1AA0044210
Apr 05 20:42:45 debian /usr/libexec/gdm-x-session[1226]: (II) modeset(0)
: Monitor name: Acer H236HL

When guest cannot access opregion:

Apr 05 20:46:22 debian /usr/libexec/gdm-x-session[1164]: (II) VESA(0):
  Serial No: LX1AA0044210
Apr 05 20:46:22 debian /usr/libexec/gdm-x-session[1164]: (II) VESA(0):
  Monitor name: Acer H236HL

But as I said when I tried to login to a Gnome session,
the system hung, and there are no journal entries captured
in either the Dom0 or the guest, so it is hard to tell what
happened. I think maybe the full Gnome session, as opposed
to the gdm3 display manager, did not fall back to the Xorg
vesa driver and when it tried to use the Xorg modesetting
driver it caused the system to hang because the modesetting
driver uses KMS and probably tried to use the i915 module
which was not initialized correctly due to the inability to
access the opregion.

I also noted in an earlier message in this thread that when
the guest cannot access the opregion, the guest overwrites
the register that contains the mapped opregion address for
the guest, which is provided for the guest by the Qemu
device model, with the invalid value of 0xffffffff.

When the gnome session manager started the session, it
apparently caused the i915 module to try to access the
opregion at the invalid address 0xffffffff and thus caused
the system to hang, as shown in the journal entry I posted
yesterday:

Apr 05 20:46:18 debian kernel: resource sanity check: requesting
[mem 0xffffffff-0x100001ffe], which spans more than Reserved
[mem 0xfdfff000-0xffffffff]

This is a request by the guest for 2 pages, which is the
size of the opregion, but it is using the invalid address
0xffffffff for the opregion address. So although this resource
sanity check failed, the system still hung later on when the
user tried to login to the gnome session.

Regards,

Chuck

