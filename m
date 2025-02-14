Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D3A358AE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888558.1297913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqth-000570-IQ; Fri, 14 Feb 2025 08:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888558.1297913; Fri, 14 Feb 2025 08:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqth-00054B-F9; Fri, 14 Feb 2025 08:18:05 +0000
Received: by outflank-mailman (input) for mailman id 888558;
 Fri, 14 Feb 2025 08:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifN6=VF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiqtg-000545-2O
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:18:04 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35c1aefb-eaac-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 09:18:03 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-545054d78edso1804999e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 00:18:03 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105f28sm430331e87.118.2025.02.14.00.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:18:01 -0800 (PST)
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
X-Inumbo-ID: 35c1aefb-eaac-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739521082; x=1740125882; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btNWswc54LfzdjFOddBNgkqntoR4J41QPd/Kn+YhxZY=;
        b=f73lkAGBy1S9COh21yhwwoBGenTBbMGSD5TSfYQ3H6c34upJvCrWzRsBkWVGwnXajV
         cUOSRWJ/qXXRXQnzDE/d3AdJ9gOZEuHTZDpq/Qh8G22COB0KAM0Dzw0Pbv/a+/cQVR64
         +zTCwRP/KY7j7rDkjzBe1FM20lSLRA6WygA5Sb00vHPaUTPPWBXUMpS0X9dkkMhatilW
         Q+Nux7enlw3zu42KXOfQXr33S04pXbop58r2sIC0okwjwhfTSs6jKy1JzsMwiW0Yst0f
         jOQw68Hgao9o9evTDIUd0Aef6GGHp7PinFnz0bZ/+pQGEIlx3PQ6YfVLD468sDrjBmxK
         xsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739521082; x=1740125882;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=btNWswc54LfzdjFOddBNgkqntoR4J41QPd/Kn+YhxZY=;
        b=AWUfLvE7qv61A0rYMPjCyekQXtYWzeFdQ1Mf00uUnfVv0/mKxouNmSNX6MlBbkc+4y
         2vyZ+0//HQoyHHV6T60qZO5P32/Wnhc6Hr0FzncueBWQOZkk66JkOcbLh7Zd490dzB3c
         jfJR0C7Uo0cL44qwxPox7mtNp9XxQ+ZWS5wnpqjGLs0dQARf0hLizUiJyrrn0Zb8VhPm
         WxHyD5MkBHCVie+dT4Pjz4OogPSAuQzwQijHQNKTGh/7OUEFWM80aa7ewZqTeidwupV4
         tpzMPxOkdxEd/H1EEEJTKY3hZIE/kINdU4ncD857iJRPIMVbC6us6tnf1BZa8bfS0a+n
         6rqw==
X-Gm-Message-State: AOJu0Yy/FW+EWr6mzF5NG37sk8jvlSSZqL5jDHiuZtEOVOnQlbqfSuay
	D3uiT+nx89s9YwgnAifUdaGKPHGBJZBZWL7CfKMoyWaAjhtA2VP1
X-Gm-Gg: ASbGncsx7qwG/qxWipwG37+0p5NotHOBLrmtE7qGwsbe7946aDpR50rLNjoD9M/vgcQ
	fSZD8ec9OU7jhLcaX1W8v4zUrBaenFm6sdndUYo+5FZmLPyLkXMYvwfA3Go/ARyI6kTRqShj5kV
	ymhuHYHejhJJ9UEqZ7rc4Tl4/7zJCY52b52Dm/wn8sdsEdqlNvYMIYVj0/G13wXnWFpPV9lLkq8
	PsE3AduPh9vTBY7fnrJ5+W9Qyil5jCbzRXLrlQyqnekzAKev4iAp87AUpnj3/dQX8GU+S/5gr7q
	COL8w7//zt8r+iMAupQfHLWWNvI=
X-Google-Smtp-Source: AGHT+IHpoiZtAkCrrEYTbUjfh2/QOJtHnivDhIvlNNH9JBVROA74ca20FBcMarmMOXzmlvv3FbKdng==
X-Received: by 2002:a05:6512:1394:b0:545:f70:8aa7 with SMTP id 2adb3069b0e04-5451818942dmr3999217e87.32.1739521081998;
        Fri, 14 Feb 2025 00:18:01 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------W0v0P27m00DoyZCEauBsluPW"
Message-ID: <2fcc37f5-20e5-4c52-9e8b-c24121c05e8b@gmail.com>
Date: Fri, 14 Feb 2025 09:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] vpci: Add resizable bar support
To: Jan Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>

This is a multi-part message in MIME format.
--------------W0v0P27m00DoyZCEauBsluPW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/14/25 8:35 AM, Jan Beulich wrote:
> On 14.02.2025 04:32, Chen, Jiqian wrote:
>> On 2025/2/11 17:21, Roger Pau Monné wrote:
>>> On Tue, Feb 11, 2025 at 10:22:57AM +0800, Jiqian Chen wrote:
>>>> Some devices, like AMDGPU, support resizable bar capability,
>>>> but vpci of Xen doesn't support this feature, so they fail
>>>> to resize bars and then cause probing failure.
>>>>
>>>> According to PCIe spec, each bar that supports resizing has
>>>> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
>>>> handlers to support resizing the size of BARs.
>>>>
>>>> Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
>>>> is read-only register and the hardware domain already gets
>>>> access to it without needing any setup.
>>>>
>>>> Signed-off-by: Jiqian Chen<Jiqian.Chen@amd.com>
>>> Reviewed-by: Roger Pau Monné<roger.pau@citrix.com>
>> Thank you!
>> May I know whether this can be merged in Xen version 4.20?

It would be better to merge it after the Xen 4.20 release.
(It will happen in the next 2 weeks).

Thanks.

~ Oleksii

> That's a question Oleksii would have to answer. My take is that it's (far)
> too late in the cycle for a feature addition.
--------------W0v0P27m00DoyZCEauBsluPW
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
    <div class="moz-cite-prefix">On 2/14/25 8:35 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com">
      <pre wrap="" class="moz-quote-pre">On 14.02.2025 04:32, Chen, Jiqian wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 2025/2/11 17:21, Roger Pau Monné wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Tue, Feb 11, 2025 at 10:22:57AM +0800, Jiqian Chen wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Some devices, like AMDGPU, support resizable bar capability,
but vpci of Xen doesn't support this feature, so they fail
to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers to support resizing the size of BARs.

Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
is read-only register and the hardware domain already gets
access to it without needing any setup.

Signed-off-by: Jiqian Chen <a class="moz-txt-link-rfc2396E" href="mailto:Jiqian.Chen@amd.com">&lt;Jiqian.Chen@amd.com&gt;</a>
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Reviewed-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Thank you!
May I know whether this can be merged in Xen version 4.20?
</pre>
      </blockquote>
    </blockquote>
    <pre>It would be better to merge it after the Xen 4.20 release.
(It will happen in the next 2 weeks).

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com">
      <pre wrap="" class="moz-quote-pre">
That's a question Oleksii would have to answer. My take is that it's (far)
too late in the cycle for a feature addition.</pre>
    </blockquote>
  </body>
</html>

--------------W0v0P27m00DoyZCEauBsluPW--

