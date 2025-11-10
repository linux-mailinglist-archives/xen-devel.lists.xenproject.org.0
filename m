Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D466C4568A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 09:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158157.1486541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vINVx-0002dX-1r; Mon, 10 Nov 2025 08:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158157.1486541; Mon, 10 Nov 2025 08:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vINVw-0002c6-Ul; Mon, 10 Nov 2025 08:44:40 +0000
Received: by outflank-mailman (input) for mailman id 1158157;
 Mon, 10 Nov 2025 08:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpW6=5S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vINVv-0002bz-Ac
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 08:44:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cf19759-be11-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 09:44:37 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63b9da57cecso4290664a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 00:44:37 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa24d1fsm1015564766b.73.2025.11.10.00.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 00:44:35 -0800 (PST)
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
X-Inumbo-ID: 7cf19759-be11-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762764276; x=1763369076; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7LKLmJFnTZd1KGi6HWsaZz7t+rTUNDbLdHP6oTz5XU=;
        b=R96c+9Xbd4Aby/ZTyGa5rLiwqHTJbRfgK+CrSJ8Pkeh/aB9wyZKsdL3YIfU1z5BSwO
         31R66oRAhB/hiFqTCGVGuC3huKIYgKzJRKTAA7VJYpByZsEcpyIXV5wlloclH9VOMAev
         kNRlpw5lXo+mEtl48O5wM/djo6BwBoE1J2P6hHwxcTKgj0PpXM0ZXT5ENCGaM3Hu6jdf
         XC0pXklYBiHWdOVmGCeQnTVuG5IvJBVt4xoxruu9IkFdTxp68Wr2LGhJjXKnylf2wYLB
         UBRmatL17ZxOfD4hSAsn3lKKcadQXSetdxb6tZaJ0GuiaCdbhYv0z0h2/IGCxjWmIhvW
         RvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764276; x=1763369076;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7LKLmJFnTZd1KGi6HWsaZz7t+rTUNDbLdHP6oTz5XU=;
        b=oM7uY2fS1RixcngoyOhK7i99QxBXMeIKvgCGcEm8VU2McYDMG4bQ5Pri2vW0o4BCmt
         VRylLvI9rd43BEp5bpXyoyppqI5PrnvuzAjF+xlgXMHse5pX2Dj0hjG1xxP9JBKfPXv0
         fLNmVYw1w485lasaKei7+dJurHEDiteGnWj6+ktrAFHFhVv2P1ZR8iFk7upva2Vij453
         FmMauHCdWY/8A1nwF6TAN9qJo1zykEtVdPSdNaQGHLb1ptxUFDizvSlrh2xRtK//4Nkk
         0vbDJ4XH9QvdNbeh2s6LlslzZDMoIxbvwZ+OR14Ws4nxyvZ3rpsZPyIXItHbDgISFsPb
         1grA==
X-Forwarded-Encrypted: i=1; AJvYcCUeeNxOkvTUp363bKVnYaGDzrffvo42lu6ZSm1TeMaNuatNnGKSMff5F+A+x6Sj6fLEIJjDmnuj0ic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8fOy2xzdSUdhQKnEsnfsrpehjBRfdfY3D/UUb39RPa5Zj/kSf
	80LCBCs92MePergGsc4L3K55XcW/CFFganR5do0b8U/ZidoPDXeINsFc
X-Gm-Gg: ASbGncsyGQgjv07nshsfgf2CpaWu/B7ELjSz4vUOxBbrIn2bYlGvv8vUdRo26qrf8TM
	OiKk9x6ru0UsBkTR/iuUr1qqOz3vGLD/tXeMBYKdBTwWDDHVxCC60Gwx7lV3GzwgLFscKDUyJc7
	w6BkrKCd8sfajO9fnDtDmYtIu6m1gQsQyyAnSkYZtF8XsHIgkxLdKmFue4dyf8prYBfBkC+Sdma
	qPUblzjuys7/Kz1orOl2gBYNTKBJDTWgVvIcXBc7aWg69WqkvOea42Ae+vEASj8JAy/Vo4M+YPw
	o6NY3XEJsyr5PL8kPdRK32UrxKcvCOjbIK0xSN27CS/0a19kvhUadRdrqzkM0t86nqLDCCdOubA
	B6I7X6lB9P5w0MeNmDPxppOaXq6+bKtaRb3iStPXqF5Vp6Z3Ox2ifEyI/9ctTjLuaS7WkRy/7Sr
	Z5vjE9xOGItD5frWyB6rkR7tmYgw9OQtjN8SITltO+aQNtE1FKuIB5Bj0JDt4H
X-Google-Smtp-Source: AGHT+IHyaveBc1mFku98W4Fskg3gRtDDG3Znkla0pfa9wn9Mh2FYC7vyX/4wtd1edYvOgXNQkHHkUw==
X-Received: by 2002:a17:907:841:b0:b72:67c2:6eb0 with SMTP id a640c23a62f3a-b72e0562e6dmr805812166b.62.1762764276043;
        Mon, 10 Nov 2025 00:44:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Wvu8FsypiDWNyspQYkevPvrX"
Message-ID: <c71613e1-9309-430b-b656-018dda8e6a07@gmail.com>
Date: Mon, 10 Nov 2025 09:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] fix xl.cfg docs to correct viridian defaults
 list
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
References: <aQ5HR2eEQ9awKtpC@dingwall.me.uk>
 <8c9f0988-0eb3-40f0-bd22-13b23af03ed8@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8c9f0988-0eb3-40f0-bd22-13b23af03ed8@citrix.com>

This is a multi-part message in MIME format.
--------------Wvu8FsypiDWNyspQYkevPvrX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/7/25 11:50 PM, Andrew Cooper wrote:
> On 07/11/2025 7:23 pm, James Dingwall wrote:
>> Hi,
>>
>> I was trying to work out why this would cause my Windows 10 guest to hang
>> when it should have been equivalent to ['defaults'] or 1.
>>
>> viridian = ['base', 'freq', 'apic_assist', 'crash_ctl', 'no_vp_limit', 'cpu_hotplug', 'time_ref_count', 'stimer']
>>
>> Checking the libxl sources show that in fact the defaults are:
>>
>>      if (libxl_defbool_val(info->u.hvm.viridian)) {
>>          /* Enable defaults */
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE);
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_FREQ);
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_TIME_REF_COUNT);
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
>>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG);
>>      }
>>
>> LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER was removed as a default enlightement in
>> e83077a3d11072708a5c38fa09fa9d011914e2a1 but the docs were not kept aligned.
> Hmm, indeed.
>
> For the patch, Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>
> It should have a fixes tag, but I can fix that on commit.
>
> CC'ing Oleksii.  This is a docs fix should be considered for 4.21 at
> this juncture.

Agree, it could be in 4.21:

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks for notifying me.

~ Oleksii

--------------Wvu8FsypiDWNyspQYkevPvrX
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
    <div class="moz-cite-prefix">On 11/7/25 11:50 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8c9f0988-0eb3-40f0-bd22-13b23af03ed8@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 07/11/2025 7:23 pm, James Dingwall wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi,

I was trying to work out why this would cause my Windows 10 guest to hang
when it should have been equivalent to ['defaults'] or 1.

viridian = ['base', 'freq', 'apic_assist', 'crash_ctl', 'no_vp_limit', 'cpu_hotplug', 'time_ref_count', 'stimer']

Checking the libxl sources show that in fact the defaults are:

    if (libxl_defbool_val(info-&gt;u.hvm.viridian)) {
        /* Enable defaults */
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE);
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_FREQ);
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_TIME_REF_COUNT);
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
        libxl_bitmap_set(&amp;enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG);
    }

LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER was removed as a default enlightement in
e83077a3d11072708a5c38fa09fa9d011914e2a1 but the docs were not kept aligned.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, indeed.

For the patch, Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

It should have a fixes tag, but I can fix that on commit.

CC'ing Oleksii.  This is a docs fix should be considered for 4.21 at
this juncture.</pre>
    </blockquote>
    <pre>Agree, it could be in 4.21:

Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks for notifying me.

~ Oleksii</pre>
  </body>
</html>

--------------Wvu8FsypiDWNyspQYkevPvrX--

