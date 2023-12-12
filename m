Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30C80E98A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 11:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652935.1019101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0Ro-0000dv-R2; Tue, 12 Dec 2023 10:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652935.1019101; Tue, 12 Dec 2023 10:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0Ro-0000bH-N3; Tue, 12 Dec 2023 10:57:08 +0000
Received: by outflank-mailman (input) for mailman id 652935;
 Tue, 12 Dec 2023 10:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1q=HX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rD0Rm-0000bB-Ru
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 10:57:06 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f3a1ed1-98dd-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 11:57:04 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso3483700f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 02:57:04 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x14-20020adfdd8e000000b0033630da3528sm1004932wrl.25.2023.12.12.02.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 02:56:48 -0800 (PST)
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
X-Inumbo-ID: 2f3a1ed1-98dd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702378624; x=1702983424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZgpHItpOgzwWJXOE6/3cgC60N4mJ/I2l/9jNNQ2tMo=;
        b=FrZCCnT+uO3162m840fP4G9KA59xzzC6Kf1Htt8bO9j5moT1PKK8gERZmXBYrj/Gor
         466terATe4wW/wPgAzLelnTZcE6dCKUBe+WuNKasZKnUNVYsqvhuhX72DWMQASYYjt6G
         N5J65g3ApRXjGLVpHE0F9epVgbP1v+yIGTuMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702378624; x=1702983424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZgpHItpOgzwWJXOE6/3cgC60N4mJ/I2l/9jNNQ2tMo=;
        b=sDqkOHswRfCapqzN2zRdoUCT/5gRlbJH0ExlBVd9d8dpUkTTZL0m8YnqZGEV3VJxx8
         9P9VOr6oZSu77LAZNyK8e01k3+Nb9nS/MgjGl9tqOK6lwgyiP05Tuea3VpP0iYJ73ly3
         C/2E3yoTlE4mEeiKZWmXKYHUX/ZMuZUqipLmaytKEAq1TDd2OghQ8MNKgpDyZstNf/gU
         IocAguoOqGPphTYamD+0C3NvQEIAw6VwmziwCDroOjKow7PJ+OhKOvsiYWfT4WSoWnxA
         CfA7dY6TEJYG3RIfoKs/mGtTgbaZ+LVi4PGz/0PR1jCOfQrBgWM54bKPn7LbjRJ83UqI
         E0rw==
X-Gm-Message-State: AOJu0Yy9Q+QW7EI7kD9tuoYxYhrGe2UmgZbd0WTonxgejb1xX88HUtek
	SDH74/EB7wf4dGYYxWxfju9Xig==
X-Google-Smtp-Source: AGHT+IG8Fchp0Ln13X/19uaLu236xh1OvsJKkIwHdnU1BAeGCBQZIJrLcwheQ4coqAUrhxMx8YRHiQ==
X-Received: by 2002:a5d:4a82:0:b0:333:3c90:fe16 with SMTP id o2-20020a5d4a82000000b003333c90fe16mr3218453wrq.32.1702378623834;
        Tue, 12 Dec 2023 02:57:03 -0800 (PST)
Message-ID: <f4c7141c-5f37-4366-890c-ab8b86b6f5dd@citrix.com>
Date: Tue, 12 Dec 2023 10:56:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: XSA-446 relevance on Intel
Content-Language: en-GB
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
References: <ZXgrQdVvDuQCbCRP@dingwall.me.uk>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZXgrQdVvDuQCbCRP@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/12/2023 9:43 am, James Dingwall wrote:
> Hi,
>
> We were experiencing a crash during PV domU boot on several different models
> of hardware but all with Intel CPUs.  The Xen version was based on stable-4.15
> at 4a4daf6bddbe8a741329df5cc8768f7dec664aed (XSA-444) with some local
> patches.  Since updating the branch to b918c4cdc7ab2c1c9e9a9b54fa9d9c595913e028
> (XSA-446) we have not observed the same crash.

That range covers:

1f5f515da0f6 - iommu/amd-vi: use correct level for quarantine domain
page tables
b918c4cdc7ab - x86/spec-ctrl: Remove conditional IRQs-on-ness for INT
$0x80/0x82 paths

so yeah - not much in the way of change.

> The occurrence was on 1-2% of boots and we couldn't determine a particular
> sequence of events that would trigger it.  The kernel is based on Ubuntu's
> 5.15.0-91 tag but we also observed the same with -85.  Due to the low
> frequency it is possible that we simply haven't observed it again since
> updating our Xen build.
>
> If I have followed the early startup this is happening shortly after detection
> of possible CPU vulnerabilities and patching in alternative instructions.  As
> the RIP was native_irq_return_iret and XSA-446 related to interupt management
> I wondered if it was possible that despite "Xen is not believed to be vulnerable
> in default configurations on CPUs from other hardware vendors." there could
> be some conditions in which an Intel CPU is affected?

In short, XSA-446 isn't plausibly related.  It's completely internal to
Xen, with no alteration on guest state.

It is an error that Linux has ended up in native_irq_return_iret.  Linux
cannot return to itself with an IRET instruction, and must use
HYPERCALL_iret instead.

In recent versions of Linux, this is fixed up as about the earliest
action a PV kernel takes, but on older versions of Linux, any
interrupt/exception early enough on boot was fatal in this way.


This part of the backtrace is odd:

[    0.398962]  ? native_iret+0x7/0x7
[    0.398967]  ? insn_decode+0x79/0x100
[    0.398975]  ? insn_decode+0xcf/0x100
[    0.398980]  optimize_nops+0x68/0x150

as it's not clear how we've ended up in a case wanting to return back to
the kernel to begin with.  However, it's most likely a pagefault, as
optimize_nops() is making changes in arbitrary locations.

It is possible that a change in visible features has altered the
behaviour enough not to crash, but if everything is still the same as
far as you can tell, then it's likely just chance that you haven't seen
it again.

This is definitely a Linux bug, so I suspect something bad has been
backported into Ubuntu.

~Andrew

