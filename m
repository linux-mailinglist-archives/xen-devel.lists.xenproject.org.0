Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C9B203E3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077184.1438262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOyU-0007SK-Ll; Mon, 11 Aug 2025 09:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077184.1438262; Mon, 11 Aug 2025 09:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOyU-0007Pn-Id; Mon, 11 Aug 2025 09:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1077184;
 Mon, 11 Aug 2025 09:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn8B=2X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ulOyT-0007Ph-9B
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:37:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d77c4386-7696-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 11:37:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id F34804EE0744;
 Mon, 11 Aug 2025 11:37:46 +0200 (CEST)
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
X-Inumbo-ID: d77c4386-7696-11f0-a325-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754905067;
	b=TpoGD1L2+fY/HabGhqi3AyvB0j6fnspRCTaQsDcv4irAa36GEeUyYXMUNfksJvxqVITE
	 K5UANGizzf+m+oJ638rifzJoJj+ByOwFWS2R2vD0s8cBaTnoDZunprMn0iKmNtiZqXMpG
	 vDdcLJYMRCsV6PsCm8ROI6pYMRzDbka9Y/ekf4UXT9KceDQk+ChUyLofCZgvK0HeDHeUO
	 OKuqTsLqe3X2dEFvngSMnIcbk5bVUhQbmcJn6czwOBw8VI9tQ6WoBL2mEG/rDjx02TN/O
	 Wlk2yKVu1koLyPU+X76Q+vPzZfq/5UMvUzv9oEN/JRZL9wck1goHFVHQcRAdv9PqDLpgE
	 j2HvzeDH1hhVotXp7ZY8ZGh+ZnJFUWraCfxpkxopVycdbCZC+lCFA7AjJ+rV0n4Fl1ZkK
	 kc5iZzjVBN/6JsyBNy3togwG/i7i32bp518uW+S6JtrPZl+dupbncQFfWlyIlinl+8HlK
	 jJvC6++PGZCsIV7q2F3Jse5NIKMWXul1P31NVNwBudy/3RXhxoDK/HBmhMxkh/FJFZaq4
	 SIt+aSwbs2++LaoQZm6STngO1QTYNUdCEVAJ+L3j/McSAh7AgZS0U9X23Bo7xNODCuIKh
	 xyr2sGFIP2Ek6zTdwlfc89deJKeL0c9ZLAVwigVLdo6B1IzU/fNuNCWmutrVJUc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754905067;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=B+VCLIM59gNO7oGRL5RbaIyllKvsSR+p7SZBqqqyJgc=;
	b=rsk7fDjJx/QcV3mHeCFtevo7ZMugQvqoObBdB5BWOeYUlirQ03Jb2CM6wpCYg6AycjA7
	 h/8705csLGzt93uaqwCcfBloPHRcGCB7DsGbMj3sUHEAdwHZlfZCZDYw+NUkFFxTFW/eR
	 0YTvHiCw5HGyH5Tj9nKh/B3Bbovl1lNQpc9ggOql9QV8o1+PnPiWvYXUYl8CXOPJwXBEr
	 +/H0TnTYp+AzOHig74l1CNfCVJMHvrP+XgLgogJ4XlvlOtUTsq0VtQWop9eyoao5cAPmu
	 NdipGi1jSHa5F79xWgqVDmse+iZxGtMI/hfrAFygIi5/dimU4ZTCbHWmzsypgchu25M/y
	 I7TlbSxxVyRU4VbEaKKbXCC6+lnP1DQ88aXkHphbEsRXkFXLOdffk9VViWQgcl9QnsAUL
	 Oxsg/qpMYJiiPz7G5BZiu1jJDebQ/pmO4RXFfHagtzfSnIVxpxLQr7UUQ7tY3TYZ0JG6s
	 yg1yFFMmfc0nU55BArxruJ8a17b0IYcA8PmoZVGctrPQL9JqrFNb1Ig30QcAIkFTA47BN
	 vMuyrIDYX7zdgXhOqC3m61InbTR7jpMGEh7A8jYx2/gzE/HOheaW3F8vZuGVwo66b5Qpn
	 sA3iHSvG3ZAsd2D0RAJa+M+sFnaTyXE0ww80X8q4k1p7mXL92ZrKwpS0WKcwm0o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754905067; bh=fPizuQcs0OTx9Ca+iCbtlDW9LGWCBhL4ud03pLLkJIA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZEhAbXw6s11UnP16cY3+bUTmpRGJ4oasM8DryrJph9YJOe1jIvN4vo0y7PI7oL70z
	 NUOwq4d4DJAufOop0H8y7LsiI+3FocCHDJHWDRRBRHYJxAEieWGGWVgTTgHYEbEcbW
	 Z/IxzlZBMUPPu8IOIc7/8yawBx822O1QSWPc+41sLF7RtwX3GAtBhWdtxt1IEoNNU9
	 0lBASq0j8oYsQ4UxUGkI32icLB5QGcf81YuRp/L7qy/S6oenzSEKUkr+wz2AdYPwCW
	 OG/E5wbF87GoWbSydIhLAo+XbXPUV8hBXcrdYhIUwTRs1evw21PNaV7fnXRwTgfnZu
	 S+qD9Quli3mVw==
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 11:37:46 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
In-Reply-To: <aJmgCv4wgl-IHupn@macbook.local>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
 <aJmgCv4wgl-IHupn@macbook.local>
Message-ID: <2ca7082120df5e1ad6a29582d6dfb215@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-11 09:47, Roger Pau Monné wrote:
> On Sun, Aug 10, 2025 at 03:03:53PM +0200, nicola.vetrini@gmail.com 
> wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> The enforced toolchain baseline for clang is version 11,
>> therefore this logic is effectively dead code.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
>> ---
>> Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
>> ---
>>  xen/common/coverage/llvm.c   | 4 ----
>>  xen/include/xen/self-tests.h | 9 +--------
>>  2 files changed, 1 insertion(+), 12 deletions(-)
>> 
>> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
>> index 50d7a3c5d301..517b2aa8c202 100644
>> --- a/xen/common/coverage/llvm.c
>> +++ b/xen/common/coverage/llvm.c
>> @@ -44,12 +44,8 @@
>>      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>>  #endif
>> 
>> -#if __clang_major__ >= 4 || (__clang_major__ == 3 && __clang_minor__ 
>> >= 9)
>>  #define LLVM_PROFILE_VERSION    4
>>  #define LLVM_PROFILE_NUM_KINDS  2
>> -#else
>> -#error "clang version not supported with coverage"
>> -#endif
> 
> Rant: most of the LLVM coverage stuff is already kind of dead code, as
> the format of the data changes between versions and there's no way for
> LLVM to generate the blob itself using a builtin function or
> similar.  We haven't kept up with new formats, and now it's not
> possible to parse the output coverage data when using newish LLVM
> versions.
> 
> Linux converts it's LLVM coverage data to gcov format (which AFAIK is
> way more stable), and exports it in gcov format.  We should consider
> importing that from Linux.
> 
> Thanks, Roger.

Fair point. Generally I found coverage reports generated using LLVM 
tooling a bit more informative than gcov's, but I don't know how much 
work would it be to adapt Xen for newer versions of LLVM.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

