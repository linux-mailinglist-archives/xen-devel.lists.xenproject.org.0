Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB5C2A9F5
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 09:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155239.1484746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFqBR-000827-An; Mon, 03 Nov 2025 08:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155239.1484746; Mon, 03 Nov 2025 08:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFqBR-00080g-7w; Mon, 03 Nov 2025 08:45:01 +0000
Received: by outflank-mailman (input) for mailman id 1155239;
 Mon, 03 Nov 2025 08:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5Dp=5L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vFqBP-00080a-Dr
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 08:44:59 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 609abba4-b891-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 09:44:58 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so839129966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Nov 2025 00:44:58 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077c3add2sm960507166b.37.2025.11.03.00.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 00:44:56 -0800 (PST)
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
X-Inumbo-ID: 609abba4-b891-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762159497; x=1762764297; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VV0LFtC+hANycCX6GEdD2nP8rwL2S4lJ2uo5oWO1rg=;
        b=eWdwiuKaatXWl0LrpDmnLP70jNwCJ4bxmaU+Wg7WiEBt596R1vePLKoks9CDrRHaO1
         rHbAi4CJkrJkrUDZjqvBP8sG5L7Mh4ChP1nW2S7+qj4/KNOG+MnJGQAkXBZF0qiytptm
         2kLZc5WnBWuQ89WpljNLFDIJfpSRLCOAyo2Ng9x+hPhug10F+DrwjMGHPDtNGKhYHDZa
         aDhhxeTSmWkeuQgH3XJ3uVapc+e2JcM7+RGssqHH9mgOUKQ+NAVqYJuGJNLD5Z9y3B0L
         /KkNtGMkEWBbi9YaI3oT5U4T2bWxOi7JaddbDxu/tfyoB4S08xEUws7g09bjra2oTobD
         AcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159497; x=1762764297;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2VV0LFtC+hANycCX6GEdD2nP8rwL2S4lJ2uo5oWO1rg=;
        b=dTEmmLeRNyUpapLUPHsP+bKw+e718qL47kaHAvmj+8AkjNcd0e3uCgytFPs3qaMBcU
         WfzgYj9blAhNl0I8lRt9J/x6qRKTyz/Adzd4kgGyXl4dAL80Bu4jQPw/trmrsZpIJqLP
         Ov38k0Y2/6XfNp2U5I3u0lBlisLqkWa6Qo5+F/ORZ5esWT3AKS1wbRLCtUdJEL7A42CF
         0KogrzSeDkm5dJ25b6HvRcADbXtU3gmDXo98o4thZc6Q88Ua/h6Fum6q24tOc1hwGyvq
         u+102iTKNESc/1ek2G88orosdxTzJVVEQICN7CppFqmbfgPEpzSZCikt0gjAB7SQt8iz
         ER7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnwozrcCUlgZ96pqunK/xm1jTnNSCDwoAwgvHTAj1Tok4XzFjqVK8O+GapSe7NOyoCiVTclLqm8ms=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjWeRhOKJV9VeCxRZVfpdZfty20fdi4v3uTbUVEoPYelhN1XLx
	H3Divg2aIyhn3BTepzGp2lmXWKjxEyuQ4tyRrNWj1rQBYkNAN6Nz89FXAsHmDQ==
X-Gm-Gg: ASbGncsttCnCP41FTp7QKCJ6L6SThayryaNQsHwrKBdm09bBne8Ho6fsk319GFnqL3K
	hovwNLQ3faI3vb02SEFUXLVGcapW7BMdO4aQxvJmW7Omp8r1Sx08j3ayrBVwMveR6qc8azmMr3n
	wu8P8Y/QBzihmOEnmyMsSU+PqojK8d/UtUn2o0fVjzOFsOiZ7nK+RyI2eLLUdybRWgEEfYMjVV3
	VwuQhivhmTz3C0NHCIh/vekQO4qzbw40gME+aW2Q8355rc7hRGvQSyJ8evmv9nRmodj/xW2Ee2n
	3a8vgwiwYig4yF4Q54n6jy9fQndNXqvB9YZer4Ifkx69td0Nh7Lypi1WYlMK67Ttvq9gN6dFhU4
	HuWhB6NtJ3WGvggsK4xhm4fFFwVnWNmM+rS3LB0CdZ7q8H1DI2aqW2D2dGlyc3TkWCiCIOWOrWL
	gaNPzDTz5mRNhqb2VyUHc2FvOxRIlqFLHFbkkWF6cy3H3Ojh+tWTW3lHjbtmrrYf/bLulXY7w=
X-Google-Smtp-Source: AGHT+IHvfmA+sjNfBNymOjqQIAMeQdy+t4WsYClprXxtEoRpczcH1EcgXaRkh1yu3uz9I1w4QLPAcw==
X-Received: by 2002:a17:907:9451:b0:b6d:76a9:e7de with SMTP id a640c23a62f3a-b70700d36fdmr1221435166b.8.1762159497274;
        Mon, 03 Nov 2025 00:44:57 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------GiUkDcvuOP1KHNAja53hpPKg"
Message-ID: <f60e6d6d-7f86-428b-889a-0ba253515a06@gmail.com>
Date: Mon, 3 Nov 2025 09:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <abf30e99-47be-48c9-b826-18d142453dcf@gmail.com>
 <f4dc4064-43f5-4bb0-8387-298a5d62cb5b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f4dc4064-43f5-4bb0-8387-298a5d62cb5b@suse.com>

This is a multi-part message in MIME format.
--------------GiUkDcvuOP1KHNAja53hpPKg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/31/25 10:34 AM, Jan Beulich wrote:
> On 31.10.2025 10:31, Oleksii Kurochko wrote:
>> On 10/28/25 4:32 PM, Jan Beulich wrote:
>>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
>>> place.
>>>
>>> 1: disable RDSEED on Fam17 model 47 stepping 0
>>> 2: disable RDSEED on most of Zen5
>> Both patches LGTM to be in 4.21:
>>     Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Thanks, yet: What about the 3rd patch mentioned in the text above?

For 3rd patch, also:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------GiUkDcvuOP1KHNAja53hpPKg
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
    <div class="moz-cite-prefix">On 10/31/25 10:34 AM, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f4dc4064-43f5-4bb0-8387-298a5d62cb5b@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.10.2025 10:31, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 10/28/25 4:32 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
place.

1: disable RDSEED on Fam17 model 47 stepping 0
2: disable RDSEED on most of Zen5
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Both patches LGTM to be in 4.21:
   Release-Acked-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks, yet: What about the 3rd patch mentioned in the text above?</pre>
    </blockquote>
    <pre>For 3rd patch, also:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------GiUkDcvuOP1KHNAja53hpPKg--

