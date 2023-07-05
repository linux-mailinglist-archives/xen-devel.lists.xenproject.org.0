Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126167486BB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559271.874124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3kf-0002EW-I0; Wed, 05 Jul 2023 14:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559271.874124; Wed, 05 Jul 2023 14:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3kf-00028F-DV; Wed, 05 Jul 2023 14:45:05 +0000
Received: by outflank-mailman (input) for mailman id 559271;
 Wed, 05 Jul 2023 14:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH3kd-00026F-Cj
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:45:03 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84f8baaa-1b42-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 16:45:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 14:44:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:44:59 +0000
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
X-Inumbo-ID: 84f8baaa-1b42-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mglIsDgYji/n0RIRgu1L0gEW+VVH2FhDxgsKfCC5bcWQW1tvwFldtTlxBYyMxRuD2kaclPNqUSO9W7Qzl+GPPCny60YKKrPkaia80YVh5Ak0wJiaJUGtMBWRYsCtYSifV9+zrc6GPtAFxQvOX7L7/VlJ9i1l1t1ZrljqXKDSTecZMWBZFCnFyxxZ7WZFp4qQMjlrcMrV87e8F4hX21jCZL+Lf6JNYOk+kR7bCYHlt7hb0rimig3KFHErJXexWQs8NKFzkR1P3+NG2mA6NTo2weMQ36fdI6spfYLDw7lB53yrPHfDPTzCE504sBmMlX4ZJy4cmGFOnSjEj9Kw6mud/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko37wEC+VNTFnAWzbH9mATLPo7l3CEHB83K3DoPeiFQ=;
 b=MSHTicFmqe8N2foVuMDm30CAms3zIGHRo1ZihgkuNzFzwQRmuULG39TODEv+/QxUqE8sZnGfJEWFBJ5SbayWCYoqwklMCjZO16nnav6os9RMO32KhXfGZaGOeBQx991KsxqGM9TN6VcyuVcBrsx1bRIrYSLdAFIOgiB3hcFu4vlN1EObc1VU5eys8wQkYgdv+C/OdPcoPSfrpXpJOWndJ5eo+4X86d7cawOuoDRbfVFz9zvatxRiHZSqOJG60k/bopiB/5N6Jpex4LTR+3ApRfAh80Kysp/wIQBbn/SqvDG64McOOnaxTQhiaLlodY4FCsFNK/PuFrD4sAURZt9Xxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko37wEC+VNTFnAWzbH9mATLPo7l3CEHB83K3DoPeiFQ=;
 b=MuVsoCvFbwvwGCi0JyESlIJfbxMO71AZN9PQaiTnF7Wzm2qOwYSzFqydnVw2JcTJbJWaIeW8H2geZ6yj3Gs+QnBSVcU5w9aUF1Ga9jwMpY4OEJXdSBN9PL9V3WnA74Eo/QBXQBD9Uw4gTjF/ZWMCMD3ku1GHzxF+dCi4JXzx8is7wuhht3Bln+BfRx7+Ea05hxhqPaEQGR+xWb711nCXZz/c5orq2eRNXPrTERPY6UhLE+zOD4S25sKboQEaREnngEQx5mYyX8IoSBGkyt5HP4WRWR+SI1Wz5gu2tdGr7EEFXDSi+/3Wvuk2WCUJHTHW9KoM0bI83ALyf47bj5m82A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
Date: Wed, 5 Jul 2023 16:44:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ppc: make also linking work with big-endian tool chain
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: ef22a4c8-ca9d-4fe3-150a-08db7d66684b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9EMgO487SrY+cKic1g7DlWjmGYuRq3Yjql60AJKIrj7ihBqDdFIUxt5cWdsdWBCmgGlGEUiVrS0QBlZS2tI5RGihxlvGWVElvuPJfQ4R2crF/vKLEOj0cFS+lZjNE02ldyVPqQ3JnyJ37aRUPrwrU0af4gZrPMlQn+Rv2vfsgFjP6DXwyYiPazYqTDslH6GtZd2iItFCt2WJm5JU8gYpz/CGRWMq+wJhN/w6kk5uFdzZc5Cg7FpZ/Kch7+Kq8YRNffiVK1Cv0V0jSnH0HdzBOW+CrKXiD7xol1UFLZScYy4V3+ekYJhwXwaGZvIDqk/dVVdIV9gqc3IlOxUWQnF20X4Xv9a677EsoXAQEttukEVE1BiTB7/6o62HQHpxob2ml08mPS3jmWVLDtZHAUSRYhX7RELqL4Y0eq3HCIKTrCLNR8sY6V+DR7p351r99O8mpPxPoyH2Ko02tirw98FafS1LewTvEp3ZsWJYwpRl1CnQ9lRkx9vn/ldunK1rCc4lleiu+PHwb4iavU+06sL4+0XmkZ2Sdnw+YRJXXLNjbZ+Ds/4R177QpudcHaXAQ5JipBhRnliLMGdxZv2K9SIo0NrE7k2ntXgCVenhoyyW3AIV3b5itJRQ20JSRDRw7/B6KeKp8T6xnNYc9NYCoxweQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(36756003)(31686004)(86362001)(4744005)(31696002)(2906002)(5660300002)(6512007)(186003)(6506007)(26005)(6486002)(6916009)(66946007)(66556008)(66476007)(38100700002)(4326008)(2616005)(316002)(8676002)(478600001)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REJmZlo4V2VsaG1UUENidFIwczJHdWorMlhEeWJFWGcxMk9YNXhIV2JIZm1a?=
 =?utf-8?B?ZSt1MFdWcWxRcHgrckk2OVVIdk1QYzRqd29DUkp1MmxjYWFOSnBjUEx5blAz?=
 =?utf-8?B?SmwxQ2lTeWpVNHFvYjVidlhlamhQREdEb255c0taMXlhZHRtc3diR3cvVjFM?=
 =?utf-8?B?MGdVYVcreE9EL0xPTWwxQThUSmY3bVhITlBHWS9CWmFORXd2NFM3eEVLTTEr?=
 =?utf-8?B?TlNHV25TVVM1dzhmempIMTJVd29QY3ZmeWNQdG96cyt1dUM2ZFNtZnZqdy9z?=
 =?utf-8?B?VGFSNjVERndYdkd4T2R6OTEvbmoxVzJxU2Y5RDlyakZvbWpqWjd0YXd5bm5z?=
 =?utf-8?B?a3pQa1dGQWxWeUxOeFhsTjN5Ym1TbFNCNXFlemhkdUR2YVJZaXpFZS9LdFBF?=
 =?utf-8?B?RG12dmFTRGRhMkw4ckd6RFQwMmhKL0swemZhWjNDUzhSYWIyaUtrMmZsOTNX?=
 =?utf-8?B?UStncnRENEpYQldFRy9GbWxtYnVlSVlUNjdEbHVmVmxMamQ2bSs4Nk8rUDN1?=
 =?utf-8?B?SjZJMm1WRVNOOEZjQlJ5TFQxYVZXbHQ3SzVSelBHNVc3WjgzTGd4cFhtVHZV?=
 =?utf-8?B?RXR5WmhoTTlnaHY1emtLR29DaUV3dUI4Z1U2NXEzMjVWNGpKTm9TWDhxenk5?=
 =?utf-8?B?VnUwd1hUOFBkVkVyaTF2c25YMm45Wm9YWExkaitCbWtLcGtzVFZEOUt3c0c4?=
 =?utf-8?B?aXRGc3MzaXZBUGRRZFJQS1h6YjBsMFJvTVlhenBVZWYwRHpZVmg0NytRUGVB?=
 =?utf-8?B?QWM2TUhaMEkwK0t2MHJoUmkwQlU2UzVTU0tWdXQ4T3ozUHdOMFhGRGV2cXBx?=
 =?utf-8?B?YklRZk8zbitOUloyZ3dBL3BKSkVPemxsRWYraVNnVm8wZVJaOWs4dnJFMEpj?=
 =?utf-8?B?UzRibmJtOEk3bzFnZnhRZ0NoS09lNjAySXJOZlJqSG5hRFkvSWJuUUU5UnZE?=
 =?utf-8?B?aVRjUmhCeksrTU15R29xL0hQMTkyS0hucUYwRHVRVmFtN1NIbEhZYXN0cnda?=
 =?utf-8?B?c1REYTNpWW85ZWQ5WjFHbElnYjRmMWQwMUljRGp2QnN1T3BCNDBoYmlBQXBT?=
 =?utf-8?B?OFI5UVNGbVJ0dWd1dHlPVGw0eGVQd21hSjNWTlp2ay9OUDJZY3NUMzRWR200?=
 =?utf-8?B?S3ZFd2FpZEF0NGR6dE15d2wvcFcwMEU2eTFNZE1UVGN2TWZHOTRDaVgrZUVp?=
 =?utf-8?B?ZFNaMmVUQUFWRUcxQzhHS0VoWXBCVmczeWJ2TFhXKys5VlM0Z3Bna21XRCt1?=
 =?utf-8?B?S091NXdNT1B1M2lMVkZJaHNmdzc4c21aYlp5NFBSeXdtVDBpRnBuNEh5TWR2?=
 =?utf-8?B?UVFiMjNiY2EveFd1SFUyT0x6a2pWV1d2dnNDT21DdE9WZVhuM0VZNXBSUmZC?=
 =?utf-8?B?OGtBczl6MG5ldzF1bm1JU3ZVUGtkSDB0OENlTm9KeHlrMVFmemtaZlpCditH?=
 =?utf-8?B?MTVlZmxjM2kzWWhBTE9qRmtHdmI2UllaRXVWUlVDanN2eWVTSFJvbzhjcnZP?=
 =?utf-8?B?MGpaS29tUUlwcGxlMzJpMEdvQkszc1M5Mk0xMFRRcVNMN1M2UmhibHFoeElh?=
 =?utf-8?B?UU1oUW5jT0RJRHJkVjd0bk1QUnVVRWpiK0NQWWhlTUluTDZFY1FPWlN3dDdR?=
 =?utf-8?B?VEJ5WjFLL1JhTUhWTmlSN2VHeHJNazRhZHV5U0kyS0dYeEc4aVFCUUp4SjdO?=
 =?utf-8?B?OUJDMlR6WUFzNFlSVEUwbU1aaFFPeGgrSkFwZWtsSU9pRnFZOG0rTjNJQmdY?=
 =?utf-8?B?UTBHNkhvNDgyYjdDUWdSa1RWOU5vQWtOWUdyWUVwb2FXakhDdXl6b1pBTW1j?=
 =?utf-8?B?OXlCaHZVTGFoZ0Q5L29ic1QwV1l3NUdpT0U1SG5hUTBWeWlyK2doVG9MeHl4?=
 =?utf-8?B?RFIreWpzMHpHWkZMSHd5YjNWMStnQVNFdXZnU0lSdW5KeTBDNkN2aHpsZ2ZZ?=
 =?utf-8?B?NmF5RGlLbk9VTnlYRGVmY2wrektQU0s5SUxxSDZscXNhNENVWXMyWVo0MzFR?=
 =?utf-8?B?blJIMEdjakpaYzJWYTZldmRZTFI0UzRpeDNoUC9RUlBoUVBPOHk4T3dnUUpi?=
 =?utf-8?B?YzVjRjZYM3h6VkxjRDZkSldQaTQxQTYrUGk1WDVHRE9OdDEzNkI3TWh4bDFC?=
 =?utf-8?Q?OB5+C8uqPYL8DAXgfJo+YEncx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef22a4c8-ca9d-4fe3-150a-08db7d66684b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:44:59.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyW6un+OWSUdhRIP+trCnl+2Kk0FVNjTvXFWMVie2tULNxihFP3DqQYOEYuIZImhTKmn+UoK9kcTYwHCYcAhag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

Telling just the compiler to produce little-endian objects isn't enough.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -7,6 +7,8 @@ ppc-march-$(CONFIG_POWER_ISA_3_00) := po
 CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
 CFLAGS += -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx
 
+LDFLAGS += -m elf64lppc
+
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
 override ALL_LIBS-y =

