Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84292A152A
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 11:27:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16872.41657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYo5P-00076L-M4; Sat, 31 Oct 2020 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16872.41657; Sat, 31 Oct 2020 10:26:15 +0000
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
	id 1kYo5P-00075y-Hr; Sat, 31 Oct 2020 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 16872;
 Sat, 31 Oct 2020 10:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oje=EG=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kYo5N-00075t-NC
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 10:26:13 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b255c8fa-b45d-42ee-b2cc-eb89d1d7b7b9;
 Sat, 31 Oct 2020 10:26:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-wXYXgx6kPluWjqn1NuvjQA-1; Sat, 31 Oct 2020 06:26:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16178185A0D9;
 Sat, 31 Oct 2020 10:26:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-43.ams2.redhat.com [10.36.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD415D9CD;
 Sat, 31 Oct 2020 10:25:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8Oje=EG=redhat.com=thuth@srs-us1.protection.inumbo.net>)
	id 1kYo5N-00075t-NC
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 10:26:13 +0000
X-Inumbo-ID: b255c8fa-b45d-42ee-b2cc-eb89d1d7b7b9
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id b255c8fa-b45d-42ee-b2cc-eb89d1d7b7b9;
	Sat, 31 Oct 2020 10:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604139972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdHtLe8ZJwHLhY7rbWm1s6LRofKbM9RJROIfuVVS938=;
	b=edAb03zqLgiYU8PhTDB664oRZqdAsfR1y0PjyBKswfX4WQutQFlOSWlPGMVzWHIkW6wIOt
	86Nj0eZ9TWyjBwz38pt8d0NgZnNJ5WIi4CjkjXg1wkSBlkvfmoMao7zknnRUu1IEGSCeq2
	Nj9mE/NaIkKZuFDyotlhMDin6/NDNos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-wXYXgx6kPluWjqn1NuvjQA-1; Sat, 31 Oct 2020 06:26:11 -0400
X-MC-Unique: wXYXgx6kPluWjqn1NuvjQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16178185A0D9;
	Sat, 31 Oct 2020 10:26:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD415D9CD;
	Sat, 31 Oct 2020 10:25:54 +0000 (UTC)
Subject: Re: --enable-xen on gitlab CI? (was Re: [PATCH 09/36] qdev: Make
 qdev_get_prop_ptr() get Object* arg)
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Qemu-s390x list <qemu-s390x@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-10-ehabkost@redhat.com>
 <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
 <20201030113516.GP5733@habkost.net>
 <7645972e-5cad-6511-b057-bd595b91c4aa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e35c50b6-e795-d901-61e4-4879c5eadd61@redhat.com>
Date: Sat, 31 Oct 2020 11:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7645972e-5cad-6511-b057-bd595b91c4aa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/10/2020 18.13, Paolo Bonzini wrote:
> On 30/10/20 12:35, Eduardo Habkost wrote:
>>
>> What is necessary to make sure we have a CONFIG_XEN=y job in
>> gitlab CI?  Maybe just including xen-devel in some of the
>> container images is enough?
> 
> Fedora already has it, but build-system-fedora does not include
> x86_64-softmmu.

Eduardo, could you try to add xen-devel to the centos8 container? If that
does not work, we can still move the x86_64-softmmu target to the fedora
pipeline instead.

 Thomas



