Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99528CEBA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 14:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6186.16372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJmd-0008BP-Gj; Tue, 13 Oct 2020 12:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6186.16372; Tue, 13 Oct 2020 12:52:03 +0000
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
	id 1kSJmd-0008B0-DG; Tue, 13 Oct 2020 12:52:03 +0000
Received: by outflank-mailman (input) for mailman id 6186;
 Tue, 13 Oct 2020 12:52:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSJmc-0008Av-I4
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:52:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7961c51-38a8-466c-a632-84065a9c6205;
 Tue, 13 Oct 2020 12:52:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0488CAE7B;
 Tue, 13 Oct 2020 12:52:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSJmc-0008Av-I4
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:52:02 +0000
X-Inumbo-ID: c7961c51-38a8-466c-a632-84065a9c6205
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c7961c51-38a8-466c-a632-84065a9c6205;
	Tue, 13 Oct 2020 12:52:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602593520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unoNLWfC8HNoatAz24p8JS6+JTNlhu9nwsqgKZ9Mn68=;
	b=WXStj+u2lHUgRV/2JwAq1JEzPMwtAW6AlqxOwom29w9R68IA9KZdYpumO/q9vzYdar+Ph1
	WBirZgW6qwtnuCB4bD+/jGD0XA4geEnAqnJ4v1mtfr8fVOhVBpTMnS+RwxJvhnkTER+6ds
	2VeHUpwdPpKfcNYspmnPHIF1q1mVL9M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0488CAE7B;
	Tue, 13 Oct 2020 12:52:00 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI
 table region
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
Date: Tue, 13 Oct 2020 14:51:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 12:50, Igor Druzhinin wrote:
> ACPI specification contains statements describing memory marked with regular
> "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
> really do it if it wants kexec or similar functionality to work, there
> could still be ambiguities in treating these regions as potentially regular
> RAM.
> 
> One such an example is SeaBIOS which currently reports "ACPI data" regions as
> RAM to the guest in its e801 call. The guest then tries to use this region
> for initrd placement and gets stuck.

Any theory on why it would get stuck? Having read the thread rooting
at Sander's report, it hasn't become clear to me where the collision
there is. A consumer of E801 (rather than E820) intends to not use
ACPI data, and hence I consider SeaBIOS right in this regard (the
lack of considering holes is a problem, though).

> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -202,16 +202,17 @@ int build_e820_table(struct e820entry *e820,
>      nr++;
>  
>      /*
> -     * Mark populated reserved memory that contains ACPI tables as ACPI data.
> +     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
>       * That should help the guest to treat it correctly later: e.g. pass to
> -     * the next kernel on kexec or reclaim if necessary.
> +     * the next kernel on kexec and prevent space reclaim which is possible
> +     * with regular ACPI data type accoring to ACPI spec v6.3.

Preventing space reclaim is not the business of hvmloader. As per above,
an ACPI unaware OS ought to be permitted to use as ordinary RAM all the
space the tables occupy. Therefore at the very least the comment needs
to reflect that this preventing of space reclaim is a workaround, not
correct behavior.

Also as a nit: "according".

As a consequence I think we will also want to adjust Xen itself to
automatically disable ACPI when it ends up consuming E801 data. Or
alternatively we should consider dropping all E801-related code (as
being inapplicable to 64-bit systems).

Jan

