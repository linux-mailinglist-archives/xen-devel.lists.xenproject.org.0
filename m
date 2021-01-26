Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD93038FA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74693.134232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KhU-0006sL-No; Tue, 26 Jan 2021 09:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74693.134232; Tue, 26 Jan 2021 09:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KhU-0006rv-KM; Tue, 26 Jan 2021 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 74693;
 Tue, 26 Jan 2021 09:31:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KhT-0006rq-Li
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:31:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 903f8593-2ab2-400f-b708-c9701e332fb8;
 Tue, 26 Jan 2021 09:31:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9DC4AF33;
 Tue, 26 Jan 2021 09:31:48 +0000 (UTC)
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
X-Inumbo-ID: 903f8593-2ab2-400f-b708-c9701e332fb8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611653508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12ukp96owWMAGvMBzfn0j68pe7aINdKVPu8Yv/d4dkU=;
	b=T4ROts1w9EppIBKe49uyWP6asNOT7VoTPEMP/G2EzfIF7X8l619m5tCwc1kN5FgCkj7x+U
	D0DkdQ1/VQpy6pU7TdPwk8v3pTCe6dbGIwBhfeb/DPP8y+q5FOzfdia7R2TcsS0Dwctosc
	GtbO8PmRx0/QOmwWu6+XJ5AvlDTFXHo=
Subject: Re: [PATCH v10 01/11] docs / include: introduce a new framework for
 'domain context' records
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-2-paul@xen.org>
 <9627b5ce-3c96-2f8b-bd04-0db5ca2486c1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d2dba97-3b7c-6224-4ee1-080e37338b1a@suse.com>
Date: Tue, 26 Jan 2021 10:31:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9627b5ce-3c96-2f8b-bd04-0db5ca2486c1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 19:18, Andrew Cooper wrote:
>> +enum {
>> +    DOMAIN_CONTEXT_END,
>> +    DOMAIN_CONTEXT_START,
>> +    /* New types go here */
>> +    DOMAIN_CONTEXT_NR_TYPES
>> +};
> 
> Does this enum ever end up in an API?
> 
> We might be ok as we're inside __XEN_TOOLS__, but enums normally cannot
> be used in ABI's because their size is implementation defined, and not
> always 4 bytes.

The only way to use this as a type (e.g. to declare a struct field)
would be via typeof(), which isn't something we'd allow in the
public interface (for being an extension). Hence without a tag I
would think an enum is fine to have here?

Jan

