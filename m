Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155D8185AD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 11:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656652.1024984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXhI-0008G8-Hg; Tue, 19 Dec 2023 10:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656652.1024984; Tue, 19 Dec 2023 10:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXhI-0008Dd-Dz; Tue, 19 Dec 2023 10:51:36 +0000
Received: by outflank-mailman (input) for mailman id 656652;
 Tue, 19 Dec 2023 10:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNFb=H6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFXhH-0008C8-6M
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 10:51:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9335c970-9e5c-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 11:51:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 89CE74EE0738;
 Tue, 19 Dec 2023 11:51:33 +0100 (CET)
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
X-Inumbo-ID: 9335c970-9e5c-11ee-98eb-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 11:51:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
In-Reply-To: <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
References: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
 <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
Message-ID: <2fd03776043811a8ceae9ae41de5f0fa@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-19 11:37, Jan Beulich wrote:
> On 19.12.2023 10:02, Nicola Vetrini wrote:
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -209,6 +209,10 @@
>>            "rel_path": "include/acpi/acglobal.h",
>>            "comment": "Imported from Linux, ignore for now"
>>          },
>> +        {
>> +          "rel_path": "include/acpi/acmacros.h",
>> +          "comment": "Imported from Linux, ignore for now"
>> +        },
> 
> Together with what's already there (in context), wouldn't it better be
> the entire directory then which is excluded, or at least all
> include/acpi/ac*.h collectively (and perhaps also
> include/acpi/platform/ac*.h)?
> 
> Jan

+Cc Luca Fancellu

Sure. I wasn't certain which files are imported from ACPI CA and which 
aren't.
I'm also not sure whether "include/acpi/ac*.h" would be properly 
recognized by other tooling that uses exclude-list.json (only cppcheck I 
think). I Cc-ed Luca Fancellu on this.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

