Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBAFABFE09
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 22:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992543.1376234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqHo-00023V-Jo; Wed, 21 May 2025 20:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992543.1376234; Wed, 21 May 2025 20:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqHo-00020v-GT; Wed, 21 May 2025 20:43:36 +0000
Received: by outflank-mailman (input) for mailman id 992543;
 Wed, 21 May 2025 20:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqa2=YF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHqHm-00020p-El
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 20:43:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a9a2be-3684-11f0-a2fb-13f23c93f187;
 Wed, 21 May 2025 22:43:33 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-44a57d08bbfso430285e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 13:43:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d305sm21184785f8f.16.2025.05.21.13.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 13:43:32 -0700 (PDT)
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
X-Inumbo-ID: 42a9a2be-3684-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747860212; x=1748465012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tT0MUv82gInkHImLuGT572t1gbQt3bPXepdiyT8e/wY=;
        b=mzviQsPcbx7PuqqvU6LZbLHwrIFicQYzLjMRtuxukOEpN77DSwgQeeG7va1fPKzLAe
         /e/YQzMQ+CDU4g4IFcr9nK8kdamYEKTEI3vWegcemB1n4P/vMfKYgbRh1ApUQzVUiceH
         j2o5W92Mu4LNlv1qowibxN4iHJE1gitWZ+86U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747860212; x=1748465012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT0MUv82gInkHImLuGT572t1gbQt3bPXepdiyT8e/wY=;
        b=XC23ttTCX5QAUIhDEQ3tqI/q9UozfwfQ+XQ6ThJTBg5CtBRmYdPcQuKaD3k+WPNrLN
         8HNlfsxGRGxKjqDV4vXUKmuZ1uAZdwPgOLnlieUuYIRYlwke8JTRRwv1qvnCscLOv73k
         Wp5enrlVw9VJOUwxf3OkMI9MbdZl4s5zT/Y7IByKUXuCb4ISwqTLeK+tQIzWpIkNSRRk
         9hwMgFrVjBQN/tfG6Z47SVQESbum5b9PwEZlTBPrEkHD7RRh59KU/FAFAh5uOW89TA6F
         aVP9jl6fBACtabidGXZF1M68+br/E5wKEvPjBmbDqdqd8wlhZDaVWhdDlECoz4FTKvVf
         UdQQ==
X-Gm-Message-State: AOJu0Ywtsrw9HstiwD/6nVrc37LOS7tXhAUFZm28MDKVfwyIw0F7OhDJ
	3DSqGLW3r5TqPLEUceaVIii3SEqrm5K+2A32Dql1nt5y3XcHfis7tCflQqKkBNAjM9U=
X-Gm-Gg: ASbGncvmfzMl0onf2+fGpyeZGwDpNO29YpcFrKpMosIyYseAe2mhq0WuHF8jzzaCRvE
	sw6i6DWEfVn3MH4VaTS6PCknWKv+grJwS5OxEehVzi4FaOmZ1Mb7iG640FMcyM+PIe5IoeuEa53
	XLp288SCsMhAp3dQQ+ZQP90rmXwgN7b62N8pHYPfrbw3IT55uq+2CqWXHFkc3UjudTLjGCmy3He
	l0U9W0HdbBu+CAWUwvnIDkQpriiHkF1d7WN1a8a0geRNHLTd3eJkTi/S9lDFCa3gisICqr1CLof
	gBYqe5YYoO0M4+heR2tfWrIlPA59wjgOwi382VqPY7LFbL2zxEctfq+I4NrK7PDtXIOCB4wxa8l
	LymJkzAvrr+IhY1G+nzpbv+0WQPk=
X-Google-Smtp-Source: AGHT+IHGi36ZZ0sAnw7W9xpybZCrFzYhM6n9TfuCvQZsdfnpU2iOPhUNRUuJK5XGifkAiAWHrZGJvg==
X-Received: by 2002:a5d:638e:0:b0:3a3:64b8:ef20 with SMTP id ffacd0b85a97d-3a364b8ef5fmr13316262f8f.52.1747860212539;
        Wed, 21 May 2025 13:43:32 -0700 (PDT)
Message-ID: <0a2a1ff2-d2fa-4331-acad-0e825421e95e@citrix.com>
Date: Wed, 21 May 2025 21:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/argo: Command line handling improvements
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Denis Mukhin <dmkhn@proton.me>
References: <20250520141027.120958-1-andrew.cooper3@citrix.com>
 <CACMJ4GY83K7-MvzViM5EwfJEQo9n0Ym_5NZYt9tx=uHBB8gB8Q@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACMJ4GY83K7-MvzViM5EwfJEQo9n0Ym_5NZYt9tx=uHBB8gB8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/05/2025 2:01 am, Christopher Clark wrote:
> On Tue, May 20, 2025 at 3:10 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>
>     Treat "argo" on the command line as a positive boolean, rather
>     than requiring
>     the user to pass "argo=1/on/enable/true".
>
>     Move both opt_argo* variables into __ro_after_init.  They're set
>     during
>     command line parsing and never modified thereafter.
>
>
> Instead of binding to static values set at boot, would
> boolean_runtime_param be acceptable?

No, for several reasons.

Sure, you could dynamically turn it on, but existing domains can't use
it because argo_init() wasn't called on them.  Now consider what happens
when dynamically turning it off behind the back of a domain which was
using it.

All the existing runtime controls are for properties that are not
visible to guests.  Adding opt_argo to this list would create a lot of
carnage.


(Like almost everything else in Xen), Argo is entirely broken with
respect to enumeration and controls.  And while this isn't your fault
for having copied the status quo, it is still a problem needing fixing.

Argo's availability needs advertising to the toolstack like all other
features, and the toolstack needs to be able to choose the Argo settings
on a per-VM basis.  Like everything else about VMs, the Argo-ness must
be invariant for the lifetime of the domain.

This means changes to sysctls/domctls, which IMO are prerequisites for
Argo to move from Tech Preview to Supported.  In a world where such
controls existed, the argo cmdline option would really only be for
someone trying to disable Argo globally.

This particular patch comes simply from me trying to experiment with
Argo to sort out the XTF test, and deciding that the behaviour was
objectionable enough that I'd improve it.

~Andrew

