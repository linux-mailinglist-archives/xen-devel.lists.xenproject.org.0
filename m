Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1555A3341D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 01:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886958.1296541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiNFW-0004Wh-5S; Thu, 13 Feb 2025 00:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886958.1296541; Thu, 13 Feb 2025 00:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiNFW-0004VE-2O; Thu, 13 Feb 2025 00:38:38 +0000
Received: by outflank-mailman (input) for mailman id 886958;
 Thu, 13 Feb 2025 00:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiNFT-0004Tn-SU
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 00:38:35 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dafe3764-e9a2-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 01:38:34 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43956fcd608so1869365e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 16:38:34 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f217sm33120955e9.1.2025.02.12.16.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 16:38:32 -0800 (PST)
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
X-Inumbo-ID: dafe3764-e9a2-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739407113; x=1740011913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VWOl8grIGHAHpzUFKphtTwGDs2JamBDaC8tsHAx0lzI=;
        b=SILANtqqxMNZoP1GP2SgzJKlNH9RZxq0Hfoqr4v/AeY598s9jAMa4UFNGnyjScxzZ2
         OcpfP/GpUZ7XByXk1ne8vbS5fSZ7UDTuxTfEQREAgUPNXFjBVGQbBKMsVFffJB01TM6T
         oNJ7aiqsHfPa9UwkzQCmpp7Y+oO7SytKIgm5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407113; x=1740011913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWOl8grIGHAHpzUFKphtTwGDs2JamBDaC8tsHAx0lzI=;
        b=wu6GxWKihQedhSm3+oaq5sSruR+AF8jxK1GquyjoS+/5GCu5tF9REl+XB5L/MGc+7h
         IlbK7yzvkA7kr0caYWMv4Y7o09WShEhQFhWb2qFnj6j411l/c31m03Pg+y2cVjhVT1se
         x4JDfG/jSsKYT5S1XcNStpwyg4xXCGYXqmwTWo8mzNnUryb6o9AouHwpN3bsrwrW6X6q
         jAhSxGoMFurU7Gsw0JUd+3hR3Uk4C0db3B/vIkCHiEN4fGY6lkGiPwbXWNS0IVbXVVKI
         HurOLpUlb/kfmBqxhb9pJXynmsStNIt+BLRGnkzxb7BrQ+jcDAcgPgT40Ne9SsavjmGl
         3p1g==
X-Forwarded-Encrypted: i=1; AJvYcCWNiwkM+3FnKW37YwBQJCQaAFw+knOupMIutnJ57y0PobCIaTCdIhicMHAdFY+ZTFwtS/w4oCJJWog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+RsgQQasKIh0MZqASDQWmNPvmVjwr8Pfm9JdP+V2o8lj9wxVc
	QdYzwKEl7uY7EkF8yrHCT8VRufW75uieIJ1pbIymcVQ/V7vkSc03q7ctKfkkokQ=
X-Gm-Gg: ASbGncu0cEsOtX40T94mdFOXefu2Nvb9yk2ZwR9AhpIp9hO6R8o2CyOs6FcVaTuwSuX
	CI6LgJFWfgWNe538cMDqJjIKvYuUIP8Tq5ATHbHFL5WgHrnVdNJaDaWgk8LaYGJ6OsHAYVjU0tu
	JWNVS8JOVz2mRiNoKb5frUsSwBbdIjUu4GazyueOSCW8gpEDdiPj2eTJinGdueExNxjB2ri1Jli
	YWK2CAaX+oIOas2uphT26h646sen4nHNGHWW4hCB7eWS5G9nw4pzn0jBibQwsp2e2hfgpvnrLJH
	UBinKs9rfjnea89RxpgDYX59rIWw4gUK4K4pS0M3UvZvqLpUbG2t1oo=
X-Google-Smtp-Source: AGHT+IF5Gpd4UMrB/ndwLdIOYi9e4UWO0PnnA00+sHp5HIbBzMhWi0feooEu4KwqdmMAU0dPfbszuw==
X-Received: by 2002:a5d:5f45:0:b0:38d:e092:3d0b with SMTP id ffacd0b85a97d-38dea2d680amr4690857f8f.39.1739407113596;
        Wed, 12 Feb 2025 16:38:33 -0800 (PST)
Message-ID: <9229184a-a97f-4d36-a21b-3fc4e61cdaa6@citrix.com>
Date: Thu, 13 Feb 2025 00:38:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: add keyhandler to print Xen version
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250212235754.3686278-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250212235754.3686278-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 11:58 pm, dmkhn@proton.me wrote:
> Add Xen version printout via keyhandler mechanism.
>
> That is useful for debugging systems that have been left intact for a long
> time.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Hmm, it's a good point, but can't we add this to the top of the 'h'
(help) key rather than adding a(nother) handler?

Amongst other things, ~ is going to be problematic for any connection
serial running over SSH (usually IPMI), as it's the SSH escape
character, and use on Xen's console expects ~ with no following keypress.

