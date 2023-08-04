Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD676FDC0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577044.903863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrOl-0001K1-Au; Fri, 04 Aug 2023 09:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577044.903863; Fri, 04 Aug 2023 09:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrOl-0001Gg-7m; Fri, 04 Aug 2023 09:47:07 +0000
Received: by outflank-mailman (input) for mailman id 577044;
 Fri, 04 Aug 2023 09:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRrOj-0001GZ-JU
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:47:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de4f5510-32ab-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 11:47:04 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 40B994EE0737;
 Fri,  4 Aug 2023 11:47:04 +0200 (CEST)
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
X-Inumbo-ID: de4f5510-32ab-11ee-b26b-6b7b168915f2
MIME-Version: 1.0
Date: Fri, 04 Aug 2023 11:47:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <stefano.stabellini@amd.com>, Michal Orzel <michal.orzel@amd.com>,
 xenia.ragiadakou@amd.com, Ayan Kumar Halder <ayankuma@amd.com>,
 consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Address MISRA C:2012 Rule 8.4
In-Reply-To: <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
 <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2023 02:35, Stefano Stabellini wrote:
> I think that's OK for me. My only concern is that we should track the
> project-wide deviations properly somewhere besides the ECLAIR
> configuration under xen.git which is ECLAIR specific. So far we used 
> the
> notes in docs/misra/rules.rst. I don't know if that sufficient, but we
> could add a note for 8.4:
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 8f0e4d3f25..5977bc9d5e 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -245,7 +245,8 @@ maintainers if you want to suggest a change.
>       - Required
>       - A compatible declaration shall be visible when an object or
>         function with external linkage is defined
> -     -
> +     - No need for declarations when functions are only called from
> +       assembly
> 
>     * - `Rule 8.5
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c>`_
>       - Required
> 
> 
> On Thu, 3 Aug 2023, Nicola Vetrini wrote:
>> The headline of Rule 8.4 is as follows:
>> "A compatible declaration shall be visible when an object or
>> function with external linkage is defined".
>> 
>> Some functions reported in [1][2] are lacking a declaration in the 
>> respective
>> header files;
>> as remarked on xen-devel's IRC channel, this is ok since they are only 
>> called
>> from asm code (e.g., start_xen). A similar discussion
>> had taken place in the past (see [3]) and the general consensus was to 
>> deviate
>> these cases.
>> If that is still the case, a suitable project-wide deviation can be 
>> added to
>> address these violations.
>> 
>> [1]
>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/210/PROJECT.ecd;/by_service/MC3R1.R8.4.html
>> [2]
>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/210/PROJECT.ecd;/by_service/MC3R1.R8.4.html
>> [3] 
>> https://lore.kernel.org/all/20220705210218.483854-2-burzalodowa@gmail.com/
>> 

Upon further examination, I identified the following patterns:

1. Functions defined in .c called only from asm code (e.g., the already 
mentioned __start_xen)
2. Functions/variables declared in a .h, defined in a .c that does not 
include the .h with the declaration
(e.g., 'fill_console_start_info' is defined in 'xen/drivers/vga.c', 
declared in 'xen/include/xen/console.h' which is not visible when 
compiling the .c).
3. Variables that are either extern or not, such as 'acpi_gbl_FADT' in 
'xen/include/acpi/acglobal.h', depending on
    DEFINE_ACPI_GLOBALS

Below are the proposed resolution strategies:

1. I would advise to add the declaration in the relative .h, to support 
automatic consistency checks with the
    implementation and a quick reference when touching the asm.
2. To comply with the rule, the header with the declaration should be 
included. Also note that there are some
    corner cases, such as 'get_sec', which is used in 'cper.h' without 
including 'time.h' (which should gain a
    declaration for it).
3. One possible resolution pattern is including 'acglobal.h' twice 
(either directly or indirectly trough acpi.h, if
    the latter does not cause other issues) like so:

    (assuming DEFINE_ACPI_GLOBALS is undefined here)
    #include "acglobal.h"
    #define DEFINE_ACPI_GLOBALS
    #include  "acglobal.h"

   this way, the rule is followed properly, though it's not the prettiest 
pattern and also clashes with the objectives
   of D4.10 ("Precautions shall be taken in order to prevent the contents 
of a header file being included
   more than once"), but then a motivated exception is allowed there.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

