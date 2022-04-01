Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFD4EEDFF
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297378.506556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHDy-0007pl-Lg; Fri, 01 Apr 2022 13:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297378.506556; Fri, 01 Apr 2022 13:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHDy-0007nB-IL; Fri, 01 Apr 2022 13:21:58 +0000
Received: by outflank-mailman (input) for mailman id 297378;
 Fri, 01 Apr 2022 13:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i0v6=UL=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1naHDv-0007n0-HW
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:21:56 +0000
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b04019c4-b1be-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 15:21:51 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 1 Apr 2022 13:21:49 +0000
Received: by hermes--canary-production-bf1-665cdb9985-6p9bt (VZM Hermes SMTP
 Server) with ESMTPA ID ffbb55cd7e7ff41fe82b03603fe8d708; 
 Fri, 01 Apr 2022 13:21:43 +0000 (UTC)
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
X-Inumbo-ID: b04019c4-b1be-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648819309; bh=753d7ijm7UQ3Hu5BfbfmQK4mp7ufvKUNuW4ug8DrL6U=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=iW0siN0lsrLXIClWiyfhHZTiAF33RCyNmmnEGyDtj/rRdBjmQq8vhGBqW+28+DxK0AuiPh+b1/Q4p8+eRFmMbchpfvgHsqMKEKJmZujNPosaJaJkYMeZfw0l8aKOJO6S2TIWiRev8c/weAOAHlxeruQHy8As3wQEuA3+N1Tm3Q/2/XiARrrJV4WgBMgrsz65tFqIPZVMWFttWKKMo3OmlXlon1KwvTuivOOop5rR9ob6BWS/AnS+EjkCcOrTj2A1vMvFgq6NFEsg2pCbTwWd9SnFpAJHBTzoV/9xh0dfnS3WMPjOEXS74/GqoGSUppPxnOLXwCqXxdRgweWgZhAavA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648819309; bh=ZJ/U/vMIeOb4mn3U+q3FX4+aJjAjTir8UraGPr9DQmF=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=qHdISB8JFQKkO/Bpiswhw47e8ocj7QlnYu8qwZEZ81lSgeFC/U0pG8bLJ097/iy25lEIzuBN2ByQV9clLRmrWw0QFTegRttriIzRQUGfygmshpnuzwFCruLrLK15bYN8yWCcL+tc4xJnTXLJ13ZTdstSMvj9K1hitwO3na/2GADr6xMDfLp+fdyzzrafZwNaFQhzppA+9BSCYzYHCMEeGmgWYtx1XMb0HkkEud/gSHgtzWmqbDBQc+IRvdtWxBuHk5XRtQ7Qeia5/HHBCHYvZoYPZRu9VzReV1A6Rrv1BlQUVY/UxKjzdeqBGLK/OU5Ym4sNNxqndGww9Z29b0ty7w==
X-YMail-OSG: TnVa9PoVM1nUor48hLADRbR75l9AUwzWQ.6Qq5zsOeTwijYp.lU8ct63uf3cQr9
 dEEhUmXmo._KOUDVLlfZN2f5qpl0s8dtdaM3V.4dLQbxaXp.6HBPN39WCqEZWiMkl7Sm4zwLpela
 zsbOTg55_ByFywlaH4wH6U4jf2kPNVDVtGA.nj_gAbTqSpekqAOA2hFL5ZoMPuBdhyC_H2noVbDK
 BvxDSA5bPSBdh_VP2C3v2r3bpysJFqF92zaV8DmlL.maNOoCZatUFlqZK9rh0mqV4oaOc0BQvVFE
 hEGDizly.lwI7RzfiFz27lUDTDQ.Xm9_.5fclOzBhvKr5u7wKX.5KsmPNvrJ97XeVXOt7p47OvsX
 9wjOFRey6QAW.q9o3QCvdFuP9tjwL68Fx5I.wxu2mtRuvvjrI2hUEwESEUYnrA7zT.TPkfn2p3s.
 ixJ8AzK4AiIzlEfm15zQ7HfmeAkeHpCfvf_RlK90VNZEqqWEuC5mN32AWr86fyyiTgZhDNdb52Qx
 nOctxGV5vSu9BBcwsI5gESGGGV48TYP.utg_iZw5u6Xrif6QDyswKO6kOw7yeVCEmTU6JVoJ2tOX
 11ph_ybPo0iymjkI7yjzpGqesvYVwwmIlnwuoe5YFHjAt4p98gSLbjLQt_RowQPH1EsTkT8tNPQR
 F5trc6hON8_bLe1NAkVmfGa1II84ZULSspC0AJMLHtDjmFG2yY0YF5olBqh76ddhkK0aMcjB_7TD
 W2in7Y8nEb.JB6v4qusy9AC.X1pEicQyxUjeJJtYM5E_CXEEN64K0OFnZc9wBIbxxvkOks8Be.Lb
 4l2wYa4NWnSsjR9jLWXW4eRvpIYVUBeICp7BOWlyJTHNJC5O5dpyx0hh3VBGQffQOoB2rFI_aEFj
 ttGDDhaH3Nnmevz11oq6J1cjUv369gwo2ul2x0pneKXuPygRITNdzWB_p0uq8OxszZM4ZreViWS0
 .Q9sl.14wm7a__.7Auh3QpDy.bTXJBt69jwM.n79CfrC3tJJgOIykfzFRQ7GGhw9Px5c8yi1y2vl
 5wE5z7UT5jeecTV.ztziI8zyyYyu8Wo2zzt894QKyV7SmsMrzNgTWAGDbwcWNc4Fx1TvqHM_VnIz
 E7CzDIOa1cXj4Y8YYWFVjudnJW.THV.IWZ.vUDsx5zUCnXLkDuMbPxOWVMKiA5pFTKYeSSyHeL.n
 GELkJ0cyZ7JYDMkIXobbibeIVelnnMmaB.RZZF_XJWAsQSeAjHnhvp9U1Svf74gvCzsbITYvoV2L
 sgjXrk9pefblbYa5vjw3X2a7aaYnWhQH7GVjcAECkekZpiLpCn5rJhiQPyPJ3kaLwBzH2aCfZdMW
 mKJmwvwH8IJ_6nEtggHX0NBJIAhVp3c5upU29qQ27TajAdRLYiG.9pZ3vqMkDP.Z0VxR_7GKEpuN
 79UMnLg1RGIw2yo8jBsVJMWRvfT5iIXmkzptcEKLdBU.H.Y_VMs1jWsly1RUnvQWD3mTHfZS5ALz
 a1srehnF.ZBs27kq34oqwHpDgZOUJtMlrfXBABtn1qrEcvNosxuFwOKBtRcTtbZp4.pmYGrRsy6O
 WJFtlj8G.49M.HORhRwTc2JgLQVhI0evBjPifSTb1KevB37azDJdSW2XWZY9FLQLhWO7pKj4zmLb
 agpZIdjCGEYzBdxH7.pz1bREqTbYNzaLTrsl77HmVJRKRHleWUhshQI7pTcsQICaGc5rJx7AuGXl
 BYm3WRKFV4NFe.okhZVSysIjKmqUKWznMmfWKbhXFl2Nxv02AuBTpVEXm3Kvf5K2camcMmfuRqzp
 GUJeAfnzPfTevwA96P3siIwheIvDRvdwbS0t89oalBxEI6QE3.QZ73rYgTfXa8PG1Il_ceeDy9Qu
 Vxd_CTyhwBL4YOV0uNtxwKlj8jCbgkWue3xPSsooGRKMK0RYcF9qAgNqxEARLK_0EeD2g3VnxuZs
 yxnlMv74bFdgz9DMNuSFE8uuknmKm.opMoiCMBvF_zNzRLxXZUT2ylUXiINFVFpl603bUgCA6b7D
 wnUIRc63VffyXs64fKJOe1Gc55WE8YQR4EnfCbVbT0fzUX7c3LDUwYMpHTG9sF6aj6PFmpnH3jkY
 Ds7k1K_aAJVWlwA97YVpSikpsd98i9_nkMtBm1zfy2mcfDzsHLBhwuc0oaTIM8I0enbP7waUT7Z7
 _JeAKHO3wxf9g4mzHLsPldMC2DHjy8_vuoJ4BRsVwJCUU2U37uj04CbFgeDSvl9ltxxRqY5OzPOW
 f4_7.9XhfbzwbiQ9PkF0jzObqWTg-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net>
Date: Fri, 1 Apr 2022 09:21:41 -0400
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

I tested the patch - it made no noticeable difference. I still
get the same crash and call trace with the patch. Actually,
the call trace I posted here is only the first of three call
traces, and I still see all three call traces with the patch.
The patch is harmless and the i915 module with the patch
works normally when it can access the intel opregion.

Regards,

Chuck

