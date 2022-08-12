Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1759119F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 15:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385693.621386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUpp-00011y-Lz; Fri, 12 Aug 2022 13:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385693.621386; Fri, 12 Aug 2022 13:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMUpp-0000zE-HQ; Fri, 12 Aug 2022 13:36:21 +0000
Received: by outflank-mailman (input) for mailman id 385693;
 Fri, 12 Aug 2022 13:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMUpn-0000z8-Df
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 13:36:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be85fedd-1a43-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 15:36:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.22; Fri, 12 Aug
 2022 13:36:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 13:36:15 +0000
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
X-Inumbo-ID: be85fedd-1a43-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtEAZD/DSPhFUkpoa/BHBu9CiwHHJNU77X9RBYH2bgm7OhQ6BWPZHQ6UMgshi5Ijg5IBqhC7IRGE2H1IdK1u0NcJMLNseuRTIbQEI+JQ7lAIX/qhdCBfJimBtr2+8/+37zzKwYfIJCsPgMoaFyoIvR7zLdRl7oOIW0tNkKRghkbafT698L/eV4w/I2EE9pr4umiv1GfvO2UY+p3uuMTQG+w8YuFKP7GZ6ZsD5J1PCDlwT0eSIaRakezurQoDB0SRGUnshKOMal5iQxxbyioYNf0+G5F9LBYXf8X31thgxbvPHY51WFK6ILJfvbAlEadUEi1MseMWVEpO2rbTQEiBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqfl8Cj2UteeLx3kleqXE7nVyEqiykx2dL1iQ7dYTiw=;
 b=KOBArhckUWCncH5mRADumSB2i0Nc6Cz337RArdJLrk7FJIeIKBt17cv66vu6eq7ijoyFSHDgMeD/dDpZEibEcuTtFRjpdRkKL9Aff/n70aUjPwHCQ9+CGALJklDgfde29PVhrhB9Oo3cPMKe8s8zDXiJRmC5jo7jEMkXxT4chQosEem7GHEmQLQx4OJFOvJ4LLB98Rxrt4kXQm2OUX9KQko6G/uFE2MtUPooGJ4BYMsk9RXPaz7rJevBVEDn9A/HajsTKDFLop5sTpSWTwWR/y0K7ZeXjHl9V6rt3nubtnz1nCojgApHF7CAnGlFhN6QeO9VAHD3zw+t1sxIQPKp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqfl8Cj2UteeLx3kleqXE7nVyEqiykx2dL1iQ7dYTiw=;
 b=hO0MmJoe8rH7m3QAWbyVdo89PjCtbli2rU6/mU7ny9gA+IsG30512SD0LVemJeiYiaJ5conNO2fMlIJwgPtEI5LKX/0k+BjmaGMnfvcXBrqhOcJes6aQBEVKfQ9Ft4FjX/S4q+vVA1ZC5q6+Xgqxxmc3RPMLxqNXupRG67ZIbr1tIyuhSsWwNWCBGx3DByBPG0PS51p02/6v8GsnhKvlSFS6tBOBCxDIQr8ZaRuKpYR4U8Yp70Zz75WKmQ+uR0gVMfvPehpQyd5MsBi8bHQxo9XDNCr9zT4laGdfkzwOcuqRmE3vWymHreqSyCh4iiDxNTa9axU8gop8hvIs7M3B0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df267b25-a51a-a773-5845-534104540208@suse.com>
Date: Fri, 12 Aug 2022 15:36:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH v4 02/32] tools/firmware/hvmloader: rework Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811164845.38083-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70ad510c-5360-40f1-d008-08da7c67a114
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnerG5N6/GcZMrS8jEWrNY5rLNcGhK0y1APpo1FQPNM80o+gMBhZHLeWZPeTNZzrMyaqiY/xQMpJe2F9u+QlLPOVPdVyDLswFMu0a0xnp5jl68D8zjzCwkNUCrSxcsPnFWwQ1gm0OqdUTCfhr1CH3kKeFaQspxL/kBRGzNF9KAFOwEiRQlod0/B7QN+fwcfY3cjmzr4edgSWedAzdVn7e98IK9nOQRQ+ejIzXv7Yjq8+g/6taMHEaoQQCZeSZCzQiCZt6ak1Be/BZn4JwDxg7dlZaAJmVlxv3L4t0WJkRsEacFtZThl7XUzJMcep4dl2HPv6xeelRNN8REosihs0vxlsyd0rm8M3CjsVZ9SAFuBVhy9uXTjZztS7nC/N+iiDmUGXrTUnvzj3rZvmVmxseiG2gayC+iOOuR3wSiDu8D/CZZEnKlzZgYjJl97OHmJfixO5aslWUj4G+qnQPRxhenESbOpdTgOykUtSMyxZ2XnU2GMxGqAhAY7n27uvwpd2evRO7KqNYcrkYLvYb+rPQEpLBTXDFYCcgalML1Dwsd9U84MRDLEa+STPxfSGisMA7CmTonPk9mCwCsfQy3WNGihLeoYYT43bIRWMelgBcvvJjJ/E6V8YOgn9KT2grvP3hFBhc/sH8A0PDkhfWjHa4tfLmCFT1wyKqc6uZMag0lslAX8GGjovieZNtpAR7GL8JDByb/n4ZB/JRkmz4s1a8ZkCWt0B0i5TMWf9vjmxhQ+9qCgFFtg70HsEHVKOOx/WIa04S4jS3/gH7S8pPGTskQQvKFI4X4Z6VwVbldDusWU1tdZKqC9L0VTOnFcLpnD3ViehrDDOvDJG9iN6crSS2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(396003)(39860400002)(31696002)(38100700002)(86362001)(66476007)(66946007)(8676002)(316002)(66556008)(4326008)(5660300002)(2906002)(8936002)(6512007)(54906003)(2616005)(26005)(186003)(6666004)(53546011)(41300700001)(6916009)(6506007)(31686004)(478600001)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGRjQmduUCtYYmlrdmt3SEVHdk9wZjQ0V1h4Q2pUS0hmQkg5UTY0dzZxY1R2?=
 =?utf-8?B?dFdwK09nQjNhV25sdFUxbUJBTzJzbndMZXY3ZktFTk9DTFdVU2g4VEF1eG9p?=
 =?utf-8?B?QVZvRnhGMTFSN01CZDlBcnN6QWJ6WWp4SXgvRmMxZW9SbjF5SGxQRVo2dHhG?=
 =?utf-8?B?cExXWWZxeG9TOENGUUF3M3VuY05GSVRpMTlpYTlqQWNCcGwwZTBIcWNTZW96?=
 =?utf-8?B?NXRMNjBtUHF0UHFMYjE4S1dJQ1FMYWJuUEdRNXhHS0t2SnQwajlyQ1NrR1R6?=
 =?utf-8?B?djJ0R1BnTi9YRzZXeU1pMXpnTm52SXB6Z2J2RDh1Q0dFS0lwZks0UitiS1c1?=
 =?utf-8?B?WFhkVVlFWUlOT1paTlMwM2ZRanFVaXhrU1dlMDZBejNKbm5vTHJZZU41MWtN?=
 =?utf-8?B?dmdiUjFzMFBMVEVjSTVDT3EzK3F6QmdJeVozOWNZeHh3dXdlOFRUdUNVazh6?=
 =?utf-8?B?OHUwNzdQVDg3cDdjK1FMNTRxM1BubWtaa2hIL1Rrdlc5UE1FeVlxdDhQUUh3?=
 =?utf-8?B?SFo1WEhpMUU1Y3FpcFFQc3F6VjJqSzNIWCs4bzJ0QUd5dURHSXZiTzdTdkhv?=
 =?utf-8?B?RmpsNUk0bjdmbG9aUDN2TE9IcTV6bWNsbVRPbStnTTdwVGkzYVFpWGhwOTUw?=
 =?utf-8?B?dHRUNmZtdEdiZ1R6b1BaZ0lxY3FmNjZtc0JSRnIxMzc2S0pnRWlOQlJNZXEx?=
 =?utf-8?B?TCtOZVllWTAzbzhxd3VmOEFlK0F5bE45cXdvTEs2VjVVdnVSVVhMelNVVzNT?=
 =?utf-8?B?d1hjdDEzdWlvN2xLWlkwcHB0M0tIUzloZ0E4MThaN2tZa1h5aDlXVnlSeFZH?=
 =?utf-8?B?SzJzbjNYRmdDKzhKdWxoQ2xBMDM4cGNwUVpQV2dMVXpkTVhoRHY5RjE3dkI5?=
 =?utf-8?B?V21pbWZJaEJ4aC9Zc3lWbDZHSWhNb3cwY3dOVXhqK2Q5eWNrcnB6WXEwbUlr?=
 =?utf-8?B?SUZ1K21kK2R6NVpvV05sVXBZNkcrc2VKMzNoMkhJOFQ0RSs1emhsWExGaTRZ?=
 =?utf-8?B?RFpzdk1Fcm9tZkdZdkRLWVM1dTh6ZHl2amJKbmpZb1VUQW1PK0NTYVg3SnlP?=
 =?utf-8?B?UWs1dkt0aFcrN2VOek5rZGZoM0pSSGFMTVFad3VFWTBtSlZCYm45UlRjNEFw?=
 =?utf-8?B?Zm81M0ZJTFhRdGRIN3VxL2JmUnUvUDYwQ3IyL1RuVWtKZUVFQUdFRGpvT0R4?=
 =?utf-8?B?L3lkNHZkNlFpOWFPTldBZlIveGtuVEZSTklxcE53ZklZWVVnY1J6aGRoa0dX?=
 =?utf-8?B?ZW5rNTdsZ0phZ0lCOW9kWElxRGgzOWRPcnVleWoyOVdjMnB6bzdGT054c1hr?=
 =?utf-8?B?eGlHUUszK1dHV2FXMXduYUlTYUtyRG94MjZINHJBcFlScGhzQXQyZTZwZEZh?=
 =?utf-8?B?aFVCVVMyNVdULzFIcEtZdncvdjVVQWRCZ2RqTWZDME1LNnZPeG1WQmJNOUd5?=
 =?utf-8?B?ZXRsVi9NalIwcER0Nks1L2gwMnJxTEhwcGdEMHI3RUZoL1R6K3lHWHZVZWJG?=
 =?utf-8?B?QTJMZDJBdTFpZ0x6RDIwK0NCOUNjR1VocklRVUZMbzBTMERia1NMand2VnZI?=
 =?utf-8?B?dUlTS2ZyQmxwSUx5bXlQekFna3NlMEFrYXRWaGxGem56Y2xHbWtlamo3cTNO?=
 =?utf-8?B?UVNCRGlJTFgrRWVVWlNESXMzL2xaZVhqbmRqTFlMbmlEc2xFc3FoNUo0d3hW?=
 =?utf-8?B?WVV6bDl6Y0t3SzVoM0F1bGhOMHZXcjR5WThXUHVHbmw1TDdUUXVITjh0a2xk?=
 =?utf-8?B?dTJJNjVYeE5xWlJhVlB3NGIwNU81QnErdVJneHZ2L0l3RTMzVVhMaVh4cmha?=
 =?utf-8?B?Rm0yMXZsQk1KUGJuQXBwd0gzalkvWi9mYi9yNldsUVBMa3czZ0FVUXVTSmlr?=
 =?utf-8?B?TXVmVzFCMFNEaEdWVTlva1p3bnRTVUx1bmVUdzFHTzFwQzJTemo2K2Q1bElH?=
 =?utf-8?B?eE96eHhQS0ZSMnpKZGVpbXpDckg3Z2tsZTlJdkJrSDNMN0NBbEhiaTFmV3lG?=
 =?utf-8?B?VUxDdVI3N0lFMHY5KzhuQnZPdTVrNVZrQ1QyUHBlT0I5R2FHbkt0ajJGclFk?=
 =?utf-8?B?WXBGWC9SZ0dta2ZoSmJycFVxSWd2Nmt4NFJFeEdoVzAza2FPL0RlcG1QVGJ4?=
 =?utf-8?Q?yGBfJ9kW/zSEL1eFJcuyYTMdE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ad510c-5360-40f1-d008-08da7c67a114
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:36:15.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5KX9EuJftuZuUuut1fG7KuPjZIl7UNt8K9qa0hIHE+HeoKqiOoA84RDyfsHnXWWDL22qmMINjBcvVlP0yoG6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 11.08.2022 18:48, Anthony PERARD wrote:
> Setup proper dependencies with libacpi so we don't need to run "make
> hvmloader" in the "all" target. ("build.o" new prerequisite isn't
> exactly proper but a side effect of building the $(DSDT_FILES) is to
> generate the "ssdt_*.h" needed by "build.o".)
> 
> Make use if "-iquote" instead of a plain "-I".
> 
> For "roms.inc" target, use "$(SHELL)" instead of plain "sh". And use
> full path to "mkhex" instead of a relative one. Lastly, add "-f" flag
> to "mv" to avoid a prompt in case the target already exist and we
> don't have write permission.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (which I'd be happy to take care of while committing):

> @@ -73,12 +72,18 @@ smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
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
> +
> +# Add DSDT_FILES as a prerequisite of "build.o" so that make will also
> +# generates the "ssdt_*.h" headers needed by "build.o".

s/generates/generate/ ?

Jan

