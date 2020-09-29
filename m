Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B927C301
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.27.121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDMg-0006km-Kq; Tue, 29 Sep 2020 11:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27.121; Tue, 29 Sep 2020 11:00:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDMg-0006kN-HI; Tue, 29 Sep 2020 11:00:10 +0000
Received: by outflank-mailman (input) for mailman id 27;
 Tue, 29 Sep 2020 11:00:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNDMf-0006kI-8B
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:00:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3401c1be-fd1d-43d5-9d79-a1551e381d97;
 Tue, 29 Sep 2020 11:00:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A401AB202;
 Tue, 29 Sep 2020 11:00:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNDMf-0006kI-8B
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:00:09 +0000
X-Inumbo-ID: 3401c1be-fd1d-43d5-9d79-a1551e381d97
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3401c1be-fd1d-43d5-9d79-a1551e381d97;
	Tue, 29 Sep 2020 11:00:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601377206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYRohR/tddK8sHnwEjvKcaUxPjjDFf7Ongh/WmyqQzE=;
	b=nlaFf7Q0qdHHcQtsqEYiUCB64ClUEvMSGBd690f/GPWO5/VVPRQlbCtjFpLue3uHlnDqb+
	rpoNcyqKTKYRUPgiN30ycr3OiKTXjiA5Ee+H8mIPA/arfp6FAOlE4Xl2qboPPzZ2sKn/L6
	hWa/eKdm9pU2Zj46AWk5lwo/iBx1ERI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A401AB202;
	Tue, 29 Sep 2020 11:00:06 +0000 (UTC)
Subject: Re: [PATCH v6 2/5] efi/boot.c: add file.need_to_free
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Trammell Hudson <hudson@trmm.net>, xen-devel@lists.xenproject.org
References: <20200921115113.1278655-1-hudson@trmm.net>
 <20200921115113.1278655-3-hudson@trmm.net>
 <20200929104545.GR19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db4fd689-4f91-8a1e-8f50-8e16af042516@suse.com>
Date: Tue, 29 Sep 2020 13:00:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929104545.GR19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.09.2020 12:45, Roger Pau Monné wrote:
> On Mon, Sep 21, 2020 at 07:51:10AM -0400, Trammell Hudson wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -102,6 +102,7 @@ union string {
>>  
>>  struct file {
>>      UINTN size;
>> +    bool need_to_free;
>>      union {
>>          EFI_PHYSICAL_ADDRESS addr;
>>          char *str;
>> @@ -280,13 +281,13 @@ void __init noreturn blexit(const CHAR16 *str)
>>      if ( !efi_bs )
>>          efi_arch_halt();
>>  
>> -    if ( cfg.addr )
>> +    if ( cfg.need_to_free )
> 
> If you drop the addr check here...
> 
>>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>> -    if ( kernel.addr )
>> +    if ( kernel.need_to_free )
>>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
>> -    if ( ramdisk.addr )
>> +    if ( ramdisk.need_to_free )
>>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
>> -    if ( xsm.addr )
>> +    if ( xsm.need_to_free )
>>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
>>  
>>      efi_arch_blexit();
>> @@ -581,6 +582,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>      }
>>      else
>>      {
>> +        file->need_to_free = true;
> 
> ... I think you need to clear need_to_free if AllocatePages fails?

But this has been moved to the success path, or am I overlooking
anything?

Jan

