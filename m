Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720C736694F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114394.218004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZADU-00022a-FK; Wed, 21 Apr 2021 10:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114394.218004; Wed, 21 Apr 2021 10:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZADU-00022B-BK; Wed, 21 Apr 2021 10:36:20 +0000
Received: by outflank-mailman (input) for mailman id 114394;
 Wed, 21 Apr 2021 10:36:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZADS-000226-6I
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:36:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e438796-268f-4b44-8cee-315d462c3121;
 Wed, 21 Apr 2021 10:36:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B216CACB1;
 Wed, 21 Apr 2021 10:36:16 +0000 (UTC)
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
X-Inumbo-ID: 3e438796-268f-4b44-8cee-315d462c3121
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619001376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRtTdLy6KPId+ddSf6hX71j/CX3Ghw0y6bpgKHA2taw=;
	b=L+7QL8g8eF6TC6G6U5tcC+ToS2XYgp4GOkq0+ZE65u3PLyF0MRow04DPE/+4+ms5hUU+g9
	g+yLTGjG2OCYYBu6GlSHwggrD9YTVYaI/ErQac6SXQjDgEtFkZr4nCXTAA6iA8G42ntfRa
	MgjKvEBoVD/6ruSdTbAn+dw97eE6PmM=
Subject: Re: [PATCH 3/8] x86/EFI: program headers are an ELF concept
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <017478f9-76d2-4dc4-de93-b662c4552968@suse.com>
 <YH/sLn+g/7wsZUDy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69abcc03-7ffc-10e2-0de3-26c6c84a6d26@suse.com>
Date: Wed, 21 Apr 2021 12:36:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH/sLn+g/7wsZUDy@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 11:11, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:45:09AM +0200, Jan Beulich wrote:
>> While they apparently do no harm when building xen.efi, their use is
>> potentially misleading. Conditionalize their use to be for just the ELF
>> binary we produce.
>>
>> No change to the resulting binaries.
> 
> The GNU Linker manual notes that program headers would be ignored when
> not generating an ELF file, so I'm not sure it's worth us adding more
> churn to the linker script to hide something that's already ignored by
> ld already.
> 
> Maybe adding a comment noting program headers are ignored when not
> generating an ELF output would be enough?

Maybe, but I'd prefer this to be explicit, and I'd prefer for efi.lds
to not have any PE-unrelated baggage. The churn by this patch isn't
all this significant, is it? In fact in two cases it actually deletes
meaningless stuff.

Jan

