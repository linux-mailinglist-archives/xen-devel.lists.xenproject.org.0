Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8464268FD5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqOY-0001kx-Kl; Mon, 14 Sep 2020 15:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHqOX-0001ko-Er
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:27:53 +0000
X-Inumbo-ID: c7644332-4804-4820-8ce1-ecd76ffb10b3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7644332-4804-4820-8ce1-ecd76ffb10b3;
 Mon, 14 Sep 2020 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600097272;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=SV0aTEChCwMiEtTMpwuyfhExg07Zn+AfczHw1HtuRb8=;
 b=bzyRZqrpGqo9LvByKoKDinRovAqtdIuJlI/wopCLVpqTDVHC7ChC2jNa
 HPeKs5eQftAKfIK3NiXGCVbu0miw9tBinDBZU0eYsbbn7iTRJmrb0G2Ws
 hE8OKUSNhWCC/kvnC7V74kJHr4dZTnCWfaE6REPyW9UxJ8VPv8StbFl3Z c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: z2wpqtarnjqju0UQGBoXJvkT+KS1FWtFFmqZWFwz6uXfTvKFxxmYHv7ba+ZLSV5cagN366gp3h
 J/TfBvW4Am423LjR8Mo07SAyk88hInQQQ3rOV94A28jC47kONnZa1yrfV5tpV5v/4sPar4yoTh
 PyGP1h3XkaAYJcDktUxDrZYAUUNjZNqw5qriZu/WDNSVhC19kinFi8MAxSnC3DQpJiGbf96YlE
 xu2ZvvfYXILhT8YjRA3HkqHGkSNvHAPdioXwRwxP1pyXp8jxB6Via+UNuxhZDJq4XO5QzWaqgl
 qAM=
X-SBRS: 2.7
X-MesageID: 26647281
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26647281"
Subject: Re: [PATCH] libxl: User defined max_maptrack_frames in a stub domain
To: Dmitry Fedorov <d.fedorov@tabit.pro>, <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, 
 Wei Liu <wl@xen.org>
References: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <427bfd62-48c0-5859-7300-c618331b4e5a@citrix.com>
Date: Mon, 14 Sep 2020 16:27:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <602469f5-1028-8f36-7195-f102b6d2af0c@tabit.pro>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/09/2020 15:50, Dmitry Fedorov wrote:
> Hi,
>
> Implementing qrexec+usbip+qemu in Linux-based stub domain leads me to
> an issue where a device model stub domain doesn't have maptrack entries.
>
> Would it be possible to apply a user defined max_maptrack_frames value
> to dm_config in the same way as for max_grant_frames?
>
> Signed-off-by: Dmitry Fedorov <d.fedorov@tabit.pro>

This looks entirely reasonable.

CC'ing the maintainers for their opinion.

~Andrew

> ---
>  tools/libxl/libxl_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> index f2dc5696b9..f044f2566c 100644
> --- a/tools/libxl/libxl_dm.c
> +++ b/tools/libxl/libxl_dm.c
> @@ -2292,7 +2292,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc,
> libxl__stub_dm_spawn_state *sdss)
>      dm_config->b_info.target_memkb = dm_config->b_info.max_memkb;
>
>      dm_config->b_info.max_grant_frames =
> guest_config->b_info.max_grant_frames;
> -    dm_config->b_info.max_maptrack_frames = 0;
> +    dm_config->b_info.max_maptrack_frames =
> guest_config->b_info.max_maptrack_frames;
>
>      dm_config->b_info.u.pv.features = "";
>
> -- 
> 2.26.2
>
>


