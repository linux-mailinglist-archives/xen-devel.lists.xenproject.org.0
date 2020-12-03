Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703022CD987
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43690.78539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpsV-0005rN-M8; Thu, 03 Dec 2020 14:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43690.78539; Thu, 03 Dec 2020 14:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpsV-0005qy-Id; Thu, 03 Dec 2020 14:46:39 +0000
Received: by outflank-mailman (input) for mailman id 43690;
 Thu, 03 Dec 2020 14:46:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkpsT-0005qt-JJ
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:46:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09e44b4f-6d99-4718-a99f-02da3d06edf6;
 Thu, 03 Dec 2020 14:46:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E28BDAC65;
 Thu,  3 Dec 2020 14:46:34 +0000 (UTC)
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
X-Inumbo-ID: 09e44b4f-6d99-4718-a99f-02da3d06edf6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607006795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkQN/tCRpveejzo9EbHpCmPYU5dLT2Jsg3nQVkFEQZQ=;
	b=K8lUnQ2+KQSkixgnsDn4EWpBvOmzl+JwiDSeTOFcNdjVpffJ2MWo5oRvuxBsEacTp/5A8k
	Ju5A/NKvTeTCrbYb+yiXBtoxxa2yCr0DgtLvikHHp6CBIk0lBshx1OJtlNDUj5JVqEHbNP
	md8yQjlvXO0H1ut66WpN1Gm/qJhEvDE=
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
 <89f52bed-c611-70c5-1349-63838530debd@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0613c7e2-724a-e16c-91f7-f99298d04ab2@suse.com>
Date: Thu, 3 Dec 2020 15:46:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <89f52bed-c611-70c5-1349-63838530debd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.12.2020 16:46, Jürgen Groß wrote:
> On 01.12.20 09:21, Juergen Gross wrote:
>> @@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb = {
>>       .notifier_call = cpu_callback
>>   };
>>   
>> +#ifdef CONFIG_HYPFS
>> +static const struct hypfs_entry *cpupool_pooldir_enter(
>> +    const struct hypfs_entry *entry);
>> +
>> +static struct hypfs_funcs cpupool_pooldir_funcs = {
>> +    .enter = cpupool_pooldir_enter,
>> +    .exit = hypfs_node_exit,
>> +    .read = hypfs_read_dir,
>> +    .write = hypfs_write_deny,
>> +    .getsize = hypfs_getsize,
>> +    .findentry = hypfs_dir_findentry,
>> +};
>> +
>> +static HYPFS_VARDIR_INIT(cpupool_pooldir, "%u", &cpupool_pooldir_funcs);
>> +
>> +static const struct hypfs_entry *cpupool_pooldir_enter(
>> +    const struct hypfs_entry *entry)
>> +{
>> +    return &cpupool_pooldir.e;
>> +}
> I have found a more generic way to handle entering a dyndir node,
> resulting in no need to have cpupool_pooldir_enter() and
> cpupool_pooldir_funcs.
> 
> This will add some more lines to the previous patch, but less than
> saved here.

Which may then mean it's not a good use of time to look at v2 patch
14, considering there's a lot of other stuff in need of looking at?

Jan

