Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C882855769D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354710.581960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4J9d-0005Ve-Vm; Thu, 23 Jun 2022 09:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354710.581960; Thu, 23 Jun 2022 09:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4J9d-0005SE-S0; Thu, 23 Jun 2022 09:29:37 +0000
Received: by outflank-mailman (input) for mailman id 354710;
 Thu, 23 Jun 2022 09:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4J9c-0005S6-L6
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:29:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6c8a00-f2d6-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:29:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3394.eurprd04.prod.outlook.com (2603:10a6:208:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:29:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:29:33 +0000
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
X-Inumbo-ID: fe6c8a00-f2d6-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ie6WJvauoc0OK47WD/d4tPddpzF+1IDarkUVXnnCRJgkgp5YTzPaMGa2KrPlG1eGKLeIxO4L+JV1QIODRnIENvFWqffk73pSL49csG2AwDDjUC0VKAJdf98CFkmzKrfna+kQerNH4PxC3lBKpa8DsV63IjaqboJbziwDx5liv+Va7JcUAvpZQPuHdc3NHN8w6JARw0M0ClZHbdXEjXo3inrR6hJX54RzA61lW+86FhS2eGFJNnKkcy4EUzz1NgwWl2MIUuG5wS82xGDTmep5I1gj2XmZ3lD6sq7d5YvzLvfLJ34UxUjm48XMzKTXSKYlJ56Dr2ha0L9pB43izzPyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7Zpaic8PdMekytrLer6to1o4bb49ZM8wIG3WKMQn9Q=;
 b=Pn2hvZvRvC5QQQrtlcAT3fgNqjoCdBHQDzTLkLTTuf6h9Wth6DL4wce2lqtn5umm2y1h2BXXC4DxZdjKRa7corYOZ197b3t0PCUP3Dt0AV/r2FRiYzJaj51tAf85fhifuJGYRwSczquxgm8+mMGoht1+rV45njgODKZzdNeh/NoOuH2e6KF1oj3x/ean2w/ii814hExXCIzr6PbjYDw1cwVPolk8mbFWx1N+UUygxRdB5294atsu+Q4/sCnEY21B2qg4MDYDn2yRszwsZ3sa7UF9b3g6SmBRjTcy9I9F+XJOTdDLBx40V59aFXbz4ibo2ihQAWH166TEve30mD6hNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7Zpaic8PdMekytrLer6to1o4bb49ZM8wIG3WKMQn9Q=;
 b=xRKDlJ8qni5SbdkM8ufftiCgvxL9pOGdxbC3SXlt+57xZoWDsH6/eIrm4u24hh78PocOdK+p2kYz4xPJRduHyPWYgaxObdAyhedngt0rZBmcwUPKSLQwVYd9OXI7m7auT2TMNbg0/VOSGpfPOFaqfiGJd/kiXCuvAkz3Hye3AbkkH+kly+VxTV0qW2IqVdRZhcrz0s6MjAu9vVziPh4EAcwNFL+8yE5mjBq+9M68NT4qtiK0nV4bqAiTyl42+d9qr7nz+c7DBunXb6BADFWIqcfU7X7KiIgY6QAETOvmn+mQS3/V8ZqIIdq7afw5jsK8Wd5p4tHui5GeRw07DonJ7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8322303f-021a-b520-d2ad-cf8310573df5@suse.com>
Date: Thu, 23 Jun 2022 11:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Connor Davis <davisc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
 <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com> <YrM5g3dLRJHTIVYt@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YrM5g3dLRJHTIVYt@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efb2414b-be11-4513-c360-08da54fae1c5
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3394:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB33944B80F2D25B083E4784B5B3B59@AM0PR0402MB3394.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Ltf7tlsgKjwyibg/hVU1bFjq2MZs2HLJY5ceI6PO6uMtpZNtdCTU5n1doPAZ100WURqY83GkuB7OwFy2aL0oXD3ZrpolljcooPbI35mifc8kPTXi9Yt+fR4Gcz0ndA5HrxUIOT6DJVe8uckp95aB/6uV8TSeGsujhflNcnMdqVy3TxsmLGeDQw6kpSkMkeaORJEoERervNttRtwjUaDALt7Ud6m39tagA2C6ggcDY8CSU4uREU8EoKmrCZE5TS/0HIKrdIEBgFvis4lr0c9I9ZN9yWHi3FNsX8uhNHXqYydCwSCQV5zytC3UpwntXAqnveWLVyu5zPG7qaEc9q9vhyiYMBSrYuhlTETWCR6fuoQal6hMJuRWsPaYaDY2Zbs8AgtpU5+PfxuQOIjPAUYFjiUuvHmiLVIvyaNlGzbBjcLdQxyi0KMcFVqRgqHSMVTOuZODxLl2jH7cGCkgFVTdd9tg/Ars0JoURitGtggelVeWJf9f2M8NtZJqcqf/gl19c1wsuNq49lTErq8631S3CAhyxb3tTFGIrefvcqk4WaVXgSg0Qw32+rwi/Zqw4JHNEMpkkrb9YA7QdpmAitLOf1P0bmFx8RuRrBnkfBdkP82lUhYYo2xHWA2ovmbA7X8c8ch98UeMVWy3oEh+UUFcYTu4J+6JlXZCKZy9QV4oV2ojddk/BeedaqU4fcvHbPOFIyuoaaSd+/SwQu/VM0VswlnxS/esCUrLvmkWQtsP2THJJcbAWdfyuHbCMRL8k59kFeOZcD1YtZ3nlSXWjaSaNIJxctVj+fYUkMiGeAb2LI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(376002)(396003)(6506007)(83380400001)(53546011)(26005)(6512007)(41300700001)(5660300002)(8936002)(6486002)(478600001)(2906002)(7416002)(186003)(66946007)(86362001)(2616005)(38100700002)(66574015)(6916009)(31696002)(31686004)(4326008)(8676002)(316002)(54906003)(36756003)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGlicmFSSmRLZmRGdVRqUy9udmNMdi84UFlpUEtMTTlSVzA5SWthYXFrSWF4?=
 =?utf-8?B?bnd2aW1VVDhLcVRiRmdZMGVCWXVrOENXVmFvYU5VLzBwd1ZjMytSek9TSUsr?=
 =?utf-8?B?TFg1SGhaak14WWNQb25BeWFLVi9mK1M3cVkzQmpwWWJodlg5aTZMU3ZwZlZB?=
 =?utf-8?B?eWt2N0RjdFl4WDdkLy9aWFFEZjJXbW4vdnJUcUJuVXFWYXNnYjExdWNYUUhD?=
 =?utf-8?B?RzVNRzBzc1ZaV0ViUVVHb3ZoSlNEd0ZGUDRxVExNcWQwdVVuYzQ5VlYwNWZx?=
 =?utf-8?B?TTVSSHB3QUxMNS9rQi9ieXhGRnB2dEMwTlNhcitNVSsyVDFjYXVQdUlsaFhn?=
 =?utf-8?B?dFVZN1pkZXc2V3pVeEczUWpJaVFOc0ZPYUhOU1A3VTczWFdQSnFxa0xrUTNs?=
 =?utf-8?B?bDZia3c3WE5lb3MydE5rQ1NCcm12UjEvdzBHOUFKN2NKc2w5dTFlbS9VYTg0?=
 =?utf-8?B?YlE0WXcrc0tXVmRMc3RPSXM3bjFLQmF5ZFkyK2ZYc3dyejkyRUVEZWJzcDBw?=
 =?utf-8?B?RjFTb3pMM3VUd2hIemJhbm9lTzF0MElUQUtmZnI2UUJVZElSMDlmNmc5MDZq?=
 =?utf-8?B?V3BYVm83aVpoYkw3dGp4a3lqNDh4cXAzQUdTemtwcno3Q2tnUVlzNmYyVldQ?=
 =?utf-8?B?dlkrZVh0OWhTL1dpT1lYbDFhWUxXL2V4Vk1pUitEUlY2MEJrTXZBYnBhOS9M?=
 =?utf-8?B?TGRxc3pDS2M0UHRnNERKWHA3aG1kWit0MjdEeTRldnovbGpCWlJiTkdtR25O?=
 =?utf-8?B?QmVVNGhITTd5MTVjcmV5eXMwUmJCczZZcERpQjNqNDIyTUdDQ0p0TCt1bFBJ?=
 =?utf-8?B?cVRVNnVPMk9xUk5ZTU5XU0lnOEVXSUttbVluS2R6WFlxb1VXbHVpMmYyWUZO?=
 =?utf-8?B?elBiYXlXeUZ0N3JEcGZabWRqNW1lMEZqeHltekRyZWN6NC9JNW9NWkl1Vm9r?=
 =?utf-8?B?UWRWOWVoaW1NQ3lXQWhLQzM4Q0NqVEFwakp3dGU5Smk0SUp5T2JEdkMvcmZo?=
 =?utf-8?B?NVp6WVljaUhsQ1VpaDJqSnM1d0NscDdXZ1Nkei9vY09PSWRPeHVWbVV5dU9l?=
 =?utf-8?B?R0xtNFVlM2xuV2ltRUsyRkM2Y2R2TFZIQWpYdUxLYTFYNlVRNFpuR1cwV0Yr?=
 =?utf-8?B?UVY2aGQ4b3pxZ0VjRlVRSDVUZG1YZktVc0R3VFpFeXhINXlTUFN4bkROMmoz?=
 =?utf-8?B?ajd0elIvV2QyY3pDNXlMbTdIQXFrN25HejNEOG84dG8xUkNJT3NEVmcwaVRH?=
 =?utf-8?B?Tk9HNmx6Q1JZL1RCSU9PeGZ3WnU5bm9GQ2F6eUlVRVVUQjF3ZldGaFM1ckN0?=
 =?utf-8?B?bXVmTXBTWUZCWDNtaXBENWZuMi9ERllHK0NxTk1BYTlpV2JqeGw4ZWVsMlNU?=
 =?utf-8?B?T1VzUEJya0tmVWVKL0N2TWYxd2poQ1Fxb1NlbG9XWG0rSFRjZVJDb3I1R2Zk?=
 =?utf-8?B?L3U5VGJjaUJTQVdPSU1iWnFibDFMM2YxVTNkNERYWkxNQ3AzSjhnWEt2Nk9N?=
 =?utf-8?B?eldGbG5UbUIzcEpzOW5GbTBiRVhBbUx5bzhIUW41cURBYUI4T0ZCbElNMGE2?=
 =?utf-8?B?d1MxQVpwOGdYRGZIeThXL1hjRk12NnVMQkxtbWtUdTlKNE96NUlDUXpleVFL?=
 =?utf-8?B?SVRxTVU5Z2VyMUFhZTRRUEpRaDVIOGdNellqb3FLVWlpU0xkV3NNN3hCbE5k?=
 =?utf-8?B?eDBEYVFlMHFyeUMyS1lpazNFOTF0QnYwYnpzL2F0Sy80OUlMZFQwS1IxcUUr?=
 =?utf-8?B?Q3dNbit4a0xjb0xyTVlOLzNpTllGZkVOZ29acGliQ3E5UUEvc1FyMzVvaGFx?=
 =?utf-8?B?dEc2akdxOUtCNWVKakxZUzNmNmtJMkp1YzBicmkrSUNnYThYMFJsZjFranVE?=
 =?utf-8?B?YTEvenN6WjF6UXlJUWlBNzN5cGNOTW1lcTFuZjlwN3haeEV0UzRXd2lqYlhO?=
 =?utf-8?B?RW5ybzdyQUcwajQ3N0RENTVJSk5ITlI5elhzS0JaUnpYRlNwTVB4T1dYclJJ?=
 =?utf-8?B?R2o0dm53OWlpTUtaMHJCWHNxUTJabXZEeTFqV3RWN1Y0dk1BVGYzSWVnNGxx?=
 =?utf-8?B?eFFQdytSL2JreXB1UitESzhsVFJwY3NUTlpvYlRDVHdoYmtOcVZqeXZFdm56?=
 =?utf-8?Q?fDFda8aX7mlhP2kWS0JEzN+0v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb2414b-be11-4513-c360-08da54fae1c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:29:33.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+huVZ9XKjCkkYr+vBz9Hnv1FnYogXkjpXYWUumw46vIgVHKbDHhGrs9ztcBTMjEkZXZwAUk+jPVkMUhfJPrVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3394

On 22.06.2022 17:47, Marek Marczykowski-Górecki wrote:
> On Wed, Jun 15, 2022 at 04:25:54PM +0200, Jan Beulich wrote:
>> On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
>>> +    /* ...we found it, so parse the BAR and map the registers */
>>> +    bar0 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
>>> +    bar1 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);
>>
>> What if there are multiple?
> 
> You mean two 32-bit BARs? I check for that below (refusing to use them).
> Anyway, I don't think that's a thing in USB 3.0 controllers.

No, I mean multiple controllers. When making the remark I didn't know
yet that you'll deal with that in patch 3. A sentence making the
restriction (and its intended resolution) explicit in the description
would help.

>>> +    memset(xue, 0, sizeof(*xue));
>>> +
>>> +    xue->dbc_ctx = &ctx;
>>> +    xue->dbc_erst = &erst;
>>> +    xue->dbc_ering.trb = evt_trb;
>>> +    xue->dbc_oring.trb = out_trb;
>>> +    xue->dbc_iring.trb = in_trb;
>>> +    xue->dbc_owork.buf = wrk_buf;
>>> +    xue->dbc_str = str_buf;
>>
>> Especially the page-sized entities want allocating dynamically here, as
>> they won't be needed without the command line option requesting the use
>> of this driver.
> 
> Are you okay with changing this only in patch 9, where I restructure those
> buffers anyway?

I'm afraid I'll need to make it to patch 9 to answer this question. If
suitable dealt with later, I don't see a fundamental problem, as long
as it's clear then that I will request that this patch be committed in
a batch with that later one, not in isolation.

>>> +    serial_register_uart(SERHND_DBGP, &xue_uart_driver, &xue_uart);
>>> +}
>>> +
>>> +void xue_uart_dump(void)
>>> +{
>>> +    struct xue_uart *uart = &xue_uart;
>>> +    struct xue *xue = &uart->xue;
>>> +
>>> +    xue_dump(xue);
>>> +}
>>
>> This function looks to be unused (and lacks a declaration).
> 
> It is unused, same as xue_dump(), but is extremely useful when
> debugging. Should I put it behind something like #ifdef XUE_DEBUG,
> accompanied with a comment about its purpose?

Yes, please (or any other suitable means to make the functions
disappear from the final binary). The function here then also ought
to be static, I suppose - you're not adding a declaration anywhere
for it to be usable outside of this source file.

Jan

