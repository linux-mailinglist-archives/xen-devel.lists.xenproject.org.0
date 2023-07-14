Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE767753BF9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 15:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563652.881006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJ5n-0007y3-E5; Fri, 14 Jul 2023 13:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563652.881006; Fri, 14 Jul 2023 13:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJ5n-0007v0-As; Fri, 14 Jul 2023 13:44:19 +0000
Received: by outflank-mailman (input) for mailman id 563652;
 Fri, 14 Jul 2023 13:44:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKJ5m-0007uu-FE
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:44:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85dda14e-224c-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 15:44:15 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id 551DA4EE0739;
 Fri, 14 Jul 2023 15:44:14 +0200 (CEST)
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
X-Inumbo-ID: 85dda14e-224c-11ee-8611-37d641c3527e
Message-ID: <77b82911-a6c1-d23f-e42b-132d928e6603@bugseng.com>
Date: Fri, 14 Jul 2023 15:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/ACPI: Remove the acpi_string type
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <20230714130411.3055187-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <20230714130411.3055187-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 14/07/23 15:04, Andrew Cooper wrote:
> Typedef-ing a naked pointer like this an anti-pattern which is best avoided.

s/this an/this is an/

> Furthermore, it's bad to pass a string literate in a mutable type.  Delete the

s/literate/literal/

> type entirely, and replace it with a plain 'const char *'.
> 
> This highlights two futher bugs.  acpi_get_table() already had a mismatch in
> types between it's declaration and definition, and we have declarations for
> acpi_get_handle() and acpi_get_table_header() but no definition at all (nor
> any callers).
> 
> This fixes violations of MISRA Rule 7.4:
> 
>    A string literal shall not be assigned to an object unless the object's type
>    is "pointer to const-qualified char".
> 
> and of Rule 8.3:
> 
>    All declarations of an object or function shall use the same names and type
>    qualifiers.
> 
> and of Rule 8.6:
> 
>    An identifier with external linkage shall have exactly one external
>    definition.

The choice of rules looks good to me, but perhaps Roberto has some 
additional insight on this.

> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Roberto/Nicola: Please double check my choice of rules here, and point out any
> others that I may have missed.
> ---
>   xen/drivers/acpi/tables/tbxface.c |  4 ++--
>   xen/include/acpi/acpixf.h         | 13 ++-----------
>   xen/include/acpi/actypes.h        |  1 -
>   3 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/drivers/acpi/tables/tbxface.c b/xen/drivers/acpi/tables/tbxface.c
> index 21b2e5eae1c7..204d66caea48 100644
> --- a/xen/drivers/acpi/tables/tbxface.c
> +++ b/xen/drivers/acpi/tables/tbxface.c
> @@ -164,7 +164,7 @@ acpi_initialize_tables(struct acpi_table_desc * initial_table_array,
>    *
>    *****************************************************************************/
>   acpi_status __init
> -acpi_get_table(char *signature,
> +acpi_get_table(const char *signature,
>   	       acpi_native_uint instance, struct acpi_table_header **out_table)
>   {
>   	acpi_native_uint i;
> @@ -220,7 +220,7 @@ acpi_get_table(char *signature,
>    *
>    *****************************************************************************/
>   acpi_status __init
> -acpi_get_table_phys(acpi_string signature, acpi_native_uint instance,
> +acpi_get_table_phys(const char *signature, acpi_native_uint instance,
>   		     acpi_physical_address *addr, acpi_native_uint *len)
>   {
>   	acpi_native_uint i, j;
> diff --git a/xen/include/acpi/acpixf.h b/xen/include/acpi/acpixf.h
> index ba74908f0478..8b70154b8f96 100644
> --- a/xen/include/acpi/acpixf.h
> +++ b/xen/include/acpi/acpixf.h
> @@ -69,25 +69,16 @@ acpi_status acpi_load_tables(void);
>   acpi_status acpi_load_table(struct acpi_table_header *table_ptr);
>   
>   acpi_status
> -acpi_get_table_header(acpi_string signature,
> -		      acpi_native_uint instance,
> -		      struct acpi_table_header *out_table_header);
> -
> -acpi_status
> -acpi_get_table(acpi_string signature,
> +acpi_get_table(const char *signature,
>   	       acpi_native_uint instance, struct acpi_table_header **out_table);
>   
>   acpi_status
> -acpi_get_table_phys(acpi_string signature, acpi_native_uint instance,
> +acpi_get_table_phys(const char *signature, acpi_native_uint instance,
>   		     acpi_physical_address *addr, acpi_native_uint *len);
>   /*
>    * Namespace and name interfaces
>    */
>   acpi_status
> -acpi_get_handle(acpi_handle parent,
> -		acpi_string pathname, acpi_handle * ret_handle);
> -
> -acpi_status
>   acpi_debug_trace(char *name, u32 debug_level, u32 debug_layer, u32 flags);
>   
>   acpi_status
> diff --git a/xen/include/acpi/actypes.h b/xen/include/acpi/actypes.h
> index f3e95abc3ab3..7023863d0349 100644
> --- a/xen/include/acpi/actypes.h
> +++ b/xen/include/acpi/actypes.h
> @@ -281,7 +281,6 @@ typedef acpi_native_uint acpi_size;
>    */
>   typedef u32 acpi_status;	/* All ACPI Exceptions */
>   typedef u32 acpi_name;		/* 4-byte ACPI name */
> -typedef char *acpi_string;	/* Null terminated ASCII string */
>   typedef void *acpi_handle;	/* Actually a ptr to a NS Node */
>   
>   struct uint64_struct {

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

