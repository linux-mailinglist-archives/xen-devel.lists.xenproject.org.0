Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE571EC0CB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 19:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgAVb-00037S-D5; Tue, 02 Jun 2020 17:15:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e/lv=7P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgAVa-00037N-8u
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 17:15:26 +0000
X-Inumbo-ID: a5a7906a-a4f4-11ea-8993-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5a7906a-a4f4-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 17:15:25 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 66j4nB9tX4MKCNNEx3k4bJt96of05gtniKtRPYJL+KSKT+5uUKDFbF2VJUyb4jQ1PHlR9x35Ci
 KuiAykyO9bxDXsjH9/otQn6p2wVnBq/cinzjJ4HY6ILxMbstXoiblqgMOUTfDhkH/3uDv6S+PA
 bJQG6cXMLJSq2mlyfJKvfP3oZcD+AwJXT8PK8I619db2BU1wg+qt4+S5o4SDj5u27WeO3wO0qf
 vQP7ImvLPJjxMvdPRsKuup5Zh1vlQRatzAVzJB0CQs/1GW7ECIqpAIl6GqQlElGUGZocJz6mUX
 4nk=
X-SBRS: 2.7
X-MesageID: 19338013
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,465,1583211600"; d="scan'208";a="19338013"
Subject: Re: Re [PATCH] x86/CET: Fix build following c/s 43b98e7190
To: Jan Beulich <jbeulich@suse.com>
References: <1eeb47f4-b9b9-c4d8-a5c9-58d78f0e0aeb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fa2a6ce5-7a15-6ac7-defd-ded1c229d642@citrix.com>
Date: Tue, 2 Jun 2020 18:15:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1eeb47f4-b9b9-c4d8-a5c9-58d78f0e0aeb@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/06/2020 15:21, Jan Beulich wrote:
>> OSSTest reports:
>>
>>   x86_64.S: Assembler messages:
>>   x86_64.S:57: Error: no such instruction: `setssbsy'
>>   /home/osstest/build.150510.build-amd64/xen/xen/Rules.mk:183: recipe for target 'head.o' failed
>>   make[4]: Leaving directory '/home/osstest/build.150510.build-amd64/xen/xen/arch/x86/boot'
>>   make[4]: *** [head.o] Error 1
>>
>> All use of CET instructions, even those inside alternative blocks, needs to be
>> behind CONFIG_XEN_SHSTK, as it indicates suitable toolchain support.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> That's quite a bit of #ifdef-ary here. Simple (operand-less) insns
> like SETSSBSY could easily be made available via .byte directives.
> Would you be amenable to to ack-ing a patch to replace some of the
> #ifdef-s (at least the ones at the lstar, cstar, and sysenter
> entry points), after 4.14?

Yeah - that was a bit of a mess in the end.  (But given the
circumstances, and that I've got past form typo'ing the SETSSBSY opcode,
it probably was the right move even in hindsight).

Reducing it to .byte should be fine so long as some form of /* setssbsy
*/ comment appears.

One other option would be to introduce a SETSSBSY macro, but that hides
the alternative so is something I'd prefer to avoid.

~Andrew

