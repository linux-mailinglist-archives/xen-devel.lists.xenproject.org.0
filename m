Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F5A1CABD4
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 14:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2PV-00037r-P0; Fri, 08 May 2020 12:47:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4FLg=6W=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jX2PT-00037l-EX
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 12:47:23 +0000
X-Inumbo-ID: 0fe4b810-912a-11ea-ae69-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0fe4b810-912a-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588942042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsnozb6kIQGYwomOyBKftMgcGklRNkmQU34LmQ0rQgU=;
 b=ai7F2GO2OT2lWJ7rMgsugh4SNiaiYrGBG4mwVEVXpm/Mf375CDa//61e6Hvc1/xmWxGm+S
 Y82K/K5Ey7tSgsVaQQnVoQiqRodbSSUndbnypRNUmbAv80G5OuVa/GZYSaGPZRKp+BWYxs
 S0NWMkJ2LNvt/6Q+am+8cdkqo7UhMmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-xHC9BoC8MPSLoyVaICWZKA-1; Fri, 08 May 2020 08:47:17 -0400
X-MC-Unique: xHC9BoC8MPSLoyVaICWZKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 541CB107ACF2;
 Fri,  8 May 2020 12:47:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60BF76ACF1;
 Fri,  8 May 2020 12:47:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D67E811358BC; Fri,  8 May 2020 14:47:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 3/3] hw: Remove unnecessary DEVICE() cast
References: <20200504100735.10269-1-f4bug@amsat.org>
 <20200504100735.10269-4-f4bug@amsat.org>
Date: Fri, 08 May 2020 14:47:04 +0200
In-Reply-To: <20200504100735.10269-4-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 May 2020 12:07:35
 +0200")
Message-ID: <87r1vuy4on.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The DEVICE() macro is defined as:
>
>   #define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
>
> which expands to:
>
>   ((DeviceState *)object_dynamic_cast_assert((Object *)(obj), (name),
>                                              __FILE__, __LINE__,
>                                              __func__))
>
> This assertion can only fail when @obj points to something other
> than its stated type, i.e. when we're in undefined behavior country.
>
> Remove the unnecessary DEVICE() casts when we already know the
> pointer is of DeviceState type.
>
> Patch created mechanically using spatch with this script:
>
>   @@
>   typedef DeviceState;
>   DeviceState *s;
>   @@
>   -   DEVICE(s)
>   +   s
>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Paul Durrant <paul@xen.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Lovely.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Now repeat this exercise for each QOM type cast macro :)


