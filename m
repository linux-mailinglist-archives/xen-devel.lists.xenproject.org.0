Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D746E6F5C68
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 19:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529401.823787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFsq-0002Fp-VP; Wed, 03 May 2023 17:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529401.823787; Wed, 03 May 2023 17:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFsq-0002Cj-ST; Wed, 03 May 2023 17:03:16 +0000
Received: by outflank-mailman (input) for mailman id 529401;
 Wed, 03 May 2023 17:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zA8=AY=citrix.com=prvs=480c9ef0c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puFsp-0002Cd-5k
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 17:03:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6229df47-e9d4-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 19:03:12 +0200 (CEST)
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
X-Inumbo-ID: 6229df47-e9d4-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683133392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TFk000qXnvuKsmqHZ8WX/bYNw58Rk1KBLQEnXQGux8M=;
  b=Z0j0Bk6uCZXOdsBLz3jPU3HfL+XWLR9I09bzv24vcESjOGnRZVrgXfNA
   ta7QtFc4o8M3KSfMqzwBXI06+6riEJ81wLU40cKkWNMACLfkCc0YLg3SZ
   cadA9C3F+i4+9dNT2OEgOd/xyJ+Oqv+JjQiczEeh+QLHIsM+7l62oSrQw
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110190138
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:sVtXLqhjwiauR/ZizUulX+AuX161dxAKZh0ujC45NGQN5FlHY01je
 htvWD3SOPuIZzHxLdB+btnjo0pTupPUndFiHlA/pChkECgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tREKiI3bjaIntiq0Y+fd/Uwo58JJcPCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 zqfrjygWUFy2Nq3igOPrUiW2ObzvRjLZbwrCK+mq6A3nwjGroAUIEJPDgbqyRWjsWaiWtd3O
 0ESvC00osAa/VSmVNDnUzWkoXSPuVgXXN84O+818gaW0YLP/h2UQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAKKUcSaClCShEKi+QPu6lq0EiJFIw6Vvfo0JusQ2qYL
 y22QDYW27cBt84t3LyB4UH6pw+w+r2SZAc/z1CCNo661T+VdLJJdqTxtwiAta8afNnGJrWSl
 CNawpbDtYjiGbnIzXXQG7tVQdlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGjoctOepd8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFywfpnZ
 MzGKJz2VCZy5UFb8dZLb71Fje9DKt4WnAs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0Z5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI/QjF9V6OPnul9E2Gn9owM/tr1E
 riGchcw4DLCabfvd21mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:V982hairHaw8sVIoyQv8TIKZnXBQXlMji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wxwZJhNo7G90ey7MArhHLROkO4s1NSZMzUOxlHYSr2KhLGKq1eMJ8S9zJ8k6U
 4HSdkENDSaNzZHZKjBkXWFOudl7N6b8L25wcfypk0dMj2CspsQlTuR3Dzrb3FedU19CZ0lD4
 rZw8xIqTa6EE5nDPiTNz0+U+/fvM2OsZTpbxIcQzsq9wWK5AnYjYLSIlyj0hACSCMK+Kwl8m
 TOjmXCl8aemsD+8BPaynTCq69bgd7wjuZEbfb87vQoFg==
X-Talos-CUID: 9a23:2hL3xGww7DzlUDf2SilKBgVIGNIfclvW1U3MMnKcNHo1bea/QFW5rfY=
X-Talos-MUID: 9a23:WHvQ8gi07hnAne3yEbQzt8Mpd/5ivJ6UVkkxsa42hve9KT5uZmnAk2Hi
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="110190138"
Date: Wed, 3 May 2023 18:02:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/3] tools: Use new xc function for some
 xc_domain_getinfo() calls
Message-ID: <1828a067-95fe-4d6e-9923-54f76593b9d8@perard>
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502111338.16757-3-alejandro.vallejo@cloud.com>

On Tue, May 02, 2023 at 12:13:37PM +0100, Alejandro Vallejo wrote:
> diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
> index 22eb160659..796b009d0c 100644
> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -87,14 +87,14 @@ static int init_acpi_config(libxl__gc *gc,
>  {
>      xc_interface *xch = dom->xch;
>      uint32_t domid = dom->guest_domid;
> -    xc_dominfo_t info;
> +    xc_domaininfo_t info;
>      struct hvm_info_table *hvminfo;
>      int i, r, rc;
>  
>      config->dsdt_anycpu = config->dsdt_15cpu = dsdt_pvh;
>      config->dsdt_anycpu_len = config->dsdt_15cpu_len = dsdt_pvh_len;
>  
> -    r = xc_domain_getinfo(xch, domid, 1, &info);
> +    r = xc_domain_getinfo_single(xch, domid, &info);
>      if (r < 0) {
>          LOG(ERROR, "getdomaininfo failed (rc=%d)", r);

You could change this error message. The value of 'r' isn't interesting
anymore. Instead, you could replace that by LOGE or LOGED (both will
print errno).


Otherwise, patch looks good:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

