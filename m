Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B42A5E0D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 07:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18787.43794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaC7F-00064e-H3; Wed, 04 Nov 2020 06:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18787.43794; Wed, 04 Nov 2020 06:17:53 +0000
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
	id 1kaC7F-00064F-DW; Wed, 04 Nov 2020 06:17:53 +0000
Received: by outflank-mailman (input) for mailman id 18787;
 Wed, 04 Nov 2020 06:17:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gD9+=EK=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kaC7D-000644-3P
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 06:17:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 982dc919-27f7-41b6-9c1f-d9a924cb2002;
 Wed, 04 Nov 2020 06:17:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-2YpDW0klNAusxWLWodXMPg-1; Wed, 04 Nov 2020 01:17:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5825A801FDA;
 Wed,  4 Nov 2020 06:17:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E59F75B4D7;
 Wed,  4 Nov 2020 06:17:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gD9+=EK=redhat.com=thuth@srs-us1.protection.inumbo.net>)
	id 1kaC7D-000644-3P
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 06:17:51 +0000
X-Inumbo-ID: 982dc919-27f7-41b6-9c1f-d9a924cb2002
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 982dc919-27f7-41b6-9c1f-d9a924cb2002;
	Wed, 04 Nov 2020 06:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604470668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfkrGv1aZf1IL5GXKFktkszgcVsO83XbXo4z4Vxwg7M=;
	b=hzDDIW3khQquOZolkNc7Tctr/47KImxvqjYs2Ra9dbZCbd5qv7KjiEoGnBC4wu17d6vwl/
	gMYFGCF5V7jW5IFIlvKsJKnNnvFIF1besSsOVRIYcE/9X8lWuSoGuYJtsfypLHwLciQJog
	z7rGjHaRmP/cbzAPKxnaQxY60T5ciqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-2YpDW0klNAusxWLWodXMPg-1; Wed, 04 Nov 2020 01:17:44 -0500
X-MC-Unique: 2YpDW0klNAusxWLWodXMPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5825A801FDA;
	Wed,  4 Nov 2020 06:17:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E59F75B4D7;
	Wed,  4 Nov 2020 06:17:28 +0000 (UTC)
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Richard Henderson <rth@twiddle.net>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20201103164604.2692357-1-philmd@redhat.com>
 <20201103164604.2692357-3-philmd@redhat.com>
 <20201103165247.GT205187@redhat.com>
 <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com>
 <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
 <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9ac5e985-a701-f357-29fb-ef7975f5f2c2@redhat.com>
Date: Wed, 4 Nov 2020 07:17:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/11/2020 03.27, Stefano Stabellini wrote:
[...]
> Actually I care about Xen and 9pfs support, it is one of the few
> combinations that I use regularly and it is even enabled in the Xilinx
> product I look after. But admittedly I don't test QEMU master as much as
> I should. With the recent changes to the build system it is not very
> suprising that there are some issues. It would be great to have a Xen
> and 9pfs test in the gitlab CI-loop.
> 
> 
> FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 and I
> get:
> 
>   ninja: unknown tool 'query'
> 
> Even after rebuilding ninja master by hand. Any ideas? I don't know much
> about ninja.
> 
> 
> So I gave up on that and I spinned up a Debian Buster x86 container for
> this build. That one got past the "ninja: unknown tool 'query'" error.
> The build completed without problems to the end.
> 
> Either way I can't reproduce the build error above.

Did you run "configure" with "--without-default-devices" ?

 Thomas



