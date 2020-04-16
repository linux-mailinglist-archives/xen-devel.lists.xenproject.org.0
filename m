Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B71ABDF6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 12:33:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP1oy-0001n8-6F; Thu, 16 Apr 2020 10:32:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HCIP=6A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jP1ox-0001n3-AB
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 10:32:35 +0000
X-Inumbo-ID: 9538e31a-7fcd-11ea-b4f4-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9538e31a-7fcd-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587033153;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eEs36gk2NiP2i+W0bBr9CkC/FtyZfs0r3OSlO+gq+1s=;
 b=iLdP7rr9ZETdrydntDp2mTtgr+LjnvxYG2JIFUXbJ4ziUfy1xUxVEfZR
 QgRlKtOTV0mooiAP7OzQK3CNsew11/N+V9vBf9ZpAV2CkxfvSx/ZRVAnh
 I8ZOpB8DEe38H5mnHL7wc6xhbmzH9S9A1MRD/vnBDIHoTdywA83cPXMj3 I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5sfaLj9JjifoftMNaIgSBeJt0a0MBZFkbAI+gA6X8ZYSWmfiMiudHVGLMAL/VNU6EBSkNRt2pc
 QFqSER7WJ/8+AfbLPsfnf8ZObxStNVoLkVJOHKx28hoPMMa4Mj/tVwEOLKOMcXzlpFPbTUAtey
 6MhVgz9Mzh1MM8V+7Xb1tZ+fti2lOyt0yFHV7WVUusClG5JeZuu6jj4OFeuLaVRekIB3bII264
 C5Qf8n+7z/+PDE/TBkiZDNLujnvFI5D8TjE7jiqvcCbs0jcNE7tzopfGT+3yIBdEa2o8PYq2aJ
 als=
X-SBRS: 2.7
X-MesageID: 16087307
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="16087307"
Subject: Re: [XTF 3/4] Enabled serial writing for hvm guests
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-4-wipawel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <501cc157-b260-bca0-2920-f4e3a8a07c1b@citrix.com>
Date: Thu, 16 Apr 2020 11:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416094141.65120-4-wipawel@amazon.de>
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
Cc: semelpaul@gmail.com, Paul Semel <phentex@amazon.de>, julien@xen.org,
 nmanthey@amazon.de, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 10:41, Pawel Wieczorkiewicz wrote:
> From: Paul Semel <phentex@amazon.de>
>
> setup.c: PV console writing is not working in Xen 4.2 for hvm
> guests,

What is not working about it?

>  so we make xtf write to COM1 serial port to get its output
>
> Signed-off-by: Paul Semel <phentex@amazon.de>
> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> ---
>  arch/x86/setup.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
> index 3c84e96..f6fa4df 100644
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c
> @@ -238,6 +238,13 @@ static void qemu_console_write(const char *buf, size_t len)
>                   : "d" (0x12));
>  }
>  
> +static void com1_write(const char *buf, size_t len)
> +{
> +    asm volatile("rep; outsb"
> +                 : "+S" (buf), "+c" (len)
> +                 : "d" (0x3f8));

Despite being 0x3f8, this really isn't uart-compatible COM1.  I presume
it only works because Qemu doesn't have any real THR delays in its
emulation.

> +}
> +
>  static void xen_console_write(const char *buf, size_t len)
>  {
>      hypercall_console_write(buf, len);
> @@ -246,7 +253,14 @@ static void xen_console_write(const char *buf, size_t len)
>  void arch_setup(void)
>  {
>      if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
> +    {
>          register_console_callback(qemu_console_write);
> +    }
> +
> +    if ( IS_DEFINED(CONFIG_HVM) )
> +    {
> +        register_console_callback(com1_write);

This wires up 0x3f8 even for PVH guests, which I'm guessing isn't
intentional?  This should be part of the previous if(), but does beg the
question what is wrong with the existing qemu console?

~Andrew

