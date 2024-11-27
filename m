Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CE9DA66B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 12:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844691.1260178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFo2-0005wo-Pp; Wed, 27 Nov 2024 11:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844691.1260178; Wed, 27 Nov 2024 11:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFo2-0005ub-N6; Wed, 27 Nov 2024 11:02:02 +0000
Received: by outflank-mailman (input) for mailman id 844691;
 Wed, 27 Nov 2024 11:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yAS=SW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tGFo0-0005uV-Ff
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 11:02:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0411ac7c-acaf-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 12:01:56 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1BB684EE0739;
 Wed, 27 Nov 2024 12:01:55 +0100 (CET)
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
X-Inumbo-ID: 0411ac7c-acaf-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA0MTFhYzdjLWFjYWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzA1MzE2LjI4NTM2OCwic2VuZGVyIjoibmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1732705315; bh=WBd8/zexr6RcHfPAd2lmmj/5FoKDu9pU4haEmrSm8Mg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w1YNu0BTXKV4HZnERDRzKIc5p9sDObTN4S8AByEFCO/4BGrquRnpaqucJ66cX2cF6
	 45t6gPZsJBMRPSvPj6uckuLoKTl5FuvnlhtiZCn4gS05agcg/kHrIu9h1QucmVnnw5
	 yFCeQpCK3Haz+i0Sh3nBTIdzwR8Mf6xSAlUEPItA2h1xwyKh2LUeqE1lPHW3HyxQ2x
	 BIEWOJmrOMuNAHVxFtlfXeCpTTbNH4t8P1P81+DAJW4Miz04IGxAvBwe+XiT+STszm
	 Jpi7vwEuzGxYgtGEWNZYeL7fc8Y09DvcOTB4oRHN7aHmNRmHbUADjmn6Am4q+qFcVt
	 I6YDen74ElOQQ==
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 12:01:55 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
In-Reply-To: <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-2-roger.pau@citrix.com>
 <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
Message-ID: <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-26 10:58, Jan Beulich wrote:
> On 26.11.2024 10:35, Roger Pau Monne wrote:
>> The current guards to select whether user accesses should be 
>> speculative
>> hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and 
>> can't)
>> parenthesize the 'args' argument.
> 
> For my own education: This definitely isn't the only place where we use 
> a
> macro with variable arguments, and where the use of the respective 
> macro
> parameter can't be parenthesized. Given patch 2, why is e.g.
> 
> #define emulate_fpu_insn_stub(bytes...)                                 
> \
> do {                                                                    
> \
>     unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    
> \
>     memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      
> \
>     invoke_stub("", "", "=m" (dummy) : "i" (0));                        
> \
>     put_stub(stub);                                                     
> \
> } while (0)
> 
> not an issue? The first use of "bytes" is in figure braces, so probably
> fine. Yet the second use is followed by a comma, so unlikely to be 
> okay.
> 

I didn't look at it in detail, but if bytes is expanded inside an 
initialization list, the configuration allows it iirc. I'll need to 
double check, though.

> Somewhat similarly for
> 
> #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
> 
> where we're using the C99 form rather than the GNU extension, and where
> hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
> parenthesizing, when it isn't and can't be.
> 
> Isn't it rather the case that variable argument macros need a more 
> general
> deviation, if not an adjustment to the Misra rule? Extending the Cc 
> list
> some ...
> 

> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

