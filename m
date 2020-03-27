Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297C19525D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 08:54:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHjky-0007Z9-Gs; Fri, 27 Mar 2020 07:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xJX5=5M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHjkw-0007Z4-Ue
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 07:50:18 +0000
X-Inumbo-ID: 993127c6-6fff-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 993127c6-6fff-11ea-a6c1-bc764e2007e4;
 Fri, 27 Mar 2020 07:50:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2C95ACCE;
 Fri, 27 Mar 2020 07:50:13 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1585230270-24178-1-git-send-email-puwen@hygon.cn>
 <92973061-0063-11de-5d5b-eb663de90cce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df7cf0a9-7f1f-d618-1e93-6371ff5c7bef@suse.com>
Date: Fri, 27 Mar 2020 08:50:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <92973061-0063-11de-5d5b-eb663de90cce@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v3] SVM: Add union intstat_t for offset 68h
 in vmcb struct
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
Cc: Pu Wen <puwen@hygon.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 14:56, Andrew Cooper wrote:
> On 26/03/2020 13:44, Pu Wen wrote:
>> According to chapter "Appendix B Layout of VMCB" in the new version
>> (v3.32) AMD64 APM[1], bit 1 of the VMCB offset 68h is defined as
>> GUEST_INTERRUPT_MASK.
>>
>> In current xen codes, it use whole u64 interrupt_shadow to setup
>> interrupt shadow, which will misuse other bit in VMCB offset 68h
>> as part of interrupt_shadow, causing svm_get_interrupt_shadow() to
>> mistake the guest having interrupts enabled as being in an interrupt
>> shadow.  This has been observed to cause SeaBIOS to hang on boot.
>>
>> Add union intstat_t for VMCB offset 68h and fix codes to only use
>> bit 0 as intr_shadow according to the new APM description.
>>
>> Reference:
>> [1] https://www.amd.com/system/files/TechDocs/24593.pdf
>>
>> Signed-off-by: Pu Wen <puwen@hygon.cn>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Although thinking about it, renaming irq_stat to irq_state would
> probably be a good move.  I can fix this on commit - no need to send a v4.

Assuming you meant intstat -> intstate and int_stat -> int_state,
but in any event I don't think you've actually made the change
while committing.

Jan

