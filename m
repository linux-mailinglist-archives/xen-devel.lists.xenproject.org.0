Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C116EA462D8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896725.1305489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIRW-0005MN-DJ; Wed, 26 Feb 2025 14:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896725.1305489; Wed, 26 Feb 2025 14:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIRW-0005KS-9v; Wed, 26 Feb 2025 14:31:22 +0000
Received: by outflank-mailman (input) for mailman id 896725;
 Wed, 26 Feb 2025 14:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnIRU-0005Jf-0W
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:31:20 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57dda925-f44e-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:31:19 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1389137666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:31:19 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed20572a6sm337205266b.143.2025.02.26.06.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:31:17 -0800 (PST)
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
X-Inumbo-ID: 57dda925-f44e-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740580278; x=1741185078; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwINcUAM9RRcSvGyhYP2B3YJmGvd7kBSk11WtDz4y0o=;
        b=PA19AYFlyWW2WegxwUz6oHU0oy0h+IegTCHooJ1KDsLddA8pLGhba1kbf6Ywi4fW7h
         HBybDLjO9b8P1Bmb6mHVde1K2+v6oCkw6gSENftgHJVWsf+fixLS4lYD1njgoYPWinUg
         BrpgrSyEzTX3N672ycCCs7TlArna170SbOhfRAniiNSjUFPp/q4lmzPA9aGuzU4ufCOU
         tlyLfPNpn0FCbwZO77KbgXJnsVvUfxZCeXZJpSZWBNDl1zHam8Xz+DMZDLap3i/EnUZD
         awxL93H1NvTXj5P3y2a9f7Ww6IGw7Ta49SBNxQXNZXuHsridAbR8H3JDtaqZWXFHumGo
         zffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580279; x=1741185079;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BwINcUAM9RRcSvGyhYP2B3YJmGvd7kBSk11WtDz4y0o=;
        b=VHftAu+EPt5E7was69gJ2iuYoaBY3l/f4STu5Vu+Hzq1LhGqwe7rdCThl+CYiBLe1H
         KdNy/Sxkz+3N8/qfO3r4yCXvz+RnFIsMceHfYhXcqlsNx5lUk3hc0jSKNMtZX3r9lyft
         amtH++TiLKXyhLInOMIcOFB/myRtbrjJnxuKpFaZKUageYvtHqmvfhcsnBpigijEO3vM
         v6JGOKF+uqQeRpyta1DY5UnwUQiWH7Hh0iw58NLsyA2Wsdr4TppmmOVMgW3148uz5PTF
         2QMZaX62mhtoRt4mnF/4/8Xw+aeJQ7GeiHldQb1eZuopDHs+si/wOav1zRxCKkuISKkZ
         Yrdg==
X-Forwarded-Encrypted: i=1; AJvYcCX0bn14fns2fWlQ/YRyAO2mukmTvhnlD7F4gTuVka52SC9MPfb1rdKdRkfEMq+AlZZkmWnrjLCsUig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQvoc8g32VN5Sg+EjbzuUMTIz+6CPsrrsZkAs2srL087jmbm9A
	B/C/KotNfRDaJaNDFnkwOVL69p8Oe9qP78PPZogDkwr9wdEuZ9G/qxsT3w==
X-Gm-Gg: ASbGncu8i149PIAKZ+GeiCYjYvlAQCzL4KrBjqI896g4ouod1KLRkC8cjMp2t9DST1U
	4Gj7c4ZdObBPgw27mCziMxsmWUQOwS/ARrBxAMgu7g1OGizBD2zdcS9MsaeyIsr3YsevsKADZ/C
	BJ+QlJ7fzXLNvNj+Cg8kzzIpYCQYftQqk9+5rVG5MnitvCtk7xZl7kHAOrJwtu8Irg/A62lqnMw
	GMSxLLM7/JH2dGQZtRZeb+UQ8GPElAev4sna63KWDD2gHKyfXgm4EgB3sImIBGzpIKcUQR2RUoO
	mgSdxC8X0XGgG+apLGzHc5G5Dvd4u89OVSQ=
X-Google-Smtp-Source: AGHT+IEZQrgWGFapG9i6UZ4LQoHADsL6yGIaIaRygMGWj/GejnfWX9uRIntxb3CXZjBRaw7U5Lo2lA==
X-Received: by 2002:a17:907:3f1c:b0:ab7:8930:5669 with SMTP id a640c23a62f3a-abed0cc2e77mr754485066b.18.1740580278203;
        Wed, 26 Feb 2025 06:31:18 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------tk2hAiWcR0r2kXSAZqZXAlL6"
Message-ID: <e801c975-0985-450e-ae6a-7659a78e862c@gmail.com>
Date: Wed, 26 Feb 2025 15:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com>
 <0f07557a-f340-4056-b8a0-5efe680bddc7@gmail.com>
 <b45c2acb-9d72-4de9-907f-ad2d0c7ac6bd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b45c2acb-9d72-4de9-907f-ad2d0c7ac6bd@suse.com>

This is a multi-part message in MIME format.
--------------tk2hAiWcR0r2kXSAZqZXAlL6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/26/25 2:13 PM, Jan Beulich wrote:
>>>> +   - Zen5 support (including new hardware support to mitigate the SRSO
>>>> +     speculative vulnerability).
>>> I'd also suggest to qualify Zen5 with AMD.
>> I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
>> I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.
>>
>>>    Whether to mention this here
>>> when I think I backported all the pieces isn't entirely clear to me either.
>> What is the better place then?
> The question isn't where to put it, but whether to in the first place.

Wouldn't it be useful to highlight that Xen now supports the new security feature
for mitigating SRSO vulnerabilities on AMD Zen5?

~ Oleksii

--------------tk2hAiWcR0r2kXSAZqZXAlL6
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
    <div class="moz-cite-prefix">On 2/26/25 2:13 PM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:b45c2acb-9d72-4de9-907f-ad2d0c7ac6bd@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+   - Zen5 support (including new hardware support to mitigate the SRSO
+     speculative vulnerability).
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I'd also suggest to qualify Zen5 with AMD.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  Whether to mention this here
when I think I backported all the pieces isn't entirely clear to me either.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
What is the better place then?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The question isn't where to put it, but whether to in the first place.</pre>
    </blockquote>
    <pre data-start="0" data-end="132">Wouldn't it be useful to highlight that Xen now supports the new security feature
for mitigating SRSO vulnerabilities on AMD Zen5?</pre>
    <pre data-start="134" data-end="143" data-is-last-node=""
    data-is-only-node="">~ Oleksii</pre>
  </body>
</html>

--------------tk2hAiWcR0r2kXSAZqZXAlL6--

