Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37018780C32
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586203.917425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz3I-0007ix-4z; Fri, 18 Aug 2023 12:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586203.917425; Fri, 18 Aug 2023 12:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz3I-0007gK-2D; Fri, 18 Aug 2023 12:58:08 +0000
Received: by outflank-mailman (input) for mailman id 586203;
 Fri, 18 Aug 2023 12:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWz3H-0007Sb-1t
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:58:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd0bffd-3dc6-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 14:58:05 +0200 (CEST)
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
X-Inumbo-ID: ddd0bffd-3dc6-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692363485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kdCG/cIFV4Yb9rE+4QWTkcCVk62pxuWTWcDJcD7Lp20=;
  b=hKGgPzKbOABi0NHP3shDP4nQ1z6yTeb5M6tYE4yWRzGuESZx0jTY6DoX
   veL20dmZ3hML3sUHAGvXU1J7tKDeV1Zzh83OVt5L9SxlOw/+rgfoRtr1H
   7GGPNCryeRGWeKAKKtq1MAJ7/MXHNsNiVxu+4Moq32rLm0iFZFzObBS50
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119911552
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7JxwD6gsVLcDzffljcfSo77aX161fxAKZh0ujC45NGQN5FlHY01je
 htvXG/XPqneZjH2L95wPdux8BtUvp6BzYVkTVA/qy9kECkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AaOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQAASAIZSuCnNvv77WyUMRqvcEMIOnCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zOXpj2kX0ty2Nq35ySA0nXz2sX1tibiCNkOMJmBy+ZTqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsVSIV5tLYoZoK1z3IR8xOFpWwodHVMGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGsuTKuKGpxeEdMMX
 KM0kVoJjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNBTKjj+1wRF3z/9X1
 XKnnSCEVyZy5UNPlmbeegvg+eVzmnBWKZ37FPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6ep6ItY4xfsIz7egE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:S9yVVKgqtXaBZbX6JAWH1PU1anBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-Talos-CUID: 9a23:WVxJJmEyDIhlNiFtqmJ/3V4REfskaUSE43DZOWK+MmNGRJ28HAo=
X-Talos-MUID: 9a23:B1sWXAXWuF7cli3q/BHygRFla5tC2Y+rERBWjbEigvScDAUlbg==
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119911552"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] Rombios build fixes
Date: Fri, 18 Aug 2023 13:57:51 +0100
Message-ID: <20230818125753.876699-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  rombios: Avoid using K&R function syntax
  rombiosn: Remove the use of egrep

 tools/firmware/rombios/32bit/Makefile          |  2 +-
 tools/firmware/rombios/32bit/tcgbios/tcgbios.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: e6cb27f2f20d09dd2ba135fbc341a4dc98656e10
-- 
2.30.2


