Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25953928CA
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 09:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132859.247762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAhb-00043E-MO; Thu, 27 May 2021 07:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132859.247762; Thu, 27 May 2021 07:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAhb-00041N-HJ; Thu, 27 May 2021 07:45:11 +0000
Received: by outflank-mailman (input) for mailman id 132859;
 Thu, 27 May 2021 07:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmAha-00041H-6k
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 07:45:10 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15d569ad-29e7-4430-9a58-aa02a1bc0360;
 Thu, 27 May 2021 07:45:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6895C2190E;
 Thu, 27 May 2021 07:45:08 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 2591B11A98;
 Thu, 27 May 2021 07:45:08 +0000 (UTC)
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
X-Inumbo-ID: 15d569ad-29e7-4430-9a58-aa02a1bc0360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622101508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ai0T7TEfJbqOfEVDdu1teUGkhqtkTKGVD8vLRQR8XYs=;
	b=iScg6lOSprfL+UF5wUInARzNGsf0XFxZMFU8BfzD9OWiy2lahSRixD5D83/PQz2isBdK6G
	KRe6tp9FBiRPVSjRd5+MGGcHkLwIRvIAj2K4SBTOGkj+zqsjb1fH/hO6Gs+f4cJTgksdTu
	2lp49SNJM+RgRWNeg2H5hjNylk5y7l4=
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7fde649c-5271-72a9-5af8-b6323725d49d@suse.com>
Date: Thu, 27 May 2021 09:45:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> If HWP Energy_Performance_Preference isn't supported, the code falls
> back to IA32_ENERGY_PERF_BIAS.  Right now, we don't check
> CPUID.06H:ECX.SETBH[bit 3] before using that MSR.  The SDM reads like
> it'll be available, and I assume it was available by the time Skylake
> introduced HWP.

Upon more detailed reading of the respective SDM sections, I only
see two options: Either you fail driver initialization if the bit
is clear, or you correctly deal with the bit being clear. If Xen
runs virtualized itself, the combination of CPUID bits set may
not match that of any bare metal hardware that exists.

Jan

