Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5837E52B8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 10:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629242.981292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0f1N-0001bJ-8A; Wed, 08 Nov 2023 09:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629242.981292; Wed, 08 Nov 2023 09:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0f1N-0001YP-4s; Wed, 08 Nov 2023 09:38:49 +0000
Received: by outflank-mailman (input) for mailman id 629242;
 Wed, 08 Nov 2023 09:38:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/Mx=GV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r0f1L-0001YJ-Vj
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 09:38:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7faac8-7e1a-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 10:38:45 +0100 (CET)
Received: from [10.253.6.25] (unknown [160.78.253.186])
 by support.bugseng.com (Postfix) with ESMTPSA id B66A64EE0737;
 Wed,  8 Nov 2023 10:38:39 +0100 (CET)
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
X-Inumbo-ID: 9c7faac8-7e1a-11ee-9b0e-b553b5be7939
Message-ID: <bfeccb99-ef31-4b90-9da8-5c6745eacb7e@bugseng.com>
Date: Wed, 8 Nov 2023 10:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen/string: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <d28ea15aa8d36622548b433d5fb6f19dd521bdfb.1699369270.git.federico.serafini@bugseng.com>
 <3e94cfaf-7c01-dc5e-4d14-85d69e540479@suse.com>
 <b949bd0b-3071-449e-bfd9-ad25cc0a1d22@bugseng.com>
 <fd75ee81-3ae2-f776-416d-1f2e9690e3bc@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <fd75ee81-3ae2-f776-416d-1f2e9690e3bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/23 10:18, Jan Beulich wrote:
> (re-adding xen-devel@)
> 
> On 08.11.2023 09:43, Federico Serafini wrote:
>> On 08/11/23 09:07, Jan Beulich wrote:
>>> On 07.11.2023 16:18, Federico Serafini wrote:
>>>> Add missing parameter names and make function declarations and
>>>> definitions consistent.
>>>> Mismatches between parameter names "count" and "n" are resolved
>>>> in favor of "n", being the same name used by the C standard.
>>>
>>> I'm afraid this wasn't done consistently:
>>>
>>>> --- a/xen/include/xen/string.h
>>>> +++ b/xen/include/xen/string.h
>>>> @@ -12,27 +12,27 @@
>>>>    #define strncpy __xen_has_no_strncpy__
>>>>    #define strncat __xen_has_no_strncat__
>>>>    
>>>> -size_t strlcpy(char *, const char *, size_t);
>>>> -size_t strlcat(char *, const char *, size_t);
>>>> -int strcmp(const char *, const char *);
>>>> -int strncmp(const char *, const char *, size_t);
>>>> -int strcasecmp(const char *, const char *);
>>>> -int strncasecmp(const char *, const char *, size_t);
>>>> -char *strchr(const char *, int);
>>>> -char *strrchr(const char *, int);
>>>> -char *strstr(const char *, const char *);
>>>> -size_t strlen(const char *);
>>>> -size_t strnlen(const char *, size_t);
>>>> -char *strpbrk(const char *, const char *);
>>>> -char *strsep(char **, const char *);
>>>> -size_t strspn(const char *, const char *);
>>>> -
>>>> -void *memset(void *, int, size_t);
>>>> -void *memcpy(void *, const void *, size_t);
>>>> -void *memmove(void *, const void *, size_t);
>>>> -int memcmp(const void *, const void *, size_t);
>>>> -void *memchr(const void *, int, size_t);
>>>> -void *memchr_inv(const void *, int, size_t);
>>>> +size_t strlcpy(char *dest, const char *src, size_t size);
>>>> +size_t strlcat(char *dest, const char *src, size_t size);
>>>> +int strcmp(const char *cs, const char *ct);
>>>> +int strncmp(const char *cs, const char *ct, size_t count);
>>>
>>> There's still "count" here and ...
>>>
>>>> +int strcasecmp(const char *s1, const char *s2);
>>>> +int strncasecmp(const char *s1, const char *s2, size_t len);
>>>> +char *strchr(const char *s, int c);
>>>> +char *strrchr(const char *s, int c);
>>>> +char *strstr(const char *s1, const char *s2);
>>>> +size_t strlen(const char *s);
>>>> +size_t strnlen(const char *s, size_t count);
>>>> +char *strpbrk(const char *cs,const char *ct);
>>>> +char *strsep(char **s, const char *ct);
>>>> +size_t strspn(const char *s, const char *accept);
>>>> +
>>>> +void *memset(void *s, int c, size_t n);
>>>> +void *memcpy(void *dest, const void *src, size_t n);
>>>> +void *memmove(void *dest, const void *src, size_t n);
>>>> +int memcmp(const void *cs, const void *ct, size_t count);
>>>
>>> ... here (not counting functions which aren't part of the C standard).
>>>
>>> Otoh I'm unsure I understand that part of the description correctly:
>>> There was no disagreement for any of ...
>>>
>>>> --- a/xen/lib/memcpy.c
>>>> +++ b/xen/lib/memcpy.c
>>>> @@ -8,16 +8,16 @@
>>>>     * memcpy - Copy one area of memory to another
>>>>     * @dest: Where to copy to
>>>>     * @src: Where to copy from
>>>> - * @count: The size of the area.
>>>> + * @n: The size of the area.
>>>>     *
>>>>     * You should not use this function to access IO space, use memcpy_toio()
>>>>     * or memcpy_fromio() instead.
>>>>     */
>>>> -void *(memcpy)(void *dest, const void *src, size_t count)
>>>> +void *(memcpy)(void *dest, const void *src, size_t n)
>>>>    {
>>>>    	char *tmp = (char *) dest, *s = (char *) src;
>>>>    
>>>> -	while (count--)
>>>> +	while (n--)
>>>>    		*tmp++ = *s++;
>>>>    
>>>>    	return dest;
>>>> --- a/xen/lib/memmove.c
>>>> +++ b/xen/lib/memmove.c
>>>> @@ -8,23 +8,23 @@
>>>>     * memmove - Copy one area of memory to another
>>>>     * @dest: Where to copy to
>>>>     * @src: Where to copy from
>>>> - * @count: The size of the area.
>>>> + * @n: The size of the area.
>>>>     *
>>>>     * Unlike memcpy(), memmove() copes with overlapping areas.
>>>>     */
>>>> -void *(memmove)(void *dest, const void *src, size_t count)
>>>> +void *(memmove)(void *dest, const void *src, size_t n)
>>>>    {
>>>>    	char *tmp, *s;
>>>>    
>>>>    	if (dest <= src) {
>>>>    		tmp = (char *) dest;
>>>>    		s = (char *) src;
>>>> -		while (count--)
>>>> +		while (n--)
>>>>    			*tmp++ = *s++;
>>>>    	} else {
>>>> -		tmp = (char *) dest + count;
>>>> -		s = (char *) src + count;
>>>> -		while (count--)
>>>> +		tmp = (char *) dest + n;
>>>> +		s = (char *) src + n;
>>>> +		while (n--)
>>>>    			*--tmp = *--s;
>>>>    	}
>>>>    
>>>> --- a/xen/lib/memset.c
>>>> +++ b/xen/lib/memset.c
>>>> @@ -8,15 +8,15 @@
>>>>     * memset - Fill a region of memory with the given value
>>>>     * @s: Pointer to the start of the area.
>>>>     * @c: The byte to fill the area with
>>>> - * @count: The size of the area.
>>>> + * @n: The size of the area.
>>>>     *
>>>>     * Do not use memset() to access IO space, use memset_io() instead.
>>>>     */
>>>> -void *(memset)(void *s, int c, size_t count)
>>>> +void *(memset)(void *s, int c, size_t n)
>>>>    {
>>>>    	char *xs = (char *) s;
>>>>    
>>>> -	while (count--)
>>>> +	while (n--)
>>>>    		*xs++ = c;
>>>>    
>>>>    	return s;
>>>
>>> ... these, seeing that the declarations simply didn't have any parameter
>>> names at all.
>>
>> The disagreements are between parameter names used in
>> "xen/arch/string.c" and the ones used in "xen/lib/mem{cpy,move,set}.c".
>>
>> The reason why some of the "counts" are left is to reduce code churn:
>> I preferred to add the missing "count" on the declaration rather than
>> adding "n" to the declaration and also changing the name from "count" to
>> "n" in the definition.
> 
> I'm not happy about the resulting inconsistency, but I can kind of accept
> the "reduce code churn" argument. But then still the description wants to
> say so (along with making clear where the disagreements were). These are
> all adjustments which aren't required for functionality, so it is even
> more relevant to explain properly why the code is touched despite
> technically all being fine.

Alright.
Before sending another version I will wait a few hours to see if
other maintainers have anything to say about
"inconsistencies" vs "reduced code churn".

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

