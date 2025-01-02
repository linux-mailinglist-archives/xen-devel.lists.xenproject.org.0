Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70559FFCAC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 18:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864382.1275587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOsq-000119-CB; Thu, 02 Jan 2025 17:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864382.1275587; Thu, 02 Jan 2025 17:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOsq-0000yo-9M; Thu, 02 Jan 2025 17:21:20 +0000
Received: by outflank-mailman (input) for mailman id 864382;
 Thu, 02 Jan 2025 17:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTOsp-0000yi-Aq
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 17:21:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95b8350-c92d-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 18:21:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6BBAA412AB;
 Thu,  2 Jan 2025 17:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075D5C4CED0;
 Thu,  2 Jan 2025 17:21:14 +0000 (UTC)
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
X-Inumbo-ID: f95b8350-c92d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735838475;
	bh=z8HTro/qnAZhMN539b9dSCa2YFw7xXY0tQAFhhDnXv4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DnJiqVMsCGDNrJZrGp4/aWJhXEzNnJ37EgfeN0C0r1iOtgdSvrTEZPvnVGKUuYHeS
	 cecqQXpD33KL/Sfg/2BrEHxQuZl5NOTzpr1q9gUslkdPjmqH7cT1gXgHuvpXcba+M9
	 9LTIwjJOcYXjMjx6iehLkDPQ/vaTq4iIMv8QKdjDl9njUjXwtntTOHXFQNR/63UTnt
	 n1ZrcE+6g+ftD6aHCAMGRyG9PDNjwupXsdHHDxDircmE+6S2FJSBWGfJNUq+ffBLXd
	 FNGTinNY3K78vwpzL/WofPwD0i1vqzq6RpQMvqoUczQx/iG8lxmZQjbnAOhbRmFodk
	 fRg7PfN8s/LdA==
Date: Thu, 2 Jan 2025 09:21:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [ImageBuilder] Add zstd compression support
In-Reply-To: <662dff5a-f494-4aaf-a2cd-5e95bf0e310b@amd.com>
Message-ID: <alpine.DEB.2.22.394.2501020916200.16425@ubuntu-linux-20-04-desktop>
References: <20241217211903.5945-1-jason.andryuk@amd.com> <662dff5a-f494-4aaf-a2cd-5e95bf0e310b@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Dec 2024, Ayan Kumar Halder wrote:
> Hi Jason
> 
> On 17/12/2024 21:19, Jason Andryuk wrote:
> > uboot-script-gen fails to process a zstd-compressed initramdisk, exiting
> > with:
> > Wrong file type initrd.img. It should be cpio archive, exiting.
> > 
> > Extend the existing approach to also check zstd.
> > 
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > ---
> >   scripts/uboot-script-gen | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > index fc63702..db2c011 100755
> > --- a/scripts/uboot-script-gen
> > +++ b/scripts/uboot-script-gen
> > @@ -567,6 +567,7 @@ function check_compressed_file_type()
> >   {
> >       local filename=$1
> >       local type="$2"
> > +    local file_type
> >         if [ ! -f $filename ]
> >       then
> > @@ -574,13 +575,17 @@ function check_compressed_file_type()
> >           cleanup_and_return_err
> >       fi
> >   -    file -L $filename | grep "gzip compressed data" &> /dev/null
> > -    if test $? == 0
> > -    then
> > +    file_type=$( file -L $filename )
> > +    if echo "$file_type" | grep -q "gzip compressed data" ; then
> >           local tmp=`mktemp`
> >           tmp_files+=($tmp)
> >           cat $filename | gunzip > $tmp
> >           filename=$tmp
> > +    elif echo "$file_type" | grep -q "Zstandard compressed data" ; then
> > +        local tmp=`mktemp`
> > +        tmp_files+=($tmp)
> > +        zstdcat $filename > $tmp
> 
> I think you need to list zstd in |prog_req
> |
> 
> |See
> https://gitlab.com/xen-project/imagebuilder/-/blob/master/scripts/uboot-script-gen?ref_type=heads#L5|
> 
> |Also you need to include this as a part of the dockerfiles like|
> 
> |https://gitlab.com/xen-project/xen/-/blob/staging/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile?ref_type=heads|
> 
> |https://gitlab.com/xen-project/xen/-/blob/staging/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile?ref_type=heads

Ayan makes a good point. Given that zstdcat is only used if images are
provided in zstd format, and given that we have been using ImageBuilder
without zstd for years now, I am tempted to consider zstd optional,
rather than required. We could leave it out of prog_req. If we add it to
prog_req, ImageBuilder will refuse to start if zstd is not installed,
and, like Ayan wrote, we would have to add zstd to the Dockerfiles.

So in conclusion I think it is best to go with this patch as is:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

