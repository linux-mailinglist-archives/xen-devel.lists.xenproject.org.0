Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF85449D5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345071.570714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGAh-0003ZF-8C; Thu, 09 Jun 2022 11:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345071.570714; Thu, 09 Jun 2022 11:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGAh-0003Wn-4w; Thu, 09 Jun 2022 11:17:51 +0000
Received: by outflank-mailman (input) for mailman id 345071;
 Thu, 09 Jun 2022 11:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fG7=WQ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1nzGAf-0003Wb-7i
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:17:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac58179-e7e5-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 13:17:47 +0200 (CEST)
Received: from [192.168.1.137] (host-82-59-248-251.retail.telecomitalia.it
 [82.59.248.251])
 by support.bugseng.com (Postfix) with ESMTPSA id 9EA634EE0CDD;
 Thu,  9 Jun 2022 13:17:46 +0200 (CEST)
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
X-Inumbo-ID: cac58179-e7e5-11ec-bd2c-47488cf2e6aa
Message-ID: <26829bf4-bbcc-a610-ba3b-fa60aa296cf9@bugseng.com>
Date: Thu, 9 Jun 2022 13:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: MISRA C meeting tomorrow, was: MOVING COMMUNITY CALL Call for
 agenda items for 9 June Community Call @ 1500 UTC
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com,
 julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org,
 roberto.bagnara@bugseng.com
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206081806020.21215@ubuntu-linux-20-04-desktop>
 <880f3273-f92b-2b60-8de0-e69fefbada21@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <880f3273-f92b-2b60-8de0-e69fefbada21@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/22 09:04, Jan Beulich wrote:
> On 09.06.2022 03:20, Stefano Stabellini wrote:
>> Finally, for Rule 13.2, I updated the link to ECLAIR's results. There
>> are a lot more violations than just 4, but I don't know if they are
>> valid or false positives.
> 
> I've picked just the one case in xen/common/efi/ebmalloc.c to check,
> and it says "possibly". That's because evaluation of function call
> arguments involves the calling of (in this case two) further
> functions. If those functions had side effects (which apparently the
> tool can't figure), there would indeed be a problem.
> 
> The (Arm based) count of almost 10k violations is clearly a concern.
> I don't consider it even remotely reasonable to add 10k comments, no
> matter how brief, to cover all the false positives.

Again, the MISRA approach is a preventive one.
If you have reasons you want to write

    f(g(), h());

then declare g() and h() as pure (or const, if they are const).
E.g.:

#if COMPILER_SUPPORTS_PURE
#define PURE __attribute__((pure))
#else
#define PURE
#endif

int g(void) PURE;
int h(void) PURE;

It's good documentation, it improves compiler diagnostics,
and it satisfies Rule 13.2.
Kind regards,

    Roberto



