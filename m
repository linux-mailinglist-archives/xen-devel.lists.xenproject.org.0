Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D362FCF44
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 13:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71357.127686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2CIK-00077g-8r; Wed, 20 Jan 2021 12:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71357.127686; Wed, 20 Jan 2021 12:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2CIK-00077H-5T; Wed, 20 Jan 2021 12:09:04 +0000
Received: by outflank-mailman (input) for mailman id 71357;
 Wed, 20 Jan 2021 12:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mPL6=GX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2CIJ-00076y-FX
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 12:09:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe96fb6a-b6e9-472d-b226-8e45e5b6438b;
 Wed, 20 Jan 2021 12:09:01 +0000 (UTC)
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
X-Inumbo-ID: fe96fb6a-b6e9-472d-b226-8e45e5b6438b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611144541;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Pg0enwAPHoR3A0oEpEst/O7/i+rAVoz5/VCu03gHvws=;
  b=B5Yyi7Y2x5AYI4/1RvpP7X73tX17K7N+GyLPSK+I6t8Rl22eyVE6zZ3w
   O8nh0IDmy63+w4AvoEb4Xs4Obz/FAIbFWTwRhmEhJt6N6/jUZro5yELYp
   31cFIuW/qFC2EnthH/4nz6uisTEbTrEDKx6VtNwU8By3my/7E5vRhGdPN
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DjoXxdC7PQnU8F+d6P0Re+rtcbsAzVGK7fB9b0tZ+IZGusYBriYNRT/TELdzFmrkZXDS0BX4Ni
 GsXhM/vlbNdnBkVheg5q1TtFVko260Z3SsykWswm4/R81Z/TM0nqc2RYCEPl0dqMsYntoXXams
 gKYH2C7DT64MnfDWRqmmwb+df7AZ4XB6aAPGutgaOKsneOgW3fMb9T9ix/lQE92vkP5lBT16Ea
 YRf5j/6xaFALY+VsA225Tc1wnLF6OFoPqN3dyfR+Pc+8axO18ElY4FgU0SdyhQWV0gplVi+s8V
 N5Y=
X-SBRS: 5.2
X-MesageID: 36760603
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,361,1602561600"; 
   d="scan'208";a="36760603"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsW1XGR6c0j3zcb6sBTPYwtE7OIw7wEwgn7OQF+bI/HfRW8T7DhOtMNhVnUQTUse9tSVptgONmeJB5cSd3vLiJ4k91yr9VNDTIepIOd3sJJwkQb/5Ht9ePc+wov83UpHO5Ea8HZBoM6FQBKQuWV0xRELiBGN2RBkG1hkpACBfJHq33Zz3MKR51Tw51D+r6VX5aDuE0PkJvzRdTwhbeE5ZAHqdmUuZKJNNZRCMmUkUVnHBa643uv1FJfZuyFYMuj3F6Yq3lyYbvGqOoOR4dX5eswnhpaMOhCndDWUa9PkO59PLqtCQNWf82DaOUGzv3WDYHXJK9MRFJ1z6iH1EpVO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg0enwAPHoR3A0oEpEst/O7/i+rAVoz5/VCu03gHvws=;
 b=hzJ2Krc+/5MWokZaOsHwlUIWeTnlfX6tLCCc/kSd8C7yj3zg9kIGkpCaATFcG0flczKGuqRZ0BDhA1v78zMe64lHuuY2lmlumbvwjjSZokFK5t5AcelQANHtOjp7DTbJBS/NC8bPqLoj2jgxKrRR3gBgazno5sDu8FZYFWIaz+8VMIkOwQ0Cmkd8LlJ+Ucv9k45o0TBI7o2nk1v1tcQnZBgvGQ/oqErNi9lVWc0PzvkmKnyRzBTo+1JebiTxqq1qUrTPUPfKpvJb8qV5Ans36zLwkqFcyGqTXRD+8jN/404lkIbqpPRkmaxpJpDI/GfGDvCOtkB0TesQkF5tzmYWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg0enwAPHoR3A0oEpEst/O7/i+rAVoz5/VCu03gHvws=;
 b=PdAVa8TO9/+KO0XwsRd/rBI3ckpl3exwReSiZbTbfk46asOgIglJArrv4Le5spjPwL+7OQkhd1u/MA4laYvxh6X3kNZAadEpOI9LNHyIC0e0IzdxyjQrwlaa/WinJ0n5tFwcpIF/hEXI0T9aOphzq5jFicFCTg7IQbqMqIwzLtU=
Subject: Re: minimum gcc version for Arm64
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f9872f1e-56ea-1f01-1141-0096e520e9d8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <999a3a65-fe49-c508-3c68-8c074974baf8@citrix.com>
Date: Wed, 20 Jan 2021 12:08:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <f9872f1e-56ea-1f01-1141-0096e520e9d8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0435.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7bc014f-0c1c-4273-4649-08d8bd3c294d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3542:
X-Microsoft-Antispam-PRVS: <BYAPR03MB35424859D1C256F5A519AADBBAA29@BYAPR03MB3542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IExPCEhCXCcvxBAXxSh/rmmb8ShVYgOyn4dTGpBiJWw6jz8xUwEApDpDxkxSUMgslGpddUj1+OpoDLemB4wxhScppkVTKcGhnzokTW3svBsahoYZbwcgTG1RaOuovpvedqHeyCn8XCZMy6qwRhYPYvzGuWxOifRCFzs/X3jVWerh+gzCpeLiZdrkcbzB6lESS4fVT1E/dE9UO3yZbu4qzgDxCDYzZ2djNPjk1MZDsGJu15KdRaMZZzBrLTkRpK0nyFBaMHR1D5ogg0CQL+dky6MXp8NPNsHjFCelknvplUcjkb60gA5ec+1DIwxLILMiZU1YwPkHWGuGh9JQUeMMz29cGa+QNfdpgUIRNBqcYT10yc0lPM+1fqcSDwJGhTKMUcY39StMw/3ZYD72NQVzEz+0liKnYb87MzztBk6y2oRAL+GDO3C82eYlXYm79p6R7lWXM0vl/HSqi8Xa1HsM6hJRrhPOLurtSQEQHJ+4YmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(6486002)(6666004)(8676002)(2906002)(36756003)(86362001)(31686004)(53546011)(316002)(16576012)(4744005)(5660300002)(956004)(31696002)(478600001)(8936002)(2616005)(4326008)(66476007)(26005)(186003)(66556008)(66946007)(110136005)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1BIenpjeEdQQkNvQjRQY3BGdUlQMGlIVW5xQW5iSjdSLzBoc3ZKU1owTGJX?=
 =?utf-8?B?LzNOZmViWjZWYlM1VXYzSHJJZFJXcXZHV29zaytyTHZlTGxLWXBuMVVrYUpr?=
 =?utf-8?B?V2JPWFcrOXZReUZpb2VCSnkwem1Bb3BseGhvT2hEd3h3bHRESmVyRGhRWThv?=
 =?utf-8?B?Qis1VkZPRHhzUXE2K29UcGZOaDAySGlpdnFHOHFWeGgvYUwybW5EQ2dxSGtq?=
 =?utf-8?B?bkQveDFtUWwwNmtYOEFUUnRFOEt3aVI1Q1JSZTJsbWMvMklEMTNsZElkUFZM?=
 =?utf-8?B?NUJQbWVTNHI3WEk5VzI2eFZlTFJoNXpjd0ZVM2hvUVB5RmJSQ2VTdHU2dUZ5?=
 =?utf-8?B?Q1hvbDVoZXVydHhTeVFhUTdlV1h5R3ZwN3ZJUkRTblBLbHJnUEcxOCtGdWRj?=
 =?utf-8?B?RW1BTlMxQWRDVFc2bmRFaWhCRmpFTmFEdWFFSkdTVC9lMjhycjhCRVFpRFBz?=
 =?utf-8?B?bjIzMWV0bFZpekdsSndxWlhYSGdPU01FWmlpRFdKOVVlTDFidHQ5NTMrWlgy?=
 =?utf-8?B?bXRBU1RtWFQvUjFZV0ZpTjZTRU1ObjRyNXM3dFZSay9iYXgwdUh4RnRvN0hJ?=
 =?utf-8?B?Y1VYbXBFK0lxTkNxT2l3SFQ0a2dPT3JScFVwRmc3aW9JaEo4a0ZkczQ2cy9p?=
 =?utf-8?B?TWszNkhWOGlkNWNhRHpVRlBLdXRlQXV5aVZhSy8rQXpDT2x3TlNJREpoWEpS?=
 =?utf-8?B?VFlveTNqZFVjR2Njd2ovTlIvdWNrRHFVR0IrQktwQWkwUUtFakZkeDR0Mys3?=
 =?utf-8?B?ajQwcnJVckt1QjFNVWprYWI0UTIvVDNLVHZ1REtZRXEvVnZLRnFqd1A2dVRQ?=
 =?utf-8?B?WGxtWWNRcDNpRktKMzc0REdLdjBsRVZYaHI5MlFoSUhFTHlrYU1OS0FiT2l4?=
 =?utf-8?B?Zmg0Qjl5R2x5N3RHcGF6VlFsa2x2b1J0Y1Uyc3ZjUVUyLzNLNUhrSXkwTktI?=
 =?utf-8?B?TU5ZUjR5TGtVWkordXk3VVBYN3N6anVrMzVXRkpxTGcxWllVcll5dWQ5ZlB1?=
 =?utf-8?B?VjRZQnZHYThNUUhHQWlqdVE0NHZ5ZmQ2Y1RQZlQ2c2J2bG1IOGxiSkJnOW1n?=
 =?utf-8?B?OUh6YS9yUTgrejExbmtRd09vZWJDbkxxeDVRTTlRUGpnVnpaRFU5OCtya3dm?=
 =?utf-8?B?ZGZjV1djV1NMcURXU1Nad256emRDaEYzZDR4djdBRHUzYlVmMi91S3IzZm5K?=
 =?utf-8?B?L29BMFhTeTRzcEYvYUlXQjdLelJmVTJVRnNGUCtYSzJWREFnWEdYMFQ1aXVO?=
 =?utf-8?B?dDNYV0pWWDZOSXhKZ05WOEg1Zk5vV2RzbnZZZTNpaTBSbyt6czFFRGRGa3M1?=
 =?utf-8?Q?MoKOV+0TpTaeERmkxbZa9dqizwY447ELtg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bc014f-0c1c-4273-4649-08d8bd3c294d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:08:56.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JteyORw119uimsrX7gTdFxjuNtlI6ba8T34WoWwq7VgsB6o89/Gbzms5rGMQleE+SlDV0f1w3w/bdOz8/Z1nFvpvyo3iL6bK4nCWFiAmpvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3542
X-OriginatorOrg: citrix.com

On 20/01/2021 09:25, Jan Beulich wrote:
> Hello,
>
> by way of monitoring the stable Linux kernel logs I've become
> aware of Linux commit dca5244d2f5b raising the minimum version
> to 5.1. For Arm we currently document 4.8 - should this be
> adjusted (and perhaps split for Arm32 and Arm64)?

I pointed it out on IRC a few days ago, and Julien said he'd look at it.

The thread on LKML also found an x86 code generation bug affecting 4.9
and older, so I was considering finally doing a similar thing on our side.

~Andrew

