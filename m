Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC84961FC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 16:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259401.447731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvkf-0005ic-Vu; Fri, 21 Jan 2022 15:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259401.447731; Fri, 21 Jan 2022 15:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvkf-0005gD-Su; Fri, 21 Jan 2022 15:22:57 +0000
Received: by outflank-mailman (input) for mailman id 259401;
 Fri, 21 Jan 2022 15:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAvke-0005fw-8q
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 15:22:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffdb7851-7acd-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 16:22:55 +0100 (CET)
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
X-Inumbo-ID: ffdb7851-7acd-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642778575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=94wB8fDkNda8MFvxRPzeSDCJgPlMUIKxodJ1QNjxNUg=;
  b=Dv2yU+jsirmnOcjqxZYucY428jzwlEse8VypRTojSdv3XNsYT9JHVra+
   pUA+KISAxZsvSbFpZRRf5Atl/X+nh0HPK5f0MWvJFI+mV2otC9jY6nW5F
   J+SYiSAR0Q//KSPbaEhJjLvECcfWpylNfagIFjqsfQc0DERn0LOItQO4P
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kNHN/KhnUUWRYhGX7+f2JJu2bgemf8OZFyNhDp4GjtSxJMe76Eep5ylK84/PYcfTB34/an+0S1
 yhjVujbPcw6Dj6wu91o0D4Zvy6k1WzOoiiKgyb6pV11FF4Y9g3pbPGUP+qMomgsnmfjhXpNR82
 1vqV3UGpCLaZAKOPBnTMYH0sxZvgbQz2n/7oD2jAPLWbwy7K5zLbZ6Gv1Lx97mNuAxAt9Hize3
 s+v/7XKHBBEduW4ak0Wdy+2dYX3RCUSoBFr8/B5fsRaR2gdNLOFHH+C1XbC/cB0GpDsr98VD0q
 0z9nw68WMXQHksnjMSOS/a1D
X-SBRS: 5.2
X-MesageID: 62497888
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eiiCWK8dwVI98wJVML+ODrUDZHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 TZOUGHQPKqNYGPwft93b97l8BgAuJfWydBkSQZv+yg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhV6
 dBdibezazsbFfOQitsFVD8bKx5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4UQaeBN
 5pJAdZpRDPeUxhwBlhHM8MZ37en21O8aWFih03A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3Eru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S69J20UchVCSuAUn5FqVwMy0
 XnKp+zQUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTXEY3h+5nztp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518Lu8cIbSrzMfEvC25UNyjM5fO4fTgCfquMBuein7ArLFPXlM2QTRP4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOlZWHPTMLFRxP7U8W39r
 ocEX+PXmko3bQELSnSNmWLlBQpUfSFT6FGfg5E/S9Nv1SI/SDh+UKeAmO14E2Gn9owM/tr1E
 riGchcw4DLCabfvcFzihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:mm87ca2vpMfTCX5RhOlGJgqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62497888"
Date: Fri, 21 Jan 2022 15:22:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] tools/xenstore: fix error handling of check_store()
Message-ID: <YerPwB6MgcANESIP@perard>
References: <20220121131219.14562-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220121131219.14562-1-jgross@suse.com>

On Fri, Jan 21, 2022 at 02:12:19PM +0100, Juergen Gross wrote:
> check_store() has an incomplete error handling: it doesn't check
> whether "root" allocation succeeded, and it is leaking the memory of
> "root" in case create_hashtable() fails.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

