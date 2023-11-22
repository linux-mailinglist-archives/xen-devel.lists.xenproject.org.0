Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15097F52F6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639208.996236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vM1-0005Iw-9s; Wed, 22 Nov 2023 22:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639208.996236; Wed, 22 Nov 2023 22:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vM1-0005GJ-6v; Wed, 22 Nov 2023 22:05:53 +0000
Received: by outflank-mailman (input) for mailman id 639208;
 Wed, 22 Nov 2023 22:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5vM0-0005Fw-0X
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:05:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b317a2b-8983-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 23:05:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 010D3CE1F37;
 Wed, 22 Nov 2023 22:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD82C433C7;
 Wed, 22 Nov 2023 22:05:46 +0000 (UTC)
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
X-Inumbo-ID: 4b317a2b-8983-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700690747;
	bh=bDIj9KpfgTAV7YviTLCLOhggb7tm5rONg9eD0NYuaDw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e1DLkD6sz9/095QOGLd/lTf3k8EtEMQbaom34hz3ujAQQm2BuAfiBUVlpHOikUPNN
	 nYzQKdj/MRoVj0inopr9RlQjUnoRDwj5ez5SIAiFS2vl73FlWexcUu2KhKfKqzjlA9
	 7+n0HTQlM2IjMZ43tPixaeZqKC1dwXVTfTWtqmoRExdaKfVsQaUKYr2N+N3PPE/bq8
	 TAru6KcxFj+EFNvVFpsp/+A1TWbwGTGDcqGc3ygeWSvaCx4q+gVXdPeLmZ6zfk//JI
	 Xk3WYcpCjyNAsjHvy6PstcmSPKGgVXZbs2Z20eE2NH+ULhS0PE/8LiNizHe3gXmeDv
	 hxNSgrD8ymapw==
Date: Wed, 22 Nov 2023 14:05:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/apic: Drop atomic accessors
In-Reply-To: <20231122142733.1818331-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311221405390.2053963@ubuntu-linux-20-04-desktop>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com> <20231122142733.1818331-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-218783354-1700690747=:2053963"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-218783354-1700690747=:2053963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Nov 2023, Andrew Cooper wrote:
> The last users were dropped in commit 413e92e9bf13 ("x86/apic: Drop
> workarounds for Pentium/82489DX erratum").
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/include/asm/apic.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
> index f7ad7b20dd80..288b4933eb38 100644
> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -54,11 +54,6 @@ static __inline void apic_mem_write(unsigned long reg, u32 v)
>  	*((volatile u32 *)(APIC_BASE+reg)) = v;
>  }
>  
> -static __inline void apic_mem_write_atomic(unsigned long reg, u32 v)
> -{
> -	(void)xchg((volatile u32 *)(APIC_BASE+reg), v);
> -}
> -
>  static __inline u32 apic_mem_read(unsigned long reg)
>  {
>  	return *((volatile u32 *)(APIC_BASE+reg));
> @@ -97,14 +92,6 @@ static __inline void apic_write(unsigned long reg, u32 v)
>          apic_mem_write(reg, v);
>  }
>  
> -static __inline void apic_write_atomic(unsigned long reg, u32 v)
> -{
> -    if ( x2apic_enabled )
> -        apic_wrmsr(reg, v);
> -    else
> -        apic_mem_write_atomic(reg, v);
> -}
> -
>  static __inline u32 apic_read(unsigned long reg)
>  {
>      if ( x2apic_enabled )
> -- 
> 2.30.2
> 
> 
--8323329-218783354-1700690747=:2053963--

