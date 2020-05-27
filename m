Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB501E42E2
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 15:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvi9-0002rG-UU; Wed, 27 May 2020 13:03:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Hki=7J=redhat.com=fweimer@srs-us1.protection.inumbo.net>)
 id 1jdvi8-0002rB-Hl
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 13:03:08 +0000
X-Inumbo-ID: 68fd1f60-a01a-11ea-9947-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 68fd1f60-a01a-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590584587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=oy0V2qQifVRxyl3hnuRXtetKes4TGaiAhxy8832yoas=;
 b=XYrGYTz2e4jmKUSiAK9jElMI1dgb4uDJ5Bdic9uHARTUdIYiEeZGZPHajDPg8SckayNqNu
 spZwhiNa6HAQeTMkYys74SlloaZ1ACCZMsSQOfdEQbWBLV+DkzHrOo0eCSQ3LXDJR0KdKx
 ZNgkSymDzwoMeCVdBo3VETu6fuVGn1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-tGzjnUSgMNe2-8nuD3ru8Q-1; Wed, 27 May 2020 09:03:04 -0400
X-MC-Unique: tGzjnUSgMNe2-8nuD3ru8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEE0D460;
 Wed, 27 May 2020 13:03:03 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-106.ams2.redhat.com
 [10.36.113.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3622760C05;
 Wed, 27 May 2020 13:03:03 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: xen-devel@lists.xenproject.org
Subject: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
Date: Wed, 27 May 2020 15:03:01 +0200
Message-ID: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: libc-alpha@sourceware.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I'm about to remove nosegneg support from upstream glibc, special builds
that use -mno-tls-direct-seg-refs, and the ability load different
libraries built in this mode automatically, when the Linux kernel tells
us to do that.  I think the intended effect is that these special builds
do not use operands of the form %gs:(%eax) when %eax has the MSB set
because that had a performance hit with paravirtualization on 32-bit
x86.  Instead, the thread pointer is first loaded from %gs:0, and the
actual access does not use a segment prefix.

Before doing that, I'd like to ask if anybody is still using this
feature?

I know that we've been carrying nosegneg libraries for many years, in
some cases even after we stopped shipping 32-bit kernels. 8-/ The
feature has always been rather poorly documented, and the way the
dynamic loader selects those nosegneg library variants is still very
bizarre.

Thanks,
Florian


