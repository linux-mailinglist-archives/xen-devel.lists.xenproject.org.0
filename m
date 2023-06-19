Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4B735B3D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551168.860543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBGxG-0003S5-5q; Mon, 19 Jun 2023 15:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551168.860543; Mon, 19 Jun 2023 15:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBGxG-0003PR-2E; Mon, 19 Jun 2023 15:38:10 +0000
Received: by outflank-mailman (input) for mailman id 551168;
 Mon, 19 Jun 2023 15:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBGxF-0003PJ-3w
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:38:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49d04995-0eb7-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 17:38:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 15:37:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 15:37:37 +0000
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
X-Inumbo-ID: 49d04995-0eb7-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mA1VAfwjm8j4CbRjdEhgDJ9lrF+Jjlllx3FYE7B1lZqMHQpBIwGjFw6CFerOr3B8T3mAzjXZkLOQqS2BP95uDMN49F2tOWEQNn0DX58XriH0I74FAqHLLM8KJtuNixXxQ+33hh53kpBsCNsYLAe65il/svkL7ZpODzS+oEi2HA1D3gSCJ9rSv5lNBsr2ZUQfqWxqvvFepQazKp2vwKZS5iZw645vkW2SzOtyUDQtEbEUB5INbeRnSYA0JYSDhuBsLUceoh7E0QFGCKjd6qgGXAZjLBmXCeiWsnyvo+alHf78TMf3Wt/gPM7soJ9dZB9BHJloCOTZ2rMxGgRvVzRASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KI/0PFhYowJvlwxrMq486Fy4QKm+MUlfP82GyNq+IU=;
 b=mGICaRxgWwkNgmEGzv467yEUKYmOUvPlzTfxhfch/+puVp8VgqZvTl/lDBRNwjuzPR3q3tvsnhTvL7tt0PJYWG/0+Fqbc71HhgJRS6mOOx6X3sSskR+M66yDRr1Z81xLv004pYK0HGESXEkevwgYF3ZVRtkylp8B2ujBVnTp2kOrqhNOapyPJfDM/UUA0m2ilVXbLhxLSIs1AEnd5/1GxddWAmxpuYHajJBgULqhRHeZGGOBETnlBCPB+eMPVD4btwnmGtRTMm8WyiPWcMXncYTpMZ0igO6Sy4y7/9Y7Ga+N12jTo84ox7FoLwJsoFCwb0k/QzP1H7+Ujm61IOrPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KI/0PFhYowJvlwxrMq486Fy4QKm+MUlfP82GyNq+IU=;
 b=WkOe7XXoIXc0bpguszg0SH3HfGPcTIgUXFNUaGpxmJ3Uy/c1xB4893oewd4qvS72Y2VwLDYV5gk1CwwlGhw5r1kmWUYmEZIR/zQW8d00o5qKqDSOR4VAjxOmZ/Vc66CqRm4+e4x2u34ndV5sPNv/qjYD4PNDpKISetAtk91lqgDliXUhr/PZyaBlYmDDHXbH9+x35xdAywdEgkLfv8vjgYGq9CUHyiOlLi1lXE087MqNqi7XdT+FgrVCPAr6Q8/LOPS9WV+0exySaQB60yoRiSqxEcdAO2S76Ih3R3wOe47CWcQr9hRXVzBN1KYlrzrfOFpWYPLEWCQm7t6Hbekk9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <233d3838-6d27-608e-6ef1-2a8036620650@suse.com>
Date: Mon, 19 Jun 2023 17:37:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615154834.959-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d629051-5e56-45d2-0117-08db70db1bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cTu6vnB0NyJsx4eD/qqr50ZJLxzycNJa4RQrbc37g0Z9cb3TFXkHwazmh2im1g7BLKI3xfZ6wjgM6O7vRgO3HQ+zW4aVJNUTPm2MUjToKL7ta5JJv+Nm8Eq8p1yGat48MEgW31aalw8QVvVlD4F9hCu5GnqHzXwK8jB4RFVSEhnvdiGakicQcUQV1a5MuU55jHY4MVbvYSoGMHnf8d7o32RzeAuXBcwDup5e7Mtg4ySLfRM5FswSgvhLZhWlJPX0Acmj3EDVZTU2JfTYaKtonb75PMbHTafpOqPt6heQnQkTlyonakfYUsbstPh7NjavMDN5yJbBWixL/+ApajjG+dvTgUYtMFg68XuTOgA4sSio43+YUkVR7oFpDkJy9PeEwbFVpxPd+cX7ZNWcWVg5ZMBulp3VROumFdpLjw+Tmp5z9WcEjnTeHCJf+dS94oaOy3yZkz70mI4Gx3Pdac26VGMGjcfJgaDB6AZT+z/Ui5/EM4pSpvjuHFny1izgWh2chxFa7HriV87z+X4RH53AAwtbl7Fo+MkLqmq5YEvh16KXAVIYUzHeohH56dF8ZwODga72K38pHMjy3a0+cq11cwJaO10hlszBhUCYyWvbmpfA4Iu1gRlcIiKgKQCIsB+IstRkjSle+ylj7eGJutJ+tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(478600001)(31696002)(2906002)(4744005)(54906003)(6486002)(2616005)(86362001)(36756003)(26005)(186003)(6506007)(6512007)(53546011)(8936002)(8676002)(66476007)(66556008)(66946007)(5660300002)(38100700002)(316002)(6916009)(4326008)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE9Gb3VQTjNCWUZoaVRGSVV0RUtwdjlOTy9qaG9INm4xQnZSUUJ0LzBhdzI1?=
 =?utf-8?B?eXExdDhpZnhFYm1QUm41TkU5bW5ia0kvYTZUV0hoak44bTArL1dvV3NFa0Fj?=
 =?utf-8?B?SC9NdEZFa0Y4WnZoVC9ZWE9waDZTeWNOYldHakFDVElhbU9HcFdzVndVNnFX?=
 =?utf-8?B?elAvenN1RExmQnFkUHA5UkxXS05WM2pnTHk0dEc3dWIycFlNK3QvdEJad09Y?=
 =?utf-8?B?QW42VldISlV4ZEttaUxOdDdqTk0vaEZybVp2MUZxZnl3aWFZa0ROZ0FCbk1l?=
 =?utf-8?B?TmpoREFoZjkzR1d1Y0dLZ05aVXdhWkNRZmYwU2gyQmk0VFNwRkM2eG1PbGV0?=
 =?utf-8?B?WVJodjVabUdBanRWNmNDZHRkN2RPWCtVRm84L3QrUXV2YThzd0drb2wxejAx?=
 =?utf-8?B?RXBPOEdIeVBSV1NCYkxvelp3S0ZTL0kxcEsrVDkrdGp1MFJ1aEJlWmphcEZQ?=
 =?utf-8?B?cnpaclltVCtxeDRlaW9tRmhSM2VvWjZiVkNCak1BZ2l4YWxpUU1NYlR0Umt2?=
 =?utf-8?B?SmFwZHlHZVY0RTloZ1kwem9vT0hhVy9WbEsxOVpnVGYrNVZTVGF2bzZGV0Ru?=
 =?utf-8?B?TWxMWHpkUnBlc2Z5RGVKbUdYWk1DWDJmTlBtVWR3R011bkM3UDM2SEJjNVh4?=
 =?utf-8?B?RFBUelZMa1lHOEFBYXlvVXl3cXRyZUU5UDBmSnpPU3RPME95MVVWcXN0ZkM0?=
 =?utf-8?B?NmYwd2RWaWZlSjNEUXN6S2l4MWtFbi9VNHVXTTAxdmlaa1JXK1lTaGp2WllE?=
 =?utf-8?B?QW1CT3VEOWw3Q0ErUmNYSHdRMDVoSkwzM1VHUWhITytBdlN6S3lNVTBkSXBn?=
 =?utf-8?B?eUk2UmJIeFN2bVNZRStqbE5GR2daNmVTNXcza01sQ2pJUEs1OEVQTzgwdUpp?=
 =?utf-8?B?SlQyNFVoVlRjc1hDNG9XNEV4a29kRDdhZDA0VHdlbzZseU9CMmhpbTA1ZTYv?=
 =?utf-8?B?Z1JONEhYUG53LzkxbHFCYzVwdVB5NG1JQkpBaEF0eWphTWRrNkpGNC9jMkxW?=
 =?utf-8?B?QVIwWnREYm4yeFlVY29PTG9LY2F1eWZpR3UwWjcvOFpCeHVvS1RIczFObnJY?=
 =?utf-8?B?T25HOEJodkdQb0JaTGk0b3d5QWRhbHdBN3BjRWJSMXZnVXFod1NvRVQ0VkhT?=
 =?utf-8?B?ajVwRjlzVjl6UmxyVUZNT2owcUc4anNRUmhwTUNaeFh5cjV3QXNtaUlqQTQ3?=
 =?utf-8?B?bXpXSk5rUm5RNyt0UFZyYXU5bER5YUd0V05PdHlWZ3Vqd3ovMWtXVTZXM1JF?=
 =?utf-8?B?R051RGJMZXZuYzcwYnNaT3JHZHNNVkVad1lOTXRNWUx4MlZBMjBJZU5UN2lp?=
 =?utf-8?B?N1JEK1JDbFF3U3JSN3BDemQ4TVl0c1g4a2VVNXdNd21saTZpTWYxaGd4VnZD?=
 =?utf-8?B?d1ZScXpFWm1ud1d0Y1JZVk5oM0FCcTZhZERUQ0hjdHY0ZzJDdkhaRTRhaFFM?=
 =?utf-8?B?QXphNGVUbHM0Sk1VTkwyR2ViQ2lNeXBLcE52M3hmaEhKOW1oSXdUaEEwd2Nx?=
 =?utf-8?B?TjE1WnZ4QXUxc2xUZzR5ckYwSjZybDE4MCtNQk1BNFVCN0haSkp2T1QvK3BK?=
 =?utf-8?B?Um1SaW1iZmNqU29Pa1Y2UTUzWDZlY0NmaUJ1dDhHR0J3RnErT3ZUenBuYjVj?=
 =?utf-8?B?UWpSZmVLSGU5N1hrTHFQekx3d0ZLYUJvQUMxdlQ1eEpCQzVGcUd4c2Y1SHVt?=
 =?utf-8?B?UlZ1RW9ZU3E4dDRjYk1WaytBdlpZaitsdEVkK0x1MzR2cHp2Z0hYYWdmaTBr?=
 =?utf-8?B?RG9hcWZGdS9xNE5zNGVRUExvem1QQmxqWTh2NHJrRGxqWkt0d3VHYXVqb2ZZ?=
 =?utf-8?B?d0hDcGpKOGtHbFlud0o2UVhQaHVINlpacXphR0xKQi9PdjRqbFlnQ1BVMUp2?=
 =?utf-8?B?ODNrT1k2M29qN2hrTlpXRGIrMk9yK3pLZjAwa3lXcHBKZTlkaERXeGZ2R2dU?=
 =?utf-8?B?ZEVjMVhrTk9LWWI2WkIxM0g4OEF2d1hCc3c0WkxPRjhVL2pvTGdCTG8vZnBj?=
 =?utf-8?B?WEo4Z09LamYyZHdYUXZJSlhvdldlUVF1V3hXRWlwWjdUUjhKYkZ6ZFRzakpJ?=
 =?utf-8?B?TVFOc0oxTjIrbzByKzIyQTlUanpPZDdWcXUyVmZlTldTNXlnOSs3azRnYUhE?=
 =?utf-8?Q?kAgIZh9ZBuUAwQYgk7NfG9y+c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d629051-5e56-45d2-0117-08db70db1bee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:37:37.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3korK6u1eTBq2p4t0plT1vgekQNsyKM9zqhpiqttZxXZbrNzRyS+KR9p24RoOAa8WRC09t3gKfZf6bK9rM4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

On 15.06.2023 17:48, Alejandro Vallejo wrote:
> The code currently assumes all microcode handlers are set or none are. That
> won't be the case in a future patch, as apply_microcode() may not be set
> while the others are. Hence, this patch allows reading the microcode
> revision even if updating it is unavailable.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



