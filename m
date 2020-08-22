Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688224E9A1
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 22:12:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9ZqZ-0005T8-Tu; Sat, 22 Aug 2020 20:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bwx2=CA=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1k9ZqX-0005T3-Kt
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2020 20:10:38 +0000
X-Inumbo-ID: 7ca92fa9-a3e3-447c-ac13-ef65990d18fc
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7ca92fa9-a3e3-447c-ac13-ef65990d18fc;
 Sat, 22 Aug 2020 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598127035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8rHiObt/7gndhMUFhQ0g5OXJLj+htCn/tSky2KVbbsA=;
 b=IjWo3cixWC7gqW3cw4yr5fDnTtaBiN5eoiCOZbM0FrmkshrD80f6Gj9H9b+xzl2wMCrE/Z
 RYR87gUhmFSQt5qscWx+vXeqbdjEmO4SDYFaz/6/iQHQGBy3VB3zkeobJatucCe/J0c0h6
 hkYaYyqqSHxpcjdW1+w/yW0f+kYYTiw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-ElNQzq1UNTq2qY0BklJfnA-1; Sat, 22 Aug 2020 16:10:33 -0400
X-MC-Unique: ElNQzq1UNTq2qY0BklJfnA-1
Received: by mail-wr1-f71.google.com with SMTP id d6so1978569wrv.23
 for <xen-devel@lists.xenproject.org>; Sat, 22 Aug 2020 13:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8rHiObt/7gndhMUFhQ0g5OXJLj+htCn/tSky2KVbbsA=;
 b=idA2H2PaRGNLNME02rhAbVZsZ5NEkLryK6MtY0aLliW9he00wwhD8dmq2XYlWeUE51
 qwgnxE/5J3lafIh8rDAvG2ggDAJiVa+lY1EtrhzcKlWVtOLryPfB8kt0OCoZ17MFTHPm
 uVjJyyX2qYoxVE8s344A+wgrRNonjachag+ZG0TMLa6DOre+g+RyMHRvMI/G43UDdp4i
 6nmDuMDNzrXZFOvBW3Y1DDIt/4fhjM1f1+CUoVpzezG97oGuB42ArHzKKcgz/TeyowWa
 ZMLHjHEQKQJTocQ9yGULIoKvSx8DQf85vXD+I/YKJMaoHXD14hhj/wBx2PB7KartMFzd
 MDng==
X-Gm-Message-State: AOAM53090pjMDlHRE0zVzVRFjdETbXU8hsACbaHt0B8IKdCdxegrqvN+
 4dRUXG86qhE3ZHu77UoTWQFOeRyX9+Hl2HJNYy4NfWlpnVmkmaK4QhalOqVzFH/pv2W4HYtNoQO
 Swr/boURHwgb0rCd8HpUCSGiguSQ=
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr9625212wmi.34.1598127032415; 
 Sat, 22 Aug 2020 13:10:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykjhIy2o+WEevQFL2U1+HyhOUASMgtz4/dRDba6WuAxbjXfV6x0K5LvGWULG0F+P2ffmRrcQ==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr9625199wmi.34.1598127032240; 
 Sat, 22 Aug 2020 13:10:32 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id n124sm14392307wmn.29.2020.08.22.13.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 13:10:31 -0700 (PDT)
Subject: Re: [PATCH-for-5.2] hw/i386/q35: Remove unreachable Xen code on Q35
 machine
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20200722082517.18708-1-philmd@redhat.com>
 <20200811105522.GB2024@perard.uk.xensource.com>
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
Message-ID: <95a88c5a-910a-35b7-af58-d038adda1744@redhat.com>
Date: Sat, 22 Aug 2020 22:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811105522.GB2024@perard.uk.xensource.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Anthony,

On 8/11/20 12:55 PM, Anthony PERARD wrote:
> On Wed, Jul 22, 2020 at 10:25:17AM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
>> Xen accelerator requires specific changes to a machine to be able
>> to use it. See for example the 'Xen PC' machine configure its PCI
>> bus calling pc_xen_hvm_init_pci(). There is no 'Xen Q35' machine
>> declared. This code was probably added while introducing the Q35
>> machine, based on the existing PC machine (see commit df2d8b3ed4
>> "Introduce q35 pc based chipset emulator"). Remove the unreachable
>> code to simplify this file.
> 
> This is almost correct, we can't start a xen guest with the q35 machine
> due to missing setup. But we wouldn't need to declare a new xen specific
> machine as setting "accel=xen" is enough.

I'm not sure you are asking me to reword the patch description,
but since you gave your A-b, I suppose this is enough as it.

> 
> Anyway, that patch can be reverted whenever someone takes care of
> bringing q35 to xen.
> 
>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Michael, can this go via your tree?

Thanks,

Phil.


