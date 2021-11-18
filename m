Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABE455C65
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227395.393278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhDW-0007qF-Nt; Thu, 18 Nov 2021 13:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227395.393278; Thu, 18 Nov 2021 13:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhDW-0007o2-KA; Thu, 18 Nov 2021 13:12:42 +0000
Received: by outflank-mailman (input) for mailman id 227395;
 Thu, 18 Nov 2021 13:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnhDV-0007nv-75
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:12:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34fc8f4a-4871-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 14:12:40 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-kwc6R0xjPcK_AxHmMXJ3tA-1; Thu, 18 Nov 2021 14:12:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 13:12:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:12:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0075.eurprd06.prod.outlook.com (2603:10a6:20b:464::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 13:12:37 +0000
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
X-Inumbo-ID: 34fc8f4a-4871-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637241159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Umgx712IOa99WXk5HlWGJSIXiN44NwdWYdgE66c72nY=;
	b=WjThlGo9gVf0OtW99UBoOtPfxoztqxeYtQwgL7M1HSL9R/fw7IBkAuavCEd22rMypoalTb
	2y6ebSa4GwUbLcbzAyuu0jWK2hVJUOCnYN2WwU5qb6Ok3eSTbQJXVeEj2avEvF1bPOx3wA
	hN9kQdd1JZzvoZF/LyYxLnlMvqfDJ2w=
X-MC-Unique: kwc6R0xjPcK_AxHmMXJ3tA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ss8jOGLw+mDlaDge8J3/0sihux+JSngykQeNWEpg1iBquNP5k9IYlKaoUMYKguIVbiESOVWq/z+vMtfhdkxJSAkCuEgsqQIPxGxSsCbZUuUDi7QV/HoVLNfcyHASU2+ywt9mnbcpnxDlAwG1ni81yJ6FHk34TwvCSMvCJuVjq7obFEB9Nj22ymnln0a1Updp+uuno/PKRFNi3bu7zX4ms0anQIF4jph1N1ydXnZ6PsKBSGJ9uamAs6GHdqJjh1rhg+AkutrbP+DWpo7nqnzbmwZxMb0QTvd6ySIBbtHBZoZxMVdoDI+KCxFOSvtnc4MEjULVHWAckLniVKBPUmSOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Umgx712IOa99WXk5HlWGJSIXiN44NwdWYdgE66c72nY=;
 b=iqzZQuGe+jkDVB8hjnjbHxpfX66akq35qT828J0H3F4LnzcKT4bGyzOxZNGHKX9RTD1ipxAQntVqRGt1eVUD/YdNcTOFezRSCul5xJPFhTX4uAMbhf2gjN/gJqmY5q8//b/W0wS0Sh6EyEox6FGAS4IQgeddTQw603rJCe54ZvX5MJdz2mnQ3vug16gumfK+lEjsS+Lfk35fYEO00an7qMes4IHw42Z8ajDpp89pfcWPQZc+Fl7HF5POwikQgfC6d/JZn1/C/4GOyQ8EBKEUzUm/6E1CjOc/QcIn/ENmKPBdxPNrcgU+4Hq/gS1Rs7onlQaD/pdYf5HJvuS2PlsMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
Date: Thu, 18 Nov 2021 14:12:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/Viridian: ExProcessorMasks handling improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b7eafa-af4c-40eb-7ead-08d9aa9517db
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5598E561A62F67212F31B9DCB39B9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z97oA1T2d+LJASmGQH7oAsp27YU1nRlICPw4UMzt99MQXpoCucr40TO6/bf0X3XV2WxsbGfnv3ROzT7D3Av8LddYjns9aPNX1Kt2MLIhG6Jc70t6Mj8Xbb3Izu2TH+28kZoiZ1HZfEfNJd94RCEScbrlfl1WLY5wqBmhs0ncIWENhTCr5Efk/24jwwGGMU4dMJeHRlhFpeCMy2AR+Hk64OnhStttQ6i+6z8Hj9AtB5M6SVPDVvRq8dtDDcfcsMnlLEB40HRSJcjikHNQdTO5yyj3aOkKqdWM9sexDudNX9SFz7TZgfP+v6TOFv4571nPbK+LRQUoVnVAg2k7/5L+HvqsciOCmS6eBnTCm9RAUi3xa+eDjbaQ0j1svS34tX2V4XEKl7334fV4U1aqXNjamIHmB6cbnIUp0A2uDHDKLY47IUJJdYnR5hzJr7+XorgVtEXPOeiIbN3OU0cc8/8OgqT8R5b1lZzN11F5L4nFoYzq5BDeQOsQhirVwLU/fFA05WXn813SEfT92eAXCdosoBScLtBCzI+PcPQXFodpwXUOD2UynYxPR9B63bSD+Gxcbum0Elq8NHNtddgtz5jZ2RKTY2TENCMXc10h+hxqqKWQx6JOXRwxAda7Kt1JjiXcxE0DKcOSme5fHbaMU1v359vT0/5+/ktaJkwbUCT7fCSovCRU7NEQtWqv5WKbc4tIIOiUYjHqzpUyC1apx3kS1ttkI+7BldI/GX7IZmWHRdmnQIDl2IaS+GeofGq1LtuU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(6486002)(86362001)(66476007)(66946007)(508600001)(4326008)(31696002)(31686004)(26005)(16576012)(5660300002)(558084003)(316002)(54906003)(8676002)(2906002)(66556008)(36756003)(2616005)(38100700002)(956004)(8936002)(83380400001)(6916009)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c29RWHdya283ZmV6R1RBR1AyVUNUZ24rRXluME9rWE1NaWFvZUROMjV1cFJi?=
 =?utf-8?B?VnJrTzZic3RROU1sY1lpZHNCNmpleXprV1VualRhRjE2bE9UWFBqZzg2VmdM?=
 =?utf-8?B?dE5JbTlVY2ZZNy9xdEF2SXhtYUd1ay9uQ3JUQXpmeE4zUlZvVFpLVmNpY00r?=
 =?utf-8?B?dGRESzc0Qk9wVy9iSE9ibGgwdGV6VnNCUURrYUFmZVpRbTMvaTJjNXZMNnFE?=
 =?utf-8?B?R1RrRFNkNVg2Q3NxeTMxQnVvQTZhR3MwL0g5K1RnNmxtdysveWNjY211UTJv?=
 =?utf-8?B?MWVSUHg3UEw1R2xkKy80dGJpUGN6L09ZWGIwcFFkZC9tbVUzZGt3dHo2VkhZ?=
 =?utf-8?B?dWlXLzZwSGg1NzdKa0hqU0U3aDdPVVFlS3lPVGUvdVB5S2FQNmtBVjIrK3hm?=
 =?utf-8?B?SE1MaWd5OFVtTkl1dGhHQ01XOXkwUWd0eENSVUdIaHlvNnEvdjVJbGRaa2xr?=
 =?utf-8?B?YnpKaCtKL29HQlNFNE9RYXFLWGZGZEhCSUp4VDNiaHlDWFJJZlY0L2Jma2R3?=
 =?utf-8?B?R0dsRHlCNURaMlBaOVRnZ2pERUwrd2lhaVAycS9tZDQvWGJWcWd4dFpKKzRh?=
 =?utf-8?B?T05zYjBlQkxmN0FWYkkrSGMwanMyTmFPVHlpNkxhYWVjSlprdWN6S1ZSSDQw?=
 =?utf-8?B?aW1scmZuTHY4Q2tnbWNFaml6bnZ6QjlFdUtDaEVvT2VEdmpxMUlYM3RuL0pC?=
 =?utf-8?B?V1Vza2RvbTNiMmFmVW56V1dVYzNWUGVsVkI1K3RFdmJWMUdUcFZsNENCT1Jy?=
 =?utf-8?B?YmZMczlmdGZWQTBHTXBiL2QrcXUxNnFNRmNxWjM3dVhFbzFPb1FxaDUvM3VV?=
 =?utf-8?B?UUpsQlBPdkFtVk1OSUpYeUZuUDBHVE8wR0Y3dDJXcW9rRG5JUEpoY1VjLzR1?=
 =?utf-8?B?UU5kR24xK1YzbXh1VXkyUlFWK3BtcnNBMENkUlgyNFVQZDVJMlRBOVBTZnUy?=
 =?utf-8?B?dXQwNmVhRzVzdkNyR3ZZSWx4aEhaSlBwb2FzTytUZ1JYVXZPN3ZaVWlYMUVM?=
 =?utf-8?B?VVlaZGJYYTRlYk8rTVNJQmpzRVlVYStvTVFocHFkYWpPckpWSTRnOGFuL0Uw?=
 =?utf-8?B?c1d2V1YxcHBXdHo2b2plUVo3Z21JamtMam41U2FPZE5mQzAxa2ZaaUlHUjdV?=
 =?utf-8?B?RzhKQzhYZ1JWWXREUUozTlZsZG83SlU4MW5ud3dDNFJGWngxRjVhRm9VN1BV?=
 =?utf-8?B?bUk5RGxFM1ZKcW4xRjZRV0VWbzE4ZGFqeURFMXRaZGk3eDR6NVhOMVlYNG1u?=
 =?utf-8?B?MmovbDBKazlYdzVqdTVmMTlLYlBPVU4vWnFReHo2ZGpRRC9MMjYzV2pHZG9Y?=
 =?utf-8?B?OU5EQ0lWMTRIU0h0NUlUb0oyaGxnbzBhMTRCdVJoam8rOTFqVm4vNmVkQnFp?=
 =?utf-8?B?aUZjSDdwSjFHYWlBZFMzczRaclJRbnhTRmNxNHlFejhJR05VL3JiU2R3RGNz?=
 =?utf-8?B?YTMrdVpvTUdQQWo2S0RYOGUyc0Vta0U3dkEyTUVWMlB2Qm9FamVSL2VWOTB1?=
 =?utf-8?B?YVZvLzAwTHVEeW1zUHllMU5keWpWaUlSWHgwSndJTEtUNGNWUXg2SXlFRkhS?=
 =?utf-8?B?QVgvREltNFNPKzZQTnBSM2gzUm44aklGOUNYQ2FoSCt1OElOT0RsSDN2ZVRG?=
 =?utf-8?B?Uk8xdURzTitlSnFpeTFkeXN0UnF3VnRhY1JZTHlMUHNua3ZzQnc3Z0xieG5m?=
 =?utf-8?B?YVQ5UTBibkdYZHY5ZmY2VXZ4SGt0S1Q2aGxIYWdVSzlUMXVoOWQyRWZveEhl?=
 =?utf-8?B?TE9CL2FsbWhRQVN4aXI5L1JDMTlIODJrb3NVeVZob1FER2JLclVBQWNSOUxs?=
 =?utf-8?B?VEovZ1dCNURnS0s3WFRMYTU4Q1AvSVVyVXFRMlAxcy9SZDNOQzN2VGlTeG52?=
 =?utf-8?B?T3FzNG45SkdlUEllVGxwMjFHRU15dW10aFByUTRyVmtsc0EraWIvVE12R2s2?=
 =?utf-8?B?WUZSUHlteUIxS2Vhc3czMVF2WkszbUdleE9EbTA3MFo1MzBYY0RXUit5ODRz?=
 =?utf-8?B?dHBsM01iRTJPZVBjTjVrcDRVMFZodnRIeU85MGtDMkwrdUNiM2VOeTRrekp5?=
 =?utf-8?B?eE11U1lTRlJ6ZXZ6QXZRR2pqZ3laOExwRFhTT2dTamJGeGhDVHFsV0J4QkVJ?=
 =?utf-8?B?a0xyQ2owNlJGTlNHWnd1bU1vc0d3Q2pUS25TcC9DNjdmdEZwVk5qcFhIbTRQ?=
 =?utf-8?Q?fxWZZWNcY/CpF449XeDdXS0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b7eafa-af4c-40eb-7ead-08d9aa9517db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:12:37.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vk4rNKtPQgQOR+TwFTp75EDrOTZT3XYvFPrICeyPSomEv8a/FLSKzq1CWHIITnjQNZ+tQt6Ua1OWaQS+0uzQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

I've noticed the bugs fixed in patch 1 only while doing the other cleanup.

1: fix error code use
2: drop dead variable updates
3: fold duplicate vpset retrieval code

Jan


