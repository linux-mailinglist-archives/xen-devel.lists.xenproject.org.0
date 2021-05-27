Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86034393295
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 17:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133583.248934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmI84-0008Sw-VD; Thu, 27 May 2021 15:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133583.248934; Thu, 27 May 2021 15:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmI84-0008R4-Rk; Thu, 27 May 2021 15:41:00 +0000
Received: by outflank-mailman (input) for mailman id 133583;
 Thu, 27 May 2021 15:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmI82-0008Qy-Qq
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 15:40:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86cc71c7-7fd2-4750-956d-704b7a03c23a;
 Thu, 27 May 2021 15:40:57 +0000 (UTC)
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
X-Inumbo-ID: 86cc71c7-7fd2-4750-956d-704b7a03c23a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622130056;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/naLsN8ifjl2UmADRleZuoerq8cg0/zxtQ1Gx7KIUeo=;
  b=GyjsMZqhxf8Gu5wlHJS53gyKEbWMonXw6uF4KHGHzcpKynV1HHenoAyd
   RtI068mF6G09bdZzEOLJqIb8G+tSXa/Z38TrpkE4bKcFW9lHiLo66YRd6
   KOgBjCJzQQ3sMMiKoaPgafncsGE568hpRY8mSww/SP5lGP1algFzmHGRn
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Aq6eVXiFxeQhFCBoEuDV8t1lfnNS8UwD6tBBR+OcUjAcBiassUOn+C2qBlyX58t90ZyEj4tadb
 QD+5R5AL8W/knSWmHwhWjJPPOVVxihVGkFUZpKuSxHEc7pLj4SjpBzqGwk2IarR+drTxFyL3v/
 I/z6VzBi9qttlZmoijUwi5h+Ve29cUhxpM8xWAtkHzMQ+/m6Mnk/YskMO3pSA8OyHdRo4nsi6o
 lxscjJZDpWxphU8jdG/sZQ7N1NCwvvUvly0HRTXLu3uWCQpG3ItGo0V/BHc2HtTgaJ93x368HH
 xhw=
X-SBRS: 5.1
X-MesageID: 44785745
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SnJvXq4OpyC8hn3luQPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44785745"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7l4xoiwFvirQgwxq4NacCWnkxHExWjye98V3oFjJyqJbbiyMQsp3OIhaUl2yF75rQMdWkAFPeeO4DdnOCnA0IYVkcqWiF1ZudBts3dUCvxGmC+DBP8G4dBpGS7yYhVdYZ8g9dUtYGDkXe4rTvi3hn0IQWDF+16jsTXtkKuqHDD2pgl/q0rf2Ol2737RliXznU2QwfoNbowhbN3UjmC1ypgRi72iKbWN/kllj3mHeB/3cNuwt6mfRdocn2PY+yuuKJtldW+UnXCHaJB9Fhaj55PpN9Xe+Y0lR0oykHmYnmI2ekAc6nO/k7OJ95ASjyf0NO0rqzZmYvIgEy07GpjtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGS0i3j5KxQRKnYVwmu8glWVhBWkGHgIz7u58zE0TX4=;
 b=VFdtl9grLaJ+cTNtH/pTpaA1jJv5G7GXT/w/Ho+ueSDgHIkHm6crixvIqmVdWN5zOPpDWolrTtp38cBpe9ugSP7UunNjPJ9tPymbJLCSjmIMTSQ3NQxzpuN/p7MiyHMkEvb26xMInES6oLz1HZE1ZBwJZrBxywLxd9c99eQ3w9gf1jetRpyi48W7Xo4275qmpS/ZVN/GFxYKKplcV/eCSAaWZgwA65gwVSp598vooOxvnTPlv7MnCPIlkBsU0RQWtI4YwWD+sfCrIM9l0PncvhIDqRC++h14aDxd76+xelWZKxgrBVlhfPiaysQkKxHlQpMs1/9G+w5fzg8qnvbllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGS0i3j5KxQRKnYVwmu8glWVhBWkGHgIz7u58zE0TX4=;
 b=ZpVwai4eM9WOKf5Mqlm1X5nBcIyjIqx/smbwd9pJY0/g6go/pgsgQ2RzwiqnP+JWWsx6MYuUMn3UeceEha4eFdgE1CMz9b6EEwI8RDRNDfd1JpKINc6YHUTTuKi7x6J1OeS/f85LQxvWrYyIgajn4cAzG7qgpV9aMWu+/K0SJD8=
Date: Thu, 27 May 2021 17:40:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86/tsx: Minor cleanup and improvements
Message-ID: <YK+9fchtWnsslsPn@Air-de-Roger>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210527132519.21730-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae7fac06-5992-468e-f9ed-08d92125cee6
X-MS-TrafficTypeDiagnostic: DM6PR03MB5322:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB532206711D3DBA779E130C8D8F239@DM6PR03MB5322.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q50n/6FWOM3lVKgTR84pQCj5Who5bqqfQPg4zqVM1spZf4SHT21d2WpXvt9MKLG2Mq7Z23+7XLqfwNyAJaymTTPoUvGD3YGnHJjc2OzQjHtexrc2ampqDOBaCiwXG7lkxKqTjFVNrTh3O+GzmNkMhImwsep84xfqsZzIroRl8cpUr/aRG1L6YYBIPEGEan9f0+Sp6Zt5uQNUzxD6SSSPZ/4ZKaVO8qVhULy88rw5RQ4oD8yWW5EyUqkqQT5T3WVFv8+8dSDBzyOoTJrqk9XAkkXL6MlU9J3r+FxbbcqzIw9i+fwo1uSKru4aumtzlW2KJ1YhIlCbK47nsjjoH7TmZnbtkUn4f29Fs0DFep5wOw0PABNJ9YxhZkzsOhGu78yMaBKjtMsvTgFv2L60kgwAAt2j+eunkwf1heMivMz4yyqWPN6FcKiF2q+kXHyw+zZb98n95z/+jZ3PZhYdDzhASDK6KSQ6rH9fS36rI3t8w9Yh4u6aV3Q1JNP9TPLIAkennIJkgUvyacoLbBOoay94jzKblhbAJYdXt6zaS1y00vYbXwJAXdshepJYijU5PGX9CLDLhbzWzHkmqjDS9m1FufJgVYk2caCyT960AxgHquvM/PkbaYfFtjjv8V4ne2F6gOL3cBmsImrfBsZrfRyl5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(478600001)(26005)(54906003)(8936002)(8676002)(956004)(6486002)(316002)(6496006)(6636002)(16526019)(4326008)(6862004)(186003)(9686003)(38100700002)(86362001)(85182001)(4744005)(2906002)(66946007)(6666004)(5660300002)(66476007)(66556008)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVVBMUZZUEZFOVVNVkVBR2NKM3pnaVR5M3hBaXhwTHdMblBNYWhlM2MrVUhB?=
 =?utf-8?B?aVJTOVY3Z0dBdzNxeFo0UGFZdEhaQURveXU2Y1F3WVBHdnNRZ2thaXVNSUpt?=
 =?utf-8?B?U0cybWRmWTNMajRoY3VISS8waktBM3BzVzNXZndWaDlDQjBHSi9UMzlEZHA3?=
 =?utf-8?B?eFBmQ2pHeXZXekhaME00YUdjZkV1YlNDYVhHdmdZb2JUcXArMk8xaG41V0JX?=
 =?utf-8?B?bkhDbW40VG5PV1hVZURuWmJVVExkaE1jaEZwZlNhd04vY01uT1BselA3SWJY?=
 =?utf-8?B?UWV6dmNjMlJyRTdoQXBJZ0ZCYk4wTkFBdC9YOHNwUDUvS2RKM0lJT1hGQlNS?=
 =?utf-8?B?Yy85ZE5aOURVTnRhbWtNMUF5ZlJ6Z1Yzc1R1d2NVOUc3QkJndGtmZ0VrNGNL?=
 =?utf-8?B?bGttcUtjbTBoVTlTNGhZbm5ZUUI2MmVnb21LbTBRYWw1b3k5SzBDZVVpV0JZ?=
 =?utf-8?B?Y1Nuc2JwK0lJZGVwN0twNzExWk9CdkNNSzJtM0cxRHZBc0xRMjN6NW5abEdY?=
 =?utf-8?B?UjBIUUVDdC9aSlFCNVI3Y0JFRjBNVHcxMTFwdlpNN2ZIMGlqWURqbUlLVDZS?=
 =?utf-8?B?cUoycTZMSFNRcEZlNkRSSk1FRVhTWGU1V2IzR0hZRjFtdzBrS3hmL0xmSnlS?=
 =?utf-8?B?Z3QxM2Flb2ROeUYxYm1RdHU4b0wxWVpuY0NTUjBIYzJOaGNHV2FJaG1qWWMr?=
 =?utf-8?B?UTdVcXhKeXVQZm9GcWlnNkJpUElzNG1JL2pRcjcrYjNZY1BFSHZNUzZDNTV2?=
 =?utf-8?B?K0FqbTNVUWs3SEk5NnlqZzJOZU9PekpKL21kUklLbld4SVpockQxMS9kZDBO?=
 =?utf-8?B?ZndqUmFYa2t4WlYyOGM3ME1tZ2Nkc2JvWkN6Tkw4OUc4V29ZaDRQRFYwOGtj?=
 =?utf-8?B?MVFVM2lDd0dncTFqR1ZXWThZRE13NDdaN3poNHRUbmpEazJQYVFZS2d1VWFK?=
 =?utf-8?B?RXBTc0Raa05RQTB1YWdMM0pMTU5yRzhvUURqZGxvYUhkWVU5WkltSkNGL2kv?=
 =?utf-8?B?TVc1R1VWSzVpVGFZWWdOZmJEcWVlTEdxRnVqVUdIT1EvNS9tUmd4d0RBeGJa?=
 =?utf-8?B?amZXT082S0hMeTlXQS9tSDhGWDdZY21aUXFOUUNTci9KbDRLem40cTZwUlJs?=
 =?utf-8?B?ZU1vb01ZdDBCNFgzVkhDT3o3YmlxaHFSWFlXbnBYQmN3WTROWDQvRnJLeWRQ?=
 =?utf-8?B?ZDJrdDE2dWc4NUhKbTRVR2wwNVFITUFBbXNMVDlNUldrWkVUWm05MHpBb3A3?=
 =?utf-8?B?OU1JTGlQMkVQdzdYaDVneDRNS2JOaThTYy9ja0pmMm81ZUo3SFUwNHNpTjdF?=
 =?utf-8?B?QXg0M0dkY0ZqY0pHSERoU3NxU0JjYmhYcUtnTnF0SGhwSnpXZlo1MG9FUzhD?=
 =?utf-8?B?UitIbnc5TGV5dWs0QjF3NHZDY1p1OUVjS1BlbTZ6UlgrNlVuRmNWVzBISW81?=
 =?utf-8?B?Mmd0VnF5MUNMaHN1ZmZyVjRab21sVXE1M2dsMm5tNWliN1U1em1uMk55NTVw?=
 =?utf-8?B?U1RVZ0ExNlVGYnZ0Qkw2Vy9FSVBiQnp1Vko0M3FSWVkyOWhSVU9ESWZKYmc4?=
 =?utf-8?B?eEFydDJTb1NGcUMwRmNndkpEelQxR094WkxGMFYrQmV1MXQxN2pKQysyRk9K?=
 =?utf-8?B?NXRub0hDcTNWWEc1RWxYVU1OUGt1WGNmRW5WTzZuSGxGeTl1VVJVQUpEenhO?=
 =?utf-8?B?R3RMRlR3Z3B1RGxhSUlZbVZ0UzVIOHpHY0w5Y2xtVzk5QnVOZ2hpYi9mRDVy?=
 =?utf-8?Q?WrMU3tcjygi7OxG6AIETW+v96ieV6i8UtZuTZXr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7fac06-5992-468e-f9ed-08d92125cee6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:40:51.9401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmvP0n7rbFqFJnKIPQ1z3QgKYYcwIPBr0AH9+L5Qs/zABz8tcRuYGLWbVym3rhzzmBGzw0NOnw/n+ZynowW7Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 02:25:18PM +0100, Andrew Cooper wrote:
>  * Introduce cpu_has_arch_caps and replace boot_cpu_has(X86_FEATURE_ARCH_CAPS)
>  * Read CPUID data into the appropriate boot_cpu_data.x86_capability[]
>    element, as subsequent changes are going to need more cpu_has_* logic.
>  * Use the hi/lo MSR helpers, which substantially improves code generation.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

