Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC4A67BA0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 19:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919754.1324129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tubMK-00034a-7U; Tue, 18 Mar 2025 18:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919754.1324129; Tue, 18 Mar 2025 18:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tubMK-00031y-3j; Tue, 18 Mar 2025 18:08:12 +0000
Received: by outflank-mailman (input) for mailman id 919754;
 Tue, 18 Mar 2025 18:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tubMI-00031g-Rj
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 18:08:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2b3d7cf-0423-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 19:08:09 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so26174695e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 11:08:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe065a5sm140132745e9.12.2025.03.18.11.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 11:08:08 -0700 (PDT)
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
X-Inumbo-ID: f2b3d7cf-0423-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742321288; x=1742926088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yKtFUIZ7ewJZ/Wsbd41lcfL7uOtDFtBovQ+G9D2uNJ4=;
        b=g6SnnWXzG3b7CbTO2rIMPX6uK9u767/drqBFGAT7crM1cQMojTCxFAkk8+ws42Zhxy
         nv+D/uf3nbOLq6zpU6CzgbJ+0ihbaumYzmuyOP2av7m71cQWIgih2ciHLjjjc307qvEp
         +FKwOBtOZgv5CRCiAiF4rCue+YnJQ6Dl46xS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742321288; x=1742926088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKtFUIZ7ewJZ/Wsbd41lcfL7uOtDFtBovQ+G9D2uNJ4=;
        b=pzP2ZteKOjQhtPZ3XJJvZ4/zsMtQF3z2jIZqYkPTsj8K7ykqma/dXzfAi6TFJqevGT
         uYeNlEoRlFVuez+X/C9HQGK+vg78hMdRFq2mXMGWpk4YYtMDXN1WDQs33AKqKP2GxAq6
         lSBjpOY8MR65UExZz01V2C1oudYrDAXVhT/EJuXyZ0OzoL9UCjhSKJPGqsUT8tLBaED9
         +8r1Zia5FT9wjUYraSxAzhNmpZT1IIp1STZK6kcgmMWXmNHNWxfdEsntm7ewfirjb93r
         QBIdnB8lXkw9nOmH9aRI8g+GoOCk8CgzLZ+CnBYtpXWR56ppQo2to1jbiRGknP8lz5DB
         v0YA==
X-Forwarded-Encrypted: i=1; AJvYcCXzUj+XaqHgu3+U4XlSGo+TK2GOv52MNhPPFbelOELoeU3F3mTVxlW/FCrk2zu70CnC/VaCwxmg2Kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG8nPryd041l8lZZIBMdJ2RkIECJmQIJvYfXo0+lJfkTLb82ue
	LkdmhELQ9EF1OYWZat9kA9RBnm0AaYR5M4SmA69rS6JAwMGdME3Y+Pf+/ELlMlwbZttp7M2Cvsg
	h
X-Gm-Gg: ASbGncssc73cWZep6GYLqaZV+wNmy/KTHrqYgUtQYNT+q1StTNvaPTUUuBQCimMt3Xj
	QvzTzVisQCFxDBYGhUZY4XqPCbw4Z1WoU1JB0c8p+1TK1aqbtu0Wd4Iy2/PLggyJAmDaurG9C0n
	Jol3iEBkfeAP6o04CvUxZaxQrtzkzbQa1pIOcXDkCAjvfnPzJYMAVfYzTKTzgqbK5r4tE/0n7v4
	Xj7XRAFrz6/o8EtLsVqIrcQbPzeMPifjbXF3+BpWEpTZiG9Zbm+ztXGBH4v5ky3U8gySx1jA3RU
	icNqw/9REasTZRFQHU95Qdl5rJbex9Hk+b5sHojz2YlgC+zXgkbgroVc9IS1EcILkZItYjcoUvB
	VNtqw+xgl
X-Google-Smtp-Source: AGHT+IGjiyFd+95NXvapbPNwv8XBtX45exo5wLffQO+YwVtb/EUNfrmvYU3iRGtNeEZ05yKxPmzCxQ==
X-Received: by 2002:a05:600c:358f:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-43d3f203751mr18729385e9.25.1742321288574;
        Tue, 18 Mar 2025 11:08:08 -0700 (PDT)
Message-ID: <ae9db19a-21d4-4095-a63e-87e9bd7278e3@citrix.com>
Date: Tue, 18 Mar 2025 18:08:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/efi: do not merge all .init sections
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-7-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318173547.59475-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> As a result of relocations now being applied after the trampoline has been
> copied into the low 1MB region, there's no need for a single .init section
> that's writable, as .init.text is no longer modified.
>
> Remove the bodge and fallback to the layout used by ELF images with an
> .init.text and .init.data section.
>
> The resulting PE sections are:
>
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
>   0 .text         0019072c  ffff82d040200000  ffff82d040200000  00000440  2**4
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   1 .rodata       000884c8  ffff82d040400000  ffff82d040400000  00190b80  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>   2 .buildid      00000035  ffff82d0404884c8  ffff82d0404884c8  00219060  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   3 .init.text    00052866  ffff82d040600000  ffff82d040600000  002190a0  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   4 .init.data    00059730  ffff82d040658000  ffff82d040658000  0026b920  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
> [...]
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

