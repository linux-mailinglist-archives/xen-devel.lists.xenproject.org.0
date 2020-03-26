Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8B1941AF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:38:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTcV-0001Tm-9g; Thu, 26 Mar 2020 14:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHTcT-0001TS-5y
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:36:29 +0000
X-Inumbo-ID: 2cd45e30-6f6f-11ea-87fa-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cd45e30-6f6f-11ea-87fa-12813bfff9fa;
 Thu, 26 Mar 2020 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585233388;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IbUOCqRBo5Kd57JOVwHpMirKN2kT0Jk/jQgsD8THMgw=;
 b=Me+FXZmfBsRL+L58sA40G+iOcdvXEuGXO1dBlKIYLtPx56GWIFGaejmn
 EPZo/jTbuP7NieAuNDmcd1OPxqOY3lPeqp61G6CviWZYrgyrICQGjeZot
 j0cj66ybqO9W1E+Rig7mTc2rffHo1iWCNPWEiobgYIjuA11uG8bBqTaYt o=;
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
IronPort-SDR: EMQhGZcDHjFp4aLz/krKbsnl8nvj/mePf6U0zdvJT4R2+Z1aeEJNC/uaax3qm8m9q20iM+XyVv
 8ie2SpFATayGTujDTnFHZdphoyUILeB7sUg17bdgCSWx2i1ZW6/hqauPboKrSxThFpYH6JYCqt
 oMtODy7MUwxxV+rRsKNhmxJYtecOiDfPBS3PeOxWyridUS3rTk+hY6vitPfhWlr2DFQIKYVrK5
 TWOFPc0PGOX2Erz699Zqc2I6m4m4ecxQMYit5j/6VTK+BlJ9WitMUY43CChJU4BmAz6/HJtDiQ
 mso=
X-SBRS: 2.7
X-MesageID: 14673135
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14673135"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-6-andrew.cooper3@citrix.com>
 <d37aeda3-8eea-db72-51ae-f154dd3aa944@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9e1238ea-3ad2-a529-e88e-51c6f607f45d@citrix.com>
Date: Thu, 26 Mar 2020 14:36:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d37aeda3-8eea-db72-51ae-f154dd3aa944@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/7] x86/ucode/intel: Clean up
 microcode_update_match()
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

On 25/03/2020 13:51, Jan Beulich wrote:
> On 23.03.2020 11:17, Andrew Cooper wrote:
>> Implement a new get_ext_sigtable() helper to abstract the logic for
>> identifying whether an extended signature table exists.  As part of this,
>> rename microcode_intel.bits to data and change its type so it can be usefully
>> used in combination with the datasize header field.
>>
>> Also, replace the sigmatch() macro with a static inline with a more useful
>> API, and an explanation of why it is safe to drop one of the previous
>> conditionals.
>>
>> No practical change in behaviour.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/cpu/microcode/intel.c | 75 +++++++++++++++++++++++++-------------
>>  1 file changed, 49 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
>> index dfe44679be..bc3bbf139e 100644
>> --- a/xen/arch/x86/cpu/microcode/intel.c
>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>> @@ -61,7 +61,7 @@ struct microcode_header_intel {
>>  
>>  struct microcode_intel {
>>      struct microcode_header_intel hdr;
>> -    unsigned int bits[0];
>> +    uint8_t data[];
>>  };
>>  
>>  /* microcode format is extended from prescott processors */
>> @@ -98,8 +98,41 @@ static uint32_t get_totalsize(const struct microcode_header_intel *hdr)
>>      return hdr->_totalsize ?: PPRO_UCODE_DATASIZE + MC_HEADER_SIZE;
>>  }
>>  
>> -#define sigmatch(s1, s2, p1, p2) \
>> -        (((s1) == (s2)) && (((p1) & (p2)) || (((p1) == 0) && ((p2) == 0))))
>> +/*
>> + * A piece of microcode has an extended signature table if there is space
>> + * between the end of data[] and the total size.  (This logic also works
>> + * appropriately for Pentium Pro/II microcode, which has 0 for both size
>> + * fields, and no extended signature table.)
>> + */
>> +static const struct extended_sigtable *get_ext_sigtable(
>> +    const struct microcode_intel *mc)
>> +{
>> +    if ( mc->hdr._totalsize > (MC_HEADER_SIZE + mc->hdr._datasize) )
>> +        return (void *)&mc->data[mc->hdr._datasize];
>> +
>> +    return NULL;
>> +}
>> +
>> +/*
>> + * A piece of microcode is applicable for a CPU if:
>> + *  1) the signatures (CPUID.1.EAX - Family/Model/Stepping) match, and
>> + *  2) The Platform Flags bitmap intersect.
>> + *
>> + * A CPU will have a single Platform Flag bit, while the microcode may be
>> + * common to multiple platforms and have multiple bits set.
>> + *
>> + * Note: The Pentium Pro/II microcode didn't use platform flags, and should
>> + * treat 0 as a match.  However, Xen being 64bit means that the cpu signature
>> + * won't match, allowing us to simplify the logic.
>> + */
>> +static bool signature_maches(const struct cpu_signature *cpu_sig,
>> +                             unsigned int ucode_sig, unsigned int ucode_pf)
> I guess you've lost a 't' here and really mean signature_matches()?

Oops - completely missed that.  Will fix.

> If so with this taken care of
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

