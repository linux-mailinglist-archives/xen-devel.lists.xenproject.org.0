Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063CE29AA2E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 12:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12784.33130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMiH-0003Z6-Dm; Tue, 27 Oct 2020 11:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12784.33130; Tue, 27 Oct 2020 11:00:25 +0000
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
	id 1kXMiH-0003YT-6Z; Tue, 27 Oct 2020 11:00:25 +0000
Received: by outflank-mailman (input) for mailman id 12784;
 Tue, 27 Oct 2020 11:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXMiE-0003Vz-V3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:00:22 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e903df16-8414-4bfe-bdc8-51904a180445;
 Tue, 27 Oct 2020 11:00:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXMiE-0003Vz-V3
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:00:22 +0000
X-Inumbo-ID: e903df16-8414-4bfe-bdc8-51904a180445
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e903df16-8414-4bfe-bdc8-51904a180445;
	Tue, 27 Oct 2020 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603796421;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Wo3apLLJMSy0WeWORmBpKmV4LoQ9ADlHHgJPDqtSl7I=;
  b=KlGWEGUY8vlXHK15PFpHJH6HTPDPRF+F9yL6qs7ixXVXZjSMT8EBuTbp
   cgyuhbHrYEfpcTuAnscX0eIpsM6s03ahmcA3qsWBiGgzngjoJQPNACsvR
   mcU4OH1jkozbZmA4WDb5VaeSaLwQbATUgrk4HSoBd2lYAyvk0BwwNnG4s
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bZplUjrN01QUtIH+uNoSOhd+eAgMQRPxEge4qEDqJU3M8Q4Cx6tSJyYBlYeUy8b0WxmCBP9Q+Y
 1uTx0ZWaK+aZ8xARgsU0XQ43PI75/zemEAdjWkk5AlAQi1W1cYzkgGMX1SZAeHe8dNNLOT0C1c
 VTywyVApl53tKgQLas5j6rkBRGQ97cbGAfl7zrfRUfz5gmGK+uOdDYXcrHAcjyJ2v3N0p4fBrz
 FQtJouiLGBS/l1YaNwvXywri5qkl0/aWqYvY9nuwgIw9tiEK60qUDpgcP+B+0efmU/9O6EVAWG
 bq0=
X-SBRS: None
X-MesageID: 29824965
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,423,1596513600"; 
   d="scan'208";a="29824965"
Subject: Re: [PATCH] {x86,arm}/mm.c: Make populate_pt_range __init
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20201027105839.129217-1-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a31f9bd0-8b2d-368c-7dac-b589840e9a34@citrix.com>
Date: Tue, 27 Oct 2020 11:00:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027105839.129217-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 27/10/2020 10:58, George Dunlap wrote:
> It's only called from another __init function.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

