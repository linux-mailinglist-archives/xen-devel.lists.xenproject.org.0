Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8FE1A2F14
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 08:19:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMQWa-0002m9-Tv; Thu, 09 Apr 2020 06:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NeOZ=5Z=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1jMQWZ-0002m4-6p
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 06:18:51 +0000
X-Inumbo-ID: f93bf2e8-7a29-11ea-8290-12813bfff9fa
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f93bf2e8-7a29-11ea-8290-12813bfff9fa;
 Thu, 09 Apr 2020 06:18:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7A3A668C4E; Thu,  9 Apr 2020 08:18:46 +0200 (CEST)
Date: Thu, 9 Apr 2020 08:18:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Use of VM_IOREMAP in xenbus
Message-ID: <20200409061846.GA30241@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 Bob Liu <bob.liu@oracle.com>, Paul Durrant <paul.durrant@citrix.com>,
 David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Wei,

commit ccc9d90a9a8b5 ("xenbus_client: Extend interface to support
multi-page ring") addes a use of vmap in what is now
xenbus_map_ring_valloc_hvm, and uses the VM_IOREMAP flag that is
only really intended for implementing ioremap.  Do you remember
what the reason is that this flag was used?


