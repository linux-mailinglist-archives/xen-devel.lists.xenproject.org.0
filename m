Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A05028FE5D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 08:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7778.20495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJJr-0005mT-HO; Fri, 16 Oct 2020 06:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7778.20495; Fri, 16 Oct 2020 06:34:27 +0000
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
	id 1kTJJr-0005m4-Dw; Fri, 16 Oct 2020 06:34:27 +0000
Received: by outflank-mailman (input) for mailman id 7778;
 Fri, 16 Oct 2020 06:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTJJp-0005ly-2l
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:34:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac51cd41-d605-47cc-94b0-057500150fd2;
 Fri, 16 Oct 2020 06:34:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BB33AAB2;
 Fri, 16 Oct 2020 06:34:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTJJp-0005ly-2l
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:34:25 +0000
X-Inumbo-ID: ac51cd41-d605-47cc-94b0-057500150fd2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ac51cd41-d605-47cc-94b0-057500150fd2;
	Fri, 16 Oct 2020 06:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602830062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBYcJbm6E2RUymANpskA8uW7qA08jhfAaNuFPo147lU=;
	b=HbMJv5Ccu9XcMMs1LKWXT7p394MbksH5RsyxwbngLpKmLK8j9nXA56E64KriFmhPe0g3Rq
	aRcIBJzHWTmU+1A7FzdoX4IPo9ZB90q92SZwyfobDKIgMNRENPgYthvg7Gpd6PtRZdyMRf
	WH+Uo+lpftFmWlLkyjPs7uik469HWJM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5BB33AAB2;
	Fri, 16 Oct 2020 06:34:22 +0000 (UTC)
Subject: Re: [PATCH v2] hvmloader: flip "ACPI data" to "ACPI NVS" type for
 ACPI table region
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1602808763-22396-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca9ba430-f5d8-f520-e7db-3e8d41cd7d9b@suse.com>
Date: Fri, 16 Oct 2020 08:34:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1602808763-22396-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 02:39, Igor Druzhinin wrote:
> ACPI specification contains statements describing memory marked with regular
> "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
> really do it if it wants kexec or similar functionality to work, there
> could still be ambiguities in treating these regions as potentially regular
> RAM.
> 
> One such example is SeaBIOS which currently reports "ACPI data" regions as
> RAM to the guest in its e801 call. Which it might have the right to do as any
> user of this is expected to be ACPI unaware. But a QEMU bootloader later seems
> to ignore that fact and is instead using e801 to find a place for initrd which
> causes the tables to be erased. While arguably QEMU bootloader or SeaBIOS need
> to be fixed / improved here, that is just one example of the potential problems
> from using a reclaimable memory type.
> 
> Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
> described by the spec as non-reclaimable (so cannot ever be treated like RAM).
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

