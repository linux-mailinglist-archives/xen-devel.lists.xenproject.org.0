Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8330AA6F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79948.145852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6an2-0003fD-Jy; Mon, 01 Feb 2021 15:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79948.145852; Mon, 01 Feb 2021 15:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6an2-0003en-Gi; Mon, 01 Feb 2021 15:06:56 +0000
Received: by outflank-mailman (input) for mailman id 79948;
 Mon, 01 Feb 2021 15:06:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6an0-0003ei-2E
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:06:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5f63a9b-5c1a-423c-83bb-ebddb6c74494;
 Mon, 01 Feb 2021 15:06:52 +0000 (UTC)
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
X-Inumbo-ID: f5f63a9b-5c1a-423c-83bb-ebddb6c74494
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612192012;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CmujobCdXS0rXkjlW1uqM7HHHGcadyi+aill032zNUs=;
  b=ZpVbxefhl9Djz+C5K62BldOg6Zw2FyMJ65UNlNP+9W4XRD+RvDtCTDbS
   MwWakulLV22XmkAVdaYPQgDb3qMzHP6axzPjdfUZIqq+hMThvnPDWXovo
   4t5pa+eLMMLk46BOMGjGeRz20/p2ZQVVucWpGx+51679cz1QVzMHNCupE
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D+qiPcmJdTvK/MMSKIwebaB5Am/s7qJyoundTtE7WG7qVAH1drLb3QBBg73sTlfGvP0cdI9KUl
 2/v2fXWi5ZNZgAllXQ+yMOWi6ghg8jduHwYkMPjJzb/oQZM3CLgS+bR9v4+j/Yrof0pWHX1LhC
 XWBDR19RVKL7dPLC5/A1KEf1lQO9PRB16BSl03ZvpikBgtNsJQT/9PsFyZv5Kg8iFko16iwfnL
 /m2H460lM8Qnq3DHWjlt3ceaZ7vLtcFNESMm2S0oa/fGSg15m/vLsOZjPcSNAm6wHShxDESW0p
 mNw=
X-SBRS: 5.2
X-MesageID: 36482386
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36482386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILQ8kmlPAednR6jK1EeYa6nSOHIMj6OpNIbvUBFLCmWEm+Oyl2/UGMTSnA+wnmaDV83z3RpydhTKWT/MAoTtRbQ11LRy9IbuQtMYFQFW96clK4kNfgeLyrEqB7voYepnFp+YBW0VZsvCuG6GVGhBwYVFx5F0tOcWRc/8INz77WBCkYyOw4/TGhRQ0xT4jkZTH9lpApZK+RSNTM38EheXiXpUlA6EcvOwl+eXONy539JD4yFdh+nxR/Rdqk3p2ggNjRI37b97gnKaH/U5anbPcjvAmbXjmQno1nIiZqsnNzzfYeKkQAgpKATSr+5fB9oDXQDIGadN9mAo0hAuBmZgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atXN1GxkEwQE8MMSncvh83/fWaw7vuSzU/q8wa+hX3g=;
 b=E1zFr9vBeLw9JR1Xi3MeEg0Xq96wY5AvcVEgveKa2ZusUrEqOuXwr16ceBbtI5HybjN+kP3KyKLSxNqDbHWvaF5hkyri0jmeRhqtTJM9T/GaabBh0SGAl6Qr6pLaAinyV0l3n/VSMXxcfbQZdcETA7oje141Ne4/TP5lTWFvZMCUkntZfCUQkoZu+0e+P+ySQB8jw7s8YEpx6N9VbiqaEHnwrmsg87wsL5pJGtMhTlkxZomXfrk6L0OrIUjhmGz8fbtyLxkkFgzedHgxqOHmkv/5jFKrltJM9zWWTUgwzsSmvD9q2Koo43Cu0ydc7DkWkJylh+Aka7bDwkXUHThXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atXN1GxkEwQE8MMSncvh83/fWaw7vuSzU/q8wa+hX3g=;
 b=BMG5WmTyqUfEiQeZx1semoZ80iJT73V+cNPW+Jvjk8M3rsQeAN29ueqnzFkD8i3qhA0xiMbL9DI9BZmkRKyAabQ6bhnqDsyf6YoNyLwXCe8tSGXU2HF1A1YvGtzn8Oy4Gsxf5HXYKeHlwFKAqwbqK0DCOS1k67SCo1bO6Qotvbw=
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0cbbdb3a-5681-10df-aeee-ac185d7033cc@citrix.com>
Date: Mon, 1 Feb 2021 15:06:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6707d29-31e3-4b95-36b8-08d8c6c2ff14
X-MS-TrafficTypeDiagnostic: BYAPR03MB4727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB47270F358FB3D5D5987E28A7BAB69@BYAPR03MB4727.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HN7FtUHAfhqt6xYggEhbbu/jrVBK2AWLESV2Db8TSdx2EiAmx8jq2+JRj5saBeAh7W68PlF3/8KQ/khvemrxaQ4M270IEXfHHqPu1HzWSIOmU2thQmd25j9s1q9O7TS8RU6+WBAgdOQq5PCYEIBpUr/UTEjFa/aGcrdA+JcpOPD0yoo6KaU/MLXWQAqi788X5YCOyUTkgDSUPMAxeANsnvO0Tn+k8tR+6egLPvekFXwgpoFTbbRZfllPUrsu0jilDBNorXJ1zX2rIjs5ebUYFQvfa8URQ/a5Hag2JngGD+9U3wA7x/0UVrmcN9qNmL3sJ1VQwAEN5ykyEaNtfzOSIX52blTwFDno52FRwg4pHNgSZPg94SURtqGU2AAbyEBwGvpG3gHDjqdGCiBugrpeq+MsUKgkvWlBneRVWBRs3VaIQsJXxItqEPcyCdRW8gccVYAN50tXeCK6Uiv+LN/wwa82xae11oRmvBXCe+ao4ru+FLCANCBgMMc6ux/wMzqEm6OQtcTPfofZVNTEHFheLzQtA/bBx0Krt6EEgE4UnV1e9jFbNnt58AnqBpg0qwOVtyjMoWfb2+hyLwnjzNVqnLI0YcjWVMxTpCZG/exLMwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(2616005)(6666004)(8936002)(2906002)(6486002)(478600001)(4326008)(5660300002)(66556008)(956004)(66476007)(16526019)(186003)(53546011)(26005)(66946007)(316002)(16576012)(83380400001)(54906003)(110136005)(36756003)(31696002)(86362001)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TTZqa0o2SnQzemhsazQ2Q1QvVzlrenNDd2laTlZtMGptQ3RXcEE4YVo2c2NY?=
 =?utf-8?B?S0x6YlNwWEZVUCsvVU5XeXkzMVBpaGN3U2VnSzZMYzhwSUlNeFZ3TmlrMTM0?=
 =?utf-8?B?WDNPSmtCSzlJRUZ6SFQxRm1iMmFNbnMyeFYreVF0NTluUjlnc2loZmI2N3lp?=
 =?utf-8?B?bXRPcUpKT0x4aUxsVkxkandKQWFhKys0OXRPaEtuNUVhaVJjdGIyaWpxSjFW?=
 =?utf-8?B?VDh3UjhiTVdEQzdpVXJhUkIySTk3Q1hncjRIOHBHKy8zVjM2emRhWVlTbVA1?=
 =?utf-8?B?VjdzeXhOcG1UdzNQWWxxWUppdlhMU2I0eTdubHpWbzQ0bW40RjhhMGpodHRJ?=
 =?utf-8?B?WTBpUzl5ZUxSSEJ6U280T1RCYWlTTSttaUJpTmZZT1B6eUdIUVl2elBqZnRQ?=
 =?utf-8?B?QWl4a3lDL2Zzd3hzenJscnFpL2k3Z256UFZGL3p5UjgyK3BrUmJPdjE1b1Iv?=
 =?utf-8?B?a3gxR1RpcGZVMjNoMS84aVczRndBWVZCQUtVanh3WDk2M2lDem1QL1FQMGlN?=
 =?utf-8?B?aGZNU2NacTRFTktxVkk1UG1BcFFGQ0NhVCt2eWJuQ29INUowSW1TZ0tEcG9m?=
 =?utf-8?B?VFJ2bEk4M0hZRnJLY1FvT1N1VWNXMjczYUhQak5ZYk1KeXBkYmpWRXVZN2ts?=
 =?utf-8?B?SUVPSWNmYVg1UUJsTUNlVWlRUTVwUjl4Skh1TTFmdnVPaXRrYkErU0VwYXRl?=
 =?utf-8?B?QWUxOFFiMWt2b0JieVNxUVlSKzRuREd3ZUFsVW81a2p0ekpSeDJtdHdQSTZi?=
 =?utf-8?B?ZVlQYUdCYkpmcVBKU01VZWErVnN3R2R1RjRJQU54V0x1eXcxNmhYUnhiQnZE?=
 =?utf-8?B?d0I2QVhFOEIwTTB3ejE0RVRldERiOTZodXM0anhRS2RkWFJjUWlzRE04U3Zj?=
 =?utf-8?B?NEpxRGFyd2hnaFJyTmVROFptYkxLRGZ1T0ZIaXl1TUxVQjBzZWR1eUhJMFNv?=
 =?utf-8?B?THFLcGFtd1NRWnd3TWNxalRQbVhoaVhMWlgrQkVQV2JpZGp4cWJMTENRcXJs?=
 =?utf-8?B?dmlISFkvanB5YmlZWlNMSGNlT2pSdDYyY3FqeUpYOFlhVWVsZ0ZjM1ZxbnBm?=
 =?utf-8?B?WWFYRUVWcVlaaXluVmZIeVFRd1VKVEF2VkJLdjBpbWV1TVJSOTVWcHJTNXo3?=
 =?utf-8?B?UW5iN3RseWpyaEZSSDdrK3p5WFkvd3JnbCs5aHd6WFRzeXcrZzY1Q2tWREsz?=
 =?utf-8?B?YURGNkp0Y01iNnFBZVlLR0hOalA0R21POGJBVjFIbGVqcEYwYWZXVGN3NDZi?=
 =?utf-8?B?bnluMk1rQ2NnbXBzd0gydEVTUWJhaDRGSUw3dHF4RXhqaGFWRUZOMWxUMW1z?=
 =?utf-8?B?ejdoVnRwWE1TeXpzNTYyVlpRWTNZcU0yVVRldDZsZmR2U1lrSmJVVDNDVkJD?=
 =?utf-8?B?QVVxeUdXL29VeWxTN05xWkVGUXVIOGJGSUttMEdyMkhDRE4rN3lwVnRhMFcz?=
 =?utf-8?B?Z3JKTTFUejFMbUtqalVqOXdoeWUwRGJhUGVicHNBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6707d29-31e3-4b95-36b8-08d8c6c2ff14
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 15:06:47.9854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHEN7OOU8ktHBijsrRx5FiDoDWAxHlj8MOYpRll8f7uX9siHy+m0A0W3v7w0GgrJaDhv9YBYFAjEEVkHDLX5dCRIpEcQpzBVIYDihISgqls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4727
X-OriginatorOrg: citrix.com

On 01/02/2021 14:56, Jan Beulich wrote:
> Going through an intermediate *.new file requires telling the compiler
> what the real target is, so that the inclusion of the resulting .*.d
> file will actually be useful.
>
> Fixes: 7d2d7a43d014 ("x86/build: limit rebuilding of asm-offsets.h")
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, whatever the
outcome of the discussion below.

> ---
> Already on the original patch I did suggest that perhaps Arm would want
> to follow suit. So again - perhaps the rules should be unified by moving
> to common code?
>
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -241,7 +241,7 @@ efi/buildid.o efi/relocs-dummy.o: $(BASE
>  efi/buildid.o efi/relocs-dummy.o: ;
>  
>  asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
> -	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new $<
> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
>  	$(call move-if-changed,$@.new,$@)
>  
>  asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P


