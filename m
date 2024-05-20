Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6408C9B52
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 12:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725991.1130269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s90HL-0003uW-UW; Mon, 20 May 2024 10:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725991.1130269; Mon, 20 May 2024 10:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s90HL-0003rF-Rl; Mon, 20 May 2024 10:30:03 +0000
Received: by outflank-mailman (input) for mailman id 725991;
 Mon, 20 May 2024 10:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s90HK-0003ei-Ud
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 10:30:02 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e96197d9-1693-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 12:30:00 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4202cea9a2fso18392875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 03:30:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fa9dbab53sm428386215e9.13.2024.05.20.03.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 03:29:59 -0700 (PDT)
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
X-Inumbo-ID: e96197d9-1693-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716201000; x=1716805800; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IfozEeetqNhwyMYjRgF4bQazCh9I8baeHjAw3Njqlew=;
        b=QsQcU6k18pwwgyOYLZmprrxylhKP4bsXubnP0kQ59capMhCJxKxm0J/ffnoFSElL9a
         pMn9jZbL6RTwmcTTwnMhDBHBHqfmAvPkKt8xLjpKR5Dfp/qt+Ij3JmiTRo3YjXrilDLs
         crE8HuIXf8E9jklIYK4U5VxiEQ8baLO0/cz38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716201000; x=1716805800;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfozEeetqNhwyMYjRgF4bQazCh9I8baeHjAw3Njqlew=;
        b=tMMMRTC0c53TDBPDL8EwWVFyPEVP0yxpO6MTM3TyI0s/cDLc8RN559FyqdRImCAAIY
         IkWBvxKrZVOFokFBuKBa4kUfusCk7Wn8fm5i4cZNzsknY/N0RQbKngeKDDiV87fov/QH
         u1wGxPGav97JGeZZLK4fe0+koRX+HW6j4Ue8HTqo0cVuVVNbyusYApc1CtMDNaMmRmf1
         f2PSQ9NigqUi3UXvGYScNxYoH5tG+A0WT8T7Ofb4uussU6TAiI3zn3yCwsqEAgOQT1N4
         eV+HSvaeO6C9aZPR4qhSy7Hy7dBSz9MT77denltpH5TPRiIF8I9rrUfnC6ZtXVcuIzZi
         Zu0Q==
X-Gm-Message-State: AOJu0YxS4nsS4gKb8cvgWGbTXVKvNK21M5QZmeSo/EZviit6eCPcX0fi
	bQXcKm/WsA1rEU9aw4EWU4B2MT254wJ25Oh75Xjeanr8icUEOTWdi+Ru6nuqknTRxu6RvU4kJbO
	b
X-Google-Smtp-Source: AGHT+IEFZHuRncKNMui18rlGOP3kAFWruMSa8pThjPgELR6Tv23bt+N8WbUTLcfC21VZiIImg2mm/Q==
X-Received: by 2002:a05:600c:1396:b0:418:ee30:3f92 with SMTP id 5b1f17b1804b1-41feac633cdmr222317915e9.25.1716200999664;
        Mon, 20 May 2024 03:29:59 -0700 (PDT)
Date: Mon, 20 May 2024 12:29:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Message-ID: <ZksmJp5JnQoBYZ6U@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>
 <ZjjQIaxEwS6b-swj@macbook>
 <24d52bbb-1329-4f8a-81be-505a35969875@suse.com>
 <Zjjg2ueqgjmn-MS3@macbook>
 <44af358a-9510-4056-826c-3be99dc25830@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44af358a-9510-4056-826c-3be99dc25830@suse.com>

On Wed, May 15, 2024 at 12:07:50PM +0200, Jan Beulich wrote:
> On 06.05.2024 15:53, Roger Pau Monné wrote:
> > On Mon, May 06, 2024 at 03:20:38PM +0200, Jan Beulich wrote:
> >> On 06.05.2024 14:42, Roger Pau Monné wrote:
> >>> On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
> >>>> Make the variable a tristate, with (as done elsewhere) a negative value
> >>>> meaning "default". Since all use sites need looking at, also rename it
> >>>> to match our usual "opt_*" pattern. While touching it, also move it to
> >>>> .data.ro_after_init.
> >>>
> >>> I guess I need to look at further patches, as given the feedback on
> >>> the past version I think we agreed we want to set ATS unconditionally
> >>> disabled by default, and hence I'm not sure I see the point of the
> >>> tri-state if enabling ATS will require an explicit opt-in on the
> >>> command line (ats=1).
> >>
> >> With the present wording in the VT-d spec (which we've now had vague
> >> indication that it may not be meant that way) there needs to be
> >> tristate behavior:
> >> - With "ats=0" ATS won't be used.
> >> - With "ats=1" ATS will be used for all ATS-capable devices.
> >> - Without either option ATS will be used for devices where firmware
> >>   mandates its use.
> > 
> > I'm afraid I don't agree to this behavior.  Regardless of what the
> > firmware requests ATS must only be enabled on user-request (iow: when
> > the ats=1 command line option is passed).  Otherwise ATS must remain
> > disabled for all devices.  It's not fine for firmware to trigger the
> > enabling of a feature that's not supported on Xen.
> 
> Well. On one hand I can see your point. Otoh with the spec still being the
> way it is, on systems mandating ATS use for at least one device we'd then
> simply need to deem Xen unsupported there altogether. The goal of the
> series, though, is to make things work as mandated by the spec on such
> systems, which to me implies we need to consider use of ATS supported in
> such cases (and only for those specific devices, i.e. still without
> considering use of "ats" on the command line supported).

I'm in general hesitant of ATS because I think it undermines the
security of PCI passthrough.  However this would still be acceptable
for dom0 because it's (usually?) part of the trusted base of a Xen
host.

If we want to make use of ATS for devices assigned to dom0 we should
clarify the warning in xen-command-line.pandoc.

We should also consider that dom0 usually does a lot of p2m
manipulations (by having to map grants and foreign pages).  Those will
result in p2m flushes that will lead to IOMMU flushes, and when using
ATS that will require device TLB flushes.  I wonder how much of an
overhead this will add to normal dom0 operations (plus the added risk
of those device TLB flushes stalling the IOMMU queue).

I would be much more comfortable with making the ats= command line
option a tri-state:

ats={0,1,mandatory}

Where the 'mandatory' option or equivalent enables ATS only for
devices that mandate it.  However I still think the default option
should be disabled for all devices.  If devices that require ATS are
found on the system I would use `warning_add()` to notify the user
of the need to consider adding ats=mandatory to the command line.

> If and when the spec was changed to clarify the flag is a performance hint,
> not a functional requirement, then we could do as you suggest. At which
> point, as mentioned before, opt_ats may be possible to become a plain
> boolean variable.

It's a complex situation, and I'm kind of surprised by the
introduction of this mandatory ATS requirement by Intel in a
non-backwards compatible way (as the specification claims the device
won't be functional without ATS enabled if required).

> >>>> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
> >>>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
> >>>>  
> >>>>          if ( use_ats(pdev, iommu, ivrs_dev) )
> >>>> -            dte->i = ats_enabled;
> >>>> +            dte->i = true;
> >>>
> >>> Might be easier to just use:
> >>>
> >>> dte->i = use_ats(pdev, iommu, ivrs_dev);
> >>
> >> I'm hesitant here, as in principle we might be overwriting a "true" by
> >> "false" then.
> > 
> > Hm, but that would be fine, what's the point in enabling the IOMMU to
> > reply to ATS requests if ATS is not enabled on the device?
> > 
> > IOW: overwriting a "true" with a "false" seem like the correct
> > behavior if it's based on the output of use_ats().
> 
> I don't think so, unless there were flow guarantees excluding the possibility
> of taking this path twice without intermediately disabling the device again.
> Down from here the enabling of ATS is gated on use_ats(). Hence if, in an
> earlier invocation, we enabled ATS (and set dte->i), we wouldn't turn off ATS
> below (there's only code to turn it on), yet with what you suggest we'd clear
> dte->i.

Please bear with me, I think I'm confused, why would use_ats(), and if
that's the case, don't we want to update dte->i so that it matches the
ATS state?

Otherwise we would fail to disable IOMMU device address translation
support if ATS was disabled?

> Thinking about it: Maybe your comment roots in you meaning to leverage here
> that use_ats() is not supposed to return different values for the same device,
> when invoked multiple times. If so, I'm afraid I'm hesitant to make use of
> such a property when I can easily avoid it.
> 
> >>>> @@ -43,7 +43,7 @@ static inline int pci_ats_enabled(int se
> >>>>  
> >>>>  static inline int pci_ats_device(int seg, int bus, int devfn)
> >>>>  {
> >>>> -    if ( !ats_enabled )
> >>>> +    if ( !opt_ats )
> >>>>          return 0;
> >>>
> >>> Can't you remove that check altogether now, since you are adding an
> >>> opt_ats check to use_ats()?
> >>
> >> Two reasons why not: For one this isn't AMD-specific code, and hence
> >> shouldn't be tied to the AMD-specific use_ats(). In principle VT-d
> >> code should be okay to call here, too. And then
> >> amd_iommu_disable_domain_device() doesn't use use_ats(), but does call
> >> here.
> > 
> > Oh, that's confusing, I didn't realize use_ats was AMD specific code.
> > It should have some kind of prefix to avoid this kind of confusion.
> 
> Hmm, the function being static in an AMD-only file, I would have thought that
> makes it clear enough that it's AMD-specific.

Yes, sure, I guess the name looked generic enough to be something that
could be shared across vendor implementations.

Thanks, Roger.

