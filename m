Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68D764906
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570812.893002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvdI-00035X-Cs; Thu, 27 Jul 2023 07:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570812.893002; Thu, 27 Jul 2023 07:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvdI-00033W-93; Thu, 27 Jul 2023 07:42:00 +0000
Received: by outflank-mailman (input) for mailman id 570812;
 Thu, 27 Jul 2023 07:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvdH-00033Q-I2
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:41:59 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1062f7c7-2c51-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 09:41:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8315.eurprd04.prod.outlook.com (2603:10a6:10:25c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:41:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:41:53 +0000
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
X-Inumbo-ID: 1062f7c7-2c51-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CemJIm2a6qQZLErdUp2cSLA5bRB2udLJwRYchbwpOghrA4mCb6Bcg9b3fJNkxJdaNNxnrNT3mvqacm/ABLL8/U+tfHesqZe4SNR/ASEkdAHEubbVgmR0/70VCN6goAwpNPgWDhxGDZdKlYsz1GsEM4MBHrMNd+yDY90j7Mav+/gee5tyYBmFwFnG8g/1b76BQSPI8j7tRR4Y/P9F351sCMV3CChbSir65CsjATplcyBIgdXme1HrWnMXMBEIw/dQrOfqUIkcKsgrnslGbEA7wF3mM4C9X27rGk3UJgO75REVgKdIUT6NtpDtLtWkY99sWSl0DDp5G7AicdaQiBx+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yugv+Oxfr7fM35GP/2dRc8DQW9d8ksnpCiwi74A5u58=;
 b=Ta4V+SliSoHijmNH/Kzp0s+Jszyp51KaDF/+NTl/8j46ORI0AIQYGFYjfuzedOA1McYgYh7pTmzuKKhwJf4CV6DEmNnaVrF7L/o9qzGfvBJnIpo8Xg7Jrc6HSDGcsO4UoALmiEgBue3jgiKmNdoof8ouTo3pg1LmgqV+8PXsiwNWYT9LFXQ7XKPoSPnN7lFvCRJDiadZj4gqv4vUtniZE5+zFYYxA1DZhjqmhBqr77ypPdaWTS2cNhTK/6ApQG0fGTAWFmmciZ5jfC2llps/HRSePGma430uDaqLG/bIfzBZyDNt1zpX6jsynSDGMZGQdkXX4EDoxLLWLIbhsUK+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yugv+Oxfr7fM35GP/2dRc8DQW9d8ksnpCiwi74A5u58=;
 b=ACgshgSH8m2uTuqenG0VL8kcHVZzEJMA2HO90mUbnSJGMgh5dan/2kAcp0J31SFLX5oCbBBXopA703YWfEBERr5HEtbHmHQV6e/cQ4p+V+otdjI0C2gH2uWV/XVQL0jh4Vt9zh6J5rZaGRlt6yf9fo50k6m52mJkmqnIqBhvxoFGBO/dX1KioV7hYCncc4YiTfFlgbI2dYBplfx1N4hpTZ4sQ9VA4xaYiuMKWLneQiTKeP4snDcb7Oa19uuf7qb9mottiGYqyGgj7Fy2dg18HFDyKkcumzRrjapATCQqdm5slkidYhJgZ6wfsqsrNDz1repMnHwBi7NwXx4vxvWLCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <999aae1d-fb85-6550-9798-64cf88d7faf3@suse.com>
Date: Thu, 27 Jul 2023 09:41:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local> <87y1j2b296.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87y1j2b296.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: b34f3022-1ba8-4bb4-9df7-08db8e74f220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b3nFM7YEZQXLG3G/7u3noyFE8D1fswo1WZVPGtH+ZopBv/3LnbzIBRsc9SkMscgwu9uOZXPRAaNZDCoqnXiWQepDxvm5N3r6V99PxKIt/K1DgCriyJh33ddTPNe9w/tZ3pwkJA4yND+MPQ4/PzPnlC/PXpb57AGwB5WoGgyOEO4Rv1Kq7bBLln19X87estq2BvzG2ZaBtO5fA4MMRiHyuZ9AKDxWXtx9HBJxKEnvo5ido+mspsIxBQDcu3621J0IS+YED4QTEuS5Y7i1/5799Iw6x55JQhDbia/l+WnwZ2cDRCFeVILf9iWmOXbHDzrQ1NHszhmljlse98EUNMzQcSTQNYxhLuN5lSDbC9aDrmVq3s0Rw45MxsRUvYlsZijMPkLG8Jw6dQ/TkbWamsvwmIqLAz/Vdnplm1JpHrVqL19OM6BHYXB1poVNyDqlLFxeeWhVKI8Z0gOEjGbI99aPFr0EYqbcwIG5ipNN+S7t5u64bvcgvZgmcpQDKg6KOYk1yI9uWydQ9eYivwppmcjaPT3PJNbX+XaxSxlEaLp7VUmBkwrL7wnKfVtN0vDNx7WS4KCrfkf946pNk9ZmWX+dk7poURoTw6FB9S2kkkFTu8DkiDqAgU1R2rVrnAQpidPslmAD8LFRV5hZWTU8TxV6Mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(6486002)(478600001)(83380400001)(6506007)(26005)(6512007)(53546011)(6916009)(4326008)(54906003)(66556008)(66476007)(66946007)(186003)(2616005)(38100700002)(31686004)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3M3Yy91OVpoNjBvU2ZhQTlWdzNtdHhjTlliN0dxU01MSnFQM1hCL2hUYjFJ?=
 =?utf-8?B?TUl4ejkrUTNiZmg5bHFSVzd4eDJFZU5NeDhySk9lRis4dGlGOTdiVmRkcG80?=
 =?utf-8?B?MXZOeUNpRUlKKzdkMU9KdU0yY2hyUHNRSWRCRmRBT1lWcTRscXJ3aHNwSHpE?=
 =?utf-8?B?emFTWTJ2VDM4ZTkyZmJaUkpTSXAvV1NPNlBVbnNFOU8xRlk2Y21jZytjKzVl?=
 =?utf-8?B?Unk1S3E3RDMrbDI0SXlhUThYTzhyL3lidlgyZ2pJRDkzN0hvU3oxSGJRSE9q?=
 =?utf-8?B?Z1RoYzBDUHVPQ2dJSkVyTHV2d1ZoVlBRTDYyS1NWWEpxVkVlbWFKR0sydmw3?=
 =?utf-8?B?c2swdzl4UXdzb2pPZXhoSDVUbVh2MWhPWVJuYlFyeWg0SWVVNTVrOEs5ZWti?=
 =?utf-8?B?aGFyM252NUpHcUhRVzRRQ2U0dUtMS2pQb2xJc2FYNlVwYy9FcjMxRStsZ0Nr?=
 =?utf-8?B?akU5aVJnVWVpYmgydlRjT2RPNE84ZStsWGV4QWk3MFplMEZOZjQweWw1ZEFD?=
 =?utf-8?B?UFRXbU9zSU9JeDF5Qm5tbDhNK05ydVlTdENnM0xxd3dBcW1JV2c3aEZhMHQ2?=
 =?utf-8?B?MXFNYkFCOUVEMzc5ZXNEVWc2bGJwQVArbTQzQlJNaUpGV0lZbHhBeTVaWVdE?=
 =?utf-8?B?Q013ZTdTbGxxelIveklhTDFuMFVrZ2lSemtKa1JJSlcvSU9kQ0hzUjZiTGJ1?=
 =?utf-8?B?ai9Bd2xTWHh6Qlh5QzBwNFBlT3o5dkxUc0k2MktvR3h5QXFWTVo5cGNtQjY3?=
 =?utf-8?B?UlllTWVzcXp2WXhLMXVMbG01N002MnhRWkZQL3J0L29YWHdhNDIwZW1uUmpE?=
 =?utf-8?B?c0RXWW1TeGJ0SDI1RWFVR2t4N1AzSTR0c3JUeDVBS2srZ1R1SDBsZEE3aG9k?=
 =?utf-8?B?emsxeGNNM21YNEIrNVl4V3BOcWRYVFo3dlFqWkJyV1ZjS2hiamY0d3BDYXVW?=
 =?utf-8?B?b1RIRE9zcTFUTktTbnBoNmhETVU3TE1xdjVGa1Yyc05YSGFrdFJDVEFibnVS?=
 =?utf-8?B?OXBaNloxbmZremloRWZpR0xld0tucTRvTE9pVjJFMW9BOWlESTZ5ZXBUY3N1?=
 =?utf-8?B?U0hhNDY3T09IMUZVWGFSdTVBckRSS2VBUTFnMHh2bUJ6QjRtMTllRVVqeHBl?=
 =?utf-8?B?clUxNE4yb2tPL2V3TTlNZDdRb2U4OXVrdk1tS1RjVnRURFpoL2QwL0diM1h0?=
 =?utf-8?B?WTJadEt6cDVuZlI4WkN3cjhibndlSzBTYjRmWG9XRjAwcEJxajljZnZqTklE?=
 =?utf-8?B?WUdpZUdOMCsxbllMblRTakVqY1J0czVRRHZWUjFaVE5FUmovSDdjN3pMQ3Zh?=
 =?utf-8?B?d2FrZ0c4eHNmbEswV2IrTUJyNnlEYlBCcGk1T3pMQ0U5SkFzYktjZ1FkcTdL?=
 =?utf-8?B?U2RjNW04ai95b3pEUHNKUnFNNjFmaDVYNENwRzFrN0oyVzRWZ1B3MWM3WmFY?=
 =?utf-8?B?QnkxZndjU2Y1OHlRUTh5TjRpaXZBdnVkQzZwMzlKN2xEajlCMXljSWdURnlY?=
 =?utf-8?B?T25HME4rSDdkRW5wdzY2dnl1Skd6L1A4T1FoSzFjaDlqSmUzbmpab0djZmFL?=
 =?utf-8?B?NndEaXRxUHhqV0U4MHlkZWhpRUlaOG4wUmFBd3d2UXc0ekhKRlAvTlJuRlV5?=
 =?utf-8?B?RDNxRnRnRElPODN0WkNFTkdaMmZlc1YxbWpsWXQvTSt1bDV5OG92ZGF4WVU0?=
 =?utf-8?B?RExVQllXblV3Qk1vd1pJUXhyYXZPQUowSVN2VXdWNVJJdHM0amdqRCtrVjVE?=
 =?utf-8?B?aWtkMUczTUtDbXh6QlBza0ZpSVdqYnE3b2RydkZKTlRzbldkdi9TQ2JJU1c2?=
 =?utf-8?B?T2pDZDFEMEQySDNQSEg4Zm84ZnJuUk81TzBVdHVIbjEwdkhYLzQyTU1EaTVK?=
 =?utf-8?B?c1FKbGdJMDdnam1jQWRGL0ErTHkxd0Q4ajNnZVVOVFFhWXVvM0lpS1VJNGxJ?=
 =?utf-8?B?OHdML3JCR3lHZi9zcmRKNmRyMDFOUUlneHI1SE9HZ3cvc3AwTUlUKzFLa0t2?=
 =?utf-8?B?MC90WmovY0M1VHU5SjVTb0FCKzhONkdtdTlPT0xrZkRZeXd6L3RQdjdGZ3Zn?=
 =?utf-8?B?b0p3S2JKQ2RmUmpTUUxKTno5Smt0cnFqZjZRdWsyTVc0LzlCbG55WjJDbUJh?=
 =?utf-8?Q?gU+pxaHdiFPhIbKvTS8B82El2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34f3022-1ba8-4bb4-9df7-08db8e74f220
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:41:53.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFDQZWluIYQWwyO6lO7d2MwhC2mxzQM84bIxTt2/nDh/r8fQtwzHFsSqNL/P2E+IDVtk5GCdLvjMGkPLHwqoRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8315

On 27.07.2023 02:56, Volodymyr Babchuk wrote:
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
>> On Wed, Jul 26, 2023 at 01:17:58AM +0000, Volodymyr Babchuk wrote:
>>>
>>> Hi Roger,
>>>
>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>
>>>> On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>>>>          ASSERT(data_offset < size);
>>>>>      }
>>>>>      spin_unlock(&pdev->vpci->lock);
>>>>> +    unlock_locks(d);
>>>>
>>>> There's one issue here, some handlers will cal pcidevs_lock(), which
>>>> will result in a lock over inversion, as in the previous patch we
>>>> agreed that the locking order was pcidevs_lock first, d->pci_lock
>>>> after.
>>>>
>>>> For example the MSI control_write() handler will call
>>>> vpci_msi_arch_enable() which takes the pcidevs lock.  I think I will
>>>> have to look into using a dedicated lock for MSI related handling, as
>>>> that's the only place where I think we have this pattern of taking the
>>>> pcidevs_lock after the d->pci_lock.
>>>
>>> I'll mention this in the commit message. Is there something else that I
>>> should do right now?
>>
>> Well, I don't think we want to commit this as-is with a known lock
>> inversion.
>>
>> The functions that require the pcidevs lock are:
>>
>> pt_irq_{create,destroy}_bind()
>> unmap_domain_pirq()
>>
>> AFAICT those functions require the lock in order to assert that the
>> underlying device doesn't go away, as they do also use d->event_lock
>> in order to get exclusive access to the data fields.  Please double
>> check that I'm not mistaken.
> 
> You are right, all three function does not access any of PCI state
> directly. However...
> 
>> If that's accurate you will have to check the call tree that spawns
>> from those functions in order to modify the asserts to check for
>> either the pcidevs or the per-domain pci_list lock being taken.
> 
> ... I checked calls for PT_IRQ_TYPE_MSI case, there is only call that
> bothers me: hvm_pi_update_irte(), which calls IO-MMU code via
> vmx_pi_update_irte():
> 
> amd_iommu_msi_msg_update_ire() or msi_msg_write_remap_rte().
> 
> Both functions read basic pdev fields like sbfd or type. I see no
> problem there, as values of those fields are not supposed to be changed.

But whether fields are basic or will never change doesn't matter when
the pdev struct itself suddenly disappears.

Jan

> Also those function use own locks to protect shared state. But as IO-MMU
> code is quite convoluted it is hard to be sure that it is safe to call
> those functions without holding pdevs_lock. All I can say is that those
> functions and their callees have no ASSERT(pcidevs_locked()).
> 


