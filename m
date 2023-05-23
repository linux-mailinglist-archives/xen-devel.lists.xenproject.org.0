Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D231170DCD6
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 14:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538476.838428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ROg-0000rW-Dm; Tue, 23 May 2023 12:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538476.838428; Tue, 23 May 2023 12:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1ROg-0000oS-Al; Tue, 23 May 2023 12:45:50 +0000
Received: by outflank-mailman (input) for mailman id 538476;
 Tue, 23 May 2023 12:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1ROf-0000oL-BM
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 12:45:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd465075-f967-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 14:45:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6905.eurprd04.prod.outlook.com (2603:10a6:10:113::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 12:45:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 12:45:43 +0000
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
X-Inumbo-ID: bd465075-f967-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myRCklZztdUdIkKBIKVeEbycdskxvrGYCMlqSIDOrASoPzjAcjY2J8NJGYftDe7XWDHuqXoXdqBocd88FAwX7JDcXqAaVQcpK/vBmEURwQb7yemV6qTjkjmbP1AOTit4410XEk+vcJqcDKPUHsEbmWHxVhXW53NriKwE0aHjFSieWlDBCpF3J+reOkCBPuZ2vy6XctMPoUpM59VvYpAJ1u38zqqL+9Y3iupPq7/3NDLQHgTdwEwtE35uSirDIuIEExk6JgPOjvAySqItGMETkZFcqJXMoXV50JwSea4QBiUjwFD/UX7Vrp/wBxrGUnbv/whS4Q3YRch6f+9JUq5BEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CXuBeXxOikOKFsNolVs99C2zsNvN7fyTTxA1WR2XbI=;
 b=Ws39qH2Kcu+bTxErxtDPF5kpCVvtN+ObfiCa/e78yK0JWN6hvSja5d5hbHW6djZUDxVCxroFxoXwQGVJVPdwa9AWci8BwGvC6lPlP7mAbI5QHGKyVjNtXTqhIpw8AVbdQOOCB6EecdzPAFkdewWz0knmpByDxTBvyiU+iGvdj3vchVf5xMyHavyzY89PEpbAE+s52MnxYhaccquWZf8cP1P90SwF5uQKigthNUwJ/4GAIICEnA2v77tIvrKg8fsczO/sZ8iIASTu7RfzVjybeHb9ZKWhXwBPliZtjLftxzhbirOePAy+n66U8Aw+hCxXAsfcUzV8X4nS2VDURndh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CXuBeXxOikOKFsNolVs99C2zsNvN7fyTTxA1WR2XbI=;
 b=McHh01lEH4fzXGt7CzmJLeYQo9p/smU5kfseFoT6UIKlrH6iKrz5yqKniQ1Q9sYBOZ/Br/yqWELkbJyFxT/0O329b/osyuqveW3iU4aEnUpcHa+mdok+EIZ6icwjVEsTw3vAUypGM1mPr4yRrQj0nIn+n4zpqxjfT1MhDknfgvWZ89ief+jvIsKy1yFSgqSwysSDCOWPRXgNV6ztBijwJvtYm37wX0ouo/ASrIR08jco8X2EL5eWG7croZskzzrpqjKthK+qE+r8aiGwPp2pIXV3fZfHa1tsAoxj1MwojLMmFeW27tlY4aOMfdOa3U8LIcKZNt4esFEllEfA8AhwIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <521a7bd6-b6b1-210d-aecc-38e6b42f379a@suse.com>
Date: Tue, 23 May 2023 14:45:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PVH Dom0 related UART failure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
 <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
 <818859a6-883a-81c0-1222-84c62ada3200@suse.com>
 <ZGycpaCkSvWecsuE@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZGycpaCkSvWecsuE@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b089bd9-e880-4b9d-2355-08db5b8b9f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8xk72SB5OpZza/ShbvdcRHjNYgzeV63T2UsCA56ih94S5TkQu2NJPj9zm0pQqvybzFUFufUxSCBX1uYR+uHpEKomCrqsE3n3N/CnJI1y1v+lbUf3QpAOiAeLHXWe8TLcJmJ1NDabYuj9R7Kt1lPDO2cnzmY5edmA0FT4AUt8bp8v8PF4FAempU8lfBAssa0Mf8ObIXt0T79ydulv1DsrDC00/2jQetpwlTKcoZMUNGLN2XCjTnVq5tJM/NL754R0eXofcjXRAHvk9uj1DMn9ZJiXqmOKxcVkvJhFnFYhkjpQd9K/tItmA26nYj7UcI4wygNBnqCIma7RXyfwcsYTnPFvDtBn2j0L7PNFSQuZXCF38eq3H33bVPspg1CN1xIws9IZd7v8zYvyNEL2a8lPXnjO6NGSeVNe0gRBgjnte3RnqS5ATadI2kHNJ16V8IcFr7Cv91RRmF85Ms/f6BvUNIgOPe48HdTnHHQTdW4/zCxZeM3Er+kBOPKCUFiuT7zmrivSItsriHaHM6UANNsfox74yGICvCbiCvTvVwsJSXEBvhSTLoOYgtnY+uVntG4SW2bV6vPINPxL2mJ6siZQz2Xw/2ZXh0AlDrxnbAP5A27TDw1xzRCchKoIZabsKlgB9DxFFAHG6nWi5byC1dqa8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199021)(186003)(26005)(6512007)(6506007)(53546011)(38100700002)(2906002)(2616005)(36756003)(83380400001)(316002)(86362001)(66946007)(66556008)(66476007)(4326008)(6916009)(966005)(41300700001)(6486002)(31686004)(478600001)(31696002)(8936002)(8676002)(5660300002)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0NyTjBRRDdPV1lxRzJURmhJR1JMc3UwSnBvT3ZmL0R3KzI2aEVMNXdxdlBu?=
 =?utf-8?B?cXVVRExJMkFiVFhhelorWUJFTkZZRTVaZ0RsVkpVaUlWazlWY0pTdzVrMjFQ?=
 =?utf-8?B?UjBqY2hGT00veVF6a1ZGYkxMcVF2Z3B4eWZ2aXI4S0V2ZGE3aTFWblE2Rjhk?=
 =?utf-8?B?M01RQXFTd01UK0JSc3BacnhqV2NtYWN2eUJQQ3dldGlnUzRXTDNhYlRhT0RJ?=
 =?utf-8?B?aWFFSWdNajVTc2tKaWNlOE9CdXhEbDdQRS9ybGQ0U1p2bEVTc0UyVXBoYUcx?=
 =?utf-8?B?em1ZUE9OVUZGbVZyS1dWdDI0Vk5haExBbUo0c1hHall0dHhhU1U0QWNZS1A4?=
 =?utf-8?B?YWZ6OG5FbmtlRDJXRzk1U2NZazhNUGZmaUlIUVl0Q1BFZnBUdXVwT3RjYlV6?=
 =?utf-8?B?VzdUVDlFM2JuTmZQZ2hGL3pZQkwybjdiTWhsUTFlVDdVa1hwSTNrbHNCNGgy?=
 =?utf-8?B?MTMwSVF5MFVwMUQwTVMrRmNiM2g1cWR6UGorRGl4b3EwVlZaVmlMZk5GaFVM?=
 =?utf-8?B?MWMzcmtxR1hyQlNDYytLOEFKS2NQMGU2Z2x4TEpiajVKYktOYlpIa3VOK3JG?=
 =?utf-8?B?bDk5bEpyK0xkN1FoUWdRaXg5M00xZ1VRMEdscnJFbHNwKzlwOFJoV1BPNGR4?=
 =?utf-8?B?d05uZFkwMGxpUHhEcTRYTGlyMXpndzk0NWVrMlhTTGZBZG9TUitIcHpYUmIy?=
 =?utf-8?B?eUx1NmE2WHZQVkYxWXRLWDR2Zk82ZUZjd3RkOTNiMUhXeEpYZy9xNzNZY0ha?=
 =?utf-8?B?dWNJQ2lHOVhNM1dJNDZYY3Y1UVEvV25GZThKQ3FYa1c4aHI5Q0ZsL1RSOG9x?=
 =?utf-8?B?ZDY0ckpXajkrdEVkb3g2dHRRVnQ5dVczUVdQeG82ak16LzNqMU44clYxcVVh?=
 =?utf-8?B?UlNxU0tnMDdxaHBUakJ2YVN5WGpQMTgzQ1M0VFIzYTlrSEFtWlJsb2RIWFMx?=
 =?utf-8?B?Uzh5VUJqOW9YalhGcHAzWnl6WVN5OVNmZ3R6b0J2cHJDb0tOZnRPMDRJTzBZ?=
 =?utf-8?B?S0VzM2lqT2JSYm93RXllWkJpYXJDbWRRa0JGNThkSStlZGlrSnAwZTRzV1BY?=
 =?utf-8?B?dGNUSkQyZ2FnM2FLQUI2d1R2SFZFUGM1Mkk0V1RYek1xd09kbHl5YjhES3lh?=
 =?utf-8?B?ZlEzV1h1Qzc0ek5zbXR5S2hXQmJUdHFUeWp1dkt5NVA2d2w5UUNQVnJOVStO?=
 =?utf-8?B?VnVJQkMvK0VHeERZVUJIdlNGNmJsa2hpdGVkTUpadWt3eHE5cHhkWjNFV0dG?=
 =?utf-8?B?ZkZFTkV2L3FjWm0zZWMxOFJkSjBUeEwwZFl0eGp1dVE0VTVyMmVsVWVyUUxq?=
 =?utf-8?B?bnRYRTV3WEFmNlNuN1Y1ZlJ4TVMvbEZKR21sa1kvK0lLMzc5VDhQNWlSWnVX?=
 =?utf-8?B?dldHWE4xZVozMmpqelB1ck9jdUtpb29kdWdVQm1jbWhwSm5Gb21jY0Zxcnp6?=
 =?utf-8?B?dkFkRG5vQ3ZiZ3V1bDNkc0QyMVBMRXQ5Y1M1Uk0vRmhBRkZ0ZkRLaU03Qk1t?=
 =?utf-8?B?VlRQOENycXRwUmZqcWthZDJuYTJPeU50eW1GQWVOR2lMV3ZPUkE3c0J2bk16?=
 =?utf-8?B?TnM1OHZmdENvSm9JVUwyZ0VTaDl6WElrSXdnaEpPQ2xvNHNCcnhrZzVQSFh4?=
 =?utf-8?B?UzlMSHR3MGZsVXRlZ1dtQWZIVnkwRzM5MkRNTUJ5bjlOSTZvckFpSk9ub3ZL?=
 =?utf-8?B?V0ZDbDVCUFRaOXdTTy83cEdvVEV3SXhOMEtzUy9zTlFqNEVROFRwU0hOSlV6?=
 =?utf-8?B?bFJ2QzB6bWI3TjRXU3FxWWtZY1N5MVIrbkpwR1pmR3hITUdyZDcwbTNQeWVt?=
 =?utf-8?B?OVh5NWFwVXpkd2dGYzJuNjlZWHl1VkZTa0NOQmFxMGRXZExvNVc2TVU2dFZx?=
 =?utf-8?B?cG5INVV2R1Y3cXdwUnVlMVJrU2ZhRldMbFBjbG5VMEJvNW9IYUNHbzUzMkFo?=
 =?utf-8?B?ZlRDaXBaazNacVNjRkxxYjNLQ1ZNRTltNFhTZHRaUEI5TnU3RnpqOFduTEsy?=
 =?utf-8?B?NzR1ZG9hWURMenI0bWREcVNvR3JzbFVKdUNxZlBBcGVRRldzbGNmZkVKWDFt?=
 =?utf-8?B?cG8wMXloYmlsVkdVQUN4bEpSOUNqMjdTT043ajd2eGtDaHNZbS90RTFURVRL?=
 =?utf-8?Q?ENxqYEtbjtzn9xxEQWWMd1OrQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b089bd9-e880-4b9d-2355-08db5b8b9f0b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:45:43.4512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQp+xJh6ZtX6hUzQsZXJ/vJmPhZQmd8Oh6PEYKwaeMHF8MsA7KWoiJmmRoUt2CHJuxw0aX9PK8oaxZ0LfqMLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6905

On 23.05.2023 12:59, Roger Pau Monné wrote:
> On Tue, May 23, 2023 at 08:44:48AM +0200, Jan Beulich wrote:
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
> 
> For r/o devices there should be no need of vPCI handlers, reading the
> config space of such devices can be done directly.
> 
> There's some work to be done for hidden devices, as for those dom0 has
> write access to the config space and thus needs vPCI to be setup
> properly.

But then isn't it going to complicate things when dealing with r/o and
hidden devices differently?

> The change to modify_bars() in order to handle devices without vpci
> populated is a bugfix, as it's already possible to have devices
> assigned to a domain that don't have vpci setup, if the call to
> vpci_add_handlers() in setup_one_hwdom_device() fails.  That one could
> go in separately of the rest of the work in order to enable support
> for hidden devices.

You saying "assigned to a domain" makes this sound more problematic
than it probably is: If it really was any domain other than Dom0, I
think there would be a security concern. Yet even for Dom0 I wonder
what good can come out of there not being proper vPCI setup for a
device.

Jan

