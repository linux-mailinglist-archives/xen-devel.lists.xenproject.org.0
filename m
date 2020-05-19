Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414CF1D92CE
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:58:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jay4q-0007Ek-S9; Tue, 19 May 2020 08:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mazm=7B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jay4p-0007Ee-92
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:58:19 +0000
X-Inumbo-ID: e2392558-99ae-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2392558-99ae-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=7+z3ZDCgN11RO4REgESRXkZ917HXpAqJ50OIrMd4lfM=; b=EmBoUSjMIrfbsRkobjDHQgoLRD
 YfT5K/X1JL45cFeAC6mm2Ux9KVNTBBQvit8XsdBoW5D2pF8Fc0AV6eMRmJ9ia86i8skN8NKRwyPFn
 5ACE1Ag9U5gcVjx5IzjqXJVfPZusa1Di2QvtWbFk8BsMZjj571bp5lkB42RR26uSg4UI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jay4o-0003qL-1A; Tue, 19 May 2020 08:58:18 +0000
Received: from 96.142.6.51.dyn.plus.net ([51.6.142.96] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jay4n-0004tu-Nc; Tue, 19 May 2020 08:58:17 +0000
Date: Tue, 19 May 2020 09:58:15 +0100
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 1/2] tools/python: Fix install-wrap
Message-ID: <20200519085815.nswits7owiutn3nc@debian>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
 <20200311175933.1362235-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311175933.1362235-2-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 11, 2020 at 05:59:32PM +0000, Anthony PERARD wrote:
> This allows to use install-wrap when the source scripts is in a
> subdirectory.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/python/install-wrap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/python/install-wrap b/tools/python/install-wrap
> index 00e2014016f9..fef24e01708d 100755
> --- a/tools/python/install-wrap
> +++ b/tools/python/install-wrap
> @@ -44,7 +44,7 @@ shift
>  destf="$dest"
>  for srcf in ${srcs}; do
>  	if test -d "$dest"; then
> -		destf="$dest/${srcf%%*/}"
> +		destf="$dest/${srcf##*/}"

This seems to have changed the pattern from "Remove Largest Suffix" to
"Remove Largest Prefix".

What does it do in practice?

For POSIX sh

x=posix/src/std
echo ${x%%*/} -> posix/src/std
echo ${x##*/} -> std

I would think the former is what you want. But I could be missing
something obvious.

Wei.

>  	fi
>  	org="$(sed -n '2q; /^#! *\/usr\/bin\/env python *$/p' $srcf)"
>  	if test "x$org" = x; then
> -- 
> Anthony PERARD
> 

