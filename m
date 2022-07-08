Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506856BB0C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 15:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363420.593933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9oCu-0008W5-Q3; Fri, 08 Jul 2022 13:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363420.593933; Fri, 08 Jul 2022 13:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9oCu-0008Tv-NF; Fri, 08 Jul 2022 13:39:44 +0000
Received: by outflank-mailman (input) for mailman id 363420;
 Fri, 08 Jul 2022 13:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYmb=XN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9oCt-0008Tp-2P
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 13:39:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20078.outbound.protection.outlook.com [40.107.2.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b386ce1-fec3-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 15:39:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 13:39:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 13:39:39 +0000
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
X-Inumbo-ID: 6b386ce1-fec3-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOqvKzCdsJvLwRPXp3Gg2sZMlfOcUPZKh0lEuWEhq9ReLTcpURx3knkrKyMI4EJP+AxFYBMSzVccInZiqrJxwEYvYHCRrBoQtfEGlfeQVs3LhSLyXTNnAuiTLbYzeIOVI/Hds4XSO/CDkkyOuNFMw/ok7nKYGVg7eBEMgtmRPtIRrIscXRKx+nMsA7Cy1iBDtthUlHmi8WxJyiNAdE/8KOpWAdfjz7FuthZ8X1Ad1myytzpejfBPuSz4ZSOS4LD5PD0W0u9Yh/VREAwwyJNLZ0n3zkNIcvl8qRZeZL+bXBy3RmG5I4amNIM/mqDxlqPuhFdDHIKJdd1FNauXiSn/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKdnm3XyVTt2oEDS8+TU2y+4wxHgZzHT82MYHpkWhDw=;
 b=bRfashimuCARo+a7ehsTuNV88bC5F3OaLXZXS7yn16fyIJfKllshDgmkdq8e7CppN2DFKE6pYNQCmnhhuk3/m0prfk5sIiIVqXdWH8TKcECUqmw/2kmJW6Kf3yYne72tSh1KOh6YKM291GKJmE43WAnGwpSuKg8yqtkFetbKvOU6+U3DkPoX6hPzwCxnvOPOC0WjCCKzVjFOBdZXtTl5im+hLfVxtmIeU6zSrcmVP+1JG2kxuaCaJxW+Gzd+Oa3k3CjQVvZrt4eub5cQ/4L1muB1tVeKl1fHcYXZo3Ni5B04wcp/VDGIwk6oNjcNrm/yTYU4u25pQdJB95kaghN/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKdnm3XyVTt2oEDS8+TU2y+4wxHgZzHT82MYHpkWhDw=;
 b=xk3RvprhAI/NVWSf2DsdPvgZSBW8esOlaiLW65y7yHE54gMb4CzjoSJsp6RXj/ilCnUsjNP0CbRxFw0nVq5GUn1kvK5vask2h2+EyBH3ict01ZsEpmhVHQy9Hk9AysSLATwjahCjO7t4V7OfaGwVE7znZSiSpskvrL3CV2njWyBcvZHaambbDin9/3tvlBWLtGdyl/hFYlQzI9Vbxiw9tmEKV7Ne8ek2jU05sdxynmr+2jmDd0i5ejVJAlGUqyiS5UsIw8v+MitegzlMVHbmBHjsKMb83c3IuZKm9Cw6HPyGF19qd4/m5+PPyHznfLI0I71yEYxkjeqtsR/omVGK1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55556c13-dbaa-3eb7-9f3a-9e448a0324aa@suse.com>
Date: Fri, 8 Jul 2022 15:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xl: relax freemem()'s retry calculation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 195fece6-f747-427b-f82f-08da60e74e4f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iZ8RIXH0NykgXQY5Ey7Tp1G9ejDqU11PA6aNW7IpMzZrAoUxPHejFoqLCMmLdAtkD9s5+w1ZbAGBDV1Cu1qcu2T8G8FQWCmY8m/QJPRYol/DWwrOfcBvfDrCUDHIuu2mC+MxFGAxzN7wnBv4qUs24v36ets3KNpQjfW5/WAYSUBATDvXmldDWEeakWaqew+FDlnqmKBdryvFUIqzgKoE1zAuAuVHV7RbW5rAIUM3JApxldmDZR5JozxTujRmd0loxd4O6xY7GFrptrTf0MgoNcXha3lHOVCJGcMDhmsDY1tJPHU9WyTrGbtXcYELwDrUm30W83O909cdbsAA14pDi5AW0BqplDrvbdix+ywINCqHmUpIQbW9ZFOqc4pHqrohKdWm1Do9NW313nAvztixefGZf04TH8+9SyAd0Arc8HEL73JxuxSJeAh7g5T+I2IxMxlN2IFgawe730omba6YreYzPztrUBsIpnVmDIqp15vCBjhl8AqYebtnjnWYgzaiKEPzEJ+DO6nDvgDtSV3SkmoL6E1Mh+1BfhsmuYb4ep7jFCHaLtZeCsELRXWW+kx56kgz7gHN78tQQSsVllPESGlYUG/dRjaMR7veduCXm69Uyv1G/ddJ3mCEYBwA6lVDiaOhkz1ExO96zaS0KCccnocFFVw3G7LZKPIPc7UDlInO5vzZtv46MOVDDUtd/zarRxVXoNqlUFDiL9PwB6q4Nf7MUARd8NiT3J5OyjwERxodJTS3l8wfEqZ8maszuDWUb7T9MPvZ9IymgK+P1AGrZ0QynkUrQ9SGXzEsBfjDGp8vv++QV2U0E37d/dvQOuC3/lFpEhfNmRUQFeSh5gSnHwUi5A9+d5yTOdwM1Y2uofgF7oyKGXsoZE6J+rGRTBV4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(136003)(396003)(376002)(2616005)(5660300002)(6512007)(86362001)(26005)(66556008)(38100700002)(8936002)(6506007)(2906002)(41300700001)(478600001)(966005)(83380400001)(31696002)(186003)(31686004)(8676002)(6916009)(36756003)(54906003)(316002)(4326008)(66476007)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXhUWVZoR0NVSmNMSlljbnlpWVl2NUdVU1ZLTWxwY2hZbjdYWFg4VVZ5UVMy?=
 =?utf-8?B?RXVpRXBVdFBYUURnSnlOM2ZTc01wOGlDSmhMenBBMXpUUi9OQW5zLy83Z0xh?=
 =?utf-8?B?ampWSi9ZOCthWCtUZWNyYVJOMmk4NnJXUUs0b0dUMTl4QjRSQ0VrSUtMZjhO?=
 =?utf-8?B?UEZPVGVWU2R6NzNYY0pWaks2bHNTRExrbGlNaDhDQ013a0sxdEIzSzdlWUlh?=
 =?utf-8?B?emlyaVJuY2Y1a00rS2owRkVqSGx1U1FnemxIN0xiRkxCcmVnemRoZnptWEZW?=
 =?utf-8?B?L1hFRWYrd0dFUjd3SlRSdFovanJFR2hNMzF1cERxUk8vQzAyRDlCRmhFS2lo?=
 =?utf-8?B?TXduV2lUYXQwQnhYOEhYWDF5Qy9mU29xSHFGUFJNZTVVd1JEV1g1UFNQcm51?=
 =?utf-8?B?eGtvUXE5VDVTT1VBSGxGN2JlZzIrTnFWaTVYQlFaOWo1ZkZ3ck50ODFEQXFi?=
 =?utf-8?B?UTBhK05IME5ZRkZHU0xTbmtGY0VZckJFWnJ6YWVLZmNLZW1IZFRveURwVnps?=
 =?utf-8?B?cFN6SGZGeERkTTBQUW8zWjJ1cUsvVnFUNk9uTVo4enRjV1BNNm9pR3ZqWFk4?=
 =?utf-8?B?bndTZ2pRN3dpRGpXc1pyNlJLcElyWnZod05FUEg2aVByUERmdklsNk1rdnly?=
 =?utf-8?B?MUVsVE4zeEFoUVpJWTFYdDRpNzQxVEtQeUNlelJ0K3F6eXUwd085Y1RJV1Vx?=
 =?utf-8?B?ZWlGMjFxZzRVQ0sxSnBHbmtzMlNpQ1U1Nkk1eGxRMTN2ZVNIb1hKM3Z1aUZR?=
 =?utf-8?B?Q21kWjNTUTVLK1VNL0llWS8xS3NGRU5tZWtFSm9PeUxRY0hDcnNlVlBzOFRI?=
 =?utf-8?B?Vm5HT0hDc1VjcEQ5SE5CWGd2Sm5tMVFmRFMrM21qYzlCTUZMbkdkamp1QndH?=
 =?utf-8?B?YnVzVi9oSGRHUkd1L0pGM1ZwblBKSzVtQ01WOU9HTzBDQ25NWDJEN0JEWUxq?=
 =?utf-8?B?MmJQNDl0WmpUZFJjY3hkaTRHbnhoQlNwcU1wRDRMbFJLSzJXM0VkQzlLNUZh?=
 =?utf-8?B?NW5wUlAyaEFEdTVzdWJTNmlLV2VsMStTMjVmaUFHbWVORlBlSFVTcjkveHVR?=
 =?utf-8?B?Q2hYcTZDM2ExTlNLWHlCenJZUk93bGxaSlJ5UVBZRlBPcDRJSkRMWUFrQzNK?=
 =?utf-8?B?bVJtK2NOd2VsNGR4aXBUS0c0S3E4ZVg5a0dsRlFubFlXNTlRU29BQVdVQkFs?=
 =?utf-8?B?QmJOOHQxdVpVa1dZSTliYmwvakNUaG9LTEE4UEFzUWFRcHBoU2owS3RvNWxV?=
 =?utf-8?B?K3JBRVlMUkVJUlh1bXgrTjZjbWYwbmVKSXl1MmwvTXBkd2J2eFVXVG5jZ0FR?=
 =?utf-8?B?TDdRQms3RmVtZldjTGErNEtOZWVsejVnUU94R3hzcWpvNGhXNDN6WjRpOUE5?=
 =?utf-8?B?bW9KVm5jZyttbHo4dTlCWDFtWWlyWjMrY0hSaG00c3pLdVY0STdvK2VvUWRW?=
 =?utf-8?B?TmtXQUlLL29WdkNhdm13eWZsRlJSTUpXMkhUTjVEdjVPTjFSQW9XQkNVcktn?=
 =?utf-8?B?cUlzMHQvWUMxdk51QUVwY2R3Tklmc1JyQ0VaYll5ZXNDOXpyNnJFSExpU1BN?=
 =?utf-8?B?bGlETFVWQWN3Njl4WEdQcmJkMTl4OENES0E1VmRXemUvSDgvZDRmZjZQeVV6?=
 =?utf-8?B?eWl6UDY0VThuakRZRjZtSkZQbXF0Q3FoZ1hDRHRlU3ZvQ0VpZG5pWFBTdS9S?=
 =?utf-8?B?UFk2eHYrTVl2Vy81SzJoQkJMVGUzNlprTDVGL2JzNFZFbHlXNkQ5YkhQQmNX?=
 =?utf-8?B?QW8rNmpYRUJYY0VVclZ2b1M0QzVrbHd4MXBJakt2QU9Vd0JQZEpreWYxQWxs?=
 =?utf-8?B?YmovSVBJUkFkdlBCT3EydUwyTkRMWGhXT3NCU0UyclZPOXRwR1BsVnN6WUI1?=
 =?utf-8?B?MGI4LzRoUXFyUmNoclhqMmNQTEdHNUcvazl6U2V3dFpJVFNoYml0RW1MTFht?=
 =?utf-8?B?ODJUaHlqS0h5ZHp1RzdrZEJWVWFmSWpreW5qaExRT0p1eWZCblNaTHpUSHpr?=
 =?utf-8?B?alRoRzdkalJiQkV6WkYzZXdKeUlBWE9DLzM2clVqZkl5a2Y5cXFQMUwyb2RY?=
 =?utf-8?B?SWEzcWxua1RmTFRPNUJxY0E0bzNjUzRJMElhMlFJaXBURkFpeG5vNE83aGZa?=
 =?utf-8?Q?RgDTsTlro5Cddz/Qbl41B/IYj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195fece6-f747-427b-f82f-08da60e74e4f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 13:39:39.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13Hta00gHRVKaeYOcwLwd00HKf0K7FYpyzYUMd5K6sNEh96D6/FAymLv+aY2WKnyrSVphdaTWDSuyYAyi+3coQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418

While in principle possible also under other conditions as long as other
parallel operations potentially consuming memory aren't "locked out", in
particular with IOMMU large page mappings used in Dom0 (for PV when in
strict mode; for PVH when not sharing page tables with HAP) ballooning
out of individual pages can actually lead to less free memory available
afterwards. This is because to split a large page, one or more page
table pages are necessary (one per level that is split).

When rebooting a guest I've observed freemem() to fail: A single page
was required to be ballooned out (presumably because of heap
fragmentation in the hypervisor). This ballooning out of a single page
of course went fast, but freemem() then found that it would require to
balloon out another page. This repeating just another time leads to the
function to signal failure to the caller - without having come anywhere
near the designated 30s that the whole process is allowed to not make
any progress at all.

Convert from a simple retry count to actually calculating elapsed time,
subtracting from an initial credit of 30s. Don't go as far as limiting
the "wait_secs" value passed to libxl_wait_for_memory_target(), though.
While this leads to the overall process now possibly taking longer (if
the previous iteration ended very close to the intended 30s), this
compensates to some degree for the value passed really meaning "allowed
to run for this long without making progress".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
see https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html
---
I further wonder whether the "credit expired" loop exit wouldn't better
be moved to the middle of the loop, immediately after "return true".
That way having reached the goal on the last iteration would be reported
as success to the caller, rather than as "timed out".

--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -321,7 +321,8 @@ static int domain_wait_event(uint32_t do
  */
 static bool freemem(uint32_t domid, libxl_domain_config *d_config)
 {
-    int rc, retries = 3;
+    int rc;
+    double credit = 30;
     uint64_t need_memkb, free_memkb;
 
     if (!autoballoon)
@@ -332,6 +333,8 @@ static bool freemem(uint32_t domid, libx
         return false;
 
     do {
+        time_t start;
+
         rc = libxl_get_free_memory(ctx, &free_memkb);
         if (rc < 0)
             return false;
@@ -345,12 +348,13 @@ static bool freemem(uint32_t domid, libx
 
         /* wait until dom0 reaches its target, as long as we are making
          * progress */
+        start = time(NULL);
         rc = libxl_wait_for_memory_target(ctx, 0, 10);
         if (rc < 0)
             return false;
 
-        retries--;
-    } while (retries > 0);
+        credit -= difftime(time(NULL), start);
+    } while (credit > 0);
 
     return false;
 }

