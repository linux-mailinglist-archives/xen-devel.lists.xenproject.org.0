Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439517911F9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 09:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594995.928460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3ri-0006ZB-Nb; Mon, 04 Sep 2023 07:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594995.928460; Mon, 04 Sep 2023 07:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3ri-0006WO-KY; Mon, 04 Sep 2023 07:19:18 +0000
Received: by outflank-mailman (input) for mailman id 594995;
 Mon, 04 Sep 2023 07:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MaJ0=EU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qd3rh-0006WI-1j
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 07:19:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58b76b78-4af3-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 09:19:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7E42B4EE0737;
 Mon,  4 Sep 2023 09:19:12 +0200 (CEST)
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
X-Inumbo-ID: 58b76b78-4af3-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Mon, 04 Sep 2023 09:19:12 +0200
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
In-Reply-To: <efb3dfa7-0fd0-83a5-67dc-eafad0a2bb57@suse.com>
References: <cover.1693585223.git.nicola.vetrini@bugseng.com>
 <a260399a471b84f3c37c15ac735dc7aec6bd33ea.1693585223.git.nicola.vetrini@bugseng.com>
 <efb3dfa7-0fd0-83a5-67dc-eafad0a2bb57@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <babbc14aff87b0d8546f4c617eccac3b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2023 09:02, Jan Beulich wrote:
> On 01.09.2023 18:34, Nicola Vetrini wrote:
>> As stated in 'docs/misra/rules.rst' the functions that are used only 
>> by
>> asm modules do not need to conform to MISRA C:2012 Rule 8.4.
>> The deviations are carried out with a SAF comment.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Where the identifier for a function definition is on the next line 
>> w.r.t. the
>> return type, they have been put on the same line (e.g. efi_start) to 
>> avoid
>> stylistically questionable constructs, such as
>> 
>> int
>> /* SAF-1-safe */
>> func(void) {
>> 	...
>> }
> 
> And
> 
> /* SAF-1-safe */
> int
> func(void) {
> 
> is not an option?
> 

Not at the moment, as it would deviate the line with the return type and 
not the one below,
and this is not configurable in the scripts under 
xen/scripts/xen-analysis:

/* SAF-1-safe */ -> /* -E> safe ... 1 */
int                 int
func(void)          func(void)

As I said, this can perhaps be solved by allowing markers to specify 
either a row count, such as

/* SAF-1-safe 2 */ -> /* -E> safe ... 2 */
int                   int
func(void)            func(void)

or count the line span of the whole function declarator in the python 
script and translating
/* SAF-1-safe */ -> /* -E> safe ... 2 */.

> Further in the cover letter you say "Deviating variables needs more 
> care, and
> is therefore postponed to another patch", yet then here you annotate a 
> couple
> of variables as well. Could you clarify what the criteria are for 
> "needs more
> care"?
> 

I see. I did not intend for those changes to end up in this patch, 
although those two are
clearly only used by asm code and therefore are excepted.
Most of the variables I left out are also used by C code, therefore they 
may be eligible for
a declaration, but where to put this declaration requires a careful 
examination in my opinion.
They are not too many, tough.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

