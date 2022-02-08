Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BD4AD505
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267863.461623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMs9-0007HM-9K; Tue, 08 Feb 2022 09:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267863.461623; Tue, 08 Feb 2022 09:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMs9-0007Ex-6B; Tue, 08 Feb 2022 09:33:17 +0000
Received: by outflank-mailman (input) for mailman id 267863;
 Tue, 08 Feb 2022 09:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHMs7-0007Er-LD
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:33:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 236cf222-88c2-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:33:14 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-_ijVTOsJNry1IYSqVpu3pw-1; Tue, 08 Feb 2022 10:33:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:33:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:33:10 +0000
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
X-Inumbo-ID: 236cf222-88c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644312794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8NtR+x77gWihrNvsqTAgKCPMXj8venlJinlwAnEn3+k=;
	b=Ra7L9HYan+AzkiCYc76I/apJFSGkBLdyLdnslRoztG7Z7pJbVdo5sHPKwXTGQPbce3qFZ4
	KfxFOXUClnrRHhQqaYcupeLJeTMgFM3rg9A22d3nKQRQe1BkNYuSlWtSysLficMOkxiJJV
	wlSUsVHiu/P4KHpyc8enIISNdD8a+ZU=
X-MC-Unique: _ijVTOsJNry1IYSqVpu3pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0JlJIJC/Z+FAPXRKP0fN8XZD3Vnbrm015MsoWmidh1V9nJCjU74DQUvk0oZ9oYiadOfErbdT/hGbdKpYhfUX1tKE/bMga7M+FUNPCajypb6sFk2pXOYbK1aPMpRc6PePDZXEfcBVLjHL6ZX3w7U0A9ew/hkVWmWyGjaAo4hHWxrtJgt2eekz/6n9FMS5NJjMoq2CUcbHHUoCu98nK7ZX+nCPnUvMvue80Z2GLzqLZ4w/bqF8Hkg/5TBjwuj6yZ+vBqIJ+XChGLdPbbAyxoHg1D92HBMcgKLrjW3iJZQigDhCACajVE+mabRHhgKFD36NVkqclztD3dxoCj8ceNEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NtR+x77gWihrNvsqTAgKCPMXj8venlJinlwAnEn3+k=;
 b=aRrda16VqPRaRdBrmQ057gdsk713fQC4Dp7PgtFe6RUd4q/wAMtSMqpwYHdAhb2FsHHe+vTAdFSQZRZwC6m9HW//va6b4KYNWLpsaR0vb7F4uC7WxBIDYwr0TKqrExQcJ8+XiG/XsppFcccgFvQizS6WPhtukBW1YrmIGQy3/G4TV14UDHJtVhcFCmcCPMAjaAYhK2mSUrIPZ9jOsCs7I9tLcrrfZd3rJCz2g25Gn3BL1TlYvIY/4ihiW6Nzxx5cZxSdFTh27PMCwlwLmsUxXIACHZuZlWHFGL/vw+2HO0I6eBF8ZEvesZxB8DSzOotWIuy7bWwWAwLiR+vbXgLPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
Date: Tue, 8 Feb 2022 10:33:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc01db8-1a3e-4120-8d44-08d9eae6057c
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB478933E3776F6E8276167623B32D9@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KeaRvMzYSqKB0fCWp2Gh8/N5pVFbwZCYKuGGbNQccoMAePG7juJt7sxfun1AD1dIUXNE/7avDtEXmdqZ1HhW0H3J+wHutOR93xhwYvsVmTWpTVbA8Codhzmp6IfjjLGrEj+7wQ1Ji9EFWphN/3mNPSFhcQH1MUcu6nsJTr5mxXz+O5TP+rbohI0phre1VsbsqU/lk5IpGeKdYrFUkLXznBy029K60fXGPN4YiHgzVRh2PBDX0YA5pokZULzqRa4hmYt1oZA4wdg2/GNCN0Uy+xBGBYPAczWbDeaM4J2UJvaGPPCIckqWPR7nTT8m7ALykWleP8otuL/GYJ49gcdUttBZvo6Pw6jROz8EV40OuHdmyhvIOVe3cDVDT/XhSyjY6XWzmtwSP9Nf11b6A5PcY1p0XfZjpm07VtzGSXF5M+aRlxVYm9+ddcC+mAifpAnMC1qvILq4NxBDwogFA8m7oZ/TWZg258VDSKGbn/rXXvczZSzM3sqQJYxdw6DdFkMQvGoVXiDyOZq6WdbyZNz+ftnyzT0aaFYUjGzE6mdyRh5S40HQgxvOdsRKQ4C/NXYsfHUQGVZflaYOC2fMovz7ctAdqjvrUetbBubNnZL3UeorXmvhDnZLaGt5jVckTXv7vGwvbtQbUM9xTP+imQR9wW/TzNWSZP4SVxhP9+bNEapAMt89EXIi2V2bcl15/VIGY13oIAJGREzDZkOXbm8qD9fUKWJ5nvZn/BnOM1+Q4wI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(26005)(31696002)(186003)(36756003)(4326008)(66476007)(8936002)(8676002)(2616005)(6486002)(508600001)(83380400001)(31686004)(86362001)(53546011)(5660300002)(316002)(54906003)(6506007)(6512007)(7416002)(38100700002)(2906002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3FocCtjWDZLL2I2bEp0V05ubUQ5WFRBTUpBTWJMei9POEtGOXo2OC82TU1Z?=
 =?utf-8?B?SDlyREIwZVJ3bkhCVzRRWGxYWHpjeFZYYjNFeWp2Wk9lUWt0VFNXZDNEQ3Np?=
 =?utf-8?B?dGNYcHRmcmFpOVluYVBSRjJGZHpvakxhU1YxTlAxQlZ4czFXbkNwT0tTU3ZT?=
 =?utf-8?B?eFpvSG9lRnQyaVdpbkN3Y0gxeGZjY204eTd0Z2F1ZVZEL2JBMG1qY1pESzI1?=
 =?utf-8?B?NHZGL01qSmtoTy8zTTBnd3VlcS9yRGlIemk3Ty9YVzhPYjZsVFIxNk5VUk1L?=
 =?utf-8?B?ZmZJbFVJR0RqRDhnaXc0bE50ZENCajJETkx1ZEdTUkZycER4MjR5ZndUamo5?=
 =?utf-8?B?MEt0QlQ0MlhUdWozejM2cy9FdXp1UHlZVkFpWEFuMVJZbzQ5dWthZUVoSGJt?=
 =?utf-8?B?SzB0NVB4RFhUaVlXaTZycWRCRDFZanhjaE1ESGhvVEVYbncxWS80cHVLMzcr?=
 =?utf-8?B?QWhGc1ROTHdIOS9LdXpoWWhudFVhZXFhVW9GNmhUbllkRlhLdDVlNVU0YUlp?=
 =?utf-8?B?WWhqcTZsbGFQbmNsUkRYVEhWYnlYbWdoT3hqa1RJS0d4d21oRTdWL0F2blBY?=
 =?utf-8?B?MExyMEdtM2VtV1NEeEtEaW5xV21VSDJSdi8zazJBam5FTXdsbUdkNDJvRmRv?=
 =?utf-8?B?NWc2WW1PZTFUUHAwbFVORkMyN0ZXUWFCMmo2dEZlVitEZnlyWit6WG1oZXpj?=
 =?utf-8?B?bGxFMjNRMDJ3clpLdFA4cjFLT2xWQ0FGamdlZFZQT0FaVzBBNUtRR3BmRkJ5?=
 =?utf-8?B?K2RzenZlMGZ2Z2p2cjhiU1hPci9wMndrRW9rYjZxaEM3b3YzUUVCME9MQmtJ?=
 =?utf-8?B?TGFsWll5dnBpaDVpNklmTGthaW1IWGtkYkQrMEZqbHlSWE5lemlSL3VxbmdP?=
 =?utf-8?B?a0I0U0UwZ1BVSmluajhmZlduVmE2WDFkWlBmaUtCNENaZFdYZXJSbUdwU3o3?=
 =?utf-8?B?dFJZd2VYYUhxVDZIRzZZRWVzKzN2SHFBOUU3VWZQRmlJVVpLM2NjZEJnTzJC?=
 =?utf-8?B?NzFpRGEwS254TG1tdmxaeUswUzIvdmxjamJaRDN5V1dWMjhSeUxGS1VuMGpN?=
 =?utf-8?B?Q2V5clpYenk1M240dkJNdDgwU3MyY0FYMjJmbXVISnJTSkxiQlVlb0tORnRT?=
 =?utf-8?B?RGd5YlFIamUwS3VvcktsYjRmc0RrU254TGVDRzIzaW05eS9Jd1pueTAvbnY0?=
 =?utf-8?B?SnFYZjZtT3V5a05raGVhVStFQmpMdXZsN21RNkpxYnJ5UFZwbUFpYWlJT0JJ?=
 =?utf-8?B?S3pzb294RnRudUxqMU9uMWt6SE05bk9uZ09DQXBuS0dqQ0Mrc1dRY0VZUnd0?=
 =?utf-8?B?VXR0TGx3NGlxRzlMRGZHZHBqeWJhcFMyS0VXT2xoWWx4YW1pRStyOGpXbzNa?=
 =?utf-8?B?cVN1Y1dGN0l5M1JBeEk2aGFQZjNzT2VTVDlHRXBEU243VVd1SnU1WE9hSm5y?=
 =?utf-8?B?ejg2SjA4OG9UZjFyd3pKaTF5WGRwdjROcWJkeXVZaWtHNDY4a09NSllLQits?=
 =?utf-8?B?NXdMblpTUW9tOG5hN2MxTlFDTUthOG83a2xjQzYvUkVud0N3LzRPNHVDRmZl?=
 =?utf-8?B?Y2FSWkpiaG9Qb0Q0c25XMWo5SmNjVFdhcUNzMTJXa2Y4MTFhRHFOSUVsUEg5?=
 =?utf-8?B?Q0R3ZlpTRHhhUVB5a001dXZUWFN1Ni9RWlhyTUZZcG5SWGVxVDgrVzFTelpH?=
 =?utf-8?B?UG44ZXF5MDB4YU9ScXk5eGYrSjVOZUlSV2JCeVlxM3pybEdpKy9ucy9yV2h6?=
 =?utf-8?B?bHY4Z1hpY1J2OTc4clRZM0FiVHlSZVNWYjlQK21qQ3VZRlcvdU01cXpZRGE0?=
 =?utf-8?B?SmZFa3ZYLzVuZ0J1TGwvaERsN1lQMGVrVEpNSE45dndibU8raEdCZVQ1Qjhh?=
 =?utf-8?B?T3BMSHU3T2d5cExKVkZMNWRMaTNUaldxNFdOazdqNG1ibU5LYUN2cGJ2bkdY?=
 =?utf-8?B?YUsxMjJrNDRacVhDMDlFWDFTNkI4SHF6cFBvdXptUHBJYjI3eU9SK3JBRHNl?=
 =?utf-8?B?TEpKRjcxYll4VkZ1bnBzaklOTHQ4M01idUZOckYrcGErdHU4UXEyWXh5SzU4?=
 =?utf-8?B?UjBmYmcvZmY1c1ZFZmVobGd6bVY3WElwOUkzczRtVmNyZW5LTE90TmFDZStP?=
 =?utf-8?B?ODJJZzltWWIyNjE1YnR4Ym5LK2RQeWlEZWhkMWk3WUFEYzdqOHVEU0J3SVpH?=
 =?utf-8?Q?HC7HUE+WhFQrUoQqcyBYb+M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc01db8-1a3e-4120-8d44-08d9eae6057c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:33:10.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UF6zjhwLwbkLbbqdCUmBlQRDRBbZHYAN3A+e6zMazXdvxzuOktYrmRFRCuqj1COGWwqc0rjCsUw9Tk4dbapJ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789

On 08.02.2022 09:13, Oleksandr Andrushchenko wrote:
> On 04.02.22 16:25, Jan Beulich wrote:
>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -454,6 +454,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>>>           pci_conf_write16(pdev->sbdf, reg, cmd);
>>>   }
>>>   
>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
>>> +                            uint32_t cmd, void *data)
>>> +{
>>> +    /* TODO: Add proper emulation for all bits of the command register. */
>>> +
>>> +#ifdef CONFIG_HAS_PCI_MSI
>>> +    if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
>>> +    {
>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
>>> +        cmd |= PCI_COMMAND_INTX_DISABLE;
>>> +    }
>>> +#endif
>>> +
>>> +    cmd_write(pdev, reg, cmd, data);
>>> +}
>> It's not really clear to me whether the TODO warrants this being a
>> separate function. Personally I'd find it preferable if the logic
>> was folded into cmd_write().
> Not sure cmd_write needs to have guest's logic. And what's the
> profit? Later on, when we decide how PCI_COMMAND can be emulated
> this code will live in guest_cmd_write anyways

Why "will"? There's nothing conceptually wrong with putting all the
emulation logic into cmd_write(), inside an if(!hwdom) conditional.
If and when we gain CET-IBT support on the x86 side (and I'm told
there's an Arm equivalent of this), then to make this as useful as
possible it is going to be desirable to limit the number of functions
called through function pointers. You may have seen Andrew's huge
"x86: Support for CET Indirect Branch Tracking" series. We want to
keep down the number of such annotations; the vast part of the series
is about adding of such.

Jan


