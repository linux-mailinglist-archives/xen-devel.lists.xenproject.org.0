Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3828351294
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104222.199078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtrH-0004JP-5I; Thu, 01 Apr 2021 09:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104222.199078; Thu, 01 Apr 2021 09:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtrH-0004J0-2J; Thu, 01 Apr 2021 09:43:23 +0000
Received: by outflank-mailman (input) for mailman id 104222;
 Thu, 01 Apr 2021 09:43:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtrF-0004Iv-Gv
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:43:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2edd54c0-d6de-4dd1-8293-7e1c83934915;
 Thu, 01 Apr 2021 09:43:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE97EAF5B;
 Thu,  1 Apr 2021 09:43:19 +0000 (UTC)
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
X-Inumbo-ID: 2edd54c0-d6de-4dd1-8293-7e1c83934915
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GzLeFqJW3FBoJkiPqpRmFDkCHlruQu4pViPhOQvIlrs=;
	b=DHoLZMWZihyCUJtmQAs9jYGKlq3IHGJ+ZnNBVYMMVxiY76QVdKk4PdH+mG1WsoH09ZX1/W
	6VEey810g7YeCNRSOR0SdjdjaHE+e3aVdPUaatOuO99lKTCoFsmqvTiEVKoaM0aimW+qEH
	Ga5PxBWn5CV6IhmZ8/FZ7g+TPp2MKXU=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] x86/EFI: build adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Date: Thu, 1 Apr 2021 11:43:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

So far we've taken care of just the immediate breakage caused by
binutils 2.36. But we can also take advantage, in particular to
avoid "manually" creating base relocations for xen.efi. Since it
was requested and is possible with up-to-date binutils, inclusion
of debug info in xen.efi is another part here. The other changes
here are cleanup related to both the work here as well as the one
to make binutils fit for our purposes.

1: EFI: drop stale section special casing when generating base relocs
2: EFI: sections may not live at VA 0 in PE binaries
3: EFI: program headers are an ELF concept
4: EFI: redo .reloc section bounds determination
5: drop use of prelink-efi.o
6: EFI: avoid use of GNU ld's --disable-reloc-section when possible
7: EFI: keep debug info in xen.efi
8: EFI: don't have an overly large image size

Jan

