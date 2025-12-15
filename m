Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D70ACBE56A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187118.1508537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9l5-0002B6-4h; Mon, 15 Dec 2025 14:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187118.1508537; Mon, 15 Dec 2025 14:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9l5-00028J-1e; Mon, 15 Dec 2025 14:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1187118;
 Mon, 15 Dec 2025 14:41:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vV9l3-00027r-CL
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:41:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vV9l1-00B90L-38;
 Mon, 15 Dec 2025 14:41:04 +0000
Received: from [2a01:cb15:80df:da00:8c91:1441:8140:73df] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vV9l1-00Cvvu-2w;
 Mon, 15 Dec 2025 14:41:04 +0000
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
	bh=JejpsEBmLp12AlNzg72HBm8/yAdsIEbrYfmd9RT0urk=; b=Mz69207VEgClo/HFb+b8/puazJ
	ND355deS5bM8Xgcd/EyXaiDDLLurj7hc8KL+P/jtH+ACW92w2J7ShhBI0TdOAUsGZxaAmW085UwQH
	YzGiCI5WLJAzRXezsxgMPABOKQ8D1Ul6pmDes1wVMKVhWNj/Co/sCQHDlmx2yPbfTfUg=;
Date: Mon, 15 Dec 2025 15:41:02 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and
 newer
Message-ID: <aUAd_r3VN0kTVriG@l14>
References: <20251215135124.11410-1-anthony@xenproject.org>
 <92e6ecac-7a5f-4831-8116-0c34856f1175@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92e6ecac-7a5f-4831-8116-0c34856f1175@suse.com>

On Mon, Dec 15, 2025 at 03:11:53PM +0100, Jan Beulich wrote:
> On 15.12.2025 14:51, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> > 
> > QEMU used to ignore JSON types and do conversion string <-> integer
> > automatically for the command "device_add", but that was removed in
> > QEMU 9.2 (428d1789df91 ("docs/about: Belatedly document tightening of
> > QMP device_add checking")).
> 
> And older qemu accepts integers as well?

As the QEMU document explains about the removed feature is that they
should. We already have two users of `device_add` which use integers for
some arguments. And just to be sure, I've just tested with QEMU 8.0, the
patch works fine.

Cheers,

-- 
Anthony PERARD

