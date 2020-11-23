Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52E2C05CF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34161.64993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB6O-0001Hk-85; Mon, 23 Nov 2020 12:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34161.64993; Mon, 23 Nov 2020 12:37:52 +0000
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
	id 1khB6O-0001HL-4j; Mon, 23 Nov 2020 12:37:52 +0000
Received: by outflank-mailman (input) for mailman id 34161;
 Mon, 23 Nov 2020 12:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khB6M-0001HG-9N
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:37:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79b253d9-3b0a-4bdf-a611-c6bf5ea0b1ff;
 Mon, 23 Nov 2020 12:37:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khB6M-0001HG-9N
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:37:50 +0000
X-Inumbo-ID: 79b253d9-3b0a-4bdf-a611-c6bf5ea0b1ff
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79b253d9-3b0a-4bdf-a611-c6bf5ea0b1ff;
	Mon, 23 Nov 2020 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606135069;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HlVpSfs5Kq92ct6jbEauNLakfVPoNjRZN6RNY9JUIP4=;
  b=e7RqMcMwqMGNMIP6TK1xr0toK7pHSttwCyA4/ps1R1t5eZMT4TL0essl
   /PuwEjr5FF+XfE49dgF0NL0d36Qrf4goNj0rYJwOjh90Y5e3gIjNh4LD8
   e8zd6DgWKD/s3VjSA1jxiravBGBSnkjmPt8Y6lvI/7K1jrcYA52O6crg7
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LfTT8jqM+ceZyq4OIVrVm7MuMP5CMQWAov+SIlguifH+On8vrjS0240yx4yyRpUYxY/p7Qj5sK
 nr0UF9zlIu+Xeub1HXHEjP5wuE5wCvMQOgC62MxNcCshNP0oyXqbaP4uS8gNnyck/NmQkm47co
 AoMeTtyQNBHr5Nh+wihWIOldLFgkvNGz/fGaAVqAmQ7u+JhpEgDBLLjtv/+A2l45OCkHVpebVS
 vzOST8IM+W2pny7EKeGiqoBf6d+PJ83RaRHSwIryVA+qlVHAodE8fwMjnCGS6YSbIbTBa2eP+0
 RXU=
X-SBRS: None
X-MesageID: 32079416
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32079416"
Subject: Re: [PATCH] x86: E801 memory "map" use implies no ACPI
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <18ca8671-1478-3dc8-7b91-041dbc18829f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cff9ccc4-965a-18e9-1ac3-9779e39c2e62@citrix.com>
Date: Mon, 23 Nov 2020 12:37:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <18ca8671-1478-3dc8-7b91-041dbc18829f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 20/11/2020 12:45, Jan Beulich wrote:
> ACPI mandates use of E820 (or newer, e.g. EFI), and in fact firmware
> has been observed to include E820_ACPI ranges in what E801 reports as
> available (really "configured") memory.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Alternatively we could drop all use of E801 (and older), since
>      there shouldn't be any 64-bit systems not supporting the more
>      modern E820.

I'd definitely be in favour of deleting the legacy logic.  The very fact
that firmware has been observed to include E820_ACPI in E801 maps shows
that the change here isn't correct in practice.

I think we should go further and depend on the bootloader providing the
memory/video/etc details, which also rips out a lot of 16bit handling
code in the trampoline.

Judging by the context below, I think we should also drop various ACPI
related options.  Given its ubiquity these days, turning various bits of
ACPI off is only going to make problems worse.

~Andrew

