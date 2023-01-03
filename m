Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C365C9CF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 23:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470778.730398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCqEY-000163-Dm; Tue, 03 Jan 2023 22:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470778.730398; Tue, 03 Jan 2023 22:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCqEY-00013S-AQ; Tue, 03 Jan 2023 22:58:14 +0000
Received: by outflank-mailman (input) for mailman id 470778;
 Tue, 03 Jan 2023 22:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Awo3=5A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pCqEW-00013M-0y
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 22:58:12 +0000
Received: from sonic307-8.consmr.mail.gq1.yahoo.com
 (sonic307-8.consmr.mail.gq1.yahoo.com [98.137.64.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15bb7a1e-8bba-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 23:58:07 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Tue, 3 Jan 2023 22:58:05 +0000
Received: by hermes--production-ne1-7b69748c4d-g8q5j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0f5dfd348dcdea8c73c8659aacf64335; 
 Tue, 03 Jan 2023 22:58:03 +0000 (UTC)
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
X-Inumbo-ID: 15bb7a1e-8bba-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672786685; bh=mj1hV3XKQIygCD5C9KFURA84Ye2W3J4D7Pbw0h3BRWA=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=oVLw59c2TpHpmBbmqkxVGh+rT0QahuIz5Kwu3F0cTm0BnxdWl5gMqpZxe84EQL2WUFg4ORFhLXXYnU6BjzTyxhrgCLA4ld+nIeHBCSOm51s7tue3kjRPWRkkVGwu5KU+jPW6v4SlflGTS771Ea/Fh7N9qYftEnMI1+l4L1j3p2nJcrwHztX/GxBHFSFhALY1GZ30rBNBmYqMWud3yGjE7rIrqqL16Q/R+ujs/w1p+9C1ezFjyJ4UihG1DRH9yOiK6ASlSHl90qs6Om/3woxlQ+/12lxNu/A4A1+xuQm+M2Pb4EY4EEdFbqN60dx3V/T5uFd8BVZzh/CH13z3yAW+AQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672786685; bh=WiuYg/8LnJwOnfok6Fmccn7n30Kdg+k73gk70EwdB92=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=n4kTffxFaPUi2qDYIzZilwOPEGgKbbVccVG0Um9oVZF/xBMv7Vkgz2STKSFbvIMCYplYb4V70da4km5LNhSQJS7UV6FTVJTZBGjVFy9KqWW4G9bqHDBRrvIsmg1cctQV3h98fY5gUs2+sbDZ+q+0tVDJUiubWWiD1TQUgCW9+Sv+H5lr+v2/3SxLL+q0aRFO1nHBbjyi2Q3ybniWyDzLTC6AZzEOzerZTIMl86SEN4PoTh0WMzb9sG0OlGZndwCIIDUgsw8iiMwbRnGLeeQBjYqoH/MT0/np5/37GVCoFuY6M+VhNyeYsMtCmDsYYEfTYtbGV0FNffjHvtrX/9BiIg==
X-YMail-OSG: q4EKH0wVM1mptllaHzGei_ILU8jAVyZuPHgXULVo9UBiHSGLwwc31Ply3EO5C_j
 wACY7Ozc2P.BmIh91qBKmgPSm_w0K.uq2avCrTNHwWPUcONjUMZmZhTD.iJPaYr0ofsqkbSXQxrW
 yI7fBHMqDDw7lkH6R2rmeJfLmZuVdSNANun7UwLC.X0eS96xMOQKVi3h1aQfC0hfE_mKg5QzRNJH
 _KvOX5hKqTrmQejreoA.zM2GDEOPCcKD.ftFbBYppPivdK7PaU0aHWGd3rS_2QmDMBFX2ISgAvi6
 VYod1cMb9Q.K7ZeWplt_2ORWMnlmXq54U8NVj68I0iJAgNhfgZ9cPS5.GtaJJq_rsrztZq.407q6
 SaDUe72dL66fjNW82fgyU8Hb3Qvcf2eWgPDzrNuuYOusgH1.pM8pUkizr2A0urEi6fG9zu83.hMF
 Uu1Z.z5gmKqZtb9EUvGsoMKqTyXssbrBmk38nNOu2jmgIITY84WoaCSYgfK6EFDOqoG8zPqOhW1B
 jeqjjYqWFj5dl86hkBwqBImFfVx6Fm52sQzjtm57_c1fQ4kezh3onY2uiJsVexxsdpqBcW0EFD4O
 7RGJY7c.Ye_mgreGmjhSq7loxnbtH7KX_mCMmO9Nw.Xrwhor5ErcgHIQ8MFSge2GBazCdCGPv249
 zI4sTBvaIQjXi8rZZvmC1mH6B6IrbHbu8pszTXFLHp.dEJ5NPFF3.FRcVuHrhQXQ2p63sRKstB7Y
 wqOzAeDx.3cIpoU4POhY2sHff3IGa4S8EHtj5taw7KqHuMbguRFl6Elx5oDKNYELXuBJyGHnWzNh
 6UhrYxbR0tba7icOFdY6UWbU86W.NNpwp.K2eQTKoza2sgXq3NE3xdkGU.9XFsd8OGx4Ykz_09rO
 jbkpPuTzxeyVbirGqNDMTlr_F0F_1N2VyIjJq8SkrGWwUw.GJDmBsIT30hk8A08zelBxAmZfgmcG
 a_Ze93VozORjSudR5nvwK6TQa7t5TNZ1Z9U7ZLTBiVoceC_CRElukLTnLeBdguuo688N7oqJq5R9
 4ZEJvpu36Ti_m2WX6RCsWuT3rT8uddUQzVfbK.VGVItJFaqaKczb7KTzhIKj9IsDrOjCeC.tnb3t
 OtB78VpZXKKtE8xSDGvvzm.dgPP91_7hBYuzZxzQdtCUXo9XacpIDm8KhUgCaU_VMxcDuf_Z1lhm
 PqkWln5DukOy2EU395DnU0rfaMKUQC2ETwdtA4oHUr1p7covCCWEggkl.MkKi9Nhs1diZ11KXwmB
 HiVy2elukJBMBG9SFcM59LO3Vq5gqo0eq6octYtyU1Ivj0BYesHwpI.lOTsWcgbVsDyW3Jvhu015
 ViiN0ZRgBd6Xkfbrf5Ro.OFXmU6j3EZyRZscdY.aopdIEVVDaXzjiZfyHVdg0x.6cfTfMMvoQEMT
 ubG4.ox9jnC2YKpIO.RNbVujqmWEYeScj7lKAbdEVdGWpSGhYlAN13Hlxdf5aGy.O6Oib4mayIf3
 getvbasKI899OX8sDSXYGrH1guctlqIPoZpt.dkwAdTZz_W6wlYlZapXPlXpvys.FIQUWkQAtNGe
 G5xlNLfnYyhFOFt_UfYMYtBgy7ePWgJc.wbk6AJ2lknqf31vK2I.CnOl2kVQQsPFOk84TG6r_VN0
 cO0iE0gC9Vv2FytA0M1Z0JGCSLi.gBzvEAov0ujaEVjEOxuidZZxtkzY_mCfAL3UngrbptbVTdPn
 32q3dkuwQix5QniG6pBCZqMGC61lMaNwj18r.LdombM1WOOrq.dIF2KuE7dnEUCwBaeRXvAXDZe.
 MDDsfxxnDSAbPHctZxxFYLcEpO5oBwT9Ue2CJhsApL0qFqmFHbeLmoqZE5epPi81_TmnuBg3o7L0
 DyNllDHNGMBoOP64A7.IKcvEUFiNDmpXf4dBgsB1Ditj4PSB98qt0umhviu_NfYRzeuLKV0Ty49_
 TJkZVXvUMQsjmlSYNr9_mkVVfagt.bZ8QQ6ypqg6Hhq02tEJOijwlfoqmvGgjiYrv3ZGJjWJ5jl5
 7rAcWotmCnwVU0TWrQohDjDwSNmckodQ_v1pp7pmudJhoQNKXTHjx0tUKpH645wUen8OovJyDsH7
 0XecIee8uKHH3tdaBSSzKkked2Op_60w9jWrPkEnT.1b5ivSa5_QJpheO4lXoZw9L8gZvhlToTq2
 Ud1OF9PCSVmvPOl4TKR9ep3rZbjZ1ISNFut_K4YE7pFdXcbp2wPY7nEqL.cqU.bCo253JwXaOk7I
 ODzkowUPjZrwGIitOBZbHnyEE39.atOM-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <ba4f8fd6-ae10-da60-7ef5-66782f29fdb9@aol.com>
Date: Tue, 3 Jan 2023 17:58:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
 <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
 <20230103081456.1d676b8e.alex.williamson@redhat.com>
 <cbfdcafc-383e-aea3-d04d-38388fab202f@aol.com>
In-Reply-To: <cbfdcafc-383e-aea3-d04d-38388fab202f@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/3/2023 4:50 PM, Chuck Zmudzinski wrote:
> On 1/3/2023 10:14 AM, Alex Williamson wrote:
> > On Mon, 2 Jan 2023 18:10:24 -0500
> > Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> >
> > > On 1/2/23 12:46 PM, Michael S. Tsirkin wrote:
> > > > On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:  
> > > > > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > > > > as noted in docs/igd-assign.txt in the Qemu source code.
> > > > > ... 
> > > > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>  
> > > >
> > > > I'm not sure why is the issue xen specific. Can you explain?
> > > > Doesn't it affect kvm too?  
> > > 
> > > Recall from docs/igd-assign.txt that there are two modes for
> > > igd passthrough: legacy and upt, and the igd needs to be
> > > at slot 2 only when using legacy mode which gives one
> > > single guest exclusive access to the Intel igd.
> > > 
> > > It's only xen specific insofar as xen does not have support
> > > for the upt mode so xen must use legacy mode which
> > > requires the igd to be at slot 2. I am not an expert with
> >
> > UPT mode never fully materialized for direct assignment, the folks at
> > Intel championing this scenario left.
>
> Thanks for clarifying that for me.
>
> >
> > > kvm, but if I understand correctly, with kvm one can use
> > > the upt mode with the Intel i915 kvmgt kernel module
> > > and in that case the guest will see a virtual Intel gpu
> > > that can be at any arbitrary slot when using kvmgt, and
> > > also, in that case, more than one guest can access the
> > > igd through the kvmgt kernel module.
> >
> > This is true, IIRC an Intel vGPU does not need to be in slot 2.
> >
> > > Again, I am not an expert and do not have as much
> > > experience with kvm, but if I understand correctly it is
> > > possible to use the legacy mode with kvm and I think you
> > > are correct that if one uses kvm in legacy mode and without
> > > using the Intel i915 kvmgt kernel module, then it would be
> > > necessary to reserve slot 2 for the igd on kvm.
> >
> > It's necessary to configure the assigned IGD at slot 2 to make it
> > functional, yes, but I don't really understand this notion of
> > "reserving" slot 2.  If something occupies address 00:02.0 in the
> > config, it's the user's or management tool's responsibility to move it
> > to make this configuration functional.  Why does QEMU need to play a
> > part in reserving this bus address.  IGD devices are not generally
> > hot-pluggable either, so it doesn't seem we need to reserve an address
> > in case an IGD device is added dynamically later.
>
> As I said in earlier message in this thread, the xenlight toolstack (libxl) that is
> provided as the default toolstack for building xen guests with pci passthrough
> is not the most flexible management tool, and that is why, in the case of xen,
> it is simpler to reserve slot 2 while qemu assigns the slot addresses of the
> qemu emulated pci devices so that the igd can use slot 2. IIRC, In hw/pci/pci.c,
> once the slot value is assigned, it is constant and cannot be changed later on
> by a management tool.
>
> >  
> > > Your question makes me curious, and I have not been able
> > > to determine if anyone has tried igd passthrough using
> > > legacy mode on kvm with recent versions of linux and qemu.
> >
> > Yes, it works.
> >
> > > I will try reproducing the problem on kvm in legacy mode with
> > > current versions of linux and qemu and report my findings.
> > > With kvm, there might be enough flexibility to specify the
> > > slot number for every pci device in the guest. Such a
> >
> > I think this is always the recommendation, libvirt will do this by
> > default in order to make sure the configuration is reproducible.  This
> > is what we generally rely on for kvm/vfio IGD assignment to place the
> > GPU at the correct address.
> >
> > > capability is not available using the xenlight toolstack
> > > for managing xen guests, so I have been using this patch
> > > to ensure that the Intel igd is at slot 2 with xen guests
> > > created by the xenlight toolstack.
> >
> > Seems like a deficiency in xenlight.  I'm not sure why QEMU should take
> > on this burden to support support tool stacks that lack such basic
> > features.
>
> So you would prefer to patch xenlight (libxl) to make it flexible enough to properly
> handle this case of legacy igd passthrough.
>
> >  
> > > The patch as is will only fix the problem on xen, so if the
> > > problem exists on kvm also, I agree that the patch should
> > > be modified to also fix it on kvm.
> >
> > AFAICT, it's not a problem on kvm/vfio because we generally make use of
> > invocations that specify bus addresses for each device by default,
> > making this a configuration requirement for the user or management tool
> > stack.  Thanks,
>
> Unfortunately, and as I mentioned in an earlier message on this thread,
> the xenlight management tool stack (libxl) is not so flexible and does not
> make it so easy for the administrator to specify the bus address of each
> device, and that is why either this patch is needed for igd legacy passtrhough
> on xen, or the libxl management tool needs to be patched so it is flexible
> enough to enable the slot addresses to be assigned correctly using
> that tool instead of relying on qemu to reserve slot 2 for the igd.
>
> If there is a consensus that this should be fixed in libxl instead of in qemu,
> I will work on a patch to libxl, but I will wait a while for some feedback from
> the xen people (Anthony, Paul) before I do that.

Hello Anthony and Paul,

I am requesting your feedback to Alex Williamson's suggestion that this
problem with assigning the correct slot address to the igd on xen should
be fixed in libxl instead of in qemu.

It seems to me that the xen folks and the kvm folks have two different
philosophies regarding how a tool stack should be designed. kvm/libvirt
provides much greater flexibility in configuring the guest which puts
the burden on the administrator to set all the options correctly for
a given feature set, while xen/xenlight does not provide so much
flexibility and tries to automatically configure the guest based on
a high-level feature option such as the igd-passthrough=on option that
is available for xen guests using qemu but not for kvm guests using
qemu.

What do you think? Should libxl be patched instead of fixing the problem
with this patch to qemu, which is contrary to Alex's suggestion?

Thanks in advance,

Chuck

