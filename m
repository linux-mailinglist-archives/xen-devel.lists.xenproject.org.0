Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C587861A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 18:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691555.1077633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjjBk-0004Kb-P9; Mon, 11 Mar 2024 17:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691555.1077633; Mon, 11 Mar 2024 17:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjjBk-0004IQ-LV; Mon, 11 Mar 2024 17:11:48 +0000
Received: by outflank-mailman (input) for mailman id 691555;
 Mon, 11 Mar 2024 17:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLWP=KR=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rjjBj-0004I7-DQ
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 17:11:47 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e6da1d-dfca-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 18:11:46 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso2653041f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 10:11:46 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bk15-20020a0560001d8f00b0033e3ce48ba1sm6929218wrb.16.2024.03.11.10.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 10:11:45 -0700 (PDT)
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
X-Inumbo-ID: 70e6da1d-dfca-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710177106; x=1710781906; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TbfT0KcT1M6xxN772/YoxmHDMjLUtwQdO+VOpR+uOQY=;
        b=G5UfIIAc9YaqISUu6Oe2ft+QDQDlm7kPix7uJRTwCKwVsQhdWHu1oPzFFi0w2/7yTk
         kc4rgVERQzXCPR8dBTnqj0E/ZbBTN8Y7X6mqKdsrDxG1Qnvw8bScluZV/hMEnuubatsj
         XxRaQyic60vVEjhYeOFr7LfVcrtlBx9BWGlaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710177106; x=1710781906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbfT0KcT1M6xxN772/YoxmHDMjLUtwQdO+VOpR+uOQY=;
        b=XHQTeOGBvEd0icDLBEfvagk1ADgEU+xtTunuFiKktCno3PiPBXldozSjU6/w7hJJbo
         lnzXlgn6/aOLfBEUUSwCQA+CfhQfiK2kbEi2tVaYSVQb+edvaCe4KRoiveULDm+R4Sku
         0pvak+eDBbBaeYwJKT1tBoCxd+P1rHCT8dAiyhk7act6/DrIwkwo2Y/0FFJUCXSNwnqF
         jgtsy+NECVJsixPTONNg5Sbcd4/Kz+8I5tKWnbiljVejqrIMVqwQqDv4O09gl2pEOSF0
         Dey4fuGQVr3feZVYC7+IhmYLdFjCKS4hbztmYBI4TL1FzTw5lVvAZZEDDGoqlZCsr253
         DsLw==
X-Gm-Message-State: AOJu0YwptMTV1B874i6mEwbRmQ3t1ER3NnrfE511yqAMiwt2VtJRayOv
	Qte32l9lwg7U3acjthUxO2yRy06Zq2Bi0iT4KvzPAdlHBWQ24jisx/laOaXRysV56SRIUmnAMMv
	D
X-Google-Smtp-Source: AGHT+IETd7Qp368uuLTAl0Jzcs5nz0Nv1G/xWNsI/Px/+M3SZihuCh7KRQUhaDYMABL0/w/W8x2wNQ==
X-Received: by 2002:adf:e9c7:0:b0:33d:284a:401 with SMTP id l7-20020adfe9c7000000b0033d284a0401mr4895232wrn.68.1710177105863;
        Mon, 11 Mar 2024 10:11:45 -0700 (PDT)
Date: Mon, 11 Mar 2024 17:11:44 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on x86
 + drop dom0 i386
Message-ID: <bc1c7338-7cbe-4794-b8df-1d06d913d8a1@perard>
References: <20240306114741.14564-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306114741.14564-1-anthony.perard@citrix.com>

On Wed, Mar 06, 2024 at 11:47:41AM +0000, Anthony PERARD wrote:
> linux-4.19 branch in xenbits is outdated, it haven't been updated and
> tested since 2020 as it has been disabled in osstest. Also, this 4.19
> branch doesn't build on Bookworm.
> 
> So we will start to use a newer version of Linux. We switch to 6.1 for
> the Arm* tests recently, so will use that same version for x86.
> 
> Also, following commit 3a3089c94913 ("mfi-common: Drop Linux dom0 i386
> tests for newer Linux branches"), 32bit dom0 isn't tested on newer
> Linux, so we need to drop all dom0 i386 tests wherever the default
> linux branch is used. That is, this changes in jobs will apply to
> "xen-unstable" branch but also all xen stable branches, seabios, qemu,
> osstest, libvirt, so every branch that aren't "linux-*".
> 
[...]
> 
> In any case, the list of test would be the same as for the existing
> branch "linux-linus" or "linux-6.1" branches.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

There hasn't been comment on this change, so I guess everyone is happy
for this change to go in. :-)

I'll push it later this week.

Thanks,

-- 
Anthony PERARD

