Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38789225D25
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:11:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxThh-0005zO-I1; Mon, 20 Jul 2020 11:11:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxThf-0005zJ-QJ
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:11:27 +0000
X-Inumbo-ID: c0e868ae-ca79-11ea-9f84-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0e868ae-ca79-11ea-9f84-12813bfff9fa;
 Mon, 20 Jul 2020 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595243486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NgdXZgD4/oOplL8ZdiaferWZLpooW7c0ZvYNTygkpLs=;
 b=Jr88qgDhwrCdhSwv+aklgCCuQXJ9My8hq/ZSlfpvNAAiNoo9iIxef7f4
 73/7LpxIpUGj7wxAsXVKDJFXCrAIJge0+hFSm6J/DULoXZpyrUjzbr2Pf
 iL3s9L+NUqsmQno97v2hmnRIj+LrSBF3yaKDn+uW+dE/qmiDQFtgAKmXE w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GhtyAOaJMikZbOLCzzJ3mcxUnkNWZya3IfjXqGviO5V9LiOT7rY98o0mJb9Yef7L2Mal1fUbGI
 fFbQDDOLpGBoMlgGpStYiCvhxgQqi2VomzYOLXBCyjGOkwdbSU3N2AnVbDB6C0kvE6Qek47HBT
 x2XBRJj0X7L0V7kOHI8O79bFpHXJB/jclVv0ukXH7chWtXZcM3noLjm/QbgsUumi3Y9h3CeX8p
 YPzH8Hemx0Qr6Skd2rF44FvH2FROENr8n+O3i6TjmzfspNmNKhyM1wbazTo/mTgCrO105iADmc
 +kg=
X-SBRS: 2.7
X-MesageID: 22935191
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22935191"
Date: Mon, 20 Jul 2020 13:11:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 2/2] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <20200720111118.GK7191@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <441327cd-a7d6-8cb6-bf90-69df8e509425@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <441327cd-a7d6-8cb6-bf90-69df8e509425@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 01:57:07PM +0200, Jan Beulich wrote:
> ... in order to also intercept accesses through the alias ports.
> 
> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> use the CMOS RTC.

Will wait for v4 with the fixed additions to PVH dom0.

Roger.

