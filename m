Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2278A2BDE6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 09:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883478.1293447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgJjC-0007bn-AL; Fri, 07 Feb 2025 08:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883478.1293447; Fri, 07 Feb 2025 08:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgJjC-0007ZB-71; Fri, 07 Feb 2025 08:28:46 +0000
Received: by outflank-mailman (input) for mailman id 883478;
 Fri, 07 Feb 2025 08:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgJjA-0007Z5-34
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 08:28:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89a07abf-e52d-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 09:28:41 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab78863c312so104991666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 00:28:41 -0800 (PST)
Received: from [172.20.10.5] (public-gprs377585.centertel.pl. [37.47.106.50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78ee9e208sm41583666b.50.2025.02.07.00.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 00:28:40 -0800 (PST)
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
X-Inumbo-ID: 89a07abf-e52d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738916921; x=1739521721; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gjk1PNnnTasf0kIOVjurGlpnPh1/s8q80mpCwSs991M=;
        b=bsNlWl5jCM+4ctzeKwBxvII+hBgj4IUrzcIiKbwaDF0zd/hc5YUO4mkJO1a1jSxZ0e
         gticSBdigh4Waddx2fpcu6EIFtELsghmsBB+FfYIRbqTqSAuVce9JUdMNkEatvqqSuwe
         nWb4nKJbnv7iEf0ZH9dhHnKq8EVU6rARHLRcuEn2VILRtlA7FuY+0a0YAJOTfqgLnC4r
         OiytERbELhVUhFre8tKPRkclRy4mCYnXXeg6hWpDJ5K/EMmZa5xPk86YTR6k30/yDPeZ
         aKOcGZkiZKn5Xw1RT6GY1RhZqy+WkXFtHS+IgkdeBAYrVTvneFN/YcHNJxfu6UM6xtom
         z5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916921; x=1739521721;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gjk1PNnnTasf0kIOVjurGlpnPh1/s8q80mpCwSs991M=;
        b=TfO9XE3y9zv20M9mR0/83EAA26l5gFhpbXJOr8iCCgR8UDGBnOsV2A9Vpypd8mpp7K
         3QjVorkkGO/DcYeanLY6X0O3ZdB4yl5SDZCPIg+hXgeRfzrszUUHeNSUS8p1+ZhV4/fX
         o3R/+VG4UX3qKEXAF7ghWgk1mqVqKvNJAm1bvT7nYDp7yold7nyn8GJxw42Gbv7OSVs3
         05n9pPDYMpnnBV5QMMbWjoFxBcjbI1K3p1YDiLHAwfb5vUagLMDofzLvqDJrUBTPXI7q
         YD5lBZiMuJFRWU0tT+upSA5iek3Dkh5MFJVBpW5rxOr0iXW9PPxn32ELtBkA9VGtKyN5
         FW7A==
X-Gm-Message-State: AOJu0Yx3OvlJP1qbbe/q7vGNFk6yHhLP9P2DCu9TxVN9uU4qhTjAJkSK
	MRRsdeoZUcNHC9181b7cmqaHUg0OxGsPOAyOFlneznsAO3Q9Vcbn
X-Gm-Gg: ASbGncsMiKFdP+pd1wktFGkJb3gTke3lao405qvr6DQ3lJW4pq9vJVuPO+N8E6GCPge
	pS/abYDEuS/+nKzmc6+LnLsW3rq/jcKKeCdRZXW3f2K3Gr/KD1qmdvcQX9ck/c37rctUbeQm8tM
	+dXo1plbXKCJW9byn1HdVzNcz+opnYknPskfRp0ARGcfk+qsxUr4jrQfOs9uoZB/M/W53ZDwiiH
	tUGinvxvmzz8fmAsDq9U2AzCv/doPCuGbcFMy8xkFkslQ8324mj3KrzthtUaPpRAwKwTP2MwsFQ
	hJWbRgYSZGdUFEWNq88oYaEPDclZTbut2BtYzrD6tmHHXV3AwA2u86gQ
X-Google-Smtp-Source: AGHT+IF4uLIl9Qsrwm2njExMxbAKqRDfb2k8+hVOv3hc1eUOY61Oe+rhe18RngdXw7RyKm/4Qn9wkA==
X-Received: by 2002:a17:907:7e9d:b0:ab6:dc00:e2e8 with SMTP id a640c23a62f3a-ab789b2a678mr203665466b.3.1738916921050;
        Fri, 07 Feb 2025 00:28:41 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------UFzbbZrNcZLDxBr0s0yjSpAU"
Message-ID: <2069a957-e28c-425d-ad95-e6ecd166be7a@gmail.com>
Date: Fri, 7 Feb 2025 09:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: enable UBSAN for debug tests
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
 alejandro.vallejo@cloud.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
 <5053348a-b02e-42b0-b35e-46f087d0d007@amd.com>
 <alpine.DEB.2.22.394.2502061500310.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502061500310.619090@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------UFzbbZrNcZLDxBr0s0yjSpAU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/7/25 12:03 AM, Stefano Stabellini wrote:
> On Thu, 6 Feb 2025, Orzel, Michal wrote:
>> On 06/02/2025 03:37, Stefano Stabellini wrote:
>>>
>>> automation: enable UBSAN for debug tests
>>>
>>> Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
>>> build jobs, with debug enabled, which are later used for Xen tests on
>>> QEMU and/or real hardware.
>>>
>>> Signed-off-by: Stefano Stabellini<stefano.stabellini@amd.com>
>> Reviewed-by: Michal Orzel<michal.orzel@amd.com>
> Thanks!
>
>
>> However, I do remember Julien being opposed to this approach in the past, mostly because he did not like
>> the idea of failing on first UB that can possibly hide next UBs (I don't see this as a problem because other
>> UBs will simply be found on the next pipeline or locally when testing the fix).
> That may have been a problem in the past, but it is no longer an issue
> now that the pipeline is fully operational with UBSAN enabled on both
> ARM and x86.
>
> Andrew also mentioned in chat that he supports enabling UBSAN in the
> pipeline as soon as possible.
>
> Since the pipeline remains green with UBSAN enabled and is not expected
> to suddenly go red before the release, I am requesting a release
> ack from Oleksii.

Agree, enabling UBSAN support in the pipeline is a good idea, so:
   R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> Cheers,
>
> Stefano
--------------UFzbbZrNcZLDxBr0s0yjSpAU
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
    <div class="moz-cite-prefix">On 2/7/25 12:03 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502061500310.619090@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Thu, 6 Feb 2025, Orzel, Michal wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 06/02/2025 03:37, Stefano Stabellini wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

automation: enable UBSAN for debug tests

Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
build jobs, with debug enabled, which are later used for Xen tests on
QEMU and/or real hardware.

Signed-off-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@amd.com">&lt;stefano.stabellini@amd.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Reviewed-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks!


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">However, I do remember Julien being opposed to this approach in the past, mostly because he did not like
the idea of failing on first UB that can possibly hide next UBs (I don't see this as a problem because other
UBs will simply be found on the next pipeline or locally when testing the fix).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That may have been a problem in the past, but it is no longer an issue
now that the pipeline is fully operational with UBSAN enabled on both
ARM and x86.

Andrew also mentioned in chat that he supports enabling UBSAN in the
pipeline as soon as possible.

Since the pipeline remains green with UBSAN enabled and is not expected
to suddenly go red before the release, I am requesting a release
ack from Oleksii.</pre>
    </blockquote>
    <pre>Agree, enabling UBSAN support in the pipeline is a good idea, so:
  R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502061500310.619090@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Stefano
</pre>
    </blockquote>
  </body>
</html>

--------------UFzbbZrNcZLDxBr0s0yjSpAU--

