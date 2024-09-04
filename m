Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E024E96B77B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789989.1199677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmj0-0002vF-CP; Wed, 04 Sep 2024 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789989.1199677; Wed, 04 Sep 2024 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmj0-0002tS-9f; Wed, 04 Sep 2024 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 789989;
 Wed, 04 Sep 2024 09:54:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eCC=QC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1slmiy-0002tK-2U
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:54:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8b251a5-6aa3-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 11:54:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1725443683607981.2517191210328;
 Wed, 4 Sep 2024 02:54:43 -0700 (PDT)
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
X-Inumbo-ID: b8b251a5-6aa3-11ef-a0b3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725443685; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P+9wHnQLVx2lwbc3FlM6b537hzaXZfUlKnSsazCTGjjHzaHQ6P60EdLAF/GHGbJWMERvLdx1kU82zyaniO5h2YLRsnZ8/smAN4lmSTGu573QhkGVYYYZNof/YOwOejKq1D+73pYPEo0GCY9X1teLwIL8idkyoT8suPTFSrH/+Sc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725443685; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/2GPNeOPkkZI9LfuVOX+kO5NQ2/0H6Uxpsn9lxbCups=; 
	b=Hw2/wE/OPnZViBDCVjkFtuzTESs8v6tJV5qjmlI/Hz72UhmzrVMluULmNO9JfN64OPwYiokttbgr0Q8Yn5yqNTQzfR6JC+NYcg+ESYHWG8PQ1ZiELjmttoZvaUL6UEhi7AN1ic5hGnuJqkSEywYZrh9kOdLV4XHLRJnrJP7A9r4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725443685;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/2GPNeOPkkZI9LfuVOX+kO5NQ2/0H6Uxpsn9lxbCups=;
	b=As/SGvrNkOBx56LhI/yWYVzdYcc600OPwwvQCmg0wIjzoQTv8qHOLqlqOIDzaZJe
	zzLobVNs6QPaIx+7Gey6cLHdU8SV89bZitcChtuxGhucTD3j47XOt+50ORFEBeenLWJ
	qvwRtoxRQk/SDfRBcAc0T8G8lkY1aG8ppeflHFio=
Message-ID: <b94a8805-1582-452a-a90f-5ad877ddc281@apertussolutions.com>
Date: Wed, 4 Sep 2024 05:54:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] SUPPORT.md: split XSM from Flask
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/14/24 03:44, Jan Beulich wrote:
> XSM is a generic framework, which in particular is also used by SILO.
> With this it can't really be experimental: Arm mandates SILO for having
> a security supported configuration.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

