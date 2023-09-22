Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33017AAD30
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 10:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606797.944835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbuq-0005dE-3f; Fri, 22 Sep 2023 08:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606797.944835; Fri, 22 Sep 2023 08:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbuq-0005aa-0w; Fri, 22 Sep 2023 08:53:36 +0000
Received: by outflank-mailman (input) for mailman id 606797;
 Fri, 22 Sep 2023 08:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJX2=FG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qjbup-0005aU-A8
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 08:53:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82616965-5925-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 10:53:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C590B4EE0739;
 Fri, 22 Sep 2023 10:53:32 +0200 (CEST)
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
X-Inumbo-ID: 82616965-5925-11ee-878a-cb3800f73035
MIME-Version: 1.0
Date: Fri, 22 Sep 2023 10:53:32 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <30e0d1b7-6ac0-464e-b45f-36b56960d8f9@perard>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
 <bf38efce3ac551fc95eaf1935ce7f574a7804df2.1693558913.git.nicola.vetrini@bugseng.com>
 <30e0d1b7-6ac0-464e-b45f-36b56960d8f9@perard>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <c07dc878a2706d1fef3d086bf4baedec@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2023 13:04, Anthony PERARD wrote:
> On Fri, Sep 01, 2023 at 11:06:39AM +0200, Nicola Vetrini wrote:
>> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
>> new file mode 100644
>> index 000000000000..8ea0505c8a20
>> --- /dev/null
>> +++ b/docs/misra/Makefile
>> @@ -0,0 +1,17 @@
>> +TARGETS := C-runtime-failures.o
>> +
>> +all: $(TARGETS)
>> +
>> +# sed is used in place of cat to prevent occurrences of '*/'
>> +# in the .rst from breaking the compilation
>> +$(TARGETS:.o=.c): %.c: %.rst
>> +	echo "/*\n" > $@.tmp
> 
> This doesn't really works as you expect. Depending on the shell used or
> the echo binary used, the "\n" would write a <new-line> or justs "\n".
> Bash just write "\n" for example, while dash does write a <new-line>.
> But, you can use `printf` instead:
>     printf "/*\n\n" > $@.tmp
> 
>> +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
>> +	echo "\n*/" >> $@.tmp
> 
> Same here.
> 
> 

Thanks, I'll fix it in the next version.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

