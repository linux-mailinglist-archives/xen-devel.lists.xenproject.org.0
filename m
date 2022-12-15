Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DA64DC73
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 14:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463412.721581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5obb-0001xu-Lj; Thu, 15 Dec 2022 13:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463412.721581; Thu, 15 Dec 2022 13:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5obb-0001ur-IF; Thu, 15 Dec 2022 13:48:59 +0000
Received: by outflank-mailman (input) for mailman id 463412;
 Thu, 15 Dec 2022 13:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQug=4N=citrix.com=prvs=341112f0b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p5oba-0001ul-MA
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 13:48:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 367fbf9b-7c7f-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 14:48:56 +0100 (CET)
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
X-Inumbo-ID: 367fbf9b-7c7f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671112136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CWkI7iE9yBemO1kLNgBJyT0l05PwFxxBwsc5g8LXci8=;
  b=JZEZuX8J1igmAgz6vCCX0EMtjEVu6a+VtyITw6MAaXkZiVk9fvqNKfDM
   Urn903ZgGURL7GViMm+S+KWHv9v05GxsvEn+sDmo3YKYk1LR7AAD+jITT
   NdNLamDFfNVu7SJsVc7JdA89dTYY8TJ0kLcPwS6Rgn0bnlc53fZ3EBAWb
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91034039
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Dt3tyqvCvGCR8ciSdH1jEIq+yefnVEJZMUV32f8akzHdYApBsoF/q
 tZmKTiAO6qOYWumeNwlb4y/oR5VupSByoQyQQZtry9kRHgW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHyiFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKBs1Pz2Al8+NwqOnEPAwgMMJKNPbBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27J/
 zqdozyiU3n2MvSz6j6q31SU2tPItnP+aKIAD4Oa1fd11Qj7Kms7V0RNCArTTeOCoku3R9JeJ
 lFS4i0vt6k/7mSvT9/0RRr+q3mB1jYHR9deGus9rhqRw6DZ5wKYAGksXj9Fado28sQxQFQC3
 1uEj5XjCDppvbC9TXOb/62T6zSoNkA9MmsqdSICCwwf7LHLp4U+jQnTX81jOKGwh9zxXzr3x
 liiqSk9ivMTisoO2r6T+VHBiiir4J/TQWYd/RnNV36i9UZ1aZCNYJTt7VnA8e0GKIefR0OG+
 n8elKC27u8UCoqWvDeQW+hLF7asj96VPTuZjVNxEp0J8zW252XlbY1WpjZkKy9BLMcedCTpJ
 kzOvApLzJtSOnKwaulweY3ZI9ory6PtE8ijWe3VcsZJfrB1dQmO5iYoYlSft0jqi1MwnLojf
 J6XdMeqJWYXD7x9yzi7TPtb1qUkrgg82GfSSJbT3xmhl72EaxaopawtaQXUKLpjteXd/VuTo
 40329a2Jwt3UMbGMwTU4aMoL0EWd2FnA5fcr9ZnT7vWSuZ5I10JB/jUyLInXoVqmaVJi+vFl
 k2Atl9kJEnX3iOed1jTApx3QPa2BMsk8ypnVcA5FQzws0XPd7pD+0v2m3EfWbA8vNJuwvdvJ
 xXuU5XRW68fItgrFtl0UHUckGCAXE7z7e5tF3D/CNTaQ3KHb1KhxzMcVlGznBTi9wLu3SfEn
 5Wu1xnAXb0ITBl4AcDdZZqHlg3u5CBBwrwvDhGWeLG/nXkAFqAwc0Qdadduc6kxxejrnGPGh
 256/z9GzQUyn2PF2IaQ3v3Vx2tYO+B/AlBbDwHmAUWebEHnEp6Y6dYYCo6gJGmNPF4YDY3+P
 Y25OdmgaqxY9LuL2qIge4tWIVUWvIaw/OUHl107Qx0mrT2DU9tdH5VP5uEX3oUl+1OTkVHet
 p6nkjWCBYi0BQ==
IronPort-HdrOrdr: A9a23:ZyW2e6HK11bkWPGHpLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-IronPort-AV: E=Sophos;i="5.96,247,1665460800"; 
   d="scan'208";a="91034039"
Date: Thu, 15 Dec 2022 13:48:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, <osstest-admin@xenproject.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, <stratos-dev@op-lists.linaro.org>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Mathieu Poirier
	<mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>, Oleksandr
 Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Message-ID: <Y5slue6ujqmCscJd@perard.uk.xensource.com>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>

On Thu, Dec 15, 2022 at 07:01:40PM +0530, Viresh Kumar wrote:
> The field 'base' in 'struct libxl_device_virtio' is defined as uint64,
> while we are printing it with '%lu', which is 32bit only 32-bit
> platforms. And so generates a error like:
> 
>   libxl_internal.h:4388:51: error: format '%lu' expects argument of type 'long
>   unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned
>   int'} [-Werror=format=]
> 
> Fix the same by using PRIx64 instead.
> 
> Now that the base name is available in hexadecimal format, prefix it
> with '0x' as well, which strtoul() also depends upon since base passed
> is 0.
> 
> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Couldn't test on 32-bit platforms yet, but works fine for 64 bit one.
> 
>  tools/libs/light/libxl_virtio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index 6a38def2faf5..2217bda8a253 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -45,12 +45,12 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
>      const char *transport = libxl_virtio_transport_to_string(virtio->transport);
>  
>      flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
> -    flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
> +    flexarray_append_pair(back, "base", GCSPRINTF("0x%"PRIx64, virtio->base));

There is also PRIu64 that exist, which would be perfect to replace %u.
Could we use that instead?

I'd rather not have to think about which base is used for numbers in
xenstore. I can't find any hexadecimal numbers in xenstore for a simple
guest at the moment, so probably best to avoid adding one. And using
hexadecimal isn't needed to fix the build.

Thanks,

-- 
Anthony PERARD

