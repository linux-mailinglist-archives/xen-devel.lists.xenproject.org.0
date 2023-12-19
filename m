Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB5818D80
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 18:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657062.1025713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdZ6-0002NF-GZ; Tue, 19 Dec 2023 17:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657062.1025713; Tue, 19 Dec 2023 17:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdZ6-0002Ky-Di; Tue, 19 Dec 2023 17:07:32 +0000
Received: by outflank-mailman (input) for mailman id 657062;
 Tue, 19 Dec 2023 17:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rom3=H6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFdZ4-0002Kn-CR
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 17:07:30 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 173a285c-9e91-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 18:07:29 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336755f1688so619648f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 09:07:29 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b0040d18fdfe96sm3708741wmq.44.2023.12.19.09.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:07:27 -0800 (PST)
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
X-Inumbo-ID: 173a285c-9e91-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703005649; x=1703610449; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBQ8AHEZ1nE0Ff/rqbZrhyTISpcUQQu3s0Kbjtwe8Qw=;
        b=jNXnkjr3dDA/QeSrY5KNaTO1UBvUwjgLx/J22hDn5aHM0+sc4ERnbcoHq5V29kke8W
         WC+DC5YMZGRJUwMhPMDTQYhyw4Hat4Kgh17F4TzIZXNi4BBHrxi0Aq4pkXzXwH869qbK
         dSzfvm7vyhpsluh3Bj61wmTT5PKJSj0zkdQLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005649; x=1703610449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBQ8AHEZ1nE0Ff/rqbZrhyTISpcUQQu3s0Kbjtwe8Qw=;
        b=AkjT0Oiiqt/iwX8SF9B1HSM5NvtNcLSdFTrsLDMJns4Oso7fY31ZCIdZ74EI4JAJlA
         6Vid4MEd3W1b4RJCLy9kLuc5Uhh4vzcwriSoTsHxMw2JtJ6mBlwXgCZnJiO0zbwtyqTJ
         F9ku9jViaU9K65MgTeatEYnTNkzcBquv2YZ2KWWb7kyAMZJz2YTo10Qosl6Mr/YNunXL
         iQYHWByDBJQa/ziYb0r0berUP28LmVmTDgjS9Yv6dkEs0HkvU3ZqyBRw5Xh50ynqKYxE
         FVKlsD8ReVuGfhT3WXIN3XX28LVw6hlImiyzYCq7MvhB+h3eNyLoLcKk0TMHmwnNRKb7
         1pnQ==
X-Gm-Message-State: AOJu0Yw+2qhDo3Nz8jpf2PopqQusV0+C6G9nQYIhwd7ov26NbpP9hv0z
	GKnzRzLF5hZW2pbHz/KgSqHbFW6cKQZjAJj754k=
X-Google-Smtp-Source: AGHT+IEDCK+PdKJmnKBWE4qhZG1HusO8eyM02PvVD99cCLAezPeLNhJR+SNEONI7Hj0ujw+bj9/TrA==
X-Received: by 2002:a05:600c:2048:b0:40c:692f:3413 with SMTP id p8-20020a05600c204800b0040c692f3413mr4315829wmg.77.1703005648740;
        Tue, 19 Dec 2023 09:07:28 -0800 (PST)
Date: Tue, 19 Dec 2023 18:07:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Message-ID: <ZYHNzo8UFzOkt0pv@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com>
 <ZYCARJAxH9hBD0YQ@macbook>
 <6e022af1-d383-48be-ab54-6ec254aa1502@suse.com>
 <ZYGC8JaJ45tkbqQC@macbook>
 <aacaa220-3e95-4dff-9572-79f9e79faeae@suse.com>
 <ZYGyjQiAomxh0QnI@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZYGyjQiAomxh0QnI@macbook>

On Tue, Dec 19, 2023 at 04:11:09PM +0100, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 03:06:50PM +0100, Jan Beulich wrote:
> > On 19.12.2023 12:48, Roger Pau Monné wrote:
> > > On Tue, Dec 19, 2023 at 10:56:16AM +0100, Jan Beulich wrote:
> > >> On 18.12.2023 18:24, Roger Pau Monné wrote:
> > >>> On Tue, Feb 14, 2023 at 05:12:08PM +0100, Jan Beulich wrote:
> > >>>> --- a/xen/arch/x86/pv/domain.c
> > >>>> +++ b/xen/arch/x86/pv/domain.c
> > >>>> @@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
> > >>>>  void toggle_guest_mode(struct vcpu *v)
> > >>>>  {
> > >>>>      const struct domain *d = v->domain;
> > >>>> +    struct cpu_info *cpu_info = get_cpu_info();
> > >>>>      unsigned long gs_base;
> > >>>>  
> > >>>>      ASSERT(!is_pv_32bit_vcpu(v));
> > >>>> @@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
> > >>>>      if ( v->arch.flags & TF_kernel_mode )
> > >>>>          v->arch.pv.gs_base_kernel = gs_base;
> > >>>>      else
> > >>>> +    {
> > >>>>          v->arch.pv.gs_base_user = gs_base;
> > >>>> +
> > >>>> +        if ( opt_ibpb_mode_switch &&
> > >>>> +             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
> > >>>> +             !VM_ASSIST(d, mode_switch_no_ibpb) )
> > >>>> +            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;
> > >>>
> > >>> Likewise similar to the remarks I've made before, if doing an IBPB on
> > >>> entry is enough to cover for the case here, it must also be fine to
> > >>> issue the IBPB right here, instead of deferring to return to guest
> > >>> context?
> > >>>
> > >>> The only concern would be (as you mentioned before) to avoid clearing
> > >>> valid Xen predictions, but I would rather see some figures about what
> > >>> effect the delaying to return to guest has vs issuing it right here.
> > >>
> > >> Part of the reason (aiui) to do things on the exit path was to
> > >> consolidate the context switch induced one and the user->kernel switch
> > >> one into the same place and mechanism.
> > > 
> > > Isn't it kind of a very specific case that we end up doing a
> > > user->kernel switch as part of a context switch?  IOW: would require
> > > the vCPU to be scheduled out at that very specific point.
> > 
> > No, there's no user->kernel switch at the same time as context switch.
> > What I was trying to explain is that with the actual IBPB being issued
> > on exit to guest, both the context switch path and the user->kernel
> > mode switch path set the same indicator, for the exit path to consume.
> 
> Deferring to exit to guest path could be OK, but unless strictly
> needed, which I don't think it's the case, I would request for IBPB to
> be executed in C context rather than assembly one.
> 
> > >>>> + *
> > >>>> + * By default (on affected and capable hardware) as a safety measure Xen,
> > >>>> + * to cover for the fact that guest-kernel and guest-user modes are both
> > >>>> + * running in ring 3 (and hence share prediction context), would issue a
> > >>>> + * barrier for user->kernel mode switches of PV guests.
> > >>>> + */
> > >>>> +#define VMASST_TYPE_mode_switch_no_ibpb  33
> > >>>
> > >>> Would it be possible to define the assist as
> > >>> VMASST_TYPE_mode_switch_ibpb and have it on when enabled?  So that the
> > >>> guest would disable it if unneeded?  IMO negated options are in
> > >>> general harder to understand.
> > >>
> > >> Negative options aren't nice, yes, but VM assists start out as all
> > >> clear.
> > > 
> > > Are you sure?  I see VMASST_TYPE_pae_extended_cr3 getting set in
> > > dom0_construct_pv() and that makes me wonder whether other bits
> > > couldn't start set also.
> > > 
> > > Maybe there's some restriction I'm missing, but I don't see any
> > > wording in the description of the interface that states that all
> > > assists are supposed to start disabled.
> > 
> > Well, that setting of pae_extended_cr3 is in response to the kernel's
> > notes section having a respective indicator. So we still only set the
> > bit in response to what the kernel's asking us to do, just that here
> > we carry out the request ahead of launching the kernel.
> > 
> > Also consider what would happen during migration if there was a
> > default-on assist: At the destination we can't know whether the
> > source simply didn't know of the bit, or whether the guest elected to
> > clear it.
> 
> Hm, I see, so I was indeed missing that aspect.  VM assist is passed
> as a plain bitmap, and there's no signal on which assists the VM had
> available on the source side if not enabled.

Sorry, please bear with me, as I've been further thinking about this.

Why does the assist needs to be default-on?  It's my understanding
that the guest can execute the IBPB itself by writing to the MSR, but
that's suboptimal in the user -> kernel context switch as it then
involves two traps into Xen, but the guest is not left insecure, it
just needs to write the MSR itself like on native.

In fact, if we add an IBPB by default as part of amd64 PV user ->
kernel guest context switch, we are likely doing a double IBPB on
guests not aware of the assist.

IOW: I don't know why doing the assist as guest opt-in would be
insecure, in fact I think it's the best approach (again I might be
missing something).

Thanks, Roger.

