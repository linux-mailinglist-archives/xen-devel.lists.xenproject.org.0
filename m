Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F1CBED7E5
	for <lists+xen-devel@lfdr.de>; Sat, 18 Oct 2025 20:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145678.1478436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vABso-0001cd-HF; Sat, 18 Oct 2025 18:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145678.1478436; Sat, 18 Oct 2025 18:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vABso-0001aJ-AL; Sat, 18 Oct 2025 18:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1145678;
 Sat, 18 Oct 2025 18:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxYo=43=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vABsm-0001aD-82
 for xen-devel@lists.xenproject.org; Sat, 18 Oct 2025 18:42:24 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ee3b98a-ac52-11f0-9d15-b5c5bf9af7f9;
 Sat, 18 Oct 2025 20:42:23 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7814273415aso33024807b3.1
 for <xen-devel@lists.xenproject.org>; Sat, 18 Oct 2025 11:42:23 -0700 (PDT)
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
X-Inumbo-ID: 2ee3b98a-ac52-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760812942; x=1761417742; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ls+vfDDYAb3trkQktp5qEQNxIKlGkV+iNV6gd+q2Fk=;
        b=GSdNzm/Jl0EIfvwBK7niG90U2usqBfHwNCtPXW4qEcZF3oE/QBR9k8T7OccmKi5jP3
         dg8ybi/BKHONbcuKDYJk2NopOCljh9Hhn3emlwyP2yMX5XCwL1FwLE3EV7FLSWRTRC1w
         r6DOciurqy3prsxcN7daU1UrAEbS6TwPDMr9Er4w2KziV9w1/VZmTmdJZtzdVTz11qDG
         iAISffQdCg+CYw1lWVJ2f6qWn5RjIzc7LAy3uzA7YrRuLZ6c8RNZ6rYY3kwkuItekNha
         nDO0lebueVx5W6x0Lg4X5hQhK4jO5n83P3de0ujR0EC56Vtih/xFI1rDYc7y5otHcd1y
         YAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760812942; x=1761417742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ls+vfDDYAb3trkQktp5qEQNxIKlGkV+iNV6gd+q2Fk=;
        b=S7W6hjSOhT/Oysse0d9aeMsGurmuuQNr8dxcDZ6ynxw1nM38593H2xVSrHtVk2rp8R
         F9X2NL52bBHD1l+1qn7xZZ/bkT2DFTcZpvatQbnWEYTBe7rBpbaUcH9gbJQaTvn0oSG5
         Ir5RCni21wLVYfsFJFuACfOlAmoWK0ql3HSUrRotSN8se2XnDiN6G0pH2Nxd/IAcSDCa
         NJcwEErIwjJ3AXv78wbBhg19kA7puErrQBea3XhKYEWSJJfY1mXgi7kkvaM6TBON67tP
         llVPnI1iAKSjKvhrBCHk0eT6frJEyeVqMRgUlEG/vjuJOX3YrNq4jEplc/FpwRaQw8vp
         9HLQ==
X-Gm-Message-State: AOJu0YynmunvhXrpH5S4HDs1eHdgbcArdeTpNSMBVGmuyE/xStZOuhpn
	dHFUsVpNDLns7ghE1S8YGQqjwZJBZQpcTvB8SwO1ANlwOtryS6E/Vu6KOC7147ROUFevK6C1udz
	mHlqkj7RI3U9xiK0PSvDXaFuLxBCxRaFkuMUfR1A=
X-Gm-Gg: ASbGncuM/MEJKr38pDPYoj22age/K7+YhqlnYlThsdgztJWFHn+UEjqch9XEfv0i9M5
	838qHuhCzat2DBrrr/GZiy7PZorf6uPC0rda9+BxJEb6VeR2c1Gv9vGkS/wuHor47kD+yCwJeMg
	3XwaufCKivHUgQ6eb3N6WWfRnxus/lDlmZPVSp0XssMSSdmLl6xOBbNXY1rTRNltnYJtpjqdzsz
	ThPdLnO1epVnLCMiL1TG/mp2Qu7vGrF8FwZGN0z+l+zwSfdAKnOE4ZcqInE
X-Google-Smtp-Source: AGHT+IFr3m6lSy3VNeAPDHbfx6gMgzACo3yU4PLYUHgwDeuN1jOD1zud52LkkZwDV3Hvx1o43INnmTYEDCgkOob8wQQ=
X-Received: by 2002:a05:690e:1553:10b0:63e:14b1:4811 with SMTP id
 956f58d0204a3-63e1617644fmr5819633d50.11.1760812941868; Sat, 18 Oct 2025
 11:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <bdead1be-cd8f-4cca-ae70-e9744ae8b556@citrix.com> <CAHt6W4dFp_No7O+gLsM1a=xL4fGKbzwN2hP24rV2TtAkDO6kCw@mail.gmail.com>
In-Reply-To: <CAHt6W4dFp_No7O+gLsM1a=xL4fGKbzwN2hP24rV2TtAkDO6kCw@mail.gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 18 Oct 2025 19:42:10 +0100
X-Gm-Features: AS18NWBphTCCiyl4iYJ6fTGVXDfcY0AfB5nJar9nzIWweeyrX1b0IZPeQVdZ6-U
Message-ID: <CAHt6W4cxerWW3eTM1Kr+g67aqWyUTGYy4N=VCk-9UhRvkYregA@mail.gmail.com>
Subject: Re: lost serial characters on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Denis Mukhin <dmkhn@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 10:35=E2=80=AFAM Frediano Ziglio <freddy77@gmail.co=
m> wrote:
>
> On Fri, 17 Oct 2025, 18:16 Andrew Cooper, <andrew.cooper3@citrix.com> wro=
te:
>>
>> Hi,
>>
>> I think we've got a bug with the serial console.  I'm reliably loosing a
>> small part of the boot message. e.g.:
>>
>> (XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
>> (XEN) build-id: d1536ff6698b3e3ba307d551abf
>>  Family 25 (0x19 Stepping 1 (raw 00a00f11)
>> (XEN) BSP microcode revision: 0x0a001137
>>
>> whereas from xl dmesg after the system boots, we see things correctly:
>>
>> (XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
>> (XEN) build-id: d1536ff6698b3b8968e883fc39e3ba307d551abf
>> (XEN) CPU Vendor: AMD, Family 25 (0x19), Model 1 (0x1), Stepping 1 (raw
>> 00a00f11)
>> (XEN) BSP microcode revision: 0x0a001137
>>
>>
>> The lost bit of text differs even when rebooting the same Xen binary,
>> but it's always around this area, very early on boot.
>>
>> I've been seeing this for a little while, but one of my common dev
>> machines is showing it fairly reliably at the moment.
>>
>> Checking a transcript of the terminal, we're missing characters, rather
>> than having additional control characters causing the corruption.
>>
>> I suppose I need to stare at console_init_preirq() some more, but if
>> anyone has ideas, I'm all ears.
>>
>> ~Andrew
>
> Hi,
>    I would guess the code for early boot is different and is not waiting =
correctly if the serial is able to accept new characters so the hardware bu=
ffer is overwritten.
>

Or we manage to reach some code like:

        if ( port->tx_quench )
        {
            /* Buffer filled and we are dropping characters. */
            if ( (port->txbufp - port->txbufc) > (serial_txbufsz / 2) )
                return;
            port->tx_quench =3D 0;
        }

(__serial_putc)

Frediano

