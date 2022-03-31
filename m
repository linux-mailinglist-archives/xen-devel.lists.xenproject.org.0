Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B064EDBC5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 16:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297015.505800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvuE-0008Re-3T; Thu, 31 Mar 2022 14:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297015.505800; Thu, 31 Mar 2022 14:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvuE-0008Ps-0Y; Thu, 31 Mar 2022 14:36:10 +0000
Received: by outflank-mailman (input) for mailman id 297015;
 Thu, 31 Mar 2022 14:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCIW=UK=citrix.com=prvs=082fe6e5b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZvuD-0008Pl-Cn
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 14:36:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b5ed1a-b0ff-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 16:36:06 +0200 (CEST)
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
X-Inumbo-ID: e4b5ed1a-b0ff-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648737366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s21ZrJIYWGkZietPZDtcq5HY/HgyfJiljyr20umAk8Q=;
  b=WH5ciLwzDFs4tlUH7bsOMsQdwNRnXZUUi+E1ESCZUrk9Sif37OCu6htO
   LBImCUX/0GacP42PrrBohia5ctNRVffWzC8tsPLZfSvjZpQDMGzgQ19j+
   3U2EQbbeGltKnn3yRPdjxFG1Y/ariycq7O71GypOklC88igwfEq2Lvb42
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68069126
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8LVUI6o0xZVLYoofrgSeMLLS5h9eBmLCZRIvgKrLsJaIsI4StFCzt
 garIBnVOffZMDD9eIp0aNu/pE4O65XTxoQ2GgdrrHw3FHhE95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 oqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBY/P9wfYsTwBkEg5GPa599/zVHGaBmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPEyeMkQVZD/7Dro33+eLt0HbSAZotV2P9YsbuknhyU9Yhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34QSC9nWgl+rehxTRUYgZFKC73vNyiVjVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6bG2wFQzhpeNEg8sgsSlQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkA9J2IYeTUNSwdD5tD5uZwylTrGVNMlG6mw5uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRrx+KmQXD8p/znWcVql7Th2J5yYebKBvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8AZmOyvpngGiausM4bFyhJEfUYXY
 8vzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDJGelbbQTQNL1msctoRTk5F
 f4FbaNmLD0FDYXDjtT/q9ZPfTjm01BlbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6/DP5X8CNgVQRxbAnA5pTWSdv2hEvpX8BsJudPGS0K5aMcc
 sTpjO3bXKwVE26XqmlFBXQ/xaQ7HCmWacu1F3LNSFACk1RIHVahFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:Xwtx+6D/yhXDK2XlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="68069126"
Date: Thu, 31 Mar 2022 15:35:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Ping: [XEN PATCH v10 1/7] build: grab common EFI source files in
 arch specific dir
Message-ID: <YkW8SiT9X4yxFwUG@perard.uk.xensource.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
 <20220322112238.1117737-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322112238.1117737-2-anthony.perard@citrix.com>

Hi Julien, Stefano, Bertrand,

Could I get a ack on this patch and the next one
"[XEN PATCH v10 2/7] build: replace $(BASEDIR) by $(objtree)" for the
Arm part?

Cheers,

On Tue, Mar 22, 2022 at 11:22:32AM +0000, Anthony PERARD wrote:
> Rather than preparing the efi source file, we will make the symbolic
> link as needed from the build location.
> 
> The `ln` command is run every time to allow to update the link in case
> the source tree change location.
> 
> This patch also introduce "efi-common.mk" which allow to reuse the
> common make instructions without having to duplicate them into each
> arch.
> 
> And now that we have a list of common source file, we can start to
> remove the links to the source files on clean.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

-- 
Anthony PERARD

