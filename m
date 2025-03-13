Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8304A5ECCF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 08:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911279.1317726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscs9-0005nu-7G; Thu, 13 Mar 2025 07:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911279.1317726; Thu, 13 Mar 2025 07:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscs9-0005lL-4R; Thu, 13 Mar 2025 07:20:53 +0000
Received: by outflank-mailman (input) for mailman id 911279;
 Thu, 13 Mar 2025 07:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qPCs=WA=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tscs7-0005lB-HJ
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 07:20:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af59e818-ffdb-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 08:20:49 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-L1Youx75MRqpbrHvDwdjUA-1; Thu, 13 Mar 2025 03:20:45 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so2792595e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 00:20:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2af42sm10316185e9.32.2025.03.13.00.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 00:20:43 -0700 (PDT)
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
X-Inumbo-ID: af59e818-ffdb-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741850447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4bfYEIbp/kS2X2cwGn1CJqsR/J4F2IpC4H45RKU2a4=;
	b=FqJo5nOPWDZvXMnUaMq8yz7DAur3XgvRRlldH1KzVjncJ0fRNlVzjqNZFuXxvAjubh5CLt
	5jKxjXawWTfdH8AWnvBzqXRPxrEq0ySpYNjo+t4cSIWfVKj7VHmk6qIelpyJAHuOg2rHkT
	6r9zYLj7QvIxHGSArTietsOR7zVC46A=
X-MC-Unique: L1Youx75MRqpbrHvDwdjUA-1
X-Mimecast-MFC-AGG-ID: L1Youx75MRqpbrHvDwdjUA_1741850444
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741850444; x=1742455244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4bfYEIbp/kS2X2cwGn1CJqsR/J4F2IpC4H45RKU2a4=;
        b=mWTVmwHYEPA5NocIsz7aslU/YD3DfbROHO+FGZWDWY9OsjGxdAiBTazDmRhVia/s18
         0XVbaa257X7gOictjQGBTiCYiwD5GQGQRPAOmdYRcHAU4cYpAOOylnTWz00JHtDsJN/h
         oQN3Jjp2HP6IOE6hq7Yw+idSQappPcBf3NnYD2fOMVAND70cUYexRB6KTVcjVN6rAOtW
         DhMBjAuzB9pWtuUQq8h087n3bZEsyHzysNl5Vs1414B6tZVLteF9GzbOWozregDGUlpF
         unKtgd7VKxzkDb2kur72tbEuX9xBiWfvddEZeiSJ2+SLkz15puRJ385j07UGq5xd2Xp5
         CjMw==
X-Forwarded-Encrypted: i=1; AJvYcCUybLHffzuZhSLMu9uWPzP21BWU9BvFFG4ybCiEyOmBNaqGfne+onNVvNIYLXn9la6zi4BX9GLe6Ew=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5Xs0cGxkFjvHunatGmZ/0NtTv24+AM6QO1xw1VLtAI4BbBkiq
	/W5ceayKTVwDTmYMZr860ib0yOJOZGYtyohbmUW6Ah4lXJ5ipNLAaY24BwmZacB13en1upA25aj
	BZJg/veYGd0wXTW72qkkPF26KghiO+HqyRGFPaYX5P3kavNZ9ICUy3ZRJq/5NlBnK
X-Gm-Gg: ASbGncsphMBBuae+1hUeAHmcBv8ZGTx/J//GAeBaHG3HNIcWo+JLrwE6WZyAk8Cp93T
	nWHFgZT38OKm1Ogg8rH8YkcJQcpny9H6Xxr96p4bSkswvab1/8xwRfhc6CWbYldbCq/xc2AKOLa
	BU2QD+Vhkr4U25gIGQbBMg32xJYtrpoWW7s3tnKsPSz9MpBA1S7XJ8j7VOFgJDcIWyNwJkhYxMw
	748EuqE47mWcB+x9KOk2zeYNJUdXgaIAQAL0Lu/qkGLwb2DcLDyosRtBxEcxAjOr+fArfRkCCRY
	i7nv4OEdkQ==
X-Received: by 2002:a05:6000:144d:b0:391:2e58:f085 with SMTP id ffacd0b85a97d-39132dab192mr19228454f8f.54.1741850444462;
        Thu, 13 Mar 2025 00:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdSno6hSKVsk5d06B4EsgagrhEFS5vVdfXL2wu7cQUeZCwJ3oOQpqMw11c+iVNeKk+NLYSpA==
X-Received: by 2002:a05:6000:144d:b0:391:2e58:f085 with SMTP id ffacd0b85a97d-39132dab192mr19228411f8f.54.1741850444109;
        Thu, 13 Mar 2025 00:20:44 -0700 (PDT)
Date: Thu, 13 Mar 2025 03:20:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Nico Pache <npache@redhat.com>, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, cgroups@vger.kernel.org, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, nphamcs@gmail.com, yosry.ahmed@linux.dev,
	kanchana.p.sridhar@intel.com, alexander.atanasov@virtuozzo.com
Subject: Re: [RFC 1/5] meminfo: add a per node counter for balloon drivers
Message-ID: <20250313032001-mutt-send-email-mst@kernel.org>
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-2-npache@redhat.com>
 <c4229ea5-d991-4f5e-a0ff-45dce78a242a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c4229ea5-d991-4f5e-a0ff-45dce78a242a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXLjSn-FufnJVXC_lH-eH1jbJ_7JAhcdc1sw2cvzY2w_1741850444
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 12, 2025 at 11:19:06PM +0100, David Hildenbrand wrote:
> On 12.03.25 01:06, Nico Pache wrote:
> > Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
> > expose it through /proc/meminfo and other memory reporting interfaces.
> 
> In balloon_page_enqueue_one(), we perform a
> 
> __count_vm_event(BALLOON_INFLATE)
> 
> and in balloon_page_list_dequeue
> 
> __count_vm_event(BALLOON_DEFLATE);
> 
> 
> Should we maybe simply do the per-node accounting similarly there?


BTW should virtio mem be tied into this too, in some way? or is it too
different?

> -- 
> Cheers,
> 
> David / dhildenb


