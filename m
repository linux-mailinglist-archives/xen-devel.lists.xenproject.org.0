Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE296B637
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789936.1199597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slm3Q-0007GY-H3; Wed, 04 Sep 2024 09:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789936.1199597; Wed, 04 Sep 2024 09:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slm3Q-0007Ep-EW; Wed, 04 Sep 2024 09:11:56 +0000
Received: by outflank-mailman (input) for mailman id 789936;
 Wed, 04 Sep 2024 09:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slm3P-0007Eg-HT
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:11:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba2b376d-6a9d-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 11:11:53 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86a37208b2so750165766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:11:53 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922295csm779359366b.198.2024.09.04.02.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:11:52 -0700 (PDT)
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
X-Inumbo-ID: ba2b376d-6a9d-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725441113; x=1726045913; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MO+oyj5zYAzpSBIjTdcU1e1dG+oVLnNy00UIPTl9CRk=;
        b=DFXA7GPXLu+ibmLn0k7hEU9GNWbr4FiTFSGZTZUyGVyaeDcBwmV0uEybZA5zcbzP5d
         CtwtPs2g6Gua9P42qfV0JZSYnzkQ7eXetUqQlJl0dp6c0n7+DAWBKYXzr1n/3EYz+vRa
         Ly+L9n9Bnb14+riGAgI78oLlnRX7hQa7sTKzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725441113; x=1726045913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MO+oyj5zYAzpSBIjTdcU1e1dG+oVLnNy00UIPTl9CRk=;
        b=NvjScMUrfJ+62BnwhfruPIj6XpCvhKSkMFd2JYvyi/5g4QtpEixS4Z79fpfor0NSfB
         j18SE3310f8Bc51Lzj4SIxcId6R2M4Ll57kRsexLTkcYHwIbkHBb5Gl249P6gOgj3x3M
         S9wTHuOPdcVTDmwdxeV8iMJ7aJZAeFx4xSRYnEfXXRe9NtW9Qr3e+tBp0QiXmHO+04tm
         LynPZ1yP+OxKEkKRUTdop416QASiZChp1/1mkIiGWG6RNlm5bVsY79V8Eok0jirFSLyf
         hIAWAO1Xg018uxgMug6/gXJF13n3J9qzHMBXYCzvo8lOHBQbV0MXIgvXpOg3gFwr8xOt
         X72A==
X-Forwarded-Encrypted: i=1; AJvYcCW6SSmehBzSydI/4zIAO+BUP6JHPEf3TghBQwQFzPUCz0VikuiBpil+kz8vAbRruvNRbhWvS32kJhU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8hQEAxPGE+fM7CEy3fneH1v9mkQuPB13rJShZjmGcPOHv4Y3y
	YkCKHZpjxbM8fpBnNohA0C1uyWiO9h2qcah38x7aTdSJQWfGxoQiSpqmDysbQzY=
X-Google-Smtp-Source: AGHT+IGXJ0L53M5ftyFlZI8v2GlEahvMRa3XEuYtDblE/Hm3llSj4pT1cmvElr9uQItFEsedMlaLkQ==
X-Received: by 2002:a17:907:72d3:b0:a88:a48d:2b9a with SMTP id a640c23a62f3a-a897fa74459mr1491550766b.52.1725441112769;
        Wed, 04 Sep 2024 02:11:52 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:11:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: paul@xen.org
Cc: Jan Beulich <jbeulich@suse.com>, Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZtgkVzByhyXjaIqY@macbook.local>
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
 <ZtgYnAeXSamlGKgC@macbook.local>
 <c3f6df7e-780e-4c00-9d09-95d690166878@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3f6df7e-780e-4c00-9d09-95d690166878@xen.org>

On Wed, Sep 04, 2024 at 09:39:17AM +0100, Paul Durrant wrote:
> On 04/09/2024 09:21, Roger Pau Monné wrote:
> > > In the absence of that I'm afraid it is a little harder to
> > > judge whether the proposal here is the best we can do at this point.
> > 
> > While I don't mind looking at what we can do to better handle 4K
> > sector disks, we need IMO to revert to the specification before
> > 67e1c050e36b, as that change switched the hardcoded sector based units
> > from 512 to 'sector-size', thus breaking the existing ABI.
> > 
> 
> But that's the crux of the problem. What *is* is the ABI? We apparently
> don't have one that all OS subscribe to.

At least prior to 67e1c050e36b the specification in blkif.h and (what
I consider) the reference implementation in Linux blk{front,back}
matched.  Previous to 67e1c050e36b blkif.h stated:

/*
 * NB. first_sect and last_sect in blkif_request_segment, as well as
 * sector_number in blkif_request, are always expressed in 512-byte units.
 * However they must be properly aligned to the real sector size of the
 * physical disk, which is reported in the "physical-sector-size" node in
 * the backend xenbus info. Also the xenbus "sectors" node is expressed in
 * 512-byte units.
 */

I think it was quite clear, and does in fact match the implementation
in Linux.

> From your findings it appears that the only thing that will work globally is
> to define 'sector-size' is strictly 512 and deprecate any large sector size
> support of any kind.

As said to Anthony, how do we deal with disks with 4K logical sectors?
I'm not really up for implementing read-modify-write in blkback on
Linux, as it would be complex, slow, and likely prone to errors.

We could introduce a new feature (`logical-sector-size` or some such?)
to expose a sector size != 4K, but we might as well just fix existing
implementations to match with the specification, as that's overall
less changes.

In kernel Linux blk{front,back} have always worked fine with 4K sector
disks, and did match the specification prior to 67e1c050e36b.  Let's
clarify the specification as required and fix the remaining front and
backends to adhere to it.

Thanks, Roger.

