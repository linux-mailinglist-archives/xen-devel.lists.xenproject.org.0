Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A6746DD5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558205.872087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcY5-0003sX-U1; Tue, 04 Jul 2023 09:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558205.872087; Tue, 04 Jul 2023 09:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcY5-0003qr-RH; Tue, 04 Jul 2023 09:42:17 +0000
Received: by outflank-mailman (input) for mailman id 558205;
 Tue, 04 Jul 2023 09:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3Yz=CW=citrix.com=prvs=5427c2329=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qGcY4-0003ql-FH
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:42:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e589583-1a4f-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 11:42:15 +0200 (CEST)
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
X-Inumbo-ID: 0e589583-1a4f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688463735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TuXXQxQ7oFrhPAA9ILwXiKoQM74Duw62d1G9RVUZ7ks=;
  b=Mz/XOjr89FtNTvoh8jbOrHKzn0pZJIGDZoEuGpTu3NdbtRqsC9T7ktfP
   /L+podZRoJSVvCSHeLJHWLCifnm6Mm4VxN2PvmGMAxXUz2PJ+PW/q1GFY
   3N5n7Sa9PAtDAe7m9Zou5WALP30txCtQvNbX9vyT4CqWMGcl9MBSoC1fF
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113809652
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:WC4F664FWwvwp4jd8NsNQQxRtN7HchMFZxGqfqrLsTDasY5as4F+v
 jcfWz/Xbq6MZWL2ftxzPdng/B8C6MXdyNVqSQU9ris8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8T4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 bsWDCkVNgC/vuPpwKqQZuZpt5UiFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/D9
 jqXoTmjav0cHOShlwie9Sz8v9/ewgTlVoQ8Poyy3dc/1TV/wURMUUZLBDNXu8KRjlO1UpRRI
 kof9y4qsIA77kntRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMU7XyAw3
 1mF2dbgHyVysaa9QGiYsLyTqFuaJiUUa2QCaCksRBEApdLkpekbkRbnXttlVqmvgbXdHDjqx
 jmQoSsWhrMNjNUK3aG24VDGhT23opHDCAUy423/V3qo9ApjaKa5Zoaj7h7Q6vMoEWqCZgDf5
 j5ewZHYtb1QS8jXz0RhXdnhApmxoPihKSWEkWJWHsYh7x+B9HuSLIFptWQWyFhSDioURdP4S
 BaN6VMNusYObSvCgbxfONzoVZlzpUT0PZG8D62PMIITCnRkXFXflByCc3J8yIwEfKIEtagkc
 amWfs+3ZZrxIfQ2lWHmLwvxPFJC+8zf+Y8wbcqhp/hf+eDCDEN5sJ9cWLd0Usg37bmfvCLe+
 MtFOs2Bxn13CbOuMnWPoNRKcwxWfBDX4KwaTOQOJ4a+zvdOQjl9W5c9P5t8E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLMdvSsWJEhStjZ0QEZA/4s0XPlK7ztM/zgbNrJ+h4nAGipNYoJ
 8Q4lzKoWasfEmieo2tBNvEQbuVKLXyWuO5HBAL9CBBXQnKqb1ahFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:aLdbkaxhqF2IroRHEj12KrPwFr1zdoMgy1knxilNoEpuA6ulfq
 eV7ZcmPH7P6Ar5N0tKpTntAsO9qBDnlKKdg7N/AV74ZniDhILAFugL0WKF+VDd8kbFmNK1u5
 0NT0DQYueAa2STIazBkWuF+3dL+qjjzJyV
X-Talos-CUID: =?us-ascii?q?9a23=3A2PLarWsyZ1MGvxtx1DHsGsna6Is9NXP51W+IM3O?=
 =?us-ascii?q?BCDlpUJa5RlqhqaJdxp8=3D?=
X-Talos-MUID: 9a23:t0bRdgRi+dngMd5kRXTUum9QL8A2s52eGR8qj5sAleO1PwdZbmI=
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="113809652"
Date: Tue, 4 Jul 2023 10:42:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Wei Liu <wl@xen.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include
 also arm
Message-ID: <66c3d183-460d-4f34-a331-01ac4d65fc9d@perard>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230608135913.560413-1-luca.fancellu@arm.com>

On Thu, Jun 08, 2023 at 02:59:12PM +0100, Luca Fancellu wrote:
> Commit 56a7aaa16bfe introduced some SVE related code that is protected by
> '#if defined(__aarch64__)', the issue is that this doesn't take into
> consideration when the toolstack is compiled for an arm32 Dom0 running on
> an arm64 platform, it should be able to create SVE enabled guests but with
> the current code it's not.
> 
> So fix the issue by compiling the code when the toolstack is compiled for
> both arm32 and arm64.
> 
> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

