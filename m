Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5092A82658
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944120.1342665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VZ0-0007Xd-Km; Wed, 09 Apr 2025 13:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944120.1342665; Wed, 09 Apr 2025 13:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VZ0-0007Vi-Hc; Wed, 09 Apr 2025 13:33:58 +0000
Received: by outflank-mailman (input) for mailman id 944120;
 Wed, 09 Apr 2025 13:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2VYz-0007Vc-6R
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:33:57 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48b0da96-1547-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:33:56 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-736b0c68092so5622186b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:33:56 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bb1e383a3sm1312773b3a.92.2025.04.09.06.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 06:33:54 -0700 (PDT)
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
X-Inumbo-ID: 48b0da96-1547-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744205635; x=1744810435; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xVH6j9br4S89M6ArmkAQrAINXsXoDOw625C9ofa8URA=;
        b=WmqgtDAt0PL3SJQ/MGHZnauD6Bu4EYV4A9MUh4VLg7tQfjHeP0nyN35SCztzoDqQWP
         8o/Q96vcxMgS+a2qeOBlgqVQAhqYhagF2CI7QOKyzT20Wc9t6pPLpqOpMudksKeFQMlX
         4AZbQMz4nmobHgPyVNRSvsFxIUBE7Q/IxYhwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744205635; x=1744810435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVH6j9br4S89M6ArmkAQrAINXsXoDOw625C9ofa8URA=;
        b=XalTbJ5QLFIPtdmHyss5bYz13kVTRbfZN3j/LXnAB0uZLSUBCrwOd/kYjVwTR0NxDE
         hqx5qAFd/FN6DEAXOTrnUWfMZ6z69+uw5EzzU/AbiDBILjtbt38vC/ChsnUVqlNpWRYR
         xd/LyUAqJnnB57jFjgGSplGjUdYaakD9+MLdM/hOkHxriU0xp+VRc7sXjSXNfC6EWG+h
         PnHg78yOvPiXk6uowdj2nl+1NGNCWGHvvsfxAH9s69IP5nE6SWBEsfVecvqFuFHlVjyZ
         li8FzjZijR0TjCfylLhN9gB3kf7KSlUNRokbNAHGJkVE93usothRcKO/KnZB2OhTOho+
         AHQg==
X-Forwarded-Encrypted: i=1; AJvYcCUF8awKzl60fKJIElp/woigeGVG+0TKGBA7l9OFVOlvn+zdQ004IzbcXzjZng6UcZURFNi7Dtbl0aA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzctVm+VvJxj29qmzUKj8VY0qS05+DrSgUbosmP+EG+0XgXn8kx
	IJFHeNgrO4EK0dftg5Li+/w61Oy0cDfbfQ24WTuKEFDDUQYbdxat6SlRF5tEjc8=
X-Gm-Gg: ASbGncuSXz02YPQTMM36/DDrjA22hT3LgYmGHPtyLCUObRZipCCnxDygWpmTFffKe1z
	wbPPTCfGHSjsFW7w8rABYKW4r1phrhjwWYNzpbXvlbCb4FHiaRvewYGBHFAxTHd+Ygjb7rHxc+r
	DmqUs0rqulDXnJHdix87yBKZYfGYokUPeV+gZlu99WCLMg2cVIllRy/1p0FfbHDe504WepMJ03e
	csH3oMY8OpmKfK0f6JljGfrBuq5WAmFIMbso/T9X/HllEZcG6YbLqDvLsllcvh+oNIzYDkL3Fn4
	j7lDBQ90vV242kFxHMnavJfQmrLf+pn3Oob2nVjeHntMYw==
X-Google-Smtp-Source: AGHT+IFx784XjUIEOB86Iy5weZBleoVkDoKVbO5LMQRvyej0xyaS76UOfGwjXIfWxlgm+lI7/LpZog==
X-Received: by 2002:a05:6a00:801:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-73bae529f06mr2911342b3a.15.1744205634776;
        Wed, 09 Apr 2025 06:33:54 -0700 (PDT)
Date: Wed, 9 Apr 2025 15:33:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_Z3PYYSBH3QWioF@macbook.lan>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
 <Z_ZOWAttoFNoFYCV@macbook.lan>
 <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>

On Wed, Apr 09, 2025 at 02:59:45PM +0200, Jan Beulich wrote:
> On 09.04.2025 12:39, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
> >> On 09.04.2025 11:07, Roger Pau Monné wrote:
> >>> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
> >>>> On 08.04.2025 11:31, Roger Pau Monne wrote:
> >>>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
> >>>>> will not be provided to hvm_emulate_one_mmio(), and instead is
> >>>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> >>>>> always report an error, as the fault GLA generated by the emulation of the
> >>>>> access won't be ~0.
> >>>>
> >>>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
> >>>> generally whenever .gla_valid isn't set).
> >>>
> >>> Oh, yes, good catch.  I didn't notice that one.  We should move all
> >>> those checks to use a paddr rather than a gla.
> >>
> >> Really that function could just be passed the offset into the page.
> >>
> >>>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> >>>>> when the guest is PV.
> >>>>
> >>>> This narrows checking too much, imo. For VT-x we could continue to do so,
> >>>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
> >>>> the gla_valid flag visible there.
> >>>
> >>> I don't think we should rely on the gla at all in
> >>> mmio_ro_emulated_write(), and instead just use the physical address.
> >>
> >> But you can't validate a physical address against a CR2 value. And I view
> >> this validation as meaningful, to guard (best effort, but still) against
> >> e.g. insn re-writing under our feet.
> > 
> > But we have the mfn in mmio_ro_ctxt, and could possibly use that to
> > validate?  I could expand the context to include the offset also, so
> > that we could fully validate it.
> 
> How would you use the MFN to validate against the VA in CR2?

I would use hvmemul_virtual_to_linear() and hvm_translate_get_page()
to get the underlying mfn of the linear address.  But maybe there's a
part of this that I'm missing, I've certainly haven't tried to
implement any of it.

Thanks, Roger.

