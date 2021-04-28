Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330736D94C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 16:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119403.225873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkuh-0003eq-4X; Wed, 28 Apr 2021 14:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119403.225873; Wed, 28 Apr 2021 14:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkuh-0003eV-1K; Wed, 28 Apr 2021 14:11:39 +0000
Received: by outflank-mailman (input) for mailman id 119403;
 Wed, 28 Apr 2021 14:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbkue-0003eQ-TR
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 14:11:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50185ddb-13ca-4030-a196-a9e73423a793;
 Wed, 28 Apr 2021 14:11:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9ACEB195;
 Wed, 28 Apr 2021 14:11:34 +0000 (UTC)
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
X-Inumbo-ID: 50185ddb-13ca-4030-a196-a9e73423a793
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619619095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jF+yy4hFRh6bktEpd5I8Z5ZdHXSOdrEZkcW2+mFB2Vk=;
	b=oaAGtjuOjgQQth4VmmS23pH1zYQgb0cEptJxxXHT2ucgVhiPtxddoZ0Kw58rXsMDgC+8E3
	vq6y7avf8lJ7nEvyqmoGf6wLKzqWuvenixlzBbBgTrC4UxrWVb6WhKN+5iysxWnCQmFk08
	t8dmo/a85gtc6VsKj9gnfv8PBmQ8ThU=
Subject: Re: [PATCH v3 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <7b6651f10922571a10685dc7652fbce03b6b6e51.1619453100.git.rahul.singh@arm.com>
 <YIlBnQO+iuFFx2XO@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <976e133f-ee94-8a2a-bc50-ebed50e2bd71@suse.com>
Date: Wed, 28 Apr 2021 16:11:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIlBnQO+iuFFx2XO@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.04.2021 13:06, Roger Pau Monné wrote:
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

While a separate config option may be excessive, keying it to the
wrong one is not desirable imo. If we want to avoid having PCI_MSI,
then keeping respective bits guarded by X86 would look better to me.
I'm not convinced though that doing the separation properly right
away (see also the XSM changes in patch 2 which imo belong here)
isn't going to be better in the long run, and hence introducing
HAS_PCI_MSI right away isn't the way to go.

Jan

