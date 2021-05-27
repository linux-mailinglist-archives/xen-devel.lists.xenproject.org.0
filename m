Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165093929B2
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 10:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132912.247849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBaH-0004yf-Uf; Thu, 27 May 2021 08:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132912.247849; Thu, 27 May 2021 08:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBaH-0004vl-RT; Thu, 27 May 2021 08:41:41 +0000
Received: by outflank-mailman (input) for mailman id 132912;
 Thu, 27 May 2021 08:41:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmBaG-0004vM-8G
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:41:40 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 174ac669-8388-429c-9d62-f859a9daa367;
 Thu, 27 May 2021 08:41:39 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 844C81FD2E;
 Thu, 27 May 2021 08:41:38 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 5CB2511A98;
 Thu, 27 May 2021 08:41:38 +0000 (UTC)
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
X-Inumbo-ID: 174ac669-8388-429c-9d62-f859a9daa367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622104898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7ywD3BnX4zshb6hrMRP6r3vcXF6xNj4e2+3UTSsh0k=;
	b=eYU/pSBqBQwegHeDDOviNt2W8ElwV+6zmT0afiDmf43aqf7DY9MZl6PBkyzH8AIIKtIfvl
	v2T5ZpySgHmK0JoGgcGPCKjW73oWk7+mokWOGPI+LRTjOZDa4QMq5Rzz+tC1QVf3lRVUDq
	f9ZnIVG2CnBb9CzKSI6U/pKPQR2b6UM=
Subject: Re: [PATCH 11/13] xenpm: Factor out a non-fatal cpuid_parse variant
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-12-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61982f4e-beeb-c37e-817a-f4492e848587@suse.com>
Date: Thu, 27 May 2021 10:41:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-12-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> Allow cpuid_prase to be re-used without terminating xenpm.  HWP
> will re-use it to optionally parse a cpuid.

I'm not convinced of the need for this patch: The next one could
easily put an isdigit() check in place to tell cpuid from other
arguments.

Jan

