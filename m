Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A86757F10
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565304.883338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlOJ-0000V3-JL; Tue, 18 Jul 2023 14:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565304.883338; Tue, 18 Jul 2023 14:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlOJ-0000SC-Fo; Tue, 18 Jul 2023 14:09:27 +0000
Received: by outflank-mailman (input) for mailman id 565304;
 Tue, 18 Jul 2023 14:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLlOH-0000S6-Rp
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:09:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b270a718-2574-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 16:09:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 14:09:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 14:09:22 +0000
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
X-Inumbo-ID: b270a718-2574-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNQITBep78S0M7QdZBQcg0qaGGLpuz7cqGKYPHuRZ4qb8tlClGToygNn2P72E/R3WithAsdJ7UfawU3YSNgCTLRINTmLYTXY7WAHeqVjix9vr9r/hNfGdXkiSe9X6tn1IHD2iVqmLdx9iFc003v/4WVB2gzxjUlcWeE39YoAeU/WoBpqRdikWb3b9Bs+VmpoO8XSXtjJbzZXqAQ0cHix1ZRBJuXd+IxqxImpKsu6omQhjNKybaXEJlbvSIOf7sXH+TW81WUU+pDACxaVmvJMeF0j7KAOfsB3a3cu+LSzSkTPvt3ewJvyMnZWRNovTMr+M0d2+g7bilmG/Xuz1HmpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4hh92Sg4gGQ0/L6cznxSDdrRp6l1w8e9FyzrkBObjY=;
 b=W3BTrIyko4tYQ+IPXDVsnmFvno56jA4cJhd49NpZIRoIkMih73hhyA0sEt4IWJyEncYQ9IMdiPqOq5gbAGA1rVl/mRVR3HOZleyvkedFsvdXyjODONR1PVBkM+V03qtnNYSRPCkUCuUosZNRJe3bX87q67f3JZ7/J1HiFjfRB6MkJQ2mx9WbTSt+7mc4obLFB0b3PVwQQG3S2jv7xZ3XAYb+DEcbioIp5oWek1roQI6ihGLPkjdr9EH+G3Dxn5nYFFYH3+otO7lho3j2T2x/R3P/zcAuCszB3/74U9nvEPLEkT4T9+Byg7CrivwtG32rm7L/Ms6hhL79NsMIsg9chw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4hh92Sg4gGQ0/L6cznxSDdrRp6l1w8e9FyzrkBObjY=;
 b=cWVOD0J5WLlcQUxpq1JBYKKSN613BiwSYq/WnAkg1sU5mDUHJMqO8pkgE6dKsk7s7OTMsLSYKjOWF2AdWrulm/55isQen6/CJs5aebnpr9XCF7jhlcI4NoJoiOsCkHjElNkiHZRJ1vQZrk9sHUNlTLbFmTX6x6OJjKaNQpLRZIz4E9zu7W4k1j5Z6XEs56kGWGs3LXmSLGIN3jJtNmk4WpuycCMpnMq2NaHuGMQ2acCbW6fL2Iz2mXNJ3kVtl4gCTvFMfqSLxf2v5mF1ceoCmG4XovT2nLmHz7EeO9B1huCrGCNlREWPTufs8Zs2Tmwks4SKGUPQOl9LRFC3Iod1SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ba24ac4-1f20-906c-8e38-6a8b040af35a@suse.com>
Date: Tue, 18 Jul 2023 16:09:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0.5/3] build: make cc-option properly deal with
 unrecognized sub-options
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
 <fe4c01c0-91cd-a303-71e9-96a81e46ddff@suse.com>
In-Reply-To: <fe4c01c0-91cd-a303-71e9-96a81e46ddff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 0042eec8-db12-4e2e-42d6-08db879895ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V9qrGu0ZEFJRmdpGZifyurH2f9i2x4qstp3oOiciQ+dBtof53VFFxwyF2g+f8xt3bwr06dh//8S8I7ZEFti1tbM5dJk693lrhXt5hkRM8EQfk7Mp2Q6CgHViyoQBRhh17+q+mpNsGA5mqVSNrV0I+MY+P2abS2nVcPaQsEVshrTHIIyz8ltewYp5h0BdKihaTVBkNIS1a2lrzB1cWPWoFKkHe72gjIqeezofXHYO2Jo84jIhGO++sxEJmdFoTKZj2fPqvdZTxHPog/SkmuByisNNfoltbObEl7cpktWyVuHpA8wdXVw20SmAt+rObX7iZkIz3bd8BMAcmWQ1dTY4u74CzjxkzHRavrSCW4KhpMV3tVkvWnQMQ1yaBaj4xmlmHJXMJgvYw7zKViz3P+4C6SeV9qAGq2qH4IkjlbyY3MRbyULWUTbtpqISywn3PJ9wu5p0UMxqCYtBKtzKzZGkq7vy/qowDAvrhrIZ7OpFmImkh7Z4k1laDYgTV/BFnu0LDkO7/YTA/z4QClohGtJAJYdFU9A1lfEgoIBhUS5UNrKxoJ8NJKrjB7onF37PoxVLP126vpYnajzulUFFAHziHVTIcKvdWfS7+6X4HgW+Cxla3XAd8FaDH54lIAV3CUpqRpvk9Utctmde/K/6Jbfk+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(2906002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(6512007)(6506007)(26005)(53546011)(478600001)(6666004)(6486002)(83380400001)(186003)(31686004)(2616005)(6916009)(4326008)(316002)(54906003)(38100700002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9uaUh6blREcm0yL2ZDWi9QcU9hVkNKdnFLbjRORFdlcnVoOXRnd0FpUFBl?=
 =?utf-8?B?U3QyaTNmc0dWVHFIT1dJOU5nNDZFL0lIUkZ3dXAxSW9JUjNqWXhvbko0NjZp?=
 =?utf-8?B?cEdYS1pzTUpZZmdDTzFNY24wYXk5ai9Nbm5wZTBhRWE3dzFHM09rUlJFY3dR?=
 =?utf-8?B?QlpuaDJOa0RnT0EwU1U3ZkdZQW9NM2REYTB5bEwralA2THdZd2g3L05SVFF1?=
 =?utf-8?B?V2VvVWdOSzlkaUpBUGxZZ2ZCRGwyYVBOVXVrdm9ZMHlGOGh4dm9KbUl1d0Qw?=
 =?utf-8?B?SEFrMWo4bDN3Y0tUT3JjNVpzQWlZbmc0WTVPWm55cHBmSEhVUzdrUUgxSjg3?=
 =?utf-8?B?WkdTakJmSDJ2aDhucnd4Z1lUazNxMkc2dy9FV3ZaTnVsV1Q4eUs5cWozSFRm?=
 =?utf-8?B?MDJFeTc2a2VjYUV0cmpIc2ZFM3lRNC90SlEyaDRyUVNpVTNhK0x1ZllLSjAr?=
 =?utf-8?B?a1l3WGJMOXZoaUwvM093NDdYai9GV1NBQUtRYk9zT2dvbEhCQzNWejZVd0lo?=
 =?utf-8?B?cWZLVUJZRlNkcTBRQ1J3eU5ydkpKNE5XWkhlOHJ2WnZHdDQrOEdsODN4OVo3?=
 =?utf-8?B?aGs3UjdRZjBUV0ViR1pLbitFNHhsV2Y4aml0dmo0eGprTisxUWFzWVlVbnQv?=
 =?utf-8?B?M3Ywb05YTFJ4cnIvVWlucXozdFFxN2cvcXBHTS96QU5IbnkrTUVTQ3dLVW1w?=
 =?utf-8?B?QkFYazdtZWJPZ1pQK1VJcmJ2cm1ZKzMxV005UEZtM2xRY0FHS2haUGFXMFV4?=
 =?utf-8?B?dWgveDkwaGFyWWZwRzZWbTVCZHY5L1hOcjdoOWNJdm4rdDdiQmZFUWdwTG0y?=
 =?utf-8?B?RjRyazVYV1FYdlRuYkplWUhYa0RPVjVPMWRGRVBXRUpLOTBHVTBYQ1BTb2pP?=
 =?utf-8?B?eXFGdnhHTW9MSWpxb2J5TGhqeUdlUnArbVlmNWtQRzRBeG8ybmxocXluWXRZ?=
 =?utf-8?B?dXNYMnBVWG1TalE3T3JnRjNUVFN5YitxYURQWTZkblpvSFU3TDhMSzh3Sy9E?=
 =?utf-8?B?MktYM1J4d01qNHQ1aEpmcElOVzlWQ21OdFo3MnZCcHkralQ4K3NlRWMweHEw?=
 =?utf-8?B?cnI3QjlUdlpQWHpsdEtwM0htN0dmOHAxa1o0VThqQjZVZDJDQWlXcU1WOVZi?=
 =?utf-8?B?elRObEJSMEp1WW5uY0hROVhtdGQwMEkrMVBPN3lndkk2UU5QcnoxS0VsUVd2?=
 =?utf-8?B?aFZmczUzbjJQdU1pYklkUHdodUZFZ2FxN3U2MmtGbVVMb3d6RHR6ZEVSdHAw?=
 =?utf-8?B?OFZFTjh6S2wzTzFFTGc2R21YTTdCWjNhM1FvTEVKbHRFVVhUOXFkUzN0VThD?=
 =?utf-8?B?RmhKc0dxUm5ISVVOaUhKVzhCc2MydzI1QldaYzlUR0ZVZmlHRy9QSCtXQ084?=
 =?utf-8?B?amU2Ulk0Zy94VUpkY3RXK1h1dmtQa2NPRDZqYzJkeXRBNHFEb3A5b0QrY1FF?=
 =?utf-8?B?TU05VGNpSEpORDYvVlROUjR0SmtqekhGZWEyWHZNY2ZRMFpvL3Q2c0V4ck14?=
 =?utf-8?B?TU9YRlczUGxkL1Frak53V21qY2lSa1ZMSWdCQnRQZUVTUXcvSnpmbTdaSVJN?=
 =?utf-8?B?U3g0Q1VpMms4ZW5zalVtU3BUeExGY3pBSXZ2MmY2bjlLTWh5eEl6UWxqV3Zs?=
 =?utf-8?B?dmNHS2ZVclc2T05aK1Y5aTBnQmNVTnZsek5kK044QkUrd1JFZ0ZRckNTcTFt?=
 =?utf-8?B?SnRRa0tFQUJDemxGUksyUGMzNjFpbm4xdjBmVzMrSXBGbVpFV21HL2IrNkha?=
 =?utf-8?B?NVE2ZzJzeThaYjQxQWFXSUZRVE1pMGNkU2UzTDVScEhPaTEzVTlNL0hWK2ww?=
 =?utf-8?B?NForb29zVHlMTnRZWjVybisxVUM3dVZCSk1oZ0NGOHNEZ0xVcXdFOXl5ODNB?=
 =?utf-8?B?ZXlXaEdwM1ZwbUNGMmRQV09aWVhyUHlmRzk4VWNHa25DeWQrZVYrcUZuaWhN?=
 =?utf-8?B?emF3alhIQmR0Ry9tM3RxUVJOSTNrcndEb0xiR01kRnhiZEpkaHRhQWp6SW1z?=
 =?utf-8?B?djY5emRGRUwvYUVWdDYrazR1V0s0SmVWcFlYcURqTFNlVEx3dzlCZ3Y5WTR3?=
 =?utf-8?B?SHpBVDVwZVdKeDJlOGU0aGQxMXBybTBCbU9aVHRGNG1xNkY0RjFXcUVDQTFR?=
 =?utf-8?Q?pUdiJ0rqDbJHvd6mYd1rVW362?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0042eec8-db12-4e2e-42d6-08db879895ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 14:09:22.0232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev3BuJIxHtYrw/5Tws20ME1frgUGlVxKvXB+CldFwv59V8o+nZ9UAGQV3VxXTEHKAv8WPlyhYm80QiEVWm73Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366

On 12.07.2023 16:26, Jan Beulich wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -90,9 +90,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>  # of which would indicate an "unrecognized command-line option" warning/error.
>  #
>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
> -              then echo "$(2)"; else echo "$(3)"; fi ;)
> +cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
> +                    opt="$${pat%%=*}" arg="$${pat\#*=}"; \
> +                    if test -z "`echo 'void*p=1;' | \
> +                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
> +                                 grep -e "$$pat" -e "$$arg.*$$opt" -e "$$opt.*$$arg" -`"; \

Sigh. At least some versions of Clang (I'm looking at 7.0.1 right now)
don't quote "-march" in their resulting error message. So I guess all
we can do (without finding a different approach to the checking
altogether) is further relax the grep pattern, to

grep -e "$$pat" -e "$$opt" -e "$$arg" -

Of course this has the increasing risk of getting false positives (i.e.
false negatives for the overall check result).

Jan

