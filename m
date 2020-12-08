Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E6F2D28BB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 11:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47297.83745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kma8d-00046m-D7; Tue, 08 Dec 2020 10:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47297.83745; Tue, 08 Dec 2020 10:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kma8d-00046N-9m; Tue, 08 Dec 2020 10:22:31 +0000
Received: by outflank-mailman (input) for mailman id 47297;
 Tue, 08 Dec 2020 10:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CW+N=FM=euphon.net=fam@srs-us1.protection.inumbo.net>)
 id 1kma8Z-00046I-95
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 10:22:29 +0000
Received: from sender2-of-o52.zoho.com.cn (unknown [163.53.93.247])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c8d9297-7e11-45a8-b2e0-83314a3d04eb;
 Tue, 08 Dec 2020 10:22:24 +0000 (UTC)
Received: from localhost (ec2-52-56-101-76.eu-west-2.compute.amazonaws.com
 [52.56.101.76]) by mx.zoho.com.cn
 with SMTPS id 160742293597166.17876928455007;
 Tue, 8 Dec 2020 18:22:15 +0800 (CST)
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
X-Inumbo-ID: 1c8d9297-7e11-45a8-b2e0-83314a3d04eb
ARC-Seal: i=1; a=rsa-sha256; t=1607422937; cv=none; 
	d=zoho.com.cn; s=zohoarc; 
	b=TFiKC+Cw4GY2VxCXzJ3S4rnO1WVzgHC4Kinjk9FF/m+Y+PHDKMxbPbGgl6SpTGi4+fZjFV45YoRPIMeb7zsENmUb+i24hknorBZmNyE4DUg/U/ebUVO5n0eUH7GgOLfpMupJPAUiVOavG/VOlO3UpTVrCRTG0FNQFmMQmrCXyl8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
	t=1607422937; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=E6Gx3CZw78P9pkk42XXrq3hoXi1ADhJ5b/Vp4030ksk=; 
	b=BTpIVA+cx3ZB6Sf2nKgZoiVAW41Byffc1RsJNBTlKjzMtPyXRHc9mxSSdR8190mgIDNHatsXFLKJ/yfkKY+SyxXuOaoFgFgkM5FL5FzIon0wHFHrRzM04DucbzfJWY4+qB5Zm7oZV2e+aLRIwqbGMzGQQGXQKz5GYf5YpXKBFPk=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
	dkim=pass  header.i=euphon.net;
	spf=pass  smtp.mailfrom=fam@euphon.net;
	dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1607422937;
	s=zoho; d=euphon.net; i=fam@euphon.net;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=E6Gx3CZw78P9pkk42XXrq3hoXi1ADhJ5b/Vp4030ksk=;
	b=YM4tzEWX2z1Om9nNP9zJ3+Am8RiYFc5GDQX/k5m42S7vrF8Rva1+2jUOy3fcCnNe
	fBfFjLWJGNhUusJMOmbmjA0gJjlWEnxi8ktawWR2SwRWsURmHgbnNpyMIR6dsVGWZw3
	36d+Z8bxcN+jVB/zyHP6iqK5yAUQRH/NTCtSS/sU=
Date: Tue, 8 Dec 2020 10:22:05 +0000
From: Fam Zheng <fam@euphon.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Bertrand.Marquis@arm.com,
	Kaly.Xin@arm.com, Wei.Chen@arm.com, nd@arm.com,
	Paul Durrant <paul@xen.org>, Penny Zheng <penny.zheng@arm.com>,
	xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [RFC] design: design doc for 1:1 direct-map
Message-ID: <20201208102205.GA118611@dev>
References: <20201208052113.1641514-1-penny.zheng@arm.com>
 <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
 <b53b7ea5-51f2-8746-8d0d-17d2b57ecc89@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b53b7ea5-51f2-8746-8d0d-17d2b57ecc89@suse.com>
X-ZohoCNMailClient: External

On 2020-12-08 10:12, Jan Beulich wrote:
> On 08.12.2020 10:07, Julien Grall wrote:
> > On 08/12/2020 05:21, Penny Zheng wrote:
> >> --- /dev/null
> >> +++ b/docs/designs/1_1_direct-map.md
> >> @@ -0,0 +1,87 @@
> >> +# Preface
> >> +
> >> +The document is an early draft for direct-map memory map
> >> +(`guest physical == physical`) of domUs. And right now, it constrains to ARM
> > 
> > s/constrains/limited/
> > 
> > Aside the interface to the user, you should be able to re-use the same 
> > code on x86. Note that because the memory layout on x86 is fixed (always 
> > starting at 0), you would only be able to have only one direct-mapped 
> > domain.
> 
> Even one seems challenging, if it's truly meant to have all of the
> domain's memory direct-mapped: The use of space in the first Mb is
> different between host and guest.

Speaking about the case of x86, we can still direct-map the ram regions
to the single direct-mapped DomU because neither Xen nor dom0 require
those low mem.

We don't worry about (i.e. don't direct-map) non-ram regions (or any
range that is not reported as usable ram from DomU's PoV (dictated by
e820 table), so those can be MMIO or arbitrary mapping with EPT.

Fam

