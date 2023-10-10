Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DA7BF535
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 10:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614593.955788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq7h2-0007RB-54; Tue, 10 Oct 2023 08:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614593.955788; Tue, 10 Oct 2023 08:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq7h2-0007PU-2V; Tue, 10 Oct 2023 08:02:16 +0000
Received: by outflank-mailman (input) for mailman id 614593;
 Tue, 10 Oct 2023 08:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+X1=FY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qq7h0-0007PO-5Y
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 08:02:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5129ebc8-6743-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 10:02:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 512AD4EE0742;
 Tue, 10 Oct 2023 10:02:11 +0200 (CEST)
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
X-Inumbo-ID: 5129ebc8-6743-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 10:02:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 consulting@bugseng.com, roger.pau@citrix.com, dfaggioli@suse.com
Subject: Re: Rule 10.1 violations in perfc_incra and PERFCOUNTER_ARRAY
In-Reply-To: <alpine.DEB.2.22.394.2310091838510.3431292@ubuntu-linux-20-04-desktop>
References: <5cfaaaceb163af3244981b020ed55f3f@bugseng.com>
 <alpine.DEB.2.22.394.2310091838510.3431292@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <771624f5199fe76ce266a00d0c649428@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2023 03:56, Stefano Stabellini wrote:
> On Fri, 6 Oct 2023, Nicola Vetrini wrote:
>> Given the following macros in <xen/perfc.h> and
>> 
>> #define perfc_incra(x,y)                                               
>>  \
>>     ( (y) <= PERFC_LAST_ ## x - PERFC_ ## x ?                          
>>  \
>> 	 ++this_cpu(perfcounters)[PERFC_ ## x + (y)] : 0 )
>> 
>> and the following violation
>> 
>> xen/arch/arm/traps.c:1407.5-1407.32:
>>   reference to enum constant `PERFC_hypercalls' has essential type 
>> `enum
>> perfcounter'
>>   and standard type `int'
>>  <preprocessed xen/arch/arm/traps.c>:11606.29-11606.44: preprocessed 
>> tokens
>>  <scratch space>:137.1-137.16: expanded from macro `PERFC_'
>>  xen/include/xen/perfc.h:69.35-69.45: expanded from macro 
>> `perfc_incra'
>> xen/arch/arm/traps.c:1407.5-1407.32:
>>   `+' addition operator expects a number or a character
>>  <preprocessed xen/arch/arm/traps.c>:11606.46: preprocessed tokens
>>  xen/include/xen/perfc.h:69.47: expanded from macro `perfc_incra'
>> 
>> the difference between enumerated values is forbidden by the Rule. In 
>> the
>> coding standard's
>> interpretation, named enums are unordered list of symbols, which can 
>> only be
>> compared for
>> equality.
>> There are a few possible paths forward:
>> 
>> 1. use means different from named enums to generate these constants 
>> (such as
>> #define-s or
>>    constants integers);
> 
> This is a viable option
> 
> 
>> 2. explicitly deviate subtraction of enums, therefore defining an 
>> explicit
>> ordering on
>>    enumerated values;
> 
> I would prefer to avoid a project-wide deviation, because I think in
> general it is a good rule to have. If we go with a deviation, I think 
> it
> would be better to deviate PERFCOUNTER or perfc.h specifically. This is
> a file that changes very rarely. We could make the case that this is
> safe with GCC (most probably is) and this case was reviewed carefully
> and doesn't change often (3 changes in the last 10 yeas).
> 
> 
>> 3. use an unnamed enum, effectively considering the enumerated values 
>> as plain
>> integers.
>>    This does not violate the Rule.
> 
> What do you mean by unname enum?

e.g.

enum {
#include <xen/perfc_defn.h>
	NUM_PERFCOUNTERS
};

instead of

enum perfcounter {
#include <xen/perfc_defn.h>
	NUM_PERFCOUNTERS
};

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

