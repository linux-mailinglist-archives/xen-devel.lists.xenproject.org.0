Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CAB2FA773
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69913.125328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YHh-0008VX-7J; Mon, 18 Jan 2021 17:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69913.125328; Mon, 18 Jan 2021 17:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YHh-0008V8-3y; Mon, 18 Jan 2021 17:25:45 +0000
Received: by outflank-mailman (input) for mailman id 69913;
 Mon, 18 Jan 2021 17:25:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1YHg-0008V3-Ao
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:25:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db9187cf-468f-479f-8070-b90d5a5c1898;
 Mon, 18 Jan 2021 17:25:43 +0000 (UTC)
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
X-Inumbo-ID: db9187cf-468f-479f-8070-b90d5a5c1898
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610990743;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sDoyoagrww/FWo5trHHJP/vUj5Q13LqYtH0JoFDQQuY=;
  b=eCH8/4Z/6uABx7txb6hojPQVsIsIf4o05tc6EV+oPpoFU9OhiBJgPCEs
   1eBjnN2XUJKb2RAwOnyinIx6tbtnBrqIMkN6AZope5YxodZHJkp578Y8Q
   V9MYwxp14LzB+0YaVaO9VsztHfvQnnC9T4+I9oYO9NFKdufUs10XWUnc1
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jwDqrmhLei65WFcdCm3MWIarvndBwb5GVCdhzWzDpsBmt1g7ts7W2GW590bEA7BUpbWIHFchzR
 6PSAhIq/JnXaFgssWXoUQWEq8cqNH20Qt9txowgHrGQRuwPhvz0HnSHBxlFnacqucDF885CJ7Z
 0LLGYjZFdaODbAeGlXOgfdDiuuF6Rn4vFJHtd1BSUHkMmP+15FYqUyLwMqrYSMssQIohrn2ksu
 98ti58wADL9q60kW/evgWrbiMVGCSqMwfcW7LytoB2mcGerGsZ2JnlyPuBNPK+q48bE9tNxvO5
 NBw=
X-SBRS: 5.2
X-MesageID: 35693370
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35693370"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHAUXPw1zv/IEv/x8uCoDR3eH+gt4zGwFcZXPggbbhK4fEjuRU62UAD1YBjg68To6E023jgNlMWb4IuHKIYlyz8WJpPw1d22I1ffYo5bVDRj3rLbw4zAmkCfZU2/YHmSBlzWtsvb0A5lUF1v382efj9oIEtIITf993PcSwNDTgc71orPqrfgKZvuDF4DFndQB3QjEBjJQxhB0k6SMKjvhTiJcI9yA6UP+OEkfHiekI5q9hZY2YSojwiqXtRUo/smPLOFbf9zTAuz/QNCm+DMAnO4rvdUi4FDotUgDuu0qIxkodb7p6mP6UkpV1jmW/ePCBFke3KwtmX6XyY9mCcXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDoyoagrww/FWo5trHHJP/vUj5Q13LqYtH0JoFDQQuY=;
 b=U5grQD/j2UQGAamdeEepteXJEf3vptwfHCXKkv20Xm2PjniCL1V7CHM07K6YrfmrQjp2nQzCT9j5uZTSZmzZ+QUOgGPXug7+wxi/ozSrF14rkT1e8zz4K75Ezfsu2YAzIJRafAeGj3q8Fq9nXBO5GlQHhVtjyMweEaMScZ8o5QC59vF8TtwDM28zI1qdhGNRfwnBk+wwyaZZ52Vs2e+6DKbgWmsnaJ3bHiZ0S2I3hh1m3v/7yq+f731lZdnz+B9i5VVB6KSiM558Y3U8RjIcyPVkkw64diG7HibRW3ZPcDlKzF409yWGDU9sLWKVBXq+2IDGDDyRRE/oz0n/PYSU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDoyoagrww/FWo5trHHJP/vUj5Q13LqYtH0JoFDQQuY=;
 b=sw4xaxLecxCg2ZQvYmBqHgaaUNZnaoFTuLXWOBKBNWpVaa3gT72bLhLTVCFfj5/0E5YpgX3qmK9EWYCEAoX18t80EmroFyZJLLa7b7G2cCTw5/qeGzsIqwCLaf1lwWjV//aVkuyU674YM972G6oixWpjVN4JJyhBH3++yG7lXLE=
Subject: Re: [PATCH] x86/mem_sharing: fix uninitialized 'preempted' variable
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <b52103fa0c7450735586b8576b8070409c86ea24.1610990339.git.tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <af5e475d-b55c-0c25-c0b4-717eac40b6a8@citrix.com>
Date: Mon, 18 Jan 2021 17:25:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <b52103fa0c7450735586b8576b8070409c86ea24.1610990339.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e662fc99-e20e-4b3c-ed45-08d8bbd6118a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5265:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB52651023DB495154896369CFBAA40@BY5PR03MB5265.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hr+u+OO1LcZzPStjcy3TUAwfu+XG2GCQ4FfBzCtE6TauXOFXz9io/buqV9NTRc5qZvhwAKJnKUey2DYrZOKhHXeUr+DKrbm+5iQPWmhLk/zIBcf/pikJ9WTvcZFDKeOsZy6seNfJXhMRv2rSLqcix7MMScJ6Lmn23VFOoDF6omFjRi0LUs44pzj81cVJVcDNGF3tNFhHX3x6UOFiaqJ8a0MEQWCXgYRhDXlTxJ4iQhMdBV3piZtnfEloIorl3iY5gdBQrgF6CV6Qe0L9ToMWxxifPV3S+ObgK4m9T07J2j3TyN0HGH5+l4mP+VNQp9SkYsYNGZGtLoGXwwUh2UGXeLsW8WA24gbv3S55xeZGjTZ5eKSip/ivqqrx91K7Idv8H7R78iPa6ldk3caqECVrmyy4SmVKt/rCCI47yp+e9fchFttDTy3GyPlah/iLpDpSoTeTayjKB1Wr1WXUS4/0gGLDzDTYS9fXlouMDzniOBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(36756003)(16526019)(54906003)(4326008)(66476007)(4744005)(66946007)(53546011)(26005)(31696002)(2906002)(6486002)(2616005)(16576012)(8676002)(956004)(5660300002)(6666004)(31686004)(86362001)(66556008)(186003)(8936002)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UW1YVW8xMW15d0VFVSt2cWhPUmlPTDdrSFpKZ0k2M04ySUZoMzFXa1ZWMUFi?=
 =?utf-8?B?anRONU4rSXhwRGRvaXlxbHBCdjVTL05ON0pZbmZRZUQ3d3pLTVNodmg4OW5a?=
 =?utf-8?B?SW9oNHEvUlEzNkQvQ3FORTlQVGdzZldYYkF6VkRNdVFJME9EbTdCd3B1SXBu?=
 =?utf-8?B?cEtQZEVldTRPOGc3bGUyS2RYaFV5aExoUmFjbmdxNzRpNHBBWGcxaVdld1NO?=
 =?utf-8?B?NGJZZE8vdUh2RmkrTEp0WGxUTDNnY2RaQm5Rbll0REM1Ky9idk1RdHFlcGY1?=
 =?utf-8?B?WmxHVDNydURmMlRSbGE2Vm5JZ2xLK3JkY3VPeXlEeG5JbHNJditkZ2xOUDRN?=
 =?utf-8?B?T01YYTlheGxhYm03MlQ3azYvSk5udlZJRUEzakY1ZjdYREdmVXV5WXA0akJi?=
 =?utf-8?B?bzFuQzc4K29WYkx5UlpNQWJiakIyTUkwYkt4ZGFTaGlvY2ZCUjFuRTl5Nml1?=
 =?utf-8?B?VkpYN3B5SXNZSzV1VTNZTmgwNnVyaDQrZGpaUnFFUDhEYTlWN3R4bVNoNXR1?=
 =?utf-8?B?Y3dTbEhQdDhpb0QyTzlRK0l4ejlHNkpsSWZpKzZUcDhvdEh6VFZOalZrU3I3?=
 =?utf-8?B?RWswYTkvTUpIR0craU9RS2lZdExvSUVEN21UbUFsUE1lenNFNzN2clRtK2Fy?=
 =?utf-8?B?ZkdFV2ZSOVhkczVHV3c2VkFBMWVVVnVwdWcyeUxmdHB3MUlYWWR0cEVjbXQ3?=
 =?utf-8?B?TUhDeE5hcDJERERCYkVKTE5QbmJCTi85Q2NSc1A2OUZYcWY4UnVKeVJ4T0Vi?=
 =?utf-8?B?UkNhaGdoTkRzVjVKUkZKaGpRMm9EMS82ZlFpZ1llb2hFd3FoTUJ6MnNubkdj?=
 =?utf-8?B?UTJiQThGem42cXBvL25uUnRmM2pYandaNWx0ZWwwZDJYWjJZSXFwODd4dUZu?=
 =?utf-8?B?VklIZkJsTXNwQUpQbHlDRlhSMFVVTTNDTVhTdUZNTFAvbUZBWmNqb0RBN1dX?=
 =?utf-8?B?V1JiSzNGd2NHV0JVaU5XWEhuRkZ5b1JPMFRrOGFkc0VYenFUdEZBaUN5RE42?=
 =?utf-8?B?QVQrYzMveXpCWStzVHgvNU5NQmdRN3lXbHJNTEZMWVhLL0JyVVJWSmh2bkI0?=
 =?utf-8?B?Y2pJNDhRVCt3b1NBUnhSeFVvOHV6ODNoSVhhYU81UFJrQnRtT2ttQXJmd3NV?=
 =?utf-8?B?a29wakdwUWhoc0Vqd0ZIQXFoeE5Wa0pnamFkVFdpVWowWmdoc09XYzV6UHhY?=
 =?utf-8?B?UGpXTEpjT2l6eHBzQXRrSW9uTkZuUGxTeEc5SFZLY2c5Zkk0NmkyeGllUGhi?=
 =?utf-8?B?UWpFZC9BdG03Q1FvSmczbnpXNTBUWHZrT1ZCSlN6cU9Ic0pPK0xwbHAySU8x?=
 =?utf-8?Q?ueSHDeMbjyaLCPtHad48VW5+l5VE5HHSzH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e662fc99-e20e-4b3c-ed45-08d8bbd6118a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:25:36.7646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJH3s8Ke2RRGIRTkGEWfHgycjLQxGO5ZsTNfw5Ti14y8bz76C5/ZHJpcTFjmkGkJN8pZwivJM4sbLezpZkMBp3/n5DfyUYBnBK2u9+EExDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5265
X-OriginatorOrg: citrix.com

On 18/01/2021 17:23, Tamas K Lengyel wrote:
> UBSAN catches an uninitialized use of the 'preempted' variable in
> fork_hap_allocation when there is no preemption.

Fixes: 41548c5472a ("mem_sharing: VM forking")

> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

