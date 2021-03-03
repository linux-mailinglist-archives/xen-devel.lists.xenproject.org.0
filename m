Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75632B5F4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 09:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92747.174796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMwy-0000eu-8u; Wed, 03 Mar 2021 08:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92747.174796; Wed, 03 Mar 2021 08:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHMwy-0000eV-5W; Wed, 03 Mar 2021 08:33:44 +0000
Received: by outflank-mailman (input) for mailman id 92747;
 Wed, 03 Mar 2021 08:33:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pqQ=IB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHMww-0000eQ-JG
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 08:33:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce3b294-f02a-4a30-803f-e90f070ce014;
 Wed, 03 Mar 2021 08:33:41 +0000 (UTC)
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
X-Inumbo-ID: cce3b294-f02a-4a30-803f-e90f070ce014
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614760421;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jVp0Ab0d7U2rSkuKwKMSGLQvJ4fl1JtFSBlBGcboiYQ=;
  b=b1umHP1gIDXj63+qbRxeQNJLVzNfI4OfGfom47+z1dbIE5EigQJwXunV
   3+ChyFJk6Za8/1alRDp1RrCr1bLKHrVFgvGMduEJsokAYK/2Nhs7dBh+Q
   76bBH0YDNleh1EaY40GerujpH/pzJvFkso0UlAnmrZnyV0ehyJ2UWS8ff
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UIghFGS46+V3BwI8nW8Sa5f3Rj8ORxCzRTSJsa2MsSVWw76JopwI+VWy/BZZNXuVEIVTjsCkqJ
 vV5BRI+7btqWQvfbnJH0igtKLtPNRp68frkDXYWypUmx0Ubq2hIIwbj7NMcoVZipPvE9/mrcnG
 e4tUsFpg8pITLwOepvyxkWl7gMzvYzM/rAgifylxz5zLi7TUZoxZPjXgIYTDmafn8BCVqk3OLQ
 A9y3/AXQxW598JwWhJAQJUUJdP07N1eCLMv74YzcHcpbIYQxNNgY1bVljwsSlFxHfi7f6WXCNA
 ky4=
X-SBRS: 5.2
X-MesageID: 38600871
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="38600871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQa6jiXsm9pRE9JVyqfRHn8h/Gzlr7svu1ugWSfGmYO9Yq7uF2QNzd+g4Ye0miNSzo/mfcXjaDkoaEvYYjbHzGbN80mZba5Qsn8N0MIwgg5Cq8TRHpXopa/w+LGQjiMSfpq5mgQvsHwCi/fSiF1LdQZT7wrLSPnZi6ZBLcKrYzrJG8PXdumda1kTZr0Koa+/nr6RuOjg5VDUiJPuavSyg0xrsFXowexb4acAXGqazW1ntrZOmvGYNz2gf+Q3h1kzyIkcuAAAd/V52eZYdPqSllj8Z6DR2gt2RtfCsi51NPlVVYUD8hqXmRx+rQA8Ep0DPKGsQZYzPtOn+0QKaKmwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA0FWokpjYq037HIImyhagSWwTj4PIDror+eKAb0YL4=;
 b=O+jDyfSt7lznZ7BjcbzGduKojIaw76RdQnNLLprmTTDoVmIYmSgZUu5f6ERvfPZipDLaPtWPgZ6sy6/yEjeVA/Tgq9kqaxlFnIdaMfisIsa0ELCmfkPggpwLjwFkitKQ/ma27wycismhnjYOoV70JcZ2gWIoN4fX1CNDawiCdIqFHDYTeFUiW+gqTgwOhK7uSPS8hqTpIliKEgzNeKqzjspbs//tywm6x+11hZSEAUpjaWcCyqgyEgDLVzC1RN1Yd4FFhQely6NWWQB0QdX8yfa3rrHpVnMc7fsSF/dKC6FsDLI2dFjH3VhSRBEOfEUR2XuLkRwKbdLT9eREZRdI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA0FWokpjYq037HIImyhagSWwTj4PIDror+eKAb0YL4=;
 b=E+lM79Y+io2jPYLR8YEp/l8aTfgGTxi7qSb2w669nws8CjC/gCL3XU9UF6K9NmBQyJX/zdCiT8Dq/HxCSLhrvctoHgvOapJfTddwH/beu/RoOrOmw87YSGzhtr8Yngkgg/C4eJ2Xv+H9m98wEPL0MTixJfX2ixw7d4ssieU6FZk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] automation: add a build job with NR_CPUS == 1
Date: Wed,  3 Mar 2021 09:33:18 +0100
Message-ID: <20210303083318.9363-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab36b66a-57ba-421c-4162-08d8de1f037d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5339692AC4585B5FEC6918098F989@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdCHODbJpPCCla81XGYiyEHjq7yUYRYWmizeCoxfxFSZObJ0t9y1h/1rDFpxxcH6mUPESfSuyvWt1ELOQGNcIz9icsdByP3JzwRy4qHghOGQEtbTSM58rG8D8WZt7xRxuZW5oHBeqYPFk2Soz0zNbzfA0E4ln53GvocZKBiX4RRH1iQOyYBV8Ed5VLi3gEmrmi/BBEcDS+X4gM3+MQ3z3izpxRlBgrmV8xOuDx4TpFlcamyMldq6924QEUnJixgnDBhVa5ovcIn2/FnxM7QUmJPEA9SLRmzYJxkt7O8zLhoLATCHOjoS5CJZU0dP5fBy+NRvIWqZe8tlHHMybQ6EQ1PNI4HrrGiDqz+kEth5UDrnhGzojU6ko6UrCXhYHk6th3bzuzp3+8BozQJZZgdVGz4jnTPV2FpysxvVBh+h0LBAyfdxhT89UxhJCUAA5bBH+taRcc4a4Fl95IvVDyA5xaTjXwSNIt5hB2HUnYAolp040CLJgPBAslRwXzcLhWFmJLefNXnVJNfpeSE/2CXlxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(478600001)(6916009)(6496006)(956004)(5660300002)(316002)(54906003)(6486002)(83380400001)(4326008)(6666004)(26005)(66556008)(1076003)(8936002)(8676002)(66946007)(86362001)(186003)(2906002)(2616005)(66476007)(16526019)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckM5MS9iTVN3WlZxK0NKbUgwMm51dkg0eHB0cWJ2azZ1S0krU0lVYUQvb1o1?=
 =?utf-8?B?Mnltb1ZiaDM4SUFoaHFCR0s2RnU0elI4UURXQ1hpRmpNeEsxU1U3UkpTdmNa?=
 =?utf-8?B?Qi9vN2IvcFYzelBSbDRmM0ZDMEN0VnRuZDQ1QjJkcTZpbG9tOElJTWwrQUZu?=
 =?utf-8?B?aFJjcjQvWjYxM21KczZxTVVUV3RHL0o1b2o1MXQxRUJvcjFBRi9oaGtDRW51?=
 =?utf-8?B?V0w4TVRUV1VnTVgzZEVtdVZ2Qk90OTZQRjh3WG1qRG5jT24yZ3p3TlRoaWVR?=
 =?utf-8?B?UzYvNlEwNmt6Yy9QKzhPSnZaQWpvZW5rV3pSNkw3QVdLaCtwU1pNOUd6SHpI?=
 =?utf-8?B?RWdKMEdIaXJoL3lhNWZSbXJnd0xUU0ptUzZxNkNmSUt5THV1MitGakRIZVlr?=
 =?utf-8?B?S2hyWThjNXFQWkIxV1dGRVc1Z3FadEhpZ3BtVU9DcmQrY2ZWa0VQUG5oQ25x?=
 =?utf-8?B?YXJuZEcvcWdlTUl2YkxDREYvYjZyeEFiUFFMN3ZyUFh1Z3NreThtYkdZa2hR?=
 =?utf-8?B?TDVWVzdxemw0L0VDY3ZHaU5LUjlKNkF0SzIreTJ4dmt3d0ZwZjNEM1Y1aEs3?=
 =?utf-8?B?VWlyN081MUVVRTIrangvSURpcW1oOTE4UEd0NnB3VW9lVDhLTlYxZFo3Rkl3?=
 =?utf-8?B?MjA4dHpLOVo2V084MW8xMHMxMEtWRlA5NGJyYk1CUjVkRk1KYVk4T3JyNzdH?=
 =?utf-8?B?alkzMG5MTnpPS093QVo5THA4aC9XS0FGSXhVUERCVlJFbENNNC9ZNFBlenRQ?=
 =?utf-8?B?cndvWmZvWGxZTDlUckRDWWFkSzFuV05rNldHN1dhTmJaTjdmQ3Flc3IvWFU1?=
 =?utf-8?B?bVJsbWQ0WUw4eGwxdXJnUE5rdlZwUDVpZmtrZ09Leml2bDNWOXhXc1IybGlp?=
 =?utf-8?B?ZzlocVc0czlzczZxTmNTbFFxZk9CU1lxZm9pdk04V1RHT1ZsekVrUEZleTNu?=
 =?utf-8?B?ZUpaRkpEWUJXUHFINWR2bC9ra3MyRVo0eVhkZ2lCRjV6S3hESW9oYlA0WnE1?=
 =?utf-8?B?bUlSOEVzbERnQ1I1S3dVOFJPZk9CT1gxU09TSmloZWlLSTNZOHMza0hmRVJ4?=
 =?utf-8?B?WWJxZG1XMzh6RzNwcnJ4K2h2dUV5YkQ5a1AvbUZCNStlak5WMDJzRjdRRHFk?=
 =?utf-8?B?cXF0ak1wSVJSSG5iRzM2ZS9SVkRTU0JYc3kxaEQrYXE5SFlvOFBZV1JmZWx4?=
 =?utf-8?B?MWJXY3htOStCY1FKcEdvbjZNZGxsbjh2ZVJFZGVjcFVvS3lWRnM3Rkh4aFBa?=
 =?utf-8?B?SWt0ajkvZytOLzhPZHBNSnJ4eEFEVnhVUWFsbncwcFFaU3pWRDFvVHBPQWV5?=
 =?utf-8?B?ZUEwaU5kK3FkMkI3dmVHZU94WkVEbVRNK2tIT0ZYQ1BIOVBrZENkWkVVSW1s?=
 =?utf-8?B?enBrOFRxSm9ZajNISWFPN29pTEV1NmY0RDRaT0ZFblJ3REQ2NG1rSHFTZE0r?=
 =?utf-8?B?eDZ2Uk5NTElEUGJQVUw3dEg0VUNGU3JZSnU0Zlo3eDIybGhEMUhVYytBQ2Ju?=
 =?utf-8?B?eXVyeEx4cWJqZXc1THdNeXlTV1BMc2VQdlhEWUtoWlhRY21TZkl4TkJRSUdS?=
 =?utf-8?B?eGFiMVFWR2tWSVdqMUZsTUZtVjNaQ2Q0SzMwMGpOSjZML3dLWGxJZlUvc3lN?=
 =?utf-8?B?RHlXTGxqSExKbnQ1NW5UMzAvaWg3NXdMUUh0b0NkR2E0RGJTMldRODdGeE9Q?=
 =?utf-8?B?NXZqWmdJNXhSNE0wUGx3T0RneEIwMURkWHdHWmlUbTd2K1VuYjd2TGt3Tml2?=
 =?utf-8?B?aTI3ZWFWVWVUOUQ0YVJiaHFpalJVc0paMmhTaW1Rb0hqazBLLyt6d2FSMm5D?=
 =?utf-8?B?MERBcEgxVklZVlcvdWcydz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab36b66a-57ba-421c-4162-08d8de1f037d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 08:33:25.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4HbA7rqr4BtB++G/tU3x702GP0ZRdnK0YbUkj/VdRk3evyYmgA0TgUvVDyU5s2Hc+zlSzhjHompz8XHoZSfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

This requires adding some logic in the build script in order to be
able to pass specific Xen Kconfig options.

Setting any CONFIG_* environment variable when executing the build
script will set such variable in the empty .config file before
running the olddefconfig target. The .config file is also checked
afterwards to assert the option has not been lost as part of the
configuration process.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
---
Not sure whether there's some easiest way to force a config option to
a set value from the command line.
---
 automation/gitlab-ci/build.yaml | 12 ++++++++++++
 automation/scripts/build        | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d00b8a5123..06d943de83 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -308,6 +308,18 @@ debian-unstable-gcc-debug-randconfig:
     CONTAINER: debian:unstable
     RANDCONFIG: y
 
+debian-unstable-gcc-nrcpus1:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+    CONFIG_NR_CPUS: 1
+
+debian-unstable-gcc-debug-nrcpus1:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: debian:unstable
+    CONFIG_NR_CPUS: 1
+
 debian-unstable-32-clang:
   extends: .clang-x86-32-build
   variables:
diff --git a/automation/scripts/build b/automation/scripts/build
index 87e44bb940..4c331b6b57 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -11,6 +11,22 @@ cc-ver()
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
+elif [[ "${!CONFIG_@}" != "" ]]; then
+    for config in "${!CONFIG_@}"; do
+        printf '%s=%s\n' "$config" "${!config}" >> xen/.config
+    done
+    make -j$(nproc) -C xen olddefconfig
+    for config in "${!CONFIG_@}"; do
+        if [[ "${!config}" != "n" ]]; then
+            option=$(printf '%s=%s' "$config" "${!config}")
+        else
+            option=$(printf '# %s is not set' "$config")
+        fi
+        if ! grep -q "^${option}$" xen/.config; then
+            echo "Failed to set ${config} in Kconfig"
+            exit 1;
+        fi
+    done
 else
     make -j$(nproc) -C xen defconfig
 fi
-- 
2.30.1


