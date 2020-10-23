Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98220296A13
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 09:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10735.28620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVrD4-0004n9-88; Fri, 23 Oct 2020 07:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10735.28620; Fri, 23 Oct 2020 07:09:58 +0000
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
	id 1kVrD4-0004mk-4U; Fri, 23 Oct 2020 07:09:58 +0000
Received: by outflank-mailman (input) for mailman id 10735;
 Fri, 23 Oct 2020 07:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8WB0=D6=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1kVrD1-0004mf-SU
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 07:09:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 21626c04-6746-4d8c-901d-3e474dfe8c16;
 Fri, 23 Oct 2020 07:09:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-XE4oO9EOOLucvtmUytKZRQ-1; Fri, 23 Oct 2020 03:09:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5EB7425F6;
 Fri, 23 Oct 2020 07:09:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-123.ams2.redhat.com [10.36.112.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328A760C04;
 Fri, 23 Oct 2020 07:09:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8WB0=D6=redhat.com=thuth@srs-us1.protection.inumbo.net>)
	id 1kVrD1-0004mf-SU
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 07:09:55 +0000
X-Inumbo-ID: 21626c04-6746-4d8c-901d-3e474dfe8c16
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 21626c04-6746-4d8c-901d-3e474dfe8c16;
	Fri, 23 Oct 2020 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603436994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEF8a+t6dhaHnwPQStTb7j17q3j6NEA7UkQplxtsOTw=;
	b=dD7wUJNkgPjWhEmlzeXAq2epluMt0IW9hpUjASxKC6yuWXIhpPOOZFXHjwvbcn1mwvxkE1
	cIoIFgtScyWlTF+lmme8K1YzAUxVbfRmc4+3kQPyIadYR8WJ24ULFXSppnRidlGSNRK5GO
	va0fvrbaBBTbadKTfcFbBiyOMVi9vQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-XE4oO9EOOLucvtmUytKZRQ-1; Fri, 23 Oct 2020 03:09:53 -0400
X-MC-Unique: XE4oO9EOOLucvtmUytKZRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5EB7425F6;
	Fri, 23 Oct 2020 07:09:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-123.ams2.redhat.com [10.36.112.123])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 328A760C04;
	Fri, 23 Oct 2020 07:09:48 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] Add Xen CpusAccel
To: Paolo Bonzini <pbonzini@redhat.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 QEMU <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20201013140511.5681-1-jandryuk@gmail.com>
 <ddb5c9c2-c206-28d6-2d9d-7954e7022c23@redhat.com>
 <CAKf6xpvpuG1jVdf3+heXzHFd_kc5kVHYdJgC+8iazFLciqOMZw@mail.gmail.com>
 <d9f23eee-c0af-d2dd-9b9d-f0255fc8e3d1@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1927b32e-7919-5061-0285-d9c7184d0bae@redhat.com>
Date: Fri, 23 Oct 2020 09:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d9f23eee-c0af-d2dd-9b9d-f0255fc8e3d1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/10/2020 17.29, Paolo Bonzini wrote:
> On 22/10/20 17:17, Jason Andryuk wrote:
>> On Tue, Oct 13, 2020 at 1:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 13/10/20 16:05, Jason Andryuk wrote:
>>>> Xen was left behind when CpusAccel became mandatory and fails the assert
>>>> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
>>>> Move the qtest cpu functions to a common location and reuse them for
>>>> Xen.
>>>>
>>>> v2:
>>>>   New patch "accel: Remove _WIN32 ifdef from qtest-cpus.c"
>>>>   Use accel/dummy-cpus.c for filename
>>>>   Put prototype in include/sysemu/cpus.h
>>>>
>>>> Jason Andryuk (3):
>>>>   accel: Remove _WIN32 ifdef from qtest-cpus.c
>>>>   accel: move qtest CpusAccel functions to a common location
>>>>   accel: Add xen CpusAccel using dummy-cpus
>>>>
>>>>  accel/{qtest/qtest-cpus.c => dummy-cpus.c} | 27 ++++------------------
>>>>  accel/meson.build                          |  8 +++++++
>>>>  accel/qtest/meson.build                    |  1 -
>>>>  accel/qtest/qtest-cpus.h                   | 17 --------------
>>>>  accel/qtest/qtest.c                        |  5 +++-
>>>>  accel/xen/xen-all.c                        |  8 +++++++
>>>>  include/sysemu/cpus.h                      |  3 +++
>>>>  7 files changed, 27 insertions(+), 42 deletions(-)
>>>>  rename accel/{qtest/qtest-cpus.c => dummy-cpus.c} (71%)
>>>>  delete mode 100644 accel/qtest/qtest-cpus.h
>>>>
>>>
>>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Thank you, Paolo.  Also Anthony Acked and Claudio Reviewed patch 3.
>> How can we get this into the tree?
> 
> I think Anthony should send a pull request?

Since Anthony acked patch 3, I think I can also take it through the qtest tree.

 Thomas



