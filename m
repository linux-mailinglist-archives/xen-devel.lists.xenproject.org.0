Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76F70F7FB
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 15:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539054.839549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1oqD-0003jF-GX; Wed, 24 May 2023 13:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539054.839549; Wed, 24 May 2023 13:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1oqD-0003h5-D3; Wed, 24 May 2023 13:47:49 +0000
Received: by outflank-mailman (input) for mailman id 539054;
 Wed, 24 May 2023 13:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1oqB-0003gz-Oo
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 13:47:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b1f9f9-fa39-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 15:47:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 13:47:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 13:47:43 +0000
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
X-Inumbo-ID: 90b1f9f9-fa39-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9LgLsmQoMUGAt6mr1jCv1SKGCFErTgZAWxRoINltk7rkSAk8TOsQgCEVzWK8+g5qGSOI2rIoAYQVdvqs4drb6mzSGmsgCGe9bDpbiTQMOVJYQzlBTRHyvpp3nWNxYLLCVlx1uWgJkxQqqYcOuBgqfmvt7I5FY0YnkaNWghDdV+2gtXGq0DTRv1MRXbI/M+81HMZckiTcgM3rplstk5JLvlyqm6fsSixlKVjhoYybs4rpcrwDhY6Z/YLzTqnq3Myw9TSkj/ITaqBKJSLqVuKWSprJn3Ad7ZMfbtVq08HcXa10Pii+K6yBdwCM5gFB6hJqNhQ9O4uMBlfFOUXTE0G+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5IvX8/Ewj7KsK/hSok2H1eVmBl7JZFr7tRqxXO7HFI=;
 b=WfK/ieOzV1pN7IAOX+JSibIB0+KyVtLj55E5RZ7jsoZtywUvRUH54nXx48dQw1AWxjtpCdrdyOdu8tNtzyn0ZKoz/nqynaj4676fY46zvqPf7pp44ajEIkw+WYY0rNiwJ87ZlXOJUEtxPhYE7NiAw+K9+5C73oNVwN17tuKOubnHZQ16IaT66hP5GJEz/Di9Ktld5FfNyRUSqFis5yiciD7mUtPCGbzE1rKksrlKAevFiNpr/AabeSRhyhcG9xOkT6Y3eUkn1lkOoAWyDJNc1fyMfdYGPdoh9l1P8QDbzYDFQLNFt6CLWPvD5fOf2o+/3P+/Fnj4dt75cEHBcyAS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5IvX8/Ewj7KsK/hSok2H1eVmBl7JZFr7tRqxXO7HFI=;
 b=EcvRbFHYJ0T0O1649/i2ycM0bn8sc6kbB6MnVAH+TLtdsp7lr4fwPfo2XC25R5ZzgB5f2TXNSL5sZYzvjMpCiuotGw7uhjc0HISAbP7f/vQhSwMFCGmiXSVBndywnat5Kf9D8Tq3UCtJIUUkVaKBTpaC6kzJcIwoJP/D+qekdVDQ6/R70ZNHsenvbKYqcWHmuIZbipLNDRKgT3bG8s1j4mWWl/EB9GusPcvXEH+30I2hiIzWbpnKxbTdXgHjZVv4hlg5ZlVkI07agJ3R/E5fNbPYcCJdEKOJKtpgP1LNvfFhZC7BwSzOX0SUSM1+bBLJ2R03o7Av1j+OUqPhgsJJpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78efef03-ff39-3289-d347-396c06e06eb2@suse.com>
Date: Wed, 24 May 2023 15:47:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
 <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
 <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
 <alpine.DEB.2.22.394.2305231756500.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305231756500.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a0e4c2-22b8-47a3-7ffa-08db5c5d7318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xzhbFL61pQUeCMKkxr6AOx4d9As8aEXEobU0ojjVyN+3v3PqXc/k1/KJpft3J90L3ypjrnNY2sDJobyEOYW0Vv2+Quv1GMpCYMiISoErxffrOMs8haxhjiaccbC8eDXZjyXvC31m7AitHWFKlLt/3TvYAZ718/GgTY21ruC/w9EMvku98Gn+TRRmr/ywf2AE/BQerhSCIX2e6oCc5i1lrSg/8bkTAh60BFfCtrZrvH662XGdxyLS0GE93v7nLBVSe3kQMGZ07e6KN8prklqtfKVE9Yi0lSiKbxsk7ELNZ3Z+we+sA247+2snOKGbr5LQPj95H6tQPZosQFpdiPjKHx9gpUz7tGRdnS0c4AnEl72pia3C9b9LzyziP6VZSzf/BdpluVhzQyBXLUSdGgLv02VxkIJi6FtOmgeEa9ANzp+OxhQAA/XpdRsi4sZgoFeLlmWq+X1eeA2P5oR/jQQYDbBnOK6CtQoxYP9l+4WvbF5MYjw5XJ6WtOCua9vmN7XH69o1MipPCPDsNpaxcxfeyAZS5+tX8hRC35QfTzoDIYdLa3gYlR6lm4OQBhuS8bIxpDP7TJqnV8hU0ipNF9hQ5TLc+XB/36ok9ZfAcsNjH9Innr0maXqGXKb4vat/jdInoTAYILjsKBSpl6F2YO4bhTf855LLa85f37I5XIrJySEGtyJLeFNkPbHMKXJXptQy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(83380400001)(4326008)(6916009)(66556008)(66476007)(66946007)(6512007)(966005)(6506007)(2616005)(26005)(53546011)(6486002)(186003)(478600001)(2906002)(5660300002)(31696002)(86362001)(8676002)(36756003)(316002)(8936002)(41300700001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alRReFFHKy90Z3pBVS8xWkMzU3FNa1YyUDA2Mi80Rk05QkZuYm9tcWd6bGRp?=
 =?utf-8?B?d0dxbTNWVkVkOHBWMjZDcWZBNDdteDhGSlYxQ29xbmpsUU45OTh2T0JKZStr?=
 =?utf-8?B?c0pPdDJPeTdzNG1peFpQUXFvNmhRandjVkkyUDZ6UjFPdEswU0FhNmxUOU1C?=
 =?utf-8?B?NTQ0VVBSdU5HWm50eHYwc0lKcVBaTm5CYytUWkJKbmtzbXY0dWQwV0JxeHlj?=
 =?utf-8?B?WDQ3aDh1QkM0TnhNdUhNRFYwMXA5djVSdStOalNCTGo4Tm9Rc1ZlcXN1bEd2?=
 =?utf-8?B?NnB4TDl5Mm9PNURxQTBZcmZSZmJna2tiaUxGOUFKZkRJN3NVbkFRWnRrOWEy?=
 =?utf-8?B?K3VVdWJ4WHFVV2IyS3R3cWVJeUoyREZta1h5UkRSQWRuZVdhaGtqYzB6TTJz?=
 =?utf-8?B?a3lEUDRZUGtBaTBPakVlZmpIb0wyZGdPK0h4MVJSMTlDKzI5QVVjaVM4QjZY?=
 =?utf-8?B?OEdUbytDa29ncGxkUSsrMG5UTngyK2lwQjZuVXAzQnV2SHEyNVBDZGtYSmI3?=
 =?utf-8?B?aHlhMnQyUmVqWE5IZlJZZndZY2J3VkNlZFRWdEZEUjlhQS9pT1pGRlY1TUlI?=
 =?utf-8?B?WTZZei9WdFdZTEtVaWpUNlUxV0JUcFZBaXNTY1prK3N2VnV5bkZBajRnUFZT?=
 =?utf-8?B?NE56M1A0eCs1L0p6WTFjRkN5bEJHRFB0TnJDVTBqNVpSemNVTWVZb3E0ZFZi?=
 =?utf-8?B?dGdPSWE1b2JkeUR0RkpQaDl6dE5SdUxTRzhxYTlvdFZlSVlXaDlTRnEyMFJZ?=
 =?utf-8?B?WUJ4SER0NHJiTmkvZ0FHamcyQXdqcDBacldiRjJGVEpXSGVKaGJZWlo1OTRK?=
 =?utf-8?B?NHgxb0dJRTRxbVFCRUVPeXRXUHNXb0FCU1d1aTNjVHFwTzYwWWd1VzFKaXVG?=
 =?utf-8?B?Nk1LUzh6UHZpd3hFcTU5L2FCNmtlRUo2blJnTnF4NGFZTElYRnRqWWxBdUF2?=
 =?utf-8?B?amIyTjVEVWFHbFM2MVhOVkV2ZXV2VndVUGNnWnFCdUVsdHRNV0JaS3Nrb281?=
 =?utf-8?B?UzdtRlM3SmRVQldURkQ0d0RDUXd5NnArcnVidjdjUlBXVEFRa2RIZlRGU3o3?=
 =?utf-8?B?a0pHN1J0WERYNnM3cVgzbUlkQWIwS2ZaNTBQbk0wMVEzZ3B3VndBM3Y4QXBS?=
 =?utf-8?B?cHBPaTY2d3pJVGlYSHF0aTRkOTM2R0Z6bjcwRTg0bkVvMHNZRWROaFl4ckpL?=
 =?utf-8?B?eVJiRTdvTmJFTlJEc0F2WlRPL0lrRU51RGU3TEhiL2FrRWtDemJ6UUxnS2xN?=
 =?utf-8?B?UzliQzZKM1k2alFNc3Budm5TMW95ZmtTWkE0VWxEN2hrR3QvcVR3cUk3VVdh?=
 =?utf-8?B?YVJyZGdPZ2Z1REwzbCtkQWdsVEF1ZTg3M3V1MnpRVTdCVlFYREZ6a1JqbnVs?=
 =?utf-8?B?Umt5MVIxVDRQMnZjUGtzMFVLUStJR053bkNPd01DdW45R3g3anhIbTFIbC83?=
 =?utf-8?B?bGErd1BiRyttMkF6TTZZNEJnNUJMRXRHbHJCbWdXcDFUamQ5d2syME1kNEFv?=
 =?utf-8?B?SE10WS9lWURlcEozdldKMkxXVW9IcFJjckxZT21WMkxaeGo0aHR2RFJCRkYx?=
 =?utf-8?B?OHV6cFh2aHpGMXFZL2JFWC9oZE4wWm1nNlFNNEdtUWJ4OU1nZ1JWbEZKekJt?=
 =?utf-8?B?K3pDbThzcTcwV2kvaGNtMW5sdWk3UU1KVG82NkgyWTlNRDlPRzdlQTF5cmY1?=
 =?utf-8?B?N1lDYnU2aW1CQlhhRkZ5Y2xlbUJCSUpENDZBTWdFelpuZGtOY09LdVZmbWNL?=
 =?utf-8?B?U0lnb3U1b25PL1RDVUlWWlNOblpoK25OSTgxdWhESE9ZNVo0NHJIdENVQ3lY?=
 =?utf-8?B?bXQ1Y0swTHJtS3pESnphMlNSekgxRGc4Q0V6dWdGaldLaDd0VjQrelloUzN2?=
 =?utf-8?B?U3NUdnVoY0Jsb292OUpuanVzS3JHNDg0ZDJwY2dpUlVocjJsYzlOUzJqekdU?=
 =?utf-8?B?MjIxcUhueUo2S0pLRmloWkVTSUpEWE5PMWd0a3dlOG1lY0FlTkhpS3VZdS9H?=
 =?utf-8?B?YnVBb0JBb1p2SkE5ZWlXQmVRM3dVWDhQaExOd3lHQUlFWlo1K3pocGt6eG9E?=
 =?utf-8?B?VVpld1N0aXl3OVd2V3p3STZJNnRqTlVkdDV2bTdXUFgwMVlkb1JQOEhUeTFs?=
 =?utf-8?Q?IBQ9vWU1C2CL3gRxHXHj9UPtD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a0e4c2-22b8-47a3-7ffa-08db5c5d7318
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 13:47:43.8513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2J4xdjG/zN2X1Qo6sesdpENLiLxxtP4YZmZ9RL1nmNdgkem+6lSYO8cWDfElMjD6BR6VbSBGCh15AkLKLfbEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9778

On 24.05.2023 03:13, Stefano Stabellini wrote:
> On Tue, 23 May 2023, Jan Beulich wrote:
>> On 23.05.2023 00:20, Stefano Stabellini wrote:
>>> On Sat, 20 May 2023, Roger Pau Monné wrote:
>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>> index ec2e978a4e6b..0ff8e940fa8d 100644
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>       */
>>>>      for_each_pdev ( pdev->domain, tmp )
>>>>      {
>>>> +        if ( !tmp->vpci )
>>>> +        {
>>>> +            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
>>>> +                   &tmp->sbdf, pdev->domain);
>>>> +            continue;
>>>> +        }
>>>> +
>>>>          if ( tmp == pdev )
>>>>          {
>>>>              /*
>>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>>> index 652807a4a454..0baef3a8d3a1 100644
>>>> --- a/xen/drivers/vpci/vpci.c
>>>> +++ b/xen/drivers/vpci/vpci.c
>>>> @@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>>      unsigned int i;
>>>>      int rc = 0;
>>>>  
>>>> -    if ( !has_vpci(pdev->domain) )
>>>> +    if ( !has_vpci(pdev->domain) ||
>>>> +         /*
>>>> +          * Ignore RO and hidden devices, those are in use by Xen and vPCI
>>>> +          * won't work on them.
>>>> +          */
>>>> +         pci_get_pdev(dom_xen, pdev->sbdf) )
>>>>          return 0;
>>>>  
>>>>      /* We should not get here twice for the same device. */
>>>
>>>
>>> Now this patch works! Thank you!! :-)
>>>
>>> You can check the full logs here
>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4329259080
>>>
>>> Is the patch ready to be upstreamed aside from the commit message?
>>
>> I don't think so. vPCI ought to work on "r/o" devices. Out of curiosity,
>> have you also tried my (hackish and hence RFC) patch [1]?
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2021-08/msg01489.html
> 
> I don't know the code well enough to discuss what is the best solution.
> I'll let you and Roger figure it out. I would only kindly request to
> solve this in few days so that we can enable the real hardware PVH test
> in gitlab-ci as soon as possible. I think it is critical as it will
> allow us to catch many real issues going forward.
> 
> For sure I can test your patch. BTW it is also really easy for you to do
> it your simply by pushing a branch to a repo on gitlab-ci and watch for
> the results. If you are interested let me know I can give you a
> tutorial, you just need to create a repo, and register the gitlab runner
> and voila'.
> 
> This is the outcome:
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/876808194
> 
> 
> (XEN) PCI add device 0000:00:00.0
> (XEN) PCI add device 0000:00:00.2
> (XEN) PCI add device 0000:00:01.0
> (XEN) PCI add device 0000:00:02.0
> (XEN) Assertion 'd == dom_xen && system_state < SYS_STATE_active' failed at drivers/vpci/header.c:313

I've sent an updated RFC patch, integrating a variant of Roger's patch
at the same time.

Jan

