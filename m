Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E1A07CA8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868934.1280444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuvh-0000PG-D5; Thu, 09 Jan 2025 15:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868934.1280444; Thu, 09 Jan 2025 15:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuvh-0000MM-AQ; Thu, 09 Jan 2025 15:58:41 +0000
Received: by outflank-mailman (input) for mailman id 868934;
 Thu, 09 Jan 2025 15:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29Hz=UB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVuvg-0000Kt-I7
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:58:40 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9702250d-cea2-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:58:38 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso1013686e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:58:38 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428cc9b47esm202657e87.53.2025.01.09.07.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:58:37 -0800 (PST)
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
X-Inumbo-ID: 9702250d-cea2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736438318; x=1737043118; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAHKsFdVWXQhdOjkYrMh7AQ++xARIkLAhZu2Fb5zcAc=;
        b=WH3h4y/wRikvBK+n3Sscc1vBAYQ2h086ZeJsvYysAvHtPej/dacBJIg/+XVEd97YNs
         pzBm/U7cGdtbdQG3gj/LJtdgSE9qufXWj1gpfH1fcqQHYy+dFLM493omIZU5D7ihO2mE
         6C6pWbvZO4IqJs3a/Y+9n0Lwod5xaXkW5ALgATBnlNCM++A1OT6ML2s2ZFJzf/NNeYc1
         nL0ATG5nONbDhoc9+VHgjd/XfiPF9cI6TGpzjDg9bo3YCbs2hG3ak2jSkYypUn3hLkrw
         v1McOGnEnhldTq6Vn/MwNOIN4TIAXpflMho41JUZ4eG/4zR3ML9FKz3DEdSLJ6a05j9w
         fqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438318; x=1737043118;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAHKsFdVWXQhdOjkYrMh7AQ++xARIkLAhZu2Fb5zcAc=;
        b=xVaLUptnmmDQZEnZyPQV7jDY7acLQS4V9LJqCDsn2gFw0KH+i/rhDvu1Jqwl7AI9QY
         9dP6ALkufTo6RPPVP8GNPbOpNqeHwfYbpGAP1bGLkLeDg6a7yzEmQkLdNe9T2RWJSlrW
         tl3wf0bLgbeXfKbeFmAbdUdffT0ili0wY/C/TMIMV3RQBIEkhZG9Q55m4GxFn1T6hGWr
         bx+VvxJMyXkLR2OShvZRlUemySQA4pHPjUz2xt5XNx7hqC6oEhfE0YKERKlEh83gRgW3
         458VRqTHx4fze4Jj9DFLrhuKIY+Y537nqAt/Ig+NFt3ZJACP+wWPMPZ4+7gzxlGysAnC
         1mDg==
X-Forwarded-Encrypted: i=1; AJvYcCV7SAuI4PTRJz+Ywn7jwkFHSqavzLEi4u/+Dc5kyy2xezSM2gasfxio3dYXgWez/NN+kqcCYtOW2EY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeX4t+WMl1/0bpX3OqnyD9K65Y2Ln0b+NjQZEm+X9qWJFD4MAb
	OaATi0F3cKtKukiBwK36YM0PleHQI+WYpWckeOCCDINbZJ5AOqbC
X-Gm-Gg: ASbGncvN+8cQBK+hqMtDCe+nVnCpm2PJiC/yXQZi4EZMR3oO9V6/+Y/mtzpQjQiAmgH
	7qIv5DpCyf75OcmyIohQUzdZGiWYwJWhUryf7iT3ZoW/CDYCVc/NtWJt2ERiUW4xehCx6NhAlpm
	1Bk57XOZw80bUJl8rDeh12NSMbbmtvGPLTLUJU3iok0V/0AsgFfWgFOJUsnscnO6B+AzUYQiraf
	vCETlxNfLkmEoQ7lCsW+BPTjTOvEHm/k82929XLyStph8Nj7HKIUTuTaBomdmIhFyV2Mg==
X-Google-Smtp-Source: AGHT+IFy3uMoCME4UAgRrABbqMHj6lLhtvWZg6/FNarmytPfLSq5sn6tBYc4qkzkmm79V7DiTJ3m6g==
X-Received: by 2002:a05:6512:3d93:b0:542:29a9:4098 with SMTP id 2adb3069b0e04-542844f4060mr2017795e87.5.1736438317652;
        Thu, 09 Jan 2025 07:58:37 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0d9DW01CeQPbU0he1pDa8Gay"
Message-ID: <c8146158-db57-4ee8-a767-b1266e87baa9@gmail.com>
Date: Thu, 9 Jan 2025 16:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/2] Prep for 4.20-rc1
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250109153921.43610-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------0d9DW01CeQPbU0he1pDa8Gay
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

LGTM: Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>.

( in case if my Ack is needed )

Thanks.

~ Oleksii


On 1/9/25 4:39 PM, Andrew Cooper wrote:
> RC1 is scheduled for tomorrow (Jan 10th).
>
> Andrew Cooper (2):
>    Config.mk: Pin QEMU_UPSTREAM_REVISION
>    Update Xen version to 4.20-rc
>
>   Config.mk    |  2 +-
>   README       | 16 ++++++++--------
>   SUPPORT.md   |  2 +-
>   xen/Makefile |  2 +-
>   4 files changed, 11 insertions(+), 11 deletions(-)
>
>
> base-commit: 40f35d07aa14bde44d7baafad171f7c92b053017
--------------0d9DW01CeQPbU0he1pDa8Gay
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre><font face="monospace">Hi Andrew,</font></pre>
    <pre><font face="monospace">
</font></pre>
    <pre><font face="monospace">LGTM: Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>.</font></pre>
    <pre><font face="monospace">( in case if my Ack is needed )</font></pre>
    <pre><font face="monospace">
</font></pre>
    <pre><font face="monospace">Thanks.</font></pre>
    <pre><font face="monospace">
</font></pre>
    <pre><font face="monospace">~ Oleksii</font>
</pre>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/9/25 4:39 PM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250109153921.43610-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">RC1 is scheduled for tomorrow (Jan 10th).

Andrew Cooper (2):
  Config.mk: Pin QEMU_UPSTREAM_REVISION
  Update Xen version to 4.20-rc

 Config.mk    |  2 +-
 README       | 16 ++++++++--------
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)


base-commit: 40f35d07aa14bde44d7baafad171f7c92b053017
</pre>
    </blockquote>
  </body>
</html>

--------------0d9DW01CeQPbU0he1pDa8Gay--

