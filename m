Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EB571BFB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 16:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365735.596047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGYo-0004xY-EW; Tue, 12 Jul 2022 14:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365735.596047; Tue, 12 Jul 2022 14:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGYo-0004uv-Az; Tue, 12 Jul 2022 14:08:22 +0000
Received: by outflank-mailman (input) for mailman id 365735;
 Tue, 12 Jul 2022 14:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBGYm-0004up-DH
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 14:08:20 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20051.outbound.protection.outlook.com [40.107.2.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b7cbef-01ec-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 16:08:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2565.eurprd04.prod.outlook.com (2603:10a6:4:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:08:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 14:08:14 +0000
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
X-Inumbo-ID: 11b7cbef-01ec-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vs82eWsh1zv1WvGq+ozhg8iqLxuv3u/CgtN/VGY87qTPzI+cxdbZVdA8WZDWgCkLFWH6uLiJZozssjO+RBWo3Iq0QKRh6CKaGJAe8ZsC/DyORSoIQBHboe8xp3m3eOKFDPvNvnD1sQJ4sUrGDDWXgL9+AKGIVOmZxknG8i06+ls35J/M6LM+/QUj10MnI0KF1lTqs5frsF3mq6TuYxbDpQD8nFMUX3zsT+erNhBR8vwmaaDBlwMWxHT7IEEwG0ktTAxIPHdjj5WrOo9IPM6/4uV90Ku51LceutHniK8w1FmGfs27n2QjTwwgujeoLM7+kJA77twWMtvuuRnr+hSpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRbyhNYHEVlPFuK/oWbifwn8qoUX0JXA1pqeJcMgsQ4=;
 b=d1OLKd9rxDmPoHqTYXD6+cdapJ+p4NWeKZ8gYJiTQyt1zUiwIp1BztS57aNnApEikRQn08saYo8y+P0yh0UZzya9vqVneIK+Z3aZ2XSTzQ4PmitqmHlpvJCtLTG3R3K64XIwVAqbS/BTwq7P8XymNuUbF2+iZ3yxTXGQRe5haUg5Uwvd3DxElQz3mQ+GjaLUDLoFzc8ZNopolpbAPTnkKCORC/AennKwNYfP1cxFtzAUgOu4Bm6xpv/cab3PU1/AyD8vZtmbMyByoXWdbtUS8aV8qNqlbWW6OIT93jf4yhpJJ/DzFvnRIPwM0B1VP2prRnIEX4e/IqEPyu+YOF1CDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRbyhNYHEVlPFuK/oWbifwn8qoUX0JXA1pqeJcMgsQ4=;
 b=SHXNW+nmrZl1CUdArr0kVkOkZKKvWtiT1ak1Q1q96q/h/Ab/K6kxvKtbUjdNtshxN3dnpQhoOrrFtpL2HRvaeUneP+0+D3zw7Y+I6PHZDwxklTyTjRO6nX4Y0EV8nSX1kdBxdNPPwecavIE82vn7fNxOG/7RGvFvyWPMMp6NySPzsIOL98UDO1gK7BYZ+VUroOVLyFAa2KhF5bIyulf8JiyfGwFUBhambi3Uv+LsmcAHr5lQvp0CdLIqHNOfdefQQ7Y/rZANzCiPvI6E/VlJwZRKfihY190NL4JOdUjGwgGDTabmwnubf81wmDPlxQIJxKTUrH0bEZCQ2LrNixOXBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7291aee-f365-dba3-cee3-49762969ffa7@suse.com>
Date: Tue, 12 Jul 2022 16:08:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xl: move freemem()'s "credit expired" loop exit
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5480c1fb-c3d2-48d5-f4ec-08da640ff617
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2565:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QRNjzUaQlM8yS9k6f3u0qCgHzIeNRuNr0WuMooB9PJDfv/Zp4SATaFIOwINYxs2aLhxD28SmyD/bd8JgRmTwW7DI7wv9Y3MB0DMN2Xnz3YpSbqkHPlKjQjJyRJQRbGWVMdI7TFDg4ai0jLP8LjdVRf/CONsPZ1mL1UMRLVLT2GzVyQiLLakwVwljGHwB3uISmNMH0UJ2xiMBb27LfH/XDjoCfan8w5mVpuPsrG4tIkdDkefBfx9NEH5a+vjN84bsgYVw5juLiO4rIdUdPK01ch0f7KcIhKc/lhm6LqYwvWswIlhVRsUeBrHSnFS6RRUdZ/W64lEklaoGXj/avuKnrfRp1AmdUQP3O8WSU8gEmhsDSMUlQ3eN21byX6c5hHThS+Ox0F4GNU8RUUuElZX7jNBMmv8PlG5YiEQFwGWbO73zWISLdhvoGsUfYCsytynZ9VMmlxgm+GmtMIB8HtRlsKWMGNQHxFGrEt6IcxKqKnyKHNdcceLKNaRINIbfz/JBdsQQmgwXcxNV/Ybl/RDmzl9Bb38sblgkaZjUiXqVwCH9WktbAUqsnbnYXXu24Lmo9FzIloDU2wFfwIEtHmnTriEEompFkumgw8A/mKwxSqlgq9W2tR6WGWf8lb4fDaF5YtFvosahLyZuf6laqIrbQiyF3XEPYFSl0v5SbJG0+0bJpdR1Py6ppTxkW5xD27dG9dkZHsg4epZQddEadR+ERMj9F1kJvGlrEwbUgI0MP6uE87QvIrA0KtZl/oxTODOukO3lDUJcgHiXZ3nvZcuItAbBTlXnsD2Hsr1Jiz+lG19Tj9FLpWoEal3Nf6r1bxsfkQh0C/0duVN5gRC/O6g47DoAT+UtkeAmgE5U40Y0sm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(366004)(346002)(376002)(6916009)(66476007)(38100700002)(36756003)(8676002)(6486002)(478600001)(66946007)(6506007)(31686004)(6512007)(41300700001)(26005)(86362001)(4326008)(316002)(66556008)(2616005)(186003)(54906003)(31696002)(8936002)(5660300002)(2906002)(83380400001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXBTNDEySjY1MVEwL0tLcXFFbXBkTzNGR0hXdHhEeG90a0hhdXhOVjZSMG14?=
 =?utf-8?B?K2hjYnBYWTFrM28zYTFCc1VCc0FPOXJPU1FEUCtmbVdRVUkzU3RzWXRjUk03?=
 =?utf-8?B?ZTQzbzdRRUNZMnk2a0crNC93SjJtK1hIVkxaNkhaeC9nWk8wMHFpL2RvK3pZ?=
 =?utf-8?B?d3lPVmxyMm1PRElTR0U5aVZ2NjlmaktoYjg2TXlXKzFNY3kwRDl4a0JOVmk5?=
 =?utf-8?B?R05JVlhPWFhaclBNd0d3V0ErRGU4bVdONDFYb2JHai91eExIUUhvM3o0eWJo?=
 =?utf-8?B?UGtMa0FjSGFzdDhibE45cmVUNXk2YzZSajMxd05BdG5RelB0QlZwbFZiVU44?=
 =?utf-8?B?RTlGM1U3NGhvdjBjdytMY1FQdjhQMnpnZ1VCUFAvWkdyL1NhNFk4eitqeHE5?=
 =?utf-8?B?QXlkb01xRzQ4S25VVkREYm43WlFVVWNCNE9rT3ptc0tqRW56dkU2VTFRQzY0?=
 =?utf-8?B?WUk3TXAxUTl0SHdPdFJrWHhkUlhTWmtaTFhXM0p1Mnc0d1pza0tkTlJUQzJk?=
 =?utf-8?B?azNVSmFma0ViM3JTMGlQTEZpR09CeURMWWlsSGgvZkM5VzJyL1N1SFE4SUFa?=
 =?utf-8?B?dzlKYktYSDJmdERQbUR0Ni9ibW03STVkWGJPdG5WK1VhRHZYb1kyeUJJSnBK?=
 =?utf-8?B?RnhyZlArR0N0WkhuNHhidlFZYWUwRzJ0cVdVaVFKUnNUdXVUQk5FTlgzQzQ3?=
 =?utf-8?B?eGk2YzJrMGUrQ1hveE9OQWtUMXhIc29HV0JiVGMyQXpWWGprUHA3V3dCOFh6?=
 =?utf-8?B?bUtpc1BxaVlMUVlaaHVkSjdZaDJvZWtta1NIU1FKTnZpK2xZOVdiNXhrVklO?=
 =?utf-8?B?Yi9ablpuL2FqRHRDNUpiMFkvTmJ4Z1ZveHo5WWNINy91WEhWai8xc0pNZjlR?=
 =?utf-8?B?Wk1CMzlqUWpjZVdZeHE0cW5NM1JJSjkrcWZLUlZRa3lBb0Y3dldhUTFudG1F?=
 =?utf-8?B?aXloQUZqTmJPaVJMYWRhZHNrbGVaQ2k2eVNvOVlQTnJ4Rks0b3ZLcCtETlZM?=
 =?utf-8?B?ekRIZGRNQklhWjdDQndKbHZFZWw4MTJMSCs1QVZkb3F3cXNHMDQ2SXZQR1hv?=
 =?utf-8?B?NU9CUG1rRTBRZUpZanJ3d0VDdkw0YTVEKzI1UzhxZysyaWpwTkJRRlI4dkZn?=
 =?utf-8?B?RU9CWitDdWszSWNQU0xvMUluSVE1Y1M2V3lSaHdRWExWTFd1ZW9mbnlJTVJZ?=
 =?utf-8?B?SW9ZNDRTMURxamE1TDhaRW1TWmhYSDJSTWFod01nRXUwTllsTEZxQXF2Y3F0?=
 =?utf-8?B?ZTdIMW4wb3F2NEw1a3dEUHNIaE5IeWtJYjFyTVpBOTk0OW50L0FVcHRNcVY1?=
 =?utf-8?B?UzhPSFJqL1Q4emZqWUR0UWxKWnE4aTRVQzYvcDdGd0ZNaGU1a0ordkhwNllt?=
 =?utf-8?B?WWplaWQ4NVdmdWU1YVB4WnVBbHpuYzNtM3Jla0hmalkxZEw0Y2dqdVJtODYz?=
 =?utf-8?B?bVJoNURqZE40SHdpOFFxdG12VFVPWVU1SjIrdVBGV3c4b1YycFc3OWM2UzVn?=
 =?utf-8?B?dFV0dXdJbzB4K0ZwcElhRk1NZUhhWTUwQlBrcmhaWVR2dE4xbE1rK0NXb2pl?=
 =?utf-8?B?VU5wcVJLaHQ3YVVIcG94TXdPZXlvSmJzRXdPNWdhZ3BQZFBrUVdBZVRrZXAx?=
 =?utf-8?B?WFdPR056VFJoRjBLZE9zSTUxYWg1TTFUR2loMG1xMFVQS0xVajFkTW4wVms3?=
 =?utf-8?B?YUxYN1lwU1pTQVBwVlFnTG80NVJzeUFOZ2djeEdIV3pRbVdIeTBhUk1PY2Y4?=
 =?utf-8?B?bUs3WW5jOFJ5MDB0OHg0eCtTRWtQUXlXYmJlUUVPZmJWU2ZUbFBxRFBNRC9C?=
 =?utf-8?B?L2hpT045dmVPQUZxblRoVUtTRUZZTDFJQU9yWGRpMk5WTW5IWGpSdENlZ2M0?=
 =?utf-8?B?a21xZzFEejJhMDNhejJFcGc3OFRpRkU3VEdSTTR6VmhwTUl4VGVWZ040SXhJ?=
 =?utf-8?B?NWM3aHdVYWNvZ3Zrem1MejIwa1dreXZlM2FuUjZpOGxJV3hkcXdweDlSWWdP?=
 =?utf-8?B?dzlZdFpIeFhJbS92QitwOXk5VWhiR0ZnTmhrTm00dFNKcU4zQ2JXa3UzZTho?=
 =?utf-8?B?Y0YyZzRXTWJKUDhremFzdFRHU1lyY2IvenhuakFHT2FmMzNGQmNobGE5bUtQ?=
 =?utf-8?Q?NGpoiSc8c5oYhmAIPrFAbOOpR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5480c1fb-c3d2-48d5-f4ec-08da640ff617
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:08:14.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jgGI1/AlS/VXQcDa9kLGFUuMM+FinvOGJVzzvR9TO5qYvOacjn2rbZ+uN7pnoEWAgnuq5MVMBzytD69WjR9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2565

Move the "credit expired" loop exit to the middle of the loop,
immediately after "return true". This way having reached the goal on the
last iteration would be reported as success to the caller, rather than
as "timed out".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -332,7 +332,7 @@ static bool freemem(uint32_t domid, libx
     if (rc < 0)
         return false;
 
-    do {
+    for (;;) {
         time_t start;
 
         rc = libxl_get_free_memory(ctx, &free_memkb);
@@ -342,6 +342,9 @@ static bool freemem(uint32_t domid, libx
         if (free_memkb >= need_memkb)
             return true;
 
+        if (credit <= 0)
+            return false;
+
         rc = libxl_set_memory_target(ctx, 0, free_memkb - need_memkb, 1, 0);
         if (rc < 0)
             return false;
@@ -354,9 +357,7 @@ static bool freemem(uint32_t domid, libx
             return false;
 
         credit -= difftime(time(NULL), start);
-    } while (credit > 0);
-
-    return false;
+    }
 }
 
 static void reload_domain_config(uint32_t domid,

