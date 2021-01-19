Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77362FB5B0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 12:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70291.126100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pHm-0005XJ-8a; Tue, 19 Jan 2021 11:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70291.126100; Tue, 19 Jan 2021 11:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pHm-0005Wu-55; Tue, 19 Jan 2021 11:34:58 +0000
Received: by outflank-mailman (input) for mailman id 70291;
 Tue, 19 Jan 2021 11:34:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1pHl-0005Wo-35
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 11:34:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2612120-815b-4b5d-9657-f6a729bd5a43;
 Tue, 19 Jan 2021 11:34:55 +0000 (UTC)
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
X-Inumbo-ID: f2612120-815b-4b5d-9657-f6a729bd5a43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611056095;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rp9GOsTaz2hKd3Qf9mwd9V1231b+ECmismNn+sx425o=;
  b=HVotAXUZhcDqH21G01v8+M8+Eb/sSJ0WjjqYIdcRHTctM0QQgzGnWeS7
   grf582sqRC3p5ik9zZMT/BW2YAh3/Qh1zQ1JhErq1OKTdBQSmx+ugawyw
   q4MhY3QpwK24KIOjDIfKKOlU1jdMDmAGoly5LujmwxTXLCQYJ+wuVi5hE
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Hs359wYEyyABCrUMdob4bAkQ2ie/542qpTMbGi2l0MKVmY8EP1uCH3cW6guMU6HoZIDAsNRS7H
 g/GzeITOBUHkRWalLlpPU+v0OM8q0PDMeYxvmvryxjzNsYyKfJZ0/climNqu1XQWkxWaYumSMf
 EitcQh5b45qjLy8QQNwaNs0JUI9ySdiEgesTw9ptec72nwsspQJlA9V+6qMYXyHa8KMxguqQwi
 8KN5eGiieS8N7jmGaNC++JDVjLowpbs9CjFB/aC55ciwuktek9yWtMF9dmVgLVGQLBb1N12cet
 KAU=
X-SBRS: 5.2
X-MesageID: 35736792
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35736792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI1Ocv8h4+OUZg32GpNXgITg2DP0ta/GfIURBmmR5eABau5q+4XOGe7TYzLcPu6kaADdZuv59CjU6OXp7uqi/Nb0oPrO26q0vJo0OGAwB0jNo1p5UKXBHUSSgRz17U04drsRoYUKLE5hjQZxHXBkKcsKbzaAHrenU0Fb8qCUEr7XJ67XjOElLcmYaDBSYQn/iABNtZmHaQ193o4KkfNsnJuLmMPMvkqNzsIycMAiCqwZbodCjhC2Y+aNPiasvrslSDMn55vv6GuVlRm9iuRJBXhzVNkOfrZkaL09fvO45VkilsBqWUgcRdXJXTlJ/iCSko1RjVhMut+/c4sq0D3s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp9GOsTaz2hKd3Qf9mwd9V1231b+ECmismNn+sx425o=;
 b=b+Ys97LiXWPGHtIb3AO6FyAae6dMXx05Tk4q93ZtbnjtN0PbfdIYa7kdRjKOOU5j/kDSan+mVHsj0qYRvoUZwt1M69lXXftPudgAe04MaY08FqRhz6nlgu352dsoHXT1F2t1QKVItRKkDZdjemsfeuPHjypMVPC3+rLjCtMOFPV1DxWzPUUd3rmXRLO9T+hthaQCH7tbA7c5yB/aIpCKzITLruhfPOBbupFZhis+zPNsasw+6z+IWWy1H2rCGyY3BGv3A7GsJ1i8PT7b+R02NvWx6A35NINCb4AVYUu1JIIgF8oebQnZALdaGHO4wunUyBrCpENnKmSacgoOYPKxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp9GOsTaz2hKd3Qf9mwd9V1231b+ECmismNn+sx425o=;
 b=ElGi8SSEXInxwDP+DNjbWX5WnymsRWbdQyAn3mdBgEbxZk0NJlsaBl6NyVvhMJGlm3kC22+BbwOGpzIq31OwmZ6JXnWYlJXuGttVAK6vdbj+MwiPmk5KsSSuAeASrN5ofyGwS435qY2zoXK5L+AFrxLozPg/8cXj2B6/ZLeLBYQ=
Subject: Re: [PATCH] x86/mm: Remove cascade damage from "fishy" ref/typecount
 failure
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1ffd1329-a581-0384-abea-95761c03ad81@citrix.com>
Date: Tue, 19 Jan 2021 11:34:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119094122.23713-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 177f10d5-4548-4ba2-ac85-08d8bc6e3b3c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4408A5BDA0071DF164EC601DBAA30@BYAPR03MB4408.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NoIBMmyEp4bboK+T2KdNVGfOYsflcBjcr++NmyljYpUs2QFI8APVf/Mbhrz0XQwNmmHr8p4fQfbsEIZgtQ/uPeOl+GsVZkspn65Z2amLczrUHl6SHIIWok4uDMUghZky5kRUP6DElMofvpu3wPPy/RtbCQfwtoDqV8sJimr+rmAcp7IXZIB3GWYAfiPlsFNqvBETYmp4IMknw45pgTnNq5dZHR8DyjhA2uMHmj8SZYu0hEKPzNPkn7ebMYO6M7MYdl315watGOq/qa6PSFIjZTyqe5PrMExO3BgcvNe+NSuX751hgdOAHJs4TFaMP4HY/TGe+nuPdLhJzvoq2UaI+tAyyzqT5Wbr2djzGkzXXntwTCZIaVqnVp+octY1YBv29hQvXV+p3mzpfGpk1jTWwoz3tMac/upPNZJRq4dvKBdPMPkEswMskjj69EoLVSlnhg6a1SK0Jg2nF9qrzqhd9jNbnSZBobzoDE++tgwf+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6486002)(6666004)(54906003)(66556008)(53546011)(66946007)(4326008)(66476007)(86362001)(4744005)(31686004)(83380400001)(316002)(16576012)(2906002)(36756003)(26005)(31696002)(2616005)(5660300002)(16526019)(186003)(6916009)(8936002)(956004)(478600001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDVXcWhqd3k4YzVZaHN4NDJzQVE4d0ZncnM0WDk0dzhieFFMcExFUXp2ZDRG?=
 =?utf-8?B?M1M3ZWNSUVNlUklhbnVHZzJsWFJhMEQ3Nm1ZK29JN2ZVMzdLSmtEaWtpWTI4?=
 =?utf-8?B?R0xvcllJQ2R6cDRlZHhqZzExZkJrYlo0bGNIeXFsRmxFZzdTM1ZsajdoekV3?=
 =?utf-8?B?MWJ5b2F0aVFiMnYvays5R3Z4U3NJMlY5Q3lCdG5hc25xd3Z4NHp4TTU3SGZi?=
 =?utf-8?B?TkxPVDVkOUdZeVFBOFhNM2NaWEFma1RzaWFydlZnREI2NGt0VFNEMmpsaG9C?=
 =?utf-8?B?T0NERnZmc0dDOUFuenM4bzZtaDJKTzF0NTQyUkgxN3FXQnRwcUd5OHZtU1E2?=
 =?utf-8?B?Q1BWMUhZSFlZRW9WVXBlTG9RcDRXTkRwVDN3Zm9vL25IYW1lOExHWmJjN2wr?=
 =?utf-8?B?c1JPSUlENzU2NzdCWGdNSlUzMXpWVC9IMWFwSjc1VHcrTG53cnFxcXA4RGgz?=
 =?utf-8?B?Zmc0R3lMY0JxT0wwZHpnSXowU05BWHhnemxlUWxKT1gxYys5RW9PZ0ZYL1dT?=
 =?utf-8?B?NE1CZXhCeEJETmZjSHNmZ0xBSmpEWUI3akN1b29tbXpCZXlFczFyVFY5d0lT?=
 =?utf-8?B?YUkzRjNmL3lSRkRiNVBIQlY3V2J4UUhaZkRUNWREZFkxVXpvL3Y1YmRwVmFa?=
 =?utf-8?B?eVJCbkM1ZnFmOSs1NDRCNExTUTJCYlBkMUdmNUdZS25rRDFkZ01FVmtmNUJl?=
 =?utf-8?B?TTQ5ZmlQU0pFM05odWFpYjk0SEh5VExob3ZnNlVSRVh5ajhrb01LV0EvN3Ns?=
 =?utf-8?B?ejEwN3RTUjlPZlIzUlpZQXpIRXVTMkVZUlRYMWM3bDVremYydGhxTDVhRzlX?=
 =?utf-8?B?Q1lWQU9WTEVzUnpCTFdSUG5xN1dxMFc2UC95dWVFQ2VQZHBUZkxhT3RqRGlN?=
 =?utf-8?B?WHh6Y0tNVXZwUUx2N1BrcmlWS2p4SG5mTzRuVFRzaUlONFdpRDMvbzc0Mk1B?=
 =?utf-8?B?OVFoQXBGaTFLWUhUaVZrQ3VrZUNTWEhTZGllZ1lRYWhCMkZ5QWF1U3MwSHpX?=
 =?utf-8?B?S1dmc1ZFTXpXcWQyZWVpV0xpclFlckxDNDJRekZUMkp0a0tLUXYxMEgzV1RM?=
 =?utf-8?B?TDZySlBtVWhhaC9qTXVnUkEybXkxQ0lGeTFoV2tFRFdBQVY4MnYyNmdtNGdL?=
 =?utf-8?B?ck9PWkdmekkzSTZSYUtiNmN1a3dTRjlsUi8vZGJWTTljQm81dFNHdFNlQm9P?=
 =?utf-8?B?VGEreWxQc3JOUVM4eDhmcVQxSmhKeE9vMEdxbFcwOFVUL2NPTkpFSWN0Q1dG?=
 =?utf-8?B?RVhPcWNvVm5JczlZVkFBOCtMM0wzTktUa0hwZm5zc2w0ODE4M0YrV2FVQmRJ?=
 =?utf-8?Q?QGZp7FAEGEgnLJ6Sl3n+OBJPiKDlUw/y1V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 177f10d5-4548-4ba2-ac85-08d8bc6e3b3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 11:34:50.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iajgcysPtJJHnUtc+iNKAlDvHtn62xKt9sXs+UJPMpa/7Oq/JNjs1sMic1s3erEy1bKhxo1vsRUSFmmyZzcf/lKsMSli+YGH0s3syTphLrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4408
X-OriginatorOrg: citrix.com

On 19/01/2021 09:41, Andrew Cooper wrote:
> This code has been copied in 3 places, but it is broken and dangerous.
>
> For all these cases, the domain destruction path will underflow the whichever
> reference failed to be taken, leading to all kinds of more fun bugs.
>
> Crashing instantly is strictly less-bad behaviour.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
>
> I'm pretty certain that underflowing the main refcount is a BUG() elsewhere.
> I'm not certain what underflowing the typecount manages to do.

Actually, they're both BUG() conditions.

The typeref BUG() is in _put_page_type(), while the main refcount is
caught in put_page_alloc_ref() for each of these examples.

I'll reword the commit message, but the code change is good.

~Andrew

