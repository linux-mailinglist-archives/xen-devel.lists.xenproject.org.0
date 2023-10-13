Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1337C883E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616641.958783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJhH-00049K-IK; Fri, 13 Oct 2023 15:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616641.958783; Fri, 13 Oct 2023 15:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJhH-00046y-FZ; Fri, 13 Oct 2023 15:03:27 +0000
Received: by outflank-mailman (input) for mailman id 616641;
 Fri, 13 Oct 2023 15:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqf=F3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qrJhG-00046s-CB
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:03:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a877d66e-69d9-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 17:03:25 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3215f19a13aso2061133f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 08:03:25 -0700 (PDT)
Received: from [172.31.7.9] ([203.86.126.253])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a62a509000000b0069029a3196dsm13562526pfm.184.2023.10.13.08.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 08:03:24 -0700 (PDT)
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
X-Inumbo-ID: a877d66e-69d9-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697209404; x=1697814204; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yt/wuRbT2EDEgkO9Ribil6nmK2T9K9r2dWfbWr720GU=;
        b=n2hWudkwHZfU5Y24u4BtK4Lpm4CdjbByjzxzEwZFpTuaJvoMGfAd+vpVl8Nh5qySTY
         VlTYa4RPYdy47/FI00V6T62iZUPCNoVs1qHG4TQGuGISYo28fuJO5ukMjDOOwrtluky/
         h5ErbUy1tHQYHgevfFq5hovtUeSoM/ZlZNAOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209404; x=1697814204;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yt/wuRbT2EDEgkO9Ribil6nmK2T9K9r2dWfbWr720GU=;
        b=W1SG6/ksYkUHmTjFC5rG3kETtoi2W6lEfH8aTegOqjG/8r3bU6Fp5rEQyULx29dE2q
         i3Nc9RPpjmWPv4e4yVqLw8SK5rp6qNrMhAPDOinN1zLFT02Q9IsfxBUb6O32e5mLr4mp
         JWPllHu0bkop900E+W13BoqFEag2TEU7lrj/tgJC34o+D+CX2z4O6mHnmudDPwiMze4w
         x/elK5xGbTMbGjImI7S6KTnXNyP02CnWu5RB5TUqF9aHTdGsAHHllxCupw8OdTeT8vA3
         US2sgjCGl2h9CECmXX2UiHKl1R2WxtEZUlHp56LdDKFI72c3HNyqesDD3mmWewFEoqut
         dj7g==
X-Gm-Message-State: AOJu0YyJxxsf2M7GvtmuUIb72CszEC2YLLBz/pModJhCr6DLHgJHjEai
	V+IxTASXPdqpEUyLfFuJAhd4dA==
X-Google-Smtp-Source: AGHT+IGptk+vW178/TyB7GStvjdzLIb3O28/y0ZCY/sI6H86BLQdTSGmZxZ5bSEqJ7Y+wnBMq172ZA==
X-Received: by 2002:a05:6000:3ce:b0:32d:8b1a:31a7 with SMTP id b14-20020a05600003ce00b0032d8b1a31a7mr6352626wrg.29.1697209404625;
        Fri, 13 Oct 2023 08:03:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------yLaWTj9ibF6v1wpcRripmnIs"
Message-ID: <e463812f-293e-4f2b-aee1-26dc350f5c37@citrix.com>
Date: Fri, 13 Oct 2023 23:03:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [for-4.18][PATCH v2] x86/amd: Address AMD erratum #1485
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
 <42d8ac8d-522e-424a-b002-9a0508f318da@citrix.com>
 <65295541.170a0220.81347.68b5@mx.google.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <65295541.170a0220.81347.68b5@mx.google.com>

This is a multi-part message in MIME format.
--------------yLaWTj9ibF6v1wpcRripmnIs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2023 10:33 pm, Alejandro Vallejo wrote:
> On Fri, Oct 13, 2023 at 09:40:52PM +0800, Andrew Cooper wrote:
>> On 13/10/2023 9:18 pm, Alejandro Vallejo wrote:
>> This will surely be a core scope MSR rather than thread scope,
> It is, though I doubt it matters a whole lot. The writes are consistent
> anyway.

This happens to be true because you introduced the first use of the MSR.

It ceases to be true for the next chickenbit in this MSR, which is why ...
>> at which
>> point the write ought to be conditional on seeing the chickenbit
>> clear (hence needing to refer to the value at least twice, so use a
>> local variable).
> I have serious doubts such a conditional would do much for boot times, but
> sure.

... this is not about boot time.  It's about avoiding an unnecessary
non-atomic action.

(TBH, when the second chickenbit comes, it's all suspect anyway and
probably needs to end up like the pre-SSBD handling, which has
horrifying complexity.)

~Andrew
--------------yLaWTj9ibF6v1wpcRripmnIs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 13/10/2023 10:33 pm, Alejandro
      Vallejo wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:65295541.170a0220.81347.68b5@mx.google.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Oct 13, 2023 at 09:40:52PM +0800, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 13/10/2023 9:18 pm, Alejandro Vallejo wrote:<span
        style="white-space: pre-wrap">
</span></pre>
      </blockquote>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This will surely be a core scope MSR rather than thread scope,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">It is, though I doubt it matters a whole lot. The writes are consistent
anyway.</pre>
    </blockquote>
    <br>
    This happens to be true because you introduced the first use of the
    MSR.<br>
    <br>
    It ceases to be true for the next chickenbit in this MSR, which is
    why ...<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite"
      cite="mid:65295541.170a0220.81347.68b5@mx.google.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">at which
point the write ought to be conditional on seeing the chickenbit
clear (hence needing to refer to the value at least twice, so use a
local variable).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I have serious doubts such a conditional would do much for boot times, but
sure.</pre>
    </blockquote>
    <br>
    ... this is not about boot time.  It's about avoiding an unnecessary
    non-atomic action.<br>
    <br>
    (TBH, when the second chickenbit comes, it's all suspect anyway and
    probably needs to end up like the pre-SSBD handling, which has
    horrifying complexity.)<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------yLaWTj9ibF6v1wpcRripmnIs--

