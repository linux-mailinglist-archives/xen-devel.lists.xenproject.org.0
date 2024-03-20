Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB3881458
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695989.1086429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxiY-0007m6-33; Wed, 20 Mar 2024 15:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695989.1086429; Wed, 20 Mar 2024 15:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxiY-0007jt-0N; Wed, 20 Mar 2024 15:19:02 +0000
Received: by outflank-mailman (input) for mailman id 695989;
 Wed, 20 Mar 2024 15:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z2Qb=K2=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1rmxiW-0007jn-ID
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:19:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c25b0d5-e6cd-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:18:58 +0100 (CET)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-VJeJH2OhPzS6Mj8uCoEixw-1; Wed, 20 Mar 2024 11:18:56 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-69152af7760so10847076d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:18:56 -0700 (PDT)
Received: from x1n ([99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 gi6-20020a056214248600b0069068161388sm7946153qvb.131.2024.03.20.08.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 08:18:54 -0700 (PDT)
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
X-Inumbo-ID: 2c25b0d5-e6cd-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710947937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2DvitvJUAGQ+uBsIXNwcAKXy9/+kL0SU0v8MLPW744=;
	b=cbPI//N5XDlJFtuAdFX937qVYzi2C1kchSodgU1j2LIsH82MWq2dlBiVIPLYAAQKuw32M6
	F47imKviw18OCt3R8nTFMFVooJ0blk82Ul/zNjte3v1x+CzxWv3srvqWCuKWfSdHWISdog
	XLvui1+v7T3qQN7ILufm5IpRm3I7a94=
X-MC-Unique: VJeJH2OhPzS6Mj8uCoEixw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947935; x=1711552735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2DvitvJUAGQ+uBsIXNwcAKXy9/+kL0SU0v8MLPW744=;
        b=VyR1r4CVDnX+qT6xMtSNcoH8kGLLGlK4Fs9VJQTvE8dPfSaYQVZe5OcVHb2XXFGub9
         BhUaTpApvGXAukvhN9cNcrht+yYud7GbH+Sq4tD9gXgiK678j8imW+12mQtZj5NMsB05
         dZy21KdAUJi2woWY+0Cpgh5seobYEIcWLsa5S91KFS5p/rMndJBjVMVx/wk0xwmLIbzB
         VdTAmximhpMR3NaoXNbQb2qzhMbNlwTOuhR8lQfA3lQdkctdiUuQKuME8pve/wYpIs2s
         /1TKHcxlr47xcCRRCatlQuLxYO5PJvFjgVm5vBOeIYU81f7dKxb0fv/X2gu/NGOfdj6K
         EXlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPiSX06fQMajNphkLaWm8vnsAXln+fCClvLw4dfAhbPK1pSN2QVNw4VxeX3DmRUFiaDlm7GjZKf1zNrwdiDNFwrVfM9vf/Rsv0pkE6ekw=
X-Gm-Message-State: AOJu0YwDzEFcz0+CV5OANt2kiF0Xzhugw4UkpDrRd97vK+XKLEcdwMbJ
	rYrTalAKy+IZuqGyKC1qK95CUSEmmPM8r+q1LzlwdVuaXLJFMaotgQ/CYIqnQzZ/nWOtzYwFq5q
	XOpduCRxnxrUiuS9xNBofvIprFmNEVm69zsYpAwlBYlMb1CLpYFmMfKpSCH6Ks0HK
X-Received: by 2002:a05:6214:2c0a:b0:691:ca1:ce8a with SMTP id qq10-20020a0562142c0a00b006910ca1ce8amr17165769qvb.6.1710947935427;
        Wed, 20 Mar 2024 08:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbL7zZQNMBAIJ0oNJjyY75oTWKW14gtRa4+lC6J/hUqhi8KWup2nqqLGWT4/foNMc/P4lVhQ==
X-Received: by 2002:a05:6214:2c0a:b0:691:ca1:ce8a with SMTP id qq10-20020a0562142c0a00b006910ca1ce8amr17165742qvb.6.1710947934926;
        Wed, 20 Mar 2024 08:18:54 -0700 (PDT)
Date: Wed, 20 Mar 2024 11:18:51 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Hyman Huang <yong.huang@smartx.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alex Williamson <alex.williamson@redhat.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Markus Armbruster <armbru@redhat.com>,
	Prasad Pandit <pjp@fedoraproject.org>,
	xen-devel@lists.xenproject.org,
	Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH for-9.1 v5 11/14] memory: Add Error** argument to the
 global_dirty_log routines
Message-ID: <Zfr-W0aubJC_lfaK@x1n>
References: <20240320064911.545001-1-clg@redhat.com>
 <20240320064911.545001-12-clg@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240320064911.545001-12-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 20, 2024 at 07:49:07AM +0100, Cédric Le Goater wrote:
> Now that the log_global*() handlers take an Error** parameter and
> return a bool, do the same for memory_global_dirty_log_start() and
> memory_global_dirty_log_stop(). The error is reported in the callers
> for now and it will be propagated in the call stack in the next
> changes.
> 
> To be noted a functional change in ram_init_bitmaps(), if the dirty
> pages logger fails to start, there is no need to synchronize the dirty
> pages bitmaps. colo_incoming_start_dirty_log() could be modified in a
> similar way.
> 
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Hyman Huang <yong.huang@smartx.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>

Just to mention that for the rest users (dirtylimit/dirtyrate/colo) the
code still just keeps going even if start logging failed even after this
series applied as a whole.  Migration framework handles the failure
gracefully, not yet the rest.

That might be an issue for some, e.g., ideally we should be able to fail a
calc-dirty-rate request, but it's not supported so far.  Adding that could
add quite some burden to this series, so maybe that's fine to be done
later.  After all, having a VFIO device (that can fail a start_log()), plus
any of those features should be even rarer, I think?

It seems at least memory_global_dirty_log_sync() can be called even without
start logging, so I expect nothing should crash immediately. I spot one in
colo_incoming_start_dirty_log() already of such use.  My wild guess is it
relies on all log_sync*() hooks to cope with it, e.g. KVM ioctl() should
fail with -ENENT on most archs I think when it sees dirty log not ever
started.

For those bits, I'll wait and see whether Yong or Hailiang (cced) has any
comments. From generic migration/memory side, nothing I see wrong:

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


