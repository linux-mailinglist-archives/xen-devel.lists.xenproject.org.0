Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257271A84C4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 18:26:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOOOE-00017R-7T; Tue, 14 Apr 2020 16:26:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOOOC-00017M-Sd
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 16:26:20 +0000
X-Inumbo-ID: abddaf4a-7e6c-11ea-8966-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abddaf4a-7e6c-11ea-8966-12813bfff9fa;
 Tue, 14 Apr 2020 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586881580;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=du4dLq7Ohce3WtFAWegYvi3R/5cSyNzhzKHfV7+9Tr4=;
 b=hdJQ56covh8yJRFbWzkN6BkK7L2DXCRUiemrB1b4/xqBF/JO9H4/4R5V
 6Hrl/duYZ8UHgYyH4q0ViM19pT07wE9yv33lljzYP+Ake6GkjMJeCcRum
 vsxW/RFi+QyJZUkGllFfOlbTJw9ag0nfzqc4mVLkX5jV2k1ZHw5ieWJ6w o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HpiWuVivxTMC4L8HmwfI2fD/Z+9oJVrK0SYKTNqbVMd/cFFrSICszrOXT+wwysnMAj57i/3BHs
 6teQO4IZL3hI/cziLfUneTKjLsBOeDaNNPn+mHjCbYNj3WoRKhAAGgWLjSGcuG64b4w35KTOer
 2OvZtBEO+LPB7B3WkWMbQfbAu1ydRtJ5KT/koJlHxVQhpOKJiM7q0AHHEOItm9oRt+DhXSC1KD
 oBfQ7IdYYu7BxIvqVYKerobfLxSetPQ/RD7R9EvC61R1XtvpmKHeFm2qppg7NnNLQKhQVAUmCW
 Fiw=
X-SBRS: 2.7
X-MesageID: 15898579
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,383,1580792400"; d="scan'208";a="15898579"
Subject: Re: [XEN PATCH v3] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Jan Beulich <jbeulich@suse.com>, Harsha Shamsundara Havanur
 <havanur@amazon.com>
References: <758e3427f147ed82774edcbbe80b0b29c812e6e4.1586862721.git.havanur@amazon.com>
 <3926fb02-2058-6e3a-6dcd-3ac5c4b97de5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5e86b2bc-2d79-3062-856b-c9babfcc5a16@citrix.com>
Date: Tue, 14 Apr 2020 17:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3926fb02-2058-6e3a-6dcd-3ac5c4b97de5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/04/2020 15:12, Jan Beulich wrote:
> On 14.04.2020 13:12, Harsha Shamsundara Havanur wrote:
>> It was observed that PCI MMIO and/or IO BARs were programmed with
>> memory and I/O decodes (bits 0 and 1 of PCI COMMAND register) enabled,
>> during PCI setup phase. This resulted in incorrect memory mapping as
>> soon as the lower half of the 64 bit bar is programmed.
>> This displaced any RAM mappings under 4G. After the
>> upper half is programmed PCI memory mapping is restored to its
>> intended high mem location, but the RAM displaced is not restored.
>> The OS then continues to boot and function until it tries to access
>> the displaced RAM at which point it suffers a page fault and crashes.
>>
>> This patch address the issue by deferring enablement of memory and
>> I/O decode in command register until all the resources, like interrupts
>> I/O and/or MMIO BARs for all the PCI device functions are programmed,
>> in the descending order of memory requested.
>>
>> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
>> Reviewed-by: Paul Durrant <pdurrant@amazon.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I have not acked this patch.  My comment on v1 was correctly your
mis-spelling of "Ack-by" for Paul's tag.  I apologise if that wasn't
terribly clear.

> You've fixed bugs, implying you need to drop tags covering the code
> which was fixed. As said on v2, imo you should have dropped the tags
> then already.
>
>> --- a/tools/firmware/hvmloader/pci.c
>> +++ b/tools/firmware/hvmloader/pci.c
>> @@ -84,6 +84,7 @@ void pci_setup(void)
>>      uint32_t vga_devfn = 256;
>>      uint16_t class, vendor_id, device_id;
>>      unsigned int bar, pin, link, isa_irq;
>> +    uint8_t pci_devfn_decode_type[256] = {};
> I'm still waiting for a reply on my v1 comment on the stack
> consumption of this, suggesting two 256-bit bitmaps instead.

256 bytes of stack space isn't something to worry about.  Definitely not
for the complexity of using bitmaps instead.

~Andrew

