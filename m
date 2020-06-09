Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F421F3C57
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jieHH-0008WE-BT; Tue, 09 Jun 2020 13:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ij5=7W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jieHF-0008W9-9Q
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:26:53 +0000
X-Inumbo-ID: e136ae30-aa54-11ea-b31f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e136ae30-aa54-11ea-b31f-12813bfff9fa;
 Tue, 09 Jun 2020 13:26:52 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LCT9xGyJWNUMkOsK8scVAC77zhZRyjblAyL9jMY2o4zI81gawD1L3V8kTms5PFmbSoN/SsSdFv
 96jyIzKnoMJEhHaPebl5vxcOgN2TDgW+jP9tIFBwmYpS35s81jnLMFWOi1oGl/NePHdD8VMjbi
 40KhR7dCPaILve+pVezZpIIGckKIcTaBd2VxJB5GraGllQ0DPFv9moWmdstYmb8PwgmgTqFJCx
 roHV+Huc0lI9zDLT+A0nIJ0nLNrGOTtinCTPSNsexzBW0KihuOT+o8+bnRy6shJ07KJMudWBEX
 5Fg=
X-SBRS: 2.7
X-MesageID: 19573899
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19573899"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24287.36374.917457.787627@mariner.uk.xensource.com>
Date: Tue, 9 Jun 2020 14:26:46 +0100
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
In-Reply-To: <20200609152233.039cfc86.olaf@aepfle.de>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Olaf Hering writes ("Re: [PATCH v1] kdd: remove zero-length arrays"):
> Am Tue, 9 Jun 2020 13:15:49 +0100
> schrieb Tim Deegan <tim@xen.org>:
> 
> > Olaf, can you try dropping the 'payload' field from the header and replacing the payload[0] in pkt with payload[] ?
> 
> In file included from kdd.c:53:
> kdd.h:325:17: error: flexible array member in union
>   325 |         uint8_t payload[];
...
>          kdd_stc stc;
> -        uint8_t payload[0];
> +        uint8_t payload[];
>      };
>  } PACKED kdd_pkt;

Try

>          kdd_stc stc;
> -        uint8_t payload[0];
>      };
  +    uint8_t payload[];
>  } PACKED kdd_pkt;

?

(I haven't read the surrounding code...)

Ian.

