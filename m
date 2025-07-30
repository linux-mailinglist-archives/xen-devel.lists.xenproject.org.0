Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD4B162DE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064075.1429812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7qh-0007R8-Lh; Wed, 30 Jul 2025 14:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064075.1429812; Wed, 30 Jul 2025 14:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7qh-0007Ov-Im; Wed, 30 Jul 2025 14:32:07 +0000
Received: by outflank-mailman (input) for mailman id 1064075;
 Wed, 30 Jul 2025 14:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2yBn=2L=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uh7qg-0007Op-5N
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:32:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e849d8-6d51-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 16:32:05 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9275C4EE3C22;
 Wed, 30 Jul 2025 16:32:03 +0200 (CEST)
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
X-Inumbo-ID: f6e849d8-6d51-11f0-a320-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753885923;
	b=zdv5kuXoVZqPDM9C2AGS0WHbg4i8TYKWeJPVxN6BUGSE4EOzR82ljgWn3D5CPwAtKlpd
	 FcEN63G0T7oC1sEZRFHJ1HvI52Y9M0mYdj/WzsuTPEv/Dixl8dLgalQZgd+5K0wh4brMp
	 Bnfeo28Tv6xfJ6lwvrhgnJA4epcMrlB4O9JGOk49oP/94j+l+/oqRIc+ljbzg1MeCKC7w
	 KA6N5C0r/2V+oM5BBemkqpoYhl71G4xCTLHVLFFBJhQSvEg08TDkxj5iHMeotuMFuCsZG
	 kUnkkxT/am3vXeK0jJeZRsdZFEaEVn2Dee0nrzcmJ/8twgh2YFLeMYf7fMIGJCMPqxHy4
	 AdPqCw7/D0af3yiATek4ud+Su6tXq71T4vMv2yLH0n5d+FWcnlowJDkguP+/bXOlm/GVR
	 kovmL5V9qX1lEEG26rwMnlJqXqGKwOGfqCmrcIzxmxCs9B0BslUI7BnHOy20w4RAExy6U
	 IXejV8yd4r/UxX7YCaYt/5vLt4i07KueP6JB0fBllsghSetIcJn2rgVAUmMlx4hrCRwe5
	 mG560603LkkCqtZdPql26ls29ZN5kUXTO9Ils7f4b+p/4Z4gzrEpNI3V6v1t1NhnJI1Xc
	 Ksts+X45x9H/iR2aqhFlEYJDrPEZd2rL6G+FBv6N8L7UA9e7sB5p9bluuJPYoME=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753885923;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=JGK+l6xNtCHiM7X+6nM8oDz/jcHuDDBSul6H9Pk32t0=;
	b=Ev71c6r+OT9B81zftsQkGBh6uqVU9muVNyzvZmeOKSY3KO78RVXhZlfSAYdBW8FmcsCz
	 phwyTr2IiD6wSdXZbcLeCDrLFT0XnSg3dn0kHIsQ7Xz/X84rV5qhOKDwZ+914Svq0offO
	 IM0eh5R0nCoZdg+XFq/wtNE7L/lCucC4VLDFIYArQHHTK31O930ERC0/xLH51l4ePB4zo
	 jyMrtvbrmwFB2vzVnfElphT28rSv8IdwV36PEQlCmuTpaK2aon44G5Lvml0iqtz0EiUG7
	 Hp4ZejuP8ZoHohDxTFWLtB9WIFWelp40LPd2FkERqJbXxXzjH5cenXttudiXq4aApM6hS
	 JLr0u0umSdssD/GM0NzQtNktvOJYCAfCca/mYZwmWpB27z6haNAJYAoQESoCQKjrBmDus
	 KvlX+Gpx9akeiWwLGx2VBBvqyUvnt3AC/XI5X4joMaLCKT7L8Z0tBz16in7/upahOb7G7
	 Ig7fejJzkR3XPpi2BRz+sV/aeDALYMULRmA4NxiqF+fUgTwcEhKGA8UQEq982644TKUBV
	 dA2GKksvA3bJe2dFUDdxCjlFHyBhRcufT5rLlo3HWP1KOtowq7fR5aAYU/Yc/efqnkMSX
	 nrsn3s6UwSoho8tOG8529aaP9Bj7x2fyYJgBb5pBskuBbJFddfT39c45CgN9AZ0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753885923; bh=BOArpbZLK1Kzk/y9qJ7+NNLc2KuDDS8tA1s2N/ZiNUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e3U6JGeN9pfpc6MT4XeGco/CgXMXozCC6GhIAIFUndyeqy/11RolfpW02XnWy/Tdj
	 +4vg5xk3o+/K1/kofAhlRjU1zCKx/0ixq2oFHqOK5kVjaUCDBHPMZY2gQtgc29vWe7
	 /wKoQSgJ1Pv0/Pwf+ym3zXt+MlTutVNBjWx52mgbTogS+zStE2Ob105WurQPYMLTX1
	 wX5z2hWOA/zt5a7XNJffQHkh8OYBQ6Hn1bpvBR5JUyu2TLrIkUvfz5uydNDmTqPZ+k
	 w7lNbhfhUZpf8LnxdNbkGwMpR+qC1firq0KRDHUq0Ms2fzcccRHpUfHDZMhWFxaxLr
	 ZKHny+c7oUiIg==
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 16:32:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] automation/eclair: deviate intentionally unreachable code
In-Reply-To: <16cbf1bc-1dee-4505-bb5a-e09ea76bc8ba@citrix.com>
References: <e699179c079df36f6cb4fdc7865a73cb9fe79f8c.1753881652.git.dmytro_prokopchuk1@epam.com>
 <16cbf1bc-1dee-4505-bb5a-e09ea76bc8ba@citrix.com>
Message-ID: <4c99957f65f8190a17b115724d7ca3b3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-30 16:15, Andrew Cooper wrote:
> On 30/07/2025 3:06 pm, Dmytro Prokopchuk1 wrote:
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index e78179fcb8..fba75be2ee 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -86,6 +86,14 @@ Deviations related to MISRA C:2012 Rules:
>>         generate definitions for asm modules.
>>       - Tagged as `deliberate` for ECLAIR.
>> 
>> +   * - R2.1
>> +     - Calls to the `__builtin_unreachable` function inside the 
>> expansion of
>> +       the `ASSERT_UNREACHABLE()` macro may cause a function to be 
>> marked as
>> +       non-returning. Since this only happens in debug 
>> configurations,
>> +       the `noreturn` property for `__builtin_unreachable` is 
>> overridden in
>> +       these contexts, resulting in the absence of reports that do 
>> not have
>> +       an impact on safety, despite being true positives.
>> +
> 
> I'm not sure how best to phrase this, but it's probably worth saying
> that Xen expects developers to write code which would fail safe in a
> release build when the assertion was removed.
> 
> I.e. it's more than just "there may be code there".  It's expected that
> there is.
> 

Yes, I had some trouble finding the proper wording here, so feel free to 
improve it. It's just to highlight that the code would be truly 
unreachable in debug builds, so an assessor expecting violations there 
won't find them because of this configuration.

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

