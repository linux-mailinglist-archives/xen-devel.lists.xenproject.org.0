Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B7B14D86
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 14:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062598.1428307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjFh-0006H8-Kq; Tue, 29 Jul 2025 12:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062598.1428307; Tue, 29 Jul 2025 12:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjFh-0006Em-IH; Tue, 29 Jul 2025 12:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1062598;
 Tue, 29 Jul 2025 12:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NrXi=2K=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1ugjFg-0006Ef-2Z
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:16:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13c4d7c-6c75-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 14:16:13 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-214-Y5_RWBEgNdiWutH50DJmuw-1; Tue,
 29 Jul 2025 08:16:07 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F82918002B2; Tue, 29 Jul 2025 12:16:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C2A3E18003FC; Tue, 29 Jul 2025 12:16:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1971221E6A27; Tue, 29 Jul 2025 14:16:02 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d13c4d7c-6c75-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753791372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYQNJTCIjaqgIf0WG029oeIURdgJtQpqR14Z9B6FwXo=;
	b=VlMfkCcF6Aso2hFyPWp5rkwa7/FfUPXZZHLsiB3+65CDwBn2Ilk/yG6xWVoB/9buRSp04f
	IOLB0nPUatJRy+6vf2zHdprA3eXMoG9ubt+QFGOkK6VxYpqLUOsApwRjDXkPESgj4TazRJ
	4aGRo9K9CGPETZUzTI+mCKjbxo5bhzg=
X-MC-Unique: Y5_RWBEgNdiWutH50DJmuw-1
X-Mimecast-MFC-AGG-ID: Y5_RWBEgNdiWutH50DJmuw_1753791366
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  sstabellini@kernel.org,  anthony@xenproject.org,
  paul@xen.org,  edgar.iglesias@gmail.com,  xen-devel@lists.xenproject.org,
  qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
In-Reply-To: <14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 29 Jul 2025 13:26:02
 +0200")
References: <20250729111226.3627499-1-armbru@redhat.com>
	<14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org>
Date: Tue, 29 Jul 2025 14:16:02 +0200
Message-ID: <87v7nbdwfx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 29/7/25 13:12, Markus Armbruster wrote:
>> xenfb_mouse_event() has a switch statement whose controlling
>> expression move->axis is an enum InputAxis.  The enum values are
>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>> case for both axes.  In addition, it has an unreachable default label.
>> This convinces Coverity that move->axis can be greater than 1.  It
>> duly reports a buffer overrun when it is used to subscript an array
>> with two elements.
>> Replace the unreachable code by abort().
>> Resolves: Coverity CID 1613906
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/display/xenfb.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
>> index 22822fecea..5e6c691779 100644
>> --- a/hw/display/xenfb.c
>> +++ b/hw/display/xenfb.c
>> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, Qemu=
Console *src,
>>                   scale =3D surface_height(surface) - 1;
>>                   break;
>>               default:
>> -                scale =3D 0x8000;
>> -                break;
>> +                abort();
>
> We prefer GLib g_assert_not_reached() over abort() because it displays
> the file, line number & function before aborting.

The purpose of this line is to tell the compiler we can't get there,
with the least amount of ceremony.

We have ~600 calls of abort().

Whoever merges this: feel free to replace by g_assert_not_reached().

>>               }
>>               xenfb->axis[move->axis] =3D move->value * scale / 0x7fff;
>>           }


