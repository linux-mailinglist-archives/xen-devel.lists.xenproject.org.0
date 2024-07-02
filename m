Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8291F082
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 09:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752009.1160148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYIC-0007xl-VV; Tue, 02 Jul 2024 07:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752009.1160148; Tue, 02 Jul 2024 07:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYIC-0007vi-Ss; Tue, 02 Jul 2024 07:51:12 +0000
Received: by outflank-mailman (input) for mailman id 752009;
 Tue, 02 Jul 2024 07:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73HO=OC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sOYIB-0007vc-JE
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 07:51:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7e935e3-3847-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 09:51:09 +0200 (CEST)
Received: from [192.168.99.204] (unknown [91.85.33.231])
 by support.bugseng.com (Postfix) with ESMTPSA id 0F33C4EE0738;
 Tue,  2 Jul 2024 09:51:07 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d7e935e3-3847-11ef-a59d-41c015c667e1
Message-ID: <f4eb47f2-ba7e-4326-b2c3-5d1c97cadd5b@bugseng.com>
Date: Tue, 2 Jul 2024 09:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 07/12] x86/hvm: address violations of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com>
 <2c60ef16-e17c-48dd-911a-d1734aed6da5@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <2c60ef16-e17c-48dd-911a-d1734aed6da5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/24 10:47, Jan Beulich wrote:
> On 26.06.2024 11:28, Federico Serafini wrote:
>> @@ -2798,11 +2800,12 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>>           hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
>>           memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
>>                  hvio->mmio_insn_bytes);
>> +        fallthrough;
>>       }
>> -    /* Fall-through */
>>       default:
> 
> Can you clarify for me please whether this arrangement actually helps?
> I'm pretty sure it'll result in a Coverity complaint, as my understanding
> is that for them the marker (comment or pseudo-keyword) has to immediately
> precede the subsequent label. IOW even if you confirmed that Eclair is
> smarter in this regard, it may still need converting to
> 
>          hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
>          memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
>                 hvio->mmio_insn_bytes);
>      }
>          fallthrough;
>      default:
>

Yes, this is ok for ECLAIR.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

