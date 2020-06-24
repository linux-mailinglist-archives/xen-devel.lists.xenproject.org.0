Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91839207B05
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 19:57:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo9dy-00072A-1i; Wed, 24 Jun 2020 17:57:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUge=AF=redhat.com=dgilbert@srs-us1.protection.inumbo.net>)
 id 1jo9dw-000723-Nz
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 17:57:04 +0000
X-Inumbo-ID: 1bca9e30-b644-11ea-8117-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1bca9e30-b644-11ea-8117-12813bfff9fa;
 Wed, 24 Jun 2020 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593021422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PEjyCUyE3sWVZkGYeKg9uWZfDhdSTHNNM4bGtfd+Xg4=;
 b=agotZ85QLqSCJ/gvIcYNGyJI3gaLcXC1uiZTRNXtgwHsyEvUfE797knzrK6gh4NQfmdXd/
 Y/eJYvz60PmimnR75qsd4mt6Qo8JZzoxCTpiKQhkfO46OHIWABjIeixX8wbuJTodJcpQ9P
 axEpQN55meAbXjqmY+c5bI+bSCEtU2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-DH3F2a6MOI6snMh9HIjN3A-1; Wed, 24 Jun 2020 13:56:58 -0400
X-MC-Unique: DH3F2a6MOI6snMh9HIjN3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11116800C64;
 Wed, 24 Jun 2020 17:56:57 +0000 (UTC)
Received: from work-vm (ovpn-112-192.ams2.redhat.com [10.36.112.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C03715C557;
 Wed, 24 Jun 2020 17:56:55 +0000 (UTC)
Date: Wed, 24 Jun 2020 18:56:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: Migration vmdesc and xen-save-devices-state
Message-ID: <20200624175653.GA49433@work-vm>
References: <CAKf6xptNySqXOHAZJiiBq=h99GBQcS8Cbzmpyqzy-ucxX8Od2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xptNySqXOHAZJiiBq=h99GBQcS8Cbzmpyqzy-ucxX8Od2Q@mail.gmail.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, QEMU <qemu-devel@nongnu.org>,
 zhang.zhanghailiang@huawei.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

* Jason Andryuk (jandryuk@gmail.com) wrote:
> Hi,
> 
> At some point, QEMU changed to add a json VM description (vmdesc)
> after the migration data.  The vmdesc is not needed to restore the
> migration data, but qemu_loadvm_state() will read and discard the
> vmdesc to clear the stream when should_send_vmdesc() is true.

About 5 years ago :-)

> xen-save-devices-state generates its migration data without a vmdesc.
> xen-load-devices-state in turn calls qemu_loadvm_state() which tries
> to load vmdesc since should_send_vmdesc is true for xen.  When
> restoring from a file, this is fine since it'll return EOF, print
> "Expected vmdescription section, but got 0" and end the restore
> successfully.
> 
> Linux stubdoms load their migration data over a console, so they don't
> hit the EOF and end up waiting.  There does seem to be a timeout
> though and restore continues after a delay, but we'd like to eliminate
> the delay.
> 
> Two options to address this are to either:
> 1) set suppress_vmdesc for the Xen machines to bypass the
> should_send_vmdesc() check.
> or
> 2) just send the vmdesc data.
> 
> Since vmdesc is just discarded, maybe #1 should be followed.

#1 does sound simple!

> If going with #2, qemu_save_device_state() needs to generate the
> vmdesc data.  Looking at qemu_save_device_state() and
> qemu_savevm_state_complete_precopy_non_iterable(), they are both very
> similar and could seemingly be merged.  qmp_xen_save_devices_state()
> could even leverage the bdrv_inactivate_all() call in
> qemu_savevm_state_complete_precopy_non_iterable().
> 
> The would make qemu_save_device_state a little more heavywight, which
> could impact COLO.  I'm not sure how performance sensitive the COLO
> code is, and I haven't measured anything.

COLO snapshots are potentially quite sensitive; although we've got a
load of other things we could do with speeding up, we could do without
making them noticably heavier.

Dave

> Does anyone have thoughts or opinions on the subject?
> 
> Thanks,
> Jason
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


