Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846BC296A14
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 09:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10737.28632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVrEC-0005YS-Ix; Fri, 23 Oct 2020 07:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10737.28632; Fri, 23 Oct 2020 07:11:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVrEC-0005Y3-Fh; Fri, 23 Oct 2020 07:11:08 +0000
Received: by outflank-mailman (input) for mailman id 10737;
 Fri, 23 Oct 2020 07:11:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVrEB-0005Xw-4S
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 07:11:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecefa0d8-755c-445d-90dd-1f43bac4a5a6;
 Fri, 23 Oct 2020 07:11:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93C5BB246;
 Fri, 23 Oct 2020 07:11:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVrEB-0005Xw-4S
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 07:11:07 +0000
X-Inumbo-ID: ecefa0d8-755c-445d-90dd-1f43bac4a5a6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ecefa0d8-755c-445d-90dd-1f43bac4a5a6;
	Fri, 23 Oct 2020 07:11:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603437062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZAjmlGDA3SvkfoxF5aRJClLORKh8gMMBmV6zwTvsRM=;
	b=kIW3BijKz/tMkBL+GuyGDgu9DU8KZmAwYz2RjuNjvC3QwHxk6snZPwriL4mV6GrOGb+TU3
	Cs/ExDOrRuvKer9CgL09STasS84Eo2/KYlokYeyWTGLgQyXozAYfnNy28Sk+4MYcvNZWfg
	DxP9QzwOxSK32kyI3FUY6yR4ArYwQ8I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93C5BB246;
	Fri, 23 Oct 2020 07:11:02 +0000 (UTC)
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
 <930267bd-5442-3ff0-bb5b-1ed8e2ebe37c@xen.org>
 <20201022191840.GB81455@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e9ca63f-0202-7312-a095-48bf59e10a70@suse.com>
Date: Fri, 23 Oct 2020 09:11:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022191840.GB81455@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 21:18, Elliott Mitchell wrote:
> On Thu, Oct 22, 2020 at 07:44:26PM +0100, Julien Grall wrote:
>> Thank you for the patch. FIY I tweak a bit the commit title before 
>> committing.
>>
>> The title is now: "xen/arm: acpi: Don't fail it SPCR table is absent".
> 
> Perhaps "xen/arm: acpi: Don't fail on absent SPCR table"?
> 
> What you're suggesting doesn't read well to me.

Perhaps Julien meant "if" instead of "it". i.e. a simple typo?

Jan

