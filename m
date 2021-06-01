Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A143970F5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 12:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134767.250678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo1K5-0006Kf-2r; Tue, 01 Jun 2021 10:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134767.250678; Tue, 01 Jun 2021 10:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo1K4-0006In-VX; Tue, 01 Jun 2021 10:08:32 +0000
Received: by outflank-mailman (input) for mailman id 134767;
 Tue, 01 Jun 2021 10:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lo1K3-0006Ig-6B
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 10:08:31 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e69cafdb-9885-4632-a491-1f0fc3ee296b;
 Tue, 01 Jun 2021 10:08:30 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 552611FD30;
 Tue,  1 Jun 2021 10:08:29 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 347FC118DD;
 Tue,  1 Jun 2021 10:08:29 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GMJ/Cx0HtmBrAwAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Tue, 01 Jun 2021 10:08:29 +0000
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
X-Inumbo-ID: e69cafdb-9885-4632-a491-1f0fc3ee296b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622542109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1z4ijang45Vhplh+/3psU16FFTJ8psvdcXAbjGXAiK0=;
	b=m+6BBpDym4XTglt7cntwLFLqOWdtqgw/W0sNMjRfBb7Z1IXfTx4Z1O6K8/vvTGwBfLqxKd
	6dR++eXckXZsrobfF0LcwfBL/8w+QQ+iBfsL28eE/k6zDNXrhlCzu+dKMmzrBjHqzfH1n6
	nIhOZLWgmyVN8qkNJH3tqoK4lkiK0Lc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622542109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1z4ijang45Vhplh+/3psU16FFTJ8psvdcXAbjGXAiK0=;
	b=m+6BBpDym4XTglt7cntwLFLqOWdtqgw/W0sNMjRfBb7Z1IXfTx4Z1O6K8/vvTGwBfLqxKd
	6dR++eXckXZsrobfF0LcwfBL/8w+QQ+iBfsL28eE/k6zDNXrhlCzu+dKMmzrBjHqzfH1n6
	nIhOZLWgmyVN8qkNJH3tqoK4lkiK0Lc=
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
To: AL13N <alien@rmail.be>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
Cc: Xen-devel <xen-devel@lists.xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
Date: Tue, 1 Jun 2021 12:08:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.06.2021 09:36, AL13N wrote:
> Not 100% it's a bug or something i did wrong, but,
> 
> with xl create i start a PV with 3 pci passthroughs
> 
> after wards, xl pci-list shows all 3 nicely
> 
> looking at the domU boot logs, pcifront is only creating one pci device 
> and lspci in the guest shows only 1 pci entry
> 
> in at least 4.14.1 it still works.

This reminds me of my report at
https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html

Meanwhile the proposed pciback change has gone in upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/xen-pciback?id=c81d3d24602540f65256f98831d0a25599ea6b87

I wasn't, however, aware that this may have been an issue going
from 4.14.1 to 4.15.0, i.e. something that was presumably (as
George also has just said) a regression in the tools. Or else I
probably wouldn't have suggested taking care of this in Linux.
Nevertheless you may want to give that change a try.

Jan

