Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA21AC2A5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 15:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4bi-0002Kn-Cf; Thu, 16 Apr 2020 13:31:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tGEC=6A=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jP4bh-0002Ke-85
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:31:05 +0000
X-Inumbo-ID: 8498d6d2-7fe6-11ea-8b92-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8498d6d2-7fe6-11ea-8b92-12813bfff9fa;
 Thu, 16 Apr 2020 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=BONflVOk44YPtXzQwXdBYDSr4YhDryB8SuquSdSqYKk=; b=zzhsfCc/HCuI4brmnFGRKdVarp
 QIQDTZuekxuVeecwSWnuBhyEk4z88VJTDm2qVg7p0quvNlNVj04ZJLNQuNcbSKQQsR1Jvx8ARu/K0
 tNnGSYgl1V0DTxI47Hq/+KUr8o71x4xwXaVVt2Xt5iwvVFvYh+pfRNiuQuSsXibPtn6o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jP4be-0005Bn-FE; Thu, 16 Apr 2020 13:31:02 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jP4be-00034v-6h; Thu, 16 Apr 2020 13:31:02 +0000
Date: Thu, 16 Apr 2020 14:30:59 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] mini-os: use -m elf_i386 for final linking
Message-ID: <20200416133059.eetlpshw3gzxks6z@debian>
References: <20200416131715.24498-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416131715.24498-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, samuel.thibault@ens-lyon.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 16, 2020 at 03:17:15PM +0200, Juergen Gross wrote:
> Using the standard -m elf_x86_64 for 64-bit mini-os results in the
> first section (.text) to start only at offset 2MB in the binary file.
> 
> Quoting Andrew Cooper on that topic:
> 
>   Specifically, 64bit emulation appears to include "align primary
>   sections to 2M so your OS can make better use of superpages even when
>   mmap()ing", with no way I can spot to override this in the linker
>   file.
> 
> Using -m elf_i386 avoids that problem without any visible disadvantage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Applied with Samuel's Rb from v1.

Wei.

