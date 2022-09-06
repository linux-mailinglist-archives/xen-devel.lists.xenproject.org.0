Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CFD5AF70E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400233.641940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIN-00070g-TP; Tue, 06 Sep 2022 21:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400233.641940; Tue, 06 Sep 2022 21:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIN-0006r8-74; Tue, 06 Sep 2022 21:39:47 +0000
Received: by outflank-mailman (input) for mailman id 400233;
 Tue, 06 Sep 2022 21:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgHT-0000Cs-7F
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 253ff66f-2dfc-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:54:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3356.eurprd04.prod.outlook.com (2603:10a6:7:8a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 15:54:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 15:54:08 +0000
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
X-Inumbo-ID: 253ff66f-2dfc-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIPnV44K0ew46faJv1fCjxhnZZ6LmTl6/ooqtVAx62RB6xVWZ2u3Xhewsu6XyhkGudBtA/QztbnP/B8oVviBuG9RTVlMlAVviIPnVa9k1E+B9NoGX/KvdavheivwFmNAG0cSnwJl6VWqkkbmRs8ObB2uRMMTnofcmiD+FhES0N1ijiJbrc0dPl8++zaeBmo4ff7eynFW6B94iGGXlrLLJqIFYLv+LaZaeWbuqzNfe48hqBy4pBVABvszNSb6qwn/MtY98x49AyUJhNUGxLaDBuDH/qUqWNUfZuYysxdSQg7Fjm4+tSQhorqsFs9lAwWobm6IPyt/0nl++7NDWX8ABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iDBAHzV9MbG1FBjlh7WM0trQYZ4f3zj/7HPeYAcyrE=;
 b=ButTz2teH3HoO2PMOb8OqkqALGEpZRqnAk+LMQsk3/VDyJy4tf362tppy5AlG0hjAGnHgDivaA4Y/MEr6dxxUrR18CLJejB0pXXhGcQdw9KllFMAkqGzYcQnAfq3jAaamxI4sEwNSFIrUfLbdL11fmsX9p5owylR9OukFm3rqFskyddOCUKFHextvWx6WcOjVJG66J1zkIAb3HShgSurI5eIIu9shsXxZi89vE3UbGOfPvTNJDVwcDVLneMVWbd0nFQQKd+FRoiL65PHR/D2PTwOeEVz6mNhu0yD0YrCrD8DJEr+tXLKT0F4co8zs5i9ERbcANPQzULY5SD/KvbIIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iDBAHzV9MbG1FBjlh7WM0trQYZ4f3zj/7HPeYAcyrE=;
 b=5mltI3BqFqD/ncFNdaOVNjAmsSw+eHAG24AWI27+uzizAXiAEzcZuhbAdrfxq43bpoDgZbN/n3a9lm0WCWcVpG705Or6xZxjZYOgxPMju4cylViFvZYZ7bgNcDGZp981CyJEUML0vx5hojVkF/8VRAPQzq+zaUidGDdlvho2bipgbHRY/gn4SraNwuJ1g5n6+L2AKFMTuFQUpjjQlwLxnHYmZNcuQlEeWWBJSq0YAZXW89OJybPdjL3BLZLWYtdgfC6ppyUll91aBZjXOMPXOyn3z/hAKtv3iHqk6EqhuX2XdPoYbLpp5s2aB5Oas2bb1HkfgL0sfahxa2J4c9IxwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5289a154-177e-4805-2123-f5f2226394cd@suse.com>
Date: Tue, 6 Sep 2022 17:54:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 01/10] drivers/char: allow using both dbgp=xhci and
 dbgp=ehci
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <f9c4f0df804ed406dea0e480614a033d5bd434c6.1662124370.git-series.marmarek@invisiblethingslab.com>
 <08c9df71-0470-c9eb-94f0-776eaacefa5b@suse.com> <YxdrRUEJ31ZgmilH@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YxdrRUEJ31ZgmilH@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3272b511-efff-4b6b-cba9-08da90200899
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uKTTyzd14e/rkLKEvYVOT6004T0HR0jpu6hghjtXttGYm+EC61jNa054jQoSfllETndc3oHfKFVcUtmmingO7pc4VG6QEpDuOo1vlZixz8ZHNLbJasGQX5v5INTA8cb9zUXT1KFBRAkoBQNA7nZP78fz3FFCwU4vtJAI6RrwbR3M+RgUNNRSheXeoqR07Pln5RC/DHgeelRZRBr6nzGhXww5v2/2ieoHRqFGxOscP4lIPxmE+o6YIVN6G+DNyWtA5jb9e7OFRgQjNhppxWZDauHjrWqDs+L0GPDhY2A0jRoqaDcaf74DHrG/2RuIxxtMNWNN6x/ZPHI3n5usYoBKbcwqhAVS4gUAgIM9CAacuFhpfdEdXKqYT7UhJhga34nz+Tt2dTKMQ9yUl98F9X6ISbK+o+LpGQOjpxOwbTaCPCu8yw84o/D/FRpFjqOypUEbVShdHaqpw1nNzXVd0Xq86jrs2S8Xu1OkeQduUTpoW6uuo+KdxVWiAJNCFDbTXebg2tR7He6iJvfJBXv/Kd6zc6m2MwOrnlU1mWExCJOLzWoudSG+09e0M3kBPItl3f53PZxGtgbsbi+2Gfl5xhcp2kUzCbfDv/dSyXkRxPaskFvLHGW3hOSXQOvH+qpy1rW1yN46Jy4J7EajZzhLAZzmWEsmSInDvhbJm5w2M5UC4YSSJ6kqLcbsGDpwjs7IpNWVBOGAwN0WLt1hxpOaKokQuZp43QcJktdNN2cm/OOs9jnJf0QlWQh8jBObuC2B3tO9sZPe27KhFeNheuK+dOJhO9Y69xTDF9j/MxXTEoV53Ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(346002)(366004)(31686004)(53546011)(26005)(6512007)(6506007)(41300700001)(2906002)(478600001)(38100700002)(6486002)(36756003)(66556008)(66946007)(54906003)(6916009)(316002)(5660300002)(4744005)(8676002)(66476007)(31696002)(86362001)(8936002)(186003)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjhqRjhTc2NrNnl4ZVNFVkpTQWdEeEk5NjQrVldWUWRUek5jcVUxUU15am43?=
 =?utf-8?B?YTFHU2VmQ1ZzNFlGT1dEQ2dDUXltSllkSm5xVDFaQTNoQlNJL0tydEhXSGFE?=
 =?utf-8?B?NjRvVFVqNFR1SUROampoR1V4TGJYdmxZdDU1QTZlVnlRN3ppNFhucjlCdE5Y?=
 =?utf-8?B?V0NzV0FFNzg2NGczcFd3UTdwY01qc3dOYXBzWmVjK0I2bTlTdTJJbFdpM2Qz?=
 =?utf-8?B?NVJmbkltdmM5ZWNRbk4ydHlGQWI5SzBRdk1tY0tPTEdBUDB0clJBSjdXR2xL?=
 =?utf-8?B?cWttc2Z4SjVKK0N6amdFVXZMS2hEUFMrV1dNRXVYUS8wVDZqVjlrN0ttclFq?=
 =?utf-8?B?dnUveDg1YmxSU09INjRMeE92QW5uSTNmM3Q5L3pIZGhxdURaVEtGRjhYZ2JR?=
 =?utf-8?B?dytOUVZkcVRjQnBtL01DL1ovNUFXNFU0WVA4SGRTZDdzc3MxbnRDd29rcGho?=
 =?utf-8?B?cFZkSm5naVdwU0x2eEJrNHhwMVNmZDVyOEJPQ21tNS95ZUVWL0E0TlVlMFBn?=
 =?utf-8?B?S3FQcG1mRjdXNGhyWVhFWmdEY0NhS2pRUGFWR1lkQ1lZTFg2V2J1ZE4ycnlW?=
 =?utf-8?B?V0QxYUQ0OTI2NUpBVDFCQ21rZjk5UEh2clhqcWpHa3ZUWnFJNEcwNWd5bTJC?=
 =?utf-8?B?MXdhSWdRN2l6K2UrRkZEejRONVZmbDlnalNJTkhWMGlKR0V6V0JESVJRenA5?=
 =?utf-8?B?NEg0cW0ySlRybTVyMEFMb3R4MVRCRmsyOE1ybGVPbWxkRE9FOGhKUGh3cW0y?=
 =?utf-8?B?MjFMUTdXV1JBa21iYTNVVE5xWDhreVlTdkxxVXA2OWJ3WVVqVlJXaTh5NWJH?=
 =?utf-8?B?eG9VU0tFMWdxWWFCRXFKTEd0a2R4NlBGUzFRRTBDTTN2Q3VHdXdiVm83UHdW?=
 =?utf-8?B?N0NpemVPQTJYY2J6d1BlT0E3dEJEQmx5YUhDQlVUcWQ5RUZYNGJETWI2UlIy?=
 =?utf-8?B?UlZ1N01NQ0VzS3N5M0FNNXBxVFliR3JUYktBa04va1lSZXpOeG5WVUFkRXBz?=
 =?utf-8?B?ZlBwaTFML3lCbWpIRFJGaXZIc25CVjZXQzBaYzRBbkhYU2hPOVpUTzRseGZJ?=
 =?utf-8?B?emFCSlBIUDdaWG5hR0NuYnZCcERod04yQUdoYVZIOHMwUHFORzJPaXd1NnI5?=
 =?utf-8?B?TlVGalZLanJhQ0NZaUVWckw2dFRiYzIzSW5YbUhPWTdsUC9rc3ovZGp2ZGRz?=
 =?utf-8?B?UlE0NVpMbisrWVhVNVFGQTF0NU92eUNtZVh4dnp1VjU4dXFLQnIzVFZZZXFS?=
 =?utf-8?B?TGQ0MFZpNFhPVTEycHBiYi9iV0JLOE5WL1pvTnIrZ2MybUtDOCtLM2VJazcv?=
 =?utf-8?B?QUxQMVBvUDFxT2lsa3BqQUxyQkcxRmgzVDZTdDZhcVp6NDFLeUxaUWtBZTNJ?=
 =?utf-8?B?YlJPdlZGQ3N0cUVFYlhDMm05MW9nUThjYVhnY3lvZ3JPMjE4VGZxbGZXZDdu?=
 =?utf-8?B?Zk4rS3kxVGU4SE1rL1pvSG1iQ2VRRElOaEVKUXRSMGV6WjZnNTdMa3BlajhX?=
 =?utf-8?B?TnBZd0kwQkVkN0R4NElPditnak13dmQ1N2g2c0kvOXF5bG9qREJJbU54VWlp?=
 =?utf-8?B?Ky9DRmxzZUVRaktpR2JPVUZPN2YyRjFJam52YmFQYVorMTVZc2czODlSV2VH?=
 =?utf-8?B?QVEyMDNGdTFyREcrMlVvTXFXTXZiMy9CL0tibG1IZVUvbThPejgrSU5VK0FP?=
 =?utf-8?B?Zi9uNUIyVm1HVXFacTVIOFlhTi9ZRVplRW1PMm9MZkQ2U0Z5ekRGR3laM0Z6?=
 =?utf-8?B?eG5QQU0zcDdXakYybVBOUmQvbi9pVkhUVllpMkJ3RXc3VEJvTmF4ZVFBdWJC?=
 =?utf-8?B?Z0MySXh6RWZrd0VCY2Frc1lseUFkb1l4d3E0SlIvdGZCTFo2aHlvaVhhM0J4?=
 =?utf-8?B?ejExbXFxSUZtOVNBQXo2NzVJMEU0by96UVZJUUQ5Z2dPTm1IT055YlN3OVc0?=
 =?utf-8?B?Q0NnU2lQMEZnRnhpZUxENitnZ0YrU0hjNERwSGcvWjllMlZnaHhuMU1SZTUy?=
 =?utf-8?B?emNCdGNvWmNpbWFQYzRIaW5hQ29ScnF2SmNjb2VqYzFVZGErdStFVCtIRmpE?=
 =?utf-8?B?blRoUi82MUlLamplRHJXMEJ4VncxL2w2OHFpczA3SVBzSzgzeXhuQnc1UmYw?=
 =?utf-8?Q?cjcSqUzh7iIAFrR19oHiOj3jW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3272b511-efff-4b6b-cba9-08da90200899
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:54:08.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwpQLdD6uRqScWhTlvHpNXgHJ6OSSJa482T1HxXNPsXP5U/KIv2RLpUEAtYu+5d8ghcgrJ2eDcAluFwNeutj3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3356

On 06.09.2022 17:46, Marek Marczykowski-Górecki wrote:
> On Tue, Sep 06, 2022 at 05:07:27PM +0200, Jan Beulich wrote:
>> On 02.09.2022 15:17, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/char/xhci-dbc.c
>>> +++ b/xen/drivers/char/xhci-dbc.c
>>> @@ -245,6 +245,7 @@ struct dbc {
>>>      uint64_t xhc_dbc_offset;
>>>      void __iomem *xhc_mmio;
>>>  
>>> +    bool enable; /* whether dbgp=xhci was set at all */
>>
>> In dbc_init_xhc() there's an assumption that the "sbdf" field is
>> always non-zero. Do you really need this separate flag then?
> 
> Not really, sbdf == 0 means "find Nth xhci", where N=xhc_num+1 (and
> xhc_num can be zero too). See the "if" at the very top of
> dbc_init_xhc().

Oh, I see. I'm sorry for mis-reading that code.

Jan

