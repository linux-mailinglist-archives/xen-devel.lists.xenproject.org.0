Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094E3CA3D5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156889.289477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4516-0001Ky-Oa; Thu, 15 Jul 2021 17:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156889.289477; Thu, 15 Jul 2021 17:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4516-0001I1-Kx; Thu, 15 Jul 2021 17:19:20 +0000
Received: by outflank-mailman (input) for mailman id 156889;
 Thu, 15 Jul 2021 17:19:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mdo=MH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m4514-0001Hn-IB
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:19:18 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8b6ed52-e590-11eb-8913-12813bfff9fa;
 Thu, 15 Jul 2021 17:19:17 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626369554200223.28140521744217;
 Thu, 15 Jul 2021 10:19:14 -0700 (PDT)
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
X-Inumbo-ID: c8b6ed52-e590-11eb-8913-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626369556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N8h6ciZg+sTV5DX3SXHN1Md+XrQsgQ/YBkI2/MEFA6dQQt8/2UYq6uOX2lr7nQ6UI1+AOlaUtZa9PJJndkFZWlAoxxGD0EQ30ExxSm2JAFLFYcV9gegcmdAy9ZADl81fzrsgZi76ypw2uDO4RD3G0KQAF7fA6N60aJ3eGT7O5bk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626369556; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fVo1nJ1YvKuJd/IrDlltGXYELoZuSAcfurvGDx+e6Do=; 
	b=mJ4rpb6gOFpDGFqQM8HySzSlTNx5HJQfwi+LdelrnhzTLApJqQyeZ5R1L7QiR044AoMYC+HC0qkkvb+NoSX4JaHCRDSG7c+DbzBTGPv1vR4VkygO0pmHaPXW09/YxubgeAW+MJNCiWda5s9Jmsqj+c8l1VdxiP3dtctsUKDQ4ts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626369556;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fVo1nJ1YvKuJd/IrDlltGXYELoZuSAcfurvGDx+e6Do=;
	b=LP+hbbe7q05VK+79zajOeRpCBlR9/EgfrcjEceIzijGXLDcqsTUuh5rOxWe4M60V
	jFAZLHNnkjoyKh4XO7QUkaktruZaKlzTHlGdXmyMYLWJorZYrH4QOHo2oJTXBP2KO8F
	zlpb5UaJ9heR7DTSEnieCihYtlw1ENud5JImJDQE=
Subject: Re: [PATCH v2 03/10] xsm: remove the ability to disable flask
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-4-dpsmith@apertussolutions.com>
 <c938e8fc-e0c7-412b-2285-0ec503f6828c@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <ae56c4b4-2f1c-ec9a-b022-30d41f841aee@apertussolutions.com>
Date: Thu, 15 Jul 2021 13:19:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c938e8fc-e0c7-412b-2285-0ec503f6828c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/14/21 11:58 AM, Jan Beulich wrote:
> On 12.07.2021 22:32, Daniel P. Smith wrote:
>> The flask XSM module provided the ability to switch from flask back to
>> the dummy XSM module during runtime. With this removal the only way to
>> switch between XSM modules is at boot time.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Can you please add a statement as to why you/we want this, perhaps
> helping clarify why apparently you think no-one is making use of
> this?

Yes, I can expand more on the why.

v/r
dps


