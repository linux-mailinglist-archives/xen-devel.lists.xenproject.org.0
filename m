Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C1494FEA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259081.446860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYDn-0001Km-Kl; Thu, 20 Jan 2022 14:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259081.446860; Thu, 20 Jan 2022 14:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYDn-0001HR-GY; Thu, 20 Jan 2022 14:15:27 +0000
Received: by outflank-mailman (input) for mailman id 259081;
 Thu, 20 Jan 2022 14:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAYDm-0001HL-4o
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:15:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6915d5b2-79fb-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 15:15:25 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-WBd_Ne5WMgWijTH_XJoRGg-1; Thu, 20 Jan 2022 15:15:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 14:15:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:15:21 +0000
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
X-Inumbo-ID: 6915d5b2-79fb-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642688124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0DCz8upcgY1B8XHbZS8IKAaDRpE99ojalz96LJu2cm8=;
	b=IYzuA4+2Qfq9094n78sAWw+tZ+bLGCndHRKyVpy+jK1aMSqPg2KFtRmT3D9NBc0w9bbbg1
	d6DFyYJLmeQ3slTiEtqsmK2upVv9PnlyltLdKryp0s1pgcO499umQXvKHlUa2a6lrwh2RU
	2zShHslN1e0qU+eYfbCKxSTsNmHQLjg=
X-MC-Unique: WBd_Ne5WMgWijTH_XJoRGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYnCy+jdMCJjI3feVgK5k3kcK6AsHaCtbeEOPVQrWBTjHRhCbAFh5rjQhfCbJYSr/Cdw+oMTdNoWaSusCepTZbMRRnG02jr8CsmLKKmh7vmcRZ3FMDV8y26S/9kvNYXApUx7BbWkXiBlG/8kmxSyKhSeP9vCZAeLFIb8nQsbA4zcrFXrxR9IN1TQsdwuaiX5pGZLLqfutU1b53CXWQ1qrMKwboyEExI3+y0RruGAzfElRHwZay4qWGcmvQhvaJJiHnmwTF24K5F9XVm0pBdaXzgU4pdYPXd6GTtCM2O0Srh/EsDDL4GxrbXNkJFcduO+jXWpgyKP0hOCD72RUEcXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DCz8upcgY1B8XHbZS8IKAaDRpE99ojalz96LJu2cm8=;
 b=ElkoEkZ1BcOYs5n9AxHVL8hUig3hHjaBryqbD6GYxcoszYUZ7/Or+/1Qs0m1eOflMZEGkiUtfpoGCCoAsKFD8VTF3sQh7aKEob/2aWz8YIYlUiUWVEUzLX0Sy6Cd8doiiPBoHKPCMxilYYkeJy/UjzUdz1Zgt3vLpX1flsYNg8A0dBc20dDbude9aXxQm+g7NAzczdXc42uTwmwAtPx/5iayoXvjhc+R8cNGMHEzuGrBEff3XZkeARq0oRqf7zzqgNvjNPUGVOq4Oa4UMY8Ld06k0SkuCKvq8c6E9Be7tGqJCtAk0MCIqieOwkFXhHKOWk6rTj660v83WrYe8VNqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
Date: Thu, 20 Jan 2022 15:15:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/Intel: PPIN recognition adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0032.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e571ea9-8968-451d-8041-08d9dc1f4b55
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192E42563B198590318B230B35A9@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2wI8qjf9+TARYAOO2W1GoszBcMLDEqsd28Mu4BQd6PPxgIQ42fnSNjsOWYnAsd2MpFCnxC/fVPd9h+KvviLW1Ao7YfWNVdnxzB5VLMYG0GLkoB+Zsd4C0+h9nlGnspyt52x2MtjFsMTNm6IAdleqhDlDyH5fwc7J/lIsLh1ahVYatyzKJGEaCG9LKgr8cK0YtvLpKUrnyuAmMI/WdWaBaEQFEo6lv3wo0D0f7yuABA6rcCOyvEuDIp5fqBKFM+wB0n+rBAnMeItYmBYwvO4tVAAS88945tIkupoISL+BoLm/yF+ELA6n1nyRWoFsB0rb6n5BydV11l9tp8s6xkJzDo8iQo3HmIoc46AJHxSHvlA968pGE0iT1xpK7xuWe4PMhh5wqZxovNISscSOnw25N7tJ/cu7IXveac36OaKIID9cg2H/rkCtVzSf57u/t3/kBgfEEJxFHdpjpj6gtt20GqR1EFbM3gqF906C23KiOO7irV13qQjy2yQnR9A30hd7GiTSInZvXhupDsfL5MTJuAJUDn+S2hInH1xgPmpWM0vwnNcxqiuy4XC3HwHbZdZEXbDQ28oV/6Esmc9a7zi77bnsJ6TOEabhC52EisweO7Z6apIrWjF3SxV628p2Jow4AD7I5kLxlXapDeUyQk3ExJj81hvY16AV/ikRdzjYNTjPJTjFu6BOLgiSv1jhTUBm2hvmavOd0Ez6F2Oj61aeWb8DRsvdyzd+KcbgFGbZK5Bw1wJTYhuwzu1INVNM8hOj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(66946007)(66556008)(558084003)(66476007)(6512007)(54906003)(36756003)(6506007)(8936002)(186003)(5660300002)(31686004)(38100700002)(2906002)(8676002)(31696002)(6916009)(6486002)(26005)(4326008)(86362001)(508600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk8vRDdSY2h0eTdwaVp4WXpmUkxXdndwdlJBaVNUZStIbUUzMndYdkpxVjdE?=
 =?utf-8?B?ZEtvODRCR0FPOWZHSkVEbkx3c2w3L3RZNzZIMENiSWxwY1p2V0xCM1JvVEJo?=
 =?utf-8?B?VFpjT085TS9TM2VMV0JIRDlJcmN3Wkloc3hZK25kKzNra1gxTkdzLy9oYWN0?=
 =?utf-8?B?N2pjREdsbWFBQmxScXlVT0oxRktlZkJYZ01yc1FJbGRpbDJlVWhwUXlJZllW?=
 =?utf-8?B?Nm9vWi9ucytseFYxdjZpTTltZk9TVmZIOG8wVG9QZTNEYXFQWVpyQ0ZRZzcr?=
 =?utf-8?B?YU1za3F5MTRSZ25jL2VQdUkzb3M4YkRsVkNEQVVvOFkydVhSR1RHMzFqcWMw?=
 =?utf-8?B?aXZpaGI3OVpMOThlMHEzckdRQXIxWHBxOWJXbDRQZ1REV3dwWlliU3pLV1Vz?=
 =?utf-8?B?U3B6amVSSGQyd0s1VU5pSXhhcXRVZ2hYWlAvQnRLL2czV05WckNvVVE5TGRz?=
 =?utf-8?B?Yk9KSzVjOEwxQmZaQTNwbG9VWHpwQXp0VVlXYmJ1c3F1KzhFTUFSaStUS2Ro?=
 =?utf-8?B?MWNZSURZUDlpSGUrcmFsb0s5L3YrZFJ1czdZVnN3MStQZ3hQMVgwN3kwbU9P?=
 =?utf-8?B?Rk1lZXhTZVlTOVJnUWd2QTNrNHVFdEErL3RWUE5YbE1NYlZjTkdLR0NaZEpI?=
 =?utf-8?B?YXdtVjJYMVRWN1JuLzkwaDFUYUUzcmczL0NIYUZ1YXo3N1RjUXJFWEptUGcz?=
 =?utf-8?B?VzlsbVR4d0hZOVdRS0xscTFWMjhIc3FUUGsydUVmNXdTVXFjeS9XUkthbi9W?=
 =?utf-8?B?ZG84Nkl4YjMwSDBwMHdyUjFhZWYzdDN0bWppelMxUWs2Y20zUFk3ZG51M0t4?=
 =?utf-8?B?MFVRcjhtdGxzTUQwRE9CSWFHcmExM1Q5ZnpsZ2o5ZllPNUpFN1NiZWdIcmJz?=
 =?utf-8?B?ZXFBZ1ludHphRkNFbU5mUjRtWDhYR0w3YmdmMytjUkU5clp5aHhRZS9lcHQr?=
 =?utf-8?B?elVDRGFZcXowbmtZWUxUb1BMU1pFZjB1K1RsSkdrOVhLRHVyN0ZLMGRTZ21R?=
 =?utf-8?B?c1ZhbHZ5aGk4UzRRaHVITTdWdlVXTXlVUitTSTIrQnU4eTArR043RWRQVzB3?=
 =?utf-8?B?WlV0WFBqZHNLWmUrWnNURlk1RjRjcWZ0aDZKY3BRVU5xek5ZTGRvODJzczJs?=
 =?utf-8?B?RERCeWtDa0Y4cW1JSEV2bkM5Ym5BQWJVSDhRSGVTR0pzRDRPeXN5VzlFZWpW?=
 =?utf-8?B?VkdmZ0kvTFhCcURzeUJReDJ5SG9DY1NEUGEwSXU5elZ6Sk1rZ01iWDlkVXE5?=
 =?utf-8?B?ZmxQbDJJY1ByOVpSTExYellCcmpYMUNOb2I0SWhIakM3VVhZMlFKOW05L0Vl?=
 =?utf-8?B?OE43c1RXMkVrak1LZE5GcGdqWXlwSDBXMEY5azF2dUUyWFVLSjRYNFJ2Rnpo?=
 =?utf-8?B?QlZ6eW1TZlFVamdBT0xhTCtxOStIMkVKb2R1ZExHTjRGckZzZUM2Sm5XQWdo?=
 =?utf-8?B?SlVjUXZndUc5bW50YU50STJaVVJpMm5XQ1o1Z0VNSjFLUGE1YjVvS0RuVDBs?=
 =?utf-8?B?NU5NMk5HVnpPbDIrQkpDd0xSd3lVRFJOWVp0Q0tUODZWSmtIS3lndHZpRFUw?=
 =?utf-8?B?RS9EYnkwQ3lzMkpRcHVEemF5NmZPbVRyV2ZSQ1VaMmpFdVZhM1llWkhYcFRi?=
 =?utf-8?B?T3U0UDVqaDZhWUs2dUNsK2VqbkRYQTJDNTM3bkNIYWJERTZFbUN0Y0pIN2FG?=
 =?utf-8?B?VzhVQnFaanpnSU04WlA4YWFoTmNuODVuem5tVDc3RXJmZTkyb2xEdWNJb1Zh?=
 =?utf-8?B?eHhSQkUvYW03RkppZ0RUU3hKQzhkOFozMDBacFF5VXVQeTYwbk00OGlFYmZs?=
 =?utf-8?B?bkpUU3AvSXdnWXFBYmt6ajRibTJZNmZrTXMrYmRqdUVtRnlkbGtDKzU3UzRG?=
 =?utf-8?B?a1dNTEkyMjVFNVdibUsxQTRtN0lHck1WMHUrM1hiQWxKVkw4bVlKYmhYbUN1?=
 =?utf-8?B?S3VHSDU5bHMyL3JkOW9vYUJJTC8waFkrNjYwNjB4b3hhd3N6NG92bVcwZmFv?=
 =?utf-8?B?amtDalpOWVVZL3kwV0Q5MmliYTQwSE92VEtaR3k4c2greERkUVowemx4ODBB?=
 =?utf-8?B?THkrSk9RNTF6a0k3VXBvU0V2MktCZHZub1lUcWZWeThEZ01mZGZnRk9wWkpi?=
 =?utf-8?B?U1haWll6NEU5TDdrS3lRdldpcEdRR1M5YVJpd0NsQ3ZZNmc3TUh5ZU9Edmt4?=
 =?utf-8?Q?N2qWMMHET5TO/Vc/CdeBiQ8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e571ea9-8968-451d-8041-08d9dc1f4b55
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:15:21.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pMzty5e7gKfDFYwSRVxT2B1ticxKbYuoSByBg7gp0g74Hb3cpEXSx42KLeec29YAIKFOwBZ54G/zdTL+FyPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

1: Sapphire Rapids Xeons also support PPIN
2: use CPUID bit to determine PPIN availability

Jan


