Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16A763417
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570294.892043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOby3-0003EH-RM; Wed, 26 Jul 2023 10:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570294.892043; Wed, 26 Jul 2023 10:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOby3-0003Bt-OL; Wed, 26 Jul 2023 10:42:07 +0000
Received: by outflank-mailman (input) for mailman id 570294;
 Wed, 26 Jul 2023 10:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOby3-0003Bn-AH
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:42:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe02::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ffbf0aa-2ba1-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 12:42:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 10:42:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:42:01 +0000
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
X-Inumbo-ID: 0ffbf0aa-2ba1-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv+G2PljGTRYju51bE7EcRxPuf//IjsHNgsg8O8BSZTjDo551f+5Ec2aGH8T/rviNRzHDxmiZxs+25vT4KqCCzRO+R8UuoWEmzALqAt8bHMZ45xrHPDQ9Isg3UvteILTLc1daEzjLPURx54pawVYtbLu0Dj8Bmb/V1qjb8M41rHaaboHJlhZF5jlwriJESRrc5xRyVM1XCsMpk8IcgAdzubiDLgVSQRTBpumaagqX6UQgh6lh2MnFW2kNukYFCOZJ13Sqcsl337/OLLE4svyR6kcstMCGBNtwb/vg6CMB98a2946yD+3H+dtVnKiDAnCLVrlZrMGlcEPeHw5rIqyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kslvcGE2F0R7sANvGqX9gghrY4Y889SAtYbuo1YxJQ=;
 b=DwJMlnQvQu4KGtUPUOV/nkPAY1BEbfmTRs8c5wvGvNLkBW7lIPwu1KqWas2ZbJBTiYKyGgcRZ0qP3SRh/amd/T1vAhOFqaQBo8qUp3NySkNWqHHABeg4l8iRhRZ6CSdM1kFxUVhlYbSoWVF86Ri0bQOrpy6ehlKWR57Jr0VJKkm7TdvyyyVRg4yVdaeJyHT/7R+E2xfic8YGj9klSi1b6nPgeD+SYhqEaurEZ+OSBFdlLMnfsE1YK8b8gIYxkMKpx/MNPvaE3LPpT19uZYY6lX5J1HAvFphiVUL1X5wFpAwfDnKSEwI/dVqhAVJ2cSEH9o9G8s+f4PlTlzhdJzh7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kslvcGE2F0R7sANvGqX9gghrY4Y889SAtYbuo1YxJQ=;
 b=Z+JO0rwmtN9Y1UkzpQ31BufTHMlSdQ15huFNSpooC9AR5/+ZKRGWPAau6YOWHBnW+HV60hb96Z8QdvKrhbiLY6IyRK3qp86vLecQ2HarBF0s/fyx9akgRV00bV1mPGIOC3uMYIB4vVtE7kBEz/aUCaHbsJ/luAsjy4R2GQuGqQ9PThgw4dkY2PQNCpKaX8Gp385DYD8QqdVJYUq2ivJ7DhNi9voGu2tC49QRqWf7NhABYSfote3hUiKJq9lZtcOJEopSfrUELsntOQ8RKoHfnmqmNL94AxBN83/FqPjIF6zu2Kou6Np7OkgYtnP/QlhWcs0BDkkpK4zMxfrv1SsJ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>
Date: Wed, 26 Jul 2023 12:42:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxenstat/Linux: pass nul-terminated string to strpbrk()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b95216e-b304-4888-1b60-08db8dc4f212
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tNaTQaIfcadOFLMtlQflc67fbR1Zu3gpS3XFthz9Vad2lGXB8BSkm5bqf8OOa92TmDt4jGg8jRLgTu4PFS17kkXqpUrae2rCPZed/JU/JSW9JD3gXuZPugaKD2ZbuiWZs+h8vxnS5Y1FKU7Tpk14KxyGPeeaXQvCR9mPzP4XwxFAIEyhyC58JbBOj1Tmtp+NFyQZYraSMaYJQPfTADLqv1thcL2HwhIM4ku6rTuc6f2MIpN3tZOoU6BpspN4C061qtixMvmCigYlxSqvxYaA/nMsPXOXE+KKyK+02qKBUbV0pfUotfCIpzWhVfVD4DuM/F60l54xK76/BUQS+qaRlE2iw7191iXvML9enX2AlJv/5H46cADQ4I54Bbk4kt3IX/QtLOH/SInQgwOGN3pLHenqcclk4O7GTgPUGSTEtk1Js3X7uQEmAc+/qO2etyu96mOiZPZ1e5Ke82D+t1+YeaKHK13t47dH1tJlQp+jF+k3VLLcZYBw+lE95rPclEOp0s4iMJQSGN58KM3Q0Yg2zB1PnPTW+pLN+GqLru1jJ58tnVyZ0O/xmtYw6Fatx/CYgRe1bJrErfdXGI61pPAQWS7N3pWucMDmP460pL7vhgKOvRy3Unows+5aE6Zf9YFUU8K6aaeGAPb7N2C4LZhKTDQv+aM0amUl4Jqp9jIGmAbQyvcQUteTCni21JiCIK5T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(54906003)(478600001)(6486002)(38100700002)(6512007)(41300700001)(5660300002)(8676002)(2616005)(66556008)(6916009)(66476007)(316002)(4326008)(66946007)(8936002)(186003)(107886003)(6506007)(26005)(86362001)(31696002)(2906002)(36756003)(31686004)(66899021)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhyR3VxT3BsN3MrbWFCbzFUa3dRZU1PM2h6cXFyUXVrbnZOTkw5dS9PU2Fx?=
 =?utf-8?B?K3Mxbjk0VWplOFg5NlpueTh6bGlNdUl2bms1ako0TG0wYzU5UWp5Yk8yRWZq?=
 =?utf-8?B?QzdLL1ZxU0lZUjI3N2V6cm1NdEZ4TjEvbWVGRzhzMjgzeGZNSUNUaWNPTTB0?=
 =?utf-8?B?cGpyR0tDSWlxU2w4QW9qWmlxUFBIRGdSclZIRk0wUkExQzN3MEJuaDlyVmlq?=
 =?utf-8?B?a0hKL0ZOVVJRTjdaZDFFVThONkdiSmtwUCtTU1FhR3I2K0o5czgwWXArZEI3?=
 =?utf-8?B?Y1l5d0ROSmx3M3U3Y2N4UTBoMXlyVkVUSjEzd1VhMUVpdDZQK0tGQnBicEFz?=
 =?utf-8?B?UHNCN0QyV05HTWZtNFN0OGw4ZVlEUHYzR2orVU5MUlozQTBzNUsxdmV5dlQ2?=
 =?utf-8?B?Zi92V20xLzhqL21zcTVtQzBFd2VQMmRad2ZjMXR5dmVEdnhpT2M3WEptUGcw?=
 =?utf-8?B?MW9PSzZXd0NlbENNVHdkRlVwTUVxTkY0MmRQM1h3c2o5UXMyenhjVkNWKy9G?=
 =?utf-8?B?WFltTC93NzU4dTl3MDlZZzcxazI5OGJlZEs4Wi9HQXZYeVB2SUtmK3ZEWkQw?=
 =?utf-8?B?U0NLeGoxazNJR1lJZ2YwN3JpTWIzdHRyN3NKNXZaUUhkSzNWR2dzbURhZ2Fz?=
 =?utf-8?B?REhsbm5velUzUXY1Q1ZZTzZkbDZNZWlSU3U0M1JCSURDeEw0RzgwTnNpS1J5?=
 =?utf-8?B?SEZ5bVRMODhZTUhPcGNlSUFRb1lYdlJ6cVVQTndwNFhlV3FKV2RMM0I2NlMz?=
 =?utf-8?B?WndwS3Q3cTFoNVRJWC9WTTc4d0ZvWUtuejVBS0VHTS9lY3RoQThjdFhqYjRw?=
 =?utf-8?B?QVYzd2FBaThRZ0IxdGRlNzlqdEJuTmlWS3lqNVFxZEd1ZmlhR3d5cTk4dWg3?=
 =?utf-8?B?WkF2S0tDclZhWWc5alNXNVl6VEdLNkxUQWpINXpLMFFlVFBMVHcvbmJiMGEy?=
 =?utf-8?B?SHJyRU5aY3I4aVZpRDVPdEhZbm96eDBkK1RSR3M3TG16SmUvd3ZFbkl0dVNL?=
 =?utf-8?B?TXRnSkplYWZTVURiVUNSRE16VUx2b3FuaS92Wm1YNmJoeDI3MlBtV2Y3dXk5?=
 =?utf-8?B?L0lqWGplOTU0UFA4SmpZS05nQXcrN1Rxd0ZYamd6TzBBOXJjOEQwa3dHQUJT?=
 =?utf-8?B?Q293VzdQZ2hYaGtyMnBGQ3hIZzBXTlJxMjNFelNBNzIvZzl5T0xWclRsVFo0?=
 =?utf-8?B?WmloL0dNc2dtNk9TREoyVGRsNkZFYWN4L01nZUxaTmJJNitxbTBtakJVZy9h?=
 =?utf-8?B?cnZDQXoybU1sVHNWbzFmVkFseTNnUTlFdzVwTmJpTDFUY1JpL0l0NURLUTNu?=
 =?utf-8?B?bkhMa1RtRWx2QmxqS1hHc3YzVldsVzYrZFZ4a3hHQWM2K2Mzbi9vdVNLcGdC?=
 =?utf-8?B?QWlQaXh2bWQ0UjE2SXBEbWhCRHR3N0RZNUNJR2NXUVRPUjRGVHdrZ1JKc1N5?=
 =?utf-8?B?VThpcTVuTTdDbnJ5ZzZOWHI4d1BNMGNHUFQ5V0lTR2FiWVRLZXkvMDd0R3cw?=
 =?utf-8?B?QWN5WFRQRUM2MUJ0WGJyQkVxSnYyK0ROc1hXK3IralErS1FBcHYyTkhVQ3pw?=
 =?utf-8?B?OG1nUzdXZmU4VVhvNkwvTnNmNmNRUjRZc0tHY2ZDZG00dVVjOWVLckhzVjA5?=
 =?utf-8?B?RS9JNFlyQWZzM1ZoY0FpbHEvM1M1QjlqN25yN0ZrTUVRMEEvZ00yaVNScFJY?=
 =?utf-8?B?NXhDR3grREZyaWpINmdtYmZxV2hYQVpNTEw5NUpFRzBFSy9oR2lMQXpiVEhE?=
 =?utf-8?B?NFVRZ0VmV1lXdEFNZmd0SW5lNUF4dUxib1ljM0dabmg0RDA3TjN6ZEVHc3p4?=
 =?utf-8?B?UlRQV0RCUml2elNIZFBWVUE3Vnc0WDRKV1JycTlNUnBERTJyVHRCNm9RdXNu?=
 =?utf-8?B?dmI1ZGRDaW83SnBLYWc0TXdvNVpnZEFPUHpaUU9JTE84d3paOGJIS0gzZ3RU?=
 =?utf-8?B?Smt2cDhHWTlQdnBIZXVQUmNFajJmdjRERDE3SUZ6d2dFTS81bUpMZ2RKanZw?=
 =?utf-8?B?a1BkUDRBSHB2WHFpUXE5OWxENzROSFlGUVVWY3krS0wxYjFCVmNTOHZhQm9X?=
 =?utf-8?B?dkh5SnB5eUFJdFlWV2JtU2JvN0FTMllFSGNvYVF2OXZ5TEdBaENJNklrN0sz?=
 =?utf-8?Q?nhwmZTKs6+WWYv02WsdVAdjU/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b95216e-b304-4888-1b60-08db8dc4f212
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:42:01.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSTFN+3vbdQh5kSn4b0sX5ZiJ9bEibJQlX6DTC318qhBYG+KqSDQolKntGjHqdKHOb+3XNdBvwZSf0f0rfEbLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6828

While what "tmp" points to has been cleared at the end of the first
iteration of parseNetDevLine()'s main loop, this is too late for the
first iteration's invocation of strpbrk() (copying the interface name).
Properly nul-terminate the string at population time instead, removing
the late clearing.

While there also eliminate a confusing (because of being wrong) comment:
A regex parsing error would be handled one further scope outwards. Here
we're dealing with field 1 vs any of the later fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course the function leaves much to be desired.

We had a report of a problem which may have been because of the issue
addressed here. Sadly the reporter hasn't come back with any results, so
I have to submit this largely "blindly".

--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -169,6 +169,7 @@ static int parseNetDevLine(char *line, c
 							matches[i].rm_so + 1) * sizeof(char));
 				for (x = matches[i].rm_so; x < matches[i].rm_eo; x++)
 					tmp[x - matches[i].rm_so] = line[x];
+				tmp[x - matches[i].rm_so] = 0;
 
 				/* We populate all the fields from /proc/net/dev line */
 				if (i > 1) {
@@ -225,15 +226,11 @@ static int parseNetDevLine(char *line, c
 							break;
 					}
 				}
-				else
-				/* There were errors when parsing this directly in RE. strpbrk() helps */
-				if (iface != NULL) {
+				else if (iface != NULL) {
 					char *tmp2 = strpbrk(tmp, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
 					if (tmp2 != NULL)
 						strcpy(iface, tmp2);
 				}
-
-				memset(tmp, 0, matches[i].rm_eo - matches[i].rm_so);
 			}
 		}
 	}

