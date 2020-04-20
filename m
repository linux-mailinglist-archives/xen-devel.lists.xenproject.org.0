Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EB61B1651
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 21:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQcVR-0002aq-LZ; Mon, 20 Apr 2020 19:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQcVP-0002al-WC
 for xen-devel@lists.xen.org; Mon, 20 Apr 2020 19:55:00 +0000
X-Inumbo-ID: d0705316-8340-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0705316-8340-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587412500;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5RsXPncjBxSabyQjNXqkTykmnUFEE9yX4j6KmjU0SYo=;
 b=LanEZ2uNA+jPARe3r3oD/cuyGEHN3FAsyHwaGf/5CDbLejv+t/O96ahu
 acSlIcRz8OE9W+vbGnooCxh5xCuH9upGsClkbOFcaXVBssiE9XT32yj3p
 YufwfZ1U7Ybk45o97Zfb4FUz1kngH7YoZGLmrf0SRXWOG4FVJU71zIEn6 s=;
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
IronPort-SDR: RLNUbVNHPy++YUByN0UYYaZCSODwvajSN/gJC1HMl8lBgxmxVwOISTk+tOrOhwvf6OWA6f6F4D
 zcLWkGSJiNBa9bGjDz82zZ1tO/w29gvHGqyhzSB0c2FVY26iTY+2az1KROE1FkN2vBR2W1lNMC
 TVWN0J9v+oTyuRvDqvISpkG8ivLyE7YcjFwKFfYNdbggCGfZCMrWyDvs9rbnYYMzpldTH2sjgK
 J6wlGdgVm360mMtPhzt8jcXV73a4uX+zvCpjFX7/xoibHnplHi/eRl+XD468NKcMyUYg3xpKy2
 mTU=
X-SBRS: 2.7
X-MesageID: 16211296
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="16211296"
Subject: Re: [XTF 3/4] Enabled serial writing for hvm guests
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-4-wipawel@amazon.de>
 <501cc157-b260-bca0-2920-f4e3a8a07c1b@citrix.com>
 <987F9723-8B54-4908-8AED-F265C0F7E1AC@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b8db49e-4313-7460-7f88-7e0c6c2ab306@citrix.com>
Date: Mon, 20 Apr 2020 20:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <987F9723-8B54-4908-8AED-F265C0F7E1AC@amazon.com>
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
Cc: "semelpaul@gmail.com" <semelpaul@gmail.com>, "paul@xen.org" <paul@xen.org>,
 Julien Grall <julien@xen.org>, "Manthey, Norbert" <nmanthey@amazon.de>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 12:44, Wieczorkiewicz, Pawel wrote:
>>> +}
>>> +
>>> static void xen_console_write(const char *buf, size_t len)
>>> {
>>>     hypercall_console_write(buf, len);
>>> @@ -246,7 +253,14 @@ static void xen_console_write(const char *buf, size_t len)
>>> void arch_setup(void)
>>> {
>>>     if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
>>> +    {
>>>         register_console_callback(qemu_console_write);
>>> +    }
>>> +
>>> +    if ( IS_DEFINED(CONFIG_HVM) )
>>> +    {
>>> +        register_console_callback(com1_write);
>> This wires up 0x3f8 even for PVH guests, which I'm guessing isn't
>> intentional?  This should be part of the previous if(), but does beg the
>> question what is wrong with the existing qemu console?
>>
> It turns out that both PVH and HVM guests are PVH ABI compatible,

Correct

> but PVH does not need qemu console.

Its not that.  PVH guests are intended to run without qemu so there is
nothing listening on port 0x12.

> In order to get serial console via qemu working, I always register com1
> handler for both HVM and PVH. Register qemu console only for HVM guests.

> I use the com1 to make qemu write console output to a file via: serial=“file:/tmp/…”


Right, but this is a local configuration issue.

I'm happy to make console selection more flexible, but there is
absolutely no need to two separate IO ports throwing the same text
string at Qemu.

~Andrew

