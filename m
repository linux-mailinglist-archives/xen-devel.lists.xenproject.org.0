Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF2229576
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 11:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyBQR-00081Y-8Y; Wed, 22 Jul 2020 09:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyBQQ-00081T-3n
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 09:52:34 +0000
X-Inumbo-ID: 0f956672-cc01-11ea-8623-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f956672-cc01-11ea-8623-bc764e2007e4;
 Wed, 22 Jul 2020 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595411552;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=32/HzdDyda4+/2821/7cORIOl16CkvgJ3RaKlAC/9DM=;
 b=eu8VYf6K6WbS44KE8KkWk9k9njGhrFgL2WvxnQ5fd8JkxJMOPVLZZet0
 52hRo8z+gUs85fSTcUFrQQjYs0Kv0W5BHDhldjQU+SLmnl67WJjpkHwiV
 Yj86DMIiZXihoD2LYdmPsg3PIxj6YNs1roLd7Aki6iZiS4U9WU2Yuc7Gz o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lEf3Luoy6OykSDTxGeKIQyTWwn5iT5zWPdTPwiM4ebwvQPqJyOht4i/dTneeiToVqJbX+wrU4F
 SE55uaaqzFPwE9iVQ+zzK8wCBhr2yFr4k/+56+6D4HZiBD4p5kgGbJnvUsd1m0QhIT0G6sWxuo
 U8rx2W/mzTm5Lz6x5LFsV5okKyAuGsX5h+J36wkJcftRKVBpXsS4qHxT1d/9QmhId31FGii83U
 xAGi8UE+9Im097ad0MsM1GiiaF2/XbjAOrv7ImtWF1lMZ0gkKfHY4GwSkVngdNeW0eLNW7Gulj
 9tM=
X-SBRS: 2.7
X-MesageID: 23782057
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23782057"
Subject: Re: [PATCH] x86/svm: Fold nsvm_{wr,rd}msr() into
 svm_msr_{read,write}_intercept()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200721172208.12176-1-andrew.cooper3@citrix.com>
 <20200722092653.GV7191@Air-de-Roger>
 <d57ec557-3b6a-3571-3c63-08166e40af75@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6cec319-95d7-2389-16c8-570b7402055c@citrix.com>
Date: Wed, 22 Jul 2020 10:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d57ec557-3b6a-3571-3c63-08166e40af75@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/07/2020 10:34, Jan Beulich wrote:
> On 22.07.2020 11:26, Roger Pau Monné wrote:
>> On Tue, Jul 21, 2020 at 06:22:08PM +0100, Andrew Cooper wrote:
>>> @@ -2085,6 +2091,22 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>>              goto gpf;
>>>          break;
>>>  
>>> +    case MSR_K8_VM_CR:
>>> +        /* ignore write. handle all bits as read-only. */
>>> +        break;
>>> +
>>> +    case MSR_K8_VM_HSAVE_PA:
>>> +        if ( (msr_content & ~PAGE_MASK) || msr_content > 0xfd00000000ULL )
>> Regarding the address check, the PM states "the maximum supported
>> physical address for this implementation", but I don't seem to be able
>> to find where is this actually announced.
> I think you'd typically find this information in the BKDG or PPR only.
> The PM is generic, while the named two are specific to particular
> families or even just models.

Furthermore, the BKDG/PPR's are misleading/wrong.

For pre Fam17h, it is MAXPHYSADDR - 12G, which gives a limit lower than
0xfd00000000 on various SoC and embedded platforms.

On Fam17h, it is also lowered dynamically by how much memory encryption
is turned on (and therefore steals bits from the upper end of MAXPHYSADDR).


However, neither of these points are relevant in the slightest to
nested-svm because we don't ever map the HyperTransport range into
guests to start with - we'd get #PF[Rsvd] if we ever tried to use these
mappings.

Last time I presented this patch (nearly 2 years ago, and in the middle
of a series), it got very bogged down in a swamp of nested virt work,
which is why this time I've gone for no functional change, and punting
all the nested virt work to some future point where I've got time to
deal with it, and its not blocking the improvement wanted here.

~Andrew

