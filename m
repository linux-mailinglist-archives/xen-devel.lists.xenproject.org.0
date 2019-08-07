Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1354852EA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:24:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQZs-0006mf-Sz; Wed, 07 Aug 2019 18:22:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvQZr-0006ma-NG
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 18:22:23 +0000
X-Inumbo-ID: 4c6ba9c8-b940-11e9-9cf7-2b8a7f461186
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c6ba9c8-b940-11e9-9cf7-2b8a7f461186;
 Wed, 07 Aug 2019 18:22:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF1E321E70;
 Wed,  7 Aug 2019 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565202141;
 bh=YazNvNNUfYwYJAHK71t+HzQbAM1/YePecJwvDaX5mbI=;
 h=Date:From:To:cc:Subject:From;
 b=MLsp2c/p0TRpuxNb/H6fkIpwTTjWgRhf2UiCrsLXYMN7VGY+FW9iM+YO9X8Fvt8JJ
 CYeE2TVnl+zRSL1BIjtAGFHcJoxWtjyCP+AS73ek6XP7yBxLTKAsT4Ndd11SuDl5RQ
 Ug8hpnVqRbvrYcJF/iDS0Rx0vRGNBkf80mt5A4gc=
Date: Wed, 7 Aug 2019 11:22:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George.Dunlap@eu.citrix.com, dfaggioli@suse.com
Message-ID: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGFyaW8sIEdlb3JnZSwKCkRvbTBsZXNzIHdpdGggc2NoZWQ9bnVsbCBpcyBicm9rZW4gb24g
c3RhZ2luZywgaXQgc2ltcGx5IGhhbmdzIHNvb24KYWZ0ZXIgWGVuIGlzIGZpbmlzaGVkIGxvYWRp
bmcgdGhpbmdzLiBNeSBpbXByZXNzaW9uIGlzIHRoYXQgdmNwdXMgYXJlCm5vdCBhY3R1YWxseSBz
dGFydGVkLiBJIGRpZCBhIGdpdCBiaXNlY3Rpb24gYW5kIGl0IHBvaW50ZWQgdG86Cgpjb21taXQg
ZDU0NWYxZDZjMjUxOWExODNlZDYzMWNmY2E3YWZmMGJhZjI5ZmRlNSAocmVmcy9iaXNlY3QvYmFk
KQpBdXRob3I6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CkRhdGU6ICAgTW9u
IEF1ZyA1IDExOjUwOjU1IDIwMTkgKzAxMDAKCiAgICB4ZW46IHNjaGVkOiBkZWFsIHdpdGggdkNQ
VXMgYmVpbmcgb3IgYmVjb21pbmcgb25saW5lIG9yIG9mZmxpbmUKICAgIApBbnkgaWRlYXM/CgpD
aGVlcnMsCgpTdGVmYW5vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
