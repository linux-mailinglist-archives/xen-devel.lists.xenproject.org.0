Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2033588A3D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379744.613473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBQu-0000o5-FU; Wed, 03 Aug 2022 10:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379744.613473; Wed, 03 Aug 2022 10:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBQu-0000ld-B1; Wed, 03 Aug 2022 10:16:56 +0000
Received: by outflank-mailman (input) for mailman id 379744;
 Wed, 03 Aug 2022 10:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJBQs-0000BX-Ff
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:16:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6563b79d-1315-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 12:16:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4602.eurprd04.prod.outlook.com (2603:10a6:5:2f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 10:16:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 10:16:50 +0000
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
X-Inumbo-ID: 6563b79d-1315-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3uIU7Cz5k42cQAu9T6Rn3jdSGzHXVhwjGJYkRjPx93FzFT3mqAmo7f/AXK2tqVW3gXFEQfruEjw094fsmW+RFiAy/Jf0L9xAU0XK5Yt/yl0M/g1ltzb8v2eoXjluDmNTiRl8gmaHbIyXhiQOLrx8Z3oa2VLeWVOLaGH72+aNt57ixbcVGTXSvtBzCVi0ykZzBPC8bud7vE3iQZ8vhq6t93GfZ2sec0BbaJdGN4PI0NVCOl+eJ3Ipk1YRwwbd3H+1JwBICXBVb0tgY32+Nh8QEiaHvPAcUAxQ7n3b4tZA+y3AwYcqSYX04nB/kA4QOVIYkHXDUZSqZ967UoM/O9zTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MAmTKl8Wx/kn7m86HA3ENf+E1FXDKhFgPuoTa77F5E=;
 b=Gh3N62ZEUJCatE32DqwLXlYdSv3xMoB7W0sccfNsZ+YxgzN52b54XUasfRcrvV+bbZzdro9lprt4YS7SFn8kM38vla5FVpkXAm8jtyKeKvRVPslPYief6GPSZvoxxAUXKqiGpkPm20Tqd1tQLvfQ0tuaM797uicNCVkOWuBpf0cwnXnIaAKkQZ2r0Ojb5WTBCAdM1O/Cv6Ofc5VTzGwWeJzoicg1TZHha7SLA2ydZYy4RfUQZNs8vWHO3xt+Gbg4pycdGBOOUoGJxVofO3IkDzu8LCLCnp3yCtbRO9vyOWXLjS542HH6M5Tnd3Odz3Q9dVzCtWdbZcJNcr9toMI+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MAmTKl8Wx/kn7m86HA3ENf+E1FXDKhFgPuoTa77F5E=;
 b=o1sIk3hyL/raGwMHx2hTTehZ63aYlAkb7QwPGVrujtl41n4axDh8HYGZTQ1H+zHWmeUY8UuwERj2gtfsywP2ArveC1gB5NDFPLSWr0BY9onzclyA/eqsvoIm00iZ1uV5AK1tN8GQeA/LReexP+apbI3P0Z0w7YSCuj+OIoK/yhNjGuin9QemXebSlbnmqApEbxgidGBXQGWkY1mjDCOpK6FgO7j4Bsd7eZoAsGbcOWh5VaA3OeIi+fApLCDDVM+6SvvAiEi6kDVtWsXueRleD5enS/LlkaBO53ybz7HXRgneB0Nbdsuom5gllObIbscF+9Gf9/Cai3odGTTMdkZX5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
Date: Wed, 3 Aug 2022 12:16:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3168f63f-722c-41f1-3df7-08da753947f4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4602:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SHEzZ08J/cobbFHxr2sO3j+v4TL6jCjrCDXLrh6S45wWf7sFqZhBv+XNmV6WyPvRAmC+74UaAhgkMoHWePvpPV5xfcJMkPsez4Xqv1UQ+/4FV4oxjADDJB4euHH2TyHkY+ihfijbzAaGTt5c60SoWsk8CH84Kc6MOCjUZB7SoztiF4pQ3BW1p4m+5oCXtawBeGkAs+8NP9KNpYIStoQdk3qmUollf30k0ZLkYk7f8NoysKLQZ2li41rGxmyiduf0GlVMP6UK5GYNm32f+a4IxuwPUwvAPzIU1NlRz+rkJ7s4zI6MDXSfYy9hClYJgP0lUkKP5brp5KlDI/DN0pzuikg77pLyGUe5W0BmlMDAPDhJ66A8YRZxLSFBtPPv7BrMj3meJ3C/EBTkEjDn8ESiZlLVRoAI8HOMB4aov4JccqsqQ81ijVZPHvQ7IoEoNWoT3bGcOw6kGcA4XK4kpOj2WsyWdlUKPU7hIicWUzvC4i6k+PDyR/PUeSUQxvFKN1zf7TXTKmzqU7z57Thwj7YTZbk6LkL2HUbvjkhVeVaxFR5w9XWesCdVXF7cy301r/0xxC50FmnmPaXLYm9HXlcv1iusuR4oF3jj2zTaSIUCUi2biCZip2xJwRk/8Uy1v2X0hWzefkDd1heK2kwGEUjoYEaJmvw93KAkdXKg9yyS3HqV7qmmByc0qgimBNibfczL2L6/+y4vByiPWmxTH62nnNcImg+Dcyv7HQMRiLg5ZrtZA1iZ7Vq987Ba84p9TwPBvtS88PPTNY6Q/CBa+PplhJsoPIVr0TPE8DYOgWNceQzVHRzKFzRA7lvjX3YtIGWBR2dXtvXtk4RZlu4JlRtYBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(136003)(396003)(31686004)(31696002)(2616005)(8936002)(5660300002)(86362001)(66556008)(4326008)(66946007)(66476007)(2906002)(186003)(36756003)(8676002)(41300700001)(478600001)(6506007)(6512007)(316002)(53546011)(6916009)(6486002)(26005)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRWa1Y2cXdISGMxNXcxVWUzTkZ4eityaWRPTUVRbGRSSzFqdmtsVUJRVmJR?=
 =?utf-8?B?clVhajFWQ2dQZWdGNDQ0RG41VVdkM1hUTE51T0ZiYkMxT1BvQWZuYzJwRlpu?=
 =?utf-8?B?T2VqN0xDa3lteGE4d1BudHdOb0c5Y1hzQWlieVE4V2RPMHZXWlp3UDFjV3Fx?=
 =?utf-8?B?Y1BuVW9PbmtCVEs1WVU4Z2Z2eEZqMWZneUhJNEFuU3IzTkRPN1pXSVQrbWhz?=
 =?utf-8?B?WG8vNEd0RGZyR01MV2lTUWQzWTNnSTNPZ0wwd1RaVEh5RUJkOHAxcDRpaFNo?=
 =?utf-8?B?YWlXVDRQdEVEbzNIaGlKaGp5Y0JoUTR1NWVYRm5FRzBhSXduUng0b3k4Q1Rw?=
 =?utf-8?B?ZDBXMmtjV2srU0pjOVp5ODN4SDAvczhzbWQzbGVSSGhXMXZmejhodDZQQ3l1?=
 =?utf-8?B?d0k3MWVFREFBb0dTRGVWZTlXM1pONkVVa2NSRFFCZXRCSTZ2NVhYL1VISy9J?=
 =?utf-8?B?clc5YXNYelpZWFlMWW1rVHgzRTVQa21rd3E1a1V6dnZYUGN5SXZaUXZPWEw2?=
 =?utf-8?B?YmJOUmlMUW9ucFBGcUg1S3pVZzM2TlZKVWd5eUpQRkxXR0JnNmFWekhQb0Q2?=
 =?utf-8?B?dVo1OHYwSTF3T3lOUlZaWTJHVEh2M05CSjZ3a2luUm9MWjA2QStsOCt2VnJC?=
 =?utf-8?B?L3QzbTFoWHQ1UlhOem5JN3FJS2Q4WHpnd0Z2RTJ3RnJ5MkRUWko3RlhrS0M1?=
 =?utf-8?B?aTA3dTg5dnlXVHBHODJuMng3ekZxM1BjMmhCQkRNS0tFWmJ6elBpK3ZJbTJW?=
 =?utf-8?B?UE10ODdTR0VFWk1FcE1CNk5PaEFiTGovMmJqU29OQ2V5WmhkS1cxQjZzTXBa?=
 =?utf-8?B?LzhLN2FTM2tUdDNJNnNINHhRUGl3ZkhIWHlmdTBXZGVJWFpHblhmYlpCbVcr?=
 =?utf-8?B?RC9DQzZDVVFvSUtWSnM5YXBxbGhBeUZ2K2ZMcWp4MTBtMkxQSmNkQXJOekNj?=
 =?utf-8?B?WENTSUJVTmtyM01rR25JT2VBdjlxdCtEengwQ3RlbUNkSFRiNmYyS2Fyb2pY?=
 =?utf-8?B?VG9VeVVGYkFkcGkveGNtNlZic0pTcnptRkZjUGgwbW44eGNJZnVLUHJUREti?=
 =?utf-8?B?emowdnhHcHBLdHNGY0J2QTFqbW5wVGgza05UVE4xRm9vYm1YaGhycXdIMmNx?=
 =?utf-8?B?ZFJTNVpSc1pEOUdkcGtnV1oxNUpkUC9JN2EwZGJXS3k4SGw1QkprVnZWSXN0?=
 =?utf-8?B?OUs1cjVVajlLK08vdXRWYkFrbTZqR3JBVC83b1JrekhFKzBOYktPTFFFVnhF?=
 =?utf-8?B?YzZxaWJpb3VNaC9aeVdaNmRycUNRclo0Ylk3d1gyck01anZwZm5RdUREZzRG?=
 =?utf-8?B?cUFPMytIWkkzcU9SOSswUjYrZzlYUzVqdGt5YWdhVnBmek9VVW9taHd1SFp2?=
 =?utf-8?B?Ym1Xa01KL0JCT1VwblRVOUlvNEhJKzYyWjIxZ1FmWlRiWndlWFBEcFZhMjhL?=
 =?utf-8?B?OFFNNW93cjIzUDJkMTVMREcwZlUzREVaQXpIZzJPSjMzS0VCSVYrcTYweG9E?=
 =?utf-8?B?dFM3Y3JEU1puZWlxVlQwbVYrUFBvQWVSQ1BPb0dNSmR0QS9EVjlQMW51aGZK?=
 =?utf-8?B?eWwwTjk3R2hxSCsrZDVoYzZ1WW50cXpJY0JSWXJWbjhOTi9JWUJEK3hLRWxs?=
 =?utf-8?B?WS9GZlJOd1hVU01iZXV3VU1VL0JET3k5Q3dveGFGOGNUeXhCYzZEUHBGMHFr?=
 =?utf-8?B?OE95emxrQzkrZGJqTHUvTEl5cVZ2c3RaZXdXWG1RUWxlNG9HRlQ3YmVrMkJ2?=
 =?utf-8?B?K0djSHhVMldPN2xaN25FMlVLZmQ2b2hiWUJTa2NtVUJFOUxubER3aUg1dWZh?=
 =?utf-8?B?UklEeklNOHdZRGZYWEI3K2F2VnN5NGx0dVIyNEZLbjVpekRFTWl6U08zdGlk?=
 =?utf-8?B?OWphY1JnRlFPSWFPeWJDalRIZXJrYVU0b0FldThGWlA2akVoZXkzdlBJQ3VF?=
 =?utf-8?B?RmRtdUhIbWdHTGpJWUg3eWF4Y2owWnFlUFY3UzlUK0IrMGdRVzJiVzQ0M2hv?=
 =?utf-8?B?YytLRWd2RlBFa2Q0YUZUSytNc1Z3RjF0dVZMZG9WMkZlVFAwTVhkVGU1NG84?=
 =?utf-8?B?YTU1a0h0dlBxYkVsR0NDNVY5dlFuWU1TNkd1UjVjOUNUVmtvVVp5SDJDOVRV?=
 =?utf-8?Q?pNDKCKTMZZTCvJbnETlIdfhW8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3168f63f-722c-41f1-3df7-08da753947f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 10:16:50.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOW6myQ7Xy+1YnFFNmgxkPI9RFPz+rkoPIqL2AMolf12AUKMmk9cEAZj7s+lqyqEqorlND/j8CvnWCHpzgMspw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4602

On 29.07.2022 19:53, Edwin Török wrote:
> Trying to include .ocamldep.make will cause it to be generated if it
> doesn't exist.
> We do not want this during make clean: we would remove it anyway.
> 
> Speeds up make clean.
> 
> Before (measured on f732240fd3bac25116151db5ddeb7203b62e85ce, July 2022):
> ```
> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
> Parsing /home/edwin/xen2/tools/ocaml/libs/xl/../../../../tools/libs/light/libxl_types.idl
> 
>  Performance counter stats for 'make clean -j8 -s' (5 runs):
> 
>             4.2233 +- 0.0208 seconds time elapsed  ( +-  0.49% )
> ```
> 
> After:
> ```
> perf stat -r 5 --null make clean -j8 -s
> 
>  Performance counter stats for 'make clean -j8 -s' (5 runs):
> 
>             2.7325 +- 0.0138 seconds time elapsed  ( +-  0.51% )
> ```
> 
> No functional change.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>

I've committed this as is since it was acked and is an improvement
in any event, but ...

> --- a/tools/ocaml/Makefile.rules
> +++ b/tools/ocaml/Makefile.rules
> @@ -44,8 +44,10 @@ META: META.in
>  
>  ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
>  
> +ifneq ($(MAKECMDGOALS),clean)
>  .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
>  	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
> +endif

... what about the distclean goal?

Jan

