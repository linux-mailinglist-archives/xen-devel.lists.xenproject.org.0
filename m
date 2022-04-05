Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6BB4F37BA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 16:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299111.509616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbk6J-0001kU-TK; Tue, 05 Apr 2022 14:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299111.509616; Tue, 05 Apr 2022 14:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbk6J-0001hs-Q6; Tue, 05 Apr 2022 14:24:07 +0000
Received: by outflank-mailman (input) for mailman id 299111;
 Tue, 05 Apr 2022 14:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLbn=UP=citrix.com=prvs=0878235d2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nbk6H-0001hm-VC
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 14:24:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab8a811-b4ec-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 16:24:04 +0200 (CEST)
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
X-Inumbo-ID: 0ab8a811-b4ec-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649168644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jujJyxLjaVGhBGCD3FuCmkLh3dgzDZvsxlACmDmXXAA=;
  b=QGHZF9//VYcMztc5jmp+vG7cSxy9U1cpUIeKxlD2YbMJNQxX7QFjqLXd
   TOKygnYKmmYNU2C/ltcIoFbQUE+nU1mZbpyrVfg2LsYuLVUjGIoWyyzWx
   vEvgfQB+H/RQBTREyIOda/jchUGu+Fy0VHtjOVNczeCIy3829q8KF6OAi
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67949315
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qp4xU6k6fJfsZAtUvuwNRjvo5gw7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaCziEMq3fNGX0fNl/bY62/U4PvpHQn9IySlBkrXs3HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW17V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYcVg2fY3livsheRhRKhNhE5Zf4pHeGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNmszPU+ZPnWjPH8xFrscx+fxokXecmZJ82uxgZMO8kLMmVkZPL/Fb4OOJ43iqd9utkuUu
 2vc82PRAhgQN9uE1XyD/27ErvXOliPyQo5UFLC++vNwm1qV7mgSDhQMUh28u/bRolWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceXTU30
 neZktWvAiZg2JWNQ3Wb5LaSrBuoNCQVJHNEbigBJSMc7tz+5Y0+kB/LZtBkFqGzk5vyAz6Y6
 yuKoS4iiqQ7gssC1qH99lfC6xq1q53UCxIv5xvWV2aN6AR/a4i4IYuy5jDz6P9aJ4udCFCZs
 nUAkcGD6cgBCJiMkGqGR+BlNLSy+96fPTHciEIpFJ4knwlB4Fb6I9oWumsnYh40bIBUIlcFf
 XM/pytpu4AQHFK4cpNdYouIOdsE9rH6O83cA6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7H8iT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7cAtiwZsTX8meRylrmgireFcO9IYJUaK5/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj/CphZXBxYQ30hxDPhLpDCo9FKvPbmpF9qoReIQNcF
 aFZK61s/NwRItg4x9jtRcak99EzHPharQmPIzCkcFACk21IHGT0FivfVlK3rkEmV3Pv3eNn+
 uHI/l6LEPIrGlU5ZO6LOa3H8r9ElSVE8A6EdxCTeYc7lYSF2NUCFhEdeddseptWdEqammXBv
 +tUaD9BzdTwT0YO2IGhrci5Q02BSbYW8pZyd4UD0YuLCA==
IronPort-HdrOrdr: A9a23:RaePKq5e5/CZBpTRLQPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="67949315"
Date: Tue, 5 Apr 2022 15:23:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to
 XEN
Message-ID: <YkxQ9JUtfn5t8oSR@perard.uk.xensource.com>
References: <20220326165825.30794-1-shentey@gmail.com>
 <20220326165825.30794-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220326165825.30794-2-shentey@gmail.com>

On Sat, Mar 26, 2022 at 05:58:23PM +0100, Bernhard Beschow wrote:
> igd-passthrough-isa-bridge is only requested in xen_pt but was
> implemented in pc_piix.c. This caused xen_pt to dependend on i386/pc
> which is hereby resolved.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

