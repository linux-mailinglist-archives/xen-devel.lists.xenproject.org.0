Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE59ABA75
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 02:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824346.1238468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3P5n-0001cw-MJ; Wed, 23 Oct 2024 00:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824346.1238468; Wed, 23 Oct 2024 00:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3P5n-0001aS-JG; Wed, 23 Oct 2024 00:19:15 +0000
Received: by outflank-mailman (input) for mailman id 824346;
 Wed, 23 Oct 2024 00:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3P5m-0001aM-5E
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 00:19:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d6ad6e6-90d4-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 02:19:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729642747740216.84496069926502;
 Tue, 22 Oct 2024 17:19:07 -0700 (PDT)
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
X-Inumbo-ID: 6d6ad6e6-90d4-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729642748; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jaOryYsBQvBczumxKSV6TPQpO8R8880pYClRU+cvCacvoVDe2VUXGtXdcXwGZv6/SXem9GEmzepPhMnYG7fE/zNiG0GhZPNnoLBJJriIn7ZLqdFk+hnSUAWGa1sJruK3XOc15ojidlQz+VK12/dvX7mI6Qlj9iru11RVCI9firs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729642748; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pSZTmUv6ej+VrvylZckjQ+3WLGWJeyGMReTfSjVMNDQ=; 
	b=W5W6AnXc6k0Vfdct85P0JpfUu+uWrRHSf3aVbzYPTAmUBKRh1crh95CwF+WJyNRNCt8CYCRF1Dou+h4XiMl+w2L1G9fjb8B1oEXqIsyz3AbXO87eXwHnyXiT54TBZNUo8UQD7cijqItMoJxr40cHGLgqXMp3ufaY9M4C1YUOsxo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729642748;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pSZTmUv6ej+VrvylZckjQ+3WLGWJeyGMReTfSjVMNDQ=;
	b=CV9CsV/dGXHhJeEQyK7wlTFWZCS+97hs0u6ljzObCw5M1jYbX0qQmkLz9I0J/TvB
	JMuXbZaw4pSz3VB4TQI33RUhZxnRN/TiXoVcIrvtWfrp6QDBjSnQdUWV0ygX9I2VEkj
	BJxlyEkuPEb2TDQ0PD27Mxr8XY2ntrDAXZ5KvJbo=
Message-ID: <dedbfc53-6e75-444e-a10e-f41cf60cb5f9@apertussolutions.com>
Date: Tue, 22 Oct 2024 20:19:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Simplify size calculations in move_memory()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241022223954.432554-1-andrew.cooper3@citrix.com>
 <20241022223954.432554-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241022223954.432554-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/22/24 18:39, Andrew Cooper wrote:
> While both src and dst are similar, src is mapped only accounting for src's
> size, while dst is mapped based on the minimum of both.  This means that in
> some cases, an overly large mapping is requested for src.
> 
> Rework the sz calcuation to be symmetric, and leave an explanation of how
> logic works.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

