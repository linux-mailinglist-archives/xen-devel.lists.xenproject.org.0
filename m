Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24629C8F5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 20:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13085.33655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXUgV-0001VN-9u; Tue, 27 Oct 2020 19:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13085.33655; Tue, 27 Oct 2020 19:31:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXUgV-0001Uy-6i; Tue, 27 Oct 2020 19:31:07 +0000
Received: by outflank-mailman (input) for mailman id 13085;
 Tue, 27 Oct 2020 19:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXUgT-0001Ut-FJ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:31:05 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 228fdc32-52d5-4ed5-bd28-1f4d7d8ff50f;
 Tue, 27 Oct 2020 19:31:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXUgT-0001Ut-FJ
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:31:05 +0000
X-Inumbo-ID: 228fdc32-52d5-4ed5-bd28-1f4d7d8ff50f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 228fdc32-52d5-4ed5-bd28-1f4d7d8ff50f;
	Tue, 27 Oct 2020 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603827063;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Zl/xKhDItIScI+KG1AgREzYTPuS7GYYGS4lHAOwb8/c=;
  b=a2G65Kix71UeTzmKzrytPAuV2xS7CKCf7h20u7xLQRhtMhsDBnP7cqn/
   isdAyeWFJkR7C8QYUHyyTzZiEVNMczDLPlHwvt/LglsN2Ew/QG9/vFkGG
   lN4nQoEXaE2Et31mFOKWEyOGwizsoePUrrKmE1gc81X9gz5VEMDR/zOF3
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nnxbZeJ9Zx4r/23DcmJ8Wo+jqjyuTLwQO7ko2iUYKdlQMGeNB4sG5Cuo3oH2/waJGBOLSsHQgf
 teioAt5wx/H9MHhx2J3IvJ8haASQ+or5eS4lWREvsH4n4Z03Chg6CzU7yi0ZfWEHbja2nlU7Uq
 TVgkXUdZLArMAOOVU0qFLIPw0R+sNRdHwFs48RYTTS16BGjPx7ePxx5Hv2UyTECXm831Ae0Smc
 UYH86IWcdiTMygBcG6NPHqm/6VxIJHrmTunWTmQHcGPX3HA3WsPDZ2CsUjg45acz4jsSrCtZVd
 FUQ=
X-SBRS: None
X-MesageID: 30991591
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,424,1596513600"; 
   d="scan'208";a="30991591"
Subject: Re: [PATCH] x86/svm: Merge hsa and host_vmcb to reduce memory
 overhead
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201026135043.15560-1-andrew.cooper3@citrix.com>
 <ec123127-786a-02e9-07dd-351f30b6a5b3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6acb623c-27bd-2d2d-c7c3-52c9ff1a1bf5@citrix.com>
Date: Tue, 27 Oct 2020 19:30:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec123127-786a-02e9-07dd-351f30b6a5b3@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 27/10/2020 15:24, Jan Beulich wrote:
> On 26.10.2020 14:50, Andrew Cooper wrote:
>> The format of the Host State Area is, and has always been, a VMCB.  It is
>> explicitly safe to put the host VMSAVE data in.
> Nit: The PM calls this "Host Save Area" or "Host State Save Area"
> afaics.
>
> I recall us discussing this option in the past, and not right
> away pursuing it because of it not having been explicit at the
> time. What place in the doc has made this explicit?

Sadly still not yet, but the pestering has happened.

> The main
> uncertainty (without any explicit statement) on my part would be
> the risk of VMSAVE writing (for performance reasons) e.g. full
> cache lines, i.e. more than exactly the bits holding the state
> to be saved, without first bringing old contents in from memory.

SEV-ES now requires the hypervisor to program desired exit state in in
the VMCB, due to differences in how the VMRUN instruction works.  See
Vol3 15.35.8.  (And yes - this does contradict the earlier statement in
that a the hypervisor must not write directly into the host state area).

I have had it confirmed by AMD that it is safe to use in this fashion,
but if you want more evidence, KVM has had this behaviour on AMD for its
entire lifetime.

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -72,11 +72,10 @@ static void svm_update_guest_efer(struct vcpu *);
>>  static struct hvm_function_table svm_function_table;
>>  
>>  /*
>> - * Physical addresses of the Host State Area (for hardware) and vmcb (for Xen)
>> - * which contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state when in
>> - * guest vcpu context.
>> + * Host State Area.  This area is used by the processor in non-root mode, and
>> + * contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state required to
>> + * leave guest vcpu context.
>>   */
>> -static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, hsa);
>>  static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, host_vmcb);
> The comment now applies to host_vmcb, so making the dual purpose
> more obvious would imo be helpful.

But it isn't dual purpose.  It *is* host state, both the half which
VMRUN deals with, and the half which VMLOAD/SAVE deals with (separately,
to optimise VMRUN).

I suppose technically it gets a little complicated with whose state
fs/gs/ldtr/gsbase actually is, given the PV VMLOAD-optimised path, but
the state relevant to Xen's security is tr/syscall/sysenter, which will
remain correct from the start of day.

~Andrew

