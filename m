Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8546B9C3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240909.417683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYHV-0003rn-4y; Tue, 07 Dec 2021 11:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240909.417683; Tue, 07 Dec 2021 11:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYHV-0003ps-1l; Tue, 07 Dec 2021 11:05:09 +0000
Received: by outflank-mailman (input) for mailman id 240909;
 Tue, 07 Dec 2021 11:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjJF=QY=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muYHT-0003pm-Om
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:05:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ef0376-574d-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 12:05:06 +0100 (CET)
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
X-Inumbo-ID: 87ef0376-574d-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638875106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qnuwmZ0s2+L6Oqn1GJpILqnTqNt4yFWd7OprzsuOPZk=;
  b=XxhoatsbKGkfRwyboNgy+sq4Hzi1wOKynjzFxYsPm86T5pFqLk8hWV1q
   N1duZzP8rTSGFALzeI/xliIQmDeQ7g3BWITXOucEBItGjU/LfcpFjzhZ+
   05NZRDAiPaA+APxRh2yFCJJNtB5y0/CDTd/xMt7mhf+jXpQiBmZ9zAVIZ
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1BLCXziVWLQjptncfCrmG8Ap6QA6iOTMEtR52BxMX0J8myMhoZz2zMtPcevgSQcfqLLnFzXeWi
 U/E0S41rQzbXZNYpyekPr7OS/+Usk7wsWp8RTnkRirpai6WZBb3DwkcacF7Lq+r0+uTry9hoDp
 m+dJOBOTZii/bu16vtu93mUyymByVJXpHcJGwQDGnE7zNxx4GyixRSqCrxbwPNxFuukBRo2ZTR
 1r6+mVmjlasMC4Alld1P2Jp4deLGBzbsgoKLkAI3JF4nPGTODx6Z/nYfnNTerAeR5bPeuEtZIE
 5NU/iF4E+fIH2ripOzr5zMP+
X-SBRS: 5.1
X-MesageID: 59451336
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j3qLyq7njwAl1Rqwf9JlGAxRtAHAchMFZxGqfqrLsTDasY5as4F+v
 mBOXjjSPPyOY2P8f9giYITkoUgPvcOEnd8xSgJkpC5hHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tEw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 NlMt7KrcFoQDILzx+gwQhZqOTx4IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTKqDP
 pFCN1KDajzrehN3BlUlFKszxue3nXbTdzlX+HWK8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc95cEu8U8zjQ85j73FmVK3kLfBRcbsNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D5gbQ4xawZRGp8crVml
 CJb8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtAAuW8gfB0xbphsldrVj
 Kj741w52XOuFCHyMf8fj3yZVazGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrF7Z1+eJ6nUgWmDKMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9r
 4wCapDUkkoHC4UToED/qOYuELzDFlBjbbieliCdXrfrztNOFD5zBvnP76kmfoA5za1Zmv2Rp
 iO2W1NCyUq5jnrCcF3YZndmYbLpfJB+sXNkYnB8YQf2gyAuMdS18aMSV5orZr17puZt+uF5E
 qsecMKaD/URFjmeo2YBbYPwpZBJfQiwgV7cJDKsZTUyJsYyRwHA9tL+UBHo8S0CUni+ucck+
 uXy3QLHW5sTAQ9lCZ+OOv6oylqwu1kbmf5zABSUcoUCJh20/dEzeSLrj/IxL8UdEjn5x2OXh
 1SMHBMVhejRuItpotPHsr+J8tWyGOxkE0sEQ2SCteSqNTPX93aIyJNbVLraZijUUW759fnwZ
 ehRyP2gYvQLkEwT7th5Grdvi6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJK3GVEcEwMpc+Cf2KxGgTLV9/k0fB336SIfEGBriqmO081gUBBgEYY=
IronPort-HdrOrdr: A9a23:03RmA6HD+H9yqixlpLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="59451336"
Date: Tue, 7 Dec 2021 11:04:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 04/47] build: set XEN_BUILD_EFI earlier
Message-ID: <Ya8/2Dc5yEp/ovf/@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-5-anthony.perard@citrix.com>
 <2bffd73c-ce1b-40cf-73b7-f988e69c4f07@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2bffd73c-ce1b-40cf-73b7-f988e69c4f07@suse.com>

On Thu, Dec 02, 2021 at 03:06:54PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > +efi-check-o := arch/x86/efi/check.o
> 
> How about making this
> 
> efi-check := arch/x86/efi/check
> 
> That way you wouldn't need to replace the extension in a number of places,
> but simply append the respective one in every place using this.

This change sound fine. I guess it will make reading the code a bit
easier.

> > +export XEN_BUILD_EFI XEN_BUILD_PE MKRELOC
> > +export EFI_LDFLAGS
> > +endif
> 
> Exporting MKRELOC in particular isn't very nice. I wonder whether there
> wouldn't be a way to keep it local to xen/Makefile.

I don't think that's possible. The value of MKRELOC depends on a call
with OBJDUMP which depends on call with LD which depends on a call with
CC. And the call with CC is the one I'm trying to move.

Unless there is a better way to build *.efi, we need to know whether to
use `mkreloc` or not.

I could rename it XEN_MKRELOC. Or if there is another name that could
make sense, that would be fine too, like XEN_BUILD_EFI_NEED_RELOC which
could be a boolean.

Thanks,

-- 
Anthony PERARD

