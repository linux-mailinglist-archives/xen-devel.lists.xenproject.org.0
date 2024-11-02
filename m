Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22559BA185
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829537.1244517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HLr-0007Vg-3Y; Sat, 02 Nov 2024 16:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829537.1244517; Sat, 02 Nov 2024 16:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HLr-0007Tg-0T; Sat, 02 Nov 2024 16:51:51 +0000
Received: by outflank-mailman (input) for mailman id 829537;
 Sat, 02 Nov 2024 16:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HLp-0007Ta-Jj
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:51:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be816e62-993a-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 17:51:47 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730566301270207.68241430009266;
 Sat, 2 Nov 2024 09:51:41 -0700 (PDT)
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
X-Inumbo-ID: be816e62-993a-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlODE2ZTYyLTk5M2EtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY2MzA3LjM3NjEzNywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730566303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CxoNgkRl/esMCHFaUPs6iTdQ42HFYo4aJizuEotBnBYpaIVA4NoYt1jFqK8LULVtyaN16mQVri3LkkcpvDqKOixBAlBQ+e9eHsDm04V5bx5fjAvPchpw+LBi3ossoER58IsUfXGsXFeWIB2+dwq9dEVCHtOtF3SxkuusvGif4tc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730566303; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VOL5fOcacaBF/uk3UOY/VDMzifJ5yz8EJ2MI1F0MqEE=; 
	b=LZCAhDRNSTZjWpBzdw9vPlp1GSl2M9Gdd1aSCjYvp2Z00q48JxN76IV1H60uHMCk1fgSN/yD6y7MbOqzEAhLfsV62X25q6MZunojnECUlVVTwKzmmT/alkqTOXoQw2PjcWSoJA5HoJVo3F3jcNW5s14cIF23jr/8imFCsqE/4ek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730566303;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VOL5fOcacaBF/uk3UOY/VDMzifJ5yz8EJ2MI1F0MqEE=;
	b=ETDCelcgtcqNJEf0o/d75hJAIjJ49bj5svT+qdeJ+SQc34XYxXHYcLSzWz0bwML6
	Pa+g5koLBR8tQ//XCGQd/npICbL9dPw/bICJ/RnFw2M/OlhtfV1C180RHn1bcwbepdT
	xZ7QryTCQbI704rCJ2jj5MOGdhQBr6y2j8H4ORZ8=
Message-ID: <2590fe4c-4f0b-47e0-a3a2-73e1b9c753d9@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:51:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] x86/ucode: Use bootstrap_unmap() in
 early_microcode_load()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-9-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> If bootstrap_map() has provided a mapping, we must free it when done.  Failing
> to do so may cause a spurious failure for unrelated logic later.
> 
> Inserting a bootstrap_unmap() here does not break the use of ucode_{blob,mod}
> any more than they already are.
> 
> Add a printk noting when we didn't find a microcode patch.  It's at debug
> level, because this is the expected case on AMD Client systems, and SDPs, but
> for people trying to figure out why microcode loading isn't work, it might be
> helpful.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

