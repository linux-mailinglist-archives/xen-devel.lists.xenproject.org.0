Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630BF192B45
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:35:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH755-0000JG-RG; Wed, 25 Mar 2020 14:32:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH754-0000JB-NQ
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:32:30 +0000
X-Inumbo-ID: 749820b4-6ea5-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 749820b4-6ea5-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585146750;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=j3pq/yaEDejuaPIxbydCtTTiNr3cO1h2hkRGubk7zZo=;
 b=gdcbfYhcoWbcofqcodAfVh7gEcrHa3SZwVQrzftbhSXSRjh0eeCAOaU4
 0wpTlJIzpPQHW/08XSuXEpTal48lUribG9XZUIMtvKYlupZXYzhDM9nnl
 8UDhyxwFe+h5qImIZOtK0GHjDEkQW+k2Q/G5JYxa43Y8O6v0kCaqvdF3/ I=;
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
IronPort-SDR: wYcp2VRZ0TMY+JB4x7cIesx2jSFrlFqJSzs0vJJuZEkA4ycvaePpoQOJ2GZkwHCEBReM2iKAsf
 btWLPWDrApvjhNFzfkIOEkiMWmS+9bCozyeqmY3bCelJp5gPVKCMVtKSvfbxe43CS8nF2f20JI
 iCYW0Ai4/vfR3yzTabZqZ8ZnG/zW79ch/jMRUJAqo/pNePbItRL5OJXqhkYKvDfpSqHzhSbI2J
 zr8ibGfNimir4vZ7XE2++kWHVqAUh41CKEKY13IGibEVm+/RbRCwRJ5nXuH35WR/RE26rX4nbD
 gVo=
X-SBRS: 2.7
X-MesageID: 14825813
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14825813"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-8-andrew.cooper3@citrix.com>
 <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3e157f6d-e237-68d2-f628-10f4d42e578b@citrix.com>
Date: Wed, 25 Mar 2020 14:32:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/7] x86/ucode/intel: Fold structures
 together
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

On 25/03/2020 14:16, Jan Beulich wrote:
> On 23.03.2020 11:17, Andrew Cooper wrote:
>> Currently, we allocate an 8 byte struct microcode_patch to point at a
>> separately allocated struct microcode_intel.  This is wasteful.
> As indicated elsewhere I'm very much in favor of this, but I think it
> wants doing in one of the earlier series, and then for AMD at the same
> time.

I've got some ideas for an AMD series given the replies I got, and will
be able to do an equivalent microcode_amd => microcode_patch folding on
that side.  There is also further work to do, including unbreaking the
OSVW logic (which has been totally clobbered by the start/end_update
debacle).

However, given that it taken this whole series to make the transition
look safe on the Intel side, I really don't see a way of doing this
"earlier".

In particular, no amount of ifdefary suggested below can AFAICT make it
safe to do this transform without having microcode_patch opaque to being
with.

Yes - there is a bit of churn, but I can't see a safe alternative.

~Andrew

>  Possibly, to limit code churn there, ...
>
>> --- a/xen/arch/x86/cpu/microcode/intel.c
>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>> @@ -32,17 +32,12 @@
>>  
>>  #define pr_debug(x...) ((void)0)
>>  
>> -struct microcode_header_intel {
>> +struct microcode_patch {
> ... accompanying this with
>
> #define microcode_header_intel microcode_patch
>
> or even ...
>
>> -    union {
>> -        struct {
>> -            uint16_t year;
>> -            uint8_t day;
>> -            uint8_t month;
>> -        };
>> -        unsigned int date;
>> -    };
>> +    uint16_t year;
>> +    uint8_t  day;
>> +    uint8_t  month;
>>      unsigned int sig;
>>      unsigned int cksum;
>>      unsigned int ldrver;
>> @@ -57,10 +52,7 @@ struct microcode_header_intel {
>>      unsigned int _datasize;
>>      unsigned int _totalsize;
>>      unsigned int reserved[3];
>> -};
>>  
>> -struct microcode_intel {
>> -    struct microcode_header_intel hdr;
>>      uint8_t data[];
>>  };
> ... keeping the two structures separate until here, which would
> make this one what would initially become struct microcode_patch.
> This is in particular because ...
>
>>  static void free_patch(struct microcode_patch *patch)
>>  {
>> -    if ( patch )
>> -    {
>> -        xfree(patch->mc_intel);
>> -        xfree(patch);
>> -    }
>> +    xfree(patch);
>>  }
> ... in that earlier series you've moved the 2nd xfree() here just
> to now delete it again.
>
> Jan


