Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E757E2D29B6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 12:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47358.83838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmb6F-0001wL-Ql; Tue, 08 Dec 2020 11:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47358.83838; Tue, 08 Dec 2020 11:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmb6F-0001vw-NT; Tue, 08 Dec 2020 11:24:07 +0000
Received: by outflank-mailman (input) for mailman id 47358;
 Tue, 08 Dec 2020 11:24:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CW+N=FM=euphon.net=fam@srs-us1.protection.inumbo.net>)
 id 1kmb6C-0001vr-Hc
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 11:24:06 +0000
Received: from sender2-of-o52.zoho.com.cn (unknown [163.53.93.247])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a03a1fcd-5ccb-4c70-ab26-8d554934213f;
 Tue, 08 Dec 2020 11:24:01 +0000 (UTC)
Received: from freeip.amazon.com (54.239.6.186 [54.239.6.186]) by
 mx.zoho.com.cn with SMTPS id 1607426632344594.6343788567094;
 Tue, 8 Dec 2020 19:23:52 +0800 (CST)
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
X-Inumbo-ID: a03a1fcd-5ccb-4c70-ab26-8d554934213f
ARC-Seal: i=1; a=rsa-sha256; t=1607426635; cv=none; 
	d=zoho.com.cn; s=zohoarc; 
	b=VNfiMeLzy3SgXCtOR7yczQs1cHlee/laXPOCDvB+3b0J8Wmsc2J57BPOueD/fnZPtyH9hqhoAN0eRzXdmGrQVWkFNPoFV4YBJenZJjXipZF+OyT0FvLKfm7F9cAka1Wv8kEr6oik43/N5YUftY+QbrKWmZR9/PMQaXcFNa6aycw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
	t=1607426635; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1iOZu/bWRMc27o2XpZheBxvCkC5w68WGiu3hg1+B8lQ=; 
	b=b4xLFSTjd7Hhus4LQFiY1pThbEQwpUafIZYwqOm0ETjqZBaUeGV2sUUIFNzAEzjpC2C4okPTLy9QsWYQ9SQQIj7pqogGWFy9u2mQ5HGo2C5SA8DHrl8A5sljcJk9DYBpOScx/uUneoIh2WM2sLnPeBPCGAx7H3/akm2V0rhdmiA=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
	dkim=pass  header.i=euphon.net;
	spf=pass  smtp.mailfrom=fam@euphon.net;
	dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1607426635;
	s=zoho; d=euphon.net; i=fam@euphon.net;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:Mime-Version:Content-Transfer-Encoding;
	bh=1iOZu/bWRMc27o2XpZheBxvCkC5w68WGiu3hg1+B8lQ=;
	b=hRz/YgNiFsAFVdV5YwO+EetSfpjOIWK6mEsuzb49i9Yj0+gAySetG9zleRInL/TS
	HaKGQRZ9zE0klc16g2dvExNjof+H09tMRrNNb4TGzKtr3wwiSqOkLqiF2m7OekJa6iJ
	jxaDB+FrzM2ZM/uaTpUcah+uDKdVybXBOApAIaD8=
Message-ID: <dc240dfed0c6bb4810a936ac307aedf0c2ee6892.camel@euphon.net>
Subject: Re: [RFC] design: design doc for 1:1 direct-map
From: Fam Zheng <fam@euphon.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Bertrand.Marquis@arm.com,
 Kaly.Xin@arm.com,  Wei.Chen@arm.com, nd@arm.com, Paul Durrant
 <paul@xen.org>, Penny Zheng <penny.zheng@arm.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
Date: Tue, 08 Dec 2020 11:23:44 +0000
In-Reply-To: <2c7e96e1-9a34-4a9d-2a8f-7479d46f1a92@suse.com>
References: <20201208052113.1641514-1-penny.zheng@arm.com>
	 <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
	 <b53b7ea5-51f2-8746-8d0d-17d2b57ecc89@suse.com>
	 <20201208102205.GA118611@dev>
	 <2c7e96e1-9a34-4a9d-2a8f-7479d46f1a92@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-ZohoCNMailClient: External

On Tue, 2020-12-08 at 11:53 +0100, Jan Beulich wrote:
> On 08.12.2020 11:22, Fam Zheng wrote:
> > On 2020-12-08 10:12, Jan Beulich wrote:
> > > On 08.12.2020 10:07, Julien Grall wrote:
> > > > On 08/12/2020 05:21, Penny Zheng wrote:
> > > > > --- /dev/null
> > > > > +++ b/docs/designs/1_1_direct-map.md
> > > > > @@ -0,0 +1,87 @@
> > > > > +# Preface
> > > > > +
> > > > > +The document is an early draft for direct-map memory map
> > > > > +(`guest physical == physical`) of domUs. And right now, it
> > > > > constrains to ARM
> > > > 
> > > > s/constrains/limited/
> > > > 
> > > > Aside the interface to the user, you should be able to re-use
> > > > the same 
> > > > code on x86. Note that because the memory layout on x86 is
> > > > fixed (always 
> > > > starting at 0), you would only be able to have only one direct-
> > > > mapped 
> > > > domain.
> > > 
> > > Even one seems challenging, if it's truly meant to have all of
> > > the
> > > domain's memory direct-mapped: The use of space in the first Mb
> > > is
> > > different between host and guest.
> > 
> > Speaking about the case of x86, we can still direct-map the ram
> > regions
> > to the single direct-mapped DomU because neither Xen nor dom0
> > require
> > those low mem.
> > 
> > We don't worry about (i.e. don't direct-map) non-ram regions (or
> > any
> > range that is not reported as usable ram from DomU's PoV (dictated
> > by
> > e820 table), so those can be MMIO or arbitrary mapping with EPT.
> 
> For one, the very first page is considered special in x86 Xen. No
> guest should gain access to MFN 0, unless you first audit all
> code and address all the issues you find. And then there's also
> Xen's low-memory trampoline living there. Plus besides the BDA
> (at real-mode address 0040:0000) I suppose the EBDA also shouldn't
> be exposed to a guest, nor anything else that the host finds
> reserved in E820. IOW it would be the host E820 to dictate some
> of the guest E820 in such a case.
> 

You're right about the trampoline area, it has to be specially taken
care of. Not a problem if we could disable cpu hotplug. I don't think
the guest will ever try to DMA from/to MFN 0, BDA or EBDA, so even not
direct mapping those should not make any functional difference.

In general, I agree the guest E820 as well as all direct mapping areas
mustn't break out of host E820 limitation, otherwise it will not work.

Fam


