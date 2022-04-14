Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ADC501A5A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 19:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304985.519767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf3Wy-0000LV-9D; Thu, 14 Apr 2022 17:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304985.519767; Thu, 14 Apr 2022 17:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf3Wy-0000Ia-5i; Thu, 14 Apr 2022 17:45:20 +0000
Received: by outflank-mailman (input) for mailman id 304985;
 Thu, 14 Apr 2022 17:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Reb+=UY=citrix.com=prvs=096d93bb6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nf3Ww-0000IU-I5
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 17:45:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a47a4fae-bc1a-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 19:45:17 +0200 (CEST)
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
X-Inumbo-ID: a47a4fae-bc1a-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649958316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4NkJuWY1T5u3oiDdR0JcD3BEo2N/VUwMRBI/LTCxpiI=;
  b=L3aYSOSbyBWNVntQWLFk3JqFQd8d/J6EX09rMrIR+qnlIrxkkHGl/+9x
   rNb0NifcGEqc4gn8y02jIRr7+rg1JPAmKQR5uDz+Pm85OMPw9nf8Ts4SF
   1Xr91SvDluJLWqGLd67Fk6tgIE1NlEujKynn4zEpbD9qmDDmX4vqvHEu9
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68872175
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:njgb76h5Hi4AZFjq5WPU+cLMX161ZBAKZh0ujC45NGQN5FlHY01je
 htvWm3SbqzZYzTzKdgiO97jpEkHsZHUy9RqQQQ9rno2ES4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1rR4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQkTEZPXhdYHbzVjFgxZErMXp+eecFHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2o/M06ZPEAn1lE/M4t5m+GnimXEcgZ7l3GUhLA74Hr/w1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPS94zeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imD8IXq+BurHFQodTtsT/M45ZBuHG0Dg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYm
 WjikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62trFm4XalznLlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYKG+zO
 BaN5VgKufe/2UdGi4ctMupd7Oxwk8Dd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZKdA5RfClnX82uwyGVH8baSjdb9KgaI6e56dscl0ZNxf49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:hqMKAa4gvjsb318b+gPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="68872175"
Date: Thu, 14 Apr 2022 18:45:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] x86/build: Clean up boot/Makefile
Message-ID: <YlhdoQsE10j+VSQg@perard.uk.xensource.com>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
 <20220414114708.4788-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220414114708.4788-4-andrew.cooper3@citrix.com>

On Thu, Apr 14, 2022 at 12:47:08PM +0100, Andrew Cooper wrote:
> There are no .S intermediate files, so rework in terms of head-bin-objs.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The patch looks fine.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

> ---
> I'm slightly -1 on this, because
> 
>   head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
> 
> is substantial obfuscation which I'd prefer to bin.

It might be possible to do something that Kbuild does, which would be to
teach the build system to look for "$(head-objs)" or maybe
"$(head-bin-objs)" when it want to build "head.o". That something that's
done in Kbuild I think to build a module from several source files.

> Anthony: Why does dropping the targets += line interfere with incremental
> builds?  With it gone, *.bin are regenerated unconditionally, but I can't see
> what would cause that, nor why the normal dependencies on head.o don't work.

Try to build with "make V=2", make will display why a target is been
rebuild (when this target is built with $(if_changed, )

$(targets) is used by Rules.mk to findout which dependencies files (the
.cmd) to load and only load them if the target exist. Then the
$(if_changed, ) macro rerun the command if prereq are newer than the
target or if the command as changed. Without the .cmd file loaded, the
macro would compare the new command to an empty value and so rebuild the
target.

Now, the *.bin files are regenerated because cmdline.o is been rebuild
mostly because make didn't load the record of the previous command run.

Thanks,

-- 
Anthony PERARD

