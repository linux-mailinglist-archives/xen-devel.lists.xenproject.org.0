Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A94E430B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293555.498704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgU9-0007XH-6z; Tue, 22 Mar 2022 15:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293555.498704; Tue, 22 Mar 2022 15:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgU9-0007UI-3c; Tue, 22 Mar 2022 15:31:49 +0000
Received: by outflank-mailman (input) for mailman id 293555;
 Tue, 22 Mar 2022 15:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWgU7-0007UC-D8
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:31:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2df975b3-a9f5-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 16:31:45 +0100 (CET)
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
X-Inumbo-ID: 2df975b3-a9f5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647963105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nXsgyZZfIz1dVhXoOi+6Cysy7mCTSJEfPIhEfyl19Io=;
  b=E6euFc1UhpORRFa/LMMDeBwh7rJpyS84l2FNFCB7MZh1pyyA/QbM4OUw
   7Tr3wjOBLtQRyxQByL2uBkF6ca9DScZzV5kXbPnguXUPKTeN6U3o9i1mI
   KGrdU6tiSzp6Z14qiLuhCL8aDHGezY49XQOlqK8j7urWyZKbg9aF9Wgf9
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69247299
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nWrvMqo+2MhtmrLdUopVwAJO7NdeBmIkZRIvgKrLsJaIsI4StFCzt
 garIBnSbPuPZWvxfNl/bYnioxkFuZWByYBhTgE5rSgyECoao5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 4mq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBMqyLv8ggcSliIzxkYJAf6rDmcFOnmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPU6cPEceaz/7Drobx+iqj1zhTwFkrVy7uLUM0TePkjxYhe2F3N39JYXRGJQ9clyjj
 mDb+2X0BDkKOdrZziCKmlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUJUXOrrP//jVSxM/pdJ
 FYT4TEGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iI0yyTXjc/RTKp6olIDIQCP/4
 mGhtAFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5ZIFcFg
 2eJ4Gu9AaO/2lPwNsebhKrrV6wXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8vEIZbzUClLU/o6pNZTewv7+eV3rszZ7TmOLa0XMjz9iebODJJrYelt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGMmbP/2WsidCBhbbiv8pQ/XrfafmJORTFwY9eMkOhJU9E0wMxoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8Ydc0m/CxhYnB0YwrANrpKSd/H0ZrzvqAfJdEPnNGPB9YvJ
 xXZU61s2shydwk=
IronPort-HdrOrdr: A9a23:aKtspaPlb/GSN8BcTvKjsMiBIKoaSvp037B87TEJdfU1SL38qy
 jN9M5w6faQslsssR4b9exoVJPufZq+z+8W3WByB9eftVLdyQ2VxehZhOOI/9SHIUPDH4VmpM
 RdmsZFaeEZojJB/L7HCKXTKadF/DEnmprY4tvj8w==
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="69247299"
Date: Tue, 22 Mar 2022 15:31:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 07/11] xen: generate hypercall interface related code
Message-ID: <Yjnr3FAS3G94Yf6+@perard.uk.xensource.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220310073420.15622-8-jgross@suse.com>

On Thu, Mar 10, 2022 at 08:34:16AM +0100, Juergen Gross wrote:
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index a3c2511f5f..b52a2da40c 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -77,6 +77,18 @@ $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/
>  	cat $(filter %.h,$^) >$@.new
>  	mv -f $@.new $@
>  
> +quiet_cmd_genhyp = GEN     $@
> +define cmd_genhyp
> +    awk -f $(src)/../scripts/gen_hypercall.awk <$< >$@

You should use "$(srctree)" instead of "$(src)/..".

$(srctree) always point to the source tree of the hypervisor. ( $(src)
doesn't necessarily point to "include/" in the source tree. )

> +endef
> +
> +all: $(obj)/xen/hypercall-defs.h
> +
> +$(obj)/xen/hypercall-defs.h: $(obj)/hypercall-defs.i $(src)/../scripts/gen_hypercall.awk FORCE

Here as well, it would be better to use $(srctree) instead of $(src)/.. .


> +	$(call if_changed,genhyp)
> +
> +targets += xen/hypercall-defs.h
> +
>  ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
>  
>  all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk

Cheers,

-- 
Anthony PERARD

