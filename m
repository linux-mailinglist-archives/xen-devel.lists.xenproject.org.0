Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FFA6AD6F2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 06:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507202.780453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQ73-0005kH-62; Tue, 07 Mar 2023 05:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507202.780453; Tue, 07 Mar 2023 05:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQ73-0005gt-2h; Tue, 07 Mar 2023 05:43:49 +0000
Received: by outflank-mailman (input) for mailman id 507202;
 Tue, 07 Mar 2023 05:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8Ij=67=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pZQ70-0005gn-S9
 for xen-devel@lists.xen.org; Tue, 07 Mar 2023 05:43:47 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0357a4e1-bcab-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 06:43:45 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id p20so12906727plw.13
 for <xen-devel@lists.xen.org>; Mon, 06 Mar 2023 21:43:41 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 s9-20020aa78d49000000b00593baab06dcsm7141652pfe.198.2023.03.06.21.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 21:43:38 -0800 (PST)
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
X-Inumbo-ID: 0357a4e1-bcab-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678167819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JyZwio1/+xEWEzxkU6lojpUS2ztMZWUFHUjMcU1o9Ac=;
        b=o16eilWBr6zovjyWBhZARYVUNpNVmCZ957WBaB90uj7v0ijWyRBXmC7axWu8HUZPyg
         KqtIzrubb7yLJoVYDDZjm8XSUkAGsxsVMF9j0TaooAIhC06dzpsknR7pU+ntUYNBPIYT
         L7y1UFhH7xiji8e84ojd1iOgzmq/UBxzbkvGoVJ+KKxlHycKVg9CHQ1yapCkzDtiCZXd
         furkDTqHtAcgVuaERH1QSL3vMTrnJZHGg9Rl4Gf9Vz1r5GnKsMD0qQf1lZAVUWBPkp7l
         WKFe79gq/A1iq09ibizZAB9etxoUb6KR8vArQ+xrG08rqo9LuI4R39iZlL6K/d//KcJj
         fk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678167819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyZwio1/+xEWEzxkU6lojpUS2ztMZWUFHUjMcU1o9Ac=;
        b=VsyHUktcrsLlkTFhr12YwsiE9dDckGQ+vRed6UyeiF+Bw2XCd7aED7mYVQ2W+Fknj4
         WYsDDDhhOADWgNThDYmimnR+HA3gHCKUtP9brdq1a+BuBYH1SdsoyHWpGM7gxMeMYFQ1
         Y2nOQnxaDtn7EfVonI9iIs6Q3D5dkmJgJSK8KVQJFTDb1JcDkINEviAvVxoZy+b8TWYZ
         B6avz6EpVq9mmrC5T/uBjK7omikC1EuH/UtNs9sqKXWbYCm1sgMERNpAUHzxdMPEbBZJ
         ZIkzBNxnhkvjNMglVlQ+n8YT3Lu/Yl6pEKqUAiMdqube7bNeO83sMv6mDQlK+opNbFjI
         ULwg==
X-Gm-Message-State: AO0yUKW0CFQaWsuRaguhjUMbhWMlglCDkyeLwjbhjrFEP7fgcJtBzw+Y
	6/bHstjE1Mq3PFjqgxSY9Ct9OA==
X-Google-Smtp-Source: AK7set89vFW4+ayrW7cytv4tRdqoqnfUXD2/9IyuD77nfB09OVscnz1hGiNeFSav+nWeZHFOSm9Lqg==
X-Received: by 2002:a05:6a20:7d88:b0:cc:a5d6:4471 with SMTP id v8-20020a056a207d8800b000cca5d64471mr17965217pzj.58.1678167819311;
        Mon, 06 Mar 2023 21:43:39 -0800 (PST)
Date: Tue, 7 Mar 2023 11:13:36 +0530
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
Subject: Re: [PATCH V2] docs: vhost-user: Add Xen specific memory mapping
 support
Message-ID: <20230307054336.uvky5d7q2qqlxdcv@vireshk-i7>
References: <7c3c120bcf2cf023e873800fd3f55239dd302e38.1678100850.git.viresh.kumar@linaro.org>
 <20230306153451.GB51288@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306153451.GB51288@fedora>

On 06-03-23, 10:34, Stefan Hajnoczi wrote:
> On Mon, Mar 06, 2023 at 04:40:24PM +0530, Viresh Kumar wrote:
> > +Xen mmap description
> > +^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-------+-------+
> > +| flags | domid |
> > ++-------+-------+
> > +
> > +:flags: 64-bit bit field
> > +
> > +- Bit 0 is set for Xen foreign memory memory mapping.
> > +- Bit 1 is set for Xen grant memory memory mapping.
> > +- Bit 2 is set if the back-end can directly map additional memory (like
> > +  descriptor buffers or indirect descriptors, which aren't part of already
> > +  shared memory regions) without the need of front-end sending an additional
> > +  memory region first.
> 
> I don't understand what Bit 2 does. Can you rephrase this? It's unclear
> to me how additional memory can be mapped without a memory region
> (especially the fd) is sent?

I (somehow) assumed we will be able to use the same file descriptor
that was shared for the virtqueues memory regions and yes I can see
now why it wouldn't work or create problems.

And I need suggestion now on how to make this work.

With Xen grants, the front end receives grant address from the from
guest kernel, they aren't physical addresses, kind of IOMMU stuff.

The back-end gets access for memory regions of the virtqueues alone
initially.  When the back-end gets a request, it reads the descriptor
and finds the buffer address, which isn't part of already shared
regions. The same happens for descriptor addresses in case indirect
descriptor feature is negotiated.

At this point I was thinking maybe the back-end can simply call the
mmap/ioctl to map the memory, using the file descriptor used for the
virtqueues.

How else can we make this work ? We also need to unmap/remove the
memory region, as soon as the buffer is processed as the grant address
won't be relevant for any subsequent request.

Should I use VHOST_USER_IOTLB_MSG for this ? I did look at it and I
wasn't convinced if it was an exact fit. For example it says that a
memory address reported with miss/access fail should be part of an
already sent memory region, which isn't the case here.

> This message modifies the behavior of subsequent
> VHOST_USER_SET_MEM_TABLE and VHOST_USER_ADD_MEM_REG messages. The memory
> region structs can be extended and then VHOST_USER_SET_XEN_MMAP isn't
> needed.
> 
> In other words:
> 
>   When VHOST_USER_PROTOCOL_F_XEN_MMAP is negotiated, each "Memory
>   regions description" and "Single memory region description" has the
>   following additional fields appended:
> 
>   +----------------+-------+
>   | xen_mmap_flags | domid |
>   +----------------+-------+

This looks fine.

-- 
viresh

