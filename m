Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67010747FAD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 10:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558834.873267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGxsW-0002EW-JQ; Wed, 05 Jul 2023 08:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558834.873267; Wed, 05 Jul 2023 08:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGxsW-0002CI-GV; Wed, 05 Jul 2023 08:28:48 +0000
Received: by outflank-mailman (input) for mailman id 558834;
 Wed, 05 Jul 2023 08:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGxsV-0002CC-IU
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 08:28:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4e2aaa1-1b0d-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 10:28:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9650.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 08:28:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 08:28:43 +0000
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
X-Inumbo-ID: f4e2aaa1-1b0d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvF3cSBlaFVVxPuyTq6ZVQe4GaJReC1PbYPnw5x70HW0Ah9/yatQtTYhmn5cMuh6htvh8LoCIoqCgAuOdthsuyjUe6gRjE++HKfwisnwjo/uY+a5GuEUs5nsdWNqhyQjTYppX0j6jUAogpMFdT9+hk7/ajl/giHqS49zC4OUcxs2Ye1Qfb5FWjW3RXc/5NpbPqbb/z5AH8OE4RXEWEw7+RAnhinOQCdbJ1dqcdMMyKs86lsByjMQOHIjZus8z0wjPn1lOO/dDs2BozZxisHw6KKLjFaXx/noaLrXQqiNAIYf0s0AnUCgZkXe6NLOiL2yUU0/XmeewYq0eb62Ebr+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSCsdsKH5vjcnrekux052uZhke+6/pmXzEvD35uhqW4=;
 b=EhTYcsa1aWOj7K6/qxLyG2asF+8BakpY/JAZ/hPFMKCZIk3XBPaNR3S6CpN6rzd28WHbrZNNZ7nGg60wBKdLDd6dmnTzkkiIbKN+4pp6+/5G6sWWIFDpRtrXw8KDoopPsYfOVInCAGuUzv31b5jqtcw1bhN4eKnHSNPtG288qfIANr2M40ShVMsS0b0okqHuxFLwFLaD4hGTaBQ8dqrwus+xonCsOxG895Gg0NygX03jFZwtVoIGeW+u0tTNO62M/Ha4qPW72eqWYUCQ9raQBL5LFCo8P4SbRkVnE9gxIiWyhpdsjp9xKyavHYK1zPtcdobt9dXipJXcufVkfbVDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSCsdsKH5vjcnrekux052uZhke+6/pmXzEvD35uhqW4=;
 b=Wq4gPKjM6vmURkjBsYU0MkXYjafsBngpOSHHH6pMPLZpkDC2ttPnu6rHUGHzKT+YdwqWRBPE+ouP6cYJb434L4LE8dnybvsHL0GIwyOl9kSuXq3xx/R0F7EVhmrzxFswi4S4uNqZj89k94MrstO2WgR+l5tNOtp58rENE7iD+yKybUke4TLPDt0RsoaJGo5VLbRFzuwYYaflMyFX3LIxyDMjX/8X54T3PCfv5vnqf9EdOl/ku2ldA1VrpSWPV+uIGDvtHoco0eT6cc1fP1EsOJxfvsyEFywse378tl4A2BPT0dw1hFrYg59a89jgTCV0h3V+qIuQ+ImKZm9KVEmMxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00574cbc-c037-8df8-bd81-cb26382f9253@suse.com>
Date: Wed, 5 Jul 2023 10:28:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <1f9909dacfd7822a1c7d30ba03bbec93fa2ff6fd.1683321183.git-series.marmarek@invisiblethingslab.com>
 <f168a753-45d2-7d66-8ec7-ad06e6cd42eb@suse.com> <ZJ9ZYjWoiPU7GFuV@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZJ9ZYjWoiPU7GFuV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d38437-6882-49db-19f6-08db7d31d7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8OI95TvCjF0vCmuZgDKAxKTezxbyBtCIShFAC2mP8ds4DiesKBbXOWeNW8dK7N2ja3S1eELT8EXMnNzF0aGoARgbljcr8c+T8TKazTJnNTiPv7uwOwN0sga+h4i5HLSOte7AykJrQt8svHiPMmfXCO42yqFb8EclVn+XY8f3t9hl+TRZn7d2zkaJ05zYjyFYSMDW7uPseUTNqVyl2AsrPbC4pQxot/t1DUx61X121FrGRPUryfv8IO8bPpVQScx8DO+PyXJazup402qzcF+NmInxihLapROBYTbEhqjLuENaFTDvnZc4iMoX1+iZ/JLZw6dehZldcsmfbY/ekY47TzvnIgjFxtM55NV3qxpxHl7jJp4SEJdp8cNg5v7MOJwhb7byIagOAXVekxIBhetTIREMfgSYCIaGkRwlnVDjw9i7y/CA1e85dAbY2u2ySbrddmRvnEcHgKANivCYiPQOZFLEc8WLnCscoRLtes9LtS9AAg6m9irzijjyYlDjuFS2nc9T+TEpJWsHCcm0vwa2rUDhch7z7vsRUyG+RPmxge3xEE6ukFDVUfxLDtQ9yWkhJgvkPDBUhJ7j1sQIbuxma0DC6XZEnV6A3V1YVinAQSTVosF33jzjVtGfYivMjaPjxWQKNUz7y89VqBZV1xCjaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(2906002)(66574015)(83380400001)(31686004)(2616005)(66476007)(66556008)(66946007)(6916009)(4326008)(38100700002)(86362001)(186003)(478600001)(54906003)(6506007)(26005)(53546011)(6486002)(31696002)(36756003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THhMQ2IzdlgyeFgzbEtYS0VlSSt5UlQrKzlaV2xDNWVyQlNxQm1YamtNaFJo?=
 =?utf-8?B?VlBSSHBQRW1HTGlXRnVCOHpNdEQ4Y2g5WkR5MHJkd2JrVjBQVHo5TGpETFU4?=
 =?utf-8?B?eXJ0anhDUnRQaEx3UFordFFnNlkvUnVFbUwvTXlvT1V0YUphS1B2ZWJzKzZl?=
 =?utf-8?B?dWx5cW5IMFd3dmJhaENIU1ZSenFDWm9kZjlrQnpULzJ0elp0eW0rRUlLZ2FS?=
 =?utf-8?B?RHJ0bis3cFp4cHc2d0F1ZmQvczNLb3o4QldHZXgya0pFQ1FUV0hTRThMK21m?=
 =?utf-8?B?QzhGUE1iZE5Gd1NtSlB5OHZRVGZ1ci9WWktwUVFwdXJBbFdSSUEwaUdNN1Fr?=
 =?utf-8?B?elA1dHNLL1lHQlRYZ25XM1AxYXBGOEZiREhIOFJGZm9BcHZrb01KNk9FSHVF?=
 =?utf-8?B?MFQ2Rk5WSUpsSzdWQi81NVdKS1RjVElFWHovSldmSk1MS2FOK003WWZYU3Vy?=
 =?utf-8?B?cEkzVWFjZVBZdkc3eG5mdWpKOXNTZVA5WHltcGF4ZmtvVmVBQnR3N3JsTks3?=
 =?utf-8?B?bUpqbitIeEx5UXBSOTQzMTVaT3FiK1RETGtPS1lDR2FoU1U3RW5SOGd0U0F6?=
 =?utf-8?B?VDE3clorY0YrL2hxWG96QTFWWElQVTZiTG82M2ZHbWhERHQvMkF2ZHVWR3RN?=
 =?utf-8?B?Qjh0eTB6QTFoSEVuTUYwNHl1SDN3enM4OGRyclpKblZYczY1KzMybHNrMzJF?=
 =?utf-8?B?b05GOThwN25Na2dDaEJLY2Jkem9HbE1VNHJDOFFKTUtONFBET0JzUE1INUlH?=
 =?utf-8?B?dmN6UldmZ1JnSEMrdnB1VXk2VmxBOHpockcvWjlBTzhEcUFKd1Q1T28zS3Ro?=
 =?utf-8?B?QUs2ZEN3Vkp0N2V1NEdBNFJBQUtOTnRpb3R0Y1lGbXR4T1NjcHpWVU1tN1ZF?=
 =?utf-8?B?eUZRSkhYU0NqL1BWcENmUWVQNlZGb0FIRHR3TG93c0FuYkxUd0VoSldIWmNY?=
 =?utf-8?B?aGtoUEFJSXQ2RmxpaFpLZHdacytucWNFbHFFZWFuTVVUeFVWbWYyUUp6a0tS?=
 =?utf-8?B?QzZleDhSVUk5cis2TlZSZkpYSm9iUDZ0bGlIWWpXaTFRS1h1U3BQTzFNeHhF?=
 =?utf-8?B?ZFhVb212anhJYllSaFN3MDN6RW5HcTdFZmFueHBMeUZqYjdlUHR4YkVuOU9v?=
 =?utf-8?B?SVZzMkNvRklkazNBeVNCT29yQkM0M0dnQUJjSDI5UlJZVnBRQ01RUFBRSXlm?=
 =?utf-8?B?bUNKbU0wT1IydHMwdWREWFRtTDI0SWhLSVFXTFlSaCtHR1VqNzRrYlBTL0c4?=
 =?utf-8?B?Uzg3NjhxMXJwbDNvc21uMmNxSFRKcU5xQ3MrWnllSWpUc0thSWlkaUQ0NXB5?=
 =?utf-8?B?SlFWOCsrazF5SDlpQ3hQNGpJdXlzNUY3eENsa0wzTGNZeEhHaHZCcWh1Q3lG?=
 =?utf-8?B?cEJRdXVpdlh6SVJJV2xzM2tQeXB1NVpRYm5rKzdGSk1EM3ZHOG8wUUdBWGhX?=
 =?utf-8?B?SWE4eUs1UktDeUVBT2NtZWpWSWZ0bkN1ZGdNL0tiUG1iai90bWlZc3VNbVlp?=
 =?utf-8?B?OWNBV3BYNXBsM0UydUQ1WVI2bDk4YVZmSmtkeG9DS1JmLytMTXZVUTlKZVB5?=
 =?utf-8?B?QnVqNUc5c2IxdEVTL2RCSU90ZExJSkFqNENHZ0pZK2dBUEJzbXhUNXROQW91?=
 =?utf-8?B?dGU4NjhyTmo0ZjBYQ2MwQlJxa213TExIbDB0V2RVbnVycjZEd3hXZ2x1aUpO?=
 =?utf-8?B?R3JBWmZUeEJUakJYQ3ozdHpmRkdXNTY2M0VoVjFPK1AzV1oxSFVHRlMrRmRW?=
 =?utf-8?B?N1c5VURpeFJTeU5jcHRJMHNYRjJUeUdTNWpiUmUybjZ4UUFHT2FLSnpVUXBq?=
 =?utf-8?B?R0xTM2g3bmwrK1gxU0JLNXVFdTV3NTlQNjFNODZDdnVCTFJFVkNRTzNGbWZF?=
 =?utf-8?B?LzA2dXc3RGVnQ2NCaFJ3b1YvZE5PRGJJR1YrMG0rWGxQVStaY1Z0VWwyMWd4?=
 =?utf-8?B?NEFXT292K3hUT0hsNzdQRU1uYXlmMTJkSXFaV2hnR21MUFdkUXhSTWVBNlc3?=
 =?utf-8?B?THF5emxtNHJMSm53eVd1dzhSbUtWaWloQ3Y5NGQ5dGpGSDJOUVpMZDBqQWYr?=
 =?utf-8?B?WitOMzJSSkppWnA4djhobmEwRENaM01RM3dqNlR4Y3pNeGc5YlBUd2VIeGlZ?=
 =?utf-8?Q?z/F0SyXdLRvJN6xVITRMHxTaK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d38437-6882-49db-19f6-08db7d31d7f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:28:43.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfeRDu/e9oBgGKpwExSrKip4v+rFJBX4oTnzP5tljck+CH0pTyg/2xFEEWD2lQ8nDdsHMNT/dxHv98BigGuMtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9650

On 01.07.2023 00:38, Marek Marczykowski-Górecki wrote:
> On Tue, May 30, 2023 at 02:04:26PM +0200, Jan Beulich wrote:
>> On 05.05.2023 23:25, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/char/xhci-dbc.c
>>> +++ b/xen/drivers/char/xhci-dbc.c
>>> @@ -1221,14 +1221,12 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>>>       * Linux's XHCI driver (as of 5.18) works without writting to the whole
>>>       * page, so keep it simple.
>>>       */
>>> -    if ( rangeset_add_range(mmio_ro_ranges,
>>> -                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
>>> -                         uart->dbc.xhc_dbc_offset),
>>> -                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
>>> -                       uart->dbc.xhc_dbc_offset +
>>> -                sizeof(*uart->dbc.dbc_reg)) - 1) )
>>> -        printk(XENLOG_INFO
>>> -               "Error while adding MMIO range of device to mmio_ro_ranges\n");
>>> +    if ( subpage_mmio_ro_add(
>>> +            (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
>>> +             uart->dbc.xhc_dbc_offset,
>>> +            sizeof(*uart->dbc.dbc_reg)) )
>>> +        printk(XENLOG_WARNING
>>> +               "Error while marking MMIO range of XHCI console as R/O\n");
>>
>> So how about falling back to just rangeset_add_range(mmio_ro_ranges, ...)
>> in this failure case? (I did mention an alternative to doing it here in
>> the comments on patch 1.)
> 
> Or fallback to XHCI_SHARE_NONE (IOW, pci_ro_device()).
> 
>> Also, doesn't the comment ahead of the construct become stale?
> 
> Indeed.
> 
>> Finally I think indentation of the function call arguments is off by one.
> 
> How is it supposed to be? Currently it's 8 spaces over the "if", should
> it be 4 spaces over the function name?

Yes. All our indentation is using a granularity of 4 spaces, of course 
taking into account aligning with respective items on earlier lines
(the length of which may not be a multiple of 4). It is always the
innermost construct relative to which the new indentation level is
determined.

Jan

