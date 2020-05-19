Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B301D8ECC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 06:36:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jatxl-0007Ev-7z; Tue, 19 May 2020 04:34:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLjJ=7B=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jatxk-0007Eq-F3
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 04:34:44 +0000
X-Inumbo-ID: 0f89a566-998a-11ea-9887-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0f89a566-998a-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 04:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589862883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfnN/w0SbYD3vSZtzIfW4lXKbb9M26zh5YzR9hzaFVI=;
 b=Dm6LnZnKoT4it72L2nKFzS9246GrP1xPPv6gQkBCTZmNoPQ+qTIxbOw2uXybnYpztaY+qR
 2pJMwnjSRJg4aqBgvxbU0uKTjyQl5jJ97oqJFo6YehDMpSH3F70aAh8TxkQCsVZkl0GbyV
 e1witRVGlsCGFxhoUFUY7EMstvMP9JE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-m6FuIhfxMOmghIZJQdusCw-1; Tue, 19 May 2020 00:34:31 -0400
X-MC-Unique: m6FuIhfxMOmghIZJQdusCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63A6A0BD7;
 Tue, 19 May 2020 04:34:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F5E19C4F;
 Tue, 19 May 2020 04:34:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FD6311358BC; Tue, 19 May 2020 06:34:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
 <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
Date: Tue, 19 May 2020 06:34:19 +0200
In-Reply-To: <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 18 May 2020 15:21:52 +0200")
Message-ID: <87k1187dbo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 5/18/20 3:17 PM, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> On 15/05/20 07:58, Markus Armbruster wrote:
>>>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>>>
>>>>> Remove unnecessary casts using coccinelle scripts.
>>>>>
>>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>>> Queued, thanks!
>>>>
>>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>>> one, and I don't normally queue QOM patches :)
>>>>
>>>
>>> I want to be again a QOM maintainer, but it's not the best time for me
>>> to be one.  So thanks for picking up my slack.
>>=20
>> You're welcome :)
>
> Could you help me getting this patch merged ? :)
>
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.16486=
1-1-clg@kaod.org/

I have more QOM patches in the pipe, and I may well post another QOM
pull request while Paolo is busy with other stuff.  I'll consider
including other QOM patches then.  Non-trivial ones need an R-by from
Paolo, Daniel or Eduardo.


