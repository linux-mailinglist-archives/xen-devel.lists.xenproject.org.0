Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93A8A2D65
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704555.1101001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvF51-0004Xh-79; Fri, 12 Apr 2024 11:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704555.1101001; Fri, 12 Apr 2024 11:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvF51-0004Vl-3U; Fri, 12 Apr 2024 11:28:27 +0000
Received: by outflank-mailman (input) for mailman id 704555;
 Fri, 12 Apr 2024 11:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvF4z-0004Vf-NP
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 11:28:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c52358f8-f8bf-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 13:28:23 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 171292129608387.97570731085034;
 Fri, 12 Apr 2024 04:28:16 -0700 (PDT)
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
X-Inumbo-ID: c52358f8-f8bf-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1712921298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j9KMQQEL5zBpyLKq3dVeux2efgjxsqMpl8IZFmiKwQESTyt4ihClC36WkxUA5TGz7vJLANEiRaf3Ji/qJLbhUr4msFzESZXCeJIV0yMSOtVEJ0Hlu2/oq/dW4C0/Tr9cjh6t4GGYoww1v6FoskzHaUx4XjXPtW3Vi8RFJv8/evQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712921298; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0HrvEeuJMQuVs/6Ps1OHzTyXZXfMG7qX6nWkzjTNvbw=; 
	b=CFxN6mqXROKtPDrf0gBSYGSXhsXs4dtmyuqX1pUngt0apkwTa/wz46G5Rfe5PrjPUU3qjsc0h5AV8LF6yZmW+8YT08vEX2uq8hOeymGGtCzopC9CRpbNr4pEsoJ1ccwEM2mcqJb09g+w6NJcsSqVdDTwO30J0Fjlu2O9U/7DDWw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712921298;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0HrvEeuJMQuVs/6Ps1OHzTyXZXfMG7qX6nWkzjTNvbw=;
	b=cwoInlgT3tWi9V7HyXSxMC98mXWXRqrV0zxA0e6Pt0HqM5MjOg+0kBzwJvBAa0hw
	Zj1SPhigGdVesJNbPCUSQ9HQYGKI8OBJFdXSz0mCUOixnF0Q33xHSTEcXChXvWwoBiL
	HQNdMkmKNpfbCNL3BzdV+1y3U7ZYafRZoANG6T/g=
Message-ID: <ef1e2edd-b9fe-4155-ad61-46e0e53b7198@apertussolutions.com>
Date: Fri, 12 Apr 2024 07:28:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] gzip: clean up comments and fix code alignment
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-3-dpsmith@apertussolutions.com>
 <382b8aaf-ea9f-42c7-b57b-945fa4fd36aa@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 xsJuBFYrueARCACPWL3r2bCSI6TrkIE/aRzj4ksFYPzLkJbWLZGBRlv7HQLvs6i/K4y/b4fs
 JDq5eL4e9BdfdnZm/b+K+Gweyc0Px2poDWwKVTFFRgxKWq9R7McwNnvuZ4nyXJBVn7PTEn/Z
 G7D08iZg94ZsnUdeXfgYdJrqmdiWA6iX9u84ARHUtb0K4r5WpLUMcQ8PVmnv1vVrs/3Wy/Rb
 foxebZNWxgUiSx+d02e3Ad0aEIur1SYXXv71mqKwyi/40CBSHq2jk9eF6zmEhaoFi5+MMMgX
 X0i+fcBkvmT0N88W4yCtHhHQds+RDbTPLGm8NBVJb7R5zbJmuQX7ADBVuNYIU8hx3dF3AQCm
 601w0oZJ0jGOV1vXQgHqZYJGHg5wuImhzhZJCRESIwf+PJxik7TJOgBicko1hUVOxJBZxoe0
 x+/SO6tn+s8wKlR1Yxy8gYN9ZRqV2I83JsWZbBXMG1kLzV0SAfk/wq0PAppA1VzrQ3JqXg7T
 MZ3tFgxvxkYqUP11tO2vrgys+InkZAfjBVMjqXWHokyQPpihUaW0a8mr40w9Qui6DoJj7+Gg
 DtDWDZ7Zcn2hoyrypuht88rUuh1JuGYD434Q6qwQjUDlY+4lgrUxKdMD8R7JJWt38MNlTWvy
 rMVscvZUNc7gxcmnFUn41NPSKqzp4DDRbmf37Iz/fL7i01y7IGFTXaYaF3nEACyIUTr/xxi+
 MD1FVtEtJncZNkRn7WBcVFGKMAf+NEeaeQdGYQ6mGgk++i/vJZxkrC/a9ZXme7BhWRP485U5
 sXpFoGjdpMn4VlC7TFk2qsnJi3yF0pXCKVRy1ukEls8o+4PF2JiKrtkCrWCimB6jxGPIG3lk
 3SuKVS/din3RHz+7Sr1lXWFcGYDENmPd/jTwr1A1FiHrSj+u21hnJEHi8eTa9029F1KRfocp
 ig+k0zUEKmFPDabpanI323O5Tahsy7hwf2WOQwTDLvQ+eqQu40wbb6NocmCNFjtRhNZWGKJS
 b5GrGDGu/No5U6w73adighEuNcCSNBsLyUe48CE0uTO7eAL6Vd+2k28ezi6XY4Y0mgASJslb
 NwW54LzSSM0uRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
 PsJ6BBMRCAAiBQJWK7ngAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBTc6WbYpR8
 KrQ9AP94+xjtFfJ8gj5c7PVx06Zv9rcmFUqQspZ5wSEkvxOuQQEAg6qEsPYegI7iByLVzNEg
 7B7fUG7pqWIfMqFwFghYhQzOwU0EViu54BAIAL6MXXNlrJ5tRUf+KMBtVz1LJQZRt/uxWrCb
 T06nZjnbp2UcceuYNbISOVHGXTzu38r55YzpkEA8eURQf+5hjtvlrOiHxvpD+Z6WcpV6rrMB
 kcAKWiZTQihW2HoGgVB3gwG9dCh+n0X5OzliAMiGK2a5iqnIZi3o0SeW6aME94bSkTkuj6/7
 OmH9KAzK8UnlhfkoMg3tXW8L6/5CGn2VyrjbB/rcrbIR4mCQ+yCUlocuOjFCJhBd10AG1IcX
 OXUa/ux+/OAV9S5mkr5Fh3kQxYCTcTRt8RY7+of9RGBk10txi94dXiU2SjPbassvagvu/hEi
 twNHms8rpkSJIeeq0/cAAwUH/jV3tXpaYubwcL2tkk5ggL9Do+/Yo2WPzXmbp8vDiJPCvSJW
 rz2NrYkd/RoX+42DGqjfu8Y04F9XehN1zZAFmCDUqBMa4tEJ7kOT1FKJTqzNVcgeKNBGcT7q
 27+wsqbAerM4A0X/F/ctjYcKwNtXck1Bmd/T8kiw2IgyeOC+cjyTOSwKJr2gCwZXGi5g+2V8
 NhJ8n72ISPnOh5KCMoAJXmCF+SYaJ6hIIFARmnuessCIGw4ylCRIU/TiXK94soilx5aCqb1z
 ke943EIUts9CmFAHt8cNPYOPRd20pPu4VFNBuT4fv9Ys0iv0XGCEP+sos7/pgJ3gV3pCOric
 p15jV4PCYQQYEQgACQUCViu54AIbDAAKCRBTc6WbYpR8Khu7AP9NJrBUn94C/3PeNbtQlEGZ
 NV46Mx5HF0P27lH3sFpNrwD/dVdZ5PCnHQYBZ287ZxVfVr4Zuxjo5yJbRjT93Hl0vMY=
In-Reply-To: <382b8aaf-ea9f-42c7-b57b-945fa4fd36aa@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/11/24 15:11, Andrew Cooper wrote:
> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>> This commit cleans up the comments and fixes the code alignment using Xen
>> coding style. This is done to make the code more legible before refactoring.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> I've found two more minor adjustments:
> 
> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index feb6d51008aa..9205189d4618 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -375,7 +375,7 @@ static int __init huft_build(
>       memzero(stk->c, sizeof(stk->c));
>       p = b;  i = n;
>       do {
> -        Tracecv(*p, (stderr, (n-i >= ' ' && n-i <= '~' ? "%c %d\n" :
> "0x%x %d\n"),
> +        Tracecv(*p, (stderr, (n-i >= ' ' && n-i <= '~' ? "%c %d\n" :
> "0x%x %d\n"),
>                        n-i, *p));
>           c[*p]++;                    /* assume all entries <= BMAX */
>           p++;                      /* Can't combine with above line
> (Solaris bug) */
> @@ -563,7 +563,8 @@ static int __init huft_build(
>       return ret;
>   }
>   
> -/* Free the malloc'ed tables built by huft_build(), which makes a linked
> +/*
> + * Free the malloc'ed tables built by huft_build(), which makes a linked
>    * list of the tables it made, with the links in a dummy first entry of
>    * each table.
>    *
> 
> 
> I can fold on commit.  (First hunk is trailing whitespace, which doesn't
> show up so well on email).


Hmm, I tried to catch all the trailing space. Since I already have to 
respin for the MISRA exclude list, I can double-check if there are any 
other trailing whitespaces I missed.

> However, there are some more major adjustments wanted too.

That's fine, I attempted at tugging on some of the ugliness and kept 
finding myself in a mess. If there are subtle improvements that can be 
made without doing the complete rewrite I think this really deserves, 
would be glad to incorporate them.

> The reason why the code indention is so messed up is because it has been
> auto-formatted, but with some NEXTBYTE()/NEEDBITS()/DUMPBITS() missing
> semi-colons.  This throws off subsequent formatting, including some of
> the indentation changes you've made.
> 
> Fixing the semicolons is a far more messy diff, but a much better end
> result.

I looked and didn't see any missing semicolons for NEXTBYTE, but you are 
correct, I think almost every invocation of NEEDBITS and DUMPBITS are 
missing semicolons.

> However, the PKZIP_BUG_WORKAROUND ifdefary hiding braces still throws
> things off, this time in the opposite direction.  NOMEMCPY also gets in
> the way.
> 
> I'd be tempted to suggest breaking out a patch earlier dropping these
> two, and then doing the semicolon fixes in this one along with the other
> work.

Upon checking, I did not see any way to set PKZIP_BUG_WORKAROUND and 
NOMEMCPY, so yes I think we can safely drop them.

> Thoughts?

I think it is all doable, the only question is would you prefer to see 
the PKZIP_BUG_WORKAROUND and NOMEMCPY drop happen before relocating the 
files or after relocation?

v/r,
dps


