Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E642B39705
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097774.1451985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urY2W-0003qm-LF; Thu, 28 Aug 2025 08:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097774.1451985; Thu, 28 Aug 2025 08:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urY2W-0003oY-I6; Thu, 28 Aug 2025 08:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1097774;
 Thu, 28 Aug 2025 08:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YJy=3I=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1urY2T-0003oS-Vo
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:31:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ec4e100-83e9-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 10:31:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C4CB84EE3C0D;
 Thu, 28 Aug 2025 10:31:17 +0200 (CEST)
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
X-Inumbo-ID: 5ec4e100-83e9-11f0-ae26-e363de0e7a9e
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756369877;
	b=ytu0Kq6bdMjTQCPv8Qw7amP68diu3a31xTuRtwt8z2ajKSOJZ/Cx6zQv+KDODZCk6/BR
	 NvEpHspFGynhnTuiIIzY9xLzK6rhZP32E1aGdQDvFKLYb43NTKFL6qXQdhxKHBHYFTgVD
	 rvbdHfnZRBB6WFCNtw4EztWgEVuoTLI6CCJlNJ11WdeB8FupcUYoVA0X8CJyx34FtSPVz
	 CYFycthVNiSCpSj8fxSfffL/l2EPaGMtNvW026fbsnZLFzE/5QIqusZWx96apdZpBcvwi
	 UDcJPu1DLA17OsRqkn2JhS0fNgQe/TSUiCIA8mksAasGMZwc9Cc2GVzY7joQSKse40rio
	 +9H7yLI3F5LZpWxqxO2YC+/wcH93joJ9P0aRi5njWh64zbT5OdFR/kdp5drsq7c2CHvuf
	 IK5Jime7XCKhypBc91pRGZKzk9up85kv/QxgofXWImBITTXj60c5l8KhPw3uE6s9Llk9x
	 D5tnsNPKG5WifdKRR2CKKv1mMY7QZdRhEocaru3gJDh8F1gIlUEpe4weqdFjfwLXki7pG
	 tLiB9wy6ahwlcaZg2ayXsBIfuvOL/xDybXF6cZi+vWzZMDAokxWs9LG3UkAigW6Yd39zn
	 Zkm8vtZBTfBkeSgfeJB598x0loIOcMh8RIMzsFvjndHzqq9eLXu4oDoPuy15btI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756369877;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=RIg1iHkhHRg+2G6u/bDaBlzal/A0QpfpstAn580hB7Q=;
	b=aWMXpG211UJFz9KnU1niBfaNUEeH/uHmpsF9CoVDDPDjnY0QK9XSEjEuy4bctXIVIfr4
	 v0dV+U5trhVaDSCD4O55zNQRx+qXV4nTMAMmrIqQI8lkC4LWUo88TGS74rP7CXOvaFViP
	 oiPq8aA8V+R/LGeqlmFNuVZp9j8HJ2LtNsu5TdxSJrYh/zrifaoRddWt1tCUhF0XPVzdn
	 KIPxx8vJAlG/qnI0nJCvMdTtWKPp3EY23BJTrtnUAd6poVDJKIWWKwcw5DEwxSj9uz17l
	 u3zw54GPcQa3+CXwcM3+dUSZ0O943+bACsITFODqRt+UeALhuLhKAQ8ZUKre/iOcWqIGt
	 0eH90wkc0cEUqSW+tC95UKf9/sdlEL0Ja86+FH8TLfSkBqG/EAF/Q4+u2Vf+WdoB/LcbK
	 /jfnB2kfKzd46iUbqE6coX7iz7z635qvEs0w5rsMCj1/JJo4ZzeiTqq1su1Cqj3cj7EXI
	 9coUi/Y+PTCeIdf9UmtzqExCn/vNfoVdy2D77HymkBfakgvZ4uqC66xANHjEfGszwLLx9
	 vVi60xFM3otX8tDxfZpkzr2Bpp88QaaxHChr0Raq0rF8rTCxP3klWM3t6BSyzxjnijMzE
	 KPMfy59gWhS3e0TNSFW9wu10N0B2ASWo2FqcFjsR0PSlSNaAuoTZC3G/IHacing=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756369877; bh=trYydJGVq8W8ebPlExm1SiYOWJ97EqVkq+SDQS5SKSw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R7SR1GqtB5lSOXp/OeQArqQJylVV6lvBMRgh3qHDbd0Vjk8e4D8D3hzkIngPPCNTZ
	 VzV1BdIsyBPFIMy350wWsP6lbfe/ylpc0z3m4hYS9vecsIWetViRDAieYx+9arlJna
	 fz+fYg9yc/cGGpcFroXWyhgiWtdxsCC54GcTXfvRfspg9p463aCgoWS+0nHX/vosMG
	 d7Clneff8g1for2mf88qDMF9tDQw1vfL5AB4Q1l5kPczQ/WlqNXWBahlP6PNHbug/q
	 Fv00NnOIFFURljO5OPORoLV0OeiR0+R88P4YOkbQK1hkMJwCHpmYCtLdhlIJ1TQaYr
	 rFsUD+UMBfCSw==
MIME-Version: 1.0
Date: Thu, 28 Aug 2025 10:31:17 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
In-Reply-To: <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
References: <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
Message-ID: <185dce3ba4762d4528866f2e50e45371@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-28 10:17, Dmytro Prokopchuk1 wrote:
> Resolve infinite loop issue in the 'fail:' cleanup path of the function
> 'assign_shared_memory()'. The issue was caused by an 'unsigned long' 
> type
> for the loop counter 'i', which could underflow and wrap around, 
> violating
> termination conditions.
> Change 'i' to a signed data type ('long') to ensure safe termination of
> the 'while (--i >= 0)' loop.
> 

Then this likely should have Fixes tag. The R14.3 violation was found 
after adding CONFIG_UNSUPPORTED=y to analyze.yaml?

> This change adheres to MISRA Rule R14.3: "Controlling expressions shall
> not be invariant."
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  xen/common/device-tree/static-shmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device-tree/static-shmem.c 
> b/xen/common/device-tree/static-shmem.c
> index 8023c0a484..b4c772466c 100644
> --- a/xen/common/device-tree/static-shmem.c
> +++ b/xen/common/device-tree/static-shmem.c
> @@ -134,7 +134,8 @@ static int __init assign_shared_memory(struct 
> domain *d, paddr_t gbase,
>  {
>      mfn_t smfn;
>      int ret = 0;
> -    unsigned long nr_pages, nr_borrowers, i;
> +    unsigned long nr_pages, nr_borrowers;
> +    long i;
>      struct page_info *page;
>      paddr_t pbase, psize;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

