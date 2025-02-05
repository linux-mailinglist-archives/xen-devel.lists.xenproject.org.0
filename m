Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AEA296E4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 17:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882257.1292422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfijo-0002sh-5s; Wed, 05 Feb 2025 16:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882257.1292422; Wed, 05 Feb 2025 16:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfijo-0002qt-2r; Wed, 05 Feb 2025 16:58:56 +0000
Received: by outflank-mailman (input) for mailman id 882257;
 Wed, 05 Feb 2025 16:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnKU=U4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tfijm-0002qS-Ew
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 16:58:54 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a43c69a-e3e2-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 17:58:52 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab74ecfdae4so2557366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 08:58:52 -0800 (PST)
Received: from [192.168.201.60] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7613d1ae2sm130378466b.11.2025.02.05.08.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 08:58:51 -0800 (PST)
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
X-Inumbo-ID: 7a43c69a-e3e2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738774732; x=1739379532; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGpZjlAHu0mD7hqRyQSl0n03cZwCd2zt2V03PgMTddg=;
        b=FBpxX4BQ4NCbMPX/DU+SwAAJMBo74dWTpvqXPioqJwlzhEqvcv6o1BLwrO80ZLPvQ3
         zW8CdqwyU8IlkIPLdYuvYYqyfIRDRTbk063OLVDoD98zybRtR8S0GQFB7jp3Acqr6r7q
         huim8qqXzrHcpw2jUZTNvueLTxnxBHRQCHEqjhWzTGHtt5btCGEFfoZAFN1qSM5BtdK0
         AKkQr8ptjxE1heC2DJpYjb8OankxGZv/UUx3naAygX9EtFBkkpQpLIgomPuYG1288JAp
         zszyTffXb7BOucNVQpcPi7A09aO26NTdvEwjeQiB9N5k94G4sGtoBR69b4dkBiWNzIhF
         qJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738774732; x=1739379532;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGpZjlAHu0mD7hqRyQSl0n03cZwCd2zt2V03PgMTddg=;
        b=DjzS7bGzJiFHbXCz0TQYSpTgqxowhlpz9yPxU6EVm0bs5yKmUwNEjcUekGnhFgI8F9
         AbYXfLbXu4lDDfqQHDbFi+cU2XcBh6Xc//C6F4a60bzHNCIB8tINw2D4rojCFzgI6lvH
         VLa+v4yoBwKKSViqiu4hJqnG0UUnUN3Go6xu/GgSWr2tLef0GyuG64cHPqgAUNA2WJm/
         /hy0hO6lmm5KU8CBX/37KoZRHQ8bBXTPxFxQv5ykoMrSlbeUBjB2fbehU3VceyrMC6sT
         ISm4YA10oCPUhcUe+P7ESsEk2Y5mmZRmHwWVCaXITZAUlasNWasuHn6TMlJ5wRcKFjIC
         I/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVq4wfYgV8eh1um0KDgYkD9MDqsGhnDLwAukG8nKpeii/WjvQSyR4GGPvao7IytFxjDm04GFEDEIaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6t5ZWru1G8gB02OCdk0sUNsc28uYSBHa1HbRaW/7rXoknKxyT
	yNbcS5V4EwbKgaKbwmJU2+5w6CzBjac9TjqEPZNPnQ2cf7vH648z
X-Gm-Gg: ASbGnctK17+Z/HDLlXBk36JUmtI3UkldDfeNs+dvlTdQQ84PRJw5cTnTeckTENEVOTQ
	21hb1s9kJQrbd168HyUA6SWuULDkMRsWu5Fr+IQVIRBM+ZVvaOuyLaNWdVFVZmroQ5M7ljjWaTj
	RjPjdjDfjyAOvrW2U3VThy7LV+0zBOJfgx73yRhExORkYr2LQGNdHccm+linNdlVoeQfm6tPBtR
	myTixeeseSrNQy0DwkQNTk/oEz80WCwkKHwIAAt2Yjx+96KsaCFaVTTCyeFwj54zSf6gI39tqXp
	huEUHmLr/+4mG/0eoh9YRGkjksE=
X-Google-Smtp-Source: AGHT+IEHPJNFiPcof7XrywBeXQYR77wf4lLyy+zS5BOonlQ67OT+f98ffZP6/7Wii7asben+NXbOcw==
X-Received: by 2002:a17:907:9409:b0:ab6:fe30:f48b with SMTP id a640c23a62f3a-ab75e33f6c1mr329867466b.52.1738774731693;
        Wed, 05 Feb 2025 08:58:51 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------nEztVmXJe7zkDbNmlAK9XKYp"
Message-ID: <171b1291-5ff0-414d-abfe-00ef11152590@gmail.com>
Date: Wed, 5 Feb 2025 17:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.20? 2/3] xen/riscv: update defintion of
 vmap_to_mfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <131ecfd1b39b4ca4fe3e5d7f7e28a130c301e0fd.1738587493.git.oleksii.kurochko@gmail.com>
 <1223dc81-da85-4616-be12-ad445ad4ca4f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1223dc81-da85-4616-be12-ad445ad4ca4f@suse.com>

This is a multi-part message in MIME format.
--------------nEztVmXJe7zkDbNmlAK9XKYp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/4/25 2:56 PM, Jan Beulich wrote:
> On 03.02.2025 14:12, Oleksii Kurochko wrote:
>> @@ -160,6 +158,18 @@ static inline struct page_info *virt_to_page(const void *v)
>>   
>>   pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
>>   
>> +static inline mfn_t vmap_to_mfn_(vaddr_t va)
> Btw., for static functions (and variables) a prefixing underscore is
> fine to use. Its identifiers that don't have file scope which shouldn't.

Should it be used a single underscore prefixing or a double one?

>
>> +{
>> +    pte_t *entry = pt_walk(va, NULL);
> Oh, noticing the anomaly only here: Why would pt_walk() return a pointer
> to a PTE, rather than the pte_t by value? All this does is encourage
> open-coded accesses (even writes), when especially writes are supposed
> to be going through pt_update().

I tried to play with forward declaration of pte_t to not introduce
circular dependency in the previous patch. It would be really better to return
pte_t by value, I will update that.

Thanks.

~Oleksii

--------------nEztVmXJe7zkDbNmlAK9XKYp
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
    <div class="moz-cite-prefix">On 2/4/25 2:56 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1223dc81-da85-4616-be12-ad445ad4ca4f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 03.02.2025 14:12, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -160,6 +158,18 @@ static inline struct page_info *virt_to_page(const void *v)
 
 pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
 
+static inline mfn_t vmap_to_mfn_(vaddr_t va)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Btw., for static functions (and variables) a prefixing underscore is
fine to use. Its identifiers that don't have file scope which shouldn't.</pre>
    </blockquote>
    <pre>Should it be used a single underscore prefixing or a double one?

</pre>
    <blockquote type="cite"
      cite="mid:1223dc81-da85-4616-be12-ad445ad4ca4f@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    pte_t *entry = pt_walk(va, NULL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh, noticing the anomaly only here: Why would pt_walk() return a pointer
to a PTE, rather than the pte_t by value? All this does is encourage
open-coded accesses (even writes), when especially writes are supposed
to be going through pt_update().</pre>
    </blockquote>
    <pre>I tried to play with forward declaration of pte_t to not introduce 
circular dependency in the previous patch. It would be really better to return
pte_t by value, I will update that.

Thanks.

~Oleksii</pre>
  </body>
</html>

--------------nEztVmXJe7zkDbNmlAK9XKYp--

