Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83996325F8F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90139.170530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYzJ-0007Kq-DC; Fri, 26 Feb 2021 09:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90139.170530; Fri, 26 Feb 2021 09:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYzJ-0007KR-9T; Fri, 26 Feb 2021 09:00:41 +0000
Received: by outflank-mailman (input) for mailman id 90139;
 Fri, 26 Feb 2021 09:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zK4+=H4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lFYzH-0007KM-M8
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:00:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06285692-3f75-44d9-b64d-a74935c1d1f2;
 Fri, 26 Feb 2021 09:00:38 +0000 (UTC)
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
X-Inumbo-ID: 06285692-3f75-44d9-b64d-a74935c1d1f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614330038;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=gXbZzcVyPSH7VpANcMc9mc4rRjd993p7ZSowGV8SYGY=;
  b=Vx9PdrC23Ff2dyBUPteYrc+QrOQZdWx1K3o5iRBTBTAiurQ81zcp1bgQ
   7gWyO9AyOBRk7ud/MQomh1gMnZ0RlGSmaKrvXfZunpC6onyoabJ2RRsVb
   PcMrKO+Jf298RG/PvtY4k78bvQZKn73cs/+V5ctvYUSPTQnMRSOUvU5sg
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0odw4RDyCKB1wbwD/7amzGcfHSxrbGua3dtSPSvZVsq6wO0PX4IVajTsXPHOmhaVHvi2Ts4/VZ
 awREbBGfIZlKgOIUFPM1BJbH0k/7oUbVNLKEUv84WX4ZZhBBjUqUSwE5o5i9aCGljbT2Lw1Gmh
 gu+VS6bWsh4+tT6a85encNUPdFrp4L2j2cuCpLFkNtT/Eit0KaU/YSghBRYip8JkXoGgI+p5Uo
 leeFPGgjapD3LYpIYnWJH5pyRdVwTs7v5gSa3Ssv02TRIqV4Rv5D6eDyx5LN8gt9AxmD2qEN6s
 olk=
X-SBRS: 5.2
X-MesageID: 38015329
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38015329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+3dau2enC6Vrd0BGIn8ZEFi6dL9QixsHT/yuKMsN9htHzqr1iEVy0M9/XWaeP47sqA6YrTfL1sEZNvn474r5SMnSp0XC3FAzmQo5XhXZy4mtXZkaS8q+eo7ivhD6bHipprYTagjLoeuGzVoc17AkXI/Pp2s0i5bqT++LVUvo9cgieLFxdf9MjtBv9dmIWmPdywe5xcKKzqSt+DAqRRYapQJJYp0v/8HhwsF9XfwSQEJYyC/PHB429dYacD+XeJtUrMiw/hSnzEBSHHqTudJ7bIRLJwPVR6zRNonDA6foPhRmIN6KTLgrZL421n8Q+hQ+977BGlK9I3gtuvIMsg66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPerxV7xu/IWz1CufDmUXDCXn9MszM2GBog3PpAeQX4=;
 b=OBv/jErmO4L3ak5qIBFMKBv1GOPSft6e4Q6ktlf1mDEgRH5yHnBLA1DHssNgcsEy7Fs4t5HfLPtDUmEa3KzfaDLxGuQejK3l26fkS2mEDUYyoDjrgW8d4FrlCkUnG9Dh244wnPXNGDsVBTW2dxBfBYcmzAtBynEY7mDwh8MUjmdCyGt0ICEswFHM/6I4Jk+bWbkvhLSJ9WdA8XJLSlfw31l+1UhXyjbWji318kHxYJaXk8NwmNM54cSa3tqoa4EmftM6bEtJpkdTo8BYdZuM3NpGg9rXz2AqJx5xVGDcKZFN0M3u1PvT2w5XUtcWIYVqsSU/ZivVQbwCxfts7FQ/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPerxV7xu/IWz1CufDmUXDCXn9MszM2GBog3PpAeQX4=;
 b=Qfhs9sHPKMCMGmqk00d+JdFPxkzu3MVIAA5fd8qoBMY/qYwVnHvTSEvZ+GD8WppBZlHECf+0BKl3RZFCt6ux1OsUm0UEsmmptoazM3QKWI9Cvz7g2DjwTg8t+m/dnzvsPShZ7bjfLwVfW/eL+xlJwfJAHBwdyStatD+hEAdUjpU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [PATCH for-4.15 0/3] firmware: fix build on Alpine
Date: Fri, 26 Feb 2021 09:59:05 +0100
Message-ID: <20210226085908.21254-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91ad3921-096f-439c-550b-08d8da34fa71
X-MS-TrafficTypeDiagnostic: DM6PR03MB4394:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4394A18B1F2877862DA6B4F38F9D9@DM6PR03MB4394.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hG9CH3f1MnwUkYH71w/GPpnWMZu82M0Nuwlr67HNXHCWo/HPItgfXrLB8ZVVXo1IAY1LkrAJ6HdBUOootu8pZnsX0G1Md0Nbw7aVh+4be/0GS9UYRovcDLOdoI7i3qQ5z6Z8uQdMyVSIUacVSHWFhDyLiY5XoldCZ1Uc9TL9WyULx8Ikt7LPf8gbTGLBEQmxlxUFWp/Y+Q722yzVBLP9p+b+4BWd2X9njgzfbeo3uKnSlBRB95MzRvMlfXb9xWaKz+4EV3kfPDAHtmJ2+YXzwPqEK/4SdMB2gy5/6sNS+fPcFT8I+X7+u34ZGUqmbbHi5gvSkBdJofGH5Rvp5B8gxKQXejM4iCM+e74hK8u/qM6uhJ0VWS26Nmbf7Zd2mcvfwmUqvqhOtfKAgbTPWa7hKSTSlKstXVQ0m3Cg9WTOHrTJrhBrKHyjs7z+RWTYByeKJGGiqtYZqed79AmQjtvHLlvW1LLz93tSp0RBln0i7s+bE1+6B+mwu2askQT1BJ0VI2XHDwwHQFcboOzk8ysG0j1ZDSMKZ9MY/YKkkPWdTrvVoEHkjIOwywFDXG5Z9QIrbgV4w+eftM3KNiyV6963xkKJzBi+5DtzHjCaHCJpbK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39840400004)(6916009)(66556008)(66946007)(36756003)(316002)(478600001)(6496006)(6666004)(66476007)(86362001)(2616005)(26005)(4326008)(54906003)(186003)(1076003)(5660300002)(16526019)(966005)(2906002)(8936002)(956004)(83380400001)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cm9zS1VSckJHdlNmQ1NMSnVXNWdDNWl6aGFXRmNtcjRvR0lCSm8rWURSWFB2?=
 =?utf-8?B?OHJqWXJaVWc4Ui9kcnF4cVVCWjhpN3NOTFlRS2VmV1ZTYVNDV05sa2oyQk1J?=
 =?utf-8?B?YWQrNks2KzdIMUZyQUVkaTYvTFZmL2lLbDNPVjFPYi9TWHBMMTBCOXJLZXMx?=
 =?utf-8?B?eVBvNHFuNjIwQTdkemdrOE5WRDZ2QUw0SXRjbTROT2VRUG1NdnpHcHpMMUQv?=
 =?utf-8?B?eStyMzVuSmpoUFJleXJYN3lobVIwOFYvOVNVVThKR0lNTjNpR0ZmcTBCNHdm?=
 =?utf-8?B?ZXBteGJhUGdLVmV3V21mWk85NW5FaGU2eENkS0Yvb3FtSzcvb05HcHVvdjNp?=
 =?utf-8?B?Z2U4cG9RUFFydEhWNDJPd2tzaVByc2ZIdG9jOVNyaFQ1UHhVVmtwSldmdS9F?=
 =?utf-8?B?WDFteXhYQzgxaFVIR1Q4WUhabWFwUmdPdUdtY3pPS0NJREJFOTdieElxc1Yz?=
 =?utf-8?B?cTdKd3NkelltMXFzU0pYYkxhUkI2NEpHc3VPSjViaFVFY3VpSU5pWVNsYjNl?=
 =?utf-8?B?M1VmMjJGekJJSkt1REtQaURQVTg0TlNPem5tc3d2OVJRRGUxZ25ObjdoZFBh?=
 =?utf-8?B?L2tOSVdoUWlzV0tUMEwzSVVPRTMya2pEK2o4UU5KcmlRUzBUMEkxSzFnc1hp?=
 =?utf-8?B?eGRPVHlWUHpDMDRZbkQ2VXNQUGN6aVhjbkxPTzVpYk94cnVKZDAwSWpZN0VM?=
 =?utf-8?B?cCtYU0ExYUpNV2xVSy8xUW1yRG1DV3F2ZkJGTFJNRG1MSlZjTzhpVXpRTXVM?=
 =?utf-8?B?YzZXdzZSTmdhRG9wcU8va3UrK1owaHREcXNYVDJHVUxzWENleWpqTWtRYmFp?=
 =?utf-8?B?VU5JN0ZEZko2dkpzdWl5bU1XS2I2L0xFVTZPcHRjRjNVZ2F2ZklQWkFKejho?=
 =?utf-8?B?MWk3TkZ5bGZIWjJJOGZyVlJmYUxPb1EzbTI0VFMxRDNpTzBSbFNqaEVUU21o?=
 =?utf-8?B?cjVLSktWSEpFdEJQdUNLUFEvVDRhWXlpdmNJY3lyNExsTC8weFB4T2E3bmdC?=
 =?utf-8?B?d3hzbmQ3YVZUQjJDbjc1SjNQQnRmV1AxR3BXVmp0MXNxMVpTV0RrUUdWSDJQ?=
 =?utf-8?B?VnlUckJQVVNPc0grYWRnQXBLVjJkcS9KaFg5WDJZQzZkNVI5R0ZzcFhJcFZX?=
 =?utf-8?B?eGxqQ0VEVWh0bHMvcm8xRlNIUHlWOWVEVGd0UWc5ODkraXIxNGhzQ1lTZlk2?=
 =?utf-8?B?VmxQU09KMExhMDZNWVJJclpQM2k2cHVRSUNQVG1IS0ZMVHFaM1YwOFU4MGw5?=
 =?utf-8?B?akxVaGJQamFMK0ljL20wRWIybVFaaHRmdVNVMXk3a3MwZXFnRDhCcGZDVEpJ?=
 =?utf-8?B?Q2hVRyt2M1hHaitLYTRpMzdkWkh6MEtSN0NjT05ocDFWUC9kTlJQZ1hRaDNG?=
 =?utf-8?B?WnNIVUEyUE04TVZlcmh6VGRkT0NvM25VZStHTmd3YmdYejhwYkJtSU1PV0JQ?=
 =?utf-8?B?azdhRi9PVHJ6VlB2TTB2eXdUSCttNE5oZnR3TnB2VVRJVnRKdWhUWlpFeWV5?=
 =?utf-8?B?SUx6dE4vMHl5aXZQL2FMcXZ2TzYrVjM5ckhUZmg4VmVEeWJlaFBjeTd1Uml4?=
 =?utf-8?B?L3lxd24xRUE3MHAvclp3Q0xPM2lzcElnd25kOEZFQTVTSnhSTmRmMUVVT01Q?=
 =?utf-8?B?NzluUy9UTmUyNHUvbENsK2FVTUtPektuM3drbnptbldDblByelp0eDltQ0RP?=
 =?utf-8?B?SzU3RjRyWWNXMlZaaTZWYWw1Sk15OW94N0UxdUZ1Vjg1QVJVRXJ6MWhiTlhi?=
 =?utf-8?Q?wExs0Vs4eIAVNuu2hsTdXNUq4nKuKFUNI4K/aHQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ad3921-096f-439c-550b-08d8da34fa71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 09:00:34.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUKZo4PfLJAwMs4Umr07+7VD55sDogjTIELsYgN2/iK/Y6MSEvQQDxK5Tf+hP0QW22eP69rQraSaU0naRVR2YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4394
X-OriginatorOrg: citrix.com

Hello,

While the series started as a build fix for Alpine I think they are
interesting on their own for other OSes/distros, since it allows to
remove the i386 libc as a build dependency.

THis is done by proving a suitable set of standalone headers that are
suitable for the needs of the firmware build. Patch 2 contains the full
description on why it's done this way.

The main risk for patches 1 and 2 is breaking the build in some obscure
distro/OS and toolchain combination. We aim to have this mostly covered
by gitlab CI. Patch 3 main risk is breaking the Alpine containers in
gitlab CI, but they are already failing.

Wanted to send this yesterday but was waiting on gitlab CI output, it's now
all green:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/261928726

Thanks, Roger.

Roger Pau Monne (3):
  hvmloader: do not include inttypes.h
  firmware: provide a stand alone set of headers
  automation: enable rombios build on Alpine

 README                                        |  3 --
 automation/scripts/build                      |  5 +--
 tools/firmware/Rules.mk                       | 11 ++++++
 tools/firmware/hvmloader/32bitbios_support.c  |  2 +-
 tools/firmware/include/stdarg.h               | 10 +++++
 tools/firmware/include/stdbool.h              |  9 +++++
 tools/firmware/include/stddef.h               | 10 +++++
 tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
 tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
 tools/firmware/rombios/rombios.c              |  5 +--
 10 files changed, 85 insertions(+), 13 deletions(-)
 create mode 100644 tools/firmware/include/stdarg.h
 create mode 100644 tools/firmware/include/stdbool.h
 create mode 100644 tools/firmware/include/stddef.h
 create mode 100644 tools/firmware/include/stdint.h

-- 
2.30.1


