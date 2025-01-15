Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BD8A124B2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 14:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872515.1283482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3Qe-0004OX-NN; Wed, 15 Jan 2025 13:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872515.1283482; Wed, 15 Jan 2025 13:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3Qe-0004LU-KP; Wed, 15 Jan 2025 13:27:28 +0000
Received: by outflank-mailman (input) for mailman id 872515;
 Wed, 15 Jan 2025 13:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY3Qd-0004LO-5J
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 13:27:27 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7526f7ec-d344-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 14:27:25 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaef00ab172so1052857666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 05:27:25 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9f05e49b0sm2657973a12.31.2025.01.15.05.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 05:27:24 -0800 (PST)
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
X-Inumbo-ID: 7526f7ec-d344-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736947644; x=1737552444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aHhxcREsfGZyleKSVFR/y7WX9/MFFJRW+aRQ3iohxSU=;
        b=n23+bXzJGdIuI43qzoXI+DWS++uv1eO8jhngvH0d1nP3QEAjTHL+J5szYOe3ne2q8T
         i+KKhOnrvDjg4Bo8bcPNLEorMMlCfKsn4vfMeDW3vbk5tl5TfWdt+OXFmG2NZur08r6w
         0XtinWCj2OgtMbiz2uQystf4/DbzLRfHf7Pew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736947644; x=1737552444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHhxcREsfGZyleKSVFR/y7WX9/MFFJRW+aRQ3iohxSU=;
        b=AGytIwQLHHR0bwDQeEV+yMURUXwTOrr7qQFpHJorTjH2Cs5QZb9pZnxJ+p/QIkuWfD
         CURSr97DBYxNAiH/8CaubracdI6cAd+s49WJV4QcQkH5U3JQ9Z6RMvTJVpLnG+nPpkaE
         SZ8Gdr6lvegre7u1Q3dYVcifTKE8Xt4hgmwFzGlSk6ySKl5s5sM3or7s6VUhUKnFZe7D
         tKIgvzSTiWt0D4aA4JLOVm/Rn2wTkroE0ukRoh4pAstdVHAXMHV76VsUBDdo3L6Fxuzr
         zoVx86Rbox7Zsj3j/D4HYwP4toX0NdoFvYNcuMFrGmpfJSmfTvuHLLgL6ITOWkSn/X/v
         wEnA==
X-Forwarded-Encrypted: i=1; AJvYcCVhEfuySM2n23G1SYGo4iNUOzDRdY/D55EKMg8BUiP4o7fPwxIZK5sX2IFjIJPZpThEDNkyY6/lxos=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTOFJt/dc9YNt18SmDaug/921o9Sq1Ns7zF3x35GKhEqWOL46T
	8vbdVAKCJ6mcKw5/8bYGVQoH/Hw/06Y8UtvaQYQ4Lp4PxzvAw+ISsa0XMSDud3A=
X-Gm-Gg: ASbGncuoPEbmolnM6Mi1ompLzAtNMkiBY3atgMJ49/teKu+QUlCNRbg9auq91PPo3uW
	/JyTT7/Bv9QjTDONFYgzusNufk78vEC1kLvkNLO+2/RjeJYee+fGXBNViExS+fei2Mc0lKNJubk
	G0g04aoU4csIGgToeHsyoR68fybjSMinucxtCe2V0SzX1Fh1NXtA+MIPg/whwBtyxZb7w4pIv2y
	9yPg/8Oi69OfzZ94Q8KSc8OgcWNHYVvOWIX2TJYdRmTKq8qOK8MWaGA+4paX29j9UQ=
X-Google-Smtp-Source: AGHT+IH+uQ7oPWouRNdX53TEi7/Skmbuh/GksPosBEh4IogWkPLHcO82CHeHbj4C8NAyL2Q4yOgPbQ==
X-Received: by 2002:a05:6402:84f:b0:5d0:d3eb:a78f with SMTP id 4fb4d7f45d1cf-5d972d26e91mr73190035a12.0.1736947644451;
        Wed, 15 Jan 2025 05:27:24 -0800 (PST)
Message-ID: <58753517-26b6-47cc-a060-e8b5a88639bd@citrix.com>
Date: Wed, 15 Jan 2025 13:27:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/sphinx: overview of serial consoles
To: Yann Dirson <yann.dirson@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <d40643bf0730c2f227f2dfbc7985ba0b5f8878cf.1736942790.git.yann.dirson@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d40643bf0730c2f227f2dfbc7985ba0b5f8878cf.1736942790.git.yann.dirson@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 12:07 pm, Yann Dirson wrote:
> ---
>
> Notes:
>     This is a very preliminar first draft for comments:
>     
>     - would this structuration be adequate?
>     
>     - Is my basic understanding correct, are those first enumerations
>     correct? (some of it come solely from console.txt, which has already
>     proven to be seriously outdated on many aspects)
>     
>     - is there some doc about the qemu/ioemu backend I missed?  Is it able to
>     deal with PV consoles, or is it just for virtual UARTS?

Consoles are probably one of the harder areas to get started.

First, we need to distinguish between host consoles and guest consoles,
because admin-guide/console could be either/both.

Host consoles are mostly UARTs, but we have several flavours including
usb2 and usb3 flavours.  ARM has extensive early printk support, which
RISC-V/PPC are borrowing too.  Xen is also capable of using
hypervisor-provided consoles too.

For guest consoles, there's the plain CONSOLEIO hypercalls, and whether
they do anything interesting depend on whether you're dom0 and/or the
CONFIG_VERBOSE build setting.  ARM has the ability to mutiplex output
from different guests onto the host console.  There's also the
xenconsoled, things emulated by Qemu or other emulators, and even the
in-Xen UART emulator currently on list.


Then, for specific guests, they've got different console options
available.  e.g. Linux has a dedicated earlyconsole option for Xen (uses
CONSOLEIO) as well as an hvc driver.


And ideally we want all this information documented nicely, between "how
do I set up debugging for my guest" and how do I write a driver for
xenconsoled.

~Andrew

