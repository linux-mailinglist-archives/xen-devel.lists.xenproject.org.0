Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E31294B0A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9954.26269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAzg-0003Qi-Pr; Wed, 21 Oct 2020 10:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9954.26269; Wed, 21 Oct 2020 10:05:20 +0000
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
	id 1kVAzg-0003QE-LC; Wed, 21 Oct 2020 10:05:20 +0000
Received: by outflank-mailman (input) for mailman id 9954;
 Wed, 21 Oct 2020 10:05:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVAzf-0003Q8-1c
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:05:19 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42c603b6-fe54-4dec-bdd4-26211da79e55;
 Wed, 21 Oct 2020 10:05:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVAzf-0003Q8-1c
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:05:19 +0000
X-Inumbo-ID: 42c603b6-fe54-4dec-bdd4-26211da79e55
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 42c603b6-fe54-4dec-bdd4-26211da79e55;
	Wed, 21 Oct 2020 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603274719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ux6ZeF9tliAVd3JLr0GPv/0u9LqFcQi6AbLVXu+zPmk=;
  b=R/JHWc+aXDdvODOgC/DMCbQeKhSNFj8VSUeiYu9pvEi8lJ9Rs1HSSLdf
   kWRr/s+rTQFtYRj1YQ0RwZPNPOkZkXnKAS2OSH/3rZ8OtAkjh9FDYWO/u
   D7YiUybtlK3vHXNdy1RtakJT7Nk66OLfXsVai73t9nqaP5tuNwWt4J+ba
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uOfS8XzK4ftBq9H9NxtSJMWreYyTnn31qyjAiOB+B/4aTNNRuR0wBN44Xdawg9bzIN1el9lPOi
 mU38zDvm+1rnedvw0hbSdmRgNIoKQATEPkRdMgoqlBP1F0K+oJl8bxTsg0uyO9HCrs9/HZ1b50
 IRSp5AYuwbONbWa4nkuGqatDtqL1ayI+B52sNzS/Xutx2mzWeBtLiJnxGGss0NoR0RVJS/ERN2
 N3wiBOLyDAkfxs6tLFLUxvT+XgnyofulsHmOuo4KHrcRLglAZHRLpbu3H5rF8SHDjROP33p7JY
 SnI=
X-SBRS: 2.5
X-MesageID: 29438825
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29438825"
Date: Wed, 21 Oct 2020 12:05:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 2/3] x86/shadow: refactor shadow_vram_{get,put}_l1e()
Message-ID: <20201021100505.bxnlpmrqwnb5gqqx@Air-de-Roger>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
 <bc686036-18c0-ba7b-b8e5-a20b914aac68@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc686036-18c0-ba7b-b8e5-a20b914aac68@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Mon, Oct 19, 2020 at 10:44:31AM +0200, Jan Beulich wrote:
> By passing the functions an MFN and flags, only a single instance of
> each is needed; they were pretty large for being inline functions
> anyway.
> 
> While moving the code, also adjust coding style and add const where
> sensible / possible.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

