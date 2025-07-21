Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCDCB0C146
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 12:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051355.1419684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnr2-0001bU-Ol; Mon, 21 Jul 2025 10:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051355.1419684; Mon, 21 Jul 2025 10:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnr2-0001Yy-LW; Mon, 21 Jul 2025 10:34:44 +0000
Received: by outflank-mailman (input) for mailman id 1051355;
 Mon, 21 Jul 2025 10:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gt3j=2C=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1udnr0-0001Ys-3n
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 10:34:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3126e2-661e-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 12:34:39 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C7CA24EE3CC1;
 Mon, 21 Jul 2025 12:34:38 +0200 (CEST)
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
X-Inumbo-ID: 4e3126e2-661e-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753094078;
	b=oo6ZVt02YpmtI8+sO7p+sqfV9KLLe3zwQXiye+KWKqKA6fDbfaaQjR1XnRco9TsdsPUG
	 h2GLlD0x8ifi3CYh+GNJQkAzwuOFcsbBLcV5BAY7MGvXsA2fP5CriuDwk+9ybsVxGaAnG
	 D88D8THdjpa8finwJLxpahBO0PwlAv4j/U/yBvQ07Ja4IZR5FFHjo2ozDApRkSlH+U2tV
	 FFhU4TWAg9/QD+lZ5ggyp1IhbQz+n5yRj1s5kxoK99ktlcx4BJzg2xskHHREWHtz61OYo
	 G5WJcu0RDN0Tf2EdTftBsfxNmLIsz/OrayLySf2sZ/kmFfMhMXLuMbkmSIUion80pBqWe
	 krVS8RgBI3Krm0pVExoJFFoPmArhCMY2FNGdMg0Kk1Pa0XPH98xJS7EcMVL/hNBtqp5G7
	 qvsikgVP+W1Fx3kMBAhOSeWoI0qvY+RXfzvi4lNUE5BOZ+OlKCcDplxZVbNdrIbEeVSuY
	 F5b4QOUvjS9/XQlzwOJEFV5n3FYIHr1P+q8TwVS474go7gtdAr+2TnDEI9/mNemoq86C5
	 Gua8BNzrAZUusOD07c2LNdr0Kq5bdkXFFQZ89UfqFNx+m1zjknx6RqKAuGUZB01SUJjHU
	 9p4MEpDNMd9f1TiI/ySKgFHKl/DtRYUuuJ9UchgUL5qtMV2m5GDqYy9ioaj1mik=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753094078;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=pw/tbOr+sjAsUvhZj483ZtT7QJWuzil+QSFVFLGvKh4=;
	b=K1/w7tk3qatSJvePH+vzcPbIsImP2Kkur2KirRHkKlBwg1/G2e/JfWcClpeP6683NZ40
	 0dtxf9dpTCKTTkjpAeqcC8NEz/d4Fb+mJBmV5oAr73C6TYrTpJnvK8Ggtcf6LRcnNQbGd
	 dq3az+8tzkF5LZBmLbbTHN0xjCn6X463Bjw1SuJ7FqSSuFlxOHn8LS2dbwZRhJ+yggN5r
	 D7eQZXlzxMxSHMoVIfaxvxbTdKToa3tUIlxSX5N1sRTmO7QkN8mr155Cq06U1rBOpGYUz
	 F8WNQTUFcAINvZNmDZ37OZj3Sw0caeQiPHUMwd3p0rB4DnkTYMOhUtAcVYpcjfiL/Ecw2
	 8XwAOr4ozWhwws8RQ7ozmA4PUnKpl3e7EgPgo/wV6/VhuzQLJAkVQfxLM1ctXNWv2lMRJ
	 4Smo/ukBWkWzXiFp949b0GO5sLSfKo2mXPWnv6t//5MMge89u4MGMmRRxMAejTDrK2DqJ
	 J4+v+ZZAvgQSTNIGIAzLBWJhLdjrIBxuCjvlB6MN/tYUXzuSfUI9cGflQklnNjg90vTN2
	 QIeDI8hmZwtkOk6ToMli9C2pJXnGVI3L9M733R7YVRcO1Gs/74LUfvhIhMpKXgMaC9i4/
	 ruAGRDzhyx9s0Z75sN29G83mNPejohYPlWTdh5VgAauy6992ws9KJ3irJNloIqk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753094078; bh=BaY4hLdx+sH0hwfgbFJgazw9L0TxqTO7on6PNYLYfFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pNUOVd31ssLi/zEKFiIDz3Ll7bZXLg43XZ7rdZzreXaj4igoagPcoL4TSDDNG6ww+
	 WWLKxVFNH3nsKUO2+xgPPh3mhu25Yttxz9Xs8YtJODRVcHAHzsj4qc82lnD4GMrO/8
	 ScTOTXqPM/r+hpaiZHSzkTGThGqvi8//SSAKmMGnumXzF6gxdqPxiKRM8H0Xw9+qbW
	 KcTtgQstdGc3vSV4sYoVjqSPxGn4g9PYM08lc/ai1wwavv+/Add6ChXOrEeNTjTML9
	 VZnX8C1IV/CXTBILN/uqxpU1ePT5zFVDqgGmbHFm19M/LC+5DTxW1RXqJYYhOGeyeF
	 n3ZTkCUm9p9qg==
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 12:34:38 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Rework TRY_LOAD_SEG() to use asm goto()
In-Reply-To: <ce45f10e-f8cc-4f34-a148-8cc69df16f8e@suse.com>
References: <20250718202548.2834921-1-andrew.cooper3@citrix.com>
 <dd20bc85-e5b3-480a-aaeb-4248a427f6ff@suse.com>
 <714047917162481454c4cce050386125@bugseng.com>
 <ce45f10e-f8cc-4f34-a148-8cc69df16f8e@suse.com>
Message-ID: <c79ecb552360253a46b7993d5909a92f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-21 11:25, Jan Beulich wrote:
> On 21.07.2025 10:16, Nicola Vetrini wrote:
>> On 2025-07-21 08:41, Jan Beulich wrote:
>>> On 18.07.2025 22:25, Andrew Cooper wrote:
>>>> This moves the exception path to being out-of-line within the
>>>> function, rather
>>>> than in the .fixup section, which improves backtraces.
>>>> 
>>>> Because the macro is used multiple times, the fault label needs
>>>> declaring as
>>>> local.
>>>> 
>>>> No functional change.
>>>> 
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> 
>>>> Slightly RFC.  I haven't checked if Eclair will be happy with
>>>> __label__ yet.
>>> 
>>> Even if it is, I guess you'd need to update the list of extensions we
>>> use (docs/misra/C-language-toolchain.rst)?
>> 
>> Only for using the __label__ token in
>> automation/eclair_analysis/ECLAIR/toolchain.ecl. The extension itself 
>> is
>> already documented in 5590c7e6590d ("eclair: allow and document use of
>> GCC extension for label addresses")
> 
> Except that it's not the address taking that is the point in question 
> here.
> We have meanwhile gained a number of asm-goto (and for the uses there 
> I'm
> not even sure they count as "address taking"). It's really the 
> __label__
> extended keyword (and the thus possible declaration of a 
> scope-restricted
> label) that my remark was about. But yes, toolchain.ecl looks to need a
> change, too.
> 

You're right, it needs also section 6.2 "Locally Declared Labels". Both 
easy to add if needed.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

