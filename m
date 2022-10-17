Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B16010FA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 16:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424438.671855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQxy-0006P7-Ce; Mon, 17 Oct 2022 14:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424438.671855; Mon, 17 Oct 2022 14:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQxy-0006M9-9d; Mon, 17 Oct 2022 14:19:42 +0000
Received: by outflank-mailman (input) for mailman id 424438;
 Mon, 17 Oct 2022 14:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD8j=2S=citrix.com=prvs=282fc9ee0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1okQxw-0006M1-6W
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 14:19:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4c602cf-4e26-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 16:19:28 +0200 (CEST)
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
X-Inumbo-ID: b4c602cf-4e26-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666016377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3iTyJ2KaT2U2ZXqQqQdrj69OKJePCfOzU8l4HGwnN6s=;
  b=QVh6+FGVxnUrlPEKpfVfWHVKseD9bfwlQIHvgYjJ5hMlCvpOTk4YpCP8
   NsMagaax6Yom+/LcwrVZGE+04A0LXlCfpNU9QMiZHBc8QmD9mWQt+JNTd
   2CJRC+1Vnc0ushE7MjtkaEcHfTN+VJgGSMSJrkdcz57TjySw/n1yybTsF
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82916933
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AimnpTaKd9OGnQKFrFE//H55yshmJRhNe4xJyi?=
 =?us-ascii?q?0ilI8yiH7QXhM5G7Omlw1jQegf0YDIFSlbiPPRe58jS4n/sN0mM7nHaNIReU?=
 =?us-ascii?q?AWC40vRmYVWU1rgR/z3pRu094SsKwfz7B26pzBF2z3/8PF8dlVkg7KM+SjUp?=
 =?us-ascii?q?vQYLENoWeqJqksg5uzA3myk53ny+xH4gqZZQ0OtwXAcEZBSC16ACAlHHP+mS?=
 =?us-ascii?q?Ul7BPAhqtSeIdRW40kJ2lp5jr0VvvHypvPlSbc1iS3hhxpqr/Px9R0WgHjxd?=
 =?us-ascii?q?2vkj8G6kWc6xl9B8LfMnXQPh4iXDp3w+nndLwWF9K068xbfvjRBvUjiGcg3p?=
 =?us-ascii?q?VU+EQ3RUf3TTqSa4xUQoA4+5LCG3eCakJsHJe+qV9U2oLABRsz6Ssgpjurzd?=
 =?us-ascii?q?sslqyGDF2Ha36jTB8HyLTxF+phTgQZLNQbZO4AO10KSmpcBIeUrxsLGFVOwQ?=
 =?us-ascii?q?MUVc8/hCXiFLw8zmrKKlhkZ+M9IVbvC6MlyIxfJ8Tvd85SgfU70rdyU4gVEY?=
 =?us-ascii?q?z5u8SBDK6rfKbDWtYp6Az+J1BDcY7AIllOFU1aXZH1rzRlVbaD6lQSq11goi?=
 =?us-ascii?q?nWcErZpJvesUj78twItGRl9HFw+xwq6p2/7SPvwbnJA+ccuUMHgiWpw8dT5s?=
 =?us-ascii?q?3vwiZA4plsIVwk8tlAekVimB2wtVu2LSGlWAo9AbqVmwG7SumztlDCzZZIyr?=
 =?us-ascii?q?gWs+gYNifVeTJLKCLvPZ2kt4nEqoHTjSIWDeQ19go0TMeGatO59R+KgcKX4e?=
 =?us-ascii?q?h7kJDRoMnlJaXm6gOLlJhEK5rgHIsXKcVQ/z8HR5UFGNXEH3wUvgGsizes1+?=
 =?us-ascii?q?nFxljRjPj4Cdaq8BuxGrznnKFDl4kQqHG+HjeCt2ofj96a/WrRAZTeonz7i7?=
 =?us-ascii?q?Xj7aXufuFJk8LJqbIS8kgVAMSJPeJSK0d8Ay0VlmjSE2cjYHq/qJ2CUDA3ec?=
 =?us-ascii?q?W+oXjN/JW3vlGF4Zw5GJfbt4GtU4hcaBHah9kSHDlO5dJyBToToqYmqx8lPk?=
 =?us-ascii?q?yAJoBNqXWZFQHwvYCuSOr/I17dMi87AVNAf8i2zI8mljLuTMPgd/C54FgMLF?=
 =?us-ascii?q?yEEo+LZIU1N1zPPpiou7HvEUpMxN2ob6b4ffJijiFkDV3HSg1QyCV6wD3nYR?=
 =?us-ascii?q?CqcQRVUoSt0GmpQu1Ffx5tOqYDqs0JUwznkehRG3sqo3vjsf7EgyNU4wIFzl?=
 =?us-ascii?q?8UymTj+TbTtS/Thv+VECoJw3joHYRHKHbgKkxSYhXdP2n42YmjSV4c2fKHDs?=
 =?us-ascii?q?vVJwXzu0UuAn+HsMZSWvh6Aa62y0QOJfj1m9MW+7inVQAkmgzC+dFs0iFmSQ?=
 =?us-ascii?q?beyokdgSscMe0UUKN2S12bHP+mzpAlWvbjImQUxs8OkJjNeuJylhyGjVFHX5?=
 =?us-ascii?q?MnNSzwiuYhbauBfE46H5SZJ5m6BbeYAkeN06wTvo3b9djfxLZcQwYSFsddTW?=
 =?us-ascii?q?2zUg/XxUoopkIaB6c3/c54BwSYuT586Gd51WvVc+NAKSpBWa7I6ByvDfL3oS?=
 =?us-ascii?q?/RZMtIPy62/r6zlxlmwPjdL8gOdxwQn+22KlXf9QzJAump+pIZ1cnHa9UtVd?=
 =?us-ascii?q?UlnfLLQ/ndT7TMaZOdLmzeu8+2zlMh0WKGA5ylpqHtZqluA+LhzDi+3sm1mx?=
 =?us-ascii?q?y2H9ARPFup8LZxFUcbHJggff1hkvS4z1vaW2eoN1UoalSGazkPSIB0jpJGm/?=
 =?us-ascii?q?Z8ca03nTOLgKFRq+Qhk9zNFgkO+eajbywOZPZ6iVpm4yEM5Slo05ea4yN/SN?=
 =?us-ascii?q?UMdUjOp3I9M6Pf7COPS+noWQ+VodsLsfV7FkaU/WTv6sBC7Vnn5K9GxBgLHR?=
 =?us-ascii?q?Irmy7EAm8bRB2wuSVd9C1qi3t4eQ8usGbeGwlqwXIn65cbe25a6aGBSCzktb?=
 =?us-ascii?q?PzTF4b1orfeGPdeDnDDNmHCxMGsQBikdGRsqw4YFObu7EljWPeSW2eHO0FE+?=
 =?us-ascii?q?LILxoQ1ko5ZqCdCznWBlC8FAjkMNth5uwcHl40vCvIduIJ4Ir3jsLPFdOHMN?=
 =?us-ascii?q?Ly1GDl+tqH5WPipsu1zL8RSW4NDkZ2OhCMwDksIMDjKaI0efPGfFgTMHghaR?=
 =?us-ascii?q?4yz0LYywOLY9ONb0DG4bd6VnAuQtvh9aGgSxgqrQmb7QRbgQyPW+N8kggGP3?=
 =?us-ascii?q?dUnxYRa+WhHiL3yQrIW34XEvTuFZyp51WOTHvHzLhisrrTiCM6r6a5JC0bql?=
 =?us-ascii?q?A633jOTbtrtpoFRro3cKB1fHg+uwkhRWxb9ewZOkbCXDpGCQ+BvYHeqeZgtJ?=
 =?us-ascii?q?1J4MsgOgPRCZEp0/6DyjHwSy+6GJlVyoNqrFKPa9/XYM5MKslK1ClGPKpGLj?=
 =?us-ascii?q?JBHMLullZAGN0jPfaHtZLDwzBeYoCz0b8ctKNPPKqGRdlUjWXe7jM/vNOMYT?=
 =?us-ascii?q?r2d2MSi6QLJT8HNdFlXcnYcoL1NRoL/aGKBNGU/AlB9UAdmECUwqfu4X1ohA?=
 =?us-ascii?q?c6WQ/Thn/PxJXabdsb4gxZ35sucFkcpTCuQSQzpW/eutUQua6QrK6h2xxcre?=
 =?us-ascii?q?Rgn7hvdFhdrHTUZbHv5H103J9KxC/PQiGehQaOqjoyTv0kkekfcdU1yO/SlG?=
 =?us-ascii?q?p8Sjw3tyejybuT+L0WEuXUumoSZCw8+Z0AmxD2iWAjXtfG5DhNWKgm8Ze5HR?=
 =?us-ascii?q?0NEYjQWZqP8rJbSbOD5YLKZAYmT5moEodYIvbdo38vECRRBXQtAmrsgS46tV?=
 =?us-ascii?q?gyLkI9vXwEaX1Dv5Qpd03QMwaTcoGO8uz7cZXeJyP0asUDU16hXkEB2onswP?=
 =?us-ascii?q?03ev4zRlvo4dEOqAk3A4/yIY2mbkImKdR3ZpG+NG9sHNQtQj4xpw0JP4sujj?=
 =?us-ascii?q?yNCnHioCSfOtEYvMS6Px7bCojAPd5aK7e5SmhTBDDro10TFZtLW2ZQ6CKoZ0?=
 =?us-ascii?q?GxR4wuE+LjT8J2nU7E9NVas9k+wP/S7PwiTK/Tl10L+WZvKqsHtq3XQux0ir?=
 =?us-ascii?q?u0=3D?=
X-IronPort-AV: E=Sophos;i="5.95,191,1661832000"; 
   d="scan'208";a="82916933"
Date: Mon, 17 Oct 2022 15:19:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH for-4.17 v5 10/17] libs: Fix auto-generation of
 version-script for unstable libs
Message-ID: <Y01kcsWEhPVhsYfR@perard.uk.xensource.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-11-anthony.perard@citrix.com>
 <05589025-a3cd-8a8c-491e-089fd6d89c6c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05589025-a3cd-8a8c-491e-089fd6d89c6c@citrix.com>

On Fri, Oct 14, 2022 at 06:16:27PM +0000, Andrew Cooper wrote:
> On 13/10/2022 14:05, Anthony Perard wrote:
> > Alternatively, we could remove the need for to generate a
> > version-script, but that would mean the exported symbols won't have a
> > version anymore (like before, a few versions of Xen ago). Or, we could
> > use --default-symver, but the symboled would be versionned with the
> > soname (e.g. "libxenctrl.so.4.16.0") instead of "VERS_4.16.0".
> 
> It turns out that the use of VERS_* everywhere is buggy.  We should have
> had 'XEN$FOO' in the soname for libraries.  But it's too late for the
> stable ones.
> 
> As far as the unstable libraries go, it really doesn't matter.  The only
> thing we care about (rightly or wrongly) is that you can't mistake the
> libraries from different versions of Xen.
> 
> --default-symver sounds like it would be ideal, and avoid writing out
> temporary version scripts.

Sounds good to me, I'll rewrite the patch to use --default-symver.
Hopefully, that's an old enough option.

Thanks,

-- 
Anthony PERARD

