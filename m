Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672EAD0361
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008587.1387861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNXKQ-0007Cz-49; Fri, 06 Jun 2025 13:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008587.1387861; Fri, 06 Jun 2025 13:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNXKQ-0007B9-1X; Fri, 06 Jun 2025 13:41:50 +0000
Received: by outflank-mailman (input) for mailman id 1008587;
 Fri, 06 Jun 2025 13:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNXKP-0007B3-6x
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:41:49 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdc19003-42db-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 15:41:47 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso19867935e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 06:41:47 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4526e155500sm21536425e9.9.2025.06.06.06.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 06:41:46 -0700 (PDT)
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
X-Inumbo-ID: fdc19003-42db-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749217307; x=1749822107; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ymo80vA0vHQD5Iy1MDAQhM1cAuhmA0PNB+gvHFqilmQ=;
        b=qqsv4bWDRABsSllhvOOEUTIE+qWRgE06DFr8LAW4cvhqnYQbPrC/56wG3Pnsvkghc2
         2H6RWTdqR7KO/XUbCerVJGVcAhnAapcs5vRmx5KGrPVFXPg6IYzXuTwkAvLrlzjbReQP
         1neCjDJIyH14fCCohSVJh27+vLIyHcd6SgfEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217307; x=1749822107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymo80vA0vHQD5Iy1MDAQhM1cAuhmA0PNB+gvHFqilmQ=;
        b=P0kuUMvpiFwJkx1cSu9hgt46aAz0E7ekbmQxPX9tSSjSL5rEdaNrMV94UFWRR96oU5
         dgs9GnT1xVdg4sse3M7O8j+tyxbdtPqsUuLbV+Du/3kgPkgaLEHeBBAb9hx4seqgGBnD
         czIfnbisWuF8t5V2SJ9IHe6KUHtjPP4/Od0woHx3xfHaogxIYlnnU8pgvBdxPaXZo/bo
         ZcWeLqH96UKN08aiCGoOyaKcSF6FmmUZz75AiSTudH3xa0clXuiXimOyGprJNYHlSt0i
         md+C+j8o7AqAKfXuEoRBy71rkvS1jf1uezrfJliw+f0xKqdDYtfVPfg2/Z3eoJb/kzdr
         qHFw==
X-Gm-Message-State: AOJu0Yw4pM1T1P42QMhvRn3ucZ83T2RgD9C8hgl77fwLPg5JZPXXNtQ9
	f+nNYRIjS7Bie2agJD5grWZVyk7QToUO9gTWU2k2advnwhjPELOk0+U26w9ptSwP7so=
X-Gm-Gg: ASbGncvtSrmErvfHFuP++j81uRd2rfvD0FfNE+26e+Wyo7XUg7rsHZWy7Y+BdMaPovi
	8HSHC+hOGZ0nrkHJw9lWVtvAYRnHf9X0sixqbF94TtkDKWderMKVrS2B/JojY1Lpgnxm8JzwzeX
	YMTHfFw2laqjFgiI1UouED5IlUBqPHz63/SMSHWY5AUuI56HJkDxG/PSCuzXV3p4KoA+rXSudMh
	RgcvZH5WPUST4Iv3lDjvAVIHHRhGmxH5Z6s+raCMvgKaTvSIbzb+CszFPdudcl915l+dYrkfhX5
	Kh6G0gbPNDHrWBTwVp+XbM/C77UpcW1WZ0yZBw2hqWAhk7HEH090Q5HkxXZ7uHVaBCEexz5gm8l
	ZtscnlmUi0nnigQCEqFI11ic6xtJJPHROfA+WhNRdaCXfHA==
X-Google-Smtp-Source: AGHT+IG60L6n74zZ0jBzJQchWI5qq3g1s6FH6k7jETvY0XsYkfVjcSy/TZ4Ql5DQHNFI3Rfu+vOuZw==
X-Received: by 2002:a05:600c:548d:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45201437aa8mr35379895e9.6.1749217306590;
        Fri, 06 Jun 2025 06:41:46 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:41:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v3] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aELwGScJ_XME26Sq@macbook.local>
References: <20250605161659.18201-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250605161659.18201-1-roger.pau@citrix.com>

On Thu, Jun 05, 2025 at 06:16:59PM +0200, Roger Pau Monne wrote:
> The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> have the functionality of a traditional PCI device.  The exposed MMIO BAR
> is used by some guests (including Linux) as a safe place to map foreign
> memory, including the grant table itself.
> 
> Traditionally BARs from devices have the uncacheable (UC) cache attribute
> from the MTRR, to ensure correct functionality of such devices.  hvmloader
> mimics this behavior and sets the MTRR attributes of both the low and high
> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> 
> This however causes performance issues for users of the Xen PCI device BAR,
> as for the purposes of mapping remote memory there's no need to use the UC
> attribute.  On Intel systems this is worked around by using iPAT, that
> allows the hypervisor to force the effective cache attribute of a p2m entry
> regardless of the guest PAT value.  AMD however doesn't have an equivalent
> of iPAT, and guest PAT values are always considered.
> 
> Linux commit:
> 
> 41925b105e34 xen: replace xen_remap() with memremap()
> 
> Attempted to mitigate this by forcing mappings of the grant-table to use
> the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
> into account to calculate which PAT type to use, and seeing the MTRR cache
> attribute for the region being UC the PAT also ends up as UC, regardless of
> the caller having requested WB.
> 
> As a workaround to allow current Linux to map the grant-table as WB using
> memremap() introduce an xl.cfg option (xenpci_bar_uc=0) that can be used to
> select whether the Xen PCI device BAR will have the UC attribute in MTRR.
> Such workaround in hvmloader should also be paired with a fix for Linux so
> it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.
> 
> Overall, the long term solution would be to provide the guest with a safe
> range in the guest physical address space where mappings to foreign pages
> can be created.
> 
> Some vif throughput performance figures provided by Anthoine from a 8
> vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
> 
> Without this patch:
> vm -> dom0: 1.1Gb/s
> vm -> vm:   5.0Gb/s
> 
> With the patch:
> vm -> dom0: 4.5Gb/s
> vm -> vm:   7.0Gb/s
> 
> Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Add default value in xl.cfg.
>  - List xenstore path in the pandoc file.
>  - Adjust comment in hvmloader.
>  - Fix commit message MIO -> MMIO.
> 
> Changes since v1:
>  - Leave the xenpci BAR as UC by default.
>  - Introduce an option to not set it as UC.
> ---
>  docs/man/xl.cfg.5.pod.in                |  8 ++++
>  docs/misc/xenstore-paths.pandoc         |  5 +++
>  tools/firmware/hvmloader/config.h       |  2 +-
>  tools/firmware/hvmloader/pci.c          | 49 ++++++++++++++++++++++++-
>  tools/firmware/hvmloader/util.c         |  2 +-
>  tools/include/libxl.h                   |  9 +++++
>  tools/libs/light/libxl_create.c         |  1 +
>  tools/libs/light/libxl_dom.c            |  9 +++++
>  tools/libs/light/libxl_types.idl        |  1 +
>  tools/xl/xl_parse.c                     |  2 +
>  xen/include/public/hvm/hvm_xs_strings.h |  2 +
>  11 files changed, 86 insertions(+), 4 deletions(-)

I've noticed this is missing a changelog entry, I propose the
following:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1ee2f42e7405..23215a8cc1e6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
      manipulations and memory type changes.
+   - Allow controlling the MTRR cache attribute of the Xen PCI device BAR
+     for HVM guests, to improve performance of guests using it to map the grant
+     table or foreign memory.
 
 ### Added
  - On x86:

I can fold into the patch if Oleksii and others agree.

Thanks, Roger.

