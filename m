Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DA2B979E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31108.61360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmf9-0000tu-Rl; Thu, 19 Nov 2020 16:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31108.61360; Thu, 19 Nov 2020 16:19:59 +0000
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
	id 1kfmf9-0000tP-Nz; Thu, 19 Nov 2020 16:19:59 +0000
Received: by outflank-mailman (input) for mailman id 31108;
 Thu, 19 Nov 2020 16:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfmf8-0000t8-IS
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:19:58 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be112a15-e59b-44f3-b2a0-d7a1d432c441;
 Thu, 19 Nov 2020 16:19:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfmf8-0000t8-IS
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:19:58 +0000
X-Inumbo-ID: be112a15-e59b-44f3-b2a0-d7a1d432c441
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id be112a15-e59b-44f3-b2a0-d7a1d432c441;
	Thu, 19 Nov 2020 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605802797;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VLQh6lkvagwdS8OlSONfiSuYbIOqebtEPK9Fh7AzHC4=;
  b=DiHNdKfkemOXMzrOGCNKTZ6/OE7Xc2OAmQTjx5f9sQgOitOD/cwMhTcy
   qwZgK9I6UpcNLUqcgYewF+z/rDcR7/Afx5YkNOXbx0zPSMOzsrFKCkh1o
   G4j8Rf2VN8ueQyIRU/03VrV99DnaUnnxsXTJA5PRKvlpkkS/mdvVD7Yb0
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fZUwVa/+/b7Vfk7M1QsemrxC8ZVToTBLgdOJyB+VGAo6v3UKBKdtm0/WW/WTwn5LgmJZcJpIKB
 d6CrhNLrH7KJjQ9w0mnHIVuRy6PHejJSIVCGRcWWFTxfelC6cBbY0c9rk5uOIvQpOs+75nEz6s
 lR9aRv9ThQrst4LBHKbD5M+hXK9/rDLpy3JChvIDC320Qp+76YU9RYvewqT1U7aqBLNKli1bb+
 nHzzXFM1+w/eUBETcqjoRMWQPtviY1hHn/eqdaIgeSHO7lRrNH+ZeerP5hVKqY6qVo6tva0Nts
 fdw=
X-SBRS: None
X-MesageID: 32687863
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="32687863"
Subject: Re: [PATCH] x86/Intel: avoid UB with NMI watchdog on family 15 CPUs
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <63500eb6-b1da-ce08-52e2-00b30ffe2c26@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c2ffdcb-577d-8bea-35e3-904777a0c2e5@citrix.com>
Date: Thu, 19 Nov 2020 16:10:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63500eb6-b1da-ce08-52e2-00b30ffe2c26@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 15:57, Jan Beulich wrote:
> Found by looking for patterns similar to the one Julien did spot in
> pci_vtd_quirks().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Subject is wonky.  Is it P4 (Intel), or Fam15 (AMD) ?  I'd be tempted to
have the prefix as x86/nmi: either way.

With that suitably adjusted, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

