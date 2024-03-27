Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6113488E2AE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698519.1090260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTNl-0006pc-4T; Wed, 27 Mar 2024 13:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698519.1090260; Wed, 27 Mar 2024 13:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTNl-0006nD-1H; Wed, 27 Mar 2024 13:31:57 +0000
Received: by outflank-mailman (input) for mailman id 698519;
 Wed, 27 Mar 2024 13:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpTNj-0006fw-Ji
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:31:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 601a0796-ec3e-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 14:31:54 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-414953ec671so3173415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 06:31:54 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b00414807ef8dfsm2209230wms.5.2024.03.27.06.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 06:31:52 -0700 (PDT)
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
X-Inumbo-ID: 601a0796-ec3e-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711546313; x=1712151113; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ry50isKBz7xwB9eIS98LGGV6NnwE9fBPbss1bZmyVbc=;
        b=SFA/0T9aA1TvfXcJEhNKDiPqd7DpgKVqjIEAFSMdGF3o1rTz/NyRHLE+bGwM7eSYhm
         H7HUILFYZCSlkRXHwBzUbEhZ8jILuYPinQFu76pm/wOe/BSf5coYHkl9CWX+8EhrblPy
         9qquWRZfWW5BXtZqMSh12xtEiF039hL8gfKP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546313; x=1712151113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ry50isKBz7xwB9eIS98LGGV6NnwE9fBPbss1bZmyVbc=;
        b=YrITy1Ap6/qmi8FEmSl11p2n3pxwuhoNSywxtxkIVUtPlr+MmPkrZWb4ZtEf1CGe/x
         2jVqtan3O4HjaJq8iEMieCA/8Q3RY0obciFlXWTkXDMmFWofuT5V0/Tbcoh8liVJjKEh
         k9+Enl+S0/0e4FOmRST3vKnqdbz4VFh3w2SThlNBAG5WRAO+NUetuET9Jom6zvMkgW7+
         gAH0W5f5hnqA24wc/yu/fbiyl3sBmEseSkLInexZi+ThAT/OsQoyClAualRUa7Dacg5n
         vRZd/o58vByvlECxK9z208cBeFfTublMMN6PHFLVV18BwiEF8onmxo0QakGr7pS6dZ5G
         hNhg==
X-Forwarded-Encrypted: i=1; AJvYcCVT4uz9YF4svnLXD2HsbIqroGcz7r1/cYXayGtMN7IvEt48CosZvG3yuYyRCsGNtfMhrcZeJevzAyHN5tvW2LmttrAD7YPNZljfvlLXCXI=
X-Gm-Message-State: AOJu0YwZFhvbvLZjJWcsLrR1/GlgyiXe9hhXbqa1AJ+jCNN+tMatk2zq
	Ikhq8qzgBmsdxUodqbh/asaE4MTYXf6urR0Plal/wa5aPgnyJQm7UCh5Wzq29R0=
X-Google-Smtp-Source: AGHT+IFYIuYEr12t4v0Td8b3I1GnsgGQezqwN6hoZoxCPeltmyQmrmwtG5G0fLSfp8l9b6esrVdj4Q==
X-Received: by 2002:a05:600c:198a:b0:414:8d7:8292 with SMTP id t10-20020a05600c198a00b0041408d78292mr52993wmq.0.1711546313427;
        Wed, 27 Mar 2024 06:31:53 -0700 (PDT)
Date: Wed, 27 Mar 2024 13:31:52 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH-for-9.0 v2 09/19] hw/block/xen_blkif: Align structs
 with QEMU_ALIGNED() instead of #pragma
Message-ID: <76ae46e6-c226-49d0-890e-c8fd64172569@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-10-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:05PM +0100, Philippe Mathieu-Daudé wrote:
> Except imported source files, QEMU code base uses
> the QEMU_ALIGNED() macro to align its structures.

This patch only convert the alignment, but discard pack. We need both or
the struct is changed.

> ---
>  hw/block/xen_blkif.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/xen_blkif.h b/hw/block/xen_blkif.h
> index 99733529c1..c1d154d502 100644
> --- a/hw/block/xen_blkif.h
> +++ b/hw/block/xen_blkif.h
> @@ -18,7 +18,6 @@ struct blkif_common_response {
>  };
>  
>  /* i386 protocol version */
> -#pragma pack(push, 4)
>  struct blkif_x86_32_request {
>      uint8_t        operation;        /* BLKIF_OP_???                         */
>      uint8_t        nr_segments;      /* number of segments                   */
> @@ -26,7 +25,7 @@ struct blkif_x86_32_request {
>      uint64_t       id;               /* private guest value, echoed in resp  */
>      blkif_sector_t sector_number;    /* start sector idx on disk (r/w only)  */
>      struct blkif_request_segment seg[BLKIF_MAX_SEGMENTS_PER_REQUEST];
> -};
> +} QEMU_ALIGNED(4);

E.g. for this one, I've compare the output of
`pahole --class_name=blkif_x86_32_request build/qemu-system-i386`:

--- before
+++ after
@@ -1,11 +1,15 @@
 struct blkif_x86_32_request {
 	uint8_t                    operation;            /*     0     1 */
 	uint8_t                    nr_segments;          /*     1     1 */
 	uint16_t                   handle;               /*     2     2 */
-	uint64_t                   id;                   /*     4     8 */
-	uint64_t                   sector_number;        /*    12     8 */
-	struct blkif_request_segment seg[11];            /*    20    88 */

-	/* size: 108, cachelines: 2, members: 6 */
-	/* last cacheline: 44 bytes */
-} __attribute__((__packed__));
+	/* XXX 4 bytes hole, try to pack */
+
+	uint64_t                   id;                   /*     8     8 */
+	uint64_t                   sector_number;        /*    16     8 */
+	struct blkif_request_segment seg[11];            /*    24    88 */
+
+	/* size: 112, cachelines: 2, members: 6 */
+	/* sum members: 108, holes: 1, sum holes: 4 */
+	/* last cacheline: 48 bytes */
+} __attribute__((__aligned__(8)));

Thanks,

-- 
Anthony PERARD

