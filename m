Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52BADB7B8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 19:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017526.1394521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRDYI-00075q-Jl; Mon, 16 Jun 2025 17:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017526.1394521; Mon, 16 Jun 2025 17:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRDYI-00072j-H8; Mon, 16 Jun 2025 17:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1017526;
 Mon, 16 Jun 2025 17:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppVY=Y7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRDYG-00072d-Vd
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 17:23:21 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b6a797-4ad6-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 19:23:17 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so2727228f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 10:23:17 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568b089d8sm11796159f8f.57.2025.06.16.10.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 10:23:16 -0700 (PDT)
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
X-Inumbo-ID: 97b6a797-4ad6-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750094597; x=1750699397; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1tTYRtnAqp4wvvQwALHvpwDN0tZv49JWHfk+Pwsv8rE=;
        b=aU9sZO888S9P60VHoDPt7VQWRi1Ll7U8ZQPtv2yhWhQIR3qg8lilrgkozacfmScLAz
         Oo2j1VSEe7B/yd9TXwU7VI2LeLRvssubdjGlZH9Re91iRUY1+YIYi2rJeGqx+8NbzI9s
         LKGcGlF6MkJ7oFP2ku+Jw+xithnTwhBF9sjUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750094597; x=1750699397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tTYRtnAqp4wvvQwALHvpwDN0tZv49JWHfk+Pwsv8rE=;
        b=ANsr87nHOrGgZBbAsdRm43aar+njxPHvVlQFUKl9Q1IfwyNVOTOHOPquM9VE2sulGR
         fNrdjvUdbYu/blj9sx6wb+cmWebRea3NsIOBGFqLceWrLY5ZPS0xHp7117eUPjJZZ5fE
         MoYa8QNbFcufOw1IHXNp9sVutrNIINzovsqf8H+i1Rq/h92u5HeOYQosJhSXhSKepNkO
         1caoPTYgYzuxGQCBzZnxVRXVJiqwU0mdggdZ0oq8WmwxiPozyHdECAjf3WLGBR75tTQ4
         W96VRCj6oh5/EfKJGnSEzvTpdMZzSw6sheZfgUGAJdIvBDOyMc1OjL/aYwJhv/CtBVuG
         u3Uw==
X-Gm-Message-State: AOJu0YxVYJrvJWVXjsadSpLu2koOUaH3vAqmFLuLyAMjYrYzt4jXiaGx
	1LR6PetQkBKXk9MbrCPuDV0PPuabHUiX2eZkrGVn3EU4Nl8pm/cjyt7s2vB2dLdzHck=
X-Gm-Gg: ASbGncuqYl923gm0NE5qJWmjdKby94A5Bgq7h48i9/i/Z3enOOcYJ7tB0NCQcqxk+2a
	t8FBZ2TBvYjoYjF6oni3jqk/NzmFqR32Hy6DjYQ5Oh4P1wzsydTFb5A/SUcTEQDsJ9SLaVUROAZ
	jrWL+1SAiz95W2R2LENxwM/pB+COWZGrBrYUY61RwhRT62L8VpSo3gVyLzHMFZJWuyEh1WAPQNG
	PmgjUtBgcmQyU5siHQWBrv8Rzz3PKQbS7Q18KtbbXmaSrUksj3rfBVolQ4shMb1wxrOVm++HCZp
	YZ4IINAv8EOMnCp5qzTc9a1eeadg1PS7MhJrrM7IYMbaRaymarMYB22VMlhPdvLO8qj+OSfQmqt
	ysWgAdclEliJ5Zga/EabGFDAdw6qxug==
X-Google-Smtp-Source: AGHT+IFsVvsCBUebKHfHNpC0O96NEaolrNVy3e1bogKCd9jsSASq9I+jj1dtbJVf2PLT/4axNU4www==
X-Received: by 2002:a5d:5f48:0:b0:3a4:d8b6:ca3f with SMTP id ffacd0b85a97d-3a5723a291dmr7525543f8f.30.1750094597225;
        Mon, 16 Jun 2025 10:23:17 -0700 (PDT)
Date: Mon, 16 Jun 2025 19:23:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
Message-ID: <aFBTA3wklAejAUPT@macbook.local>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
 <aFAuRXSryHKj3jVa@macbook.local>
 <2969b5d8-5879-4674-8332-046898e17257@suse.com>
 <aFA7OiV8AX-ua-W_@macbook.local>
 <a56574c0-6744-4249-9410-60858f49d04c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a56574c0-6744-4249-9410-60858f49d04c@suse.com>

On Mon, Jun 16, 2025 at 06:02:07PM +0200, Jan Beulich wrote:
> On 16.06.2025 17:41, Roger Pau Monné wrote:
> > On Mon, Jun 16, 2025 at 05:20:45PM +0200, Jan Beulich wrote:
> >> On 16.06.2025 16:46, Roger Pau Monné wrote:
> >>> One question I have though, on systems with a low amount of memory
> >>> (let's say 8GB), does this lead to an increase in domain construction
> >>> time due to having to fallback to order 0 allocations when running out
> >>> of non-DMA memory?
> >>
> >> It'll likely be slower, yes, but I can't guesstimate by how much.
> > 
> > Should there be some way to control this behavior then?  I'm mostly
> > thinking about client systems like Qubes where memory is likely
> > limited, and the extra slowness to create VMs could become
> > noticeable?
> 
> What kind of control would you be thinking of here? Yet another command
> line option?

I guess that would be enough.  I think we need a way to resort to the
previous behavior if required, and likely a CHANGELOG entry to notice
the change.

Overall, would it be possible to only include the flag if we know
there's non-DMA memory available to allocate?  Otherwise we are
crippling allocation performance when there's only DMA memory left.

That also raises the question whether it's an acceptable trade-off to
possibly shatter p2m super pages (that could be used if allocating
from the DMA pool) at the expense of not allocating from the DMA pool
until there's non-DMA memory left.

Thanks, Roger.

