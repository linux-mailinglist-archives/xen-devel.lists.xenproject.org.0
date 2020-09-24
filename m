Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21027782E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 20:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLVYr-0000aA-BO; Thu, 24 Sep 2020 18:01:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtQo=DB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kLVYq-0000a4-0d
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 18:01:40 +0000
X-Inumbo-ID: 6c00488b-6efc-4106-8bc3-080ff9c1e719
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c00488b-6efc-4106-8bc3-080ff9c1e719;
 Thu, 24 Sep 2020 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=q8KmCjUgjG7DT4K2YPDO90qgwkfcD+tCvEAiEGNDKg8=; b=hIQxchRYbpiy77xk9I/Og81MqD
 /P7j7aopgWVKP2rwd9idJqNooLZzZNTMJHky5XO/ycFeypdGJbQuA1zBFtXcV/xCMZo6NxGTW3Yd+
 TCArrzoEDDNdrXS/JKtbKhLIdEJ+bszjB2xGtQw1emjgLZ+ZDttpoWuFdVr+zbY5h1Xw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLVYd-00059D-8B; Thu, 24 Sep 2020 18:01:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLVYc-00066z-Sx; Thu, 24 Sep 2020 18:01:27 +0000
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org>
Date: Thu, 24 Sep 2020 19:01:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
> +static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
> +{
> +    unsigned int prev_state = STATE_IOREQ_NONE;
> +    unsigned int state = p->state;
> +    uint64_t data = ~0;
> +
> +    smp_rmb();
> +
> +    /*
> +     * The only reason we should see this condition be false is when an
> +     * emulator dying races with I/O being requested.
> +     */
> +    while ( likely(state != STATE_IOREQ_NONE) )
> +    {
> +        if ( unlikely(state < prev_state) )
> +        {
> +            gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u -> %u\n",
> +                     prev_state, state);
> +            sv->pending = false;
> +            domain_crash(sv->vcpu->domain);
> +            return false; /* bail */
> +        }
> +
> +        switch ( prev_state = state )
> +        {
> +        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
> +            p->state = STATE_IOREQ_NONE;
> +            data = p->data;
> +            break;
> +
> +        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
> +        case STATE_IOREQ_INPROCESS:
> +            wait_on_xen_event_channel(sv->ioreq_evtchn,
> +                                      ({ state = p->state;
> +                                         smp_rmb();
> +                                         state != prev_state; }));
> +            continue;

As I pointed out previously [1], this helper was implemented with the 
expectation that wait_on_xen_event_channel() will not return if the vCPU 
got rescheduled.

However, this assumption doesn't hold on Arm.

I can see two solution:
    1) Re-execute the caller
    2) Prevent an IOREQ to disappear until the loop finish.

@Paul any opinions?

Cheers,

[1] 
https://lore.kernel.org/xen-devel/6bfc3920-8f29-188c-cff4-2b99dabe166f@xen.org/


-- 
Julien Grall

