Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0B3931EE
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 17:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133567.248911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHfS-0004ax-7G; Thu, 27 May 2021 15:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133567.248911; Thu, 27 May 2021 15:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHfS-0004Xb-49; Thu, 27 May 2021 15:11:26 +0000
Received: by outflank-mailman (input) for mailman id 133567;
 Thu, 27 May 2021 15:11:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmHfQ-0004XV-V4
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 15:11:24 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b6d61e-3915-4756-a3f1-26aeb549e764;
 Thu, 27 May 2021 15:11:23 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADEFD1FD2F;
 Thu, 27 May 2021 15:11:22 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 7B5E711A98;
 Thu, 27 May 2021 15:11:22 +0000 (UTC)
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
X-Inumbo-ID: d9b6d61e-3915-4756-a3f1-26aeb549e764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622128282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wkwbi+PB7BAz1+KVXLTqHm7BunOvpihQ5ejo2Lv2Dqo=;
	b=o2+ph9guFwFdKDsFlNf56JQXyY52wCR/PA1RUDFCQW5uIPNnj4xaalzGfzRG2H4+Kx5AGE
	eXlM7wQYugpm7KLY/MNO4BR7m9LTGRszTeKi8/ZY+CMO+baJG6vFcqLIH1zANoTL9qJOT6
	u7ZTsedpdEVe0ElgwcCp/7G42M7EbEs=
Subject: Re: [PATCH 3/3] x86/tsx: Deprecate vpmu=rtm-abort and use tsx=<bool>
 instead
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de901446-021f-2e7f-ee9a-034f36778f37@suse.com>
Date: Thu, 27 May 2021 17:11:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210527132519.21730-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 15:25, Andrew Cooper wrote:
> This reuses the rtm_disable infrastructure, so CPUID derivation works properly
> when TSX is disabled in favour of working PCR3.
> 
> vpmu= is not a supported feature, and having this functionality under tsx=
> centralises all TSX handling.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


