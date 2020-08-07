Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0C423EA6A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 11:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3yle-0004X0-VH; Fri, 07 Aug 2020 09:34:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3yld-0004Ws-VD
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 09:34:25 +0000
X-Inumbo-ID: 337ec982-9bc0-4759-bae4-36d08e5a3d1d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 337ec982-9bc0-4759-bae4-36d08e5a3d1d;
 Fri, 07 Aug 2020 09:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFC0FAC55;
 Fri,  7 Aug 2020 09:34:40 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86: slightly re-arrange 32-bit handling in
 dom0_construct_pv()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <0972ea3c-c2a8-b0f4-ae25-132bdb798f6a@suse.com>
 <0217c386-e93e-2f07-f2ac-9e683c14541a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de143c7d-c804-937a-31e3-2aa170e0ed26@suse.com>
Date: Fri, 7 Aug 2020 11:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0217c386-e93e-2f07-f2ac-9e683c14541a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 06.08.2020 16:04, Andrew Cooper wrote:
> On 06/08/2020 10:28, Jan Beulich wrote:
>> Add #ifdef-s (the 2nd one will be needed in particular, to guard the
>> uses of m2p_compat_vstart and HYPERVISOR_COMPAT_VIRT_START()) and fold
>> duplicate uses of elf_32bit().
>>
>> Also adjust what gets logged: Avoid "compat32" when support isn't built
>> in, and don't assume ELF class <> ELFCLASS64 means ELFCLASS32.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> although with some
> further suggestions.

Thanks.

>> @@ -357,27 +356,36 @@ int __init dom0_construct_pv(struct doma
>>          goto out;
>>  
>>      /* compatibility check */
>> +    printk(" Xen  kernel: 64-bit, lsb%s\n",
>> +           IS_ENABLED(CONFIG_PV32) ? ", compat32" : "");
> 
> Here, and below, we print out lsb/msb for the ELF file.  However, we
> don't use or check that it is actually lsb, and blindly assume that it is.
> 
> Why bother printing it then?

To be honest, I'd rather add a check than drop the printing.
However unlikely it may be to encounter an MSB ELF binary ...
This particular one I'd like to do in a separate, follow-on
patch though.

I've addressed the other comments in what I intend to commit.

Jan

