Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061478D5E00
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733511.1139822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyMZ-0000wN-Mu; Fri, 31 May 2024 09:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733511.1139822; Fri, 31 May 2024 09:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyMZ-0000ta-Jc; Fri, 31 May 2024 09:15:51 +0000
Received: by outflank-mailman (input) for mailman id 733511;
 Fri, 31 May 2024 09:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFcc=NC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCyMX-0000tU-NL
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:15:49 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dd67fae-1f2e-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 11:15:47 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-35dcc681f70so662605f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:15:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04ca9bbsm1419317f8f.31.2024.05.31.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 02:15:46 -0700 (PDT)
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
X-Inumbo-ID: 5dd67fae-1f2e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717146947; x=1717751747; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=paCibT1IHYwx84XcJTJRVtmEMs2s09+dbMnVZuM2qLY=;
        b=d4SUI8bsx7Gui9TXMneywMrt61Qxx3nygzSwcUXoDIT11r0ERHYdKehlTtvTTBS/5O
         Yctql75izk1YUWey1DUpfqLP0pgrimMPcnpYUrqMsnFOsaqIFLZPIP8Ubfgc/4P5KIGD
         iHQhbj7hByzzshVhb0+vRrKzFTsAdUK0HD6xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146947; x=1717751747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paCibT1IHYwx84XcJTJRVtmEMs2s09+dbMnVZuM2qLY=;
        b=QD08DCPwSQ4trYbn8uq/E4YakdUkbSXtJcqfcWifiNqDjOIMY7jarD/4YIrxZcndpT
         J7nxcntfcs11dRVJejiQbdcKZRl8qW423yvOR7v9GIHZya3dm//dL08AYXC5DPUQamip
         4JuHxGYWOALBsCKS5RxksOnrHZ8Dtn2q1dG6xZ1ASOEa2djKY++V0VUjuz1EyqjNKzL8
         JlOwj+FVkBoO02KKAUc+vnxwrZov7yVYNEot3jORrmOVMCYF0fk1/vYWj40/Cr6/S+Ft
         XUohTukSx7q7THewPjin/O9VeSkZnGaa6MuSg5TtjqJQ6KTKZTY2qGNAA9U+TmA90UM3
         /+jg==
X-Forwarded-Encrypted: i=1; AJvYcCV2XW9rgRhsyyfNtWdcAY7aXsdFlUfajjXco+rUynKC4ixW/TRWzJWFWU/iyghQ3fPBA5ZnX8OA4jIq0/aqJQuQrkL6Pl/b9ndSTdT9i70=
X-Gm-Message-State: AOJu0Yx+7xjRp38DtlhvOdizr7K9whz+1WD1SM5EZRQVeWX+sd5lLQnm
	qcX37zi1plMgd0BTkRDJvmNE3FpzEgFMuXYFUCt7DWb+hXmH2U9PZJ2F1iQR8g8=
X-Google-Smtp-Source: AGHT+IG9h5ZvRnitqCSpawB+uRqQmxw24ER3YfXL0mYTtp0mnoSO9u6/ApbJalQT7Tk+y2gHOXCkUg==
X-Received: by 2002:a5d:68c6:0:b0:34f:f540:bdbc with SMTP id ffacd0b85a97d-35e0f2892aamr807792f8f.38.1717146946895;
        Fri, 31 May 2024 02:15:46 -0700 (PDT)
Date: Fri, 31 May 2024 11:15:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 3/9] xen/cpu: ensure get_cpu_maps() returns
 false if CPU operations are underway
Message-ID: <ZlmVQW_zptkm_n1d@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-4-roger.pau@citrix.com>
 <597b0bf9-8949-41f3-a630-18937c219d8b@suse.com>
 <ZldDvH8GhhQcu5NX@macbook>
 <3ccdfec3-924a-4ef0-bf8d-653b6019aecb@suse.com>
 <ZldUgJRJvytRsjhu@macbook>
 <075168de-1a3f-4f23-a445-8ba74082fb8f@suse.com>
 <Zll8xQJiM83EZhTd@macbook>
 <e39c9e0c-2596-483f-a82d-86d424717081@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e39c9e0c-2596-483f-a82d-86d424717081@suse.com>

On Fri, May 31, 2024 at 10:33:58AM +0200, Jan Beulich wrote:
> On 31.05.2024 09:31, Roger Pau Monné wrote:
> > On Fri, May 31, 2024 at 09:02:20AM +0200, Jan Beulich wrote:
> >> On 29.05.2024 18:14, Roger Pau Monné wrote:
> >>> On Wed, May 29, 2024 at 05:49:48PM +0200, Jan Beulich wrote:
> >>>> On 29.05.2024 17:03, Roger Pau Monné wrote:
> >>>>> On Wed, May 29, 2024 at 03:35:04PM +0200, Jan Beulich wrote:
> >>>>>> On 29.05.2024 11:01, Roger Pau Monne wrote:
> >>>>>>> Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
> >>>>>>> a cpu_hotplug_{begin,done}() region the function will still return success,
> >>>>>>> because a CPU taking the rwlock in read mode after having taken it in write
> >>>>>>> mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
> >>>>>>> as it should always return false when called with a CPU hot{,un}plug operation
> >>>>>>> is in progress.
> >>>>>>
> >>>>>> I'm not sure I can agree with this. The CPU doing said operation ought to be
> >>>>>> aware of what it is itself doing. And all other CPUs will get back false from
> >>>>>> get_cpu_maps().
> >>>>>
> >>>>> Well, the CPU is aware in the context of cpu_{up,down}(), but not in
> >>>>> the interrupts that might be handled while that operation is in
> >>>>> progress, see below for a concrete example.
> >>>>>
> >>>>>>>  Otherwise the logic in send_IPI_mask() for example is wrong,
> >>>>>>> as it could decide to use the shorthand even when a CPU operation is in
> >>>>>>> progress.
> >>>>>>
> >>>>>> It's also not becoming clear what's wrong there: As long as a CPU isn't
> >>>>>> offline enough to not be in cpu_online_map anymore, it may well need to still
> >>>>>> be the target of IPIs, and targeting it with a shorthand then is still fine.
> >>>>>
> >>>>> The issue is in the online path: there's a window where the CPU is
> >>>>> online (and the lapic active), but cpu_online_map hasn't been updated
> >>>>> yet.  A specific example would be time_calibration() being executed on
> >>>>> the CPU that is running cpu_up().  That could result in a shorthand
> >>>>> IPI being used, but the mask in r.cpu_calibration_map not containing
> >>>>> the CPU that's being brought up online because it's not yet added to
> >>>>> cpu_online_map.  Then the number of CPUs actually running
> >>>>> time_calibration_rendezvous_fn won't match the weight of the cpumask
> >>>>> in r.cpu_calibration_map.
> >>>>
> >>>> I see, but maybe only partly. Prior to the CPU having its bit set in
> >>>> cpu_online_map, can it really take interrupts already? Shouldn't it be
> >>>> running with IRQs off until later, thus preventing it from making it
> >>>> into the rendezvous function in the first place? But yes, I can see
> >>>> how the IRQ (IPI) then being delivered later (once IRQs are enabled)
> >>>> might cause problems, too.
> >>>
> >>> The interrupt will get set in IRR and handled when interrupts are
> >>> enabled.
> >>>
> >>>>
> >>>> Plus, with how the rendezvous function is invoked (via
> >>>> on_selected_cpus() with the mask copied from cpu_online_map), the
> >>>> first check in smp_call_function_interrupt() ought to prevent the
> >>>> function from being called on the CPU being onlined. A problem would
> >>>> arise though if the IPI arrived later and call_data was already
> >>>> (partly or fully) overwritten with the next request.
> >>>
> >>> Yeah, there's a small window where the fields in call_data are out of
> >>> sync.
> >>>
> >>>>>> In any event this would again affect only the CPU leading the CPU operation,
> >>>>>> which should clearly know at which point(s) it is okay to send IPIs. Are we
> >>>>>> actually sending any IPIs from within CPU-online or CPU-offline paths?
> >>>>>
> >>>>> Yes, I've seen the time rendezvous happening while in the middle of a
> >>>>> hotplug operation, and the CPU coordinating the rendezvous being the
> >>>>> one doing the CPU hotplug operation, so get_cpu_maps() returning true.
> >>>>
> >>>> Right, yet together with ...
> >>>>
> >>>>>> Together with the earlier paragraph the critical window would be between the
> >>>>>> CPU being taken off of cpu_online_map and the CPU actually going "dead" (i.e.
> >>>>>> on x86: its LAPIC becoming unresponsive to other than INIT/SIPI). And even
> >>>>>> then the question would be what bad, if any, would happen to that CPU if an
> >>>>>> IPI was still targeted at it by way of using the shorthand. I'm pretty sure
> >>>>>> it runs with IRQs off at that time, so no ordinary IRQ could be delivered.
> >>>>>>
> >>>>>>> Adjust the logic in get_cpu_maps() to return false when the CPUs lock is
> >>>>>>> already hold in write mode by the current CPU, as read_trylock() would
> >>>>>>> otherwise return true.
> >>>>>>>
> >>>>>>> Fixes: 868a01021c6f ('rwlock: allow recursive read locking when already locked in write mode')
> >>>>>>
> >>>>>> I'm puzzled by this as well: Prior to that and the change referenced by its
> >>>>>> Fixes: tag, recursive spin locks were used. For the purposes here that's the
> >>>>>> same as permitting read locking even when the write lock is already held by
> >>>>>> the local CPU.
> >>>>>
> >>>>> I see, so the Fixes should be:
> >>>>>
> >>>>> x86/smp: use APIC ALLBUT destination shorthand when possible
> >>>>>
> >>>>> Instead, which is the commit that started using get_cpu_maps() in
> >>>>> send_IPI_mask().
> >>>>
> >>>> ... this I then wonder whether it's really only the condition in
> >>>> send_IPI_mask() which needs further amending, rather than fiddling with
> >>>> get_cpu_maps().
> >>>
> >>> That the other option, but I have impression it's more fragile to
> >>> adjust the condition in send_IPI_mask() rather than fiddle with
> >>> get_cpu_maps().
> >>>
> >>> However if that's the preference I can adjust.
> >>
> >> I guess we need other REST input here then. The two of us clearly disagree on
> >> what use of get_cpu_maps() is meant to guarantee. And I deem fiddling with
> >> common code here more risky (and more intrusive - the other change would be
> >> a single-line code change afaict, plus extending the related comment).
> > 
> > How do you envision that other change to be done?  Adding an extra
> > variable and toggling it in cpu_hotplug_{begin,done}() to signal
> > whether a CPU hotplug is in progress?
> 
> I was thinking of an is-write-locked-by-me check on cpu_add_remove_lock.

Oh, so basically open-coding what I proposed here as get_cpu_maps() in
send_IPI_mask().  Unless anyone else expresses interest in my current
proposal I would switch to that.

Thanks, Roger.

