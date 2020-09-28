Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119827AD71
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrt9-0004RL-KX; Mon, 28 Sep 2020 12:04:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrt8-0004R9-FN
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:04:14 +0000
X-Inumbo-ID: 19e9b677-c037-4df5-8580-2cb92fbddc26
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19e9b677-c037-4df5-8580-2cb92fbddc26;
 Mon, 28 Sep 2020 12:04:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o7OyZ+1lr3yXR+2bpmus6NxSzN7Zt8+jwknBn4PXfZU=;
 b=XsZlnVHke3v5Nibi7z7io2pHdLUCkvMdt/OKLHRpwQUQYsS5t3kqi7MIZV+UcmOHNinsmL
 VoEsYWS39ccN/yhl6a0MKRKPAhgjZGe08UORBzVT+GDi1YmAIZtW1ckzs99Ghe4T+MoSWU
 mlKhvlHaowhgtIfEdYsmyNE1MC7Lu2E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16F83ACF3;
 Mon, 28 Sep 2020 12:04:13 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: introduce read_sregs() and elf_core_save_regs()
 adjustments
Message-ID: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Date: Mon, 28 Sep 2020 14:04:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

1: introduce read_sregs() to allow storing to memory directly
2: ELF: don't open-code read_sreg()
3: ELF: don't store function pointer in elf_core_save_regs()
4: ELF: also record FS/GS bases in elf_core_save_regs()
5: ELF: eliminate pointless local variable from elf_core_save_regs()

Jan

