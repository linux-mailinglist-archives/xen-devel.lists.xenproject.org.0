Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95740C01F90
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149254.1480929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwrg-00014L-Ie; Thu, 23 Oct 2025 15:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149254.1480929; Thu, 23 Oct 2025 15:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwrg-00012P-FG; Thu, 23 Oct 2025 15:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1149254;
 Thu, 23 Oct 2025 15:04:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBwre-00012J-S9
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:04:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBwre-00Fus6-14;
 Thu, 23 Oct 2025 15:04:30 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBwre-00BmYF-0h;
 Thu, 23 Oct 2025 15:04:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=j//sMLo5UWXQl/AXUvv4p0UoPjftxMybawNv57Uo0mQ=; b=QT2EurwF/Rf+wCepxZejocQwcA
	fOfNtRM5mhNi4CYcFZuAk50XlLoYw2wy55dLcbZn57pkQRJGv2g9ZJc9Q+NzUbrZXjcCqLe6vpKxz
	lulLSGO/AQ6ULsSsvlkHA0HIyF1Gdn4CQbmBwgD8bf9bSdJt7atPXpgvl8YBDaZtAAEE=;
Date: Thu, 23 Oct 2025 17:04:28 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
Message-ID: <aPpD_G_oULdfeWbf@l14>
References: <20251023085730.36628-1-anthony@xenproject.org>
 <bd6c0e3f-f2bc-4399-adf6-d2dc18b06982@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd6c0e3f-f2bc-4399-adf6-d2dc18b06982@citrix.com>

On Thu, Oct 23, 2025 at 03:45:55PM +0100, Andrew Cooper wrote:
> On 23/10/2025 9:57 am, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > If not available, fallback to using YAJL.
> >
> > The code is using json_c_visit() which was introduced in 0.13.
> > json_object_new_null() and json_object_new_uint64() where added to
> > 0.14. And the last one json_object_new_array_ext() was introduced in
> > 0.15.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> However, you should adjust README and possibly Changelog.md to give this
> new minimum version.


Will this do?

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 0cf9ad2d95..fc4f6d7c8a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,8 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
    to the baseline change.
  - Linux based device model stubdomains are now fully supported.
- - New dependency on library json-c, the toolstack will prefer it to `YAJL`
-   when available.
+ - New dependency on library json-c 0.15 or later, the toolstack will prefer it
+   to `YAJL` when available.

  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
diff --git a/README b/README
index eaee78bd73..53a4d5c2ae 100644
--- a/README
+++ b/README
@@ -53,7 +53,8 @@ provided by your OS distributor:
     * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
     * Development install of uuid (e.g. uuid-dev)
-    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
+    * Development install of json-c 0.15 or later (e.g. libjson-c-dev)
+      or yajl (e.g. libyajl-dev)
     * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
       greater.
     * Development install of GLib v2.0 (e.g. libglib2.0-dev)

Cheers,

-- 
Anthony PERARD

