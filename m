Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC3F7CBFD1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618172.961501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgdy-0004ds-LF; Tue, 17 Oct 2023 09:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618172.961501; Tue, 17 Oct 2023 09:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgdy-0004b4-IF; Tue, 17 Oct 2023 09:45:42 +0000
Received: by outflank-mailman (input) for mailman id 618172;
 Tue, 17 Oct 2023 09:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHSl=F7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsgdx-0004aw-D4
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:45:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeabbf7d-6cd1-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 11:45:40 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 063274EE0737;
 Tue, 17 Oct 2023 11:45:40 +0200 (CEST)
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
X-Inumbo-ID: eeabbf7d-6cd1-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 11:45:40 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-next v2 7/7] x86/mem_access: make function static
In-Reply-To: <c1d7f6e4-c0d9-d79d-504c-3b676d2be380@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <f9dcb169ad472fe888d6a03234264ec73e290df9.1696833629.git.nicola.vetrini@bugseng.com>
 <c1d7f6e4-c0d9-d79d-504c-3b676d2be380@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1bdfe82a4558b05a79c7790af5175958@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:29, Jan Beulich wrote:
> On 09.10.2023 08:54, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/mm/mem_access.c
>> +++ b/xen/arch/x86/mm/mem_access.c
>> @@ -249,7 +249,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned 
>> long gla,
>>      return (p2ma != p2m_access_n2rwx);
>>  }
>> 
>> -int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain 
>> *hp2m,
>> +static int p2m_set_altp2m_mem_access(struct domain *d, struct 
>> p2m_domain *hp2m,
>>                                struct p2m_domain *ap2m, p2m_access_t 
>> a,
>>                                gfn_t gfn)
> 
> As mentioned before, when adding static (or whatever else) like this,
> the next line(s) need re-indenting.
> 
> Jan

Ok.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

