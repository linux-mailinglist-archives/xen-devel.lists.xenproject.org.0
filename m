Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC641F54FE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:38:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizys-0003ez-NA; Wed, 10 Jun 2020 12:37:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5j5l=7X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jizyq-0003eu-L9
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:37:20 +0000
X-Inumbo-ID: 1f646d88-ab17-11ea-b42b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f646d88-ab17-11ea-b42b-12813bfff9fa;
 Wed, 10 Jun 2020 12:37:19 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: g8wAK7A0sl8aOHTGZITnPC8/NtfSJXfBK+PTIi2S3+cxJ58PJirh0F4mIAUQqOZoRTPzwcnFkV
 Mi5YPSOk/WGsZ0VK7wS1ZrogzNCYHJA4xOPpwH/8tOexwgPze4kFEiIjsFuSa5eath6dDhm+kz
 MP5LZpib0QiqrCORSMJ+qjg2fTu6b3SHTA39v+2z6UddXDrGvzHpFd+eRZJII7iehgb07PXXYw
 YMddoKVBvlYoZTkvsIKEOhyBHQ6a+7H/lbCm9qmz1UDUurRclVFJ0Ywg7sUwLO9ixiS2OanIM/
 eH0=
X-SBRS: 2.7
X-MesageID: 19919216
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="19919216"
Subject: Re: [PATCH for-4.14 2/2] x86/passthrough: introduce a flag for GSIs
 not requiring an EOI or unmask
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200610115103.7592-1-roger.pau@citrix.com>
 <20200610115103.7592-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c70eef2d-d780-6d76-decb-e921cf6a570c@citrix.com>
Date: Wed, 10 Jun 2020 13:37:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610115103.7592-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10/06/2020 12:51, Roger Pau Monne wrote:
> @@ -920,6 +927,11 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
>          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
>          {
>              hvm_gsi_assert(d, pirq->pirq);
> +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
> +            {
> +                spin_unlock(&d->event_lock);
> +                return;
> +            }

Urgh.  Could I possibly talk you into fixing hvm_dirq_assist() to have a
"goto out;" and a single unlock path ?  (How far are you expecting this
to be backported?)

I'm also totally unconvinced that the atomic test_and_clear() needs to
be done with the event lock held (it should either be non-atomic, or the
locking should be inside the if() condition), but that is probably not a
can of worms wanting opening right now...

~Andrew

