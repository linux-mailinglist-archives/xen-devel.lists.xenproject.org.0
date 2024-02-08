Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6784D74D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 01:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677933.1054871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsey-0000sK-Bz; Thu, 08 Feb 2024 00:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677933.1054871; Thu, 08 Feb 2024 00:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsey-0000pX-7d; Thu, 08 Feb 2024 00:53:00 +0000
Received: by outflank-mailman (input) for mailman id 677933;
 Thu, 08 Feb 2024 00:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckqh=JR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXsew-0000af-A9
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 00:52:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65c0c6f4-c61c-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 01:52:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so11633545e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 16:52:56 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056000128500b0033b3cf1ff09sm2499757wrx.29.2024.02.07.16.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 16:52:55 -0800 (PST)
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
X-Inumbo-ID: 65c0c6f4-c61c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707353576; x=1707958376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QhgJY3kbAlZ1mgX4kDbwqz2TLqCn5dKc9y1wV9Rc5I=;
        b=LHtHi2/DlK6ZE8qtbIexij5DgrN6lhlmObO2BM4isIv4cgi9br64iHNuDo0m/Z+fu4
         QWbWAfaa/UqbzYYoQUCX7OMR1GQYpYIMcRiPa4KXbx+1JYY9t4IlPxKN43Tt419Mjjdo
         nv1APl416p3XjWDlriJWPpT0mbeNbXYmD6+ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707353576; x=1707958376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QhgJY3kbAlZ1mgX4kDbwqz2TLqCn5dKc9y1wV9Rc5I=;
        b=xBrY1CtQ7Wz3D/ijJ/fLp+p0AFoBnw0tfZiHglg5cVU1+Sua4J72ytFTPtNk7nEjiF
         cMdBLAX3KGAEWzNZp33+PcdPwxjTPUJhoJue4g3Lku6gCaVX1JMJh20DRWl784IIrLQQ
         8gZxjc/TixR8dkwq3vN97IbV0iPg9DwrMcmtjXHjvqnOMbKXBgFzvFDmteJdB8Wp2IOk
         z/jaKffjwoeTXXeigjzMOFpMDn5FORIark607TR2Ee1KW10WvjF9NV65r0IalsB3JjZA
         6oFEaE1I4Ak1gQS8lIPvGArTzAQUMWKK3cuLidMpjRlj+eamNQf64h721I8c0EKcekkE
         aoRQ==
X-Gm-Message-State: AOJu0YzaZ/P/34/sxzkhpqAZICd/b72fXGdCZhTREUmiiLdmYzKeZEyR
	L4QP2OcsKP5oPsvJ/vJ/zS0Mfyh+hJuP4yu4g8mkrRhnQ2iVvM6t+th6h6IRilk=
X-Google-Smtp-Source: AGHT+IFzIX3HPjSumvwGSvBrI/7KiDVTh8GvvnnZJcOmLRN7zOjTD7gDvEBKuG66+YbWlAz5ZJzUjw==
X-Received: by 2002:adf:eed2:0:b0:33b:45f7:636b with SMTP id a18-20020adfeed2000000b0033b45f7636bmr4787012wrp.22.1707353575862;
        Wed, 07 Feb 2024 16:52:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbWPmkQD9C7kTxfv/wmDHCKvaUDbAB60cVwUu+npMxorUK2fxpVaCMK9j1z8h8fK3Pj1nOCqpY4ei9GN5lyVxdpJg6Y4TTAHsUIsv12AXXne4zVG+9y5IepeWiJuk46B4cB3j7EiWbkwdimLLZQ0xlMEL6hb0bqZHxOXer/g==
Message-ID: <d5035d8e-4183-4213-8e12-86d5cb2dbfc7@citrix.com>
Date: Thu, 8 Feb 2024 00:52:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] tools: add a new xen logging daemon
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-3-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240205105001.24171-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2024 10:49 am, Juergen Gross wrote:
> Add "xen-9pfsd", a new logging daemon meant to support infrastructure
> domains (e.g. xenstore-stubdom) to access files in dom0.

I was still expecting for "logging" to disappear from this.

In both cases it could just be deleted the sentences still work,
although the subject ought to gain a xen-9pfsd part.

Happy to fix on commit.

>  tools/Makefile              |   1 +
>  tools/xen-9pfsd/.gitignore  |   1 +
>  tools/xen-9pfsd/Makefile    |  38 ++++++++++
>  tools/xen-9pfsd/xen-9pfsd.c | 147 ++++++++++++++++++++++++++++++++++++

Asking just in case...  Do we really want the "xen-" in the directory? 
tools/9pfsd is still perfectly descriptive, and more amenable to tab
completion given what else is in tools/

~Andrew

