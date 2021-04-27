Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2B336C90B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 18:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118683.224910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQCE-00077K-FR; Tue, 27 Apr 2021 16:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118683.224910; Tue, 27 Apr 2021 16:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQCE-00076v-C6; Tue, 27 Apr 2021 16:04:22 +0000
Received: by outflank-mailman (input) for mailman id 118683;
 Tue, 27 Apr 2021 16:04:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJzn=JY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbQCC-00076m-Im
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 16:04:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88c953f8-dc97-4b4e-a6bf-c618cc8a8e04;
 Tue, 27 Apr 2021 16:04:15 +0000 (UTC)
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
X-Inumbo-ID: 88c953f8-dc97-4b4e-a6bf-c618cc8a8e04
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619539455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VtRKiZFtOx0T950MQ1uHjCSXNqxajWiX6qcEGgMUJ5Q=;
  b=QB1z8ohQbgNymipi011+vY+PNbrvfhOONRW83Rfv4gMm8SYOW3UXGFgY
   wNxgs8MHgiSI5Aojh4sbZtDZbkepMnZUXaAAZPPYAKKnbbX/SBEtX24vh
   zFVJFcwt8EbUitmhUVsmG0uMmMEsLBCpXB2xgrSvgbvVTxgOZjOmMcMQX
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CYJCK2B+Nsj5xqlWeyHlX63lEcJtxsSC+uY1vxQUpUbMFK34mtuGfQW3U+A1HVpD09tJtHKf+H
 52iph6cukiZsGPgd11FveQ741TnZZBB8VOguWXjjAvXy285FjEnLusZDdA95udL6Qw2zTKi5Rx
 NDjBH1UXeJiAZSmraU+SUGbLUkokfFYBNuxRMRV0Q8SCdkvvsOPSUDYLscMtR4u8cetJOWqW3L
 1fCMOGHWjoW/4R2lldTR2F6Xjjqphyf9gzx6l+pyisLyqfhh7+RJ7DN98+OdVs0X1pXDiVrfRI
 fpQ=
X-SBRS: 5.1
X-MesageID: 42344144
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:y0wbDKiDqam3VUVtrPH+cKElBXBQXwB13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy48XILukQU3aqHKlRbsSiLfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2SmO2l7XhNPC5Z8NL
 f03Kp6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMA9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m4ufJ+594K+GnzuQQIjXooA60aIpmQK3qhkFJnMifrGwEvf
 OJjxA8P9liy365RBDInTLdnzPO/Rxry3j+xUSWiXHuyPaJOw4SOo56qq9yNj76gnBQ2O1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7nackD4ZvsM4y0BEXZB2Us43kaUvuHl7Pb0nByzA5IUuAI
 BVfbrhzccTS1+cYnzD11MfpuCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w49yK4=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42344144"
Date: Tue, 27 Apr 2021 17:04:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 07/14] tools/xl: Use const whenever we point to literal
 strings
Message-ID: <YIg1+x/cR1Ft5H3u@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-8-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-8-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:06PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index 137a29077c1e..3052e3db0072 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -21,13 +21,13 @@
>  #include <xentoollog.h>
>  
>  struct cmd_spec {
> -    char *cmd_name;
> +    const char *cmd_name;
>      int (*cmd_impl)(int argc, char **argv);
>      int can_dryrun;
>      int modifies;
> -    char *cmd_desc;
> -    char *cmd_usage;
> -    char *cmd_option;
> +    const char *cmd_desc;
> +    const char *cmd_usage;
> +    const char *cmd_option;
>  };

Those const in cmd_spec feels almost the wrong things to do, but it is
also unlikely that we would want to modify the strings in a cmd_spec so
I guess that's fine.

I'm thinking that `cmd_table` should be const as well (I mean
const struct cmd_spec cmd_table[];) as there is no reason to modify the
entries once they are in the table. I'll send a patch.


The rest looks good.
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

