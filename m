Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151032CED9C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44660.80038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9fa-0007fV-Qw; Fri, 04 Dec 2020 11:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44660.80038; Fri, 04 Dec 2020 11:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9fa-0007f6-NX; Fri, 04 Dec 2020 11:54:38 +0000
Received: by outflank-mailman (input) for mailman id 44660;
 Fri, 04 Dec 2020 11:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl9fZ-0007f0-Ai
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:54:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e1d7cb1-8e79-44c0-846d-7b058ff3a335;
 Fri, 04 Dec 2020 11:54:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96536AC9A;
 Fri,  4 Dec 2020 11:54:35 +0000 (UTC)
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
X-Inumbo-ID: 3e1d7cb1-8e79-44c0-846d-7b058ff3a335
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607082875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmUpg1t4kusv1XlB3ff6JKDGCbzKYipbSB7YbiJmr3I=;
	b=kOK0ctoMgloaHLwnKH6KRgNBfppKiotH9QmUDM7eIGJ1hQmZHHe10vfyvn9We+BLIaKzZ2
	NKNis2M8Lp7HITqLfsj5fZfULDH0U5NcUqm0nVLGNhE/U5Zil13Oar8cwejiHb997DtH/s
	qI0ZxilquskuqmxZcWpzEaSb7SNt0q8=
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
 <e14fa4a4-3a3e-ceac-af38-8561baf58aa8@suse.com>
 <72e2300c-6367-5469-d7fd-767dd411dcb8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02ac006e-ac50-ef3b-e7f4-587dfadc976c@suse.com>
Date: Fri, 4 Dec 2020 12:54:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <72e2300c-6367-5469-d7fd-767dd411dcb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.12.2020 12:08, Jürgen Groß wrote:
> On 04.12.20 10:10, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>> +static struct hypfs_funcs cpupool_dir_funcs = {
>>
>> Yet another missing const?
> 
> Already fixed.
> 
>>
>>> +    .enter = cpupool_dir_enter,
>>> +    .exit = cpupool_dir_exit,
>>> +    .read = cpupool_dir_read,
>>> +    .write = hypfs_write_deny,
>>> +    .getsize = cpupool_dir_getsize,
>>> +    .findentry = cpupool_dir_findentry,
>>> +};
>>> +
>>> +static HYPFS_VARDIR_INIT(cpupool_dir, "cpupool", &cpupool_dir_funcs);
>>
>> Why VARDIR? This isn't a template, is it? Or does VARDIR really
>> serve multiple purposes?
> 
> Basically it just takes an additional parameter for the function vector.
> Maybe I should rename it to HYPFS_DIR_INIT_FUNC()?

Maybe. Depends on what exactly the VAR is meant to stand for.

Jan

