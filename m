Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D544EDAFE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 15:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296985.505729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvJ8-0001Km-Sd; Thu, 31 Mar 2022 13:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296985.505729; Thu, 31 Mar 2022 13:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvJ8-0001Hq-P6; Thu, 31 Mar 2022 13:57:50 +0000
Received: by outflank-mailman (input) for mailman id 296985;
 Thu, 31 Mar 2022 13:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nZvJ6-0001Hk-Ug
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 13:57:49 +0000
Received: from sonic311-23.consmr.mail.gq1.yahoo.com
 (sonic311-23.consmr.mail.gq1.yahoo.com [98.137.65.204])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a9bf9b6-b0fa-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 15:57:46 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 13:57:44 +0000
Received: by hermes--canary-production-bf1-665cdb9985-85ftg (VZM Hermes SMTP
 Server) with ESMTPA ID fa8513941d47aa2a9055d9a42576724a; 
 Thu, 31 Mar 2022 13:57:40 +0000 (UTC)
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
X-Inumbo-ID: 8a9bf9b6-b0fa-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648735064; bh=ofnR0tQlTnjHYwxOCjkGIN3JFqVQGBGJeSM5FViJG8o=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=eoPMAS6JeXyR76G0HPqxQ+2cShWYcN5Uv1wjS/6LvopbI21p0THi6JFVWeWi7rZM3muSNVLMTHTDzKZdKwMHLZI83ZLZf5S+c5317xGmGgYhmukqz8qgVsXNWePSUivid5I2Zluw+b0uAr+pLI8FSg7G8iJZyshCATdoRMO6/o1mqdlk2KRLAmhgIXonklFdTKcYhOQK1AHB5t8U9T4On+Y7JHFesgkvb2VeB1BC/4M0AdZDCVxiOlcadi09hN/EneHbmQEk8Y+ZTCAL43kpq/mmCLCxZxqgjrFefY1OsPPSUpVAkUM0OryJE7jTGIEp1sruuXufEW0NaREcrQYQCg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648735064; bh=xFA5Qbw1P9FHrcX9jGlxQSU3sHXaV9C0miQ4/Pq7afL=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=f8VuC8IF30vYSsEjzyhRDVO4i+Rb7Hc8GX6/o08O7i3hEVq1wYwGl4P2WHH5w2DnSdF1cg4i6YP5TpgMvzprANesWCUgKZib7XUTcJkGde55gxh5887ZNVWRE+KRPAaQaYm0vaaOoLt17ZooISmVyVxIKOuOvnBwc7ufpOP9duk64+pNh8OzRhGWhPjMXjc6wbaV+nVcv2RESchfNaPtKZ+Pe5wP8WEA7CfyW1UcUSSv7s2kDQKdbwceeSnhM+HKkolWNYc9QfHOk9C7dUQTuSz9W68oS3wPuH5VWgXlrA+T6HAV1zP2QvBycGPtWw8R7hz3kE2OvHFzKGkstk2Kgw==
X-YMail-OSG: KmtiWOoVM1nWHdSgIlAAQsJjoSH_iszUF8r7Hr8p3gpeMPw_4.oaT2Iei5XuC7E
 zevdEWhqQi.SK0.FuTIPaxi2GsN6iTnNgBHIx_cih7NGtk2iEor19c_Kwud9JD4njcsw89K7NjjH
 .sjp3ehBf_7fTu28awZhVu9XgxygDE8cJ8XbprmsH6pYbwK76fjIyo3Tx7pa_APbf95YP8hWSDId
 K.y72_kq4Wd1P5s0WX7aWLWXhwgFzcAJ2OpgIsfBufyrERMsFqSOdU857GAWyzWfF0ONw44thvPo
 YvwZe0uY.B7.W4MlN1CU2vgHRIBuu4PJI2Ozxv4UQJh946r3yU_BfB10IEqsIybdb5imNAHEwDjz
 45.WRlxYpp1z9NHqWYdHNMb_GqpdJEZ4XIIQtMF26KxmDSxVeg4qL1aun21K6dbMC86Tl81gSjrQ
 6OXUKcictYjT0MStVRo1hmrFPF7oPJP7egXUH13qp2w3nHlpmru2L.1Aed.Vs4RcFY5WjcwvYgIX
 Ku9CaYwZYnhQG3kD_wlyz7tKdAQ5TY.0EodQXxIuaaT9MzqN67pAht2w69LqJy..uJZXjhJBFdIX
 LlerC4ub4dOtf_jjNOvwbyCRq79JCDA6lIaGgI3UyoKxFOZ7CQZmn8.lISLk8e_CMnAP3Zd3j1xd
 ux3SAJBPsIXn_WroLz2xdc5B2Quqcv5gbpSOuJc6qFbwNXHXwFORVYxGP5J6PK8SGzYwJHCXoTKC
 i89JpmCwR4eeJf3_aqvBm0zwjBkuzxTKt9JMmXhQaqR39zmoGiDe.bAdydRWTzsxwqe9lp1VwdJe
 hez430wgj4T92pz04elLfL7.DqFsOtfc.fp.2iW3h9j6hAfNqJ1mGTCoj8w4ZP6dn2PMC48loIYU
 gBhBxttmiYU_QL9XGMYFz6kvRtaqWHjM8b7HxAf5J0.Sm4h0dCmt4EXyTvJoGRJXJSis.iUGus8E
 0jYU5GLJ7jKheqQfMovao.mQ63uT.oTjS8Ock2r_YcasOgVAqd47X6s9gprWv3hwlR2STTzN4ZAr
 ksI0lMe0WsrXp3RPpyBv0m_lcI26qyKYZlHrCNgx7UEgmJNzmjwH.Y_CmqQDolDuDAIEMDM4A2la
 FQXkRoZSyvwCQQfovZsN0Mm_mA7Qhb5NETA8zG7IfetUO1zZETyUwHwBIj.KDfLF.HjPBiWVcW.n
 Mx3INgedyvnorohxhyhayDOQp7b2mJRvVvT6ufKHZT9jg8RRqz57NFIY0lab8N9Y_ziFUJLg4qjk
 5hyC.brcQKIZJmWxiMH9odc2rvn9uwK1y8LWTCS74lWD2LVuniwFloV4rhOe5rO4d6Rhg0LMqUkM
 89MVgATjCLgVNn_O43yHb.5CwRqIMQdf5b0VEXXjqaFmkKVkEFLmg6.SMOud9Dy73WodpBn.rAS4
 cWk3a4dL4DlcfX_pJe0D458lyXgN3Q6FvcHhIbi7C46setwZv5XT1k28rHxndH4DW9STckOb_WMv
 ygHwB1VMPRHBQ9Moo52vI33oa9tRtBbUYXRTPhuUd6G6U10dCOznCBDxEVXeIZhHOmp6ixfLAggC
 W1magyDklHD3TLz7wMsS6ZijN_s2aMODB5.5jN2K9I1O0mSz4qY5HrfrTEVNyHXdvk7VFXGOwIiU
 cipsf.X_i9Y5oviSockLz3ni3cueufNGZf6LLAWc6gqVqWBUXsJHxhv10GNV1QUpJJ.BE_ElSYQS
 8W4C0FWYG9S4dEz2726zyPHwVjiUbfsgh606FcdeIHK_UI5OSXerZDxaJ.Km.zFg25BZGokQft83
 UXFlj9xEKjYyLMA4DjIKkh2ge_89Bufgn.r.R1a8P9UOjg1er0lBU2fJ_212vFNpFEAMSgvnbPEU
 8bN_IS46DRRy40jq1OuHQtz6O5PIEQan4wGrx9lH.srXOXf3m4uvZtCuZXE6vNqxyPD_D6jXriWZ
 a8do1.4sx2VEBQyLUjgdBfD2vllofGRpAjzyf91i2QOPMv2bXG7N4aWPynqwFRnKETyAHuV7DPEW
 US2uLHGOaEL_QndEXLfTGOZeT5l86LWo1ildBDfcAqPSugQ_umxbRh5IT5LLQaQi_rm0XeMGEYJQ
 Qk5krYRj05Msb1F64GGia0MFcjgg_9ATGVkamvQlAyftwWvtNBE.aILKRTN2yOaykVb8uOkVAsuW
 UBzOfkd.6o6vVYpnSrNx8cx2QDp3_CnY26Cg_8.91_OIr2pdYiO9x2VmgDzE3AegfwW6R5CMn5qe
 NwS3hfydlOnzvDdYcSkM1
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <ec7a9cf1-2504-9ee3-c9d9-060b8463a557@netscape.net>
Date: Thu, 31 Mar 2022 09:57:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
 <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <59471dea-c379-59a3-9202-384a4ec54a07@netscape.net>
 <CAKf6xpsyxDJS36tNmXMrzusKMgi_gGvdvMwncSry_rWB-ZTjZg@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAKf6xpsyxDJS36tNmXMrzusKMgi_gGvdvMwncSry_rWB-ZTjZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/31/2022 8:23 AM, Jason Andryuk wrote:
> On Thu, Mar 31, 2022 at 12:34 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>> On 3/30/22 2:45 PM, Jason Andryuk wrote:
>>> On Fri, Mar 18, 2022 at 4:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>>>>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>>>>> opregion to the guest but libxl does not grant the guest permission to
>>>>> access the mapped memory region. This results in a crash of the i915.ko
>>>>> kernel module in a Linux HVM guest when it needs to access the IGD
>>>>> opregion:
>>>>>
>>>>> Oct 23 11:36:33 domU kernel: Call Trace:
>>>>> Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
>>>>> Oct 23 11:36:33 domU kernel:  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
>>>>> Oct 23 11:36:33 domU kernel:  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
>>>>> Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
>>>>> Oct 23 11:36:33 domU kernel:  intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
>>>>> Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
>>>>> Oct 23 11:36:33 domU kernel:  intel_modeset_init_nogem+0x867/0x1d30 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>>>>> Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
>>>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
>>>>> Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
>>>>> Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
>>>>> Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
>>>>> Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
>>>>> Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
>>>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
>>>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
>>>>> Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
>>>>> Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
>>>>> Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
>>>>> Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
>>>>> Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
>>>>> Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
>>>>> Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
>>>>> Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
>>>>> Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
>>>>> Oct 23 11:36:33 domU kernel:  __do_sys_finit_module+0xb1/0x110
>>>>> Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
>>>>> Oct 23 11:36:33 domU kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>> The call trace alone leaves open where exactly the crash occurred.
>>>> Looking at 5.17 I notice that the first thing the driver does
>>>> after mapping the range it to check the signature (both in
>>>> intel_opregion_setup()). As the signature can't possibly match
>>>> with no access granted to the underlying mappings, there shouldn't
>>>> be any further attempts to use the region in the driver; if there
>>>> are, I'd view this as a driver bug.
>>> Yes.  i915_driver_hw_probe does not check the return value of
>>> intel_opregion_setup(dev_priv) and just continues on.
>>>
>>> Chuck, the attached patch may help if you want to test it.
>>>
>>> Regards,
>>> Jason
>> Thanks for the patch, I will try it when I get a chance
>> and report if it prevents the crash and enables video
>> output to my screen. Has your patch been committed
>> to Linux? I just checked on the gitlab Linux master
>> branch and didn't see it there.
> This patch should just make the i915 probe error out properly inside
> the domU when the opregion cannot be mapped properly.  It would avoid
> trigger the domU trace you posted above, but it wouldn't solve any other
> issue.
>
> I have not yet submitted upstream.
>
> Regard,
> Jason

I understand the limitations of this patch, that the guest will still
not have access to the opregion. Still, I can test it - I do remember
some configurations when I could get output on the VGA port
but not the HDMI port, and maybe with this patch at least
the VGA port will work. In fact, I am not even sure the VGA port
does not currently work without your patch, but I know the HDMI
port does not work without your patch and an unpatched Xen
tool stack. So the patch might help some and if it does help it
probably is suitable for upstream.

Chuck

