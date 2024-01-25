Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3483BCB7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 10:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671401.1044724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSvfx-00012T-4v; Thu, 25 Jan 2024 09:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671401.1044724; Thu, 25 Jan 2024 09:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSvfx-0000zQ-1f; Thu, 25 Jan 2024 09:05:33 +0000
Received: by outflank-mailman (input) for mailman id 671401;
 Thu, 25 Jan 2024 09:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSvfu-0000zK-Sa
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 09:05:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e19fc2c5-bb60-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 10:05:27 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so105470066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 01:05:27 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 p13-20020a17090653cd00b00a28badcf367sm800007ejo.54.2024.01.25.01.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 01:05:26 -0800 (PST)
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
X-Inumbo-ID: e19fc2c5-bb60-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706173527; x=1706778327; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1bYi9CWG3dnGVT8Jw+SqKTCptSp3YH1LRrk9mQn41R0=;
        b=p0fi9A+UIwQe++odfLPr67LZOfAxXv/6vmJTF6NnxHaGRzfXua2UE59FaDrMX3xrjr
         SnxeSVTCkanpLXl3yP2kANSNij4RvaLYw3//JdULB00JSpywna+8BSTcxWajo2wCGlJZ
         GNawYOUBlJzaizPO++D0tiUrQczkQBjwuh5n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173527; x=1706778327;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bYi9CWG3dnGVT8Jw+SqKTCptSp3YH1LRrk9mQn41R0=;
        b=apIrNHS1Sc8iIIDTFfzjF58gFSW55Jzz1wtdNHWrbJ6ouwZOyo1RPMxzgqhMIaWIQj
         4ieWMUpJhFjOvgV1G3627dG0xmpDvjl7nCGzXpXvpMwwxlPWGGfSt9FYD+g9g5kH09JL
         8BqfCoL48CcSTIlc1SidxR9cd19flBduXIMCC5GTNnDT7Ufpt2TN1VF22IEXx8Sofcg5
         RqChPStyivwoHuypka8kqvUYbHmFrFd/fXu8Yj8JeY7m6vhV1d3dvvFMrYLtEKoDyaYD
         y63xj3PLgBBn1XJk46RnOaAeaNUKFJqR0b6PuX6Ptpkbc8Br60vHVNqJ5FcE1NTDcRzi
         JpAg==
X-Gm-Message-State: AOJu0YxoEHxYldEeEgnp7MexUVpGxu5u7o5xmC2O1rxzy8jv53DOu8WS
	yF9J+50tq422qR0m8sCiLNCYnNDd1PbNxeJ2tm7bMTa0E0iZdB9n72WmH09RG84=
X-Google-Smtp-Source: AGHT+IEfIxqW/sr4Em2gsTkyAUA3bBkyGB+k+P+/X7tWR9SIbatgAYr6J6/Qm598iyzr/pL1nbvzsQ==
X-Received: by 2002:a17:906:e281:b0:a31:2c01:576a with SMTP id gg1-20020a170906e28100b00a312c01576amr577278ejb.25.1706173526753;
        Thu, 25 Jan 2024 01:05:26 -0800 (PST)
Date: Thu, 25 Jan 2024 10:05:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <ZbIkVcYkcuT2iF8e@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>
 <Za_WGzS14Eqt8yZF@macbook>
 <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com>
 <ZbDXXyucJhLJ4u9H@macbook>
 <a3233487-965b-49ae-bebe-e5476fcda29c@suse.com>
 <ZbFOE6kV7NXFrNjb@macbook>
 <fa7df700-06f1-4110-bc76-c59d59e5d887@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa7df700-06f1-4110-bc76-c59d59e5d887@suse.com>

On Thu, Jan 25, 2024 at 08:43:05AM +0100, Jan Beulich wrote:
> On 24.01.2024 18:51, Roger Pau Monné wrote:
> > On Wed, Jan 24, 2024 at 12:34:10PM +0100, Jan Beulich wrote:
> >> On 24.01.2024 10:24, Roger Pau Monné wrote:
> >>> On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
> >>>> On 23.01.2024 16:07, Roger Pau Monné wrote:
> >>>>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
> >>>>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> >>>>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >>>>>>>  {
> >>>>>>>      int irq, pirq, ret;
> >>>>>>>  
> >>>>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >>>>>>
> >>>>>> If either lock is sufficient to hold here, ...
> >>>>>>
> >>>>>>> --- a/xen/arch/x86/physdev.c
> >>>>>>> +++ b/xen/arch/x86/physdev.c
> >>>>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
> >>>>>>>  
> >>>>>>>      case MAP_PIRQ_TYPE_MSI:
> >>>>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
> >>>>>>> +        pcidevs_lock();
> >>>>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> >>>>>>> +        pcidevs_unlock();
> >>>>>>>          break;
> >>>>>>
> >>>>>
> >>>>> IIRC (Stewart can further comment) this is done holding the pcidevs
> >>>>> lock to keep the path unmodified, as there's no need to hold the
> >>>>> per-domain rwlock.
> >>>>
> >>>> Yet why would we prefer to acquire a global lock when a per-domain one
> >>>> suffices?
> >>>
> >>> I was hoping to introduce less changes, specially if they are not
> >>> strictly required, as it's less risk.  I'm always quite worry of
> >>> locking changes.
> >>
> >> In which case more description / code commenting is needed. The pattern
> >> of the assertions looks dangerous.
> > 
> > Is such dangerousness perception because you fear some of the pcidevs
> > lock usage might be there not just for preventing the pdev from going
> > away, but also to guarantee exclusive access to certain state?
> 
> Indeed. In my view the main purpose of locks is to guard state. Their
> use here to guard against devices here is imo rather an abuse; as
> mentioned before this should instead be achieved e.g via refcounting.
> And it's bad enough already that pcidevs_lock() alone has been abused
> this way, without proper marking (leaving us to guess in many places).
> It gets worse when a second lock can now also serve this same
> purpose.

The new lock is taken in read mode in most contexts, and hence can't
be used to indirectly gain exclusive access to domain related
structures in a safe way.

Not saying this makes it any better, but so far this is the best
solution we could come up with that didn't involve a full evaluation
and possible re-write of all usage of the pcidevs lock.

I would also prefer a solution that fully replaces the pcidevs lock
with something else, but for once I don't have a clear picture of how
that would look like because the analysis is a huge amount of work,
likely more than the implementation itself.

Hence the proposed compromise solution that should allow the vPCI work
to make progress.

Regards, Roger.

