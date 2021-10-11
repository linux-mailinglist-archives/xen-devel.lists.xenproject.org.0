Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255674293CD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206245.361767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxY0-0003tT-Mn; Mon, 11 Oct 2021 15:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206245.361767; Mon, 11 Oct 2021 15:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxY0-0003r4-JH; Mon, 11 Oct 2021 15:49:04 +0000
Received: by outflank-mailman (input) for mailman id 206245;
 Mon, 11 Oct 2021 15:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxXz-0003qw-8D
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:49:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63ac62b5-7fc7-4a60-bce7-9c84e3849c56;
 Mon, 11 Oct 2021 15:49:02 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-tGPx20rgM5KvXCz0CcD0Rg-1; Mon, 11 Oct 2021 17:49:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 11 Oct
 2021 15:48:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:48:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0254.eurprd06.prod.outlook.com (2603:10a6:20b:45f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 15:48:59 +0000
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
X-Inumbo-ID: 63ac62b5-7fc7-4a60-bce7-9c84e3849c56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qynyWOoeV7BF4FiJSCB4LZVp2zHWDDRejgnr0+MO0Fs=;
	b=fqqLa11sQ3OP+uSaD5L6T7jAafYsFh6rQgxEsxmPdfFJAPxFqSZPZfI720MyNxA1qkOpb5
	Mec3IKsmkoaTczgH4D2jK9uCO8D5pCPOCGnDaEKfW5uQoK3EcmPIACZ177/9uT7yD0N9EF
	fseDlFHw5ROkAd9zY0fR/7YmeyespUw=
X-MC-Unique: tGPx20rgM5KvXCz0CcD0Rg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PY6Syny8TQI815DKc8f6FEu2oJfHCgiM4RPMWCAOCz6qX2a/7zGOFUS0qc0T+0LLeIol8T1O2pe1Yk7MVveEoCg1a0kyXMsytICbyBKz+1Zo6fFGDzjwmzAtv/NWYYY6IakJ+d8DsIuEnSLttHTRJwQcYpUjJQfPulYWNHHuxf6WacGAX/gFAyczzzrn7k7rR+7oJY38NgzXZXdzVHOY6m2rYhl8KQvn1dPjMUik4tLvIC4ch6CMnTTK1Ry7i/CzrQ5q3cOJF7GsBkfrbuaztBMFlGstUqlMOah6yIJprlSkf/fKfSTnMLMTxWAcvzjOz3S/FXnBY8I7uu/w17V7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qynyWOoeV7BF4FiJSCB4LZVp2zHWDDRejgnr0+MO0Fs=;
 b=ZKQb1apLxURXWcHATPxWPHZZ7RLI4gVwgF7/oRWj9WjBnE7s+ERM64g0I8ynPJ4Jfs1VYu01KVStLmbZVYuZRXKGdiJxDRzIY1VCMtJKJeHCXVFZwWArlvlle2ceCow/2WTOTd8NlFZ2TnNMUbJZfGUw6jDiv2ZQAJ41keBvb9B9eC/0R6zciKUmSWHS+Uipy4ThkttthQi0u1ccQO1XsHSWLsv5Mr/5CWidai1O71W3kSloINj4vRmQm99FQoVvKV/glYrjF7Hvpne6oxAuIoghtHmRNdxWtAeQ6Zn65Y/lHQa+2qCfiy8FZa5Sxe1AcVVWPdmHyjGNxaQp0gs9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 33/51] build: handle always-y and
 hostprogs-always-y
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-34-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad1fd010-2b47-a99a-4409-acc237fce0a2@suse.com>
Date: Mon, 11 Oct 2021 17:48:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-34-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0254.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22238854-8eaf-4533-f965-08d98ccea43b
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360CBAD8EEC11C51BDACEF4B3B59@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9kmSJlI3du7oAXXRqbJY+gk0q8Yh/pcc+oI7y2sGKAHX3vlQd3M+8AV4DS9/ZbEHGlKrJlj8jZQLBli5v+WhwxPNEPZLiZQZ4MU2TQG8Gr2Vd8hs8r6Kba+R3Q1C7gvwa+kDMqm3glYRftNsV5Xb10sRjbfRtVmlvRcRO26QwmojRTDnyCaWMvjDqjbEZXCaFuenQX+qO0OUV+JY30yQfFhJnttebvW8lKo19GwPZ446i5hMQ5rNz7LafKB0cuuS6VPtG7p5hwugus5pahCKXWqTtunDbMJl1NY48UBSGhMal59TavNbQlo0POtJK5A2kJ52UiFQkyYxj151lIloFdDRQlllzbPp5tbpq/s2l6LM6FtHY6b7Mff8S9xQ7Nc5AUZoqt9KEzdvpydlt4/RJiBHorDHf1atGS3jEuN0+cPDS8OjEESNHUiAIcZziSMeUkAKdQiW5kHX4keq/ANoV+iuR4tcbhyNecEsW91IiWCuqkmpIjL53uEaOqlC5D8ibueF3rL9PmB/ybzlK/TCaUG1ZyuISYZHN6cJdO0PcEDEvw1cRsBysK3ka3YTPJSn5Iu6TUN0pPRfR0z1ycf9Kj7ukhFCY69P9sn1gWR0tzZZC7H2oqb2MmZVwEnUrWoHPbEwBYUvOvCT1egQBoHK2AUbEmm238JllxwrqGu0TqNT9MXzbVfw82eO2RbM3wFeV9+LFh/TenbHacox/HPRjgLZxP2CqxpoGOgB8quFiCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(8676002)(36756003)(31696002)(54906003)(38100700002)(31686004)(508600001)(86362001)(6916009)(5660300002)(4326008)(2906002)(956004)(26005)(6486002)(558084003)(66476007)(2616005)(66556008)(8936002)(66946007)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFh6dzRKQzdGTE9JeS9STjA2UXFadWU3Qy9ZeE1hb2Zycm5lcmpOK3dNdGJG?=
 =?utf-8?B?OVlzYjhJZFpqOWUrTENIejc2WFFpY05qVE5ETXRzTTNRK0VPS3MzUVEyclRJ?=
 =?utf-8?B?bGVZanVqQ3hBR0pHMEcwMDFMelBmeDI2OHdRN0lpbzR1aWFweFBwZ2kzckJr?=
 =?utf-8?B?aWlOc0dBYlJzdlhSUWs3N1VhZ2NCYVA5MU1iSGNYQ05Qd1dwRDhWOGdhVEk5?=
 =?utf-8?B?QUpsQWJUM2NWWGxpMnJrSUJXVUJhRDBGdHp5MUMzdmNraXVMbmZRQ2pVSGZi?=
 =?utf-8?B?ZHk1OEc4STc1K0RzZFpXR1FqZDVBQVNxTFNId2tSaS9WbkVJVmMxNXN6TEVF?=
 =?utf-8?B?U05nejNyZmRrQkJPTjdvczVKUEJlVDIwNmo4d2NDdTU5QjBzUkhpR3RYU1d3?=
 =?utf-8?B?eEcwSnU1UVFRT1pVT0dNb1RDR2ZNdVo2L2d0SVNPcUJuUHRxT01hMkxkQ2hx?=
 =?utf-8?B?dnNEYTNEd1VSNWZjN3RvcWIwOCtxM1IrT084Tnl6ZHlEMTJWdCtNTjhjUjNO?=
 =?utf-8?B?RUc5S1JMQjRDb0kySFV2OTQ5WjFnaXBJbVEzd0NsMEFneWc5MVNZcWh1RjV3?=
 =?utf-8?B?MWFBcTM3ZUxVSngvNnNEVzdvSFovVmZ4OXBMeVpOU3Zsb1FESkt2K1hFU1Ay?=
 =?utf-8?B?ZVRjaVVaZVFxV0Q1L3h2ak5NQWZ5aGk4czMva3JaalNwMmFYaGVxcGlRckZG?=
 =?utf-8?B?YXVwYUc4Z0ZQRDFnVmZEV3hTV25iRHBlODJSUmkwbklWbFdUZ0kyT2FMOE50?=
 =?utf-8?B?ZXVWQXlQc3ZxOVZlL1J3c2IxTXZRZEZaaWFIeDVLa2h5Mnp4NG9SUklsRE9H?=
 =?utf-8?B?bGRiNUphazdBYnFSQ29KTWdPWGg3eDkyVUVWSWhGSUJKbFJMbmFEdWM1TDZr?=
 =?utf-8?B?eTJiUmQ1czZPMm9MdFRHdko3d1l6SC9nTk9oS3pBVDNtdWhNakNTTjR6MVp0?=
 =?utf-8?B?Wms4TUN2NFRuWFIrZTVPdkdwd3lybVJOemN3TWxYVGtkL0lONWl4SGpQNnBj?=
 =?utf-8?B?QW9OR2JtcGs5L1RWeHpiU0V6aG9OVEFyb0lSMlRKR1VYYmsvaXdsVDhVRlZa?=
 =?utf-8?B?d0ZJSVFPbmMyY29hR1ZJMVlqM2ovL1BiU0ZwYWVOYW5mWkJaQUJpR1NiU0NX?=
 =?utf-8?B?ZnVmeGxzc3NFaWJLWkVRdHBPaVBidFhnazlrRjVDeTFBMXRZK0xuM21CT0d2?=
 =?utf-8?B?MXJVbGhzdm5rejM2ZHp1ZmRtTEpTZWpBNXh2aWdvUTJkbDVCMjcvOW1IZzlO?=
 =?utf-8?B?cWR6ZitnQm55WW92OHArbnR1ZGpDaFZtQmt6bkJjYTBqbGpac1RrcHZ0QjI5?=
 =?utf-8?B?bXYwK3V2aS9pVXBHWCtXemdoME1icjhnVXkvRUphNEh1QnFCRWVQRWdaeS9X?=
 =?utf-8?B?dGVzeTNSb2tIbXBJd1U4VGg1NDl3emI2S0t2OW1oMmE5cHZsbC9IMUMxSSs5?=
 =?utf-8?B?b2Z2WkVNWlBSeFVxQmdpcHhwN2MxMVNTcTRZeWtiRVZSL2RBQVhYWHl1dTB2?=
 =?utf-8?B?bVZvRzhHRFFEUUQ3TFpsY0dwNUF0OW43YXl3c3M4cUNWbVhRMW5jeTVNUGZp?=
 =?utf-8?B?S3dpRVhDcFdBaldjMnVyS3JaYy9uekExWTh1QTVTS2U4akY0c0JxdThOVW5H?=
 =?utf-8?B?YlpMNE8xRFY4Tncyb2ZDV2F2U0RDdlVGc1g0TDJRZ3NDb1F3OEhLajYzUDB0?=
 =?utf-8?B?ckxUcW5aRnFLOEorTkRQakNBRFcxVkpjeUxzNytOUTBSZjFNa0VxdVlhMjdm?=
 =?utf-8?Q?rM0wDZP2gwfgx6zFEzkGCfJvt/aNwHSfZJQ3WJf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22238854-8eaf-4533-f965-08d98ccea43b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:48:59.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IyS5WcebMU3kDOAfvZtuV+ojQh5f/92sqweCIaQy+A+20ywgdelyDPw4zC+IGGWWb7ziPahZrPQvMRUNWjhgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 24.08.2021 12:50, Anthony PERARD wrote:
> This will be used for xen/tools/.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


