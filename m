Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086152E1FB7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 18:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58552.103098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7bk-0004kD-GB; Wed, 23 Dec 2020 17:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58552.103098; Wed, 23 Dec 2020 17:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7bk-0004jo-D2; Wed, 23 Dec 2020 17:07:28 +0000
Received: by outflank-mailman (input) for mailman id 58552;
 Wed, 23 Dec 2020 17:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks7bj-0004jj-HH
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 17:07:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c75ce1f2-83aa-4962-8277-b325d403f43f;
 Wed, 23 Dec 2020 17:07:26 +0000 (UTC)
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
X-Inumbo-ID: c75ce1f2-83aa-4962-8277-b325d403f43f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608743246;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XGtcxtIP85AkoJ1oo6T1oa1vfCR93ZORyNz7qwenv/I=;
  b=RBwRxHuZdjrdl7o5FXMdKWZpNlBERAcx/yxWtXMNbA3/7TtYrvOPPCGE
   Tqmdh/IdvYCoPvv/9ah/w3gB9BIZzE13JKNhC2NpIXGtaQQxH3jBRKuB+
   7VI8UBjtsy+e/dPIX9MEdyGPSXH77VXIR2R/Z0zc7c+jfhJE6XjdTGIXe
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7fTt9hNMSvSsH9vBvGXPFqKIzKCBjfP8/SqEm4SzL9RNG7rcw3n6pU+BJehzvLHyEGZAw4qlIr
 /MoXRgKzYHmm+7QM30HsN0nVj+MHjWSj/iQRrjEbwQZOhfYUMPct9RgU8MGr/pwJ9oJ4j0XXeu
 Er3K+NwQ03+1cn7JaRQvolXErdUoJlSlnDWZ+uUti/vzBJftuUNufO/2R4ZQO44zDMG2DT84mx
 y7m3HXSaN3ZCd4VnjLgz+SkRU31ZGM1GR9V17KEMWa6jqm4VZzVtYCn0dbOCEIxBh8+AO9B4tA
 sic=
X-SBRS: 5.2
X-MesageID: 33866419
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="33866419"
Subject: Re: [PATCH] lib: drop debug_build()
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <143333c9-154b-77c3-a66a-6b81696ecded@suse.com>
 <2575d75a-ce1d-c725-4f37-b7c9c10a2ecd@citrix.com>
 <266f673e-0158-13fe-9ea7-69a3c5dc2903@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7129ab6a-df30-a995-5a2c-b35c094bb629@citrix.com>
Date: Wed, 23 Dec 2020 17:07:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <266f673e-0158-13fe-9ea7-69a3c5dc2903@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 07:42, Jan Beulich wrote:
> On 21.12.2020 19:07, Andrew Cooper wrote:
>> On 21/12/2020 16:50, Jan Beulich wrote:
>>> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
>>> allow enabling assertions independently of CONFIG_DEBUG.
>> I'm not sure I agree that we'll ever want to do this, but...
> Didn't you once say XenServer keeps (or kept) assertions enabled
> even in release builds?

The hypervisor RPM has two xen.gz's, a release and debug build from the
same source.

So yes - a debug hypervisor is available in a normal XenServer release,
but its not assertions in a release build of Xen.

~Andrew

