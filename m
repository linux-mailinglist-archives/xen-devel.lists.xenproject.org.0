Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3404A5FC3A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913007.1319206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsldC-0002Hm-50; Thu, 13 Mar 2025 16:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913007.1319206; Thu, 13 Mar 2025 16:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsldC-0002GK-1O; Thu, 13 Mar 2025 16:42:02 +0000
Received: by outflank-mailman (input) for mailman id 913007;
 Thu, 13 Mar 2025 16:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tslb1-0000Wy-S2
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:47 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c16dd64d-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso8590315e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:38 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5d0fsm60549085e9.32.2025.03.13.09.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:39:37 -0700 (PDT)
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
X-Inumbo-ID: c16dd64d-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741883978; x=1742488778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=autfPun3Kmt2RYxKRsMlhaPuf/QbHyst02lmhWlWRfA=;
        b=E31JBwwq9i/+D4ztUnou/UWWDPIqMbbbKcxjzl0P01VA5VmmWKqaP4+pRjrBXziD0A
         q6gIj/UUbU9NkQJALAz3t8G6MC/+i5IvFxueubwNFHS5k2MKpnGfgRKRWcd5+ZnJlzzK
         q2sNt0PgB6/QgxQkHpEO4+m2vyiLzH4Pv64QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883978; x=1742488778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=autfPun3Kmt2RYxKRsMlhaPuf/QbHyst02lmhWlWRfA=;
        b=orU1tpE0eAlQ2FVDZDueij9gzV6dIMNBWzbwmUbwvQgP2w408mJStpbYzDPycDl1me
         Bi58fheti6rd0lM8INJLwRCCekZ/FWg/5/205dBo+fKyOICOBcYG+q9/aSXaS3T+Hrlh
         X7hMKrmjbnUic3hpbJu3NuoQDK+GWeNVrfI6yQHzZBIYjQ8uIdDnh1eB2H2u0uUFu0wp
         JoqH4k6UL2bxG2Epl7euCI8lm4QPST+5R3r9RUYueUimiapE1BpzuaJFIZihQcVgb30t
         IRClYf/JGOf0hqTgDITL/P2quS6o7avg3xjbQ5vR2EkqkT0swWh9fjBM6DP1yQJ0852Z
         Eu0A==
X-Forwarded-Encrypted: i=1; AJvYcCUBrlocGH/MeisKFrNsy3zwXZ3RD10oHx6qPomZsXBpRUVl3Sl2kymdxt0Om3vG0Ucubq7F2NnJxIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXQPWOnbG7ERgVTCtamzibQM2gLuFGoR3N/+wJ65wYsby1MUlX
	pee2Vv4g4P54gVgJAQrj08KQrUU1jDPLFQCKv24gyXuaVBr/oQnA5TiNQpCcF04=
X-Gm-Gg: ASbGncsadUvcJwL9QQpegKzRn9P4VQCWQg8LwN2Im02x4SHmqZ5bJJvfJ502t/vdDP7
	XHUOhEs6sH03UoqA6HUyeJjdy3cvn9hID8fyZuO7T1DD858O8+vIgh3cc4zHLpKzW4Hfcv1eOsh
	UEKxLKIl3fniQxa2X1vrtI3U0TKjWmVA4Kua+0erot6KsKnbV2Adk4KUMlQRuRKRReOjjbWsEf8
	SfcWjepvOmMpuxwfsRsavFfxuw1JTWqoMp7BfaIpPiN8/Ti3uVfpIHHs43hW3V98OxWddJmgBIV
	7WlCeaLpNJPPm/V8qgHj1u+XbPJsAaCB6GeOE8ShsaEZQMpOW/TADpFBpdnaB6JxdrEINu8rYxs
	OMITWGh7b
X-Google-Smtp-Source: AGHT+IHbMoTmRbVn/fxju2MvpUSZrU3rcXU9gWnPjgRmhDeH306WN8GUtARmjJpPd0L7WD5Q+gu4WA==
X-Received: by 2002:a05:600c:4ed0:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43d18bb1abdmr27119335e9.3.1741883978292;
        Thu, 13 Mar 2025 09:39:38 -0700 (PDT)
Message-ID: <aace0fab-ce3f-4b9f-87c7-2daafd8442ba@citrix.com>
Date: Thu, 13 Mar 2025 16:39:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] symbols: arrange to know where functions end
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <51f2cd39-e92f-4745-8053-e51ada22d601@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <51f2cd39-e92f-4745-8053-e51ada22d601@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 1:54 pm, Jan Beulich wrote:
> When determining the symbol for a given address (e.g. for the %pS
> logging format specifier), so far the size of a symbol (function) was
> assumed to be everything until the next symbol. There may be gaps
> though, which would better be recognizable in output (often suggesting
> something odd is going on).

Do you have an example %pS for this new case?

> Insert "fake" end symbols in the address table, accompanied by zero-
> length type/name entries (to keep lookup reasonably close to how it
> was).
>
> Note however that this, with present GNU binutils, won't work for
> xen.efi: The linker loses function sizes (they're not part of a normal
> symbol table entry), and hence nm has no way of reporting them.

By "present GNU binutils", does this mean that you've got a fix in mind
(or in progress), or that it's an open problem to be solved?

> The address table growth is quite significant on x86 release builds (due
> to functions being aligned to 16-byte boundaries), though: Its size
> almost doubles.

Why does the function alignment affect the growth?

> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note: Style-wise this is a horrible mix. I'm trying to match styles with
>       what's used in the respective functions.
>
> Older GNU ld retains section symbols, which nm then also lists. Should
> we perhaps strip those as we read in nm's output? They don't provide any
> useful extra information, as our linker scripts add section start
> symbols anyway. (For the purposes here, luckily such section symbols are
> at least emitted without size.)

Will symbols_lookup() ever produce these?  If not, it might be better to
ignore the problem.

Taking extra logic to work around a benign issue in older toolchains
isn't necessarily ideal.

~Andrew

