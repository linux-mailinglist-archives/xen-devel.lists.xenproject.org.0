Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517149DA9E9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 15:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844877.1260391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGJ8X-0007gJ-Cs; Wed, 27 Nov 2024 14:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844877.1260391; Wed, 27 Nov 2024 14:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGJ8X-0007eW-A7; Wed, 27 Nov 2024 14:35:25 +0000
Received: by outflank-mailman (input) for mailman id 844877;
 Wed, 27 Nov 2024 14:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NRnq=SW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tGJ8V-0007eM-J0
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 14:35:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d221c62d-accc-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 15:35:18 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732718111138749.7389414299095;
 Wed, 27 Nov 2024 06:35:11 -0800 (PST)
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
X-Inumbo-ID: d221c62d-accc-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQyMjFjNjJkLWFjY2MtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzE4MTE4LjcwOTE1MSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732718113; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ki3jTayrnCamit8rGkvav2J3iKdxGrHxJ1EBSwMLAM1FvVYjzWIZPCq8lvxyojmgCrCNVFyfiJndwnqnEyiYvqy1NEJObhgbydatx2ePx/Z+tNAr+oR3Lwiv0SWmhtSZiRH3prACp4clUqGk4WsgNkhCIPwnLpWqwIwahTLuVlU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732718113; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=P1He0xBsfX60X496o0JraSR1u0b5+Q6FTJSFfCG0i/s=; 
	b=KFbLYoOr8Pi+URbomTKaw7P5VWlNS7fLhtD7RCMOITc0CqCsgh7IjwRIxMwSL0XpMnWz8agSaQBdXzUK3kSUgByljUi0tjQUUtzTZvgxtH0uSBNVFcRPaF3BelNwOe5cMb+tWXgpEZL0YuxlCMEvgeWgjsvWttp9wyB8s5oqI2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732718113;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=P1He0xBsfX60X496o0JraSR1u0b5+Q6FTJSFfCG0i/s=;
	b=amvuIIUznXzg86V0+uwQz77+l3cPKTHNkj8sJSPscUESsqcw0g228NsBz5QU5EhW
	WweSIp5w0ww5FzdLZHNyGa3L/7XA6K4k/TpKe4/4Ow78hN0TGx7B3na+Q5O0VGGboa/
	8ZU9RzYvLQ70dWkXSv1+amg301d2tbJmQHyDObng=
Message-ID: <adf24a8c-9a40-4750-ad1a-49cf63542122@apertussolutions.com>
Date: Wed, 27 Nov 2024 09:35:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/36] xsm/flask: missing breaks, MISRA rule 16.4
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
 <20241126-vuart-ns8250-v1-v1-2-87b9a8375b7a@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-2-87b9a8375b7a@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/24 18:21, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> While working on console forwarding for virtual NS8250 I stepped into
>    flask_domain_alloc_security()
> where break statement was missing in default case which violates MISRA
> rule 16.4.
> 
> Fixed everywhere in hooks.c.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

