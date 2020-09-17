Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38E26D509
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 09:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIodo-0000DU-Rq; Thu, 17 Sep 2020 07:47:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O8d7=C2=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1kIodn-0000DO-45
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 07:47:39 +0000
X-Inumbo-ID: b5b9e735-232b-4b95-b17a-1b28d0d3b4f9
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b5b9e735-232b-4b95-b17a-1b28d0d3b4f9;
 Thu, 17 Sep 2020 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600328857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1lurTq5n5TI0TwpvZGZbnQLRV2vILXZ/Cw0++RY9UM=;
 b=PMa0ZiHevVHt5DUxdhMyS8ng0zK00M0Cf8QjIPd5HcFgXgv8NHcdg9uBkbxcrkgalzSm7F
 hZmXrkGHuv9PqAXNPdnwoYjy8e0EWn2l5Dtz6pYAGcQev+uqoauK2yoT0U+2v/WOvTeJqg
 za6FergIB5Y4bGGFiZQ99igXZLbbUEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-723UZI3VOhWnD206aaQuRA-1; Thu, 17 Sep 2020 03:47:33 -0400
X-MC-Unique: 723UZI3VOhWnD206aaQuRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9371084C96;
 Thu, 17 Sep 2020 07:47:28 +0000 (UTC)
Received: from gondolin (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C694C5DEBF;
 Thu, 17 Sep 2020 07:46:59 +0000 (UTC)
Date: Thu, 17 Sep 2020 09:46:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Thomas Huth
 <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <f4bug@amsat.org>, Alistair Francis
 <alistair@alistair23.me>, David Hildenbrand <david@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Fam Zheng
 <fam@euphon.net>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Igor Mammedov
 <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, Richard
 Henderson <rth@twiddle.net>, Michael Rolnik <mrolnik@gmail.com>, Sarah
 Harris <S.E.Harris@kent.ac.uk>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, Aleksandar
 Markovic <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Anthony Green
 <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
Message-ID: <20200917094657.392c341d.cohuck@redhat.com>
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 16 Sep 2020 14:25:17 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> One of the goals of having less boilerplate on QOM declarations
> is to avoid human error.  Requiring an extra argument that is
> never used is an opportunity for mistakes.
> 
> Remove the unused argument from OBJECT_DECLARE_TYPE and
> OBJECT_DECLARE_SIMPLE_TYPE.
> 
> Coccinelle patch used to convert all users of the macros:
> 
>   @@
>   declarer name OBJECT_DECLARE_TYPE;
>   identifier InstanceType, ClassType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_TYPE(InstanceType, ClassType,
>   -                    lowercase,
>                        UPPERCASE);
> 
>   @@
>   declarer name OBJECT_DECLARE_SIMPLE_TYPE;
>   identifier InstanceType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_SIMPLE_TYPE(InstanceType,
>   -                    lowercase,
>                        UPPERCASE);
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Cornelia Huck <cohuck@redhat.com>


