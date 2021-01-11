Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3812F0EC1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 10:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64690.114304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytFa-00014v-41; Mon, 11 Jan 2021 09:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64690.114304; Mon, 11 Jan 2021 09:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytFZ-00014W-W8; Mon, 11 Jan 2021 09:12:33 +0000
Received: by outflank-mailman (input) for mailman id 64690;
 Mon, 11 Jan 2021 09:12:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+Cs=GO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kytFY-00014R-JV
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:12:32 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaca621e-a120-4660-99cf-3979771e1cf7;
 Mon, 11 Jan 2021 09:12:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r3so15579062wrt.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 01:12:31 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id z8sm21043525wmg.17.2021.01.11.01.12.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:12:30 -0800 (PST)
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
X-Inumbo-ID: aaca621e-a120-4660-99cf-3979771e1cf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=pmgSvgp/hWrQyVZp0+BcT25S72e947cjsD8oVzZQ3eE=;
        b=ISEpLZQ1npSNG0B5pYe7qhLeeDGTTSxrxLymAIBPSh+Z2RwuBaH7ZAbqD7eRgNzPCT
         rM/fvEzv005gEkELvxVP5+7+JiWwsvxvONo1n8Jy43+kmGjtAwSsGehSPIqqfFQ1jC5A
         P3ymGEOz7JuZm98kHHrIMMTF5atjeoEWcPpL/dUZhJwn1PEUnPoGJcNYR0Qvpzwn1kJJ
         TNbAkQIAcfFqypPYq5bS+ZlQ0NfXFENieWAH35Us9Qbe8LsG3+Un4odpGg8STQJ67ck3
         +JGAS9e+TsNpL5YdXx6GGxz4enH2+f7PunQ7y4AeI2JJt0SvcO/gBncR1Fojf0WklhuR
         0FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=pmgSvgp/hWrQyVZp0+BcT25S72e947cjsD8oVzZQ3eE=;
        b=bkyjHcHeQC8uZTFHCmDEzhVJixEmlUg4HNgko/3vqDwgn1NttY2ZlPrq7W7LOQSiCS
         UH8l2So/I/hocA7W/Lx5Vbt0alSzY/1zTli7+Er66rr4EB1j7XOGfXh59Sg7TDSM7YqP
         3XP4sgscAV15zko0rUUbPF5LiK+R7ABZ6SuYG7bZP+Ccd9tVULLLH6jQe3J/RnEZZDS/
         bVIQkRchgzZktc+olnrhGto67ny2jBy807t1uj2pP8UJEgU7H6JMyvC1zYJ+rUk+hDGA
         4p+nWNQKWIPY1G3mqKK54/aNRB00mos449dRxDxRPXR24apnU3Lo2qSo5lJ8htAzbOrE
         tdnQ==
X-Gm-Message-State: AOAM533kww0nPy+G7qKbAIKblRBAL5zB4d3vfpbtTqnS1s/JchbhIvYw
	zV1t4iofEXmhajOC+C1G5Js=
X-Google-Smtp-Source: ABdhPJxg5IN7zl+Cq/qQ/EKBwgJuBk4qA+bjFuVofJuSPPsVMlfoEDzw97iGo7+jlwilGPIlVQIVEQ==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr15304473wru.332.1610356350505;
        Mon, 11 Jan 2021 01:12:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: <paul@xen.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Igor Druzhinin'" <igor.druzhinin@citrix.com>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <009d01d6e598$bfdd0110$3f970330$@xen.org> <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com> <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org> <33322763-6810-3bfc-9573-1e326b38293e@suse.com> <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
In-Reply-To: <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Mon, 11 Jan 2021 09:12:28 -0000
Message-ID: <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQKH77KyAjM4vxoA8ianTwIvmyEuAapfz8apUUV+sA==

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 11 January 2021 09:10
> To: 'Jan Beulich' <jbeulich@suse.com>
> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org; roger.pau@citrix.com; xen-
> devel@lists.xenproject.org; 'Igor Druzhinin' <igor.druzhinin@citrix.com>
> Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
> 
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 11 January 2021 09:00
> > To: paul@xen.org
> > Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
> > george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org; roger.pau@citrix.com; xen-
> > devel@lists.xenproject.org; 'Igor Druzhinin' <igor.druzhinin@citrix.com>
> > Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
> >
> > On 11.01.2021 09:45, Paul Durrant wrote:
> > >> -----Original Message-----
> > >> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> > >> Sent: 09 January 2021 00:56
> > >> To: paul@xen.org; xen-devel@lists.xenproject.org
> > >> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
> > >> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org;
> > >> roger.pau@citrix.com
> > >> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
> > >>
> > >> On 08/01/2021 08:32, Paul Durrant wrote:
> > >>>> -----Original Message-----
> > >>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> > >>>> Sent: 08 January 2021 00:47
> > >>>> To: xen-devel@lists.xenproject.org
> > >>>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
> > >>>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
> > >>>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
> > >>>> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
> > >>>>
> > >>>> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
> > >>>> the maximum number of virtual processors per partition" that "can be obtained
> > >>>> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
> > >>>> the Microsoft Hypervisor Interface" defines that starting from Windows Server
> > >>>> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
> > >>>> contain a value -1 basically assuming the hypervisor has no restriction while
> > >>>> 0 (that we currently expose) means the default restriction is still present.
> > >>>>
> > >>>> Along with previous changes exposing ExProcessorMasks this allows a recent
> > >>>> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
> > >>>> going into immediate BSOD.
> > >>>>
> > >>>
> > >>> This is very odd as I was happily testing with a 128 vCPU VM once ExProcessorMasks was
> > >> implemented... no need for the extra leaf.
> > >>> The documentation for 0x40000005 states " Describes the scale limits supported in the current
> > >> hypervisor implementation. If any
> > >>> value is zero, the hypervisor does not expose the corresponding information". It does not say
> (in
> > >> section 7.8.1 or elsewhere AFAICT)
> > >>> what implications that has for VP_INDEX.
> > >>>
> > >>> In " Requirements for Implementing the Microsoft Hypervisor Interface" I don't see anything
> saying
> > >> what the semantics of not
> > >>> implementing leaf 0x40000005 are, only that if implementing it then -1 must be used to break the
> > 64
> > >> VP limit. It also says that
> > >>> reporting -1 in 0x40000005 means that 40000004.EAX bits 1 and 2 *must* be clear, which is
> clearly
> > >> not true if ExProcessorMasks is
> > >>> enabled. That document is dated June 13th 2012 so I think it should be taken with a pinch of
> salt.
> > >>>
> > >>> Have you actually observed a BSOD with >64 vCPUs when ExProcessorMasks is enabled? If so, which
> > >> version of Windows? I'd like to get
> > >>> a repro myself.
> > >>
> > >> I return with more testing that confirm both my and your results.
> > >>
> > >> 1) with ExProcessorMask and 66 vCPUs assigned both current WS19 build and
> > >> pre-release 20270 of vNext boot correctly with no changes
> > >>
> > >> and that would be fine but the existing documentation for ex_processor_masks
> > >> states that:
> > >> "Hence this enlightenment must be specified for guests with more
> > >> than 64 vCPUs if B<hcall_remote_tlb_flush> and/or B<hcall_ipi> are also
> > >> specified."
> > >>
> > >> You then would expect 64+ vCPU VM to boot without ex_processors_mask,
> > >> hcall_remote_tlb_flush and hcall_ipi.
> > >
> > > Indeed.
> > >
> > >>
> > >> So,
> > >> 2) without ExProcessorMaks and 66 vCPUs assigned and with hcall_remote_tlb_flush
> > >> and hcall_ipi disabled: WS19 BSODs and vNext fails to initialize secondary CPUs
> > >>
> > >
> > > This is not what I recall from testing but I can confirm I see the same now.
> > >
> > >> After applying my change,
> > >> 3) without ExProcessorMaks and 66 vCPUs assigned and with hcall_remote_tlb_flush
> > >> and hcall_ipi disabled WS19 and vNext boot correctly
> > >>
> > >> So we either need to change documentation and require ExProcessorMasks for all
> > >> VMs with 64+ vCPUs or go with my change.
> > >>
> > >
> > > I think we go with your change. I guess we can conclude then that the separate viridian flag as
> part
> > of the base set is the right way to go (to stop the leaf magically appearing on migrate of existing
> > guests) and leave ex_processor_masks (and the documentation) as-is.
> > >
> > > You can add my R-b to the patch.
> >
> > That's the unchanged patch then, including the libxl change that
> > I had asked about and that I have to admit I don't fully follow
> > Igor's responses? I'm hesitant to give an ack for that aspect of
> > the change, yet I suppose the libxl maintainers will defer to
> > x86 ones there. Alternatively Andrew or Roger could of course
> > ack this ...
> >
> 
> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented
> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think
> that's enough.

... although adding an option in xl/libxl isn't that much work, I suppose.

Igor, would you be ok plumbing it through?

  Paul

> 
>   Paul
> 
> > Jan



