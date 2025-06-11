Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D59AD54EF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 14:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011659.1390122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPKDo-0005nX-5e; Wed, 11 Jun 2025 12:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011659.1390122; Wed, 11 Jun 2025 12:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPKDo-0005kP-2K; Wed, 11 Jun 2025 12:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1011659;
 Wed, 11 Jun 2025 12:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jkl=Y2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uPKDl-0005kH-GE
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 12:06:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c17014b-46bc-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 14:06:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id EE8414EE8F5D;
 Wed, 11 Jun 2025 14:06:18 +0200 (CEST)
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
X-Inumbo-ID: 7c17014b-46bc-11f0-a307-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1749643579;
	b=rriupZzlkurJrbTqhuQHGLxa8zfofIkjg5Oh6G+yuCt/v6Bg1BlbLZg7mAAGIy0GmVj2
	 i+KIcDcDemsOqHahg+BSPJWxj+Lz/PUFoGSFU0NoRKruJwH4HbLnmp0uhR4SUKlpdhsxV
	 eVo2FUNbHBCVPMXIvIRAJRfkDRka7vuF2y3PU0ECQkj3pYSTlwN37iA4+TWXOEeKoKDL9
	 gh7zM2zEHVX6i/0/vZv2f02PEtVck7LQQUCPUpqWQbHGPoXoTzsTCiGjj7AzQGtHmznFm
	 Lyz8SvFNV7PbcBHWEfSEO7Y8izoze6Z8p8SHM00oKZj0P6zwlkHErB6JVPLt/Ven0ZwHI
	 5V+u0OwrH8CphXlxcipnRIxf4UDhH9lqGzF6JIK7+l8PYU7D4UITsgUYk8IxCjhKkSTAr
	 QfaShkz/VEMfzATGKnhzw2mrK9EBmaaYjKWkry4EBumUGqUJCRvM0gWAx5KixYXCeKoL4
	 0oakmFrsL66w+gVq5V43Y5GkwQwLH0+GBRh1IFMC/kQ47/CYj9vubwqC1weNtjt/vM7SQ
	 umRhflr2BPZramcDt+kXxr93hfsyWWEOAVpU5SLHIcCeqlToHB6Tg11x/VjnHbWp7QUrW
	 jOux6gyh0E0kvWSFeaaGVYzZekiRc8m1hdp1oRf7gMU74uL+lKYsgU7k+IjCK2w=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1749643579;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=w9w2r+koGR7DMadVKQE4z3ElAhB0YRhm/wj3E/ACduQ=;
	b=oPzYJNH6VwraeuRH56kf93G4gGvq7nQfdGC05oMFZnPni58X/0wYXrqXgaL/NQPnCFie
	 4FjMsFmj/9yR+5uJExt6O2J+mZMArocFdUGbqD+EztMgpZirT/jSBjBQbJalmf7MHuEKf
	 jTNcOBy57kobWkN9GNrnxSyBFZa3TrTic7AbEAL0XjFo1G0mdmmY+eIbUyqkuxE4rCXqt
	 S0K3ONdqXHQkGrqgCGvPtN59zAnlv9IfuuJPVYPQ+GAfMGoySLmEqXqhnRuCvUslglE51
	 MOu23wc81juXTHT8bfm7E/6UJ7XC4u7q91kwsRM1nQpKcYvfS7vu5cgT/vlp5SxV6KTT6
	 iyLFTv/6tEStxTNy0Jb8APGqChnaDF05EaVQKaJ0RxZLRFpN/n+r4ldWECtf+1EaWb6n4
	 vz2NfMxsT+NM6hfKvsVXF97GreGskniMXHkuS7eEmKiDxlDXBvjE0+7Jj7z4uPJCvaKsT
	 hD23eyN36G0N3O4W0vPFTEptrADdDd4K1PmdeADYwWn0RGnxYXO/d8ycu47jTZgzC/P2U
	 Ekqus5l6toj/Kg96jW8BvxIMzgZLKF+EUU0Manfq7w7F202hMYckjDX2Bj2zwnAS7tnl4
	 zD5HCuCr7jZQXB3MyFX5+8xxYMsq58FKHqFhJuMeDAg9gYz+Q6kskxlfObiYMNU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1749643579; bh=xyQlaxaW0pVpATBCqaCUCYcSmWeIT+C4k/1UhJcgDlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=shxInLogNvlmUy3NUq4Ph4A0Z7uhvSd4PzB5hTA2kF2t9qPEQHEhHfjyvHYlh3aJ4
	 AAK6gzj+KKdSk1EXauLnkJs9NQL2YaZL/wCGsLgOK1ZF9Ybe/IbAFJo/frkcpPGJWZ
	 Tw9AsqpbXrjHgqr5PPIwL1F7TDvKG+7N5n31mlKLL7KOQiJMNAK0K4k4SQK0BB6QHa
	 NP0e0o21Rhc93Do9H/FV4b0uydN+HW8VHqx2HeLFqFBFJpQtT3iIWs0YC23HqAoNJq
	 G3BkcnixDhZdkRyMP4Xl3aDR3LjbORHtFkcqKmOqI/svR4GN9DVLQRE4QwQFKdTtC6
	 OxLOYbltO9RTQ==
MIME-Version: 1.0
Date: Wed, 11 Jun 2025 14:06:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Penny Zheng
 <Penny.Zheng@amd.com>
Subject: Re: [PATCH] ACPI: adjust decl of acpi_set_pdc_bits()
In-Reply-To: <ce83a4c5-9007-4363-b0b7-6a87aa7693b9@suse.com>
References: <ce83a4c5-9007-4363-b0b7-6a87aa7693b9@suse.com>
Message-ID: <21a1af12f26a27703689939cf80d1f80@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-11 13:53, Jan Beulich wrote:
> The commit referenced below changed the type of the first parameter.
> Misra C:2012 Rule 8.3 requires the declaration to follow suit.
> 
> Fixes: bf0cd071db2a ("xen/pmstat: consolidate code into pmstat.c")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -186,7 +186,7 @@ static inline void acpi_set_csubstate_li
>  #endif
> 
>  #ifdef XEN_GUEST_HANDLE
> -int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32));
> +int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
>  #endif
>  int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

