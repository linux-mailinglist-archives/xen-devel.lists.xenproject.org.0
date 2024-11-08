Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A89C203C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 16:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832689.1247971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QmJ-0004CB-4i; Fri, 08 Nov 2024 15:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832689.1247971; Fri, 08 Nov 2024 15:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QmJ-000480-1B; Fri, 08 Nov 2024 15:20:03 +0000
Received: by outflank-mailman (input) for mailman id 832689;
 Fri, 08 Nov 2024 15:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9QmI-0003tl-6U
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 15:20:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea1b623c-9de4-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 16:19:57 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so463853966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 07:19:57 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc580esm248774966b.106.2024.11.08.07.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 07:19:56 -0800 (PST)
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
X-Inumbo-ID: ea1b623c-9de4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVhMWI2MjNjLTlkZTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDc5MTk3LjkzODMwOSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731079197; x=1731683997; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NothjRa7hJs7krxw/fHeGCdJnIvRShxLJRNh0o3cmgk=;
        b=wYxFEQ+Pyr83U8CwClCbDUmqEjueevLjGVYCpr1fBCeabTRgfvuSW2TgE+fAeQIXxO
         yOodm6GHPJ+EVoREEPilI1+sP6N36uuxsxr34RjPeZ7RKpNDbamKnApphaVQzfYXHseo
         8MZJyi2ssBo1ithNc974b9WxCM2zBnwfN6t3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731079197; x=1731683997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NothjRa7hJs7krxw/fHeGCdJnIvRShxLJRNh0o3cmgk=;
        b=AxFn8kIcEiva7Y5+Uculh49Xwpail7J14GagxD5vWPwQjyJ/Y7Yrhw6j4bhkHRLQSz
         t6+xBzpgs7FqkUHIZYbWGl+rVXD7mxsCVFmnSeGlNceUnva/0+HswHkMMCTtQB1dtHOl
         burDL10zttWq4DsWjv4fS+dfHbKCpLQr0TTfJokBqcyW0yVLtvy6fxhOTg5b9OXZ4jhd
         F6uYF6sUb0Lkmgfa9rRklA+GdUPNXVH0s7AN15Yl58vwDYWqwBzbiDHAlwOwKxgzzjtj
         42WDvSKCwAQrsdfXll+IBwuZeTIUqVse9tYjw5lRUa5nZJsPaB1sur9XExlL2mtWS2Bj
         gglQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEQuTSeDV+GVqJiZnWGdKPoo3xWdltakGCpAk7wojPZCx1T3Xl6DccSckEYdseAl3iRqeJTEId3wk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9+jUOmDgkahbaWVUWMGP4cRNg6kh2XRPnL3+PyPtdhOfy7iFT
	LT7WuOKzP+0Y/qGUEQJkbw5c2h6qtczma2iAzeUFef9oUCqcFzSNh41mxU0rA+g=
X-Google-Smtp-Source: AGHT+IE1/T87ONUhJ6KbeDKX61K5vCZlDt/TqYnpNG6tUPtJNY3G3vwg3YXHf/WzetyW+J2pa7VMoA==
X-Received: by 2002:a17:907:3188:b0:a9e:c4df:e3c9 with SMTP id a640c23a62f3a-a9eeff97fcemr317489966b.24.1731079197172;
        Fri, 08 Nov 2024 07:19:57 -0800 (PST)
Date: Fri, 8 Nov 2024 16:19:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Message-ID: <Zy4sG915LicXNmIV@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
 <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
 <39b2a334-1298-4e83-b7b7-393c79964539@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39b2a334-1298-4e83-b7b7-393c79964539@suse.com>

On Fri, Nov 08, 2024 at 02:17:40PM +0100, Jan Beulich wrote:
> On 08.11.2024 13:42, Alejandro Vallejo wrote:
> > On Mon Nov 4, 2024 at 7:44 AM GMT, Jan Beulich wrote:
> >> On 01.11.2024 21:16, Stewart Hildebrand wrote:
> >>> +Daniel (XSM mention)
> >>>
> >>> On 10/28/24 13:02, Jan Beulich wrote:
> >>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
> >>>>> Add links between a VF's struct pci_dev and its associated PF struct
> >>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
> >>>>> dropping and re-acquiring the pcidevs_lock().
> >>>>>
> >>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
> >>>>> VFs may exist without a corresponding PF, although now only with
> >>>>> pdev->broken = true.
> >>>>>
> >>>>> The hardware domain is expected to remove the associated VFs before
> >>>>> removing the PF. Print a warning in case a PF is removed with associated
> >>>>> VFs still present.
> >>>>>
> >>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>> ---
> >>>>> Candidate for backport to 4.19 (the next patch depends on this one)
> >>>>>
> >>>>> v5->v6:
> >>>>> * move printk() before ASSERT_UNREACHABLE()
> >>>>> * warn about PF removal with VFs still present
> >>>>
> >>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
> >>>> just after an adjustment to the commit message. I'm instead actively
> >>>> concerned of the resulting behavior. Question is whether we can reasonably
> >>>> do something about that.
> >>>
> >>> Right. My suggestion then is to go back to roughly how it was done in
> >>> v4 [0]:
> >>>
> >>> * Remove the VFs right away during PF removal, so that we don't end up
> >>> with stale VFs. Regarding XSM, assume that a domain with permission to
> >>> remove the PF is also allowed to remove the VFs. We should probably also
> >>> return an error from pci_remove_device in the case of removing the PF
> >>> with VFs still present (and still perform the removals despite returning
> >>> an error). Subsequent attempts by a domain to remove the VFs would
> >>> return an error (as they have already been removed), but that's expected
> >>> since we've taken a stance that PF-then-VF removal order is invalid
> >>> anyway.
> >>
> >> Imo going back is not an option.
> >>
> >>> While the above is what I prefer, I just want to mention other options I
> >>> considered for the scenario of PF removal with VFs still present:
> >>>
> >>> * Increase the "scariness" of the warning message added in v6.
> >>>
> >>> * Return an error from pci_remove_device (while still removing only the
> >>> PF). We would be left with stale VFs in Xen. At least this would
> >>> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
> >>> order. Subsequent attempts by a domain to remove VFs, however
> >>> (un)likely, would succeed.
> >>
> >> Returning an error in such a case is a possibility, but comes with the
> >> risk of confusion. Seeing such an error, a caller may itself assume the
> >> device still is there, and retry its (with or without having removed the
> >> VFs) removal at a later point.
> >>
> >>> * Return an error from pci_remove_device and keep the PF and VFs. This
> >>> is IMO the worst option because then we would have a stale PF in
> >>> addition to stale VFs.

I'm thinking probably this is the least bad option, and just force the
owner of the PF to ensure there are no VFs left when removing the PF.

What sense does it make anyway to allow removing a PF with VFs still
present?  Not sure exactly what the owner of the PF will do before
calling pci_remove_device(), but it would seem to me the device should
be ready for unplug (so SR-IOV disabled).  Calling pci_remove_device()
with VFs still active points to an error to do proper cleanup by the
owner of the PF.

Returning error from pci_remove_device() and doing nothing would seem
fine to me.  There should be no stale PF or VFs in that case, as the
caller has been notified the device has failed to be removed, so
should treat the device as still present.

Thanks. Roger.

