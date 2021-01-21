Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE42FEF08
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72211.129841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2c2A-0007hb-7O; Thu, 21 Jan 2021 15:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72211.129841; Thu, 21 Jan 2021 15:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2c2A-0007hC-46; Thu, 21 Jan 2021 15:38:06 +0000
Received: by outflank-mailman (input) for mailman id 72211;
 Thu, 21 Jan 2021 15:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2c28-0007h7-Od
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:38:04 +0000
Received: from mail-wm1-f44.google.com (unknown [209.85.128.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3055f48-d822-4748-b077-5c880e151709;
 Thu, 21 Jan 2021 15:38:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id i63so1829691wma.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 07:38:03 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a62sm8605704wmf.7.2021.01.21.07.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:38:01 -0800 (PST)
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
X-Inumbo-ID: c3055f48-d822-4748-b077-5c880e151709
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g0kvUF3eycnuE3muBMfDGRSmeGejeprsxWllNIj+xAw=;
        b=gcpLGDR1GkMkHT3RT3pdNTX/OXsDg+p9MRicNE0jE29hju3qZgfbrOYSCJ+ie5sjM+
         owyaIX+bc7S8GACmQZhQZhpFa4faoozagZm9vlUQz0HQgf0A14KoYgzTJsCznpA5v6MF
         /rqTaQ5As6txa38xx1VIlPzZipHFRYPSiRNkLYahDjNxd0KHbexQXt7jc6/4RTlIsoqe
         VOvgyL+2W8VdUocHuPbxl+/6jDupR1pxlkh2Q3n659cAe1BstKwJunZG43mAEK1oUQSm
         uF+8nhY9cdmA6oDmA1flN445PXTliozgLeB45+3Xp5p4CLkefzA53024p7iuqfesRtLP
         hHfg==
X-Gm-Message-State: AOAM533gfUnFnI4UIPUuR5G/0Dx3OLA4H8RQw2jTkMkhn+I6omDkLA+j
	ttE/d17jN6wU0K4STUlQPLg=
X-Google-Smtp-Source: ABdhPJwjJpMHrntxHfXDLD4s7UyVoIAbd1mXlnir8jP/GcrnacC1aAT+/WvqLd04c5C7Ywrq8B5fAA==
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr9734081wmf.17.1611243482634;
        Thu, 21 Jan 2021 07:38:02 -0800 (PST)
Date: Thu, 21 Jan 2021 15:38:00 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/5] libxenguest: simplify kernel decompression
Message-ID: <20210121153800.jfxkwbuk2coqd2lv@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <a94cdffe-d31c-ad83-67f6-f1c25d520dd1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a94cdffe-d31c-ad83-67f6-f1c25d520dd1@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 19, 2021 at 04:17:12PM +0100, Jan Beulich wrote:
> In all cases the kernel build makes available the uncompressed size in
> the final 4 bytes of the bzImage payload. Utilize this to avoid
> repeated realloc()ing of the output buffer.
> 
> As a side effect this also addresses the previous mistaken return of 0
> (success) from xc_try_{bzip2,lzma,xz}_decode() in case
> xc_dom_register_external() would have failed.
> 
> As another side effect this also addresses the first error path of
> _xc_try_lzma_decode() previously bypassing lzma_end().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think the code changes are correct:

Acked-by: Wei Liu <wl@xen.org>

But a second pair of eyes would be useful here since this patch is
complex.

Wei.

