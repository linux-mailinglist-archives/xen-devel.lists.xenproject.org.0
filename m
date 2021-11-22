Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C645971D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 23:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229079.396467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHPz-00032q-5i; Mon, 22 Nov 2021 22:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229079.396467; Mon, 22 Nov 2021 22:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHPz-0002zi-22; Mon, 22 Nov 2021 22:04:07 +0000
Received: by outflank-mailman (input) for mailman id 229079;
 Mon, 22 Nov 2021 22:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+cX=QJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpHPx-0002zc-GL
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 22:04:05 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1977e02c-4be0-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 23:04:03 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C179604D1;
 Mon, 22 Nov 2021 22:04:00 +0000 (UTC)
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
X-Inumbo-ID: 1977e02c-4be0-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637618640;
	bh=jOZoDcdty3EVXoO97iBWXCdZc4YcdG2UrCIxg6yqsOI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KQaOQ/8mdKxeHcSN/IfNcXV6jpA9VIrYHF6zPGcF8oCo8ZsB+HdG1s79HpwcpkXwK
	 EizF31knhMnjWgkLiQ/fygn6B7qstlQTLnaZ+VDeyNONyG+AkQCaL9R2U0egM4OLw2
	 /2vOuxOlu4DjJ2SGbargP2zYoJlrVG4AnBfdDjxmlroI88ejdzqnpwd//fiGXxR4P5
	 YVfZkIEd6v16rEjd2axNhFX50BlePbMOwb8/LW5WmP8cPbLxx8TWF+nwEECadwxigJ
	 mMMvYj5kcXcJIpdMHmzzyCtmQY+hVo7cHOo9jrHwfILaejDnxYiXAUumTUH0lHpSYc
	 5jwCX2cblL/uw==
Date: Mon, 22 Nov 2021 14:03:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, stable@vger.kernel.org, 
    jgross@suse.com
Subject: Re: [PATCH v2] xen: detect uninitialized xenbus in xenbus_init
In-Reply-To: <bc47bbe2-b330-7744-8d6b-869e3c7523e4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111221357081.1412361@ubuntu-linux-20-04-desktop>
References: <20211119202951.403525-1-sstabellini@kernel.org> <bc47bbe2-b330-7744-8d6b-869e3c7523e4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Nov 2021, Jan Beulich wrote:
> On 19.11.2021 21:29, Stefano Stabellini wrote:
> > --- a/drivers/xen/xenbus/xenbus_probe.c
> > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > @@ -951,6 +951,20 @@ static int __init xenbus_init(void)
> >  		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> >  		if (err)
> >  			goto out_error;
> > +		/* Uninitialized. */
> > +		if (v == 0 || v == ULLONG_MAX) {
> 
> Didn't you have a comment in v1 here regarding the check against 0? Or was that
> just like now only in the description? IOW I think there ought to be a code
> comment justifying the theoretically wrong check ...

Yeah, I added all the info in the commit message and shortened the
in-code comment this time. I am also happy to keep the details in the
in-code comment, e.g.:

/*
 * If the xenstore page hasn't been allocated properly, reading the
 * value of the related hvm_param (HVM_PARAM_STORE_PFN) won't actually
 * return error. Instead, it will succeed and return zero. Instead of
 * attempting to xen_remap a bad guest physical address, detect this
 * condition and return early.
 *
 * Note that although a guest physical address of zero for
 * HVM_PARAM_STORE_PFN is theoretically possible, it is not a good
 * choice and zero has never been validly used in that capacity.
 *
 * Also recognize the invalid value of INVALID_PFN which is ULLONG_MAX.
 */


> Also, while I realize there are various other similar assumptions elsewhere, I
> would generally recommend to avoid such: There's no guarantee that now and
> forever unsigned long long and uint64_t are the same thing. And it's easy in
> cases like this one:
> 
> 		if (!v || !(v + 1)) {

I am happy to use this.

