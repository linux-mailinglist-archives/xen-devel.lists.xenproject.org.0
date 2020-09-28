Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAEB27AEAD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:08:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMssk-0003Hk-7y; Mon, 28 Sep 2020 13:07:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMssi-0003HM-5Z
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:07:52 +0000
X-Inumbo-ID: e7bea01d-5df5-43d8-8e7b-7594fa42430b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7bea01d-5df5-43d8-8e7b-7594fa42430b;
 Mon, 28 Sep 2020 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601298471;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mEhp8F1GASMdQYY0B6r1IupaAGvSSTFG/5qmqw/VHco=;
 b=NomgWd2WI+leZEKTmvOq6qziIB8to3Prk7YfhGpjxltP1zJE42psHpE/
 dGLyJl/6HqBj2AomE8FTV1sF63ahTuLE/MCYVKvt2ugS4UEKmkgi/uP+4
 KE5ArQcuOs1MSI0FpuyXB+ms7Cq4CGKZkv21Os9i64QBzdxNVOLAfTrzn g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NGIWhs3/qqy0WOEDgl/YQ1ytON/YXgYRDFlK5wWjSggy26+kNALB0loOfAzN2VeOB5Tngc9YQg
 HjqdHulc6SV0i83p1xIyYb4xJQJQplBRFELW4JUTk6q1fJZbLD08pxJEwGN+wV5TOF+dAAfKmv
 2O2bXFRp5nMrsGm4haZQWKhgVAN21Y9Ho6YrGs1yiHEvJRCFemnbJp3zVflXxSybZHp115wJpE
 bsjBzdIbGc03IVbqZZLQGSE0wwXifRbZWmVQKlWOdjUW579GHccDe0DGWuEMXGGJo59oaz2VSV
 Izo=
X-SBRS: None
X-MesageID: 27847694
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="27847694"
Subject: Re: [PATCH 5/5] x86/ELF: eliminate pointless local variable from
 elf_core_save_regs()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <47b0c4cf-df3b-ee07-f639-14ab6680f90f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3f17459b-ff29-5673-4a9d-b20c17399ba1@citrix.com>
Date: Mon, 28 Sep 2020 14:06:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47b0c4cf-df3b-ee07-f639-14ab6680f90f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/09/2020 13:07, Jan Beulich wrote:
> We can just as well specify the CRn structure fields directly in the
> asm()s, just like done for all other ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

