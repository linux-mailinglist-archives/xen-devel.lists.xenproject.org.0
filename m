Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D17681851
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487114.754590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYXf-0006M9-I3; Mon, 30 Jan 2023 18:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487114.754590; Mon, 30 Jan 2023 18:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYXf-0006Jp-Dx; Mon, 30 Jan 2023 18:06:07 +0000
Received: by outflank-mailman (input) for mailman id 487114;
 Mon, 30 Jan 2023 18:06:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYXe-0006Jj-D9
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:06:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb6dcb9-a0c8-11ed-93eb-7b0ecb3c1525;
 Mon, 30 Jan 2023 19:06:00 +0100 (CET)
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
X-Inumbo-ID: beb6dcb9-a0c8-11ed-93eb-7b0ecb3c1525
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675101960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vad01AZYH/ejT2higFuRrEqS51p2PmLYpTQW+ca61OQ=;
  b=d6xp++JgTsk08/aK5FzKEFVM6lUQrrknx/2y1eLzpH4G3lI6DgK/9cMD
   5dr2wZ0gPvc4DoN1mqYQvGoIJxmX4ScCIu3TbKnbu/2WPc0F2Axq+Xp9o
   bNLpXmC8bO+CyP44RjWKOSIQ9bRVeYIh+Rp/aTT/P1Wi60CcKVcpzqS4/
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94308129
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:oVkuc6IKDAE5BBOwFE+R9pUlxSXFcZb7ZxGr2PjKsXjdYENSgjQBz
 2ZMDD3TM6zcN2P3f9B2ad6xoR9TsJ+AyN82SwJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57KGZvz
 vsWEwtQTRCurt25mZSrTvlj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGZ4Nzh/C9
 woq+Uz0Jx0BF/m98AG1/0qjmc3zlACnUZArQejQGvlC3wTImz175ActfVm0u/6ikWalRslSb
 UcT/0IGpLA/7kWxQvHhXhezpziPuRt0c8VUO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tph7mSfdYF6COtYDWGRzZ/
 D/Tijg6l7pG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezO
 yc/WisLvve/2UdGiocqC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzvxnY
 MjCIZr0XCly5UFbIN2eHrd17FPW7npmmTO7qW7TkHxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9c8xPwMzbaVp
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldcwXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:619wKKAJcb3nN1TlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="94308129"
Date: Mon, 30 Jan 2023 18:05:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH 1/6] tools/libxc: Move xc_version() out of xc_private.c
 into its own file
Message-ID: <Y9gG8O0QYEJJL3Id@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-2-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:31PM +0000, Andrew Cooper wrote:
> kexec-tools uses xc_version(), meaning that it is not a private API.  As we're
> going to extend the functionality substantially, move it to its own file.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

