Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421539C4EB
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jun 2021 04:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137079.253971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpLbc-0004KC-7Z; Sat, 05 Jun 2021 02:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137079.253971; Sat, 05 Jun 2021 02:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpLbc-0004Hq-3R; Sat, 05 Jun 2021 02:00:08 +0000
Received: by outflank-mailman (input) for mailman id 137079;
 Sat, 05 Jun 2021 02:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LGE=K7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lpLba-00048o-O9
 for xen-devel@lists.xenproject.org; Sat, 05 Jun 2021 02:00:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6db06b23-1e67-4b3f-80f1-27af43058998;
 Sat, 05 Jun 2021 02:00:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA69C613C9;
 Sat,  5 Jun 2021 02:00:03 +0000 (UTC)
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
X-Inumbo-ID: 6db06b23-1e67-4b3f-80f1-27af43058998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622858404;
	bh=LQsSiJJo1OkBDgdCb85Krfo9Ty542hu8hhJJaHwiC1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KFiB2IrIPHR/WHSeKRvQKNRso/H/JiOqJCZk0XwazaELAAdvgmWGdwL23EYU8XJMk
	 rdFEPzOD3pIlcGMhBEO8vOCQE3gzunYpGVQ/Mb90030rQmqtueia7m10BZ/v87mbkt
	 vYRTBrXSBnYnvfTKUstXd8ahaDK9lbzge9NfqKcYB3meldhbXFQDrktTM3adeXLbKI
	 yvjomaM0QZMoV1D//h7KHyIrkMZFtDlVzTG5HsiiB6D7VJ9z0eoJVaCXb6kT9S4O8j
	 dg/gDothKXuOMY1TVrDpSzlNhBix2CwM+f5Rc2uNMjgDlnRv3PH4+fztcVARER/zpl
	 3aoNIfNgAkWsg==
Date: Fri, 4 Jun 2021 19:00:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    nd <nd@arm.com>
Subject: RE: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
In-Reply-To: <VE1PR08MB52151410985CD8E5C577F797F73B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2106041416120.7272@sstabellini-ThinkPad-T480s>
References: <20210518052113.725808-1-penny.zheng@arm.com> <20210518052113.725808-2-penny.zheng@arm.com> <e1b90f06-92d2-11da-c556-4081907124b8@xen.org> <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com> <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com> <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org> <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com> <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s> <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com> <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
 <VE1PR08MB52151410985CD8E5C577F797F73B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jun 2021, Penny Zheng wrote:
> > > > In system device tree we would use a property called "memory" to
> > > > specify one or more ranges, e.g.:
> > > >
> > > >     domU1 {
> > > >         memory = <0x0 0x500000 0x0 0x7fb00000>;
> > > >
> > > > Unfortunately for xen,domains we have already defined "memory" to
> > > > specify an amount, rather than a range. That's too bad because the
> > > > most natural way to do this would be:
> > > >
> > > >     domU1 {
> > > >         size = <amount>;
> > > >         memory = <ranges>;
> > > >
> > > > When we'll introduce native system device tree support in Xen we'll
> > > > be able to do that. For now, we need to come up with a different property.
> > > > For instance: "static-memory" (other names are welcome if you have a
> > > > better suggestion).
> > > >
> > > > We use a new property called "static-memory" together with
> > > > #static-memory-address-cells and #static-memory-size-cells to define
> > > > how many cells to use for address and size.
> > > >
> > > > Example:
> > > >
> > > >     domU1 {
> > > >         #static-memory-address-cells = <2>;
> > > >         #static-memory-size-cells = <2>;
> > > >         static-memory = <0x0 0x500000 0x0 0x7fb00000>;
> > >
> > > This is pretty similar to what Penny suggested. But I dislike it
> > > because of the amount of code that needs to be duplicated with the
> > > reserved memory.
> > 
> > Where is the code duplication? In the parsing itself?
> > 
> > If there is code duplication, can we find a way to share some of the code to
> > avoid the duplication?
> 
> Both your opinions are so convincing... :/
> 
> Correct me if I am wrong:
> I think the duplication which Julien means are here, See commit 
> https://patchew.org/Xen/20210518052113.725808-1-penny.zheng@arm.com/20210518052113.725808-3-penny.zheng@arm.com/
> I added a another similar loop in dt_unreserved_regions to unreserve static memory.
> For this part, I could try to extract common codes.
> 
> But another part I think is just this commit, where I added another check for static memory
> in early_scan_node:
> 
> +    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem", NULL) )
> +        process_static_memory(fdt, node, "xen,static-mem", address_cells,
> +                              size_cells, &bootinfo.static_mem);
> 
> TBH, I don't know how to fix here....

Is it only one loop in dt_unreserved_regions and another call to
process_static_memory? If you can make the code common in
dt_unreserved_regions there wouldn't be much duplication left.


To explain my point of view a bit better, I think we have a lot more
freedom in the Xen implementation compared to the device tree
specification. For the sake of an example, let's say that we wanted Xen
to reuse bootinfo.reserved_mem for both reserved-memory and
static-memory. I don't know if it is even a good idea (I haven't looked
into it, it is just an example) but I think it would be OK, we could
decide to do that.

We have less room for flexibility in the device tree specification.
/reserved-memory is for special configurations of 1 domain only. I don't
think we could add domain static memory allocations to it.

