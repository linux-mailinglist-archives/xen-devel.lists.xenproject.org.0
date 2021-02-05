Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2EE310AAD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 12:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81648.150968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7zgH-0008Nb-Fi; Fri, 05 Feb 2021 11:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81648.150968; Fri, 05 Feb 2021 11:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7zgH-0008NB-Aw; Fri, 05 Feb 2021 11:53:45 +0000
Received: by outflank-mailman (input) for mailman id 81648;
 Fri, 05 Feb 2021 11:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7zgF-0008N6-Qz
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 11:53:44 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a859675-05a5-4dfd-b7d3-a25b7ca76046;
 Fri, 05 Feb 2021 11:53:42 +0000 (UTC)
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
X-Inumbo-ID: 8a859675-05a5-4dfd-b7d3-a25b7ca76046
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612526022;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=70OolYbpJ0TB3JCeqVXbodRWpdm1hyzWa9tahDBVDJw=;
  b=X2wLtKGgkzkUQgTc/3309ZJwrAtBfqxHzAjLOAStILaT1zkGVeBe2hew
   +QpzX5g1qUP4K8m4Bb5tm46RrwJuVFOCj5BWXq9TspW9ecjmnP+m/sEgD
   fqcWW3p4Up7s6r2HqVcWbeoQYjPWJV4d3L3WOLXm/gP2dNt741OeCewhN
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8uIUkoKrRC9V5hN7rQYmNtukNB3Vlx6J4kGgobe7TZBlkwqRzJuBQ2I4W9/G2YCnoNLOYu6+5Y
 vKbeiT5oFU8Y5EqJPjTESij5CLlKOo85ZoLOTvw1isY2GTc9QM8YoF8TZUy8RmmHqsmNychLUq
 xx4sMJZ/x7FoTzSOpKE0S24Sm4sbFeWVMkfHdA0jGKK7lfoK0+vWulBONKADeYwJ6HZUouUoi/
 XoULeBuPEOeGPUU+hvGnYWkWrvTysIelsiISBmWIhyPNVuSDyqbLbVtu9J+c1Wdh1rgg36D4SO
 ZAI=
X-SBRS: 5.2
X-MesageID: 36587093
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36587093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCxMluIOBOxS9dcifZg2bkMFGByVWnhPT78YY9v6XO00iRWJYGIFqnw4F40maGf02cisJMW2mFemjM0qy4Amyas/ANQB/1Pwk5V0d+AdF+o1Ud/su7fFWzXP+/Q8gxeDYZ/FLYluchItxv9pAaVX8FMi7AZAdYxG6RdkfjnBCePK58WZCZJ6ToFPhEIvZc3UJ1MCQYZo75MjT99YPGQPCorrgVzgFJIKEh6ighUlZK2DyFxRK+5GeBwbZbwVhqYmGefHDpAc+3TrnBF+LugjPHVUZI+2inCvllZZLW0+V2jm9yoJZC5IlMBSlnxL467iCGofbMWZbkTlAF7+GE8ebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msA6GqCa+9D1/ZVUvtfAvMVUNgubP3GI27ive4wtEts=;
 b=UcZbD50GLYFGc5vCkvgOSUyw6SCYzzFILjIpOPiGmSD/UV8W96AdsDJc0z5bepfjlVncxOMfM9zE7go0gYs2MkD6SDdpPWUGvJ4LZEIptqu+2TldqaQ+pexAXBBD9LAqjlCtuEwKMmeJT9OrdrrL0FU64cPNtGfuSGFvsoqpFqNqhePkyIkJrANx2n/cUhLP4kkFaarAGJllIeNh4FU4zkWzusiDZPNJK5TT4eUxftTgXwFyorZ8H7cQ4wn4ov5ryKU/oaVDFsvDR4qpEZXcgtONh6IMoYKJ0djrkp3CTwBf7zTzZdDA/vEYpNfogFlprUY84NbsriaheaLcw4Dz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msA6GqCa+9D1/ZVUvtfAvMVUNgubP3GI27ive4wtEts=;
 b=gGliNeMFqxq3VsY862vazrXMmAs8TjJoCb43vLX+9TBW6E7xWzM24Qm9QOQT+tcKn+4EnpDcm6DLihR0Koena5+WFp6dWtuOBhDS+3ZOIoUpK+EsilmtXcsYZh3FDXNhFzfLaiTsE+ay2KhgMTfP7+B5JQYHVbUgsEXtnZs9kxY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] tools/configure: add bison as mandatory
Date: Fri,  5 Feb 2021 12:53:27 +0100
Message-ID: <20210205115327.4086-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c7fd90a-6a1a-4f6c-e54c-08d8c9ccac0f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4844FDB0F163187E7360FD7C8FB29@DM6PR03MB4844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8idbAkSt118zAAyrbbdXrM1t3o9OwTXKmobxY+WKGPUG1b4YoT7eGmv/Kos0QX5Ij+FYVScqVbJ/yE5/kjxQynbPYgRoFWwdj03bozq22EB9V0nI2he9pAqb8sei3MAs6aT1zWtwUhc/FV5//Ho6qnDClhJLQqQtucjjJqP7WX4FtPoHlYZy2PWq6y0Q9HrPo+5l3LN9/MdK5U7OfnjHD8sttzqg1ZAXC9E8MTe6uxc2bHIVbieYOZNK5eiCQX16XNcRe+fbgs7pbYVw897xxC/Jx23y6+EtsMW9Twx2EtSdSRA4e3dEnLUvEnTjWvUZgU0Yr2dYZPpTnwvxoN+KxcSBIiwERnFyglS74139spS3vBNRi2XDo4kojIQXUontGc9i3VRh8GoPDYRTDgyoKyqCbiV9Gyi+hfurmjmrZ5uxle6n+xYJDnihXFsxMoDGSnVc2QxhVwAD30XpPbxjZtbIkVQZB3cnWQOAYuVv5Iqv4ksEWIUg5p6LqYmEgOEsWr7Mv0VHvwcOc4qgAKOeGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(83380400001)(2906002)(26005)(478600001)(4326008)(54906003)(36756003)(6496006)(6486002)(316002)(956004)(186003)(6916009)(8936002)(8676002)(6666004)(66946007)(16526019)(2616005)(66476007)(86362001)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk8wZ2J3K1RzdThYUEYvYVhISG5BM1hLSHV2YmpxazBuODVSejd0eDlVcDN6?=
 =?utf-8?B?WVZlL1IxVWVzSDZLYytDcFpEa2JNenlWeTQxeGorYmpWZmoreWdrSjVLdjUv?=
 =?utf-8?B?VmpSR2tiZkUyWnhNd2xJNEljOXRwVlN6bTJNeC93WWFyVWYwVlVZcU1GK3du?=
 =?utf-8?B?RWU5OTl3L1VoSFFvUEc0YWRZRXJQNnlzdm1Da3dKN2pNZkFmemJhTEF0d1F0?=
 =?utf-8?B?K0s3Qk5QeGdHcXloWis3Z1czZDJIL2VxWXRrZmRqZXBQbjhZVEtaRkNNTm5u?=
 =?utf-8?B?b0M0bW9nUy9aTzJHbGcrZEJkQWxnYkt5WlZPVGZpcXlKRUs3a3dSNS8zUkhR?=
 =?utf-8?B?TWhxVExFTXlLeThSWTA5UkxkMkpjaTZGa1czVkNFbEI1eXFrenVYSkFCUUhm?=
 =?utf-8?B?S2tQdHp4UldYdXVKYjcwZEpPUjAzMTdVTHUyWnZWbmpYR1FCNVhvRlYrSTdZ?=
 =?utf-8?B?ZFNJMUFuQ1FNdUJHZC9peE1jVzRWTEFWRVN2V0d3cEVjNzZtb3c0NDFqd0pl?=
 =?utf-8?B?UEJDUHlRWW5GUXpGYTN2U2ZBTGMzeUZmZDhncDgyb0tPU2J6OW8reTJzRnhm?=
 =?utf-8?B?RFhlYk5DOE1JWUwwWXYyOEg0ME9IYzhxTHdxWHlqbDF6dkp4SWdOVkluUWhD?=
 =?utf-8?B?cktuVVlSL0N3UzdBV0VMUzhiSzRFc2JFQyt0OFZGWnUzbnZ6R29rUC9yTWQ5?=
 =?utf-8?B?NHdxNFQxdmlhOS9QMjZFOHRoKy81OGtsdE1QMld6dVZwWUZlbHZnUU5rQkFx?=
 =?utf-8?B?bmo5cEQxQXE0YzdPOU1jais2V1RkTCtLajRCdS9IOXlrVXJaNmJJNElUU0hP?=
 =?utf-8?B?aEZpYVhUNnJqaUR4Z1NWSDBwclB2MlZ1V3BVZEcxRFVDNzdLUnE1K1JVM05K?=
 =?utf-8?B?RzhwOGlIVkM1eGpUV09Lakdadkk3UVpWNFhxL3JXNTdxVlRyVStacUo0M2Z3?=
 =?utf-8?B?NkpjZk12bmRYQllrNEV5YzdIOENQcGNpdlRaTnFDK3N4Zlc3TEUyVlpHdmpG?=
 =?utf-8?B?Z0tqYnpUcHlRNTRKMmVNTFJpcjlWdERyOThXejVrZDhMQzd2Qk9odkh4bGFO?=
 =?utf-8?B?b3NKVHlaNEFUR1o2TENyTE9Xc1lmaG9jSlF1UE1EaGZRY1hhRmZncDJweEo1?=
 =?utf-8?B?MHJrUjdVNWpjcmJ3WnRFdWswcnF1L25hTHJuQWlKc0Y4R3QwTHRaZVRLb1ln?=
 =?utf-8?B?aVJXanVIY3AxVXdDWUVYc2F5N1RlcTFjaDNxVFBCNURmNHhrQWJpSzdOTTBu?=
 =?utf-8?B?VUt4UktGMnRlRnlJVVFBcHB2VkFLUmJiMVVyMjFNKzg2Z1BiMnVSblVkRWMy?=
 =?utf-8?B?c2c1dTRKZjVmU2JlT0pqM1FTZjBEVThINkQ4cWJ5Rmc3SUN3Mk13MVk4cllj?=
 =?utf-8?B?RlplSllKNHpyTlFCa1VRM3d2Vkh5RUlqQnZsdHc4ODRiSkJBYlZuanplVlYr?=
 =?utf-8?B?VEx6QTVrR3hzSVlodkh4azE1cHJINForWDFaOE44a2JRV1ZyeDFNTjB4eXFL?=
 =?utf-8?B?RHNUL2Y5Mk03MWgzNmVPUUVkd3FWZkd0dHJrMU9PekczNUFWaUphWFNQSTZy?=
 =?utf-8?B?SGNhQU9UT2NKTmxBT1Evb0ZzdVJIRzlvOWJzeS85bVVVZnVZbFh5M200VGl4?=
 =?utf-8?B?Vzg3b3RVZkdsVVJySEM3MEpCZG9FMW5WSTRYYzJmdExjRnlaSDY5L1dBWVBw?=
 =?utf-8?B?a1V0dXN2ZW5iN2g2aDNmOWFMYjVBK1JJQlAzUG1PRk9DUERjb1VoN2pxdytM?=
 =?utf-8?Q?k7iWj2Wqqls5UR7bQtFWjEAlDoUeRLUk42k4D0O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7fd90a-6a1a-4f6c-e54c-08d8c9ccac0f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:53:37.3086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfQxKTxd5FOLW40m0UZ4DvFNAkYtTAIV+NcrjkGtmaspssvItqMjziMIzN7EpSHQYeCmmZ6YgXQWkC8hE0ZzaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4844
X-OriginatorOrg: citrix.com

Bison is now mandatory when the pvshim build is enabled in order to
generate the Kconfig.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Please re-run autogen.sh after applying.

Fallout from this patch can lead to broken configure script being
generated or bison not detected correctly, but those will be cached
quite quickly by the automated testing.
---
 tools/configure.ac | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/configure.ac b/tools/configure.ac
index 5b328700e0..f4e3fccdb0 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -308,7 +308,6 @@ AC_ARG_VAR([AWK], [Path to awk tool])
 AC_PROG_CC
 AC_PROG_MAKE_SET
 AC_PROG_INSTALL
-AC_PATH_PROG([BISON], [bison])
 AC_PATH_PROG([FLEX], [flex])
 AX_PATH_PROG_OR_FAIL([PERL], [perl])
 AX_PATH_PROG_OR_FAIL([AWK], [awk])
@@ -516,5 +515,10 @@ AC_ARG_ENABLE([pvshim],
     esac
 ])
 AC_SUBST(pvshim)
+AS_IF([test "x$pvshim" = "xy"], [
+    AX_PATH_PROG_OR_FAIL([BISON], [bison])
+], [
+    AC_PATH_PROG([BISON], [bison])
+])
 
 AC_OUTPUT()
-- 
2.29.2


