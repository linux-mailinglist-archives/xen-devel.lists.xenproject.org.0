Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EBC36063F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110992.212122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWygu-0002t9-5s; Thu, 15 Apr 2021 09:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110992.212122; Thu, 15 Apr 2021 09:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWygu-0002sn-2p; Thu, 15 Apr 2021 09:53:40 +0000
Received: by outflank-mailman (input) for mailman id 110992;
 Thu, 15 Apr 2021 09:53:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWygs-0002sf-MS
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:53:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7f8d2ac-d923-4433-8d05-fee7326a7c97;
 Thu, 15 Apr 2021 09:53:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F1ECAC6E;
 Thu, 15 Apr 2021 09:53:37 +0000 (UTC)
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
X-Inumbo-ID: f7f8d2ac-d923-4433-8d05-fee7326a7c97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618480417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wBm2EHrTG/WlZZxGtTQH9QKJ5lIyf6rcYXncKSBmvg=;
	b=qOsx8DHtIWnpPROMPfATuG5IkdWTBQgtDzP0PiZsnDgVO2eJRvBYqllImb1f8K+DAWkcGj
	gqDzFklYuUGr02bUNoqlbA2qHfZ3WOI/+CgIhMDhoVUX2AVBUOOQeQUWE42IotdYyIro2O
	FDnBpK3cgQ9+o+ENr1o3jV72s1+NPsU=
Subject: Ping: [PATCH 0/8] x86/EFI: build adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <3e844d0d-a061-52f9-c33a-f28c4952524d@suse.com>
Date: Thu, 15 Apr 2021 11:53:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 11:43, Jan Beulich wrote:
> So far we've taken care of just the immediate breakage caused by
> binutils 2.36. But we can also take advantage, in particular to
> avoid "manually" creating base relocations for xen.efi. Since it
> was requested and is possible with up-to-date binutils, inclusion
> of debug info in xen.efi is another part here. The other changes
> here are cleanup related to both the work here as well as the one
> to make binutils fit for our purposes.
> 
> 1: EFI: drop stale section special casing when generating base relocs
> 2: EFI: sections may not live at VA 0 in PE binaries
> 3: EFI: program headers are an ELF concept
> 4: EFI: redo .reloc section bounds determination
> 5: drop use of prelink-efi.o
> 6: EFI: avoid use of GNU ld's --disable-reloc-section when possible
> 7: EFI: keep debug info in xen.efi
> 8: EFI: don't have an overly large image size

Only the first patch here has been acked (and has gone in). Any chance
of getting acks (or otherwise) for the rest?

Thanks, Jan

