Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E3459740
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 23:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229098.396499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHcz-0005jZ-Sv; Mon, 22 Nov 2021 22:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229098.396499; Mon, 22 Nov 2021 22:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHcz-0005h5-Pk; Mon, 22 Nov 2021 22:17:33 +0000
Received: by outflank-mailman (input) for mailman id 229098;
 Mon, 22 Nov 2021 22:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+cX=QJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpHcz-0005ea-4A
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 22:17:33 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb842e1e-4be1-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 23:17:31 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51EF360F48;
 Mon, 22 Nov 2021 22:17:29 +0000 (UTC)
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
X-Inumbo-ID: fb842e1e-4be1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637619449;
	bh=paUeQDKxuqgxS3cWP4o2B5+4c+2ofxouw7SOj1gNCmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jlOqCm05HghCO+w5EHI7r6xMbKY2b2a3gjKV7oRlac4c/o3V1syZt+aWr9Jo8I3de
	 62qKYc7VbWc14f5e0YbtVrXyq5A9I5tphzUJ0O0LmmJ917puEHOV7eB04HLtZYZFyT
	 C6ajBBWPTAPFML5QM3Lu5bqQqZVB8iFaoR2w9JIgwLz73KNCfCJ+4vJsMUdiGwSFby
	 P8sRZFnuc2Lt4VWy0tOizYtUJN4cfmUdWvMAYNFCk9TJoD7juGhioCtRmlFNCP8bpO
	 CyqFBqmQLi521mZTIlzShUErMSsutWQOvdcSA34duI81fYpxRox+7GEmGhnGF6Sr2c
	 eAVb7IMBG5S3Q==
Date: Mon, 22 Nov 2021 14:17:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, stable@vger.kernel.org, 
    jgross@suse.com
Subject: Re: [PATCH v2] xen: detect uninitialized xenbus in xenbus_init
In-Reply-To: <alpine.DEB.2.22.394.2111221357081.1412361@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2111221416330.1412361@ubuntu-linux-20-04-desktop>
References: <20211119202951.403525-1-sstabellini@kernel.org> <bc47bbe2-b330-7744-8d6b-869e3c7523e4@suse.com> <alpine.DEB.2.22.394.2111221357081.1412361@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Nov 2021, Stefano Stabellini wrote:
> On Mon, 22 Nov 2021, Jan Beulich wrote:
> > On 19.11.2021 21:29, Stefano Stabellini wrote:
> > > --- a/drivers/xen/xenbus/xenbus_probe.c
> > > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > > @@ -951,6 +951,20 @@ static int __init xenbus_init(void)
> > >  		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> > >  		if (err)
> > >  			goto out_error;
> > > +		/* Uninitialized. */
> > > +		if (v == 0 || v == ULLONG_MAX) {
> > 
> > Didn't you have a comment in v1 here regarding the check against 0? Or was that
> > just like now only in the description? IOW I think there ought to be a code
> > comment justifying the theoretically wrong check ...
> 
> Yeah, I added all the info in the commit message and shortened the
> in-code comment this time. I am also happy to keep the details in the
> in-code comment, e.g.:
> 
> /*
>  * If the xenstore page hasn't been allocated properly, reading the
>  * value of the related hvm_param (HVM_PARAM_STORE_PFN) won't actually
>  * return error. Instead, it will succeed and return zero. Instead of
>  * attempting to xen_remap a bad guest physical address, detect this
>  * condition and return early.
>  *
>  * Note that although a guest physical address of zero for
>  * HVM_PARAM_STORE_PFN is theoretically possible, it is not a good
>  * choice and zero has never been validly used in that capacity.
>  *
>  * Also recognize the invalid value of INVALID_PFN which is ULLONG_MAX.
>  */

I sent a new version of the patch with the check below and slightly more
concise version of this comment.
 

> > Also, while I realize there are various other similar assumptions elsewhere, I
> > would generally recommend to avoid such: There's no guarantee that now and
> > forever unsigned long long and uint64_t are the same thing. And it's easy in
> > cases like this one:
> > 
> > 		if (!v || !(v + 1)) {
> 
> I am happy to use this.

