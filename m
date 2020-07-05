Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F7214A72
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 07:39:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrxLY-0007LR-Jd; Sun, 05 Jul 2020 05:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJgw=AQ=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jrxLX-0007LM-1N
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 05:37:47 +0000
X-Inumbo-ID: a68ad1b2-be81-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a68ad1b2-be81-11ea-bca7-bc764e2007e4;
 Sun, 05 Jul 2020 05:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593927463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjMyNamLLkRJJI8ub+Padxcs+ybIZnNdDYQZ7F5eZm8=;
 b=NqZ0p37e8S6v0Tj3zP807s/jgXy1lZ3ZSyxU3IHZLQsl9ZEDP976bhXgYgR14f4id+rSRg
 QTPtqCg9WZhXFpzQG8Y3HRd/C5HrmvZlkPPfhm9wMzwV7lZeSXqD2KP0CMvBVR7pH9dbWx
 ybAfrhG6AJyhe4Y8RELNgQwPiKH4Qlk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-FLuzGc-SPtSV8t3S2TekiA-1; Sun, 05 Jul 2020 01:37:42 -0400
X-MC-Unique: FLuzGc-SPtSV8t3S2TekiA-1
Received: by mail-wr1-f71.google.com with SMTP id z1so7876984wrn.18
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 22:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QjMyNamLLkRJJI8ub+Padxcs+ybIZnNdDYQZ7F5eZm8=;
 b=l1IDz4rnXYjgMbDfC5u0jRNacWNeG8RVsxdqDSKhSd13mfrcPnXnYd2p+Tg6DGZUCy
 TDa0JV3j58f8hvHn2f9blF35PKgfRn2V1ur4CCtRrvLGEVHeX5GuMSP2pBLeOgSxWyah
 eeIzMlyT3yBB2Jya6OoCMc1HidKHp6Cj/WtYUrPWFM9D3lPwIP1OrQ+jYDgl2WeZgiE6
 8R34kPXdUD9vNgU1WfXjXc39jq2L9zG3+T2OMOVq27UvUurx5NB/8VZJjbzDNYCetz9p
 l8SafKW9p/stEu75H9hTHpng/QqE0NQmrN2i6zUF0RpkuZIGefSgds5H0xlznwVO3K2j
 zGow==
X-Gm-Message-State: AOAM533ETFmD1nfA3Xei0ZA3Kopyug8JlRZFnYsMwkcKQNpzs+NYsrQR
 +Id55YA/jZt9iF62xv46knRyX+ZU2E0815O9r93gPfZhcOqYOOejr7nMMlXJNif+wQ7TL3x2wzV
 x7omcn/L8Wur+M8ZC0ni/qWY4vO8=
X-Received: by 2002:adf:ded2:: with SMTP id i18mr43454221wrn.109.1593927461014; 
 Sat, 04 Jul 2020 22:37:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3gbpxpgGybQ3VzZRMzQ46rw4ptwRvsmRqLomV48jR8zUbdkEyVOboq2NFCpnpK8+MW/QV+A==
X-Received: by 2002:adf:ded2:: with SMTP id i18mr43454210wrn.109.1593927460808; 
 Sat, 04 Jul 2020 22:37:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:adf2:29a0:7689:d40c?
 ([2001:b07:6468:f312:adf2:29a0:7689:d40c])
 by smtp.gmail.com with ESMTPSA id w14sm18980566wrt.55.2020.07.04.22.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 22:37:40 -0700 (PDT)
Subject: Re: [PATCH 24/26] hw/usb/usb-hcd: Use UHCI type definitions
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-25-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041916060.92265@zero.eik.bme.hu>
 <f19dc1c9-8b72-695b-bce1-660e547e5658@amsat.org>
 <alpine.BSF.2.22.395.2007042140380.45095@zero.eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ba4dd94b-ec7a-b4ec-4786-c8c5dcd8127f@redhat.com>
Date: Sun, 5 Jul 2020 07:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2007042140380.45095@zero.eik.bme.hu>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/07/20 21:44, BALATON Zoltan wrote:
> 
> No it's OK, no need to list all defines. I just did not notice the macro
> argument that's why I was wondering where it comes from. This seems to
> be used elsewhere at least here:
> 
> hw/audio/es1370.c:#define a(n) if (val & CTRL_##n) strcat (buf, " "#n)
> hw/audio/es1370.c:#define a(n) if (val & SCTRL_##n) strcat (buf, " "#n)
> hw/audio/es1370.c:#define b(n) if (!(val & SCTRL_##n)) strcat (buf, " "#n)
> 
> Maybe writing it without the space between "# is clearer as then it
> looks more like it's part of the value.

I think keeping the space is better.

The reason is that CTRL_##n pastes together CTRL_ and n, but " "#n is
different:

1) First, it turns n into a string, for example "1"

2) Then, just because there is another string just before, the two are
concatenated, as in "CTRL_" "1".

Paolo


