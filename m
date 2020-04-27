Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5FD1BAEEB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 22:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTA5t-0000T7-U5; Mon, 27 Apr 2020 20:11:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTA5r-0000NF-Gp
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 20:11:07 +0000
X-Inumbo-ID: 3a104952-88c3-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a104952-88c3-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588018266;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zJF13uOfPS1k7La0Qt5UBmdfkp78c8eikm7xlXJNmjU=;
 b=WqpGT0xre9kkIZUFXuXqn+wEVg5I3hDhQzPLfXsYTJOXHkwuOVylIlGT
 ha6vg6jAyPPHwaM6y1ImqmINM8o9iBfYUoSwJP4WArt0NneJpdBix/qbs
 XnG9+NeKr8OQtPYImBmi7qrhc0Rfs0slDM5Wp6U6Z1bxdt9xBck4eZ7wr o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xurQuLw/TGb+EyvRba8dDpZ/Pb9+oDghvQ234hokG3xO+xRRNMuZ3vCQcfRXTQfiFeb8qERzFt
 mEdr+Arln/7MllOHJgTmYt8igkcZCmmuD/fnwI9fn6C8StQR9TqIzDBLafiAxc1Jvc3WivGnHH
 LvM2mJlzvP1VSwZ8qmnxkTfBGL4nJ7ltnPJVV5EQmgNJ4aU252mjW9KN7cQDUwQthAkdcJwUSh
 EgHjdTPdq/2evbAS9SdwIYjW5VAvJF6FwlQFEiu4NfQ9D+vnwiJK/k9yk9nFlguLU3qIFKxdB1
 X9Q=
X-SBRS: 2.7
X-MesageID: 16642720
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,325,1583211600"; d="scan'208";a="16642720"
Subject: Re: [PATCH] x86: refine guest_mode()
To: Jan Beulich <jbeulich@suse.com>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
 <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <16939982-3ccc-f848-0694-61b154dca89a@citrix.com>
Date: Mon, 27 Apr 2020 21:11:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/04/2020 16:15, Jan Beulich wrote:
> On 27.04.2020 16:35, Andrew Cooper wrote:
>> On 27/04/2020 09:03, Jan Beulich wrote:
>>> The 2nd of the assertions as well as the macro's return value have been
>>> assuming we're on the primary stack. While for most IST exceptions we
>>> eventually switch back to the main one,
>> "we switch to the main one when interrupting user mode".
>>
>> "eventually" isn't accurate as it is before we enter C.
> Right, will change.
>
>>> --- a/xen/include/asm-x86/regs.h
>>> +++ b/xen/include/asm-x86/regs.h
>>> @@ -10,9 +10,10 @@
>>>      /* Frame pointer must point into current CPU stack. */                    \
>>>      ASSERT(diff < STACK_SIZE);                                                \
>>>      /* If not a guest frame, it must be a hypervisor frame. */                \
>>> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
>>> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
>>> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
>>>      /* Return TRUE if it's a guest frame. */                                  \
>>> -    (diff == 0);                                                              \
>>> +    !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
>> The (diff == 0) already worried me before because it doesn't fail safe,
>> but this makes things more problematic.  Consider the case back when we
>> had __HYPERVISOR_CS32.
> Yes - if __HYPERVISOR_CS32 would ever have been to be used for
> anything, it would have needed checking for here.
>
>> Guest mode is strictly "(r)->cs & 3".
> As long as CS (a) gets properly saved (it's a "manual" step for
> SYSCALL/SYSRET as well as #VMEXIT) and (b) didn't get clobbered. I
> didn't write this code, I don't think, so I can only guess that
> there were intentions behind this along these lines.

Hmm - the VMExit case might be problematic here, due to the variability
in the poison used.

>
>> Everything else is expectations about how things ought to be laid out,
>> but for safety in release builds, the final judgement should not depend
>> on the expectations evaluating true.
> Well, I can switch to a purely CS.RPL based approach, as long as
> we're happy to live with the possible downside mentioned above.
> Of course this would then end up being a more intrusive change
> than originally intended ...

I'd certainly prefer to go for something which is more robust, even if
it is a larger change.

~Andrew

