Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2FB1B88B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070736.1434355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKYb-0002Fw-1h; Tue, 05 Aug 2025 16:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070736.1434355; Tue, 05 Aug 2025 16:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKYa-0002ET-Tu; Tue, 05 Aug 2025 16:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1070736;
 Tue, 05 Aug 2025 16:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoJv=2R=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujKYZ-0002EN-3Y
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:30:31 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa03f09-7219-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 18:30:29 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so3282168f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:30:29 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5862fd9sm11846605e9.16.2025.08.05.09.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 09:30:28 -0700 (PDT)
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
X-Inumbo-ID: 7fa03f09-7219-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411428; x=1755016228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PM1NioD3AaSZK7dKZ8xpkrIjCA6kGXg8Oj72JfhVMg8=;
        b=J7fgH4jAj/l44WsixYoMiRgDBbPGEclt023Vie7k9Wt1rS9VlEHHDC94pFv+C3KzDB
         ZjoEDm2ZG/1MnyjvV71INLuO2dHWT/DemNsWKO5t/IG7kmR0vHTvcflLlxTYleRzmRjU
         hsiuQx3txvPNJo3PSqN2sN7R2d7dk+BQvIHd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411428; x=1755016228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM1NioD3AaSZK7dKZ8xpkrIjCA6kGXg8Oj72JfhVMg8=;
        b=MSYvREJ0ku4E5P5NDPf4+vofhVQrUPJ91dDni/XY/zoKIPrqwAltqlEKnKYYUce64y
         dyX9XEnTQAqA8KDPxADX6H2b/+3c79WF3p0xNM/vrg7Nt+yGjiIem4TgRjAwaDfTInJ8
         qFPcX9/r4l0wQ5+eTJmsJIo04ic5lDNKSNqC3Gw58qt9Kwbs6ccrCAXrf0NU78PHJwDw
         4tvCboRqxUiMqehUggP86yyqG1cDRMHOT1AyShEszIelEGHFYtpjG3hWJPliyBIyscDa
         bi6V/EOglTUBNBqOL1YsDuF+0iuiKmq54akoG/HwCekBR6S8gJv0iIQvS4vdudT83+v1
         kz0w==
X-Forwarded-Encrypted: i=1; AJvYcCVPuQk7QEtk9cLJvkra+eYjF23EdCrzLFXlZZWSe2PfXnsnQbA+Wd2mn0Vm1mB3PvbgN/ijQNpA1l0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRBE40nvcPvcgaKd/gHJdE5xYkwSl4kEYseF3R9rC7XtxKJdvn
	z8V0HzMB9blD1x97l79/FQieC0BIOOdmeDuyLF1RqvG86EeqM8rbaZWue4VqSS9SWGo=
X-Gm-Gg: ASbGncuUhmI/u/+TTBcyJHR4g5yYabQe2ay0us6fyobvexkkSDF37um4Tp6viESr1YY
	L+1WPLXLcZU/KxKeH0Bw/rJmkKVc2K1lTXM7MeDRZ6o6cV1FqD5FSDoSScERo1SPQUqPk/NNXRP
	a1JJBXVkq9FyLL9zh0WhhYehc+7XqP7bJxfDdDSnZv8ZXPuW0yAJkZpu8rzzEYPQl9ZAJWG8XLt
	ucRafm0IxTaBwIpmRxyRgF/QbUdtC5F7ZopqTxieWWMLsm+QFYiVxdYpeN5R+c2QpAys4o1da/X
	ECaJ7/KQqv0Q0Dl4WHDvW1JStMDy/EMMO3K6wvtzA6hFFy1nwhvZyLULOCzyuDkMcxKJGUOYews
	tTYbS0s0mPLt0p1aHbJ9OelT6eVlTpeed2eTpEs1d/KgJlQLAg2+I8tS4vzKSusMC328K
X-Google-Smtp-Source: AGHT+IFOl7yntiwacf0GzeSdiH5y/z8AxyA43gAvCJKEKtuARSmJlN9DqJXdRs6vE9d+qmllG56RCA==
X-Received: by 2002:a05:6000:2a11:b0:3b8:eb7d:910c with SMTP id ffacd0b85a97d-3b8eb7d9159mr2679147f8f.43.1754411428433;
        Tue, 05 Aug 2025 09:30:28 -0700 (PDT)
Message-ID: <eec4c77b-c2fa-4554-9016-094e0daa73e9@citrix.com>
Date: Tue, 5 Aug 2025 17:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] systemd: Add hooks to stop/start xen-watchdog on
 suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 9:16 pm, Mykola Kvach wrote:
>  config/Tools.mk.in                            |  1 +
>  m4/systemd.m4                                 | 14 ++++++++
>  tools/hotplug/Linux/systemd/Makefile          |  8 ++++-
>  .../Linux/systemd/xen-watchdog-sleep.sh       | 34 +++++++++++++++++++

This has been committed, but it drops the file:

  /usr/lib/systemd/system-sleep/xen-watchdog-sleep.sh

into a directory which more normally contains:

$ file /usr/lib/systemd/system-sleep/*
/usr/lib/systemd/system-sleep/hdparm:              POSIX shell script, ASCII text executable
/usr/lib/systemd/system-sleep/nvidia:              POSIX shell script, ASCII text executable
/usr/lib/systemd/system-sleep/sysstat.sleep:       POSIX shell script, ASCII text executable
/usr/lib/systemd/system-sleep/tlp:                 POSIX shell script, ASCII text executable
/usr/lib/systemd/system-sleep/unattended-upgrades: POSIX shell script, ASCII text executable


I'd suggest renaming it to xen-watchdog (or perhaps xen-watchdog.sleep).

~Andrew

