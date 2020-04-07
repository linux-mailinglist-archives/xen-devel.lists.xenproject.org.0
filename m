Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D91A068C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 07:28:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLglf-0003pW-I7; Tue, 07 Apr 2020 05:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NSkr=5X=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jLgld-0003pR-Kk
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 05:27:21 +0000
X-Inumbo-ID: 73551709-7890-11ea-806f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 73551709-7890-11ea-806f-12813bfff9fa;
 Tue, 07 Apr 2020 05:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586237239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5fGOb894axs0XJifkvixqa9caiiR06E1mZ3Cl7g6RL0=;
 b=MPGsUvg+5CPu+3cenDoNG8AUhrwKyEgvrT9r7gP11wY9/uyBDA+DB2Ms75JT9m25HOlKX8
 PG9wzZPLdb/lRQD9IqjT0bgNkZZOdcFKYG+Xo5/h8h2SGa1X7I5d+phM3mbLoDFqIi/tp3
 qd/gROWYxCj7uS/4TRsJ0nsOu75Ui3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-08nPnoCOPy27oa8vmU-_wg-1; Tue, 07 Apr 2020 01:27:17 -0400
X-MC-Unique: 08nPnoCOPy27oa8vmU-_wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5852800D50;
 Tue,  7 Apr 2020 05:27:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FED15C1BB;
 Tue,  7 Apr 2020 05:27:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E3E9811385C8; Tue,  7 Apr 2020 07:27:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-5.0] xen-block: Fix uninitialized variable
References: <20200406164207.1446817-1-anthony.perard@citrix.com>
 <325e0ffb-2f1b-cbfd-6b24-0d912a9aabe2@redhat.com>
 <20200406171637.GU4088@perard.uk.xensource.com>
Date: Tue, 07 Apr 2020 07:27:13 +0200
In-Reply-To: <20200406171637.GU4088@perard.uk.xensource.com> (Anthony PERARD's
 message of "Mon, 6 Apr 2020 18:16:37 +0100")
Message-ID: <87imibzwzy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Anthony PERARD <anthony.perard@citrix.com> writes:

> On Mon, Apr 06, 2020 at 06:50:41PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 4/6/20 6:42 PM, Anthony PERARD wrote:
>> > Since 7f5d9b206d1e ("object-add: don't create return value if
>> > failed"), qmp_object_add() don't write any value in 'ret_data', thus
>> > has random data. Then qobject_unref() fails and abort().
>> >=20
>> > Fix by initialising 'ret_data' properly.
>>=20
>> Or move qobject_unref() after the error check?
>>=20
>> -- >8 --
>> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
>> index 07bb32e22b..f3f1cbef65 100644
>> --- a/hw/block/xen-block.c
>> +++ b/hw/block/xen-block.c
>> @@ -869,7 +869,6 @@ static XenBlockIOThread *xen_block_iothread_create(c=
onst
>> char *id,
>>      qdict_put_str(opts, "id", id);
>>      qmp_object_add(opts, &ret_data, &local_err);
>>      qobject_unref(opts);
>> -    qobject_unref(ret_data);
>>=20
>>      if (local_err) {
>>          error_propagate(errp, local_err);
>> @@ -878,6 +877,7 @@ static XenBlockIOThread *xen_block_iothread_create(c=
onst
>> char *id,
>>          g_free(iothread);
>>          return NULL;
>>      }
>> +    qobject_unref(ret_data);
>
> That won't help, qmp_object_add() doesn't change the value of ret_data
> at all. The other users of qmp_object_add() passes an initialised
> 'ret_data', so we should do the same I think.

Since the QMP core does it, other callers should do it, too.

For QAPI commands that don't return anything, the marshaller should not
use @ret_data, let alone store through it.  qmp_object_add() complies.
Thus, assert(!ret_data) would do.  qobject_unref(ret_data) is also
correct.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


