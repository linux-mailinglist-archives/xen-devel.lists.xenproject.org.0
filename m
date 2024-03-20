Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B788138B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:42:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695959.1086344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmx9G-0005s6-LB; Wed, 20 Mar 2024 14:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695959.1086344; Wed, 20 Mar 2024 14:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmx9G-0005qI-I4; Wed, 20 Mar 2024 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 695959;
 Wed, 20 Mar 2024 14:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z2Qb=K2=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1rmx9F-0005qB-G3
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:42:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 145d1188-e6c8-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:42:31 +0100 (CET)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-Wxepv2U9OmeF6JRKW-vBwA-1; Wed, 20 Mar 2024 10:42:28 -0400
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3c38e3efb8aso463510b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:42:28 -0700 (PDT)
Received: from x1n ([99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 ge16-20020a05622a5c9000b00430b79aaa1esm5775620qtb.94.2024.03.20.07.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 07:42:27 -0700 (PDT)
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
X-Inumbo-ID: 145d1188-e6c8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710945750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmYNCVj1qYxPr/KiXOpLo9If0W3ioxfEJHjY6ipJGAg=;
	b=KMkEieClrqdb1HKf3Rs+hXMmu5JxJ4BTs0AtWNHsIxLdz1R+PLslw7XQgcxvLzcgesAmF3
	OmVtqyI8dqs+DBnzDHy5fgt7rK8pk+sENHHJpYqY4hjQYmu8tij/REP/ivuynHSQ58Ruq+
	+k/ggYRwGX88KeJXTQGjnNOIyQcUyy0=
X-MC-Unique: Wxepv2U9OmeF6JRKW-vBwA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945748; x=1711550548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmYNCVj1qYxPr/KiXOpLo9If0W3ioxfEJHjY6ipJGAg=;
        b=Vw48kg7hpVmrk/Vj2HsiP6eEzXtPk2g1IwQFXzrUXm3LP83j84L0NWO6xAtLfAhx4u
         1aWttGCobfo8qnXN7vvdY3C2tsy50C3WEfu/te68osrHhtLh43Te4XXDXR0PA62VT+Ly
         xZ3xtcoN5Y9bYzO+m1QbbXrQ2pl65DqNh8GwLYl49MAozisLeqhbWTfBfpOOjn+03hVx
         ROAllCxyrwrUNNZ73OcbrBN1dnu9k8zO8/SHvEakltxfQKprbbhvJSHb3aIDwT/JaPb3
         9XahMAKjD7hIoWe6H5ArKe2bvU8Cih4HrIeKIPlJeOC77nPvX85VyHM+8zM4nwI/wYmC
         +urg==
X-Forwarded-Encrypted: i=1; AJvYcCXUDF5bM33OUjfvx4RjuimI82RWAcOT71AoIoEIKZeU2HprO4bGjIxPOI1GT9DoucyuHJbBdW7Pdcq7IYBtlBSz0ftV0HWWdCtp1EkHCIU=
X-Gm-Message-State: AOJu0YxAuDQ/sWGMt80GTp6n2QEucrco8FhxX0PumO1M9VGIg/8Tu9g/
	7UZuBCdqxYgzRM3KfmOQ9NyV2QPnmXhtIuyhJkfePeflF2vXPdPrD5pbk4XWQINWqeLiJYBYqbb
	wzSKm+FrjXz0hKu7BUe7uHNmlMqTUEMTqLNJgltSiB7L4Sxajq8yEwDGkjvGoF5a8
X-Received: by 2002:a05:6808:1508:b0:3c3:62e8:b257 with SMTP id u8-20020a056808150800b003c362e8b257mr17461016oiw.2.1710945747861;
        Wed, 20 Mar 2024 07:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG1VX1WcbuhKZfwJ8zAztngTa7EDORJFVVDVVSW2Mx3OJakfgoqiSm2eUrIxhK5KuwSOm0dQ==
X-Received: by 2002:a05:6808:1508:b0:3c3:62e8:b257 with SMTP id u8-20020a056808150800b003c362e8b257mr17460978oiw.2.1710945747404;
        Wed, 20 Mar 2024 07:42:27 -0700 (PDT)
Date: Wed, 20 Mar 2024 10:42:24 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Avihai Horon <avihaih@nvidia.com>,
	Markus Armbruster <armbru@redhat.com>,
	Prasad Pandit <pjp@fedoraproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-9.1 v5 09/14] memory: Add Error** argument to
 .log_global_start() handler
Message-ID: <Zfr10JG2dTChsLVj@x1n>
References: <20240320064911.545001-1-clg@redhat.com>
 <20240320064911.545001-10-clg@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240320064911.545001-10-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 20, 2024 at 07:49:05AM +0100, Cédric Le Goater wrote:
> Modify all .log_global_start() handlers to take an Error** parameter
> and return a bool. Adapt memory_global_dirty_log_start() to interrupt
> on the first error the loop on handlers. In such case, a rollback is
> performed to stop dirty logging on all listeners where it was
> previously enabled.
> 
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Still one comment below:

> @@ -3014,8 +3044,11 @@ static void listener_add_address_space(MemoryListener *listener,
>          listener->begin(listener);
>      }
>      if (global_dirty_tracking) {
> +        /*
> +         * Migration has already started. Assert on any error.

If you won't mind, I can change this to:

  /*
   * Currently only VFIO can fail log_global_start(), and it's not allowed
   * to hotplug a VFIO device during migration, so this should never fail
   * when invoked.  If it can start to fail in the future, we need to be
   * able to fail the whole listener_add_address_space() and its callers.
   */

Thanks,

> +         */
>          if (listener->log_global_start) {
> -            listener->log_global_start(listener);
> +            listener->log_global_start(listener, &error_abort);
>          }
>      }
>  
> -- 
> 2.44.0
> 

-- 
Peter Xu


