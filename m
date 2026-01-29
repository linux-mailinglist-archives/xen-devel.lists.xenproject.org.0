Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPwEOX1ye2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:45:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049B4B11F4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216675.1526611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTGb-0001nq-DZ; Thu, 29 Jan 2026 14:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216675.1526611; Thu, 29 Jan 2026 14:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTGb-0001lk-Al; Thu, 29 Jan 2026 14:45:05 +0000
Received: by outflank-mailman (input) for mailman id 1216675;
 Thu, 29 Jan 2026 14:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICVe=AC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vlTGZ-0001le-PA
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:45:03 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1650b221-fd21-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 15:45:01 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1769697895270324.40780646864755;
 Thu, 29 Jan 2026 06:44:55 -0800 (PST)
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
X-Inumbo-ID: 1650b221-fd21-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1769697898; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QumGtfraMk7/B+Rw3bHtVP4cg2CsIu7usSzgqg1wswMQgl9+x013osCjsQsHiPeEioMBOjyrvOwV+GZ4/2892DOoDY57VXSApb3x4Eu8K2JFeiOuuJGyFwNR+Ud+845t9AGZ31tE2T4H4IvBp6grzwbRdSYsReuRAYItykOiMWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769697898; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j8yBhKx1G41u1LsCGtjrmCUpwycCbK+hk+TjR9aoEpY=; 
	b=S3+PTSSkXYV+6oheYjCZcs1SEUXa3t5U/xXmIB04xM28udoNulO7IaRN8sn2Wdr4mkds+IcuyJQNTR17gbsIq4R+MhhO10+nKQ59BAOF65RNEpe7Vd/yYh2cE6RXBrOxKlWIwPS8Hlm4lZINd8HUk59vwdg3rvY2J4B//WYvvdQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769697898;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j8yBhKx1G41u1LsCGtjrmCUpwycCbK+hk+TjR9aoEpY=;
	b=oONzvDiMY8MPc24KT8IIilMN/AzkI7bgnWMdPzN7HccuMwivAMzPF1RhZntDPPFp
	bOLE7E+DKzlsUzBQ/oA2cW2ECIzvCBv3M0J81bKTGfcdu5zXIw77IoUC4wnguMNM1xQ
	eZjouobCqMeIGIfGXqiK9h9XwxyKdnySqdrcBBWY=
Message-ID: <2506be14-5615-4221-b6b9-079c709fddc0@apertussolutions.com>
Date: Thu, 29 Jan 2026 09:44:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EFI: correct symbol table generation with older GNU
 ld
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <27f291a3-6546-4834-a9cd-22a4636b152e@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <27f291a3-6546-4834-a9cd-22a4636b152e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:email,apertussolutions.com:dkim,apertussolutions.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 049B4B11F4
X-Rspamd-Action: no action

On 1/21/26 5:05 AM, Jan Beulich wrote:
> See the extensive code comment. This isn't really nice, but unless I'm
> overlooking something there doesn't look to be a way to have the linker
> strip individual symbols while doing its work.
> 
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Should we try to somehow avoid the introduction of the two symbols when
> using new enough ld, i.e. relocs-dummy.o not needing linking in?
> 
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -339,6 +339,24 @@ SECTIONS
>       *(.reloc)
>       __base_relocs_end = .;
>     }
> +
> +  /*
> +   * When efi/relocs-dummy.o is linked into the first-pass binary, the two
> +   * symbols supplied by it (for ./Makefile to use) may appear in the symbol
> +   * table (newer linkers strip them, for not being properly representable).

Just a suggestion, but do we have the minimal version where the 
stripping is handled properly? I just think it would be good to have the 
minimum version documented here. Doing so would make it easier that if 
the minimum supported build tools are bumped past this version, 
hopefully someone will either remember or notice the comment and could 
drop these declarations.

> +   * No such symbols would appear during subsequent passes.  At least some of
> +   * those older ld versions emit VIRT_START as absolute, but ALT_START as if
> +   * it was part of .text.  The symbols tool generating our own symbol table
> +   * would hence not ignore it when passed --all-symbols, leading to the 2nd
> +   * pass binary having one more symbol than the final (3rd pass) one.
> +   *
> +   * Arrange for both (just in case) symbols to always be there, and to always
> +   * be absolute (zero).
> +   */
> +  PROVIDE(VIRT_START = 0);
> +  PROVIDE(ALT_START = 0);
> +  VIRT_START &= 0;
> +  ALT_START &= 0;
>   #elif defined(XEN_BUILD_EFI)
>     /*
>      * Due to the way EFI support is currently implemented, these two symbols


With or without the suggestion,

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

