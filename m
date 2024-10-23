Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CA9AC8AF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 13:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824553.1238702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ZKI-00055O-OW; Wed, 23 Oct 2024 11:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824553.1238702; Wed, 23 Oct 2024 11:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ZKI-00053i-Lp; Wed, 23 Oct 2024 11:14:54 +0000
Received: by outflank-mailman (input) for mailman id 824553;
 Wed, 23 Oct 2024 11:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fY0y=RT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3ZKH-00053c-H5
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 11:14:53 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 049aaf42-9130-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 13:14:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172968208345942.37691336568332;
 Wed, 23 Oct 2024 04:14:43 -0700 (PDT)
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
X-Inumbo-ID: 049aaf42-9130-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729682086; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jmupLRxLRbD1/UnyR2KV3qmfaocWEJWYsrhixrP6e691yUqjfHLyP0nV9f1XoPX4lBdz/tvjC25gPxpsWs6qDMLS+D1X72N1qzz5a+Bh6D1hJSJdtBfQ3mRNXnIYg/STmGWM+IwM0ILsWWSTa3mb3HEKhqoP2f5XA51vvEkgMOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729682086; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IhMN/U3nPvWeA1i1OE6BARpNQkhbYcmV6s4X2ec+Ntc=; 
	b=WoThlcS7mHHyhABtJPHzbLJ66ExtBIamA5YJE8RQlchvG0iG0YBTzQtBcMcV1Htn/4tfBeA2MBSBvVkrS3h7sMVh27sz+Ri0C2f7xSm68Tim1+wiiBD1hY6MeDcC2c7VffAJckF5aM75NReCH0L4TOW2mX1jVmnEN+wPEvdZt0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729682086;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IhMN/U3nPvWeA1i1OE6BARpNQkhbYcmV6s4X2ec+Ntc=;
	b=jMyWqlnsOaKAiBoDVbsIScF3zW6JoBScwE9CupI3wqTm/Woj1YPFezSwlpRn3nbg
	yuB5BMjUBklGSj1JfzFqxm/583yIM6vueXxFM5W36HUIrSbckGTJwYhwmu4HIacDqMi
	fW2WkCI4twIhilgLzR4aBkhcRq4w9NQyDDIJugkE=
Message-ID: <ab77381e-7ded-424c-9ac1-7099db7291ac@apertussolutions.com>
Date: Wed, 23 Oct 2024 07:14:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: Add a temporary module_map pointer to
 boot_image
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023105756.641695-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241023105756.641695-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/23/24 06:57, Andrew Cooper wrote:
> ... in order to untangle parameter handling independently from other other
> logic changes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com

