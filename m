Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5D65C2D5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 16:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470645.730211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCj0O-0005er-A6; Tue, 03 Jan 2023 15:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470645.730211; Tue, 03 Jan 2023 15:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCj0O-0005bz-6u; Tue, 03 Jan 2023 15:15:08 +0000
Received: by outflank-mailman (input) for mailman id 470645;
 Tue, 03 Jan 2023 15:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWpM=5A=redhat.com=alex.williamson@srs-se1.protection.inumbo.net>)
 id 1pCj0M-0005bt-8b
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 15:15:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65b57108-8b79-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 16:15:04 +0100 (CET)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-I2NBm3HZPaKoWNPYrnMZpw-1; Tue, 03 Jan 2023 10:14:59 -0500
Received: by mail-il1-f199.google.com with SMTP id
 n15-20020a056e021baf00b0030387c2e1d3so19417872ili.5
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jan 2023 07:14:59 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v17-20020a02b091000000b00356738a2aa2sm9895119jah.55.2023.01.03.07.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 07:14:57 -0800 (PST)
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
X-Inumbo-ID: 65b57108-8b79-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672758903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C3N3hWqoUvt4wQQ24fzp8QfU4qA5jURytjfdBX+cwQ=;
	b=Qef+lj1tCgVPMgWr+qqywfKx/t002r3ZtY/4bSo0eIdt/S74B6rAl4fOoBElYs+Bc53eKn
	5UvtyfqWYN+dAAOaoeVbAEif6QD9QigvCOg99lDktA3f4y5VN3HLwAyt7SzpiL1LjIBYS/
	eVR+Ne+ZbHH381qKHEHKjzGEXz0t9Gw=
X-MC-Unique: I2NBm3HZPaKoWNPYrnMZpw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3C3N3hWqoUvt4wQQ24fzp8QfU4qA5jURytjfdBX+cwQ=;
        b=OJsYPioBZurw/AaMGH6n7PjybIYwr2pky+LiOt3X0KTNj4IT2JBHNlLTwPhymggXxk
         ++EattZ5mb6/tPK6286KH+AjtQcc6+Ni1AdP5XyBOAf0WFIjYNBJP8I5xB2dBbovrb0h
         j7f1vAS3FmdQuW2ZZgRyGzWIyWjbwXo57HfrCKMDaN+ulKIha7N+pzShAlX1y3x5R7Fy
         PObsWHbpOs861G+alMWRnGQ1SC8m3vUiOxwrtkyfp0SuObAefJhD97lqv4wLyMurHAvl
         +xUjq3zqz5XhTAW6pEBhYDni0aHW2lyyAJELgUFoswmcdpSBlrAoQCl/2g9NXi62H7LY
         b/zg==
X-Gm-Message-State: AFqh2kpNm5PSFXewLKfJbekrbmlMRBiDuNf1p9y03CDpn0fefeYo//H8
	OEjnyBAYVOa/vC7TCNH97Xa0q7QHg9NPaGSelBEHMYSjEfTce4OgCfP1q0DJiBtpXkFmlcMGkNq
	lnINrVrC16Udt7pcHcI+blQwxE0w=
X-Received: by 2002:a92:b745:0:b0:304:c04b:c184 with SMTP id c5-20020a92b745000000b00304c04bc184mr30283020ilm.28.1672758899079;
        Tue, 03 Jan 2023 07:14:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv34XF6KPgrepazk8naDtFk/N6HqJkq8zkS1urCN22H3/wO2mCbFnxpkHrBAKNgBTuqKEFBxA==
X-Received: by 2002:a92:b745:0:b0:304:c04b:c184 with SMTP id c5-20020a92b745000000b00304c04bc184mr30283006ilm.28.1672758898748;
        Tue, 03 Jan 2023 07:14:58 -0800 (PST)
Date: Tue, 3 Jan 2023 08:14:56 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230103081456.1d676b8e.alex.williamson@redhat.com>
In-Reply-To: <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
	<830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
	<20230102124605-mutt-send-email-mst@kernel.org>
	<c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Jan 2023 18:10:24 -0500
Chuck Zmudzinski <brchuckz@netscape.net> wrote:

> On 1/2/23 12:46 PM, Michael S. Tsirkin wrote:
> > On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:  
> > > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > > as noted in docs/igd-assign.txt in the Qemu source code.
> > > 
> > > Currently, when the xl toolstack is used to configure a Xen HVM guest with
> > > Intel IGD passthrough to the guest with the Qemu upstream device model,
> > > a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> > > a different slot. This problem often prevents the guest from booting.
> > > 
> > > The only available workaround is not good: Configure Xen HVM guests to use
> > > the old and no longer maintained Qemu traditional device model available
> > > from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> > > 
> > > To implement this feature in the Qemu upstream device model for Xen HVM
> > > guests, introduce the following new functions, types, and macros:
> > > 
> > > * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> > > * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> > > * typedef XenPTQdevRealize function pointer
> > > * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> > > * xen_igd_reserve_slot and xen_igd_clear_slot functions
> > > 
> > > The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> > > member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> > > the xl toolstack with the gfx_passthru option enabled, which sets the
> > > igd-passthru=on option to Qemu for the Xen HVM machine type.
> > > 
> > > The new xen_igd_reserve_slot function also needs to be implemented in
> > > hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> > > when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> > > in which case it does nothing.
> > > 
> > > The new xen_igd_clear_slot function overrides qdev->realize of the parent
> > > PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> > > since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> > > created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> > > 
> > > Move the call to xen_host_pci_device_get, and the associated error
> > > handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> > > initialize the device class and vendor values which enables the checks for
> > > the Intel IGD to succeed. The verification that the host device is an
> > > Intel IGD to be passed through is done by checking the domain, bus, slot,
> > > and function values as well as by checking that gfx_passthru is enabled,
> > > the device class is VGA, and the device vendor in Intel.
> > > 
> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>  
> >
> > I'm not sure why is the issue xen specific. Can you explain?
> > Doesn't it affect kvm too?  
> 
> Recall from docs/igd-assign.txt that there are two modes for
> igd passthrough: legacy and upt, and the igd needs to be
> at slot 2 only when using legacy mode which gives one
> single guest exclusive access to the Intel igd.
> 
> It's only xen specific insofar as xen does not have support
> for the upt mode so xen must use legacy mode which
> requires the igd to be at slot 2. I am not an expert with

UPT mode never fully materialized for direct assignment, the folks at
Intel championing this scenario left.

> kvm, but if I understand correctly, with kvm one can use
> the upt mode with the Intel i915 kvmgt kernel module
> and in that case the guest will see a virtual Intel gpu
> that can be at any arbitrary slot when using kvmgt, and
> also, in that case, more than one guest can access the
> igd through the kvmgt kernel module.

This is true, IIRC an Intel vGPU does not need to be in slot 2.

> Again, I am not an expert and do not have as much
> experience with kvm, but if I understand correctly it is
> possible to use the legacy mode with kvm and I think you
> are correct that if one uses kvm in legacy mode and without
> using the Intel i915 kvmgt kernel module, then it would be
> necessary to reserve slot 2 for the igd on kvm.

It's necessary to configure the assigned IGD at slot 2 to make it
functional, yes, but I don't really understand this notion of
"reserving" slot 2.  If something occupies address 00:02.0 in the
config, it's the user's or management tool's responsibility to move it
to make this configuration functional.  Why does QEMU need to play a
part in reserving this bus address.  IGD devices are not generally
hot-pluggable either, so it doesn't seem we need to reserve an address
in case an IGD device is added dynamically later.
 
> Your question makes me curious, and I have not been able
> to determine if anyone has tried igd passthrough using
> legacy mode on kvm with recent versions of linux and qemu.

Yes, it works.

> I will try reproducing the problem on kvm in legacy mode with
> current versions of linux and qemu and report my findings.
> With kvm, there might be enough flexibility to specify the
> slot number for every pci device in the guest. Such a

I think this is always the recommendation, libvirt will do this by
default in order to make sure the configuration is reproducible.  This
is what we generally rely on for kvm/vfio IGD assignment to place the
GPU at the correct address.

> capability is not available using the xenlight toolstack
> for managing xen guests, so I have been using this patch
> to ensure that the Intel igd is at slot 2 with xen guests
> created by the xenlight toolstack.

Seems like a deficiency in xenlight.  I'm not sure why QEMU should take
on this burden to support support tool stacks that lack such basic
features.
 
> The patch as is will only fix the problem on xen, so if the
> problem exists on kvm also, I agree that the patch should
> be modified to also fix it on kvm.

AFAICT, it's not a problem on kvm/vfio because we generally make use of
invocations that specify bus addresses for each device by default,
making this a configuration requirement for the user or management tool
stack.  Thanks,

Alex


