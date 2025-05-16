Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D82AB9CA8
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 14:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987118.1372572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuYl-0001NI-OI; Fri, 16 May 2025 12:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987118.1372572; Fri, 16 May 2025 12:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuYl-0001LI-Kn; Fri, 16 May 2025 12:53:07 +0000
Received: by outflank-mailman (input) for mailman id 987118;
 Fri, 16 May 2025 12:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bBRW=YA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uFuYj-0001DF-Un
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 12:53:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4a7befa-3254-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 14:53:04 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5450D4EE0739;
 Fri, 16 May 2025 14:53:03 +0200 (CEST)
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
X-Inumbo-ID: b4a7befa-3254-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747399983;
	b=pVVj/R/SsydW29TmR+Ty4FdZd3Dr8D5J87Z3I2dCZdwlnK2B+LkfktWrAEnkohyorVyP
	 Xtsy0YevNxj1pWU2NEHgvnhx4ff1z2bE9tSXgBD5wtelf1zt50S9DrqhkbPPEzpqv+TAl
	 7jdCha9qQnxXhiU6K4egKPdqvdTgKIPDmCMiJRjg7cyPA7nV6dNwoe9C4zE1VdkiEDmgP
	 k4Pa6W1tOsC2X9jeEZGlDvcDYw61/dnC/LuH0l6XnGezOr+kgPu5+bjtUbCBXn1PAi4qj
	 12PuJSAWpnG8vjeREtsvOtewA9h5+SzYJj8pvBmYfRLTWp02m95PQHWoaTafVin80rTch
	 YB71xe8mO8r8qK130V7mX2wRcfHeTU0FYM1dWQ4UQGP1zenQqi2eakIm6y3nmlACQfNQJ
	 eoASky968pxvrgb+4mUe/MMKbEg20r9w/vTAIzOV9neeqgECRTzsiZga7X2gXB9fPOFNp
	 Hb9tSW/gmfCBQmAz9eSGqtjfUcR60duv99U76h7NdJjJ/QgFTdcGEItQsU+3ITpKfyYo0
	 ke6Phq7AK24csuspal1eQbaJ2V0+ZM6wR6eZHkyFwSIL9Uo9RJxYsUutacxkRXE1WzQGv
	 0Ev1sB9qmbP98d/NcnEt1a4tZ/0rh857g679IoCRk55AbXOC/QQugXRWwRd1HvI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747399983;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=FleCSofpFpSueE1Xkc0dKlgxuyo7SvDJ1/JJXedVDA8=;
	b=po0sPP6rI6PXScujQoqUHYfZenOpu3oR+1DKg0gYGERljSC797dEI9QfOxrtAOGjZC48
	 oJtF+BhT2HSozxOWB/02303UqH3C3qRJWSrxOA8d0Qnzxa0ezm9BuaGJArGU8XuxYZEw/
	 UtrpukM9c6sAAsUGX3UJO3Ch3O2McBi5/1o6V3QE9ByXIN2qMlfa95GHuDsQxUsu2dpjd
	 B7sX1o5DQ+P9bvvfFUCBMOsjFybP3y6M5vf+s/AkP3JVQA8WgwaWqOFJ+rO5OQre2rQi2
	 j1IkMu686Yg1baP4keBDxVKtwuVNR6uzDJRR/bsD0iiaEbgvoDgoZ/MHu8vrMwtD6xhv3
	 VyylkV5oxv1/I8IHWAiPPe3PtIHqPDNAtKw2fltrW6XDo3qeH3R6hltrDdCt9Hvqq2A05
	 vefVx16T8aajPDyxXhAgXaTChwpY/WVeZFfoQX5U780p7U19KToNhuKV68xJqq9ffaXn3
	 2HAfqY8ZtTUpKknABkZemo2u7bb0pnPxNxcmcjgREijV329xIAxgqHjX3EVDkRbJG8BeC
	 GDXUPn6QX3rJV28qI+/1Eik+Wk1q1eYlcPGwbygrLGdrS0R0SlBEzrRuGbD58ZtOpEvXC
	 b9dX5kEN2tmKs8LkOehtMEb+rqv2SvwoLb8qzg3D//V0dPEPvJr9DOzSoiiHZSc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747399983; bh=BdrcMtXgTeckk01WS9gOq+O998+fCeZVeoz+dPfdJv4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a2h/d1NqwOD5l3x0W1PGTE3IpQEb5HZrkbZUi+pMzFQgJy7HQIZ2qpO7I1jzSwAAm
	 SRDY54YoWbK1MTvUzhXTAzNrIGa2VDY3+V4z2gPf1AP8WIFyoSMozf8CZbuj1ehU2a
	 sm+VNNjRZnKuBZQlIO8Ipw3pPKGPjgF30YRgw56ynGEXzEmCX/UuXyKmMgIGvCohsW
	 Sp+pMwKVkzFQhe0TgHaFIQ15EinD3uohOVosF8tiTgyMfqDCTpv9Gr6arImGBpHYU0
	 FvQf/PmmcmOytPAtUZ9vxsv+B7gcc2qbwY8ti3dxvAsDZKyNY/FSBkvcXx0wOP9FZ9
	 LPC2NcWDrZnCQ==
MIME-Version: 1.0
Date: Fri, 16 May 2025 14:53:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org, jbeulich@suse.com,
 roger.pau@citrix.com, consulting@bugseng.com, dmukhin@ford.com, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PING MISRA] Re: [PATCH v5 2/2] x86/vmx: remove __vmread()
In-Reply-To: <85f778d1-7fb5-47da-9153-35333e486d24@citrix.com>
References: <20250513052809.3947164-1-dmukhin@ford.com>
 <20250513052809.3947164-3-dmukhin@ford.com>
 <85f778d1-7fb5-47da-9153-35333e486d24@citrix.com>
Message-ID: <da9e619607bcf85198505bde196fbc86@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-16 14:45, Andrew Cooper wrote:
> Hello,
> 
> This is adjusting some MISRA configuration.  I'm reasonably sure the
> change is fine as we're simply removing the referenced helper, but can
> we get a second opinion from anyone who knows what
> function-macro-properties.json is supposed to be doing?
> 
> Thanks,
> 
> ~Andrew
> 

Hi Andrew,

sorry, it slipped under other emails. The change is ok.

> On 13/05/2025 6:28 am, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>> 
>> Remove __vmread() and adjust ECLAIR configuration to account for the 
>> change.
>> 
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

>> ---
>>  docs/misra/function-macro-properties.json | 9 ---------
>>  xen/arch/x86/include/asm/hvm/vmx/vmx.h    | 5 -----
>>  2 files changed, 14 deletions(-)
>> 
>> diff --git a/docs/misra/function-macro-properties.json 
>> b/docs/misra/function-macro-properties.json
>> index 74058297b5..59ba63626e 100644
>> --- a/docs/misra/function-macro-properties.json
>> +++ b/docs/misra/function-macro-properties.json
>> @@ -152,15 +152,6 @@
>>              "taken": ""
>>           }
>>        },
>> -      {
>> -         "type": "function",
>> -         "value": "^__vmread.*$",
>> -         "properties":{
>> -            "pointee_write": "2=always",
>> -            "pointee_read": "2=never",
>> -            "taken": ""
>> -         }
>> -      },
>>        {
>>           "type": "function",
>>           "value": "^hvm_pci_decode_addr.*$",
>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h 
>> b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> index d85b52b9d5..299e2eff6b 100644
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -336,11 +336,6 @@ static always_inline unsigned long 
>> vmread(unsigned long field)
>>      return value;
>>  }
>> 
>> -static always_inline void __vmread(unsigned long field, unsigned long 
>> *value)
>> -{
>> -    *value = vmread(field);
>> -}
>> -
>>  static always_inline void __vmwrite(unsigned long field, unsigned 
>> long value)
>>  {
>>      asm goto ( "vmwrite %[value], %[field]\n\t"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

