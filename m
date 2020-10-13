Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B521428CCB7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6169.16306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIoY-0001rH-DD; Tue, 13 Oct 2020 11:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6169.16306; Tue, 13 Oct 2020 11:49:58 +0000
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
	id 1kSIoY-0001qs-9k; Tue, 13 Oct 2020 11:49:58 +0000
Received: by outflank-mailman (input) for mailman id 6169;
 Tue, 13 Oct 2020 11:49:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSIoW-0001qm-QB
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:49:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f4323a0-3ce1-4249-b1bf-464363253b8a;
 Tue, 13 Oct 2020 11:49:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F48CB23E;
 Tue, 13 Oct 2020 11:49:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSIoW-0001qm-QB
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:49:56 +0000
X-Inumbo-ID: 7f4323a0-3ce1-4249-b1bf-464363253b8a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7f4323a0-3ce1-4249-b1bf-464363253b8a;
	Tue, 13 Oct 2020 11:49:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602589794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6kOkuuNc8zz/wNm+JFNCCi7b3v2KE6SB93RDwm9Ftc=;
	b=XD1ym0bufZc8/uinCcBbRGbvOHv3QgBFfYVDyCCAzsMWMdU7sB6mw2moakBOmfX+nw7MXR
	LHCxb47q8B58LcxCLDfR0ae4ZcbpBm/JeHVxWgCb547UVlEh0VYOpGUbUiCi3vy4C3Pwe+
	9A/OJnklR8nQyW3szvsw73FgPARpbJY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2F48CB23E;
	Tue, 13 Oct 2020 11:49:54 +0000 (UTC)
Subject: Re: [PATCH v9 6/8] common/domain: add a domain context record for
 shared_info...
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-7-paul@xen.org>
 <a82cfb40-9ce5-d8ed-a2f7-1b02fc6e27e6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a71c300-fb05-d9e4-7d4d-17814db1edf8@suse.com>
Date: Tue, 13 Oct 2020 13:49:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a82cfb40-9ce5-d8ed-a2f7-1b02fc6e27e6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.10.2020 12:39, Andrew Cooper wrote:
> On 24/09/2020 14:10, Paul Durrant wrote:
>> +static int load_shared_info(struct domain *d, struct domain_context *c)
>> +{
>> +    struct domain_shared_info_context ctxt;
>> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
>> +    unsigned int i;
>> +    int rc;
>> +
>> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    if ( i ) /* expect only a single instance */
>> +        return -ENXIO;
>> +
>> +    rc = domain_load_data(c, &ctxt, hdr_size);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
>> +         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
>> +        return -EINVAL;
>> +
>> +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
>> +    {
>> +#ifdef CONFIG_COMPAT
>> +        has_32bit_shinfo(d) = true;
> 
> d->arch.has_32bit_shinfo

But this is common code, i.e. using d->arch directly is a layering
violation. I know your dislike of lvalues disguised by function-
like macros, but what do you do?

Jan

