Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3C267A77
	for <lists+xen-devel@lfdr.de>; Sat, 12 Sep 2020 14:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH4y0-00055U-Ub; Sat, 12 Sep 2020 12:49:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aew9=CV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kH4xz-00055P-Rp
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 12:49:19 +0000
X-Inumbo-ID: 89dc9c11-b0c1-4bae-a595-03114ba707a9
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89dc9c11-b0c1-4bae-a595-03114ba707a9;
 Sat, 12 Sep 2020 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599914959;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jUdRS6SeZg/kgdnnLF5Uh6LL3/4AV5oJUiusxebayfI=;
 b=XWNInsBUF8XWCd++wtHnC+70cv4kMt7gOvu7/KpJDFXg5CwpBoVplCx3
 ruUrnCPgQ4OriFulA09bL1Q2EBXJrAxM6KHI02t0ulhTPOKz/lgXyOSnN
 HxwitHrDtyp0okik22v52bsKRF+XGzdYLpRnaAsdztMqnpG+VdPMhLrlK I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: arcw8EuJep5MBmSQ/tJOIbGw0riS/184mjCqKowH9Qn41e8QB09CT70rr7V8yrWKKO/V4FykgM
 LovQmv2PC+mD8PZB2hkZA+8UlFy24OOIMw7NkUzR6mRU4AfkQtO7uDZ2wpLcmwwHlSNmm9NX1i
 UDL6Bcpcm4mfYEfr5tkqeSpHt81iUnn8AoZuk5FTug/qLEdu++ivGSPv3nmxa6EtfJI5j5C0uz
 8iNd8mwYzhUi/zgkeETHqwYFqHi7IsjlAmm90K3lUY+hZ9XJkOhNvH/oT8EYZPn7QwXhVCW5mf
 HB4=
X-SBRS: 2.7
X-MesageID: 26892440
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,420,1592884800"; d="scan'208";a="26892440"
Subject: Re: [PATCH v2] tools/libs/stat: fix broken build
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200912082132.21108-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d302e80a-9944-9612-47fe-1c1d04212e5a@citrix.com>
Date: Sat, 12 Sep 2020 13:49:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200912082132.21108-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 12/09/2020 09:21, Juergen Gross wrote:
> Making getBridge() static triggered a build error with some gcc versions:
>
> error: 'strncpy' output may be truncated copying 15 bytes from a string of
> length 255 [-Werror=stringop-truncation]
>
> Fix that by using a buffer with 256 bytes instead.
>
> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/stat/xenstat_linux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index 793263f2b6..4fee63e36d 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -264,7 +264,7 @@ int xenstat_collect_networks(xenstat_node * node)
>  {
>  	/* Helper variables for parseNetDevLine() function defined above */
>  	int i;
> -	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[16] = { 0 }, devNoBridge[17] = { 0 };
> +	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[256] = { 0 }, devNoBridge[257] = { 0 };
>  	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPackets, txErrs, txDrops;
>  
>  	struct priv_data *priv = get_priv_data(node->handle);

:(

In function 'getBridge',
    inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying
255 bytes from a string of length 255 [-Werror=stringop-truncation]
   81 |      strncpy(result, de->d_name, resultLen - 1);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'getBridge',
    inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying
255 bytes from a string of length 255 [-Werror=stringop-truncation]
   81 |      strncpy(result, de->d_name, resultLen - 1);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

~Andrew

