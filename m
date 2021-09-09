Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F84048B0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182975.330867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHZu-000241-Pr; Thu, 09 Sep 2021 10:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182975.330867; Thu, 09 Sep 2021 10:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHZu-00020u-MQ; Thu, 09 Sep 2021 10:46:46 +0000
Received: by outflank-mailman (input) for mailman id 182975;
 Thu, 09 Sep 2021 10:46:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOHZt-00020o-Fp
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:46:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38b91a94-115b-11ec-b1ac-12813bfff9fa;
 Thu, 09 Sep 2021 10:46:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-4NOy8kZ6O7uNGPQyT0jnrw-1; Thu, 09 Sep 2021 12:46:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 10:46:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 10:46:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Thu, 9 Sep 2021 10:46:38 +0000
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
X-Inumbo-ID: 38b91a94-115b-11ec-b1ac-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631184403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7Bg3vCyvgNq5aTvh4vWrEklP+4G2UUCw/LFvFruh60=;
	b=U2un77uHAgwZfD3uOr2ISI3T/fNJrkOtdPQdwrqshuaCD+3SBGaYYF6GrwpVkhHNB9aR7u
	NBQuWQmSERFZTlu0A9VAjThN/GfK96665EUJnJGXIo0jnilAypt4RBMZEty+w17omgv+SH
	ViGzw5CUM6xW96u1FKZRmkHutQtrkFY=
X-MC-Unique: 4NOy8kZ6O7uNGPQyT0jnrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htL6uxm7y4QqH0mttZRUTldqQVo28BjihUn9+r1QMZTfyHctBD7PJeVszH/F1q/RoTOoJX4U7Ed7WUBnxS8lVXauoGXq4Qi1gwES1UuSd7bOJSq9Ai6Nrj6c/RXxMQCa6lRrzRHK3ThjTT7E1D4aoBnVL8hM/yN4khij5oinGlAj6zgnl1wShpRpz6lMw/zM1ccLVtMMfLjZM5PK7OzIiu1pJdj7N2ix1EpUu8fd0M3WIMIwfdt9jSSXQ5xljor00Kg88fMjB/39hWqjGPBT8/ZK9LeWGh+YoKvVnB26Ylqf+/lkw0zRVXz3ut/IKIcotlfXQaKttLjrLEmEsmD0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=k7Bg3vCyvgNq5aTvh4vWrEklP+4G2UUCw/LFvFruh60=;
 b=NUwp+8SCNkoPUJTg1pZUJX4InU9LzHklzH116FQR7Zzg3hoBGMcH2ycvoVXm8cuasfLDKdsovdXSpKCnYvM2X7ggEq0gX7Nau7X9hsL80+fIScn+g5T3bTLWDjoP6aTrwUXdiU7wc1EcL3oyYmIzL9gmKH2QyxPcivyTtzAKXoT3g9ZXUluVePdLIVgSj9N8q6GRwv2/DRxad+BPHxSUEqkDE/Xti8LkfaziPie+xw/KRfMdX0MMQWU1JAP6euWJ+NHpCWGFRdR6L287TK53flbymuH73A6dSfyG2H6jdzADh7/lEYd3BMi/riAhGFSba+mQCK/C3IeGXjRaE8TTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
 <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
 <422a6543-ec2e-0793-3db5-09456e04f65b@suse.com>
 <dfb66ff2-9c9e-645f-4789-2dc6c21ff751@epam.com>
 <27043082-bf9f-5bba-f5a0-bb0e10426aba@suse.com>
 <e154e4f7-bd60-2645-1ce5-1c2b5404236f@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e7dc9f3-1536-0643-b732-4a203bee34d4@suse.com>
Date: Thu, 9 Sep 2021 12:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e154e4f7-bd60-2645-1ce5-1c2b5404236f@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1efae6b8-6a56-48c1-f482-08d9737f1a7a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176DBC542709042C7194A01B3D59@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r0SHdz8f27u6menU2hsGB0VV0twuKdAh1g6wUqP4zePxw+/WNpKrt3RdzzfeTz/J3NMuhkNY7h+I9XDnAo/l6m6iYsdGJ/ILtxwtDGdKLZzsdXCrCNjnmQI5ZqHqhsw2LPDX2rAuXvVbRsp9jiBiApEwn7HBLSG41qzGaYEbrNAiF0Bjs6bAqTc66CsITRfJebgmjTngQHZLVUfZCBo62NG1/A42Ene5KuOCH2On8yLJ9Mmrbsv2uUIkMbTlAtlaPHjFRbbm4qZITYZqpGRFCJM3HgVNPQIr9ByL70pNX+BabbbMpSwM8fWBmAdV+oFu9aV9qyjb9jFgiqfKGcJOOOZIOHfz71EP3S9RvOR1vs3XM0N+21TIcrjNJKQMkS3sjSi6u89LjUDfSJZOkudPSXFWFd8yOrJjcV1hmtZupVOvUQ01LRi0ftF7K6Vh9cgQRX33XzATGOL8TX2VSazYbGUdjYE1BaJcLPgZcIvQfeV9xit+/78UbE67AJwxZkHRV1fzIbKg27+x4JkvVyxT/eJ69UWF+8/7vIWVrOFtc4r0rywdau3r/INj/fg5v+bQPA8s9QvCBMt4ltu/FnIdipZihPPkhh78CqODqHxLEotQQxEKbymgIUr4uoUYhk0dR7xbLxrEhwSqWicr1Dm3NSxqSZ1XMB46ZqtQopXcj0S7rEioHMk0aVKfUvTjb61b8LB8Wk57gg/dtrT5q3IpKdTojcJWvIenTj8JrX9uPfb+eTJiWC8/PuFVTZ8TKqOT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(366004)(346002)(136003)(110136005)(54906003)(83380400001)(316002)(16576012)(36756003)(86362001)(31696002)(7416002)(31686004)(38100700002)(4326008)(53546011)(8936002)(186003)(26005)(5660300002)(8676002)(66476007)(66556008)(956004)(66946007)(2616005)(2906002)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3FWbGh6azBhWFpoWTRVVFJnOWZVK2NiTzhiM3VqTzVKZEVzZllueFZPaGFP?=
 =?utf-8?B?dGZHUzZ0Rk93MU9WZEV6SVNJeUJaQ2g4Z2c0NFNnV2VrQU9mUHE1elJIRGtF?=
 =?utf-8?B?LzE5MzRQMFpoa3Y4bVluSEQ2ZGV2bDhnRDFHQ1lSdmNrSGJ4dTlsMEpkREd3?=
 =?utf-8?B?V2F0N01yR3Z0SHl2OTZtVit2YUxzSTBxcWg2enpKajhzOHJRQkJSVjJDTnp1?=
 =?utf-8?B?UUwvWmhCZ1Y0THpwL3VUeE52djAxL0tsTnlIdXRRak5WMXQxbjBpYWF0Q2Nl?=
 =?utf-8?B?WDNaYXJMZlI1S3VkcXNDMnZtc0VNaEFjSHBLR29MM0FVazVrU1JDM1R0MU1m?=
 =?utf-8?B?NERhNXUxN3IzRXpYZnBLKy8yTDNmbFRFUE4rdjVkTkw2SzFDSVE5ZkVJNnJ6?=
 =?utf-8?B?aGhuUXlrUm1ENmtUcng1aS9iR25hSHdzLys1Q01IdDJ5K0lydUV5MGhsUkZ2?=
 =?utf-8?B?U0tZZENyN3JkL3ZacExXdnczdEd6Y0d2SjM4eGQydlNrTlp2YTkzd3NTYnBD?=
 =?utf-8?B?eDJLV1VqTXlINWVHbVd0STExbithelgzZ0pmMmtwRE1DZE1YV0NjdU9mQmpT?=
 =?utf-8?B?b1Vrb0tFVVV5RzZjcGVjYXhWdlp3YW1tdXIxOFhwUXhLUHRpSk03eGFVNms5?=
 =?utf-8?B?aG9iUldzN1VWdkFtODFYaWNHaWVmUURid3h3OS9uMkRuNmM4MFFobVordVp1?=
 =?utf-8?B?UWs2YUVVZWY4SGZRbk14K0hreHhwWjRpL0ZXYTBqRXdycnp5Y2tBYXdMUXZw?=
 =?utf-8?B?cENsSUF4Tzd5OXYxSUtKL1I2b0x1cXRPK1RZTG1vTWt0Z1ZsREJhRTZISmhF?=
 =?utf-8?B?NnM2Z0xCaUl2TE83TFdpVDRxWHdBZ3AzSGVkclFNTGRMUkJKb2xnU21NeC9l?=
 =?utf-8?B?TlFPTnY5eXQwdXNFVjNoL1pQaTlqM01ZSEd4NFQrU0lFZ3A3bjZsQWdDVUNG?=
 =?utf-8?B?UGkyUFNxcjNpNkdaVXZEOUVvOUZhSkF2OU5qVU4yaER6UnlMaTJUUWxQWktt?=
 =?utf-8?B?cWdtbDFyTFVETnpoWmtEWDVaOHcwMW1FSlUzSE4rcFZkRnRLS3dWSm5ReHhM?=
 =?utf-8?B?dm9VWm1BdDQ4R2p2eUlDMEtpVHhxbTBOOVZFOHphNGk2SkNja2RiNmZsZ2R6?=
 =?utf-8?B?SCt4aTNXZmlXQWE1aGtsdUhraG1wZWZCNjloZFdDYUQ0Um04QUJRL2FvY2Ix?=
 =?utf-8?B?dzE0N29XTlRQNWhvZVhZellqcU5KZjE2OWg2dERFaFBlV3pYT2pzMVBVNDFq?=
 =?utf-8?B?a1J0QlZmY1d5STFDck16WTVlVy9XVWJQYy9hM0ltRTE5K3kyTUc1eHN1ZWhj?=
 =?utf-8?B?K3hHSk5zSkZYampocGk3aWJ2cERzc2RZbFJKVDlCZ1JlSzBjeC9VN2VPVWx6?=
 =?utf-8?B?Vm5xMGw0bWk3NlhvTDJ6dk5BZFIxSjdVWjEvdlA5VEJOUXZQS2RMZGF6MkJT?=
 =?utf-8?B?L2h2enVGME0vUkJBMW5FMHByYzdjdkJVU0RTK2hHMG5SanZvMVoyaW5QZEd1?=
 =?utf-8?B?V1d6WEZMWmlDc2hRNWhkMlhYejF0OTJweXB1bG5rMlJpVCtudStoSFVCaEpy?=
 =?utf-8?B?TzNHaUlEWlByaENyTExjK1lPbTFsVlBkNTJ3SVR3ckQ2MG1qZXIwRWxrVVY3?=
 =?utf-8?B?YnJpWlJiYmtoblhsME9MTEFVSyt5cC9oOVdPVllTQ0tkUld4Rm94VnZ2dk9M?=
 =?utf-8?B?NHpBdHhFSE4wQmhXVDR5eEFLQ3Iyc3d4emlsbEx3eFVYN1BJcStFTW1TckQ5?=
 =?utf-8?Q?xlPdp9bbNTwVAg/K1d4QDhqOTuDdPd0zJXGlEY1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efae6b8-6a56-48c1-f482-08d9737f1a7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 10:46:39.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25Dm1XtoXRBkCENiNIxoXqcJ7JwzrEA50gniVr9X19WT3/FqZF8UZ4Zbu/Ul7iMkEJIrPxjqscAI4QvYqqntyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 09.09.2021 12:03, Oleksandr Andrushchenko wrote:
> On 09.09.21 12:39, Jan Beulich wrote:
>> On 09.09.2021 11:12, Oleksandr Andrushchenko wrote:
>>> Anyways, I am open to any decision on what would be the right approach here:
>>>
>>> 1. Use range sets per BAR as in the patch
>>>
>>> 2. Remove range sets completely and have a per-vCPU list with mapping
>>>
>>> data as I described above
>>>
>>> 3. Anything else?
>> A decision first requires a proposal.
> 
> I already have 2: one in the patch with the range set per BAR and one described
> earlier in the thread with a single range set and a list for GFN <-> MFN.
> If you can tell your opinion I am all ears. But, please be specific as common words
> don't change anything to me.
> At the same time I do understand that the current code is not set in stone,
> but we should have a good reason for major changes to it, IMO.

And I view your change, as proposed, as a major one. You turn the logic all
over imo.

> I mean that before
> DomU's we were fine with the range sets etc, and now we are not:
> so what has changed so much?

Nothing has changed. I'm not advocating for removal of the rangeset use in
handling Dom0's needs. I'm suggesting that their use might not be a good
fit for DomU.

>>   I think 3 is the way to investigate
>> first: Rather than starting from the code we currently have, start from
>> what you need for DomU-s to work. If there's enough overlap with how we
>> handle Dom0, code can be shared.
> 
> You can see that in my patch the same code is used by both hwdom and
> guest. What else needs to be proven? The patch shows that all the code
> besides guest register handlers (which is expected) is all common.

The complexity of dealing with Dom0 has increased. I've outlined the
process that I think should be followed: First determine what DomU needs.
Then see how much of this actually fits the existing code (handling Dom0).
Then decide whether altering Dom0 handling is actually worth it,
compared to handling DomU separately. In fact handling it separately
first may have its own benefits, like easing review and reducing the risk
of breaking Dom0 handling. If then there are enough similarities, in a
2nd step both may want folding.

>> All of this applies only with memory decoding enabled, I expect.
>> Disabling memory decoding on a device ought to be a simple "unmap all
>> BARs", while enabling is "map all BARs". Which again is, due to the
>> assumed lack of sharing of pages, much simpler than on Dom0: You only
>> need to subtract the MSI-X table range(s) (if any, and perhaps not
>> necessary when unmapping, as there's nothing wrong to unmap a P2M slot
>> which wasn't mapped); this may not even require any rangeset at all to
>> represent.
>>
>> And in fact I wonder whether for DomU-s you want to support BAR changes
>> in the first place while memory decoding is enabled.
> 
> No, why? I want to keep the existing logic, e.g. with memory decoding
> disabled as it is now.

Afaict existing code deals with both cases. What I was putting under
question is whether DomU handling code also needs to.

Jan


