Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44FB34022B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 10:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98859.187788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMp41-0003Rr-QY; Thu, 18 Mar 2021 09:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98859.187788; Thu, 18 Mar 2021 09:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMp41-0003RS-N5; Thu, 18 Mar 2021 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 98859;
 Thu, 18 Mar 2021 09:35:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMp40-0003RN-Sg
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 09:35:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11b65bdf-67a5-46d2-a19b-e7168f5ba626;
 Thu, 18 Mar 2021 09:35:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 427B3AC1E;
 Thu, 18 Mar 2021 09:35:31 +0000 (UTC)
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
X-Inumbo-ID: 11b65bdf-67a5-46d2-a19b-e7168f5ba626
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616060131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzFbb52yauBhIb4jLC2X7NPZ4IOcEkpAI3KYM8pSyoQ=;
	b=PgiYkB1otAZbfp2pXVFZiO3NsaK1wIsPPHzAmPAJ9hDpsfc6B1/RbgFtI+FQ/BcjXyt+cW
	AD4i5m64uEhIQ4JWUFzyBiB1hndDVk85dbIZ6Z6pzzKBEcyccY5rQkwRZtMVqlNb/UlzZb
	W0TV/jvdVq6Fgy9QgEb/MWO0jluInAk=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Ian Jackson <iwj@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <24658.1583.601613.903527@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eb6f686-d67e-6db3-6b4b-8c63e676e311@suse.com>
Date: Thu, 18 Mar 2021 10:35:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24658.1583.601613.903527@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.03.2021 14:37, Ian Jackson wrote:
> I have read this thread and with my release manager hat on I feel
> confused and/or ignorant.
> 
> Patch 3/ has a good explanation of what the problem is it is
> addressing and why this is important for 4.15.  But then there is
> Jan's most recent reply starting "I find all of this confusing".  Jan,
> can you please tell me in words of one syllable what the implication
> of that message is ?  In particular is any of what you say a reason
> for me to withhold my release-ack ?

Answering the last question first - I don't think so. Something may
indeed want doing here beyond what we already have, and it may well
be precisely what Andrew is proposing, possibly just with extended
descriptions and/or comments. My confusion about patch 3 is that it
(a) claims behavior in turbostat that I can't locate and (b) implies
(describes) behavior of code that I find entirely unexpected (as in:
not making sense to me).

And I'm sorry: Not all of the words are of one syllable.

Jan

