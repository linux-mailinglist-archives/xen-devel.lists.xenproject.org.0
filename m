Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC31D148E
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrLD-0004Vh-Rh; Wed, 13 May 2020 13:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X9El=63=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jYrLC-0004Vc-Ky
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:22:30 +0000
X-Inumbo-ID: cbeed798-951c-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbeed798-951c-11ea-b9cf-bc764e2007e4;
 Wed, 13 May 2020 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=T4x6RYWHbhsKq1zsNwHEDFVquU4sb5kWaB59Q30E8jQ=; b=uzlch76Eh+Vz6cJYK3xUGEtGnt
 AeBfJ6xUpfh5Y1qrni35T4gXkOsP403XENCLsJhEmt+YL6HnO6RFtYxsIoYJxISo2DUsBwPXpnvML
 zeKcJwIJ7Bk9TLRH4Hw8IoRa6dpHiKMz61Jo/TuSW+KAuF6Rx1KMMSNn5v3sqzGqb77Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jYrLB-0007EQ-TT; Wed, 13 May 2020 13:22:29 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jYrLB-0004L8-J9; Wed, 13 May 2020 13:22:29 +0000
Date: Wed, 13 May 2020 14:22:26 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/libxc: Reduce feature handling complexity in
 xc_cpuid_apply_policy()
Message-ID: <20200513132226.mwpna334sbunbqj4@debian>
References: <20200303182326.16739-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303182326.16739-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 03, 2020 at 06:23:26PM +0000, Andrew Cooper wrote:
> xc_cpuid_apply_policy() is gaining extra parameters to untangle CPUID
> complexity in Xen.  While an improvement in general, it does have the
> unfortunate side effect of duplicating some settings across muliple
> parameters.
> 
> Rearrange the logic to only consider 'pae' if no explicit featureset is
> provided.  This reduces the complexity for callers who have already provided a
> pae setting in the featureset.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

