Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F269B206
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 18:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497214.768112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qd-00032N-UY; Fri, 17 Feb 2023 17:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497214.768112; Fri, 17 Feb 2023 17:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qd-0002uk-Qs; Fri, 17 Feb 2023 17:48:39 +0000
Received: by outflank-mailman (input) for mailman id 497214;
 Fri, 17 Feb 2023 17:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pT4qc-0002rh-PM
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 17:48:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de634fe-aeeb-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 18:48:36 +0100 (CET)
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
X-Inumbo-ID: 4de634fe-aeeb-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676656116;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qi06rQ6jIxtATArya/6ZWUCfIXvC0M1kM2wXHuTfZm8=;
  b=KFDp12A0PDNUozG82O31zc3jgFG3qPfReVh4232JAT3n/hKmS8PDdrmf
   tnPMwQtRZeajHZAVYqkVIJtkrZVcxPyUzjzRNmv6pgypYS/QVy5ttMXIH
   UvcDk7RXPNYF1SZ/vKgx4erGkW5y+4Cua2VvmWuVdg+vfMikY1950ZqX+
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96897980
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6xXvmqMZY0Fo7SzvrR3Ul8FynXyQoLVcMsEvi/4bfWQNrUoh1mMEy
 WEXC2jQMquKMDD8f9wiaY61pB9Vv8LQn95gGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ul4PUVW+
 axHEyAQcDLdiOX1npKpcuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUo3UFZQKzxbAz
 o7A1zroPSA2BPyA9QSUoiOcp8LumwH3e51HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyNuV3x6nU4oiBpZ9MakNc6FWMRx
 kKXvY3mAn8xkK+tRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5LChAztJcvX/MBofAnqNOjwj8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5l0Mu8UPZCvxNv8fj2eN5yMCl/WIKDgYfqqMMoomjmZZKmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf0P8dZCfM9EieVD7nlnlQvuqWXTk0zPPUy2OCTEFt/o8TKmMogE0U9ziF6Jo
 ogGZ5PQkEo3vS+XSnC/zLP/5GsidRATba0aYeQMHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:Njs2vq600z9ODk9ErgPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-IronPort-AV: E=Sophos;i="5.97,306,1669093200"; 
   d="scan'208";a="96897980"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86/kexec: ASM improvements
Date: Fri, 17 Feb 2023 17:48:11 +0000
Message-ID: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Mostly to get ELF metadata, but some other easy improvements too.

Andrew Cooper (3):
  x86/kexec: Drop compatibility_mode_far
  x86/kexec: Simplify the relocation of compat_mode_gdt_desc
  x86/kexec: Annotate functions with ELF metadata

 xen/arch/x86/x86_64/kexec_reloc.S | 40 +++++++++++++++++--------------
 1 file changed, 22 insertions(+), 18 deletions(-)

-- 
2.30.2


