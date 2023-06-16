Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092D732A25
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 10:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550051.858927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA569-0000Ln-V8; Fri, 16 Jun 2023 08:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550051.858927; Fri, 16 Jun 2023 08:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA569-0000JS-Rb; Fri, 16 Jun 2023 08:46:25 +0000
Received: by outflank-mailman (input) for mailman id 550051;
 Fri, 16 Jun 2023 08:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ADAE=CE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qA568-0000JK-Dp
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 08:46:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453cb930-0c22-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 10:46:22 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.57.159.155])
 by support.bugseng.com (Postfix) with ESMTPSA id BE8C44EE074E;
 Fri, 16 Jun 2023 10:46:20 +0200 (CEST)
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
X-Inumbo-ID: 453cb930-0c22-11ee-b232-6b7b168915f2
Message-ID: <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
Date: Fri, 16 Jun 2023 10:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
 <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
Content-Language: en-US
In-Reply-To: <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/23 09:19, Jan Beulich wrote:
> On 15.06.2023 18:39, nicola wrote:
>> while investigating possible patches regarding Mandatory Rule 9.1, I
>> found the following pattern, that is likely to results in a lot possible
>> positives from many (all) static analysis tools for this rule.
>>
>> This is the current status (taken from `xen/common/device_tree.c:135')
>>
>>
>> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>>                                              const char *name, u32 *lenp)
>> {
>>       const struct dt_property *pp;
>>
>>       if ( !np )
>>           return NULL;
>>
>>       for ( pp = np->properties; pp; pp = pp->next )
>>       {
>>           if ( dt_prop_cmp(pp->name, name) == 0 )
>>           {
>>               if ( lenp )
>>                   *lenp = pp->length;
>>               break;
>>           }
>>       }
>>
>>       return pp;
>> }
>>
>>
>>
>>
>> It's very hard to detect that the pointee is always written whenever a
>> non-NULL pointer for `lenp' is supplied, and it can safely be read in
>> the callee, so a sound analysis will err on the cautious side.
> 
> I'm having trouble seeing why this is hard to recognize: The loop can
> only be exited two ways: pp == NULL or with *lenp written.
> 
> For rule 9.1 I'd rather expect the scanning tool (and often the compiler)
> to get into trouble with the NULL return value case, and *lenp not being
> written yet apparently consumed in the caller. Then, however, ...


You're right, I made a mistake, thank you for finding it.
I meant to write on `*lenp' in all execution paths.
Please, take a look at this revised version:


const struct dt_property *dt_find_property(const struct dt_device_node *np,
                                            const char *name, u32 *lenp)
{
     u32 len = 0;
     const struct dt_property *pp = NULL;

     if ( np )
     {
         for ( pp = np->properties; pp; pp = pp->next )
         {
             if ( dt_prop_cmp(pp->name, name) == 0 )
             {
                 len = pp->length;
                 break;
             }
         }
     }

     if ( lenp )
         *lenp = len;
     return pp;
}


>> My proposal, in a future patch, is to refactor these kinds of functions 
>> as follows:
>>
>>
>> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>>                                             const char *name, u32 *lenp)
>> {
>>      u32 len = 0;
>>      const struct dt_property *pp;
>>
>>      if ( !np )
>>          return NULL;
> 
> ... this path would be a problem as well.
> 
>>      for ( pp = np->properties; pp; pp = pp->next )
>>      {
>>          if ( dt_prop_cmp(pp->name, name) == 0 )
>>          {
>>              len = pp->length;
>>              break;
>>          }
>>      }
>>
>>      if ( lenp )
>>          *lenp = len;
>>      return pp;
>> }
>>
>>
>> The advantage here is that we can easily argue that `*lenp' is always
>> initialized by the function (if not NULL) and inform the tool about
>> this, which is a safer API and also resolves almost all subsequent
>> "don't know"s about further uses of the variables involved (e.g. `lenp')
> The disadvantage is that in a more complex case and with the function
> e.g. being static, the initializer of "len" may prevent compiler /
> tools from spotting cases where the variable would (otherwise) truly
> (and wrongly) remain uninitialized (and that fact propagating up the
> call chain, through - in this example - whatever variable's address
> the caller passed for "lenp"). IOW - I don't think a common pattern
> can be agreed upon up front for cases like this one.


That's ok, but perhaps we can agree that in a subset of functions as 
simple as this one the refactoring can help both developers and tools.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

