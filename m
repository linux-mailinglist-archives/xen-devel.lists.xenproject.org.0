Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD325AF023
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 18:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399962.641408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVbG9-0003B1-1C; Tue, 06 Sep 2022 16:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399962.641408; Tue, 06 Sep 2022 16:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVbG8-00038f-UG; Tue, 06 Sep 2022 16:17:08 +0000
Received: by outflank-mailman (input) for mailman id 399962;
 Tue, 06 Sep 2022 16:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVbG7-00038X-6P
 for xen-devel@lists.xen.org; Tue, 06 Sep 2022 16:17:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5773a119-2dff-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 18:17:04 +0200 (CEST)
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
X-Inumbo-ID: 5773a119-2dff-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662481024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YfF7/bF8WU/pjrvwWc2SIoOahm/BgDfKpK0v/DTvpPU=;
  b=MoSap0l/zEhuXVYLoUdHF6iS7HH9xrteBGGyc57NfGsYa4S/mhlFzx5b
   JPigDkBJykn/oD6mMsS0y/QDrIqsBjnJ7CFP9lADtA8h1OUPNvbzDbz27
   LQzOfKmk+zZQbFkW+AZiXJB/J17aWViAhCxGggsvKv6Uyhzv7zKPuIH3c
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79564824
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N7Mde6gBBSZwekD1TIwTXH+AX161IRcKZh0ujC45NGQN5FlHY01je
 htvCmvSa6nYZDPwLdknaoqxoUoEupHdn4BnTwM5/3pnQyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KWq5mtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ePIZf+b91Wm5y9
 v0JGBsAaxOgoM2nz+fuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyYYeLJozQGa25mG6Do
 3DG0jzFWSo4d8yvxBujrF6+37bAyHaTtIU6S+Tjq68CbEeo7msXBR4NSUqgodG2j0e/X5RUL
 El80i8vrqV09EuvS9Tmdxm5pneeuVgbQdU4O+gz9AGMx7eS+wGYHGkJVBZFadovrshwTjsvv
 neLgtfoCDpHoLCTD3WH+d+8rzyoPjMOBXQffiJCRgwAi/H8pKkjgxSJScxseIarj9v+FDfsh
 T+XrTQigKk7ic8N3r+8u1fdjFqEtpXPCwI4+AjTdmak9R9iIp6oYcqv81ezxehBNouCTh+Co
 X0NgeCa7eYHF5bLkzaCKM0WALyn7vCCdibAiFRiG50g8TWF63+nfIZApjp5IS9BO8IJaXnjb
 UnVtA554J5VNWGtK6htbOqZENgwxLTnDpHpW+78acILZplqaBTB+CBobFSXmWf3nyARfboXY
 MnBN5z2VDBDVPohnGHeq/ohPaEDxyt5xjrRHp/HzBW24ZGTYX22bpgUPw7bBgwm159osDk54
 v4GaZXQk0UEAbOgCsXE2dVNdA5XdBDXEbiz8pUKLbDbf2KKDUl7U5fsLaUdl5uJdki/vsPB5
 TmDV0BR0zITblWXeFzROhiPhF4CNKuTTE7X3gR2Zz5EI1B5Pe6SAF43LvPbh4UP+u151uJTR
 PIYYciGCfknYm2ZpW5BNcOs89c4K03Daeey082NOWFXQnKdb1aRpo+MkvXHr0Hi8RZbReNh+
 ub9h2s3sLIIRhh4Dda+Vc9DO2iZ5CFF8N+eqmOSfbG/jm2wr9UxQ8Ew59drS/wxxeLrn2HFi
 FjJXkZB9YEgYeYdqbH0uExNlK/xe8MWI6aQNzWzAWqeXcUCwlee/A==
IronPort-HdrOrdr: A9a23:H/svbKoH2zbWblF2jXmc52kaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="79564824"
Date: Tue, 6 Sep 2022 17:16:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V5 2/6] libxl: Add support for Virtio GPIO device
Message-ID: <YxdycegwGVpX/S3q@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8ce51411dd910ead787be4aabb7239fcb3689972.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8ce51411dd910ead787be4aabb7239fcb3689972.1661159474.git.viresh.kumar@linaro.org>

On Mon, Aug 22, 2022 at 02:45:14PM +0530, Viresh Kumar wrote:
> This patch adds basic support for configuring and assisting virtio-mmio
> based virtio-gpio backend (emualator) which is intended to run out of
> Qemu and could be run in any domain.
> 
> An example of domain configuration for Virtio Gpio:
> gpio = [ "" ]
> 
> Please note, this patch is not enough for virtio-gpio to work on Xen
> (Arm), as for every Virtio device we need to allocate Virtio MMIO params
> (IRQ and memory region) and pass them to the backend, also update Guest
> device-tree. A subsequent patch will add these missing bits. For the
> current patch, the default "irq" and "base" are just written to the
> Xenstore.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Most comment on the previous patch would apply to this one as well.

Cheers,

-- 
Anthony PERARD

