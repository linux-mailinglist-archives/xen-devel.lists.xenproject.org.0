Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C94B86B3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274016.469339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIYF-0001CE-I3; Wed, 16 Feb 2022 11:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274016.469339; Wed, 16 Feb 2022 11:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIYF-0001AB-Es; Wed, 16 Feb 2022 11:32:51 +0000
Received: by outflank-mailman (input) for mailman id 274016;
 Wed, 16 Feb 2022 11:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKIYE-0001A5-CD
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:32:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b66924-8f1c-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 12:32:48 +0100 (CET)
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
X-Inumbo-ID: 29b66924-8f1c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645011168;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9mOJ7FkLWzanCVzXa2si9+t71PueQ44776rxRJ09r9k=;
  b=PV2haipWSP6XHte4C4Cdyf/KrDTwQ0yw82hhY9kp0lRAzBIbVC7r6d/e
   MG+vR9k4BWF+e9IeLx0vRMA/eJJgZoDlvaDr0T6K1sIDl67BCZAhMxOqV
   PzxIv4EnD0zHTMG0wL/QkTqm9beQSaWFFaGDS8OcyOoJrpGiakr3eGOLy
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yrmqXNTPy+qhf4EldBd/TPQUh/9k7e+8QGPkBGPwwWqewAbgS7PEZBBDpQAvRxkjUeLYEMamH9
 zlBktMQNbFHM4N6bx1dS1EVZRXICWUcrn5kFyj3H6sj8ytet1V6G0PcP05VjBUXvmwwfi9MRvx
 yLlUIDI2thwQiXn9v5uLBsUJXi2HRIAz97OGrkQGcU0XAIBYb9ZoEf3khq395j02B1FDQ/VFdK
 Q2KuVsvc/FBZrUuZZVCwCu+vvea+ifNKUPNuSKRgEdiVU9Tz+GQbO7W1RLkpXQPlaOp9AVan8C
 uyrS5V+YOKk1PB1fe2Ea5Yzx
X-SBRS: 5.1
X-MesageID: 63772499
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WT2fI66dIr6yXeII46i6jAxRtGfBchMFZxGqfqrLsTDasY5as4F+v
 mUYWmGAOfuMMWPxKdgiPISy9ksCu8DVy9VqQVc5qCk0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Aw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 oRQ6aPrECQSLIrCsr4GX15pIQN+FPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxv2ZoSTKe2i
 8wxVSFKawT8aj92GGhIDpEstb+SmmTxfGgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt+H+2mvXGmy+9XYsIDaC57dZjmljVzWsWYDUJUXOrrP//jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9UXuA8p+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX5BjTvm
 RiLqiYkjrkehMJN0L+0lW0rmBr1+MKPFFRsoFyKACT1tWuVebJJeaSiuEWH0q0ZD72LaVer5
 mMI3PmszuAnWMTleDO2fM0BG7Sg5vCgOTLagEJyE5RJywlB60JPbqgLvmggeR4B3tIsPGawP
 RSN4V85CIp7YSPyBZKbdb5dHCjDIULIMd3+Hs7ZYdNVCnSaXF/WpXo+DaJ8Mo2EraTNrU3dE
 crDGSpPJSxDYUiC8NZQb71AuVPM7npjrV4/vbihk3yaPUO2PRZ5s4stPlqUdfwe56iZugjT+
 Ns3H5LUl0kODbSkM3iGqNR7wbU2wZ4TX82eRyt/LLDrH+abMDt5V6+5LU0JJ+SJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV5yQQOiHYHqLllpiZXZEFQ/xgxALON/zhI9CJ8pfVeR2r4RLkK8rJ
 8Tpju3dW5yjvBycoG9DBXQ8xaQ/HCmWafWmZXr1OmNuIMQ5GmQkOLbMJ2PSycXHNQLu3eMWq
 Ly8zALLB50FQgVpFsHNb/yziVi2uBAgdChaBiMk+/FfJxfh9pZEMSv0gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7Zfwwk9RCfLYl2nB6lOOH6D2cUT5KRByqUA4Vm9W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33vXYl8qCGXENeOwi3pBZcdLYlYpk4x
 eoBudIN71DtgBQdLdvb3Dtf8H6BLyJcXvx/5I0aGoLiliEi1kpGPc7HEibz7ZyCN4dMP00tL
 mPGjabOne0BlE/Lcn51HnnRx+tNw58JvUkSnlMFIl2InPvDh+M2g0INoWhmEFwNw0UVyf93N
 0hqK1ZxdPeH8DpfjcReW3yhRlNaDxqD902tk1YEmQU1laVzurAh+IHlBduwwQ==
IronPort-HdrOrdr: A9a23:KTgKoK9XhSfGdTTTUHpuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="63772499"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eScfiVuDSnaF6FajSjj6RE7Xfjbbpqy8rFIM4ekW7niFXMXmi8TcuGpzBCzGpQodPT5bLXHk4VcWMkAat/vSBh/PyTZ6ZWk/Y5JeDEGEArcQa4YZ2E5B893tqyb1AX95SDgy8e5+zuYTW4Nrh6IfJlstrB/hn5RjaNcpDMokVzwZlednjuckzqozOPgYnyMix3pIEfkHV3YHWMHadSGYgt4kfwy3/gBiiSmHdxECpIm4a+S5i/x5v41lfMlhwr1IQdsBsKftXrdXYFoyS73mbZ6kGbVQepORqFnSCVRNMe0C8gNJkabHJzi/V3w5+Lp90U9t1cxRTVWEhZV/b+QK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au0BypD7hjMkW1NmsRUpn0eJuS8LJaAXl1P290c0w80=;
 b=l0+DkPDkteoRNvY4jA5Vy+04X/bK5SoMN980AzwsCIZVuA6XduQrbVQATrZzWdOLO4Q/ex+MjeZE+nzVNYKi3MZ8slbpS7OM6dn9MsGR3ygItcQFdSkvnqwRustwtCsjIc8QwPpaYi/zS4O0ioZiVsmMwxoW2zH4Ub4QBbz90wnkpxXzJ3d9JVfHooOQun9K5nVXiT4Jpbb3tHDQGq/ruSOR13fHdZXUZx3+xUaqCfGmbf6Uf+FoVk0KGGpWcWlkGUDb2CTeSuAfShzr6ekvpfWKqzOry0H5PT9Ho8erW3rr4TvPc6DpHSRruqLL2l0fX2jUCvBdsyyPrlEYgG3Hqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au0BypD7hjMkW1NmsRUpn0eJuS8LJaAXl1P290c0w80=;
 b=tKt7R7OxR2yWgcy5GqC2o4Sx6QkHrpOJT/XJzg2qhmkWWyVs660we3CyrK7RosfToqKI5/EF/vnS8s8+n6L0+jNFnAsU6JU3KAJRm+M+aBBTSr0IZ8gC6az2HjiqZGdpFSmhAJSntH95+B9BFF22uAdYGDgVc3XdTybIrN6IQUo=
Date: Wed, 16 Feb 2022 12:32:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, <dwmw2@infradead.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 RFC 4/5] x86/ioreq: report extended destination ID
 support by emulators
Message-ID: <Ygzgz3PONncqIH16@Air-de-Roger>
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-5-roger.pau@citrix.com>
 <73c3db96-fbca-9d03-d645-4d44ab6a640f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73c3db96-fbca-9d03-d645-4d44ab6a640f@gmail.com>
X-ClientProxiedBy: LNXP265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::34) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5e84408-a0ac-4c91-3283-08d9f1400770
X-MS-TrafficTypeDiagnostic: DM5PR03MB2572:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2572CA594E95CDAB26D2ACB08F359@DM5PR03MB2572.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXSNeisNKXAcgRHcAzurFXaF3t/lom7siuX2tPKvGWhNEEzESyBV0ksm8tmZ/vJhovUwXKd9x2DsMfembfo06w2Ep5AISm3xxPWDaVsPR3hZI6E8hK+DZd0JAKhpaWysMnghqsF0E59aaNhmekQDUzDIG8Jq10Tuvd8iBtaziDJAxn9QbGLOuE9f1ZTKJUzZxbJMRyv9DZRTaDy6M18DJuYw2ekKBAlI0i3fq+paGdK2KUY/BUzIZmZQHFdAjkuJFAqLZhWeDffeSuvR589h8sQHPc41WXUBKqsUCh6GEuWOoCEquJhxur6moBUwP9JdKzREENL8NftQtOh8bfMwLjnrYXHvovyg1poNsuaznyNb54TPWDoniYkZudbmXWm3YUnDnhYcs46FU7XbBR2w6rqqsb24Ii80XpM7xKwc90EwGOgidvfpFzFMqcbwfvaywneIhPwW61OD7IPJBJ35OAtsjO3uKe0oep0ULpbktskP/h1h2gOhBOi9Z0sWLT8MFPmt1vYlb+qQ4r102gPSDOpG6g6UOJ9C5v4+AG9XEHU+k2E7bTi3tv7A+RC8ekqyNX218W28ipLdSlo1ZteNlxkrstxpv28N8kDHUupQ2m39R2O/st9d9H9kYoEfU3aUFt4A+BzkFrEZyl4z+602/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6916009)(26005)(316002)(508600001)(86362001)(6486002)(9686003)(6512007)(6666004)(8936002)(66946007)(85182001)(83380400001)(6506007)(2906002)(5660300002)(186003)(33716001)(4326008)(8676002)(66476007)(66556008)(53546011)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzJsenJOVnE3aUd2SlRZNUV2aDdxYkJkSGViR1hXc0hWNGZkdWRxTkxJSkpM?=
 =?utf-8?B?eDBGOEtndnJ3aTlFdS9naU43dFE1K0JsUi96Y1pVVDc4TmhMbFA1ckNjN2Uv?=
 =?utf-8?B?YklwT0pDQTA0RTZxWjZHb3BkbnhUL2FkbHdsK0RFL2RneDR5MENqOFBuKzkv?=
 =?utf-8?B?Z0ZYVUQwUkdpZ1NwRUF1UEp2c3d3WGRHYzc4VTkyNTdnUVZmQnVFczg5dUFJ?=
 =?utf-8?B?dUhDSTN0ZWpNZzFCUm1ZdDc2OHdGVy9MOG5EQUUrRU41NCsxL0lwMEs5dmJK?=
 =?utf-8?B?MHZEcDZ0YldvN09BVWpJUCt5b0VJcXRrRXJldjBtWnlxaWJ2QTZPQVFFNExP?=
 =?utf-8?B?MGNjVHpPSmRWMjNrU0RMWkUvMDJwblFDTmdKS3Q3aHdodGpTenRJQlZQUWE2?=
 =?utf-8?B?OGNZcXdhdERzdDA3TmV4SzNEaFVsMEVDbHhYWnU2ZmNUVnVadUYwU3ZjWXox?=
 =?utf-8?B?cE1sbllGTzkvRldJWWxKRHA5T2luc242eDVreEpLSnVkRXpURnZrbzJLSXV5?=
 =?utf-8?B?MWJBY2tmeTgySkdOMERPVUcrcUF0YndTQStxNDI1VUozQ0w2VThHWjNLMWw3?=
 =?utf-8?B?SXFnczRBSkJIMktDejF3QnUwVTRVN05zclpuMkNwLzZoM0RoUTA2L3QwYUdv?=
 =?utf-8?B?ZzFObWtQcEZTUy8ydW1ITXMvNEdkcWY1MUxzN0pINHlyVXViODJmUnprZk1z?=
 =?utf-8?B?ZFdCTFZOY2tYOVVXRGtiampDOTRkWElmekVraHpNNTF3SkJZU3JQMWoxc0lq?=
 =?utf-8?B?WTlSQy9EY3p6aUU2OEhmNldkOGIxT2x3TVR1RUR3SDZhbzNtZ2ZmZHk3VnlV?=
 =?utf-8?B?MGJZdG5tTkdPRDhOakZsckRScmluOW45MFlzT0JpREUwanJ0c3ZVN2dmOFAr?=
 =?utf-8?B?RDBlTlFXNUN6cGlMdXJoYnV0aFQzakVMaFgxcVN4WVM4MGZtZ1hTdks0TjFt?=
 =?utf-8?B?NlQ2WHBNS3VSZEpQYklxaDBjd2liWVhxNnpjTFZNTUhkVXd5N3o0L2JYdXBi?=
 =?utf-8?B?RkhCMkRJeWN1L2VHbEI3OEdCczRyV3hDcWFTSm1HRjZURk41UU1XWjJSQ3hB?=
 =?utf-8?B?UG9peEJtc2g2aklnQ0RzbmhVK2VOTTBPRGRScTlQdFIzTDA3NjZEclhtK2Mr?=
 =?utf-8?B?cnJsMGhWMDg5MXlxbU1RdGhkVVNaN0xlVFNPSVdRbEs5MS8wZG5LQ2MxeWNW?=
 =?utf-8?B?dnlFMjU2TUtaYmZ4YWMrWk5tblcxS1h1R1hjemQvK1JnczFQcWhwM3ZHVFBK?=
 =?utf-8?B?a1pXcVYxYU56RnhZUjhTUlFDNmh1UEZmNXFGTXNaa3Zralk2cVk3enhTNkZ1?=
 =?utf-8?B?M0IyQlN2dENHUjdCNklVNHU3c2NQV2RXU3JGRVFNWFpKVHZsdjVlZmVtK1FZ?=
 =?utf-8?B?SXRoM0VjUnBTSDBlRHpIR2kyQlF6OTBJOGJKL3NuNWxHbEo2UEhJS1dkeDhS?=
 =?utf-8?B?RVN4SmZZKzFxK3Y1ZkhyZFRydENxYXpvbDFWdWJrdVFyclhmMVF3M1BvUFQ3?=
 =?utf-8?B?ZXUwSitsYWZwNTVlSGNoY2s1OEY0Kzlia3B0bkN4Mzd6a1VtV2ZnUDYrdFNk?=
 =?utf-8?B?MmJNMXFqTjZZM3BKSFRzc0pBQzkrY2tRZWZ3Mkh5WHlNYytPcHlaWVdZV3BN?=
 =?utf-8?B?dGpJQ3BaYmc4TmNLb1FnemhUSS9ueXM0dTQzZi92RWJwNmtuQ2ZlSC81L3JD?=
 =?utf-8?B?MnBjL1ZKQ0RwZFgxRVJHWHdQaitmYVBxUmZNMTdEeVd6d2F0U29zZDgwaFQv?=
 =?utf-8?B?eURWcUwxd3NWNnpLL0xhMVBYRVUrNk1uVmx0UUE5bEppQTAxMWdjS2NMSEc0?=
 =?utf-8?B?anhYTUkySUtSK20zZDcrQURTNy84dGJUNExaVzdPakpmWUIxODdsNVZxYTg3?=
 =?utf-8?B?SHc1VEkvdTc0SDhKZEIxU3VYWEcwY3BRVlkzSlNZY2FkVlAydGJ5LzlTWEJ0?=
 =?utf-8?B?Q21ydzZhSmQzSmZHTmFHT01WNUNsUEdQUlh3V2FiZmpBUFJENW83dVpBbTFC?=
 =?utf-8?B?ekxnOXkxVjBBa0ZTVlFMSko1VktuTE1CNURnTmtMWWFQa0tjaVEzRTFyd2dn?=
 =?utf-8?B?REVFRlRuY1ZRbEhMTTBlVG0rMDdFSmN2NHp2ODIxYWlxNFUxeUtzem51M2hG?=
 =?utf-8?B?Z2lGSDdBV2wxZkJBeVNrV1AwblNOdEpXampBZFYxdmlkVXZaMU85d0ZMWkI2?=
 =?utf-8?Q?aMz+o/Yxt/i50ldXpfE46kw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e84408-a0ac-4c91-3283-08d9f1400770
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:32:35.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzI5kOEDHHaHeLthGWL0ATNu/N4zGLviSy24Qi7tQZdgIRZGO3eM8SyYjrwPAk0QqXKQFNXLxWI6Fv0Eoa8C2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2572
X-OriginatorOrg: citrix.com

On Wed, Feb 16, 2022 at 10:53:58AM +0000, Durrant, Paul wrote:
> On 16/02/2022 10:30, Roger Pau Monne wrote:
> > Introduce a new arch specific field to report whether an emulator
> > supports the Extended Destination ID field, so that the hypervisor can
> > refrain from exposing the feature if one of the emulators doesn't
> > support it.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >   - New in this version.
> > ---
> > RFC: I find this kind of clumsy. In fact fully emulated devices
> > should already support Extended Destination ID without any
> > modifications, because XEN_DMOP_inject_msi gets passed the address and
> > data fields, so the hypervisor extracts the extended destination ID
> > from there.
> > 
> > PCI passthrough devices however use xc_domain_update_msi_irq and that
> > has leaked the gflags parameter in the API, even worse the position
> > of the flags are hardcoded in QEMU.
> > 
> > Should the clearing of ext_dest_id be limited to the domain using an
> > IOMMU?
> > 
> > RFC: Only enable ext_dest_id if max_cpu > 128? So the device model is
> > aware the domain must use ext_dest_id? (implies device model knows
> > APIC ID = CPU ID * 2)
> 
> There is still only a single sync ioreq server page, so 128 vCPUs is the max
> possible.

Right - so device models wanting to support > 128 vCPUs will already
need to be modified, and hence we could assume that any HVM guests
with > 128 vCPUs is using a device model capable of handling extended
destination ID?

Thanks, Roger.

