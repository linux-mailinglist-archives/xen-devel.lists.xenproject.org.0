Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA01A3678
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 17:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYg0-0008F8-CC; Thu, 09 Apr 2020 15:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMYfz-0008F3-3D
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 15:01:07 +0000
X-Inumbo-ID: efc1e85a-7a72-11ea-82e5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efc1e85a-7a72-11ea-82e5-12813bfff9fa;
 Thu, 09 Apr 2020 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=kL/5SKsbj68QSQOVj/aONby2Tnq7faYx2YAo5fYxhag=; b=XZF3tADBEDCd4V5U6HbLiBVriZ
 n8d+N8/ecufOkD1kjtGVD3cBUT8/fRJXNht4BfFp3jhOKwl0IVl1z1kljIcWOdN6XC1giodJyi7xr
 pmkRvcpJDuYBsCUC6lnw6t63WB4fUlr+BAeBqYXakcbQw6yNZ6Rxs+BcpatpoNr1Cj+M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYfw-0007rg-4t; Thu, 09 Apr 2020 15:01:04 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYfv-0006ct-RZ; Thu, 09 Apr 2020 15:01:04 +0000
Date: Thu, 9 Apr 2020 16:01:01 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] tools/xl: Remove the filelock when building VM if
 autoballooning is off
Message-ID: <20200409150101.f76ebwucffuagcr7@debian>
References: <20190311103622.20143-1-isaikin-dmitry@yandex.ru>
 <24204.42515.354583.921270@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24204.42515.354583.921270@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 05:10:59PM +0100, Ian Jackson wrote:
> Dmitry Isaykin writes ("[PATCH] tools/xl: Remove the filelock when building VM if autoballooning is off"):
> > The presence of this filelock does not allow building several VMs at the same
> > time. This filelock was added to prevent other xl instances from using memory
> > freeed for the currently building VM in autoballoon mode.
> > 
> > Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> This was deferred due to the Xen 4.13 freeze.  I found it in a todo
> list of mine.  I think it should be committed and I will do so soon
> unless someone objects.
> 
> Sorry for the delay, Dmitry!
> 

I applied a reconstructed version of this patch -- the version I got
from lore.k.o doesn't apply cleanly.

Wei.

