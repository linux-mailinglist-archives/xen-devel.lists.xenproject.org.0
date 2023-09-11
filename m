Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAC79A97E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599563.935047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfibn-0006uw-1v; Mon, 11 Sep 2023 15:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599563.935047; Mon, 11 Sep 2023 15:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfibm-0006sj-UL; Mon, 11 Sep 2023 15:13:50 +0000
Received: by outflank-mailman (input) for mailman id 599563;
 Mon, 11 Sep 2023 15:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgak=E3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qfibl-0006qn-Bo
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:13:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce7f6a10-50b5-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 17:13:48 +0200 (CEST)
Received: from [192.168.1.15] (host-87-19-206-190.retail.telecomitalia.it
 [87.19.206.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 6A2834EE0742;
 Mon, 11 Sep 2023 17:13:47 +0200 (CEST)
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
X-Inumbo-ID: ce7f6a10-50b5-11ee-8785-cb3800f73035
Message-ID: <2e7f0482-7a39-daec-7d2d-92b6fc4bd9a7@bugseng.com>
Date: Mon, 11 Sep 2023 17:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/PCI: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <f6884bbff0a4117874618bfbece5066d98131aff.1694419992.git.federico.serafini@bugseng.com>
 <16edda00-662a-1b37-327e-3ee3ab87fd3a@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <16edda00-662a-1b37-327e-3ee3ab87fd3a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/23 10:42, Jan Beulich wrote:
> On 11.09.2023 10:15, Federico Serafini wrote:
>> Add missing parameter names and make function declarations and
>> definitions consistent. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Since formally correct:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Nevertheless, it is probably about time to mention that ...
> 
>> @@ -198,10 +198,11 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
>>   int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
>>   int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
>>                                    int cap);
>> -const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
>> -                      unsigned int *dev, unsigned int *func);
>> -const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
>> -                          unsigned int *dev, unsigned int *func, bool *def_seg);
>> +const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
>> +                      unsigned int *dev_p, unsigned int *func_p);
>> +const char *parse_pci_seg(const char *s, unsigned int *seg_p,
>> +                          unsigned int *bus_p, unsigned int *dev_p,
>> +                          unsigned int *func_p, bool *def_seg);
> 
> ... parameter renaming like this, while fulfilling the word of Misra, is
> actually hampering readability. To someone wanting to use the function
> and hence looking at the declaration it is entirely uninteresting
> whether the _p suffixes are there; there were similar changes earlier on.
> The longer names merely make reading harder and - as is the case here -
> also may require a single declaration to wrap across more lines. I view
> such as going against the spirit of Misra (aiming to improve code
> clarity).
> 
> Jan
> 

I agree with you, but, the removal of _p would lead to
other (mechanical) changes to the function body.
In such cases, do you think that an improvement in readability
justifies the code churn?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

