Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B585658240B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376025.608594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGe8g-0000J5-Vu; Wed, 27 Jul 2022 10:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376025.608594; Wed, 27 Jul 2022 10:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGe8g-0000GA-Sg; Wed, 27 Jul 2022 10:19:38 +0000
Received: by outflank-mailman (input) for mailman id 376025;
 Wed, 27 Jul 2022 10:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGe8f-0000Fo-Ri
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:19:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d88b5d1-0d95-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 12:19:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5716.eurprd04.prod.outlook.com (2603:10a6:208:128::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 10:19:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 10:19:34 +0000
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
X-Inumbo-ID: 9d88b5d1-0d95-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebVK4gnVysKCVll73kDc4IQgLEmgUmizR+bohzZmWSKSwIY+ztylQXwbtRBsPpFG5AKohvhB2magSSWXT4NJHOgyd39nTgkGbnZ3w3esIoFHHAbTcOObnIId5yUvj1xWuJBT/dYnv7iJKSOMFBZzxUWCYuK44RNi93wCabzuLcCjzviQaNxTCDldfKhWSmYQESfnSTeLy9UexYz8txa+//L9bWtVLbZKKIuE97JhvOTPJzVP9rVz4a8Yzpi8ILvFWkpyg8wChDMSxOTuAtrfTgVLxatJ0GWjAtFQqVGCY5N04AScccXPkK0Hf+lRy4gbeIgpTNbyTX73dGezxxPmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSLipPpo2w+945nQ/m68bLTaXDY/ElVjdIGuB9QCK8Y=;
 b=COSRjL1k24iskyV+1+sIqQ5HxCfvVpquk25BDbq8YxWcGonBaZg08jFPhE8W3XKSIVAv0XmvCwKB2YUJQCSuzfNyn2IZgmN9SwjggWk3ixaUNVoam9lL1i22ZNOqkmuwRom0S213DF7aw2gQZ7JEK00/ZMifkmLBUKmCPRSxiMyggctge0U7pPTXFh9cwCe7VITqAEpoxJ5Fi8QhOD3vBmCMYVFsa28WEJgH/4xqqRZ5KjFaNwgTxACzCih2E6TRGP2rQIEHrN2uQLhS/lUeZauk9Xhsb6bwclz6/NefcUNoE0vErYIAG7QFQfjpnzoc9XVkaBf1AT4n/NdIhHfh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSLipPpo2w+945nQ/m68bLTaXDY/ElVjdIGuB9QCK8Y=;
 b=qX58jKi1kjdu0Z4A3urLAuuy9CFEqxAton+wt1Nx/6l/7x9rmjTvKiPrAKJDcc4pQgx1p3a6wa7ljOXBl6JsBo+jCG/KaRCct0t64PRyMzwS0XsXiEeogCaWjxQOSZ0dwesD1OTv8UavuUJ/YmjJcNumXd98/dLSrLbk84Ny42f1YJkT18Gw6WT7W1moij2ebPusX8Dh2dY9HB0ytlYgWU0+/Jp9qw6RMzgS1Mhn/0QdaWi2lu5PT7McEa1gcrwDyaueiAvMY6Nmr1UXPhmeI40vSwpR2hiWJnVKw9nROU2U1Tn/6kqSlLr58phXVuDdtMhrwUy+kjNNo4jEx9efMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85853c9f-5706-22dc-4798-48c775a17d12@suse.com>
Date: Wed, 27 Jul 2022 12:19:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 06/11] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-7-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-7-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70bdbf70-2f23-4205-31c1-08da6fb980bb
X-MS-TrafficTypeDiagnostic: AM0PR04MB5716:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yg0VMySPNBt2Xy/aLSwp9k5qBttMtAiY/BBJNNmjfGtZPgQ3proaJTlaHGdP4AJvw9E85FG0M/UD5UZ7fWemxvxPXMsbRMZERIKiJqxy7i9FXn9nIm15JXTnoQEpCtpTu7swuE23e71mnwL+rcv66MCHV5EQ1qh6a/UAQoaLezKqbbBFoGraIFwgtNgCrkGB0IY/0SyBo/86K6x0WdWqjUeKW0RYMtnsRyZsPAzQ15b7tyXjviMJdVkfvwDInDoGQxhCYCLL/e+JiUTZijb0xVPatB9sUKghqg/E62jN4wkI29ibb5wedvcvvcwYxZWBRUsqFbIu3AlIP7WSFZaegfZGA1+sWn/epfnUFW1gSNVxIALyYFbrEdnJKzGBR5/wnCQDj8LDhjhKws++w8RumBq0NON5Z6yNblsQ5AP2itj0gqikd6b0dSC71GJ3DGgAvSlHdl58/CMZtcS4YHLRoHwKcxDP45X6KZ5exF7X3HiyUrNKkdjPGpzcwc88As5XGEbKjpMlkqb83jDF9Jl6+p2mbE/yKRn5evhcre/OhLBwGNJh2c3dGwiTUmUxiQpishPwigHLO+9I0LIoqeUuQNjnz0uyDXQQpmob83dVtWo4zfWL16eiXAH6wf4TkPlhumT+JKmDwzw04abI4RKav/jvgVblylpR5tSpTpzc2L3y5rtLlshGohVxcCGymL+8WlHD8rDgLCxXIVAaonMjuypRy0F+ZvRAGEbuBCs0nXllqZyYa2A8w2u5R0LCB4khuQzJj1D7JZONj8GAz17wdus5mRtguXe9JEMgyPykobhhwSH7L5QRWRHSpHrPKALGL3tUEBYjLfPV4JFMSm6mHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(136003)(376002)(346002)(366004)(6512007)(31686004)(36756003)(186003)(316002)(31696002)(86362001)(6506007)(4326008)(66556008)(66476007)(66946007)(8676002)(5660300002)(83380400001)(2906002)(53546011)(4744005)(478600001)(6486002)(54906003)(8936002)(26005)(2616005)(6916009)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWR1MlhiaVJwUVY5RWpSMzc1ejFlVisvRUJDQnR5dUllSXkvNnMvcFQxN0tq?=
 =?utf-8?B?dnZrdGNsMEwzN01tY2lBQTYwaG1aTlc2MXNzQzZGdGxaVWd5bkk4RVBmRVlY?=
 =?utf-8?B?YjR0cHJDMXNTZUJiOW1IQys5S3RDUkpVa3FRUnQyNWZqWXdNenBhSUhaUFB5?=
 =?utf-8?B?TWIrTk03SmR3SmVUbkwxRDVpMWlnb2l6RW9scGVCS1lpN01aNTAxVDJpdlg0?=
 =?utf-8?B?TWZralRVaEdHOVFRNTF1WXVqaVRHclJDWXhUUWRxeEtiOG00THp0a3BwWEhM?=
 =?utf-8?B?emUvUWFCZFFNcXcxbFdzam1LSWRaMWZxVFlFUVcweFJKMU1iMmM4Wi9iUjhO?=
 =?utf-8?B?SHJoKzUzMDMwaFBIekZaRFpKRWJSNkJvaCt0TGZpM0RwRTNRNHZWVEgyUHhx?=
 =?utf-8?B?OXp5aWFWV0tVTHlJU2ZDODJGeWhVTUlqOE0xRVdKekEwNVNiSktRaXg0aEZv?=
 =?utf-8?B?UVlPQ2pTSTViTm8vOUQvUVA1cnFTendPSlRRZXBTTWo0YW5VejhEY3l6UUk1?=
 =?utf-8?B?bmhuN2VjK21Ga2Z3cGRTdS93OS8zdHZWTDNBVkRRNXN1TWZ5NTNqMG1PRTFp?=
 =?utf-8?B?WTc3NmtPTFdRNzQvalgyc2VmSDV1TEsyWHhpT1JSSFFTUitSL2o4UnlCdUNZ?=
 =?utf-8?B?SG9vK1hsaWpyMnJuWU5jVnczUXZPQzA3bnVpS0xBdDZDM0JDTGNJWlNzOWRy?=
 =?utf-8?B?NjYveXExTTNFUmQxamhVL0tEbVBnd0Qzd0lKTXJPTU5vV2l4OVVEU2dxNG43?=
 =?utf-8?B?eWhPZ2tqNlJDSEs2RUh3ZTMrRjgwNEg3NGNtSXNkRm9pZ0UxM0VrT1NsRWsw?=
 =?utf-8?B?czdhdXRPTjF2ZU5ieW9QU0RYRG1FNWxGOHA3Q0YyS3hHaEtrazJiRjhuVFA4?=
 =?utf-8?B?c0lpL0twNFJOQ2N4SW14aUJIRUlvWWFYZ1F0UWJFQ2RiTHNDTHBZZnluNEZL?=
 =?utf-8?B?VUorU0NRa0JmVkVtRDVBZ1dWQXZ0Q0pQcnZhYXB3N3RuL2ZjMXRYUjNqdkQy?=
 =?utf-8?B?WTNabUVhS0YwMk9kTzN6SnlZS2tVMTNmdUJlbXZ5dHppVHpyeis2aWN4YmlI?=
 =?utf-8?B?dUQrc2UrS1crTWt3dDE2Tit2WFU0SFM5WDRUcTZVdzhLTmFBN1F6MVYrSnhG?=
 =?utf-8?B?c1B4RjVqRW1qV2VIdmZJR3NGV1BQZWxtR2VFS2ZIc1I3Z2JHVStWMUdCajdj?=
 =?utf-8?B?VWNUV0tlTWV5TU4xbHg4NHh4YXA1ZmJqR24zendFOXM2cFVSQ2VkaVRIang0?=
 =?utf-8?B?bnVVUWpuUDZmVjVvcnRmYUhRK1hQZHg4aWVRUCtnREUrRFRUSnprbHYyTnVj?=
 =?utf-8?B?MFhHcEhGWFNmUUJENE4rdzBFdUtmbTNLNjVHTERHcUV2OGF1M2NpemUrZU51?=
 =?utf-8?B?UXFMaUp5dzNBMm5jd1E0R1VrU1BrYTlENFNsY3VEUTVhcW9XeUlKU0svQVpQ?=
 =?utf-8?B?VDNia0p0TTRFSTMybDhrc0ZzcEpQNUhNWmZWTzdXMTdNRURGOWJqZFAyQ2tD?=
 =?utf-8?B?bzBxRHRvM2Zvb2RZTTBtSC8vUFN2dUZMbG9KRGJNZ051TTlvZWJOQUNkUDRo?=
 =?utf-8?B?N001Y0FPWkRVVEorR3orN1FFWGxEQlNwcU5yYWwvZHRjcXlzY0xiclB5VTR6?=
 =?utf-8?B?dFlrbXczR2FWT3luci9kQ0RvNjNDZllKM1VnSG1LREI3eDNGOEpRQkJIZEJ5?=
 =?utf-8?B?WlpFUVd2MEFSN3Zja1BRbEM3MmY1MjRCWC85QXp4eXY1UjExenBmd2YrSHlw?=
 =?utf-8?B?NE5KdzVza0hRUVNEV2ExUjRMb2xPNEhYUkJldXh3YUpDSzY2UTIxaXovUHIx?=
 =?utf-8?B?VTR0QUNtUThiNldZUHArd3M5R1l4T0I4WWRXT05PUmJKdkFsTVBlTVBJK243?=
 =?utf-8?B?b3VieTNFTFJmbzRKY2pxSVdCVm5SSENLWTVWOVduaEFhQmRqMWd0WmlQNDQx?=
 =?utf-8?B?ZGFzbDRtRFc0MTlhcy8rU0MzcnlTRTExOWRZY1RxcmQrOUNqMW1wdEN1emRL?=
 =?utf-8?B?UUtsdWpDeFFrbkREdzFoZjkrWUVkdThTUEtDeHFDOWVNOHdDVEoraE9xTDZR?=
 =?utf-8?B?N1dpdnNYZFZPL3hQTEMwc216Y0ZWdTJwREV3TGh6YnE0TVRUekxzWnd5SUZY?=
 =?utf-8?Q?4AUsaOqAaS8ZI7maZu9sRlpVF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bdbf70-2f23-4205-31c1-08da6fb980bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:19:34.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fw3++z07WTYaH3LQY+ixa7qCmwxSBH4VG9eIJSDLB6m+d+rQTWAfV9pSpitEYQl3Yj48BP72+Gha+ianSdX5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5716

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the PCI bus driver in the hardware domain.
> This way hardware domain sees physical BAR values and guest sees
> emulated ones.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

If taking the previous patch as given, the patch here looks okay to me.
But since I'm still not really agreeing with what the previous patch
does, both that and this one will need to be judged on by Roger once
he's back. I'm sorry for the therefore resulting further delay.

Jan

