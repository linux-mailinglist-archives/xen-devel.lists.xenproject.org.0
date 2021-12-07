Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E1846B6C6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 10:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240764.417474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWVe-0001G3-EU; Tue, 07 Dec 2021 09:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240764.417474; Tue, 07 Dec 2021 09:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWVe-0001D8-B9; Tue, 07 Dec 2021 09:11:38 +0000
Received: by outflank-mailman (input) for mailman id 240764;
 Tue, 07 Dec 2021 09:11:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muWVc-0001D2-FU
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 09:11:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad10df8a-573d-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 10:11:35 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-TsF6bkWjMcu4G8pBlFDkQw-1; Tue, 07 Dec 2021 10:11:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 09:11:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 09:11:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0016.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 09:11:30 +0000
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
X-Inumbo-ID: ad10df8a-573d-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638868294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPPUUREz0lISL/bigAXGQCVL6O9JLLrIFV40C06te4k=;
	b=Fsl7NbV79OUm19eCuy+krC6g5ZMZM/VHcRLB90NQFQWhbTC7CJUkaza3g1MwUct19lQQYw
	Zh4CSAwaHrthhnyrqPJhJa6s3gnwGRUEGZ0wIhces4ZpkAuCHN2YSVmqvZgGCt0/RKpMsY
	FKsouzVrshXmJq2DCTb2mZHE0iBkthM=
X-MC-Unique: TsF6bkWjMcu4G8pBlFDkQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1C7FqhUyEAgmcvLck0s138GVaoEbppUqn/UITlENKYMWXOBW86E+piUVX1ZNkcWxOY+3t+r5qZWCTOAAfGD5LxhDh/N8r04FocG9xhX6Npvk30+9Lfe84DWf7Vb71Ahn6sV02jwjJqztXEr5U7g6Cnjl2fOOb5PMQDItb1jbizl/DIcMqaRZXN967myqAExATutnYn7GJGI2+KgR5cLdpBDEWvztSxQTd9hJWEEVGyDoODC8r1zXwM9jSF1biPUR0sidN2O7yVKu8oaAz9fseOfBQbuaOIQUha2Yoe/Ioso+VLVsSpHQbE6FsNyTonPpku5Ko+VMR7kDn5Bc5G5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPPUUREz0lISL/bigAXGQCVL6O9JLLrIFV40C06te4k=;
 b=MYNKDrcqzJJobp6rAtBzhjSeejD01lzv10+craldjSBEUme/H+qGMrfi2O5Nqoeoa0BC6bPV97B3rStYoWFVoYaf4+rDt4YHLNuQlpcBIwv1B70Sn5BF9tio9UnORfTqhuDZ0M9g3I4MnCtkhLRpUlqBfcwPmJsdJnBKusHvfYD7+1M2bp1yrsI+Iop2Axvt5GoGhdkCAxADdJ1xUxq95EO6G7YLDYrCWXY8CTFme99ZGMQ776txoPKZtSoT0F0+hbZchm9Uw62cAhIEkb8wVIkZBGAqx2NHkPt6OVb+nS29JYl1lGVHRtxKr2/+NbcnDUhypfNqOPkz95bi+kudcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c86ae6c-f62b-f54c-b5ad-a776887ae9b6@suse.com>
Date: Tue, 7 Dec 2021 10:11:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
 <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
 <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0016.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c4f8654-be48-41d0-444e-08d9b9618ec6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55973967D7C94365D072F6D7B36E9@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dWcTHfDs/kcyVOgOY47etHOAY8hTuzBYbOYeIWVgi12vYuWsbiNexhjAtmxOiyOhpBkRvfj4IlYgROlqlFEGD55ub9xu/8a2t+uKW0yiwEHCPz2uI+TRC5VX7sjwAcatWw6EVLFqXEjm5KfMrWt0xmX47k2SUs//C0TZviarz6O2TfHoP00W07sdsiRBbN2kLUMIO9XDspKJR9uSZL8gfXK6c0gUqYueOqEHOPVZiNHNrPYbmkAUYAs8qSI2fPQ6cOHsngjXjcyHwHsD/zZt9LNo9UKw2247RNPKpdm8+Hayv0zwazukoS+dd6nGRPWiaNTOxBxCBFO2t0cO6hXjhDGev8yItYCutXfItRm2AfDknLccZyR+7m0A/vTLdkrpjmoY1m8vqySoiF6tpSSxj4zwur3whEnBQFXi0My7AC8wa2ZDSjtNT+NKYigqp3UaNwAUPN+JEuX3k34eYmYodile9E0l4ybb5ctIErXzJstOh/6LoWubxMiPStiY7w2RsxQuCiMBvDH4iYaanbyF/9c7NBnaQBKvQYiXyB4QT9Ht216CeUpVOogNIXsXBGobyGUtxYDQpVMNijaUDI6s8KZvF/a2JYx80e5DYmQdPu+OUVew8r+xBix5ZnDn+gBIN1bXKOJcr8QUUSwQ/FQvs+runZovj2120uRCb2yhgeucdbHBmNxWavaLQP897/HPYtTlahVmz8zgayzZz+0xXKGo2VfeNcTT1PwtQ75oTaxtpV7tIV0GJ9gHcd9fVOEhusEgvrYCFM6TI/ps1toaxgs596d1AZf7qGd/3iiXjkQKpYyz3NexHJh+DEE3C2gQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(53546011)(5660300002)(31686004)(508600001)(186003)(966005)(26005)(6916009)(2906002)(8936002)(36756003)(66946007)(66476007)(54906003)(66556008)(8676002)(86362001)(956004)(2616005)(6486002)(4326008)(38100700002)(16576012)(83380400001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNXNkZObmVMV1JweEU4c013NWsyZFMzY0ZHeGRoMG9sMWZZNDVmdVFKSFM2?=
 =?utf-8?B?UitlZGwyOThPbHlpYWE0dnovSWZuTmhyeDFiK2VwcUl6UmtERTJ5d2hCV0Vz?=
 =?utf-8?B?UU1md2tESzBFRmhOMmcwT1JibkpyTUh6SVdibm84cTN5cDc0VU1kZVk4Yjgv?=
 =?utf-8?B?dE9uMEtzVTNyOHNUaXlicEkycjVtbys1dCswSWJhQnVXQkEvbS9waDQyRHRL?=
 =?utf-8?B?TG1wcFVvaXY5eFlkdnRGNmdCbWJZSEhJaExhU2NzdkVlbXBUN2VxSnMwVHNM?=
 =?utf-8?B?R1lsSUZoSU5DTGhGVXUwSWwxa0tocis0b2RWTlJnc0N6UHAzZnVENlEyc0xF?=
 =?utf-8?B?cFo4d25YdzZQUzA4YkZzMzVXbjlmNG1xRXVvMGswUTd5cjBRQVhVbm1Say9q?=
 =?utf-8?B?dXEwekJsbGJDN0lYdml5SlNwWFp0Mk1OMHFtTE1wVEhYQkx2L0VKQXJ5R0NS?=
 =?utf-8?B?aDhnWTgwZXBqY3hmTWI4NThjdUZzdUdwRjhycWlzQjFxYjU0V1dkMjlqSi9i?=
 =?utf-8?B?NjNxZUtlMWFraXYzT1lteDh1T1hxaHRjY0FWK25qMnA4WnVhRFprMFJaekwx?=
 =?utf-8?B?S1dqTktLRHh6RHhjbm81aDBZUTNRUVQydEd4dUJQWWMrY0Iwc1QydEFnaGJz?=
 =?utf-8?B?L0lKNmkxNnJxM0ZCMHc3UjRhR2ZSTVVndlBseCtsNGN4cFJ5NkRHczVkWTJQ?=
 =?utf-8?B?M0xja0xRdmdvRVkwMVJidVhHaUZuQXpsMi9OVTdpVXNQcVkra3BTVGQ1TTV1?=
 =?utf-8?B?WCtmaFRNUE5oZDdROExSby9BemIzWWF2Ylh6MEZGekJrUDZ4M1dwOGpqWTRj?=
 =?utf-8?B?OCttT1FJTkxHRTVrR0xhTnN4ZzBKNHUrdFR6U2VFVzdSa3cwaElvR05tMGY4?=
 =?utf-8?B?ZStPWmRzYkdKaUtNRVRRSDQwVjVVdXRNbmxVbFU3TGRyVGNxdXRlelZlZTFs?=
 =?utf-8?B?eU1JK2c1OE9WYTZ4Z2tQdVdGR2Z3LzZHNFNGMkVGTVVUMXBlQTkyQW1MTnE2?=
 =?utf-8?B?V1doT2tTL1Fub1ozSTVpTWlTMy9vWVlGNmcwSFdqSi9vN3dxZkZTMTVkTXFr?=
 =?utf-8?B?K21uRzE2SzgwNzYwK3crZDY5TmxpYmtYRjJCSjUrR2l0VmxRMzdpalBGTVZQ?=
 =?utf-8?B?cWFzbGVwZlIrTFpmVWVOT2pLSUQ2K29FWGlndm1jQlBMclVJNVZUTkh1TVl4?=
 =?utf-8?B?QVZGVVFEeld0ZnRZMGdCVEVOVTN0V0pPWU9Pd1c5UUJIRFFweWwzUXl0eitx?=
 =?utf-8?B?QkYwRTBTRVdXT1dwZWJSRk9nMi9rQStFZWhBT2tobmpxMjY4Ym0ycEhhQlhL?=
 =?utf-8?B?SjIwdUtiQ3pDclBlQnkvU2JNQ0FZcGVzekZQa2lZTG91T1NTMTNPeXZYRk5n?=
 =?utf-8?B?d2RzZmt5TENZWVVTaURhWmxuS0ZhTG52ZTNWY0xGTTE5V253Um1SdXZFdVJZ?=
 =?utf-8?B?S0pMTEh0d3pZcXVnRWx5Z0M3R1BLRDlLZmU3eVVvWFZLWEhmSkpGdGtwbzBH?=
 =?utf-8?B?Tm0vWDN1RkUyRGd5a3JtL2JxNi84UUkvVHVUWHd0YWVqYVl4NlNqSmhsY0Uy?=
 =?utf-8?B?VldsV2RkRXAwZ1dvOUF0djVTempCUFdYSWNHRG1CVkV3bGVtUTVJaTM1aWE4?=
 =?utf-8?B?WkM0OTVKdWFKdDdnUGNlVjh6K0FVUDZjV0RpUXFIZVNlU0N1NndQd1cwTlNS?=
 =?utf-8?B?ZTNCdDV3bzhYTFZyaytOT0dSRXoxUEpUelJJYnA4NnpxSlI0RExRbDZoRzBs?=
 =?utf-8?B?RjUvRzlhK2o1WEEvRHdIQWliQ0lLTWlHR1ZyQzZhcXMvalFBYmloZXBTcmEr?=
 =?utf-8?B?aTI0aEkrT01mMlZBYjVxS1ByRmRPNHdnVXQ1b2FlaEZZY08rbFB1b2R3ZzlL?=
 =?utf-8?B?L05PcGFaMzdpRUdiZ3FYMlFmSExwTEE3Y242dm9SQ21GSmJzNHVON0pMT1BN?=
 =?utf-8?B?SnV6MC9YNTdlZDRUbU5wYTRTMXhPS3V6Z01DcWhMQ0lzRWdDSjlQb0EyZ1hG?=
 =?utf-8?B?M0pjRngyRHJtQlhFNUdoWXd6R1c5MnlkZGVBWVNVYjBOdEd2VWcrNkJGREtI?=
 =?utf-8?B?TFN5THZtaCtUeU5sbVhIK2Rxc2JKYUN4NE95MUFNaWxycW8vbWh3V1A4Vy9J?=
 =?utf-8?B?dGhVRFZaNW1wNHNWcFg5Y2xqVGhobTZ3aDlrR1h2NEtHTFRUR2hWYlVERXRV?=
 =?utf-8?Q?nqLzPSc4EGOfnmRtZH+iLdQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4f8654-be48-41d0-444e-08d9b9618ec6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:11:30.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQwXoYsrhsBbzjOigdskgUlusjhzszptG7bGp13enNmsPu1BMBw41hiK1IJXnCUUvgfuP4U/b9JHUKNfh0Hpiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 06.12.2021 17:21, Julien Grall wrote:
> Hi Jan,
> 
> On 06/12/2021 16:12, Jan Beulich wrote:
>> On 06.12.2021 17:06, Julien Grall wrote:
>>> On 06/12/2021 15:06, Jan Beulich wrote:
>>>> On 06.12.2021 15:28, Julien Grall wrote:
>>>>> I am not going to ack it but I am also not going to Nack it if another
>>>>> maintainer agrees with your approach.
>>>>
>>>> FTAOD I'll be giving it a week or so, but unless I get an outright NAK,
>>>> I'm now in a position to put this in with Luca's R-b.
>>>
>>>   From the check-in policy section in MAINTAINERS:
>>>
>>> 4. There must be no "open" objections.
>>>
>>> So I think this cannot be check-in given two maintainers disagree on the
>>> approach. That said, as I wrote earlier my condition for not Nacking is
>>> another maintainer agree with your approach.
>>
>> Hmm, I did address both your and Ian's concerns in v2, admittedly by only
>> going as far as minimally necessary. I therefore wouldn't call this an
>> "open objection".
> 
> I believe my objection is still open.

I've taken note of this. I'm afraid with the long winded discussion no
other maintainer will provide an ack. Which therefore makes what you said
above effectively a nak anyway. Unless things move in unexpected ways, I
will have to consider this series rejected then.

> I still have have no way to verify 
> what you did is correct.
> 
> For instance, the tags in patch #2 are:
> 
> Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
> Reported-by: Yu Sun <yusun2@cisco.com>
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> Acked-by: Daniel Walker <danielwa@cisco.com>
> [Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]
> 
> The tags in the Linux commit are:
> 
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> Reported-by: Yu Sun <yusun2@cisco.com>
> Acked-by: Daniel Walker <danielwa@cisco.com>
> Cc: "Yixia Si (yisi)" <yisi@cisco.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> 
> * The first two matches the original e-mails
> * I couldn't find the 3rd on the ML.

See e.g.

https://yhbt.net/lore/all/20191108202754.GG18744@zorba/t/

(Andrew Morton's reply at the bottom) for where it originates.

> * The Cc could be ignored
> * The signed-off-by are I guess what you call "mechanical"

I would generally retain Reviewed-by when our code is still quite
similar to Linux'es. Acked-by are on the edge of being useful, but as
you can see I did err on the side of keeping it. As said in a number
of places elsewhere, for what I call mechanically added tags I am yet
to be told of their value (or even need) in our tree. Not the least
- as also said in reply to Ian - because we don't usually follow
Linux'es model of flowing patches through several trees, where each
tree owner would apply their S-o-b as per (c) of "Developer's
Certificate of Origin 1.1".

Jan


