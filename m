Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC7546E24
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 22:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346695.572584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzl3Q-0005yC-7d; Fri, 10 Jun 2022 20:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346695.572584; Fri, 10 Jun 2022 20:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzl3Q-0005vb-4p; Fri, 10 Jun 2022 20:16:24 +0000
Received: by outflank-mailman (input) for mailman id 346695;
 Fri, 10 Jun 2022 20:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/G3E=WR=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1nzl3O-0005vV-2m
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 20:16:22 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30169666-e8fa-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 22:16:19 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id 184so130770pga.12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 13:16:19 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a62a112000000b0051c49fb62b7sm7044478pff.165.2022.06.10.13.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 13:16:17 -0700 (PDT)
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
X-Inumbo-ID: 30169666-e8fa-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dVctl4IRQkd1fURU+QcpGbC8x5JnhZO/zEKOCc/5Ty0=;
        b=EY+ItrPHt5Ye3nt8CxjZltnAx1rCtMg/lqcfxI3EB6SBDqixhySMFpr69GGHmhjDI/
         IR6A/48AT/DMp6xs2SxY+nWoyKfm+UjNvwReUJTB+78VWdllV/18YeDjIqkjxB1L+nQa
         IF6zmUEb/+UswLnzEmJQrdSuTsNQGcHf5CsOgKgYmmn52p+Po4CM4v+T00Ebtz8qXpql
         JradafFOVN7S0tDPnB1LyVdXSFC1XgU6Hhb0NBkRv+9pVjRzEvTYEVOsq1yZFgdHw344
         d6R5tDaiMBwriqTJyECVBeUfbVyDcJ82t2rnk33isaac2hIdhY0GjGrBq2ya5g5PChJP
         wWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dVctl4IRQkd1fURU+QcpGbC8x5JnhZO/zEKOCc/5Ty0=;
        b=qxDRJrZlNVl5DQ4C542YA6bRDQI7pQwP8PCPRqSMcuZjuIFRSS0KE/OTzB+tEOx1Lc
         21iK3fDJ2IOW0Je5OfAr83LzxUpgXkUU6u7MynSXTRnEGx3kOIJTQJisol/VAwShQRyo
         AtptAJY7Ec6bdfHOWTPnENVNxHXaYv4J0EQL9215PK5SIM2vAIUBo9DvYqm+tsTQr+1j
         L6y2spHW1/97pH3rvVfADOm86xAAyu+uq4mdwHUbI/2JL+rTlqlBAfVct6+MFvoCVSRV
         KX09XHy3cb48U6f8SAzalqyhLxxXjh/ZZlRSKS/VUXUaXtQW9FOejO7NIips3vKvgCQw
         lccQ==
X-Gm-Message-State: AOAM531pUwtKr2OImK8ycKzTKkM1NcEuwzpoZywtC+Ad1UgsyTy2Dov4
	euMRWaVTWfjA9ZOQ4lntm1SaRA==
X-Google-Smtp-Source: ABdhPJxrGdO6Q0Zts48COU1P/9MJo/gokFe2MqT/BAV89cuQwKmYGsK+pVSRknZBtTOtWKGvYTgFPg==
X-Received: by 2002:a05:6a00:cd5:b0:51c:19f1:4657 with SMTP id b21-20020a056a000cd500b0051c19f14657mr28909933pfv.67.1654892178207;
        Fri, 10 Jun 2022 13:16:18 -0700 (PDT)
Message-ID: <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
Date: Fri, 10 Jun 2022 13:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220610092043.1874654-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/22 02:20, Gerd Hoffmann wrote:
> The following changes since commit 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
> 
>    Merge tag 'pull-xen-20220609' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-06-09 08:25:17 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
> 
> for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
> 
>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44 +0200)
> 
> ----------------------------------------------------------------
> usb: add CanoKey device, fixes for ehci + redir
> ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
> virtio-gpu: scanout flush fix

This introduces regressions:

https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
https://gitlab.com/qemu-project/qemu/-/jobs/2575867208


  (27/43) tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password:  ERROR: 
ConnectError: Failed to establish session: EOFError\n	Exit code: 1\n	Command: 
./qemu-system-x86_64 -display none -vga none -chardev 
socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock 
-mon chardev=mon,mode=control -node... (0.09 s)
  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR: ConnectError: Failed to 
establish session: EOFError\n	Exit code: 1\n	Command: ./qemu-system-x86_64 -display none 
-vga none -chardev 
socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock 
-mon chardev=mon,mode=control -node... (0.09 s)
  (29/43) tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password:  ERROR: 
ConnectError: Failed to establish session: EOFError\n	Exit code: 1\n	Command: 
./qemu-system-x86_64 -display none -vga none -chardev 
socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock 
-mon chardev=mon,mode=control -node... (0.09 s)


r~

