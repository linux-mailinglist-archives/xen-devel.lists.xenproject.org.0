Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ABD70B55F
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 08:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537758.837240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zOJ-0006Qp-KK; Mon, 22 May 2023 06:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537758.837240; Mon, 22 May 2023 06:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zOJ-0006Ou-HK; Mon, 22 May 2023 06:51:35 +0000
Received: by outflank-mailman (input) for mailman id 537758;
 Mon, 22 May 2023 06:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q0zOI-0006Oo-8j
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 06:51:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 166b62a3-f86d-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 08:51:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7199.eurprd04.prod.outlook.com (2603:10a6:800:11d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 06:51:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 06:51:03 +0000
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
X-Inumbo-ID: 166b62a3-f86d-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6D3DGWMDyX6g6vAkGwf8Qov1gw7g9INnzD15pIMuDRIxDW4m4RFSFduyTmdJM5RVLLputZBM446LOGnxMqOmw4kDtd0EkxYyhuc2qfTqk02Y45tPPVRAOxBPMSxb6zLLCpBmlOJ+ROWtbcstVXA9nU8MJSDViQQBjfMZ2RyCz3x+09yuT+/skZZv7EwWER4Io2wlKWOVDgLLBdAIQZTi6qQp4SHpAWV613BPRkUij7qJceivsRUGqhCfJ+FIWqV89KK02sfPz7gS8U/N+VATvXhgs4BdOcO1oBxKpTZUBFDUDlFPmotBlCXRyxLkaAh7NN+pLnMOx4Zj0QJFY3moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kvn0ux3XSvDmdXSLLqfDwSD82qdAjr2L57M30ZkTR8=;
 b=dwMHX9eW4/VatHSH+r1NXMr8sy/8BSGsiAZeMmQYpY9uzir4OGTZC6CQz2m1EULoVza+5x+BgaF+oUNyDCO6OUYyWUhtE8ww4nCuMEwDkRx/jx1GaOKipOfAuwIPQWUqafVJXpgDc7IjGmHyWLHJqNXY1mkY36h+0WbgxoD5iFFUA4mRaWq5ZGj9sv7ipK4W7p2HeyO4RRX8xXPL2GZFiRDY/y/AmF4KkeoYBEv2vW95uMdwaOL594M/0pUGlgBG1tjVfvAVXtjjbi/sye4u10mtMaCy392UBCLG+wxdsIvbiDcIMJnFHX6yzIxowpDWsUrSP8EnyvYS6dX4YFdqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kvn0ux3XSvDmdXSLLqfDwSD82qdAjr2L57M30ZkTR8=;
 b=l719+tapiyBtMslfdljqIp/AoP4+hElLv0xTZtZNRyEjUehsjVyATp7V+ZTFF2JJDSDKE4xGEPm2+DjrfXP7ROgzN+MmgN+VJXufwIKJ7cOloxyjMkWPdPO+CV/wlI1RpFkhSbHcQC/32lEWK5P5p8izTsiL31wCDRh9YmNYJFrhxN7d16PdFf2GLq28IoTpHSuQ8cmgFjB9R+qViUuMFRM9PP8AA9AhxhpXtRbrYngAKiyvAb+UTruvXfu5fo51ZwrjQ9gTliarzwy7Irh2pCr1rNwjbr0rM+N70kaS6lwpaVU6lOloeLTpmTA4lsFr1Mg79gDqG7/98urT+8yBJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24587cae-293f-f807-0eab-18bef573e68b@suse.com>
Date: Mon, 22 May 2023 08:51:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <b411f7aa-7fd2-7b1c-1bcd-35b989f528b6@suse.com>
 <alpine.DEB.2.22.394.2305191544420.815658@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305191544420.815658@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e342564-feb3-4673-b6e7-08db5a90e87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MinrRNB0weAP1P9BhKorcWBXm5x91WZ+P4i8UUKhkFGGp8D7inT51exP75dTQ/IwwHz0QhuG7AtiVehIlkxQ1Stb5v7zz+OyVy38Jrrh6/BmVdrOlslmSSGFtZvP8lC8kiZBvjUIgyf0/rGB30+mYSNNddoqxhopRsaATCuvBfi7lOkXuRQeY6atrRlyWnhpdp+6qRUXk9NWL3TgwZeJ9Ah2sc9PAn+op1FNoumOcKjlteBbKrzOwOBs7szye2CcVbMfUGlQkKyNQjcvSM04NOejKeiZlhfhCZODamn2rbr8QtsilttZT2Ybg5lcDoTE+EmZQqvHpAh5wxJNUeoWAn/I93yqt1VW4+dH9AF/9OcLSoGwZcNswih2lqbQmrMSmfoyDsDZ9KTwS5wLacZT7OanFgHHjOYz9Ks85QuFeW7J0zeW+JD2BdbYJ+f4UgJP9FsA/SQlGo0Bed/1bufANELu1iq/piQ6uAb5i7nDqOK4H+Qnd9HuweRvrh8T1LGehBi1X6hmaW9pJHX4i/FJuTzFQtCdXFP81e3fqRoLhexYa1tcFEJK9terKCiTSZNszQnxWP2n6Hsx8UYQHdJed6GtNcuwi8wBH/s/9aotEJoMvYhPE126mm+lwO8cbego1RexjcKxHNW45SQVwbzW9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(39850400004)(396003)(376002)(451199021)(8676002)(8936002)(5660300002)(186003)(26005)(53546011)(6512007)(6506007)(83380400001)(86362001)(2616005)(31696002)(38100700002)(41300700001)(6486002)(966005)(66476007)(66556008)(66946007)(316002)(6916009)(36756003)(4326008)(478600001)(2906002)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZStDbE5VSG1IRVE5VERjbXBhM0lUdjZYb0JlOXFFRWR5NUM5YUxxR25zQ2Yr?=
 =?utf-8?B?YjJxdFJXNjRBK2lnN2JlSWYzRVpveHRwMjZwUzVjRWI0UTFWRERMdkxGKzB3?=
 =?utf-8?B?aVBzYlJRRDBWaXF4VDd5NHQzLzRrNjVXcWpqQ3RialB1cVZKM3RrS0VpdW1t?=
 =?utf-8?B?VEN4QWMvYkZpcFVoVEVTVUVzSFFZaFMyV0xuWXJKcUwwNE1aVVNUTGZPT3ph?=
 =?utf-8?B?a2ZLUCtnSWxNRExzYlRoM3Zuc1JhdEtGOEordW82Ni95akdvYzcyMklvSXF3?=
 =?utf-8?B?TFUxRGNBQjRjWi9SVS8wUkU5V0pEMjMzQzdZRjlpc0s3TVc4Q2JyYjFHbGRq?=
 =?utf-8?B?UVdicDBnODYyOWdvUEkzN1p6dng2Y082RFdQMVJUWnhsSDlKR25wd1pUU01W?=
 =?utf-8?B?alVkT0ovQXJLN2xKUGhRczQzbmRUN1gwakJhTHNWeEhSTWlRMGFqeXRKQXJ0?=
 =?utf-8?B?bkh1Szh0NFQxOGpQekoxbm5rblFuMFZHeCthZTRNU0VGcVN5RnhkdmVoTDBa?=
 =?utf-8?B?Sk5HR3ZUYUkwcGlLNmRSTlgrL21SbTJKRGg4SHZrY1JZU3VTZWpNSzdqUDNP?=
 =?utf-8?B?SU1CZUFpZ0pZbFBjZlhPaHVlRk5pamIwVlpPdFU2ZG1NNUltT29BbDFiR0lS?=
 =?utf-8?B?R1ZObXZHeVdsQWdxY01yZUhJZWlYUENudHlFYUVBdDV0bzNSWGQ2STlOTEZ1?=
 =?utf-8?B?dmgyMUR0b1VDYnpxclRDODhWQWFIMmNMVzBtZnh2TGZSQTczTGZ4NVU1dTdi?=
 =?utf-8?B?UVNMd0JqemI0U3k5ZzUzK05JUXNpV01LeWYrMTRqemsybWVKNlVRU0pqM09h?=
 =?utf-8?B?ZXhCaUplbG92WTBNcU50VXUzRC9RWjNvQ1RYano1Z05qaUlIYnQyQ1hhRzdP?=
 =?utf-8?B?TjBPUnc2RjRuV3FONUlEMysyRFRoL201WnpMaHdLSzZ3TFB5WHJacTUycU5v?=
 =?utf-8?B?Z2FZMFpYbmRGdDBPM3JVTTlSTUxGZ255b3RoUkxVQU41Mmo5SnNoMmRxcW1U?=
 =?utf-8?B?dGZlRzViOHlTc3BWTGwxMU5CdWhVdmRaTkVtL1hYVjlyS2M5TkYvQ0FzbHB0?=
 =?utf-8?B?YkprM0tLQnpnNzJBMlhDRE9uaGJZKzBIRHU3Rm9jdC9jenNWNUZBNE5MOWFS?=
 =?utf-8?B?Tk9hZ3AvcjF0RDcxNzdsTlpBc1lIUjUvZ0VMMWVzMTBvVHEvUlU2cUFtcGQx?=
 =?utf-8?B?eTFKcHJkalo1RlZYeHJtNlQ4WHJMOFRhdXNEYVB4QzFQSjNjandNMGpBODJF?=
 =?utf-8?B?ZXkrWkpxeVg3UXVsZTltVUpHMTNsM2tXTnNwYWg2dCtmZ3RSUnhlalh4MUt0?=
 =?utf-8?B?ZlBlVFNrSkk1QTRhQ0tYMWo2SmVaUkdBSk9hdWNqUEU3bUkyVklMdUpWY1hh?=
 =?utf-8?B?RXFWb3lqZ0U2dHRqRTQwWkYvRG80M3JqRVNKUitJa3FJeVdCNFM0MkVTOW5Y?=
 =?utf-8?B?bVM4QUo2WTIvemFmOVJ1ZHhXMWE5VjRRTEJPWDJGV2ZmNTB6TytUZ1B5ZE1Y?=
 =?utf-8?B?UGUyOWFBUXVtbWtzdzRnTTE1NnJOUVpJUVVGQ1loOEJ3K3hsVzJtcENNTlFk?=
 =?utf-8?B?OER3SlhmdEhSUTI1ZjBXdUh5UXpzck5zazZIRmN2QkFHblRqdjdmK3A3UGd6?=
 =?utf-8?B?YnMvMlpFWXFqN29obWt3c0VkMmlHODkvdGhyTXlrV3BNSjVDdE1vUXM2bGl1?=
 =?utf-8?B?RW9xNURHRXJPTU1QeUpoOGVxcUYxeWp2cWdnMFVmbWdLcDkvRSsvaWI3aTNu?=
 =?utf-8?B?UDQ5cmp2UWdZNnRBeWswZWRBN0w3U3NVTmRQTGtNc0x3U1htdm9wb2ZCSUR5?=
 =?utf-8?B?L0FRMDZKYS9OdVVNQWJXb2ZhOUdsQTg0alpnRExLVExUaXh5cld5U3ZJWnNy?=
 =?utf-8?B?aHFMRXB6TmNUODRWeWdxQk9idXdRQ2QvY0hqZk9UMWV1OTd5RnpoOUFLUVo2?=
 =?utf-8?B?cXErR1ZDNGhNemU4TVY5cDF3QUszOUZsQmNMU1ZoZHl6aVBrc0JBbElpT0Ry?=
 =?utf-8?B?RElxK1hIcE4zb0NZcGlYdytRYnNLaWNCaSt4MTAxYzNGc3hsQkJxYmRwYndU?=
 =?utf-8?B?OER3MTFRMU14cjdwM0QxZ2Z3R0paUlRjdjBWNkZ3R2Z3NGpNWHFEZzdBRlU2?=
 =?utf-8?Q?gbZctp6snAm+EVyUu7EQr5197?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e342564-feb3-4673-b6e7-08db5a90e87e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 06:51:03.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwC0J0/BHi9RijiIuh0pYWHsghYMPY+HunhtnDGRl3qAuUTMexDH+sxromqIBjXsWuX1vjfqQn2D3N4SLcba/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7199

On 20.05.2023 00:44, Stefano Stabellini wrote:
> On Fri, 19 May 2023, Jan Beulich wrote:
>> On 18.05.2023 12:34, Roger Pau Monné wrote:
>>> On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
>>>> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
>>>> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
>>>> Zen3 system and we already have a few successful tests with it, see
>>>> automation/gitlab-ci/test.yaml.
>>>>
>>>> We managed to narrow down the issue to a console problem. We are
>>>> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
>>>> options, it works with PV Dom0 and it is using a PCI UART card.
>>>>
>>>> In the case of Dom0 PVH:
>>>> - it works without console=com1
>>>> - it works with console=com1 and with the patch appended below
>>>> - it doesn't work otherwise and crashes with this error:
>>>> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
>>>
>>> Jan also noticed this, and we have a ticket for it in gitlab:
>>>
>>> https://gitlab.com/xen-project/xen/-/issues/85
>>>
>>>> What is the right way to fix it?
>>>
>>> I think the right fix is to simply avoid hidden devices from being
>>> handled by vPCI, in any case such devices won't work propewrly with
>>> vPCI because they are in use by Xen, and so any cached information by
>>> vPCI is likely to become stable as Xen can modify the device without
>>> vPCI noticing.
>>>
>>> I think the chunk below should help.  It's not clear to me however how
>>> hidden devices should be handled, is the intention to completely hide
>>> such devices from dom0?
>>
>> No, Dom0 should still be able to see them in a (mostly) r/o fashion.
> 
> But why? If something is in-use by Xen (e.g. IOMMU, a serial PCI device,
> etc.) ideally Dom0 shouldn't even know of its existence because the
> device is not exposed to Dom0. Dom0 is not meant to use it. Why let Dom0
> know it exists if Dom0 should not use it?

Because we want to disturb the topology Dom0 sees as little as possible.
For example, imagine the device is func 0 of a multi-function device.
How would Dom0 know to even look at the other functions, when it can't
even read the relevant bit in func 0's config space?

Jan

> In Xen on ARM, initially we didn't expose devices used by Xen to Dom0
> at all.  However to hide them completely we had to make complex device
> tree manipulations. Now instead we leave the device nodes in device tree
> as is, but we change the "status" property to "disabled".
> 
> The idea is still that we completely hide Xen devices from Dom0, but
> because of implementation complexity, instead of completing taking away
> the corresponding nodes from device tree, we change them to disabled,
> which still leads to the same result: the guest OS will skip them.
> 
> I am saying this without being familiar with the x86 PVH implementation,
> so pardon my ignorance here, but it seems to me that as we are moving
> toward an better architecture with PVH, once that allows any OS to be
> Dom0, not just Linux, we would want to also completely hide devices
> owned by Xen from Dom0.
> 
> That way we don't need any workaround in the guest OS for it not to use
> them.


