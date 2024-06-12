Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03529050E8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739189.1146161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLar-0000Kp-RB; Wed, 12 Jun 2024 10:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739189.1146161; Wed, 12 Jun 2024 10:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLar-0000Hs-OG; Wed, 12 Jun 2024 10:52:41 +0000
Received: by outflank-mailman (input) for mailman id 739189;
 Wed, 12 Jun 2024 10:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHLaq-0000Hl-Q1
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:52:40 +0000
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [2607:f8b0:4864:20::a2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2403568-28a9-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:52:38 +0200 (CEST)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4e7eadf3668so2682941e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:52:38 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7977e0eb111sm233665285a.89.2024.06.12.03.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 03:52:37 -0700 (PDT)
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
X-Inumbo-ID: e2403568-28a9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718189558; x=1718794358; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YN+2joQB63AnNvNJYmaybfBAzJR2+D9Xvo6Lh7CUxc4=;
        b=OJBmPFyYMvLgZ02sogur5G+7/ZNb44G2mOp/bsBqjvzCbBPEGWDg6e72atIMdZAOpH
         RMzxJy09wxpoFM1NbVa41/uosyXITBhcvBsa0U9b0+wCSVgk75pgJi2ylIsjD0oo0HFr
         26rkbZo8uKtircM255WUlb5JZDXfp0dov5zGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189558; x=1718794358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YN+2joQB63AnNvNJYmaybfBAzJR2+D9Xvo6Lh7CUxc4=;
        b=VzVXinBR+Za9OonXizkNMWN4heggKWaBNSkQu8QMneyqcFQ4rx6PQ0ae5cg+hpBgkn
         qmMEj11oeN6YCWL+hlbtZF5X+w2eO3gvgn2wQCxJJl48to5NU4R8yT1ynHEYZyk+5oeQ
         iXSMw57akIl/4fFTz7vH4vs8cDL6NtUsDRhE1XUNQmPiP9Lo0XmZcRMoR/VJOXLQUMfX
         OzoCrRP1kA3TSFTXXATH6101Yp2hFGovlvBNjEhCTBVph9eJyx5mnbv4uqmpi4aGxW1Q
         QSouG6fE5q0KoIaz5iMSc1BgsjwtoPkchH71DzlY34GmsrxtnkC2VID3Yrt+RmhOrq3+
         CSpQ==
X-Gm-Message-State: AOJu0Yx+lVwbR+GXyzE7COMNy75icJ0gFEjQagRD165FA+yTrvKRM9hq
	1fQo1YQ+pRH3fb48LrTOWPeohckeNKTNVBB7J6uTqf72u5u3QZRdnS0spm6NhJ0=
X-Google-Smtp-Source: AGHT+IHfZNkRX6Vf1LsDt0h3dZnMW3/Xnztc/bst51K5CsXrvyjG0gvGapyk0X3zyPSdLdjevfKAGw==
X-Received: by 2002:a05:6122:2cd:b0:4df:1a3f:2ec1 with SMTP id 71dfb90a1353d-4ed07ab34ecmr1337076e0c.1.1718189557750;
        Wed, 12 Jun 2024 03:52:37 -0700 (PDT)
Date: Wed, 12 Jun 2024 12:52:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [PATCH for-4.19???] x86/physdev: replace physdev_{,un}map_pirq()
 checking against DOMID_SELF
Message-ID: <Zml984lQW1XcrG9_@macbook>
References: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>

On Wed, Jun 12, 2024 at 10:44:56AM +0200, Jan Beulich wrote:
> It's hardly ever correct to check for just DOMID_SELF, as guests have
> ways to figure out their domain IDs and hence could instead use those as
> inputs to respective hypercalls. Note, however, that for ordinary DomU-s
> the adjustment is relaxing things rather than tightening them, since
> - as a result of XSA-237 - the respective XSM checks would have rejected
> self (un)mapping attempts for other than the control domain.
> 
> Since in physdev_map_pirq() handling overall is a little easier this
> way, move obtaining of the domain pointer into the caller. Doing the
> same for physdev_unmap_pirq() is just to keep both consistent in this
> regard. For both this has the advantage that it is now provable (by the
> build not failing) that there are no DOMID_SELF checks left (and none
> could easily be re-added).
> 
> Fixes: 0b469cd68708 ("Interrupt remapping to PIRQs in HVM guests")
> Fixes: 9e1a3415b773 ("x86: fixes after emuirq changes")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder if we should introduce a helper to check for the current
domain:

#define is_current_domain(d) ((d) == current->domain)

Or similar.

Thanks, Roger.

