Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF413B9AC79
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129569.1469475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Rp0-0005nO-RO; Wed, 24 Sep 2025 15:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129569.1469475; Wed, 24 Sep 2025 15:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Rp0-0005lx-Ob; Wed, 24 Sep 2025 15:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1129569;
 Wed, 24 Sep 2025 15:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CQP=4D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1Roz-0005lk-6q
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:54:21 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbbfed30-995e-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 17:54:20 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-62f4a8dfadcso8556785a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 08:54:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2b4c9d2d7csm798325266b.62.2025.09.24.08.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 08:54:19 -0700 (PDT)
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
X-Inumbo-ID: bbbfed30-995e-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729260; x=1759334060; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4seeNUS1Motd3RgPuX+CvlDpM4UWjKvUnpbCOP+NCI=;
        b=aMgezdGyeR+fauK8JexQpAn/VvKiKD34f0bUAX5r/LBcXhBlE4oHaOKggl8dxq1hiu
         r0/1Z+ZaMhif5du2SWfa+YyulONH0sbdIwA+1VIo88+pcYhdXhEdl4PT/2BPpZ4NTue5
         jI89/TtS1n0VJYgyh3sqD7+fLUGC++gbmdgP6GkAX9T314WWhnuDbTp+jo8rY+YLx6B4
         JprHPgHykLfO5/Rc2xLsfSOf3kB8sCoSw5gI4qTllUOn2EIugTGowPfviHRO58gMlGzf
         Hw+Q0izuSOiPMeqQa4v2twfSiw5ZMI30JlfjVa69Upua+zU0T97tUzfthbo2OXpPSlZG
         hqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729260; x=1759334060;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k4seeNUS1Motd3RgPuX+CvlDpM4UWjKvUnpbCOP+NCI=;
        b=f/z589c8dKuBeGBxLuP46nKfQjVWTjnjeG/utbHZjttQFBzB2BKfWmWdkXv3s+44sS
         bVW91Rd0ldzdyzMP2sNF9gQBH4fNTyfRB4kzHTe6Z5rDWonxVXSB4Ci6+Op39TcEq63p
         1y9HQuKDGcc0EGpJ87zr8xJhZnOqV1SB9zuBMdwF6EEgQH6d4DLcF2HJiXMuudyUMzBB
         eTiZYYwK//QGENIu0qcL+0BmVr85TyZpuq/C5r/U6MAljIzurVN1P0XGrjT52LI7ypNM
         C7coAXCYD0bNwzx7Fmvz0mj6JlSJNDymflDbUGV5kgyXfPbTXkTAlyIHeVHYJHQtpKiU
         b0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWntSra3IJJCsJCFEdDIKmlk6qM0oeP+dRM4F7A8OfuDexWveoeMMJcEw+aY59yV68O0pcbKvhm62E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP6hZUzkDqVYm57BQL3NCmZSXcFwZzFTiZJFwoKhFkgeCEgaf3
	U0ahe+tQiq+LIg9Jh3QIgZF/47ke8I+NLbth5lB8rdC74mAT/Hp+8VBNf7L0gQ==
X-Gm-Gg: ASbGncvNiFXABTBM1BYmB6fkKCjJa5mLFJfy9Y0p8KS/789AshvgmJwNtYZhofLvZbR
	8RSAVyGxenWFWvad9mRKaKgMOPf9R1lP5fhZec73Yom2FL8XruU3lxsCGOS2RbDwRzqUx9dywx0
	FyFiMU+RWbUmc/rl2kYnO2KqJpVpLXTAEgQdWVC9rhuffj8GIWRaGX7lz9r4NUXr8pfgluzWZx1
	siQSnOMyIG7zR24d3utg+tqv6Te1BrgWJYRUsPfVS9/OU6SMt469sGkwK8ujN44ezTgCHWFQFrD
	fAl0yh8rR1QXAJURsCHNNhugv9FRNUq8T+XEgm9LRix64vbSH8Wf0VKpQtH0fr2cEV0n3I5m83J
	fwuVSS01R5sNIYUbItVur6G2uxUkSFTUIMymEpnsqUpR9bhalsWTjbDbLbx8ITDCeETo8gECt
X-Google-Smtp-Source: AGHT+IHRZyg5+/LFoAYtF0Sm6laMt9QSwNRR7QNVAdzVbHAouwOtyaEm/0miyRw+Hz1M0SuY6rM7qQ==
X-Received: by 2002:a17:907:960a:b0:b07:957e:b64c with SMTP id a640c23a62f3a-b34bef9896cmr25392866b.52.1758729259654;
        Wed, 24 Sep 2025 08:54:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6Oj0BrYdqCnnDZWF2tIj0zYR"
Message-ID: <7a58d59e-0ca3-431c-81f1-2029dc6c073d@gmail.com>
Date: Wed, 24 Sep 2025 17:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/xentop: Add documentation for physical CPU
 monitoring feature
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jahan Murudi <jahan.murudi.zg@renesas.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250904172525.2795998-1-jahan.murudi.zg@renesas.com>
 <ee10a58f-80fa-40d4-8045-c413054baef8@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ee10a58f-80fa-40d4-8045-c413054baef8@citrix.com>

This is a multi-part message in MIME format.
--------------6Oj0BrYdqCnnDZWF2tIj0zYR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/25 5:44 PM, Andrew Cooper wrote:
> On 04/09/2025 10:25 am, Jahan Murudi wrote:
>> Add man page documentation for the new '-p/--pcpus' flag that displays
>> physical CPU utilization metrics. This provides hypervisor-level CPU
>> usage insights alongside existing domain statistics.
>>
>> Changes include:
>> - Add '-p' flag to SYNOPSIS section
>> - Document '--pcpus' option with description
>> - Maintain consistency with existing documentation style
>>
>> Signed-off-by: Jahan Murudi<jahan.murudi.zg@renesas.com>
> Acked-by: Andrew Cooper<andrew.cooper3@citrix.com>
>
> This needs a release ack now for Xen 4.21 (CC Oleksii), but it's a docs
> patch for a new feature so ought to be considered.

It is okay with me to have this docs patch in Xen 4.21:
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------6Oj0BrYdqCnnDZWF2tIj0zYR
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
    <div class="moz-cite-prefix">On 9/24/25 5:44 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ee10a58f-80fa-40d4-8045-c413054baef8@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 04/09/2025 10:25 am, Jahan Murudi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add man page documentation for the new '-p/--pcpus' flag that displays
physical CPU utilization metrics. This provides hypervisor-level CPU
usage insights alongside existing domain statistics.

Changes include:
- Add '-p' flag to SYNOPSIS section
- Document '--pcpus' option with description
- Maintain consistency with existing documentation style

Signed-off-by: Jahan Murudi <a class="moz-txt-link-rfc2396E" href="mailto:jahan.murudi.zg@renesas.com">&lt;jahan.murudi.zg@renesas.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

This needs a release ack now for Xen 4.21 (CC Oleksii), but it's a docs
patch for a new feature so ought to be considered.</pre>
    </blockquote>
    <pre>It is okay with me to have this docs patch in Xen 4.21:
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------6Oj0BrYdqCnnDZWF2tIj0zYR--

