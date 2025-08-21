Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA37EB2EFA4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087881.1445684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozkd-0001Iv-3f; Thu, 21 Aug 2025 07:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087881.1445684; Thu, 21 Aug 2025 07:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozkc-0001Gs-Vi; Thu, 21 Aug 2025 07:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1087881;
 Thu, 21 Aug 2025 07:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5gj1=3B=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uozkb-0001Gm-8K
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:30:21 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1181962-7e60-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 09:30:20 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso104114166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:30:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf593d0fesm251093866b.59.2025.08.21.00.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:30:19 -0700 (PDT)
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
X-Inumbo-ID: b1181962-7e60-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755761420; x=1756366220; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZYQT49HHS59lIm8CUrhBbA8Fmjd1uIe9ccAcD8aR2Q=;
        b=l9c3qMgwBkTFYjnXhOm5JT2uccsCKVl35R/sCcikUp7rVIeyaRuCy6QSGXW0nzzPFe
         tk/5Ki2fLzTAH/JrmTrGLF/qtIZ6hVL2/4RsotPTQvkcc4iMzk/nfEhUeeU6T9oohLR5
         I+pOR1u9oAL3f5hjRQ2d7TeGoagIFBHir6+IhJhrYzIxLpCV9Gl/XYLOo9+LIrurUITt
         xV/9SixbuP35vGrKWoRX79feccflLACy37CawJREY6/mKsvV1lGMLzbLNBd9xgYPgvOd
         6GCkYBSw4U1cJAue4j9PTc7y2+ouxGpJn3YSMcI9Sgs9CNbdYw3LqGrzk+c7wQH3CPqc
         YmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755761420; x=1756366220;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZYQT49HHS59lIm8CUrhBbA8Fmjd1uIe9ccAcD8aR2Q=;
        b=UgCQnbEGCuKl9fGUMzZKFpvobr4n/zSF+x3ZJ3G/uFEWK/DqYB0pS1Es0+XyV8R9fs
         f0R7jcw7yU7ZeBMfr1uo24fDiRh55UPmuQU/uGfA1AZDWhZwKdbV7smbrQzehJnnctSi
         NEKmL6siM689RMw4gA99crYvnc4havz3TiL8OkOgcpiT66uhI26dPM2V6ML+OkueKJ/R
         MsewhGxxItZv4JfnKNmGtOLB+PYo1dxT5YXAOZrvbszj5KTqxOrKTTieLbESizHVWryM
         kqkRo1n1gBCHyEPk1l9cxhuGvBiOk23RwzhuHpV+dFTO0SFN9yPDWOIQUOreL4LpnCaX
         6TlA==
X-Forwarded-Encrypted: i=1; AJvYcCWHikbti7MbyrHyG0qLIpjDjUdajz/yhQx3PoL8kV2pBe/WwfI6Vd9/ODI6xbLY7nVWiZtJtBmIBWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy/mCeh5YY2wr3H9N0/jCrEFA2/znn1MXbs2xkgjLLSEdqZMHZ
	wKwiyYGWeF8KJzhHW3E0CPISeSqZ9WGAa1u+kX2cX9L+qlXoIgNH82lg4MjNgg==
X-Gm-Gg: ASbGncvkovoKJTuukTwTJkr0P3ADYd07LN0JLDnvV0sAyBokClPzL0LQdqUXuVA+48P
	Q068qTI8FsHTixpZJKda9zDmxUEtaIHDNLSdW6lsK16+RCDuGWasJAONH+cJ86FxSVqG89xxxTq
	ClqctQtcxTdZgGBp7G/zaihzBAa7wrRO8eA3+APUHDBuLJVPbh/MPrtqxPQm/jUVRgOrZsmNZtd
	wp0rievlsjPasTzPuzBFmOdSXZWygiTjATPXpaxZy9rCCpyC6PsMSI1OtBtLTf+WRJRJRsuHC61
	KGwNOCwwsZFnY2EmN03vsaQa0U1EhmS/UNPHyRkulfrTsPJDhdbJ5YhE1Wsgi7p2blEbAN6el+P
	1q9vY8dZ0HSYem+18FmHmK1ZX/IVFzG0dTuB9bFj6Ut30m366EQtGrYEGF5F4/1XiSucBGokC41
	IkuiuRtQ==
X-Google-Smtp-Source: AGHT+IGseQJ4xA0q5cG9LCIAnNiOM87WFeVFofOp41IT8EakNl7CfBxC7GHbEGBgDMKyxiIznkHxXw==
X-Received: by 2002:a17:907:7245:b0:ae0:ce59:5952 with SMTP id a640c23a62f3a-afe07e8ad85mr141140366b.60.1755761419423;
        Thu, 21 Aug 2025 00:30:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uR5ghdodlNzVWntO1WGvf6e0"
Message-ID: <5f560505-78df-4f2c-8f6b-387099e54230@gmail.com>
Date: Thu, 21 Aug 2025 09:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] CHANGELOG.md: add xenstorepvh-stubdom live update
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-10-jgross@suse.com>
 <09819192-cdeb-441f-9bdf-d334e076c833@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <09819192-cdeb-441f-9bdf-d334e076c833@suse.com>

This is a multi-part message in MIME format.
--------------uR5ghdodlNzVWntO1WGvf6e0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/20/25 8:06 AM, Juergen Gross wrote:
> Ping?
>
> On 30.07.25 14:23, Juergen Gross wrote:
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - new patch
>> ---
>>   CHANGELOG.md | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 5f31ca08fe..d118bb1c8c 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -26,6 +26,7 @@ The format is based on [Keep a 
>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>      - Support PCI passthrough for HVM domUs when dom0 is PVH (note 
>> SR-IOV
>>        capability usage is not yet supported on PVH dom0).
>>      - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>> +   - PVH xenstore-stubdom now supports Live Update.

LGTM: Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>>      - On Arm:
>>       - Ability to enable stack protector
>
--------------uR5ghdodlNzVWntO1WGvf6e0
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
    <div class="moz-cite-prefix">On 8/20/25 8:06 AM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:09819192-cdeb-441f-9bdf-d334e076c833@suse.com">Ping?
      <br>
      <br>
      On 30.07.25 14:23, Juergen Gross wrote:
      <br>
      <blockquote type="cite">Signed-off-by: Juergen Gross
        <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
        <br>
        ---
        <br>
        V2:
        <br>
        - new patch
        <br>
        ---
        <br>
          CHANGELOG.md | 1 +
        <br>
          1 file changed, 1 insertion(+)
        <br>
        <br>
        diff --git a/CHANGELOG.md b/CHANGELOG.md
        <br>
        index 5f31ca08fe..d118bb1c8c 100644
        <br>
        --- a/CHANGELOG.md
        <br>
        +++ b/CHANGELOG.md
        <br>
        @@ -26,6 +26,7 @@ The format is based on [Keep a
        Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
        <br>
             - Support PCI passthrough for HVM domUs when dom0 is PVH
        (note SR-IOV
        <br>
               capability usage is not yet supported on PVH dom0).
        <br>
             - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
        <br>
        +   - PVH xenstore-stubdom now supports Live Update.
        <br>
      </blockquote>
    </blockquote>
    <pre>LGTM: Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:09819192-cdeb-441f-9bdf-d334e076c833@suse.com">
      <blockquote type="cite">     - On Arm:
        <br>
              - Ability to enable stack protector
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------uR5ghdodlNzVWntO1WGvf6e0--

