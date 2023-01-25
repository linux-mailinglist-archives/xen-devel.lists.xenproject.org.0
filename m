Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD767C0B8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 00:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484648.751338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKp3j-0003YE-Mh; Wed, 25 Jan 2023 23:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484648.751338; Wed, 25 Jan 2023 23:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKp3j-0003X3-Hq; Wed, 25 Jan 2023 23:20:03 +0000
Received: by outflank-mailman (input) for mailman id 484648;
 Wed, 25 Jan 2023 23:20:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7BNa=5W=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pKp3h-0003Fi-Rq
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 23:20:02 +0000
Received: from sonic314-20.consmr.mail.gq1.yahoo.com
 (sonic314-20.consmr.mail.gq1.yahoo.com [98.137.69.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c844030c-9d06-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 00:19:59 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 25 Jan 2023 23:19:56 +0000
Received: by hermes--production-ne1-746bc6c6c4-8sf8l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c284c3e27cd5358d47453ecd001766b3; 
 Wed, 25 Jan 2023 23:19:52 +0000 (UTC)
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
X-Inumbo-ID: c844030c-9d06-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674688796; bh=NuTLbxWBAWRYcSkweCeIPV+fWnHo6x+Ljugv1fLZfOM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=TXTdXgDt7k4s6iyBiG/AEdHho2fWovtCfTlI3btGhNoi+b4IIyYuNQRa6aQkC660atlwNbg4z4vqDYgnB5uSdNuTd1Yjc6QMS8z7Y2ZNvjHVoyqdLdHX55WwJ6wUzYkze8JZ6yvUjtue9GqWLC3cNq5rrOQV84KrQlJnN7wvdxLA31oFQ558WjhYe4POB7vP/jPaRPNvsy1gLSYxisaRFA+NfmfPx+spB9XKcB4sRv0sZvFjKSaX6zt5L7k/U6V0JzC8HF9JITVQKXItFDRu1B+/OAzDB+EM5+bTtrgFhCf9jNlkn11SZ2qXMCVwxjaE/U9/XmNQZLMXypNU3LhObA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674688796; bh=5KKl7DiXO3ks0SHkucflRuHXrE5+TembJgJ8JFt4FZ3=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=RmVUsSNJqEu8EzaUGaTXuyD9Ye6RdCqphmoSWU5a90yTLjnhUxz1X1JTgJQ72LIKpdC4ksu5jTRhkpHrk3nepXYJvIoKAqWoHf1cCLJXynxS9hVZNYgdChA7WO/VhOQKdWUr5V4qv8QAhKP3CzhI3vIPQq9vf7/dO1dp9JttUzhAjNYc0wQYbNmiDeVCrAbdkgX2a8SK3zqc8lpgCBleqZWFcxXVztYKlopMsRRsLCW9Wyal2YeP//VoWhbFf0GLg+zQQMGB5MZMvkWxFCv15wfSx8cROkj/PnlOsDIwtquw4uxWMhvzyE3pxoS/nojvVM/42j7yXWkix0ND39Mx5Q==
X-YMail-OSG: Nm0aPdsVM1mOjbka2hdwLWy13dOEar7Y2.wjMSgW6ndIRAJKOi9MY5rifF_v0oM
 ipf1jzPy8TuShe8rMZDXEe8kK99.w7_J4dkmFacf.A8DWCGn7uuml4aBijRzxnc2iB39kIaWkN2b
 Q71MDT_p7lVekknXhwXqRzIfXLIdN11s_pCXkyvgxoDNiDoKRRIzu.OZLxhBICqQtFjLR81RsiAp
 0yNJCQBzSnzCIPpbvGYTe8F1fVyIpgbWoBp0q0Wt7Se25UnSrxlIJ.c3YbnitwctlPz32b__2crS
 UWSrvWgb_D5w3u2jv3pauqRF80GOVuxS9trAXypR2T4NYv5rHywTOSLboBAoFgxO6B5T574IzpYH
 FwuyeQBZFGIt08w8ZIER.GPnlOtMUIcFWiV51q4go4F2_FA3oaf_JMUV6xX48hSxpcpibNCeSmYo
 UEMIHZo8oWF1cFmDehaV3uHunShqWWnrkLXQO_WsEEyxAcksjcGMle3G3CDubThacwGXsh0cC.st
 jUSCwfPMWktwrVLZYPgm6u0x3OzwmyD3_DTucEzjx7ij0Xh5L2RZlRUzJABIZXlaTwjy9C4h9Oe_
 vj1E3py6uQNDUt8p0Y5lZb4dcWOm7FX6V6ER4n7bfozxQF9pUvgdQSGHT35E1ObLFgcDeBYXywvq
 m7_FVpofeARqAX6mkmt3mieBQ_zTEBeMSCZBqXBL5nisA5pKtiFmdgM_XgG8T3Mh8Vhj9ync19.j
 JQkjz9m.PXeYMwq9EZmBv8QnPMza9bABM8b.liQTL8KZwPPsN3W16nvOZzkp7LJ_Cn.RmEn0SG6_
 UiftYIJDP3mHBKSpn1fAXmpwRlPF9L3JCfGy.IF0Y13fh_LeQtaszcDw_A1XoQCmLi.ueCjFvwM_
 LkO3szmrwUKj0fMAxaAdfYkrblue7NOaAJodQnxqZl98hDam9VomNYWZJqHAHTqlSmFnupGZIBoS
 3dyPFxDd.8ZG2EDa4rlzwSeIMGWEqFf561HM8aRt2nimosc0a0_zOuN8cmdd_h.Cqg6VgyyhCFuT
 ilQlzU3FhDI47K6VWw0ZFMwi2ngmOFHXpb1Ql1hOnCvgoDCQpVUkjoRk2rYO_XhoD514VGrw3ovt
 mZKk5nAn2f2zU2PTzkNy741l6_.YapYs5Fe62gkD.echfW07fPO_8lgg_5bGeId6Wc8lhHaEEcYo
 nHMBfILUIjPvp2mpWHHE0jXMfFhIrkBL61UvLPE5uJ1qOh3dHTkaMc9m29A2nccjgZ8cAhSWQY9O
 2ONJB9n3tponEe5fUJbsSlB0gvnkPRHH.o1gEuplIGJ8P9V5gS1xLQEXMLrqRoEKelYisdIQeTpy
 0iTCpA7V3w14uIrGK9S7ia8C0XslBW9kpCSwTbIscIB3pgduvTlZBHLholo7KoOq2S.zvfzEUhdJ
 L8.JGDOzXbNB2aV11yFvDAgitCIMe2pjZ4rCvmkvoRbqEo4ZhL16VynX3oW1C3KCSqhp8L.um1em
 5kg8IBLem.Aw2QEyvD.yiww9jqLD3yMlwXHpyrMJPHsnIVzlyQvVeVZ8EgXW2ygWjzjZSvee_TKv
 Flo5OKBHb3dhdtvu3FY8LxuMi7e48IrHbCwUvRcRxt_ITFo3p6y.sXk7HgSNotvSPRfnmYmTLgV3
 f7JNEp9Bzzw1CzBY0_73kYrBZQFKYGnOklfN6SK4yrHb0zWKfQrLlk6gq8yD..TPA1xa7dORYK3e
 vtaGS0dXGXfNGKzT1x47cs9aHlsLxUSJ0oTKuWuEk2.ari5VvuaDFsy2E5GdMfRIFW.qy3uDDqwR
 VXfzsnhNFtnLklwMqY.hfNpfTfgGhmXOn2b2J3pHXyI7jYcNKutw8pbSy8wPBWSKqgP3YqnkuZQw
 XmZVL320cQmf1REBNgMaTRKvRIm_EtFU7bOXtOcVlAxecSZhSrEJdaJJTDLq8ccfmbld80j1r3LQ
 wHTF4dXr1elh6pWrRhi_3zSdc5MKM_BD2A6xrgIBFVqP9PzX56C280hAzYfwmVWawf_5FTAIQrWZ
 uj6o4YOEpXmvpgleQhbEiix_9_ngnZuwvb.f_5vwxIPkvwlw.sUJUQyfLVVOnUZg61I9.5TK9gVD
 UPq1RqelQzypRJw_ymj3BQX31AwN3Yt4vvry4o6lUqVIhRmb4KrXzEd3ukp10PC5t9gwpfdOX8ol
 zWTyYn6ovkO5ciWFcbxSyMM__Hn1JI3H31XqobJuNZYWqYeyJWyXMm_edfTbzH5aqhMiL9uORCCJ
 8v_wL1p.y
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <de3a3992-8f56-086a-e19e-bac9233d4265@aol.com>
Date: Wed, 25 Jan 2023 18:19:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH v2 0/3] Configure qemu upstream correctly by default
 for igd-passthru
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
References: <cover.1673300848.git.brchuckz.ref@aol.com>
 <cover.1673300848.git.brchuckz@aol.com>
 <Y9EUarVVWr223API@perard.uk.xensource.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <Y9EUarVVWr223API@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21096 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/25/2023 6:37 AM, Anthony PERARD wrote:
> On Tue, Jan 10, 2023 at 02:32:01AM -0500, Chuck Zmudzinski wrote:
> > I call attention to the commit message of the first patch which points
> > out that using the "pc" machine and adding the xen platform device on
> > the qemu upstream command line is not functionally equivalent to using
> > the "xenfv" machine which automatically adds the xen platform device
> > earlier in the guest creation process. As a result, there is a noticeable
> > reduction in the performance of the guest during startup with the "pc"
> > machne type even if the xen platform device is added via the qemu
> > command line options, although eventually both Linux and Windows guests
> > perform equally well once the guest operating system is fully loaded.
>
> There shouldn't be a difference between "xenfv" machine or using the
> "pc" machine while adding the "xen-platform" device, at least with
> regards to access to disk or network.
>
> The first patch of the series is using the "pc" machine without any
> "xen-platform" device, so we can't compare startup performance based on
> that.
>
> > Specifically, startup time is longer and neither the grub vga drivers
> > nor the windows vga drivers in early startup perform as well when the
> > xen platform device is added via the qemu command line instead of being
> > added immediately after the other emulated i440fx pci devices when the
> > "xenfv" machine type is used.
>
> The "xen-platform" device is mostly an hint to a guest that they can use
> pv-disk and pv-network devices. I don't think it would change anything
> with regards to graphics.
>
> > For example, when using the "pc" machine, which adds the xen platform
> > device using a command line option, the Linux guest could not display
> > the grub boot menu at the native resolution of the monitor, but with the
> > "xenfv" machine, the grub menu is displayed at the full 1920x1080
> > native resolution of the monitor for testing. So improved startup
> > performance is an advantage for the patch for qemu.
>
> I've just found out that when doing IGD passthrough, both machine
> "xenfv" and "pc" are much more different than I though ... :-(
> pc_xen_hvm_init_pci() in QEMU changes the pci-host device, which in
> turns copy some informations from the real host bridge.
> I guess this new host bridge help when the firmware setup the graphic
> for grub.

I am surprised it works at all with the "pc" machine, that is, without the
TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE that is used in the "xenfv"
machine. This only seems to affect the legacy grub vga driver and the legacy
Windows vga driver during early boot. Still, I much prefer keeping the "xenfv"
machine for Intel IGD than this workaround of patching libxl to use the "pc"
machine.

>
> > I also call attention to the last point of the commit message of the
> > second patch and the comments for reviewers section of the second patch.
> > This approach, as opposed to fixing this in qemu upstream, makes
> > maintaining the code in libxl__build_device_model_args_new more
> > difficult and therefore increases the chances of problems caused by
> > coding errors and typos for users of libxl. So that is another advantage
> > of the patch for qemu.
>
> We would just needs to use a different approach in libxl when generating
> the command line. We could probably avoid duplications. I was hopping to
> have patch series for libxl that would change the machine used to start
> using "pc" instead of "xenfv" for all configurations, but based on the
> point above (IGD specific change to "xenfv"), then I guess we can't
> really do anything from libxl to fix IGD passthrough.

We could switch to the "pc" machine, but we would need to patch
qemu also so the "pc" machine uses the special device the "xenfv"
machine uses (TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE).
So it is simpler to just use the other patch to qemu and not patch
libxl at all to fix this.

>
> > OTOH, fixing this in qemu causes newer qemu versions to behave
> > differently than previous versions of qemu, which the qemu community
> > does not like, although they seem OK with the other patch since it only
> > affects qemu "xenfv" machine types, but they do not want the patch to
> > affect toolstacks like libvirt that do not use qemu upstream's
> > autoconfiguration options as much as libxl does, and, of course, libvirt
> > can manage qemu "xenfv" machines so exising "xenfv" guests configured
> > manually by libvirt could be adversely affected by the patch to qemu,
> > but only if those same guests are also configured for igd-passthrough,
> > which is likely a very small number of possibly affected libvirt users
> > of qemu.
> > 
> > A year or two ago I tried to configure guests for pci passthrough on xen
> > using libvirt's tool to convert a libxl xl.cfg file to libvirt xml. It
> > could not convert an xl.cfg file with a configuration item
> > pci = [ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...] for pci passthrough.
> > So it is unlikely there are any users out there using libvirt to
> > configure xen hvm guests for igd passthrough on xen, and those are the
> > only users that could be adversely affected by the simpler patch to qemu
> > to fix this.
>
> FYI, libvirt should be using libxl to create guest, I don't think there
> is another way for libvirt to create xen guests.
>
>
>
> So overall, unfortunately the "pc" machine in QEMU isn't suitable to do
> IGD passthrough as the "xenfv" machine has already some workaround to
> make IGD work and just need some more.
>
> I've seen that the patch for QEMU is now reviewed, so I look at having
> it merged soonish.
>
> Thanks,
>


