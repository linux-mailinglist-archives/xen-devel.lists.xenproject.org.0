Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C2AEE0C3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029144.1402891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFZS-00087F-EZ; Mon, 30 Jun 2025 14:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029144.1402891; Mon, 30 Jun 2025 14:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFZS-00084i-BX; Mon, 30 Jun 2025 14:33:22 +0000
Received: by outflank-mailman (input) for mailman id 1029144;
 Mon, 30 Jun 2025 14:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irzh=ZN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWFZQ-00084c-Ri
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:33:20 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a895047-55bf-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 16:33:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c93c23b08so4115636a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:33:19 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35365a00bsm671585366b.43.2025.06.30.07.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:33:17 -0700 (PDT)
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
X-Inumbo-ID: 2a895047-55bf-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751293998; x=1751898798; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArDgpdfYRcSK+x3VgTZdHw4Mxkly6eEcm7G1XIBFAYI=;
        b=baNTeit+paGZriXgjPt1+g9IF1mc1697xwc98W5W4eHZrOGKd/DnrqwamuxG2YX510
         nytVSya8e5u9txDD2WaJDXWiFKEE6AzjLLFABWDF+KzZI3EIW8mULgLVlGRkOueuaOyZ
         EGOpOEyVG52q0Q5KDzEO45hmtlQXFj29kLnUxLZr+CTC00MrXf8P5CTO4l4Jm115oetC
         RyF2ELFXVAcMpoF+R1NS83zq8ExjR003a9WWmIWmmm0lp6csIArt6gKwckOmlmLk4n+s
         UjyGNJgEwbUpTdI04/gFreCm9YQWQnLPO3+Opwco2AGotxMJL8Tq1U/Z5TQ4ZN2k0Me1
         VbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293998; x=1751898798;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ArDgpdfYRcSK+x3VgTZdHw4Mxkly6eEcm7G1XIBFAYI=;
        b=FT98Gt3M+pdp7qznisF6oaMnNIsHnGwpX1tuIlP0Ba3+ZyZf8wkpIuQHrS7BHgyNWx
         vyQUsb6MYzU0aA1gFkWpcdVAXdtDsydHcbpFgxMm086miJ1Q6rI+4MvZR5y+3IIL6Jm0
         oxQ9+bDTNNun4Lc2DCBfPDTnyQxzEljqquCiPwuz1kRMvfz2dgu8e5yLLmYEp6MP0RSl
         8gH7Tp2zL43ct+3opqsuwh0kL5nRWlZiqjbu2Aads/Qxxk7BnM8d7rBYX8yWke3dxN1t
         V6uOzvU9ZGtpcga0Be/DhWEHv1jh42ACAXZSjxAhkl8LtU5zH5bvH0w4vKIebSByKJTg
         5NGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx/gDYtHBLIv+scjqWs4TqDdhXrhTw/q/9ftPHG57hQucXPdlxF15X1/XtaxRBw4wSNapMbNIdrho=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPyzemeJJ3Uw9H7c9TlnWFTSFuLg3Bpy0mt2EpBQFH9m8f04sl
	1csYuhSbJu/zWb3R85PKXgHV0JR37Lnx3WzPmdy4gsnpp78TLa6C5Ppz
X-Gm-Gg: ASbGncuzkAZgBvSDuVuOMXe4PZ/8eL8r2CyET6YdYIyOReOeQB3ahPQg4QlNPT9lSDB
	+G3/TMwReni/rbmsaTrTm4AnlakJQGc/GUghOCHTFeZGVgm6RW5pWUJXnITsQuqftNVMjBoD8NH
	XZ98OeEgS6waF/GU4oWZN5YoXXkBXZ4FbTo5GdyBFS3M646UKmorUKi+7EHCx2srwccw+KmiCSk
	Y3Z5gENMdz1D/xuLnbhd9BMEAZjtpPDxS3HhakDtVk6TT8TT1CHQFbufUfa2llS3ys/eCfJB+Pl
	fOo+nKqAAQ6N+F9KOAwrrqcWgE07FC19TygD2eyv5/Grlz92hwVayi/UPYq8aQjXUXi0+bWCXJW
	GLDvkwwaKXrmgc6ZBeCca/G1HCe4QEiA00E0=
X-Google-Smtp-Source: AGHT+IEiWXre205oLlFE3NMVEWfRJXtuNSi3c/+zySYka1TvT6jayw2C4f7jhcNkyuU2XDx83sG9Rw==
X-Received: by 2002:a17:907:da0b:b0:ae3:4f80:ac4c with SMTP id a640c23a62f3a-ae34fd34584mr1134152566b.12.1751293997928;
        Mon, 30 Jun 2025 07:33:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------n1OeZGfRkjomcLYG4SFqHJ4E"
Message-ID: <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
Date: Mon, 30 Jun 2025 16:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>

This is a multi-part message in MIME format.
--------------n1OeZGfRkjomcLYG4SFqHJ4E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/25 4:59 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>   typedef enum {
>>       p2m_invalid = 0,    /* Nothing mapped here */
>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
> As indicated before - this type should be added when the special handling that
> it requires is also introduced.

Perhaps, I missed that. I will drop this type for now.

>
>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
> What's the _dev suffix indicating here?

It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
|using PTE_PBMT_IO for |p2m_mmio_direct_dev.

Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.

~ Oleksii

--------------n1OeZGfRkjomcLYG4SFqHJ4E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/25 4:59 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -61,8 +61,28 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As indicated before - this type should be added when the special handling that
it requires is also introduced.</pre>
    </blockquote>
    <pre>Perhaps, I missed that. I will drop this type for now.

</pre>
    <blockquote type="cite"
      cite="mid:8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's the _dev suffix indicating here?</pre>
    </blockquote>
    <pre>It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
<code>using PTE_PBMT_IO for </code>p2m_mmio_direct_dev.

Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.

~ Oleksii
</pre>
  </body>
</html>

--------------n1OeZGfRkjomcLYG4SFqHJ4E--

