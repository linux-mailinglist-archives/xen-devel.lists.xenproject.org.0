Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C85ABC05A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 16:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989891.1373863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH1FM-00073s-OL; Mon, 19 May 2025 14:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989891.1373863; Mon, 19 May 2025 14:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH1FM-00072N-Lj; Mon, 19 May 2025 14:13:40 +0000
Received: by outflank-mailman (input) for mailman id 989891;
 Mon, 19 May 2025 14:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+fG=YD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1uH1FK-00072H-UH
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 14:13:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 738951c9-34bb-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 16:13:35 +0200 (CEST)
Received: from [192.168.1.16] (host-87-1-204-51.retail.telecomitalia.it
 [87.1.204.51]) (Authenticated sender: federico)
 by support.bugseng.com (Postfix) with ESMTPSA id 3DC594EE7C49;
 Mon, 19 May 2025 16:13:34 +0200 (CEST)
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
X-Inumbo-ID: 738951c9-34bb-11f0-b892-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=87.1.204.51
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747664014;
	b=oQRwq/laYdRlV7m6fy1M+i8t0scIXiSc6TlkEbsBOS9s89iQdO9sfTMhFgIOdHEa2JnO
	 UXFRqVRAn4YfTWkKVXYeh/wLiEeZPqUmulgjoLULcRS9k40OdlFCTtqvblsG8cHRsJO+K
	 hfq8jsgryEx8fLYZ9iQQ/sO0k/2HIE83B4slJFkO9ajynV/RNgp2DUP7Ymv5mj+OwBUtT
	 g20MbYJuQEj+VHTh7H7cWK9P/HHxrcMO5+GUMSMPKhFHOlJ4bQ1MZ3D35b7Edj7NIklQG
	 6YK1M3CEP+sruZJQ6mFIFVnAXebpWcWzBHKpOn/soc1ZTXKPasJOKmZ+xx8tGvGTj5iJ5
	 t3e272f1z1pFCUvXsI4h6+NDKgc/m72MVm0N9waKtBdrdYAfq4WSbs6gCivYNi1PdFlpk
	 vn7W8VaW2ju3wUMkdCjDi5sVtZWX1p86PAinX/bPdSXymrTdvyCgi7/0WIIURb/ZM6i0u
	 rX4KdUHXUr93i0NoWdIsSKdYrB/EC8IyzFmh+WvEXWnTsUdUoqtWKmbe+cA4Li88rTNOx
	 EvHQhSu9DyGGMmKq0MuGabnQhFaN9ry10GrP6VjephZmE2o2GAva0775l/uYQSFIa9eKu
	 Nk9b5dAMhRigRXLK1aY7QV7xhs9utrEhz6mVIasUWIG78MZQ0idYvMJAKy5Snzk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747664014;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6GxuCxcKplKFny5zoZVzpfir6eib2sdPYIN9j+99JMg=;
	b=duxnpCOUjHoTmWFJ2czUvLOF1nUxFcm0Bwwg0GpWXYLsOKXOEa9rFNh9SZP0QBzr7UiL
	 qXWsjPr5L4B64IBD6tOft6oMoRuRSlSYAzHh7x/rf+7f3OkFMUdhiTVIRrOByQAkN7OxX
	 2cp6QUUjGlzFC+ppQqxGL01C2mdjAxvRe9cab1wfLGdYquOGiJJ3Q+ufG+OXTA/I0bKAW
	 b4SMW1Op6cwEvzNQN0DO+Do56PIZWIRXS8SbRxW19almQK8pgZvGnCvbZ4IjYE8xA3TEB
	 txYzwzdu1qlYow+wkJuf/3GjqciQ40GtDf+AvZhRnrmY2UCTA3LL7Rpi+/2mbbEVoXYnY
	 nZ+HEE48YPQMHhtCtYKC6YzSgmpW9yoyteTkckanporXkhiZbLeTCknDbh5HaN4TeeITJ
	 BECXaUeTyxuq5iNlK1zcFyfG7/YkFgdmWYrTkgLlZ9OPo/Dav2UlwkhKVBVhvo14YSbFI
	 GY9kt7adQQcMm6p2MCrBR4euD0mxZnS0HzJVBe4znVEe+y0tAZ/q4pGD2n9jzyxkG8LPA
	 bipqwWCbzhbPexabsBsR6WIxhmB+yeZDar12OiYYNEK/jjl5ohBeaOVNOne1GGYLWmqTt
	 KLeStcndXYSmIZZ0VejFBpYuv3Qh7wjNk3nY3o5PKe6B7c+uw1h+nrNZWkJ66R0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=87.1.204.51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747664014; bh=+vRqquC7f5Vtsb58CFFeIBEBIcyFoTsEu1U6Uxa/VWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ynF6CUJe9Yt/pDn85ayEyI99jNM2kqVWgdKm5SqOF3RGOcBzokJAgN1lauHjW/pM7
	 0AMOjKplTiaLrfFDDuMzYroFW0SiIvnyGcKeLKPpWmnENYzV+UuLVrmL0JpAjJf70N
	 jvYgHfM49cTTyB0rSaATX7X5Yt8s3MM4vZEbbAjpKzo+2sFu/PAhMjO65yoZsSEz85
	 du6elgsZUM0+5BECxIUdQi9D62lip8RZBTRNRoPAEodjb9JZfhDEjYQwcoFBVm1JBu
	 ddKcFVwtSfC0pDFOJzuIbq2vMwI8KCLsonH56mHRWxC9uyCwUW7Mp1KA+APQb04vF3
	 RtadadF8M3aYQ==
Message-ID: <ac9179ed-32b5-4b80-9fb2-2f3e8012afe2@bugseng.com>
Date: Mon, 19 May 2025 16:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] automation/eclair: update configuration of D4.10
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-6-stefano.stabellini@amd.com>
 <5c2aa885-8877-4708-90cc-d65a76b729b3@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <5c2aa885-8877-4708-90cc-d65a76b729b3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/05/25 01:57, Andrew Cooper wrote:
> 
>> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-2))"}
>>   -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
> 
> These seem to only differ by the begin-$N.  Why doesn't the regex work
> in both cases?

"begin-N" expresses the position of a single line, not a range.
For example, begin-2 means "two lines before the first reported area"
and deviates:

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/10063944407/PROJECT.ecd;/sources/xen/include/xen/hypercall-defs.h.html#R174_1{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":false,"kind":2,"children":[]}}}

If you prefer, I think we can use ranges and merge the two
configurations.

-- 
Federico Serafini, MSc
Software Engineer, BUGSENG (https://bugseng.com)
LinkedIn: https://linkedin.com/in/federico-serafini


