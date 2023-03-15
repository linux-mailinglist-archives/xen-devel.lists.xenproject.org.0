Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E06BB6CD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 15:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510106.787200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSap-0004NR-1g; Wed, 15 Mar 2023 14:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510106.787200; Wed, 15 Mar 2023 14:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSao-0004Kl-V5; Wed, 15 Mar 2023 14:59:06 +0000
Received: by outflank-mailman (input) for mailman id 510106;
 Wed, 15 Mar 2023 14:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcSan-0004JB-6v
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 14:59:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec99edd2-c341-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 15:59:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 14:59:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 14:59:01 +0000
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
X-Inumbo-ID: ec99edd2-c341-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMcq/o5oBfI5ymJlqCKKjitOpknzMHffHsk+A1o4dRAOhntSEP345mv+XSgQrdSCgxcafT/WlFUWQIFHKQ81MmLWGpoYw09XXUtKS/x6k/GJFElZG0uSmEx93+M0nYeZulAmGTHNiYoYIwzEFGs84GeVGsbXg25NTuRoJO8lwBQV2oSrkWMPHy5Ujc7qviS7FCiUpr0m7vKRDvBYgYsXJHfpDt9LSlUF81YRXvwwGCCsrUFlg+1R+SfdvKv/tW5VHkOSNPu9+pVXPWPPI+Jw0hEw7Van6F2hfdk+PopGtXRclCPXVCFblVz6BJMUUETdNn6R6eh9/KgYOEc038UqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoaYAksnZO1rpp8iYxRaYazVGMnUS82MF98FgInLRWg=;
 b=K7esE0PkY8mwnRshRizzCVoYCu6QgnXyNd0IgwykXxPXQj16UcV59sESk+srJsNX4hRrUKfQtRX5XsLQvT1M6RsYVgSGKUldc7rgVbtcZypCSN3na5wmpPsUL+iFeHThglfXKqZIlO6X+qbZgHHda/GCTXKXFOtLXgB/DgBhG3dozMLN1jBTsVyZZtVzmQRQI9tbTLuzPi58ZZ0OmJpyzW0CKgvkgxIc6brryOV6wkTYd6O9PbWr4S19w3xKNfLQw1Ccr4Dz6g5HoNvdvavRHVoNtUosE/r+7H/HpqE91bJoptNELKwrFvqc6W925ZGemE5WIxelIBgYY5dXbgQyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoaYAksnZO1rpp8iYxRaYazVGMnUS82MF98FgInLRWg=;
 b=hcB5Vbgmmatb7/vlmRYvDwaHLntFTmN6blfrYXTnCHq95KNJUPLt+Ne/3lQrHzgHgYVhyoT+wIYVc1nzgMU+22eu3c0zt16lWaqA1txnNMFc42Ge70tMFWssPZbkhd+k55vpsbhlLtXsluJs7XGy+GOx2kiz+PIGsjU6PHwgp4Ivl8lLKjUqcP+px7VmlJGEJT9xRQDXTcUw0cMj8UVeiha6N0RdfyxSYuEvRb9cEq/ZZSs79dtRHclWGs7VA1F8qRv3aV9Dho/afsIDnvqLFPg5p5tIvcZWQrUvJVvEPB4wEOxCY+z0CGm+ruUdNtO3MQ4z7puVyXL77muL5iXkuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
Date: Wed, 15 Mar 2023 15:58:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] build: respect top-level .config also for out-of-tree
 hypervisor builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 281a08e7-ea1e-414d-c295-08db2565cfee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TkW5cfqVni3aKLWp8xTLgBpbYDL6WhC3O0Y/U7caKL+dVsqZ0c4WnfYfjHjM01WoObc26kmkNFpZrDdcSocHJvk/Z4hfYKI96HgAwIM0dTi3XkR+79ztfQ0Bt1nSuhA8Fx+OjIH1zBsvB+34fx/XYJeLz1DYrnsrWgM8AcAHvqw9fR7Ci3PL/mwqh+/pGZiTGpa8zM9Y/lIHggU30Z28f2g8cX9fP6pnLGZs8+7OCLTS0Ul8DgfOiJIdIXVAml2zciH14GWj/FwL+lHVaAU9M2u92Z7YS8maYeKNe5hf1CwkYOhbBjGMjRnNj8c6l0uoWJt8KJHLvEXCaerLZHNZDEQJIOJinroUsFSqHC+8qkreAnOwvkOB9PB/LK8fx+SoV2P5xKETqXrS0OSGpgFV/wZjTYTc89ZnqpUF0n9iNhe2GKZynZyLRY5ECdVeEKBOacTHEZFI8jKzNO3xT2DcOBYwj5/W1P7wHmqirf6th4ANaI06emwmseBEgtsKMyr63D3GCx7PAKsGamSv9sqeliBbAJrlApcZ0RNcRPSlM2qSyyelM6ps7d4IixDM/C4/wyzvMz9k1jHqk1AxTZBUfOZTAjnm/HqZnLfx+DjXAqnXgd0wLvlcFDM8cSI61+wV+b6ojtIPCbAsSLmNHBxqqvJ0Y4PsVRgFFXCwa5+HLAGzUoM2/D6BD6oT7SHbtfzO7DyzrfJ09B8zcwQSkwyR9TVVEucfF4zsEvAOByyMK3aIpPIghrb64CJ7VFQ1vbnHMyCMorZ1PyaqmDK1fVov3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199018)(31686004)(41300700001)(36756003)(478600001)(8936002)(5660300002)(2906002)(86362001)(31696002)(38100700002)(8676002)(66946007)(66556008)(66476007)(6486002)(4326008)(54906003)(316002)(6916009)(26005)(6512007)(2616005)(186003)(6506007)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ei9VZ1BlVWo4bFVRN29uRTdtVzVaTmpnaG1iZ1h1dDJ4c1FsQlUwUlNQVWN6?=
 =?utf-8?B?QmpIM2ZwWkROeFUyc2MyeFVkYU5LaWtpQzFKYUQ0V2JLdzkzRVZwKzJOOFVx?=
 =?utf-8?B?MVd2MVVwUDRQKytBUXQwMW4rbGk1MEd4bGpIblN2VzVMRTdvMW9TZC9hK0l5?=
 =?utf-8?B?ajdSeE5zaU1tNzhzeElaMmx5clZ4ZmxsYjA1bkNSaWhtMXJJTlBEdDlnYXk4?=
 =?utf-8?B?ZlZ2TmtsTVdMZVJVdEhXNHF5SE9ia05ycVdKbnJyUnQxbnY0bjErMUc4cCtr?=
 =?utf-8?B?V3lrVG0vQUg0M1FscG4zdXdIVloyTnBOZ21FMS8xMVk1TW9ibVhrVGE4VWdJ?=
 =?utf-8?B?R3lqRFZCVUdKMTBrQWc0U2dWbzdkRjRWbmFGUy8yNzdyZEZaMjFzeUJxRHMy?=
 =?utf-8?B?ei9nYkFkSVZaOEtnVFlJd0FISU5xMDluVUxkVmFlazRSYUVCV1RtZkZGVXFQ?=
 =?utf-8?B?YTJDRlZkQmFqTVJmQXNidFhHWXRXK1VuQkJUUHBxUEliVElobldnY0ZzK2Va?=
 =?utf-8?B?c0xQOFBObmR4eFV4ckFzbjlCMW0vcWt2c2RSRjRPZTFJZGFUN0IvNXE5c2J5?=
 =?utf-8?B?aGZ3dmM4T2QrempOUXpySEVXdTRWS1VsUHhzK0pROUZmVHdtMkVWYnhCR3c2?=
 =?utf-8?B?UDgyY2xRcjUvSTg5NnFtcVhadG1YWkRxNVFycFNVRkYyZzIxSjlUN3psMVRr?=
 =?utf-8?B?TWVoS1ZaL0M3ZitnRDJPczBoZkZXRmJFMDBhRVRHYXJ4TXNHd0pSbnNyUjRt?=
 =?utf-8?B?Z1J2WEpDblBLNWd3VjJGL2NHYmY4TFRoYUJOZTluTE90YVpBNVpqWUtBT0N3?=
 =?utf-8?B?dmRXTTRKT05ibmFCMjBnV1JqendqRW1KMlBpSmsrcmZEWVRuS1V5MDRSaXh2?=
 =?utf-8?B?RStDQVZNRmFmcDVrYzNoMWRqSi9YMDVyY3hCRURyUmF5Q2ZuZlRvb0xmY1dB?=
 =?utf-8?B?UUVoWXZVY092ZEtrNVZqNnN0VjhRd2NQTzU5VDgzaEJPWWR4Mko2dlFZazUr?=
 =?utf-8?B?MysxUk8xS1AweFhtWG5ycnkrcnB2MXRPKzl0SmtMNVB0WmZaNVd4dXVvMXNw?=
 =?utf-8?B?ZmRsbUo1RmdEQ2FBckZrYWpOUDN3dG9RcURLYzhnNHlNckhEeTVEQkhvckFM?=
 =?utf-8?B?c1FyeWp5cWtkYmJFOGY4aFpzNnJwWVRzKzR5UlFqQXJUZXZ0d29vUFREMzdj?=
 =?utf-8?B?VlpSWVhHS2VLTlpZcHRmS29EUmZBcytFYlRHNHU3U21EUGJZOC9uTmpnOHBz?=
 =?utf-8?B?TDlma0lXYkhSbEVYOHJRVXVzRGQ5akRWSkp4WTE3Y1pRZTBoTFA4aVkxTjN1?=
 =?utf-8?B?Wk12MkJDQTRHaU5UaGw5bVdOdDhBMWwwSVV6eXFvTVMveUFCeS9RaXNzOUdB?=
 =?utf-8?B?Sm44TjFFUXJWM3d5cGZZdHNXVlYxRTVwQ0xpaVB0SlpwTm53em95S253K2FU?=
 =?utf-8?B?UkllZlVjWG1NaGxZSWlYMzAveWVqR05kTUNlM0lwY2R5OHV2QmdIZVcvLzI2?=
 =?utf-8?B?SWpGa09rMmNpQ1Q5RDhGMjZ1WmFjNWtTakVEaDFCcm1GYVAvdVlYeXNoR3Ro?=
 =?utf-8?B?VzBxWllHLzh0MWxxWkJKcXQwR2g2YlJNTUVwUjZ3ZkJUSDVIRi9kZk9DYjZ4?=
 =?utf-8?B?RmdLV29TbVp4MElnM0VpOUhiN0U4cjd2U1M1ODNqUHRCRWY3NjNNaE96QjZp?=
 =?utf-8?B?Vmg3L21JUkdvbmUzRy80ZVMxeVFyK3NIWUZlbFRxTGJPVXhJTUNUOUNnOHpF?=
 =?utf-8?B?bFdzS2YxK0xXS09xZGcySGxQbnd6WFBvNnh1Nno2TFlVeDR5YkNzcUNKMXho?=
 =?utf-8?B?L2twNFh6YXFnL01zSXRMMmg3VGFuNkFlYURpMEpqai95UTYvT2tkUU4xTzZv?=
 =?utf-8?B?MTUyWWw5NUZ1ZDY3dXJrWFFIMlJhc1hyNXBsVTJ3MWkyRVFrbFk0MUVQc2dy?=
 =?utf-8?B?RGFxcHBnQ0RLblNGMXdmQkpqRWVVMUFHYWRGUFVSOG05Wm5XZ1luMCsvSkZa?=
 =?utf-8?B?WlpRTzNlL25GSGJOaHorTkdqMzVQU01QdEZWQnlyaytyL1RWQnF4dTdEdWRH?=
 =?utf-8?B?Q055RkRUT2NOUXJOdXNXSnhSUEhabUJUTG9MTWdNenpQNHlRMCtJZmJ4aHRQ?=
 =?utf-8?Q?O4pAaICkQzrffLieLRx2jZeNP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281a08e7-ea1e-414d-c295-08db2565cfee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 14:59:01.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRfJ7c7rVtxGq6lFMGrSt1hz4P5oX4YFRKLoKc2fDlA/hlZOz5aE5IHdI2XX3QrUwX9fWwVSzteW9hv3ZxXjfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079

With in-tree builds Config.mk includes a .config file (if present) from
the top-level directory. Similar functionality is wanted with out-of-
tree builds. Yet the concept of "top-level directory" becomes fuzzy in
that case, because there is not really a requirement to have identical
top-level directory structure in the output tree; in fact there's no
need for anything top-level-ish there. Look for such a .config, but only
if the tree layout matches (read: if the directory we're building in is
named "xen").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The directory name based heuristic of course isn't nice. But I
     couldn't think of anything better. Suggestions?

RFC: There also being a .config in the top-level source dir would be a
     little problematic: It would be included _after_ the one in the
     object tree. Yet if such a scenario is to be expected/supported at
     all, it makes more sense the other way around.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -236,8 +236,17 @@ endif
 
 include scripts/Kbuild.include
 
-# Don't break if the build process wasn't called from the top level
-# we need XEN_TARGET_ARCH to generate the proper config
+# Don't break if the build process wasn't called from the top level.  We need
+# XEN_TARGET_ARCH to generate the proper config.  If building outside of the
+# source tree also check whether we need to include a "top-level" .config:
+# Config.mk, using $(XEN_ROOT)/.config, would look only in the source tree.
+ifeq ($(building_out_of_srctree),1)
+# Try to avoid including a random unrelated .config: Assume our parent dir
+# is a "top-level" one only when the objtree is .../xen.
+ifeq ($(patsubst %/xen,,$(abs_objtree)),)
+-include ../.config
+endif
+endif
 include $(XEN_ROOT)/Config.mk
 
 # Set ARCH/SUBARCH appropriately.
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -17,6 +17,13 @@ __build:
 
 -include $(objtree)/include/config/auto.conf
 
+# See commentary around the similar contruct in Makefile.
+ifneq ($(abs_objtree),$(abs_srctree))
+ifeq ($(patsubst %/xen,,$(abs_objtree)),)
+../.config: ;
+-include ../.config
+endif
+endif
 include $(XEN_ROOT)/Config.mk
 include $(srctree)/scripts/Kbuild.include
 

