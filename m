Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B295704B6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 15:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365147.595237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtqK-0008Ps-7e; Mon, 11 Jul 2022 13:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365147.595237; Mon, 11 Jul 2022 13:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAtqK-0008Nu-3q; Mon, 11 Jul 2022 13:52:56 +0000
Received: by outflank-mailman (input) for mailman id 365147;
 Mon, 11 Jul 2022 13:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAtqJ-0008No-38
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 13:52:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c291d26e-0120-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 15:52:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5960.eurprd04.prod.outlook.com (2603:10a6:20b:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 13:52:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 13:52:52 +0000
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
X-Inumbo-ID: c291d26e-0120-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2vbf51GgSwR1vFbFNYUNRL4CDUxclBmV6Bdd9Czt6CNTV3XXqj/A3kQ5KjTZW4mYpGIiag3UZD3dIW682On/712CkqhT9z/rWinNtO/Ee0gop4u9Lb9Q9SVXnVsWCghkwpyQGwNdc5WYEqyGnHZIgKNa/O7rEmzh4rWubn8p3L6SXA1W7ehcqE5Z6haWbL+T5BXGYEbvK5yuf+iaQVYuMkDRsB6eTL0gKseeC3YmhQEHiEP9UGb0ck1MiUVft3oRR2B1DqMX+E9oTBDOriuBV7AC9F4knuthPvfzuzM+UOj6vCPUXjvNsUs1Jlxt8br38cgs7QuGymZwdrQuMJRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6EKOgwVToWdE6HACoeHmgjyhRvxRppQiVPhunog6wE=;
 b=Nra79n2A//zkBX9/1mby7+KmO3Fkn1ftDLNmN6J7VII8EldyDvr4laJ5fgy6Wz9yImBrIuenKIDQXTigLuJG4qp1F2OoIpppe2uAL1DakZrOv77gwDxTkpPyRu75JFePtbjsXQ0z+KrphmFKN8tks3bNVKAXz//gjDhji+RLvXRU08NZnKrVaZvOPuS8odiKLjIu+2vBM7J74O+byXv40Pns/Zr7+gASVW6mZfodN3MD4WKn+ZpZTGe1CxOMafXmbyB0Sg13+pdddJc/4SzXMzL0qS8oxJixJH2rJAnp/8aoXfyRkAtX0sQoeqhqPZJIf4bM7J5kbiXCZ7x/shXV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6EKOgwVToWdE6HACoeHmgjyhRvxRppQiVPhunog6wE=;
 b=coYJtgvWX0GUy6Q++ZINTj6iCPXbs/29pNvaCEv7eI2/DmtbTvmarMb9UkOy3j9y9RlenEyROz+AWX17BNcWpmB1zEHyd3po7qL/pcvmI6EeDSR/c6trYu+AH33xMVzv2FRuO5ppBVRQAplfmSjZ1qviz9cm7BH9EYlf0u5L7OTpfoSCVOPESw1hCUWGR+RnAUOWWi7zuN5XukYJ7Jy5Gq3v+f6+HMaHNuIiPj8UGdwtw1O1iOB3w1161/YSMQaWl+j+Kti18aldyA1UaLTBGVjggrCSVN9u6dj/6RC4EYy07oFUCAih+HzuuVWfVR9mHPexE5Kx9yOb0NZRvlZ5aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76605880-bf6c-afd0-8fbb-a15bfccc1eed@suse.com>
Date: Mon, 11 Jul 2022 15:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220624160422.53457-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3144538-88cd-4afe-623d-08da6344a5d6
X-MS-TrafficTypeDiagnostic: AM6PR04MB5960:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d6vsPROurpHnuN9kG3lgSycBrBLVOQh14YLSoDkC3njHP5ap3giRdGqJ8wWXKlhwVjKZ2AU9/QqbVRTzbCYjOItfAeJaFP5PZRfAwTZIQeOeWpBAs7Y2hyT8PJ6LQL8jh72vVlBc/4U1xakj1J3rX/8Yq7LvCvphibz4POhWZlHewH7vsImFwiivGuRSl/IelR1llcTMxrw5qpFI+WMS5RU8SjSDEGnIUT/qWfLmEOCykkMlxynjeuKBsYJ4LCCQSxuZnZV3ONtcbBq3CekD8IMlP2Pbr5p5FIOQz65rT9Sas3w6fhD+VDR0ojjNQJg8aXo1SnEySY39ZWt4o8xEPfOYW6QvY8OrfTlWKmm3x1uYuX/AcpUE0eu7i/pzb0JZ7l/7qOgB57mLQzDrfNd1iUTyS2XSYsan/QpgrAWXuD1n3mjXib+1PehsTPkLj7eGYaAuuICp+U//hOZTPSKG2u7OJvXZmB9D7wtJgfvMxe0hn+M42zKA9LBNMuuxQOb3gdt9B/j50RMEHlfDSG2wmO2um8PHgCe3g9bDLjVEtQux8nbH/qUk41NkEQD94S29HvcoAUX4wHRTMpeEEZ8zFVaEszzEE26PBnK/L3fXwvAGuCj3v+gA7Np/dc8N9Nkkqw+/FScTEXYsrbJ9AOlFK1vD4ZmeKJQSDA7DyyDiUxqW3kMI9Rgb4KWOZKyaGrV13A1qgKUqggR281XZdQbmrbcO0Sof0EeGjh5O5G0ft3JuV2uG5PPHRgDqEj/prlJQxFk/94Etciw4IIQRptKvnFGX/Qeb/AHCcDPAKCNxKlEBA3ohbTeNDI+vCZzShFHi7lc5Cyo0BSBD3wEiLgir7jRHgSduVlklmqRfHmPmR0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(396003)(376002)(136003)(38100700002)(31696002)(86362001)(8936002)(478600001)(316002)(2906002)(5660300002)(41300700001)(66476007)(6916009)(54906003)(66946007)(66556008)(6486002)(186003)(8676002)(6512007)(2616005)(26005)(53546011)(36756003)(31686004)(83380400001)(4326008)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWZEUTNreXoyU1Jmbytoa216YnVDRzhoSUhRMmtQb1Q1a3owNDBRdVo0elUx?=
 =?utf-8?B?RGZQUTRsZEwwQ2JlM2U3NlFVcFNORnN2a0FmWm9sd2Y2TGkwVzNHR2lCWE5X?=
 =?utf-8?B?V1Jyd0wvRGZMbHBJZ2RkTDZTMXlBcjlSaGZqYW81dzg4cUZhamt3aWJDZTd6?=
 =?utf-8?B?dHhXYytIUVlPOFBEUlFFcXU5U3RJcFYvRUN1RnpyNUM3ci9yZ3JWZzZ0SmVy?=
 =?utf-8?B?RHFUdmMzenNqTFJkQXJJNE9IRXFRZGVXdFBxbi9YaWpuUmg0VHl5STBMY2F3?=
 =?utf-8?B?N09YR3VoQkFBMkFJVjBNTDRCY0dLa0VRTXJLb0Q3NUJjN3A0VVN0a3FzM0dS?=
 =?utf-8?B?dGtLakhoZ1pOSVhUdFQvSGRkbHVtNjk1M2JTV3JCUCt1bDByNTIvbEk4cVZH?=
 =?utf-8?B?Q2hlUExyV0p5YjVUYXZDbXhCUmdiUGgzUFQ5TXlwTnhlTXN4dGdKT2V5aDJl?=
 =?utf-8?B?Z0VHYUJuOTd3bTBNTi9wKzA4ZXRwUWVtTWhTQ3g0YXlEcmpXc2xJYWljS0or?=
 =?utf-8?B?a09UN1ozbzVEUUkzbkF6T3diQjhyQlppcjJ2d2djenllUXMrajJIMURpQnNi?=
 =?utf-8?B?eCtpbTcwWFhzVkRtbXQ4RXRsMXJlRFhROElha3NXdFIzeGNQbkRhTUpVcVFr?=
 =?utf-8?B?eWN6dkFEdGZNdkJtbDJ2aWhQOGt6bEJOaFRwWHV4cnJ5SU9tNUlwOW5Wd24z?=
 =?utf-8?B?YXJJaWQxdFRhaWtTQUtGMysraGRmY211UE1sL2xtOWM2bWx5bXZiWHR0VStt?=
 =?utf-8?B?ekhjNE5lMEhsbTRWUkNsd1ZDRkxUZ0VNWTBEblJpZ1Ivc3JVZ01lQTRsYjMz?=
 =?utf-8?B?Vy9kUmNnVUdHemVjQlFwUG9uNy9nSGE2Uk5MdVNuU1NNT2lmTzhSMGtzSDMw?=
 =?utf-8?B?YlNqRHo0SkdyeER2UXRZZDhQd1lUQThnbms1QXNGY3JzVVJ0aC9VWWMyNWl2?=
 =?utf-8?B?YXBsNmNrZ2JnK2NLVFE0K3R3QWZmUG9XM3ozY0JPTHkwRUtpZlZHMjhKd1lq?=
 =?utf-8?B?VElzR1NHc3JRV0o2dVd5cm1WVGUxZE5OUUZSMXNrQ1AwQ3ZTN011Z3Y2cmtS?=
 =?utf-8?B?b1lEOURhM3NHeWFvb2NzRGFYUUtnZmliNWxMMHIwRVdFbEVZSnhzcG4vQXBR?=
 =?utf-8?B?RnV2bnhuNU5BOHBXdG1LeERtWlROVEZoMjNqY08vdFdjNEQyWE1ya0dTZFVS?=
 =?utf-8?B?TFVQaTlHMVJvTHpUWjBCb2xTUmY3TEFxOFpmd1JNKzNMcG0zUzBETGo5eFly?=
 =?utf-8?B?ZHJkZGVGeVdoSVhtUUtVblQzQ2dnMzVFbTVKOHZXWHd0aGxxODhmNTUrMHNy?=
 =?utf-8?B?NFRVU3BrdEZyeEgxSGJVT1E1WGRKTUhYR3VZalkvcVVIVzl5SEVlbkNySFN1?=
 =?utf-8?B?d0FVcGRWMkR1eWFvWlZyMC9XMjF6VE5QLzMzS3VSVTRLUkE0bWp0VXU2T0p5?=
 =?utf-8?B?ZW5CZkY4SUVGV0Vxb0puaUtZV1RHUVZrTUJmRThqNlJsRjByVHhlY1c2eldI?=
 =?utf-8?B?UzA1aW9uQ1JYWnFjZmppMGlWY3k1Z0Z6NmpyWVZybUg5VTJFQmcwMlNMSWh0?=
 =?utf-8?B?RUw2SmNIWnRONkxGUk1iMjZiYnR5TGdHVGFyUVNPdzJzOEdpdHhnYlppWExl?=
 =?utf-8?B?K1YvSW5YY1NXZE5XUzBIVHdNZUNBSHI1djRaZU9yY0dkK2tLdnpXcmZ0WUc1?=
 =?utf-8?B?dGFKZGVkdGpKSllPV0ZJWU9BcHFobnUxR0dQTmJlaDg3eXZQazJMMThyQi9H?=
 =?utf-8?B?ZFB5OWVnZGNRMnpaR0RlU094QkVOdmdqUG94akgvTjllUEZBYTZZc1d6aXZm?=
 =?utf-8?B?c3Z6dEQzcWtocFpnRmlvUFY2endUMy9DQi9OcVJ1elRuREdqM0wxU3FSWElw?=
 =?utf-8?B?TVVpWVdjTnpyZE1XWlJxUWk4aWVsaGJHWlRCSWZOK2hDdUNzNUU3VFYrNVdu?=
 =?utf-8?B?SFFpck1wMWVsaVV5d1ZCTUFtZm0vSWNyZmxKNFFBeDhLYVcwZ0hYTnZ4ZWha?=
 =?utf-8?B?eWJVZ0svTWdGNEdUSzdDeGxWMVUxK2Z1TmJIaFRRQTVZYmNxL2ZNYXNsSnZl?=
 =?utf-8?B?am9sY0YwKzd2a1BBelN2ZFlzUmIzU0MvMXJ1cFAvaWhtY2N6cUdoaEQ2Y3h5?=
 =?utf-8?Q?wtzSkgYAjYF9ytgAqpowhiSac?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3144538-88cd-4afe-623d-08da6344a5d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 13:52:52.0219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNc9CEUcQb4X7H7NV6V07zuHoWEJyxDZTD1YCLq+M7jsuOiMRmIuSm5OHvmAo0/JhpREZBXdr13bL7d+j/GMAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5960

On 24.06.2022 18:04, Anthony PERARD wrote:
> Setup proper dependencies with libacpi so we don't need to run "make
> hvmloader" in the "all" target. ("build.o" new prerequisite isn't
> exactly proper but a side effect of building the $(DSDT_FILES) is to
> generate the "ssdt_*.h" needed by "build.o".)

Maybe leave a brief comment there?

> Make use if "-iquote" instead of a plain "-I".
> 
> For "roms.inc" target, use "$(SHELL)" instead of plain "sh". And use
> full path to "mkhex" instead of a relative one. Lastly, add "-f" flag
> to "mv", in case the target already exist.

Hmm - according to my understanding -f isn't needed just because the
file may already exist. It would be needed if a pre-existing file
isn't writable. (I don't mind the addition of the flag, but I think
what you say can end up misleading.)

Jan

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/firmware/hvmloader/Makefile | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> index b754220839..fc20932110 100644
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -60,8 +60,7 @@ ROMS += $(ROMBIOS_ROM) $(STDVGA_ROM) $(CIRRUSVGA_ROM)
>  endif
>  
>  .PHONY: all
> -all: acpi
> -	$(MAKE) hvmloader
> +all: hvmloader
>  
>  .PHONY: acpi
>  acpi:
> @@ -73,12 +72,15 @@ smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
>  ACPI_PATH = ../../libacpi
>  DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
>  ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
> -$(ACPI_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
> +$(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
>  CFLAGS += -I$(ACPI_PATH)
>  vpath build.c $(ACPI_PATH)
>  vpath static_tables.c $(ACPI_PATH)
>  OBJS += $(ACPI_OBJS)
>  
> +$(DSDT_FILES): acpi
> +build.o: $(DSDT_FILES)
> +
>  hvmloader: $(OBJS) hvmloader.lds
>  	$(LD) $(LDFLAGS_DIRECT) -N -T hvmloader.lds -o $@ $(OBJS)
>  
> @@ -87,21 +89,21 @@ roms.inc: $(ROMS)
>  
>  ifneq ($(ROMBIOS_ROM),)
>  	echo "#ifdef ROM_INCLUDE_ROMBIOS" >> $@.new
> -	sh ../../misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
> +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex rombios $(ROMBIOS_ROM) >> $@.new
>  	echo "#endif" >> $@.new
>  endif
>  
>  ifneq ($(STDVGA_ROM),)
>  	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
> -	sh ../../misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
> +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_stdvga $(STDVGA_ROM) >> $@.new
>  	echo "#endif" >> $@.new
>  endif
>  ifneq ($(CIRRUSVGA_ROM),)
>  	echo "#ifdef ROM_INCLUDE_VGABIOS" >> $@.new
> -	sh ../../misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
> +	$(SHELL) $(XEN_ROOT)/tools/misc/mkhex vgabios_cirrusvga $(CIRRUSVGA_ROM) >> $@.new
>  	echo "#endif" >> $@.new
>  endif
> -	mv $@.new $@
> +	mv -f $@.new $@
>  
>  .PHONY: clean
>  clean:


