Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97548DB9F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 17:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257263.442049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n82r8-0007Gn-L2; Thu, 13 Jan 2022 16:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257263.442049; Thu, 13 Jan 2022 16:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n82r8-0007Dr-Gw; Thu, 13 Jan 2022 16:21:42 +0000
Received: by outflank-mailman (input) for mailman id 257263;
 Thu, 13 Jan 2022 16:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GUHC=R5=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n82r7-0007Dl-6v
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 16:21:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e205c3b8-748c-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 17:21:39 +0100 (CET)
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
X-Inumbo-ID: e205c3b8-748c-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642090899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=niekpDJPFAUiBhVZYFMbcA5D19wfW+devHqcGvetZSU=;
  b=H+kqVKQ66UDLGZMnus9giw25Ye7A3uM+vAETl4IX9CAxIsXa+mD/2qAh
   deKTeruOfyV4VFU0A6L75lPP+qPeXq+TPefLLIDAoMP1ooPtlnPmWcziu
   ZZw3ol2K7+QOviwLJvavOg8OpOPD/ymtLwLLFMzdntkHWft3wex/i6/4w
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: m5eiGda4zK/R4ngeSH4zUF+mx93SnCNJ2fYUBdo3FhSuPOQameTfKuUaL9MhjOIgf1pr71vmL3
 cLP6SzELTMpoVcgFGncs089lnbvUAiP6jpGh5qwFt5CEYNh8wlQ9UhCQet93QaYa1gQT5PNpeQ
 kezoDVTol//6M4FqRpe7t6WV5z6cVeJS0svxN/rD/xeB9aLXk5tXltYmAK+d8KGLnBUQqFUVqn
 yJqPkYCUqycYcb+W8Em9QZjoFKA6xndWjR2OtH4kD/bVF9/OqLlbC/Wm5C+i+usT2HSLCosVDA
 on3As5/zWoAJn5N8VCB8xGN8
X-SBRS: 5.2
X-MesageID: 61935975
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bUb3Wa0AxHg2d/2oNvbD5S92kn2cJEfYwER7XKvMYLTBsI5bp2EPy
 WUWUT2Oa6mDajbxeIh1Pd639UgEvJHczocxTwU5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wrVh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhmNFr9
 dFtpMeLRVl0fYnHpcAMVAMDKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u35EVQKeBO
 qL1bxJxPCb/OiV0BGwSL5UbwO73uEP9KBFH/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SWB2mKhgKnIhyyTcIAPELy18NZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxRosaeoTVKMrYyY827xHSMoCX4Ff3Q9GF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/Azr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6rUWNE/qQQ2d3XEy9hL0yTzFWy3yGsvTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CqqMN4EWPMQhL1XvEMRSiai4hTCFfK8Ey/BXB
 HtmWZz0USZy5VpPkVJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CDrGWSnSJoOY7cABbRVBmVMueg5EGKYa+zv9ORTtJ5wn5m+1xIuSIXs19y4/1w
 51KchQJlwqk2yyWcFXih7IKQOqHYKuTZEkTZUQEVWtEEVB4CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:bGeObagv0FChCL/GQO87bsa503BQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61935975"
Date: Thu, 13 Jan 2022 16:21:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: adjust include/xen/compile.h generation
Message-ID: <YeBRjeV9dnnKgeHr@perard>
References: <4f0766b2-cabd-cf5e-ed84-cc2b773bf5f8@suse.com>
 <YeALhTgXh7g2QdbB@perard>
 <726353b9-0093-31de-bcfe-35f9ee68c61f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <726353b9-0093-31de-bcfe-35f9ee68c61f@suse.com>

On Thu, Jan 13, 2022 at 01:11:41PM +0100, Jan Beulich wrote:
> On 13.01.2022 12:22, Anthony PERARD wrote:
> > On Tue, Jan 11, 2022 at 03:16:17PM +0100, Jan Beulich wrote:
> >> Prior to 19427e439e01 ("build: generate "include/xen/compile.h" with
> >> if_changed") running "make install-xen" as root would not have printed
> >> the banner under normal circumstances. Its printing would instead have
> >> indicated that something was wrong (or during a normal build the lack
> >> of printing would do so).
> > 
> > So, having several line of logs with one generating "compile.h", and
> > several object rebuild plus the re-linking of xen isn't enough has to
> > indicate that something is wrong?
> 
> Well, for warnings and errors to be easy to spot (and until your rework
> to make our build more Linux-like is in place) passing -s to make is a
> must, imo.

I see, I guess keeping that behavior is kind of useful (banner been
printed when compile.h is regenerated).

> >> +	$(if $(filter-out FORCE,$?),rm -fv $@)
> > 
> > Is there a reason for -v? Do we care if the file existed?
> 
> That's meant to be an indication of the file getting updated during
> "install-xen" as root. I thought it might be nice to have this extra
> indicator, but I wouldn't mind dropping it if that helps acceptance
> of the change. Can you let me know how important this aspect is to
> you?

I guess it is fine to keep the '-v'. It isn't like it is something that
will happen very often.

> > Do we want to log "rm -f compile.h" ? Or could you just prefix the line
> > with $(Q)?
> 
> I'll add $(Q). As said, I always build with "make -s" (except when
> debugging weird build issues), so this is nothing I would have noticed.

With $(Q) added:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

