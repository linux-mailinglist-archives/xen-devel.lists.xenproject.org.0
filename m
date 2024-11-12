Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348349C5171
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 10:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834252.1249868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAmq9-0001Px-Mu; Tue, 12 Nov 2024 09:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834252.1249868; Tue, 12 Nov 2024 09:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAmq9-0001Ni-KG; Tue, 12 Nov 2024 09:05:37 +0000
Received: by outflank-mailman (input) for mailman id 834252;
 Tue, 12 Nov 2024 09:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVpr=SH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tAmq7-0001NK-Tq
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 09:05:35 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45127668-a0d5-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 10:05:32 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so44914466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 01:05:32 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2eaa2sm691313066b.195.2024.11.12.01.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:05:31 -0800 (PST)
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
X-Inumbo-ID: 45127668-a0d5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1MTI3NjY4LWEwZDUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDAyMzMyLjA3OTIwOSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731402331; x=1732007131; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p2Oe+0oLPuzRuu8iJ/pJNcyNCi8OAncpgQMAKJPUyCI=;
        b=sWpxDuXPfo6LGZkCiVVWmGbCFr5dzTI6qLbnD57Xj2H7jP+IgtgHC3dE6riHBeynOi
         ZjKkv3DBidjIoKo1jhBKZLr7yEDQn9IAG7UYkCooBtZlb1kSUxz9UB7Oa5zSRLnEYHxi
         nSbM52dGnJsRQzdw0DqUaY84sr6NBK5zaGEiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731402331; x=1732007131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2Oe+0oLPuzRuu8iJ/pJNcyNCi8OAncpgQMAKJPUyCI=;
        b=HNiltq/lL7+5mm47xPpkM+6CJRRQgbub9HAf0wEh9+Nin3wbrgJL3c/IvjkVNNrigO
         LIapqjlfKJ4XM9jvfSBn3sT83uol7WOc0g4t90A1Msade2x51FXGRuf7Ya82WvmdKO/E
         kJ9Cqwi+6hCkrMPVi5df7fC/7HQt05UXvjnwIAjVe1uZWtZV/hgGtbXsKlLtl/bx69AZ
         gBivGHOXfO+sL8600qXZx1iMEz1vz3TwLLbOQDUHizrnsN8o9jj9m8P/v/G7v1dsosxJ
         mCAypfy4h1HMe91F9r9kKUtbOCYBNbKS1aYrrjC9oM8iynyaO9rcp6lY0RoLvyPJJu0h
         ZLxw==
X-Forwarded-Encrypted: i=1; AJvYcCXlqxKfvkHJ4Cu6ZLYstylMCZIh2CLb3lltFtZuuPlOZoaEcIKjOfxbPCALKg7jiQhTXuXM7qeW02k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytIv9xRlVc5nEPGDbLGM2xUTbhPRdRakjOg+c9nUdY7KWjyGfz
	Jyj2HWdv0OhHxiWKX0z6NmSKzHPuLVN+NuiVGA6t4U8MzpTJSsxOVKkj6F8+5Sg=
X-Google-Smtp-Source: AGHT+IF02QkQ/fx+vl6b5WaTrlR2lMLPgTWw2RmcBwhOAxKnpN52ogaFMGG3lRDCtexsGMTuRtDM2g==
X-Received: by 2002:a17:907:c12:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-a9eeffeeea6mr1746803566b.43.1731402331422;
        Tue, 12 Nov 2024 01:05:31 -0800 (PST)
Date: Tue, 12 Nov 2024 10:05:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Message-ID: <ZzMaWlGYStnh1FM9@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
 <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
 <39b2a334-1298-4e83-b7b7-393c79964539@suse.com>
 <Zy4sG915LicXNmIV@macbook>
 <ec9dd718-ef25-4a23-8080-8081ef2facb9@amd.com>
 <479d7430-ca30-4d72-b636-b47e5a2356f4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <479d7430-ca30-4d72-b636-b47e5a2356f4@suse.com>

On Mon, Nov 11, 2024 at 07:40:14AM +0100, Jan Beulich wrote:
> On 08.11.2024 17:29, Stewart Hildebrand wrote:
> > On 11/8/24 10:19, Roger Pau Monné wrote:
> >> On Fri, Nov 08, 2024 at 02:17:40PM +0100, Jan Beulich wrote:
> >>> On 08.11.2024 13:42, Alejandro Vallejo wrote:
> >>>> On Mon Nov 4, 2024 at 7:44 AM GMT, Jan Beulich wrote:
> >>>>> On 01.11.2024 21:16, Stewart Hildebrand wrote:
> >>>>>> +Daniel (XSM mention)
> >>>>>>
> >>>>>> On 10/28/24 13:02, Jan Beulich wrote:
> >>>>>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
> >>>>>>>> Add links between a VF's struct pci_dev and its associated PF struct
> >>>>>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
> >>>>>>>> dropping and re-acquiring the pcidevs_lock().
> >>>>>>>>
> >>>>>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
> >>>>>>>> VFs may exist without a corresponding PF, although now only with
> >>>>>>>> pdev->broken = true.
> >>>>>>>>
> >>>>>>>> The hardware domain is expected to remove the associated VFs before
> >>>>>>>> removing the PF. Print a warning in case a PF is removed with associated
> >>>>>>>> VFs still present.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>>>>> ---
> >>>>>>>> Candidate for backport to 4.19 (the next patch depends on this one)
> >>>>>>>>
> >>>>>>>> v5->v6:
> >>>>>>>> * move printk() before ASSERT_UNREACHABLE()
> >>>>>>>> * warn about PF removal with VFs still present
> >>>>>>>
> >>>>>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
> >>>>>>> just after an adjustment to the commit message. I'm instead actively
> >>>>>>> concerned of the resulting behavior. Question is whether we can reasonably
> >>>>>>> do something about that.
> >>>>>>
> >>>>>> Right. My suggestion then is to go back to roughly how it was done in
> >>>>>> v4 [0]:
> >>>>>>
> >>>>>> * Remove the VFs right away during PF removal, so that we don't end up
> >>>>>> with stale VFs. Regarding XSM, assume that a domain with permission to
> >>>>>> remove the PF is also allowed to remove the VFs. We should probably also
> >>>>>> return an error from pci_remove_device in the case of removing the PF
> >>>>>> with VFs still present (and still perform the removals despite returning
> >>>>>> an error). Subsequent attempts by a domain to remove the VFs would
> >>>>>> return an error (as they have already been removed), but that's expected
> >>>>>> since we've taken a stance that PF-then-VF removal order is invalid
> >>>>>> anyway.
> >>>>>
> >>>>> Imo going back is not an option.
> >>>>>
> >>>>>> While the above is what I prefer, I just want to mention other options I
> >>>>>> considered for the scenario of PF removal with VFs still present:
> >>>>>>
> >>>>>> * Increase the "scariness" of the warning message added in v6.
> >>>>>>
> >>>>>> * Return an error from pci_remove_device (while still removing only the
> >>>>>> PF). We would be left with stale VFs in Xen. At least this would
> >>>>>> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
> >>>>>> order. Subsequent attempts by a domain to remove VFs, however
> >>>>>> (un)likely, would succeed.
> >>>>>
> >>>>> Returning an error in such a case is a possibility, but comes with the
> >>>>> risk of confusion. Seeing such an error, a caller may itself assume the
> >>>>> device still is there, and retry its (with or without having removed the
> >>>>> VFs) removal at a later point.
> >>>>>
> >>>>>> * Return an error from pci_remove_device and keep the PF and VFs. This
> >>>>>> is IMO the worst option because then we would have a stale PF in
> >>>>>> addition to stale VFs.
> >>
> >> I'm thinking probably this is the least bad option, and just force the
> >> owner of the PF to ensure there are no VFs left when removing the PF.
> >>
> >> What sense does it make anyway to allow removing a PF with VFs still
> >> present?  Not sure exactly what the owner of the PF will do before
> >> calling pci_remove_device(), but it would seem to me the device should
> >> be ready for unplug (so SR-IOV disabled).  Calling pci_remove_device()
> >> with VFs still active points to an error to do proper cleanup by the
> >> owner of the PF.
> > 
> > In normal, correct operation, right. The PF driver is indeed expected to
> > disable SR-IOV (i.e. remove VFs) during its removal, prior to calling
> > PHYSDEVOP_pci_device_remove for the PF.
> > 
> >> Returning error from pci_remove_device() and doing nothing would seem
> >> fine to me.  There should be no stale PF or VFs in that case, as the
> >> caller has been notified the device has failed to be removed, so
> >> should treat the device as still present.
> 
> Imo really that's another case that would best be addressed by proper
> ref-counting. Each VF would hold a ref to its PF, and hence the PF would
> go away when the last VF is removed, or when PF removal is (properly)
> last. Just that this likely is too complex a change to be warranted for
> the purpose here.
> 
> > But software has no way to guarantee there won't be a physical device
> > removal.
> > 
> > In test scenario #2 described in the first patch [1], the PF (the whole
> > device, actually) has already been physically unplugged, and dom0
> > invokes PHYSDEVOP_pci_device_remove to inform Xen about it.
> 
> I don't think that's how it's supposed to work. Physical removal should
> occur only after software has done all "soft removal". I'd view the
> notification to Xen as part of that.

That would be my expectation also, albeit IIRC we had other instances
where the calling of the removal hypercall was not done in a vetoing
manner by Linux, so it was mostly a notification that the device was
going away, rather than a request for permission to removal.

Thanks, Roger.

