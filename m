Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D565C0EE96
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 16:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151660.1482188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDP1j-0003R0-A8; Mon, 27 Oct 2025 15:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151660.1482188; Mon, 27 Oct 2025 15:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDP1j-0003Oq-5r; Mon, 27 Oct 2025 15:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1151660;
 Mon, 27 Oct 2025 15:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4SB=5E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vDP1h-0003Ok-6E
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 15:20:53 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 866cda65-b348-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 16:20:52 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b4aed12cea3so553059466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 08:20:52 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548ed9asm803431166b.74.2025.10.27.08.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 08:20:51 -0700 (PDT)
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
X-Inumbo-ID: 866cda65-b348-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761578452; x=1762183252; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAaz6eSVpPT4hNFpdPas/PK6GnS38dbcX7vbAZdguI4=;
        b=Rk/AxT15wuoeiV1100ZXk24oEQysg2SeERFv1xVkPy6nkZkWJrtzTplDiUq73XNxmA
         FWlzpwzzCE6SnH6BKzfzAeDZYuQIy0qgElPVp5cL+PmXjNf0zU4zPgdnO7dNb/ew2Abr
         uL9dGQJbN2YuQR5nfL1ONfr2v0VdVdaHY22SpOX3yKUr/MHheZEICDNPzJtyOWx1GQbU
         a0feEwVQ7ji0BOuR18XY9JRgaAVlgEj2/7o2azgCsTk1a3Qe97Gk9+tX+nJO7xjz/DWt
         qbFX5C8YbJ76AVeKkosOUV0e9f9qjHGN2xtphTgvGcgx9wVPwCnGqWACguBmJ1wMUzks
         CK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578452; x=1762183252;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAaz6eSVpPT4hNFpdPas/PK6GnS38dbcX7vbAZdguI4=;
        b=A/y1APt9mJ0qFPf1fRYhuPtr0YHB674DM0pTzJIhio8foJINm/Td6IYAkJ4qyevSDO
         ltp0TouxaOeyOcc2VTYTYVBvjMmTiUBPnFacaCMsaNhz/GGzjJEysaL+zC0yR1+Nji8k
         WMHB5SNOkY2jfWMfsNwKc5jM+H1rq2OeB17Eux8dfeyEpyYABjtziw1NfJEeFzOOI24J
         SCFNGamlcN7jy9t45CWmSsU7eKF+rYCOYfrZj4SQSCH6K6nI4T+VIPFhVvVDQKHsIHqH
         mAtprSzoHHGUvjmuYwXFGCGmlWAti/0AjgMIS7nQnoRA5jlLobHv3MlqFLmobCIJouvK
         9I5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxq9nb7VIduOrBu2HzTl1bzH2DNi42ItSnBZZrFaxO7CmBU6mc/4S1t93jkO6c91v+Tx0UQOqMEcU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwezLJy+p4t3sMeS8sqUOaagvclvWEs2eSxUZVoVZMzuZdP3mCz
	tbxdeMdqiNdL5piKT3Jx2VWBgi2Ay+fHhstPhj5l43uXCLzsIsyRKPUF
X-Gm-Gg: ASbGncshJUpKZ1KLaFo+FIrcPT/zo+zZK3OlzlvwxRrI0yC/y93Q+i40RgLw+1QiQmv
	tKXJjzR1r5jlvB3e0M4JMquRe+M7DYrZkmEF752cZFFGJOrH6IE+AeuicvAbccDNJbcN882gPVv
	KuAWdcyCfSLwmgbIUZIqiTusLftslCYppzGuLE74Q68bx5Z0bpwtkMej8Wdx6ImswrP7VQMQgRO
	P1i7BPzikrWDf9TtViVAsLXFLv7mBgDbPiju5SZ/VgojAIXn8r7sQEz0Dv+VI9fOyfnzDDeCBLc
	y7grtCvtybe5zdJyBrRQn3Z0qwA3EXttrF9TmpN3fG9iSCa9FYpwUI4+/cIrJcJWcpHVFb7Sk2E
	tUVtqCea9T/ZVS4D8O2nYBrMlba0hLNQugxv/JLIBtyf2mgaNtrNSz9I/OVgmD+d2u+Xq7A/Gxr
	BPCjhE7Msw+DAKGhgjjD1Obhys6l/RwVVGhJnxfVrYJZAIXFmv1g==
X-Google-Smtp-Source: AGHT+IGv6ymCC5PAp5yVwSLqfFzNPVvh9X7DSPDZLpSVnspjcNK2EyEevtn34Jv+Ffpvs0z8j6SUBw==
X-Received: by 2002:a17:907:3d4c:b0:b2e:6b3b:fbe7 with SMTP id a640c23a62f3a-b6dba1d8281mr32401066b.0.1761578451555;
        Mon, 27 Oct 2025 08:20:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------04L3DWwv1Y96bY50wSKtZ6dg"
Message-ID: <3939c358-5274-49a6-83f3-1d7aa947bfa6@gmail.com>
Date: Mon, 27 Oct 2025 16:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 3/9] x86/HPET: replace
 handle_hpet_broadcast()'s on-stack cpumask_t
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <dcea0975-8642-46b6-ad79-ec76cb8a76f1@suse.com>
 <b10cd3de-0449-483e-bc84-791ddda59c53@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b10cd3de-0449-483e-bc84-791ddda59c53@suse.com>

This is a multi-part message in MIME format.
--------------04L3DWwv1Y96bY50wSKtZ6dg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/27/25 1:25 PM, Jan Beulich wrote:
> On 23.10.2025 17:51, Jan Beulich wrote:
>> With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
>> the IRQ handler can't be invoked in a nested manner anymore, we can
>> instead use a per-CPU variable. While we can't use scratch_cpumask in code
>> invoked from IRQ handlers, simply amend that one with a HPET-special form.
>> (Note that only one of the two IRQ handling functions can come into play
>> at any one time.)
>>
>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>> Reviewed-by: Roger Pau Monné<roger.pau@citrix.com>
> Views towards 4.21?

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------04L3DWwv1Y96bY50wSKtZ6dg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/25 1:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b10cd3de-0449-483e-bc84-791ddda59c53@suse.com">
      <pre wrap="" class="moz-quote-pre">On 23.10.2025 17:51, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
the IRQ handler can't be invoked in a nested manner anymore, we can
instead use a per-CPU variable. While we can't use scratch_cpumask in code
invoked from IRQ handlers, simply amend that one with a HPET-special form.
(Note that only one of the two IRQ handling functions can come into play
at any one time.)

Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Reviewed-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Views towards 4.21?</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------04L3DWwv1Y96bY50wSKtZ6dg--

