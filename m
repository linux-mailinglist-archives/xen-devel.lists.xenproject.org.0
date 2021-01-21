Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BE2FEDD4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72152.129649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bSO-0003Ls-60; Thu, 21 Jan 2021 15:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72152.129649; Thu, 21 Jan 2021 15:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bSO-0003LT-2s; Thu, 21 Jan 2021 15:01:08 +0000
Received: by outflank-mailman (input) for mailman id 72152;
 Thu, 21 Jan 2021 15:01:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bSL-0003LM-Us
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:01:05 +0000
Received: from mail-wr1-f48.google.com (unknown [209.85.221.48])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aef705f-0f8e-4f86-9b57-0397e874bf8b;
 Thu, 21 Jan 2021 15:01:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id 6so2060498wri.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 07:01:05 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m12sm8604596wmc.10.2021.01.21.07.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:01:03 -0800 (PST)
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
X-Inumbo-ID: 2aef705f-0f8e-4f86-9b57-0397e874bf8b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V/aBXIiRscEI/dASAh/Msm7gIR3Jw3ZEMunSeMG6DDo=;
        b=GmRN14lx3TgKNYa7Q1Z4XJZxrdvKFptQX+dO0Lc3wA8MSLeW2PptBmvqAHgtUoBVAd
         FwlUVguKBTNufdrFiLseuQHIgd7c+SNhbAwZ+T/7dNXXlTRYN13BViqFwYP7FAP59LzV
         dMe5wQkSTlC3d0jXsr7WyHYGAZo3WBM9H9Mk3xC31pU4o+jBznncw2MOSYaVwRL0mXg7
         Nl092yqPQrEFV+vtYfj5xrP9svA7Fl2XyYZI503+BOM/rmAaVl6B0iCdOsovJ4oFAUvk
         FH1lTuh5ysUsSZFZOQpLyKeLuVCxrjYg1CNL1iCDIAQ/AZVPr4oUg1hOFG0y+ABm7EiD
         Z8Og==
X-Gm-Message-State: AOAM5306ZPS4bPulDlpz+KLSStoS64oftu9XwiLUdj/wdZx+DyphuAWZ
	pne5eFfH9gyl1BI6H6EjQSEzURFSShU=
X-Google-Smtp-Source: ABdhPJxUalEnHPI75QGyW+xIOpROpxWl9Cem/zUNQOFsAc+oKX6URXjN1SL4yzY0mjmmQrLiMveGcw==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr15221844wrs.390.1611241264493;
        Thu, 21 Jan 2021 07:01:04 -0800 (PST)
Date: Thu, 21 Jan 2021 15:01:02 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/5] libxenguest: support zstd compressed kernels
Message-ID: <20210121150102.iifaquysrbkkx2tz@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <403d985c-b4c0-d8d1-4f42-7e1fe6ae3ee0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <403d985c-b4c0-d8d1-4f42-7e1fe6ae3ee0@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 19, 2021 at 04:15:25PM +0100, Jan Beulich wrote:
> This follows the logic used for other decompression methods utilizing an
> external library, albeit here we can't ignore the 32-bit size field
> appended to the compressed image - its presence causes decompression to
> fail. Leverage the field instead to allocate the output buffer in one
> go, i.e. without incrementally realloc()ing.
> 
> Note that, where possible, instead of #ifdef-ing xen/*.h inclusions,
> they get removed.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Acked-by: Wei Liu <wl@xen.org>

> ---
> Note for committer: As an alternative to patching tools/configure here,
> autoconf may want re-running.

Noted. FWIW I use Debian 10 to generate configure. If I don't get around
doing it someone who runs the same system should be able to help.

