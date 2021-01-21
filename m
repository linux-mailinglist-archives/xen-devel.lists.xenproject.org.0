Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F702FEDFD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72167.129696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bWq-0003r6-J4; Thu, 21 Jan 2021 15:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72167.129696; Thu, 21 Jan 2021 15:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bWq-0003qk-FO; Thu, 21 Jan 2021 15:05:44 +0000
Received: by outflank-mailman (input) for mailman id 72167;
 Thu, 21 Jan 2021 15:05:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2bWo-0003qf-M6
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:05:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8b844f0-7848-4c34-955a-17b22d9b8605;
 Thu, 21 Jan 2021 15:05:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B30E4AB7A;
 Thu, 21 Jan 2021 15:05:40 +0000 (UTC)
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
X-Inumbo-ID: e8b844f0-7848-4c34-955a-17b22d9b8605
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611241540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHodcbavZ3dWxtCxFpXSvewVAIpjA4tPb+A6Pl05rqo=;
	b=jJsvQzs/sv+IRijKTNmrJ0ufR/KGp0w2F+Zuw2gNUGzTiyWEB8idVRzTAE0gq7IBt/Z2Ve
	HfFHQhXBoqcO3diacanBiwmrPxOYl9Q86K6F4AcK6gczRP3FGGF4w4y3iT/S4BevHjsNTk
	u7DPoMXA+3+UeXAmFEj8jodp/iQhzho=
Subject: Re: [PATCH v2 1/5] libxenguest: support zstd compressed kernels
To: Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <403d985c-b4c0-d8d1-4f42-7e1fe6ae3ee0@suse.com>
 <20210121150102.iifaquysrbkkx2tz@liuwe-devbox-debian-v2>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3500237-e00b-cf70-12a6-37ed0ea55a01@suse.com>
Date: Thu, 21 Jan 2021 16:05:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121150102.iifaquysrbkkx2tz@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 16:01, Wei Liu wrote:
> On Tue, Jan 19, 2021 at 04:15:25PM +0100, Jan Beulich wrote:
>> This follows the logic used for other decompression methods utilizing an
>> external library, albeit here we can't ignore the 32-bit size field
>> appended to the compressed image - its presence causes decompression to
>> fail. Leverage the field instead to allocate the output buffer in one
>> go, i.e. without incrementally realloc()ing.
>>
>> Note that, where possible, instead of #ifdef-ing xen/*.h inclusions,
>> they get removed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> 
> Acked-by: Wei Liu <wl@xen.org>

Thanks, but I'm about to send v2.5 to address the issue reported
by Michael Young (adjusting configure{.ac,} only).

>> ---
>> Note for committer: As an alternative to patching tools/configure here,
>> autoconf may want re-running.
> 
> Noted. FWIW I use Debian 10 to generate configure. If I don't get around
> doing it someone who runs the same system should be able to help.

Well, the version I've been using to re-generate isn't identical
to yours, but allows easily filtering out and discarding the few
extra differences, which is why I dared to provide a diff for
tools/configure in the first place. IOW if I would commit this
myself, all I would ask that you or someone else using the
"original" autoconf to generate the committed version to double
check.

Jan

