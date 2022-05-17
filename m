Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71452AB0D
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 20:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331426.554940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr29B-0002ij-9J; Tue, 17 May 2022 18:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331426.554940; Tue, 17 May 2022 18:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr29B-0002fp-6O; Tue, 17 May 2022 18:42:17 +0000
Received: by outflank-mailman (input) for mailman id 331426;
 Tue, 17 May 2022 18:42:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJ1N=VZ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1nr299-0002fU-Pc
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 18:42:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 115fda80-d611-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 20:42:13 +0200 (CEST)
Received: from [192.168.1.39] (unknown [81.93.39.129])
 by support.bugseng.com (Postfix) with ESMTPSA id D41284EE077A;
 Tue, 17 May 2022 20:42:12 +0200 (CEST)
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
X-Inumbo-ID: 115fda80-d611-11ec-bd2c-47488cf2e6aa
Message-ID: <e6e6c211-3915-af72-d077-0bf77b6a6a9e@bugseng.com>
Date: Tue, 17 May 2022 20:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH 1/3] x86/p2m.h: Add include guards
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-2-andrew.cooper3@citrix.com>
 <000745e7-0b0e-386e-861e-901319defde3@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <000745e7-0b0e-386e-861e-901319defde3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/05/22 17:38, Jan Beulich wrote:
> On 09.05.2022 14:24, Andrew Cooper wrote:
>> Spotted by Eclair MISRA scanner.
> 
> I'm sorry, but what exactly was it that the scanner spotted? It was
> actually deliberate to introduce this file without guards. I'm of
> the general opinion that (private) headers not to be included by
> other headers (but only by .c files) are not in need of guards. If
> it is project-wide consensus that _all_ header files should have
> guards, then I'll try to keep this in mind (in "x86emul: a few
> small steps towards disintegration" for example I introduce
> another such instance), but then it should also be put down in
> ./CODING_STYLE.

The rationale of this rule is as follows:

- With a complex hierarchy of nested header files, it is possible
   for a header file to be included more than once.

- This can bring to circular references of header files, which
   can result in undefined behavior and/or be difficult to debug.

- If multiple inclusion leads to multiple or conflicting definitions,
   then this can result in undefined or erroneous behavior.

- Compilation and analysis time is needlessly increased.

There has been a period (which lasted until the end of the '70s
or the beginning of the '80s, I would have to dig up to be
more precise) when the solution was thought to be "headers
shall not to be included by other headers but only by .c files."
Experience then showed that, in medium to large projects,
each .c file had to begin with a long list of #include
directives;  such lists needed to be ordered to accommodate
the dependencies between header files;  in some cases the
lists were so long that:

a) it was a kind of black magic to find out the right
    inclusion order, one that would work in any of
    possibly many project configurations;
b) the lists of #include directives often contained duplicates,
    possibly because the desperate programmers where trying
    to find the right order.

In the end, the software engineering community converged
on the idea that guards against multiple inclusion are
a much better alternative.

Of course there are valid reasons to deviate the rule:
some header files might be conceived to be included
multiple times.  A one-line configuration for ECLAIR
will do the trick to make sure such header files are
not reported.

Kind regards,

    Roberto

>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   xen/arch/x86/mm/p2m.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
>> index cc0f6766e4df..dc706b8e4799 100644
>> --- a/xen/arch/x86/mm/p2m.h
>> +++ b/xen/arch/x86/mm/p2m.h
>> @@ -15,6 +15,9 @@
>>    * along with this program; If not, see <http://www.gnu.org/licenses/>.
>>    */
>>   
>> +#ifndef __ARCH_MM_P2M_H__
>> +#define __ARCH_MM_P2M_H__
>> +
>>   struct p2m_domain *p2m_init_one(struct domain *d);
>>   void p2m_free_one(struct p2m_domain *p2m);
>>   
>> @@ -39,6 +42,8 @@ int ept_p2m_init(struct p2m_domain *p2m);
>>   void ept_p2m_uninit(struct p2m_domain *p2m);
>>   void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
>>   
>> +#endif /* __ARCH_MM_P2M_H__ */
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
> 
> 

