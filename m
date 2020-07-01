Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77166210380
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 07:57:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqVjW-0003Hz-8v; Wed, 01 Jul 2020 05:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C8Y=AM=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jqVjV-0003Hu-5J
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 05:56:33 +0000
X-Inumbo-ID: 9d3d8bc4-bb5f-11ea-86cd-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9d3d8bc4-bb5f-11ea-86cd-12813bfff9fa;
 Wed, 01 Jul 2020 05:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593582992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9e6pxRlhLqdi/Qte6Z9/WWcMved/5ud2vMwKx50UFk=;
 b=I0SpaZEE2YBLOd6ZL3U0e1vaoWDAsCYEqgXkPCmfsP4hnAzbYduAdJs2kvorodYlh3BaYQ
 h8+0LGIk5nnt4BiaTxfjOyzlC98mx7sGhpSyAZ1FmFbpKB6V08QRp7+OBdHSC9SQTnn6SO
 uCnBMk6J/vqxcMpcQBRDDX/ZMX+cRjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-zcMumqTuPlySm6ML7C6EDw-1; Wed, 01 Jul 2020 01:56:30 -0400
X-MC-Unique: zcMumqTuPlySm6ML7C6EDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B91919067E0;
 Wed,  1 Jul 2020 05:56:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D68E612A5;
 Wed,  1 Jul 2020 05:56:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BD5311384A6; Wed,  1 Jul 2020 07:56:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <20200630150849.GA2110@perard.uk.xensource.com>
Date: Wed, 01 Jul 2020 07:56:24 +0200
In-Reply-To: <20200630150849.GA2110@perard.uk.xensource.com> (Anthony PERARD's
 message of "Tue, 30 Jun 2020 16:08:49 +0100")
Message-ID: <87eepvdbhz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <pdurrant@amazon.com>,
 Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Anthony PERARD <anthony.perard@citrix.com> writes:

> On Wed, Jun 24, 2020 at 01:18:41PM +0100, Paul Durrant wrote:
>> From: Paul Durrant <pdurrant@amazon.com>
>> 
>> The generic pc_machine_initfn() calls pc_system_flash_create() which creates
>> 'system.flash0' and 'system.flash1' devices. These devices are then realized
>> by pc_system_flash_map() which is called from pc_system_firmware_init() which
>> itself is called via pc_memory_init(). The latter however is not called when
>> xen_enable() is true and hence the following assertion fails:
>> 
>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
>> Assertion `dev->realized' failed
>> 
>> These flash devices are unneeded when using Xen so this patch avoids the
>> assertion by simply removing them using pc_system_flash_cleanup_unused().
>> 
>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockdev")
>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>
> I think I would add:
>
> Fixes: dfe8c79c4468 ("qdev: Assert onboard devices all get realized properly")
>
> as this is the first commit where the unrealized flash devices are an
> issue.

They were an issue before, but commit dfe8c79c4468 turned the minor
issue into a crash bug.  No objections.


