Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF17F996CE5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814562.1228141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXB0-0001uE-RR; Wed, 09 Oct 2024 13:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814562.1228141; Wed, 09 Oct 2024 13:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXB0-0001r3-OL; Wed, 09 Oct 2024 13:56:30 +0000
Received: by outflank-mailman (input) for mailman id 814562;
 Wed, 09 Oct 2024 13:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXAz-0001qx-Gr
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:56:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f58583-8646-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 15:56:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728482179976147.69608127703475;
 Wed, 9 Oct 2024 06:56:19 -0700 (PDT)
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
X-Inumbo-ID: 45f58583-8646-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728482182; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j9Xp3zD580+pKwZEUm8J/M/hCDZNxWP1d9Yj7IGZGsVEkGGG7GcL6NlTzzFVJbOSBLrnSqVhdZ9oe9xvDZDkZMz42FUSGc2LC2uys0PSP//Wa7sQI6HIpdfSQVLhwmoxGJbGMCACqSfoUmVAY2mz5vx+z+iesxkwQwhKRkF4874=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728482182; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=UUAbQ1oQRKVtCusz55NtGKctsR7mDu8o0ozNoJVqYGI=; 
	b=dQ7MlkBYCAwDOBujHaDd67PXlHP0m9CH8KpoFJhlUjpB1svWZJAn1XwZ1sPMGCf4SRyrtpA+MrGiXQeEua+P3fsWkGcRvWjnhzx3+t8pGKa5jRrFmtEs5EdFSfHnXQPDgbnEn/LztGBsaToGtR8N1jPY9S/9RkTEcOFABhEA/X0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728482182;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=UUAbQ1oQRKVtCusz55NtGKctsR7mDu8o0ozNoJVqYGI=;
	b=D/Qru4+E3RS4NwsTQJeOORxK6yF00e5pOW7nS96H0u0XbeFQgT4m2A10URwr3PBe
	RoyiWag40/zlplFX6F1uePcqU1T5sJUFbl1mw6JyIDWabMXpHyAXramAezNqCofzzna
	Ebz6r/hwuKpI16GcZtro2sMSow/VzOBl24LZ5vh4=
Message-ID: <7f51d67e-2670-4c41-8022-2604662839ba@apertussolutions.com>
Date: Wed, 9 Oct 2024 09:56:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] Flask: replace uses of __u32
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <868d803c-0a88-4080-99b1-68e6f8b92c25@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <868d803c-0a88-4080-99b1-68e6f8b92c25@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 05:23, Jan Beulich wrote:
> ... by uint32_t.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Uses of bool_val look suspicious; I looked at them because by its name
> I would have hoped I can switch it to bool instead.
> 
> --- a/xen/xsm/flask/ss/conditional.h
> +++ b/xen/xsm/flask/ss/conditional.h
> @@ -29,8 +29,8 @@ struct cond_expr {
>   #define COND_EQ        6 /* bool == bool */
>   #define COND_NEQ    7 /* bool != bool */
>   #define COND_LAST    COND_NEQ
> -    __u32 expr_type;
> -    __u32 bool_val;
> +    uint32_t expr_type;
> +    uint32_t bool_val;
>       struct cond_expr *next;
>   };
>   
> --- a/xen/xsm/flask/ss/policydb.h
> +++ b/xen/xsm/flask/ss/policydb.h
> @@ -131,7 +131,7 @@ struct range_trans {
>   
>   /* Boolean data type */
>   struct cond_bool_datum {
> -    __u32 value;        /* internal type value */
> +    uint32_t value;        /* internal type value */
>       int state;
>   };
>   

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


