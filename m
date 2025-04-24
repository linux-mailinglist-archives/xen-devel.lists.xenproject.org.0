Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D68A9A3AC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 09:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965920.1356305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qza-0001ad-Pk; Thu, 24 Apr 2025 07:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965920.1356305; Thu, 24 Apr 2025 07:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qza-0001Z0-Mv; Thu, 24 Apr 2025 07:27:30 +0000
Received: by outflank-mailman (input) for mailman id 965920;
 Thu, 24 Apr 2025 07:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q930=XK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u7qzY-0001Yn-3W
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 07:27:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920fe54d-20dd-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 09:27:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1970D4EE3CA1;
 Thu, 24 Apr 2025 09:27:25 +0200 (CEST)
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
X-Inumbo-ID: 920fe54d-20dd-11f0-9eb1-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745479645;
	b=Pg2CcLUBQJrK+UcxRXtU3pH9q8GMpkOZyIjurKiFzhvMs8lDFIUf/9buRvOhf9JPxvL6
	 T3Z8tgHbgdZ6InCrKFIssnWmINOrlTEhV3NcKfBOCkC3nIlV9chmYmek/eMD1LViTZFIe
	 esGt9D4zW/80fm6AI8m6C16EfwAzggnQR322sS9PpM8CArHFET5Ki0afgRkYeXJvAxzi5
	 qvlSwEYn55t+NaYbk7++3PtrHodC08yL/i2mr12svDyHtvryVQQMy/ZPaV1WoRQ8u9go/
	 A+k3sLQlq/Gp6w0I/s7JhWcdhDezs21hsbjgOPP7JlLA20jh1Pv9MGu2Yo5JoQJ9C7byV
	 3IHFqz37NNwwtXxu4Uczzjnv+8Dt42N0ZiycBq3zXoRr/cf7wk/QGFQ6Fg4y/E5kkPkIz
	 9r4SEWpRKIKX7itQzQbV//dC5Swh3zahMqxZmkFPlsT3bCxz/2UlTel0tD5UpsDJ5gaDa
	 qY5yR1UuHkxyeD+S2cpIVKvGvFOQbqjWz8FWCh6zbrsLB2nbvztr+IrV2KTEDISlp+qx6
	 NBLFNL9PyAnRtntrByUb4ouT/kyGhshAMy94CiFPg0lPCTzjigYWvSD6l6UZp0CQoewcu
	 OprS5eP8iZouLRrExrsQyW4Jz4dXV6jV32Nwqjbc50YeyYVhbyOWbfBg4R3dtPg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745479645;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=5rtpMavMXXIb5oM6UX+ySi3Lo/7Is8wEMtUJa1KoLg8=;
	b=UobhDhLjX2JVIqnAbSqUGrXNZ6CDneU9LOo//rSXpSLL/2gCm2y4nbJq1ogc+CS6j2Mx
	 G+xftEJRmenJuw8qq1/H8uZ+Ne6iJqfsYtY7Gq/eKyiiKuvoRk/JylERsfo9ZE5kbqH9g
	 kzSVewTGBEUYUih7RpUK+e1NrZsB6Ja5rhNn+tBDwQkOaCd4FBYfCemag0vKRiFH32KQN
	 n8bkNkWtUU388d2kUvladYpcguBBjgrgKw63GY0O0UD1KCEvfOsgIfVewZ64HB3Oj70n3
	 9xCmqpFoTd48IY8fSF9fRnd+eSk/CBrxfo1B1eR2PChFXc0dvLHU6HgVupHiS9lXroV5W
	 b5TTo91V3umXPmpDXT87yWGOkspnpD8En7Rl/Z2cw0xq0kNZ8dnj1KBwScoZnN/TYlitp
	 lSXgDLMHA9tJ2tZDDhygkrg34Q1l9upGxgfD8C0fB7QDNkpD4fK4n0hIPlSsdZAnmZkgQ
	 +Prslr/yq0ZRAgQenFb6OAreLeEsYgzoFYNpIovCZ/gIubMETcxvHYfxLjUlOL/AOzDwc
	 f2ZWArjOsLlspq7K+Z25SE2HjBK4EQ1c847j2wnbtPNR9cJdoHy5m7iA7O4yWUQ9ZzCeA
	 vOBzzuNjTJWgkh1+DvO8qDRjyqxUWUUGOVO3fYVYNlSnhQTA/3umpzRvgFzXa2k=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745479645; bh=ASImTAl42QyOLbKHP+xJl0WaLzR5xuolQ5w0qxyGNSw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tjLVVU14MuAEWXIL4rdQBb1ycrernElKZCxfT9egETuWnqPgfkeF0K+n7dCPfXcMR
	 wPfhFjm5IeCeyuRj0A0+6bnvS2QVnYqk2URF/oQWgD6Z4ykECkGs/qeH+s4VdBOQxe
	 gNEJIp8u4GigLsaDOZ0sT0nYQrLohyES+fjsks/PMKoNX7q2BuruKUyt2CEDhpzNB5
	 0cxI0ySfqFv9ljfxnoGceQiWKqlLGvSMqHBF8tR49soAyvpN1aEscGnIVqOVQRQyzg
	 CQSynDDlhyK6VdxTnIpT9yM8v7ReTpxVuZ3XEyOCqqPr2s1AWqeRwACHT/Rdr+bpZ1
	 bVads0Li0HIwQ==
MIME-Version: 1.0
Date: Thu, 24 Apr 2025 09:27:25 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] misra: update list of GCC extensions used by Xen
In-Reply-To: <76b7438b-9459-4f41-ab18-b777f7b3fcff@citrix.com>
References: <da508095ef2ac0024dfe9f51d9da976da0eaead7.1745441038.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2504231354540.785180@ubuntu-linux-20-04-desktop>
 <76b7438b-9459-4f41-ab18-b777f7b3fcff@citrix.com>
Message-ID: <1d362e4df1e0b483c31fdab4384f57f0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-24 00:46, Andrew Cooper wrote:
> On 23/04/2025 9:55 pm, Stefano Stabellini wrote:
>> On Wed, 23 Apr 2025, Nicola Vetrini wrote:
>>> __inline was not mentioned in C-language-toolchain.rst, while
>>> __inline__ is not used in code under xen/. __inline is kept because 
>>> it
>>> may be used in Xen. The ECLAIR configuration is now consistent with 
>>> the
>>> documented extensions in the rst file.
>>> 
>>> No functional change.
>>> 
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Hmm.  f96e2f64576cd
> 
> I take it that patch shouldn't have gone in then?
> 
> Regardless, now that we're putting it back in, we should put in both
> __inline and __inline__, so as not to need to come back and repeat this
> patch again.
> 
> ~Andrew

Did I miss the addition of __inline__ here?
https://lore.kernel.org/xen-devel/20250422113957.1289290-1-andrew.cooper3@citrix.com/

No issue with adjusting it as you wrote, but my understanding was that 
only __inline will reenter the codebase.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

