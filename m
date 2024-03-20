Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A20880BD9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695739.1085746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqB3-0008B3-Q2; Wed, 20 Mar 2024 07:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695739.1085746; Wed, 20 Mar 2024 07:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqB3-00084s-MJ; Wed, 20 Mar 2024 07:15:57 +0000
Received: by outflank-mailman (input) for mailman id 695739;
 Wed, 20 Mar 2024 07:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqB2-00081u-VT
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:15:56 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20800.outbound.protection.outlook.com
 [2a01:111:f403:2e06::800])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1807fb9-e689-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:15:55 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 DB9P192MB1803.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.26; Wed, 20 Mar 2024 07:15:54 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:15:53 +0000
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
X-Inumbo-ID: b1807fb9-e689-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bhg9Pt+9bdQHsV3sGqzpeuIMX/S0dQ2XrM227/aMPGOkfAyoABqzegmkuuSlrB0bTFKknTm2/85bpvRe3BSCHMwfh/ULZlBc3vid1+mX2PYvsovbkG0W5ddAyQYP7OiF6r1X6x5x+NFnadBJDB0EB5d+Q52ZOVMY9F+KVTi7Up3cQB+o5CyZt1Iw5fBOOwZp+WXne1TlsJSDaETwDvcA7s9zPAkH08EcMZ4Gl9JBwIqI0gEfcjo/nI12ZJ9UZbtX1gY9JmuWC2kpbVF1ZPfpoHPlzfkONExmwM99+CoVB4L/9reESGex70ghJ9InF3jlUT0gmm3kjOjF1d6VYKFczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L09xaIyDfPc1imD82wYwTmT8UcsJA4judxkiTTMaxjA=;
 b=K6TC/DYJw8CXznvYKMInlHlSYshBAmrYn3/Eo6YvLHGhf+wB/YNHvfTBqM8wVxoPhQQHB29SUuYRZ4Cr6fN5BFc1oaQ4ZY1jwiDYJT936klgusScmKoXV9kiBTF+VeQ+SnM6Pku56YZEqoASlAlBYE9WjKVx2yX3Kxbi9M8st1XBIO/iy+Fu26kaA0UCi8/EGU79wsk6Drsdr3aSSDBEmq0YTk1TU2jbT2nESLejn6Jnb+Nx8nGmW//tT0whyUgW9AeeHdlZ5JJjkLYo/EoHvyfXXJPl2G6+McYdclMUMANzUkxIDRgVwfBUV6LQs4qDSoSFjDDs9SeJ0MmhoaEEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L09xaIyDfPc1imD82wYwTmT8UcsJA4judxkiTTMaxjA=;
 b=tgs9PvBYhXYILLNPfeyeCsKbRKIPbsppfu8HDKvqBpkqlWDeDoI8i4WS1rM3tatIc3uedo3DsTdAQt8s4rU6iIo0p34/++KKsddVbh0o2kDkt4YcSkvDByegH9ekbB+/A3Rov6TaEeSkSODEo2tWewSRd63Fwk3Z4IQoW824ZFMKF5DDoIk8VPVvSYcXChRst/a+7jTtklp0gnSLZkXrZfpSnchSsQCRUw/ykeca1AbGeLhuGlNvTz3jAKu4KL7X7yEezpm6pqFArOvZyV+Ux9rIWhsobjGRCc4ydEs8JdVEBHbqoW0dd0PYPhV5AxOhxctaUPCzkmn1IgjfoClMng==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: dragoon@waifu-technologies.moe,
	xen-devel@lists.xenproject.org
Subject: [XEN PATCH 1/1] tools/xenstore: Add missing XENCONSOLED_ARGS variable
Date: Wed, 20 Mar 2024 08:15:46 +0100
Message-ID:
 <DU0P192MB170046CFB3F2977E45B08E3EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710892585.git.rafael_andreas@hotmail.com>
References: <cover.1710892585.git.rafael_andreas@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [y1Gw2ZI1CKmIfyxqXY5TDSGUuH5GL87D5lK7PFIyq/4K3j93zwONTfqZ652w/eq5]
X-ClientProxiedBy: FR4P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::20) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <4b50f894496298b8e1058641e45f339ae3cb513d.1710892585.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|DB9P192MB1803:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d0d9ae-6068-404b-c73b-08dc48ad944c
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBsDoBs/oZrXuoWrSByezst704aY3uOTeGkffot19l2ErGRPgK4SoMGmvilXCA0kfdrEZc4+d5rHQ4ZH7xKgCErg3Fd3Zp0wGxyGhqL4RUmc8hem9jt8l/tbb0ttfUh61FtByQAn/rPoKsJjDYyuaEJRkFONJ4HUCtD7XCg966NofB282V7Eb4Ob7yLyxwFuz2sPpe6/taSarRM9Aa+TSHS8KW1IcyDzBuPUt7jXc6/lfG2h4OfyjjT9UVAkV0uiczZ2AqTpr0iiXnKJb4x5kuNcyDvt/EGad+dofwPGMa+EBdWcmIwfPP2VUX4lnHwyKi36CHufUZVdZwTLak1WU2xVQ65Rwc4+0oOSWDeeuEwqi9cuduEVqgBbTHel//Dg0f8AOYg7aGuHAnYu189d6dTu71PZgHzQAY862UfUNCvO4qwJRsNk+84GfOxSOJ03akysaXnt7Y+WKVQxlpNFDT6XknQSv98rEoGZOs3Fg86JDWTwyCNnMQC3wOKTIsv4OLWY+vbUjJSK9P8IG5g+qvDJT1aZDt/Nnl9FMduiCKAowJ2PDqby3H4i2WADnaSAheKAH2v6jg8v/GDGZfb9g/39KiTDlZ9adXv4K7DSbvGrZyxnOlphyxKu9KliGHISadZC4gUtGyOLGhEHvL/Ml2axNW85YnI9VMXFT6YDAEGI1rllthlCwucvZr6b7Gf4xlkB36y3WTKq6Ry4OAxBkWhl1k9xZRd6SEzLNOBV8vaq8NILcSbs3byyRJvdCm5fP/saop7sLuuxPHvxM5FV6354
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j+UEt0Z/15xzlS1jGJhOLg+dWRkkRgwBipqx92z9Usbr2W4byJweYjz+3YggODSv7C5lOkwTih7skP+6LBD+W0fCbXoE51Zg/qhsucH8FJ+4JdIMnOw+ZJxcn9P8fXKyngnoGI90lTUsa34j6eQWCoyiuhvNTHwrH6h3OK3sZvjo+768HTo11WbzT4ltShq7vbIObnvpRLvCp7mEXh7PEcSUggGdExN3wrdcl6rcHa/1Gk/EI/RPxnfMOcA9uYrezFC3LEEGxIUP1Cv6WqUq+dssO27q4A3kxH0CtV5OYqSqnL7qPI3UZ+3si1umMoek+zEsfh13Et4WfXX7TuS9WoQrw1n+UEUPFG9YGuNqoKlxqQCc7AarHBqeHSz+r2vQEItdDy19xVH/AJMaDRV3iRnjSJBTJOr2LAlknrydlT8nm/DdtLvN5pkHWToduB2qI/9y2ZO53fLHGyl4qS5vGZBsirs86Y7ziSaXftzKtrJI2Qp90YjKYsKBcQ3SYufucCCTZcDO9ODKkiyajrE5mn9kjAdvpxxbtoUJ9hXXI7jMtEO5NdSId9BQJUWn1mW3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzN6bnNTLytYNWJtN3RMLzU4blJHdW5DQTlmWkJ5UFRpeXFBdjZkTWhFekJS?=
 =?utf-8?B?V3dJTEZZTUZYMlVQUGhYQmFYNFk3QXBCTlhaNU9UVnpmV3VPbll0TUFSblR1?=
 =?utf-8?B?V25aVXc4RlFTZ3VVSklVRXo2TkwyV2JVUXQyYVg5dHdzU1YrcklWMUZ5Rlps?=
 =?utf-8?B?VVc0S1RYMUxHL1prSkpjcVJqNmRyY01KSEphMjdubFUyTUpSMGI5MlI1UkFh?=
 =?utf-8?B?L0JpM0lPRVo1ZG1seFRIRWhCSVpvMDlPaldaRkp6ZEVnTndhOXEvVUVXUFU0?=
 =?utf-8?B?bHZ0Q1NQQU5pMUVVWkVINFVuanM2allvdmdiY1VJN3ViYmpxSEFxRDl3Vkw4?=
 =?utf-8?B?b1kyMDFtQ1BSWlA0NVE3c205cEtnTmFLRTgwQzR2dUV5MHQvdUpWTE1IU1Fp?=
 =?utf-8?B?VkJWL2tVNXVHd1VESVNLYklDNjc4M0tHd2JlV0xtdWpPVjEreTQydStiQVZs?=
 =?utf-8?B?QlBhQWFjWWkvYXpuT1FmRkMxTE5IM2ZVR3EzYWE5ZzhMNzJRckczZ1VpcGpu?=
 =?utf-8?B?Z0twQmdNeUdvY2pLVEY0d3BCWkc3ckI1d1N0V2xxRldFSUhieTZaYkF2Y1B0?=
 =?utf-8?B?QkpTbEg0K0VDWC9uVTJ4Q1VoUnhidm9rVzExdDF4K3grRnNvSHEwN1BzYnhX?=
 =?utf-8?B?TzV2ZnJaQ0QwZVZoMWc3d2wzTkc5cjNFTFJKOVJ0R0FxLzIwcXdQUFdRamtP?=
 =?utf-8?B?dTJXOWFQNjgvTllwWVdRa2VjVTh0emdjWXEwQ3U3c1Qrd2hXcGNaUWtodC9j?=
 =?utf-8?B?bUoxOUNFekVFbG1CYkZVZXZSbWxhYmF6QWFDQXpMcnlrVlNHR2d5YWx6NTNk?=
 =?utf-8?B?aS9YallNZS9uaFNSQjBvQTNMNllUVFpyVmptVTNvQTVjOUdkYnh6dW1aNmlB?=
 =?utf-8?B?enRmZnZpS01DdzI4UVFacFBvSWdrSTJuSkMyb3cyQkRuWHZPTGlOOEtFbVR0?=
 =?utf-8?B?NEZEMzV4NEd4QURZTHJLYWV1a2d3c1FGUHc2Z1ZsdWMvenBVRWdMTTVId3F2?=
 =?utf-8?B?ZjBkdlZmV3RWT1NYL1lLaWg0d0VDREcyWDFEbjZyczdUQ3BONkdtWklpN3lK?=
 =?utf-8?B?Qmk0UVhDREd5Y0NrQURUVWRIQWtPd0xlRnZ4MFkwQXB2d3VRczBsTVlaMFI1?=
 =?utf-8?B?MlN1ZFRNMEt5bWtSTjdLd2dVRldxdjc0eGUxcUVKTzFtZ3RiSjdEVVFRdE5j?=
 =?utf-8?B?WXFHc0NxSk1QQWMwdkVtclo1bXo5Ukd0MTVXdzlhQnBKZWs3endMSWtqZWll?=
 =?utf-8?B?QklTMGgwc2RhbUlmQlBVMGpYQThVb3FKSW56ZytJZVlhM2tnM0U4SHBwL2dm?=
 =?utf-8?B?Rk0xTE9VRjJBZStocnNNKzViUHVwLysyRXhTMXhPNnpUeEN1WDk3SVJUYk5U?=
 =?utf-8?B?QUxyQnNlZXpBR1VpQVZ4ZExBQnBmZkNqVGpMRHdHVGozbkt5QTVITDBzclQz?=
 =?utf-8?B?SlF5L1lSbjRMNk54VDVqNzVSdEJ2azB3dGxtRHhUcU9pcFlNUE93OEhHcTVl?=
 =?utf-8?B?WjRjRE40OEFnMzI2U1kva1JtNlRoM0JFRDRRL2t5dHBpai83RFdWVm5kdVp3?=
 =?utf-8?B?Y2g5U3VYMG1kTklHOWl1ai8xMFY5ZUs4cytKQm1nYVcvK1FBUWFoV3Y5R3Rs?=
 =?utf-8?B?Y1ZTUDJrUTVZZTBQWHIxc2IwNDJnN2FZeENCczVPZUlGT25DL2Nma05oVTc4?=
 =?utf-8?B?dFBSL0ZKRlVPYnZHQ0swYk82eXBWT0wrYUhIZDIzRWM4ZUtxUGVZR3BGZnFs?=
 =?utf-8?Q?OixWXpx+8f9R+1j9cpq9LhFJJvJXaJUuNT4/7S2?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d0d9ae-6068-404b-c73b-08dc48ad944c
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:15:53.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1803

The systemd xenconsoled.service uses the XENCONSOLED_ARGS variable, but
it was missing from the xencommons file.

Signed-off-by: Rafaël Kooi <rafael_andreas@hotmail.com>
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 1bdd830d8a..42104ecaa4 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -5,6 +5,12 @@
 # Log xenconsoled messages (cf xl dmesg)
 #XENCONSOLED_TRACE=[none|guest|hv|all]
 
+## Type: string
+## Default: ""
+#
+# Additional commandline arguments to start xenconsoled.
+XENCONSOLED_ARGS=
+
 ## Type: string
 ## Default: daemon
 #
-- 
2.44.0


