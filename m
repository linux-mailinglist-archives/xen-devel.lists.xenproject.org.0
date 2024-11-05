Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF709BC8A8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 10:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830154.1245071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8FXx-0003Wj-Np; Tue, 05 Nov 2024 09:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830154.1245071; Tue, 05 Nov 2024 09:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8FXx-0003Tu-L8; Tue, 05 Nov 2024 09:08:21 +0000
Received: by outflank-mailman (input) for mailman id 830154;
 Tue, 05 Nov 2024 09:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vo3s=SA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8FXw-0003Tk-M2
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 09:08:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e6950cb-9b55-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 10:08:16 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so6163071a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 01:08:16 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17f935asm102563566b.147.2024.11.05.01.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 01:08:15 -0800 (PST)
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
X-Inumbo-ID: 7e6950cb-9b55-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdlNjk1MGNiLTliNTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzk3Njk2Ljg4NTQ4MSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730797696; x=1731402496; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwpW+iRQWjNgI65FHTkIYrD4gYGn/tZp9iRpuJWLAoM=;
        b=GvAMs/d/PJkwxosJBsny+355mD+TUE5wCFLAJ8wzpFecTtdGwdeGJIu2HCUcYd2zYt
         METtqmaOwzo2MOO7+ekIMd9wWNrpT1usywMxssDMQGegaycBIU25/3JU2mLy5f0L/TVH
         mBmbCoDQRstEkValg9hJgWMSsmmRJGJb9ABr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730797696; x=1731402496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwpW+iRQWjNgI65FHTkIYrD4gYGn/tZp9iRpuJWLAoM=;
        b=lBLwCyshQx8P2imkFVONtaew4/XDL1s7LUmMeGQxQRhEdTgyU1zZZ7xh7LthGaJ77a
         3uZDHu+UzBCxKPhW5JL4jd5ym2LlVWT9Jw2YCAY4Mw01DE8xcwZk+OJXTBj/cB9wkKL9
         N0yYZX+kLLzmfsAOFKaUp44tx8z1Y8aj+ePbh/XuwPZc/8s8zchr8ZiC+h2F6LFN7nV9
         hjD5aHgTAyxoxO2Rd+tRYIkF+oxfdKGGDb1YYStbgugjHhxLpwLtlB8sit97r9zraqTS
         /lhdk0Y4JXoiOp8Rk9zf4vsToN81X+mXHXbFIOZe6f2TbqCKUmsV5mVwiqgE6X4HwhPX
         8VTA==
X-Forwarded-Encrypted: i=1; AJvYcCVeaTPoangPphdb2mIBTuR4FG7pkvFtbhqtrHG40CPF5HL5T/qwItuI0oI2SoLgNHE13trcwO6at/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxae74hlb4hSo0xLf2WPk47djTdzqZh3YGpiaPKFZdvNqHRblH2
	N9UM0rlYgn+r11J6/Eee25Ew6AqN5etEIc3hBQGc7E1frn1C17aI9AaxYqbPKx0=
X-Google-Smtp-Source: AGHT+IEvsIaK2380MYXWDlun3KD6bLI6ck3TkJzsAF71h/zGGohvqcOer8SZfRvYhfLuFQZKS6DP3A==
X-Received: by 2002:a17:907:6ea6:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-a9e654d1c56mr1388288666b.24.1730797696253;
        Tue, 05 Nov 2024 01:08:16 -0800 (PST)
Date: Tue, 5 Nov 2024 10:08:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Message-ID: <ZyngfwQYZTFfwqlp@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
 <D5DDABNKHN42.1HD2T6NV99J51@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D5DDABNKHN42.1HD2T6NV99J51@cloud.com>

On Mon, Nov 04, 2024 at 11:45:05AM +0000, Alejandro Vallejo wrote:
> On Sat Nov 2, 2024 at 3:18 PM GMT, Daniel P. Smith wrote:
> > On 11/1/24 16:16, Stewart Hildebrand wrote:
> > > +Daniel (XSM mention)
> > > 
> > > On 10/28/24 13:02, Jan Beulich wrote:
> > >> On 18.10.2024 22:39, Stewart Hildebrand wrote:
> > >>> Add links between a VF's struct pci_dev and its associated PF struct
> > >>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
> > >>> dropping and re-acquiring the pcidevs_lock().
> > >>>
> > >>> During PF removal, unlink VF from PF and mark the VF broken. As before,
> > >>> VFs may exist without a corresponding PF, although now only with
> > >>> pdev->broken = true.
> > >>>
> > >>> The hardware domain is expected to remove the associated VFs before
> > >>> removing the PF. Print a warning in case a PF is removed with associated
> > >>> VFs still present.
> > >>>
> > >>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > >>> ---
> > >>> Candidate for backport to 4.19 (the next patch depends on this one)
> > >>>
> > >>> v5->v6:
> > >>> * move printk() before ASSERT_UNREACHABLE()
> > >>> * warn about PF removal with VFs still present
> > >>
> > >> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
> > >> just after an adjustment to the commit message. I'm instead actively
> > >> concerned of the resulting behavior. Question is whether we can reasonably
> > >> do something about that.
> > >>
> > >> Jan
> > > 
> > > Right. My suggestion then is to go back to roughly how it was done in
> > > v4 [0]:
> > > 
> > > * Remove the VFs right away during PF removal, so that we don't end up
> > > with stale VFs. Regarding XSM, assume that a domain with permission to
> > > remove the PF is also allowed to remove the VFs. We should probably also
> > > return an error from pci_remove_device in the case of removing the PF
> > > with VFs still present (and still perform the removals despite returning
> > > an error). Subsequent attempts by a domain to remove the VFs would
> > > return an error (as they have already been removed), but that's expected
> > > since we've taken a stance that PF-then-VF removal order is invalid
> > > anyway.
> >
> > I am not confident this is a safe assumption. It will likely be safe for 
> > probably 99% of the implementations. Apologies for not following 
> > closely, and correct me if I am wrong here, but from a resource 
> > perspective each VF can appear to the system as its own unique BDF and 
> > so I am fairly certain it would be possible to uniquely label each VF. 
> > For instance in the SVP architecture, the VF may be labeled to restrict 
> > control to a hardware domain within a Guest Virtual Platform while the 
> > PF may be restricted to the Supervisor Virtual Platform. In this 
> > scenario, the Guest would be torn down before the Supervisor so the VF 
> > should get released before the PF. But it's all theoretical, so I have 
> > no real implementation to point at that this could be checked/confirmed.
> >
> > I am only raising this for awareness and not as an objection. If people 
> > want to punt that theoretical use case down the road until someone 
> > actually attempts it, I would not be opposed.
> 
> Wouldn't it stand to reason then to act conditionally on the authority of the
> caller?
> 
> i.e: If the caller has the (XSM-checked) authority to remove _BOTH_ PF and
> VFs, remove all. If it doesn't have authority to remove the VFs then early exit
> with an error, leaving the PF behind as well.

I'm unsure if it makes sense to have an entity that's allowed to issue
a pci_remove_device() against a PF, but not against the VFs of the
device.

The owner of the PF should be capable of disabling SR-IOV, at which
point all the VFs disappear from the PCI config space.  If such entity
is capable of controlling the SR-IOV capability, it should also be
able to issue pci_remove_device() calls against the VFs.

Thanks, Roger.

