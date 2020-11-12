Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BB2B01F3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 10:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25592.53454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8uq-0005XX-DB; Thu, 12 Nov 2020 09:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25592.53454; Thu, 12 Nov 2020 09:29:16 +0000
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
	id 1kd8uq-0005X8-9U; Thu, 12 Nov 2020 09:29:16 +0000
Received: by outflank-mailman (input) for mailman id 25592;
 Thu, 12 Nov 2020 09:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd8uo-0005X3-Ax
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:29:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8577514-23ea-4141-affe-e5f1acd462c2;
 Thu, 12 Nov 2020 09:29:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74D5AAB95;
 Thu, 12 Nov 2020 09:29:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd8uo-0005X3-Ax
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:29:14 +0000
X-Inumbo-ID: a8577514-23ea-4141-affe-e5f1acd462c2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a8577514-23ea-4141-affe-e5f1acd462c2;
	Thu, 12 Nov 2020 09:29:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605173352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Diy9BvmhrDv7viINU44D0LNZ6gMKAbC6xnj9rEMO5Mo=;
	b=FT7/AXFRfA/woCQ4yqc9muBOd3pT1bNqhq/gQGouyVG/Aa4FDPXMFym0+xlBjxXXqoyOTS
	Tw9WIpkxRxUJMKXh/P5R6y7j9NQ/+cS6r5inOsvvN9RLS7n62UYgDiqmQWiqXd1BJujBk+
	26uF038fRUZ5waq7A4AhzlPzH1NacRc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 74D5AAB95;
	Thu, 12 Nov 2020 09:29:12 +0000 (UTC)
Subject: Re: [PATCH v4 3/3] xen/x86: issue pci_serr error message via NMI
 continuation
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f660245-8b3b-fe8b-f4f9-66f59597042a@suse.com>
Date: Thu, 12 Nov 2020 10:29:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109095021.9897-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 10:50, Juergen Gross wrote:
> Instead of using a softirq pci_serr_error() can use NMI continuation
> for issuing an error message.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one minor change to be considered:

> @@ -1808,6 +1816,9 @@ bool nmi_check_continuation(void)
>      if ( nmi_oprofile_send_virq() )
>          ret = true;
>  
> +    if ( pci_serr_nmicont() )
> +        ret = true;
> +
>      return ret;
>  }

As the likely more important part, wouldn't it be better to insert
this ahead of the oprofile check?

Jan

