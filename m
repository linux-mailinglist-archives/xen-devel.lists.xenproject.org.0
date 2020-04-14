Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7101A7989
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:32:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJnc-0003VF-77; Tue, 14 Apr 2020 11:32:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WDKb=56=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jOJna-0003VA-Q9
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:32:14 +0000
X-Inumbo-ID: 9693f65e-7e43-11ea-83d8-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9693f65e-7e43-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 11:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586863933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYr/KkW0QKxRMJqYT/HOwSxpZUuq1t2YsKc/mTSrfYk=;
 b=XAWn5qMpSMcXQnMjSRSqUL6fuB47VcoPM6wdz3wJAPwY2+Tu7DbueIcrxSWX4CdL+VrTek
 EaKYRxrPBMWqnipsjb0v7hmpEBZZL7zywdrEnJkLSwy2+06Vg41SrvQ88XBy2qmEfRX6Q0
 Olw5y4AVhVN91JP44tj+IUlD4c+YRpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-9sDNE59FPAeERBjNn-43JQ-1; Tue, 14 Apr 2020 07:32:11 -0400
X-MC-Unique: 9sDNE59FPAeERBjNn-43JQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08406107BA97;
 Tue, 14 Apr 2020 11:32:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BCC15D9E2;
 Tue, 14 Apr 2020 11:32:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5AB011385C8; Tue, 14 Apr 2020 13:31:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 3/3] hw: Remove unnecessary DEVICE() cast
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-4-f4bug@amsat.org>
Date: Tue, 14 Apr 2020 13:31:59 +0200
In-Reply-To: <20200412210954.32313-4-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 12 Apr 2020 23:09:54
 +0200")
Message-ID: <87lfmytia8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
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
> Remove unnecessary DEVICE() casts.
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
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

DEVICE(obj) expands to

    OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)

and then to

    ((DeviceState *)object_dynamic_cast_assert((Object *)(obj), (name),
                                               __FILE__, __LINE__, __func__=
))

object_dynamic_cast_assert() asserts @obj can be safely converted to the
type named by @name, and returns @obj.

Your patch drops the assertion.

The assertion can only fail when @obj points to something other than its
stated type, i.e. when we're in undefined behavior country.

Preferably with this argument worked into your commit message:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

There are many similar macros.  Should they get the same treatment?


