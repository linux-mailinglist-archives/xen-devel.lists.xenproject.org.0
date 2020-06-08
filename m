Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10871F1D14
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKT5-0008MM-HH; Mon, 08 Jun 2020 16:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKT3-0008ME-Qs
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:17:45 +0000
X-Inumbo-ID: 961a229e-a9a3-11ea-ba62-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 961a229e-a9a3-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591633065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
 b=JRcWnRERdA858LJdWhdyW/963/iUinf3bTRO/Rw/ewmQTBXoxSYMDveEn8Q6NiiyKseU9Z
 yNjvWHZMf+Smy3BK2A64FcPnNJhXdFj9N1V9m3qHQGkWtqTHBThgvfE16rBfFNW9A6G/EB
 MV5mwSMpzwST2Cx6q8tbjSNhNXjtSbo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-JAtTBJX4MlavQJ5uIlP-CA-1; Mon, 08 Jun 2020 12:17:43 -0400
X-MC-Unique: JAtTBJX4MlavQJ5uIlP-CA-1
Received: by mail-wr1-f71.google.com with SMTP id e1so7385435wrm.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
 b=MxZCzGkWgWiyzWGsQ/zK9Bvw5YEqOK6/g5h4sBPIEoT+Hd/8oOPvnLu2B+HKAbe4tr
 kPICkS9zksLuWfOOa5wkvpgkkIMmZWQwNz72vgJW2zxwTqeS3Z8RZ0y4UucU8+sUMOet
 7NnT2uJnBtJtFqM4oZC9JrwInCvVEKZ2YH3JOcu9UP9v4R7iwu/vzY55PnuUG2Yr2GVP
 jEK5E/yvJa6AJckkK3oRKwDiDjP3PchqiQ4G5+MBaGImuhbbEK1htGIUWjhpjSfx3CpE
 BoHzox17lYxXdsDYyHwK6BdooSEXdZ4N6Jm9JiLM+jRc2F9C8gTzhH+cW5NPrAARxKnj
 puYA==
X-Gm-Message-State: AOAM530/RvZJfpRhv/4jdjWXzSHnP20Lng0Ksy5bQ1jZFtRryNx9BvDr
 ZFlc5JC/MhV/zelHUS6wI+iWtULBkI2Hv2h1CwL6gj3EplcXcJZSBuxbVEciqYhvJfvdzkqM86A
 DnACf+5qtEapCa8+aAZuKcn0z6Ck=
X-Received: by 2002:a1c:1f48:: with SMTP id f69mr104660wmf.67.1591633062255;
 Mon, 08 Jun 2020 09:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3YBh9EGdDObAb79iv4SsIf8IFp5HSV9+Z1Ovy3h5MqXgC2dmwC/+3rmg10l/GT0TlOYJvaw==
X-Received: by 2002:a1c:1f48:: with SMTP id f69mr104619wmf.67.1591633062031;
 Mon, 08 Jun 2020 09:17:42 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id k21sm247677wrd.24.2020.06.08.09.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 09:17:41 -0700 (PDT)
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200608160044.15531-1-philmd@redhat.com>
 <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
Date: Mon, 8 Jun 2020 18:17:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/8/20 6:14 PM, Peter Maydell wrote:
> On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Based on today's IRC chat, this is a trivial RFC series
>> to anotate pre-qdev/QOM devices so developers using them
>> without knowing they are not QOM'ified yet can realize
>> it and convert them if they have time.
> 
> What mechanism did you use for identifying non-QOM devices?

I don't think this is the complete list, this is only all the one I
could find with:

  $ git grep "g_new|g_malloc" hw/

Then on each match I manually reviewed (so I might have incorrectly
flagged code too).


