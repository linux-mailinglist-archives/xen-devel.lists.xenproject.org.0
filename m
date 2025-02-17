Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83976A37DCC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889861.1298898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjx4S-00087W-Lr; Mon, 17 Feb 2025 09:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889861.1298898; Mon, 17 Feb 2025 09:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjx4S-00085F-In; Mon, 17 Feb 2025 09:05:44 +0000
Received: by outflank-mailman (input) for mailman id 889861;
 Mon, 17 Feb 2025 09:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0TS9=VI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tjx4R-000859-JK
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:05:43 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d628fa1-ed0e-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 10:05:42 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30a36eecb9dso2511811fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:05:42 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c536bsm15460161fa.21.2025.02.17.01.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:05:41 -0800 (PST)
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
X-Inumbo-ID: 5d628fa1-ed0e-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739783142; x=1740387942; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xXPbEvdRGMEJtgeRMVLLbJC/Q90E0/fzC0u/x10sw4=;
        b=foNsy1kQueyPXF8JH6M632IU+FkwatalZzu5/V8EzWM79DRU3J7zbVnpNFQ1w9zz7p
         Bubi49gsP7WBz5IGsf9DgCW4dDOA9llr2f24zvNT76uCSHq3p80j9dsp/gXjCHIS5DHB
         IOdWseZSmugd+3pRzzs8/xeR8VBM0Rh2+OkoNRgOlNr+clW/+SmTAsVzLuerrydSTDqa
         rcf01mFYgMJft7Pu4A5Zxk8Yz/XwhX9VmPboqi/KIP7mTP/p6A1UCTRfUJxQjz7UNjhO
         hAS+qjP/WMY9aiDHmN/BGQ++tNP0wXeScpDAu4WlrjNcg+oVdJn+PckWJi6Hgx+WsxDz
         tXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783142; x=1740387942;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xXPbEvdRGMEJtgeRMVLLbJC/Q90E0/fzC0u/x10sw4=;
        b=K6BZdoQuHZFr7Gkzt8eBEJ2hFZ4U/JNTZcmcfU/YFYcpHNZGm+4LUnTbSRkitaH53w
         Y9+gRtmg/5HG/RA37rZGF1VfV2Y/sFmZ5fFjv5tjh95MDJjQw/j7uYpITqldfJ/RY1u6
         VSjIp4iM+hHGTVxlfDIUv8HzZcS4M82DJTpzX6mgcucYdNSA0EXmCD7xZaY8I3BVdcGB
         j+owlF5TfzdtaP4oXGTBEkYsEvhnWhXV3c5gXmddlX7fF3knLKIc4Nu9+nNmoFIV7VkR
         QAgfAp7Va1+mM2WpciOdrUegpEG4yNd8AST2RaBEh1Q6Cg1Q06yIBzs4zOanSfOKNlgJ
         xywQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj3B5MJLEIP+kYGi9wCqLKdyzFygs1YtlPn5lGQWQvkAsQ/R7GG9z0gmRrC4kIhK/DzuPW48aCC9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaQFwTeDpixebFFqbktT6fqkk2uE7NlaHLF18P4eh1KqU/VUkd
	S5iLQQGjutMwFjkO+2ZbtkRO2X5LTecCZPITFEroo4+bYj6gLOlj
X-Gm-Gg: ASbGncsq+MG4sQFybPPAHrqHv+0rA6Wn0hzYet2lefI47aaQ0jUbKv+uIHn4+IjVZR5
	TmjXUU/eHIdv6lm44tZKv3yJt1yqm6rhw2MM4HUdXmXH18pbDYCJN2Evjun8ty1OwXQMX4vBMQk
	52CEeEMMzntt+9ekqledGR+maNsRMotAYQrVtQUv7C/nSzbVySl4BkEuP//8aH6GGPTorg+wAMN
	u2rdUiRRyNaU2Qy1YTKvLPk9QYj0T6XX+eq3OyYrD17BVbjWeRbtgVckOTSZAzz9U2QYrSqpasK
	wiSugDGZ4izej4LeUVn9F/sE
X-Google-Smtp-Source: AGHT+IEAvLVvU78fQiwZTwTS0w7Gp1u7zdVAmBU8sWXRIKFBK+rdVlSWTVLnd5WlfO5742zAIIpMkg==
X-Received: by 2002:a2e:b6d2:0:b0:2ff:d0c4:5ffe with SMTP id 38308e7fff4ca-30927a4bdadmr19672931fa.16.1739783141495;
        Mon, 17 Feb 2025 01:05:41 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------E6vjJn1d8RhGWxkOJjEs4UFx"
Message-ID: <5a7bbd34-26f2-45a9-9615-48500bc59130@gmail.com>
Date: Mon, 17 Feb 2025 10:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/list: some fixes in list.h
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250216102356.18801-1-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250216102356.18801-1-jgross@suse.com>

This is a multi-part message in MIME format.
--------------E6vjJn1d8RhGWxkOJjEs4UFx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/16/25 11:23 AM, Juergen Gross wrote:
> Patch 1 is a fix for an undefined behavior reported by Andrew. I think
> this patch should be considered for 4.20.
>
> Patch 2 is fixing wrong comments in list.h I stumbled over when doing
> patch 1. As it is absolutely no risk involved with this patch, I think
> it should be 4.20 material, too.
>
> There are some additional cleanups possible in list.h, which I can do
> for 4.21 when wanted:
>
> - Removal of list_prepare_entry(), which seems to be unused since
>    some time now (and it seems to be thought of as a list.h internal
>    macro only).
>
> - More questionable: removal of unused iterators, like e.g.
>    list_for_each_entry_continue() or list_for_each_entry_from(). The main
>    idea to keep list.h in sync with the Linux version would be violated
>    by this removal, though. OTOH with patch 1 they are out of sync anyway
>    now, but I'm planning to submit a Linux kernel patch fixing the UB in
>    the Linux variant, too.
>
> Juergen Gross (2):
>    xen/list: avoid UB in list iterators
>    xen/list: fix comments in include/xen/list.h

With getting of proper Acks we can have both patches in 4.20:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
>   xen/include/xen/list.h | 144 +++++++++++++++++++++++++----------------
>   1 file changed, 89 insertions(+), 55 deletions(-)
>
--------------E6vjJn1d8RhGWxkOJjEs4UFx
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
    <div class="moz-cite-prefix">On 2/16/25 11:23 AM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250216102356.18801-1-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre">Patch 1 is a fix for an undefined behavior reported by Andrew. I think
this patch should be considered for 4.20.

Patch 2 is fixing wrong comments in list.h I stumbled over when doing
patch 1. As it is absolutely no risk involved with this patch, I think
it should be 4.20 material, too.

There are some additional cleanups possible in list.h, which I can do
for 4.21 when wanted:

- Removal of list_prepare_entry(), which seems to be unused since
  some time now (and it seems to be thought of as a list.h internal
  macro only).

- More questionable: removal of unused iterators, like e.g.
  list_for_each_entry_continue() or list_for_each_entry_from(). The main
  idea to keep list.h in sync with the Linux version would be violated
  by this removal, though. OTOH with patch 1 they are out of sync anyway
  now, but I'm planning to submit a Linux kernel patch fixing the UB in
  the Linux variant, too.

Juergen Gross (2):
  xen/list: avoid UB in list iterators
  xen/list: fix comments in include/xen/list.h</pre>
    </blockquote>
    <pre>With getting of proper Acks we can have both patches in 4.20:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250216102356.18801-1-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre">

 xen/include/xen/list.h | 144 +++++++++++++++++++++++++----------------
 1 file changed, 89 insertions(+), 55 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------E6vjJn1d8RhGWxkOJjEs4UFx--

