Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C36468311
	for <lists+xen-devel@lfdr.de>; Sat,  4 Dec 2021 08:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238049.412786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtP7A-0003st-PU; Sat, 04 Dec 2021 07:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238049.412786; Sat, 04 Dec 2021 07:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtP7A-0003r7-ML; Sat, 04 Dec 2021 07:05:44 +0000
Received: by outflank-mailman (input) for mailman id 238049;
 Sat, 04 Dec 2021 07:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iFJX=QV=perches.com=joe@srs-se1.protection.inumbo.net>)
 id 1mtP79-0003qz-Om
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 07:05:43 +0000
Received: from smtprelay.hostedemail.com (smtprelay0222.hostedemail.com
 [216.40.44.222]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96cda5e8-54d0-11ec-a5e1-b9374ead2679;
 Sat, 04 Dec 2021 08:05:41 +0100 (CET)
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9057818224D70;
 Sat,  4 Dec 2021 07:05:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id 0CAE82002C; 
 Sat,  4 Dec 2021 07:05:37 +0000 (UTC)
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
X-Inumbo-ID: 96cda5e8-54d0-11ec-a5e1-b9374ead2679
Message-ID: <06f74e760966a090027bcfec8c22e97bc040e933.camel@perches.com>
Subject: Re: [PATCH] xen-blkfront: Use the bitmap API when applicable
From: Joe Perches <joe@perches.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Boris Ostrovsky
	 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	sstabellini@kernel.org, roger.pau@citrix.com, axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Fri, 03 Dec 2021 23:05:37 -0800
In-Reply-To: <f9a5bc6c-347b-8243-2784-04199ef879c2@wanadoo.fr>
References: 
	<1c73cf8eaff02ea19439ec676c063e592d273cfe.1638392965.git.christophe.jaillet@wanadoo.fr>
	 <c529a221-f444-ad26-11ff-f693401c9429@suse.com>
	 <d8f87c17-75d1-2e6b-65e1-23adc75bb515@wanadoo.fr>
	 <6fcddba84070c021eb92aa9a5ff15fb2a47e9acb.camel@perches.com>
	 <3d71577f-dabe-6e1a-4b03-2a44f304b702@wanadoo.fr>
	 <863f2cddacac590d581cda09d548ee0a652df8a1.camel@perches.com>
	 <1e9291c6-48bb-88e5-37dc-f604cfa4c4db@wanadoo.fr>
	 <a6dd44e2-6ea6-d085-0131-1e9bac49461a@oracle.com>
	 <f9a5bc6c-347b-8243-2784-04199ef879c2@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.23
X-Stat-Signature: kghtzb7181hs7t5uegz983zku95oz1k9
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 0CAE82002C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18WQvFgT880/VPxHgQ21iyOmrOfGf3TeLs=
X-HE-Tag: 1638601537-186527

On Sat, 2021-12-04 at 07:57 +0100, Christophe JAILLET wrote:
> So, maybe adding an "official" 'bitmap_size()' (which is already 
> existing and duplicated in a few places) would ease things.
> 
> It would replace the 'nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;' 
> and hide the implementation details of the bitmap API.
> 
> Something like:
> static __always_inline size_t bitmap_size(unsigned long nr_bits)
> {
> 	return BITS_TO_LONGS(nr_bits) * sizeof(long);
> }

Or maybe a bitmap_realloc


