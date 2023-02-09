Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44069055C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492306.761796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4PD-0003Sx-PY; Thu, 09 Feb 2023 10:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492306.761796; Thu, 09 Feb 2023 10:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4PD-0003Pk-LF; Thu, 09 Feb 2023 10:43:55 +0000
Received: by outflank-mailman (input) for mailman id 492306;
 Thu, 09 Feb 2023 10:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4PB-0003Ar-EJ
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:43:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4c7e637-a866-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 11:43:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 10:43:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:43:51 +0000
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
X-Inumbo-ID: a4c7e637-a866-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJR55GaZQIWOrmDagCBS9+tQbyv6h13ridGPWMoIz/nJseQFvbu+jV0Fj1QbMvowkLA8/gpJ3X6EwOHNy9YU8Z2VAwI8tI4w3wmjaZIzhahksjMObOpgoa45NZVQ55wuDggP6ePWZg1Bh/TgGGE4fkBOBIz8fXmaI7NbUPgwylyBVzjqAwbWpyD+bQTIFJdMDNi2VVgr0MmxyWPuejbtPIcEJVP6HW5DYRpPzebErbvSO1scFtS7Qu9qr8dgud0S0efU8Sz2LKnxIWtgk/6zzs/lbeU4w5wYYnvWYWb21kGITq/P8zl2aUTunIc/ryd0fOEVAiaIf40aCkJDZzJ5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw8mCtU+Oy7VuL6oxtGntwYumtAFZyIQqnEOo+ExMsY=;
 b=cllWuWQ53azBWMfNfU+pK5BcWCSuora2G3PJKm/ejL0aJGD8T5xGhobBIq0o+y/4dg+hFC0G744HEHYDv9BcQCPybUHAlLbwp4nmv5hzRbxahXxZ87aXlrkrkQZMKV2uRYB3gKmBxCnEuCC8bxyI3Q9LlGTvp5yTrFPGUVGCWALdmPXVExdN67Bje8s9s5DxkOTH6dtokV8Lj+h/CrT6o5siK43/9l76oMlC+tvf2zs4UO4nkJx3NtwOwQ6Z+N1MgPwtak1ZfC/NkmzaOGnJjStnQ268+FWlt5A0jpmYdJEm19o6KRr2Q7cT4jiPn1X7ZoQibX/iF7i8oj+22qmFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw8mCtU+Oy7VuL6oxtGntwYumtAFZyIQqnEOo+ExMsY=;
 b=D8p01gsJ21aRF1psxOAreZBFo9vi1y4Ly98cSLrRSKUydJ0aDAEnDLSem8eWTq3xXj4WEOp6WGXamohAoc4TYxwtVf7ME8gUHkAU62I10xOqMLch1cRKkDTj/gPdP8K0Pzwt3KXrGPIkqhbk12Zc6XCMKRs5cdURpkugMI7TQFVZdSFVUFLzbYpO8JVKpV29Pi8Iq63ZIQYb+4UeOYKFedouVCgTmPFQgidJWbmOmfX5ghXzbxhChBb1kYGMS11Re48DwckQ0w91uVftK/nJgW9yjG6kiRNutcoX8+kgkqQcbGIEti7WvxniRHRalq+pZG9wwEfxDVx99lDDL15Ayg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e3c6641-1ab8-83ae-724d-a85af8e9ec17@suse.com>
Date: Thu, 9 Feb 2023 11:43:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 6/6] common: __u8 is history
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
In-Reply-To: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: c4758f9c-ffd8-4bf4-397d-08db0a8a882f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	am+Sj4y0Zy9eaE0UBXVyRPw2tEe9xi/L+ai5gl1BjOBeiNq8O4srcv2YBge1U9ETpwsVMkU+7rZ66oKPo0RLbsEC5lhbFIaaCv0UTWgK7sKZZNMXf29MwZBULZVIiUYZMeRnGsca+SPWIytt1156iw9Yk4VKoPUlo6hCipgiWXoDM0XHrFjjjxyPbegykIGK80MuNJNz+ZSV2SjtDw6GGtlXdJtOnUoCSdEcydQYEOZ3Sj3Qv7WI6ND8UMj11D0EUtsyVVSnRcN2Mb7i89xftrGJ2NAq+LIWHlGwXg1XEKxipDD2qNWaIeEfuAyU+iA9CypptHaQr7wzX1jeknPpbiJwYHR8IVWmHzwm1asNz6CTM9rHfpdcJb6l1xuC9anvNWewoChbeV0TmDbzXE3PteDLW5jYbJrQJAz9adDZ25uq9pMxSnbOk53D+E2L5bi4EK8BFVRCSYphmiwqk686YjvvLHn6X2ENtnvODWit9qlZ50B/+Y0tJfM4dkW1sguaQ9mJXNvcFmZBmhpL2IdBhvWVV1jNeJJTUhqqcRKKPsAYg5pCfJE7FAHYWsvhLGeHfAJsREMP35nSk7AmUYLv88C0ffDcEqk8KzjnJZo9lhCnlKEQeJeMhMxxlJlHDkwQJ3XxI0qULd733sljSN6zsPgkD56TpJ1/2ry8clTruK4jxpjgbgrQ29SANR+Eumyhw00nwRU0E2vCusR4O1dwEXN0TyLN3S5AEq0tqdvF8ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199018)(4326008)(6916009)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(36756003)(86362001)(31696002)(8936002)(38100700002)(4744005)(5660300002)(478600001)(6486002)(316002)(2616005)(54906003)(6512007)(186003)(26005)(83380400001)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2F4dnlPc2FxdCttZDFnRFFWbGxIaEVDUVhhVVR4bHF6VEI5VmdiWjl1Qkoy?=
 =?utf-8?B?M3FPWHRVb2J0c1dnaDNGQXgwUE9iL3U3eXF3NHhyczFWZUFCakRZTk5FdXZn?=
 =?utf-8?B?R3l5eHlrVklUOGNIZWZEeDZzOTViUUx1WEt0ZHpONlpka2M4bnR6Qkc1TENX?=
 =?utf-8?B?bzVjb0gxOXlWdm9yVDErYWpDdEplSStRT2ZDNE42RVVDbVpEcnF2ekk1TDB2?=
 =?utf-8?B?aCtsdDl2MFpTcFNqa01uT2J3cVR1cllmdi9HWlM3TzI1WVlidDMrK3hKbFA2?=
 =?utf-8?B?NmdjOUhhS2swVi9iVHpEQkU2c1FnUlZtWmdiSUJjVU9QMUZyNkNuc0N5UEpl?=
 =?utf-8?B?MUFxbnVuUFY5QmhudTd1K3JkemxWNkl5OUdHN0NTaGJzdm95NEdKWTNiU0lh?=
 =?utf-8?B?anJhdFpycGdPZHpoZU0yQkRXMHB0ZTkzNkdjRC9DTndtL3E1RkZSelRYSUJX?=
 =?utf-8?B?eklUNVhrTHoxcGVVRW1nN3gyVVdiV0xWTHVHRm5JN2VMM0ZkWHg4WDFSVndS?=
 =?utf-8?B?WHJaU2FtWUFvUVpBVm52aFFvRGgrMlN5TmZvQlhudVZSMURUUG16Kzc2NHVJ?=
 =?utf-8?B?T2FUZVQzdXNBdHJSc253UWdDalFnbGpRMXFVSlQwb09lVTdUbjlaZFRUQWkr?=
 =?utf-8?B?MmpPU05BbnVkbyt0TDFteDlxdXVMMi9aTzlnQ1NCcFFHZFJJRzFsL2RmOHpl?=
 =?utf-8?B?aDdSK1VpVVB5SFYxQXNOanJNUUZLTlYra00wZ1RhajJXVmkyYlNBUnR2TXhB?=
 =?utf-8?B?aVFTeWhmSEE3amtyN2FTWFFWMEhXb0Y0d29KeU1jdDd5OStLZ1pZa2xWdlFN?=
 =?utf-8?B?QnMvYmt3WjJLdWRtMmRBTEFLdWhGQWNHaGdCS0VwSmR0c0hJWHVMM2ZiNDVD?=
 =?utf-8?B?eVdKMEJ5WCtpa21NYW11bkw5blpidXRkTUYrZGFtN2p2aW5YRTZyWThKci9T?=
 =?utf-8?B?KzBHZVdoRkpIUlFQaHpSeStkMVhGMUhSTUtodk1BSUhQakU3Wnc2MnZvNS8r?=
 =?utf-8?B?RkRXR1QrQ2xJd3NIU2lnMHBGSzFBYVdIYno2SGZCbG5Td2lGc09Nd3ZrMU05?=
 =?utf-8?B?OFZlUVRiOWRTbmVHYysvRGtxZGl3YlpjM3I3YWExb3Jsa1JwSG1ZVGtxSzcx?=
 =?utf-8?B?RnY4aldMVlljU0Z3c3dlVmJkdGJCNDVCR09vR0JFSk9FWStnZk5DREdFdyt5?=
 =?utf-8?B?cFF4a00yWHlmUm9KUkhNMGR6YldJMkU5bGJMSUR6bmg2eVc4SDBjSFBwRXBu?=
 =?utf-8?B?azRxbThKOUwxUHE5YVZzTDVJOGxiRk02cjZIcUQxRC9BSWZsRWllTUZwdkFn?=
 =?utf-8?B?K1pKUmp3ZUlpcGRQTkczdzE4b3h1c1MrYkNiVmNIejF6b0lUQmFUUWxXbkFj?=
 =?utf-8?B?a3hGMVA4SmFqRFpjOFovS1Uvb05jbEdyL0ZpZ0oxYlM4b2s2dUpXdVJzY25R?=
 =?utf-8?B?dnNGdlprb3lPM2lsMTJrK25vRk13SjFFK05OQlVBcGdVT2x4bDNuZHBPcGp4?=
 =?utf-8?B?YkdEMDVrNHc3c2czYjhzTFpHQncxMlh2a0xCZEpFd1NGZEp1UmFDeHZScmFE?=
 =?utf-8?B?WlU4RVh5Qitxc1FFUkVrQldpRjlOYXNzRW9LS043dVo0RmVFY05XNkh4aGpT?=
 =?utf-8?B?Rnc2M2FGNmU4U25PS1VBK2hpY1ZoVnBGdU4wZHo0T2MwbTFEWUhMTzNwWUM4?=
 =?utf-8?B?N1I3RlQyczZ6Ky9Ic2hkWmtHQWlRZWZlOEYwUW5ZNTZPMDN5dlRYbGUxU3V0?=
 =?utf-8?B?amdGNFVuVGNuVnpxUXo0cEIvSGlWbnZKMFRPVWlGcUVMS1IwZVpGajZic204?=
 =?utf-8?B?eDFyVVpibVBUazVWN1ZTZGl4Z3ZvelhpbU5Pa2lZblF5cUZ3WGtVQWF3dk5Y?=
 =?utf-8?B?dTNzUGxjVHJqV1BLTjV5dE9jVFNtaGlFWjRRME9acTQxMlcrSG1MNUMrVWM1?=
 =?utf-8?B?enB6MWFhanI3L3J2NU51Q1JFZWlUWHBDaTVMYnByNUNHMWxPVWlObmtFY0JY?=
 =?utf-8?B?TnBkR2U0dEJES0w3K1FwNVVoakpCd0VuejZCVEQyb2R1WmRVTEtKVjZsNU1T?=
 =?utf-8?B?MjlyVXFJZG9Pc1VnWE5UMzBBSDR4Um1vL2sxcEZlQWhmWHh0alpKczZWdFRY?=
 =?utf-8?Q?ziHtuEQttq6P/NWAGhiqwT+L9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4758f9c-ffd8-4bf4-397d-08db0a8a882f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:43:51.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xym67MkgslfHVU/qGwa0AF04Kfyaxd1T1VEluGAIPF6cAzQYEnNnvtkcyZTS0rQ+VehlpNOATpILrDhzfXtfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

With the last uses gone, move the type to linux-compat.h.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The primary use of __u{16,32,64} is in the byte-order headers. Iirc
there is a series re-working part of that, so I guess before touching
the logic there that other series would better land first.

--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -12,6 +12,7 @@
 #include <xen/types.h>
 
 typedef int8_t  __s8;
+typedef uint8_t __u8;
 typedef int16_t __s16;
 typedef int32_t __s32;
 typedef int64_t __s64;
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -55,7 +55,7 @@ typedef unsigned int __attribute__((__mo
 
 /* Linux inherited types which are being phased out */
 typedef int8_t s8;
-typedef uint8_t u8, __u8;
+typedef uint8_t u8;
 typedef int16_t s16;
 typedef uint16_t u16, __u16;
 typedef int32_t s32;


