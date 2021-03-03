Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840FF32B8A3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 15:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92854.175057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHSZQ-0004rK-P1; Wed, 03 Mar 2021 14:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92854.175057; Wed, 03 Mar 2021 14:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHSZQ-0004qv-LS; Wed, 03 Mar 2021 14:33:48 +0000
Received: by outflank-mailman (input) for mailman id 92854;
 Wed, 03 Mar 2021 14:33:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHSZP-0004qq-1n
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 14:33:47 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee3ff13c-ba6a-4695-b773-0f15a782219e;
 Wed, 03 Mar 2021 14:33:45 +0000 (UTC)
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
X-Inumbo-ID: ee3ff13c-ba6a-4695-b773-0f15a782219e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614782025;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5zpGPDdBdvPoacuMSXSL+Llo16lv3MIqiM9IqX+Tls4=;
  b=Uk1+SHRi999k8hdRKVlm8a9+JoPBHT5aeVzkWLUDTHUzgI+jIHnBPaPc
   xrkwqXeqd7hJPnKuiSc4Z9JDMBdEMaVeGf6NzE3GUEAO4Cbbf98DtMxs4
   DBfzhx+03OYJ755zpVQGk/ICGvGC7s5OoR0j/yi2KCpWFzIhKUtI+hiQ0
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1egYPNoWOup/IkFR7UcOwAzErzjbMN9rhZqC0y1khIvA3V/k285mUkjYZz5VaDsyZN+CJ4bot6
 k5JBW3RQjkT6WpwvkhbaEzBz9FNmdxyM13NXcF7fSzMpdPZfez6D8Aym6eGg/S+2V8szCWF8A8
 BSYgs6VKF4ghL0K5CZMmhcr+1Q+hWuyZ3EVPN5Z2yAhWudcpd+dlTzJuVwJ5SxCK2B18JddfP+
 PeXW+5v/KfeqifvJTXxuI1eCcbm2js7cIpKiBFMMIRrqmb69848h77c9GIWrmVjJRIqcFmQLdj
 TI8=
X-SBRS: 5.2
X-MesageID: 38353694
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,220,1610427600"; 
   d="scan'208";a="38353694"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+eyvvvqoBhNROXe6B5c1fKN0AlIx52kbEan1JE/agVXt8hhzx4O2lPGgw/6cHiiUwyH1u3SoTcFFlgZ6W/GC4VEkZzGG2gKO70hzqQ2tQn6s7mH8Qi8sWYCNiWAbrNgKeKz5oMKsaVcXNUdfIE9GfM6ep69dChbNSKrczyFvLQyDIBUZXXLNHKUrd+8Omb5L6WeWw+zzRMRivuvtKesakNVQaLdptjELaN1n7VTcfyT73q1uBspFEDkJGgxNQUuigMnghy0i5rRxnyetnY8qE7yNiWZEfdWkDQdvQXdYf4/HDdcdCMBUaoJVoJRJxQuPBHhM/pZYiKia203jxScgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5gijShhHPd5cTg9a+dSKZE64FiyKP6Lk5iwnZ8l7pM=;
 b=Bf2hAIx1ox08J8paDWMPAW7so4Bxb8eFNqqomfiVxI7p/Sblbdz0rZmdlhJqcPZmkKFGR5BpVSrrmWZk3bybHBlhZLBLwUUJQU/doW6eJ32wVsb6cicJOmmR4uJb0awG4rp6MuGkCpiiFazllLw/vS3yxi8a9YvKfIdHHYyP73z+G5U6icaFKwY+FHHinmBrwFcrnWAM7j99G5Ai9LoHU/IgXN+dwmirXPsucVrLezWEOYAGTdfhYbgr0FDbU5OOONOERPhXnAoCJ4MMDVMfM730zX7i4ZBtk9JfMYp9bDx49aPqRW3T63xEwxoRn3aabFGNEy6PrFVHWfEhG057ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5gijShhHPd5cTg9a+dSKZE64FiyKP6Lk5iwnZ8l7pM=;
 b=hd1vK6kDq+2E1Cx2nXM7l743gJITjY7GP6T42eMnenHtUo8OVVJk8AfI9VENRkWN96d9YdA24+ZXHOaZcHYzGrOyX2MU37VrApguLai1aGenSpuTdxOYXMl0FI53VFWsIQ+Ey0OT2ePff7jcWaK48lqV0SD7iCro/4shAZTPthM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15] automation: allow doing hypervisor only builds
Date: Wed,  3 Mar 2021 15:33:16 +0100
Message-ID: <20210303143316.16840-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c55d299-5384-40a6-f931-08d8de5156bf
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34817FD983C37115091E39CE8F989@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Z36JUMFkotM4XV/mH/EXMv80nL7b0ckFhfNJUwQu9id4Agix2jjIpyxFnKkUjMSgBVIiA8H9psulaFbI3P8y1qIbfTNC0CgnIygSqpuwPweKiIjGysW69DXamy9jUAlnDDYjX0HVuFXDZr9PedEatD3v8D3bOVferwsbZTTbMn5ranMq7579L3+IviVL0X/YC5GjeGH2BOIUpZ01s+DYDFeKoFSPxjYAYrD7e8zZiPu7IgrUpqj2YkJs3tKw7Rz16wD5hLJqiIa/yD/3e1Ra7/9SFSsdbN/x4AMnh47aK2G8Dlwk4c/YLTTqcwrqLDbf5U0J8GCdXPs+FJlcEJO9sLVMZWjBqrvJ/IutLO27dBBQ+HuzR9BeMkuHinFXkL1a/SVj++dOuokIPYG4NeAS20hfnDhDXPVZAOuFC9ypXakxe8yKLwzAqZd/0myMnvXiPIMvNagK79oWisE0KDOP3lKE7lVzCaxOOnI1XUJlpA8f/8nzvkvxrjS0PfCLyGO+2ghv62KeCWmmCt9ze/2gMGrF13lEj7Jk8WsE9Vmi0e1YGibHRzOfGNs1F3enLFGJzuPTQIDcHqO4yNVf62FisZQJPYgsNj8h78Ee/r8WH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(83380400001)(5660300002)(6916009)(1076003)(54906003)(478600001)(66556008)(36756003)(8676002)(6496006)(66476007)(66946007)(6666004)(26005)(8936002)(186003)(86362001)(6486002)(956004)(966005)(2616005)(4326008)(2906002)(316002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkpBUnd2QnJyQmE4K2g0Rm1QUVlNOHJpMEJBZGNCSFdxZXhFVnpYOWdqRk4x?=
 =?utf-8?B?TzJoMWk1K0I0eTFOcnkrYkMrRHhCVkZHa3p2K1A3NlRvY3JoSlFVS0RCbDl2?=
 =?utf-8?B?YXRPaTJKb1RpZWlJNjlMWTBuaUhydVN0VC9DdnBrQjJYNDNKUzVyVS9XMUpK?=
 =?utf-8?B?M3A0ZysrRlJQcUZvQlZORjBRZjZJcTBsZ1Y5SzFtaWRTb3Y5VklQTFhKRjlV?=
 =?utf-8?B?d1lnQ0w2UTBTUzdua0tlYVo0UVJBL0h2aUpROUFvNGhISzlNSTRSbXJTMXV6?=
 =?utf-8?B?eXFNd1I2QnJ5cUhJSllQaDErOWpoelRNUStpb0UxR2FsOVR0VzYzb0J0WE0r?=
 =?utf-8?B?ZDd0NUhrSUh4MVEyVEtDSUcyRG1VL2g4eDZ5MEQ2eGorYVlJeGVqRXpLZFIx?=
 =?utf-8?B?TG9wMW9jRXVjSWNnc0YxbDFYdHBKazlnR2d6Ui9aUllSZGFZWGloZ1BVYlh5?=
 =?utf-8?B?NnJkK0xDV0ZuSkV0K2dOUmVzcUU3ekZoUU9iTWFmWlJ2aVl6ZXRYZjlmWk8w?=
 =?utf-8?B?NjlvK3ptc2krRU83TWZpNEdNSnhDOWxSdkYwMGNISFVoSkllTnBzQUVuNVhm?=
 =?utf-8?B?cFRWbWh6NVl6MW8zcUJFY3BmRXhoeXJmdUo4NDVXTnJwSFk3VnJqTVUydUZn?=
 =?utf-8?B?K296QXRib3ZLVm1zS2JCWFdKTnNYWkRXelY2UE9BUlZObnVXYXYxLytOTjl1?=
 =?utf-8?B?RUh0WGtvdGZYSFlhRVhZelJxUm1nNTJJc1AwMUp5Sno0M1dSdHpGL1VXWW1k?=
 =?utf-8?B?QjBvejJPRnZKNmtkZVZRVjBVVGkxL0liTmkxQkdCVHowREJ4UlhDSGtEWlRH?=
 =?utf-8?B?bHFJZjBZOC9ydEdERGNtUlNubmRKT1ByYXVuMmk0cFg2QzU2c0JIUXNZWGEr?=
 =?utf-8?B?Rk41VXZVNWJOMUJxVkgrQWVWclJtMFRVZXhZeE5sTFBhdlZFZEIvTEpDVG1y?=
 =?utf-8?B?bjZ1WkI5MEJPYVRHSWZldVBLVzJ6TG1aY2g4OGFzZkZTaDlLVlBXMmJtcE1P?=
 =?utf-8?B?Wm9kOHl2aVdHVWJnR1phSmJWaDNSMmlDd3Q4dUpjMTU3VXhOaDNVRS8wWUth?=
 =?utf-8?B?VUJjWnVWQ2ViVGFnY1lhcmZZcGdSTUxDOTZGTTVEZURBMHBaSTlIV2w3REJK?=
 =?utf-8?B?cGxoaVUvdkRhVnFDR3k2TVFDTTk4Z09BYnhLN0xVZlZDN0IxS3RMZG95V3NG?=
 =?utf-8?B?Y3ZYVXF1NGlpcjdncjczYXpuVkhQZm9JazRrc2U5blMwU3A0djVZN3ZsMjd1?=
 =?utf-8?B?cmJ2L0dFVXpqeXg1T29KZ0JhcHhBN3M2TWExRW1YQVRnWmxJb2NvUjJ0Vjl1?=
 =?utf-8?B?NkFWd1kzdkpwRWMzLy85NE43REluU3A3Y0J3Q0g2OXIyNW44bkRqQ3JjZFVT?=
 =?utf-8?B?MVAraVRMWnQ2bXhDdVVSQ21jMndoK01pRWU2b2pNTE5DYzIyQjBOb00wQ3RP?=
 =?utf-8?B?WjZHWnBQSGJBVjFMZDhvVXBLaWxxcGl2a2ZURHQvSWxMOWlGZDRmMTVkTUk5?=
 =?utf-8?B?Ky9kTDlmWFFydWhIUFEycnl3UDMrcW9VUGNuQXZSQWJGbm0zSjY3ZXJJenAy?=
 =?utf-8?B?Q1Z3d2pYTjc0Y0RkeWlTTGFTNUJhUnFVT0Q5R1pmTEYrcG8vWFcyc1NZTTNi?=
 =?utf-8?B?L1hNMEdxZFhkdFB1QkJyQmtrU2FnZThqK1dlNFhiTXIyOVU1RDVZVE45Sjc2?=
 =?utf-8?B?cENnNi9qcm9xdlZHK0tQWGFnQUVZZ25vUGZiQlhEOGp2OVhSNTlGOWFUMzlu?=
 =?utf-8?Q?Bln+QO0k6YWPjB35eUvoLgzQFV/CmUbpvcJigsI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c55d299-5384-40a6-f931-08d8de5156bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 14:33:40.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYx1xs+Erb8RmCPb4GPW/ZWU3Ckiw+pTA+fvSiXmL5lA0BPjwoKZWL9uk/Bq3HxEj0VX5QupmAbgitCx/82FZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

For things like randconfig there's no need to do a full Xen build, a
hypervisor build only will be much faster and will achieve the same
level of testing, as randconfig only changes the hypervisor build
options.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
I think it might be good to get this in ASAP in order to reduce the
load of the gitlab CI loop.

Release wise the worse that could happen is that gitlab testing is
broken by this, but I've already done a run myself:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/264757821
---
 automation/scripts/build | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 87e44bb940..1b752edfe6 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -11,6 +11,7 @@ cc-ver()
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
+    hypervisor_only="y"
 else
     make -j$(nproc) -C xen defconfig
 fi
@@ -45,16 +46,27 @@ if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
     cfgargs+=("--with-system-seabios=/bin/false")
 fi
 
-./configure "${cfgargs[@]}"
-
-make -j$(nproc) dist
+if [[ "${hypervisor_only}" == "y" ]]; then
+    make -j$(nproc) xen
+else
+    ./configure "${cfgargs[@]}"
+    make -j$(nproc) dist
+fi
 
 # Extract artifacts to avoid getting rewritten by customised builds
 cp xen/.config xen-config
 mkdir binaries
 if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
     cp xen/xen binaries/xen
-    cp -r dist binaries/
+    if [[ "${hypervisor_only}" != "y" ]]; then
+        cp -r dist binaries/
+    fi
+fi
+
+if [[ "${hypervisor_only}" == "y" ]]; then
+    # If we are build testing a specific Kconfig exit now, there's no point in
+    # testing all the possible configs.
+    exit 0
 fi
 
 # Build all the configs we care about
-- 
2.30.1


