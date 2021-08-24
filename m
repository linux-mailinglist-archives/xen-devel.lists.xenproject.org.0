Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B23F6157
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171576.313079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIY6K-00061l-To; Tue, 24 Aug 2021 15:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171576.313079; Tue, 24 Aug 2021 15:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIY6K-0005z6-Q0; Tue, 24 Aug 2021 15:12:32 +0000
Received: by outflank-mailman (input) for mailman id 171576;
 Tue, 24 Aug 2021 15:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIY6I-0005z0-Vl
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:12:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2e52ada-04ed-11ec-a8e4-12813bfff9fa;
 Tue, 24 Aug 2021 15:12:30 +0000 (UTC)
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
X-Inumbo-ID: b2e52ada-04ed-11ec-a8e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629817949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=INYkUn0KSHG+msM87a4spnFC4o1QiAJTP0ed3Qcu2To=;
  b=OiqEB2ReeZGoSZmXO0Xa0R/09tL0QvDDObuv7BP/I2dCzyBkwY8Wjsk9
   CxjqsIsa0yoE2k8Q4v9WfPHRG/DnAuhSz4AD2JZRUG5c7B+SITlop9AM7
   vDdodhuVDIncdwSy0qJxAySGIrC9BNrbh40CF0hFfXaMJoVgsrPcrUiOC
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c6Zq0P2Ve4+9EXyKLtGztq2myGlhfANiQpGNZAqLhUQLFZSD59J40DDxgDMSMR6Rd3kUQL14JQ
 SbQ6bl+g5Ce8bd4SAQjGj8k9mQVbGHOpQlnsC2eIO6sPuRj0nP9kPG1E1rGk4WyASZjiiV3kxF
 ATNoKdItYC2uSQd71ed7cHHgZ7NJZe0V+u5g3nk/LJYvs+juK1eCjTyvSqCyxCJxXhPt2OP1d6
 m4HMd2hpUzNY5elOLxR1jkIwM4E3Fw/2ADRRTs3x02WsiOFHcBMDEyoXziq/cpHNjsC0pp0OJ+
 4IefCrM3La+GvEnO5+XNcLyi
X-SBRS: 5.1
X-MesageID: 50797165
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:amhi0aGXFjLRI1u6pLqEiceALOsnbusQ8zAXPidKOH9omxej9/
 xG88536faZslgssQ8b9exoUZPoKRi3yXcf2+gs1NmZMzXbhA==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50797165"
Date: Tue, 24 Aug 2021 16:12:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v7 12/51] build: avoid building arm/arm/*/head.o twice
Message-ID: <YSUMWqAKtsbeTV3Z@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-13-anthony.perard@citrix.com>
 <3152a1d5-3185-1d9c-8949-39015c73bbe4@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3152a1d5-3185-1d9c-8949-39015c73bbe4@xen.org>

On Tue, Aug 24, 2021 at 01:53:11PM +0100, Julien Grall wrote:
> Hi Anthony,
> 
> On 24/08/2021 11:49, Anthony PERARD wrote:
> > head.o is been built twice, once because it is in $(ALL_OBJS) and a
> > second time because it is in $(extra-y) and thus it is rebuilt when
> > building "arch/arm/built_in.o".
> > 
> > Fix this by adding a dependency of "head.o" on the directory
> > "arch/arm/".
> > 
> > Also, we should avoid building object that are in subdirectories, so
> > move the declaration in there. This doesn't change anything as
> > "arch/arm/built_in.o" depends on "arch/arm/$subarch/built_in.o" which
> > depends on $(extra-y), so we still need to depend on
> > "arch/arm/built_in.o".
> 
> head.o as to be right at the beginning of the binary. Will this still be
> guaranteed with this change?

I guess what you want to know is: no change to the final binary.

The layout of the final binary is defined by $(ALL_OBJS), which this
patch doesn't change.

This patch only ask make that when it want to build "head.o", it need
first to build "arm/built_in.o", then "head.o" exist so we ask make to
not do anything in this Makefile.

Thanks,

-- 
Anthony PERARD

