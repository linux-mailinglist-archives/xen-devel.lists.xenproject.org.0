Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75653EE19
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 20:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342672.567748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyHlk-0005U3-Vm; Mon, 06 Jun 2022 18:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342672.567748; Mon, 06 Jun 2022 18:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyHlk-0005RC-SD; Mon, 06 Jun 2022 18:48:04 +0000
Received: by outflank-mailman (input) for mailman id 342672;
 Mon, 06 Jun 2022 18:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qjuy=WN=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nyHli-0005R4-UU
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 18:48:03 +0000
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e591c75-e5c9-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 20:47:59 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Mon, 6 Jun 2022 18:47:56 +0000
Received: by hermes--canary-production-ne1-799d7bd497-2pzdr (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 45bd2f9c05a2726a2f7095440d7fd00d; 
 Mon, 06 Jun 2022 18:47:52 +0000 (UTC)
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
X-Inumbo-ID: 2e591c75-e5c9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1654541276; bh=kxA8kdihdD4E0EIVi7e3E/kzwhCP82CLQhp0tYo1HTo=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=eRfMLgO84clK9Is9adCzXkF2Nu9ovNwQNdLqPGYfoK4E4gjLQTFTZqgf2VGDOctQhf8zF2pLZElqo5Ga1NjfVfKjLvDL8d/8rNllYVNBp3mjPqm26zpoXLMu1Aj6FHktbEyYmzO9K+Cr/ImKX1mFISP0B8Yljd5NmZ2IhOjwA/necbEapS09u5uK1GAKH6yBg5gG2trs3DA15WCckIyjbIjZDGmxwuRzzfYZ31jQgHJPKD+rHjwjGrjDPkfeaZ0w9+e3aWVTjUivvbHmEhJdVTL22G2CIKsVlB5xWHLBcnPC9ZdxdOWMKY/bpd342bcfcKtRKP0gB/VaL84Ghd4chw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1654541276; bh=w/TEIgVgCTuIVvpXjrf7yUQgX1KaApCiU8xGdhmbVAZ=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=FfAHTDGel5XDTwCbRGTJWNmf2ZHPQlB53WgtDDOjlB84+8Wv/xLRH6qnoAUaEGhzUdphBGNDkP+3Sf5twKDclLxLxo7fEO5ycliHDa43q29PijytdLufru15dBmfHnQH/ZX9W5GRRc77z7ArnhVXk7npCED3Z9pGf4yxcVyE3CjhJbkepNhKx5e3MuRo7LeFYHTZBRURq9EZl+8/56zNUZnLCoOmbZJfnSQX1og2ilkz+nyszzdAAB0Df44wrg666u0YkCR85WAWJfdoLIoyijqLf5tlokYRhOHrOUfhxGLKlaa6sWmBKC4+6jb5q3SAImVNOSNCbANLInKygrnZnA==
X-YMail-OSG: YNpYGrwVM1kKe8RFKhr3QgzrMOuYABQljs98yXzsBHKRF07LumTfjB.dEyN_CRa
 JZ5O4xvnT0CnZj6ccawmGH6K.kkuVKibez8PMCA5WZuBeTC7KGyMC.JF5w2xxoerKrtZ.me4kg2n
 LcQv6hXCep5WpfrnvORrG0l0iFkiQZ7GVAfo9P58bu81mD4kwBitJ__3DqIl3TtqEnubbZqtm68h
 jXUyrG.jD1nKjevtHHSpwsPw.7IF4xUQdoPtL.3SgQWphm8P8BOpX1BswRSfrFvzPX_P8aA1EajM
 6XOwb0dOmV34WXhqj1qZUwx9VpdqJCCxSmw7zbgHfQcTRnvHNPpfeKmw2kWdjIjNvKrgM7whb4pM
 i4zNX2mK5GuVCI.bbBRW8THXkwMQe_LVkTLOJ3OKFfIB6.wQTe._NnVQUrJw70ZOqfA741hj1OfW
 8erjekcOnjDg9STmJRf8Ud5kkapZ7haDvGhaOPYiMljZDoTCreOgEemd2txbXDM_e54gqyjFNpNo
 p.sH_jEGQmzb81PLwh3PWAtgEqczo2NS0nrP6LTi2eaHFt3kCnUa3T0dCOUeeYUQPbcxsMpNHQ.y
 L.RO9JD7AhNn0sZdAlqEviDKo9ddM5cYtNKmWA1djztePlK_NTIGXRFroVs267zK_ZYYlGBF82pT
 ppR8RzeIpPHVfwhEqBKEqfp4wYkRyp6ur6ndAv9VvnAhEnDL1MvtNypDirRyo4QsQW6DG2PQcPIW
 zh2PoVZpdiJh0DJRt3cby_16OeUKOtm3tonO9ZCpdFHq11KZLH_0v.3YaUkJHN5zENDXEojhoOvu
 ophpEWrJPI0MCJTBU4tnfK6yuNwWmbxwaPnlJoP7D_CAYdstHwpHzDOIP2NlCUEcW2jmcy5KDJZY
 rzHbpApM4SMHpa6Aq4p5gCEBmQvHLvqgQVd_Mw8RnE9odP2_mrHEjZZuwNXne97rxQFufU.PQI1h
 4Hw31_2gXt_o4AKYInEoa7cgavivh8AyPZq_BtBB_tI0aEofueIE6z_SV.AsRyK6RNx3zf1EhQat
 Vfyb6NOV5ji8BdrzRllYf0v6FferiUtkk_jXZS2fkxgNKFtBZ.zJdfkac9bW7veAnB3pbUfGMmyI
 vG5q1.8AvbavDJSlfB5K1HRS6cjC_FSpBapM3cki0WoqkS_w30nZjZK0nLhf43d.yUGGcKgr0giW
 MMnmrpZsIv6F0Qv7ClLh7qMrrB.mhx.Ae6EyJ4trT3t6JWfN_gUDoD7U9fwwciWy6hpMgXjaJNUn
 7cyPvZxd5.Kk1aKt2KKBHTs2U7c30utNu3NOeqYMbPuYFIwh.g10EEdcgAjA581LSXHMq1NGSLyT
 QzzGk8pKLezJD7caLqPXfRJOiF0keX7BDlw8zk4l2HbJDXsnXBPtOnm7UFI8Gb.87SZYyS6HoJdQ
 0A.ygh8ZQy6QIQ3e0U8IDy.J17qeBUee7wYkOYukutXdbcMxymgftU18O2c682D1yGUD1L1_OBez
 ldUsTBn6741.hA0bGaGcFsRZjsR6r2E_chffdR.iUoLJMCYg_LxxQrO5Z.i0w0TE3.BhVzelOcb8
 wHxJq8i4zZ91yQqoI2Wxhgvri1I1Bt2k3Pksa9smZWZeadus5yhD1mB5l38sgEx8.Uil.5NDAUWG
 Vu_sfp7oiNRuQoh4VIHyStjn1RsNjH.cHyvSg1JAQYcOJ_6MAmr0BnbN0hTLAdZkD1SiDaE3L3H7
 LA6KBEELw6boaKJQgjEOgQb_2RwnVo6edTYG44frmFNCVh.fyLFpbN28drpVjYQpvbvq9gT4y3zg
 QpxhNlPMQKXxDz33pJxvJqyABcyB5zv184NRokJK5Ee1DnRF43EuFvs5ZzTn1g0RaxuHRfERVG.T
 wL3asrkpOEcj2gMLvcDPYLiIP5epB_2tyyv5Ew6tycf.XZVdErGedMwMQTzS.qJM59k8hMKssKRT
 u7j42YXSkx5bCJwwl06vDAMVvirxRAdrxq1CPedI_f5cwvmZ_0hn6I2tsIu3cyl5B.v3Abc0sHwM
 RFovZRiQT9QZa2cvHpZ_6pXaRrtOhXebi9fquv8IFZGpVGKq0oAbKQ.GsPf7g0cTcJpG6Zzm16Ls
 yDzS5TUslt_dgKpCpDkhYJKIzwIjkf2prTOjJ7sYbIMkXmuMN6q7seUXoWu5_tFxHcpgrzMnpYyg
 hUFtHMjTM8oDPHCLsVk7.5FoSmANI2WSZbNGi86Rk2kr1RHDtj4_xiZ9CksB7kJKy_HuAtS6mMBA
 W07JWp2RBpGGbAxQEQd2bL.rG
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <23bdc704-7bf6-c3a1-755c-ad66bcb6695e@netscape.net>
Date: Mon, 6 Jun 2022 14:47:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
 <32638cee-de07-aa33-810b-534da4fa08ae@netscape.net>
In-Reply-To: <32638cee-de07-aa33-810b-534da4fa08ae@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20225 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 6/3/22 9:10 PM, Chuck Zmudzinski wrote:
> On 3/30/22 1:15 PM, Anthony PERARD wrote:
>> Hi Chuck,
>>
>> On Sun, Mar 13, 2022 at 11:41:37PM -0400, Chuck Zmudzinski wrote:
>>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>>> opregion to the guest but libxl does not grant the guest permission to
>> I'm not reading the same thing when looking at code in hvmloader. It
>> seems that hvmloader allocate some memory for the IGD opregion rather
>> than mapping it.
>>
>>
>> tools/firmware/hvmloader/pci.c:184
>>      if ( vendor_id == 0x8086 )
>>      {
>>          igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>>          /*
>>           * Write the the OpRegion offset to give the opregion
>>           * address to the device model. The device model will trap
>>           * and map the OpRegion at the give address.
>>           */
>>          pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>                     igd_opregion_pgbase << PAGE_SHIFT);
>>      }
>>
>> I think this write would go through QEMU, does it do something with it?
>> (I kind of replying to this question at the end of the mail.)
>>
>> Is this code in hvmloader actually run in your case?
>>
>>> Currently, because of another bug in Qemu upstream, this crash can
>>> only be reproduced using the traditional Qemu device model, and of
>> qemu-traditional is a bit old... What is the bug in QEMU? Do you have a
>> link to a patch/mail?

I finally found a patch that fixes the upstream bug on my system
but I am not sure it is the best fix. It is a patch that QubesOS has
been using since 2017.

I just opened an issue titled "Incorrect register mask for PCI
passthrough on Xen" with Qemu upstream about this problem
which gives all the details:

https://gitlab.com/qemu-project/qemu/-/issues/1061

When you get a chance, can you take a look at it?

Not being an official Xen or Qemu developer, I would appreciate
any suggestions you might have for me before I formally submit
a patch to Qemu upstream. Please reply here or on the Qemu issue
tracker.

Best Regards,

Chuck

>
> I finally found a patch for the other bug in Qemu upstream. The
> patch is currently being used in QubesOS, and they first added
> it to their version of Qemu way back in 2017:
>
> https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/3/commits/ab2b4c2ad02827a73c52ba561e9a921cc4bb227c 
>
>
> Although this patch is advertised as applying to the device model
> running in a Linux stub domain, it is also needed (at least on my
> system) with the device model running in Dom0.
>
> Here is the story:
>
> The patch is titled "qemu: fix wrong mask in pci capability registers 
> handling"
>
> There is scant information in the commit message about the nature of
> the problem, but I discovered the following in my testing:
>
> On my Intel Haswell system configured for PCI passthrough to the
> Xen HVM guest, Qemu does indeed incorrectly set the emulated
> register because it uses the wrong mask that disables instead of
> enables the PCI_STATUS_CAP_LIST bit of the PCI_STATUS register.
>
> This disabled the MSI-x capability of two of the three PCI devices
> passed through to the Xen HVM guest. The problem only
> manifests in a bad way in a Linux guest, not in a Windows guest.
>
> One possible reason that only Linux guests are affected is that
> I discovered in the Xen xl-dmesg verbose logs that Windows and
> Linux use different callbacks for interrupts:
>
> (XEN) Dom1 callback via changed to GSI 28
> ...
> (XEN) Dom3 callback via changed to Direct Vector 0xf3
>
> Dom1 is a Windows Xen HVM and Dom3 is a Linux HVM
>
> Apparently the Direct Vector callback that Linux uses requires
> MSI or MSI-x capability of the passed through devices, but the
> wrong mask in Qemu disables that capability.
>
> After applying the QubesOS patch to Qemu upstream, the
> PCI_STATUS_CAP_LIST bit is set correctly for the guest and
> PCI and Intel IGD passthrough works normally because the
> Linux guest can make use of the MSI-x capability of the
> PCI devices.
>
> The problem was discovered almost five years ago. I don't
> know why the fix has not been committed to Qemu
> upstream yet.
>
> After this, I was able to discover that the need for libxl to
> explicitly grant permission for access to the Intel OpRegion
> is only needed for the old traditional device model because
> the Xen hypercall to gain permission is included in upstream
> Qemu, but it is omitted from the old traditional device model.
>
> So this patch is not needed for users of the upstream device
> model who also add the QubesOS patch to fix the
> PCI_STATUS_CAP_LIST bit in the PCI_STATUS register.
>
> This all assumes the device model is running in Dom0. The
> permission for access to the Intel OpRegion might still be
> needed if the upstream device model is running in a stub
> domain.
>
> There are other problems in addition to this problem of access
> to the Intel OpRegion that are discussed here:
>
> https://www.qubes-os.org/news/2017/10/18/msi-support/
>
> As old as that post is, the feature of allowing PCI and VGA
> passthrough to HVM domains is still not well supported,
> especially for the case when the device model runs in a
> stub domain.
>
> Since my proposed patch only applies to the very insecure
> case of the old traditional device model running in Dom0,
> I will not pursue it further.
>
> I will look for this feature in future versions of Xen. Currently,
> Xen 4.16 advertises support for Linux-based stub domains
> as "Tech Preview." So future versions of Xen might handle
> this problem in libxl or perhaps in some other way, and also
> hopefully the patch to Qemu to fix the PCI capabilities mask
> can be committed to Qemu upstream soon so this feature
> of Intel IGD passthrough can at least work with Linux
> guests and the upstream Qemu running in Dom0.
>
> Regards,
>
> Chuck

