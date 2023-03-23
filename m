Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B66C6141
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 09:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513679.795044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfFuC-0004Vf-R8; Thu, 23 Mar 2023 08:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513679.795044; Thu, 23 Mar 2023 08:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfFuC-0004Tn-OA; Thu, 23 Mar 2023 08:02:40 +0000
Received: by outflank-mailman (input) for mailman id 513679;
 Thu, 23 Mar 2023 08:02:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfFuB-0004Th-Fg
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 08:02:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1307859e-c951-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 09:02:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8983.eurprd04.prod.outlook.com (2603:10a6:10:2e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 08:02:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 08:02:33 +0000
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
X-Inumbo-ID: 1307859e-c951-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2+U80Pdbh85iNRw9nA98cmjqIotZkfaqj//3dmkBzIdkxteXUKGrh0YqHhHv0FfXE6P7jP2QNB7KJsNKqFD6FOncYgRN7jtNaQnSDSD14NlqSIvpFz2PPHmdw0a2d+3lzxR6QdIIPECyq/mwvx5B8RR3EuTqOWRJs1OW48HolX1URpcjOd/AJvGM81/IRW1xz2UJfTPZ6WTUMiVUHR/SuIeZfpIH/Ek+rugeVZ9sYp4Hn9MMMYSPIzuNR12Y7e5GfSEh+Z30ppXnZpHtixWJDTUTSOOGR+IezKQwfHU6bdokZpvmGtiZkVdSKb8rllHiD7d7xZ0C2v29ffsXG7N0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDywmu4KyZ5CQCAkAEMUd4RBSCeIFs8zOqm2OkwxjAU=;
 b=GFceYWRsAb82PbaVtolDAzZubUJPpzyyyt5il42hViEKqItFMI3LqzSa/uY8sAtkEeMeNW/fEqS7XKhXh8kZoKbyoqe2N5cRQ99hf4DjtYGikbmYK0bgg5Ww+Cp8LA1ygYH08vBQJSLkuhebXPOpJG5poNu1VYJidJTKQHa8kts3ifyP6lo4pT2DawbwtmzA4enCljrUiwrQmRHmynznVeiyIRPDq0iUC27HtdQMxcnBkSA9HW8zk4daXdt5FHLuqb2bAKhD7NDcyUS7Lh0/QTyNr27q23xq4ZpeMY+soUSX+Zt2QWWWWO2iX7m4iGwo+Igx0znWGAQkd8+TKK1SYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDywmu4KyZ5CQCAkAEMUd4RBSCeIFs8zOqm2OkwxjAU=;
 b=4mpxk5xZjHI80FnM68U10vf0E1ISj7/GVBsixbk/uQELSC7qHwis7ivzddbhX9EEbZtPbzg/l4jHu04/oG13ZWdUJD2rnspsTbCfM6rnFtnrhPnfucVQKDerq9cV4xm9oeti6htsk39dN+/1MzYreCK1qGEQ25FbBxJ4O6QNo13VUdQK7otDITvDfJ7VEdiiW43Qf5iHmlabqZFUUY9PsbJuLHWZ3SHE5ZLycgaOF5S50c1iiZ7fJuHpFbhWmIr+cXTsTB806xlO7I0EiQ/LOTj2+7oDDYWDSLdHy41/UdiwasL2i/G/thvCn0H0DRt2/BuHlpYc/1mAmT1jM33VkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d526b87a-374a-8d78-f66f-cf71537790af@suse.com>
Date: Thu, 23 Mar 2023 09:02:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230322143001.66335-1-roger.pau@citrix.com>
 <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
 <ZBs1c7ILtkRQOzki@Air-de-Roger> <ZBs2BKAfoRap1CjC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBs2BKAfoRap1CjC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7f16e4-bc7e-4320-b3b5-08db2b74f545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oqnHt9P5Q9kgbcVhgJxFJBy7d/rAqrTCP7zCS+R1caSs3zU8mNJYR4wl0JaipNASpo+YP4E4p28AY/UbJB/fAvoEnT9zUAIedK+sA8nqHVBkzOOap8WurrxFsgb92afAj/sZSunv7J/7JJ4UM26J3ojWc/s2yAiTWawvlfbJX4fGlc75VyL3mFaRjAocnOyJ37pgV3v2cchiHR+VaeklrkSeJ8eWsEEkzzeXnb2uSPnEXjsrBh62ySl+r5QW7DM/tUQOf++z55OYdjXnRB85M/URKtPhJ2F2IpCXLLI0wcdJ0N3GE6KB3DBwR3JKePNiuNrkQbH/neoZvowuM3/AmCdN6bE19NghsZOvrseZatuV1Bf54ROVaqniqSQP5uSHCBKAZsB7KGFhFkScqgJDRCmwsf3d4+LfI9ChwvIA4IP6bkt57SvLx726nWn8i7M2X0kCI3Eyim/sKwp6Pa+cc3YQpxjvPrBDi/vnzuH27YXZZSJFDdfwCIBw3LY1a0jQOB1TlYyF2BBlTJfZDFHpt/MYQpkHD5q1DYLqODzaGzQrzcBoeTGv65XzRWZgy6IFrw4i8K1EXemeSqUuA03rjWpqrKITWFqYxs20bz96WhukeVCeloOk6oBgwaAk8z2cLrLi+DoeX2suxEBr77xYdMWO94tcw1jsu5Jcj292SvHR6IGEsg3WMrkN9fj+Vxe3+AiEYBlr5FO378Z13njlFS2zoR8LmlDuU4SisGR0U/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199018)(2906002)(5660300002)(41300700001)(8936002)(36756003)(86362001)(31696002)(38100700002)(26005)(478600001)(6506007)(6512007)(31686004)(53546011)(6486002)(83380400001)(66556008)(186003)(66476007)(66946007)(2616005)(8676002)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YStjUGkyR3QySzV3UHF6ckxyQXlEd0MzL3VJTHViQmZTb1JWK29LLzBMZnNM?=
 =?utf-8?B?RFVmZnc5OGhpeVpKdFFTa3Y4NzlLNWRRNTh5Vk9mWUI1eGtBQVB3ZzFmOWVW?=
 =?utf-8?B?aUs5WjZ0T05Fa0lVMTIxYTJ5OUhVczg2N3poQW83d3d6dldia0RQeEppaEhn?=
 =?utf-8?B?RVlubHE3amVaUXF6NjA0MFlZQ3pibXR3eUY1T0Y3Z3RGT25qdjVoL253Z3Fs?=
 =?utf-8?B?NitYSHEzN0xtYXpXc1ZPTmNxSW5PdHgwb0pIL1U3K3hEN2tOcG04WFFTdE54?=
 =?utf-8?B?cE5BT3BrRU80d29qTHdXQjV2SUt5TXgzR3VqeVhjUnByOFhlRGROL0VZQ0Zn?=
 =?utf-8?B?RWNPbkVrOXJTRC8xV0swTU5TazU4RS9KRGVVdUZRdUgxcFN6NG05Smp6eXYy?=
 =?utf-8?B?SHkvUGY5Y1NaY1NRcFhXOU1xUnQ3cm5QL0N5OTBuR0tsMnJESnFtN1MzMDgv?=
 =?utf-8?B?djZuZVlQeFF1RG5OYnByNEFEZkV4czNGRmJweUdvN0RKQkdMU0U1NlM4N1gy?=
 =?utf-8?B?b3N1eWNDNHRNTHd2VWhzY0hWSXNzeGlkQWY3K00weGdBSVQ1VGI4Zzd0QVVY?=
 =?utf-8?B?N3FubXNENkxybkdwOTFsUzdLTSs2S0U1MC9oNXVweDduKytsd2FQZWFhdzhQ?=
 =?utf-8?B?dC9kY2JhTyt4b2R5enFldWpwUWNFUE9BVDR6RE9Ra3ZzQTh2MlBoRFJ5ZktK?=
 =?utf-8?B?NFUyTDRwNno3SEtRTEhzVlJvNjd2S1djN0RVWVlGYzU4b0MyaEpOaDU2a3pt?=
 =?utf-8?B?aElTTWdGLzgxWmZKYnhKR2dZOC9iOTNtOUF6QWh2MDloWmNEK0lvRHhHckdy?=
 =?utf-8?B?QlNHcm9UbFVidW1iVWJqYzY3eFZrMzI4ZUlWRmpPQkVGd3NiazB2bENnWWcw?=
 =?utf-8?B?YXFIRTFlMmRjMExOK1lnL0VhZ3VDVHdzcXhpK05YblZRbjljWDdtamY2WWYw?=
 =?utf-8?B?NXZ3SkNKOWFiOGlicU5Wa3V0TUw4L1phT3dyQ09NZTBEcUg3TkNRdmpHd29q?=
 =?utf-8?B?eVlpdTAwWGk1UVY2dzBybldmSm1DM0VvQ2d6QnhNZFhoZEJsZ3ZDK3p3SE9p?=
 =?utf-8?B?YWpONEk3WEJQTCtyci94QXpINU84UlFvZzdsMUFoOGpSSzBhd25iWkxya0Yw?=
 =?utf-8?B?T09NNTJtV0xYSWtudkU2aXhxdVE5Z0JzNUpXOHlJTGdKOEEvUFdQbjJ6Z01S?=
 =?utf-8?B?V2xDUCtSNE9TRDBPQjZnTTBCY0NTWDJUYllZK0gzTnhhSXI3NE5IZzFxRDlh?=
 =?utf-8?B?WkljT3M3d0lrbHd6QU5KL0VNaThWVk12Mk8xdVUwYlNlREFQTU41eTdJWDUz?=
 =?utf-8?B?ZXpDVzVaVUV4NDY4UFpNVHVJNzROTWNoczQzNXlZSnlQbERVNWwrbjRKMUlO?=
 =?utf-8?B?aU91Rm5kZTZUMFZWNlp1THpGWkNZQmtkejZxN2VvU0x0Sm5UekdoUjJuVUpu?=
 =?utf-8?B?Z3lqZDExTkRNVytjWXBkSWx4TUQ1SU1Way9YWjk0dEg1SERPZjRRdlZhU1l6?=
 =?utf-8?B?ZkRUb09aQUFZVE9iRDJUSENlMG53STNyaXVKaVhjZGhrbjhweDhqeFlqb080?=
 =?utf-8?B?OThVRFBaQjZacFRVZGVwdGIxWUYyWjh0TzBGbmNlTHR2SHNkMUxFbmxSOGR6?=
 =?utf-8?B?RXhqd3BreFVaUUh3UThDYWVjNC93U01xM0s5alpNMmg1bTFCOXo0SXNDT1oz?=
 =?utf-8?B?QndSQkxUKzBpSDZ1OFZyek4vMVlXTUticjZjVTc0U2V3UXZ1UkplbVF5UGVy?=
 =?utf-8?B?UGtKek5tSm02ZzJBajlFaUFlYVUzbUFsMnlSMmlBRVlXRDNSMjNXb3djZFhp?=
 =?utf-8?B?MmVZcStMeDYrNFBEVSs4N2hIUEp1bVRMRDZWRE9PZS94RkF2Ymt5R0l5SkVE?=
 =?utf-8?B?b20vdGlLeVBkTC9WN2pqSUtFWU9UQ0dscU9hSjc4L3hzajNSei92RUo5eFB2?=
 =?utf-8?B?d2U1QkVjNTBFWmJYUHFKSUowZzlJMFRZN0g5QnRnamVUVHltY1ppK2Q3R1lY?=
 =?utf-8?B?WHIwcW1PZW9xMk5vMzd0VDJYWFRhblAzODZ2NFp1bjI2MkQ3aDZHNFYvbGFK?=
 =?utf-8?B?VmxpeCtyWndEMXhnQVNvM2gzZ0tkeERIaHlYM2lzSDlya05wcDU2aXNWbFpx?=
 =?utf-8?Q?7Iw1VgQnQ7XymMXNS/TYcgA7n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7f16e4-bc7e-4320-b3b5-08db2b74f545
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 08:02:33.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+pc69a43LxexkBvu47tYbXmGVi5YpkVL5j4IWkmYBnqhc6YQKJ2dsjUkMak6l+SLo8fRBfPVQHEQJzBklhgzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8983

On 22.03.2023 18:08, Roger Pau Monné wrote:
> On Wed, Mar 22, 2023 at 06:05:55PM +0100, Roger Pau Monné wrote:
>> On Wed, Mar 22, 2023 at 04:14:54PM +0100, Jan Beulich wrote:
>>> On 22.03.2023 15:30, Roger Pau Monne wrote:
>>>> Changes since v2:
>>>>  - Slightly adjust VMSIX_ADDR_SAME_PAGE().
>>>>  - Use IS_ALIGNED and unlikely for the non-aligned access checking.
>>>>  - Move the check for the page mapped before the aligned one.
>>>>  - Remove cast of data to uint8_t and instead use a mask in order to
>>>>    avoid undefined behaviour when shifting.
>>>>  - Remove Xen maps of the MSIX related regions when memory decoding
>>>>    for the device is enabled by dom0, in order to purge stale maps.
>>>
>>> I'm glad you thought of this. The new code has issues, though:
>>>
>>>> @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
>>>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>>>>  }
>>>>  
>>>> -static void __iomem *get_pba(struct vpci *vpci)
>>>> +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
>>>>  {
>>>>      struct vpci_msix *msix = vpci->msix;
>>>>      /*
>>>> -     * PBA will only be unmapped when the device is deassigned, so access it
>>>> -     * without holding the vpci lock.
>>>> +     * Regions will only be unmapped when the device is deassigned, so access
>>>> +     * them without holding the vpci lock.
>>>
>>> The first part of the sentence is now stale, and the second part is in
>>> conflict ...
>>>
>>>> @@ -482,6 +641,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>>>          }
>>>>      }
>>>>  
>>>> +    if ( is_hardware_domain(d) )
>>>> +    {
>>>> +        unsigned int i;
>>>> +
>>>> +        /*
>>>> +         * For the hardware domain only remove any hypervisor mappings of the
>>>> +         * MSIX or PBA related areas, as dom0 is capable of moving the position
>>>> +         * of the BARs in the host address space.
>>>> +         *
>>>> +         * We rely on being called with the vPCI lock held in order to not race
>>>> +         * with get_table().
>>>
>>> ... with what you say (and utilize) here. Furthermore this comment also wants
>>> clarifying that apply_map() -> modify_decoding() not (afaics) holding the lock
>>> when calling here is not a problem, as no mapping can exist yet that may need
>>> tearing down. (I first wondered whether you wouldn't want to assert that the
>>> lock is being held. You actually could, but only after finding a non-NULL
>>> table entry.)
>>
>> Oh, yes, sorry, I should update those comments.  vpci_make_msix_hole()
>> gets called before bars[].enabled gets set, so there should be no
>> users of the mappings at that time because we don't handle accesses
>> when the BAR is not mapped.
>>
>> Not sure whether we should consider an access from when the BAR was
>> actually enabled by a different thread could still continue while on
>> another thread the BAR has been disabled and enabled again (and thus
>> the mapping removed).  It's a theoretical race, so I guess I will look
>> into making sure we cannot hit it.
> 
> Hm, maybe it doesn't matter much because such kind of trace could only
> be triggered by the hardware domain anyway, and it has plenty of other
> ways to mess with Xen.

Preferably we should get things to use proper locking. If that turns out
too hard, properly justified such an exception for Dom0 might be
acceptable.

Jan

