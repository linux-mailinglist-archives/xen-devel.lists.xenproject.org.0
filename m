Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8663532052F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 13:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87200.164331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDR5r-0007e6-1c; Sat, 20 Feb 2021 12:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87200.164331; Sat, 20 Feb 2021 12:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDR5q-0007dj-Tv; Sat, 20 Feb 2021 12:10:38 +0000
Received: by outflank-mailman (input) for mailman id 87200;
 Sat, 20 Feb 2021 12:10:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lDR5p-0007de-IJ
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 12:10:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDR5i-00027l-BX; Sat, 20 Feb 2021 12:10:30 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDR5i-0007sz-5L; Sat, 20 Feb 2021 12:10:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=2wKg2oPwA86fP+LMCj1ry7W6JKJh/kUVG52o2wSkk9U=; b=0zUvoAnxXwCs5/WSzAS4HbJ6Vg
	qbIdaz1Pv62BuLly8EM8mQDsehYy8ooMBulLBtaNWKSKnySha+MVjtJDbKRT2FMTgQB2hbt1xaWB0
	f2Q3UxvDqFwjBsVawxrG3vBbNEB54St5T0tZofK969NdFaJmpd4ZCmGVSg64W+5KmQmA=;
Subject: Re: [PATCH v3 2/8] xen/events: don't unmask an event channel when an
 eoi is pending
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
References: <20210219154030.10892-1-jgross@suse.com>
 <20210219154030.10892-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <66b1d440-2500-99fc-70a3-3d24d27f0334@xen.org>
Date: Sat, 20 Feb 2021 12:10:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219154030.10892-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 19/02/2021 15:40, Juergen Gross wrote:
> An event channel should be kept masked when an eoi is pending for it.
> When being migrated to another cpu it might be unmasked, though.
> 
> In order to avoid this keep three different flags for each event channel
> to be able to distinguish "normal" masking/unmasking from eoi related
> masking/unmasking and temporary masking. The event channel should only
> be able to generate an interrupt if all flags are cleared.
> 
> Cc: stable@vger.kernel.org
> Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

