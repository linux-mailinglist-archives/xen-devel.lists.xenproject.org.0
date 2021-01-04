Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E82E9BB7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61395.108002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTM9-0008Ol-Cm; Mon, 04 Jan 2021 17:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61395.108002; Mon, 04 Jan 2021 17:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTM9-0008OI-7X; Mon, 04 Jan 2021 17:09:21 +0000
Received: by outflank-mailman (input) for mailman id 61395;
 Mon, 04 Jan 2021 17:09:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwTM6-0008OD-NN
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:09:18 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6abc34f-369f-4f2c-95ae-3b092fae65e3;
 Mon, 04 Jan 2021 17:09:17 +0000 (UTC)
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
X-Inumbo-ID: a6abc34f-369f-4f2c-95ae-3b092fae65e3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609780157;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gGZaYqxk6kGvWHq6w/3wYYOwvXOD/y3XDpcnLIYzu2E=;
  b=eiyAvwDfEaW2tB60XRSEnkenQGm7toq1asWEigvD2VvDGedIrCwb9EX0
   NUx6ZTGenk38fm5ezuGWhUtcPkBWVTDmF4k/9ibIUWrzAL+EdeLMoBbcM
   38GyX2D2eF3fY0hXQ/FZJn9XUGUyUicjem9l93kbEG5y4/+kyMYe9bBIU
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fnUqZQSTRNtmaysbVfSKhUv+CP2W5cXjIkA2SpkmgujYoWLxBHNDuQ6QEqurpsjvXAv66g7P8P
 DGBoAR6KHwr+ADrosqtCV80ZmMdECQk84WMqKTZzCJs4TVM1CwjFdwgJsfKVMcfF/xPH4t8aTi
 1KM/QWbecVA4YB6/oLa8HzvcrOE5GJMTB8R1skrLpR2dlvAJdcnWgC57FJ7sOWWKK8r0Hjgefn
 iUJD5uofFMKs9t/rkFkoNbwBkQe2ahX3tkPDw3KJcx78EnyKaTBowAKafe/Um7pUgP6VnXmbHJ
 fik=
X-SBRS: 5.2
X-MesageID: 34360155
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34360155"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7NbxAhgQxTsCsJlrloJjx0H/9P8mchcKi3tdpWCZYPyrwefrYxezPCacUDdzJGpqpNsF3x5wA7lBwtSpKO5ARZHbKpsdKs1+sFnAfphWVfPuF+1UrJ3deYXi3KxN6F1Xlg3f3PwWYxrCuj82S6vcAJb4ahKJC5sF0YiM8FxB9QwpMMINeXIRW7vAti/ZTVVII+M5Y1yTJVjs1Lw2TuOQzE0ogCB4MAtc+AmlD/sr/gAIKxBosEFmqpenn4/+3g6RPubZHEgITAHnDpMgBAPrJErKDFWt4ASddu7P+VVtQzBjc7GEuvUVXZgqgnH+mFRByNJpL4lZlRPJNPrJPb+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nWgcY/Tgu0b7J4VRGJFjE5oHlVpiCAnhaOAbPHmjVY=;
 b=i72MCsqhTMxea0yyhVGz7rAD1Gd2hzyUaodajyQBuq8UK3KRU0E4Smr10ehLOjDwNhXPZVMk0sOfDfPa7bnBjOIFGpDf61PL5B9xxROHVcAU4ieZsn8sOgdqCNx/sRhwESD6cT/S6Ax6gYQ7ieCycjfnB+RakKenJ/c6vIXglTO97x1ki7mcZTfcuvmiKZLm6tDqFEl5qyi68lWrV7x8DCTz097Hc9luQ8e9PS74YzForVrWDuhlw68TbiRh/M9WiA9IkPuHjKFcFFdHhaLLOz9uyTLX85wGDynSbsmeFcmVWRnvH3nZ4CiX0vB/cjt5W7MsHiIJSnFH6QqFJO5T3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nWgcY/Tgu0b7J4VRGJFjE5oHlVpiCAnhaOAbPHmjVY=;
 b=AzdFLFH57arvPNLkCBVo65Ayn4rHH+hWEtjjd8h9rAD2a1LxCuxBru9Agpr7xoq9REYO3/XoAPScql13tgGnBrRZktmIQzZXusVjUXj/U5ZixkzSsPPzcd/gz2uzaNGn9b5iMBqtdvSFfuqwoX4xlT7vfwcUYcmoV54vwAGBNWI=
Date: Mon, 4 Jan 2021 18:09:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/24] Remove NetBSD's system headers. We'll use the
 system-provided ones, which are up to date.
Message-ID: <20210104170907.hrj4aa6u4hjvidhu@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-8-bouyer@netbsd.org>
 <20201229114638.yegfswyqzhz7tj25@Air-de-Roger>
 <20210104102552.GC2005@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104102552.GC2005@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80d13609-6409-4ff6-be55-08d8b0d37610
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-Microsoft-Antispam-PRVS: <DS7PR03MB56065934DC8314A7011E621D8FD20@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KNrRzmQWDhmC8sDzWZN+gGIgzEaYjX9L4VHWriIis7C4/AANHKVPQWyOzT2FQBAz6B07mSh6ccKXYOkhF2dm583BJDCu82ZTTTOjJvKIFCgDDqdNC/fZVt9QQYrMvwthr1TrFTpfHofRm9d6U5qnLPUaBiQ6Wxi+Vuy5STKGoFe1DAGlreyVU0njNkys8fcsUhmlnUt4xCGVGyjp9Pw4cbkJ0aSQZIjEJ2TsCRUlxhI+g4JApMYHzK9fDmyCcJxXHJrJtekEflHnYT0dFmXV0uNwoFP5w6mxz9NZ0Y1Ov+1wUtukG23X7gdSt8xRmmHULSNMPIEpFa9F/palz9PRS/+cwD7i4PYpg5Bl0WmghlwRB/o4RMZ0F8iX9Edi3wa3LNSDI+GSeXwLcC/EY+uCZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(366004)(396003)(376002)(346002)(66556008)(6486002)(66946007)(66476007)(86362001)(5660300002)(2906002)(956004)(4326008)(26005)(9686003)(478600001)(16526019)(186003)(83380400001)(8936002)(6666004)(316002)(1076003)(85182001)(8676002)(6496006)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkVjNnl6ZlJOelh6d3kwTXdjeTdVWE9TUWI3YTI2N2NiVG1SZ0JOREs4MzZF?=
 =?utf-8?B?VEJqOEtuRGdteHo3bWcyMWdxMkJkSGRLNkREdG1jeTRUQWE4RW01SFVDUmRz?=
 =?utf-8?B?Q0ZnWWJ0TisvbHlOQm9mMXp6TnlHdGU0c0JMRDY1bDUzbko1ZlFMenVFQjU1?=
 =?utf-8?B?QmtQbFE4YW5pZE5hRTJhOGt4Q3E1Nmk3RjlaNkhlVGZCaW9CWEVGZ2ZmcUo5?=
 =?utf-8?B?Z2RPakhxSGluaWRpTzlxVHkvbEl6NHA0T2NCdVR5NzB4K2pVc0locDlaK3BZ?=
 =?utf-8?B?SmpSSm50dDRoR0RMMER0NjRsOGU4VWJjVXZhOXBKYjhmbHgvVHlMNEM3UW4x?=
 =?utf-8?B?NDB6d3g3UnJ1SGlYTzFKRlNGY3hKckxEVCtVWlA0bVFUZisra0VrZUlIVDBy?=
 =?utf-8?B?RW96eEpaL0dSZDlQL0lhZDM2SndhZi9HeXJNbmR5eWZIak4wUlFBVWhCTFkw?=
 =?utf-8?B?cEE4Zmcvbm9VeU8xWjNIV1dEZVFZUms3d3NmTTZNMEEvb3VuNW84SGh3YnRI?=
 =?utf-8?B?Z0RnMllmTkc0SHhXWkdKVWR2MWFrMXdGOUpOUHdjUWpaV21hZzIyTTltVXV0?=
 =?utf-8?B?STFOczIzSG93QjFJOWhEdm85VnpHZFBhb1g5cXpUcldDSGJoRkpoUjVveXlI?=
 =?utf-8?B?Y3RNYTlRWjBnYThuWGpTcnZFc3gvL1JvZWk4WXY0SFlUeXc5MEYzVkQ3aEIv?=
 =?utf-8?B?czA4SDNUNVpVZDZYeThmMUh6OCtndVFlTGdaZG8wQ3NFRzB1MjVzcGdsTm9T?=
 =?utf-8?B?dXltdmhpbENlMDJkT0RYQ3FzeENmMTVZVzR3SFR2Tmllenp0K2o2SEZUc2xJ?=
 =?utf-8?B?NGx4eEdQYit0bTcwdFJ1U2ZhU1VGNXdkOEFBZnMzSUlxY1lBcUtVSVJkbDdO?=
 =?utf-8?B?VURjSGRJQkZmbkhlWU5KSVdtNUFDMXJ2MDcyVEVkL3kxUmdqZzBmRnRLUEFT?=
 =?utf-8?B?bGgra0dFZ2ZueUx6b0ZnclFZcFBCS3VENStXekl5Y0NiVTVqMHYwMlFtZ2Nt?=
 =?utf-8?B?eGF1NHRQcmh3WFJqL2l6ZEo1NjB3ZDYrbEp2czZjVDluNTlna2dNdlk0V2hR?=
 =?utf-8?B?c3RlUXdsMWd2Qk0wSG1BNXBRcTBqeFBCTjhXVklSalZ2enAxYWxHYmxlQk05?=
 =?utf-8?B?eGc2OStPbVc3WVdrZUtxd042ZVh5S3VnQzQrZDhBTm5Db0UvMm1EdUliYUVT?=
 =?utf-8?B?TVpZbEpDbmVOdzNpMXFUaXMrZ0lpM013dWZCVFV2bGpKNGRaWURLQ1hkZEI0?=
 =?utf-8?B?bmRSV2xPaUFieDN6aWxmSDhwZjhUSEFacDRFNGhQb3JMTFMrOFIySWxjZHIx?=
 =?utf-8?Q?C/LLHu+YOvf9eYb0NDUh1US/UbszMOKaie?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 17:09:13.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d13609-6409-4ff6-be55-08d8b0d37610
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8pLNQNLrVz5KKqG5QXe1zBrdDVLRBqKMO9qZf7CqzPRXuzNPfKU2rNskvbuTFUaW4BiHG66EO3Qyrywkpt96A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 11:25:52AM +0100, Manuel Bouyer wrote:
> On Tue, Dec 29, 2020 at 12:46:38PM +0100, Roger Pau Monné wrote:
> > What would happen when a new device (or ioctl to and existing one) is
> > added?
> > 
> > You would then run into issues of newer versions of Xen not building on
> > older NetBSD systems, or would have to appropriately gate the newly
> > added code to only be built when the headers are available.
> 
> I prefer to have the build fail if the system isn't new enough, than
> have it build and then fail to run. We already have version requirements
> for e.g. bug fixes.

We usually take a different approach for Linux and FreeBSD in
order to support all kernels: test if the new ioctl is available, or
else fallback to the old implementation. But this requires having the
new header even on old systems in order to have the ioctl definition
for the build, even if it's not implemented on the currently running
kernel.

I guess you would have to use preprocessor conditionals in order to
keep the build on older versions when adding the new features.

Roger.

