Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB341C0BC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198844.352551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVV5A-00041j-Rd; Wed, 29 Sep 2021 08:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198844.352551; Wed, 29 Sep 2021 08:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVV5A-0003zw-OM; Wed, 29 Sep 2021 08:36:52 +0000
Received: by outflank-mailman (input) for mailman id 198844;
 Wed, 29 Sep 2021 08:36:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVV59-0003zq-5x
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:36:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fee0070-9d55-4b7d-9212-0d67028e1410;
 Wed, 29 Sep 2021 08:36:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-uAHHky32PAK0QKTLJBJ9JQ-1; Wed, 29 Sep 2021 10:36:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 08:36:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:36:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0018.eurprd07.prod.outlook.com (2603:10a6:203:51::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Wed, 29 Sep 2021 08:36:44 +0000
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
X-Inumbo-ID: 7fee0070-9d55-4b7d-9212-0d67028e1410
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632904609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oefe4BjwUZx0knaWRCIB7JYsRVkYHVMnovphYg5Xm0A=;
	b=lSb5O3kvBqi1jGfHaovQq+wZbcFMfzAoPXp9/G/ta2YAoJGx2u80WpC88NtGCab5SQrVbd
	FsuA8sFzUtPetQfkFx0KLCIKsUdZJc6B46FzpFbRfpfn0aDeZuNam8hXeDtpBxO4rQfsNX
	4UaaTLmNGWMTTF22pJQsaqqRdShuf38=
X-MC-Unique: uAHHky32PAK0QKTLJBJ9JQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5jiwILP65IbWKx8pwshEGoNLnkfXTbi0UdJyxD/IdGP2qiD4wf3bNQCb8+vTvlvHYJDdD7q/Jir7Z9z7SiXSTgUk780IX1rAZXIiZfqD+zw0t5cr3v4Ima0whaWdQQm+fA7L5ue38XifoSp8ESthtlnEoKvc0VnLX96/GtOtNgArkGfoGGl7nzVQsQMhQr2UXTwYbyS1ODnQHypPPHeSAYHk2G6uBM9/xzZRlHljG+Jg+vSgYCiqiwBu/LGH4+BNOYBxWDFywll2D8QLD0QjhG/qcQGpSw3J8oHDFaY0jfhKgqnm3bL+Spt/bldq3Q4gKtbDAA7/HJob1o+DD4V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oefe4BjwUZx0knaWRCIB7JYsRVkYHVMnovphYg5Xm0A=;
 b=KVlZFZ+vYr+z+sq2BXL8RY87n3QCXWkF9Odt1+3ESvjjkuC06v7vf2wY7EtkLaqporuL5MsiybjS7NcfxJXApf+TXhbFWe1zNKk9YrmhNhaC7UbzYU8GmTpT0Izy3ixXFi+xYamD2Et0q/XE70kTJ7et3E62zs3rHABMcZgJYyp441osDMZj7HUswnP2kL7EN7Ob+zoOSYzIagkyoYGfdx0f3L83+qLP4ddeU1v25FFsy9wJY50ALwWPouNFB9XY+O0tDdO789wFYGUR1VVIRPjcVMFLzrHxd9sOpYtKOZjW0HE5Eu53CclE6MQhFo8VayesmcXNS65eP4370+HXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@arm.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-8-andr2000@gmail.com>
 <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
 <f59b48fd-564e-64f8-1422-fb842957f213@suse.com>
 <7ae0fad7-499b-1bda-5c9e-9313265abf8c@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30b8c6b8-5dc4-6972-eaf9-76024f7e97bb@suse.com>
Date: Wed, 29 Sep 2021 10:36:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <7ae0fad7-499b-1bda-5c9e-9313265abf8c@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0018.eurprd07.prod.outlook.com
 (2603:10a6:203:51::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe340dc-626d-4a06-de93-08d9832444f7
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29583B5C45F805552AA0BCE1B3A99@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4PxWfZJ3bXArex3/TFO7w+sY0J6PGldPH+KzuB2s+bUTdHwRYnA37p+PEUda5dPUwciyWcDA6Vdjr4fzYfO4DG7cZrp06oionAziGXCJmMDU7JC/8s8dxTF/eELeXZWV5eFg79ISX+uksg2WtjcIsAIk4kL+q/uiuGfFMiQnQ7JX8X780cNhbQC5b4lpg+NKA0sNVgG2qlnpkHrpF4eGUWyuLQm5lf/q10f2/EKLd8yImEYYDEhqNgnfwtfKsZx4XDBXryr3ThF9Obhtpomr7msxtu8C9F66LgAS9EvGm4AMZEgr9ujUHqMNmReV48j/tRFKhmngQd3KLykG/2TIvmxevZXCpQqB1Xf09X155nUECW6/bkNlkWIlwJEzFOm7/Dx5994XVwEcpVOAkfjrozg2wMCzz8onceKPCgHAAHGvig9o/schq+YvYwL8SYYhF0XUX9EQoTp6AkHed8ddrATkxM4ccqlnoLCCXgEU+MAI9p6aAQeadNKirDyDZml6FNJFtDCCfLE0qBw6gBv3rcJ8x5bRfNM8nstaY1xxrYKhy5jcYri/U45HFutz+gyZk5Y8FMUFyqFQ33FL90Lq5yhdTDZODryZH5s2sn5LZm+yzgi+Ont6ffdhb35F0WxlaUqatJQsBQKu1j8Ctq5qL6eDA52OM+0zVZPWUuXEk25y1DPP/GWL72lW+PORHzqJjl9HBR7f4g5P3zXwYj6kwMRIIE84YkYDHaaF2wVrUu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(26005)(508600001)(54906003)(316002)(186003)(2906002)(66556008)(16576012)(53546011)(66946007)(66476007)(31686004)(8676002)(2616005)(956004)(5660300002)(7416002)(86362001)(31696002)(38100700002)(6486002)(4326008)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzNTbFlKUUhmY01teVRUNmh0ZkhLN3JieGl3bWdPSDk4S1l6Z2p3MVBqR3RU?=
 =?utf-8?B?aU53ZndpQUlPM1ppSjl1cWNLT1JWeUFKZUhzZVYwVC9aSTdZNVQzbU4xK0xQ?=
 =?utf-8?B?UkRvdTB1bnl5TzErcnd4MUsxL0M1MGQ4NU56dVJISll4NHU4Sm1KWVFTNi90?=
 =?utf-8?B?NTF1b010Y1pQQ2JwOW85aTA1NGpaSkZaWWNaMkF1OWJFM3kycUo2eVZKWGQr?=
 =?utf-8?B?Z0NlYTBVTUhjdzlFY0tsZGFGY3Y0ZW8vYmU4QWprTFo0VHBiVkl5WXFnY0Fw?=
 =?utf-8?B?TXd4Wlp2VnpzcWRHc1ZEZnpFejJRSlZFakx6eEhCaXpvd1pKYnV5QjVtZnRo?=
 =?utf-8?B?aURWNHpZUVJhU3pTa1Yva01qaUMrNmk2cTByajlERjVvRU9vNGYvbnQ1M2NH?=
 =?utf-8?B?R1R2elJya3FCajRTMVlsM3ZSa1BpYVg1dXQxRnR4bmJJRGNCVm1VbWJkZUNz?=
 =?utf-8?B?N3E0Wk5LNnR3Mk1LR2tQcHUxVkM1Z25QcmwzYjJqb0hCZnhnQ1VTTGhhazQ3?=
 =?utf-8?B?amVma0NlUEExeWgvTFI5cUxkRVdRczkyQzhtd01ZL3ZtcmwzNTNMdTFNaWpF?=
 =?utf-8?B?YWdvak5zTHlLR1FVSlU4MmJsMnpScW5RNi9Sb0FlZ1ZrVmNXMllBcXB2aDVK?=
 =?utf-8?B?S1cxQ0FqcEs0SE1rbW92dHphVHF5S3F3UGxrOUF6T1VQWndzWVo5cmtBSlhK?=
 =?utf-8?B?a2Z4cDFtT284YkdKZWlTNnlYOXZWZldGWWZMd0hPcEdtRXhRZ3Fhc04xcnJx?=
 =?utf-8?B?Tzh4dWhWbmxqSVRyejJRd29OcE1lemRXakwzcHNqcmVkdEQxTEhoQVRjRTZT?=
 =?utf-8?B?TS95elN4NzAwUHdkbVlPV293bnc4RGRZS1R0dU1SaGNobGdnSlBPMzBSMFp3?=
 =?utf-8?B?ajNiQm5Cby9sT0RwUlZuaU1XS1pYS2VPMVNvVXpDdWVteVd3eHZVN1JFNFZh?=
 =?utf-8?B?dk5mK2d4ZGN0bUhKVXZEaTE3VW8xWlAxVGh3RzZveGhsNWgwRWo0Ni9aVFdR?=
 =?utf-8?B?UTVIOWdRZWN1dVBNZWFlKzJnOWN1bDF2d2ZkWS80RlNVeWxXQ0xXSmVoZEVY?=
 =?utf-8?B?VXB4YjBucmFDN1h0ay81a05RdVEwc2h0ZEg4T1J3R1NDeU9jOEpnZlE4ZGtv?=
 =?utf-8?B?QWkyMSs0VFMwS3o3T1FXc2NtbkFXa25qMXRzWG4yZ21rSmgwZlEwb2EzOVh4?=
 =?utf-8?B?bFNSSzdPVlZ1dlJ0T1JwNmlWNzY3Y1EzSDNnd1VOaGVGRHdGVzFxSXhXZVZY?=
 =?utf-8?B?SXpLZVdEWVZpSEpMbUdQejFYaSt0amdDc1dDOUpFcEpKU2tkb1JpcWxyK3FI?=
 =?utf-8?B?dHJhMUoyYVpqZWxZVHhSUVUzeW9MaFBTeGxwTVJhUlRIaFpKK3VlaXpuUDNr?=
 =?utf-8?B?ZDhtUUtOY3RpaEZpRWlQTmRySklwSWdlM2xleFdFRU0yMDFESm01V3BvVzR0?=
 =?utf-8?B?cVk1NitpMFFQWVVWRkdPQmo3NUJIYk9JSEJmZXRVREp1SHpJTWdqeThKQ2tP?=
 =?utf-8?B?OGVwSmV0cEl5N0VVdUdEZys4MHMyUmFVbCtIZGZvTFVxZTV3c3Ezc3Z5bXBs?=
 =?utf-8?B?cklYSXRxOG4zb0djQTFUVzk0cFJJN1ZnU3M2bTNXMnhjcWhZSzU5VzR5a3NM?=
 =?utf-8?B?K0xWYlY1bVJzMVNvc2VyK3VFd2RMREVHRkVxajFieDlYN1p2WlFkUW5NcHMv?=
 =?utf-8?B?dER3WmlkM1I0YTFuSkpsd2IxSXN5cFdsOUtJTnNNbDZ5cTlYRUVZdEhuODNU?=
 =?utf-8?Q?ZyZK943AuJ33T07FqpdqwW34PLe5hASecqwjGcu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe340dc-626d-4a06-de93-08d9832444f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:36:45.0161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5fp8ysXILXGoPHEVfdCgOpZYzrG5ya/dqXU3Qf1gYYslLzseyC3EHyytNivVh9Lbs9/1XVkphgdWiHWGrwHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 29.09.2021 10:24, Oleksandr Andrushchenko wrote:
> 
> On 29.09.21 11:16, Jan Beulich wrote:
>> On 29.09.2021 10:13, Michal Orzel wrote:
>>> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>>>> @@ -149,6 +172,10 @@ bool vpci_process_pending(struct vcpu *v)
>>>>               if ( !bar->mem )
>>>>                   continue;
>>>>   
>>>> +            data.start_gfn = is_hardware_domain(v->vpci.pdev->domain) ?
>>>> +                _gfn(PFN_DOWN(bar->addr)) :
>>>> +                _gfn(PFN_DOWN(bar->guest_addr));
>>> I believe this would look better with the following alignment:
>>> data.start_gfn = is_hardware_domain(v->vpci.pdev->domain)
>>>                   ? _gfn(PFN_DOWN(bar->addr))
>>>                   : _gfn(PFN_DOWN(bar->guest_addr));
>> FWIW I agree, yet personally I think the conditional operator here
>> even wants to move inside the _gfn(PFN_DOWN()).
> 
> I can do it as well:
> 
> data.start_gfn = _gfn(PFN_DOWN(is_hardware_domain(v->vpci.pdev->domain) ? bar->addr : bar->guest_addr))
> But, help me please breaking it into multiline with 80 chars respected

Besides the option of latching v->vpci.pdev->domain or
is_hardware_domain(v->vpci.pdev->domain) into a helper variable,

            data.start_gfn =
                 _gfn(PFN_DOWN(is_hardware_domain(v->vpci.pdev->domain)
                               ? bar->addr : bar->guest_addr));

or

            data.start_gfn =
                 _gfn(PFN_DOWN(is_hardware_domain(v->vpci.pdev->domain)
                               ? bar->addr
                               : bar->guest_addr));

Jan


