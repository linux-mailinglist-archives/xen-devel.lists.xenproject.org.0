Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF077578071
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369640.601107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOi9-0007as-M5; Mon, 18 Jul 2022 11:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369640.601107; Mon, 18 Jul 2022 11:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOi9-0007YY-Ir; Mon, 18 Jul 2022 11:14:49 +0000
Received: by outflank-mailman (input) for mailman id 369640;
 Mon, 18 Jul 2022 11:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOi8-0007YS-03
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:14:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f879fa-068a-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 13:14:47 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB4321.eurprd04.prod.outlook.com (2603:10a6:208:67::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 11:14:45 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:14:45 +0000
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
X-Inumbo-ID: d4f879fa-068a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHasQzxO/0bkhuZYT90pYTtviNdrzVdrrRho/xH17JhPNYUrIQRC//xpKNjV6bwdOftXgrk/7+xSIHJvlOlKHiLhEcC0t9GRqzRf++ATEtf5daFgG97Pzdw7vAZTqX87QFWMt2gJ+deowuWyuIQoaVwlocVrrbz0hgFdQaMGYZH1EWENrxWkLxYbUVM+QxU6MATYAnV7cWz1pQPA+8BAyN3P/DqPmICIPBC3pvKYL6sSf+Gb9eb/DPc93xckh3IUYUGMBcKPewFIBLLp43Kn1Lh56JYfVSlcLwmCxsvV6AenT+nYxh3yWVqgnZAK95UoPAdRKXNEzk27RD42xUUZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxbXKbWmJ3gL0UC7Ykboo+il6m356gTipUW+r81+sLQ=;
 b=a0fZwkKnKlKClFzCfWTTre2ZP0+rD7D5OaXY4jqaLRylhBy7/T1YlaT1CbxfPYGGm5OeW+4M87pBvtqw4fA43ozMyu7xdNv9riZMMmikJWGomRgim61qQH6EIlk0ffW9hFFg3E+B6JlQGrnaleLqiJoZnlFhbYlv3nOdL2lCQCAQh9MG7wqxQxrsFxceIU3gqY09MG+Ms6g7pv4MTUafA9DSxocoUaGLOMUdkf+CQ/GghGtg5/f2A4/FUnvJ/sjsYAAaRT6WxTTNbphLyMBzOIu8Ls96l5oDFJ4qoCiE+b1kS8WOvbeqZ4k7YxykE91sfiyewYGTFa4EPVH9EECuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxbXKbWmJ3gL0UC7Ykboo+il6m356gTipUW+r81+sLQ=;
 b=jXxt6jS5Acm1pfC3pMp3zZ/nnVuuX2kHWLx1u5tYm27Iv9t2vhw3Cg3hCBiku+w5Pbtn1xYFXtmnlmcR9hpVdddDNZWd96ovGwMRvjA6aMJOQYoyA2KV3PB5YwnI2oUiiZtTiQFTJwq4zLV+TxvNyDo2kpuOkOTE/UKvOOkXhGvRDHerH4aepD/KiQaPAunRvxxB2ioOOL/QK8qBE+7ifJacnmXa29O4HOUNzMtkxp4pNI2xnrTkLyOFCdyQqNAUmkJPPXxaOKV5q1WA5/wLGFVkRtouQuIMdVnjYw7bmMSr5hHEe8/VcpvU5OH1PV7AREuo7YTMLNNhPSQy/gExfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <caef6b9d-237b-c5be-26d8-16da55fd9a10@suse.com>
Date: Mon, 18 Jul 2022 13:14:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
 <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com> <YtU7xF7+TE0XVTi2@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YtU7xF7+TE0XVTi2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09a38f9-a455-494b-ca87-08da68aeb845
X-MS-TrafficTypeDiagnostic: AM0PR04MB4321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	anMwTbkfpGgviYTyCCS0wDpXCnI15yg7L/6h6pgWB8tTtJDtNgkT/XGvRLmIKFwniAdRKtcmoBnmI9nsD9tA8bzUjMu2PWvL9rA+aSrAVUsrEMQ+T7ruvdgPJQuj38Skts1pyfvrWvThm4HjDbQnlWiYyQJMgRWpn2Fe9d7AbqyztO8URXxfAaFE/Hssp/PCWexDz7OX7IP+2HtAS3QlgqwnZvTGhAVuukoNh8fEQcgGijlP/gkIftmWyw9uX9IVP4VittZH/JoSQWF5m8kI6MbxGB6zx0EA54xvrvG5RQAAOrDQOI1hJbN8QDSN0tXHlpWy9t5WLqp/bZGCdJFkRc9XRKs8lpQ07exnLSBx7p/QzB8lGFfBs8PqeWVnWOER1su7IMsFriWi+qxnc8KV15WFvD8qh9QmZw2ir6YVKVb51mWMl3o9ZhthexwZ3ns/2dT9oSa31+hpacBAWMcMhqSe1FWN/x9WLFbqADNpP9Xc9f8dPSn3Frxo52w6Lgk/2S6ohzjttS3sHNnMotcxhn74DRDDQc+q6rm6QOKBGMfg/0gn+wAQMbWFNu9XsXAsXXlOks2fwwPjEkpcOY9tix/mPB8VLqwx9Cz5+dmYpXoS+H1GE4g1aQ0w01sZ4m2wbCHUf5rqnPmPAJM5V4ZmwPk1tJPPMlTYKR6P11NKKmiAA/VZ5uUu5dkZ0A+2TOIMzi4qivAag1rvwTytMH+tk+ek1sFKtSTW5mkUtEmEIINCvd+hQgW678fJ07f6dAjEi9Wh/Y4M8kufHzLcNdZIv2xNgy37wMtI3FrKa4nKQ9SLvdIF54l693bN677tigLhH6mn9MbBeMkzVredNyO/yw8RpxS8R5GOmBkyK0XTo2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(136003)(396003)(39860400002)(6916009)(186003)(54906003)(31686004)(316002)(38100700002)(36756003)(86362001)(2616005)(8676002)(8936002)(6486002)(2906002)(66556008)(66476007)(478600001)(66946007)(41300700001)(6512007)(31696002)(6506007)(53546011)(26005)(5660300002)(4326008)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1BCYWlzZEw2MkZvRktNN1h2RmpwZGtFNEdkMmZkUjZCTk4zU1JKOEY2Q0VD?=
 =?utf-8?B?S1Irdk1NZlNtbE1tRE1WYU53VUZkN1RjdW05MXdzWDFacm81bXU3QkFvYjUw?=
 =?utf-8?B?N0NwWDQ4dTdFejR4eFR2ZTlCQjhOVTFCZllWWGtLU0YvdVovL3NOWml5YzRG?=
 =?utf-8?B?NFlVeHdWMTB4OWYyZlQySmxmUlFTZ3FydzMzQk5lMWpFNTlVU01yMXZ1Qnd6?=
 =?utf-8?B?bUFNRWNCWUNDZU54V3RkSDZIWGwzR2tJeXV2Tm9Ga0o5UzBNQnQwNGo2T0FY?=
 =?utf-8?B?RnFaUENxV0pGc3Z6YldNTHE0NklHL2NmMWhnc1lVei9KcDB2aE5YQ2d4SXdO?=
 =?utf-8?B?TTdDeHhrRTg3YkkzRGZhbWJpa2JKT09MVnl2dytoUGRwbTdnV1dzaEVUcjUv?=
 =?utf-8?B?a3JtQTFWUTJrK3RpRHZ0elU0YUI4MUY4TGk0NWRwUVZIZ2VZakFhYmVqZzZO?=
 =?utf-8?B?M3UrVExCM1hWek9MeUlPVmdhUGxJcnpjYi9hbjZLdGZqeHpsalJJUUFhN3ZM?=
 =?utf-8?B?dzlHbkJKUjRmNG9hK1F6dXk3Y1FXdVZWWUM2aFNJTU54bkRIRHhtSXBYeGJB?=
 =?utf-8?B?ZEcya281OUJ5Rzd2NXBBMXNBT2w1R3dBaitWTHBpeTZlV2VEdk05dk9vdmxt?=
 =?utf-8?B?a1dkRVUybUQzN1NKNmo4NEJtSUdmQmFTa1ZvTGpjcjM3TE13VGRheXFhbTMx?=
 =?utf-8?B?RXRENC9GK1BNeDBpaFRLbDd0ckJWeWtkaTQ0RE40Q1FtdTFacnU4ZXlvNVpP?=
 =?utf-8?B?bUVQM3R4WVpoKytaNmYraU9DVi9mSGt2aWdzV2pQT2FSb1VnSFk0bjQrcmF0?=
 =?utf-8?B?NVZTVnhUV2w2SXZzZ1BYUGxUUlkydVhOUzI3SE1JSmVMMVl4NFlENlpCTVcx?=
 =?utf-8?B?VVM4ZFVPbnk1L0U3U1JZRE9oVTZvc1g5aUxEWG9KelVjaGFzK0k0dnlSTmhV?=
 =?utf-8?B?eGd5MXhsVlp1VU5KREQzR2RhOEpBbVJxdFQ1Znl6WWppbFl0Y2x0Q2tGR29D?=
 =?utf-8?B?OVBFOWtKZGF6c3BhTVNKNzFqUnRXYWZxVm5JME16d2ZRNGJBK1VlVWpjWkhk?=
 =?utf-8?B?TUZ4MWdjMjhWTEhPVHRHUXg4ZzNuQ1BaQzdlZDZaV2kxRStTVnJBR250YS9s?=
 =?utf-8?B?bHNJakhSSmdaYVlBRmZ3T0h3L0pvMnZYeW5IQ01ZNFRVRmc2a0RHZmphbi9L?=
 =?utf-8?B?QlZmdW0zZlJZaHQyUjl5Wm9mZUtEUXdiYXcxWHJCOWJEaGxOTFVUaFo0WlU1?=
 =?utf-8?B?YlhHaDYwTmh5ZDR4eWpadGdjYld0Nkk5aXlkUldacXJKOW02NFlnY2VZdHBO?=
 =?utf-8?B?YjJTc2dzKzB5ZWpHbDRSNEdLbEZEQlJaNXRpbERRdm1EQXltK3U2K1VYRCtR?=
 =?utf-8?B?ZEZoeWpFa1ZLa2JpQXhOazUyRVlDZkQvcERwb1VvcnhXVFNZc3Z0TlpEdW02?=
 =?utf-8?B?WjlFNFllQjZlV0xiUlpJK3hBQmk4U1RaU3NqcmJDWnp1cTZwdUN2ZzdwTURE?=
 =?utf-8?B?eExLZFIvWkFYM0RXdkJQRW5jUC82UEZTNWFEcXJnN2dMS2g0RUxYbUVPalFu?=
 =?utf-8?B?Ulh3QXFDVnptbm4wbHJFejZNWkNvRkFoamZJMFdOQ2JxVnZucE9xTHFTODBK?=
 =?utf-8?B?YXg3WFBxM0NidHh5TE1WL1dWRzNuSlFuQUxmWWxaUnJHeDV3ZmU3L0U1ZVRv?=
 =?utf-8?B?ZzY1UTRkbTArbnFqVFo0eURGbThEVHlMT2M3U3MyN1BxdXZPK0FUTXdmYUx5?=
 =?utf-8?B?NDE3dFR5cU9oU1V3anZxOHZMNi9KUjkxR21INWlvQmxuOERtbUIwVmh5MHNk?=
 =?utf-8?B?WURVQkRiNm0vNDF3dlZzazZhNGdQK28rNFJwNnBadHZqRmJabjBPL1gzWG5h?=
 =?utf-8?B?UnQ4MkZ1RXlRVi9tSUU3U2lQRlFjRGtUTDNUdk4vM216cjFDOTJrUFBXODBW?=
 =?utf-8?B?K1h0MU1tZGJiY2MzSHk0emZudmxsalh3UndyR2FhcmE0WlRCckUybmwxUHVO?=
 =?utf-8?B?eDByRTM1WWIvQ21hVTJQSytWUStyR2JML1p5ZWJmTkUrL1o3elViRXJiV2t2?=
 =?utf-8?B?WlZ3MjdnUmxUOGUxVEczL0xpalRyYytCZTY3cWJQNkNPMDArbWtyTERBUzBx?=
 =?utf-8?Q?fdPGWVc+3ERiUMUcxRSZyJJI3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09a38f9-a455-494b-ca87-08da68aeb845
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 11:14:45.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFS3cO1fn1Ul7181+kDJpCP2qvJL7P9fU9jmal5DRHHu3cRQeeZ9E1RbVUpWcqWQyKDoPbmr3mV8UgohlV03cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4321

On 18.07.2022 12:53, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 14, 2022 at 12:17:53PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -651,6 +651,46 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
>>>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
>>>  }
>>>  
>>> +#define MAX_EXTRA_RESERVED_RANGES 20
>>> +struct extra_reserved_range {
>>> +    xen_pfn_t start;
>>
>> Why not unsigned long?
> 
> Isn't this the correct type for the page number?

In the public interface - yes. But internally we (almost) universally
use unsigned long. xen_pfn_t is inefficient to use on Arm32 (and then
presumably also other future 32-bit counterparts of 64-bit
architectures, inheriting the choices made for Arm and differing from
what we have on x86).

Jan

