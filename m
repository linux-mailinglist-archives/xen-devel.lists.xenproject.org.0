Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6949747581
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558510.872677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiAi-00053V-F1; Tue, 04 Jul 2023 15:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558510.872677; Tue, 04 Jul 2023 15:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiAi-00050X-By; Tue, 04 Jul 2023 15:42:32 +0000
Received: by outflank-mailman (input) for mailman id 558510;
 Tue, 04 Jul 2023 15:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGiAh-00050R-SU
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:42:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623b6172-1a81-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 17:42:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:42:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:42:26 +0000
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
X-Inumbo-ID: 623b6172-1a81-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G46KUb610RIawpvIDAo5W32f9k/cpwI8X1M8jMiZ5Yn+qZzGC0Kd2YDZiYjRUzb4MOBp0u9J0b62eO/iz383ddcuwqDX95QsSh01UuTMe22iHoYChwspGL2edPm1SZt5GaVN2HL6Ziq81K4E+rhQOznL2+oGdSVwM6WHeYb8/FPIiW+Yv2ZGs0uphK+tkBJAQsBuceT1T/GXufECcLYdS6ymraW4u99gjvFb10fbfgxoVan4H05UYTaVjEVoiuq2g7a18+atDhXiDbDZxSI+6uwzDYaIRkoTw04UG2qlqaKMmTlV1wzMEvweZqmUQSCqnkBX+jTcORMofnqSQuDAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuYGw/kTZAsFCEOIrRt7WS5FlKrDH4AEqbBh5jGxLm8=;
 b=jhOsWb+iHoEZQ+sryLwDPvc1/EaN82ZE02jUlTWGhpuLz1fu8zLPCKjnZhkO8DWMNddsWJctqH99g5b7McLpczdtoEFHOXiMVdy50r5eQkOMJR6i7ETDSEWJcHseLUcr2zAKGG4hFup/LTqOE5mQFzWjCFWaJ9+Dx00ohw678IttotAREWVEeprXVVjr3E+uDo2gj4+YaH5yghdizi4Nlu4aCBBrOHzwN78lR/hPAA/90+fe8Rw1K7BaqTC8905kMQacJwR1qv7HkbGxgeb+ZMJ5Rt8kNOoBchPqeYGtwnuiu/anCzASTcYj5rpFnwKHO7OxMUMcYsfouSK7VZea9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuYGw/kTZAsFCEOIrRt7WS5FlKrDH4AEqbBh5jGxLm8=;
 b=fohYXgONONwFaPYflCX0bHEPzNFobvr3s6PTWcsAkxaa002H3Ha4bFgtWD7UwitAj6MVQ86IGqDpgcIpeINgcyM5JBKHxocKHu9zBQtPphcl2vi5iqWdvIl6EBXaEickimStfIymrfqu0sjcchdLWTWezAfM9gzhC1HtSbs0STVxUu6uVYp2A8ulj3x26OU2NaJo6kc4fbKwKsaBy5IzxLxAi8r7rF/lYfnct/ao6XvZQiH5G2709fZD5Xxb40t4SfCJTQX+xdFSe7WcfXq7N7aRBw2aVLKnamo48LSTCMf+/836YjVC1r6GFtL0eP5flHWkaIh0ThQmWaldfpXfxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
Date: Tue, 4 Jul 2023 17:42:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd9fcc7-3671-4e75-e10d-08db7ca544af
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NWawoUDmHsO4LWL7f4EiCO+3Fv+kSkaduF9w9ewdFgXOCZD5Z1Cj8+qfRgVj8bnAZNhLRtejny9G8PtBShTYHM14v4ryg5AIWUvVy4+zNNfs3O+om3CGFKNEWBiiQsock8gMAqJxFmdnie6wkyl2+zW5rV7NKhiCDo3q/y23x6gRlqf62b8qqnddArK17dnfbGJVKwKRUgMxpRENPW101SegX3ZUQSdz5ARGVKXSIgLpP7ZdGXQsJI8SPxnBfYwLX397o+9JDiAuohFjJL5ZfgTkTf8G2LvVYQCk+0Zq7bSXPU8VEI/975eYhUtx+xhtp9JpQEtkdlxw31Dxooy91yOn6fIAok3qZYkwZm3mXnSUcMmfpXp7cmpl+EkA73vm9P9oyMtNP7MrPXaIA/aeN7oGmXZRBRAzHFx552nOYB9ba4DNtVoqj9GyIZMRLKSqDmcLXbxspVk8NMoYoz+nIJnt0Qte8Tv13r8BBlra+SdB/zTsGnvw1IW4KGiCv+AfkMJhonrkGpHHAuSX7GWdn+zi88xIK5VUmQI7Af6kOSDAWnyDzUWVUMRa3P9/hJI1KTIThXOuMI935per7Y2UZCS9zySYcVcQBhugxZBn2DJcbFkiqAtoyz10TmVM3UUubqTuapVPNP/5hsn2Hnw9dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(8676002)(8936002)(54906003)(478600001)(26005)(41300700001)(6666004)(4744005)(36756003)(6486002)(2906002)(5660300002)(31696002)(31686004)(86362001)(316002)(66476007)(66556008)(38100700002)(4326008)(66946007)(6512007)(53546011)(6916009)(6506007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1YxcmtiLytrK2lZRXphcXJsWnVUc2ZranhsNStrUmF0LzJ6YmNHUFRYdnlD?=
 =?utf-8?B?UXV6NEZUNHNaNTN3WFNJZTArc0FSeWlESllMamFIQmpySVdjQ0VaNTdkRnVs?=
 =?utf-8?B?WmFxZ0lVdEFnOGVFam1xRTRqUXR1UW1lcnlrUzgwMitxREcxWWNYaHhDVnhl?=
 =?utf-8?B?TWwxR3E1QzR0RDR5SGlzZ0EzcEtORXdLR0dVMWxnNjh5TENqQzJpSzV3VFlz?=
 =?utf-8?B?OWNZUCtBZHg1c1ZKWGwvZHpDVUlwNmswSGk2bUttcHlUd09RN1l6SlA5KzBp?=
 =?utf-8?B?WnptSlFUQ1NnTE9CeUg2Y1MvcEJVNm1GRGhodmRRZFpvNWo2dUZrdGZUM0Mz?=
 =?utf-8?B?blVXMGZGTERsOUxXVkpSSnpCTHdWc2xPem0rT21mRnFiUHdvR3lEZVVtaGRk?=
 =?utf-8?B?dWh3TDFaS2wvSDYrbklaTXhLZGFwRy9XSWloQnNNZVR1SnNhSlFkMmIyQ2Zq?=
 =?utf-8?B?bnhudEZJVEVWS0hoK1hNemxnN1VnUjFLaXVtd2FGaldYOXdVV0RBQVU0OGpD?=
 =?utf-8?B?SlZNQmJjU3E2dmZwcVdKY2lJaDNvVG03LzdCWmMzN3h3Q3hwMFN4cTNvc2pa?=
 =?utf-8?B?VnB4aW01TEJPRkljaFp0d1dmNUp5ZmxYWGJlUTFTVHRrdFE0a1JVaU9saU9i?=
 =?utf-8?B?RHlkUFpZQjA5K2VPVlMzaStJQjVTQVQxOHhIUERkZ05jVkIzVG13anVOTkFZ?=
 =?utf-8?B?QzY5elFsa1ViT1RzTGRkSHNkeTQrcXVLLzMvbExLTVdveVY4QmZ5RVJIT1Bs?=
 =?utf-8?B?ZVQwaTNuMHk4WkFBTnBhK2doQXNYeEFwbS9Kb2t3REo5S2ExYTgrZWN6R0tn?=
 =?utf-8?B?QVJnZ3I3Qks0SEdpcGg2QVB4VUZROUZlWEhaV2tKSGJnMy9RdWZtR1ZRN080?=
 =?utf-8?B?K3lqY0h5SVV1cWo4c0JWd2hqZm9UU2IySFZFUldHZHV0MmRWQmVid0lTNXV4?=
 =?utf-8?B?MDZDeHFjbkI5eWNEZnlSdWVCaWk0azc5ZVZUN25QMHMwcytMa1FGaWZzZHJ6?=
 =?utf-8?B?Q2t0VFNHMEJ2YVkvTHk0U3RMSlh0d29tMXAyVFRhcm5hWGZTbUtiSXNRaUhN?=
 =?utf-8?B?NEVhTVR3NXFiV040VzRxLzUvTnovZjN1aHJvZzV4bUVuNWZHRXkyemtsT3NN?=
 =?utf-8?B?Wml0dE9Cd1lIUEU1NjlRV1ZXYlBuc1B2L2RPak5JL0hTY3lMaU1PYjlWZnJn?=
 =?utf-8?B?VC9BakFiL2l1Y012WDFuTWdXeFNtTDk3a3VvTWozT3Vab2EvOUpqTm5ueWVO?=
 =?utf-8?B?dWZMQVhqVjJIS2haMnY5TnBYZmVPcWNBYmN2NFJpTTNTZmFnMWZxTyt6V1pZ?=
 =?utf-8?B?OFZhWGlCWmt4RWxkdjA1L0ZwdTZFVklQTHljY2pPZC9CMUozNnpUY3lLVDlq?=
 =?utf-8?B?cHhRTHdTOWtiTmJtbU9PcGE4OEROWGIyNGZmcjZWaHdUV3k4NllUdlcwQW9y?=
 =?utf-8?B?dHdISG1NRjAxUFhxUUZoU2ZiSkh6RXdGWWVpdWFkK1JjazVscmxUVGI1dThp?=
 =?utf-8?B?WDhNOXhUMUVsUllWcVhoNElONm5IZGhTUHVDOWJJTCtWd3NEN2RJWkRITUhn?=
 =?utf-8?B?RElRZjM0ZTJpTGMxTDRsbDZVWmVZWUVMOHJxWkYvMVBEanJ1amV2RHZXVUFN?=
 =?utf-8?B?bnFSY21aNHAyaG16amdkMGdLSXEvcXJtYWR0S00wdWpZQWE0SGhFOGVYaDgr?=
 =?utf-8?B?c3hoTzFPSGlJeHorREZNTWlWZ3FrbHhybUpuUDZGbU16eE1oMkJQc0g2dmJR?=
 =?utf-8?B?cHExVjZ2OXB5Z2VLci9FRlhrSElwYzdQcENlbHRBeGFKWFVQeDBabld5bVZS?=
 =?utf-8?B?bzNnNXF4ZDdlRkNCNXozbnhYVm1tM3JSNzg0K0tKcktFRE5QOWQ5dS9ZWGsv?=
 =?utf-8?B?Z0MxL1M3bkdxbkJNQTkwaEdtV0ZrMmFJaFBZWFZlQ0pURmZoM25md2VCVXlr?=
 =?utf-8?B?VllzLzhVbzN5NC94bzcrSzhyUWxHWkw1VjBUTmMySUYvbnVUbml3YlRvZjlm?=
 =?utf-8?B?TUpxLzNRUGgrRHRBb25aTENSTGlCNXBQNXh1aTE1WHp3MGZOd2liTU1jMXJV?=
 =?utf-8?B?amM3NEVnK1NVUElOL0Q4cW1zZjR6RDZXclNmOVZCOElrYnRBWDVCR3BHU1By?=
 =?utf-8?Q?E9AB6J6TwjxZ1jp5kxvhO43gN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd9fcc7-3671-4e75-e10d-08db7ca544af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:42:26.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbIGx9dHtAiJPoBE84AdiPJk/T7YMGIfBkuF3qyfJj8C0MTC2EFPX+EFyL/zzPQTdezFMJC+aGErfdAPGlcNDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 28.06.2023 11:46, Roger Pau Monné wrote:
> On Mon, May 08, 2023 at 04:46:18PM +0000, Olaf Hering wrote:
>> clang complains about the signed type:
>>
>> implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
>>
>> The potential ABI change in libxenvchan is covered by the Xen version based SONAME.
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Can we have this one backported to 4.17 at least?

Hmm, while perhaps simple enough, in principle this wouldn't be a backporting
candidate. May I ask why you consider this relevant? Plus is the mentioned
"potential ABI change" safe to take on a stable branch? There's not going to
be any SONAME change ...

Jan

