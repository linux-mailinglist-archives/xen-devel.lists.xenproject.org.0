Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1D38ADAC
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130910.244952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhTq-0003Qi-TG; Thu, 20 May 2021 12:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130910.244952; Thu, 20 May 2021 12:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhTq-0003Om-Pv; Thu, 20 May 2021 12:08:46 +0000
Received: by outflank-mailman (input) for mailman id 130910;
 Thu, 20 May 2021 12:08:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljhTp-0003Og-Nu
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:08:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f416f45-3d21-43a2-88d9-7483e49946d1;
 Thu, 20 May 2021 12:08:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45DBAABE8;
 Thu, 20 May 2021 12:08:44 +0000 (UTC)
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
X-Inumbo-ID: 7f416f45-3d21-43a2-88d9-7483e49946d1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621512524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJwQA4crkqD3kpXr035U2mAeY7TyM9BRVy0f7OQl3nM=;
	b=hsPI4l3dGClF8r3amtykNlYxaqFn9NNdZ6zzdflGj5vmLZYnjchXYRU5l76ruFdJvEgsqa
	/oeacMYK+J+DPscHt63cKtK0ZzMiydz9bGL8BcRcyibdEdx+vsqDx78CaLHjC+xgVCRp4E
	zZPUm4s+gs7i0GsSVMbb6qlQYF5cG+4=
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
Date: Thu, 20 May 2021 14:08:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.05.2021 13:57, Juergen Gross wrote:
> On 20.05.21 13:42, Jan Beulich wrote:
>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
>> For this to work when NX is not available, x86_configure_nx() needs to
>> be called first.
>>
>> Reported-by: Olaf Hering <olaf@aepfle.de>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks. I guess I forgot

Cc: stable@vger.kernel.org

If you agree, can you please add this before pushing to Linus?

Jan

