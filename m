Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4EA4A447
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899204.1307637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6zW-00075t-2f; Fri, 28 Feb 2025 20:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899204.1307637; Fri, 28 Feb 2025 20:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6zW-00074O-00; Fri, 28 Feb 2025 20:29:50 +0000
Received: by outflank-mailman (input) for mailman id 899204;
 Fri, 28 Feb 2025 20:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6zV-00074I-5Z
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:29:49 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfdd7093-f612-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:29:46 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5dec817f453so3928631a12.2; 
 Fri, 28 Feb 2025 12:29:46 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3fb5927sm2943750a12.53.2025.02.28.12.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 12:29:43 -0800 (PST)
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
X-Inumbo-ID: bfdd7093-f612-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774585; x=1741379385; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZxZAfBcXnZgwCD7l0yjspRzPKRY0aDEySlgVpMkq+U=;
        b=Ar3EOai858SpFC8BNgXD5r/0bKDTMnpEjMOzAHgIDhQ1Rhg3473junZbruDOqismYP
         sBAtf8f5IEHjGy/bcMjN3lwJLkz6gkCmJaNXIha2fPNoeoBp1oTLBDPkJ23QyP/AIF4V
         VpU032JJdIpF8IWf5AGV+kjr6YVBj+2cCiWh+2VkcHo/wK+2p7yM9ndB1mGjWHWIOAuH
         ief1okJuyiwIPUR22LC+t7yHsxFRTuh1qqb9h2TgrsTjr4aBlyOR3V6Z2FGaj8eVY1br
         8Pxu3dCuOQIh+Z0VjanV+tdh41l/4RBdtxnsWkhIFCRMsbHGfH8Xey60k6Hz7Sxbq4/g
         eBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774585; x=1741379385;
        h=in-reply-to:content-language:references:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fZxZAfBcXnZgwCD7l0yjspRzPKRY0aDEySlgVpMkq+U=;
        b=B8WQAX3n5Vg8McD+f1grNvjaJ6CwhrJ6afUXhc5jq1ythZgbFcGQq2YX8pJwqXwQ+v
         +/IqtwlNcOpEBovnDtpLcXDwf5vTcZtflPQSX3fnujuCM4nDKf+94L0lixpTgeQ51jYC
         ELq5U+8S/0xXnJktjrcWQxs8x9/PP5Qr01YcfdvflfC/m1YMLpk96bnHg9UijkoEgnD0
         DX10pQDg44ZYOCqHzTEiw3Ynbiu0ZJZSKe+KJ3otl3aigDZEk1sdDd/X9T2W9eBlF9DV
         g4ZzUhJ36v6VBTLbzkYMMfPQAxYZhTFQ27nHVQvDMIngzbifFSAlpSxEW9jx27jo411X
         ic/w==
X-Forwarded-Encrypted: i=1; AJvYcCWeq12wQreUB9fCumZRm/WedVOqRQYIsDBNVsN6N6qKZbC1T8eMcn0bvbwLlvCguyg8WMBtLrnec1PwL+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq6mkumQ3mU7gQIsQih3a3/Ypz/kg0kZcVCOrdUCaK+3cA0ais
	9EPzQNnQ8J839/BUJjWIgEghMEOMye0X+4bympsXn0G58jKQfltV9rEShA==
X-Gm-Gg: ASbGnctGiJj6A6YAgwcR5enpYXCoHv9ulh7xBqcHxFtiZsr3i/OzlF3q0yjK1aBB/QF
	Pw7dETSbAHQONwTg79clrH5z2+OFbiR1+GvtqJjhwFsIfWtrxwjtSbzpKgxeg2ahQ+0hJPyblSN
	2Olw8i22iigA9v3viBATy4md0hMEpZ8f0a9VRXeGIKWrVbSGNSJ5R1SCUq/EoA80h2r6+J5sgyG
	NasZQ5ZsrXIpwoJXCs+aRkpMW72jrbMjaHgP4Hvme8PaO/maA1WwgDoSyEodBzBye4IFKzx3ss3
	sl+HWQDNbIw6L0ZtgomLZD24HWfPeNEzl+k=
X-Google-Smtp-Source: AGHT+IEy1gloxzQHoMI5Vf4wxsCDHR1hmY8KAps91ZRwnDZ4VE/NtYcV+eVIpDBb/ToJGC78mRNbQA==
X-Received: by 2002:a05:6402:3898:b0:5e0:4408:6bab with SMTP id 4fb4d7f45d1cf-5e4d6b0e448mr4390276a12.19.1740774583966;
        Fri, 28 Feb 2025 12:29:43 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------pWrs0mg9WJRcU0HDLowBKxHl"
Message-ID: <6f818065-0233-4e60-bc03-2890e35fd27a@gmail.com>
Date: Fri, 28 Feb 2025 21:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] Xen 4.21 release date is Wednesday, 5 March.
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>,
 xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
References: <cb8beb32-0ec9-40ff-94d8-dce39a0dd63b@gmail.com>
Content-Language: en-US
In-Reply-To: <cb8beb32-0ec9-40ff-94d8-dce39a0dd63b@gmail.com>

This is a multi-part message in MIME format.
--------------pWrs0mg9WJRcU0HDLowBKxHl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

I realized I made a mistake— the correct version should be 4.20, not 4.21. Apologies for the confusion!

Thanks for your understanding.

~ Oleksii

On 2/28/25 9:07 PM, Oleksii Kurochko wrote:
> Hello everyone,
> I would like to announce that Xen 4.21 is expected to be released
> on Wednesday, March 5, (not on original date due to final preparation
> details).
> Thanks in advance, and have a great weekend!
> Best regards,
>    Oleksii
--------------pWrs0mg9WJRcU0HDLowBKxHl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="0" data-end="17">Hello everyone,</pre>
    <pre data-start="19" data-end="124">I realized I made a mistake— the correct version should be 4.20, not 4.21. Apologies for the confusion!</pre>
    <pre data-start="126" data-end="156" data-is-last-node=""
    data-is-only-node="">Thanks for your understanding.

~ Oleksii
</pre>
    <p></p>
    <div class="moz-cite-prefix">On 2/28/25 9:07 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cb8beb32-0ec9-40ff-94d8-dce39a0dd63b@gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <pre data-start="0" data-end="17">Hello everyone,</pre>
      <pre data-start="19" data-end="143">I would like to announce that Xen 4.21 is expected to be released
on Wednesday, March 5, (not on original date due to final preparation
details).</pre>
      <pre data-start="145" data-end="191">Thanks in advance, and have a great weekend!</pre>
      <pre data-start="193" data-end="216" data-is-last-node=""
      data-is-only-node="">Best regards,
  Oleksii</pre>
    </blockquote>
  </body>
</html>

--------------pWrs0mg9WJRcU0HDLowBKxHl--

