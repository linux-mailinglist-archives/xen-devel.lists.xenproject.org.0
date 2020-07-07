Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB0217724
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 20:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jssiN-0002vL-P6; Tue, 07 Jul 2020 18:53:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om5Q=AS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jssiL-0002vG-Ov
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 18:53:10 +0000
X-Inumbo-ID: 198c9972-c083-11ea-8ddb-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 198c9972-c083-11ea-8ddb-12813bfff9fa;
 Tue, 07 Jul 2020 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594147988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2nrkPBSg7lKn7Db+eLD8ivJZ2CITjUcGCMtuRpONqg=;
 b=JLSRERDek0k6H0w9rdsGErS6artpwUoeEldDgG6ofa68uRqwQIImxaJ8Wu2RI8U500dn1z
 s93+Gne7RCb+ndda5k5fj681/8hKKIWMVDpw1CJSwlTXcZvOds3hna+tiEW71qkjhTmVpW
 9X0sqUOQYr0RZlymtRLiQeLGixfgHus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-Wt_SiSRhOAuuW8c8FQiGcQ-1; Tue, 07 Jul 2020 14:52:53 -0400
X-MC-Unique: Wt_SiSRhOAuuW8c8FQiGcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 297121B18BC7;
 Tue,  7 Jul 2020 18:52:51 +0000 (UTC)
Received: from [10.3.115.46] (ovpn-115-46.phx2.redhat.com [10.3.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A27A73FC5;
 Tue,  7 Jul 2020 18:52:44 +0000 (UTC)
Subject: Re: [PATCH v12 0/8] error: auto propagated local_err part I
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200707165037.1026246-1-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bbfca52b-0732-1242-ca85-59713d125e26@redhat.com>
Date: Tue, 7 Jul 2020 13:52:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, groug@kaod.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/7/20 11:50 AM, Markus Armbruster wrote:
> To speed things up, I'm taking the liberty to respin Vladimir's series
> with my documentation amendments.
> 
> After my documentation work, I'm very much inclined to rename
> ERRP_AUTO_PROPAGATE() to ERRP_GUARD().  The fact that it propagates
> below the hood is detail.  What matters to its users is that it lets
> them use @errp more freely.  Thoughts?

I like it - the shorter name is easier to type.

(The rename is a mechanical change, so if we agree to it, we should do 
it up front to minimize the churn to all the functions where we add use 
of the macro)

> 
> Based-on: Message-Id: <20200707160613.848843-1-armbru@redhat.com>
> 
> Available from my public repository https://repo.or.cz/qemu/armbru.git
> on branch error-auto.
> 
> v12: (based on "[PATCH v4 00/45] Less clumsy error checking")
> 01: Comments merged properly with recent commit "error: Document Error
> API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
> before its helpers, and touch up style.
> 01-08: Commit messages tweaked
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


