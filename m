Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534ECB3FA1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 21:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183316.1506060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQvw-0000AT-V5; Wed, 10 Dec 2025 20:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183316.1506060; Wed, 10 Dec 2025 20:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQvw-00007l-S4; Wed, 10 Dec 2025 20:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1183316;
 Wed, 10 Dec 2025 20:37:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEw+=6Q=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTQvw-00007f-2Y
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 20:37:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 002567fa-d608-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 21:37:10 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 0166E4EEBC5F;
 Wed, 10 Dec 2025 21:37:08 +0100 (CET)
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
X-Inumbo-ID: 002567fa-d608-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765399029;
	b=kmZrx2gRavTVlI80sQ0oLFOPMvz8CoAjYGuGBsBgy0O6vtqXmpmfDiFCASydRj63c84i
	 jqqFlsBVGTV1MyvuGPbAvQGdtbwGn5HXHImmytv3rWwZbZya2Y/9F/zt55xp+3RmZQlnc
	 xN9QECjiDT804rFlqq0EpZBVPZ2k4MQGjSGm778DOVOoOrWeyDxmZTlscGkYvHLDDPvDk
	 Yg+TmlLdhEqnfFQlrYNkcB/YieKmk3+elYk53xm1dKAFa0nB7KEHryOk8XF6mageU2dmC
	 le6aZTRhtMMjTEVkxMKvqsyfpor84Dhu+cVNO2deYL7cgXu+B+8ipduA2PBjPuqzfPJA1
	 2jNVSi9dxk0aDnZek7ehxeMwbrQq2Gg0y/ZNuU2BtMtfWGR4dKo6FtFS4hYlbHl4rR5ik
	 NAKRMi5xMY0APnmgCvbaCcveW2kv4t35l3SFetO5Bflt7+PJl050jQA44nmH7DUf+22K8
	 l5/VYITvL/tRvdBwEX2LRNbwJX8EsaGf3MlstAGCDa3yB7pjNL+LLJ2/hePX0XSNt2qqv
	 guFKzAzk2aldqCh4Nywykk5XF5KNxw6cY47fVeIB/SYQgkSxzrDrPhDblRPpA6JSPgjEN
	 bsF2GAtZtCc/wU8ilOYKXkgG09E/idoj1/m0kGxhGnDr1Hkc/Pya7UrEbfiysT0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765399029;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=1RXVffh6wiq/ymvU4iZWe5oifI/6dxTQnQPN9i1zS+Q=;
	b=cY8fn2hbnKY08mWlZ8pG1kq/FbKVlc0txTXR10ZA+A2UOsrSfZFSDOcYNqHycayNNMDJ
	 8sUw5KZ7LRWX6yempE96j0e+LkVyVMEMxv4w1RyWqK89TAyyP2S3oIXgJ5BA00/58kVDc
	 d+j/QPxVA5O20N1F4rqCoSgk5SBK0TgPgl3YAN8N+j0wOVuY2C+6qjmWA9VE2RTtuUn04
	 yVH3esTutob8CN5Q5dFx2WMaGFVPziYJlIc62gP6wjzsHXXwLGCn6EnrK1Y/6DXh+rbWX
	 9FCX0x7oeNT2IPAJ27Cac/j5WmgfyOuW8luhuEXgVOvSkPO3fUflB6SOy45i0Yp2kvb1p
	 Wny1Vn11B4qoq/HeN/2B7gS7cNHc914DQpUWz9XCYJMjFOiG4JZ2rtOM8gt0jSPE00TFg
	 o/w0pNZlKA7xzPjH4EXSLO4d/5LPQOkQBE990sHQVZCH0iMCzjoid0oXB0eQnRcyMLhNI
	 OFecmB5kljC/THgBH3OOFx7ys9q4nHV0adUJiY4Qdn3ikRIGEzuNfEx+2ErbpfRx4R6I1
	 YtzsM8hjOMGxpNo8rUieQogcvv/NsyNs7Mwc45h4BYSZFgsM/594yDr5oJ+CNkvlhWHhE
	 7vNu3MLAVDCqKg7geNg4yTmlWeKo+mv3lPGik2JC3OqW1EZ27VYGFLMb+9htqCs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765399029; bh=iDnkDoOYj0GFO6Zc892W2pwq08eZGtuyuFGMtqrri9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nAVdPEcjFdvDPaLasXnBW4bde23ZybjIDdBGqLZzlkt5B8iQZtyOQ+S0KK656fgTP
	 wVvZsrecTnwDuQRsA/TOK62tkvlVbvl+IDrdIbGJLEbhFns4NCtbnkr11JbwOHwt4k
	 hfPn5qEcYP9bGm4e++GTBSFbtfGGDjkKPGj3RRGxc8GZ0FVOwNz5q1vCPWZB9VnSBn
	 jhkJ8X7V266UO1/udHLv+YL3hwSddtKVZlZq/kMSAsPEDnqC8hq48vdBL9iTgSVUg5
	 loi6bNHpkvFE2V3pvxBwdtBzDI9Tso175cqjlrKexb77tSW3mbnmcWfnQKpZPoYH1p
	 cIiPj/sqEHlYw==
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 21:37:08 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 3/5] x86/ucode: Don't cast away const-ness in
 cmp_patch_id()
In-Reply-To: <20251210183019.2241560-4-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-4-andrew.cooper3@citrix.com>
Message-ID: <c260c81b7be1e5b27cd6c6705709c060@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-10 19:30, Andrew Cooper wrote:
> Fixes a volation of MISRA rule 11.8.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/cpu/microcode/amd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/amd.c 
> b/xen/arch/x86/cpu/microcode/amd.c
> index adabe6e6e838..2760ace92177 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -106,7 +106,7 @@ static bool __ro_after_init 
> entrysign_mitigiated_in_firmware;
>  static int cf_check cmp_patch_id(const void *key, const void *elem)
>  {
>      const struct patch_digest *pd = elem;
> -    uint32_t patch_id = *(uint32_t *)key;
> +    uint32_t patch_id = *(const uint32_t *)key;
> 
>      if ( patch_id == pd->patch_id )
>          return 0;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

