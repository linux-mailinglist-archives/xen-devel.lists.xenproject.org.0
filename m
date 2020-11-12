Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3C2B06D9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 14:41:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25891.53946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCr5-00017J-1C; Thu, 12 Nov 2020 13:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25891.53946; Thu, 12 Nov 2020 13:41:39 +0000
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
	id 1kdCr4-00016u-UP; Thu, 12 Nov 2020 13:41:38 +0000
Received: by outflank-mailman (input) for mailman id 25891;
 Thu, 12 Nov 2020 13:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdCr3-00016p-Az
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:41:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd61a5ee-6676-45ca-8de2-cb0fb87b5c7b;
 Thu, 12 Nov 2020 13:41:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FE56AC24;
 Thu, 12 Nov 2020 13:41:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdCr3-00016p-Az
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:41:37 +0000
X-Inumbo-ID: fd61a5ee-6676-45ca-8de2-cb0fb87b5c7b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fd61a5ee-6676-45ca-8de2-cb0fb87b5c7b;
	Thu, 12 Nov 2020 13:41:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605188495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AM9QzQgPmffwaOjJxFI2fBbpKVpn4w0ommto6Vsjcqs=;
	b=ax1ctZo76K0jsQtaJ4ZoomnLLTRcg9z8KZWAcoYzVcwvG3CeORNl3q7HXr9CuLzklaSIrd
	80F67TsFPuQZjQDZLB4tnlO4mJ0VfU8owmGg6k1W44/EBPDXumMxFpluF3P/E0YaWBDjMN
	ASgzXZQSuoFeCxCJCFmqPb1xxUBd+Cg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5FE56AC24;
	Thu, 12 Nov 2020 13:41:35 +0000 (UTC)
Subject: Re: [PATCH v5 1/3] xen/x86: add nmi continuation framework
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201112131424.9930-1-jgross@suse.com>
 <20201112131424.9930-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f266e1fe-21fe-a44c-d8b1-94d89813f42f@suse.com>
Date: Thu, 12 Nov 2020 14:41:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201112131424.9930-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.11.2020 14:14, Juergen Gross wrote:
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -89,6 +89,7 @@ static unsigned int cpu_mask_to_apicid_x2apic_cluster(const cpumask_t *cpumask)
>  
>  static void send_IPI_self_x2apic(uint8_t vector)
>  {
> +    /* NMI continuation handling relies on using a shorthand here. */
>      apic_wrmsr(APIC_SELF_IPI, vector);
>  }

I'm inclined to drop this hunk again - I did ask for ...

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -163,6 +163,7 @@ void send_IPI_self(int vector)
>  
>  void send_IPI_self_legacy(uint8_t vector)
>  {
> +    /* NMI continuation handling relies on using a shorthand here. */
>      send_IPI_shortcut(APIC_DEST_SELF, vector, APIC_DEST_PHYSICAL);
>  }

... this one only simply because x2APIC doesn't have the same restriction.

Jan

