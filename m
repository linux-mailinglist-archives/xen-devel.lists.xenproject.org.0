Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27A8D5FC4
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 12:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733617.1139919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCzYJ-0004FS-Lo; Fri, 31 May 2024 10:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733617.1139919; Fri, 31 May 2024 10:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCzYJ-0004Cr-Ik; Fri, 31 May 2024 10:32:03 +0000
Received: by outflank-mailman (input) for mailman id 733617;
 Fri, 31 May 2024 10:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFcc=NC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCzYI-0004C0-Kf
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 10:32:02 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 037f3f0a-1f39-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 12:32:00 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-420180b5897so8719285e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 03:32:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212278b24dsm40556385e9.0.2024.05.31.03.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 03:31:59 -0700 (PDT)
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
X-Inumbo-ID: 037f3f0a-1f39-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717151520; x=1717756320; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+hVjKyR2L2RSS9i/nt6ABD4p23g93I9Yei3VnU4r534=;
        b=EZ2GATAguwFBJ1bNOoYD4C9EVaeh0ShAeJYGI9pUsKbK1WO4+nvcZRRF3RZe4/eI2K
         SQi4rwt7AzXSQFZyT1GcnQmX+A+zRD4L5o/omP8KaNw5+/HXKr7uMPZaMYZh5bjPIkKG
         T1S7YDfHx/PYbQ/dUiGcuZjdvb/pN5EdSlUWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717151520; x=1717756320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hVjKyR2L2RSS9i/nt6ABD4p23g93I9Yei3VnU4r534=;
        b=g1DJrmMCG0+ZUMRjLOVnim4h1XmbwfNoPMQfdcRkoKzGRkH8SoANErmXDu1x9VNGlP
         Gk2gUE7N4q7Zd6pqp9XXGiuroIiBZL0phObomZE6kmlfCdnhbmClX5/wlg/IJcghwidZ
         y3gyPvBuEjmkbiHLEjpxIVrSt0svCYxsc4MxY3C4v/VPeItZcVW034/MxywXWE2PL2jF
         W62SI4XB5/K9UpiViRHa43CJmI2IcFZY7G3Yuh1bubAbK1LEsUFpKHsl7bRAP6ViqN71
         ntWWWJPAcJGJW+9sFWy5q9utnPd+aXLeWa4Nq3EGFakEh9/Jbcl1E8Qbdf4ZLYlPGjPd
         3v6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV72MpVBTifD/UxF3CHrf+oD11CXXr/SGS5TuziGtnXOpsGA3KDLITOVR8JPg+gvR8SZnFJOkfojeJWA5rzbUWtccjQcgwfHdZrDKtbumo=
X-Gm-Message-State: AOJu0YxbJVPdLMTBRXKVmupqpWdB7FC8PF4uHRBB9qbhehtOVruc4kgT
	neOfYWyW3x6vDPPjUP9CJDSDUYJj1IvUSkIl7wIBA8AvBa5n6uaibW8I8l1K27k=
X-Google-Smtp-Source: AGHT+IHIwawhCwmBBXhQPNTm5AUwRjpTeOHTwEpbkar9LLKV7/XruSjqZeZgaK8GLbPXtx3R30rdFQ==
X-Received: by 2002:a05:600c:1c97:b0:41a:e995:b924 with SMTP id 5b1f17b1804b1-4212e0c222cmr12203965e9.33.1717151519944;
        Fri, 31 May 2024 03:31:59 -0700 (PDT)
Date: Fri, 31 May 2024 12:31:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 2/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
Message-ID: <ZlmnHnHVbaxLjfjO@macbook>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
 <0d3101bc-624e-43b0-95e7-cc89de3bb259@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d3101bc-624e-43b0-95e7-cc89de3bb259@citrix.com>

On Thu, May 30, 2024 at 12:08:26PM +0100, Andrew Cooper wrote:
> On 29/05/2024 3:32 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> > index f033d22785be..b70b22d55fcf 100644
> > --- a/xen/lib/x86/policy.c
> > +++ b/xen/lib/x86/policy.c
> > @@ -2,6 +2,17 @@
> >  
> >  #include <xen/lib/x86/cpu-policy.h>
> >  
> > +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
> > +{
> > +    /*
> > +     * TODO: Derive x2APIC ID from the topology information inside `p`
> > +     *       rather than from the vCPU ID alone. This bodge is a temporary
> > +     *       measure until all infra is in place to retrieve or derive the
> > +     *       initial x2APIC ID from migrated domains.
> > +     */
> > +    return id * 2;
> > +}
> > +
> 
> I'm afraid it's nonsensical to try and derive x2APIC ID from a
> policy+vcpu_id.
> 
> Take a step back, and think the data through.
> 
> A VM has:
> * A unique APIC_ID for each vCPU
> * Info in CPUID describing how to decompose the APIC_ID into topology
> 
> Right now, because this is all completely broken, we have:
> * Hardcoded APIC_ID = vCPU_ID * 2
> * Total nonsense in CPUID
> 
> 
> When constructing a VM, the toolstack (given suitable admin
> guidance/defaults) *must* choose both:
> * The APIC_ID themselves
> * The CPUID topo data to match
> 
> i.e. this series should be editing the toolstack's call to
> xc_domain_hvm_setcontext().
> 
> It's not, because AFAICT you're depending on the migration compatibility
> logic and inserting a new hardcoded assumption about symmetry of the layout.
> 
> 
> The data flows we need are:
> 
> (New) create:
> * Toolstack chooses both parts of topo information
> * Xen needs a default, which reasonably can be APIC_ID=vCPU_ID when the
> rest of the data flow has been cleaned up.  But this is needs to be
> explicit in vcpu_create() and without reference to the policy.

Doesn't using APIC_ID=vCPU_ID limits us to only being able to expose
certain typologies? (as vCPU IDs are contiguous).  For example
exposing a topology with 3 cores per package won't be possible?

Not saying it's a bad move to start this way, but if we want to
support exposing more exotic topology sooner or later we will need
some kind of logic that assigns the APIC IDs based on the knowledge of
the expected topology.  Whether is gets such knowledge from the CPU
policy or directly from the toolstack is another question.

Thanks, Roger.

