Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0E31CAC18
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 14:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2S3-0003SU-79; Fri, 08 May 2020 12:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4FLg=6W=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jX2S2-0003N1-Jy
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 12:50:02 +0000
X-Inumbo-ID: 6e7bca80-912a-11ea-9887-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6e7bca80-912a-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588942201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mr4uqpTXg1sXYxmIwAO3pDUOz2ZcsDiSAVP7r/LI/bA=;
 b=NG2sgFXCVisgjvMMA+Mrl5ZJ9QmVS8CKnuUifi5RQgxfQ7hhA+EYmgaWJHvlw6lWtnJzGr
 qdooTjjn+MBVzKFZv/4X/b6ckO+7zoMou7K9+p1CzTIr9APTxK939BlRjka89s79lX3jK9
 7HCyrTOintJAiG85/FqUcWkaaGWuKMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-4YAIeqf8OaueleRfKAlSYA-1; Fri, 08 May 2020 08:50:00 -0400
X-MC-Unique: 4YAIeqf8OaueleRfKAlSYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABB70800688;
 Fri,  8 May 2020 12:49:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 500E85D9CA;
 Fri,  8 May 2020 12:49:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E80F711358BC; Fri,  8 May 2020 14:49:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 2/3] various: Remove unnecessary OBJECT() cast
References: <20200504100735.10269-1-f4bug@amsat.org>
 <20200504100735.10269-3-f4bug@amsat.org>
Date: Fri, 08 May 2020 14:49:48 +0200
In-Reply-To: <20200504100735.10269-3-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 May 2020 12:07:34
 +0200")
Message-ID: <87mu6iy4k3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Corey Minyard <cminyard@mvista.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The OBJECT() macro is defined as:
>
>   #define OBJECT(obj) ((Object *)(obj))
>
> which expands to:
>
>   ((Object *)object_dynamic_cast_assert((Object *)(obj), (name),
>                                         __FILE__, __LINE__, __func__))

Nope :)

> This assertion can only fail when @obj points to something other
> than its stated type, i.e. when we're in undefined behavior country.

There is no assertion.

> Remove the unnecessary OBJECT() casts when we already know the
> pointer is of Object type.
>
> Patch created mechanically using spatch with this script:
>
>   @@
>   typedef Object;
>   Object *o;
>   @@
>   -   OBJECT(o)
>   +   o
>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Reword (Markus)

My rewording suggestion applied to PATCH 3, not to this one.

With v2's commit message;
Reviewed-by: Markus Armbruster <armbru@redhat.com>


