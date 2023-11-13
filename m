Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957C7E9ACF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 12:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631518.984891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Uqm-00014a-AN; Mon, 13 Nov 2023 11:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631518.984891; Mon, 13 Nov 2023 11:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Uqm-00011c-7s; Mon, 13 Nov 2023 11:11:28 +0000
Received: by outflank-mailman (input) for mailman id 631518;
 Mon, 13 Nov 2023 11:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PsMb=G2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r2Uqk-00011W-54
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 11:11:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 619a36bc-8215-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 12:11:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C68784EE073E;
 Mon, 13 Nov 2023 12:11:23 +0100 (CET)
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
X-Inumbo-ID: 619a36bc-8215-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 12:11:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jbeulich
 <jbeulich@suse.com>, Roger Pau <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Consulting
 <consulting@bugseng.com>
Subject: Re: Remaining violations of MISRA Rule 7.4
In-Reply-To: <bdb7efb1-b8b2-4426-a46d-e8f5afdba0f6@citrix.com>
References: <21761f2a6633a08ceb2b70a46013486a@bugseng.com>
 <bdb7efb1-b8b2-4426-a46d-e8f5afdba0f6@citrix.com>
Message-ID: <12d2760c2ada2fcd29594cef767f24b3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-08 19:45, Andrew Cooper wrote:
> On 08/11/2023 4:24 pm, Nicola Vetrini wrote:
>> Hi everyone,
>> 
>> I was looking at leftover violations for MISRA Rule 7.4:
>> 'A string literal shall not be assigned to an object unless the
>> object's type
>> is "pointer to const-qualified char" '
>> 
>> You can see the referenced violations at [1] and [2].
>> 
>> I think the ones in x86/setup.c can be taken care of either by making
>> an early return
>> from cmdline_cook, given that one caller never supplies a NULL
>> cmdline, while the other
>> properly takes care of the possibility of returning NULL, afaict.
>> 
>>  static char * __init cmdline_cook(char *p, const char *loader_name)
>>  {
>> -    p = p ? : "";
>> +    if ( p == NULL )
>> +        return NULL;
>> 
>> or changing the type of "loader" to const char*
>> 
>>  void __init noreturn __start_xen(unsigned long mbi_p)
>>  {
>> -    const char *memmap_type = NULL;
>> -    char *cmdline, *kextra, *loader;
>> +    const char *memmap_type = NULL, *loader = NULL;
>> +    char *cmdline, *kextra;;
>> 
>> as, as far as I can tell, it's never changed after
>> 
>>     loader = (mbi->flags & MBI_LOADERNAME)
>>         ? (char *)__va(mbi->boot_loader_name) : "unknown";
>> 
>> However, the one in xen/arch/arm/efi/efi-boot.h
>> 
>> name.s = "xen";
>> 
>> does not look to have a clear resolution
>> path, therefore I propose to deviate this with a SAF textual
>> deviation, whose justification
>> relies on the fact that the string is never modified afterwards.
>> 
>> For the one in arm-uart.c from the discussion, I'm testing possible
>> solution with no code
>> changes, but if that doesn't work out, then I'm inclined towards a
>> deviation, as options
>> is never modified afterwards.
>> 
>> What do you think?
> 
> I've just rebased and pushed the residual from the past work (although 
> I
> missed the ARM EFI fix.)
> 
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=0f06bab762f5201f3e00aaaee704c3c01f516b51
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1065699873
> 
> I'm going to make a firm request that we fix this by activating
> -Wwrite-strings Xen wide, because that's by far and away the best way 
> to
> stop regressions creeping back in.
> 

Yes, it seems the best solution. I forgot about that patch, sorry.

   drivers/char/arm-uart.c: In function 'dt_uart_init':
   drivers/char/arm-uart.c:81:17: error: assignment discards 'const' 
qualifier from pointer target type [-Werror=discarded-qualifiers]
      81 |         options = "";
         |                 ^

Here I was thinking about

      options = strchr(opt_dtuart, ':');
      if ( options != NULL )
          *(options++) = '\0';
-    else
-        options = "";

-    printk("Looking for dtuart at \"%s\", options \"%s\"\n", devpath, 
options);
+    printk("Looking for dtuart at \"%s\", options \"%s\"\n", devpath,
+           options ? options : "");

> In start_xen(), basically whatever goes.  All that's doing is 
> processing
> of one command line into another, and your version looks a bit neater
> than mine.
> 
> The name.s cases (it's duplicated in x86 and ARM) are more tricky.  The
> compiler warning can be silenced by swapping name.s for name.cs but I
> have no idea whether Eclair can see through that piece of blatent 
> lying.
> 

No it doesn't, because the type of the lhs is checked, and if it's 
constant then it's enough for the Rule.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

