Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516C77F9B3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 16:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585463.916597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeME-000544-Tp; Thu, 17 Aug 2023 14:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585463.916597; Thu, 17 Aug 2023 14:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeME-00051q-R6; Thu, 17 Aug 2023 14:52:18 +0000
Received: by outflank-mailman (input) for mailman id 585463;
 Thu, 17 Aug 2023 14:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWeMD-00051k-EV
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 14:52:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7360802-3d0d-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 16:52:14 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2FA894EE0737;
 Thu, 17 Aug 2023 16:52:14 +0200 (CEST)
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
X-Inumbo-ID: a7360802-3d0d-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Thu, 17 Aug 2023 16:52:14 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/3] drivers/video: make declarations of defined
 functions available
In-Reply-To: <111382a3-0845-99b5-1efa-dfc505084c66@suse.com>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
 <cc46049dbdf86cad33f6a9f7ae79851b54cecea1.1692275359.git.nicola.vetrini@bugseng.com>
 <111382a3-0845-99b5-1efa-dfc505084c66@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b61b9659a790701ec0b20e6c92dfb701@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/2023 15:28, Jan Beulich wrote:
> On 17.08.2023 14:39, Nicola Vetrini wrote:
>> --- a/xen/include/xen/vga.h
>> +++ b/xen/include/xen/vga.h
>> @@ -15,4 +15,20 @@
>>  extern struct xen_vga_console_info vga_console_info;
>>  #endif
>> 
>> +int fill_console_start_info(struct dom0_vga_console_info *);
>> +
>> +#ifdef CONFIG_X86
>> +void vesa_early_init(void);
>> +void vesa_endboot(bool_t keep);
>> +#else
>> +#define vesa_early_init() ((void)0)
>> +#define vesa_endboot(x)   ((void)0)
>> +#endif
>> +
>> +#ifdef CONFIG_VIDEO
>> +void vesa_init(void);
>> +#else
>> +static inline void vesa_init(void) {};
>> +#endif
> 
> Hmm, on one hand you simply move existing code here. But then why don't
> you leverage the existing #ifdef? The more that it's more specific and
> in line with drivers/video/Makefile having
> 
> obj-$(CONFIG_VGA) := vga.o
> 
> and
> 
> obj-$(CONFIG_VGA) += vesa.o
> 
> Jan

Are you saying that CONFIG_VGA implies CONFIG_VIDEO and therefore 
"#ifdef CONFIG_VGA"
at line 14 of vga.h can be used instead of the #ifdefs inherited from 
the original locations
to wrap all the declarations that are being moved?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

