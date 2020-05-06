Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74541C7140
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 15:01:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWJfJ-0000El-Oy; Wed, 06 May 2020 13:00:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jP1D=6U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jWJfI-0000Ee-Fj
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 13:00:44 +0000
X-Inumbo-ID: 987ce40a-8f99-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987ce40a-8f99-11ea-9887-bc764e2007e4;
 Wed, 06 May 2020 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=5Qt1IN0amKd3IMVto1s7SIFtL7Lw/I28kzlL/23oAc8=; b=Z51/CjEBZNHsLnpUAVYZStz08c
 683Kq79KmfdhjtiEBTD5/IjGtehwro6uUXBofNfKKX/BAO5vvEB+TgHClKVus3tuj8bg+KvhXTee3
 yAoSl5kPJoptTQr5TvEVG2Bjx3dDJLjE3sW2rYd8G5mGsi+k/mEXVcl6Q+RMq07JhBwM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jWJfE-0004ha-Ki; Wed, 06 May 2020 13:00:40 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jWJfE-0005cV-BW; Wed, 06 May 2020 13:00:40 +0000
Date: Wed, 6 May 2020 14:00:37 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v17 2/2] xen/tools: VM forking toolstack side
Message-ID: <20200506130037.mklkimsaetmzqu6h@debian>
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <e416eac0c986fd1aba5f576d9b065a6f47660b2c.1587655725.git.tamas.lengyel@intel.com>
 <CABfawhnxoQbehu-bvT7Uhd808rsjjDsB87O=CKqHDsrBUvur-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhnxoQbehu-bvT7Uhd808rsjjDsB87O=CKqHDsrBUvur-g@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 01, 2020 at 07:59:45AM -0600, Tamas K Lengyel wrote:
> On Thu, Apr 23, 2020 at 9:33 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
> >
> > Add necessary bits to implement "xl fork-vm" commands. The command allows the
> > user to specify how to launch the device model allowing for a late-launch model
> > in which the user can execute the fork without the device model and decide to
> > only later launch it.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> 
> Patch ping. If nothing else at least the libxc parts would be nice to
> get merged before the freeze.

Changes to libxc looks good to me.

Please split it out to a patch with proper commit message.

Wei.

