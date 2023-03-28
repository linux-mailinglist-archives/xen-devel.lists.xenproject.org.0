Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06F6CBF52
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515753.798904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8as-0005Tr-3r; Tue, 28 Mar 2023 12:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515753.798904; Tue, 28 Mar 2023 12:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8as-0005S7-0P; Tue, 28 Mar 2023 12:38:30 +0000
Received: by outflank-mailman (input) for mailman id 515753;
 Tue, 28 Mar 2023 12:38:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph8aq-0005S1-Aq
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:38:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe13::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f44418f-cd65-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 14:38:26 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB9PR04MB10012.eurprd04.prod.outlook.com (2603:10a6:10:4c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 12:38:24 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 12:38:24 +0000
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
X-Inumbo-ID: 6f44418f-cd65-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayHrlTElz90GpviE58jAypkr4f5qkQpXtAtMutx9dBIgnSsCZa/WXND7I/6YbyO55B5zd4pGrhmWfK/UytpKUvRq50oFrsMULX3uqMInZ4LqCl+XG2XoJnPiIYHXKcGMdiYecHoPtqAeVl6JsrM9B6+93cQbke5NcrQT9Yv2288eePx9vjHXXVUWRPjRWvSuH4G0+dcBkD5xecVUX9jlGwIWZJzNtHQ8lJN/3e0YxxzRq0BL8Uv36MAPxi6bb316cANqQLsIiLHK940gjozzXiRr5N/ca0M6d37VSn9KsQ7gqmELOQvu+nnUg0R8cbutKp2MueoXiMswQxE+wwVVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snYl6+DUNGmGFIGv1Ug0RJEqdcUwcyyoylDMzhHIMwQ=;
 b=S7Be5czlXMKAnZrhM03OG9pOxXu/92uZtQ7JZtd/qvJE8BI1sn2YbvLJdt5ff8/OFngsFRNMQjNW66Kg7CxErLG3F3GYaqjnA77LHVJgdY7iLWlaeG8WoIgCJpumbomtLSL8P5cd/RzFpz7fXpafb0cF+w6g1QBdtVrJkVqw6sQP9Ls5n+wdvGEb1p97Iq74M/qG0P0o9bd10/j4Zc9TA3Y/1AD9GIk11m/rw6r+Z0vh+F2WPZ4pAzaB7VZWG/8u+LREu23C4aEJZqth52AVt8EdC1KBfkU1lL9cpZPkzyllZ9HMkDP7AWMSeq8hGkpPdiCntBA1JyDW0CHWa0f4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snYl6+DUNGmGFIGv1Ug0RJEqdcUwcyyoylDMzhHIMwQ=;
 b=AkJRvaF31wNl2pFtIt5gLUpY8UGo9bJRAxhp2OQuRigeLF1IxrS/JPnq7GkTEy+pJvU9lMxWvUbWoPeuVj/g+IFHEwS56mReVwBcA+qXCPdJgVCoXRat2dyDrQ9rXyThF8bLbbuhrfj1FTkLvrmHb7uQKxSovQdnVB3vPauqPlN8L4sjq4BjecEbY+r9o2C03U+Oo+eLY+vm8REgurhUGZ1AUQ751CF4vKlwk0YBzrWmJhyLGq8S6exh4Ywl5Z0gyL3WZ5xBIg7olQMB0D6ypeS1nP0BAGPmGu9Yf7LhDK6Ou7VSAbe8Xpf5ofIWRhbGUs9J6YqTnb26jU0bTaMetQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e953c7e2-bbf0-d005-7427-e3d22b77a231@suse.com>
Date: Tue, 28 Mar 2023 14:38:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <ZCLRap2GJE0xwBCN@Air-de-Roger> <ZCLYe94PE3WXYnU5@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCLYe94PE3WXYnU5@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB9PR04MB10012:EE_
X-MS-Office365-Filtering-Correlation-Id: 0619d38a-da49-491e-e22f-08db2f8952a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J3KwksMncTVvmQvO/9Bsf+Q3cU+8a4BgUkD9iDWHaOX1oGMhm1zw6qg3dvyn9zjXX1hMI2d5tp6U4x5Ta3sXWzGfeIyQFZDVQPT9VOu/975Djc8JKXpQ+07wgEAxq5qSgakYnwsU5UgOucuaBOdIdmvoy7n9GsYnwheSKCjw5Wpp8I2zZkPTcD3SePXctYki4G8kt+AKaL5FGlFc6sxQhaClvnbndp+HxImp+/AGF+L4+cPHUXwHKarGJ6jSWjVUhHZx3WnVQilAumaampz6hjTYJS6Th/yPFJagJxadeuQ2es3YzvcIRYmRYikCYrtknQbgNpO/cxV21ATUvoFb+x+GGNel/VXRohq8beTtigsvR+1Wsh3RoIMBmOE0Wop+Co0bTkwn/Yks5Cdh53o1IpmlDfWANDM9aLLKeOR/61yBK58RoTMcL7NAGDsdQuwHdm4tFKcXdayMg8G0m1EfZZQzMhbSW9yHmrSc4DC18xlmXra98lznAAJ1qHpXG+cPNOHwYD9qtkw6E8KoZEEzPeyzMl9JXjhZQIuU3XVugZscgmdzYHkoGBevlGcXDl5JbDIyBUV3qwIpvnAbKCOa2UIXS7K+M+nwefwbhP0qteT8m6l0q2MbuhJgKRY9OSdEIKWgrnuqpGeppHVza5dMFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(53546011)(26005)(6512007)(6506007)(41300700001)(186003)(6486002)(83380400001)(2616005)(31686004)(66574015)(478600001)(54906003)(316002)(38100700002)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(2906002)(31696002)(36756003)(86362001)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0syRG1yWWNqZ3pSL1lQalU1djc5QVN5cjBXN2hubGJkak5iS213aXNtRkN5?=
 =?utf-8?B?SVFvL3ZjN3ZRSWZlK3BaS3RzTXA4ZHVrcnVYcTEzRmM5SEh2VGlLZEJKc2xM?=
 =?utf-8?B?SGN3eHdXYXpOVnVhMW90M2c2akNlV29MZXpwbTBIQjk2ZlgzNUdzZmlIMmx0?=
 =?utf-8?B?eWt2Y0lYOGZibklFMjZyZUpqQnVqcys5WW1PQWFzbVB5S2tBQVlQVFd2Z0JN?=
 =?utf-8?B?MFI4MGZGU1ZtRDJXOUduaVpNRitXd1B4aFpONk00ZFRoNGZSTWdDc3I4K0Q5?=
 =?utf-8?B?cjZDTWRnY2hUeUpndzkwaW9hUXlPcXo0R3YwbWVoRng2OUFWNkQ3Z0RwbDJa?=
 =?utf-8?B?ZFBZa2Vkakdld1pyZW53L2RPdVNlMTFVQ3dMOXoxYkpvMS9RZE43dm9YcjA5?=
 =?utf-8?B?Rm9UUUN4dStWWHhrRTM2OHNqZnpEMTBwVERvamI0ZGo4Ykx3eU1QTE1RaVRo?=
 =?utf-8?B?WE1Uc0M3d29nUHNIcXNEZXRUUmNSV205QjM2a2VXaG90ME5hTnhvMlNkTUYx?=
 =?utf-8?B?bFQ1YllaQXowMlRjZ2lYRWdSampNSTM1cjNUbExxUVkxVlN5K08rMGpzVTlm?=
 =?utf-8?B?QzhjaXY1UnJ4MU5zaUtMeHFlMmJlU2dib2ZlMHVvYWpJTU1yYnZ6UlV0M3Zk?=
 =?utf-8?B?bkgzQ2ZxdU9TSWxwZUtVYko5T2Zzd3NkRjBwSGxvUlZ3elZMZjV6azZHeXhp?=
 =?utf-8?B?Um5UQmxmWnFxYjlVb0Fjc3FxcGt2bWcrM3ZEWU9hTE0wbzRLMjQvRGUzY1RW?=
 =?utf-8?B?TEt5R1VRQUYwYXZ1ZWpnNjN6TnZUaWNyc1NhQWNoUGpZczFtamNOSEFSSmMv?=
 =?utf-8?B?UGd2bDJoUmZWZHgzaGlkZGs2aUNFM05LbHVNak1nMXBCU1Fua3lza3ZodE0w?=
 =?utf-8?B?b3B4YllOSzJ1MmVsbG53amxHTmRqclJERkFuVXVVODVsQ2FHMjh2OHZqMmxl?=
 =?utf-8?B?enZMVlhEUHprZTQxdTBRV2toQ3FuMGZwWGF4bm9kTE1seHcrTDBtajBGa0Mw?=
 =?utf-8?B?czRCdlBPemYzMkxPNWhsdlJhSmkyTlA5SlZacUsrVktGSnZqTG5razNHS2pM?=
 =?utf-8?B?RHBxZ0JER2xrMmJscjQvbjB1N2RIZm5oK0I0bVRZMzVpeWVoUm5ZdWZ3TGpk?=
 =?utf-8?B?Sm1BT0lOTmhVR2pGdVQ2UFRVZXdxT3FhMHFUKzIvNEI2Y29POS9pZWlNY1dm?=
 =?utf-8?B?M0xQaU45Y2FySC9qdENkQ2pnMHA0MThwc2M3MndNaGtPYnFPdGhuejJzb1Za?=
 =?utf-8?B?SkVNKzNWeG1odWNYWi9yODg2ZkN4Q0xyOHZvNmpWNHV6bHIremJrRXJNcE5H?=
 =?utf-8?B?dXlGVkg2Qm1TOUJteUovZnBIdlJnZUh4WVhobHVGMTVHRzZ2ZFJDTUwza1pp?=
 =?utf-8?B?NlBFNUo5d29UR2RXbkdrelZaVVNXUjNWQ1NUbzNIMko4TUNLbHNWSGJuK2Zu?=
 =?utf-8?B?WjJJY1g1c2JQNUREZFFXRWI4OTZ1d1NOVTltZ010YjZtV3Bxc2ZMRkxKMGwv?=
 =?utf-8?B?aE00d29WUUJ2VzZtaFVYWkt1NGRMc254eEYyQWRZMFRYT3k4TUFDb2RxK3lH?=
 =?utf-8?B?QlFScDR4WlNqaFZrZDFvM3d6eU5RSTVXVzR3dndSRWhaWWZsb1IySFVEZ0lW?=
 =?utf-8?B?UGJGRTExcUVRd2lONitCcXUvOHFFclptN3UrQkNRbWlBRlBHRlZYQzB0TURT?=
 =?utf-8?B?SzRsa1luQ2lWSTh1MGRZRnNXdlBFelVpaFBpcnJMQmlvUm1mczQ3cnVuWTFU?=
 =?utf-8?B?V1EzLzFyZGZZYzc5VkpzUlVVdG5zUDNNZ3pCVWZMS3ZPUU9URDRSazV2dlRa?=
 =?utf-8?B?QjJKRGlqWHRYYzc5NW5pSEFTQ1JKK2plREcrNHVMN0hHelVkRnFIaDVMM29p?=
 =?utf-8?B?bWhyNXd2MlhlTkZuYWJlbkxEYnF5WkU1SXhmZm16dEFCSnVNTXFIZmgrRVpn?=
 =?utf-8?B?LzA4L3k3WUhTUUhobXNHemkrUGVrN0paU2NNRzFpYmJpZm5TZG1PRWRkSFJW?=
 =?utf-8?B?QVRHWTJHOTBhVEU2N0JSYzBUSThZZjhZazRiUmY5U3RoTXdCeVNjV1UwTnY5?=
 =?utf-8?B?UldEZjZtdUoxNzFjNkRqRUtpY3ZhK3NDdEM0MlJjeE5DaU9XdStPVXBJMjJO?=
 =?utf-8?Q?5sKqpYwraOhnIJ+tgRHdVGveT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0619d38a-da49-491e-e22f-08db2f8952a0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 12:38:24.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyI2VUacvg5kFBIB6FAzu8Fw6VwJDo0Ux6v02dncKM453qvLrC3uFiAHPEgGUwBI/vj3oyLwcgCf1qQ1xzhzQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10012

On 28.03.2023 14:07, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 01:37:14PM +0200, Roger Pau Monné wrote:
>> On Sat, Mar 25, 2023 at 03:49:24AM +0100, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/passthrough/msi.c
>>> +++ b/xen/drivers/passthrough/msi.c
>>> @@ -48,6 +48,13 @@ int pdev_msi_init(struct pci_dev *pdev)
>>>          ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
>>>          msix->nr_entries = msix_table_size(ctrl);
>>>  
>>> +        /*
>>> +         * Clear both ENABLE and MASKALL, pci_reset_msix_state() relies on this
>>> +         * initial state.
>>> +         */
>>> +        ctrl &= ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
>>> +        pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);
>>
>> Should you make this conditional to them being set in the first place:
>>
>> if ( ctrl & (PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL) )
>> {
>>     ...
>>
>> We should avoid the extra access if possible (specially if it's to
>> write the same value that has been read).
>>
>> I would even move this before the msix_table_size() call, so the
>> handling of ctrl is closer together.
>>
>> Would it also be worth to print a debug message that the initial
>> device state seems inconsistent?
> 
> That may make sense. XENLOG_WARNING? XENLOG_DEBUG?

Warning I would say, as this isn't liable to repeat frequently for the
same device. And it's helpful to see even in release build runs using
default log levels.

Jan

