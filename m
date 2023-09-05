Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF70792142
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595483.929060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRwg-00070p-SD; Tue, 05 Sep 2023 09:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595483.929060; Tue, 05 Sep 2023 09:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRwg-0006zF-OX; Tue, 05 Sep 2023 09:02:02 +0000
Received: by outflank-mailman (input) for mailman id 595483;
 Tue, 05 Sep 2023 09:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdRwf-0006y5-4O
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:02:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dec9b868-4bca-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 11:01:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8675.eurprd04.prod.outlook.com (2603:10a6:20b:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 09:01:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:01:56 +0000
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
X-Inumbo-ID: dec9b868-4bca-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/DvZ9Ff6MgIHaEYIQD6S55FXNEmefzgiOZKlg0+/8jhW1BK+ItR67oXP/9A5QJNtATL4Ivtl6FKEcTYkwzaqZmed8HQuo3Hhwig896/8xhJHPcgaCgWpbyuioE3BF+4NX3C8AJQprhPEQW/5QyorVkGTbh0nDst/WBeSLfpgQZXeebMNwDyZK/2gLQbDa8H+il9cgEW2LKAXYODYz1A/k3meLtHcrHbi+pSWk8lexvumxeR4GiCADXZxkvwtGQnhoqQEVvjxTQqc9Qxhivhclhzhvs4YoX3LPrPkBY51M/UsqpFbhZfVvY4qpsfAZPWhnCMD2CNzgDfJd+cGjVFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg5KCu1n8KLFrYWgLwAidW+Hx8AYR9obGKSxceilEMU=;
 b=SRpwakU61TJX/jKk8oktQUEsHc1Ofns39Bh5KRzZY5P98dOKi8yQIbRS6DyxHcJginMnxL7r5G5TBFnQ57CgrDiWd8999bD1YT8k34uzIMrkOywCpHPbfjbCMC3aRgsj3ymkdK1wdv7ChQHV3PtNSTykKxr0+3KA3fy4Vk4pG1gFRF97V5jSLJBUuiEZEn3vr3l6XX6NZSm6PmeiaXgkde3NwbDiI9Ow0KPyXARL7IjlMccjtiCeSep55wqHpRfrnb4aldGxuGS1Nfzuk6Lhrezha3JNZ/SKHJ/39smvoRYtF/3rUuKNZWVU7l42fGwzeNrp4LF6K8yOHEjRgXg9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg5KCu1n8KLFrYWgLwAidW+Hx8AYR9obGKSxceilEMU=;
 b=zn7xz/hIbF57iOEDB4wdcdxnrGj4Ze4OVM7i8uMYKrTe37LyRhwh5iPyM5vQ0SArvDC4A175k0i/rsx6aFpbBVAYmi3/mwkzyBx0woVWlFx1Ez2uKKkjHE9vawbd0JNcN5k1jsvSnn2XgaTqRdKN7v82mIBYgpq4X+dfohG3UxVAl4fzOh0RvDye4TYlxWIPah8O3m/BZyFLu/4Jo9J3Myzhoqnu0d4WE9ISQrXnHzC95LxGP3GZjd6+E9X/SY8ufg64UZy2CGVSr6sc7Km6G1HsrGRlB2ZDeN9Wy4NQwton1DolfoargCmsmQf/dSQEVmeCAlYiYbMiTcUEjsIZSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2e73d5e-209c-235c-9fad-7d541aa38382@suse.com>
Date: Tue, 5 Sep 2023 11:01:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: don't use access_ok() in set_debugreg()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b619ba4-2d44-4e0f-b5f0-08dbadeec152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mgNJyMFnRwBtRs/wZjHO0Z/mfZFY2KuJzPbnvSjywTHgrnjUVlSp2gLLnpUJTGn0WNhZxo4Bhs+JzUZ81/WW1VPI5Q1N20UHaCUiMpCWZID5JE/9bCjUBuZF4X3Pk3Irk7phuFbKMhvzZ2+v3K1r2OojdCg4kPGrU49ump1xKlvzfQy9AC3D2GasIGkgyxlKbcEIEW7xSiagl4qIrQXLo4I2tJfcxGy3+4PIkspDE7p6LHcUUrvPr0HW9kEO7lA9CHI/PfjccNOog+ERdpRaFD2BZq5nqnYz6djIE1R2QyWWklmNPhl6bpmUvX2idFxGSDvMb6QZZavnoWNC2aqnNv5T/+mgn9SHNSRFCSxTqKUl2g6pW+xPdqQhEWvrrkkhX+85RkbQHpXrQIquCSniXQt944y+3JjKL96/F7dvoXzuqxe8IKMkNVmDsOAnJ2uBFpymWny5qyy+Nuld3xrA6xPw2sa7Z9UVGMsWkDB7b9rosJIQ1wzAC9XicfqX5szlPMv+RmStEa4Bfj9f1fdYU1xwJDYQ1hG2lU6nd7pEMozGXKb4KbOtjK1jchowFD81nRsOcqoLN+iTSAA/1NVyaJWaSoSakO9G0nGSoD7y8UWxKHhiWYZZHtmwrvOm60ulqP+PYG5VCveSd3xlE8hc0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(1800799009)(451199024)(186009)(31686004)(5660300002)(8936002)(316002)(6916009)(66556008)(66476007)(54906003)(36756003)(2906002)(66946007)(8676002)(4326008)(66899024)(41300700001)(6486002)(6506007)(26005)(6512007)(38100700002)(478600001)(6666004)(2616005)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWpoaGd2YmJlWHRJdXlwWTNLTDNFMzF3UDdIby9YalJjd3N2eEYwbVg5SGRC?=
 =?utf-8?B?bjI5UWpZcFcyNHU4SWtYa0VzQW90RlFJQUNWMXhrVUJueWVkTUpIMDdzV245?=
 =?utf-8?B?N3hGVk5jWW9iemR6LzZJTUhhZ0xtTDB6SkN5NzVuWGNKT2p3dzhHa2xrTFdP?=
 =?utf-8?B?TzFrV3V6L3dwQ3Fjb2FEWmZQZ1E0bjdRWmVGSm5zcGN4TFk5TTk4WW5BMkc3?=
 =?utf-8?B?RGtITHY2NkhwaXlmcGEzYmVmelVFdzJ6L3ZJQUgzaktyMWQzaWZCSXJCWTE1?=
 =?utf-8?B?SElkTEJ3dUx1eGdoYW1zNDd5SzN0QnlEWFRmbExkR2IrUFdSQU9UdHNWYmp6?=
 =?utf-8?B?WFlJaXZETnJjV1dGUVlPSUs2cEh0OVRncVYrcHo0ZHZQSDZPQ3pkQkZIWXhN?=
 =?utf-8?B?RS9VRXpyMGtVQUVuYW4xOXppL1Nxa05PSnY5MTFsUGVyaVRKTWYvTi81QW9j?=
 =?utf-8?B?ajJTaTYweGpNMWd6RHgyenZXYU5GYmtrbExIVUFNZDJ0M1hpS0RnTUNneUZ6?=
 =?utf-8?B?bGlZOGhxdXM2UXRBUmNxNnNUdm5PYkRXK1lxU0hVYU52UUtQclFKMEJqUDVw?=
 =?utf-8?B?azhnR3NJVlQyemdheVhiMkFFZ2xNWEYxdWNtOHY4bWNrNURjR1hPMGY0UlJz?=
 =?utf-8?B?UUtYWEJDcm4zTE04QmI4WGd2eEVORTh3RTlCZlZhNGtRM1hmWWxlU1FMbkdw?=
 =?utf-8?B?cDdWaklUa2JRd1BRWEY0dDVKSDdoOTkvZjFaMkhjdWRkcnlYUHBsWVkzdTAz?=
 =?utf-8?B?VS9nQ1RoNDJKMnBCZTFPZ1hLR3pXanpRQXpleU4yRTFGVGk1Q0lQcHFldEZt?=
 =?utf-8?B?WnBrL1BLaCthTk9jY3lQc2hVa1RpNFdadFpEbmpqVkhRL1hOZzAzcExZT1M0?=
 =?utf-8?B?SExGdWk0V1BQNHFxNXprdWJLcm50RElCVW1mQkVmMW9tUExYZld0cFJ1WFk0?=
 =?utf-8?B?dnMzVkpQSnRaMTFuUFJvd1dGNC8yM3pXcVd3NVVxNmE4UCtJdHBiY3hFTDBv?=
 =?utf-8?B?cGk2eDBDTlJxT0YzZVk5V2c5S0xQeFBxbkRpUDNtRm1nY0xhMEhOclJjTktx?=
 =?utf-8?B?WUViOUNIMisycW9SQ0cvdHhQN0Z5VnZBUU0wa2w1RjEzdjR2Ym9TVitsZGxs?=
 =?utf-8?B?UGZqT1Nrd2d2NkNYZEtHelFlUDVPQUtSeTQzM0xkeUE5ZlZqbU9aZHEzUU44?=
 =?utf-8?B?VVl5dTFmVWEwZUpFblVZRWdKc0ZTakcrTjluMTlhZmlESnNiRzBuL1BpNlFr?=
 =?utf-8?B?S0JMTGN3TmJVVGM2TXRqOVdPR2xQcDJadHpqZGF0dC9NdUJMQWlTRlVLRU9l?=
 =?utf-8?B?RWlxWEpMdTc1SUpQdktCWDhnSmFFM0xWZXVTTEFGL3B6ZUx2YzR5NEZ2NXZq?=
 =?utf-8?B?UjE2eTJwSmZIcytLUGcxS0NWaTg3ZVFURmlBOS9wN2N5eUxkS3dIeGQ4Tkdh?=
 =?utf-8?B?eXJac09CaENYWWN4WGlsNGZRdTd4ckxYQjJaWDJRUVhFdEhEdzRHY2xURXFC?=
 =?utf-8?B?d3g3a0ZrYW1OcGFHa3pFL1JsVnBvMWlwQTlPREFOMjZCV2VndW5ycExsMW5r?=
 =?utf-8?B?SjVCNGN5ZFIvU1NwaS9ISy9JQ0xPOGFibXNtN00wRnJmenVmbjJUMFFIM2NF?=
 =?utf-8?B?c3RGeFpoN3JrUDZ0NlYvRHJ4czJndWNKblFFRDcwL3Zydy9PTHdjVlJwb25Q?=
 =?utf-8?B?eUNmOEljcVNMaGgrdjJBeVdmV2ZrQkszQkxEeTRmN2xIeFNNL3RQU3VUVStj?=
 =?utf-8?B?UmpxWkpwdzgwejJhL2tUang2eVF5WHR0SlduVzJlSDRiUlVDQWUzWC95OG1E?=
 =?utf-8?B?UGQwMEdxcWswSy9aZCtrRjYybkozN09KZWZGYlp6VUVlQ2FTVWpraUllREVY?=
 =?utf-8?B?eGl0OHZKVXpCZ1N3VmE0TWxTNmFzR2hEUzY4bXpBRTVqV080UmYzeTZTanI0?=
 =?utf-8?B?NEVMK1AyYVRSeURmcjE4ODdnMWhsU1ZIbWxiRFVCOVQ4Q1NvTmFWVGNGbEN3?=
 =?utf-8?B?dTBTa1FuNU10cS9hVWgxV2F6amlWSkZUc1gxckZhQWdiN3dlSUFpQzE5aFpj?=
 =?utf-8?B?YU4ybDF1VVRlYVJqUFhwUzFoTnpSa2FwWXBDbEVxTmVHTlRwT1Y4cEp2S2RN?=
 =?utf-8?Q?hAWOr9896PLpeuJTSTgbE2yST?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b619ba4-2d44-4e0f-b5f0-08dbadeec152
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 09:01:56.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF19MxBjJ6BR/9XxlT+xOxJuc/VrBI+10ajHKrE4agrVoWc7LN9GyDquTcc2VVAKz2WUzxEFWRft7sBnW54Lpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8675

access_ok() is not be applicable here; we really only want a linear
address check for breakpoint addresses, as putting those in debug
register isn't going to result in actual memory accesses. Furthermore
access_ok() assumes to be acting on current, which isn't the case here
when called from arch_set_info_guest().

Note that access_ok() was too lax anyway for 32-bit domains.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The questionable use of sizeof(long) is left in place for the moment,
as it's not clear how to best deal with the upper bound of breakpoint
covered ranges: We'd like those to not cover Xen space.

--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -60,7 +60,10 @@ long set_debugreg(struct vcpu *v, unsign
     switch ( reg )
     {
     case 0 ... 3:
-        if ( !access_ok(value, sizeof(long)) )
+        if ( is_pv_32bit_vcpu(v)
+             ? value + sizeof(long) > HYPERVISOR_COMPAT_VIRT_START(v->domain)
+             : value + sizeof(long) > (1UL << (VADDR_BITS - 1)) &&
+               value < HYPERVISOR_VIRT_END )
             return -EPERM;
 
         v->arch.dr[reg] = value;

