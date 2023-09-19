Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5DA7A63D9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 14:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604668.942165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaEG-0006HZ-AO; Tue, 19 Sep 2023 12:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604668.942165; Tue, 19 Sep 2023 12:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaEG-0006Ez-78; Tue, 19 Sep 2023 12:53:24 +0000
Received: by outflank-mailman (input) for mailman id 604668;
 Tue, 19 Sep 2023 12:53:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiaEF-0006Er-Dg
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 12:53:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiaEE-0002iF-UJ; Tue, 19 Sep 2023 12:53:22 +0000
Received: from [15.248.3.4] (helo=[10.24.67.44])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiaEE-0003eO-OT; Tue, 19 Sep 2023 12:53:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=8GXwf9VlifAazCCx2lnk//5Ugfr9OwhelbhG+2o7u0c=; b=Q0W5yZypk9t4jJvjIL1GoxMtvb
	UqrHLuxSECcplCH30iIjakRuA5yjBVpUzABwMVNNkYeHZXJXylvFJzoxp8+ZTMK1gKGLVnOS8AFFE
	1X4QnAfJBTNSbk9BLXksADzympiNl6mOnkgbMWFNBVX6K5IQTJH49+E8NhnPx5atrhVg=;
Message-ID: <6b52d9ef-d054-41ba-9b77-059d3e0ead34@xen.org>
Date: Tue, 19 Sep 2023 13:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] console/serial: bump buffer from 16K to 128K
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230919125118.12657-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230919125118.12657-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 19/09/2023 13:51, Roger Pau Monne wrote:
> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> being filled halfway during dom0 boot, and thus a non-trivial chunk of
> Linux boot messages are dropped.
> 
> Increasing the buffer to 128K does fix the issue and Linux boot
> messages are no longer dropped.  There's no justification either on
> why 16K was chosen, and hence bumping to 128K in order to cope with
> current systems generating output faster does seem appropriate to have
> a better user experience with the provided defaults.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I will commit it in a couple of days if there are no objection.

Cheers,

-- 
Julien Grall

