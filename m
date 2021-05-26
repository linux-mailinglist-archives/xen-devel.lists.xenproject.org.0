Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D51391B3D
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132567.247221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvAR-0002o9-5f; Wed, 26 May 2021 15:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132567.247221; Wed, 26 May 2021 15:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvAR-0002lk-2Q; Wed, 26 May 2021 15:09:55 +0000
Received: by outflank-mailman (input) for mailman id 132567;
 Wed, 26 May 2021 15:09:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llvAP-0002lZ-IQ
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:09:53 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21b8d34e-57f5-4826-9a3f-41e77e0fbd84;
 Wed, 26 May 2021 15:09:52 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out1.suse.de (Postfix) with ESMTP id EC6C0218D0;
 Wed, 26 May 2021 15:09:51 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id D7D2611A98;
 Wed, 26 May 2021 15:09:51 +0000 (UTC)
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
X-Inumbo-ID: 21b8d34e-57f5-4826-9a3f-41e77e0fbd84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622041791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QLZ+/VjMHIzSsHqjlYN8Qsxcpte4s5NfwIoid2vqaKM=;
	b=f07cChPWTGvSF0haladmTLDgs5659K2fRbC4m2DSOrS4YAMTE2T92xPnqlgs5+sEAGuoNy
	VW83GIOgQGunfEhAxyceHT9MJTijTHmlvoXfEozl0AeAfU6iT3AUGpqfmpQCNJDHctTFBE
	rQIgGKIBYeV1GcWE91ImJ6XM8iHRGyU=
Subject: Re: [PATCH 01/13] cpufreq: Allow restricting to internal governors
 only
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-2-jandryuk@gmail.com>
 <927b886a-9b0c-2162-763b-9c2147227b8c@suse.com>
 <CAKf6xptZ=tHUUX+NXMfUPz_=wJJz6_FbEG6BraXRgcRokK5bcg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0701d667-b8f6-5691-5a40-e0e8eff0debb@suse.com>
Date: Wed, 26 May 2021 17:09:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKf6xptZ=tHUUX+NXMfUPz_=wJJz6_FbEG6BraXRgcRokK5bcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.05.2021 16:12, Jason Andryuk wrote:
> On Wed, May 26, 2021 at 9:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>> Sorry, all quite nit-like remarks, but still ...
> 
> It's fine.  Would a design session be useful to discuss hwp?

Is there anything beyond patch review that's necessary there? I'm
also not really set up to usefully join design sessions, I'm afraid.

Jan

