Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ABD388BB3
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 12:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129990.243749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljJWw-0001bW-Tf; Wed, 19 May 2021 10:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129990.243749; Wed, 19 May 2021 10:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljJWw-0001Zf-Qi; Wed, 19 May 2021 10:34:22 +0000
Received: by outflank-mailman (input) for mailman id 129990;
 Wed, 19 May 2021 10:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljJWv-0001ZZ-6X
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 10:34:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06d505b5-5b02-450e-9744-2e2d97332b71;
 Wed, 19 May 2021 10:34:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDD8AAE63;
 Wed, 19 May 2021 10:34:18 +0000 (UTC)
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
X-Inumbo-ID: 06d505b5-5b02-450e-9744-2e2d97332b71
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621420458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqG/HsDt9WIQTMcyoH5Iz0kL/CFjqRbSI1L5G96TZ8o=;
	b=lODXIuJlR7w4TbHm8JzY0+5yDBFdmqkKsAqyormI0IxmRCvE/0K/3HXvVFtJSkjja3Ixym
	w6myFKOcUc/i8Zt9tB5VP6HlX733TeoegCaFTevSQyfFWH98tSeIUqocLfYBWOIW6F+gZM
	3J7i8a4Fh0tzrOD8YLq9EoLp6dVXg8I=
Subject: Re: [PATCH v2] libelf: improve PVH elfnote parsing
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210518144741.44395-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
Date: Wed, 19 May 2021 12:34:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518144741.44395-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 16:47, Roger Pau Monne wrote:
> @@ -425,8 +425,11 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>          return -1;
>      }
>  
> -    /* Initial guess for virt_base is 0 if it is not explicitly defined. */
> -    if ( parms->virt_base == UNSET_ADDR )
> +    /*
> +     * Initial guess for virt_base is 0 if it is not explicitly defined in the
> +     * PV case. For PVH virt_base is forced to 0 because paging is disabled.
> +     */
> +    if ( parms->virt_base == UNSET_ADDR || hvm )
>      {
>          parms->virt_base = 0;
>          elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",

This message is wrong now if hvm is true but parms->virt_base != UNSET_ADDR.
Best perhaps is to avoid emitting the message altogether when hvm is true.
(Since you'll be touching it anyway, perhaps a good opportunity to do away
with passing parms->virt_base to elf_msg(), and instead simply use a literal
zero.)

> @@ -441,8 +444,10 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>       *
>       * If we are using the modern ELF notes interface then the default
>       * is 0.
> +     *
> +     * For PVH this is forced to 0, as it's already a legacy option for PV.
>       */
> -    if ( parms->elf_paddr_offset == UNSET_ADDR )
> +    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
>      {
>          if ( parms->elf_note_start )

Don't you want "|| hvm" here as well, or alternatively suppress the
fallback to the __xen_guest section in the PVH case (near the end of
elf_xen_parse())?

>              parms->elf_paddr_offset = 0;

Similar remark as further up for the elf_msg() down below here.

Jan

