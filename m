Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161136C107B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511845.791168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDTO-0005WQ-Nz; Mon, 20 Mar 2023 11:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511845.791168; Mon, 20 Mar 2023 11:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDTO-0005Tm-LL; Mon, 20 Mar 2023 11:14:42 +0000
Received: by outflank-mailman (input) for mailman id 511845;
 Mon, 20 Mar 2023 11:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jf3z=7M=citrix.com=prvs=43647449e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1peDTM-0005Tf-Kv
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:14:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66b9c1b2-c710-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:14:39 +0100 (CET)
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
X-Inumbo-ID: 66b9c1b2-c710-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679310879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sTAe3McyHNVdg6rqu9zp8bqiSJlWqGMkWq+MLSrIMF0=;
  b=dO6yvffSbFvv6RviRTjwEm6dkMcnaoFUVKLP/hEIjVDlUMXSgkIIa7G9
   HbNTJBsQxpscludzhv5E3Srxt6m6PlPAIXTJy8BgdeA+/3NDQ2vZZoKRt
   4owCbiKEI7xH29FKTiZeLWGk7xYiXQ0U0CrVYYSk7w3HoNxHjdGHVpwXx
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100323765
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:5N5hpKu/qy13RxVbtKXx62FbDufnVN1eMUV32f8akzHdYApBsoF/q
 tZmKTyCOKuPYmP1Ko1wPtzl9xkH7MXUn95rHlc/qi8xHiMQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBhYCTBq5mt+P7LuRe7hhm58oM8XZFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zqepD6iXU9HXDCZ4QKnq3+KhsXppiP+Z4kqD6eF+ftAhULGkwT/DzVJDADm8JFVkHWWWNVZM
 UUYvDUvqasa81aiRd3wGRa/pRasoRo0S9dWVeog52ml0bHI6gyUAmwFSD9pa9E8ssIyAzsw2
 TehlsvkHzV1vJWJSHiW8fGfqjbaESMcN2MFaAcPRBEJ5NSlq4Y25jrUR9N+Harzkt30Ezjtx
 yyioS4lwrECishN0L+0lXjCiiipr4LETSY04BvWRWOv6g5lZI+jaJes4FKd5vFFRK6JQ1/Es
 HUalsy26OEVEYrLhCGLWP8KHryi+7CCKjK0qVJiGpgJ9jKz+mWid4Rd/DF/IkhyNs8OPzTuZ
 Sf7ux5V5ZJVFGuna+lweY3ZI8YgwLXkFN/lfuvJddcIaZ90HDJr5wk3OxTWhTq01hFxz+dmY
 8zznduQ4WgyJ4Jo7jCMWtok/bYB93Ez2DjYWpzJ5kHyuVaBX0J5WYvpIXPXML9otPnZ+FqFm
 zpMH5DUkksCCYUSdgGSqNdOdg5ScBDXELis86Rqmvi/zh2K8Y3LI9vY2vsfdoNshMy5fc+Yr
 yjmCie0JLcS7EAryDlmiVg5MtsDpb4l8RoG0dUEZD5EIUTPnK71tPtPH3fIQVXX3LM6lqMlJ
 xX0U86BHu5OWlz6xtjpVrGk9NYKXE3y1Wqz09+NPGBXk2hIG1aYpbcJv2LHqEEzM8ZAnZBu+
 +TwiFKDGcNrqsYLJJ++Vc9DBmiZ5RA18N+elWORSjWPUC0AKLRXFhE=
IronPort-HdrOrdr: A9a23:4musZKkwKVSsDL3rCzSljh/fCIvpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.98,274,1673931600"; 
   d="scan'208";a="100323765"
Date: Mon, 20 Mar 2023 11:14:23 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v5 0/5] Stop using insecure transports
Message-ID: <ccf4f624-356f-4498-9ae3-e4528b9e1901@perard>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
 <cover.1677356813.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>

Hi,

I believe all the containers that needed to be updated in our GitLab CI
to be able to access HTTPS URLs have now been updated.

So I guess the series is good to go if it's reviewed.

Cheers,

-- 
Anthony PERARD

