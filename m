Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF776E784
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 13:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576288.902260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWxO-0001AD-AU; Thu, 03 Aug 2023 11:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576288.902260; Thu, 03 Aug 2023 11:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWxO-00017v-7P; Thu, 03 Aug 2023 11:57:30 +0000
Received: by outflank-mailman (input) for mailman id 576288;
 Thu, 03 Aug 2023 11:57:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRWxM-00017n-TS
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 11:57:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRWxL-0005Em-MC; Thu, 03 Aug 2023 11:57:27 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRWxL-0002ti-Fi; Thu, 03 Aug 2023 11:57:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jUjfhjRzz9jAmM6SBtqFHcoXBJ2qBpxuPqhdpJlDr8o=; b=OPd5Hu1uSyOmUjk8EKZH7tEe0L
	+8CaiFCnUhHE0WyYfq5G0UFsnxANOok1Mx4htJuVbdEgdoGtfeAqIJvqHyIPI9E+LtrGwcAnl1UE2
	oGl36wvOnzVKUAtZMhPndevro0V8EPJwqqY64m5hEJnKimAuRRr3t5XkLzvdFDLvmq28=;
Message-ID: <1e2d06ab-ad3a-4e5a-ac78-d20bad28bb20@xen.org>
Date: Thu, 3 Aug 2023 12:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
 <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com>
 <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org>
 <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/08/2023 12:52, Luca Fancellu wrote:
>> On 3 Aug 2023, at 12:46, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 03/08/2023 11:28, Luca Fancellu wrote:
>>>> On 3 Aug 2023, at 09:26, Federico Serafini <federico.serafini@bugseng.com> wrote:
>>>>
>>>> Add missing parameter names to address violation of MISRA C:2012
>>>> rule 8.2 ("Function types shall be in prototype form with named
>>>> parameters").
>>>>
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>> Changes in v2:
>>>>   - memset() adjusted.
>>>> ---
>>>> xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
>>>> 1 file changed, 21 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
>>>> index b4d2217a96..e91e3112e0 100644
>>>> --- a/xen/include/xen/string.h
>>>> +++ b/xen/include/xen/string.h
>>>> @@ -12,27 +12,27 @@
>>>> #define strncpy __xen_has_no_strncpy__
>>>> #define strncat __xen_has_no_strncat__
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
>>>> +int strcasecmp(const char *s1, const char *s2);
>>>> +int strncasecmp(const char *s1, const char *s2, size_t len);
>>>> +char *strchr(const char *s, int c);
>>>> +char *strrchr(const char *s, int c);
>>>> +char *strstr(const char *s1, const char *s2);
>>>> +size_t strlen(const char *s);
>>>> +size_t strnlen(const char *s, size_t count);
>>>> +char *strpbrk(const char *cs, const char *ct);
>>>> +char *strsep(char **s, const char *ct);
>>>> +size_t strspn(const char *s, const char *accept);
>>>> +
>>>> +void *memset(void *s, int c, size_t count);
>>>> +void *memcpy(void *dest, const void *src, size_t count);
>>> There is a comment in arch/arm/rm32/lib/memcpy.S with this:
>>> /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
>>>> +void *memmove(void *dest, const void *src, size_t count);
>>> There is a comment in arch/arm/rm32/lib/memmove.S with this:
>>>   * Prototype: void *memmove(void *dest, const void *src, size_t n);
>>>> +int memcmp(const void *cs, const void *ct, size_t count);
>>>> +void *memchr(const void *s, int c, size_t n);
>>>> +void *memchr_inv(const void *s, int c, size_t n);
>>> @Stefano: would it make sense to remove it as part of this patch or maybe not?
>>
>> They are a verbatim copy of the Linux code. So I would rather no touch it.
> 
> Oh I see! Thank you for pointing that out, then I’m wondering if it’s there a reason why we
> are using ‘count’ instead of ’n’ as third parameter name, I know Stefano suggested that, so
> It’s just a curiosity. Maybe it’s for clarity?

I guess because the generic implementation of memset (see 
xen/lib/memset.c) is using 'count' rather than 'n'.

Given what Andrew said, I would say we should rename the parameter to 'n'.

Cheers,

-- 
Julien Grall

