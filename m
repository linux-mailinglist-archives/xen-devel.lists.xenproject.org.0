Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424324FF8C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 16:07:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAD7L-0005rU-Sl; Mon, 24 Aug 2020 14:06:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAD7K-0005rP-UA
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 14:06:34 +0000
X-Inumbo-ID: b6c5d21b-226c-4317-b38e-b54fc9441f59
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6c5d21b-226c-4317-b38e-b54fc9441f59;
 Mon, 24 Aug 2020 14:06:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5450B163;
 Mon, 24 Aug 2020 14:07:02 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d3afbb2-a2a8-f570-6f59-fd3c3d56e6dd@suse.com>
Date: Mon, 24 Aug 2020 16:06:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812124709.4165-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 12.08.2020 14:47, Roger Pau Monne wrote:
> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> and instead use the newly introduced EOI callback mechanism in order
> to register a callback for MSI vectors injected from passed through
> devices.

In patch 2 you merely invoke the callback when the EOI arrived,
but you don't clear the callback (unless I've missed something).
Here you register the callback once per triggering of the IRQ,
without clearing it from the callback itself either. Why is it
correct / safe to keep the callback registered? What about
conflicting callbacks for shared vectors?

Jan

