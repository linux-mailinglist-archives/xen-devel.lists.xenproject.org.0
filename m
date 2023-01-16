Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6D66CE6C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 19:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478923.742437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTws-00073x-0A; Mon, 16 Jan 2023 18:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478923.742437; Mon, 16 Jan 2023 18:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHTwr-00071M-TF; Mon, 16 Jan 2023 18:11:09 +0000
Received: by outflank-mailman (input) for mailman id 478923;
 Mon, 16 Jan 2023 18:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6LTC=5N=citrix.com=prvs=37359307f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pHTwq-00071G-MB
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 18:11:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e17075-95c9-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 19:11:01 +0100 (CET)
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
X-Inumbo-ID: 20e17075-95c9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673892661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PYmDV5e5rqbDlmbOmu7LxHMAgMbJvk0lbqajoZZKocw=;
  b=Wz14F45DH5WUqS6LsGFhZev2XVKSzfDcxt1ORazZ7NN7ikrgmk6IiyLu
   YwV/ckXQ3jJb0J5W42pGLxRfpsmD1c6IsnZpY117pQ5ttX2YKKr+viyk9
   03FtkXxQc+7DZSoEXYHuMFXHix9P+Bo2/IoQDWkJfNfimPlIgxvV5b5QI
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92321921
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cb9dUqqF2X9oG//G7+OQrghKytleBmI7ZRIvgKrLsJaIsI4StFCzt
 garIBmFPfmOM2qjedpzPdm09E4F65HQxtVnSQJlrXgwQSNHp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzidNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC4qZzeZtqWw+7i2Zblj3+cFJuSwMLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOcpD6gU0tDXDCZ4QS321fxr8PooQfyc9hPGaX/9v0pknTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U49QWMx6z88wufQG8eQVZpd9gOpMIwAzsw2
 TehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqZyUJUA8E6NnLu5wog1TESdMLLUKupoSrQ3eqm
 WnM9XVgwexJ1qbnyplX43jZpDuLvKmOSDU/6yqHUTuGyAlUP4KcMtnABUfg0RpQEGqIZgDf4
 yNZxJbCt7lm4YKlz3LUHrhUdF29z7PcaWCH3wYyd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQDPY6/PhwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChFUvQ/k2TtFr1Gj9fHIxzSIkuKFfjGI+mPi+LCNBZ5t59YWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/qOYuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVAR8JlQOm2S2acm1nqBlLMdvSYHq2llpjVQREALpi8yJLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:JjkOo6+vT/ptoeMmHEBuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="92321921"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 0/1] xen: rework compat headers generation
Date: Mon, 16 Jan 2023 18:10:47 +0000
Message-ID: <20230116181048.30704-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-include-rework-v3

v3:
- Rewrite script into python instead of perl.
  (last patch of the series)

v2:
- new patch [1/4] to fix issue with command line that can be way too long
- other small changes, and reorder patches

Hi,

This patch series is about 2 improvement. First one is to use $(if_changed, )
in "include/Makefile" to make the generation of the compat headers less verbose
and to have the command line part of the decision to rebuild the headers.
Second one is to replace one slow script by a much faster one, and save time
when generating the headers.

Thanks.

Anthony PERARD (1):
  build: replace get-fields.sh by a python script

 xen/include/Makefile            |   6 +-
 xen/tools/compat-xlat-header.py | 468 ++++++++++++++++++++++++++++
 xen/tools/get-fields.sh         | 528 --------------------------------
 3 files changed, 470 insertions(+), 532 deletions(-)
 create mode 100644 xen/tools/compat-xlat-header.py
 delete mode 100644 xen/tools/get-fields.sh

-- 
Anthony PERARD


