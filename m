Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC090A756
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 09:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741870.1148541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ6sC-000706-HG; Mon, 17 Jun 2024 07:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741870.1148541; Mon, 17 Jun 2024 07:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ6sC-0006yY-EK; Mon, 17 Jun 2024 07:33:52 +0000
Received: by outflank-mailman (input) for mailman id 741870;
 Mon, 17 Jun 2024 07:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eX2=NT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJ6sB-0006yS-K7
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 07:33:51 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efdac342-2c7b-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 09:33:49 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6ad8243dba8so20663076d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 00:33:49 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5ee0346sm52576626d6.115.2024.06.17.00.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 00:33:47 -0700 (PDT)
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
X-Inumbo-ID: efdac342-2c7b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718609628; x=1719214428; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T09eC7D20hXn+Rq7lSZU/rf2mdJcpGS5V6pgfj1k5hw=;
        b=jl3UiyG7nWVcGy0qgencj95903YymhxqN9BNt3mkSNUCyHRNKyQ0pZw+BFvSLDZLAA
         maZI9ilhVq9WVnb3T3oOU71PNob4H6amAnDqNOAxaOxZGdszsG9uARvmwfkSoymuyCGm
         iiVcGYVLpjWUu2uED1gW4n+mdOiT9kzP6OAzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609628; x=1719214428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T09eC7D20hXn+Rq7lSZU/rf2mdJcpGS5V6pgfj1k5hw=;
        b=RVEdnngQTNWMSmOUB8KgpcgLZ90BmjWHtttX/rVZ1achu4upAJV47aYltFjOeTqlIl
         wB1KgGzhLOPWA3+nfwKM4XKKWgNGhSUvyq1ZX55I2RZwRNMLnEWcIvYlO8QoO9oZONK1
         /YIjFxJBDfD+v7cLR1Ti6OUgOhJDx5H1ue+gWZn322uCg05EScSKeXWA9EDxCd7i1i4E
         8KFHQ2dxdPATV50O9S2u18jiNFlashCLzNr9MHLgNoQH4V/g0ud8Amx0Z/XOhtJSM12n
         Zwd8nquY4MYc8gBsXnMBd1BJnEA7ujLng15fi6GtEdJB46bE0e2gxeVgtXBD6wWcbDIC
         tH4A==
X-Forwarded-Encrypted: i=1; AJvYcCWuNTrzmOw5CBgapBjyejTZP2TrK+fdtOaRgoUgnfjPhUz7jGQ3dRAqinuhdSWS2T6MD1KX6wCRoSGTWOokZHgknV141hXOTzjEdHipFTc=
X-Gm-Message-State: AOJu0YzjsS5FhuzmhsRUZqIyXDnJYnfIWMYh3PXYXSv3ETc9sshkpB5E
	SVlBO5VFp3HeX0jj+aIENINgKsSK2GIWwnV61q7+XXrgkd684rbhNUs6D4EvGRc=
X-Google-Smtp-Source: AGHT+IFm1MIuIWK5yQCGkvPUJH+fdVPXSwahtFdf8QCjx0ph9UV26HUskEZhGKFxeKdxYddmaklG2w==
X-Received: by 2002:a0c:c48b:0:b0:6b2:b05d:aa78 with SMTP id 6a1803df08f44-6b2b05dacddmr94394926d6.9.1718609628256;
        Mon, 17 Jun 2024 00:33:48 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:33:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Elias El Yandouzi <eliasely@amazon.com>, julien@xen.org,
	pdurrant@amazon.com, dwmw@amazon.com,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH V3 (resend) 01/19] x86: Create per-domain mapping of
 guest_root_pt
Message-ID: <Zm_m1shUlyt_KvBJ@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-2-eliasely@amazon.com>
 <dd145c67-8e3e-4b15-94f7-c7cd1f127d45@suse.com>
 <bda3386e-26c5-4efd-b7ad-00f3643523fa@amazon.com>
 <b50d0a83-fab4-4f59-bf4d-5c5593923f34@suse.com>
 <1ad9ccce-c02b-46c0-8fea-10b35b574cb8@amazon.com>
 <71f7b9c8-43f9-4703-b6e3-8b3fe8b740c0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71f7b9c8-43f9-4703-b6e3-8b3fe8b740c0@suse.com>

On Fri, Jun 14, 2024 at 08:23:30AM +0200, Jan Beulich wrote:
> On 13.06.2024 18:31, Elias El Yandouzi wrote:
> > On 16/05/2024 08:17, Jan Beulich wrote:
> >> On 15.05.2024 20:25, Elias El Yandouzi wrote:
> >>> However, I noticed quite a weird bug while doing some testing. I may
> >>> need your expertise to find the root cause.
> >>
> >> Looks like you've overflowed the dom0 kernel stack, most likely because
> >> of recurring nested exceptions.
> >>
> >>> In the case where I have more vCPUs than pCPUs (and let's consider we
> >>> have one pCPU for two vCPUs), I noticed that I would always get a page
> >>> fault in dom0 kernel (5.10.0-13-amd64) at the exact same location. I did
> >>> a bit of investigation but I couldn't come to a clear conclusion.
> >>> Looking at the stack trace [1], I have the feeling the crash occurs in a
> >>> loop or a recursive call.
> >>>
> >>> I tried to identify where the crash occurred using addr2line:
> >>>
> >>>   > addr2line -e vmlinux-5.10.0-29-amd64 0xffffffff810218a0
> >>> debian/build/build_amd64_none_amd64/arch/x86/xen/mmu_pv.c:880
> >>>
> >>> It turns out to point on the closing bracket of the function
> >>> xen_mm_unpin_all()[2].
> >>>
> >>> I thought the crash could happen while returning from the function in
> >>> the assembly epilogue but the output of objdump doesn't even show the
> >>> address.
> >>>
> >>> The only theory I could think of was that because we only have one pCPU,
> >>> we may never execute one of the two vCPUs, and never setup the mapping
> >>> to the guest_root_pt in write_ptbase(), hence the page fault. This is
> >>> just a random theory, I couldn't find any hint suggesting it would be
> >>> the case though. Any idea how I could debug this?
> >>
> >> I guess you want to instrument Xen enough to catch the top level fault (or
> >> the 2nd from top, depending on where the nesting actually starts) to see
> >> why that happens. Quite likely some guest mapping isn't set up properly.
> >>
> > 
> > Julien helped me with this one and I believe we have identified the 
> > problem.
> > 
> > As you've suggested, I wrote the mapping of the guest root PT in our 
> > per-domain section, root_pt_l1tab, within write_ptbase() function as 
> > we'd always be in the case v == current plus switch_cr3_cr4() would 
> > always flush local tlb.
> > 
> > However, there exists a path, in toggle_guest_mode(), where we could 
> > call update_cr3()/make_cr3() without calling write_ptbase() and hence 
> > not maintain mappings properly. Instead toggle_guest_mode() has a partly 
> > open-coded version of write_ptbase().
> > 
> > Would you rather like to see the mappings written in make_cr3() or in 
> > toggle_guest_mode() within the pseudo open-coded version of write_ptbase()?
> 
> Likely the latter, but that's hard to tell without seeing the resulting
> code.

There's already a special case for XPTI in toggle_guest_mode() to deal
exactly with that AFAICT.  Maybe it would be better if write_ptbase()
could be made suitable to be used in _toggle_guest_pt() instead of
directly calling write_cr3(), as we could then avoid having to pile
open-coded bodges in toggle_guest_mode() and/or _toggle_guest_pt().

Thanks, Roger.

