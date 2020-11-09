Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942D2AC009
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 16:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22665.49055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc9F7-0003QO-Nu; Mon, 09 Nov 2020 15:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22665.49055; Mon, 09 Nov 2020 15:38:05 +0000
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
	id 1kc9F7-0003Pz-KU; Mon, 09 Nov 2020 15:38:05 +0000
Received: by outflank-mailman (input) for mailman id 22665;
 Mon, 09 Nov 2020 15:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kc9F6-0003Pu-GE
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 15:38:04 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 072a0080-e124-459f-8307-958c58b47770;
 Mon, 09 Nov 2020 15:38:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kc9F6-0003Pu-GE
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 15:38:04 +0000
X-Inumbo-ID: 072a0080-e124-459f-8307-958c58b47770
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 072a0080-e124-459f-8307-958c58b47770;
	Mon, 09 Nov 2020 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604936282;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=h8MDBQiES9vqsk/VNWiI5tsZVeX14okfUoJ5BWeel7Y=;
  b=Zbd+feVIOyiQzvfZ07XgR0RnY06am78XXiTpaESUkOWxSIf0Acrcg/FK
   NGRbdCZ4gS2oeyDIejPRWhlPgx6c7Qvzp7deypHc4NnBVnxKG9amvJxnT
   2YbKFdjTh22ykBjO+wUMk/Uku2lJw9KAI5w2DcdzGfd4GstNLLiUo2Z5p
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c6aLOzjjUzrg04/4+tsgI7sD+ZAfDtDe3sdT4feJNOHFlRW+hhVHU5qv+r+lSLcXeNyZ3oDsVL
 Ru5gbHzQEVd0aCiT4sz9hOeW7N9pDhNTffJQK1cQYIyx9gLJiQdTVE25GAT3UUc3fILmJjSBeS
 u0VUn5jUUbbhF+V4MbZKqC5/52b9h96cMSInYQ1CPSvaI2jelGuqYhQqFAPEuSRdKM+QR5rtQs
 3keusS7pF8jRePvaUH9p+z6rhBUOmkE05hpCRmkd66dJ0V1ENwpddxDmUW2QjymG6NFeJnKGoC
 Pvk=
X-SBRS: None
X-MesageID: 30738214
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,463,1596513600"; 
   d="scan'208";a="30738214"
Subject: Re: [PATCH] x86/CPUID: also check leaf 7 max subleaf to be compatible
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <a59790df-cc2c-30a3-fdf8-7c56472f00c2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3be88229-ac3c-37fa-ce15-d6c48654cd74@citrix.com>
Date: Mon, 9 Nov 2020 15:30:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a59790df-cc2c-30a3-fdf8-7c56472f00c2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 09/11/2020 15:21, Jan Beulich wrote:
> Just like is done for basic and extended major leaves.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

