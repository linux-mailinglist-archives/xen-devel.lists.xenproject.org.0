Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F252AF556
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25095.52685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcsJk-0002vT-J3; Wed, 11 Nov 2020 15:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25095.52685; Wed, 11 Nov 2020 15:45:52 +0000
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
	id 1kcsJk-0002v4-Fg; Wed, 11 Nov 2020 15:45:52 +0000
Received: by outflank-mailman (input) for mailman id 25095;
 Wed, 11 Nov 2020 15:45:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcsJj-0002uz-2M
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:45:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afb35e10-add8-453a-a9e0-eaf69e57f0d9;
 Wed, 11 Nov 2020 15:45:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 382BAABD1;
 Wed, 11 Nov 2020 15:45:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcsJj-0002uz-2M
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:45:51 +0000
X-Inumbo-ID: afb35e10-add8-453a-a9e0-eaf69e57f0d9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id afb35e10-add8-453a-a9e0-eaf69e57f0d9;
	Wed, 11 Nov 2020 15:45:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605109549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A0dqzBW+IYP4V9/iTL5/5jfwxtPBI0peAops5iyFIYQ=;
	b=MS1WrbXiAZsJDnFXJuqY7+LBxsoGXNqAX0IcqFZB2px1hEMKBmNzh+xpBayJXp1qxJDhju
	JI0F6izCHBsr+OThgbc7+k1F940r0JT63TRibGRO+DTitfnbooXr7ghLNqKSzUI1NJh0We
	seexAWMGt1nkzcuNmNEbpzX8S5ESBKo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 382BAABD1;
	Wed, 11 Nov 2020 15:45:49 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
Date: Wed, 11 Nov 2020 16:45:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109095021.9897-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 10:50, Juergen Gross wrote:
> @@ -83,14 +85,28 @@ void passive_domain_destroy(struct vcpu *v)
>  		model->free_msr(v);
>  }
>  
> +bool nmi_oprofile_send_virq(void)
> +{
> +	struct vcpu *v = this_cpu(nmi_cont_vcpu);
> +
> +	if ( v )
> +		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
> +
> +	this_cpu(nmi_cont_vcpu) = NULL;

What if, by the time we make it here, a 2nd NMI has arrived? I
agree the next overflow interrupt shouldn't arrive this
quickly, but I also think you want to zap the per-CPU variable
first here, and ...

> +
> +	return v;
> +}
> +
>  static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
>  {
>  	int xen_mode, ovf;
>  
>  	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
>  	xen_mode = ring_0(regs);
> -	if ( ovf && is_active(current->domain) && !xen_mode )
> -		send_guest_vcpu_virq(current, VIRQ_XENOPROF);
> +	if ( ovf && is_active(current->domain) && !xen_mode ) {
> +		this_cpu(nmi_cont_vcpu) = current;

... avoid overwriting any non-NULL value here. That's then of
course still not closing the window, but has (imo) overall
better behavior.

Also, style-wise, going through the file it looks to be mainly
Linux style, so may I suggest your additions / changes to be
done that way, rather than extending use of this funny mixed
style?

Jan

