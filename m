Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6B1BD437
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 07:49:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTfaj-0002yG-TW; Wed, 29 Apr 2020 05:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W7WZ=6N=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jTfai-0002yB-BV
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 05:49:04 +0000
X-Inumbo-ID: 21d71d96-89dd-11ea-b07b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 21d71d96-89dd-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 05:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588139343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmW2vLbhLurlVohyVKvZrq0+70fmkVlDb+QAD99GkFc=;
 b=brVQC9frLlaAG6QwY6mUijxDwYefsAaTa5/GwDQEqmu9LgFWGwtqzGGMlbk9qY/ySQ4iQ1
 JSk7z4Q/1xKhpqtniNvLJgcB37oG1DIfWjdMvqGXPUZES+b5iGXySJmdn43a5tTPwIye9U
 6IXDj5tH4eXGfLxN+30ph8BhM+8noFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-_W6aP5KmPouk2XvqZk6Hpg-1; Wed, 29 Apr 2020 01:49:01 -0400
X-MC-Unique: _W6aP5KmPouk2XvqZk6Hpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F13CD107ACCA;
 Wed, 29 Apr 2020 05:48:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F178F1002395;
 Wed, 29 Apr 2020 05:48:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7520211358BC; Wed, 29 Apr 2020 07:48:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [PATCH 02/11] xen: Fix and improve handling of device_add
 usb-host errors
References: <20200424192027.11404-1-armbru@redhat.com>
 <20200424192027.11404-3-armbru@redhat.com>
 <000501d61c65$2a65af30$7f310d90$@xen.org>
Date: Wed, 29 Apr 2020 07:48:55 +0200
In-Reply-To: <000501d61c65$2a65af30$7f310d90$@xen.org> (Paul Durrant's message
 of "Mon, 27 Apr 2020 08:26:26 +0100")
Message-ID: <87a72ux2ns.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, paul@xen.org,
 qemu-devel@nongnu.org, 'Gerd Hoffmann' <kraxel@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant <xadimgnik@gmail.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: 24 April 2020 20:20
>> To: qemu-devel@nongnu.org
>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony=
.perard@citrix.com>; Paul
>> Durrant <paul@xen.org>; Gerd Hoffmann <kraxel@redhat.com>; xen-devel@lis=
ts.xenproject.org
>> Subject: [PATCH 02/11] xen: Fix and improve handling of device_add usb-h=
ost errors
>>=20
>> usbback_portid_add() leaks the error when qdev_device_add() fails.
>> Fix that.  While there, use the error to improve the error message.
>>=20
>> The qemu_opts_from_qdict() similarly leaks on failure.  But any
>> failure there is a programming error.  Pass &error_abort.
>>=20
>> Fixes: 816ac92ef769f9ffc534e49a1bb6177bddce7aa2
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: Paul Durrant <paul@xen.org>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: xen-devel@lists.xenproject.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/usb/xen-usb.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
>> index 961190d0f7..42643c3390 100644
>> --- a/hw/usb/xen-usb.c
>> +++ b/hw/usb/xen-usb.c
>> @@ -30,6 +30,7 @@
>>  #include "hw/usb.h"
>>  #include "hw/xen/xen-legacy-backend.h"
>>  #include "monitor/qdev.h"
>> +#include "qapi/error.h"
>>  #include "qapi/qmp/qdict.h"
>>  #include "qapi/qmp/qstring.h"
>>=20
>> @@ -755,13 +756,15 @@ static void usbback_portid_add(struct usbback_info=
 *usbif, unsigned port,
>>      qdict_put_int(qdict, "port", port);
>>      qdict_put_int(qdict, "hostbus", atoi(busid));
>>      qdict_put_str(qdict, "hostport", portname);
>> -    opts =3D qemu_opts_from_qdict(qemu_find_opts("device"), qdict, &loc=
al_err);
>> -    if (local_err) {
>> -        goto err;
>> -    }
>> +    opts =3D qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
>> +                                &error_abort);
>>      usbif->ports[port - 1].dev =3D USB_DEVICE(qdev_device_add(opts, &lo=
cal_err));
>>      if (!usbif->ports[port - 1].dev) {
>> -        goto err;
>> +        qobject_unref(qdict);
>> +        xen_pv_printf(&usbif->xendev, 0,
>> +                      "device %s could not be opened: %s\n",
>> +                      busid, error_get_pretty(local_err));
>> +        error_free(local_err);
>
> Previously the goto caused the function to bail out. Should there not be =
a 'return' here?

Owww, of course.  Thanks!

>
>>      }
>>      qobject_unref(qdict);
>>      speed =3D usbif->ports[port - 1].dev->speed;
>> @@ -793,11 +796,6 @@ static void usbback_portid_add(struct usbback_info =
*usbif, unsigned port,
>>      usbback_hotplug_enq(usbif, port);
>>=20
>>      TR_BUS(&usbif->xendev, "port %d attached\n", port);
>> -    return;
>> -
>> -err:
>> -    qobject_unref(qdict);
>> -    xen_pv_printf(&usbif->xendev, 0, "device %s could not be opened\n",=
 busid);
>>  }
>>=20
>>  static void usbback_process_port(struct usbback_info *usbif, unsigned p=
ort)
>> --
>> 2.21.1


