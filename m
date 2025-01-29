Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEBA219A9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 10:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878991.1289204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td416-0001bi-OX; Wed, 29 Jan 2025 09:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878991.1289204; Wed, 29 Jan 2025 09:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td416-0001Yv-Lm; Wed, 29 Jan 2025 09:05:48 +0000
Received: by outflank-mailman (input) for mailman id 878991;
 Wed, 29 Jan 2025 09:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StUP=UV=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1td414-0001Yp-U7
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 09:05:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 389dfc98-de20-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 10:05:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 742495C48A3;
 Wed, 29 Jan 2025 09:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C399BC4CED3;
 Wed, 29 Jan 2025 09:05:42 +0000 (UTC)
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
X-Inumbo-ID: 389dfc98-de20-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738141543;
	bh=Q8NTuhBVqnZu5kUxXuIu5wikBIqX+rWJ1J0b9mlGgGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwSqS6pTrgoxlJiBbX+fZakG7xzd9gx26HZ1WYoFZl0HN9I4vywpeEAPemr5T9CRk
	 xcFmQEONNIsrn5jdlXSd2TuDLk/uWYa8kIk/YbltsUB89XKqggvF7zXXaYQNc6DF8M
	 jR1nYuZ6v3XIEFgLvAHZsy0W0MvyoLlkN4+Aa9Vo=
Date: Wed, 29 Jan 2025 10:04:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	stable@vger.kernel.org
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
Message-ID: <2025012956-jiffy-condone-3137@gregkh>
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>

On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
> Hi Greg,
> 
> On 29/01/25 2:18 PM, Greg KH wrote:
> > On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
> >> Hi there,
> >>
> >> On 29/01/25 2:05 PM, Greg KH wrote:
> >>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
> >>>> Hi All,
> >>>>
> >>>> +stable
> >>>>
> >>>> There seems to be some formatting issues in my log output. I have
> >>>> attached it as a file.
> >>> Confused, what are you wanting us to do here in the stable tree?
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >> Since, this is reproducible on 5.4.y I have added stable. The culprit
> >> commit which upon getting reverted fixes this issue is also present in
> >> 5.4.y stable.
> > What culprit commit?  I see no information here :(
> >
> > Remember, top-posting is evil...
> 
> My apologies,
> 
> The stable tag v5.4.289 seems to fail to boot with the following prompt in an infinite loop:
> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion 3273 sge_count (-12) is out of range. Range is:  0-256
> 
> Reverting the following patch seems to fix the issue:
> 
> stable-5.4      : v5.4.285             - 5df29a445f3a xen/swiotlb: add
> alignment check for dma buffers
> 
> I tried changing swiotlb grub command line arguments but that didn't
> seem to help much unfortunately and the error was seen again.
> 

Ok, can you submit this revert with the information about why it should
not be included in the 5.4.y tree and cc: everyone involved and then we
will be glad to queue it up.

thanks,

greg k-h

