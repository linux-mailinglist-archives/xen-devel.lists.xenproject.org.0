Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A39ACDB4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 16:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824737.1238914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3coz-0004N3-91; Wed, 23 Oct 2024 14:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824737.1238914; Wed, 23 Oct 2024 14:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3coz-0004Ks-66; Wed, 23 Oct 2024 14:58:49 +0000
Received: by outflank-mailman (input) for mailman id 824737;
 Wed, 23 Oct 2024 14:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3cox-0004Kj-8o
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 14:58:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc7d374-914f-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 16:58:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729695518647177.87965042799783;
 Wed, 23 Oct 2024 07:58:38 -0700 (PDT)
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
X-Inumbo-ID: 4bc7d374-914f-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729695520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JoOjLytBV0xD7ZnknejYKoQX+Os6TYXkWxxoO9zi+TapP0IgoN0h+P07+vqxN7BAGVEB9bmQV+4sk8A41XdJl06DD9tc8XeV1bLjSmWVT3b8Q4Niqmz4xHYnMN8evzZqbYbLJiSdc8yYrPLJ2VSq/uNV6Mi7UfwXMqG8+s74QHI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729695520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XFUZApqXLzTPG9d+X1HRSKAJr1RKWKgKuddXGS32uXs=; 
	b=isTt/VFm4RkrDm3I+wL95R4LisSErSEcYIbVd7vpJ0GNuNTmDQelk0LH6Pzb+xwJzaocjKHu4sAMwt9RxcfvviKlvmhm6Vobu+lxenhtslV+0ELI6FZS5qoGoAwQ82SUyaTbl7C55K4+L9v1vo52cQixQHCRKnmDtSbMRlZ//oY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729695520;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XFUZApqXLzTPG9d+X1HRSKAJr1RKWKgKuddXGS32uXs=;
	b=MC84Swbw/8AVKLaGv6pPxQ82ZozGm9013EOHUjnMObIakUJfUyUivai68YEsUqZ2
	JkSJ64BDNgI/rr3dYK+qipG5bhNVgnNhahcNjJ60In6lwTnB6kcb0ho7KtHTzqGizev
	0gB9LHydEuJiZHhOgY6d3vMV4IgOWEr7zDtnzaOw=
Message-ID: <21218409-5506-4321-be8c-d044ba758b7c@apertussolutions.com>
Date: Wed, 23 Oct 2024 10:58:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/3] x86/boot: Remove the mbi_p parameter from
 __start_xen()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023144448.731688-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241023144448.731688-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/23/24 10:44, Andrew Cooper wrote:
> The use of physical addresses in __start_xen() has proved to be fertile soure
> of bugs.
> 
> The MB1/2 path stashes the MBI pointer in multiboot_ptr (a setup.c variable
> even), then re-loads it immediately before calling __start_xen().  For this,
> we can just drop the function parameter and read multiboot_ptr in the one
> place it's used.
> 
> The EFI path also passes this parameter into __start_xen().  Have the EFI path
> set up multiboot_ptr too, and move the explanation of phyiscal-mode pointers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

For EFI:
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

For remainder:
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

