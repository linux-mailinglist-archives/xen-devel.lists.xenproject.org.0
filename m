Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F14EEE5B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297395.506588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHWy-0002ys-UH; Fri, 01 Apr 2022 13:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297395.506588; Fri, 01 Apr 2022 13:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHWy-0002wl-R3; Fri, 01 Apr 2022 13:41:36 +0000
Received: by outflank-mailman (input) for mailman id 297395;
 Fri, 01 Apr 2022 13:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i0v6=UL=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1naHWx-0002wf-3p
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:41:35 +0000
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70b0757b-b1c1-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 15:41:33 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Fri, 1 Apr 2022 13:41:31 +0000
Received: by kubenode532.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 147fbedc01154233ae6896890bdd0490; 
 Fri, 01 Apr 2022 13:41:25 +0000 (UTC)
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
X-Inumbo-ID: 70b0757b-b1c1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648820491; bh=R7IEiyhZiYuDrJeDSsgqYa6dsdd7mXzc3uSpNdXDtnc=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=TT3Fhf30R/NBi+lCY2c9AeI6JPBwnVC8pJ3nznd+VVQzMyphUaFUc/ilcJJ7otfuinpwxeKnRFex7M9Ff0VGJPmP6GYYVu9k/dNzvFEM1bdhO4s0dNRbtGbeQIGErY5Ins8rEhnSvLTR48lx+8ok216bJSuFuqukGvChzgFrhXkCY+uInn6jfAr8MeePvE6heCu/u2kqCPzCpeKX/QzNDNmV84//2u3JiDjwv/u7fPy/3mIfctMDh3GArmgcp04uyzMlGSj9tJ3BhPV3EJc9lXlE9Kl/xTQU8ujbS9c18btvUpD5+Q8gtaZ4kvPJ4obdRMOvcrDvvF1awY/djCqLuQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648820491; bh=djI+MjQwS6ig1O96dbD3Nn9psbbJliVH3EMP4C7sihX=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=ctO2hPErMbtZmIsToIUyLMQQO3+mCgJ2ac4NZAJecCcfhpZ8/1CpFoESviWhHg0PokJGF1bVU3QI52FlJqu3YKh8+hefQYRF+4+MJl9cdaknKe5AheiTNDhA5n8YO7i39Jq6ozG3+6CvPRm/wpvk88rWba/5YV7ek09d1SLaO2B9IEYowQRMFRmPdZ3IGPgkIAB/5Ir9XrJsSn5Tn8HGbr5RIkaw1EQzJR3iITXno9AO25dVDVj6eV4w620seVTBQ9LexJj8TEoLb06tmGsWw+/cEkyJ8RT9jCdcESaw5XfEKO44A2Pd2kGqBT6vkos68BFA2mV4pwy8aKeFT0tmQg==
X-YMail-OSG: 9.58niQVM1m4OTH_3rfVhigKWvxw8ZKxAXqKa1q6GZqrZRTEUMN6tq21nyHm3Sg
 5E8ad3GWOpbU9tMT1zzhnO4Q02pWZ1ZY7IaxvvXaulD_NewXuSiLcSJU8yV05EZDfLaFGTyM90Vi
 ERmWczreczCGJy0Pho_p60sqzTwWasN884xdgUIMPbKSMTi1iyOBaBcj6PZ.md11QZ1FsnRC7gyV
 IdUHq14iyyUh8eRPy8IfTv5illPTMqjNAbzwceru5lJyC4pqZvoZIl01P_VcwuAqswxAI.zHxw4L
 Vni2Chooj1lE1ZYC1_vx2cg7hltzpICVTdcB8TCFhVfKkuI31I8u9Ai195h27bluLdd1JhqlCi6z
 hhlNx_eyEvPB1UxBkJOI2QR1CyY69.EV6oBIg_RKpAD0j5KsVdkBXf6wrRc6TnYzroETsiX6C_Jk
 dmyA2YfhA2Z4HdQVmm_.M.vDfxdze5tIGR.Ajo4ja34VrhnGYXPXZchdXse6d1J_MJRSYQlH9m6c
 KBEhtm6KrRRyHAr62ro.WlwoVa5UEGU2tIy_lka3RCla3yqZtT0AQ7HlnOeGAZUbbFidokp.QxVN
 JwmkOrJ__XNwxuykZcDuU2oL8gqNT9cgKN1IDCnrYRypdUlO1s.iH1IUDMTdfIjK48zWeU900vc4
 9G2MBO1eWs5FuQwZMTxYbVnO5mxfXgWvLj1kV1oD5aEQrpTfjkiPSQLNwuITOTL2s071hd9K.qTO
 JAPUdNIAE4H2mgT0KtUvT9JuzeM1YslcIzi0f5kHL_ErcTReUQzJGYZ.71AZ.40HAU5MtxvY5vwL
 dK0BwN4qaQItx5N9b14PTFlRJuiZQlAR9vxQUiBf2bPscQEYUaToAq8aXDDS4XOBA7F7a4RE4F0f
 AGuMqApANY6HfUoD5GLAjOSDhb5ZrKKjUYRd6CdcMlNf3xMXKkr5xAQ71pWvHuTpebjhMlxe.mQL
 vYOrzZyzmsX5xzMGHr6SDzMv1RrkRZPyulSkj86v0AaP28rMd1tAwdBXEXCjD5JLTkR48IdULYqh
 pI1LS59QqaeDdDq6P96J6Ic69kC78WQrok3QQUeLtHBlT8gyikQVSb7lcnegTJPQCYX2PmEX0AJL
 DtHTmJpDdzM1mSWRDAy.zifqABmphZj5lPO.5bCs3Vzb6jZPVvgBJgjacBVdYFknrWZ32R6PVB7e
 B4CueROI9vfe4Gr3MAoknwCTccRdcaMmcF_GDpRIiLPL8gdIJbctMyVG.vTOI6GdVx7.4vXv4q4S
 3Xk8Uh.doVBsL6lCh02YGSCX7JvgwrksTnLGvkhs4L3RHPBV027tzwhBpGVyI7DFbA.FBzNxEpj_
 LhfW.z64zgSgOau_PMMkzuaWHsrt6M3JdNG9zNoUjFMMCvS.FHKjEsqKF5lNIx4RYZDBy09fbpe3
 Jiqhw5K4gXpraQfaxTT.rdcnBHuVFHSyYBSyYTqvpPK63eLSxd_OR1ETwInYFC99DtdMgKd0xKrn
 SO_2FeEATsqr6.KqtD7DPFfdyiqsw9MpRZuwetLAymhIZSzwbrxqZwnA9hU6x.h13vo.9C06ZgvU
 qLwdpgv52xtPf5ljt1a26ZtT2BM6EQcBY.rC8KfOFakefEk8.x_k.KNeZ7Jc70U2fWFmk.Lf5TVP
 ax.snLl5V8T91pF85C8o5emK4Zqg1bRGUx7W.W8_ZeQb3UrzzbrmdhuCH4j7WjhtaIA0MuEvuiYH
 gJdTtF894q.ylXTjWIpUvp0H6aqtnyaBUc6O0I_b.acB9HcUsblUS_5H42w.UjlSEP2qmmoGdG6F
 rf.BSZAoy7ICUlzR3kY.LhrjUH8uHnsXqVOdclUzGuNDErcNN39NYIEG6AAd7Vn8v4KdVQ9mxfSs
 DsQ4QeOOKwsaep12aovjhyRaBU9259tvbH4.Ievesrrc.3hnJT_BmizADvwifjAfXodc7vz.9XMY
 J6qI3dwGwaJcPXLW75YCE..IPjKJW_0FIGCQYqSNIkWN.4k1b2rj.DPN3MKdLxcj3oAdCxZKlkNJ
 TmwWHcqq_hXFzF5JEQn_1YdQZppJU.YKyWZDi_imajv4bR5PFY6ogzWSFXpEpB5El_k23uJquS.P
 QIO26Bw94AY8NT57.J0Ey07E1xvyHIlYm.Gxmcu5JhaF.uk9L8cpcblVmv4_Po1u_Bvn3nuEWu3l
 UMQMWyLwQlIfyVBm.FdvvgY4rnABacssjyS.yEZ4uvOGkHMGMHuu1hhXnMDruCB7wORxrV8fKBA7
 p4tYi79l_R6ACc0E6
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <c60f8789-d91a-3076-41a4-25c2fb07fae8@netscape.net>
Date: Fri, 1 Apr 2022 09:41:23 -0400
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
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

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
> I tested the patch - it made no noticeable difference.I still
> get the same crash and call trace with the patch. Actually,
> the call trace I posted here is only the first of three call
> traces, and I still see all three call traces with the patch.

It is probably necessary to patch intet_opregion_setup to
return from it with an error sooner if the goal is to suppress
the call traces that occur when the driver cannot access
the opregion.

Regards,

Chuck

