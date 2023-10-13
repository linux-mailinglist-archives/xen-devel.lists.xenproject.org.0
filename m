Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8439B7C835F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616433.958466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFaf-0008M3-F3; Fri, 13 Oct 2023 10:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616433.958466; Fri, 13 Oct 2023 10:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFaf-0008K5-Bj; Fri, 13 Oct 2023 10:40:21 +0000
Received: by outflank-mailman (input) for mailman id 616433;
 Fri, 13 Oct 2023 10:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqNf=F3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qrFae-0008Ib-N6
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:40:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7a8fead-69b4-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 12:40:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5A0954EE073A;
 Fri, 13 Oct 2023 12:40:19 +0200 (CEST)
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
X-Inumbo-ID: e7a8fead-69b4-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 13 Oct 2023 12:40:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone
 Ballarin <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <alpine.DEB.2.22.394.2310121629350.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310121629350.3431292@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <14a333d412969e307beac85872f3e94d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2023 01:31, Stefano Stabellini wrote:
> On Thu, 12 Oct 2023, Nicola Vetrini wrote:
>> The purpose of this macro is to encapsulate the well-known expression
>> 'x & -x', that in 2's complement architectures on unsigned integers 
>> will
>> give 2^ffs(x), where ffs(x) is the position of the lowest set bit in 
>> x.
>> 
>> A deviation for ECLAIR is also introduced.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - rename to LOWEST_BIT
>> ---
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>>  xen/include/xen/macros.h                         | 6 ++++--
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index d8170106b449..b8e1155ee49d 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -274,6 +274,12 @@ still non-negative."
>>  -config=MC3R1.R10.1,etypes+={safe, 
>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", 
>> "dst_type(ebool||boolean)"}
>>  -doc_end
>> 
>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to 
>> obtain the value
>> +2^ffs(x) for unsigned integers on two's complement architectures
>> +(all the architectures supported by Xen satisfy this requirement)."
>> +-config=MC3R1.R10.1,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>> +-doc_end
> 
> Please also add the same deviation and explanation to
> docs/misra/deviations.rst. Other than that, this looks fine.
> 
> 

Ok.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

