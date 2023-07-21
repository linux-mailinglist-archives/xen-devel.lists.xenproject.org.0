Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55575BE2D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567344.886258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjDu-0006T3-M1; Fri, 21 Jul 2023 06:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567344.886258; Fri, 21 Jul 2023 06:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjDu-0006RQ-JP; Fri, 21 Jul 2023 06:02:42 +0000
Received: by outflank-mailman (input) for mailman id 567344;
 Fri, 21 Jul 2023 06:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMjDs-0006RK-Lu
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 06:02:40 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe02::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31f7af70-278c-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 08:02:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9199.eurprd04.prod.outlook.com (2603:10a6:150:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 06:02:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 06:02:36 +0000
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
X-Inumbo-ID: 31f7af70-278c-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLNzT1sz5rFcOMqgv9gq4qLfdqGwNKbg3SNo+ux799jaYVgGHrMikGBQo5SHaikzhP4kJkn2CIO0qYaEFE54qNPtgQS3Zso1V7e6GYRZbDBm996KEZqlpyZp8T7em637Am40OyqAInPiYCgMdg0SVB1w2YO+A1EkF7l+LjBLGNFQXW9H3Z7Gb2vVWPzpkfK/MWbjx4U3oKRvurrtkTeMKPxwIK5M97pstMA5QpuV9o8zTORoW7CIxBvHUEju/MLq+39vAYSI+74g64pduDNNWujELa9eNgQJeiNy4ZunmESYxLCBQJai36YEDB8OvP0WIMrjfJOLLFZdHyfszqmdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cMAsk5SO/im3WOoikG5RqmhbfUkisohoWRcAjHPFGo=;
 b=doo4UwjgtUO0L7sGuGJa1cXIfBnh4yBvJBm9kc7XINsKTkBnXzjJ6x2NRxx4YDLYs82CAR1MIEwwVqcJhQl9duYx41m1I3o+mBTJ2KJxgGEihJ70SA2Qjcpfl8YyL9WFcA8yJh15Z3RQpVdGHSllcVdd8yLhHItEvDHAVkplkW+/qX9gqcPyX0LBiA8SIxBPBlVSL/CKJaDaTauF28rE0eCFBtozoBsn8ZxmyJeVbieQ7p7TShCrIek0kb67XT+ZriARtSNMQ96OLfr9zo1GGyhjtaMW2Eden+DdAJGXLCstBnC931PXZVCs4cLV7V7G2WzOGUDJtHGJH+E4axCZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cMAsk5SO/im3WOoikG5RqmhbfUkisohoWRcAjHPFGo=;
 b=m1iAw2erK/NcAyM4zKSKuGF+tLnafu0lqhzYEtRD+j6qmcXhPXTMl14D9/Kh8nQgI18xasTv2ZRDHGq24oVA2Au+fzsXadVze7rbShotjTKA2Sh6ZbBXTZGsZ6pLaDLHhnbf3A3fFHXlDGAFlnQ2vMuPw9qC1obDeQuTVptxG5/10WlWF4LX4mHMdgUwSN89J3DN8H1AwCiLdry4u70acJKqrsZw9Gipiy8u499YBfvxKEuCakIHxcy1o2uSD9GK4XfjS5ojdFP1OAGrJQ0+c6jSkyfi8KzDa4KnfDN5t0YHsunyYeqTRon6ejSmeGHPMGEFwuLUlxJOwE1dSaIgug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96b95858-c83a-5703-f6b2-6bee852e62e0@suse.com>
Date: Fri, 21 Jul 2023 08:02:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <e9331a8c-69b5-b803-7989-7e3b95b815e4@suse.com>
 <ZLldU9ZNM5BRXqeY@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLldU9ZNM5BRXqeY@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b682ff-2ddd-429c-5753-08db89b014a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CIQiru8Rt34CykhWO2wzSxSXSbRj1uNruA3od07mKw965rr36hWq2bv4m+JPq77ZxHVUWJ2OiTLiT15leCCa993iouzsQi3LMIhLhRbAaSxT2BTCXLkeWzFXAPQ5OrE3M2+F+yWv/8PF86PfKYzHQ1+tE52zbFZjXuX+XmyjvUXcktSWhd2LU6zv+wtALzo2pM5aYlr+i0dw5c1wz5kxCEKTxpN64QBfbUeUZ7A+zB/GG4UWhJDih4XfNp9OXLZl8uf9Mn1kYljQl7qb/Rt9txpPD+Ug24mlqoNYzyRcqzbkPsiSfy0OmqeIVBAWAkrSJUT68hno4qUFLZxQ8u/o6xRvPXIqI70WqWkP+DliLVMgIRHaXWghhaMzKwsY3eCzzGP5FjgcqnaQUP4EDEhwKSsLelK51bEEf4n2DnJJ4fof8KaHGdaDjNvIGpN6OuBsjfuckjQpiCzW69m/xK3+EnpPNYL0gPKB1ufX5b366O4r8L12sq5/0x9lfWf9M4WdSdo1WE6jEG7taDoTz8VQX0F9oOoyy+u+6y4ZrZziRMXcnRRmDE/ddMM2DGd/FzUJIYI9npEMHaNSAhKj2hg6iMgfUWNJDbIBLYWFWDczD0K4o1EbdKcViRZ7AZc/1MwtMfAbKk4hybc/C8kQaVnJVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(31686004)(316002)(2616005)(4326008)(6916009)(83380400001)(36756003)(86362001)(2906002)(31696002)(38100700002)(8676002)(5660300002)(8936002)(66476007)(66556008)(54906003)(6512007)(6486002)(41300700001)(6506007)(26005)(53546011)(186003)(478600001)(6666004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzdNbGY3ZVlLd1JVU0k2ZmlXb1dORTNLSWpPN2wwMEl6MEtZbGdKRy9CRDV0?=
 =?utf-8?B?SUZsWThPQ3haeEpDODRzZDlWZHNJYnJvMTZCZ0ZjZVNQVjArMVNFWjhjaDIv?=
 =?utf-8?B?ZGNpNVNvaS9QY2NaWFRnNll1blIrVzU2ZU1LTldNRTlrUElyZVo4WWY3TG96?=
 =?utf-8?B?S1lpUXJvN3FZVWhEWHZrLzA3U3RXOGNpdTNYajBNbUlOdG1GekQ5cDN1MGZI?=
 =?utf-8?B?ZXBMRmZLVTdyS241cFovUjJwS0kyenNlWVRMOUxZRE4xdVBRd3M4T054RlJm?=
 =?utf-8?B?NEZUd2xveDlFNXBleS9Cb1Z1c1F2TTFZQXJDV2o3NEdLUTE2RnpCZHVvSXM4?=
 =?utf-8?B?clc5LzZrQ3ZtclV0VURpWmdSaStkNkN4dnZXaFBra2NmWlN1M3B0bElPSjN6?=
 =?utf-8?B?UXlaeWJ6WW1BYjJRcEJlUXM1d0pZZThkdXlMUDFzMlcwQnBRcnUrSVBWSkZR?=
 =?utf-8?B?cUh5cFBibmVQM0EvT0FMZzdnK0lXN0doSGZPNk5IQlhvcGd1K1Y5Q3lMK2pU?=
 =?utf-8?B?bW5VakY4aHF5ZmE0SVk1c3gvd0QyZkY4NG0rbE9HdG9jN2FTdFM5ZElmYjA5?=
 =?utf-8?B?TGJoZS9YQThpTFh5c2phQVQ2RlpwbDJsVEpLKzlCSEhvWnNSOWZLVTVnQU5i?=
 =?utf-8?B?cE9kRWcwQTljaXlmdVVXMHA3WkczOFE3MnFYSHdlblVLTXI2WHRQSWpNc2RT?=
 =?utf-8?B?NDZnZHc0Y3dmeGVKNGRwcGsrU2ZEOEJWVlc5STAweXRpT0NDQnRld1QxbkZF?=
 =?utf-8?B?bWJsQ0YzZnRjZWdFRzFmaDc3Qlg5a1VoV2hXMHVYajdjV2NkbjdvZEpWZ3NN?=
 =?utf-8?B?WlNmWjVGVG0rN09VZ3dPbWJ6LzFJN2s3MFVqNUt3TG8yMU9LQTY2Z010MTEy?=
 =?utf-8?B?K3dGRmFxOGJRcFVrWWhrUFNOeVBQOXhiM3NJMnpUMGZaZ0dqNEd0VjRXVTgx?=
 =?utf-8?B?YzdFdU9aaGo3VmMrd0M3SzhvTWJqaGk3VnRRVU5wd2JsNGhnK2JFUUVqTjVF?=
 =?utf-8?B?bUU4bHJmVDVoanlDeTA1ZnNaK0Y4N0NpRmYvOUt0dGtMVnh2eVp5elN5ZUNv?=
 =?utf-8?B?SC9uVFRuN2N6MElZZDdyY0VLVG9SbjBTSFZyWnRqR1FOdVAvejhtQVR6N09I?=
 =?utf-8?B?MlNuUGxQTVNzbWpKdDg1VlllSWR6eTB3TS9zYkV6LzdEdlpkWjc3TDhnT2Jm?=
 =?utf-8?B?cGZoWVJjMEpJWktKQ3M3YmxGMjlUV281QlRBeko5cnV1WUlMMEtEeWt0MVBw?=
 =?utf-8?B?VmlBUk5HaFZRdVFhY0JLVEVtbjRXTHFNdDdxQUp3dnFZS0pXSGRPS2ZlZXFF?=
 =?utf-8?B?VU5NSk5KeThyYWdicXRjYSs5Q0pGc1ozb3l2R1pGTExqNGVEYVNOUUtkL2hY?=
 =?utf-8?B?UlBWME5RWEM5OUJzL29lWVR4UFJPVGg1NlRJVlRHM202cml6aklIVnFzMEFr?=
 =?utf-8?B?TTB6QS83cTlQTlVqWS81UTc0VE1RQkpVNTlSNkxDQkN6UGx6Tno2NmpuNkxI?=
 =?utf-8?B?UGR6RnlwNStwdEhjMlVaZXRpV3A4akd0ZmwyVHJDamc1clIrODhsb1Bua0I5?=
 =?utf-8?B?bWlpN3ExdjFnV1JzNEluRDhFaWF2cHByODBpbmdneWhTZEZ3THZ6cmpTVXBt?=
 =?utf-8?B?QWM1TEZMamlaK24wT0QyNTR5MVZwdEZUNU9BZGNOVmJtdFhTcXdpY29TRG52?=
 =?utf-8?B?M2M3bnhiUEJ5YzkrYjhEWFBzZEp2SURnbnJ1MytheTNnWEl6MncvMHlQZ29I?=
 =?utf-8?B?RHZ2Tkx0N0x1WThqWFRzcHY2dGloS0VjZ29Tb1Z4KzNYZUZEUWpWa2xNa3Vv?=
 =?utf-8?B?eUNONGpqZWdOR2xnN0phM2ZTMlZkb2U0SjJxTlg2R2xhZzJFUDNRZWtKbFB2?=
 =?utf-8?B?bmVVV2RQeVAzNGEwMjdITmwyajcwcnVLR1ZYVTgvSHp6R0QzZjA4bWo4enBt?=
 =?utf-8?B?ZnE0OVJFM2xBSVBQTWdWbHE0Mm5iUUFMVDVKTWE5aXVrSnNMRXVHcnZsaUhr?=
 =?utf-8?B?QTRmQVByZ1lPdU9VSHYzU3dDaGxRUENGVFdWNko5Y3p2dm5QVGt4UE1UNndU?=
 =?utf-8?B?MlFnQUlvUUpYOW1CN3dDNHJoejFUNzVsWFdWVGU3anNQcEpCdElDS29TQ0kv?=
 =?utf-8?Q?4Oi0gEf5M+7ncCG5xttgEzCWd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b682ff-2ddd-429c-5753-08db89b014a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:02:35.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEcFfn8YWleE2DNzP7gp6TOiBPLb0PpKpgrvG0VigqqyY1gRnBd/puiUtllowoRPLbqsslLcV95yVujthHgmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9199

On 20.07.2023 18:14, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 06:03:49PM +0200, Jan Beulich wrote:
>> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
>>> --- a/xen/drivers/vpci/msi.c
>>> +++ b/xen/drivers/vpci/msi.c
>>> @@ -190,6 +190,8 @@ static int cf_check init_msi(struct pci_dev *pdev)
>>>      uint16_t control;
>>>      int ret;
>>>  
>>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>
>> I'm afraid I have to ask the opposite question, compared to Roger's:
>> Why do you need the lock held for write here (and in init_msix())?
>> Neither list of devices nor the pdev->vpci pointer are being
>> altered.
> 
> This is called from vpci_add_handlers() which will acquire (or
> requires being called) with the lock in write mode in order to set
> pdev->vpci I would assume.

Right.

>  Strictly speaking however the init
> handlers don't require the lock in write mode unless we use such
> locking to get exclusive access to all the devices assigned to the
> domain BARs array for modify_bars().

Aiui in the present model modify_bars() has to use the vpci lock for
protection. Therefore imo in any of the init functions the assertions
should either express the real requirements of those functions, or be
omitted on the basis that they're all called out of add-handlers
anyway.

Jan

