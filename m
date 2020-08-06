Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2323DBE3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 18:36:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3isS-0000qm-7f; Thu, 06 Aug 2020 16:36:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3isR-0000qh-I7
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 16:36:23 +0000
X-Inumbo-ID: 62e90df1-a15b-4c69-a935-d05dd14dbb0e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62e90df1-a15b-4c69-a935-d05dd14dbb0e;
 Thu, 06 Aug 2020 16:36:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D2C4AC48;
 Thu,  6 Aug 2020 16:36:39 +0000 (UTC)
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72a81e28-7127-6589-d95d-b27b695b85da@suse.com>
Date: Thu, 6 Aug 2020 18:36:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 16:15, Trammell Hudson wrote:
> On Thursday, August 6, 2020 2:04 PM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.08.2020 13:44, Trammell Hudson wrote:
>>> On Thursday, August 6, 2020 9:57 AM, Jan Beulich jbeulich@suse.com wrote:
>>>> Overall I think it might help if this PE parsing code (if UEFI
>>>> doesn't offer a protocol to do it for us) was put into its own
>>>> source file.
>>>
>>> I tried to putting it into a separate file and ran into link issues,
>>> seems that it needs to be mentioned in both arch/x86/Makefile and
>>> arch/x86/pe/Makefile, so this was a "just make it work" for the PoC.
>>> Now that it is working, I'll go back to see if I can figure out the
>>> makefile magic.
>>
>> I was rather thinking of e.g. xen/common/efi/pe.c.
> 
> PE parsing code is in now in common/efi/pe.c, with a symlink in arch/x86/efi/,
> and I added an extern in common/efi/efi.h.  The Makefiles in both arch/x86 and
> arch/x86/efi required updates to link in the extra pe.init.o file.

Patches have already been submitted to hopefully make some or even
all of these extra adjustments unnecessary.

Jan

