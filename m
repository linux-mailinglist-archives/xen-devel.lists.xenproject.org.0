Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C698DB8A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 16:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808831.1220879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw0Oe-0003DH-PE; Wed, 02 Oct 2024 14:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808831.1220879; Wed, 02 Oct 2024 14:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw0Oe-0003Az-MY; Wed, 02 Oct 2024 14:32:08 +0000
Received: by outflank-mailman (input) for mailman id 808831;
 Wed, 02 Oct 2024 14:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dTQ=Q6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sw0Od-0003Ar-32
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 14:32:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17098849-80cb-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 16:32:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727879517723838.4524839346197;
 Wed, 2 Oct 2024 07:31:57 -0700 (PDT)
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
X-Inumbo-ID: 17098849-80cb-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727879519; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yz+QYC9ymBwvZKj43kKwKFR9mbNoT6jw4xhPuxZ+7PRHbg5ph0fJ2oT9fzwgXzWOi4HeFO8/3RG+36ulndY6lvPe6JuSf5Mm8NwUIWchz7XlHs5GbKMO8bYgqkEpq252iSn1IS6pymnqsnEcrfWtXq6yHZfYG39ZVFrHQd4L1Es=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727879519; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i35ARlYwDuWmwyEfs1kR/M+7Lobwd15oia36lQLOm/s=; 
	b=OWLIacYWFnATDgU58ixgAocfdecVCsztsrbNdKyN6Uchqw/gSks66lafbOQ+JrhEVSZb2gd+rU/VioCs5ElYTiz6QBN+2XRLNgjRKIjYAeunkDSGOP9mKxwVJ5jKxFu+Utk1E2LcRaKYSITTMI2jmo3eriFVjwVgSphLN2fZl4k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727879519;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=i35ARlYwDuWmwyEfs1kR/M+7Lobwd15oia36lQLOm/s=;
	b=gii2Zt6lA1Rpgm9l3mYmlAOuvvCwqNCrk0BcdsyiArqR+iODiklEsK+s8lgC7O8J
	wmr326Tzfuaze9Ptd8QasB+g4mdCf1otl0J0h7aUb52+9j7ZnwA1rQukF4oudB5Yzva
	tzoVH64soLH+YObXvKstVedBlpoOk6kJzZzAn2Pk=
Message-ID: <1adbaea9-40b8-4cec-9871-599fde168925@apertussolutions.com>
Date: Wed, 2 Oct 2024 10:31:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <20241001102239.2609631-2-frediano.ziglio@cloud.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241001102239.2609631-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/1/24 06:22, Frediano Ziglio wrote:
> No need to have it coded in assembly.
> Declare efi_multiboot2 in a new header to reuse between implementations
> and caller.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I unfortunately do not have time to test this myself, but I have given a 
read through and it looks good to me. I will give it an R-b and let 
Marek provide the A-b when he is comfortable that CI failure is an 
artifact of the test system and not this series.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

