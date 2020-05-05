Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D96B1C5A73
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 17:06:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVz97-0008Ay-OR; Tue, 05 May 2020 15:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3eM=6T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVz95-0008At-Tb
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 15:06:07 +0000
X-Inumbo-ID: eff2a016-8ee1-11ea-9dc8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eff2a016-8ee1-11ea-9dc8-12813bfff9fa;
 Tue, 05 May 2020 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588691164;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uzRIosQwWM4rnlL5lCtWVUmTdxQNkiKBVfaaqWmhZNo=;
 b=CLNrLS1ukTAk1Hxb4EgLIS/CKyhOrXez4Po9GdwiPGK0GmLyKY75xENm
 UJHG90/8AGUrSHFVpmaFXPibHFVwVQkP7Ha5RPIga+DIqvei+d6H05Pv5
 5KaMb9F5PV9++ejiNpoL0jzc/cY3zLYQMN73Us+EbJfDWhJDFYLopeqdI w=;
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
IronPort-SDR: nrXnuxROmWD5NfrrBYUDWyyZHGdEV5CPjtYeo3y1c9XoL+9UyqVKMecel/711Tmvdj/H6EvQcE
 6KA1p7enQhs1nBxEYmQBrwbupOhal+VkXsJIsgyoc0noY2zYC2bxPBf/yFd+46wAhDWsslCm9R
 SD3XMDdN5SaUZPzKswYgZ803gZ8OO7QQLB8ewB5uitMpB+4Sh6HntYZV9dHnVmtYR8F+8xDNrH
 8x/cHAqU1S5o1b1fPMaSsKC7s2kCn+rmm1FKUmYESjNSLICgV+Am3WYKm4VdVP9eQqUG8JJMR2
 q3A=
X-SBRS: 2.7
X-MesageID: 17045496
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17045496"
Subject: Re: [PATCH] x86/pv: Fix Clang build with !CONFIG_PV32
To: Jan Beulich <jbeulich@suse.com>
References: <20200505142810.14827-1-andrew.cooper3@citrix.com>
 <3434eaa5-d8ce-fa8f-17a8-19e9739121d8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a423db54-601b-b445-5f66-507301c78102@citrix.com>
Date: Tue, 5 May 2020 16:05:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3434eaa5-d8ce-fa8f-17a8-19e9739121d8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 15:52, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 05.05.2020 16:28, Andrew Cooper wrote:
>> @@ -753,8 +751,9 @@ void load_system_tables(void)
>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>>  	if ( IS_ENABLED(CONFIG_PV32) )
>> -		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>> -				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>> +		_set_tssldt_desc(
>> +			this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
>> +			(unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
> Isn't indentation here off by 4 compared to what we
> normally do with extremely large argument expressions?

No.  This is Linux style (therefore 8-space tabs), not Xen style (4 spaces).

~Andrew

