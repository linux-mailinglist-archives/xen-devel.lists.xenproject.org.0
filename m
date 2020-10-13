Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E17D28CDCC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 14:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6175.16330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJ4u-0003iX-8r; Tue, 13 Oct 2020 12:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6175.16330; Tue, 13 Oct 2020 12:06:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJ4u-0003i8-5X; Tue, 13 Oct 2020 12:06:52 +0000
Received: by outflank-mailman (input) for mailman id 6175;
 Tue, 13 Oct 2020 12:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSJ4s-0003i3-4w
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:06:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f13c70e7-05e9-417d-b04c-2725c82f400a;
 Tue, 13 Oct 2020 12:06:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83701AD21;
 Tue, 13 Oct 2020 12:06:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSJ4s-0003i3-4w
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:06:50 +0000
X-Inumbo-ID: f13c70e7-05e9-417d-b04c-2725c82f400a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f13c70e7-05e9-417d-b04c-2725c82f400a;
	Tue, 13 Oct 2020 12:06:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602590808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WT/NwAvWlp7h/DwYe3tvj1G1QCnUKTIReoTt/Exc88=;
	b=sypVdqTDO0I33eJQarT9jDomFXBzvjdRh6XUguOkbCuWM6hEyqxO0gD3fOh/TEMzKMM1io
	frl7FPV/BkKDycXMVpuKlceRibYthCv1+aTJ/6VeZKX86EonzzL6z6kVuP9SIUGumhMH4I
	6Sfu/pStSJ5Mdz+ylhw4YDeohjF3Ih8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 83701AD21;
	Tue, 13 Oct 2020 12:06:48 +0000 (UTC)
Subject: Re: [PATCH v9 0/4] efi: Unified Xen hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20201002111822.42142-1-hudson@trmm.net>
 <BbDD1Aa2FXJRlpSpqyFVl4-6u6S-OnBkoMyvoPHadElIyfNDl2h9J34bk12XyvFtEOweGsCRTmqY8eSSbvR98RHJpFzDHpWWa67IaW6Sz7I=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b691e444-63d1-7f80-dc99-7629b6741b70@suse.com>
Date: Tue, 13 Oct 2020 14:06:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BbDD1Aa2FXJRlpSpqyFVl4-6u6S-OnBkoMyvoPHadElIyfNDl2h9J34bk12XyvFtEOweGsCRTmqY8eSSbvR98RHJpFzDHpWWa67IaW6Sz7I=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.10.2020 16:43, Trammell Hudson wrote:
> Any further thoughts on this patch series? Three out of four of
> them have been reviewed or acked by at least one reviewer, with
> only the last one currently unreviewed.

"unreviewed" isn't correct. I did review it, but I'm opposed to
parts of the resulting behavior.

Jan

