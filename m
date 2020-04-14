Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17D1A7F59
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 16:15:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOMLn-0005d7-Ba; Tue, 14 Apr 2020 14:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOMLl-0005d1-Nn
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 14:15:41 +0000
X-Inumbo-ID: 6b593e92-7e5a-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b593e92-7e5a-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586873741;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=toi2ILpAKOGqdr8dfDNwG7Ozbsl+wZRMnGDjIUos9ds=;
 b=e1rj0U8XUYAYSuu6eMrSRTlOquRP7IgzWLjl6taHIfGKO6yMuT+8+FYh
 2afazxRt6nQt5aH2TvZezn/T5bG3Sa1jJpXoY7xOyAgKF+NlAumWX8Xzn
 n65GOJHwGTOEvwCT67USzAHThaJecMQQ+4BqQsP/+CQK8MG7y5JPEQvI8 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mUZpEXlKUj31QTOmD2QAxAaDmZhgtYy3hUYcda62hDMV/pPiSexULhzIQF9S/bpJ83pOgrUizn
 92IAvCpR+gsMZwK2smeKlt1Xk6uMu5EiKNe1eaXWYPNA3rr7+/GOULHpL653DCWrPpIe16iihQ
 9r4jjEilD8F4WaFM35V1Iqan1l+RCb721cki2tKkRAd1IlTIRxfoVsskVAdang4Wf5UTODVcAN
 mrzmhZDTEpQaFpjBiPg6wM7acusTf8uVNJ6HlhUxqxr+uprgyafN/iAQjGYn7NpAOu9CWMh4i1
 Cmo=
X-SBRS: 2.7
X-MesageID: 15631685
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="15631685"
Subject: Re: [PATCH] x86/svm: Don't use vmcb->tlb_control as if it is a boolean
To: Jan Beulich <jbeulich@suse.com>
References: <20200414121429.10196-1-andrew.cooper3@citrix.com>
 <9c4e293d-1425-846f-1c52-91906f4e0d72@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <223c8116-4faf-2264-bc19-0e0de8b9ec9a@citrix.com>
Date: Tue, 14 Apr 2020 15:15:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9c4e293d-1425-846f-1c52-91906f4e0d72@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/04/2020 14:57, Jan Beulich wrote:
> On 14.04.2020 14:14, Andrew Cooper wrote:
>> @@ -44,19 +41,20 @@ void svm_asid_handle_vmrun(void)
>>      struct hvm_vcpu_asid *p_asid =
>>          nestedhvm_vcpu_in_guestmode(curr)
>>          ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
>> -    bool_t need_flush = hvm_asid_handle_vmenter(p_asid);
>> +    bool need_flush = hvm_asid_handle_vmenter(p_asid);
>>  
>>      /* ASID 0 indicates that ASIDs are disabled. */
>>      if ( p_asid->asid == 0 )
>>      {
>>          vmcb_set_guest_asid(vmcb, 1);
>> -        vmcb->tlb_control = 1;
>> +        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
> While there ought to be no difference in behavior, use of
> TLB_CTRL_FLUSH_ASID would seem more logical to me here. Other
> than below we're no after flushing all ASIDs in this case
> afaict.
>
> Question of course is - did early CPUs treat this as boolean,
> accepting any non-zero value to mean "flush all"?

The spec states "When the VMM sets the TLB_CONTROL field to 1, ...",
which is fairly clear on the matter.

> Preferably with such an adjustment

I'd prefer not to.  There is a good chance that your suggestion will
suffer a vmentry failure, or not flush anything on old hardware.

A change like that should be in its own patch, ideally with finding some
old enough hardware to verify.  I do not know if I have anything that
old to hand.  (Failing real hardware, some conformation from AMD about
how the CPU behaves).

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

