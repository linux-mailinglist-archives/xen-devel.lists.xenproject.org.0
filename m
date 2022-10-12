Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F392C5FC625
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421160.666357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibYp-0003PY-TR; Wed, 12 Oct 2022 13:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421160.666357; Wed, 12 Oct 2022 13:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibYp-0003N5-QL; Wed, 12 Oct 2022 13:14:11 +0000
Received: by outflank-mailman (input) for mailman id 421160;
 Wed, 12 Oct 2022 13:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oibYo-0003Mz-0x
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:14:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c16a891b-4a2f-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 15:14:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8456.eurprd04.prod.outlook.com (2603:10a6:20b:3df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 13:14:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 13:14:07 +0000
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
X-Inumbo-ID: c16a891b-4a2f-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElJIi5bTV3sLomo6HwEE7wGiIXlMKCaBpBjcudOLzi+DejfsdMF3IKza7nrWiNNvy5RKS3h4dS5Z/IXGxb6tnMluIcLcDp5frwbmBY/2gzAy3m/s6yJI6sry11QAtOVcrXy/3M4gDdgI/4jEb1EMV95ayCB5cV8ZD+jzBKZkvx2Z0c453S26L/gZNY8GCXq8N7DeLZjw2JMfwoiKrB5iMUDuSKn4Zy39S/SkQ73EtOWRihkD1oj+nuKlPgUCn906nk6MElntk48GoMHafCnnVc8XS0T/2PSTGXzX2tnDcdoU7jW/WL/dKeYSbpPF8vnz/na2+O6IhONqSDm/jTNI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CHBNsqkoxu3QRtQarXnQNywHDbKb5AzSnkC0FMUZLk=;
 b=Y7bbhF+LDdIrNxx6wFiH7CazQbUf2Rhwbx2tG/yhDLpsUI1Eisnmd2jIwU05cZMiNl1+bnjzFs+V7+zMGGkAvr3TwgBscr7imfn5LGu5GnDzqiyCG7qD+l1tIl135f5GG/5977yrFlfhGCt9ggpnbUi9azWjwMebiuD9jUz8ZezZSqj070NbCeB2f4nOCvx1BVtg7lcj5qltQD9abJ9nsvYEFLCxL1PMqNufwlgNV48neXqD8s4nOdUZfRUzsnIcjBgFXssDyKgNdohUe4T4DL9eKw8Em8r420gep7YTmNrEKP1v/N+/YAw+s3N3O4ucDNNlg+lYR/xcoimG+L0rTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CHBNsqkoxu3QRtQarXnQNywHDbKb5AzSnkC0FMUZLk=;
 b=srEUYPikHtz711XweOwUCPPcazGKPFH0SBaJut84dsyjYfXJqGD9WB2dmEObBiEz+bO2bjx9yMAWJmqGStgh+rEt26OBWqc015T/7IPCylzDmzvzlBRke3cKpsSLRkAF/F78yoANG0ZNHH7PID39wW6o3RCu12pEVvvTKBHLMDy5hOj5hQRTV+UNJoUkJCabFNPultZeRBbYmszGg9PvCDGyXxRNx7TzA+DZIp/EJ7oDM6lqOrypZXuZmbotEK8BQskCUdn9dozii4xaIjo3ndcj4cXlRbOajw4zxbm+a2/VahWXJH4xSTfKD7UhesOpst66ZyPinyn2QoR4MUW9gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af81d6d5-5d2b-3db8-634f-17392ef328f9@suse.com>
Date: Wed, 12 Oct 2022 15:14:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2][4.15] libxl/Arm: correct xc_shadow_control() invocation to
 fix build
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 9710a03f-4dd2-4274-49d7-08daac53a500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SPxxX5hLRnoBRF66vFnbx4QBR6HdfqnykmGMDSS/cWq7niFhL2SGtv8ra8v50Ffewk6hUwGpQZgqIZEK9P+Tcd85QF4qtKbUf36Z86r7CGslBlsDs7rvzfgW22u++nCI0UgnmlQF36iXiGq4ufkFsIBG1Cy8yxxeCssZCcozKajdu9j+jKXIFNHT/RyO5IrdC5sX13lTeU4yq0qvY2+ecCKjE/O7x7UNt3cTFfVsWdJmKRExfuqn1dIhLCcASbW25OaZTc3MttEWzQDNmWMYjI/ne8v/PFHXg3h/ER3TSSYtWmWVrljOtFriamvOTOLbji8sz98kDUdXAINtQKNWmHayrvljhSV2dxCcR/0EnG6AXhOMxgZiNyHVT71tMS/hryTkptsSjrIPDlb6XSPU1M0Aqg55OIjH24AnWmEPPbJPJFzeMOOOQMIxVnCs0zokR/hV2b97w4CdLXEHYdNgJUoVjnKviSyUCYygDFxop7MiROr/TmoUVKzFTSXeMLnQI3SeISOTuTJcEHwxTMYearCwQAKDmCeS9LWnVTKTe2ScdK2rhLtiTWdx0ymkaPhkTCm0CLsKWjxNA1fqX2Wa2zpaPEaPQXe1tI+NrystP4rKIKXYfRZG0rK0W5CAAIFRvmxytjYXtWvVL669JHfcdcv0Y8xlZwmtYd7GcUBRhEvDilUrwUdvKuwdp+tWaC3vRWE1WM8w5IqsnfgbxX+uy9oDiWlSUiijxAeRBWi+3NCSg10sSvnt9zOUKZsaMwewcnzL6ZJA33+GbTFvXIhmIVhgmZOxCJAnvYerabQD9YA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(376002)(396003)(346002)(136003)(366004)(451199015)(2906002)(316002)(8936002)(2616005)(6512007)(6916009)(54906003)(4326008)(8676002)(6506007)(86362001)(66476007)(66556008)(66946007)(36756003)(41300700001)(31696002)(4744005)(186003)(31686004)(5660300002)(6486002)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW5MWndIWE9ubTIzK0xNc3p1WWF5d3ZJL3loRzhiRWIvZnc0dFZIdnV2VUNZ?=
 =?utf-8?B?RGhGcGVoOEhCalp0MXNzVFlDUEFLSDB3c3F4djJGUkZZYTU3UGwzUytUb0JB?=
 =?utf-8?B?VFA1RUpGbUFtMmhXejk5N3N2NFJUNnlibk5UTURyUWtvYWlMYm4zcm5zMHVo?=
 =?utf-8?B?WmVuWXBFK2JQbm5zMHVhdVplYVB5Q1RkMzM5NGV6TkdjZGcxZjVlY1lDNUlI?=
 =?utf-8?B?VURIK1hrVW9SU1ptM1BjVy8zbHVoOWcrSjlkTmdpT2pSNXN5RGNEd1BUVEpK?=
 =?utf-8?B?cVpMMVVmRmZSUzFRd0g2ZnFNa2NuOGxJNWVySS85dzBPME9UeEM4Mk1Vdm1w?=
 =?utf-8?B?aDh2aDhPZnd4bE13UERnTE5SRFdqdWgyNHIzNTJBT0hTanBkN3hRUGRkcEZj?=
 =?utf-8?B?aFYvcFNxUUdnUFcyL0JVS2JQZU9hTW5uRVptY0ZVaUE4TG5yOHZWRVRWSW13?=
 =?utf-8?B?dzk4NVdDV1lONko5V254Tm12QjZDR2ducmxmVHIyZFlFVGg1T21ERTVVWFRT?=
 =?utf-8?B?bCtYUVJ4cUhob2pXZ0o3NU9BNFordDRiMUhuNnpEN0NsL0s2Q1dHanFNaU5r?=
 =?utf-8?B?M3g5QW1uK2cwZzBQQ2M1MGpyaXozMjdTcUgrOGM2cjlTZjNocG1zZDZ5L2lr?=
 =?utf-8?B?T1NUTUgwckNxZHFIT1ZNTjFPZTc0YTRFdEVldmo0eWJMbTh1dy9MbHdJcmp0?=
 =?utf-8?B?VEdQTWpGY3BmRDRFd29VQ21hVitFNWJEYmhiSE0weVl3Zm1rMTdjUXdGVzFt?=
 =?utf-8?B?N0hjWHZzSGdMSm9SRjVJei9NamJ4NS9SaW4zY1NERy9NeC91KzRUUGN2SWNp?=
 =?utf-8?B?SzNoZWhYNlZ3cjNPb1BTMXRoT2NYckY4NXZJdkJlY2hJOHloS2R0Qm5tbjFR?=
 =?utf-8?B?T1Nsa0hDclpPdDRrY0JKU3RCRE5QbmZya1QzUXp6OUIxQ0JCd24zOVhHM2Rq?=
 =?utf-8?B?TTVENTk2L0VrbmhreEJySDJPenQyTE9NL2h1dW5QenRubHptZ3hoSTVyWk5V?=
 =?utf-8?B?ZzkvSDR0MnRqcEd0TDhoRDg4eUlQbVpZcmhsM2RLVGpGS0Zxa1dhSHdLTGxN?=
 =?utf-8?B?blc3VWxGSHUzWGdIaXRDZ0sxMXhWa2tBSWhFV3RmNGZ0RkE1ZVUwdjM3TWd6?=
 =?utf-8?B?TkVQTU1QVVJ6N1dqRmdQTFJYVTFxNFZ2QU5rbTh5WHhKa3B3VzR1djh2Z2pk?=
 =?utf-8?B?TkxwVEM3amxCZGZRWWpPNjRMUURxMGdpVXJpcWlxcXJNc1hvci9iZzgvakRQ?=
 =?utf-8?B?Z1VubXZrZ0U5ZTZ3UHU2Z2pNcTErYmtsZ0NFUE5YY2VZQ0ZqbVRjMHkzbWxx?=
 =?utf-8?B?RHlhSVZlL0lLeHZIUU9hVEJmNEhQN3N3ODd1OUpDV2l5Z3dmdSt0emh1R1c3?=
 =?utf-8?B?S3NhU1o4aTN2UzVVS2pGRE4wSW02TnVxSy96WmVxblEzdkNlRVVITE1ROU05?=
 =?utf-8?B?ZHlkM0x6VS92UktGVkNIeUtHMjY5ZldkbHJ5a1BpSFYvbis0ZXFTWWExTSs2?=
 =?utf-8?B?cVNsR0VYY2pCUWV1a3VkY1dxNDNEL05MWUJJdUFBckZaenl5c1Q4UVVJOEZL?=
 =?utf-8?B?NGsvRjM0aWRlMEdPV3NLVUFNYWdDcjZsZjhiKzRIZTRXTlRPK3FKTlBUQ3lz?=
 =?utf-8?B?NW9FNVhzd0NHd1dyc0pTb3RYOXFIeXBUQTY3a0lVQWNoNCtMRnROSDl2eUcy?=
 =?utf-8?B?MVEzQ0ZxY0UwNnpHaG0yT05Zck42alhNZzgva2I5M3hKdTNxYW56Qytwd1p5?=
 =?utf-8?B?WWhGYmJPZ2gvSTJEdG1hNTdTa0VFUDdMUFliWmJiWGRSQjZsV2Q4ZFA2Z3Jw?=
 =?utf-8?B?NXhjQmVSb2lLWU44NThwS0pjN250RnRTaVBkSEh1SmdaRHNwek1SRnNQQ05r?=
 =?utf-8?B?cFdqdTExc1ZnSkplSERtWndEUnQ5RDlWZzc1LzFRNjFNN1dDK1IvdlNsaFQx?=
 =?utf-8?B?eWtjVWRCTEk4U2hRYkdkaUpZVUhTSllpcDNqKzJJZUhUWUFuUlhEWlBON1Y4?=
 =?utf-8?B?Sll3aThKVEFoWHZmK2VGU1FpaGxCVWZMSVlEVjBnbXBoK3R1ZDVmZExBNVIy?=
 =?utf-8?B?VmxEVzdlczB0aS9TdlZFRjdVMjNyMUNneXJaMWV3TmI2dWhnMUgwbGJJQ1cx?=
 =?utf-8?B?bTlTZTFWV056TG12bHU2WXRqV2hNRjNIV2dXVml4SVUwT1VobUtqZEFLRnVG?=
 =?utf-8?Q?q9PwPdt20A+dWnPsXdmvx0f8kkIrVu/i4HtD1c1RnleO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9710a03f-4dd2-4274-49d7-08daac53a500
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:14:07.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGeLUF2ZuxWJ03K44popxXnaC/Ca1IU9Dn59VGT/5ejSP4YgqI1qajhk+4LWVkkixlpTQ4MFdkufdL78xqLUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8456

The backport didn't adapt to the earlier function prototype taking more
(unused here) arguments.

Fixes: c5215044578e ("xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Also applicable to 4.14 and 4.13.
---
v2: Correct oversights.

--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -132,7 +132,7 @@ int libxl__arch_domain_create(libxl__gc *gc,
                               uint32_t domid)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb, 1024);
+    unsigned long shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb, 1024);
 
     int r = xc_shadow_control(ctx->xch, domid,
                               XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                              &shadow_mb, 0);
+                              NULL, 0, &shadow_mb, 0, NULL);
     if (r) {
         LOGED(ERROR, domid,
-              "Failed to set %u MiB shadow allocation", shadow_mb);
+              "Failed to set %lu MiB shadow allocation", shadow_mb);
         return ERROR_FAIL;
     }
 

