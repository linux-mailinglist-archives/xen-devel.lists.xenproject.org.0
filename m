Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA02A43D6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 12:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18275.43261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZuGw-0007WK-Aw; Tue, 03 Nov 2020 11:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18275.43261; Tue, 03 Nov 2020 11:14:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZuGw-0007Vz-7o; Tue, 03 Nov 2020 11:14:42 +0000
Received: by outflank-mailman (input) for mailman id 18275;
 Tue, 03 Nov 2020 11:14:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41xg=EJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kZuGv-0007Vu-L2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 11:14:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7799992a-4755-4e16-bb0b-524553b67d03;
 Tue, 03 Nov 2020 11:14:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=41xg=EJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kZuGv-0007Vu-L2
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 11:14:41 +0000
X-Inumbo-ID: 7799992a-4755-4e16-bb0b-524553b67d03
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7799992a-4755-4e16-bb0b-524553b67d03;
	Tue, 03 Nov 2020 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604402080;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mrdvdn5dLPJM1XqjHNf/63I2y3o/edJRShyfDo0fAE4=;
  b=BGSSyfxez2eB9op3D/L783jdH7siC8/OAHdXMGcxgbF17IplzzOX8bpD
   JcE3SGIKudg2vNLZBcURaoRlbr7AyhOCwoo+Q9I9TZ3Qe+52DkJwUfY4G
   FBYgkleZsFX3ZLddLNvRZxnj7jKmCUD5Gms+0iI8UVGErrwy1zT6NSVZD
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /gGnsiUzLgUOel4dU4OjzAt6FnV5GIz5kF9b5Vfhn+w8i0TykcZzyzeHJ4Xy8vAln4HPjhlDVU
 ozGiE8qRKe3fHYWLhncQNoOGdo6y9Ki0cLm2tQxb0ajUdbnhcjZEDUBQhcnwF6vgaPv2HW7YFi
 OWcuHhjmhva+V7TE9vVi2AtnFo9fzGkUp8uK4447RpPURQ80nc3y2Xgl9KUeE5E43RvI0VyXTS
 eDqxX6FI01pPW/cEA8ckHfmeZLgMXITZGu3RkAL8DSc5Q6bsWSYdI5aifo8xvwoVLHqdW6WeDL
 dTY=
X-SBRS: None
X-MesageID: 31458756
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,447,1596513600"; 
   d="scan'208";a="31458756"
Subject: Re: [PATCH 4/5] x86/PV: restrict TLB flushing after
 mod_l[234]_entry()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a10a2dd1-f536-1182-9106-61ec5741f32e@citrix.com>
Date: Tue, 3 Nov 2020 11:14:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 03/11/2020 10:57, Jan Beulich wrote:
> Just like we avoid to invoke remote root pt flushes when all uses of an
> L4 table can be accounted for locally, the same can be done for all of
> L[234] for the linear pt flush when the table is a "free floating" one,
> i.e. it is pinned but not hooked up anywhere. While this situation
> doesn't occur very often, it can be observed.
>
> Since this breaks one of the implications of the XSA-286 fix, drop the
> flush_root_pt_local variable again and set ->root_pgt_changed directly,
> just like it was before that change.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While adjusting the big comment that was added for XSA-286 I wondered
> why it talks about the "construction of 32bit PV guests". How are 64-bit
> PV guests different in this regard?

Because the sole caller is move_l3_below_4G() for 32bit PV guests which
don't support folded CR3's.

It's not impossible that future changes to PV construction might change
this, but it is highly unlikely in practice.

~Andrew

