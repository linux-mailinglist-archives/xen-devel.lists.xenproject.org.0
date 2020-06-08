Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E91F1E6F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 19:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiLiP-00084z-Rq; Mon, 08 Jun 2020 17:37:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiLiN-00084u-Ls
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 17:37:39 +0000
X-Inumbo-ID: bf56c058-a9ae-11ea-b2a1-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bf56c058-a9ae-11ea-b2a1-12813bfff9fa;
 Mon, 08 Jun 2020 17:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591637858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
 b=h2VtUen9ONMh1tp6jdeOk6k6SYSZNm6jWNcGkbGPM9EqYbDCkPMxo3BtVXWMI8seFlkpPR
 hN7daf3I2iofOp7qcKOufOciZNo8x4KCmGDnUotUp93opjH0jkqEj403Ctv2zzuYiVXSga
 iSPqoOAIJ7NkbF3/K4ckn/MYuL3fRtg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-1jjJnEhSMdOvBQeIovc9Lg-1; Mon, 08 Jun 2020 13:37:36 -0400
X-MC-Unique: 1jjJnEhSMdOvBQeIovc9Lg-1
Received: by mail-wm1-f69.google.com with SMTP id c4so67732wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 10:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
 b=iEB79jIt1GHMWgFT8NKcMMiy+Xmrk4Xg+ibG8BQngfQ202mMvmPbMZWyALVFoq8LEK
 lhjaURbF5AZyMdW0RuDn+GSmve0M41T5ZHh4tFVP1cBgza1qwzBEIrQouxvCSFYvv0O+
 zSNIyr0yK3+m4/+ebkL2N54PKCPFPvEZa1G8RnprpkdqUeQfVZBLW9MU8ukrpcXNDvDg
 e2OS1Wpt60aNhQ7xaYghi8SoPg5Jv/7wcHScfLR91Rr2poJoMBnC/PdcFhfzHy4WB7oI
 uZFSmD5FCTlHy3DzZtIQ15pFbGzu5WfqrbDr5Ln07ic/0vEB+nUI9AY00skQaH+RAH15
 wyZA==
X-Gm-Message-State: AOAM532e/Dcka7vA9hmA+Sk6DEPZVBgpKoYoD2cS1YJJ4YZIvimnFvnP
 4jgbn5Hhpu3nIZ+ixrK8I6d7HYx5sgKpCmIFrGMMn3v28YAHBcv5pFocvBqrsvrP5Shb/b+D/m1
 RJXo/JM/x7RcwboC3MlluxJ/wjiw=
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr404314wmf.69.1591637855626; 
 Mon, 08 Jun 2020 10:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2PP8Jam0jrAYWvl6HUndlzbkmQydkF0EZCtZp+EtGb77Su/VpiOiSTjN4I5rK9hrbErrKaQ==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr404296wmf.69.1591637855427; 
 Mon, 08 Jun 2020 10:37:35 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z9sm214694wmi.41.2020.06.08.10.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 10:37:34 -0700 (PDT)
Subject: Re: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code
 is used
To: paul@xen.org, qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-16-philmd@redhat.com>
 <004b01d63db5$87a83110$96f89330$@xen.org>
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
Message-ID: <a14be45a-9296-c0ca-2b04-44703f2b9756@redhat.com>
Date: Mon, 8 Jun 2020 19:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <004b01d63db5$87a83110$96f89330$@xen.org>
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
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Sagar Karandikar' <sagark@eecs.berkeley.edu>,
 "'Michael S. Tsirkin'" <mst@redhat.com>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Max Filippov' <jcmvbkbc@gmail.com>,
 'Alistair Francis' <Alistair.Francis@wdc.com>,
 'Gerd Hoffmann' <kraxel@redhat.com>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Magnus Damm' <magnus.damm@gmail.com>, 'Markus Armbruster' <armbru@redhat.com>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 =?UTF-8?Q?=27Marc-Andr=c3=a9_Lureau=27?= <marcandre.lureau@redhat.com>,
 'David Gibson' <david@gibson.dropbear.id.au>,
 'Andrzej Zaborowski' <balrogg@gmail.com>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 'Alistair Francis' <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 'Stafford Horne' <shorne@gmail.com>, 'Palmer Dabbelt' <palmer@dabbelt.com>,
 'Richard Henderson' <rth@twiddle.net>,
 "'Daniel P . Berrange'" <berrange@redhat.com>,
 'Thomas Huth' <huth@tuxfamily.org>,
 'Bastian Koppelmann' <kbastian@mail.uni-paderborn.de>,
 'Michael Walle' <michael@walle.cc>, qemu-ppc@nongnu.org,
 'Paolo Bonzini' <pbonzini@redhat.com>, 'Aurelien Jarno' <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/8/20 6:54 PM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> This code hasn't been QOM'ified yet. Warn the user.
> 
> "Based on today's IRC chat, this is a trivial RFC series
> to anotate pre-qdev/QOM devices so developers using them
> without knowing they are not QOM'ified yet can realize
> it and convert them if they have time."
> 
> So, how should this be coded then? The XenIOState doesn't really qualify as a 'device', does it?

There is a pending question whether Machines are Devices or not.

Xen is a tricky case, it is created as a Q35 machine overloaded with Xen
features.

>> @@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
>>      xen_pfn_t ioreq_pfn;
>>      XenIOState *state;
>>
>> +    qdev_warn_deprecated_function_used();
>> +
>>      state = g_malloc0(sizeof (XenIOState));

XenIOState is indeed not a device, it is allocated once, we won't gain
anything making it a QOM object... so this patch is incorrect.

Sorry for the noise :S

Regards,

Phil.

>>
>>      state->xce_handle = xenevtchn_open(NULL, 0);
>> --
>> 2.21.3
> 
> 


