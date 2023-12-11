Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42680D347
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652414.1018232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCjkz-0000NI-QZ; Mon, 11 Dec 2023 17:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652414.1018232; Mon, 11 Dec 2023 17:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCjkz-0000Ld-O3; Mon, 11 Dec 2023 17:07:49 +0000
Received: by outflank-mailman (input) for mailman id 652414;
 Mon, 11 Dec 2023 17:07:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7SW=HW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rCjky-0000LU-9A
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:07:48 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea522c0-9847-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 18:07:47 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso23299615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 09:07:47 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a19-20020a05600c349300b004064cd71aa8sm13526268wmq.34.2023.12.11.09.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 09:07:46 -0800 (PST)
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
X-Inumbo-ID: cea522c0-9847-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702314467; x=1702919267; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJEagWumWLB2GP2Qsz2b8wgMXMf5Jo9QfzdgiqViW10=;
        b=iBbm+01iGt5HWE8A9QeTTC7taddbeYrVCzMtTC6F23LDl50kZWBzyJMQxf4fVAQrMm
         EdUuUP5CAKIcdjciJCWEEyqqNwKsff5zW18HOPu24q8lXM4fYPC19uH4OZ7MdDeqyr9m
         Hz1tzudI0K7CprKZVnHoRQoLodTbx/E2Fmcsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702314467; x=1702919267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJEagWumWLB2GP2Qsz2b8wgMXMf5Jo9QfzdgiqViW10=;
        b=byhN/Z1RNzKlBvxyNL01D3rqnRD40TolMPHZ+bvJZKMHO6FZH27w9NZRik5o96EO+p
         jvLshRLOmKXUcyMbFGk26tI6v3w+W/Dvkos0J5m1LQc2d5hAFaSYuiVQ0WTaPmFrJSke
         N/lPzgH4G995HJ663cglKllOjElAVoYvOEhHW8FcI3596o+mnB1az1zV0MBjh1huc4m/
         qdpck54xgUYP5mZwscXibWaaatwiK7L1v4RDdw7vpvcCPeHIZnub0b94P90XSkI0V8Je
         RV+8wF3y31JPTrn4RyWfYD6Bm3jk9Vdq7USbe23gGpBims+gCNuyA6UciFUSDA5+YhSY
         UH7A==
X-Gm-Message-State: AOJu0Yxo5g23Fm+6kWPZ5gQzPSmvZ75eXctXhmzAgXaRhV/e2gtFrlii
	xmdaQ/PGub/8xLooB9GIBXdpSg==
X-Google-Smtp-Source: AGHT+IH2nz98Z3h8U250fwIYsQsC3qmeJv9TTXM6k5FbrX9zeDAh4hCjF8v1nE91QCtLxAhOId5ETA==
X-Received: by 2002:a1c:790a:0:b0:40b:5e59:99e6 with SMTP id l10-20020a1c790a000000b0040b5e5999e6mr1749108wme.262.1702314466777;
        Mon, 11 Dec 2023 09:07:46 -0800 (PST)
Date: Mon, 11 Dec 2023 17:07:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] tools/pygrub: Drop compatibility symlink
Message-ID: <761cd868-10f7-49ea-ba3e-ba61bac5ce83@perard>
References: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123163023.2158134-1-andrew.cooper3@citrix.com>

On Thu, Nov 23, 2023 at 04:30:23PM +0000, Andrew Cooper wrote:
> This was declared deprecated in commit 10c88f1c18b7 ("tools: Install pv
> bootloaders in libexec rather than /usr/bin") in 2012

This commit only speak about wanting to deprecate the full path to
`pygrub`, and calling something deprecated in a commit message alone
isn't very friendly. But there's a better commit calling for the
deprecation:
c31d6a7ee2ea ("libxl: Warn that /usr/bin/pygrub is deprecated")
even if it's only in a libxl log message at run time.

I hope we have a better schema to deprecate things.

> Take it out fully now, 11 years later.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Beside the commit message that could call for a better commit, patch
looks good:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

