Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616922C890E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 17:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41292.74427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjlnN-0005Y6-36; Mon, 30 Nov 2020 16:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41292.74427; Mon, 30 Nov 2020 16:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjlnN-0005Xg-04; Mon, 30 Nov 2020 16:12:57 +0000
Received: by outflank-mailman (input) for mailman id 41292;
 Mon, 30 Nov 2020 16:12:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tpvk=FE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kjlnK-0005Uw-Pc
 for xen-devel@lists.xen.org; Mon, 30 Nov 2020 16:12:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5d482b8-e691-4967-8739-36e44bba9526;
 Mon, 30 Nov 2020 16:12:43 +0000 (UTC)
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
X-Inumbo-ID: b5d482b8-e691-4967-8739-36e44bba9526
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606752763;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wqpac+ZXvFw1ZF2F2HGgOYXyHv5dQoS1gJbo6VOVPi8=;
  b=BpxJEcGW0/cy0ItDf52SLlB3btNDC87+HO7In3EJTUrGVpDfBsoAnK56
   uVLMeP7tAmGWH60rHUaCz1w/IfJt29QoJZDy3KO5dX90f0QBPUMj+iTr/
   PlLE0WmVk89RH5r/n7vZRltzhDVdaYn2Abu+/TxuHbJhRCNjPB5yxzF6Y
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RRsSWBnkNpbKylkUsEaWqll+sSpLu4/eGCXiDrUCHBqP8Ozyq8XAr/7IFzNt/wAjBECqPhyEPI
 Gc5HqvniTSBqcptvJtE9VcmZ7W9myGSPlJWmGL0dC+ceYzKxbYzgoj0S0LIt6XvNCWLrwId178
 /i5whk+BDBiGXwJO+1EBHN0qm4fxKhLb3Z+y3kfNSTAtdBvS1/ZLMwpcYraldDZ0lEgiDFLXfQ
 bAgBs7/ocPM3BqG1AX/cPIUMsA02qJdO3RAgPLa+QRCN06Xtxqetc5F2oM/Aa64pRwzfgYRqCY
 Bo4=
X-SBRS: None
X-MesageID: 32181387
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,382,1599537600"; 
   d="scan'208";a="32181387"
Subject: Re: [oss-security] Xen Security Advisory 355 v2 - stack corruption
 from XSA-346 change
To: Mauro Matteo Cascella <mcascell@redhat.com>,
	<oss-security@lists.openwall.com>
CC: <xen-announce@lists.xen.org>, <xen-devel@lists.xen.org>,
	<xen-users@lists.xen.org>, Xen.org security team
	<security-team-members@xen.org>
References: <E1khX2v-0002f4-3b@xenbits.xenproject.org>
 <CAA8xKjWY2+xo57n8hsvG6yMyhs6nAH+S4NbCsEJLWEVff_aWzg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <10f61e14-05f3-0294-8cda-e63764d98cbc@citrix.com>
Date: Mon, 30 Nov 2020 16:10:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjWY2+xo57n8hsvG6yMyhs6nAH+S4NbCsEJLWEVff_aWzg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 30/11/2020 16:07, Mauro Matteo Cascella wrote:
> Hello,
>
> Has a CVE been assigned for this issue?
>
> Regards,

Some unknown 3rd party appears to have allocated a CVE and we're
currently trying to track down who.

~Andrew

