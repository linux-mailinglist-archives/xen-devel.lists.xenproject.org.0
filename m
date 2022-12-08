Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2610C6471E2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 15:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457214.715094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3I22-00073E-Ah; Thu, 08 Dec 2022 14:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457214.715094; Thu, 08 Dec 2022 14:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3I22-00070b-7h; Thu, 08 Dec 2022 14:37:50 +0000
Received: by outflank-mailman (input) for mailman id 457214;
 Thu, 08 Dec 2022 14:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nm3U=4G=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1p3I21-00070P-3h
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 14:37:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e15dc4e3-7705-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 15:37:47 +0100 (CET)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1670510259679275.94089091939793;
 Thu, 8 Dec 2022 06:37:39 -0800 (PST)
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
X-Inumbo-ID: e15dc4e3-7705-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; t=1670510262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CxX50lKZr1EuHEt8z9yIAfyfkobxTEcr2n1wnKuOfIX26fnTKle5HJP+thJIidTvZ3mXPdO/YdExLwOEoevkLFV2NrDc8u98S0WdkvblUZk94nNiN7ZtGQS+uxcFKZjIxq74D/ipPxfxODS1NEBNoRrYrFJHDwH3TiYnghnRbzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670510262; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=h28PH3SivYi1nEcbXtVQMxx4cEMNHT5Jco8sKuWi9ZM=; 
	b=lbZSJn3ZbXQT7Dr6qQ7iTW89k5dZSfiasgytr3h9Oxnnz/cgvMpjRG4ly/0bUMKEzPCD5s7UzO6NMmNjyk/83E5bi2BtsYTUHjth4H4PIxFryioI7kJZJESNLBLn8+NAdEHKpqTg9G2r+u2zPr/y7Z5h6JSCgOuyj602s1+4C3A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670510262;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h28PH3SivYi1nEcbXtVQMxx4cEMNHT5Jco8sKuWi9ZM=;
	b=liO636dI6RLQ4/rcy2AdR0wAKh50W6LEdxsYbFyPfd2XNiqwztCyrgpTLEc5cVRC
	G2BWNLiys37oRX0fUUHD0FSDTuK+VaXjuss7t1/sHxYDAbiyLls2JWk+SHXnQoABtpN
	8XLm18PFAATluyayLWid6ohbisyZ5qq1AjD6A+N4=
Message-ID: <27c4329c-4161-d259-58fc-a05e52dd6fe1@apertussolutions.com>
Date: Thu, 8 Dec 2022 09:37:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] xsm/flask: misra rule 8.4 fix
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2212071519340.4039@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2212071519340.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/7/22 18:24, Stefano Stabellini wrote:
> Fix several MISRA Issues Rule 8.4 ("A compatible declaration shall be
> visible when an object or function with external linkage is defined")
> found by cppcheck affecting xen/xsm/flask.
> 
> - policydb_loaded_version is not declared; removed it because it is
>    unused
> - move ss_initialized declaration to xen/xsm/flask/include/conditional.h
> - #include <conditional.h> (which is
>    xen/xsm/flask/include/conditional.h) in xen/xsm/flask/ss/policydb.c so
>    that policydb.c also gets the declaration of ss_initialized
> - #include <conditional.h> in xen/xsm/flask/ss/services.c to declare
>    security_*_bools functions that services.c is defining and using
> 
> This patch solves all the Rule 8.4 violations found by cppcheck on xsm/
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 

Ack-by: Daniel P. Smith <dpsmith@apertussolutions.com>

