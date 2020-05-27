Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D51E4FC5
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 23:04:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je3D8-00065H-9B; Wed, 27 May 2020 21:03:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TPJL=7J=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1je3D6-00065C-Kg
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 21:03:37 +0000
X-Inumbo-ID: 8794a86a-a05d-11ea-a782-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8794a86a-a05d-11ea-a782-12813bfff9fa;
 Wed, 27 May 2020 21:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590613415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0JRjjU3dgAIrBxPLDRaH5wHrqMTWl6+2G4BcOeSFds=;
 b=NS7bBsUjXRChUOXUpyRuNDVvkLVQ3R7usOZ2WN4GMH2ihYgC8O0Of/1t2JCE1OGXy3l+T4
 bQVBbukhWY45AR8DQStpRXT35wC5RFgV5kQ8WEuQfyuAdtee1xUNEzaUjXlS74+1NQUGVW
 paaDnInQ7+MbCKYEYszMuP5w/pBGmko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-tt9gU6FBNfqvTs1VyXa-Jg-1; Wed, 27 May 2020 17:03:27 -0400
X-MC-Unique: tt9gU6FBNfqvTs1VyXa-Jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AED58005AA;
 Wed, 27 May 2020 21:03:25 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 770ECA1020;
 Wed, 27 May 2020 21:03:14 +0000 (UTC)
Subject: Re: [PATCH v6 4/5] block: make size-related BlockConf properties
 accept size suffixes
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Paul Durrant <paul@xen.org>, Fam Zheng
 <fam@euphon.net>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
 <20200527124511.986099-5-rvkagan@yandex-team.ru>
 <d2ac3549-e63d-d737-41fa-21965c551175@redhat.com>
 <20200527205311.GA373697@rvkaganb.lan>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <367c42ad-69cf-0ed6-1bbf-ed5ea1b0a957@redhat.com>
Date: Wed, 27 May 2020 16:03:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527205311.GA373697@rvkaganb.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/27/20 3:53 PM, Roman Kagan wrote:

>>> ---
>>> v5 -> v6:
>>> - add prop_size32 instead of going with 64bit
>>
>> Would it be worth adding prop_size32 as its own patch, before using it here?
> 
> I've no strong opinion on this.  Should I better split it out when
> respinning?

Patch splitting is an art-form.  But in general, a long series of 
smaller patches each easy to review is going to get accepted into the 
tree faster than a single patch that merges multiple changes into one 
big blob, even if the net diff is identical.  It's rare that someone 
will ask you to merge patches because you split too far, so the real 
tradeoff is whether it will cost you more time to split than what you 
will save the next reviewer (including the maintainer that will merge 
your patches, depending on whether the maintainer also reviews it or 
just trusts my review), if you decide to go with a v7.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


