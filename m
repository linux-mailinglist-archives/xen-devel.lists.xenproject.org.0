Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391B71D78CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 14:41:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaf4G-0003tr-9K; Mon, 18 May 2020 12:40:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jhae=7A=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jaf4D-0003tm-Vx
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 12:40:26 +0000
X-Inumbo-ID: bec9eeae-9904-11ea-9887-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bec9eeae-9904-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589805624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
 b=JIzX4Y+JHwnWAANpaRL40qOMaQIwDS9SlSeYUJGM2t3zZom0XZ1WZbmtim5aa0ixvB1uyX
 XY1r5EAdkm76hieKhtEhL8/CSqvLnIe1Lf33Lnkcx9ook0Vmaa5r4i3gHPsB9VXgHbjOBD
 EZ/kphXoFNcBxvt2xlA/FbJqG0XnrEs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-BWVRANwpMj-VI7nOZRJV2g-1; Mon, 18 May 2020 08:40:22 -0400
X-MC-Unique: BWVRANwpMj-VI7nOZRJV2g-1
Received: by mail-wr1-f71.google.com with SMTP id e14so5595770wrv.11
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 05:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
 b=ZKteEQ2kxz/MVr6JyQbPi+7cPjcditk0JtWoz2EhN0qhhDRcWwY1D7RvdS6dM0kf2H
 j8ZgjJBmhrpGWQJCgwsH+DTIi7cQzMiWMuW2khGLqv61rN7T0DL6u0TADWNLHfqIuMdd
 aDq7XUMjlcgMbHLdGDjgcOSDolyC4m/7bdmVFmX+IPXVEocGnl8x3dnggxOFWCwkgUHO
 ghTJM3u1qRqgI/H7WPUZSzcR9z7oRaSUB6VXE3/U5yczQRx6dw0PE3TZJwh5xJ9qwCYl
 yk5aJwYmVp29ah0GOgQZN6EOMhrf+UdbuxqhfeNE+20yiJZ4e2xcMcLFMqXLFuioOhrp
 41xA==
X-Gm-Message-State: AOAM532tH4OuLWBwZ8PrpF5m7ocpWJTulHfU8dMD4yDpdzFjPq4KXJwI
 25oG8hLJxB0OREO1MtzeNSeOYUTLicU9KyLs9qohRJSW3cgyzVTP+ImUR3TprLuGlFyLy7G81Vo
 2lxLmjqeCbndl6KaFdqySvYNNlJA=
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr19378250wrq.171.1589805621609; 
 Mon, 18 May 2020 05:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCAR79q1r/u+ElQ0DSvEZICk9eI3J0VHulHSHUS5E92yAv0i/D3GvHsxNo7k5eyzb/9Bk8AA==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr19378219wrq.171.1589805621356; 
 Mon, 18 May 2020 05:40:21 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.90.67])
 by smtp.gmail.com with ESMTPSA id q74sm17336275wme.14.2020.05.18.05.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 05:40:20 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
Date: Mon, 18 May 2020 14:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <871rnlsps6.fsf@dusky.pond.sub.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/05/20 07:58, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Remove unnecessary casts using coccinelle scripts.
>>
>> The CPU()/OBJECT() patches don't introduce logical change,
>> The DEVICE() one removes various OBJECT_CHECK() calls.
> Queued, thanks!
> 
> Managing expecations: I'm not a QOM maintainer, I don't want to become
> one, and I don't normally queue QOM patches :)
> 

I want to be again a QOM maintainer, but it's not the best time for me
to be one.  So thanks for picking up my slack.

Paolo


