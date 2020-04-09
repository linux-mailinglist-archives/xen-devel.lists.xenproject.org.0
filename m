Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A301A35DB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:28:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYAL-00048K-L1; Thu, 09 Apr 2020 14:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMYAK-00048B-5o
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:28:24 +0000
X-Inumbo-ID: 5e2c2c2e-7a6e-11ea-82d8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e2c2c2e-7a6e-11ea-82d8-12813bfff9fa;
 Thu, 09 Apr 2020 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=88CLnI9d7vqlxpuj08ZyNiGa+C1+B5g5kceeRwldYQw=; b=po8LC+iHiziy3E2x/Sb34Szt44
 iStb7gSnx4kP/LR9uZ+C2vryyP6l98PNHg54l8mzGKJORo1GC7Dl6jHR3cTCFKvbnJZY72/dZhAR4
 w8fdyOBDM8fhMhaDd4yJNPaUl23wnaPUU6iM0ZN92lVm/ppPnP/rGK4KXDrHgdMMLsPk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYAC-0007As-PA; Thu, 09 Apr 2020 14:28:16 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYAC-00041C-Ep; Thu, 09 Apr 2020 14:28:16 +0000
Date: Thu, 9 Apr 2020 15:28:13 +0100
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Use of VM_IOREMAP in xenbus
Message-ID: <20200409142813.lbxembj7b63b2wmi@debian>
References: <20200409061846.GA30241@lst.de>
 <8074b77d-d784-95ee-8d47-069827855876@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8074b77d-d784-95ee-8d47-069827855876@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, "Durrant, Paul" <pdurrant@amazon.com>,
 linux-kernel@vger.kernel.org, Bob Liu <bob.liu@oracle.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Christoph

On Thu, Apr 09, 2020 at 08:37:48AM +0200, Jürgen Groß wrote:
> Adjusting recipient list (dropping David, new mail addresses for Wei and
> Paul).
> 
> On 09.04.20 08:18, Christoph Hellwig wrote:
> > Hi Wei,
> > 
> > commit ccc9d90a9a8b5 ("xenbus_client: Extend interface to support
> > multi-page ring") addes a use of vmap in what is now
> > xenbus_map_ring_valloc_hvm, and uses the VM_IOREMAP flag that is
> > only really intended for implementing ioremap.  Do you remember
> > what the reason is that this flag was used?
> > 

I don't remember the reason. I can that flag can be dropped per your
reasoning.

Wei.

> 
> Juergen

