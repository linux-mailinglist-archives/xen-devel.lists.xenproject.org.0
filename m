Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A24F72C8F1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547247.854517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8irI-0007rd-4A; Mon, 12 Jun 2023 14:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547247.854517; Mon, 12 Jun 2023 14:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8irI-0007pn-1I; Mon, 12 Jun 2023 14:49:28 +0000
Received: by outflank-mailman (input) for mailman id 547247;
 Mon, 12 Jun 2023 14:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COfM=CA=citrix.com=prvs=5202ad488=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q8irG-0007ph-E5
 for xen-devel@lists.xen.org; Mon, 12 Jun 2023 14:49:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 514c58d7-0930-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 16:49:24 +0200 (CEST)
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
X-Inumbo-ID: 514c58d7-0930-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686581364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uis6XNWe+venr0IO8TUfpK2RVk+OiGSkLv7q3yoC9KA=;
  b=NgR5OSTdz9RnQyxdCLwirh42gjDOE/XvZLn6uNIzerFiLk0w4rCXPQ23
   t8Pl7yg9PBZWKI6ZK8WDEWBIWrQA4plhGu+QQThVjf/JnYziHSdZmf7UG
   PW0VXD1+yb6Y9kPEAnLA+Z10CkMmFQRTm3eD+Ja4f/PVasRvTkjiVWF7N
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112362273
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rEwOGK84dUQWjq8DQkS7DrUDwnmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WsfWG6CM/+IYTP3Kox0Pdu+oE0CuJXRzoVqHQdoqXw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6kR5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkez
 dM3GS4oNyyTuMCX+6q5a+VojZg8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxxzD+
 DicoD+R7hcyFu6zljSk/y2X2+6TkXKmA68bP+Cf+as/6LGU7jNKU0BHPbehmtGni1SzQNIZK
 FER8zAGqak0/VasCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5UCeHGdsZjxOcts9r+ctWCcnk
 FSOmrvBByFrsbCTYWKQ8PGTtzzaETYUK2QPYzNCQhYE/8XkvKk3jxTGVNElF7S65vXuBSv53
 zeR6SQzmZ0UlYsP1r6n5hbDgjSlvJ+PSRQ6ji3eWm+1qAl0YoioaqSs6F7S9/EGK5yWJnGEt
 WQEmsWDqvgJDIuMmTalROQLFauuof2CNVX0hlpiHII95i+t03GmdIFUpjp5IS9BP9wFennya
 0/SvQdQ4pB7OHqsZLVwJYWrBKwCxLDtD93/WtjIb9BFZd56cwrvwc11TRfOhSa3yhFqyPxhf
 87BKq5AEEr2F4w39BWZdvk4iIM7+QIf/nvRZJz/xEi4hO/2iGGudVsVDLefRrlnvP3e8F6Oo
 os329iikEsGDrCnCsXD2ctKdA1RcyBmbXzjg5YPHtNvNDaKD43I5xX55bo6M7JokK1O/gsj1
 iHsAxQIoLYTaJCuFOlrVpyAQOm1NXqHhShnVRHAxH7xs5TZXa6h7b0Ea7w8dqQ9+epowJZcF
 qdVJZjYUqgXG2ybpVzxiKURS6Q4LXyWaf+mZXL5MFDTgbY9L+A2xjMUVlS2r3RfZsZGncA/v
 6ehxmvmrWkrHmxf4DLtQKv3lTuZ5CFN8N+eqmOUerG/jm2wqtk1Q8Ew59drS/wxxeLrnGLCh
 13KUEZB+4EgYeYdqbH0uExNlK/xe8MWI6aQNzSzAWqeXcUCwlee/A==
IronPort-HdrOrdr: A9a23:LOy5yq/ifBXnA8uj23huk+F6db1zdoMgy1knxilNoENuEvBwxv
 rOoB1E73HJYW4qKQ4dcdDpAtjmfZquz+8K3WBxB8bsYOCIghrSEGgP1/qG/9SkIVyDygdR78
 xdmstFeZPN5DpB/LzHCWCDer5LrbXpgcPY59s2jU0dMD2CA5sQtzuRYTzrdHGeMTM2fabRY6
 Dsn/avyQDQHUg/X4CXI0BAZeLKoNrGmfvdEEQ7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl54242svLiyP05iv21dB7idHhwtxMCIinkc4OMAjhjQ6uecBIR6CChjYou+uigWxa0O
 Uk4i1QfPib2UmhO11dkiGdnzUIFwxerEMK/GXow0cLZ/aJAg7SRfAx3L6xOSGpmnbI9OsMoJ
 6jmVjp7Ka/RCmw7xjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWqvoMRiKoLzPKt
 MeR/309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0kso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrYkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MSyAtXiH8LAo23G4gMyLeFPGC1z2dLl1qbrTnxw2OLyvZ8
 qO
X-Talos-CUID: 9a23:etDO0Gwz+4yVdXbMZ0LNBgVEIu8KQ2P4lUvAHG2ZMn5rabGRQgOPrfY=
X-Talos-MUID: 9a23:S8BT2QaNHeHKpeBTlQ3A2z9DOZhTvqXyBBFQyrgPkJSjOnkl
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="112362273"
Date: Mon, 12 Jun 2023 15:48:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V3 3/3] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <7af57d20-6145-4416-9fa1-21cac0e2e5ea@perard>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
 <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>

On Fri, Jun 02, 2023 at 11:19:09AM +0530, Viresh Kumar wrote:
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index f8a78e22d156..19d834984777 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -48,11 +56,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
>                                        flexarray_t *ro_front)
>  {
>      const char *transport = libxl_virtio_transport_to_string(virtio->transport);
> +    const char *grant_usage = libxl_defbool_to_string(virtio->grant_usage);
>  
>      flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
>      flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
>      flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
>      flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> +    flexarray_append_pair(back, "grant_usage", GCSPRINTF("%s", grant_usage));

It doesn't seems like a good idea to write a string like "True" or
"False" in xenstore when a simple integer would work. Also I'm pretty
sure all other bool are written as "0" or "1", for false or true.
Could you change to write "0" or "1" instead of using
libxl_defbool_to_string() ?


Beside this, patch looks good to me.

Cheers,

-- 
Anthony PERARD

