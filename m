Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F18793CC1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596576.930499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrlq-0005GL-I2; Wed, 06 Sep 2023 12:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596576.930499; Wed, 06 Sep 2023 12:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrlq-0005DA-FA; Wed, 06 Sep 2023 12:36:34 +0000
Received: by outflank-mailman (input) for mailman id 596576;
 Wed, 06 Sep 2023 12:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T1xS=EW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qdrlp-0005D2-Ck
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:36:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0125f9fb-4cb2-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 14:36:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B01EB4EE0737;
 Wed,  6 Sep 2023 14:36:30 +0200 (CEST)
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
X-Inumbo-ID: 0125f9fb-4cb2-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 14:36:30 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] drivers/video: make declarations of defined
 functions available
In-Reply-To: <2dc97f01-7088-1a91-77e2-79792840b828@suse.com>
References: <d0266b549dd88d273918521ccb538592df9e58b1.1693551521.git.nicola.vetrini@bugseng.com>
 <2dc97f01-7088-1a91-77e2-79792840b828@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <35db7891e985e3376f744b8cbffdf252@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2023 16:42, Jan Beulich wrote:
> On 01.09.2023 09:02, Nicola Vetrini wrote:
>> The declarations for 'vesa_{init,early_init,endboot}' needed by
>> 'xen/drivers/video/vesa.c' and 'fill_console_start_info' in 'vga.c'
>> are now available by moving the relative code inside 'vga.h'.
>> 
>> While moving the code, the alternative definitions are now guarded by
>> CONFIG_VGA, since it implies all previously used constants.
> 
> But such an implication doesn't mean said adjustment is correct. 
> Easiest
> would likely be to simply drop that half sentence.
> 

Maybe I didn't phrase that correctly, I'm ok with just dropping the last 
part
(it can be traced to the Kconfig anyway).

>> --- a/xen/include/xen/vga.h
>> +++ b/xen/include/xen/vga.h
>> @@ -13,6 +13,14 @@
>> 
>>  #ifdef CONFIG_VGA
>>  extern struct xen_vga_console_info vga_console_info;
>> +int fill_console_start_info(struct dom0_vga_console_info *);
>> +void vesa_init(void);
>> +void vesa_early_init(void);
>> +void vesa_endboot(bool_t keep);
> 
> Nit: Just "bool" please.
> 

Right, I missed it.

>> +#else
>> +#define vesa_early_init() ((void)0)
>> +#define vesa_endboot(x)   ((void)0)
>> +static inline void vesa_init(void) {};
> 
> So why two #define-s and one inline function? Just because it was that
> way originally doesn't mean it needs to stay that way. Then again are
> the two #define-s actually needed at all? It looks like they were added
> to vga.c just out of precaution, covering the "VGA but no VESA" case.
> Now that things are properly moved to headers (and keyed to CONFIG_VGA)
> I think we'd better omit those. They can be introduced again when we
> gain a VGA/VESA split (and a CONFIG_VESA).
> 

Ok on uniforming them to inline functions.
I don't have an opinion on the second matter. If you're otherwise okay 
with the patch
and no one objects I can drop them.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

