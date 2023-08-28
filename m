Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575ED78BB22
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591870.924424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakzZ-0008B5-Qo; Mon, 28 Aug 2023 22:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591870.924424; Mon, 28 Aug 2023 22:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakzZ-00089K-NW; Mon, 28 Aug 2023 22:45:53 +0000
Received: by outflank-mailman (input) for mailman id 591870;
 Mon, 28 Aug 2023 22:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakzY-00089D-6w
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:45:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2d22695-45f4-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:45:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C043C60FD2;
 Mon, 28 Aug 2023 22:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0550CC433C7;
 Mon, 28 Aug 2023 22:45:47 +0000 (UTC)
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
X-Inumbo-ID: a2d22695-45f4-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693262749;
	bh=uR5tTBB3do2rM6OfZCuU7OO3bryXas1p0x+ExW6slc8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H7pFPK2l6L8NUnqrq+w5nBcKkQSy3CH6lox9RKuQOVIU+hlxgsYd8xiz7AGx9X6wu
	 GR5yiGx5vaM3nS/7zgL6FrEHttDDRhCPZWonFxx4i1N0z0xnr1ScmtJTU8BgGn7wdl
	 jSg5MS+7wSGqZbzdHsYM7bbrRQi7qw9pCJhTVCml8hflfYxcU2l5hFBLbUNU+zoW20
	 /KNzt4gY1qKdyL/VBNL2yUOns3EBE2KD60XLQJ0ZKaE6R4v0YnErdw2VysDFj2VyGp
	 +0JiMuLASBh5p3CcJhhSjeDp5PkUdNPXWGQErBgtL0StFvQzo+glnQUM1LAIdsXnqH
	 xy1YIG6VSs/4Q==
Date: Mon, 28 Aug 2023 15:45:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 13/13] x86/asm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <7af1f690e486e2872a645463b4ec9d4b07a6c23a.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281544040.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <7af1f690e486e2872a645463b4ec9d4b07a6c23a.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Amend generation script to address a violation of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> This patch adds a special comment to the beginning of the header
> to make it explicit that the file is generated automatically.
> 
> The comment is recognized by ECLAIR and will cause the deviation of
> the violation.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/tools/compat-xlat-header.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
> index 2b805b23a8..9e336277ac 100644
> --- a/xen/tools/compat-xlat-header.py
> +++ b/xen/tools/compat-xlat-header.py
> @@ -406,6 +406,8 @@ def main():
>              line = line.strip()
>              header_tokens += re_tokenazier.split(line)
>  
> +    print("/* Generated file, do not edit! */")

I think it might be a good idea regardless of MISRA compliance to add
this comment.

However for MISRA compliance I think we should document somewhere other
than ECLAIR config file that "Generated file, do not edit!" is being
used as a MISRA C deviation marker.

I think we should add a special note to safe.json, or alternatively also
add the safe.json tag to the comment:

print("/* SAF-1-safe Generated file, do not edit! */")


>      with open(sys.argv[2]) as compat_list:
>          for line in compat_list:
>              words = re_tokenazier.split(line, maxsplit=1)


