Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D747EB209
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632607.986852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uJ9-0007TB-ET; Tue, 14 Nov 2023 14:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632607.986852; Tue, 14 Nov 2023 14:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uJ9-0007RL-Bt; Tue, 14 Nov 2023 14:22:27 +0000
Received: by outflank-mailman (input) for mailman id 632607;
 Tue, 14 Nov 2023 14:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqel=G3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r2uJ7-0007RF-Oh
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:22:25 +0000
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a703047-82f9-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:22:23 +0100 (CET)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-32fb1c35fe0so3259921f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:22:23 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b0032d893d8dc8sm8011697wru.2.2023.11.14.06.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 06:22:18 -0800 (PST)
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
X-Inumbo-ID: 3a703047-82f9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699971739; x=1700576539; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/Kc4PBu7i26KJxuDwwo0TTUe+ZC7eMsAYq1TlHwn9I=;
        b=U4+7y/8bEBsmGLoQbh/Mcu7ayQSdTixiy7eo1MJArNPNnGIhXzE4D5D8xczNjQKGnX
         juX/XOc2u94ZGYRCtuIOPEY5Q5W3M0dxFKT2LWJn4sPUuWWfZZ/X8v0RiS7TDvVkk990
         oNNMn7jcW2SC0dFgrZsJpBepOeoSZBS81ejuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971739; x=1700576539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/Kc4PBu7i26KJxuDwwo0TTUe+ZC7eMsAYq1TlHwn9I=;
        b=cJAykbySr+8xDniYz2DoxLuII0abQaTx1W5eXjcthf2loGy1e/537CpsaTU8RDuZ8z
         tL/DS+SMXBgX+UxiygZb9K16zwNBKnH83CVnNZJZbYLofFrKfeiyGyvMxK3hVDooFOhA
         YlACKWBdv4XyqS2DJ4INVNv2r5ABssY87S2ykyqJk3TimCsFuXZYOazJVq5eRM5kuq8N
         lvM32nfSCci5I0yfb7Hk8j4KQoX1FLb2VcKzt6VC5cK3mEmpJUM3wYK2ryI0wsCsviSN
         36zDMBJh+ZcAQUTi1gXojPxgluM6n1yijmiDpCR3CX4EHWn2k1V2meNoUAHpdrpehQV2
         PwAQ==
X-Gm-Message-State: AOJu0YwM9VOeWIfWHYC0X3Jge2DELHghrwYoVa03/GgERj1WnJi+yUmc
	bJhXq20KjbYKglpRFtlJOougwnm/hFla8jl7TDA=
X-Google-Smtp-Source: AGHT+IHnNbzMBpW8RHyqKVz9hify6vCs2KS9bGs+VIVVwMKpq1In/T7Pri2d8iAlnzV1Cq/bFU8+nw==
X-Received: by 2002:a05:6000:1818:b0:32d:81b5:82d0 with SMTP id m24-20020a056000181800b0032d81b582d0mr6333920wrh.33.1699971738862;
        Tue, 14 Nov 2023 06:22:18 -0800 (PST)
Message-ID: <6553829a.5d0a0220.bdcfa.b990@mx.google.com>
X-Google-Original-Message-ID: <ZVOCmPzN0PxWhB04@EMEAENGAAD19049.>
Date: Tue, 14 Nov 2023 14:22:16 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
 <65536590.050a0220.eb28a.617d@mx.google.com>
 <f278f367-81cb-4a72-9303-23622dea3abd@suse.com>
 <fd99ea62-f011-4bcb-ba83-4698b5d267fd@citrix.com>
 <ZVOAEFoYFDp8lxCd@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVOAEFoYFDp8lxCd@macbook.local>

Hi,

On Tue, Nov 14, 2023 at 03:11:28PM +0100, Roger Pau Monné wrote:
> On Tue, Nov 14, 2023 at 12:55:46PM +0000, Andrew Cooper wrote:
> > On 14/11/2023 12:32 pm, Jan Beulich wrote:
> > > On 14.11.2023 13:18, Alejandro Vallejo wrote:
> > >> On Tue, Nov 14, 2023 at 11:14:22AM +0100, Jan Beulich wrote:
> > >>> On 13.11.2023 18:53, Roger Pau Monné wrote:
> > >>>> On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
> > >>>>> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> > >>>>> registers are derivable from each other through a fixed formula.
> > >>>>>
> > >>>>> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> > >>>>> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> > >>>>> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> > >>>>> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> > >>>>> x2APIC_ID and internally derive LDR (or the other way around)
> > >>>> I would replace the underscore from x2APIC ID with a space instead.
> > >>>>
> > >>>> Seeing the commit that introduced the bogus LDR value, I'm not sure it
> > >>>> was intentional,
> > >>> Hard to reconstruct over 9 years later. It feels like Alejandro may be right
> > >>> with his derivation.
> > >>>
> > >>>> as previous Xen code had:
> > >>>>
> > >>>> u32 id = vlapic_get_reg(vlapic, APIC_ID);
> > >>>> u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
> > >>>> vlapic_set_reg(vlapic, APIC_LDR, ldr);
> > >>>>
> > >>>> Which was correct, as the LDR was derived from the APIC ID and not the
> > >>>> vCPU ID.
> > >>> Well, it gave the appearance of deriving from the APIC ID. Just that it was
> > >>> missing GET_xAPIC_ID() around the vlapic_get_reg() (hence why LDR was
> > >>> uniformly 1 on all CPUs).
> > >>>
> > >>>>> This patch fixes the implementation so we follow the rules in the x2APIC
> > >>>>> spec(s).
> > >>>>>
> > >>>>> While in the neighborhood, replace the u32 type with the standard uint32_t
> > >>>> Likely wants:
> > >>>>
> > >>>> Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')
> > >>> +1
> > >>>
> > >>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > >>>> I do wonder whether we need to take any precautions with guests being
> > >>>> able to trigger an APIC reset, and thus seeing a changed LDR register
> > >>>> if the guest happens to be migrated from an older hypervisor version
> > >>>> that doesn't have this fix.  IOW: I wonder whether Xen should keep the
> > >>>> previous bogus LDR value across APIC resets for guests that have
> > >>>> already seen it.
> > >>> That earlier change deliberately fixed up any bogus values. I wonder
> > >>> whether what you suggest will do more good or more harm than going
> > >>> even farther and once again fixing up bad values in lapic_load_fixup().
> > >>> After all LDR being wrong affects vlapic_match_logical_addr()'s outcome.
> > >>> I think one of the two wants adding to the change, though.
> > >>>
> > >> You mean changing the LDR of a vCPU to the correct value on migrate? That
> > >> feels like playing with fire. A migrated VM is presumably a VM that is
> > >> running without issues (or it would have been rebooted). Letting it run
> > >> as it did seems safer.
> > > See Andrew's reply.
> > >
> > >> I don't think vlapic_match_logical_addr() is affected. The LDR's are still
> > >> unique in the bogus case so the matching ought to work. Problem would arise
> > >> if the guest makes assumptions about APIC_ID and LDR relationships.
> > > The LDRs still being unique (or not) isn't what I'm concerned about. It is
> > > the function's return value which would be wrong, as the incoming "mda"
> > > presumably was set in its respective field on the assumption that the LDRs
> > > are set in a spec-compliant way. There not having been problem reports
> > > makes me wonder whether any guests actually use logical delivery mode in a
> > > wider fashion.
> > 
> > They likely don't.
> > 
> > Logical delivery for xAPIC only works in a tiny fraction of cases
> > (assuming correct topology information, which we don't give), and
> > persuading a VM to turn on x2APIC without a vIOMMU is not something
> > we've managed to do in Xen.
> 
> We do, in fact the pvshim (or nested Xen) will run in x2APIC mode if
> available.
> 
> Linux >= 5.17 will also use x2APIC mode if available when running as a
> Xen HVM guest:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8980fcb210851138cb34c9a8cb0cf0c09f07bf9
> 
> If a guest has been booted with the bogus LDR we need to keep it on
> migrate, otherwise at least Xen will break (because it does read the
> LDR from the hardware instead of building it based on the APIC ID).
Ack. I'll just integrate this into my ongoing series, with...
> 
> Switching to the correct LDR on APIC reset can be sensible, any APIC
> device reset should be done together with updating whatever registers
> have been previously cached, and OSes don't do APIC resets anyway.
... this in mind.

> 
> > Also (as I learn talking to people just last night) it turns out that
> > Logical Destination Mode for external interrupts is entirely broken
> > anyway.  It always hits the lowest ID in the cluster, unless the LAPIC
> > in question is already servicing a same-or-higher priority interrupt at
> > which point the next ID in the cluster is tried.
> 
> Yeah, I've heard similar things for lowpri mode.  It's also valid to
> implement as a round-robin.
> 
> Thanks, Roger.

Cheers,
Alejandro

