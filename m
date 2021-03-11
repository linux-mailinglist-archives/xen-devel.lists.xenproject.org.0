Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1683371A6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 12:46:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96471.182550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJlu-00033d-UP; Thu, 11 Mar 2021 11:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96471.182550; Thu, 11 Mar 2021 11:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJlu-00033E-RA; Thu, 11 Mar 2021 11:46:30 +0000
Received: by outflank-mailman (input) for mailman id 96471;
 Thu, 11 Mar 2021 11:46:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKJlt-000339-UT
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 11:46:29 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b922d222-255d-4dc6-ab98-d0e67b2b5a08;
 Thu, 11 Mar 2021 11:46:28 +0000 (UTC)
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
X-Inumbo-ID: b922d222-255d-4dc6-ab98-d0e67b2b5a08
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615463188;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=PjnmfYXXkk7j/iV3a0WKeTe0kC+PpwLGVyV5lc1V/Vc=;
  b=dFQvJltR3PjJhmjCZhvhtTUeF6YmW6xdmXSlu95oqK5S+WCITtZ/pB0p
   ummDWb5iTiFQWvVcvB9sksbR803zLtDpS5mPz9lNxhh6B4huqxm3t44Mf
   +NPbxuyCk0u85mWhRokj9G+p0nlltGAplG+xYQCe0ayDPfqEBYuWagBVK
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HSlwVoszlM5vTRK/0XZvenREwqiomo/W6gj7Y8e+h2gEuO4F2c7cOwHJ4RAcRGxrnevjrL/oc5
 QnsxLgpiCl2P/bPeq68rGGJfV3+4uOraYElwJ5T0Dpg1+wR29ILen2vTmVEUdSCUIfsiwDYqe3
 xT+T4z7Waw65wfhPw+e8DXwOa8ReDovRDEc5nCH7e1HuFefOr7qviXHnCxzZqGVty6OUu2/nco
 UN87hBsEYJRD8a8GzzZ892AvkBLJSdLRYzsu3D5jG2klolJnshkrxMdqQNvAfRTb1R14AtqbPl
 0Sg=
X-SBRS: 5.2
X-MesageID: 39408703
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xunhjKvVU2TvG/YVSi6kOvtl7skCpIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde6+AqXYuKdg/gpWeuMcVe/ZLvqgeQfxHW28x88e
 Nbc6Z4AMDtFlQSt6zHySSxDtpI+ra62Y+yg+O29RlQZCVLT40l0AtjEAacFSRNNWx7LL40Do
 CV6MYChxfIQwV1Uu2BCnMIX/fOqrTw/fqLXTc8CwM68w7LtDu06dfBeCSw5AsUUD9E3N4ZgA
 r4ujH+j5/Dj9iLjiXy+kWWxJRQldvnxLJ4dbGxo/lQEBrAoEKFYIxgXpeLoTw6pvq+gWxa7O
 XkklMbEOlYr1/XY2GpsTvhsjOQrwoG2jvZ5nKzxVvlvMDjSzoxB6N69PxkWyqc0WUMlpVY8s
 twrgWknqsSNzzstmDBwuKNcBdQmk+9sRMZ4JUupk0aa6QyQvtst4AFlXkldqsoLWbBx60MNv
 JhN83Y7OY+SyLhU1np+lNix9GhRR0Ib267a3lHvsSU1g5fl2xiw30Zw9QCnmwB+IhVceg929
 j5
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="39408703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPHHxULU200S1HUK0ECV4A7c9NfCOIBLcKH1xRL7FE8i9N2kETWxtNeytylCOn89Odr7peyFybFSBqMXDOOTMKvHnyXy28qfjYLO7DQZ1OF3A4cbzuz1gj59hxXvkIdu/OeuqwNt+mXVSyMDLPhOSWbgYTE6Qfe9fQSAA8g3SRtKzdhgp2Kxa9V6vrVAGqw4aPIrcwxIJQFs4e8ZEGfsUG7jqD5oQVmikwc3SzCAmCT6c5JhIf+Fi2aecerEeM0USqD1e16JWKmxflhQ7N+/cba2oAeaTTzh0jLl26xD6Jclt3/HgcrD7pFCSVsvjmrIFlFEZ6/B3yUa0dJsS47H8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGWjZ3EVvrR6mDn+7xMbHXeHY+vOZlhj5RzxnRGgHSE=;
 b=IHmxOVi3ADlRpfYobR1KvzZcM9BuNjkyJs8E65KXJWPgvu63Gpg+KaUQ13FN7lueaE9ixZCmWPUr+rKb02DWCnhaKAe6XkFhel+7ay/SHYsy/eyenxdBHm91K4yoBV/vwfSsuvk2/Cpm39b3nN7kmbla+744UdTRUH6pUzBeulPld7vkgJtO1lGvGobb91A0VNJWnRAByvkSb9x+0PDD5b2NuiLd9lwRPBRASne9DDiTr+j2knOxPM9MYrRX/9QzD+DOqd7OHPleQCqH3FzT+FInkX025mArlj2Fip8SX6QWSLgv+9m2ZrgicEQ279RoWBe5r10fhswLBSDhmnjNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGWjZ3EVvrR6mDn+7xMbHXeHY+vOZlhj5RzxnRGgHSE=;
 b=Zkyk0BUOGbJfDpHL3e4HMblvX84yz5gDKdllTraq5QJD9ZfO6+Yvmi8LJZXaXAGgSx2dPNu3AyCEBaKdaPA9HAV/A4fV40kEeQFsCfoqH6d4WkZf/aOg6BNc+B0VPg9O9FQBwRdhFXV4KiVlqXwcL987KPeNHihkh1a5VTsRNXM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH RFC] build: detect outdated configure outputs
Date: Thu, 11 Mar 2021 12:46:01 +0100
Message-ID: <20210311114601.42460-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::46) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 001013dc-bb3e-4993-2189-08d8e483437b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4137C96728CC67F573519BC78F909@DM6PR03MB4137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6PRsjZI86zarQftPlXEU/XjbXVx/ZebH4QKC6QfxGUVoDd6P8GBOB7nvtcT7UGqk2M5GyO0kd2h0y74Hqx6Q7WdNMoGRfligMCFRZIN1jv1OrtbnHp1F9sP6YYuDjSeHOTxYXfShPsVr3H+C+SfAJeKYiqFpgyydcFfy5qLAE9of59IGXiuRU8pADQJJgAyiFVunSm5bs3F5aGaTb/A4GfX0AEKghNcQqoia2q1SJaUArxJ9aTQCog/FTYJrIhdLUivo+a25/TIPK/aWh9agGhmxfoTWA7EGBWXWnL5BpxJshe8GwxTz9v500pd1LqXmiHUA4aNDe0u32gitzfSeE6U6ID0lMuZHQlfDMmYEFDkmXATI+AYpRFCDPKDInDD4duYHRHx7RogJ2q5rpcTJGF5W0HoXLCdc9heFvBaTgMMA1QCSdQyPrWMP9gBkXgk4pdQaEhjE21b+KOZJa0zRy0bDhjSTkSqXpl/KuncQR5/GOc4v/5XgPKLqze9yi9j3rsdTZBnQHxJUYoWeLcEcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(6666004)(2616005)(956004)(6486002)(478600001)(8936002)(316002)(16526019)(26005)(1076003)(54906003)(83380400001)(6496006)(36756003)(8676002)(66946007)(6916009)(2906002)(66556008)(4326008)(66476007)(186003)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S25nUFNiay95L2ZjbzlKbytlZnJBK3M3SmNBZVVtZUlwUHVRVkRwbDZ6L0Zm?=
 =?utf-8?B?N0F0ZlVxYXFLbkd1RHNsTVYyd2ZQWDJRYWtZN2lUVzB4SGl3ekNNdEhjT0Y4?=
 =?utf-8?B?N0pDbVRNRktlTWV0bHIyMUE5bjZFcTRJckpOcG16RS9FVTVCT0hPN0ZMQVFZ?=
 =?utf-8?B?NDVWUSt4TU9CM3o1QkJ6RmdCZXkzMldTZmliczM3amE0Vmk5N0RnOUtyVFhI?=
 =?utf-8?B?V2lYRXpLSDlad3RISy9oMG1ZN3VFRmdrTFdBYUxaMG1qQllndGNsV0d0QTdr?=
 =?utf-8?B?QVJjT1JVUkMrclk2SzgwNlRZSEg3MEZMb1dlbCtGRFU0V1V6djJES0NGMGw1?=
 =?utf-8?B?NjlkTS9pbWtyT05keUczTHBuaUp3cW1tWnBlakxEb1kza1dnT2o4c09GVmVU?=
 =?utf-8?B?a1pJQ3IvaTdJUmEzRFBacTBlTm5sNVk2V1g2T2RqUEtteFplSjB2bEExb3d3?=
 =?utf-8?B?aUIwSUxGQVV0QlROc1lDdGk5MzByTUg2cVp5VkxYc0c5ZVdieUxmcjVOU3U3?=
 =?utf-8?B?cjZlV3FEcXRTVmJrejBYcWgwZUM4T3FYUjlMa01lK2dtWG41aTdpM3NLcTc4?=
 =?utf-8?B?T2phWTZleTNXNGlXL285QzBnT2dYUkJLb2xGeEtjMFNUM09mTDVUTDg0dHhV?=
 =?utf-8?B?MXQwMGtwdmlSOEZYU29vakhwZ0R0c2xvK3ZpNUpva05BQ1BWa21PeHJuVnZM?=
 =?utf-8?B?SVVYZ09wcEZNbjdBRHhiYTB0Q2tWREM3aG1lUVBvN1BybndxbWQ3RldqMk1k?=
 =?utf-8?B?WE94OC9PSGZHdUpyTndjcmcvc2ZhUnlQeXE1MGVMUWFaM0YzTU9QZDNNNU93?=
 =?utf-8?B?cEc0dnpxc2p0RVBXWm9lZ1Iza3RQMkgrMVgrcS9zN2g3K1F1U0paUDhZekRP?=
 =?utf-8?B?VmFhSERpSmNGbW81Q2Z4dURVWmsxb2pCT1dYNi9hL0pPUkVDV1Jub0FKa0tG?=
 =?utf-8?B?Y2F6TzZlTXNtZEZpcGpEMWcvMjRHTmlVYnF3U0p0b1BjSEtvclRSTE5jTkZQ?=
 =?utf-8?B?NW8rOWZGYTdTUXpkcTZlYloyZkNHWkozOFMycXRjQnhSQUw1cjYvTG9weTNO?=
 =?utf-8?B?ZEVYOEZudGhmSFhUTmJrYjUzRWxCQWtpRjU2cG41YlcycXg3TmcxNVBUOFpM?=
 =?utf-8?B?d2VsbXVwSkp1cWdEOGJLQitvVDBVMjY3eEJ0ejFlQlJ0YzVhNjFxNndyUWNs?=
 =?utf-8?B?b2NRQUN6bDI1dDdzMWNOS2oyL3YyM2V4SzY3Q21WcmNDbVBqWFVRYzExVjEr?=
 =?utf-8?B?RVJsUHRzOTFvbzRBaDl3VGlkYTVtSEdlRjlSWlhtY2w5cDRCdVhLZzlmZmFH?=
 =?utf-8?B?RWpiNEhPTjBod21jQ2hkU1BIVXl3cnJpZERnYTI5UFA0R2RmcDdOakljZjBh?=
 =?utf-8?B?RG5qWXNIUU5GZE03NnZOdmFYdFZLZ1BMb3lIaUtSVXdMc2gzYjgycTZaTHVZ?=
 =?utf-8?B?RzR6Q254VmVIcjJheWQ4SDJ4eVprc2FabXJ4SU5LbExNYUFWdk9KUUE1eXl0?=
 =?utf-8?B?U3BWU0FrcmdNQjUxUktIOGpHR3J3bGRWbithNWs3WGFrQjRCZllYbHA4WHFy?=
 =?utf-8?B?QTA1dEV5U2c0aXByOW9hUzRucHhCRDRiT1pnSWcvaFQ4eGdxSDl5VHl0djh5?=
 =?utf-8?B?VGZrQWl1Q2RHZ1NsR0FpS3hqQUxENUMvUlQ0SndEK0NxclF4eVRWVzR6bXFZ?=
 =?utf-8?B?M3psSWM3VTV6UkU4WTlXeVBqL2VTT2VXM3JQRG4vMllHT2NybGtLMWtNWUln?=
 =?utf-8?Q?SJdac4oPAPqVn3t74lZ4R75Xi7b9d87IHxdfEdd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 001013dc-bb3e-4993-2189-08d8e483437b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 11:46:09.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRItsg6X6U466plfY8DhcTWKWOxGCp5JSURwZu7pWonGtWLYmFhJpK7h9LT3IAugy/ARYDj4Qd51rUTqOradBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4137
X-OriginatorOrg: citrix.com

The Xen build system relies on configure to parse some .in files in
order to do substitutions based on the data gathered from configure.

The main issue with those substitutions done at the configure level is
that make is not able to detect when they go out of date because the
.in file has been modified, and hence it's possible to end up in a
situation where .in files have been modified but the build is using
outdated ones. This is made even worse because the 'clean' targets
don't remove the output of the .in parsing, so doing a typical `make
clean && make` will still use the old files without complaining.
Note that 'clean' not removing the output of the .in transformations
is the right behavior, otherwise Xen would require re-executing the
configure script after each clean.

Attempt to improve the situation by adding a global rule that spot the
outdated files as long as they are properly listed as makefile target
prerequisites.

Ultimately those substitutions should be part of the build phase, not
the configure one.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
RFC because I'm not sure if there's some better way to handle this.
Also I think we would want to make sure all the .in outputs are
properly listed as target prerequisites, or else this won't work.

Also not sure whether this will break some other usage of .in files
I'm not aware.
---
 Config.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.mk b/Config.mk
index a56a971028..a81d384899 100644
--- a/Config.mk
+++ b/Config.mk
@@ -65,6 +65,10 @@ DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
 %.d2: %.d
 	sed "s!\(^\| \)$$PWD/! !" $^ >$@.tmp && mv -f $@.tmp $@
 
+# Make sure the configure generated files are up to date
+%: %.in
+	$(error $@ is outdated, please re-run configure)
+
 include $(XEN_ROOT)/config/$(XEN_OS).mk
 include $(XEN_ROOT)/config/$(XEN_TARGET_ARCH).mk
 
-- 
2.30.1


