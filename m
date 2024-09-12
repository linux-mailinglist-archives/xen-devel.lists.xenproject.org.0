Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DF976552
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797100.1206912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofwq-0003Fe-G8; Thu, 12 Sep 2024 09:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797100.1206912; Thu, 12 Sep 2024 09:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofwq-0003Cs-Co; Thu, 12 Sep 2024 09:17:08 +0000
Received: by outflank-mailman (input) for mailman id 797100;
 Thu, 12 Sep 2024 09:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBhH=QK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sofwn-0003CP-N9
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:17:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63ad2c9-70e7-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 11:17:04 +0200 (CEST)
Received: from [192.168.1.20] (host-79-37-206-90.retail.telecomitalia.it
 [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id D83C74EE0C9C;
 Thu, 12 Sep 2024 11:17:02 +0200 (CEST)
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
X-Inumbo-ID: c63ad2c9-70e7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1726132623; bh=LEzfii6fVboMfJ4btZRa62N606nNDNRXvjxThbN/fDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oEoYUb4iVfiF3vjWKV2ncCS/HPel7MfbZtoFECRYsHYHPYj99RbrI+V/oUAaMV6ZS
	 Qtt4NMSbGne3BleFM3eris0qpjnY2liWh93jTO7dSCVwGMDk+Xd8pKYqhZQF+m1TN7
	 XmWGznAfPprcvqCRBTIiHlkQtTcaRjwId54friN8vgj2WyJpKMHmkiW5CHLezDL02V
	 vIbY6uNWHp3A9ALIgYcKbf3ZL9fYS+SBE7csdsIisMANEnDW0vn1c+Lx81GRiF1XeD
	 bZorSgunMgQSFhG/STuV75uqqUcs7A6kJyBDaL97sqfVIZr5n+EczcXMzd2F40Ens0
	 yEO3YiP4RHjBg==
Message-ID: <6b1ca033-4a6d-4f69-aa6a-54dbcb37e79e@bugseng.com>
Date: Thu, 12 Sep 2024 11:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/12] x86/emul: address violations of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <0fa68b9aee5a7a3f1b696bfc6b18ecc826663212.1725958417.git.federico.serafini@bugseng.com>
 <1e6e2bb8-2a27-4cac-a888-7d785bc4c463@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1e6e2bb8-2a27-4cac-a888-7d785bc4c463@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/24 14:42, Jan Beulich wrote:
> On 10.09.2024 12:09, Federico Serafini wrote:
>> --- a/xen/arch/x86/x86_emulate/fpu.c
>> +++ b/xen/arch/x86/x86_emulate/fpu.c
>> @@ -218,6 +218,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>                */
>>               if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>>                   dst->type = OP_NONE;
>> +            break;
>>           }
>>           break;
>>   
>> @@ -296,6 +297,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>               default:
>>                   generate_exception(X86_EXC_UD);
>>               }
>> +            break;
>>           }
>>           break;
>>   
>> @@ -386,6 +388,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>                */
>>               if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>>                   dst->type = OP_NONE;
>> +            break;
>>           }
>>           break;
>>   
>> @@ -457,6 +460,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>               case 7: /* fistp m64i */
>>                   goto fpu_memdst64;
>>               }
>> +            break;
> 
> Aren't you swapping one violation for another here? Unlike in the earlier
> three cases, this new break is unreachable, because of the nature of the
> preceding switch() statement (cases being exhaustive and every case ending
> in "goto"; this is something even a static analyzer can [in principle]
> spot).

You are right, but the resulting violation of Rule 2.1
("A project shall not contain unreachable code") is deviated with the
following justification:
"The compiler implementation guarantees that the unreachable code is
removed. Constant expressions and unreachable branches of if and switch
statements are expected."

-- 
Federico Serafini,

Ph.D. Student, Ca' Foscari University of Venice
Software Engineer, BUGSENG

