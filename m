Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE186B8B6E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 07:42:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509469.785270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyMg-00083K-BP; Tue, 14 Mar 2023 06:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509469.785270; Tue, 14 Mar 2023 06:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyMg-0007zu-7d; Tue, 14 Mar 2023 06:42:30 +0000
Received: by outflank-mailman (input) for mailman id 509469;
 Tue, 14 Mar 2023 06:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbyMe-0007zm-KF
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 06:42:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62390755-c233-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 07:42:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.27; Tue, 14 Mar
 2023 06:42:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:42:23 +0000
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
X-Inumbo-ID: 62390755-c233-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cb8C4OzyR74/Y8kbfahXA31iu/U49MmvCLvpbeoqhmTL2IpWJli5Y0qBNMOAAU7PDbZ9pxH6q5vDo4WsV29JbE5fv8sFSMFhHw2sQRTES0uggKgW19RxUc9LYml5X3avh6Mjoy+1mR+eyZSdzmhwMtukFUUoFEDKQB+sXg8rNLcArxVVwLG0vsR85OhsMxTAO55TAVtny7b/uovc61YzYMsIC1d3iRI93bQui93Dis9DSoOt0tJsRE+Sz9fUlXWbL2Mi9gCdAi1WkCv47LBwxh/Cm9G8rBh02OGcHnoyspA5nxWgqmafwRfqNj27BG360MBN/YqFzntXv8UpRSfCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3od9EZp4+IyK5ciI03zGk6lNbxFsEepojwdTrREDVns=;
 b=VGYH5KL5bkqlRKZEG9I4GxFtFum5sGIP6metTTdj09m27Y0rskRj+QhiIlZAUTOBnfx/jiRpEpepWXalOptr/IGn+KdDUhEcie5fIiOopxskBuYcsH52KAbr2sR1VeOvx0SUoJegT+6OlztHXG7bXSDsRLmeN/N1HJY2TK0YWf0JzdQirLu9Oqi1U7HNJEjpfsZqPG+M+FisM0/s/JQF7QitS9B/txCHxCbiosjvuwm7q6RgRKFoM40Orwx83P3YTxBYQxp2Q55iOdwJ7DPBGYHCX4OEI45BHNZPZq3BhIzNT3TvrgDMgo46LJB44WqlLkaS2cwj3s8PuC4ngVxGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3od9EZp4+IyK5ciI03zGk6lNbxFsEepojwdTrREDVns=;
 b=Qf/yUHV6s3YR00Om7OXERq7e1iGKolud2oMm27iLjKv36tElS7LXqDMpBg/HCsNkKdoCrjJ9B/1/Urc5POKRPTgAfWZc+g4PRtk7jdeNGFFcZgp+7/39vIC9dZ592jsqXG/LKMYt4iDvGH/uVw3KDjHZELSbO3xp4jG1ZLY5+9ZSXV4F+PmMytruxk+wla3sgFn78r9DT50Ebskvp6VJ0E9z6KjwI7dz0QXFeqnsO3abr+dcn7nE3r62JJDzYGEZyNsCvEqTyg4fctIAg/suZU4JXvez4uumQB8M8CjXl/39sh1PPsiYLfd6AYlHCtHkoBJsPdb/EuUFyPIWdNyYcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52c04d0b-2b30-ffc5-fe5f-72a182abfee7@suse.com>
Date: Tue, 14 Mar 2023 07:42:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
Content-Language: en-US
To: "dpsmith.dev" <dpsmith.dev@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20230313175047.20719-1-jandryuk@gmail.com>
 <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
 <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
 <d17d7b39-28ce-55a6-8d2b-fe2dfd10c38d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d17d7b39-28ce-55a6-8d2b-fe2dfd10c38d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b712c5-013b-4536-65a5-08db245744a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WnsAri54ga/x0LpWsYAglobILFqAzFFHoJu4Bhm2fLFiNQf9BYtkPnjnDOJkPp6YlmFh+g4QrViQyl1OHz+VBVFae68lelS0w1Ant7SW2RvKzRVAB2+w76NG5zQthnxpTepY6zcy6UoItm6D0/15UmB7+pDMGiFlSqeQBvIek+fpYB/Y3IQJToF7mPPmvEUfh4ewrTJTGF9NM41WsyULsh3xJcfXCf0PjzNnot8JM6z5igl6ngV/EI9AAxT0YblGuyRxq4eGehTjeEd0gOnnnZwynfHcnfKYA+osKitjysGqq1GVhSLyGrfH9WeToYQJdiHpptmU60+UkthZi+tlubSzpqvKGS1In+/5PU0H9S4K9JD14zaMPDvg7Kc+AcYonoYM+4N9MXrAyBIvGEDJWo4b9l/cgodFLvBX8GbFev0PREbvTRPNNR0qoQCOyuVDG/g53Gsu4utL+U1eYI+uVTE5giix8KRFmFq9zadzVxP9LFTroe+6VLcxhFTE7g9Gt49qyeMbKNi/YE+2TIS3ELACWD2NzwEjVBjLcc4mxzwkxN6+O5Nh6Ixe8YZZhkS8t9pnKZYN5HAdJM3+YFgtAAgzxKR5SV4+r/EIvBrg6sF8rPFZZLGcgTn7/hs/TzpnHcF80Xn8C/zX/TRKbtut+cXY4XpRUdNZDDbtFhuoqf1qnf15gCT5hxDFkjC5aEpus0r7IjX6NaFe1ylFdnB6PIqGC4u9+wSfIdG/UzO6IE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199018)(86362001)(31696002)(478600001)(5660300002)(2616005)(36756003)(6486002)(2906002)(186003)(53546011)(6506007)(6512007)(41300700001)(38100700002)(4326008)(31686004)(6916009)(66476007)(66946007)(66556008)(8676002)(8936002)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNsVE5ScEZ6T0NhVWs2S3VNVk5KY1I2dmkwMkNaL1B3Y1VzNmY3a1JDSHBl?=
 =?utf-8?B?R3R4eVdyS0JEK241cHplNTFQZkdKZTFqdnNlSVFDUkk3MTBXd1J1TFYvRlRr?=
 =?utf-8?B?c3F5a084SlNHUkdQMTkycmlGM0NCUUZPaFZMRldJZ3VMeUZWWmVXZE9uMXBP?=
 =?utf-8?B?bjlMQ3NpeUtOODBqa2RMdStzaVRiZXViY1dUcjEwMjlzdFYwRnpSQURBL1RP?=
 =?utf-8?B?dFdUUDJPMi9hNXZlaDF0Qit1dXBHYXdsaHFwUjZhTXpYV2JPSTRpS3U3K3NP?=
 =?utf-8?B?TG5pNy9yMEs1Wno3RGRaZHJqWHYybUc5YkJVUnFaY29oTzMvRVNIZ2p2RHZO?=
 =?utf-8?B?dnlqUkVKTW5ydWxWU2RXUjd2U3BmdXdWWXpBUHRiVDFrZ3pWdEpaSEhOUnUw?=
 =?utf-8?B?RjEybWsyN3lDMWtlNGIxV2JpdTZBSDFYSko5ZlIzUElpcksvbDZyUk5nQk5w?=
 =?utf-8?B?a1oyWFhGL2VZSmpmaUxIbmZ1aXBQYS83SUNORlQzdWVnQWIyck9vdkRZeW1U?=
 =?utf-8?B?U3FQOUdHRGNEaVRxTlpNSVZwSzhSL0tvNnFoa3lXMXZSY09KQXVhbHdQclI4?=
 =?utf-8?B?VFpwZFRSczdIOStNaWVVS3cxcU9mQjNKNVRHUWIyRmp2QXdDeEdnNmNGb1lk?=
 =?utf-8?B?OWM4L0NXVEJZeW44WG5xd1hwSXczWUlyQ25YdjVIM3d2ODRYOWFwR09oNkt2?=
 =?utf-8?B?NTBvS1hQN0pSQnh2RDdlaTNLbUZLR01HYkwxZFV2b1dHZkJ6YzdrWnJ0ZEpQ?=
 =?utf-8?B?ZG9BUmFFTDdXcm1TdkdBMURyOWJnR0kwN1ZiZTBENmlLTUJrM0tuUkJ4ajd5?=
 =?utf-8?B?V3hLUEJ2djZZcjc4ckg5eHVYQ002QTZITHZHVmU3OHE2ZFYzcnYzdm1yYUVC?=
 =?utf-8?B?NVM3Rjh0ZlNWczcxdDlYQzFDOHZ4YnhDYzNSWCtZSUpNeDVuRnlJek00Q2tr?=
 =?utf-8?B?T3ZUc3BrdzdLTGRXT0puNFZxT2Q0R1dDWTRMaVFLTDdhclZ2elY3NWNCZW1x?=
 =?utf-8?B?WTNLZnRFN3VkWjZWN2JwTEN2VExxcGdOT3NGMStaYjFjQ04xcUtZSEFBWk9h?=
 =?utf-8?B?MjdHUlcrSXNEc1BHcnJLM1pYRkFVc1k0ZlJXR0dpZldKMWJrWWJTZGZ5SXgz?=
 =?utf-8?B?cytHdFB5SjRsdXk0Q0dBQi80c01McmdWY3FWd3NrNU1lY0VtM1piYTdkRFp0?=
 =?utf-8?B?eTF3Rk5FT0VjZHc0R3FQV1dyZDdCQ0krODFIZW1Cc3htWTRVdVhNVTRHVkNv?=
 =?utf-8?B?RThPMzkxZm9Vem16VUY2YVhVdWJHS1hTbjVXYTdIK3F3OThYcDBaWDVReG11?=
 =?utf-8?B?OWNyRFhoeEVTenN4THhtTmpiYXpDU3RQYlNTMUs3NzQ1S09OL1FNaVFicngw?=
 =?utf-8?B?Z0o5M2ZWTmg3NDJPWmlET1BJWldnMmFmZVQwRzJxYW5YcDJWOXNJVkVTTmR4?=
 =?utf-8?B?c2lGNzhiaU9UL0IxaDN6bE4zN0V6ZmlDVERaS1BYS2wyYWYzQnZnRXc1WWls?=
 =?utf-8?B?d0xmUU5NK0xZMStsRHpRVXdnZm8xSEU0d2tUaVVld0ZzRFVlaURkYVZSVDNM?=
 =?utf-8?B?LytMVnZESDFkU01Zdkx1cktGSjdXODNUWU8ybHRJeUhyTm15emRoZ1YvU3d0?=
 =?utf-8?B?cXB3TVlVWFI0blZjaWxDZEdEVGJ2S0hwM2tPUzI4aUhrSmd4U1RiYzJTOE9G?=
 =?utf-8?B?ek5vQXVqZmFGVnQ3UW52T1J4WHFPR09CS2FIenVPZnp6d1VML1ZQcDhBYmk0?=
 =?utf-8?B?OExFSjlkOS9oRmwwUmg5d1J2UUoxWng1MXE0dnNLc2p1aVJYM2lmRTNIZXpt?=
 =?utf-8?B?dk1yemI4NnRydkswWVBrRHdkMzlKSldlSkoxVUNFdk5jNm9SdVBlMFV1bGZv?=
 =?utf-8?B?a1FkRk05dmpKSzVSWDMxNjMvZ0lLV1BON2pTcEhUeWcwREFDNjZmQ1Jkejds?=
 =?utf-8?B?M2JxMjlXSEpORmU2bGtQMUxCcmxvQmY4TkgwL2o0L2MvMi90ZHhHY1JWNEtK?=
 =?utf-8?B?amhtOGlhekF0NWs0dStEVlY5cFI0bVhHS1hFZFNKNXRqMm41V2FmeEJUUkk4?=
 =?utf-8?B?NGJWSllIbzNHZ1dwRVEreWhTVTdOaU1QQjVxMWY4MDlGVWJHT0xZRzE5VjBE?=
 =?utf-8?B?TFJrdS9OYUVEMFdIZGpIV2d3MndSdkkwbUUxSG5NTGdzRUVvanVYMjZrT3l3?=
 =?utf-8?Q?4YC1Ow1yQ85opw81r2c9CrKgHpX5bqEJ2lAfV879IPwS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b712c5-013b-4536-65a5-08db245744a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:42:23.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07xT9dGqi/BMVPr0Jzqj6/tNdCCtel8/Gk2yopxYY7bKinG+ZO5o8nAC2P32uGrhAOrnf9A9NqwkvKPxUXn1Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404

On 13.03.2023 22:11, dpsmith.dev wrote:
> On 3/13/23 15:14, Jason Andryuk wrote:
>> On Mon, Mar 13, 2023 at 2:49 PM Daniel P. Smith
>> <dpsmith@apertussolutions.com> wrote:
>>> On 3/13/23 13:50, Jason Andryuk wrote:
>>>>                usage(argCnt, argv);
>>>>
>>>> +     if (argCnt == 4) {
>>>> +         pirq_label = argv[3];
>>>> +     } else {
>>>> +         pirq_label = argv[2];
>>>> +     }
>>>> +
>>>
>>> style nit: space inside parens and curly brackets could be dropped or
>>> should be moved to their own lines.
>>
>> This file doesn't follow Xen style.  I think dropping the curly braces
>> is fine, but the lack of spaces 'if (argCnt == 4)' should stay for
>> consistency.  Does that sound okay?
>>
> 
> Hmm, I thought there was interest in getting everything in tree consistent, maybe I am mistaken. I am not hard pressed to enforce the style. Unless someone else objects, I am good with your proposal.

The rule of thumb is that if a file is (largely) consistent in itself,
then that style is preferred over introducing a mix. (I haven't checked
this specific file, though.) The same may or may not apply to individual
functions within a file; there it's more likely to be considered one way
or the other on a case by case basis.

Jan

