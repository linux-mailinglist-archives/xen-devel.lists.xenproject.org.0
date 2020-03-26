Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54480194CF2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 00:28:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHbrq-0004yM-OG; Thu, 26 Mar 2020 23:24:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NM4n=5L=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jHbro-0004yH-Tx
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 23:24:52 +0000
X-Inumbo-ID: fde791e2-6fb8-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fde791e2-6fb8-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 23:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585265092;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yRZT+Ffk3CMFtvQ28+8yFYjvU7P50uJfxENo97xS1pg=;
 b=TH12fBUkgyunYwB2aYIiNKH0kr9r70TDMbFZhqRIjCyXa+47Hgh7hAyz
 3h+KoPrvdU9V1TWCecQCEpQjl9/XmQ6sE/6Jtn4POARtIInMMY9oqEBMG
 W4hkFviZSIn2mfq/cSD00S3QYZbO3dcB1mQdNyRjEhXORzHf5RgiIOHHJ 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Lev5mH+v81w782ztXSI+jX1oUFPduZ12Kj/aXC9fAxf2DzK/wopcmmiCxIe/tbHG20jYo9lFKP
 Z+aX5fjZX3zaCbyfGnIwEi8Bv64Bs93H8kQ5Qs5v2l1X9GxlnxQFcj+Xib8jQgf/bl6gQ0nMUe
 P9dRI5XjU85Du3BrastSZVUMO9faAUrlsxCiVuV0csET/WNRjy/UgncxqCCKQ1NRyR4pV9eRVc
 r5jzTGPX20xiP/cHEhzsNTUn33huMEeyVlC5xGGF/KGtCevQc1GNLZT70DBVe/PSzesC+vGUni
 eeM=
X-SBRS: 2.7
X-MesageID: 14937661
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,310,1580792400"; d="scan'208";a="14937661"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200326091918.12388-1-jgross@suse.com>
 <20200326091918.12388-4-jgross@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <260d0f20-a424-3708-3ab7-6d8c89247a2a@citrix.com>
Date: Thu, 26 Mar 2020 23:24:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200326091918.12388-4-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen: don't process rcu callbacks
 when holding a rcu_read_lock()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 09:19, Juergen Gross wrote:
> Some keyhandlers are calling process_pending_softirqs() while holding
> a rcu_read_lock(). This is wrong, as process_pending_softirqs() might
> activate rcu calls which should not happen inside a rcu_read_lock().
> 
> For that purpose modify process_pending_softirqs() to not allow rcu
> callback processing when a rcu_read_lock() is being held.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> V3:
> - add RCU_SOFTIRQ to ignore in process_pending_softirqs_norcu()
>   (Roger Pau Monné)
> 
> V5:
> - block rcu processing depending on rch_read_lock() being held or not
>   (Jan Beulich)

Juergen,

Our BVT revealed a likely problem with this commit in that form.
Since 12509bbeb9e ("rwlocks: call preempt_disable() when taking a rwlock")
preemption is disabled after taking cpu_maps which will block RCU
callback processing inside rcu_barrier itself. This will result in
all system hang on boot after 540d4d60378 ("cpu: sync any remaining
RCU callbacks before CPU up/down").

Igor

