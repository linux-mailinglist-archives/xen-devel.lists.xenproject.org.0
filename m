Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2FAA4E662
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 17:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901332.1309295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpVKj-000447-Qu; Tue, 04 Mar 2025 16:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901332.1309295; Tue, 04 Mar 2025 16:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpVKj-000411-Nz; Tue, 04 Mar 2025 16:41:29 +0000
Received: by outflank-mailman (input) for mailman id 901332;
 Tue, 04 Mar 2025 16:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFsD=VX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpVKi-00040v-9R
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 16:41:28 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83eaf9ed-f917-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 17:41:26 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso850703266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 08:41:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1e02f9660sm262903466b.71.2025.03.04.08.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 08:41:26 -0800 (PST)
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
X-Inumbo-ID: 83eaf9ed-f917-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741106486; x=1741711286; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=quF0aTMLufYAfyxmEa9FNXzjukK1F9FdjpvMWthr0f0=;
        b=WTSOzQjag8Brr+gRrQXmWWtZP+o9iw2crCd5JV7LbIzdYIGcIjLG8IgPZ3UpBPMvkr
         iypsP9Yxpb/ZrRiXZUA688JbS7GMioV+MxTeijt2oKME+oVci9YF6Y7cwSONyHTvvFKf
         3rVPY70VmesXPiMZP7X1+T4p+BHvKJQ/0Or3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106486; x=1741711286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quF0aTMLufYAfyxmEa9FNXzjukK1F9FdjpvMWthr0f0=;
        b=t8AUgYFMMNE5nwqSjLH1kYYpEXknaU3G1eK35QnAokvv5buSWqGBg1O9KQPS9cBklv
         8TAgZM7IkucLAKV/PjcJOlc1o+pfs/Bi5tPkd4jY5poiHfwuE3P303YMDvZFZqPJcCZ2
         2CE1PZfR5LCQ51LzG3BNwyrrnpm5q0IbKUD2yT2Ou0TokqRoxTMK5l8zJSrDYd9OSdFE
         r3UQil9VGUq2GiTZ1PnE7+rMMQm07guqVqUBtEdtIoQb1udGB+vwDFJe+sjgQllmXkaD
         eIfZEAkVn8VMWS3fQ+ALISNh+PBJqUywZq3Q3YP7YFL0xdznlNC8iWKHBD3Z00Y3gs3H
         JWpQ==
X-Gm-Message-State: AOJu0YyPSVdG/gfLRvh1BhJearorftExJkUpc9gtrPrAC3ee42cE6VIh
	q23/akr0oJZKlpM6aiAoGbdf+ziwbvd2lJP96YLTo4g4Yk4tAIHfSvnNYF5Lf5U=
X-Gm-Gg: ASbGnctAmhKd/IoZ0Lx6oOZN9iMZMDk6greWsRBFsotYWMbOuYs/QqGSEZS/zCEuyei
	6GYYHg3dBaIVQQ4QHmYD9IQqda+H9Wf9h5oI7cQlQTYA0PbeGQyDaTOTc5lohtvZXmWMZH0WjNV
	9yuQBvtX4MLOuHcBNtKGpVm3yMIaxcwzoYYAwC6cCfJOIA7NQH4+tcEmHznafQ+tHdr2Bv4lcD/
	bflOl+/S15U/arUX5aIhQP23YULERSSM/cXQEWnN2/O/42t9KsFjISTqknnTn1XijoFDy1HMF+f
	Foc6WuyohwymoH/vQTPhnDs0TZU3l/E8h10erVd8mp6pwHBR5w==
X-Google-Smtp-Source: AGHT+IHzTa5Ds9k+mnxSRztBV6tN5kUD76OcqXCK8tZ3djFyVtf8aprioBXkxg426oyeFs03ZLxZ9Q==
X-Received: by 2002:a17:907:c48c:b0:ac2:8db:7057 with SMTP id a640c23a62f3a-ac208db8caemr63118866b.3.1741106486392;
        Tue, 04 Mar 2025 08:41:26 -0800 (PST)
Date: Tue, 4 Mar 2025 17:41:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
Message-ID: <Z8ctNa9WFwYxnKuE@macbook.local>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
 <Z8GDpJ8G8qMz4uYD@macbook.local>
 <09a8e9dd-2839-49d5-9fff-d2c12c0dd3ed@amd.com>
 <Z8bUqTKSJ8rpMX8R@macbook.local>
 <3bd7ff2b-5f26-496b-a067-c6c1f79e7515@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bd7ff2b-5f26-496b-a067-c6c1f79e7515@amd.com>

On Tue, Mar 04, 2025 at 10:15:21AM -0500, Jason Andryuk wrote:
> On 2025-03-04 05:23, Roger Pau Monné wrote:
> > On Fri, Feb 28, 2025 at 03:25:52PM -0500, Jason Andryuk wrote:
> > > On 2025-02-28 04:36, Roger Pau Monné wrote:
> > > > On Thu, Feb 27, 2025 at 01:28:11PM -0500, Jason Andryuk wrote:
> > > > > On 2025-02-27 05:23, Roger Pau Monné wrote:
> > > > > > On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
> > > > > > > To work around this, we can, for per-device IRTs, program the hardware
> > > > > > > to use the guest data & associated IRTE.  The address doesn't matter
> > > > > > > since the IRTE handles that, and the Xen address & vector can be used as
> > > > > > > expected.
> > > > > > 
> > > > > > All this work on AMD because when interrupt remapping is enabled all
> > > > > > MSIs are handled by the remapping table, while on Intel there's still
> > > > > > a bit in the MSI address field to signal whether the MSI is using a
> > > > > > remapping entry, or is using the "compatibility" format (iow: no
> > > > > > remapping).
> > > > > 
> > > > > So, on Intel, if the guest hands the device the MSI address, it can decided
> > > > > to bypass remapping?
> > > > > 
> > > > > Thanks for providing insight into the Intel inner workings.  That's why I am
> > > > > asking.
> > > > 
> > > > Yes, sorry, I'm afraid I don't have any good solution for Intel, at
> > > > least not anything similar to what you propose to do on AMD-Vi.  I
> > > > guess we could take a partial solution for AMD-Vi only, but it's
> > > > sub-optimal from Xen perspective to have a piece of hardware working
> > > > fine on AMD and not on Intel.
> > > 
> > > I only need AMD to work ;)
> > > 
> > > But yeah, I thought I should make an effort to get both working.
> > 
> > Kind of tangential to this approach.  Do you know which register(s)
> > are used to store the non-architectural MSI address and data fields?
> > 
> > I'm wondering if it simply would be easier to introduce a quirk for
> > this device in vPCI (and possibly QEMU?) that intercepts writes to the
> > out of band MSI registers.  That should work for both Intel and AMD,
> > but would have the side effect that Xen would need to intercept
> > accesses to at least a full page, and possibly forward accesses to
> > adjacent registers.
> 
> From the QEMU part of the vfio hack:
> * We therefore come up with a really crude quirk that looks for values
> * written to the ATH11K_PCI_WINDOW (defined in Linux driver as starting
> * at 0x80000 with an 18-bit mask, ie. 256k) that match the guest MSI
> * address.  When found we replace the data with the host physical
> * address and set a cookie to match the MSI data write, again replacing
> * with the host value and clearing the cookie.
> 
> https://lore.kernel.org/ath11k/20240812170045.1584000-1-alex.williamson@redhat.com/
> 
> This is inside BAR0, AIUI.  I'm guessing, but I think the driver puts them
> into a command ring, so it's not a fixed location.  The large area, and
> since we won't normally intercept BAR access, made me not want to pursue
> this.

Oh, I see, it's not a fixed register, but something like a command
queue.  Great, that makes it way worse to deal with.  It would also
imply that Xen would need to possibly map the whole 256k ring in order
to forward requests to the hardware.

I would like for a solution that covers both Intel and AMD, but I
don't have the card myself to test or develop any of those solutions,
so I think having a solution that works on AMD is likely better than
having no solution at all.  Whoever wants to use the card on Intel
will have to come up with a solution there.

Thanks, Roger.

