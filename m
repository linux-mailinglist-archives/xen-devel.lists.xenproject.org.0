Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D4F2FA8E0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69974.125495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZJq-00083N-Ul; Mon, 18 Jan 2021 18:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69974.125495; Mon, 18 Jan 2021 18:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZJq-00082y-RO; Mon, 18 Jan 2021 18:32:02 +0000
Received: by outflank-mailman (input) for mailman id 69974;
 Mon, 18 Jan 2021 18:32:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1ZJo-00082t-U6
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:32:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c41c0fd6-b7c9-4323-a85e-fc1765e540fc;
 Mon, 18 Jan 2021 18:31:56 +0000 (UTC)
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
X-Inumbo-ID: c41c0fd6-b7c9-4323-a85e-fc1765e540fc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610994716;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vdjaNXM4IPDR75ED1jom8svF/pPixyeRRZThttjEz1I=;
  b=RIlzCPct1jXovI6l0QqbyWgBd+K5Mr+j/tCU38xm+sKW2w7PjPBBSvIq
   GMOjWlq91gyPSYgtx0bxt97ok3qtPMAfbGukTgxAUkR6l9Jh9uAn4PwX7
   bBrmktT1i1H2i4V1fjGtM6CURhSPSH8cUf/j74/F77yNQ9oXhQDZmpCWY
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kfme8sAA7Y83BkbM4lTGDz/WPimLIcZLmmR+Hea+Zrjg4j3P9xvlDMPCJ+3u79uMyUbCRe69/L
 e085a6VrXM+2htJCootub5THDCwBQo+KRwVjrZs4Aoom+WddqiqULuMAYY+MMdVl+EoAQgwJc/
 1L8aVEjctOkdpwewrpLxaxOlIxLZlD/hP3gIAPEl3BlR2lVRa2qdGjNxE0YPmKJucQLE9rduIM
 oOXQBf8CtIzvAs8cYIgQb+3ApYAdkE1G7jKOATwhK5W8DlFd2HK/EH6Y9i96/rR3UOjhdVjkPi
 W8A=
X-SBRS: 5.2
X-MesageID: 35368873
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35368873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvkrwhREsjLU8akRALJv3kqllxXW6Lcc7eHZ4NHPUQZXgrwyx6J/+D9GpAhj/hXNfqtmrdGtOH6NpGm5Ir0omU1mWWrNhsBdjIMS6stn5sscMjlNr8s+C467kDbyPT9UwxJ+pNnAvlwuWsoHMxZwslIJWrPxKRgyFitu4QOJgGip/nUZh8oJJdvQh5fKTEctVMzaclZFukR2YuAbadHmGdMiswJuyqei0X3wHICmRLt5VUCKZa9l9Nxv2dbWZktV7J6h8tOMhl6wxcPKXi9JXhcDJcyCcZc+NVIaQEoOgx8IHn6wfYcYvbXdlGnSC6eSVG5sSWGDCnR8j94o17VHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdjaNXM4IPDR75ED1jom8svF/pPixyeRRZThttjEz1I=;
 b=m3lOUHqsSnF/K4nGkb4cZbMkag6x5TJZqOvXx3DN11ykK0PT1is7S5Bc4ZowS6SHJdc5XHjy7bMiBtoEAuy/YZk7RaED9szWzhGQ+5ZobCKNkno0lf06wu67udIloaOkX+BHlIlBtsG0/0b8lsR8a2h3hwloi7NG33sAQUa9jomC0WvdhIQaixeKvjC7K6FZvOrWIT6g9k1ihmIgB8UeWXerlbTv8jP5YXZ1+17mUgAB994Gh3j0qs2Li/tBPcboMp2Cu9UVIYehujCdLppdZ2v1n2kyVTJ/Px0DMD82sSAme0OORymM5AniTdsZOmQcN6J5J0ZbnGK1AeLK1zZXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdjaNXM4IPDR75ED1jom8svF/pPixyeRRZThttjEz1I=;
 b=H9OcIc+Eds5DcGZE/SDrWiALDNyihBWCEYpEerZsDH+Hv2rGyyiexDbtZkDOevulQYmkdfGRRbht2sqetEfLOZvQy/iPChHdyyQ+hkMGHdHEMCjoaZGTCJ2aGrn3VY5lckRa8nDNUxB0aS1YTPwLvRq1DmKyaYp1tmWuRO6X25o=
Subject: Re: [PATCH] NetBSD: remove xenbackendd
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-6-bouyer@antioche.eu.org>
 <20210115153105.nuqikbadcb2q6ic5@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a37c7fff-44e1-2058-9d12-6ad7ea5c51ba@citrix.com>
Date: Mon, 18 Jan 2021 18:31:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210115153105.nuqikbadcb2q6ic5@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::28) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5679ce59-5a8c-4892-5018-08d8bbdf52bb
X-MS-TrafficTypeDiagnostic: BY5PR03MB5112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB511212A097ED457409201305BAA40@BY5PR03MB5112.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJXAt7+eE2xejkywqUg+vjbVMhlC118OGlYxOUD7sVrJC5WD01Cx5U8JzkDUyHQqy84EhEBSFEj3hPAnCSBFocNcuE/BNnkG3Ma4RGohxaiU3jg4CpW3xuVRa/DN0PGXGUEoTDmztQDP1E+h/SIEqW+wnHgODb7hAPjgph1GFMkt9W1sCd4X82U8GgsSS78zuY2KvrDmD9aBBitXViGDUjmI/JguvRRrVskeh7YeA/1GjtmddGWX7pKXBN5cdXI4OFn/mcHP7WhsKnZ3reXkbDXXCeKLIRKFarlkRBVC9W40V+8XeyK0UWGGMJbgN5CwfDy41Xdg9iI9PFfB48IRRokqHnln5Qw7iVNjQCEfg5IapOWF9b8IqALPnmS+3bSRGLnfbhcoJNMQfhjoegnEm9pviJJQXHeZEz7jcVIUWC/I5wJsAo2UEnRM/f6sTjLVd65s8pQZzv8a2CJIj4QPJmsO99wsxLxxQx9Y98tNSgw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(66556008)(31696002)(478600001)(66476007)(2906002)(66946007)(186003)(2616005)(5660300002)(316002)(8676002)(86362001)(6666004)(4326008)(956004)(16576012)(31686004)(26005)(53546011)(110136005)(6486002)(8936002)(16526019)(36756003)(54906003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHpVTkE0aWZBa1NySkJJSmh1ektXU3RJTTdCckE3bHdDR0haYTVSOVY0QTVx?=
 =?utf-8?B?ekcxQmVLamh0R3JvYTJuVk1ET2xWczRGL0V0a2lZVWFiZGhZT2E2cVJ2Mm8r?=
 =?utf-8?B?UUVnT3dNNFg0ejUySSs2RzBHR1VZeTdnaHo3SVhkTURzaHNRNVcvbm5ybS8v?=
 =?utf-8?B?Rm5pZFlYU0dxVWFhOW9ZSUdGVUFraXJDbDdibFJ3RFYzanNuR1B3dU5HdHFl?=
 =?utf-8?B?aUJpQUJsUmgyVE53VXNUcUZZODJuNXk5VUp2QnZLYkxhV0t3ci9EUXdHT3RF?=
 =?utf-8?B?Ly9Yd1ArVXE4dmRHZGZqdXRDTjJOdFFhTmxOVUIxdmQvRFhUSGkrNUNjK3Zy?=
 =?utf-8?B?UzZjdGdIZ21TRTVxNUVxYjJJNEFISEQ2NUNhRkt2SnpTQ0k0d1dvOWJrbHpw?=
 =?utf-8?B?a1VmaDAzZWFvVlRYTGxTQjBDQnBLNURhb3lSWEQvaWIxMmZ1UThyb1hXTURy?=
 =?utf-8?B?bTF5VkVOQ2V4b2IzelN4eFQ2dUNudzdETHZhQ1JLbWQ5Wk0vY3VYelVXQUlP?=
 =?utf-8?B?aWRRMldNQUVVTm9VZDFxMHZPR0FtcnZKQjBxeFFPMW9hZmV3TThFWm5nMHJV?=
 =?utf-8?B?RW5majhneVF1QlpHVEdJQy9zTXRmaFRyMEZoRUZyWlJaQ2I0WHpNWk1hMjhi?=
 =?utf-8?B?TUlWbkg5Ui93M3VsVjhMVjV4WnFHT2VwWlE2MWFEdGpyL1MvWHpxYlQyb3Qw?=
 =?utf-8?B?VStYMzViK2FPbWhzU0JBTzVRbkQvcmZYaU5ucVMyc1NrdVhCNG5PcFc0UjR4?=
 =?utf-8?B?WHExb3RiUUZTVUlZeWZySWRhTW9WV0x6ckQ5Mll1eGFSVTY0ZXM1aXlFT3dl?=
 =?utf-8?B?RWxUdVh0anM0MjRrK1NmR1l2dzJqeW1MWmdWRTFMVU5za1pzc1dad3pYUkNJ?=
 =?utf-8?B?T2FPZmVVWGlDVEJ2YTVybmVKb0xoU1I4c3lGWndpOTV0K1NnN29NZTRpQnkx?=
 =?utf-8?B?bVdGUlVRTFpuRW4yQ25wMFM1MFhWa0h4aks5K2hiRXRDMVNHYy84VnBsYURj?=
 =?utf-8?B?b3dMMXNRbVF1RER0c2ZMWWU5S0dXTG11RERvWVVDMUoxKzlPRFk4ZSt5SGZG?=
 =?utf-8?B?RGQrRVc1NDFoODFuVVAvZXI4NDIxWmU5VGVOMnFodEdtTmlYYVRaSkdRYTlh?=
 =?utf-8?B?cHVzTHI0eXoxT3lDSHlUQ3hCcXovUHJXbVB5dnBpVW5CUXBFTjdwcTlZWWND?=
 =?utf-8?B?MEdnSFpNYWt6Z0dxb1VrTkMrM1ppNW90RS8rYW9EOGRCdHRHd29heXpPTXgv?=
 =?utf-8?B?RTBidGRRYkM1am4zNFowRURkblByNFhGWUU0WlRkVmZlSHFpSTYvRTBIbWRR?=
 =?utf-8?Q?2PqYMmzyWmx3O19A0/tR+ypdvs3eC7/IUV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5679ce59-5a8c-4892-5018-08d8bbdf52bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:31:51.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Uv1rvkpdYnfQtmmhPSW7UoctrkHpFzZ7pSazpSO5tB2TqBciDKN7Q1hld1XY2mkTjqRf4cgu8WMRlNbnfUZGtz4gk03AbyleUTUZQaRmHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112
X-OriginatorOrg: citrix.com

On 15/01/2021 15:31, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:26PM +0100, Manuel Bouyer wrote:
>> From: Manuel Bouyer <bouyer@netbsd.org>
>>
>> NetBSD doens't need xenbackendd with xl toolstack so don't build it.
>> Remove now unused xenbackendd directory/files.
>>
>> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
> Thanks, Roger.

$ git grep backendd -- :/
../.gitignore:282:tools/xenbackendd/_paths.h
../.gitignore:283:tools/xenbackendd/xenbackendd
../tools/hotplug/Linux/init.d/sysconfig.xencommons.in:91:## Default: Not
defined, xenbackendd debug mode off
../tools/hotplug/Linux/init.d/sysconfig.xencommons.in:93:# Running
xenbackendd in debug mode
../tools/hotplug/NetBSD/block:4:# Called by xenbackendd
../tools/hotplug/NetBSD/rc.d/xencommons.in:25:XENBACKENDD_PIDFILE="@XEN_RUN_DIR@/xenbackendd.pid"
../tools/hotplug/NetBSD/vif-bridge:4:# Called by xenbackendd
../tools/hotplug/NetBSD/vif-ip:4:# Called by xenbackendd

I propose folding in the following deletions, if you're both happy?

~Andrew

diff --git a/.gitignore b/.gitignore
index 35957cc21f..9e0488e0cd 100644
--- a/.gitignore
+++ b/.gitignore
@@ -279,8 +279,6 @@ tools/tests/vpci/vpci.[hc]
 tools/tests/vpci/test_vpci
 tools/xcutils/lsevtchn
 tools/xcutils/readnotes
-tools/xenbackendd/_paths.h
-tools/xenbackendd/xenbackendd
 tools/xenmon/xentrace_setmask
 tools/xenmon/xenbaked
 tools/xenpaging/xenpaging
diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 0fc6557d4a..b059a2910d 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -87,12 +87,6 @@ XENSTORED_ARGS=
 # Only evaluated if XENSTORETYPE is "domain".
 XENSTORE_DOMAIN_ARGS=
 
-## Type: string
-## Default: Not defined, xenbackendd debug mode off
-#
-# Running xenbackendd in debug mode
-#XENBACKENDD_DEBUG=[yes|on|1]
-
 # qemu path
 #QEMU_XEN=@qemu_xen_path@
 
diff --git a/tools/hotplug/NetBSD/block b/tools/hotplug/NetBSD/block
index 32c20b6c89..2a0516f436 100644
--- a/tools/hotplug/NetBSD/block
+++ b/tools/hotplug/NetBSD/block
@@ -1,7 +1,6 @@
 #!/bin/sh -e
 
 # $NetBSD: block-nbsd,v 1.1.1.1 2008/08/07 20:26:57 cegger Exp $
-# Called by xenbackendd
 # Usage: block xsdir_backend_path state
 
 DIR=$(dirname "$0")
diff --git a/tools/hotplug/NetBSD/rc.d/xencommons.in
b/tools/hotplug/NetBSD/rc.d/xencommons.in
index 886a2e2840..3981787eac 100644
--- a/tools/hotplug/NetBSD/rc.d/xencommons.in
+++ b/tools/hotplug/NetBSD/rc.d/xencommons.in
@@ -22,8 +22,6 @@ required_files="/kern/xen/privcmd"
 
 XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
-XENBACKENDD_PIDFILE="@XEN_RUN_DIR@/xenbackendd.pid"
-#XENBACKENDD_DEBUG=1
 #XENCONSOLED_TRACE="@XEN_LOG_DIR@/xenconsole-trace.log"
 #XENSTORED_TRACE="@XEN_LOG_DIR@/xenstore-trace.log"
 
diff --git a/tools/hotplug/NetBSD/vif-bridge
b/tools/hotplug/NetBSD/vif-bridge
index b58e922601..b1b25cbbde 100644
--- a/tools/hotplug/NetBSD/vif-bridge
+++ b/tools/hotplug/NetBSD/vif-bridge
@@ -1,7 +1,6 @@
 #!/bin/sh -e
 
 # $NetBSD: vif-bridge-nbsd,v 1.1.1.1 2008/08/07 20:26:57 cegger Exp $
-# Called by xenbackendd
 # Usage: vif-bridge xsdir_backend_path state
 
 DIR=$(dirname "$0")
diff --git a/tools/hotplug/NetBSD/vif-ip b/tools/hotplug/NetBSD/vif-ip
index 83cbfe20e2..3e7bd2c022 100644
--- a/tools/hotplug/NetBSD/vif-ip
+++ b/tools/hotplug/NetBSD/vif-ip
@@ -1,7 +1,6 @@
 #!/bin/sh -e
 
 # $NetBSD: vif-ip-nbsd,v 1.1.1.1 2008/08/07 20:26:57 cegger Exp $
-# Called by xenbackendd
 # Usage: vif-ip xsdir_backend_path state
 
 DIR=$(dirname "$0")

