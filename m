Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D8280ECA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 10:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1741.5300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGPJ-0008Eb-Ig; Fri, 02 Oct 2020 08:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1741.5300; Fri, 02 Oct 2020 08:27:13 +0000
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
	id 1kOGPJ-0008EC-FI; Fri, 02 Oct 2020 08:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1741;
 Fri, 02 Oct 2020 08:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOGPI-0008E7-8L
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:27:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b8d7f47-8287-4095-8da1-d4b62ee01b8e;
 Fri, 02 Oct 2020 08:27:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 989DBAF1A;
 Fri,  2 Oct 2020 08:27:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOGPI-0008E7-8L
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:27:12 +0000
X-Inumbo-ID: 6b8d7f47-8287-4095-8da1-d4b62ee01b8e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6b8d7f47-8287-4095-8da1-d4b62ee01b8e;
	Fri, 02 Oct 2020 08:27:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601627229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unyV64ypPcLYZl3kVcunweCkRWB8mM6GQ6rMWm8K83U=;
	b=Jx7Eu+gIsHAfaWRO1KGz/Arq5zMAF7tLSrIGhleO24npNNIhRKZlpb7kLExzegxcsW627X
	cTyQxX6OAI5R+Nun/atUevrjjYigSh+JrAJSv+plWCTqvqKayCdl3iVhgIJm/8H6PBcC9e
	Q6+KlHZ+O/o9IkO3VfRuovORkZ8C1VQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 989DBAF1A;
	Fri,  2 Oct 2020 08:27:09 +0000 (UTC)
Subject: Re: [PATCH v8 4/5] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200930120011.1622924-1-hudson@trmm.net>
 <20200930120011.1622924-5-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab61cb4b-bcbe-fb61-50d7-8d93bcfca4ab@suse.com>
Date: Fri, 2 Oct 2020 10:27:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930120011.1622924-5-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 14:00, Trammell Hudson wrote:
> @@ -1215,9 +1231,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);
>  
> -        /* Read and parse the config file. */
> -        if ( !cfg_file_name )
> +        if ( read_section(loaded_image, L"config", &cfg, NULL) )
> +            PrintStr(L"Using builtin config file\r\n");
> +        else if ( !cfg_file_name )
>          {
> +            /* Read and parse the config file. */

I'm sorry for noticing this only now, but I don't think this comment
should be moved. If no other need for a v9 arises, this can likely
be undone while committing.

> +static bool __init pe_name_compare(const struct PeSectionHeader *sect,
> +                                   const CHAR16 *name)
> +{
> +    size_t i;
> +
> +    if ( sect->Name[0] != '.' )
> +        return -1;

I was about to say "'true' please", but you really mean 'false"
now. (Could perhaps again be fixed while committing.)

> +    for ( i = 1; i < sizeof(sect->Name); i++ )
> +    {
> +        const char c = sect->Name[i];
> +        const CHAR16 cw = name[i - 1];
> +
> +        if ( cw == L'\0' && c == '\0' )
> +            return true;
> +        if ( cw != c )
> +            return false;

Just as a remark (and again spotting only now) this could be had
with one less comparison:

        if ( cw != c )
            return false;
        if ( c == '\0' )
            return true;

At which the need for cw also disappears.

With at least the earlier two issues addressed
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

