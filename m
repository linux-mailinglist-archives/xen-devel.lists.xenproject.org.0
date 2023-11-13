Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA65E7E9F51
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631643.985215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YLb-0003sX-Uw; Mon, 13 Nov 2023 14:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631643.985215; Mon, 13 Nov 2023 14:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YLb-0003q0-Ru; Mon, 13 Nov 2023 14:55:31 +0000
Received: by outflank-mailman (input) for mailman id 631643;
 Mon, 13 Nov 2023 14:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLMk=G2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r2YLa-0003pp-Gm
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:55:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee9e0cf-8234-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 15:55:28 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 77CB44EE0741;
 Mon, 13 Nov 2023 15:55:27 +0100 (CET)
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
X-Inumbo-ID: aee9e0cf-8234-11ee-9b0e-b553b5be7939
Message-ID: <ea217868-ed91-468a-896b-96181c0eaecb@bugseng.com>
Date: Mon, 13 Nov 2023 15:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] xen/string: address violations of MISRA C:2012
 Rules 8.2 and 8.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <3e9b167738ade3f5249700d61591af95053ae6bc.1699605505.git.federico.serafini@bugseng.com>
 <66d58b06-f7ac-a5e3-6c32-6ad09ec15bec@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <66d58b06-f7ac-a5e3-6c32-6ad09ec15bec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/23 15:49, Jan Beulich wrote:
> On 10.11.2023 09:50, Federico Serafini wrote:
>> Add missing parameter names to address violations of
>> MISRA C:2012 Rule 8.2.
>>
>> Resolve mismatches between parameter name "count" used in
>> "xen/lib/mem{cpy,move,set}.c" and parameter name "n" used in
>> "xen/arch/x86/string.c" to address violations of MISRA C:2012 Rule 8.3.
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> In the interest of getting this off the plate
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> But I'm still not happy about ...
> 
>> --- a/xen/include/xen/string.h
>> +++ b/xen/include/xen/string.h
>> @@ -12,27 +12,27 @@
>>   #define strncpy __xen_has_no_strncpy__
>>   #define strncat __xen_has_no_strncat__
>>   
>> -size_t strlcpy(char *, const char *, size_t);
>> -size_t strlcat(char *, const char *, size_t);
>> -int strcmp(const char *, const char *);
>> -int strncmp(const char *, const char *, size_t);
>> -int strcasecmp(const char *, const char *);
>> -int strncasecmp(const char *, const char *, size_t);
>> -char *strchr(const char *, int);
>> -char *strrchr(const char *, int);
>> -char *strstr(const char *, const char *);
>> -size_t strlen(const char *);
>> -size_t strnlen(const char *, size_t);
>> -char *strpbrk(const char *, const char *);
>> -char *strsep(char **, const char *);
>> -size_t strspn(const char *, const char *);
>> -
>> -void *memset(void *, int, size_t);
>> -void *memcpy(void *, const void *, size_t);
>> -void *memmove(void *, const void *, size_t);
>> -int memcmp(const void *, const void *, size_t);
>> -void *memchr(const void *, int, size_t);
>> -void *memchr_inv(const void *, int, size_t);
>> +size_t strlcpy(char *dest, const char *src, size_t size);
>> +size_t strlcat(char *dest, const char *src, size_t size);
>> +int strcmp(const char *cs, const char *ct);
>> +int strncmp(const char *cs, const char *ct, size_t count);
>> +int strcasecmp(const char *s1, const char *s2);
>> +int strncasecmp(const char *s1, const char *s2, size_t len);
>> +char *strchr(const char *s, int c);
>> +char *strrchr(const char *s, int c);
>> +char *strstr(const char *s1, const char *s2);
>> +size_t strlen(const char *s);
>> +size_t strnlen(const char *s, size_t count);
>> +char *strpbrk(const char *cs,const char *ct);
>> +char *strsep(char **s, const char *ct);
>> +size_t strspn(const char *s, const char *accept);
>> +
>> +void *memset(void *s, int c, size_t n);
>> +void *memcpy(void *dest, const void *src, size_t n);
>> +void *memmove(void *dest, const void *src, size_t n);
>> +int memcmp(const void *cs, const void *ct, size_t count);
>> +void *memchr(const void *s, int c, size_t n);
>> +void *memchr_inv(const void *s, int c, size_t n);
> 
> ... the one "count" outlier left here, with no explanation in the
> description.
> 
> Jan

Feel free to add the further information in the description
(I thought my description was enough).

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

