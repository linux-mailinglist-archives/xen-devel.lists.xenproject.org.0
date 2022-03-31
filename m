Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B964ED24A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 06:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296642.504999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZmVt-0006AV-Qm; Thu, 31 Mar 2022 04:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296642.504999; Thu, 31 Mar 2022 04:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZmVt-00067q-Ms; Thu, 31 Mar 2022 04:34:25 +0000
Received: by outflank-mailman (input) for mailman id 296642;
 Thu, 31 Mar 2022 04:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nZmVr-00067k-UK
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 04:34:24 +0000
Received: from sonic306-21.consmr.mail.gq1.yahoo.com
 (sonic306-21.consmr.mail.gq1.yahoo.com [98.137.68.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4d4e0b4-b0ab-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 06:34:21 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 04:34:19 +0000
Received: by kubenode510.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID bfaa6048c66450ea78631724d00bd86d; 
 Thu, 31 Mar 2022 04:34:15 +0000 (UTC)
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
X-Inumbo-ID: d4d4e0b4-b0ab-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648701259; bh=ePNF+xyTVg9PzeNUd3rAboSVNRUGmgQnhwX1SIbI/JM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=jyRRhaLgQ1/g/JMD8/zPvpYiwvRko/GaUejLaStUsw3GCsZfvEADnq0CQ0z3CN9NLA0WsoKecL/YtuynSzk38BBdtdfEtWumVJLUQGIJB7BZefuwuazBG+rdGh2WM9RDnjKDoj6WgtajId40S2y+AJntOQiDpymc++Hm8ggx+B7CRFP32BY+/9fdzX2/nMIpPiemZAU8cgPLJhKC/1cHgv4nDtA8OLz/SFhAn4NnPvw/L5q4GYNZ7QxfVYM/wJvZVxr8TkHd1G/DpE/mf50smLI30xCUW0g+49sZSUV9O1CRYkdhRRaDlPVlJ3HRLfYsZmDKolrGbB6BYtzU+JVvNw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648701259; bh=j/4hGOTgMBDxxrRea+oF2Jz1x4lh/w44833WNMTSbV5=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=p/j0MLH04SFTO1hRVO93rOMho1WS9D+tace1mImXNrsBR0aKkjIoeWJf04T1Xffr3js3plM81ltWIfZ8AcLkFafSOp94hea6eVqWqaL0E60uBHHxjPTdDIwgynPsmnLLyFMJr5W5Xjio8yCl4jR66EZ82rEJlAKI4PpOkJ3FX5TRMP5srmRA/3exW6N/kxL6ZWxHm4FBxb9VyNci8QtY1+4EY9TeRKVYUi2vKVVLx438Uc4hP0tIZdOjt5fwjcWCe/aiSuWH5WT9cHRyDZ/Bp+K3vhWZDevWLerehq6/MRnu4HmSLeWsZxgnuRmwvZXqTGp9+Qbfk3XPVJw2sF6ToQ==
X-YMail-OSG: IzEy6PcVM1luE3CmoNjo2dzoYSUeHSsv1QDQsbVqnFoVnfXNE5mwB4CGhTIJkPZ
 Xi.t0Cxiv02KEdqBEf1tSMe1MWSKuQagTFOZ.WPxdK5LOq813ujEBTLPhTOCdKYsOTdScfS4CmWR
 VjcxwF9IRGI_PfMaqvNdWd7wJpfbUEqNU4Z0vzHyHATIBBf5Y1AjLfCSS5HBCrYuWOWzbjZebuK0
 Es.pyiz.g2Cfa58O65S3slxeVg1LPz3UT.jzniCLwrpfyqd79v3dLkO24NkAEL_RrNS82KLE3DyY
 xq4z9TweomT7BMMP37fyRiRl1p0nV1q_rsGQ.cxuS5FioQYXwAdNbvgDp9jG2Vvbb9WdX52cWNqE
 KHLsta_DojwIZurmMEM.9iRZjiwHLzFQ5E5StC6negz5ASsQCSLGblit1Nw4X07q_VG16e8GLmhe
 G3zL52x_BKNLJhGr6eJbnhlwrAtQguCydotQs9RexXIRSbA_m7Sy5bB9msNw3TdGI_m5ym1sFCzh
 5.DcvSeN1gwac7fBJcg6VInffI.gOsrMNFWoZqUeuxigy6PK_GNmlfxXsDvwqqexEZjz5M_8ZqZQ
 oufh2ZaXxhY79z5CxvpnXGoIKcz7MzhIIJuOKBD6F.bfDvplRaCXEP9.GwFIqXC7KgLk2wJxKYZ9
 CpuRlCpl_ByR.t2Fo02I6Aysh5yZwl.1CAXbVvup8V_gCq1Kgb8Tupgn.KOhldlTfF7r93cTw.ig
 Bi09aRyC0KHrlN5Edq9uPRh40OXONYIXLgBAk3KdTwtXA6Seo4_3Rqj1HDNMcAWtNHCqqIRoH7jc
 u1ZQ354SjCL1xdEqOSE3k.7AhkR9xZASFhs2JK1kTv_n6OdIiXULJb0MU8dLaO6gIzmc86T4km1o
 roy5CxkBcELLp0UH4GYldlK0.wEY_J3IcKPWUurHrpg3pzrC_ArcLvWsk0Db5WfgILqQDCKkIj8C
 i3SuoFMgyxb.vgU7Ch5lRaHfd5IUFhTBELDrkW6X5I4Xbt4uMq6euYQH48sskEcw4Gh2WVjrYTt4
 k2YSIkv72QKqICHxU4kHNaj4TJFG4OeqK6PiH9zXKOCNj7E8en1PvEiJ4lZEsL_B6TBBG03o_AIe
 z3OiKyeDjwgZexR7mgrV8VOjG.FSpV1OYhBN1.wfEs_FvODeGjoea1QEPAUcE5sQ3XpHs9jZmtjc
 n2ij7m2gl1T09lF04xHqRS0sKUQYuZXJ2XljxVIM.MXUwCYHKh32Nf6A2N.TWmOigZybm3TKDmlR
 wH4Ds_1O8F96Un70dSkwBtogt3aqAAvneEj36SibMb1Mzs5mRsDKXA_n7GAbt_GqvG4DgvDBMn4i
 AZk2sahZCRixE954mg7uH7Ldj3.Izvc2bZGCbOWL1XErUyF.bZXT9fekDRgtajyaZxfBnsV4Z4Bv
 DLDkrSkPcQ3Nav8XwpiM6PbUCSZBfH1H_UTUIKdkHNNXTAvazK6zxQkP3DidLpQhfSPGqFKF.88N
 GVc5A_Q1ud7vy9G82KXXuW6h1ptJpXm7SXsMhbmq70S4yezB.9yH2_suh_5vzlN_btnBOY.s3mqY
 By18aw0xxn0v_vxBVo_R6ZguVRRzNodouz9G6eYsyI_GrPTo7NQnKSAehJ4iFqp_Xt6M3YNRD4c_
 ydhED2FJ3XUkC2Le2EkMlUaQ0SVSv0U5RaXElcB_HOEUA4IAkpF.r93oGvJ.3mx6seZt_g1NR2Qd
 TdKbw8ssvVXLi8b344A8nLDrHSrOOhNBhs.oqgrHHUPiMWAC6vlWTrYWTD5_HG_g2uUx.kxEHjcb
 wU0sgFKsxpuFJkMJpxCGnk7yeiJKnCukQWNERFM2RVXjsmH0BpCMcGhJcSHdjsiVJ.OOB_nRAFZ0
 n4mmH9KXBPNWBabu5hiTN8.eYEhBcdldQQaXXeIngSGApQ33jnwXWrvqZ_BvubQjieDkWfztabzN
 lkopdPzKE6ytMq8HZFeJ1O.sSebtaZp5BmStmHBxk7lUbJjRg7.Q7JLFIqVwhO5WF5l4nGHTGKwB
 EX42l6nHIUKXHjNUzQy981w7nxMl287Da1fZyqTcd7.ydyGT1nwepKi2iCAs40TTFCbPjW7OYYk5
 81oUhFULcwGvVt537tDOAuwtdJmtaa.gXI3I3SNnCVqr.nNOe0GiX035OfATQcbu5ssRh0512LID
 42GWHi.QNaQ3dO31FVfX_Et_9mG3G5uiODjXx1n1N4UqDlqNsbJFhhql8WwL8NmAYMOYLprlSVwb
 K_AX32SekIfNL4Smm_Ox.
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <59471dea-c379-59a3-9202-384a4ec54a07@netscape.net>
Date: Thu, 31 Mar 2022 00:34:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
 <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/30/22 2:45 PM, Jason Andryuk wrote:
> On Fri, Mar 18, 2022 at 4:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>>> opregion to the guest but libxl does not grant the guest permission to
>>> access the mapped memory region. This results in a crash of the i915.ko
>>> kernel module in a Linux HVM guest when it needs to access the IGD
>>> opregion:
>>>
>>> Oct 23 11:36:33 domU kernel: Call Trace:
>>> Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
>>> Oct 23 11:36:33 domU kernel:  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
>>> Oct 23 11:36:33 domU kernel:  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
>>> Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
>>> Oct 23 11:36:33 domU kernel:  intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
>>> Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
>>> Oct 23 11:36:33 domU kernel:  intel_modeset_init_nogem+0x867/0x1d30 [i915]
>>> Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
>>> Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 [i915]
>>> Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
>>> Oct 23 11:36:33 domU kernel:  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>>> Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
>>> Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
>>> Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
>>> Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
>>> Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
>>> Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
>>> Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
>>> Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
>>> Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
>>> Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
>>> Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
>>> Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
>>> Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
>>> Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
>>> Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
>>> Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
>>> Oct 23 11:36:33 domU kernel:  __do_sys_finit_module+0xb1/0x110
>>> Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
>>> Oct 23 11:36:33 domU kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> The call trace alone leaves open where exactly the crash occurred.
>> Looking at 5.17 I notice that the first thing the driver does
>> after mapping the range it to check the signature (both in
>> intel_opregion_setup()). As the signature can't possibly match
>> with no access granted to the underlying mappings, there shouldn't
>> be any further attempts to use the region in the driver; if there
>> are, I'd view this as a driver bug.
> Yes.  i915_driver_hw_probe does not check the return value of
> intel_opregion_setup(dev_priv) and just continues on.
>
> Chuck, the attached patch may help if you want to test it.
>
> Regards,
> Jason

Thanks for the patch, I will try it when I get a chance
and report if it prevents the crash and enables video
output to my screen. Has your patch been committed
to Linux? I just checked on the gitlab Linux master
branch and didn't see it there.

Regards,

Chuck

