Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4560280F66
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1748.5338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGx7-0003Pe-Rm; Fri, 02 Oct 2020 09:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1748.5338; Fri, 02 Oct 2020 09:02:09 +0000
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
	id 1kOGx7-0003PF-Oc; Fri, 02 Oct 2020 09:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1748;
 Fri, 02 Oct 2020 09:02:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOGx7-0003PA-0d
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:02:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fa5360e-5821-48a5-bfd4-b3cc519f415e;
 Fri, 02 Oct 2020 09:02:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7026DACC8;
 Fri,  2 Oct 2020 09:02:06 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOGx7-0003PA-0d
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:02:09 +0000
X-Inumbo-ID: 8fa5360e-5821-48a5-bfd4-b3cc519f415e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8fa5360e-5821-48a5-bfd4-b3cc519f415e;
	Fri, 02 Oct 2020 09:02:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601629326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcjHckGbXllsqJReI+1aVcVLvulFVVHyn63H6SXle4o=;
	b=KIOsfnTzEf2OKnNS5GPoQPj6AaTziN+P1gz9PIjVIejJGgDplKy/uAaLVv3AHQFjbtr4aQ
	eI5YjVMLZvOBIdiWI6UQdHZcI4Qzrunb67iGK/rFVU2fczlJtygNKuQu8ZSM0SlhHx1s6B
	eqEt5MMugdyPOHdGLaewDNS5P8JKr60=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7026DACC8;
	Fri,  2 Oct 2020 09:02:06 +0000 (UTC)
Subject: Re: [PATCH v2 02/11] x86/hvm: drop domain parameter from vioapic/vpic
 EOI callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a30b4844-5d4c-c8d4-7f59-3ce3f51092cf@suse.com>
Date: Fri, 2 Oct 2020 11:02:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:40, Roger Pau Monne wrote:
> EOIs are always executed in guest vCPU context, so there's no reason to
> pass a domain parameter around as can be fetched from current->domain.

FAOD whether this is correct depends on what adjustments get made
to patch 1.

Jan

