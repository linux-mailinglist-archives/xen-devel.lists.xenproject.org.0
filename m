Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D730238A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 11:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73966.132933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3ytb-0006SJ-I0; Mon, 25 Jan 2021 10:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73966.132933; Mon, 25 Jan 2021 10:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3ytb-0006Rx-EK; Mon, 25 Jan 2021 10:14:55 +0000
Received: by outflank-mailman (input) for mailman id 73966;
 Mon, 25 Jan 2021 10:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3ytZ-0006Rs-Ky
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 10:14:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdf56319-27c7-46b4-a880-07497c865562;
 Mon, 25 Jan 2021 10:14:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2CA1B72E
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 10:14:50 +0000 (UTC)
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
X-Inumbo-ID: bdf56319-27c7-46b4-a880-07497c865562
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611569690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQB1LtH0N/b2Ws+lrYAknds177JizIISVrly1h3zePk=;
	b=CWYYDz8j1BSSVunSj0y+tgJ4OIox8CYb0TpQpRgGMjt9+2dzDyvnBzHLPd5iZkq2tJ5Uta
	+wveZgNs0qfc0vUxw/gWx2XEpfEv8CIjvmUveM7GSG/nAChpH1+nXNudm48I9vdKi2Zusn
	rgghmwprhYmNOQdO8daAuYczJXegGIU=
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <600d4d7f99bc3_241662b17c874cf6097f1@prd-scan-dashboard-0.mail>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dc2891b-8749-70b4-7dfa-b7e1f57f6b83@suse.com>
Date: Mon, 25 Jan 2021 11:14:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <600d4d7f99bc3_241662b17c874cf6097f1@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.01.2021 11:35, scan-admin@coverity.com wrote:
> *** CID 1472394:  Concurrent data access violations  (MISSING_LOCK)
> /xen/drivers/passthrough/x86/hvm.c: 1054 in pci_clean_dpci_irq()
> 1048         list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> 1049         {
> 1050             list_del(&digl->list);
> 1051             xfree(digl);
> 1052         }
> 1053         /* Note the pirq is now unbound. */
>>>>     CID 1472394:  Concurrent data access violations  (MISSING_LOCK)
>>>>     Accessing "pirq_dpci->flags" without holding lock "domain.event_lock". Elsewhere, "hvm_pirq_dpci.flags" is accessed with "domain.event_lock" held 10 out of 11 times.
> 1054         pirq_dpci->flags = 0;
> 1055     
> 1056         return pt_pirq_softirq_active(pirq_dpci) ? -ERESTART : 0;
> 1057     }

The only (indirect) caller of this function is ...

> 1059     int arch_pci_clean_pirqs(struct domain *d)

... this one, which very clearly acquires the lock in question.
Does anyone have any idea what misleads Coverity here in its
conclusion, and hence possibly what may silence this?

Jan

