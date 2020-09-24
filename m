Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36B276EB6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:28:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOTV-0004zQ-CT; Thu, 24 Sep 2020 10:27:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StWZ=DB=amazon.com=prvs=52916e0f7=sjpark@srs-us1.protection.inumbo.net>)
 id 1kLOTU-0004zL-CK
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:27:40 +0000
X-Inumbo-ID: 82086fc9-c12d-4202-b1d0-0da8f486211c
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82086fc9-c12d-4202-b1d0-0da8f486211c;
 Thu, 24 Sep 2020 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600943260; x=1632479260;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=VJUxKkMgAakbT3L/fC0FIlc1ypeBbbtBZnjUiDl52NU=;
 b=ewTYKEnbFo8q0WnujBBJN9csCdOVT+WZ46XNY3KmV9I53lhZG9GPf7Ue
 vHVD71D9vJZ5mftf/tVIE4MgX4ajWNnHa3ZA1xOdPwdrMb3x6KZ32luqS
 oumWMru0uMk+nBo+UKcmtk4tvk3e4vjuog6QZppXEtYcPBPu6+PZK3NZZ g=;
X-IronPort-AV: E=Sophos;i="5.77,297,1596499200"; d="scan'208";a="78889262"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 24 Sep 2020 10:27:37 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id A14B3A1FF9; Thu, 24 Sep 2020 10:27:36 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.244) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 24 Sep 2020 10:27:30 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, SeongJae Park
 <sjpark@amazon.com>, SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Date: Thu, 24 Sep 2020 12:27:14 +0200
Message-ID: <20200924102714.28141-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200924101344.GN19254@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.244]
X-ClientProxiedBy: EX13D40UWC004.ant.amazon.com (10.43.162.175) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 24 Sep 2020 12:13:44 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:

> On Wed, Sep 23, 2020 at 04:09:30PM -0400, Konrad Rzeszutek Wilk wrote:
> > On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> > > From: SeongJae Park <sjpark@amazon.de>
> > > 
> > > Persistent grants feature provides high scalability.  On some small
> > > systems, however, it could incur data copy overhead[1] and thus it is
> > > required to be disabled.  But, there is no option to disable it.  For
> > > the reason, this commit adds a module parameter for disabling of the
> > > feature.
> > 
> > Would it be better suited to have it per guest?
> 
> I think having a per-backend policy that could be specified at the
> toolstack level would be nice, but I see that as a further
> improvement.

Agreed.

> 
> Having a global backend domain policy of whether persistent grants are
> enabled or not seems desirable, and if someone wants even more fine
> grained control this change is AFAICT not incompatible with a
> per-backend option anyway.

I think we could extend this design by receiving list of exceptional domains.
For example, if 'feature_persistent' is True and exceptions list has '123,
456', domains of domid 123 and 456 will not use persistent grants, and vice
versa.

I could implement this, but... to be honest, I don't really understand the
needs of the fine-grained control.  AFAIU, the problem is 'scalability' vs
'data copy overhead'.  So, only small systems would want to turn persistent
grants off.  In such a small system, why would we need fine-grained control?
I'm worrying if I would implement and maintain a feature without real use case.

For the reason, I'd like to suggest to keep this as is for now and expand it
with the 'exceptions list' idea or something better, if a real use case comes
out later.


Thanks,
SeongJae Park

