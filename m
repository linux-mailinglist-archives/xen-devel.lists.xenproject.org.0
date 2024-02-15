Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD54855F47
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681564.1060405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZ36-0003QW-DN; Thu, 15 Feb 2024 10:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681564.1060405; Thu, 15 Feb 2024 10:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZ36-0003OU-9h; Thu, 15 Feb 2024 10:33:00 +0000
Received: by outflank-mailman (input) for mailman id 681564;
 Thu, 15 Feb 2024 10:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XFnF=JY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raZ35-00035g-Fo
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:32:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96746083-cbed-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:32:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41222a56492so1503145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:32:58 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b00410794ddfc6sm4607107wml.35.2024.02.15.02.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 02:32:58 -0800 (PST)
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
X-Inumbo-ID: 96746083-cbed-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707993178; x=1708597978; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kS+A7/SknG9vL6W/0a8wtI7CjUWDhZ+jIF8lzDix8/g=;
        b=qCGAEI6NYNMqc5D5WwZuZc0Fc1EWvOnI54QemoPNp7BXZouRWCZGBygy4VCNyXK8je
         mkm9YxIRG/dC1jChczih2xePfEO3jmuexFR0RAwbXGzxzkWCQxweLmLHO+awt/Sb910w
         DSLt0cloeWVnXbsnOXVbuPhrmx1zmxldAGuMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707993178; x=1708597978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS+A7/SknG9vL6W/0a8wtI7CjUWDhZ+jIF8lzDix8/g=;
        b=o3Xj58F7nFLjkqHI5Wg3jLCt7v/LK7flkwmvXAlihlTtDXKV5K9DWkRvPIiL2Gxu4f
         bqACfexuamctRRRlnhI/9SrBasbxSQASgYEqKKjn7oE/8PfkT1vRv2PXU3m6zvEg0Phe
         SfpF6dfHAGy37DdjN7Ub5BWkn3N4TNBrjOPnWWIrQu2L3AeBy/pkemLGdC8TbCQnW75Q
         aGPq3bzjhst1qFohc8JdCPLsXdO/esePuxaY6K53/oSiFNowiiOZv747Xcb9ru6O8A61
         jGvfvvl3E+oAdz5o/09UiM3jE6SBnyvK6knsCBYgSexgI4RV7Ao7/MsYPNrzN1fqPeDe
         9EZQ==
X-Gm-Message-State: AOJu0YyZkJffOS3DkYXNyOPZye7d29r3DgkRlsd+evkzk5SpEvWicwGJ
	CC+dGzMlId4duCrhCLE8hCmtz63a0T+dC1VJhOn4oJXWViGThRBM2X/Xxv0vgO4=
X-Google-Smtp-Source: AGHT+IHHVG+jpMOoOCmWW+OQV3FaP/bBHz7vX6pGezQa52NTa3pzS9iTtbCaX2KBNkjFCVxIv0a+IA==
X-Received: by 2002:a05:600c:4f96:b0:411:e7d5:cc5 with SMTP id n22-20020a05600c4f9600b00411e7d50cc5mr1091333wmq.4.1707993178339;
        Thu, 15 Feb 2024 02:32:58 -0800 (PST)
Date: Thu, 15 Feb 2024 10:32:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <23f82e89-d5b5-4b95-bbf9-be0a76a15cc1@perard>
References: <20240215093002.23527-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215093002.23527-1-roger.pau@citrix.com>

On Thu, Feb 15, 2024 at 10:30:02AM +0100, Roger Pau Monne wrote:
> When doing a rebuild with an xen/include/config/auto.conf already present in
> the tree, failures from Kconfig are ignored since the target is present:
> 
> gmake -C xen install
> gmake[1]: Entering directory '/root/src/xen/xen'
> tools/kconfig/conf  --syncconfig Kconfig
> common/Kconfig:2: syntax error
> common/Kconfig:1: invalid statement
> gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
>   UPD     include/xen/compile.h
>  Xen 4.19-unstable
> gmake[3]: Nothing to be done for 'all'.
> gmake[2]: 'arch/x86/include/asm/asm-offsets.h' is up to date.
> 
> Ultimately leading to a successful build despite the Kconfig error.
> 
> Fix this by first removing xen/include/config/auto.conf before attempting to
> regenerate, and then also make xen/include/config/auto.conf a hard dependency
> of the build process (ie: drop the leading '-') and reordering so the .cmd
> target is executed before including the configuration file.

Could you try to revert commit 8d4c17a90b0a ("xen/build: silence make
warnings about missing auto.conf*") instead? With a much shorter message
like "Don't ignore Kconfig error anymore".

Cheers,

-- 
Anthony PERARD

