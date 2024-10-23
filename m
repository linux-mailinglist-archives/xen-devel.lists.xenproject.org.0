Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3F9ABA6C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 02:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824332.1238449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3OzM-0000JE-Ni; Wed, 23 Oct 2024 00:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824332.1238449; Wed, 23 Oct 2024 00:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3OzM-0000H9-Jy; Wed, 23 Oct 2024 00:12:36 +0000
Received: by outflank-mailman (input) for mailman id 824332;
 Wed, 23 Oct 2024 00:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3OzK-0000H3-7a
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 00:12:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df73556-90d3-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 02:12:31 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729642344178635.8682470555151;
 Tue, 22 Oct 2024 17:12:24 -0700 (PDT)
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
X-Inumbo-ID: 7df73556-90d3-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729642345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=laeEHhkjPLgJrZZhUMVzsnHW8L59Cyj23ipLefSOFQ2o1T4Sq9ndmeV4X/mbP+8xtDVdfXKlbxHsOOBTtmBVW0DGnmnxpJ72xqeX4bFyky59nLhir+gQ+vKBYQCCbvG0Hq+U0BwCj6ExDQ1xZVXl/Evy6xR/0w6t+IzNP1qwrIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729642345; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vxb4Llf6gvL7ZFvjwjCMx+vj0rU5C4YZsyTw95Kv9q8=; 
	b=QiUXRGCDiS940u3305JLcLrIE5bY5YXt/mKVLR7Lmw4jVSiPFB1J64/8C/ApbKAQos8r34nK/HN64uulaMFaALmKtoCPuyQe8HpkO3LC/DIwRukCpW2rv10Jk6hUSUE7ViARoBXIuGvBamVSdj6F6wK4oCGY2sPj0EqoJUi2yGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729642345;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Vxb4Llf6gvL7ZFvjwjCMx+vj0rU5C4YZsyTw95Kv9q8=;
	b=A2nWVjlY278mmZ0Tk8txT513p1XhU/YXPFBEL4f/oczKkT24tUrPRjgBJVe84Cv1
	Cv0kqyQG161TtKxVyGR+GDfAyUCGBz9oJ7TI35yne6lJOfUBPdjcmntu9Cycpq7il8a
	dJcHBQteHeCwrcN/57700Ridc8z3vipXyO3GWqzw=
Message-ID: <0d708e2d-ad7f-46e7-a97e-7e5e70a1d628@apertussolutions.com>
Date: Tue, 22 Oct 2024 20:12:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: Convert move_memory() to use
 bootstrap_map_addr()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241022223954.432554-1-andrew.cooper3@citrix.com>
 <20241022223954.432554-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241022223954.432554-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/22/24 18:39, Andrew Cooper wrote:
> move_memory() is very complicated, and buggy.  In order to fix the latter, we
> have to address the former.
> 
> Given prior cleanup, bootstrap_map() is now implemented in terms of
> bootstrap_map_addr(), meaining that it is counterproductive to plumb the
> mapping through module_t.
> 
> Delete mod, and introduce two same-sized/named fields.  At this point in boot,
> neither fields have their named purpose, so indicate the purpose in comments.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

