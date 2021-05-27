Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B753392878
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 09:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132848.247739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAMU-0001ee-M8; Thu, 27 May 2021 07:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132848.247739; Thu, 27 May 2021 07:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAMU-0001cn-Iq; Thu, 27 May 2021 07:23:22 +0000
Received: by outflank-mailman (input) for mailman id 132848;
 Thu, 27 May 2021 07:23:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmAMT-0001cf-C6
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 07:23:21 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c779728-4cec-4917-9c06-c070ab235e5a;
 Thu, 27 May 2021 07:23:20 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D38A2190A;
 Thu, 27 May 2021 07:23:19 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 36E9511A98;
 Thu, 27 May 2021 07:23:19 +0000 (UTC)
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
X-Inumbo-ID: 9c779728-4cec-4917-9c06-c070ab235e5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622100199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkFIpzBnw3DwNtJs0V+aqBKdsK8tpoUaHxyqzYMjdW4=;
	b=QRafSssdVJf3pCgwoKfrjLmc2aI+1lUpUEqxLIPI92NtdOJx1F9krFa2A0VmNGcLL27PgC
	kGDJi/La/OOJmilw91lsamHdT3AHbSgolk5dutjYRxkv6i2XJ3U+pa5HcMcov05b6/otrh
	ki0DtFHqX8dIG+JK3baoyvgrJYCLH9g=
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-5-jandryuk@gmail.com>
 <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
Message-ID: <62a49a25-678c-f854-69e7-4af123937791@suse.com>
Date: Thu, 27 May 2021 09:23:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.05.2021 16:59, Jan Beulich wrote:
> On 03.05.2021 21:28, Jason Andryuk wrote:
>> +static void hdc_set_pkg_hdc_ctl(bool val)
>> +{
>> +    uint64_t msr;
>> +
>> +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
>> +    {
>> +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
> 
> I'm not convinced of the need of having such log messages after
> failed rdmsr/wrmsr, but I'm definitely against them getting logged
> unconditionally. In verbose mode, maybe.

Perhaps not even there, considering that recovery from faults gets
logged already anyway (see extable_fixup()), and is suitably
restricted to debug builds.

Jan

