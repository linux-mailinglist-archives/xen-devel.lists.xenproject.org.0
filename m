Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4B36D987
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 16:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119415.225898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbl8k-0004nA-LL; Wed, 28 Apr 2021 14:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119415.225898; Wed, 28 Apr 2021 14:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbl8k-0004ml-I7; Wed, 28 Apr 2021 14:26:10 +0000
Received: by outflank-mailman (input) for mailman id 119415;
 Wed, 28 Apr 2021 14:26:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbl8j-0004mg-Bv
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 14:26:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbl8h-00077a-Cj; Wed, 28 Apr 2021 14:26:07 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbl8h-0007qZ-21; Wed, 28 Apr 2021 14:26:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=C90CyP+ruIQPPCv8QaI4mFnhpoGJnKM2i2JgHT7xgWw=; b=UBwnWcADh5TLGoCqoxe7layeZB
	elV4B7BWx0Wb0ieOie/uv52/To2Roh6/9SjttaLivir9cfwPgPXBoWwoBT9r2z6xY8U2b5iOeNwoi
	d/RbBDP21agp+KzEBryQFFa1cxqlSjqrBrHWzDPNjfyXstTAjTVi59jMg8ocan3bnwu8=;
Subject: Re: [PATCH v3 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <7b6651f10922571a10685dc7652fbce03b6b6e51.1619453100.git.rahul.singh@arm.com>
 <YIlBnQO+iuFFx2XO@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <a4ff0fba-2d33-64ff-2fbe-ba4f24cfc602@xen.org>
Date: Wed, 28 Apr 2021 15:26:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIlBnQO+iuFFx2XO@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/04/2021 12:06, Roger Pau Monné wrote:
> On Mon, Apr 26, 2021 at 05:21:27PM +0100, Rahul Singh wrote:
>> MSI code that implements MSI functionality to support MSI within XEN is
>> not usable on ARM. Move the code under CONFIG_PCI_MSI_INTERCEPT flag to
>> gate the code for ARM.
>>
>> Currently, we have no idea how MSI functionality will be supported for
>> other architecture therefore we have decided to move the code under
>> CONFIG_PCI_MSI_INTERCEPT. We know this is not the right flag to gate the
>> code but to avoid an extra flag we decided to use this.
>>
>> No functional change intended.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> I think this is fine, as we don't really want to add another Kconfig
> option (ie: CONFIG_PCI_MSI) for just the non explicitly intercept MSI
> code.

+1 This is code and therefore can be revisited once we have more data 
(e.g. a second arch that will re-use it).

> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

