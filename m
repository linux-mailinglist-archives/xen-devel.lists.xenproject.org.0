Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7735C2D5E56
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49381.87326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNEe-0006OX-Gu; Thu, 10 Dec 2020 14:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49381.87326; Thu, 10 Dec 2020 14:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNEe-0006O8-DJ; Thu, 10 Dec 2020 14:48:00 +0000
Received: by outflank-mailman (input) for mailman id 49381;
 Thu, 10 Dec 2020 14:47:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBiL=FO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1knNEc-0006Nz-Dp
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:47:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a602a9f-1e80-4b97-ae45-2a8e3a16367e;
 Thu, 10 Dec 2020 14:47:57 +0000 (UTC)
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
X-Inumbo-ID: 2a602a9f-1e80-4b97-ae45-2a8e3a16367e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607611676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YzBzMUXp40/RwzVqdRyq4Gso6zKiB40x+XQEEGsH8F0=;
  b=AxJp8h+bAwzhs/56lbiBbp1Q/ncIpG+cXLhF/v3JcvZ9j0w+fOxe0JKu
   ueqzBKiHnZbog1se5rEGAqRt24FZLv//f8g3ytBiqgOp2nssdQWXGChS9
   1t60Q0PbhIfSdWms6wOTdvfnocHNvxWg7iSsfm6qGr/nzBEDmXib1R1bl
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kaIvGIlSdtH5/bvCFkYR+gHHmNFG/3Dkbiw3RymXSDvdRv3TRqUMZfnBRo5vWj4MJ9DKJpqc76
 v04pTj08/IbCZwun5nXyYsjamo0vUsHqFP1J+3dFrXGjCPFfV7xlpZJ3UuAIMzYuWTq7pKa6em
 L5ejrR7NYQiU54OrDntaxfEzB5KkSqDBnUIaLBASE1y10dUV2wwbuLuASdzwTjhr4L9jHlrY60
 QZIUrVllYBTSlJEXOoN/SQE4Ua6Stu3z9LTF1/QQ3SMf6RWeKKYe00eGh5ZC5uEWSMmrc1GSM+
 brw=
X-SBRS: 5.2
X-MesageID: 32957099
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,408,1599537600"; 
   d="scan'208";a="32957099"
Date: Thu, 10 Dec 2020 14:47:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/8] lib: collect library files in an archive
Message-ID: <X9I1GCAM2nn8W8eN@perard.uk.xensource.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>

On Mon, Nov 23, 2020 at 04:21:19PM +0100, Jan Beulich wrote:
> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
> just to avoid bloating binaries when only some arch-es and/or
> configurations need generic library routines, combine objects under lib/
> into an archive, which the linker then can pick the necessary objects
> out of.
> 
> Note that we can't use thin archives just yet, until we've raised the
> minimum required binutils version suitably.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/Rules.mk          | 29 +++++++++++++++++++++++++----
>  xen/arch/arm/Makefile |  6 +++---
>  xen/arch/x86/Makefile |  8 ++++----
>  xen/lib/Makefile      |  3 ++-
>  4 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index d5e5eb33de39..aba6ca2a90f5 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -60,7 +64,14 @@ include Makefile
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_ld = LD      $@
> -cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
> +cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
> +               --start-group $(filter %.a,$(real-prereqs)) --end-group

It might be a bit weird to modify the generic LD command for the benefit
of only prelink.o objects but it's probably fine as long as we only use
archives for lib.a. libelf and libfdt will just have --start/end-group
added to there ld command line. So I guess the change is fine.


The rest looks good,
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

