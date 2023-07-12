Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B24750AE8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 16:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562553.879278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJakc-0005uk-8z; Wed, 12 Jul 2023 14:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562553.879278; Wed, 12 Jul 2023 14:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJakc-0005sg-6C; Wed, 12 Jul 2023 14:23:30 +0000
Received: by outflank-mailman (input) for mailman id 562553;
 Wed, 12 Jul 2023 14:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJaka-0005sa-KY
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 14:23:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9f8d62e-20bf-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 16:23:26 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 14:23:24 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 14:23:24 +0000
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
X-Inumbo-ID: a9f8d62e-20bf-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEog0XhmmjXJwf1bmTbVETiyZPVUb4JvbySmxk0jxodeMnrhpqk3DyuPEVbaSr8NecrSxOoEMOJMrNJ976txdW6Fc/ldqmYN2V6/avfGBwtJC/3jOGb9M6lQetpeehF1U19/kh98xFPQ0AGsAKRSJxWa3iuaK45+52GY40OxkCLtnXdXrMCzSES+MAnFRsyopKWJv/1Fo7DA36YVHHzJZadiaYyXYFY1HIUtZobQjVSmbV7iGbyusIQUNR4DwaKf6x6J9RTcNsTFLKo2lJBUmsYymtCv1Y2Ylvhqc967ULydWy0eJ/yoVu8+DPIwLezPd4C2LPrY9K9PqGWFnEjxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7CXn2W39dnnk5PdOufiMOKJrY1668M2OesQaA2XClM=;
 b=b2ZLc9NeT7/CYP6CSNjts20wQdWG+ItES21NB5GukIqrHr+EBEbsQhgE9r81CEscEjrjX8rzurg5j6foxM4e41lT+cLJOLXdy9EH5pSXZb27kvX05ViIcPI3hp3R9X824mp1yfNtDYKoK27gBcfyIcIfqCaiJcU5XLuNdoShLaD/ANOKYuIi+U8Ko+lMzb8pTdP9D3/809/EUT13BsNJxc5FnONwM0atcaNdpKcMw6Z8kZWgDzO4hr3rHg3rOsx/VZgjIko9fd0LMpWRC2JnTfO1ykxSdWQDcJF/3SYaYd5mUUQ5YCUR2bFYIGIVLxZqdrnFgqIb++hoc2JNZTC7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7CXn2W39dnnk5PdOufiMOKJrY1668M2OesQaA2XClM=;
 b=KBNgtflVb2Nzyi2j3Y5PXB/SIt0eDF5/Css79fsaLPCaBGezZkzy3QjD2uSauEdY7o1C9qUN3UfmoZ8wgvyLKGxC5LEbp4m4dP7EaLqlkllZS6ZOkA9o7B4U6DSiS3WICE2sB1O4gzKexbjiN2EYnT5aw1Qby3cWm5qD9kvqmrD/pRpvg8d90qWyphql/DROsx1whNbgR3MwMouB/oqZ3MayiXOMg77n1UEGuuL6qX/U8lwun5IONKMAuMOy6OAJbcLMUS7VSu9rsRwSMHk/L5KshoJD/pW/dMxS6LcgPD8tia7bKqLpdqFP9yxV+ARyM3xIeZ22seF9jLHoirzLkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5b54663-77c3-5be1-ea54-3f18246bf77f@suse.com>
Date: Wed, 12 Jul 2023 16:23:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: correct gas --noexecstack check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 217ab0bd-6cd9-4e24-162a-08db82e38d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uXjHehHLwvw/s5zEcdUpShm+ZYFX6ZHV16YvAsQwBmx7YTWonoh4xkVHPP+bvvbLp46JXxbEg5PfvpPzJ6tsqCkA63Tw/S7hFpksycD2DPZkt8HoiGzdJr2EjN3t7STpvSKb78ANI4BLXG2YIB9Z4GapAzWIYtp5O2mWR5ZMU7Cju8H/AjXnp8jVgZ/ZiUxeekmQj9Hh3ibFG5VZEGQR9YLQVaXeS2qjfC6A9X10/ki5ZrdfAmyzHlWdQ0zEgEakm6oggYkmR+YffRzNFtGb6PnE1z+1gTeF3nGAM8IujoY76F22AnF8+Kf9ZMZIRYJZ9SlAr2JUpDyI10hdAC/eXCuKrq4i3SYY8IEtQuLq1L8oq6Yb9mKxLGLHjczfsblFP9UWqoG1xBftsMOYOpm+IVIycSNmbBtTv2dnkqLIAVhtzJAg2925u5RJBUpyufml4peJisAh+6VmTVjLEPLNbo42GbUmwHQYSj4TXjSG8HtoWRn1tg3zsfJnBFEfMnLix5DeL36tSBAIlZVqM6gF89tF10X+NjZarLlJt1V4ky5KeVx8jNCifDRkeo29E0wAdBIkWLf5BeF97qobNtMDF16Dc6aMe6YdonezfRsxUoBIbmLbkZr9H97gylxisLIia9pyTq0QBj3hyazxa9ZdTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(8936002)(8676002)(38100700002)(2616005)(41300700001)(2906002)(316002)(5660300002)(4744005)(31686004)(6916009)(66476007)(4326008)(66946007)(66556008)(6486002)(6512007)(83380400001)(478600001)(36756003)(54906003)(86362001)(6506007)(31696002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDR2bkU2cTMydS9HMW1uT29PNXBDaEZKcnVXUU9GL0FWZmZ1b3d6SzNmbHhY?=
 =?utf-8?B?NXBNU3JiUElzalp1UHFjNTlYSGJiZHA2a2VManBQTTJuQ1Jpd01nVUExdUFy?=
 =?utf-8?B?RXFQY0loVExEYkZ5RGZYaEF5SHlScEJJakhWM0tKWTJydmFrbGQ1T0RvUmFo?=
 =?utf-8?B?V1RkMGNjWThSQkpDUmZuTG5DbTNaRjQrQ2FuaU9uTVBsOEFIWDNaSTY4aUEz?=
 =?utf-8?B?YkdGcTMvaTlFRlpEK1h5YnpTUXJaYmgrZExCd3gwUVl6ZGxlbGdMazB5QU5n?=
 =?utf-8?B?akxRWGsrZHJkNTZ3T21XRFdCeG9BdWNxZldPMU1wbDl1aCs0YjFSWkZZM21y?=
 =?utf-8?B?dUhhbjhwK0hVT09kTjU4Tzl4RFdtQU9kNzIxdXBoc0IzcXoxaERud01Ga1h3?=
 =?utf-8?B?cUM1dllFRkRWNEJxakgxUk0rWlppMkZ3bVJlSVJQRmFraHprZStjTE1TMjlH?=
 =?utf-8?B?Tnd2T3V0dE93YjEvMEZBeVdLSStxZTJwZS9TbWU2QUNVLy9zZEZyMjRuZlVu?=
 =?utf-8?B?a25TbC83dEdxZktTTlB3cUdLb0toazVJdEQ2TkxZWjIycVhFNUdsd3lCUVBB?=
 =?utf-8?B?bHk0a1JNUGFnNmtmeTFnZHp0cEhRZXV1aVhsQS82bFRYWUdXUlVYekNEZm1H?=
 =?utf-8?B?eWh0L1hsSVZwTmtjeGUvU0FwUHJlL0hLMS9Xb3kwNkJNSkUwR1RKY2lpRlhj?=
 =?utf-8?B?cTF3amQrUnpYK0lyb1FWTlk1cjZ1aGwxVTZTdnExVmhJNzNjcUFiWFU1MTlh?=
 =?utf-8?B?d2xqMnJETUpkbzQ0UDdTa0JjS0RiVENQNThRUm1Cei9xL0VGQ2xYaDZyWEt6?=
 =?utf-8?B?cFZwd25EbzVGTTBuQTVrdU5UN3Q3UnQ0cXJ3bFVISGMxZ1JBeXNXcE9HdUhQ?=
 =?utf-8?B?OTdneUxrMTRRR2Y1alpiWk5sZXJkVEtUWTlKYlZLc1NrSlAxODIzUDNvVVNT?=
 =?utf-8?B?WWR1UHEzalU1MDcxeDBkMlRDaUJFUE9NaEdkOFR0a3FJMDRVaUswa2dDdG5U?=
 =?utf-8?B?N1ZGME44WTFiZWpOcnl3ZUZRZk9NYklvRGNuTlJXeVlaZFIwRUxIMmp0QWQy?=
 =?utf-8?B?cTJHUzBUam90WVdUK0FnRkltcER0WTVhSkJIeXM2c3diTm1OT2g2Um5YTHJH?=
 =?utf-8?B?RHVJRDZsZHpBSmxhR0lseUc3WnhCdmdRdVNiUHkrOTR4ZGdmZ1JlTm1lUTRr?=
 =?utf-8?B?ZGN4S0RxZ2lnZVpJeHVqM0loMXk2VG5tRS9yUlZibGdGZ1VzRlVKc0c3Rnlo?=
 =?utf-8?B?ZlpBa2xrSUJOVVUwaW9NMFZNTDR5YzBFanplZlA0NEszUytzdlY2aWpxUW1k?=
 =?utf-8?B?a0FSRGFOR1RqbWVISFlhMks5RmZYRFNRNlBRelUrTlNOcnhqMTFkTU5GMHhL?=
 =?utf-8?B?Smtpb1I0dElPbWFYaFR0azluZkJoaXF0QzFod01GY0xLR2pVV3BEanBGa2lO?=
 =?utf-8?B?Z1RCaldmU1hRdTlyeWlZL09XVVY1R1hwVCtTS3p3M2ljWVM2QVJ5VE5wcFVG?=
 =?utf-8?B?OEwzaHhvQStlclM1MGFtNnBDY1IwVW8yY2JCVDBJZHNtTkxhaU1kcHFFaEF5?=
 =?utf-8?B?Qk9UV0VGYktvOENLUG83MXV3empYS1g1RHEwWWJoUTk4MzNGWE8rS04xcDU2?=
 =?utf-8?B?RnE4eWJGY09taEh0TmVaSmFvamlaVkhHY2s4Ny9yZVU4TExyN0l1SjhkV3pj?=
 =?utf-8?B?U1FKc3l5SkhrWVkya2VYWGtZR1NzdDlRTUdSN3RKakVBUXhjNTc3RGUwM1Zz?=
 =?utf-8?B?ZlU4UG4rL0VDMm1KdE1FS1BiYmpEcE0welBETTdXZ3JIdVMrdDRpQnNrejh6?=
 =?utf-8?B?ZDlLdE0yT1NoM0QyZ3dMaGxvWHBVUEZkZTdBZ2l1L2tnc2VXZlp3dU95Z3k5?=
 =?utf-8?B?Wm5kMVZFRXRjZXZSMnRsSW01K3NMUVFKc3JOOE16MHNtcngrMnVlRE9mdER0?=
 =?utf-8?B?SFZqRWtlU2k5Q2IvRzZQU016Ty9uY3ZoamUvZTRTYjBuVGRzRkZTQ2tReTh1?=
 =?utf-8?B?aTFhWDdTUWZpcXlOdkZHbzUwTDJWSGpBVzJqa2REK3ZKNnNmZkVxTmZMT3Ji?=
 =?utf-8?B?ZytxNHl4a1pZK2V4eVZWSzBESmJlU1c4MDhtdzlPa3FIMWVjei9JTUJDcXRo?=
 =?utf-8?Q?7WVE6n/+z09Ae0LIPf2WiFhYo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217ab0bd-6cd9-4e24-162a-08db82e38d0c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:23:24.0059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRC+sTLpiOsBv7ytiD+GYv72abV/KSWWlRkAwcRQzURd8wZO96p6QlSWLKEOebWhQccwurQWKoKTMnTx1BhaEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

The check was missing an escape for the inner $, thus breaking things
in the unlikely event that the underlying assembler doesn't support this
option.

Fixes: 62d22296a95d ("build: silence GNU ld warning about executable stacks")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -397,7 +397,7 @@ endif
 
 AFLAGS += -D__ASSEMBLY__
 
-$(call cc-option-add,AFLAGS,CC,-Wa$(comma)--noexecstack)
+$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
 
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 

