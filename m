Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC69AEA01
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825414.1239638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zVS-0007pb-1t; Thu, 24 Oct 2024 15:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825414.1239638; Thu, 24 Oct 2024 15:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zVR-0007o7-V8; Thu, 24 Oct 2024 15:12:09 +0000
Received: by outflank-mailman (input) for mailman id 825414;
 Thu, 24 Oct 2024 15:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3zVQ-0007nq-F0
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:12:08 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54c6ec02-921a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 17:12:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172978272180525.09226088286664;
 Thu, 24 Oct 2024 08:12:01 -0700 (PDT)
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
X-Inumbo-ID: 54c6ec02-921a-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729782722; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B3pQjV9Yaq0S9fQgbXqf4/x+b+nBHnYS0P0erR1Wgb1czr4TVbYSjAoBeG3G89JcpAw97n8j5eCNiIkfd8viB2eWnCUEtZX1aFrE3XoCHTh+5yg5AK/5puFDMtM0JJ0PaNiUbVVHUefW7QITxqVpkhxaZGmWh5uc9jOQ11QsoyE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729782722; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j6N9NOYOwBqmSEKJCC4oKh7dEB1KMeWpiyhMYwHhbSg=; 
	b=TvjywW+JbBG24m7+5Pdsn9G9zusvZcRuSdyccv4sNIu/6oFjqTtr47ILjQbu2f8gD9xhFwo8Xhk8Ef3JZIzDsZGWBZLFSP3IAyZsA+5ipfSUD2i54oxsgOmYlpMkavp9NjJgbChdMC5ERCO9VsZlJKmVjydnBUdn34A2WtJIlNA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729782722;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j6N9NOYOwBqmSEKJCC4oKh7dEB1KMeWpiyhMYwHhbSg=;
	b=OrDTcvm4+FLSU5Z1CJBFPoqEEMROTMubL7gXlQ5Ty18yePeSOBed3Mt7Ooxeggfs
	EDmOgEI9Tk3YPFoqXEmXMgZPdy1mYaUEC45nB4+BTr+Fcb8H90hCZDx9f+BE7eZ7ryy
	n8fW6pWB4vZdn5/p+kKvHYGWavjB0uB9W58//zSU=
Message-ID: <16e0efe6-4228-41e8-818c-bd8f367051e7@apertussolutions.com>
Date: Thu, 24 Oct 2024 11:12:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/boot: Introduce bootstrap_map_bm() to map
 boot_module's
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
 <20241024142654.989980-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241024142654.989980-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 10:26, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Convert converting the call to bzimage_headroom(), as well as using
> bi->mod[0].  It will be used externally by later changes.
> 
> No functional change.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

