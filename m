Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF075B24DC6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 17:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080062.1440699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umDcq-00061s-Hq; Wed, 13 Aug 2025 15:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080062.1440699; Wed, 13 Aug 2025 15:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umDcq-0005zx-F9; Wed, 13 Aug 2025 15:42:52 +0000
Received: by outflank-mailman (input) for mailman id 1080062;
 Wed, 13 Aug 2025 15:42:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1umDcp-0005zr-C7
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 15:42:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umDco-003Q38-1h;
 Wed, 13 Aug 2025 15:42:50 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umDco-002Z8Q-1U;
 Wed, 13 Aug 2025 15:42:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=WBHbdU9yu+Kf1roDgEwDVokKcjGDiNuFr0S0qRaAhGI=; b=J9h7ou7uF9e9fM7rrNehUeWZt9
	Asgk8iVLKXs0CoA+KUoZT2G6pBDLaii7ONFZCYVhKqq31fYlciDZ2Gd1u56E7H/s333xQn3fzUd8E
	e8q1hq2BEDl6R+K8YmhUPAyQoP3JLuBM2urV7DFKKGMW26dmYePdzaTq44dD1MQ+gYK0=;
Date: Wed, 13 Aug 2025 17:42:48 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 04/11] tools/configure: Introduce deps on json-c lib
 for libxl
Message-ID: <aJyyeAjtIDslRrAx@l14>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-5-anthony@xenproject.org>
 <5de6ae46-8398-46ab-b79a-df45358c5c30@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de6ae46-8398-46ab-b79a-df45358c5c30@citrix.com>

On Mon, Aug 11, 2025 at 11:48:19AM +0100, Andrew Cooper wrote:
> On 08/08/2025 3:55 pm, Anthony PERARD wrote:
> >  xl: $(XL_OBJS)
> > -	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) -lyajl $(APPEND_LDFLAGS)
> > +	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(YAJL_LIBS) $(LIBJSONC_LIBS) $(APPEND_LDFLAGS)
> >  
> >  .PHONY: install
> >  install: all
> 
> Specifying both isn't entirely great when one is supposed to be empty.
> 
> Could we not have XEN_JSON_LIB(s) which is set to either $YAJL_LIBS or
> $LIBJSONC_LIBS as appropriate?

Yes, that sounds good.

Thanks,

-- 
Anthony PERARD

