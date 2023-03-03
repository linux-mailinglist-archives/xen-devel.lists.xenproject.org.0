Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15E6A922F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 09:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505617.778474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY0Vd-0005qV-HO; Fri, 03 Mar 2023 08:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505617.778474; Fri, 03 Mar 2023 08:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY0Vd-0005ok-Ef; Fri, 03 Mar 2023 08:11:21 +0000
Received: by outflank-mailman (input) for mailman id 505617;
 Fri, 03 Mar 2023 08:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nt4j=63=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pY0Vc-0005oe-3X
 for xen-devel@lists.xen.org; Fri, 03 Mar 2023 08:11:20 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d9c3a7-b99a-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 09:11:15 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso5342381pjr.5
 for <xen-devel@lists.xen.org>; Fri, 03 Mar 2023 00:11:14 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902aa4a00b0019e8915b1b5sm915163plr.105.2023.03.03.00.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:11:12 -0800 (PST)
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
X-Inumbo-ID: f6d9c3a7-b99a-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677831073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fvhd/CjcSxSDcDRaW2+sffBUEEjHgUO/YNJh3LIGeo=;
        b=HWRZF9hxScmW5iNVhnA8nAdnjUV6HaZ4NNs9hVYHU4ExCJm/ruch/KRQ4C4Ir4XSB6
         0b8wdSB4PvAEP97c2UBGYBVjqrNhs5YRPgq4FI2lNbjlhPeYnXWBcrFxNroCEncx4myB
         kXoDLNq1NYfiv1HAoW0xj1dUKeckHkBa1AnTIlvodsUO6gD+xKyhi994UetnvuKmBrmY
         udRlWHSFPGGxmjgx1ME2tLZB61VRW3Ybo05M4NscauQHokML6kT35W5Oi2fnwWK2Nzsi
         JeJ9+adFdCr0tcdYwmM7s6nKd9iombVLXAfxd2jX1wbY3laZJQI1V5Nae7DRnAa3yPkj
         KGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677831073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fvhd/CjcSxSDcDRaW2+sffBUEEjHgUO/YNJh3LIGeo=;
        b=BFtDUP21mjwvsjKf4PSK4/a22RL5yoPBsePx1VEccMHyHUv2/HGsAK10KkInTUqa+P
         MtQKiGM7AEsEkIFz66GBlq83EcZ7KcKqgSkeKXdq2VfUtxXj45WzoTbDKQqETIsIPMT9
         VwNrk2R8zkGj58mc/GkUnqO7QqYutUVdvyrEFR8J+uKcPZ+A0YZJr3Eo7x/CGwiGU/yJ
         0ESV95REOKQVQuOywskj5LJ9ZKDQanqtlXhjxlRclRNHAJ2nHDKU5eTVE/BAdEiaOXAh
         DTAez5LDSuZFjLX899j+K/ti5MGVGofKOLsiNeu/y5yaoZuF8j530RTy16Jc51bmk4YV
         Wq9A==
X-Gm-Message-State: AO0yUKVuxHZqGlodG9NUWqElqAGuwGRNoONbR7gpidI5dEO7g/wn5EhC
	ootfu3PyL49ndhAqWwwzJmACqw==
X-Google-Smtp-Source: AK7set9pwBoUqmQ648WFuJ9eNFtOCWgufbD4voyt0olq5F6HoZcChJO6380uERtNwEr//sigsXtTHg==
X-Received: by 2002:a17:902:e745:b0:19c:eaab:653d with SMTP id p5-20020a170902e74500b0019ceaab653dmr5095605plf.15.1677831072831;
        Fri, 03 Mar 2023 00:11:12 -0800 (PST)
Date: Fri, 3 Mar 2023 13:41:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <20230303081110.e6waldur3i7lzl6e@vireshk-i7>
References: <Y/9zkDAS4odz93GM@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/9zkDAS4odz93GM@fedora>

On 01-03-23, 10:47, Stefan Hajnoczi wrote:
> Resend - for some reason my email didn't make it out.

How about this (will send a formal patch later).

Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue Feb 21 14:36:30 2023 +0530

    docs: vhost-user: Add Xen specific memory mapping support

    The current model of memory mapping at the back-end works fine where a
    standard call to mmap() (for the respective file descriptor) is enough
    before the front-end can start accessing the guest memory.

    There are other complex cases though where the back-end needs more
    information and simple mmap() isn't enough. For example Xen, a type-1
    hypervisor, currently supports memory mapping via two different methods,
    foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
    both these cases, the back-end needs to call mmap() and ioctl(), and
    need to pass extra information via the ioctl(), like the Xen domain-id
    of the guest whose memory we are trying to map.

    Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
    the back-end know about the additional memory mapping requirements.
    When this feature is negotiated, the front-end can send the
    'VHOST_USER_SET_XEN_MMAP' message type to provide the additional
    information to the back-end.

    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424eb0..8be5f5eae941 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,24 @@ Inflight description

 :queue size: a 16-bit size of virtqueues

+Xen mmap description
+^^^^^^^^^^^^^^^^^^^^
+
++-------+-------+
+| flags | domid |
++-------+-------+
+
+:flags: 64-bit bit field
+
+- Bit 0 is set for Xen foreign memory memory mapping.
+- Bit 1 is set for Xen grant memory memory mapping.
+- Bit 2 is set if the back-end can directly map additional memory (like
+  descriptor buffers or indirect descriptors, which aren't part of already
+  shared memory regions) without the need of front-end sending an additional
+  memory region first.
+
+:domid: a 64-bit Xen hypervisor specific domain id.
+
 C structure
 -----------

@@ -867,6 +885,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17

 Front-end message types
 -----------------------
@@ -1422,6 +1441,23 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.

+``VHOST_USER_SET_XEN_MMAP``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: Xen mmap description
+  :reply payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+  successfully negotiated, this message is submitted by the front-end to set the
+  Xen hypervisor specific memory mapping configurations at the back-end.  These
+  configurations should be used to mmap memory regions, virtqueues, descriptors
+  and descriptor buffers. The front-end must send this message before any
+  memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_TABLE`` or
+  ``VHOST_USER_ADD_MEM_REG`` message types. The front-end can send this message
+  multiple times, if different mmap configurations are required for different
+  memory regions, where the most recent ``VHOST_USER_SET_XEN_MMAP`` must be used
+  by the back-end to map any newly shared memory regions.
+

 Back-end message types
 ----------------------

-- 
viresh

