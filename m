Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85B7C01C3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 18:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615123.956334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqFgv-0008Pa-QK; Tue, 10 Oct 2023 16:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615123.956334; Tue, 10 Oct 2023 16:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqFgv-0008NF-MD; Tue, 10 Oct 2023 16:34:41 +0000
Received: by outflank-mailman (input) for mailman id 615123;
 Tue, 10 Oct 2023 16:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LWWS=FY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqFgu-0008N9-6n
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 16:34:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e69bd988-678a-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 18:34:36 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso118165e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 09:34:36 -0700 (PDT)
Received: from [0.0.0.0] ([2001:41d0:8:52b7::])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a37c201000000b007742c2ad7dfsm4449226qkm.73.2023.10.10.09.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 09:34:35 -0700 (PDT)
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
X-Inumbo-ID: e69bd988-678a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696955676; x=1697560476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/jsbBaWWysUZHibfyXWsBmxBdGQg70Lnk7x5g9N02Pk=;
        b=Puoo1FEbbOIf+9wxWbm4OSalhqdIl5N9bqBEywxdGv5Y1vrZTRw/72y021nJy7zU0d
         FtCi/p5JJMBOKDW0xkldCT1fk8LkwZds25V+1/4VuWbu8fyxNoeaIdREypQVtV4yt65m
         cB8+gcI3OCjT5QWILqjD1VsYSGKylebORZLe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696955676; x=1697560476;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jsbBaWWysUZHibfyXWsBmxBdGQg70Lnk7x5g9N02Pk=;
        b=kVR86o4ptwnIz74Z1DQfrEoMQGP+449LC31XZTNfwJfqwo2uFvmGF8fDfcQhfhCKzM
         lloBfP7/UP6JSZz/rc2fr/Oml+XBmDbvXShXSREUWRWAmfDUSiIzUSO6Rzd8jU/OT2pF
         qFp/Etw+KYBannIljemI8cBbn1uqKMSowymR8zeafZw+QNOGDsuUs9u87mngbb8iHHE1
         LqC4hzVQckRRzfBUcmnQ4mkwWcpTJJUcRK8P5Jd/l7KGxmehgnO4y/M19VZFeORpTg+j
         hfmyIKxH1RsS7FAPArVJeDhBHzaqCrtR3FzMHThznH/yTrZgENxvazYEkb/yQx8JRMtX
         vp+A==
X-Gm-Message-State: AOJu0YzWhb1ZjU6I0wBEqoJFcRf60bL3dTAaZ9MrIpR2PFPVv6nGIK0M
	19WQhgwVE4PI/Hq3O6diFjZ7bQ==
X-Google-Smtp-Source: AGHT+IErYi8sc/P/FOYwsCSnLXpJZ6IriiNqjZgK9/kj3EboV/LzIQarudfTaw40waWLDecZSf2Fzw==
X-Received: by 2002:adf:e80d:0:b0:31d:db2d:27c6 with SMTP id o13-20020adfe80d000000b0031ddb2d27c6mr12986460wrm.30.1696955676310;
        Tue, 10 Oct 2023 09:34:36 -0700 (PDT)
Message-ID: <2ef1f6b6-9b50-4e77-abad-fa046eb2ca0a@citrix.com>
Date: Wed, 11 Oct 2023 00:34:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1] tools/python: Add python3 compatibility
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2023 10:18 pm, Javi Merino wrote:
> Most of the work for python3 compatibility was done in
> 1430c5a8cad4 (tools/python: Python 3 compatibility, 2019-12-18).  This
> just adds a few builtins needed for python3.
>
> Resolves: xen-project/xen#156
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>
> I haven't tested it.
>
>  README                                     | 1 +
>  tools/python/scripts/convert-legacy-stream | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/README b/README
> index 855db01d36..44ed88c392 100644
> --- a/README
> +++ b/README
> @@ -51,6 +51,7 @@ provided by your OS distributor:
>      * POSIX compatible awk
>      * Development install of zlib (e.g., zlib-dev)
>      * Development install of Python 2.7 or later (e.g., python-dev)
> +      - If using Python 2.7, you also need the future module.  This is not needed for Python 3.
>      * Development install of curses (e.g., libncurses-dev)
>      * Development install of openssl (e.g., openssl-dev)
>      * Development install of x11 (e.g. xorg-x11-dev)
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
> index 7fe375a668..26a66c50fc 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -8,6 +8,9 @@ Convert a legacy migration stream to a v2 stream.
>  from __future__ import print_function
>  from __future__ import division
>  
> +from builtins import zip
> +from builtins import range
> +from builtins import object

It can't be object because most other scripts use it just fine in py2
and py3.

There's only one single use of zip and range in this script, and range
is clearly fine (although it wants to be xrange() on py2 and we do
opencode that places), so I'm guessing the problem is with zip(), but
it's not exactly clear why?

~Andrew

