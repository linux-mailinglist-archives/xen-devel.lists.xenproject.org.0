Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A067858A74E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 09:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380862.615275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJrxO-0007fX-Ol; Fri, 05 Aug 2022 07:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380862.615275; Fri, 05 Aug 2022 07:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJrxO-0007d3-LY; Fri, 05 Aug 2022 07:41:18 +0000
Received: by outflank-mailman (input) for mailman id 380862;
 Fri, 05 Aug 2022 07:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJrxM-0007cx-O3
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 07:41:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc2c2237-1491-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 09:41:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4024.eurprd04.prod.outlook.com (2603:10a6:209:50::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 07:41:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 07:41:12 +0000
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
X-Inumbo-ID: fc2c2237-1491-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWVadnHgU70SJ4Jbrn5V0Rslm9Zldgcmdy1B9Hot/1nNlGUNMN/d9Kf1HLstLxMicE5lN6Fnj4hL1FKhyaKbG51tYLwt7p390o2qYXPjOjwwA80q26f8ArsfMLMF5ZbMGWjZjoROZsFWGEPRjbUW4e0iwh5nRRFWmRV+LFijMiTihyRl6RDMaTmO6mQEA4Gvej1yag+cqShr6ZUxIjZze/iDP7/2ba493Sby6tTWsvDHyqEaN8DLQuMoA33rgzLU+HOZqywxdCmsfbtwQqhtjFhs2bCLBWb43LCVBARvSmF37+FPKEQ1BqJiOIqR1ksRnPNiWeZSffQkM7MzS5yOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMVZkPaBcQFTELXHDK18Lma/45F58cCxaNf992O8oDE=;
 b=SVhEPfRYElZoM0OXItpI+yJ1XeTYYYjBnV+nWe1Aifne49Hbni0g1lo1kENmv8c/wQJTnBVAm/x+fH15YrPzn6X6Yg5KcuUNruzXvn1Mjg5mOsYMK9xPKMiNqtCkZYYdTcl/ox2idZQuVlhUR7WHHxbtyYnArGaeb/ahkmUASlIkPA+VOarVaDQ05uOkzBzqpPJq+i8T+EBJt6aXQTrQYD3OyQXf7tpTht2WnicvP6AKDxDChe4O16/fVTFXvoLUZUB/0/QRkccmehkoocxG7p90hknNZa2fTnuXzMv2gehgpwuqHo6/Jc1V/dPKBiHH4L/aByGix6kwc/M/rv+eGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMVZkPaBcQFTELXHDK18Lma/45F58cCxaNf992O8oDE=;
 b=yLc5XJFjyhT/GojSZg3eOXg4XjXnBt5tpsigHasWohb1rOfyu+7x/3c5bExfEXMAp0C8B9dm/XGDLeHOfF7fL5NNQELHI7+/QXpeRzGipwIHUbRBmY57CEM3Ke66xHvXJ+TcG34CSWtShP554JTB43pZTyih3ZGzRQgsRnhT8Z0PsyiAZiPgDlfkQE+i136crmBEiyi6Mh1Ao4UlRfawwgCb5gP7EmCYVR9Knw2aWJ3EyDgNR5mC/YyQAhfSqR9KTRxIED99NcvZABzX+yi4+TyRJGhEmIiTH92y58ICNOh8qCbbo8EfdGWPyL5TdK9T91C6Tv0e7QlUL2W8Js4mgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48ec7c43-d9cc-e6da-dd06-1119d5a909e1@suse.com>
Date: Fri, 5 Aug 2022 09:41:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/10] console: support multiple serial console
 simultaneously
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <14411aa674b61d22d9626a3455206454793b6a37.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <14411aa674b61d22d9626a3455206454793b6a37.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P251CA0015.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e49f7790-6763-4f45-7425-08da76b5dec6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4024:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kJHrRl5PDGhzjanohkMsZccXtnH2ZXNboAq3SIztdWeez3oJqohY7xMpVJPjUJF5QtAWjqLxav52Yu05wvKvrpcXuQBp8VDe7wsdsGFenPJKy8WOxk3733t3pf2NkoGG9mrvX99h++KD40/hrujIBM2xPIACJeJLQvE2qka73VTD6k3KoPMFVJg0qDPJ2AQ0G96FUVJLBQR/MeYbtSFPdOhLAgOIH2wgniCU+Fy4EkRh/8HLIA2JXm+7E2kwHx67Jg1/DhTsFeswi5t7CaFmv93QzhGgdICudcNtSWij3HmXquT3sWMSFG1XRA8fUrALHq9rRVcb27L1fqDk5pdNc3G31Y7MN8VPRVvISHoQ5aGK+GHK0MOWKjEoEPZguq6OGvvQvOo5YsOUMTBNRVBicQQoe9d5+yfZG+m5DkxVVvog9xMA/o+RfgXaR6pJHUVuwCQ88c94oHcNVJl/mUtnCSwb32xsPkwSabQs96RpcnvlzB/uhF5oHh1L/ZH8ZQmAQyo71KzbvC2JbJiyOBQKxvyXoCykrCL/1lCyiCa17rfmBP7iqjXAYyq15W6BgfFcnudoBscpdKodvobM7OfvHtK9SnB5b9It8/NcCmQ+mY7mQhHa6DQ+b8eLlWHqq/qAqc1E5vocQDD2+R+gbgu7OBdvcjSMTfRKXED+bBewUlRwlDqm5YaoRib09CJO+IikDEJQN5kh3A7z8I1REE7y7rP2eXUSkKzu/MwIelwACh/9o4thMqBn35D3CmKsw2RdyZ8br+loxcwCfRMADBaXpwAqJEaGjUq6wPGfQ0K1MUMk5SijHTEzk9QXn1p7cUo7SByMWzgT5caHxoZYocj1cw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39860400002)(346002)(136003)(396003)(6506007)(6666004)(2906002)(41300700001)(53546011)(86362001)(478600001)(6486002)(8676002)(4326008)(66946007)(66476007)(31696002)(5660300002)(8936002)(66556008)(186003)(6916009)(54906003)(2616005)(36756003)(31686004)(83380400001)(6512007)(26005)(316002)(38100700002)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXU1ODhBV3I5NHAzUTBqSFY1WmRCV0NMMTYxSWFCRlloQ3JjM1pIS3NZMmZw?=
 =?utf-8?B?TCtyeEdtQ3VZMDBpZXZYR2I0Sm9Sc3hGQUxoSmc3dkVnV0FxVkxhcXF1Vitu?=
 =?utf-8?B?Tlh3NVk2SndUaE9acW5zSmVodExNRnQrRzc4MThMQlA5OEdrbXVVdkVIUm9s?=
 =?utf-8?B?SmJidHhmVWo0aXUwMU1QMGNNMUxtYzdVMXZ0V1czRDhiL1NhOVRBcUxVZjUz?=
 =?utf-8?B?eEtrK2U5dmJyS00rRVBjQUVleTBhZXhXWS9PdDJFdG52WHVLbE1IdW80VE5E?=
 =?utf-8?B?NEE3OURNOEFLM2ZWYlZ2Q3RlTWNSaE5rc3FMazByNkhoQ2ZWV3dhMllWSEY2?=
 =?utf-8?B?Vng0Rjg3MElqSG9KZmxncE5JNDA0ZUZleHlxV280T0hkRXdRbzZ0eUxQOG1r?=
 =?utf-8?B?SmhPaEJ1Y0FXUlpNT2JCcHcyMGozU09PUlVMNEtZS3E1Y3AxNlNsdXJ0QXJC?=
 =?utf-8?B?dngvdXEzaVB0Q0N4aDNrdzJqc0xrOU9BOXhJdi8yeGsrVUhIT1hFbEx5aVgv?=
 =?utf-8?B?dlNsMExvclZmemtMWkhvdUNFRm9hOWl6QTFEeFVueDgvVDdESERXb0YrSmM2?=
 =?utf-8?B?Sm1ZZzg3cVkzNGhvdmJ2YUd1MFI3eEJhZDZvNEsyS2ZEU0pUSStCanZvSGJw?=
 =?utf-8?B?UitvWmlMU0ZXRW9FL0VEeEpDMFZ5RWszTU51WUhpc0RZVUxoK3Y0aFdKM2Fq?=
 =?utf-8?B?ektTSXVtRTFKUXJpSGVRb25zRXZ1R3RBcGdnQ2FBQ0tsSXo5TDV5SUhpakhL?=
 =?utf-8?B?R01naEJ0cEYzQ3FPOFhWWVRNSEEySXMzNHZJeExFMnZCWG51OG03dFNGMWs1?=
 =?utf-8?B?Sm91WUtzdWlPcmU4RlQ4NlBSc0tIWkVWbmphUDMveEE1cmFhVTBwU0w4M0VT?=
 =?utf-8?B?T0lZU0lRMkIxa0hpakZCL2dvaVRvdkRmRHVMRVc5MUVsdWNkbE1VNkdhOEM3?=
 =?utf-8?B?bXAzOFAzaExTTVZQenFqWjZNbVY0aEYya3ZlNGE0Smp2UTZlTGhZN1BUT0ls?=
 =?utf-8?B?NWNuVzl0eU5GRTM2ckNMaWttQXNxZkkybFdjWXhVRnJ5TVJiTzVOZVRFR1lD?=
 =?utf-8?B?SGYrWEJhWDl0NDhSTnZCbDRuRlVoMVJTSGdlaDN1OEI5bXZ6ODFNVWpKSm14?=
 =?utf-8?B?cS9Oais0alN5eDByL3dwemoxK1E4ci9lalVBNkNFdHpXSENYaW9IWlJuQkpz?=
 =?utf-8?B?VU9DbWc3ek1sTytrNGJRbHlld0FFTlVEM0NGV3dnakp1bllqQ0RKbDBVOTRa?=
 =?utf-8?B?SU1UaVBBQVRrdldHYU95YTlsb3RzNnhybk5zUXFFK3loeldXOWNieDNWTVY5?=
 =?utf-8?B?VExDdCttUGdyQi9tMEZHNERpTzFHZHZSeW1LSWRyOXNWQWV1OUNuUVJVb1Nm?=
 =?utf-8?B?OTkrRVJLdDJIcG9iV1JiNC94RWhZejBDZjFJNXFocFRQZFFJUnJNUHJib0d0?=
 =?utf-8?B?Wmp2MVA1bHpIZjQxbFdLTGcxdTNoVDh6dW1URlA2cUEzLzFLVWIvcnVocE9s?=
 =?utf-8?B?WTRyMk9CWW5HVm9XdStIajM5WWxoNHdsRnI2K0FyVkdwVlpNS0Vpc0dBL29u?=
 =?utf-8?B?WUFScWgyR05TZFJ6cjIwRnoyeTcrSUxRVGQ4UEx2bTlUWXhPdjNZYTM4RjE5?=
 =?utf-8?B?WUxXTWV0eFRsWks0ZUZLQzBQMUJ0UXlibGlsUE84SjFvWGpGTjE2Zi9HYnFi?=
 =?utf-8?B?bjh5N2lTZnlvdSs1NnJINnBEYVkzK29MQmFtbWYvV0NxVXN3cWV4d0s4VGVP?=
 =?utf-8?B?QzEzTHdDUzFxM01WTlRzS0VYcnZzbTUvVnNHdTcxRzM3Ry95REhCMUp3ZVJu?=
 =?utf-8?B?L0hSeDJlcHU0ZUxvWmxjY24vRkZVeE1ScFhhUHpIUEpkazBhZzVrVHZaeXBi?=
 =?utf-8?B?Mjlmbmtqbks2eGUzMnZhT0pZenhXOVA3Q3M0TkozbWZJb0xhQ2grT0Z3Ty9T?=
 =?utf-8?B?RDFRMVppeGRBcC9YK1RDWHY1eVNPand1TnJLRkt6bWswYnF1NXdjQUlIT0U3?=
 =?utf-8?B?TjZVOUpnZWw5K1BpVUw4S1pOampIMmVVM1BMN1NIRHZWUnVsOTZ3V0pUcnFO?=
 =?utf-8?B?VTBYR3praGV4OWRHSGxlV2w3WUlvQnNhcHlkRGlZeUNRTUdlSkJuQ3VDWEdn?=
 =?utf-8?Q?0pFP/7uYZerczLMST6Uq5xrYw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49f7790-6763-4f45-7425-08da76b5dec6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 07:41:12.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AK5slDpHU3tf58BsSloVUrc10yYPNo6k7lpmTxmV6rLWbCwqljujoWod5vKZOChQvBoyDL36UPGgQ3zpBhbrHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4024

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> Previously only one serial console was supported at the same time. Using
> console=com1,dbgp,vga silently ignored all but last serial console (in
> this case: only dbgp and vga were active).
> 
> Fix this by storing not a single sercon_handle, but an array of them, up
> to MAX_SERCONS entries. The value of MAX_SERCONS can be chosen in
> kconfig, the default (4) is arbitrary, inspired by the number of
> SERHND_IDX values.
> 
> Make console_steal() aware of multiple consoles too. It can now either
> steal output from specific console (for gdbstub), or from all of them at
> once (for console suspend).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Actually I should have clarified yesterday that despite my effort to
review this change, I'm not convinced of its need. I simply don't see
the use case of having multiple serial consoles at a time, and afaict
console and gdb connection can already be run over different channels.

Jan

