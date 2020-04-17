Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EDD1ADE8E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 15:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRFZ-0003jD-9F; Fri, 17 Apr 2020 13:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8vtN=6B=gmail.com=brendank310@srs-us1.protection.inumbo.net>)
 id 1jPRAp-0002w8-4t
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 13:36:51 +0000
X-Inumbo-ID: 7e06d128-80b0-11ea-9e09-bc764e2007e4
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e06d128-80b0-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 13:36:50 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id x66so2316302qkd.9
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2020 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wWFO4OrewFzHWBIK4A/5sZz/WdC0rHyctT9V9v5Avow=;
 b=XVU2YuWvv6CVx4OW+5x1js3oxi+SdhXTkvGtYWdNF5P/smVNFXhtBAYu0mZFMdNALt
 OvbhJ+bGKgHNGBs7dc7c430XRPYAT9eNY6RpEWpVSvfGyPCnYeuNRPXGhFaCkW6SGzgI
 fgKIhRn2LQTwhZHKoEGYYGCgM1dQTKypY7bsQTuHvGowAQfPFRLgrWY1u2DYID8sIsmK
 61q2tV1SFaotxfT51cLgg2Twn7q7QLKN8eOHqAQn4Luf4N5vPeNOrQdJO6ML7d3ft+U0
 TAE76vKvxrSacO0nkPB4TTdtxJyO0th8x6WC0sRsa/FE9JZ944HOF6AcUVggb0wgAQ2r
 6LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wWFO4OrewFzHWBIK4A/5sZz/WdC0rHyctT9V9v5Avow=;
 b=DZEogf07KH4l8BHJkyVNOWpMbnAlvUSomvaew0+lhS5kPrOFIxCBzpqLvSxcKjijG7
 iSMhgqJDDOlAWy+hHzOUAOkltDsdgRbQXoVEuKKTqOdMN4UlQDVWEiHrJL3oB3wbP82/
 PVC0CqGnEsjGC/bzwBO4uYGMszssM4gjhIDShOO42PLUMqkg+yl5kDpAF+SZMnhFsgAE
 UqYqbRJ1au9Nobiw1mFwKzPxJRFTbMD118b8e8yT0sEAJMa4hyj40pZyxRqihrFkAgvo
 mpxVz2FPl6C8+0sX2zuEE7Ht0vMIbYlZsIFJp7ErsuPSiqJYj98AY8lpUT7dLdvLRsm4
 mdGA==
X-Gm-Message-State: AGi0PuZs0pzQZ/at2FsurHnZGCbnPsQJVpLNhZHQSo1E87M3489xooJh
 VGwFPH57hoIksXtNTg4ppPDPF+nq9eRHUw==
X-Google-Smtp-Source: APiQypKphbZJN0BAcXe4dNOcmQFWeiUUKpO3dI07Rb7VA/9iyM8q/ThAHDSxQOG3Rb80cnGl1p9yIg==
X-Received: by 2002:a37:b1c6:: with SMTP id a189mr3288480qkf.26.1587130609992; 
 Fri, 17 Apr 2020 06:36:49 -0700 (PDT)
Received: from ubuntu.localdomain
 (pool-96-249-236-140.nrflva.fios.verizon.net. [96.249.236.140])
 by smtp.gmail.com with ESMTPSA id s15sm18140737qtc.31.2020.04.17.06.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 06:36:49 -0700 (PDT)
From: Brendan Kerrigan <brendank310@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/1] Mask VT-d DMAR faults for IGD devices
Date: Fri, 17 Apr 2020 09:36:25 -0400
Message-Id: <20200417133626.72302-1-brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 17 Apr 2020 13:41:44 +0000
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
Cc: kevin.tian@intel.com, Brendan Kerrigan <kerriganb@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Brendan Kerrigan <kerriganb@ainfosec.com>

The Intel IOMMU for at least 8th and 9th generation Core processors has a bug
where the Fault Processing Disable bit is not respected for the Intel Graphics
Device (IGD). The resulting behavior was reported previously[1]. The underlying
cause is described by Intel as Errata ID 049 in the Core spec update
document[2], along with a suggested workaround, which is implemented in the
patch.

[1] https://lists.xen.org/archives/html/xen-devel/2015-08/msg01955.html
[2] https://www.intel.com/content/dam/www/public/us/en/documents/specification-updates/8th-gen-core-spec-update.pdf


Brendan Kerrigan (1):
  x86/vtd: Mask DMAR faults for IGD devices

 xen/drivers/passthrough/vtd/iommu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.17.1


