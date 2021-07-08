Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E03BF392
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152807.282285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IoZ-000787-Gz; Thu, 08 Jul 2021 01:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152807.282285; Thu, 08 Jul 2021 01:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IoZ-00075z-DK; Thu, 08 Jul 2021 01:26:55 +0000
Received: by outflank-mailman (input) for mailman id 152807;
 Thu, 08 Jul 2021 01:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1IoY-00075t-9K
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 01:26:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e011cf08-5b9f-4934-9050-0e8222473e39;
 Thu, 08 Jul 2021 01:26:53 +0000 (UTC)
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
X-Inumbo-ID: e011cf08-5b9f-4934-9050-0e8222473e39
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625707612;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NCsyovaDGC5PS7i4ezcUxXHb33WhIjTf2IzjSzcvd1Q=;
  b=LYy4fNRYrwZzTphwQj1iUBlS3kpp7lGp5oRs49qPTgEgQ22gtTO3J6pq
   deud6zLEVqCoi3wqJ5pAlv/vmqJ3jHfN67FlX72ewQj8+6VEVjTTHIBOH
   2LBrmZWLEbQjVQwPaCrKNEp1fcqi0tbdAUPTMlhv8dd5uqEoX9faNXfsh
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Isg8KaNH0BqOMgKPYesgf240P3TpYEpXKRkDrKyn+gf94mdo5dUvib1y0SgLOhhX23j1H45CZm
 LvrRKmjd/hXWTHhb9iRmwcd79DAp36Kd2GtlauXImxkt/12W1Sft42NIrTlXGD8IbHsF1MNhm3
 6RD1XKQdEZ3V+Auhx3WeG++IyHMaBYzJs8axa4FZrKDBZRFDWn10WgzFsJ8JV5eeWplkDI+5sk
 6o2Zy1uIkaMbzsFVHEXKueXbJd3KXsiJFiPqLPFG2jV347bERszdJ8cqN7L98fTwX+xhvxX6S0
 GuU=
X-SBRS: 5.1
X-MesageID: 47497182
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+Q1cb69XwMiqQra+5Axuk+E2db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc29qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQts5
 uINpIOdeEYbmIK/voSgjPIa+rIqePvmMvD6Ja8vhUdOD2CKZsQiDuRYjzrYnGeLzM2fKbReq
 Dsg/av6wDQA0j+Oa+Adwg4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DbCtvQSA5y4aoOnZt7ShEJ+Zx/r1Xop46zuNLd3Bz3Z
 WODk1ZrsA7ciYoV9MKOA4ge7r7NoWfe2OBDIqtSW6XXJ3vfUi98KLK3A==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47497182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlRZ9cP8lX1My1g7WRT39dqtrh1hzYY7n5P7GK4baWD/0oD6zzC03zC0/L3LmhNykxfjsgBDliCQUFFXkh1Aubr/Xzcv7oaC5ME3I83DOQnncwNjBzvHExhDyJknfoIKNwILWiYPz0ewchZL4/DPlJIB0SVdYD9a0O+MltH96P2gxjPydWUfxo4c1gml8b6d869UcZX+8E862YJ5rkFZOsEliqMBL3hb2XnCOWaACJmM7r0jfHxk+anFBudMBqbkkFaCjlHQilcXlk5Y0e1tlZfjY3xxvdSuBWxIUV4BN+pJkWZVKHWN6iSGMAiYOT0+gfUr+c99CwFXobMzRXlM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCsyovaDGC5PS7i4ezcUxXHb33WhIjTf2IzjSzcvd1Q=;
 b=J67x/GkcJ0y8uwspKihAi/XhIgTrvBcUfJTMabme8YFQ/9j5ibqnWk1HleiTg4VCQiq61MUU7S3qyRGLmHPDOPOAUvqdJtY0a+UJGwrAJ3Sxzx2JuzmZjxLcjB4buq7tzDYGSfphHb8oYAenq6IlPAidq+s/QUFuCXsCdlMOFxPNKHhAuqjwSbP3SE4+5M13wOfvHOCmNNEfPlX4yyc3eogSPhWWvoVhYncTYKhtDc5DMKIFetV1FEWtc9MO2Ecrg5IEKyV/burtqB3axZn2kA+Zpjke63d7Dyx5KcPf+53O003d6vOpk6d/cBjyZeLjWyTo3as3XEEhm1IaIen1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCsyovaDGC5PS7i4ezcUxXHb33WhIjTf2IzjSzcvd1Q=;
 b=wSXRtmfv93eAYHSgoXRGYSXJGQ3hGmNryF9UOC7gzsm7fRSU8ZEkGKDI5551sz3xIJ3FGHptSJdrUFkz8DFwcV3HmFVohzC8zEkCmuRr00+glKeznlywimBr6PoMK5Z+w3vjzFwJxxwQza819G8WoWKbxoysAP391Afygy3adwM=
To: Igor Druzhinin <igor.druzhinin@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <george.dunlap@citrix.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
 <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
 <5dfb0321-ca52-5464-8bbb-c29d329d24cf@citrix.com>
 <ea392b06-6277-ced8-0cbc-40967fc1ca61@citrix.com>
 <9e44dee6-a7c0-e139-4eda-a483b2ba16b3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
Message-ID: <66508b62-ec4e-9097-062f-023e7e20cb42@citrix.com>
Date: Thu, 8 Jul 2021 02:26:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9e44dee6-a7c0-e139-4eda-a483b2ba16b3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7d1969e-a9b2-499e-fb5a-08d941af7586
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB398955093AC633673C73F1E6BA199@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WGVyCd1gZ95XundkDX8OsbEAhEdt/JJZH6RzM7daT5x75Und5HCQFqwlBH+efdwTki4V1mJwOcHRwYhv97s9t8AInk6XCHNGj9rJIxRDtcbfQVLEYhuWLuUsfqjn1XtxgVo6O0noEtvlEaMNz68BFVsHn7/NhVBeH2TZRen00Ytl692aqLQjRvy8ztklSWmb4j3ZEa0LFKFA7gZI6eydH/Unlli3yqtzRjafi5yxj6BjTJULLRpkws2scL8eM9nizInlMvHNAFG/YrSKc0wc/Pvpw6khEa+4r9mwTldKwyivO6CWG5QJWeZHCJN9XJrdu8+4230lwc67QacuJk+fy+LtaJ/VHGE4SE/rBNahL8CgkVcMDA14NhAP1s0oG7LEPNUKzChCX5mkYeAfxZInS77X2tu8Ht8qbPgxcGFIQWsbVSt7EEx8L4eiQcRIyAP2WMqXzn4FyX+AUpaj4rmmK8++z5J1NEXgQWom5z0XgeMGdEZC2n65WTD4PQ0dSaVit7mikfBw+1b8DKo4oUTi/ZKntx2SWwPZ37QnLpYCwzSi+CgPh/DQAbbaToLAi5mrUbNaMqzQymT1lXsp/xATdTmy9mIJehsjaiLMdeF4krqJGa+nnnzKAF0fWL/GhVcS40LXdYvMvq5V9jy/a/ep/mAPIEhilM5gvmNXfATCY2d6fkT5wngDMtAJOwz72Wv5ZKnagwyAdFNwevDbuZan3cmBRbr1Rksc/wsxvd7XUoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(478600001)(8936002)(86362001)(5660300002)(16576012)(36756003)(110136005)(6666004)(53546011)(2906002)(316002)(31696002)(6486002)(83380400001)(66946007)(2616005)(4326008)(186003)(8676002)(66556008)(956004)(38100700002)(66476007)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0hRdFVxaWNoQ2tDbytxcjNXVG1KSy9nL0RwN3lJZlRHblBvOEJiTUJiT0pT?=
 =?utf-8?B?VzFvR1R4VFNnTldoOW1xTDNCQUhldEhXVXVkeDdDY2VOblY2NTFTbUJWaEJH?=
 =?utf-8?B?NlU3Qk9qWEVudDQrZzBhN0gwWEVFRkxEUWZSZmZCZVdXMUk0SDRiaXJOSlNi?=
 =?utf-8?B?bFpxQW1leTdGTHY5ZDNwTjhUV3pEQkw5ZDFCZGp6bDNGT0pFTmlFQ3EyOFo4?=
 =?utf-8?B?ZlBzTUJHS3ZrWW9vaFpObGZYdVhsNURwRHIxdDBIZ203NHdpYWdzQ0ZzS3Qw?=
 =?utf-8?B?UjV1SGVwTDFaQlpIaXg2SEYzWjZNVStPckRrVmRra29iTXJUVkJXZ0tMbFVG?=
 =?utf-8?B?TXpYMzRXZXZXOGh5ZXVzZmh0R0QxbElaYy9WL1N3U1pRYjNLNEliT2x2VUcr?=
 =?utf-8?B?TXVmZHRRZDFSa3JDVytMeXJHUzBqTUhiNjgveUFKdUdXbFJITzBaTFE3Rzk0?=
 =?utf-8?B?WTRyS2o5KzBUYWpLVlg2cnVYTGgzeUV1Sy9HVVZxY1d2UmFJbTdoZ1ZGTlpU?=
 =?utf-8?B?U1FDRUlNaGd1UEhnVVl5Q3V2K0R4cVBwcjFNbVgwdEcvLyt4dzQxZkxGZVpi?=
 =?utf-8?B?Vk1Zam90Z21zYURyNTc4Tjc1QzBKd1VJdjdlMUFOQUoydFFGMkVwTzFZV0RE?=
 =?utf-8?B?U3RqWEMweFcyaFlsVVgvUHkwSSs2ck43NFM1TmFNSEFQY0NDckdDdHR6OXFL?=
 =?utf-8?B?NW1DYnVyekY1cGhWN3Vmbmgwd05kT3B4SzVpVSs0ZzN0K3VqNlpvYWEveXBL?=
 =?utf-8?B?N2xwcGxJeWk5MlV5dFo4Y3J0Um53QTkyTzZhT2NWNUVOcWtiOWNMT3dDYVY3?=
 =?utf-8?B?dXlPeUR4SnZNNlp5aXZ1Qy94aitQc3Z2ejZQbGRWaHJMc1NnUFBLVW9EYU83?=
 =?utf-8?B?WFlINHRGN1gxSjVROEM3RjJTVVdudnJ1amczM1NyOUxHQUwvc3Uwbk1YZTA4?=
 =?utf-8?B?VDhUdjRVeTZxdFdOSkRHVk9IdmUySmZFWWVyMUVFeS9vVlpwVjFRK2NneVdq?=
 =?utf-8?B?c3I0djdqTFZZQmlHQWlZQUNIN0sya1pxc05RZVplRERkSGthOGRTb1d3QXQr?=
 =?utf-8?B?c2psNE00QllQMGNGbzJTbkFhL0QweC9sSjQ0KzZteGN5WnFpdXQ0NG9kZ0tI?=
 =?utf-8?B?TjNuODBOdVRoMEZrZzJQcGtWVEhpdWxnNFZhZjVWOTF5WUI1eHJqcDJqcGhw?=
 =?utf-8?B?WVFNK1U5cDZ2aTAvUkUrUDhkalVKbFZyNkZ0Q1h4QytqL2pkbTFWK1haSFZ4?=
 =?utf-8?B?Q3FYa1B4eG5YOG5KSTBlcHRwamMzVzlnZ3puRzRJT21INExFZ3ZNbzVUMFRZ?=
 =?utf-8?B?VHc5eG5pTTUwQXlRYmtXWUxUYy9qQXo2SzRlWFVMSDBYRXJRcjRwSmRXSTVa?=
 =?utf-8?B?bWtCdTVWeFNuRjYrRUREalRSY2Z5RGtkRS9IUHpZanRwL2l0c2xkUFFNb1k4?=
 =?utf-8?B?SGt4aVRQYlRZQllSeEtWZGtaSklsOEpEU3ZPU0YrbmJ1b3ErQjZ0ZDlsU0kr?=
 =?utf-8?B?WTdrWUpFWXdPdE9YKy9DdjBUVVFnMFQwMjN2Yytrc3cwbUVtUXhwQ29RRWQw?=
 =?utf-8?B?UkdQOFRYMGUwKzFyMjNDSS9iNnl1QW5tajdZVGVFNHd4L1BlNWwxVWtYSGVY?=
 =?utf-8?B?ZWVlQXVXSTlRc1Q2MFZGUzFQcDBTZ1dKZjRpVHY5SDF3dEQyeUlKVmJJMFNX?=
 =?utf-8?B?REZaSlFzaklsc212TXdjaG1UbmRnV2xHNVE4TkF0Z0QvUVZVa04zZW56d2NX?=
 =?utf-8?Q?0d7njUt1GtSoSpMv413skHfDK5Uzap91LasBXmI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d1969e-a9b2-499e-fb5a-08d941af7586
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 01:26:49.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu7BoaQXZstu8Yv8jAZVs7hi1LuoOzmJ+plyj4NlpIQGt68GiNMfeDHolrOmVXPRy/DJblUQT9OM6mrbwdyDXbK2TorrfjVsrY8Yfew1GXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-OriginatorOrg: citrix.com

T24gMDgvMDcvMjAyMSAwMjoxNCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDgvMDcvMjAy
MSAwMjoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDgvMDcvMjAyMSAwMjowOCwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBPbiAwNy8wNy8yMDIxIDEwOjE5LCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+Pj4+IE9uIDA3LzA3LzIwMjEgMDg6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmgKPj4+Pj4+ICsrKyBiL3Rvb2xzL2luY2x1
ZGUveGVuY3RybC5oCj4+Pj4+PiBAQCAtMTM4NSw3ICsxMzg1LDcgQEAgaW50IHhjX2RvbWFpbl9p
b3BvcnRfcGVybWlzc2lvbih4Y19pbnRlcmZhY2UKPj4+Pj4+ICp4Y2gsCj4+Pj4+PiDCoMKgIMKg
IGludCB4Y19kb21haW5faXJxX3Blcm1pc3Npb24oeGNfaW50ZXJmYWNlICp4Y2gsCj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1aW50MzJfdCBkb21pZCwKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50OF90IHBpcnEsCj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMy
X3QgcGlycSwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ4X3QgYWxsb3dfYWNjZXNzKTsKPj4+Pj4gVGFrZSB0
aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gY2hhbmdlICJhbGxvd19hY2Nlc3MiIHRvIGJvb2w/IE9y
IGlzCj4+Pj4+IHVzZSBvZiBib29sIHByb2hpYml0ZWQgaW4gZXh0ZXJuYWwgaW50ZXJmYWNlcz8K
Pj4+Pgo+Pj4+IFdlJ3ZlIGdvdCBib29sJ3MgaW4gdGhlIGludGVyZmFjZSBhbHJlYWR5Lgo+Pj4K
Pj4+IFdoZXJlIGV4YWN0bHk/IEkgY291bGRuJ3QgZmluZCBhIHNpbmdsZSAiYm9vbCIuCj4+Cj4+
ICQgZ2l0IGdyZXAgLXcgYm9vbCAtLSA6L3Rvb2xzL2luY2x1ZGUveGVuKi5oCj4+IC4uL3Rvb2xz
L2luY2x1ZGUveGVuY3RybC5oOjE4NDQ6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QKPj4gZG9taWQsIGJvb2wgcmVzdG9yZSwKPj4gLi4v
dG9vbHMvaW5jbHVkZS94ZW5jdHJsLmg6MTg0NjrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQKPj4gbnJfZmVhdHVyZXMsIGJvb2wg
cGFlLCBib29sIGl0c2MsCj4+IC4uL3Rvb2xzL2luY2x1ZGUveGVuY3RybC5oOjE4NDc6wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbAo+PiBuZXN0
ZWRfdmlydCwgY29uc3Qgc3RydWN0IHhjX3hlbmRfY3B1aWQgKnhlbmQpOwo+PiAuLi90b29scy9p
bmNsdWRlL3hlbmN0cmwuaDoxOTU0OmludAo+PiB4Y19hbHRwMm1fZ2V0X2RvbWFpbl9zdGF0ZSh4
Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9tLCBib29sCj4+ICpzdGF0ZSk7Cj4+IC4u
L3Rvb2xzL2luY2x1ZGUveGVuY3RybC5oOjE5NTU6aW50Cj4+IHhjX2FsdHAybV9zZXRfZG9tYWlu
X3N0YXRlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb20sIGJvb2wKPj4gc3RhdGUp
Owo+Pgo+PiBhbmQgbG9hZHMgbW9yZS4KPgo+IEFyZSB3ZSBvayB0byBoYXZlIGRpZmZlcmVudCB0
eXBlcyBpbiBBQkkgaW50ZXJmYWNlIGFuZCBpbiBsaWJ4Ywo+IGZ1bmN0aW9uIHByb3RvdHlwZSB0
aGVuPwoKWWVzLsKgIEFnYWluLCB3ZSd2ZSBnb3QgcGxlbnR5IG9mIGV4YW1wbGVzIGxpa2UgdGhp
cy4KCj4gQmVjYXVzZSBJIHdhcyByZWZlcnJpbmcgdG8gQUJJIHN0cnVjdHVyZXMuCgpUaGUgaHlw
ZXJjYWxsIHN0cnVjdHMgY2FuJ3QgY29udGFpbiBib29sLsKgIGJvb2wgaGFzIGltcGxlbWVudGF0
aW9uCmRlZmluZWQgd2lkdGggaW4gQywganVzdCBsaWtlIGVudW0sIGFuZCB0aGVyZSBpcyBubyBy
ZXF1aXJlbWVudCBmb3IKc2l6ZW9mKGJvb2wpIHRvIGJlIDEuCgpUaGUgcHJlLWV4aXN0aW5nIHVp
bnQ4X3QgaGVyZSBpcyBjb3JyZWN0LCBhbHRob3VnaCB0aGUgaHlwZXJjYWxsIGhhbmRsZXIKaWRl
YWxseSB3YW50cyBhIGZ1cnRoZXIgYWRqdXN0bWVudCB0byByZWplY3Qgbm9uLWJvb2xlYW4gdmFs
dWVzLsKgIFRoaXMKaHlwZXJjYWxsIGNsZWFybHkgcHJlZGF0ZXMgb3VyIG1vcmUgY2FyZWZ1bCBy
ZXZpZXcgcHJhY3RpY2VzLi4uCgp+QW5kcmV3Cg==

