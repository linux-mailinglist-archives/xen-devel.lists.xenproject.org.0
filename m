Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3252B42389
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108395.1458518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoPt-0005d2-4O; Wed, 03 Sep 2025 14:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108395.1458518; Wed, 03 Sep 2025 14:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoPt-0005am-1f; Wed, 03 Sep 2025 14:24:53 +0000
Received: by outflank-mailman (input) for mailman id 1108395;
 Wed, 03 Sep 2025 14:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tKq3=3O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1utoPr-0005aZ-R5
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:24:51 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c09d9f77-88d1-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 16:24:51 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so504176966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 07:24:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff3dd9574fsm1220892866b.84.2025.09.03.07.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 07:24:49 -0700 (PDT)
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
X-Inumbo-ID: c09d9f77-88d1-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756909490; x=1757514290; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK1tr560GZibtfYpnh3lYs+KzRlMKMjRzLwK3lrUH9M=;
        b=A5h/cFZcIcEIKZttD18gT+LRWEU/6YjuHn75ouGPJ+ASfDkoidP/5nMqhuqa4tgbLe
         4rkUN0xLD6Cplqmj8R905Vz8j6tmRIVvZ5VL4qXIk2FD4+xIcKXfkH6FD4AWkGg+kJRJ
         4Qsly9Fx0TIUd1Ha4lfeIQQdy3mg7y1wOBMaKaU5hhUEiwhkkmnhalI6SZmrGcXF1nXg
         3v3QFguW5bZKOnwnNX/OjZg6lXiEvAb2PEGKmthj2zZjoLIn/qSVjz0efJiAWXN/6beL
         xEd8Uttcb1MqTellM9Jpiuwje51h0kBogFzsD5iGroYS4bKPfnToJAEKElXVHyD3+JJx
         mNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909490; x=1757514290;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EK1tr560GZibtfYpnh3lYs+KzRlMKMjRzLwK3lrUH9M=;
        b=cSjzg6LyVsZ5evuVFqvO5NmzpaQK2ihc0jNXFwD3TlML8hTSk52mWqBTYO/BoJQ7g2
         +E+D1MqyHdZggQReRqdAfJdzhiGS/aHK5QraQX2EHixk/8hMQTLNZROTZjnKdOpon1jN
         QBSUFe9W9FhEMzruL3+fEMGNhtUubF5dEnLkEg2blpDeYacx/xO1nogninRmGTjWpqKF
         7quN0jQtW4ydaoYQNHpC9ODCM/gbFIGB9goQ/T3OZYkaNGvfU3d/H9Zx3XQ+CGFpjqka
         w9wHvia8eR0nZIWyVZt3EJm1a8QON9pd0qv4dEpHHrJVye+aUjo7bYwvUeJYh14tNyjI
         kqhw==
X-Forwarded-Encrypted: i=1; AJvYcCV1fL6h8galTnpNFAiRE+KPDXTCePuefcJJnJW+sD8kzNC1tKgSsyCkpe1lHdoiZVZnNugPsgRN6II=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+lu8Wv14FBf+OnODWzNrvYNYaqHI5TisjH55cPZtrYuYJxT5d
	5g6imCvyI3dE2vH4LfjDuxVjMe8A50zK1jjP3ayd0vXnlS3gyitFvjnX
X-Gm-Gg: ASbGncs890IruGhJlO72d3xMAXX/9kbqlZuTfHcaxegQ2e5BeccEcYNHyCwlZwAwZCG
	WNafIz3GfZkI1dY/ksJ3Wh6qvVIUJirbBgNN9hOcyiXr6+qDHJlatBVFxqAKvJ0mOY9WOMFscgc
	+CbR4AXUdQRf3RI6aENziof+05dVgZ870bqcCSG/bBiwzi973MYRNl9qpaYfQuaTQW47eH76jqY
	PocLxkrPlf1qeU2HdC4gUiaE4ukYK4KHbVaTcl9sXb5xkC1oh5xcYcLb4qR3nrR9+wDSQAWWs+Y
	pM5NatSi6UxE/OOIyUaYC0QvdbbzfG/bxMuMNa7idk0vKaZi4xH3u6/Q2JETYTWCxFXO0qLAoEI
	yKQw7vHwkfGBvqAPr8P5/HU0J1Ig2BL/T+F5Xs6jgOlnEzc+FdQ34rQk4HjaiX1eK52EC8JAm
X-Google-Smtp-Source: AGHT+IHCkHjGOwQE2uUPD1e1XmMl8oqi6+nJ0/09cwpd6jIlSsvZIO8b3glK9PqIc9eoYCyuuX+W2g==
X-Received: by 2002:a17:907:7242:b0:b04:5734:3b76 with SMTP id a640c23a62f3a-b045734438emr583139966b.24.1756909490025;
        Wed, 03 Sep 2025 07:24:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------qRxS4DN05Ufa4MMRvrxRWqow"
Message-ID: <bfd4b635-2497-475b-92f9-b66de42b5a60@gmail.com>
Date: Wed, 3 Sep 2025 16:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] xen: Define xen_domain_handle_t encoding
 and formatting
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>
 <d4fb77fe-e956-4c3b-b7be-06fc36fe4be4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d4fb77fe-e956-4c3b-b7be-06fc36fe4be4@suse.com>

This is a multi-part message in MIME format.
--------------qRxS4DN05Ufa4MMRvrxRWqow
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/25 5:55 PM, Jan Beulich wrote:
> On 29.08.2025 11:58, Teddy Astie wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>      - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>>      - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>>    - Linux based device model stubdomains are now fully supported.
>> + - Clarify guest UUIDs as being big-endian encoded.
> Is something like this really in need of having a ChangeLog entry?

Perhaps, you are right and there is no a lot of sense to have such item in ChangeLog.

~ Oleksii

>> --- a/xen/include/public/xen.h
>> +++ b/xen/include/public/xen.h
>> @@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
>>   #define xen_vga_console_info dom0_vga_console_info
>>   #define xen_vga_console_info_t dom0_vga_console_info_t
>>   
>> +/*
>> + * The domain handle is chosen by the toolstack, and intended to hold a UUID
>> + * conforming to RFC 9562 (i.e. big endian).
>> + *
>> + * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
>> + * endian) for presentation to the guest.
>> + */
>>   typedef uint8_t xen_domain_handle_t[16];
>>   
>>   __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);
--------------qRxS4DN05Ufa4MMRvrxRWqow
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
    <div class="moz-cite-prefix">On 9/1/25 5:55 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d4fb77fe-e956-4c3b-b7be-06fc36fe4be4@suse.com">
      <pre wrap="" class="moz-quote-pre">On 29.08.2025 11:58, Teddy Astie wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
  - Linux based device model stubdomains are now fully supported.
+ - Clarify guest UUIDs as being big-endian encoded.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is something like this really in need of having a ChangeLog entry?</pre>
    </blockquote>
    <pre>Perhaps, you are right and there is no a lot of sense to have such item in ChangeLog.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:d4fb77fe-e956-4c3b-b7be-06fc36fe4be4@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
 #define xen_vga_console_info dom0_vga_console_info
 #define xen_vga_console_info_t dom0_vga_console_info_t
 
+/*
+ * The domain handle is chosen by the toolstack, and intended to hold a UUID
+ * conforming to RFC 9562 (i.e. big endian).
+ *
+ * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
+ * endian) for presentation to the guest.
+ */
 typedef uint8_t xen_domain_handle_t[16];
 
 __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------qRxS4DN05Ufa4MMRvrxRWqow--

