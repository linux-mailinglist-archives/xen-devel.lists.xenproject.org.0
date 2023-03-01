Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4C6A6E0E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 15:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504063.776567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNCi-00029E-48; Wed, 01 Mar 2023 14:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504063.776567; Wed, 01 Mar 2023 14:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXNCi-00026I-0p; Wed, 01 Mar 2023 14:13:12 +0000
Received: by outflank-mailman (input) for mailman id 504063;
 Wed, 01 Mar 2023 14:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXNCg-00026A-Hc
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 14:13:10 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 311a9f12-b83b-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 15:13:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 14:13:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 14:13:06 +0000
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
X-Inumbo-ID: 311a9f12-b83b-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCjyCvvYJcOSuqcxk4OLea3ZtJRAxWJwiMrtqfEyapL93EzJfN2XetRzaaEJXd3vCvo1BczgKsbXSfEAtRkypqhxJPn1gIKz9Wtm4oDFY9j/6XpaWtFNK098C3u36YCZQbn9X3z5MWOYT6VEc6Vcl/1trUGQ0OvltcdhDFVyP720ZSSYJ35ChCQORIvDox4Q+ALkne+h2yds09t3jfGNQ67wJYRmKXw4qHsGsgFje1C5/uwBg1JvIPXWMFZfNxjH4aZbQz9RycLAGBJG6tER8ameS+SQJoDGEqXI6y3NOx429agSF1RpujnKgJ0EfzUE6lL8fbshypmoCRd82a5XHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjeLmA2eNiOxciM8UGLqrT2OGGZaeyhsIURc9DPTNTE=;
 b=Y0Zp193yTiCXSiWSX8fB3tE8Dtl6yFaKII5ndPFT52Lw2O4LsnFJa3RpENabWYPI8SgSVi5dUef2V6LAnTSCkasXKmXsbyVc/KtuG470y2MUdx4hd7LI1YZlevT8k5JMqXjdtqQuxAemm4qL8vCH78Lr4Dh9D2H8/BovluhAgipBCwdmyK1erbUp11lzjzv8QexjfS8JUM4Js0eyFkRM/4K3ASSi//na4Ct7gudbnrihf+7lDQMbFcJFSGVfghXcsL3HiUUqyprQgTN531hvbeTN0a7kUCFvTLpirvxvRkJRvpPzJTBW2vN1APl1lpluTzCdPyoyzZ8SCykzO+ZK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjeLmA2eNiOxciM8UGLqrT2OGGZaeyhsIURc9DPTNTE=;
 b=rsdkYZQke8YlPJcL8PtJqlqhLb7BBz3cZTTG1kGxriR6v0hXjziVjoFAqjjeoDvq7evL99YCli9xfBOwXQdp+YS0Ozcbhm4IyeXUjIlaj9TszLfxQQrCgKSfYqBamf8k4JvbB7XtkHv9K9RsqHRUwA1EuRBGtalJYvNzk03U7CoSb5j1RNnT8ndm6HobPi4U/5aQr+gqS65nQ92+bTCYQ/qPpn9joHzGvHYaKO7imJMZZ4MA1fEXOm2oxrOr36GQ667TJdjbuYtmPhhX9Tr9iXMzSnbivP7fyJRVQqtTEv124RHmEqaSTBmUOfqs6gI8AxgB5P1XccUUTAPAsGmDyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
Date: Wed, 1 Mar 2023 15:13:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
In-Reply-To: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf0b038-7969-4946-420d-08db1a5f1435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uaAPw2h7LoJK0qqH4XyqwhvGMoG3XTMaVhFOcTgtyxG5w+Z1nDOtf1WvWT4cgr7w5+fVvNfoCwWxiqHtA/6htyom6c3I1Y/fREmJQygBfYVjHnj4ZAKaFdaUrfPJvuyjbnu5xaAwOQLAf9otnq9HCuvcz5ubSk1B+RWgdLAASO9kvrMz1Ukw9yCz3qc0dBsYIak/5Ot3qxAunK1JMgwuThQkJXY/52vsliNu1z/k+I/SnxPnEzvmxCYWh6kZ/nZ7TgrSwbmTs+LTUudUiNXa3hQ6FjQTrHqkrwghbODj+1TwJobDU+gUaJ5k4rMqsMf/O1jtqE6mxb66mYiNqhII5LyqTN/CFoGD4X+AfobXkyW0wiEHYflgsRDMiFhAINKeweG7ZY6hw2YDAiPeXkSpCceHERnppmlyid1xElvlv9Jwo42yzRqS11awX0GpVzwg4LKvsfXRJvncVVaLWULQdNxxbx9zmlBxUzarwT+zt8jefal1DSild9Tk9fu4q3p6Lcd9DpQSlim7x6vHA5ZOjwUiAL7IWN7iTZxPOIqG/qVTgPa31NNPOBu++WuZx5MNEL+lIGsjSuPKMAQesaFNOIQld9G1rMfOAFaC1GFx9yyzW1E9lQhv2GdK4N8a1U/SJgxjEpkWSrliu3k7yyN3vXZ2iX8lQq7AAbiRKNp0TPDMqCKymQwX9R4HYG/8fwFn9wkZREiV0IfyH4SEzQVfizSbJ83gfvjmAxNPoVa3OA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(31686004)(36756003)(478600001)(83380400001)(316002)(54906003)(66476007)(4326008)(38100700002)(6916009)(8676002)(6506007)(2616005)(6512007)(186003)(26005)(6486002)(5660300002)(31696002)(66946007)(66556008)(41300700001)(8936002)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkdZWUd1M292RDMyV3EwMzhSbG5YcC9KK3BDMU9EeGVaVFcxdkFnUzlWbzFU?=
 =?utf-8?B?dGt5YzloTURQQWxFNjFubGJyYkRpQzk2ZCt4NStFampzaGtiWDlWRWRWa3Yr?=
 =?utf-8?B?bmV4M0hsQTZhMGNkU2RSQlpsdFFSYXhWU2YyTWNKeEJoSk5RWE1uZWVscWpL?=
 =?utf-8?B?RzRFc05MUEF1WnFEWisxQTBkanVKV2plYVlwTmo3Q3RaUURobEJ1bkF5enUw?=
 =?utf-8?B?SUhOTlA4bUNtNXBFcXBuWWNRcVArcWtGcDFIRWhKeUs0Nk1rY2xJdUNRYTVp?=
 =?utf-8?B?OEZsRkVqNXJiN0VBUnYybnphVUhuWG14LzVYOEZXMUt3eHY3MXRxZVdaQXUr?=
 =?utf-8?B?b0xSVE1QbkxTMVZWOW5sQW94N2hOK3lUakVMMFpXRGE0V3lpamxDbHJjV2VB?=
 =?utf-8?B?VFczbzVSdW9RVlJ2N2JyTHVNK0I0Ni84Y0Q5eUtxbTVsenBuMDdScnRhaTZ0?=
 =?utf-8?B?MGpNK0M2dk9aY2JHV1M5T3Mxb3duekxXbWVRaEJLRHhsUjhwM3d1eUxlQTI3?=
 =?utf-8?B?cERQUFp2d3RZQUU2SmdpaEJpa2t5cGRhUWh0SkI0eDhMYmVmMXdIQWZqSWUx?=
 =?utf-8?B?VzN3WFd5VXR3ai8vT0hrYkEzQXhZYWxQVmpnU054KzdmazRQWGhLcUF0UzhL?=
 =?utf-8?B?ZUJPOC9RbElKMkFPdzZ4UDNDVkNyeTIraGFJcCtPT1RPaWZqRzEyM1lDUnVU?=
 =?utf-8?B?YzhwTldYZ2RTQmZ0RWlXOEpxODJZV1FIU2xKR05wbzhuK1JOSW1nRXZWMlov?=
 =?utf-8?B?UlBBY0o5TkZnWWlFaVZrMTlsYmw5QmFGR3BoVkw0d3VFNTdZVGU1R1ljTFMz?=
 =?utf-8?B?SUpHeTRQb3hzbE96cVgvSE5tVlZ2MzJmQW5lTU1GQ0lMNURXU2grcm5TWUVG?=
 =?utf-8?B?ZVRZR2hvM3ZXU1BqcUYzRHJkMDVuWlVUOTAzdFBOWHh5SkdUVmdKNEFqRFpM?=
 =?utf-8?B?MG1DMWVnbmZkYTMzT2J1cy83aXE1NGNOdUsvV3NRUXBPTG41NWZLS2VUcXpI?=
 =?utf-8?B?VTJuUit0bGNaY0lZWUZrcjRvUGpSZHFsRjIwVkQyblgvbXpBb0FtTXdoa3Mz?=
 =?utf-8?B?VW84aURwdWNRb0F1d3JuUVA2dllaL2xiemZqVW52Z3Z6dmF4L1pJSDhrNGxQ?=
 =?utf-8?B?Y0NLOWszWStzNjVmQVhuRzRKVFRnTFNURmptbFZIcms4bWY1bDkwZDB4Wkk1?=
 =?utf-8?B?V2d1cytMeW1aaGRiTlVBcmxndjFiQm5Id3hUamE5bG5pYktsREowRFFteDg3?=
 =?utf-8?B?QzZldzhTOFJIV0pFeGFja1JROFAzQjVNVG8zYUZOcFFoc21kalVKNDhuR3Jj?=
 =?utf-8?B?N0lDeHQwZ0Izd2lSMVdDeVJDSEVOMHhPWCtpVjIweVgwY0tGQmVCaWYybnJE?=
 =?utf-8?B?YjBIMEdnQmxZRk9EVElpaE9CZVRtaEtnYXJsTWE0NEFlQjBNbHk0bWpHM2hl?=
 =?utf-8?B?N256SktudFh6Z0kwdWFCa0VzdS84b3FoemtLckozVVZVZFhHSGlyWDRsR0Qv?=
 =?utf-8?B?L1UvcmJHWTVIaG1uQUJNRis1UzFNd1FneVkxRFZicFZvVkZndEo5bWNkUk00?=
 =?utf-8?B?ZFdkU0NVTzdpUFZ4clMwUWloYTQyTmZkVUhtQ1JLRFZQclBGampjdlorckNa?=
 =?utf-8?B?azlaY0g0cmwycFFoNVBkczJYY0lhY1h1enpaS3IvU0p3QUJZU1p6TmwwYmcy?=
 =?utf-8?B?aTQzdHNZZVVnVVBUUjBzOVFmOS9vNHdVVnJiVW9sRHgxUytUVExMK0VGbkJx?=
 =?utf-8?B?Y2crNkMwZDhKbTRmK1gyZ04yQWFqRE8yd0dPeklCMExqN1U1YW9vckNOTHc4?=
 =?utf-8?B?RjM4NFg3RGZVVDBweHBqTWJDREVVcXRLSVlqTnZsTy93UE8zZjZPYXBEVkdq?=
 =?utf-8?B?SU1pMlFaeXlzWGU2RjIwWUxSaUtWV3lydzJTdlVzcGI3dmRhdEVoUzhpbnE5?=
 =?utf-8?B?VHQvamhHcXd5aWVVYlR4WksyY21wcVBsS0tZZFJTTk1pRURXMEViaFFiUmJy?=
 =?utf-8?B?dHJXanJzdzloekhYQWV5aE52d1R6eUY5L205bmovNit3K2tZOVYrVXQwaWhZ?=
 =?utf-8?B?Y2lUSkRiN2h0bWZBWXNQSk1XQW45V2Q4OEplMW9QMkpQaXV4WDV6U1ZlQjRV?=
 =?utf-8?Q?KRb4uFYIGvSRVPHIsInroEbZd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf0b038-7969-4946-420d-08db1a5f1435
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 14:13:06.7869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdxunJJNkmYfEA6inTw+SQEaCT2bE+T6SakAzxT9gtbMurO6aCOL1RGamphVuaDyrAXvj6clXiilcDyDu9FOSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8382

While we want certain things turned off in shim-exclusive mode, doing
so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
a result. Yet allyesconfig wants to enable as much of the functionality
as possible.

Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
C code using it can remain as is. This isn't just for less code churn,
but also because I think that symbol is more logical to use in many
(all?) places.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The new Kconfig control's name is up for improvement suggestions, but I
think it's already better than the originally thought of
FULL_HYPERVISOR.

Secondary Kconfig changes could be omitted; in all of the cases I wasn't
really sure whether do the adjustments. I think to avoid setting a bad
precedent we want to avoid "depends on !..." (and hence also the
functionally equivalent "if !..."), but any default settings or prompt
controls could also be left as they were (or could be done the other way
around in subsequent patches).

The Requested-by: isn't for what exactly is done here, but for the
underlying principle of avoiding the negative dependencies we've grown.

Outside of Arm-specific code we have two more negative "depends on":
COVERAGE requires !LIVEPATCH and SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
requires !ENFORCE_UNIQUE_SYMBOLS. The latter could apparently be
switched to a choice (enforce, warn, don't warn), but then I'm not sure
how well choices play with allyesconfig (I guess the default setting is
used).
---
v2: New.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -103,7 +103,7 @@ config PV_LINEAR_PT
 
 config HVM
 	bool "HVM support"
-	depends on !PV_SHIM_EXCLUSIVE
+	depends on UNCONSTRAINED
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
@@ -145,7 +145,7 @@ config XEN_IBT
 
 config SHADOW_PAGING
 	bool "Shadow Paging"
-	default !PV_SHIM_EXCLUSIVE
+	default UNCONSTRAINED
 	depends on PV || HVM
 	---help---
 
@@ -196,7 +196,7 @@ config HVM_FEP
 config TBOOT
 	bool "Xen tboot support (UNSUPPORTED)"
 	depends on UNSUPPORTED
-	default !PV_SHIM_EXCLUSIVE
+	default UNCONSTRAINED
 	select CRYPTO
 	---help---
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -276,17 +276,19 @@ config PV_SHIM
 
 	  If unsure, say Y.
 
-config PV_SHIM_EXCLUSIVE
-	bool "PV Shim Exclusive"
-	depends on PV_SHIM
-	---help---
-	  Build Xen in a way which unconditionally assumes PV_SHIM mode.  This
-	  option is only intended for use when building a dedicated PV Shim
-	  firmware, and will not function correctly in other scenarios.
+config UNCONSTRAINED
+	bool "do NOT build a functionality restricted hypervisor" if PV_SHIM
+	default y
+	help
+	  Do NOT build Xen in a way which unconditionally assumes PV_SHIM mode.
 
-	  If unsure, say N.
+	  If unsure, say Y.
+
+config PV_SHIM_EXCLUSIVE
+	def_bool y
+	depends on !UNCONSTRAINED
 
-if !PV_SHIM_EXCLUSIVE
+if UNCONSTRAINED
 
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -3,7 +3,7 @@ CONFIG_PV=y
 CONFIG_XEN_GUEST=y
 CONFIG_PVH_GUEST=y
 CONFIG_PV_SHIM=y
-CONFIG_PV_SHIM_EXCLUSIVE=y
+# CONFIG_UNCONSTRAINED is not set
 CONFIG_NR_CPUS=32
 CONFIG_EXPERT=y
 # Disable features not used by the PV shim
--- a/xen/drivers/video/Kconfig
+++ b/xen/drivers/video/Kconfig
@@ -3,10 +3,10 @@ config VIDEO
 	bool
 
 config VGA
-	bool "VGA support" if !PV_SHIM_EXCLUSIVE
+	bool "VGA support" if UNCONSTRAINED
 	select VIDEO
 	depends on X86
-	default y if !PV_SHIM_EXCLUSIVE
+	default y if UNCONSTRAINED
 	---help---
 	  Enable VGA output for the Xen hypervisor.
 


