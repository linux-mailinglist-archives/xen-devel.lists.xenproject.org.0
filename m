Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB997F7827
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 16:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640808.999517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6YRS-0004z6-Ju; Fri, 24 Nov 2023 15:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640808.999517; Fri, 24 Nov 2023 15:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6YRS-0004xE-Gz; Fri, 24 Nov 2023 15:50:06 +0000
Received: by outflank-mailman (input) for mailman id 640808;
 Fri, 24 Nov 2023 15:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9fG=HF=suse.com=jfehlig@srs-se1.protection.inumbo.net>)
 id 1r6YRQ-0004iz-UR
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 15:50:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21cbe0fa-8ae1-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 16:50:03 +0100 (CET)
Received: from PAXPR04MB8623.eurprd04.prod.outlook.com (2603:10a6:102:21a::11)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 15:50:00 +0000
Received: from PAXPR04MB8623.eurprd04.prod.outlook.com
 ([fe80::be92:1441:1177:e77]) by PAXPR04MB8623.eurprd04.prod.outlook.com
 ([fe80::be92:1441:1177:e77%5]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 15:49:59 +0000
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
X-Inumbo-ID: 21cbe0fa-8ae1-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqE/fGBB55DIRlHd42LXwjmhvlthCSfObt42+xuNGiLUEaCoWHJ5mxfhg1zqW0jgnDqQUxe+rZocWlzox5SGF9pZMt421NoXdq4d8YmoOgZhChNiNuwIGJxuAs655/wL31H2WTq5CdKit74ATJLEJNRN5nnS4Hl8E2pPmwztpueOFnB2IL79hliUEJhwEH1kWeDUkBureSWQgADMIEDHI6tHYMJw8zDGampZnpPgYEo19BvEyiNitplP5w6NuADYDre0xoSBS4D6J12oI4e4oLFaSlvzZP4cD9VcZe4qNvg4rHyz4KRJCEkdhBy2K28doZXiKeJpOWdPB9yybIjf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qVGVNK7o/NFEBlxK4m3r8c9JoNJT0VdrFv83q4MSc0=;
 b=IKrx77MEc1dlUaXMOf13NumFzY6/sMF1Zp9NX0mAhz6ICnz/UrSv06TghRW8935hQl49tq3uWeyoeEoTLaxPXvVDl1guCAJoTVweAPYxoMy1iQdwUCvFlvA/FmMbpkB/4VBlyfVIfcfNqi4n2Bm21NR5UKG543X71MQ2fQ68do6gdf2MkTw+lB2teyiS91wJHOxPecD93uTM1p6kMUrOgvINXK1R7KZlTSeW2DSG2P6Eo/yWHSmuN1NF5OgjaGPGV6NHOw4AwYvaG0QOV7kVDKwnb7KqiDtspWZMz+kVpy5gXXuqfBBBlIiG8Ar1a82URScSDTn1Ry/jbw1nJE3BBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qVGVNK7o/NFEBlxK4m3r8c9JoNJT0VdrFv83q4MSc0=;
 b=sNCfGu4r85u5hr/xU9kf5Bf0V6ltpM9E2+6abZtnmqwBh15gFEsgeLeYPsARzlHdEyEifpKjk7cNq4IbwcRSsYGDJVG4Xx5GEb3aa2gkf/vr9X/23hw8/Yjtmh6EoPL6PrVFmR1CjLR7yVrlGZnWkMpe7fp9Kzcza6UdQbJGacO9IW1CHS69FepZ57KJ2/HLCagQUDcHoJG3Oi+M0hZvPsPKRp62Q/b3WVFxDrGfSPFPIlsxijXeoWcUVfmD5XgnoCEVFUOdSfahvH8Q8UU9YZVu2jCTD0mrgcXZTc2y0m6XOzx/wTuuube1U9CObPTMC8VlLN+DxGcRE84zXgfCxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14651950-81f5-4862-b65b-ec9662a2227a@suse.com>
Date: Fri, 24 Nov 2023 08:49:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
To: Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>
Cc: Divin Raj <divin.raj@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
 <20231115182340.505df6c3.olaf@aepfle.de>
 <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
 <20231116085629.40a0445b.olaf@aepfle.de>
 <A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
 <20231116105321.4a59eed4.olaf@aepfle.de>
 <47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>
 <7a4ca8fe-da45-428f-a300-241b2bf0b2f2@suse.com>
 <20231124140432.53105119.olaf@aepfle.de>
Content-Language: en-US
From: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <20231124140432.53105119.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:930:8a::14) To PAXPR04MB8623.eurprd04.prod.outlook.com
 (2603:10a6:102:21a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8623:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: d71db112-5861-4324-c7f8-08dbed050357
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L1e9UgCfhVgw5ozm0yrRQ0BTBu3yPwPnEutoytlJlx3OdYAFh/GtBg88OGY56CHPRYbnSdAjj/visj9vBGWiwI9TJpUs0FLpsaFszChYM8QzM3Zj7iXlb2IcHTuOMQCZXrs+Io7igfoTe5n1MoIkvvH6iqijJOMpmh+KEqMAqBklV8xOcRuv0SznfIQQfa+e1WSRNhoJ61M4ImpdCxisYUVkLDdkuC+73MNPk2UWPs1btZ2rdxYxz+DUm0GWS6pgnq+7r+Me9e1mXnM8vvdyNramoPsnuSe9ybhlgdlyCguNRlWNmz1tS+j46kDYHt2Q2DWbTwVXRmLcGejr4ubkSz+z/TEwvIlvh3ZQcJfKsy4akymzXUEmNCN3e4alCv24ZjI/N6SQkR0X9I6WfycSwzQq/PrLb8C01ALs5H+hoG2RU1PR44/wNwE9vInVi+DRNFnNo2s+Y8BPTML1NmddPtODWtTDnb65+hBHiZjB9FBJqMP+rCKmTCUZooKLL/tu1f2uLim2QZY41lPwj6A1ckzS9ZYa9JrDB1f8sKNpkQHA6xZJ16/hc+FarRoyrD2bd8FQE9E4EoFJzzMnrI+BkfSTPQ2t9+viv3mRTVZJUtRDBVRS9WzxCCtx4XET5GPWu594rfY/UETP0eBu9DCmMv9lD5Xes7Tvr1Sa1mu0iMT1ZmE/EGdGqHol45RPwAI8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(1800799012)(64100799003)(478600001)(6486002)(6512007)(6666004)(31696002)(53546011)(6506007)(316002)(6636002)(66476007)(66946007)(110136005)(54906003)(66556008)(8936002)(4326008)(8676002)(4744005)(2906002)(36756003)(41300700001)(38100700002)(31686004)(86362001)(2616005)(83380400001)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Smdab1ZwMWdNamFteklGajVpWHIyNlNlRlhGbzBiSHNXNnppV2o3eGdxRTR3?=
 =?utf-8?B?OVB1OU4xcGhSWUdPSU4waFAyM01zNFFDQ2RMamRlcXRsMVhMSHpEalN0OTFG?=
 =?utf-8?B?SFRnaytqbjVjMVZraENwQkJzeTY3K2JjQjhkelBkVHBjVVFVazZhWXpyZHIv?=
 =?utf-8?B?WWIvRlVFSTlUcWJaY1A5UmRHMmhjRnRwb0lsTUtJOU12UTVqRmloMG0wZWI4?=
 =?utf-8?B?eUVjNDU1b3RSSi9XQURna0dpcE03akVLOG0yQkZCQjUrVjFCWVUxeXc4enA5?=
 =?utf-8?B?d284YnZWVExsRVQvd0NPNjY3V3p4cll2c2h5T1VrelE4ODlsdkpSOEh6M09y?=
 =?utf-8?B?RmwvazhtcTIvOGhselNmaEhFUHlpd2hVVHU4T0gzSEk2aGR5TUswY1NTTHNF?=
 =?utf-8?B?QnBSZUlLOGpRRFRBSVBtNUJXU3FxeENDcEJKNDdDdExNUFNNa3prZUljd25a?=
 =?utf-8?B?L0xTQjdzN2VHNGNGU0ZJMTVPN3o1NFIzWHdQaVN4ZWFweldMQ3V0dTZwR1NT?=
 =?utf-8?B?TGphcjB5VUdRakJCSGprZWs4RTJCRzRwa3RZTHRaM1lYdjNMbWplZGw0OGRX?=
 =?utf-8?B?MFlEKzZ0WnRMQXZaclZybFk0K2RLeUdzdElyMStKZkY2VnlwV0k5VWIzQmUw?=
 =?utf-8?B?bWFLcU82L2NvSG1DRWtlSEpUazVIOUdDWUx1RUw4REJlOFcrZ3Y5ZlNQc05N?=
 =?utf-8?B?UEd6b2N1c3pmUGxva0RSVmc5L2pmYkNiU2g3Q3Vuc0szcmIxM0JFWHJqSUJT?=
 =?utf-8?B?RGFYWC9aZGhOemZKRWJ5Q0Q0VzZGcXhzODZkclFJSWJNVmFvWVh3dHZCR29x?=
 =?utf-8?B?N2ExTEF4ZUZUamIzNnZkSlNLanA3WldCeHBrZ0ZlRVo1UEtMalk3WWtmUnNF?=
 =?utf-8?B?Ty96b1p1UVdRY3ZWM2VzYlU1VUdIOHpKRWtoL0FuVHFieEdBNmphMXU3dFBD?=
 =?utf-8?B?YzJRMG91TUtmY05hVGc0WmIrTm40K0ZpK1FXWVZZaXhBOUZqT0N1TnVBaVNq?=
 =?utf-8?B?Vk0yM05kdTBiam1UVlgzQy9CbG9zb0F0Qkd5eHhCeDdwUHZkN0NMYkFiemp5?=
 =?utf-8?B?REtCS3hlTjZUMERQdHRtaVg0MEtKUm1tZ200djNvVlFaU0MwQ3FIS0xQY1g1?=
 =?utf-8?B?b3hpL0M3R0VOWDY1ZXRqNlpaUGcvelpYSzVudXR3bUQwSXpDY042MFp0bHdP?=
 =?utf-8?B?MHkxVkJ6TnFhdnptMXVaSzMyY1hTMjVYcVZwME5qWjNrUVJlNU1PODN2Wi9H?=
 =?utf-8?B?ckx4K25SMFdvK2dPSCtrRWV0YWVQYmRJdlpnV2VkNE0zT3JucTNPbTFJNGZU?=
 =?utf-8?B?VWsvcWlneWtxdDBUOWdhaVRtRWtFOEpDR3NobkZaTkszS0NVTzl5eTdLRXhq?=
 =?utf-8?B?cHQ4N3cxdnlYZDdteDFsSTFwelJCV2FtbWg1dFAwdnpEUllDZE1aYmR0ZVh4?=
 =?utf-8?B?ekVHbkV2Rnh3N3RWVHgyb2ErcWVWbmxIVloxRUgxWkp2dWV6QWpIUW96b0Uv?=
 =?utf-8?B?aU5VU053WThPd2J2WXhVcFZ6Y1RSR2xJNmJFcTJMa1J5dDhYMmlNaVQyY1ND?=
 =?utf-8?B?ZVh6Z2poMWg4LzVnTXNCVGtkUXNkb2tHc1hCR0xwcnM3cUVvYjJidkl5cmpN?=
 =?utf-8?B?WVpJU2NrU2hGb3F4eS9JbEY5NEZRNnQxOWRNbnZyTEg3dW1JWERBemRqcGVO?=
 =?utf-8?B?NExGVE9vOENZUU9qRGd2amRCSUhsc0Qzd01LNTNxeXVoRENqaWVpVmhUUmpM?=
 =?utf-8?B?SDdFWVVVbWlBcHBVaFgxcW9qdHRNNnVEdTRPRnZsS1V3ZFo0SkxJaHNwVnVP?=
 =?utf-8?B?WDVlUTNiNjhIVU9uN3ZYd0svVkhiNDVjK1dyazJNQVpjZUxxT3ZDT3p3ZVlK?=
 =?utf-8?B?OVJsdG5ZaUF6bWFXRlhwTno1cUk5Ym02L1NSTGRQa3lrOWVLOHh0dmx4ZGht?=
 =?utf-8?B?UHkxcjJ2WlUwRS95bkkyN3ZmWmxhUHFhRWpjU3pBeW1QVWFsUHNSZlkzTS9j?=
 =?utf-8?B?N3lMVVJ0NTFXUkRJNWE0Rjh3RWl3a0d4Y29tdFNoOTN4Z3Q2ayt0ZTV3Z003?=
 =?utf-8?B?Y2hFY2JZQUFyVXpsTWxLUUdNWTg0RGVWTE9PbXdpZ29FN1VPcytxQ1F6Qm5M?=
 =?utf-8?Q?/mb9ZRfftqy7ZLrTq5NfTieNJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71db112-5861-4324-c7f8-08dbed050357
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 15:49:59.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qge1XfSzn0i5j4O+huGbAu6UtPfl14iIgZVf1X7ddein2MMlVb8myLrl0LRstAYco90ZzaQlYkkVU4l10xTSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900

On 11/24/23 06:04, Olaf Hering wrote:
> Fri, 24 Nov 2023 13:47:53 +0100 Juergen Gross <jgross@suse.com>:
> 
>> As Olaf has said already: this wouldn't cover actions e.g. by libvirt.
> 
> Jim pointed me to /etc/libvirt/libxl.conf. So from this perspective both
> xl and libvirt is covered. Now it just takes someone to implement it.

I like Juergen's idea of libxl.conf or xen.conf for Xen. This would avoid the 
duplicate effort of adding support for such host-wide settings to the 
configuration of external libxl toolstacks like libvirt. And external stacks 
could immediately use any new settings added to the Xen configuration.

Regards,
Jim


