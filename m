Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30B47C0BF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 14:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250416.431297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfAu-0002GF-Tz; Tue, 21 Dec 2021 13:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250416.431297; Tue, 21 Dec 2021 13:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfAu-0002Dr-Qs; Tue, 21 Dec 2021 13:27:28 +0000
Received: by outflank-mailman (input) for mailman id 250416;
 Tue, 21 Dec 2021 13:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzfAs-0002Dj-Hl
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 13:27:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb05425c-6261-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 14:27:24 +0100 (CET)
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
X-Inumbo-ID: bb05425c-6261-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640093244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fM/xMZtHF3QCZrwvcd3A39+pWT6QtuW8AZWq07CfjJI=;
  b=ODu+r2VuJs086ka9IBBFVoHQ3SrKmmXaO79OZ2WgyVxCgUxc7YmxeFdS
   xdqaBMklcy5vZSUcyGifzDafPsgMcH213jKZ/DMr5wD8s8Y1sVC5saPAk
   Z2C2FwqlB39e4pIRNZRy3y4DUT9CBC1vmlpL/8xXH6wtV2zDvMQutwUzb
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yzFHAJEeFFKRm1WmZntAKA/ZE6nKmmakMB7BHyqI0zmisV1IwFSd6bGAcLLZQ/i/KyGesJQPb0
 V1UCw3KqVQ2JUFei+SSiEuR2R6kTl7aGAhDb+zJzt2HNA0X9o91nztZXqvxbZ9kCtxRsjfD9rn
 HKvncT61vBws6/ulve4IDIJwgUncfXTwR7BnrDr5b6mp6syaJ6KYanzr/8hM9UZybxtkJeKItZ
 cTrvfMSTKMzSmtMDgVI412Dt6l46pTlLvTbsRZa/q47vD3gQZDsJemR9nirosYDzkVN8j1mUqV
 pDocC2nBi3xTK1jQ1whDrkor
X-SBRS: 5.1
X-MesageID: 60512791
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eWkO56P2ADJHTaHvrR1CkMFynXyQoLVcMsEvi/4bfWQNrUoj3z0Gm
 mBKDTiCafeKM2WmKoh2Otvio01X6J6Ez9Q3QQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400g6w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyqWtfBty
 N5uiaCPDjYgHZGUl9gychYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9t35oRTK+2i
 8wxYwAoSBjbRhp1A0YGLJ1mgNezwXPtbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6aq
 XjB5H/RGQwBOZqUzj/t2lWoi+zUnCLMfYUTD7y19/N0qFCLz2lVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQMM5nu8qRTcJ6
 mO22OLgJgA3v4G6aH3Io994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3ipQif6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xLxfZX1uvHbUKAnoIF1Pz6zdWNE7qQQwd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0MfcvOd/uV55zlvKI+THZuhb8NIImjn9ZLlDvwc2TTRTIgzCFfLYEzMnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflA7RTp/UqCJmtvMueVNxsxoqwsBx
 VnlMmcw9bY1rSCvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:q7uCy6i2eLp8fjyP7m9YpTMHu3BQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="60512791"
Date: Tue, 21 Dec 2021 13:27:11 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v1 4/5] tools/arm: add "scmi_smc" option to xl.cfg
Message-ID: <YcHWL7S+O8txY8Eq@perard>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7aa3e21a3285b3af92ad87a4b039b4bd7696ac88.1639472078.git.oleksii_moisieiev@epam.com>

On Tue, Dec 14, 2021 at 09:34:28AM +0000, Oleksii Moisieiev wrote:
> This enumeration sets SCI type for the domain. Currently there is
> two possible options: either 'none' or 'scmi_smc'.
> 
> 'none' is the default value and it disables SCI support at all.
> 
> 'scmi_smc' enables access to the Firmware from the domains using SCMI
> protocol and SMC as transport.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---

Thanks for the patch, it looks good too me.

But it is kind of weird that the manual describes something that isn't
implemented yet. Could you maybe add in the patch description that the
feature isn't implemented yet or that the feature is implemented in
follow-up patches?

Also, about the golang binding thingy, could you add a note after a line
of a three dash "---" that let know the committer to regenerate
everything that needs re-generating due to change in the *.idl file,
just in case?

Thanks,

-- 
Anthony PERARD

