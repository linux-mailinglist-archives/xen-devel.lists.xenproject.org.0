Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8312A0438
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 12:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15698.38784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYSgx-000053-Bb; Fri, 30 Oct 2020 11:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15698.38784; Fri, 30 Oct 2020 11:35:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYSgx-0008WH-86; Fri, 30 Oct 2020 11:35:35 +0000
Received: by outflank-mailman (input) for mailman id 15698;
 Fri, 30 Oct 2020 11:35:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToGC=EF=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kYSgv-0008W6-Gv
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:35:33 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9572f6e5-3ad5-4e26-8678-060d743e8873;
 Fri, 30 Oct 2020 11:35:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-sRWFeep6MQO_UT9sgJT2kA-1; Fri, 30 Oct 2020 07:35:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7781805F02;
 Fri, 30 Oct 2020 11:35:28 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AD9555785;
 Fri, 30 Oct 2020 11:35:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ToGC=EF=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
	id 1kYSgv-0008W6-Gv
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:35:33 +0000
X-Inumbo-ID: 9572f6e5-3ad5-4e26-8678-060d743e8873
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 9572f6e5-3ad5-4e26-8678-060d743e8873;
	Fri, 30 Oct 2020 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604057732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXJ5yBCLZhaWw7FjwvS2z0av/pFVm25MD3/1mjWwAwA=;
	b=Gj4+MWXv4yuKsbSqs1PX3WtK5B6bR2BeHeRmlCIb1+jhgBjdI+El/HhDLdQ9dHv49XpiIX
	chelCa+XfdkRrO8+jjMlqE1Tf3FFAdW+E/RoR2Jy7FQQZvXtKJv1rD4OLpr9xa4O+2UpVZ
	QwnEp5N8YSweHYdtQySPT5ms9FrFMxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-sRWFeep6MQO_UT9sgJT2kA-1; Fri, 30 Oct 2020 07:35:31 -0400
X-MC-Unique: sRWFeep6MQO_UT9sgJT2kA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7781805F02;
	Fri, 30 Oct 2020 11:35:28 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AD9555785;
	Fri, 30 Oct 2020 11:35:17 +0000 (UTC)
Date: Fri, 30 Oct 2020 07:35:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	QEMU <qemu-devel@nongnu.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: --enable-xen on gitlab CI? (was Re: [PATCH 09/36] qdev: Make
 qdev_get_prop_ptr() get Object* arg)
Message-ID: <20201030113516.GP5733@habkost.net>
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-10-ehabkost@redhat.com>
 <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 30, 2020 at 11:29:25AM +0400, Marc-André Lureau wrote:
> On Fri, Oct 30, 2020 at 2:07 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Make the code more generic and not specific to TYPE_DEVICE.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >
> 
> Nice cleanup!, but fails to build atm
> 
> ../hw/block/xen-block.c:403:9: error: ‘dev’ undeclared (first use in this
> function); did you mean ‘vdev’?
>   403 |     if (dev->realized) {

Thanks for catching it!

What is necessary to make sure we have a CONFIG_XEN=y job in
gitlab CI?  Maybe just including xen-devel in some of the
container images is enough?

-- 
Eduardo


