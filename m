Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10A2D0F02
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46310.82192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEgk-0006oi-GG; Mon, 07 Dec 2020 11:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46310.82192; Mon, 07 Dec 2020 11:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEgk-0006oJ-Cm; Mon, 07 Dec 2020 11:28:18 +0000
Received: by outflank-mailman (input) for mailman id 46310;
 Mon, 07 Dec 2020 11:28:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GkbA=FL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kmEgi-0006oA-5C
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:28:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72399a42-644c-495a-aed7-9e6550c629e6;
 Mon, 07 Dec 2020 11:28:15 +0000 (UTC)
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
X-Inumbo-ID: 72399a42-644c-495a-aed7-9e6550c629e6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607340495;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+5kNau3vpeKkW10kWNfB4ErUzG8WO59WZ3vmdessr3M=;
  b=Yd2HwVGGaC11XbSBBG8puXVy/PxWMlOgWXjzyD1KKyiDUWEW8C2ihJWl
   hG1wuSwypUwJ0KmCJZkNeD/65WVqvgfxvbObWqSMRkbXTEYceKlRaOO9w
   VxASb5YhWc9Z/K0kvWDwMnXdwfEmgRPO/yRPJ4zMS+NTfu5QcVU512oGA
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9XZo+aEforIyXbvF0kaOBYHCESBRxC+4lfK1RnxK0tNfj/K8u/uwmkPyBAH1p9BdjOax5kaD4P
 331GquH4Rn75U/isjEeW52BroaiymlP80CyyHIcErWQ0dKIqzhTaS/z5s7vB+P4bPUaC8sctRx
 8G6AwhzqfUGdU7UL5HI7/oeAIzXIfIMZ4tJO8Zmrm/CYlkyDoz3Ua4ot3UCWB3O1cLK6xIUm5R
 fT792wqD9+n1FbQ6TlB0npPIRwkpAkNL+9wvfOmttcoBphn/67gG5fnzRsdrXtRE2Uv/dvXl02
 ufQ=
X-SBRS: 5.1
X-MesageID: 32665833
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,399,1599537600"; 
   d="scan'208";a="32665833"
Subject: Re: [PATCH v3 1/2] x86/IRQ: make max number of guests for a shared
 IRQ configurable
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
	<iwj@xenproject.org>, <julien@xen.org>, <sstabellini@kernel.org>,
	<wl@xen.org>, <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1607276587-19231-1-git-send-email-igor.druzhinin@citrix.com>
 <dc023b15-9e28-322c-aa86-165459e65d77@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7b5c1a4e-fef7-3534-c717-335c025ea6b6@citrix.com>
Date: Mon, 7 Dec 2020 11:28:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc023b15-9e28-322c-aa86-165459e65d77@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/12/2020 09:43, Jan Beulich wrote:
> On 06.12.2020 18:43, Igor Druzhinin wrote:
>> @@ -1633,11 +1640,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>>          goto retry;
>>      }
>>  
>> -    if ( action->nr_guests == IRQ_MAX_GUESTS )
>> +    if ( action->nr_guests == irq_max_guests )
>>      {
>> -        printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. "
>> -               "Already at max share.\n",
>> -               pirq->pirq, v->domain->domain_id);
>> +        printk(XENLOG_G_INFO
>> +               "Cannot bind IRQ%d to dom%pd: already at max share %u ",

I noticed it just now but could you also remove stray "dom" left in this line while commiting.

>> +               pirq->pirq, v->domain, irq_max_guests);
>> +        printk("(increase with irq-max-guests= option)\n");
> 
> Now two separate printk()s are definitely worse. Then putting the
> part of the format string inside the parentheses on a separate line
> would still be better (and perhaps a sensible compromise with the
> grep-ability desire).

Now I'm confused because you asked me not to split the format string between the lines which
wouldn't be possible without splitting printk's. I didn't really want to drop anything
informative.

> With suitable adjustments, which I'd be okay making while committing
> as long as you agree,

Yes, do with it whatever you see fit.

Igor

