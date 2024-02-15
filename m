Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A16855EC2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681463.1060237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYeG-0005re-Iz; Thu, 15 Feb 2024 10:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681463.1060237; Thu, 15 Feb 2024 10:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYeG-0005oS-G2; Thu, 15 Feb 2024 10:07:20 +0000
Received: by outflank-mailman (input) for mailman id 681463;
 Thu, 15 Feb 2024 10:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUcX=JY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1raYeF-0005oK-BK
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:07:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00039feb-cbea-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:07:18 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 4278B4EE0737;
 Thu, 15 Feb 2024 11:07:17 +0100 (CET)
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
X-Inumbo-ID: 00039feb-cbea-11ee-8a4d-1f161083a0e0
Message-ID: <d735e980-c5a5-46b1-a511-cc2d666dac23@bugseng.com>
Date: Thu, 15 Feb 2024 11:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
 <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
 <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/02/24 09:10, Jan Beulich wrote:
> On 14.02.2024 17:11, Federico Serafini wrote:
>> I did some tries with example programs
>> and the assembler error always points to file and line
>> of the most enclosing function that caused the failure.
>> If I am not missing something, using __FILE__ and __LINE__ does not add
>> any information.
>>
>> Therefore, if the new macro is used within the body of other macros,
>> then the resulting assembler error will point to the source of
>> the problem (e.g., the site of a bogus call to put_guest()).
>>
>> In my opinion, converting put_guest() &Co. to inline functions is not
>> convenient: the assembler error will point to the most enclosing
>> function that would be put_unsafe_size(), instead of pointing to the
>> source of the problem.
> 
> The assembler error will point to where the inline function was expanded,
> sure. __FILE__ / __LINE__ ought to point to that inline function (where
> the macro was used) then, though?

This is what I get:

federico@Dell:~$ cat m.c
#define STRINGIFY(arg) #arg
#define STATIC_ASSERT_UNREACHABLE(file, line) \
   asm(".error \"static assertion failed: " file ": " STRINGIFY(line) "\"")

static inline __attribute__((always_inline)) void g(int x) {
   switch(x) {
     case 0:
       STATIC_ASSERT_UNREACHABLE(__FILE__, __LINE__);
   }
}

static inline __attribute__((always_inline)) void f(int x) {
   g(x);
}

int main(void) {
   f(0);
   return 0;
}
federico@Dell:~$ gcc -O3 m.c
m.c: Assembler messages:
m.c:8: Error: static assertion failed: m.c: 8


Note that the linker behaves differently:

federico@Dell:~$ cat m.c
extern void __put_user_bad(void);

static inline __attribute__((always_inline)) void g(int x) {
   switch(x) {
     case 0:
       __put_user_bad();
   }
}

static inline __attribute__((always_inline)) void f(int x) {
   g(x);
}

int main(void) {
   f(0);
   return 0;
}
federico@Dell:~$ gcc -O3 m.c
/usr/bin/ld: /tmp/ccv9KHJD.o: in function `main':
m.c:(.text.startup+0x9): undefined reference to `__put_user_bad'
collect2: error: ld returned 1 exit status

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

