Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231912B8FE2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30553.60653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgth-00071W-46; Thu, 19 Nov 2020 10:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30553.60653; Thu, 19 Nov 2020 10:10:37 +0000
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
	id 1kfgth-000717-0Y; Thu, 19 Nov 2020 10:10:37 +0000
Received: by outflank-mailman (input) for mailman id 30553;
 Thu, 19 Nov 2020 10:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfgtf-000712-3q
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:10:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7924d8a8-83df-492e-8272-154115fc3dac;
 Thu, 19 Nov 2020 10:10:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8C50AFE6;
 Thu, 19 Nov 2020 10:10:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfgtf-000712-3q
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:10:35 +0000
X-Inumbo-ID: 7924d8a8-83df-492e-8272-154115fc3dac
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7924d8a8-83df-492e-8272-154115fc3dac;
	Thu, 19 Nov 2020 10:10:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605780633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uMZi+Zv34dLKGE4Sf1IGy1fJP6t3LR3Lp0kormnGEAw=;
	b=cV0xdDtJsJa+gw6KPOfTJWp70LI7kau2zWjJsvwNs+4O+c/iQjhIRJvweXX4oVkDxR++hn
	sPHdIoNX8Esu5yyUqfjY6YPk0s4ueiuHgwQGZiXDaGjlhALVg+jnpuUjesUmCaSbHH9rah
	cfQQMaaELZxxP5PqEgfPWZep6P7r3MY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A8C50AFE6;
	Thu, 19 Nov 2020 10:10:33 +0000 (UTC)
Subject: Re: [PATCH v2 3/8] lib: move list sorting code
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <19d28bcc-9e5b-4902-8e8d-ae95fbc560a6@suse.com>
 <aaf7183b-a843-57e3-84c9-7408a6ebfedf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <791f0f5f-f7d7-64ff-bb4a-01911774eb8a@suse.com>
Date: Thu, 19 Nov 2020 11:10:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <aaf7183b-a843-57e3-84c9-7408a6ebfedf@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 18:38, Julien Grall wrote:
> On 23/10/2020 11:17, Jan Beulich wrote:
>> Build the source file always, as by putting it into an archive it still
>> won't be linked into final binaries when not needed. This way possible
>> build breakage will be easier to notice, and it's more consistent with
>> us unconditionally building other library kind of code (e.g. sort() or
>> bsearch()).
>>
>> While moving the source file, take the opportunity and drop the
>> pointless EXPORT_SYMBOL().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> It looks like the commit message was duplicated.

Indeed - no idea how it has happened (also in at least one other
patch in this series, as I've noticed now).

>> Build the source file always, as by putting it into an archive it still
>> won't be linked into final binaries when not needed. This way possible
>> build breakage will be easier to notice, and it's more consistent with
>> us unconditionally building other library kind of code (e.g. sort() or
>> bsearch()).
>>
>> While moving the source file, take the opportunity and drop the
>> pointless EXPORT_SYMBOL().
> 
> You are mentioning the EXPORT_SYMBOL() but...
[...]
>> --- a/xen/common/list_sort.c
>> +++ b/xen/lib/list-sort.c
>> @@ -15,7 +15,6 @@
>>    * this program; If not, see <http://www.gnu.org/licenses/>.
>>    */
>>   
>> -#include <xen/lib.h>
> 
> ... this is not mentionned.

Well, not sure what to say. But anyway, I've added half a sentence
to also mention this.

Jan

