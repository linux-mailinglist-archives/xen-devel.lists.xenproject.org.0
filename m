Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2F3BF9B2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153044.282737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Sl5-0000Dy-CT; Thu, 08 Jul 2021 12:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153044.282737; Thu, 08 Jul 2021 12:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Sl5-0000Az-8l; Thu, 08 Jul 2021 12:03:59 +0000
Received: by outflank-mailman (input) for mailman id 153044;
 Thu, 08 Jul 2021 12:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1Sl3-0000Ap-U4
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:03:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92476172-dfe4-11eb-8567-12813bfff9fa;
 Thu, 08 Jul 2021 12:03:56 +0000 (UTC)
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
X-Inumbo-ID: 92476172-dfe4-11eb-8567-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625745836;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fQNIrLovho5rj/E2P9miQoP1u+BXyeC0t/sYsADKQLA=;
  b=TBQSCACuJnGl89v9zUjGX/QvWzjJdF/LHq1DUyjNEHeQTZV9XYhkHlhW
   sC3yCgYlYrVnciEmGAuE5AxVLhA2PQwXhpxClFqcgkYPGePNSwTr7+pTj
   i0/dHBFGjlLdZGyaAYQzTULJkNmyK7+zrCl/O2tzrOTAN7c2yO35tKDpA
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qteArndRXtg5Ac94ZN/GQ+AvMg3USCmLR98hfKX+z3En7loXXcvoZq04Dd/2XGEiXtYnDfN0Jz
 kPo93ngrilOPt9wpphd3ALWwv6VdI29YFxP0xkhHaRye9SzZVllpk+PC2No5uZYBJpwPqlNfyP
 Ye3USqaK5Hgqz0ghoezIg4zqGdRuvNyVy+BftRwwBPnaN+lXmv4MK3DVqbdPyT3FuxF6u21HXH
 CPvRB0mxF6ckAxNKONixQcIx7LJWARkRl7iesVGqoPr40NMhYZaSioFhk+XdT5l9vuKWQ+q5jI
 Loo=
X-SBRS: 5.1
X-MesageID: 47534457
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hl1656qSrcxUksfHKQbfSF8aV5vHL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHNXguNbnmBE426gYzxLrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh6YwGPnayGqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD09jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU911rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1jkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMsjgYdq3MkiFX5uYdM99HqQ0vFhLA
 AuNrCc2B9uSyLZU5iD1VMfhuBFNx8Ib2S7qktrgL3f79EZpgEh86O0rPZv6Evoz6hNP6Ws0d
 60epiApIs+O/P+UpgNc9vpYfHHQFAlEii8fV57HzzcZeg60jT22sbK3Ik=
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47534457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vwr4EXNcbzKjnZY2Fh4QaAt8//bOcgaNk6ZMkD4XkuESnYcEysZqAl0ZSOVG+4bIsQba88453gocGlkR+ZjRm8ltGHCSO5NamAddRaE0aztGDEepVeYH2M6vdl+ymWrSMUD92bWH5NALu5wMdEpxeGT7lFGgSFQkCxLuDqW2hFoEbYf1Hyv+yeZOUZypWvwuzucak6NYt3LkSbecu5+1L9SX7TIW3h61E6+BwENn1KqG32GXoNqDkdjWwLn6pOB+UPceY8X7oBQJhJ81Hw21YxGTzgCUN4/wrJdzV8NnF1PcwCSFraG1VKlJJETW4Sz1VVXZwC5hn2QEdEij6OQsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLIjE3swPEJWZE+a7NZ70qvwlGgS8FnIvEOnNLpweRE=;
 b=DHvxvWyB8+A7nkAGaggf4v3REGIS4IBQHe+5qIdLq0W6PkSBJL8cKISabBrrks3ibhZA4s+X1/R16fS72ZBTh1i0sIntDwPb+CeRngW3W3iAxbJIVzRzz7w2pXB+RGHWSo46p9AeJLpk3MwOvfbAiyDZ3s7RYmIY4AEWhU5zsbzSATJbEPA4Pt+HW4i5fH057Y2LpdGzq9tu8OpheywR8fw5xWWkia2tcOZxmQUENSM5JJKxpNCf+HgQitUaeRIWYwAT0SaM8m3t3KMxucsK98aqnnyx13xogB61gvXC/HNU0DuWWrzyHEY9VJT/1D7x538QhPep+tUA/3ZiSQRMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLIjE3swPEJWZE+a7NZ70qvwlGgS8FnIvEOnNLpweRE=;
 b=DaS0sQlgKyZLIAE0dIUXCXUq7hIo41X+rGjDdvTqL2fTJC8EzKIEX6MuAN38Frx7v1wCNMg/+6hMaseuLJgSOkjvC/rMlmb7C2T8eM7Qxmng0IzeASV5lR2vGIq4Kbn+hyM3TzszfPKsSNex0DFqBuxSNwb1wPP9n4xvDZedPYQ=
Subject: Re: [XEN PATCH v6 03/31] build: use if_changed on built_in.o
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-4-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9bb04af6-105f-1040-d71e-799497034f2f@citrix.com>
Date: Thu, 8 Jul 2021 13:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0116.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c6e834-ee49-4257-6e64-08d9420874f4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58871AFC64780CB7F97EB8A3BA199@SJ0PR03MB5887.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XhppEmvWO2UWx3Xizm5uCjSfZ3fuDlqrOPadVu4eqzEVjCUWcuah9NDPCa1eYs6Sy3w6ZU9Hr4HPgdHNprb+52z964ZiXQPNrLYdBKE6rHWKq27H2HPpRjaRNBw5IZhG27E7jp13ZA+cy6nU8GO1C6JKIEUf2X5pCKC+DdDwTCQD4BINs2PAhZitmux4AeAG8rKN0QHiFw1BjEOUy0omAVFox8VtGYv4JOb9HU54SNbLW0SxEwjECMCI/WUYuCtTAk9lubA5n8LAySni4VjWGjRps7Y1z28w1LWVrvsS1UabfGJBuabRC4cOCtmDEwWGHY4poHx9AgvFBWpJ7h0klagZJorFT1N5e25EhALiWGBte4youuHBQ+SdO16QfilEGM6TlroUqpZaEuqWJ0LL07qWsR/9oXrqTa73QnEJRng9pEhWHD9TVlsCPJYK3rByjw9Hc0g/oxlio0oLXmYxkhJXIq3UyZmXBd692LrnypYneOxIsCFF14HWe5CtMCvgDgRN6pqbvbDCnyMs2OTSdkgyDzIHuymfCzQmlfe4HQ1b42l76QLyLaR+ZDq78pixOi7ZsF7jQm5Pmo/2mTMMssN1HudxYtLkHGnJepAvkTXhzGfgcsS3vpeovQHvl6kLNLBiepHCu3bSXKeEjvojFTIbhO1XgVPv/s6di636/Ejzp7szfF4CuLyLavdbF4TPUuoYJA1cFyBKyi9Cgtr0vdpoQbxtC+YS/I2ad9HOaHaU8K1TqkFcd8+y4SMO0jay
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(8936002)(16576012)(31686004)(54906003)(8676002)(4744005)(6666004)(2616005)(316002)(478600001)(38100700002)(4326008)(5660300002)(956004)(6486002)(26005)(2906002)(31696002)(36756003)(66476007)(66556008)(53546011)(66946007)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGQwOVF5d05RMWdQNkhiUDBNNWl1alFzQUdOYjFsYjlOQnE4OUo3SjRQMi81?=
 =?utf-8?B?OFpKNXVjR3BWc0NRQTNuaDFtU25pVTVjYkZXMGJGYXgzeE9LQWV5cmRzWTND?=
 =?utf-8?B?ODVGZjJZVWpuMjlYeUZtVExrT2FENGl5dzIxTVFiZ3MwSjU2cUsvUHFQdWl1?=
 =?utf-8?B?WHdXUGhQTk1NVVczTW15SkI1eSt1ejhOV3laZjVSdjc1L1ljYWxXZFhMSXNa?=
 =?utf-8?B?a0xoUEhZaDRYakJQdExhUlZ4MmFXek1NTFhtbi9Jbk9YK1hKMlBEdmNVRlk2?=
 =?utf-8?B?SEZSR2tPL1pXd2ZoUTFxMUY2bDJlTmJuSEp3VEN5Y0xvbWR4Q1d1bEJWWndI?=
 =?utf-8?B?M0QraStlMHdsS3FPZHFvb04zZWJCcWVxSVpMZmozTHBwNkFEaWVaVE1WeU1F?=
 =?utf-8?B?Mng5NDBadXNlVkpLbkJlMGVia0oxaUR2TFZxN25TMnNQL0M3eU5ZUWM1cG5J?=
 =?utf-8?B?QkpjVHFqNUcraXhLY25aV2J2L0tHdkNTOUFtZkZyTDB6Vy9OVmMwWjg2UVgz?=
 =?utf-8?B?UmFEa0ZGeE9tRmRTL3plYTdUZzNWQ3UvOHlYeXRTeDdPcTJsQWJMTWpzU3Zq?=
 =?utf-8?B?U2QxWlZEZWd3T2syNURLcU1BRGh0cHhwa0E1NGRVNnp1YXArVC9KQllGTnhQ?=
 =?utf-8?B?UU1uSEs1TjdtMG9tSjZFcE9xSUpEUU5vMFhLV29USmpnN2U3WXBYOWZ4S3Zx?=
 =?utf-8?B?SVE0V3VzeEFVV1pMQXBubm8zdzlneXFBVHhtM0xZRTFoZVFwazltbkszS0xi?=
 =?utf-8?B?enpaeXduSFhYK25HbTl3VVhCK1NBSllVbkNmUk5IMVJHRVRkVmhRUDU1Z0c4?=
 =?utf-8?B?TzNMZlNudXI5QlFtK21LREwvaEdyZ1NTWWNvV20wVCszTU9sMmx6bHFOUGVk?=
 =?utf-8?B?RlBwM0RoUk1FOWZyRFFUT1k5Qkt0cHlMRTVmQTZRWTB6VWM2YnV6aFJTMkIz?=
 =?utf-8?B?cnRzUGVZbTllaG5TNVliNDVwYU40SlNpc2RDZTRBc2xGLzduQ0M3Y0NxaE5u?=
 =?utf-8?B?cUV0dEsydHlINU9hOENzVzY1Q1AyNEIydlBueUg3cW9CUEdSTUlIckI0a2Z6?=
 =?utf-8?B?aHd1TFJnbDRncWhHZUdwaFMrNHJwa0NWZkQ2KzJPOXZWY2dpWExOYks2VE9s?=
 =?utf-8?B?UFRjOXRBd0xCanYrY1ZPYmJhNmlhOEUzcTJiN2t2NGg5Ylp1R0FCeFFtU3pa?=
 =?utf-8?B?TVk0bktaOVBhV0FrQVRralIwSVNtM1h4MjJhN1NDbEdhMlBBTlY3cGQrNlE2?=
 =?utf-8?B?MDdBMTRBVHFIZVRFb3Z2Sy9OU0NSL2c0cDVIWngxVUdkajFwN3gzaEtrSUg3?=
 =?utf-8?B?d29sUHUrQTBYNThNdzN2aEJoYkJkc3VuNHJJMzE4TG1UM1R0RkNvSjdkaStX?=
 =?utf-8?B?a3Q3ZDZCeCtkN0tXQ1lVbUp0Y1NDOUk2Y3poVE8rUVA1K3E3aG9sOVdwTW5F?=
 =?utf-8?B?d3hOdVN6WFIwRDFxWlBweXpUaUVDNm9UV1BUSFZYOFgvRGFtR2poWUpwVnh6?=
 =?utf-8?B?TDQ2QUhHM29zcG95RG1rNjBsV3FrS2dFZmxsREdtZWR2V2I3YlY2LzdRUGNw?=
 =?utf-8?B?WXFXSGFiQ2NaYVkzYktGWHltSzZsTUtzWWhoU0tDVkJUNlgyTEdzU2lEL2pS?=
 =?utf-8?B?bmc4Ni9ZMTZyWkdmS05OVHVraENJdWZwVDc4VEYwZkhzcXZabWxxVUp3Z05V?=
 =?utf-8?B?ZXA4NXpSa1M2T0VhUFF1L2VwS29Qc1NGVk0xY0Q2TWV5aDZLZ0E5cmNLczEz?=
 =?utf-8?Q?JRGIi44hdx+EVdXG0sGvWjoYmrTKOOKMaHPrC81?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c6e834-ee49-4257-6e64-08d9420874f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 12:03:54.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lcp5JZJj9/U3P/ETkAHlYu5E2Q2cpJOf4B6cTyG2bB4HGMceT9L7Hygn8Ap9cSBv3Nvnf3V2Vyr2mag6FgOFcMc25058oWOvowsWolKRJ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5887
X-OriginatorOrg: citrix.com

On 01/07/2021 15:09, Anthony PERARD wrote:
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index f778058f80a6..6a0cdfde2eed 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -147,17 +147,22 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
>  c_flags += $(CFLAGS-y)
>  a_flags += $(CFLAGS-y) $(AFLAGS-y)
>  
> -built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
> -ifeq ($(strip $(obj-y)),)
> -	$(CC) $(c_flags) -c -x c /dev/null -o $@
> -else
> +quiet_cmd_cc_builtin = LD      $@

s/LD/CC/

~Andrew

