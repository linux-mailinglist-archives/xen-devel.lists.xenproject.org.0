Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4C1F3958
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:16:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicEQ-0004Id-FI; Tue, 09 Jun 2020 11:15:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jicEP-0004IW-B1
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:15:49 +0000
X-Inumbo-ID: 92214dfa-aa42-11ea-b30b-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 92214dfa-aa42-11ea-b30b-12813bfff9fa;
 Tue, 09 Jun 2020 11:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
 b=JJB858Ex+ar4t6OYqUOG8dIuN/ryP69vCitFuSaHmsc/c+VA2x6Dz7JTGS3yb5lnkQMX71
 ueeHq4bVDa0ZUNu8n4wV6aLFy+iH3zATFVd6ln+FA9/jPEqq6PIfCgcsO3pxBcotBBttIW
 vLWMvlPI4VSoymLsrpgaOpmSfRWsX3M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-pYM4QUlQM9O0vSyXGqVRwQ-1; Tue, 09 Jun 2020 07:15:47 -0400
X-MC-Unique: pYM4QUlQM9O0vSyXGqVRwQ-1
Received: by mail-wr1-f70.google.com with SMTP id p9so8495810wrx.10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
 b=r/TWXHcdSqutNO8HYJz+vYviZ6K5cT1tvYnYxBOr7md52fVaxps0DstvUEYa5VVm28
 4xkIXmJNdA4Ir0HC/fbuFBuedQg+ixXZ3ivl0CVT/B/2wdwW90iY/DLCLWKsY/nB5nZ0
 JCEE1YXBQ7yndK2WjA7RvRbEEg4FtTHqVxl86bxgk7Z97YvwbBh7EO4UMWfe+DAzN8lg
 NqaJ94Y9DjzHmTC5L7Upyfpd6ULxCojHzxK91CKexqd33VWIrck5+QLekjFxKe+4NWGc
 sb4PGHB1kSaWfuH3pirKL9aTi3S5NdY2ivmNq47q0pDD0aUx6lrBuBHH5e+krTdzIGBV
 GBMQ==
X-Gm-Message-State: AOAM53121SrqlJLJSPvU3OBu+tS7zvDDgqGlDMMnafR4lXajkvKcFPyV
 5fRedNAtk0ruunEDH4/jQuR/VrrjBUjJsaOQpP/jtO6ZvFxY/ylJ7tE1HaeBTYgk1W5BCTWWMcP
 SOgoi3mA7xLyiIgdFzboO/GE7XeA=
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3651924wru.427.1591701286135; 
 Tue, 09 Jun 2020 04:14:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuPbVlBDSLtlTXx3ZWJ2E6euzR9/JzXQUGOR/hYo9mA/3HQUZQnicNKOucsXO2NrypVrU/9w==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3651896wru.427.1591701285907; 
 Tue, 09 Jun 2020 04:14:45 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id f9sm3121051wrf.74.2020.06.09.04.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:14:45 -0700 (PDT)
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200608160044.15531-1-philmd@redhat.com>
 <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
 <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea1a0932-aecf-3e88-1444-2f5ca369cc67@redhat.com>
Date: Tue, 9 Jun 2020 13:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/06/20 18:17, Philippe Mathieu-Daudé wrote:
> On 6/8/20 6:14 PM, Peter Maydell wrote:
>> On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> Based on today's IRC chat, this is a trivial RFC series
>>> to anotate pre-qdev/QOM devices so developers using them
>>> without knowing they are not QOM'ified yet can realize
>>> it and convert them if they have time.
>>
>> What mechanism did you use for identifying non-QOM devices?
> 
> I don't think this is the complete list, this is only all the one I
> could find with:
> 
>   $ git grep "g_new|g_malloc" hw/
> 
> Then on each match I manually reviewed (so I might have incorrectly
> flagged code too).

Yes, you did, but I guess for an RFC it was a good bang for the buck.  I
went through the patch and noticed both a few false positives and a
couple blatant violations in recent code.

Paolo


