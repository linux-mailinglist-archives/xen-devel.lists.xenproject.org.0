Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65D1B266A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:41:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQsCt-0002gu-OU; Tue, 21 Apr 2020 12:40:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BlT=6F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQsCs-0002gp-4P
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:40:54 +0000
X-Inumbo-ID: 5641f63e-83cd-11ea-9133-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5641f63e-83cd-11ea-9133-12813bfff9fa;
 Tue, 21 Apr 2020 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587472854;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jlxUicnZ98dspp8RLOm5cBjgiezSey5iTAiuQxl5Y5Y=;
 b=LMlsDkmZ5PMQa8neXQGOcSIIMNt5QWaYKG0p700k6IxyNGZUQ/9QX+hj
 svntFpE1lOOxjpCsrCZ7E2gD5ZYt8MXuQkkV6yqNiHH1EKzMSq4+hC1PO
 BCvy5a9eoBelvJcjOJeVy0uXNDdQ9FyG4fZM2zEfabGYW9fx3+62fbTKo g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LAsIpZE00xuyfI6/oIFfGuzfW1yXJr9Sp5TIJx3Stk9LipEzGCyNxfaC5HuMZOHGEK3ijUY/oi
 eeOU7+9B0AkSda4O66PVyEFguB/AKro2Qp5wjias6Vfu1cGVrgJZ4j6ZgRj7ljOL4LkEnc86f0
 eArjtP5yKBygl42UpZSw6Sw7nk1WJJpZWWWiW9G3asnsqIgd7EIMDAa5jyq0k7ajMvr1+7FJZy
 trOSy6dnCpzedcIWtz84C/U2vSEma5xLXfff139oNBcaWWqAWgfs4+kIpCSCUsqxkNFl7T4Xe3
 KK0=
X-SBRS: 2.7
X-MesageID: 16245712
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16245712"
Subject: Re: [PATCH v2 1/2] x86/HVM: expose VM assist hypercall
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
 <1f463b9e-9629-4ba0-3b7f-373b4bcb5b64@xen.org>
 <5863d6d0-22cf-7237-a88b-a3a2c4809635@suse.com>
 <a6474b12-05a2-925f-0d7f-eacc8b1406bd@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <98b3786a-99b2-708a-d9e5-010a115d5ea3@citrix.com>
Date: Tue, 21 Apr 2020 13:40:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a6474b12-05a2-925f-0d7f-eacc8b1406bd@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/04/2020 13:35, Julien Grall wrote:
>>>> --- a/xen/include/asm-x86/domain.h
>>>> +++ b/xen/include/asm-x86/domain.h
>>>> @@ -700,6 +700,20 @@ static inline void pv_inject_sw_interrup
>>>>       pv_inject_event(&event);
>>>> }
>>>> +#define PV_VM_ASSIST_VALID  ((1UL <<
>>>> VMASST_TYPE_4gb_segments)        | \
>>>> +                             (1UL <<
>>>> VMASST_TYPE_4gb_segments_notify) | \
>>>> +                             (1UL <<
>>>> VMASST_TYPE_writable_pagetables) | \
>>>> +                             (1UL <<
>>>> VMASST_TYPE_pae_extended_cr3)    | \
>>>> +                             (1UL <<
>>>> VMASST_TYPE_architectural_iopl)  | \
>>>> +                             (1UL <<
>>>> VMASST_TYPE_runstate_update_flag)| \
>>>> +                             (1UL << VMASST_TYPE_m2p_strict))
>>>> +#define HVM_VM_ASSIST_VALID (1UL << VMASST_TYPE_runstate_update_flag)
>>>> +
>>>> +#define arch_vm_assist_valid(d) \
>>>> +    (is_hvm_domain(d) ? HVM_VM_ASSIST_VALID \
>>>> +                      : is_pv_32bit_domain(d) ?
>>>> (uint32_t)PV_VM_ASSIST_VALID \
>>>
>>> I understand this is matching the current code, however without
>>> looking at the rest of patch this is not clear why the cast. May
>>> I suggest to add a comment explaining the rationale?
>>
>> Hmm, I can state that the rationale is history. Many of the assists in
>> the low 32 bits are for 32-bit guests only. But we can't start refusing
>> a 64-bit kernel requesting them. The ones in the high 32 bits are, for
>> now, applicable to 64-bit guests only, and have always been refused for
>> 32-bit ones.
> >
>> Imo if anything an explanation on where new bits should be put should
>> go next to the VMASST_TYPE_* definitions in the public header, yet then
>> again the public headers aren't (imo) a good place to put
>> implementation detail comments.
>
> How about splitting PV_VM_ASSIST_VALID in two? One would contain
> 64-bit PV specific flags and the other common PV flags?
>
> This should make the code more obvious and easier to read for someone
> less familiar with the area.
>
> It also means we could have a BUILD_BUG_ON() to check at build time
> that no flags are added above 32-bit.

I like this suggestion, but would suggest a 64/32 split, rather than
64/common.  These are a total mixed bag and every new one should be
considered for all ABIs rather than falling automatically into some.

~Andrew

