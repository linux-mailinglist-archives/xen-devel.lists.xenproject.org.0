Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D01322E14
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 16:56:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88863.167234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEa2c-0003im-7H; Tue, 23 Feb 2021 15:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88863.167234; Tue, 23 Feb 2021 15:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEa2c-0003iM-3Q; Tue, 23 Feb 2021 15:56:02 +0000
Received: by outflank-mailman (input) for mailman id 88863;
 Tue, 23 Feb 2021 15:56:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEa2a-0003iH-Pq
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 15:56:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34ac5835-f75f-44da-9504-601ebf1cc5b7;
 Tue, 23 Feb 2021 15:55:59 +0000 (UTC)
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
X-Inumbo-ID: 34ac5835-f75f-44da-9504-601ebf1cc5b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614095759;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=AVEoWrMOQdPnHblXGpkJgOocPMFc324aAoNNOclG6AE=;
  b=VFimJ2a6NRXwycBcTCmz5SItpSHDpRTjBXLvuGMLBFQU4a9a+45YipKF
   V0/2LCYjhAYKwem+uJVwGWB4MlQRWsFsvOQPnKiLx1Chn4zm7W+P75fDe
   55qrFeEanUtvN15NSiZUFfxooY9q8LlonrMxr32+uZ/UO8fDYbG+Mo5dP
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZOnFqxAnwSdtLTSdQfJEwHxxE955P+YsnosY2l0VUgqZtKWaWqCt02GkMlNiWaCMOefWxkg1vl
 Vsl8acIgrbi8z3Yd2VneHf25kOhq2WP8ZP5we4grFAlI6o13ZMl89cDHsiAypPu2N7yRCzeY9X
 GYSMi9oWpC1SxiMnvLp4PPO42pgRy8ucirKbUSnofzF10m8611oNmhpTbEE9/AulXv+866JNfs
 Vc8mFeVfhimIGgIiZI4ZfyU8B2NVZVrFy0x+XY0A+Sa4yWHwuJfHCxXX6CYzBqNe4rubBnRUic
 iEE=
X-SBRS: 5.2
X-MesageID: 37833856
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="37833856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLkplyHFbAFcNcJzutSoZ5DZ2dXe7GtFvHFW3m4b662DBL8y4lVHUaxYxaMSYWgso+cQtDUiEGMKPVZozPOu1B0724pczbyuZiVpehu7CwtnAmhRSzMWx3DTNCKAaY7EX1vbMJtWFuly1qqbh4vxGvdtnErtUEogJjcZ9pjbe83ENjDGj7dzlECcyFz0PN66gp+4uzkg9QQAQCC0pZANDNT90AirexVEVnPM1g9V8vhlsRx1XOaRy9FNECT78LKC1XF6NhT8dGVnEKqF4O091NPT4HbubF3VxK7ZsUJMDnRgE/9FRFYpJlfAG3bXZJirN14YuBRmdI2jLXRtQeQ9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX5TkCMVopvOD+/peD2pbZJMxf38hUZzN7+U/hRv6Fc=;
 b=EwG6SOpe15/AzBZgmUHU9vcXC4u8mJAyq9ZK8G7NNC6aKXMynDP9LHQAT9FYzXp/gwkAQDtCIhANSdGqhAYu1QrQmZjMQKJxa7PIjzY8lPCYPkmhGPO7V+1GOVoLWZhZpQ4WALc7Vtq4TJrwuE3miIcWjIoFZAg/nv+6y73VT0xAj4B7eXmZokxovNjiRXlSy6qb4Hh20G1L60F1005eicyMqUalGXIH3Kcfbqx56txx13zL5h6Li9XX0YQAsSR/5ZMPhwzfaj38BFVa5zXiR9jSk47nT8H4bxc3WT4xzWbOtK8fNUnxlhHEwBS7WdImhwcCNzqTcQfSbrNTf/YZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX5TkCMVopvOD+/peD2pbZJMxf38hUZzN7+U/hRv6Fc=;
 b=uzsCy8YaYh2C6G8f1iOJEVpIoE2weTbOH75s+quM0cajFD9Bs8wpyIqzuXwtJyXZXbda3H8HoAnxjIlmgaqrwsLlG8qrP00hHzcQjXF20JrcwZJThBq6tiySzB9cBYricTuxdqSUwP1KB0MAHXvCF12luFDpsbZjzb/ado+shSo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH for-4.15] cirrus-ci: introduce some basic FreeBSD testing
Date: Tue, 23 Feb 2021 16:53:53 +0100
Message-ID: <20210223155353.77191-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b62067bf-041f-4370-0e79-08d8d8133ef6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB46030B68E23B591891AD39F58F809@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjjBM3Gh3eRQ9id7GhV4c9ZJiyQmLEVyGuayRthk/3DYrXxRgxGafLuhiimuS/MbCHgNLnRRX5Ad2wpgJXae0yY1DqoMDtziikq1bno48icGE36GZFDUJR6EoCJIImUG+VbeE0ekgRgWndKSiFA6pd2aVGYgymF8W2+6CzAddca0WF82SyDXoXPDqWkSlgdbux2RCiZDCCamZp5wo+3QAaCJcrMmW3sRJjeQteFk/56V9I1ld9bdPRAdh25kczxvMMq1XLgs6HLoNNiqlS6eyQbuyNdiDcGRICaolaaxOHgxQ6g/cF9QHbI0uqCZHf02oS+BDuie5Ycrr3VBUYXIMfViX4/wKPgtD9TLaogQIh1sCEoY7hgPv73CoZe6AUog+3dF7jpIuFlRWPqHUT90cgpDuiPmaIh//NrQvqNI6P6tT89X600wbL574Q76jVThQ7c2tPtRKDPrSxOXOjk8CWT7x6UeZBZOdtMJp42exQUNvQ7FM9rZoC9dyZV76gy6h8BEqHsYtgKzCy7WDG+jII0HNr1mI8DZulR2AlVvZYcplY+Ofs4SfIw1sfnTc62BW2VK988sYugEO8R9Dp0lSC3aBRvL/oD3J9iyueWJYVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(1076003)(54906003)(6666004)(4326008)(316002)(36756003)(2616005)(956004)(86362001)(6486002)(478600001)(26005)(966005)(16526019)(8676002)(6916009)(2906002)(186003)(83380400001)(66946007)(66476007)(66556008)(6496006)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emh6OGd0a1RkTW13ZHNYcVlXU0lrVU1VWTBhRTJwSU5BL3FjNXNNMldvbUov?=
 =?utf-8?B?L2plZ3lyekpqQXFrYXlsODIybDhFNHZLeGdneW9Vd090UktMK25PM3hIVUpE?=
 =?utf-8?B?d0grV1BjNkoyZmtteUFyaTlaUS9meklFTHc2NWdnekZNVWpEd0ZjNGQwTXpX?=
 =?utf-8?B?ZjM0cXFKYTYyb21uV2gyUWZ5aGcwSFVKSER6VTB1NzFNd2NQampQdTNIaE5S?=
 =?utf-8?B?dlhBWTVTbWlHM1l6dldaczZPbE9xYmRFbkpFekVRbENoMGVEcjduY3J1cEl3?=
 =?utf-8?B?ZlUrQ1MvckJrSndleHI3ZmJmWDJERjFhVUc1anZDMVhGbWtDZnNiMUhsZks5?=
 =?utf-8?B?aWx6ZmpvLy9hdzYzazlTOVJjK29EbThKU0FQS2FFSkdkdXdQR0c3SHJqdXkz?=
 =?utf-8?B?c2lLa003UnJ0WFQ0alROL0hBckIzdFdYRlY5L0hGSG1TbjhVdjFKVmd3VFE2?=
 =?utf-8?B?Z1ZncSswV2dJTnBVOWZ6eWdoUmNmQUd3K0gvRmlPMzdrUVQ4cWNSUlRGRjJC?=
 =?utf-8?B?VmJLYVBNaDZJRWlUbG9ucXdJNWFDOXVBYWszTWRqQitGUXduVnNSVXpQTDBL?=
 =?utf-8?B?Q1ZDNFpjZ3pkRTVMNjdXZEpaNEZTdW9ON2hpb0RIcE1zem5SYXA3ZXF1bjFZ?=
 =?utf-8?B?bGFjNEVxSndSMzNzMHo5K0F0Sm4yTzZaZ3F2aml1cDQyZFE1R2E4cmxheW1m?=
 =?utf-8?B?bWZiRXF4MjZvYVdUY1ZHVTd0aGxBbERQQTlyWDEzSHo0UUY5WWdzL2g0cmhz?=
 =?utf-8?B?S2lKbnEvTXFrN0I4cEtLRUdKSVgwUUdlc1p3UDluaHN1SmYzSUJ4bHpaMktF?=
 =?utf-8?B?U2p5VWczeDlTRTRZemFZRTJJNjFvblhjTVNlTEQ1WkpjSURPV1BoTm9JVytx?=
 =?utf-8?B?VUN0eW1ubEdhaTJIQ0VtVzRDdk9rR24zKzVxYk95S1lFV1B6ZTMzVXVhRHQ5?=
 =?utf-8?B?a3JlVFNBU2JJbVZJTGZvUkxDUkNZU3RKa3RrL0JNdk10SmIzSHZFRExmRVdJ?=
 =?utf-8?B?eFIzMDY2VDBmRjFmUHpCWC9rSDJiY0luQ2lJd2N2a0dDYXRYV1ZXNWY3L2hn?=
 =?utf-8?B?MzNiOERHM21QL0NzemlhVUtuZW5RbkVQV3grZFluSW8yWDR6K1RweVc0QUVK?=
 =?utf-8?B?Z214RW45NkI5OEN3TWIyeUZKUDY1K3h3TlZpa1pmZysrMW93OEQwVTJXak5J?=
 =?utf-8?B?dFA3MWhxS2xwN2M3aVhxdHpCVGJrcnl6eU9TcmhEbXpibnhJbjMrOWNKb0hT?=
 =?utf-8?B?QjRWSi9vaDBUVENnMVh0VlczUmVWcUZzUTVHd3lBaEJIM0RTelF1T3M0S0xO?=
 =?utf-8?B?WDhWSW9OQ1pnT1R5ZUtvQVB0bWRJWUFSS1IwL05BM3VUaHJIOVE3d3M3UVBZ?=
 =?utf-8?B?VE5HbnNxNGhvWFpFNnZmbHBob1BuTXgwV293NHdTcVVINFpMWWRmeC92OVJL?=
 =?utf-8?B?cGs4N1FGS3pNRzh4a1JhQ2xPazdhSGVCVDBFa20zeVY4LzJjemk0bGVvUnc2?=
 =?utf-8?B?OFE1OXQvUFZLV1NQRzBDQzlLc0VYNGUrLzBIL0NGeEF1VUUySjVEQzQyUStj?=
 =?utf-8?B?TExuT2dqZWlBWlQ3eldKTXNPaVZTRk1zS1RScE9za2NpL3hJTFk1TThhOEVY?=
 =?utf-8?B?YXFRbjZGQkx2UE1XZUVuQ1lJWFg2VEprQ3Rrak8wZXQ0UnJTdjhtUzhRVmE4?=
 =?utf-8?B?dHlZak1OVGtLanNTQU1JdVJ1WGpVcDlqWEhveTVscmx2a1RqNDBXQ0Z5ZCsx?=
 =?utf-8?B?eFozRVlJVi9heFlhN3ZrbFdCVGNDT0ZtMzBGMGF0KzFkdmFtVXlQNENsb3Bw?=
 =?utf-8?B?dlEzMFE1Y1lRMHRxb2o1UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b62067bf-041f-4370-0e79-08d8d8133ef6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:54:04.7894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOi0E9y3Jv1OcUJF0wsCgLSEPL27++EbPEgiRY9isT7EX3DMk3oTA8zeIOPVvxdX04U4Cz8nSGSIv7gN4sZ5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

Cirrus-CI supports FreeBSD natively, so introduce some build tests on
FreeBSD.

The Cirrus-CI requires a Github repository in order to trigger the
tests.

A sample run output can be seen at:

https://github.com/royger/xen/runs/1962451343

Note the FreeBSD 11 task fails to build QEMU and is not part of this
patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I think this is fine to go in right now, as it's just a meta file for
a test framework, and has 0 chance of breaking anything existing in
Xen.
---
 .cirrus.yml | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 .cirrus.yml

diff --git a/.cirrus.yml b/.cirrus.yml
new file mode 100644
index 0000000000..5e3e46368e
--- /dev/null
+++ b/.cirrus.yml
@@ -0,0 +1,26 @@
+# https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
+freebsd_template: &FREEBSD_TEMPLATE
+  environment:
+    APPEND_LIB: /usr/local/lib
+    APPEND_INCLUDES: /usr/local/include
+
+  install_script: pkg install -y seabios markdown gettext-tools gmake
+                                 pkgconf python libiconv bison perl5
+                                 yajl lzo2 pixman argp-standalone
+                                 libxml2 glib git
+
+  build_script:
+    - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
+    - gmake -j`sysctl -n hw.ncpu` clang=y
+
+task:
+  name: 'FreeBSD 12'
+  freebsd_instance:
+    image_family: freebsd-12-2
+  << : *FREEBSD_TEMPLATE
+
+task:
+  name: 'FreeBSD 13'
+  freebsd_instance:
+    image_family: freebsd-13-0
+  << : *FREEBSD_TEMPLATE
-- 
2.30.1


