Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE41FC22E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 01:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlKoJ-0002FD-IU; Tue, 16 Jun 2020 23:16:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlKoI-0002F8-DG
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 23:16:06 +0000
X-Inumbo-ID: 59ebe462-b027-11ea-8496-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59ebe462-b027-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 23:16:05 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gym42pItmyO0ZUFu8Ue22OFWIrI4UIHPpFbx58NlFP8USp74m+FVEfb3BT/lu1akLibRAzWJek
 nZPQLkTgpxh7n79oFZeL7Kq4ngTImjVjUXvMBddQD4arTUtzvyaIvWjngy6/ZOcsm7SYfdLygC
 VLZkIttEcRw6rXHtAXcx1zIn1Bh+3aGaC0JD7lD4sFIHCRT+1pLjSi9IfuXVyVYitURsu0dQ/g
 l1LsKhELV+zt0EemQJ835uiCL0IpHfL+DiE10xbQbpRx697cL0VaSpJuGEn7Plj8hyN/bXBhMl
 Bk8=
X-SBRS: 2.7
X-MesageID: 20450917
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,520,1583211600"; d="scan'208";a="20450917"
Subject: Re: [PATCH 2/2] xen/arm: Mitigate straight-line speculation for SMC
 call
To: Julien Grall <julien.grall.oss@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-3-julien@xen.org>
 <alpine.DEB.2.21.2006161425480.24982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0Wo2Vz=q-ApY-16p4xBnDckUhe73z9v4W4av7FmwMjKQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7b21fb8d-915c-7d87-1777-b0ed0febddd2@citrix.com>
Date: Wed, 17 Jun 2020 00:16:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a0Wo2Vz=q-ApY-16p4xBnDckUhe73z9v4W4av7FmwMjKQ@mail.gmail.com>
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
Cc: Paul Durrant <paul@xen.org>, Andre Przywara <Andre.Przywara@arm.com>,
 Julien Grall <jgrall@amazon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Xen.org security team" <security@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 22:57, Julien Grall wrote:
> On Tue, 16 Jun 2020 at 22:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> SMC call will update some of registers (typically only x0) depending on
>>   ^a SMC call

An SMC call.

>>
>>> the arguments provided.
>>>
>>> Some CPUs can speculate past a SMC instruction and potentially perform
>>> speculative access to emrmoy using the pre-call values before executing
>>                         ^ memory
>>
>>> the SMC.
>>>
>>> There is no known gadget available after the SMC call today. However
>>> some of the registers may contain values from the guest and are expected
>>> to be updated by the SMC call.
>>>
>>> In order to harden the code, it would be better to prevent straight-line
>>> speculation from an SMC. Architecturally executing the speculation
>>                    ^ a? any?
> "any" might be better.

"an SMC" is correct, but "any" is also fine.

'a' vs 'an' is based on the sound of the following.  S in "S-M-C" as an
abbreviation starts with an 'e' vowel sound, unlike 's' in secure, so
the correct grammar is "an SMC" and "a secure monitor call".

~Andrew

