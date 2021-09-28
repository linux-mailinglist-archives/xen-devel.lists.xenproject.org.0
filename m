Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF141AA3A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197748.350974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV81R-00036j-Jp; Tue, 28 Sep 2021 07:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197748.350974; Tue, 28 Sep 2021 07:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV81R-00034t-GT; Tue, 28 Sep 2021 07:59:29 +0000
Received: by outflank-mailman (input) for mailman id 197748;
 Tue, 28 Sep 2021 07:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV81P-00034n-QC
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:59:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8568c98-62e2-4050-ba52-fc1b1bf3eb38;
 Tue, 28 Sep 2021 07:59:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-GjAfqdNWNAW5w_jW2ogtog-1; Tue, 28 Sep 2021 09:59:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Tue, 28 Sep
 2021 07:59:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 07:59:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Tue, 28 Sep 2021 07:59:20 +0000
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
X-Inumbo-ID: b8568c98-62e2-4050-ba52-fc1b1bf3eb38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632815965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++SQqnMhac3su4SgIB0DoC0eO8NuHYjHSgc9CfMdRLU=;
	b=HTyBSWIB0gqpsu+kQCYgMPQvMq/HJKOlWGL0yX6IZ9o45ok/QtCOpapMuFWckioXL/p/ud
	57mc1G6e6YfYvHDrZeRwlG2gp58EzSTAnHNvmPDDNlN818toODT8WppHVmloTNoe/q7KBW
	QyzuKlKRPklRXKT9BxvqtQIXJFkCnUo=
X-MC-Unique: GjAfqdNWNAW5w_jW2ogtog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIQv51a+MyU1V/GcAIrGCRmPO8hixr+Qxnzyq8qv3uSmtghSddfxcIJM7Sb8wxxW2A/K8zuFEf6V0GnMQy+JxE11I/2ORRt5sENMfZ4t2otkSKmFFkYXQtekK8AqVT2dP6+/EWXwXcgw2fzAfsDIuWvc3TYG1aJNHD7Ohj19QIdzpR6DwHqfeSzQK7qKBx9hHf1vP8hpqIiHZRjP/FLvosRUUaCBoTFKb29qO/Cj0Vhy4MBZ8FEHAdLAece0rrNOTyLgCbHyD7OrlXflXWde2OiEcR1jKrO3+ECM1hTZ/6zAemXXeZUVIlpmTH3SSX55MtCu8DHm78BzY6pMZY7XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=++SQqnMhac3su4SgIB0DoC0eO8NuHYjHSgc9CfMdRLU=;
 b=d0X+AFxa8wVuCeyqc+kPIEBESpydDJabgkDtJrOAq1nCgyk9cIZMHNXOd7WlYovqEHlzpgm8ej9xDV9VfthDAQPaTzxO0fJARjWYr4zLRl8m4J+r8Um6sNlNvWEIEFId1Zdc7sKxj22uCQh++zEpvPMJdaTGe5eCaeUjVbMMoiRLlOtZwQ5k3CSh/2K5AixhhjyarrMfjDrXJSEyQahdeu06OF7Lv9PrgY8dxSwftt7Yl/gGYaJwvTXljUk3ETp8O42BpudE7zfXhDUAVkpwL+7MsN9SkHw7XzEPHlztqcQJwpdPgVKj0zG/BTjMtqs1SHwsxCUSZcc/a9kEBFpilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Michal Orzel <michal.orzel@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
Date: Tue, 28 Sep 2021 09:59:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4466b74-829a-47db-c1e9-08d98255e185
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260542622967F47690AA2C66B3A89@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7afz0Xca7mKgVtGmccTYXLifdOpCb5j+/o5OtB9mAMFz/TWThMepCdVJcu7W/tlA/nVMIG/1D3QKfCPLUBTLyswFvQBiF0cM5hswoaeHtYDoid+1wKZBFQUd7zVBZAe6/Dj+plvJu9wie1DEyazBLjpfpKG4+PrPp9MSvlt7nM0c1Je11NG1aQV/TejBmJIq2Cg+GWZ+um5OZq0wYI+Eamm9+Swzr9/xMi4utMFG0n/SiMidhoj1iptrdl2C6v/Hm5viTs6rPlypBnE3WTXc483zMi6n766zgMbfRTyV28Yta3KCxzX70k/IZTPU7VTfr0cDsjfD9ZFrDVXzyR6D21YH6T5pwLWLwrDlQYZlqtH+wLMnMInI8X7qsUA25W+UR6fK1Cdjb0Yp4jbE0+OUGPGkzy3BlO8X4DhqEnG6GabCu+mbizorkNXLlRTsH9e35DNyYKlfHjgBRtnEl6Mwa3I8I3wQZwdBKdMV+tGz3A6HaIAJgAK+uJrVWrsHxRCJkYK+IzDfYbTY3q35OMl/wRii50K6Aq6V+OMFPsV+CTuFkFNU/qInagw4CMq8CpusvwHmVOf6WmjlvuAFhaLJOrh5aXilVdh9lavCvUkcwxGL/GxQpFBOnG7Ha85L8MvvZ71fGFs1weamEeD36PRyVIAUInwSd7MBfcLSyHw0snKRaSL4h19BZIM8cEcmiSBz/rkrwlmA2s9eD7pERCrv+g4P67qs0ioIvPqhEsSizGjzMzUAqo/IrqhCBj6bgZB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(36756003)(7416002)(31686004)(16576012)(316002)(110136005)(86362001)(83380400001)(31696002)(4326008)(508600001)(2906002)(38100700002)(6486002)(66946007)(2616005)(8676002)(53546011)(186003)(5660300002)(66476007)(956004)(66556008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXBhUlM2QUdtQjBueGJTSE5WTWF1Rk5ad0xPb3ZqdmlHczByajBNcWt1bklW?=
 =?utf-8?B?T1B3cHBOZkx1UllUU21ta2MrREIxeG1DY1JCUmpsTHhCbHB6M2tseVRjMURU?=
 =?utf-8?B?Wm5MV1U3WXNBeUE4cFVvZTRaajBuaUpRbWVGNERWUFZTcSttSDlFRWlXRHlX?=
 =?utf-8?B?THlIdFdrQXFjWVllUjNNbXNLS09acXBsRkpXZW16MUx0RW5jbmtFNGhoS1Rh?=
 =?utf-8?B?aGp4SHVQYzBjTlowNExKdUxQWXMvYXdLVWxhNU9WQ1dwM2JGWnVVMzluWkNQ?=
 =?utf-8?B?MTgyRWNuTkVtSkxqcUZTZmlRWWlYOFQ4WTBEVXd3ZHh6N2ZhaVlBQXhrWG01?=
 =?utf-8?B?Qm81Z0J2SHdWUCtKTTNBckUvcitnZkpWaFNQT211a01pZWlhMDcwL2ZYYlN4?=
 =?utf-8?B?a2JQay92YzJwZ2UvYTVJT3FOZU5Tdlg4elNZYUp4YWgyOFQ5MjEvZDY3bEpy?=
 =?utf-8?B?S0FXRnoxMEJKOS9ybm11VCtER3VQdnBHR1p2U0Y4WVV0UHZHZ1o5enVWeHhv?=
 =?utf-8?B?MHVtbVBXU0ZjcDltRDJyd2NQaUxxdXVJcFJ0TjJkb2k2YjhTME1ib2ZGNkNM?=
 =?utf-8?B?TmUxM3JaTUxobmx6QWRsWHhXSW94SGtjUFErRmVITm5QdkNwNHRkeDNnS2xY?=
 =?utf-8?B?N0ZORWlFbmxTMVdzd1hka1FGcWU5M2dYOGk0aEFwb1h1cmhaUnNSOXBNcmxZ?=
 =?utf-8?B?dnhPMk9lRE1GOGt1SHZVb3J1dnJPOFNxYjJ6S1Y1blc5a0VYcnU1Z3M5M0Fu?=
 =?utf-8?B?c1AzT0R1SFgzYnM4YWVaNHlBeStnR3BSUW4rVjM2N2NsOExkUldlUzRhR2VS?=
 =?utf-8?B?cGMvTlJYeGRCRW0rUjV0Z1dLWXlVMS9MTExBNlBCRW5EakoyeG5VVkFPTk1G?=
 =?utf-8?B?a1RUR0RIWWtzajNKNlRoZDFkMVpMU2xaRDdzclNXMXJNOTluM2N2a0pzcXhK?=
 =?utf-8?B?R2pWUFNFTEJkL1Qyd240dU0zcUhoT0d2WVEwRWhyMTVrYWljK0pKVXd5Q3hl?=
 =?utf-8?B?ZklwYk1UL3VwZ2JNM29MWVc1NjRhaEk0VzN5UTFTOXg5aUl0MXNoaEt2cE1v?=
 =?utf-8?B?czFDeEhYa2U1WXRaR05TVDUwOWxweXNoUjZUTUp4TXgwdDgyVTBXRWtpdjJ2?=
 =?utf-8?B?bnE5cHpBcGo2bzFJTFBlazN4eDc0WGVMUk5CWHloUEJKT1NTQzVpc2hYUTRr?=
 =?utf-8?B?TVliYmhBZGxHSEhNUk5ibU5sVHhTZ3BxeXl0VTYvUm1PUHBWTmhObHdqcUd2?=
 =?utf-8?B?K0h1Mm5rU1pMejVwRmFDNXZQOTZuclN4REMwY01GaldQaHRBOG9ZZnVyMVgr?=
 =?utf-8?B?SHJaY1N5QXNZb2lSK25jeW5IQzFyLzdkQ0tyZ1NFWlFUeUk2TlZHM3JTRjZO?=
 =?utf-8?B?WWRGR3JsMWlsUzM4a2pOQTRyUHlKVFFWcCtTMjVLZy93b3hlNnRzV1NDT2tJ?=
 =?utf-8?B?eEd6KzhIUWdGSXR3cDMyRDRTdHZGYjZJV2J1TTM2YTgrUGY4MERXQzd4em1I?=
 =?utf-8?B?TWtHcjVjQWdoTXVVQUxtMk00MWU2azBmMFE5Q0hEaUcxYkdES1ZPeVJ6L2Jj?=
 =?utf-8?B?OUsvd3l4cTc1cldadFNFWEFWaEdCbkQvNGRrcWdOYmVMWGh3UnYrcVFKWWow?=
 =?utf-8?B?S0N1djJTZFExUDN5cTN6V1BtU2hsck9xVVJSZDZBdk1IVXcrOHlXanBNdTho?=
 =?utf-8?B?Sk1rVHdtYzgxS1oySnhaaDMzSWU2c2hvb0JCMkdXUWo3UFBjRzRIc1hWYnN4?=
 =?utf-8?Q?JaJ46MTJiyKJz4v4P3ism6AZz6EXUj377MmeBta?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4466b74-829a-47db-c1e9-08d98255e185
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 07:59:21.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGKmgIW6a5gDMObsxS810w3OcohyL0McAnllWRvE2PEa+br96GVpnrPRQV9qjQpP/1M9ADFoXbjR8E/GzqsLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 28.09.2021 09:48, Michal Orzel wrote:
> On 23.09.2021 14:55, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -833,6 +833,63 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>      return ret;
>>  }
>>  
>> +static struct vpci_dev *pci_find_virtual_device(const struct domain *d,
>> +                                                const struct pci_dev *pdev)
>> +{
>> +    struct vpci_dev *vdev;
>> +
>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>> +        if ( vdev->pdev == pdev )
>> +            return vdev;
>> +    return NULL;
>> +}
>> +
>> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev)
>> +{
>> +    struct vpci_dev *vdev;
>> +
>> +    ASSERT(!pci_find_virtual_device(d, pdev));
>> +
>> +    /* Each PCI bus supports 32 devices/slots at max. */
>> +    if ( d->vpci_dev_next > 31 )
>> +        return -ENOSPC;
>> +
>> +    vdev = xzalloc(struct vpci_dev);
>> +    if ( !vdev )
>> +        return -ENOMEM;
>> +
>> +    /* We emulate a single host bridge for the guest, so segment is always 0. */
>> +    *(u16*) &vdev->seg = 0;
> Empty line hear would improve readability due to the asterisks being so close to each other.
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
>> +    /*
>> +     * The bus number is set to 0, so virtual devices are seen
>> +     * as embedded endpoints behind the root complex.
>> +     */
>> +    *((u8*) &vdev->bus) = 0;
>> +    *((u8*) &vdev->devfn) = PCI_DEVFN(d->vpci_dev_next++, 0);

All of these casts are (a) malformed and (b) unnecessary in the first
place, afaics at least.

Jan


