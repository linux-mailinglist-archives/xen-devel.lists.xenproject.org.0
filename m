Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D130C3A5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80601.147512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xZH-0001uj-5o; Tue, 02 Feb 2021 15:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80601.147512; Tue, 02 Feb 2021 15:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xZH-0001uK-1v; Tue, 02 Feb 2021 15:26:15 +0000
Received: by outflank-mailman (input) for mailman id 80601;
 Tue, 02 Feb 2021 15:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Vw=HE=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l6xZF-0001uF-Iz
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:26:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df92750e-b45a-4609-8554-b56b2bcd6ee3;
 Tue, 02 Feb 2021 15:26:12 +0000 (UTC)
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
X-Inumbo-ID: df92750e-b45a-4609-8554-b56b2bcd6ee3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612279572;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Ff0ODS3QBH1c9Z92pXmSGi2ISsoawY8OQVKLEOisOdI=;
  b=HBaMfUtXHO/wsjJFfUmn63GNAvJrKyQ/n6kbgCI1OR5wPBxeyhhG3dI3
   XqalJ9iYPbNSDprydgnKPNZLLgOJHV43r1tzoyexMsmMVDyJDNtjJ/2nt
   3PyGEwPGmm4ALzCHYBXDtKQG7nIQDy0/xGaWVyWSpNH86uozKH+OUsdoz
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3AsF6jWq0gMIIKS1cdsb7GcLWobd5iEgdpRkCEPFI/T0bE6dBMaAKwJkpHPCPlXUy/8L47yPoS
 Ir3YOcLKU9ZljJFLU9/qevKmpLia6n5Sxb07p+ObyagjNGHumtyIZpHjAB0tR0r07ONc+/1ISv
 Y/yNHDRdozIUNz423FFx0RtDiWaEYE7Z+3VKZeSybNrBBmiYxvZ+3HsAZ4L4yRPYIRHnnTsW/6
 cTW7rS0ki5wDxJAo3EjtAadZ0L0c7NDOMnO0zRsJkKSOCADBCbV1BvOZQjU+vQUfMDL/QbE5Y6
 NdU=
X-SBRS: 5.1
X-MesageID: 36576887
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,395,1602561600"; 
   d="scan'208";a="36576887"
Subject: Re: [PATCH] xen/netback: avoid race in
 xenvif_rx_ring_slots_available()
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<stable@vger.kernel.org>
References: <20210202070938.7863-1-jgross@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c17d4e45-cad1-510d-0e7b-9d95af89ff01@citrix.com>
Date: Tue, 2 Feb 2021 15:26:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202070938.7863-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/02/2021 07:09, Juergen Gross wrote:
> Since commit 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> xenvif_rx_ring_slots_available() is no longer called only from the rx
> queue kernel thread, so it needs to access the rx queue with the
> associated queue held.
> 
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Fixes: 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>

Appreciate a quick fix! Is this the only place that sort of race could
happen now?

Igor

