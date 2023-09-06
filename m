Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF3794041
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 17:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596668.930646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduMY-0005JX-Vo; Wed, 06 Sep 2023 15:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596668.930646; Wed, 06 Sep 2023 15:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduMY-0005Gs-SU; Wed, 06 Sep 2023 15:22:38 +0000
Received: by outflank-mailman (input) for mailman id 596668;
 Wed, 06 Sep 2023 15:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T1xS=EW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qduMX-0005Gm-SC
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 15:22:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34b46d37-4cc9-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 17:22:35 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C8AE64EE0737;
 Wed,  6 Sep 2023 17:22:34 +0200 (CEST)
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
X-Inumbo-ID: 34b46d37-4cc9-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 17:22:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/2] xen: apply deviation for Rule 8.4 (asm-only
 definitions)
In-Reply-To: <fff285f4-55e9-3709-372d-2344e7227dff@suse.com>
References: <cover.1693585223.git.nicola.vetrini@bugseng.com>
 <a260399a471b84f3c37c15ac735dc7aec6bd33ea.1693585223.git.nicola.vetrini@bugseng.com>
 <efb3dfa7-0fd0-83a5-67dc-eafad0a2bb57@suse.com>
 <babbc14aff87b0d8546f4c617eccac3b@bugseng.com>
 <fff285f4-55e9-3709-372d-2344e7227dff@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <2c89b9977fbdc6539f121f5866e22977@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2023 10:09, Jan Beulich wrote:
> On 04.09.2023 09:19, Nicola Vetrini wrote:
>> On 04/09/2023 09:02, Jan Beulich wrote:
>>> Further in the cover letter you say "Deviating variables needs more
>>> care, and
>>> is therefore postponed to another patch", yet then here you annotate 
>>> a
>>> couple
>>> of variables as well. Could you clarify what the criteria are for
>>> "needs more
>>> care"?
>> 
>> I see. I did not intend for those changes to end up in this patch,
>> although those two are
>> clearly only used by asm code and therefore are excepted.
>> Most of the variables I left out are also used by C code, therefore 
>> they
>> may be eligible for
>> a declaration, but where to put this declaration requires a careful
>> examination in my opinion.
>> They are not too many, tough.
> 
> Anything also used by C code (and not in the same CU) clearly wants a
> declaration.
> 
> Jan

I think that a declaration (in an header) is a good idea also when a 
symbol is defined in a translation unit
and it used both by C code in that TU and asm modules. This also allows 
C code that uses
that symbol to be moved around freely without other changes.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

