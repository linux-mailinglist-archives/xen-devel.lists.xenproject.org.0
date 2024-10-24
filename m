Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25D9AEA08
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825425.1239659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zWl-0000Qi-In; Thu, 24 Oct 2024 15:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825425.1239659; Thu, 24 Oct 2024 15:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zWl-0000O3-Fl; Thu, 24 Oct 2024 15:13:31 +0000
Received: by outflank-mailman (input) for mailman id 825425;
 Thu, 24 Oct 2024 15:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3zWj-0000Nl-O9
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:13:29 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8535d19f-921a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 17:13:28 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729782800246265.8491526642981;
 Thu, 24 Oct 2024 08:13:20 -0700 (PDT)
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
X-Inumbo-ID: 8535d19f-921a-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729782803; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KVCaGVM6gfAtFJGk6o341+111LSkp6pVnGkGQ3G2txzd5hZPfP51MYXDqojMEf3cVf/+X3cmugzP963f2YQbjN2yti4kWvvDbPLEFfpispvoF+HK6D2yvPFknFD5Ubw7wbSGgQ+o2Uo/roTSgMDKNOuHse8Zu2PgZ4A+c4qAc+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729782803; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jMvXaUmT6cXQJX+jRN5BKMVFAuxlVwX/7AevePB+Hbk=; 
	b=ESbQmVOoAIMpjIH/fCJ08q7h2ZRI9dhAcZqfCYeoGqI3A+Hk2Dk2R9sQkma1IDm9geIHjy0FtlchEp/tGSS2jKvGxIPiwIGdegACqyItLdAuT4zks6R/RKgQKjWeCDZgoyeCdB4I3Ug7SE4NDo91UDHAHhmL0vS7hmbkfhfPC6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729782803;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jMvXaUmT6cXQJX+jRN5BKMVFAuxlVwX/7AevePB+Hbk=;
	b=tX/5nNaJRyoRZw2GO09JMEvHPwoRSnkb1EX5J8er8PAYwcjFhGheJtNPKPp2g/yt
	RC3DuSO6XAWhcVt5HpGc1rxZ2iOTg6e699GU9JuF92UMdWTF191ar9w4OYY5mX4eyA/
	tLIvAcnijUP0k9w2DfCF/GkyvXWEH2Qf6ATOAojg=
Message-ID: <1cdb4d71-a664-4fc0-a6b1-dd80ced2ba7f@apertussolutions.com>
Date: Thu, 24 Oct 2024 11:13:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/boot: Drop the mbi and mod pointers in
 __start_xen()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
 <20241024142654.989980-6-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241024142654.989980-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 10:26, Andrew Cooper wrote:
> We can't drop them fully yet, but we can limit their scope to almost nothing,
> which serves the same purpose.
> 
> This removes the ability to accidentally reintroduce buggy uses of
> __va(mbi->mods_addr).
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

