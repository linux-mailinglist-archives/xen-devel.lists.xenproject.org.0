Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AD1A22C1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:14:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAWR-0005X0-Hk; Wed, 08 Apr 2020 13:13:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Out=5Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jMAWQ-0005Wv-FE
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:13:38 +0000
X-Inumbo-ID: c16e48c9-799a-11ea-81e3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c16e48c9-799a-11ea-81e3-12813bfff9fa;
 Wed, 08 Apr 2020 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586351617;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dbBGIPqFa69AUcUcoG6gXS/NYSjqqvaGNUEdPnRQty8=;
 b=DmBy6VjmhjjPoL/n+aeLz2EryYW9uKbyRdJ6DD7aB3y2aIOkNWuwbrOu
 /zPcK9+s71L9TamJ5f6BlEKogthlD31yEWBoYshesNoqsRvyAU2fWngT/
 Q4VgOKeN2MUBOQqGqCCt1I4feYWXCjOE9Kw+RDRW9B+ZJtS4FqWWMjxf3 A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: N1S6I25XaK5Xfn0ILqrtQKiLXZrH7wfZuQmiz4ZaN4mFYmn6cOo54tmV6OQ1kuz5IqJC3bFaH+
 hghFS7sSDANfUoPWiWxBRYqxNqXmVYdQfaRLeBVTtFN/dAngeU4tyBZlHqZDeAXnoMKaNXi80V
 8gGJSgXRgBlqXN58+hM8maHCbQFrn+8otlPzjGPlyjdoPQCAYa0HajBdrw4bXNXHclHaCJR+BG
 yFGtBcdcSW8XOdOx8msVYFzYfpvKMhuFP6jWMhTYV/NXM60iz+oM7nQLfHqk3pnqvjwP+gNOmA
 sgQ=
X-SBRS: 2.7
X-MesageID: 16033973
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,358,1580792400"; d="scan'208";a="16033973"
Subject: Re: [XEN PATCH v4 10/18] xen/build: use if_changed on built_in.o
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-11-anthony.perard@citrix.com>
 <072ffe9d-88c0-144f-a9ab-c83869ad34e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <71ee52de-af4a-2b1b-4080-d42af6ac6399@citrix.com>
Date: Wed, 8 Apr 2020 14:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <072ffe9d-88c0-144f-a9ab-c83869ad34e2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/04/2020 13:40, Jan Beulich wrote:
> On 31.03.2020 12:30, Anthony PERARD wrote:
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -130,15 +130,24 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
>>  c_flags += $(CFLAGS-y)
>>  a_flags += $(CFLAGS-y) $(AFLAGS-y)
>>  
>> -built_in.o: $(obj-y) $(extra-y)
>> -ifeq ($(obj-y),)
>> -	$(CC) $(c_flags) -c -x c /dev/null -o $@
>> -else
>> +quiet_cmd_ld_builtin = LD      $@
>>  ifeq ($(CONFIG_LTO),y)
>> -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
>> +cmd_ld_builtin = \
>> +    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
>>  else
>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
>> +cmd_ld_builtin = \
>> +    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
>>  endif
> How about going yet one step further and doing away with the
> ifeq here altogether:
>
> cmd_ld_builtin-y = \
>     $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> cmd_ld_builtin-$(CONFIG_LTO) = \
>     $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))

Please don't.

Logic like this is substantially harder to follow than a plain if/else
construct, and clarity is of far higher importance than optimising the
line count in the build system.

This trick only works for trivial cases, and interferes with diff's when
the logic inevitably becomes less trivial.  LTO support in particular
needs a complete overhaul, but there is no way I'm going to touch that
with a barge pole until this series is in place.

~Andrew

