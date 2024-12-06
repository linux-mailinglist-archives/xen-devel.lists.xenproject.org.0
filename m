Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB09E6EDF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 14:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850303.1264764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJY1e-00074W-IS; Fri, 06 Dec 2024 13:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850303.1264764; Fri, 06 Dec 2024 13:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJY1e-00072e-FO; Fri, 06 Dec 2024 13:05:42 +0000
Received: by outflank-mailman (input) for mailman id 850303;
 Fri, 06 Dec 2024 13:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQ+e=S7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tJY1c-00072T-TE
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 13:05:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c90d9514-b3d2-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 14:05:38 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733490333542143.7719942594082;
 Fri, 6 Dec 2024 05:05:33 -0800 (PST)
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
X-Inumbo-ID: c90d9514-b3d2-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733490335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KoaIfVbklUbOk7hw23ynvy17UZqkFvpy3WM8NGPjJ2WePiCRnYXox89EJVgCLnp2pmYJV5LnZ8+NU1iCOBBTw/CMZVj0ffEWzDH+Pm9qdcM6rIZ92rK14PfHOD27pYLiUANxSXHcIRUjkVoYPcE6TK4bPyPv/68JneO4YafvR3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733490335; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fJGFNkT53OGu1EkwfQiiz2VIKpzaEEezUdD09cwRUbE=; 
	b=XM376aTAvH3xh0YzZNLrstO3YWyQTBk5lTWcq3ocKUVLshXuhFL/EeUK8F9AHqnKvPovGq5IKnH4RggSVpfkO2Ozl5asecwLwRQedgGEsR0hCQI8E6wrCtR6EGXYikqjNKmGSF1vF4JBDzHqY7U/0wIcE4H4LKkiyhy8bTJ8JCg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733490335;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fJGFNkT53OGu1EkwfQiiz2VIKpzaEEezUdD09cwRUbE=;
	b=rxq72BsQECD9oNl3U0nmgPe9RwlmLE+1SENOW2Dz05pkvy7nlgjjAafDXvZdkG5N
	cv6FvsltgMg/GuQx7AtUqGkezeo8pizTSP/ZUMIWNlBjMZHQJ5sZwEli912E0RbwC+z
	jUd5oCC1KQbFbXtNWXBrc35gO+irM5ubfBwUh+Y8=
Message-ID: <c51f5fa5-b4cf-4e9c-b7ae-5e9f1dc61803@apertussolutions.com>
Date: Fri, 6 Dec 2024 08:05:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/xsm: make getdomaininfo xsm dummy checks more
 stringent
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-2-jgross@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241206130221.17773-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 12/6/24 08:02, Juergen Gross wrote:
> Today the dummy XSM privilege checks for getdomaininfo are less
> stringent than possible: they basically rely on the general
> sysctl/domctl entry check to do all tests and then do the test with
> the XSM_HOOK privilege, which is an "allow all" default.
> 
> Instead of XSM_HOOK use XSM_XS_PRIV, which is the privilege really
> wanted. Note that this test is still wider than the sysctl entry test,
> but there is now easy way to make both domctl and sysctl happy at the
> same time.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

