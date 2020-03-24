Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C4190CE7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:58:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGi9q-0002OL-Dx; Tue, 24 Mar 2020 11:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGi9o-0002OE-TK
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:55:44 +0000
X-Inumbo-ID: 62a7a936-6dc6-11ea-83da-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62a7a936-6dc6-11ea-83da-12813bfff9fa;
 Tue, 24 Mar 2020 11:55:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A615AAC52;
 Tue, 24 Mar 2020 11:55:40 +0000 (UTC)
To: Pu Wen <puwen@hygon.cn>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200324103726.3406-1-puwen@hygon.cn>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8547604a-3a65-8b3a-d442-0c89ea8c15c6@suse.com>
Date: Tue, 24 Mar 2020 12:55:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324103726.3406-1-puwen@hygon.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.2020 11:37, Pu Wen wrote:
> According to chapter "Appendix B Layout of VMCB" in the new version
> (v3.32) AMD64 APM[1], bit 1 of the VMCB offset 68h is defined as
> GUEST_INTERRUPT_MASK.
> 
> In current xen codes, it use whole u64 interrupt_shadow to setup
> interrupt shadow, which will misuse other bit in VMCB offset 68h
> as part of interrupt_shadow.
> 
> Add union intstat_t for VMCB offset 68h and fix codes to only use
> bit 0 as intr_shadow according to the new APM description.
> 
> Reference:
> [1] https://www.amd.com/system/files/TechDocs/24593.pdf
> 
> Signed-off-by: Pu Wen <puwen@hygon.cn>

Looks okay now to me (with one further nit, see below), but ...

> v1->v2:
>   - Copy the whole int_stat in nsvm_vmcb_prepare4vmrun() and
>     nsvm_vmcb_prepare4vmexit().

... in particular this part I'd prefer to wait a little to
whether Andrew or anyone else has a specific opinion one or
the other way.

> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
> @@ -316,6 +316,17 @@ typedef union
>      uint64_t raw;
>  } intinfo_t;
>  
> +typedef union
> +{
> +    struct
> +    {

Nit: The brace should be on the same line as "struct"; can be
taken care of while committing.

Jan

