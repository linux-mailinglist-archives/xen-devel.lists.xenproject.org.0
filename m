Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17FB302B80
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74428.133793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47TH-0004Qa-M5; Mon, 25 Jan 2021 19:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74428.133793; Mon, 25 Jan 2021 19:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47TH-0004QB-Hz; Mon, 25 Jan 2021 19:24:19 +0000
Received: by outflank-mailman (input) for mailman id 74428;
 Mon, 25 Jan 2021 19:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l47TG-0004Q6-4R
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:24:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4bb634b-0754-41fe-9e58-622828fe1300;
 Mon, 25 Jan 2021 19:24:16 +0000 (UTC)
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
X-Inumbo-ID: b4bb634b-0754-41fe-9e58-622828fe1300
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611602656;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xc5wSFuhGH33Ju60k26eEQte0JQWGLJFhem57G1bjLE=;
  b=ELNwDvDRhAKvL+X0FUX9E6xV4tUjwjE2BQhttAn8wt/Ydd7MQ/tSRdQV
   l0PJjSoQI7+tyyKBfZ0jZdwUbCPeJoKsCvMnoWc1kgMvYzVN/R0wb4IL6
   IvOi7Q2BJqBIBkN/llR3YzOFtVDfQ7Vhennjsb5HHCUnOwUeIvEr5wRP6
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4Yj2f9ds4BJ4pURJzXrUzv0G39aWbxdL7z+9y0tRk+4Iqu8gnekR4R3dlBIuz+LKZTjgxDC7UI
 jTWZQ16iSBAeyyyxfBJmU2WxyXpEj72fFeUPh1j8EUfSehKflYe02ngCRd9JUA6HxTPPy92Tpk
 P4KO5VtyjVdkqao5l8yjB3ppfgbiE9Wue/o3heefqn2qfl8p8Dket7rtAVT5g5AbExeKKLWl69
 ZbEMsqrRMDUgCa9ORJqdTiO+dy1wbuquXZnmcU/vK0ECQo4jhpL0zl9Xn7whEKUGiotbE/x9Cl
 hL0=
X-SBRS: 5.2
X-MesageID: 36022259
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="36022259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG7+CEwNelIhMeKriCneS0+E6bGXrGZkIlgb0iSNyEA85er2Nroe4wHykQJLDnTOvpEvd1QWEVexbjHBTJiZcrSo0ZP8b8KrJMGE9v7CuhOl9qxPEtObn4JyvAILF8TcYpsUBcgQ7mKohHVkEEsGvyHflEjD5m8fgwc+4GF3cDeCWlVRH0fl9d6ZT5YkF9yv88gJxq0D3F3fXaFO6bwLhbQdFX9bV6sOG9SnHgH9/XxiukNmiQX3E5cd2+wBUpeDpTC4viLco4YbFx5pJH312gUYZvLS3cc9C2ndIfNvgY7WVChtV7i2M9yInLKSPsy92xZFNHVWt/OEQ8X9EoewyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioQgahv3Zqc9sw6wAfwg2eFG0FqLvwRELHvZL3Fo4a8=;
 b=N45oNPK95jPhfIb9kjAlSCrmaGblR3lqxzRRYjqHvOsCIfVusyQwxV/XsEBHCjajueBgvW2wQ+DGhvJu5k0p5AdCk+pTaW1EXyuRYPawbQpeu05edZEtEBlwyV48fRetqf5mUOR3zFyV4mpv4q769wZkDwqlgIoNaBYKCdMLZjcuSaa3LxXJBY0yknrTWbRy5BTGB0LXGHmXbPvrgFr/1ZijISqBExeKwnhmlhmGV0rkb+T5Vu4g1/IRQHuBq+PNl4JG7OLsehOv3NqsUhj/xPnqDXyymdFxwuFbvB1pIgTf1sGNZ5dkHSHG+tdGbkspEgHT82AyV7FHwZ8ERyMpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioQgahv3Zqc9sw6wAfwg2eFG0FqLvwRELHvZL3Fo4a8=;
 b=WFxXFGCmBELdmz2KpdisKLRXroCvTCKIhTcYUxuMB4ET9AiNIp7n35yR2PKstP5JCAq2F9k5+h6Wo347wG1Ne/IVpFHn9/CgBFs684Gyj+CQtuXOz4/l7mUIknzfd+ADW4t/5cVgm7unWhxZtPQar+8NSQYAur/oRJTKjHaQAbk=
Subject: Re: [PATCH v10 06/11] x86/time: add a domain context record for
 tsc_info...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-7-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b781829e-25b1-2d9d-2cad-29ac551f1194@citrix.com>
Date: Mon, 25 Jan 2021 19:24:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e57a8831-d2f0-409b-551b-08d8c166cc03
X-MS-TrafficTypeDiagnostic: BY5PR03MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5126D841B574E8006E08D761BABD9@BY5PR03MB5126.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnpCmquEvBi/CPrUvwPIkyMIEdfT2y5AQPDKGoI9qsvW86fYl2NAMGkatxcbaEtLpzyZtEpRjwkd5k6ycBq5KnTrxdrH7TSn8aKMlQmiAZlWAQ8MakC6LZSvePrzYq/A5c9LE2D9ftkkf37aQcLGVQ31SW7Zl3ZOiuKMifDhIkZ5v9cThjl10fHz7Cy3yKKJ1bney9PmFbCx4HZ4OuIZIIZozOyp4irzKYpdvR7pmIuTM+cBWJ580QsmLnGCaDxm28L4OHGGgiwgouwkWDD4/Pv8fJJeBwioidkm0jqNT8IwzI4qLLTINhsF3Hl0VK3/xJXFBQTTYtgGvfhkHFQYjDyogqU6rks0Lo8mgMZ7sQ+XqGoCkQVrXECZFFj2USHnR+kCH9eeGQrh55RV91XrqePXL55J3JZoDwreiP2uesyLKB4qwkevoz1j1cAFmUN5IWArTPbpD8p/gE+JKLnwufthT1v+JyjH/giboS8zpXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(83380400001)(53546011)(8676002)(86362001)(107886003)(36756003)(186003)(16526019)(4326008)(478600001)(2906002)(5660300002)(31696002)(956004)(66476007)(6486002)(31686004)(54906003)(2616005)(6666004)(66556008)(8936002)(16576012)(66946007)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cm5LOVFlRnpPd1hrM3Y1Qk8wSGZCeXhrdDdnSWo4UnFheUxFeUJLMkxIaTFu?=
 =?utf-8?B?L095QXI2TUEwdDR0M0FrNUpIVmJCYjV3Mm4xakFab3c2SElFOE40Z3V6SDh5?=
 =?utf-8?B?a29FQjZHdWt0dmo4alVjQ2FTZnVUUmRzY0VOeFV4UUg3Q2c5OWpMY0tHcCta?=
 =?utf-8?B?U2h1Ym15bjRLMEdwdlNqdHN0TW9iVEZDUUF1QXA3eWNZMWhhek1qZEFWRW53?=
 =?utf-8?B?NmxUVENOQlZsMXk0NzU0Y0ZBU3czdG1HOTlmWFNxbnI5azJ5dHp0Z1RPamth?=
 =?utf-8?B?enBzb3lPbFBTZE13VDdRVW9uU3V1T3VMWjE0QmlLbmRUbzNPTmdpSEtpUEVo?=
 =?utf-8?B?S2VnV2FaNmI5OXZZUXlHaVZhTDc0SndXSnhnTHdKZjlRd2s1K3NoR0ExUnNI?=
 =?utf-8?B?YytFNXdUbFc5ckdmZ0Q3MGQyWnJqK3dzKzBCZEQrMUVkcHBYZG5tT3pVYkdn?=
 =?utf-8?B?R0U3a2JmUlk4czRCZlMrVTFEUitLTGR3ek03aEJ2enJPRW1jdWRDQ1NwYkFk?=
 =?utf-8?B?YnhHRGZCUmgzZ1lNYk5qNWllTm9PWm1haVo4L3MyZ29GYXVhdkpJUUFtSFhB?=
 =?utf-8?B?WlB3L1VJa1BKcDRITGhTZVVpY3V1WFpYeEQ4SE5kblFYbkU1TzlOZUl3cnlL?=
 =?utf-8?B?NzJsKzBCNWoyWkxXNldiQ2VMVStIMGI3YTJ1UVFidGdCQTgwenZ5UCtpdjN6?=
 =?utf-8?B?M2hMUGRrc2NmT3VZYzJneXcreVFwcGlnTVVyZmlVZkVJZTMvbE9qWkh0UmZT?=
 =?utf-8?B?UG13cjJ5d2V5L1ZaRmduWmxtR3AwK0FmZEhKV3dwMVY2cS9zMmQ0MjBHc05R?=
 =?utf-8?B?OUxHekhYNXRoeWI3ZlpHY2RRMkNGcy90bC9WbE5xek1laDYvSWNSdFFvcElM?=
 =?utf-8?B?MFBacC9WYUdwZVYyVlhsZDJSU08yRlVnL2p5azFBeHdxZjRlTkJhU1pMbVJ0?=
 =?utf-8?B?RXpOY05ldVh5UGw5alNqY2FjRWhMUmY0OXRPZlRJRElOWTlIa2lzQ1gvdnlD?=
 =?utf-8?B?VVpPZm53cEVEbTNzeXlleVh3UWpQYmc4UGVBQk5WS1JkeFdQUVN6ZVZlMU9o?=
 =?utf-8?B?SXJ3N1Y4QmIxNE1qWHlKemFtejd5cmtkYjdadHRVcURYVGFjWEFrR1dhQVBk?=
 =?utf-8?B?dHY2RWdyek9ram4zRTUzM0pFT01IZU9KWGloZ255VkdDNE9FS0p0eHVzTE44?=
 =?utf-8?B?QjFCcjlEWS9LVzVTOHZDMDU0TGdDNmZBeTFxT2xZY0dveGtSd0RyQ29KS21i?=
 =?utf-8?B?T2doZUdUd3NaY0hyTzQxaEZhVXlsTFJ2ZGg1N1NzYXV0YmgvUFpvZ2xlNStt?=
 =?utf-8?B?NzlBb0FySWpYbUdDdnZxN0d2ckF4TGxQQzJxV1pSK3NVd2tDeUxHNldTWDEx?=
 =?utf-8?B?VlE1bllyRUFXdG9UUEFCWjdZd3JjenJSa2IzTmNCT2FBckJuVWQrTTBtdXZy?=
 =?utf-8?B?WmVhYzdoUUgzTThQVEJKeUNxREd1RS9jUEFkdVBBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e57a8831-d2f0-409b-551b-08d8c166cc03
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 19:24:12.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvDnaUEFwtHJISafQHcdJaoyiQnMdGGzoKgh7wIrWn5sjsx8Q4sFRiqdHnbKp4MsUbUz46z2zBqlw3FBLm94MHTKkpj/PdYZ2aqPn3LdbZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5126
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> +The record body contains the following fields:
> +
> +| Field         | Description                                   |
> +|---------------|-----------------------------------------------|
> +| `mode`        | 0x00000000: Default (emulate if necessary)    |
> +|               | 0x00000001: Always emulate                    |
> +|               | 0x00000002: Never emulate                     |
> +|               |                                               |
> +| `khz`         | The TSC frequency in kHz                      |
> +|               |                                               |
> +| `nsec`        | Elapsed time in nanoseconds                   |
> +|               |                                               |
> +| `incarnation` | Incarnation (counter indicating how many      |
> +|               | times the TSC value has been set)             |

It is how many set_tsc_info() (hyper)calls have been made, not how many
times the guest has written to the TSC MSR.

That said, it is totally useless now that PVRDTSCP mode has gone, other
than the fact that it appears in guest CPUID as an approximation of "how
many times has this domain been migrated".

I.e. its a number you'll want to actively squash in your usecase.

I'm not sure whether to suggest dropping the field entirely, or not.  I
highly doubt any user exists - IIRC, it was specifically for PVRDTSCP
userspace to notice that the frequency may have changed, and to
re-adjust its calculations.

> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> index bccbaadd0b..86881864cf 100644
> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -50,6 +50,7 @@ enum {
>      DOMAIN_CONTEXT_END,
>      DOMAIN_CONTEXT_START,
>      DOMAIN_CONTEXT_SHARED_INFO,
> +    DOMAIN_CONTEXT_TSC_INFO,

At a minimum, this wants an /* x86 only */ comment.  Possibly an X86 infix.

~Andrew

