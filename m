Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3651728D155
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6293.16757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMKW-0008TQ-Hh; Tue, 13 Oct 2020 15:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6293.16757; Tue, 13 Oct 2020 15:35:12 +0000
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
	id 1kSMKW-0008T0-EF; Tue, 13 Oct 2020 15:35:12 +0000
Received: by outflank-mailman (input) for mailman id 6293;
 Tue, 13 Oct 2020 15:35:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMKU-0008Sv-Ap
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:35:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24e32344-1552-474f-a4ea-68b28347f462;
 Tue, 13 Oct 2020 15:35:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE43BAD82;
 Tue, 13 Oct 2020 15:35:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMKU-0008Sv-Ap
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:35:10 +0000
X-Inumbo-ID: 24e32344-1552-474f-a4ea-68b28347f462
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 24e32344-1552-474f-a4ea-68b28347f462;
	Tue, 13 Oct 2020 15:35:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602603308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TI1G1wW1cp5DQ/cJivBeSTwYJfsSgssahb1Q8w2jMGQ=;
	b=m32Dm+kEhgE7MjIZuQ8rZz5qUhW36EJDuBNV75ZPP9x6N6sPwHwo8J2eQLqW/2VCPJRf5k
	yehhGrDHxElTJnK3JMU3KY/s33IH6Z2D73577UIgtFYenkc2mekokNV/++FTIWk49MCWy+
	fAQbDS/2dacAlloUNVPmYjrkkYGBEvo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AE43BAD82;
	Tue, 13 Oct 2020 15:35:08 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI
 table region
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
 <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
 <83f567a1-35f3-a227-830b-a59b53217f3b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad54c16b-c3b0-cff2-921f-b84a735d3149@suse.com>
Date: Tue, 13 Oct 2020 17:35:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <83f567a1-35f3-a227-830b-a59b53217f3b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 14:59, Igor Druzhinin wrote:
> On 13/10/2020 13:51, Jan Beulich wrote:
>> As a consequence I think we will also want to adjust Xen itself to
>> automatically disable ACPI when it ends up consuming E801 data. Or
>> alternatively we should consider dropping all E801-related code (as
>> being inapplicable to 64-bit systems).
> 
> I'm not following here. What Xen has to do with E801? It's a SeaBIOS implemented
> call that happened to be used by QEMU option ROM. We cannot drop it from there
> as it's part of BIOS spec.

Any ACPI aware OS has to use E820 (and nothing else). Hence our
own use of E801 should either be dropped, or lead to the
disabling of ACPI. Otherwise real firmware using logic similar
to SeaBIOS'es (but hopefully properly accounting for holes)
could make us use ACPI table space as normal RAM.

Jan

