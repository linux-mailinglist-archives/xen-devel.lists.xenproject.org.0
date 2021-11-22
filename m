Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D853F458A88
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228633.395681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4cx-0006oy-TC; Mon, 22 Nov 2021 08:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228633.395681; Mon, 22 Nov 2021 08:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4cx-0006mz-Py; Mon, 22 Nov 2021 08:24:39 +0000
Received: by outflank-mailman (input) for mailman id 228633;
 Mon, 22 Nov 2021 08:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4cv-0006lu-M8
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:24:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a117f47d-4b6d-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:24:37 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-oUI9CJbLMzWWBYA1CJhbOA-1; Mon, 22 Nov 2021 09:24:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 08:24:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:24:34 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM5PR0301CA0032.eurprd03.prod.outlook.com (2603:10a6:206:14::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 08:24:33 +0000
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
X-Inumbo-ID: a117f47d-4b6d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637569476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NC9L90SsIa4Al+jIQi0Q07NsoSxvQ7lbRXvkNWuQXo8=;
	b=VYEWhQqi/qpvXfiz7nIUtOPKY6ZKq+jRU9nMpwf92n5Jm1HViVy2SRjoxvnHQxBSMOT54i
	q57z4CfITIAPRHYEXESTiGYqBwAqcQDCWeJCB6aCyFzz/kh4IZzXm2i4VhkHUGIByMao5L
	b/I+RUFXCLM1EVgbxTQyHlbnkBNaq88=
X-MC-Unique: oUI9CJbLMzWWBYA1CJhbOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPF4YFU6oscSAcyzJFa1c7m8ESe4SDLlhoWOMAd//kc/ABPiiqjoQ27UHJoaN+Bi+efI8IrabBYp4fYZ1Zg9acp1kYTw8JG8fyZBKHqy0ndAkPR60AcI9boImsytxTM51/qprt0XseILFgDdKScCm7MIaChI7UyYO8XQFjBCx7hIxC0VGpllvG2PAqQHT8ujKOYDcGgzirsUS9YnwLRgjZZYQmV1Z5fB7tXut7Pk74sK+WNoMtKvn0e6BgKFiQ2stTphcMTvdwGSBn3Te1XVNnc8sZLyeoAoq+R7nqREqZwTKO1tjfnzyJphWPDNLpaunH7dcP+6aVLNOe3kctwWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC9L90SsIa4Al+jIQi0Q07NsoSxvQ7lbRXvkNWuQXo8=;
 b=EV8/a0sv6/l9TcQarZ0gfRp9eGffkjPAf2O1pbKp5LwoSdXph79mmzTfBNMbsLV2cTpZwKEDqQhCSvJO8/RTH5uCd38BDSqjxdm51EVvscPhhoCb3M5G+JHF/dA/qqfy0TySzQO9QtkMP5+zsrFSWuOqm+8vyb+uZTDoQ220kHZNI3RcRy3l4WSUKWALSSJxVr7uHTJeDJBuYN+h3goGe8rD223BCirAqo9Rwmhjk/U85OIXr5hD/PzXneRPD9s1pKypDxBOlDC6nikIEmY6xpmH8XvvKJUBN4npxBQL268e0nOjgymk+X7objHXpadTTv1gNHeTUOjN4w1uyNAH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a56d501-3e3c-5537-65ef-ddf08b47aa99@suse.com>
Date: Mon, 22 Nov 2021 09:24:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
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
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
 <6b2d4825-3b00-4034-2804-a44059de15a1@epam.com>
 <fb72cae2-1b7e-8d52-48d0-2967c68325ea@suse.com>
 <8bd7e778-6ebd-2f50-8e96-e21b3bf06a11@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8bd7e778-6ebd-2f50-8e96-e21b3bf06a11@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:206:14::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21493d96-46ba-4ea3-9ad8-08d9ad9183ba
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35349FB76266738462E03E7BB39F9@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TaXAtBoj3rw1uRavnKgbxuaep9UnAsFLWCqpGksH8up9R2NFkkC+4/qKOjuLatC5XCzSGCAI8J51NHOCKQlXgVSjfDXR4bt27/aSAfRAdO8ByMzsjMNGZmnk06KqKkahQCwfZhgLh0zx6L8RO/HuaYQTngaIoV8I85J/hdpY7CtZOYm4QKc3NF+MnD2GvhFfTRMDes6CUGZtTds4m8WxUmRKWLL9loQTLwro3FOgbeb54SB2vlgKzsOy/vsNfBo3wAFA/Ea4QwAzDTzg9V7EgwJwELvhqZBDwZK5izkONrfrqCv/4kZsR8ieczf/ca52KNdz+Yil/2uB6W/H0/NNF+4ux7DqUv8DcNVIAiwbeLzQn8Sio9RSPKQ2bjvv1uEtAgPDC1GqKddcjHkMLQs5kPWZiWugabjkFIkcEBBKQPvjdhVtX4VHvltamNwhJoyIQo/7wrFo0zWGQ/lkdjX2Zpi1JkEg5+Ez9RrrdlpHgM9bqoFAsb9G/EWtmCj57NNeyRbAOhGH0SrcwXwQzsH9wORckr8Pd4sp8pnOFiAtaYwzvJHs3EOKCBIH1WNjfsqdXP4g/O2h3m005Tm0gFz7a+CDfZK0p/gTYiuQ0IgdI4gAyV64NJHW8FVZa/nfUasDLyNNbcSt++z3AiRqjE7rtnfv+s5n2dia8Cmm25hM72lHjZEdxQwpV3lHTkodRvD340zLf98z03d4gFPF3OIENGmnexUsKtTO52ZArULSYzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66556008)(86362001)(66476007)(66946007)(6916009)(8936002)(7416002)(54906003)(31686004)(31696002)(186003)(5660300002)(36756003)(8676002)(316002)(53546011)(6486002)(2906002)(508600001)(4326008)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFhvMWc5OTlOcTBHa0Rhc09WTVJySmg2dEVyS2h4b1M1Tlh1eUxiR2w4bDhD?=
 =?utf-8?B?K0Q3YVh0SGk0WXhYRmpmdlRENmZEZkRXWnM1dzhkcWErbFRYdUIyNmp3YSsy?=
 =?utf-8?B?bldtaTFpb2NTcU0rcHJYNUZjR2dJcld6QnF1MG5nb0tWNDlWdXlmeG1uVGtw?=
 =?utf-8?B?Qm10M2o4MHk0NEZLRWh2MTBlMkdOWVRjaDErdWtzSG9NM1pGbWF0S2FkYlFQ?=
 =?utf-8?B?ZUdwT3QvWGlsU2w2RC9JOHNkdG1iU2p2Q25RTmpsY2E0Tkx1Q1NlV1I3MThW?=
 =?utf-8?B?SWF3RnBNSzh2Qm5sWk1Ia2ltcEhPcFdpMGpuQTJsQ2xSTGxGamltSmZNVnN3?=
 =?utf-8?B?N1RRZERhS3A3RjhmVFpWYVJ0ZDJ0VExNQW85ZHA0dU5sZXdpRXUxUW1uamtQ?=
 =?utf-8?B?T1dqaDZia05TWHQ1ek5mb1lEZjU0QnExNHVaSjZqa0Qydnc0YVNXeE9IbmpJ?=
 =?utf-8?B?Lzhjbk90YVJuWElWcDdGNUtpdkRwanU5NGhWR3FSU0hRZkJ1Tjd5emNLK1Nq?=
 =?utf-8?B?QWhHRndpcDYvWVI1QkNWTDNGYk5GcVRHZ1dEb3JacGVaNk5QTTBuMzhaSEVv?=
 =?utf-8?B?ZWl6KzNRWFJqRjl5TlVqQ1Vwd2N3dGsyMFBSNm54MUZZcEZESjJKVE52dVE3?=
 =?utf-8?B?am1LQzdNV0o1NUlqUTlMTUYzSC9NVUJGVjd5YlBFYk5jSFg4YkRLSUUrOEto?=
 =?utf-8?B?a2VIN0pQdE40bklNS0pEK200L3VTUEU0V1J3bjFqWUh1MjVVNGZXMXJjRUth?=
 =?utf-8?B?dnRlaXFrdEtFTWhybU91a2lNcXVVbmE3dk1sbHVNWm5ENGpzbEpkZEhoeWUv?=
 =?utf-8?B?cEVsVE5DT0IrTnE0L2tlanhlTTQwQ3R1alMzaHVoS3NGOGpEaXZNMFQyY0NT?=
 =?utf-8?B?aW5BbWVvTkZYMkU4dk9wdUNLZFI3ZGRtWGRSSlR6MnhlQkJIQnpxbTN5L3J2?=
 =?utf-8?B?OWgra2o3NGh4c05Jb3JGaUYwK0ZZS2srVmp1SUlRUGRZUW1ySG5zYTNZYS9C?=
 =?utf-8?B?andVcjhEL2MwMVBtWW91TW9NaTBwWFZrcE56aFQrQjVITTRTdGx0bStaOXlG?=
 =?utf-8?B?S3A0L3JqRy9qaUxnSkpZSS9nLzRXYnNoUDNobytFM1dYeGsxSTV4OEJKR0JU?=
 =?utf-8?B?Ry9XTURjWTRkdm0zbkY4V3R4T2RTWkdFUGUxV29BazlONGx5NXNVZEk3RkZO?=
 =?utf-8?B?TENKeTFwam9oekVib0RoQXdSRWorR3M4TUI0NVphdDdoWXNJZi9FNEorazhD?=
 =?utf-8?B?eU1tWThDRE51MGtlRncvUVd2R0JUTjNMQWx2NXpDbndpa1g5OGxSU01qUGF0?=
 =?utf-8?B?bGtUV0FPVkhNb3QvY1dNbFY4bzlvY2VUOVVrV0VnSjdyRGJLc0FnWmhMQjRI?=
 =?utf-8?B?Vzk4VkdNU093QmhHVmZhTXBERFo3NHVlUVR4NldzVS9wellpNTFSUit5Qldo?=
 =?utf-8?B?K1J4a3l5ZVB4RFg5c2ZvWFVQa3hpTWZsbXRqTmNxYmdtTjlzNFNDSVp6ZVhn?=
 =?utf-8?B?UEFaTDFqWnpGZzNmOGFuK1NRRlNsODlqVVhiK1RMNlhabVlHOS9mMlloem9B?=
 =?utf-8?B?WGliSUcwZVlDbGY0RWRsMlhHczdqSWJiR0dIdGpqVis2Qkd3TUZ2UTQ1OHhm?=
 =?utf-8?B?RFlNeTFEU3gzeWpzd0w4eVJ1U2cxeXJwZ0p2eGJwNzRyby9iWE1NTU1rT1FJ?=
 =?utf-8?B?MUZrR0JGaUlTWU03QWlxNkZtZmRTd3o1QkVHUjBmcUgzdzZrODl3V3ZGMm5H?=
 =?utf-8?B?YnpuSG1teHQyeXhEQXpqejNNbXhNZnFIY1FNU2R4OWFFeVpPNHBGa3QzaUZM?=
 =?utf-8?B?emVZbWZ4anBneGZUelJ1NlNNdUdKYTczYmJkaGduaUhwYW03ZUdGYS81aThN?=
 =?utf-8?B?YUkyaWhkOHF5RFBPekM3bkdhZ0tKcHA4M1hXSmxLc0FWanpQNlVYU2tGTXZP?=
 =?utf-8?B?eWFCMkFndzk4cys0NDR6U1dVOGZxNnlodkRJZEtLN2ZjZi9RdmpmeDduY2VC?=
 =?utf-8?B?eG9tdGlsSFZSeDJiNENTakx4d0FXQi9DUFdDRng2TUpwYlJVeXRuT214dzVr?=
 =?utf-8?B?eUU1cE8yaXh6aFRUbzJaNHhHUHpWMEJZblFpSlRlL1NFeFdHOU1ac3JEYTJP?=
 =?utf-8?B?WjRpNld3RC9BY3BERyszZUNUTGs3UDdHam9ENGtLK3k0NkNrVlU2MnZUY2Fl?=
 =?utf-8?B?ZUQrdSs2WUJ5TkMybk9OTUJ1T3BiOFdRWVZYbzBxQXQxSlhRekJIUWVuQzVC?=
 =?utf-8?Q?f2nfTuFsItqqbaqWeAlLDnuM0vHooyS+EHsxbCoo+k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21493d96-46ba-4ea3-9ad8-08d9ad9183ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:24:34.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rFYeVpxXdGM+5qNeVI9nBRsR89aV2ZrI1LoPPYF3bIkTJoY7XXipIShq7Ps3ZNXvfmfpr5tnwWttwdztRg1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

On 19.11.2021 15:09, Oleksandr Andrushchenko wrote:
> On 19.11.21 15:57, Jan Beulich wrote:
>> On 19.11.2021 14:41, Oleksandr Andrushchenko wrote:
>>> On 19.11.21 15:16, Jan Beulich wrote:
>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>> @@ -95,10 +102,25 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>>>        INIT_LIST_HEAD(&pdev->vpci->handlers);
>>>>>        spin_lock_init(&pdev->vpci->lock);
>>>>>    
>>>>> +    header = &pdev->vpci->header;
>>>>> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>>>> +    {
>>>>> +        struct vpci_bar *bar = &header->bars[i];
>>>>> +
>>>>> +        bar->mem = rangeset_new(NULL, NULL, 0);
>>>> I don't recall why an anonymous range set was chosen back at the time
>>>> when vPCI was first implemented, but I think this needs to be changed
>>>> now that DomU-s get supported. Whether you do so right here or in a
>>>> prereq patch is secondary to me. It may be desirable to exclude them
>>>> from rangeset_domain_printk() (which would likely require a new
>>>> RANGESETF_* flag), but I think such resources should be associated
>>>> with their domains.
>>> What would be the proper name for such a range set then?
>>> "vpci_bar"?
>> E.g. bb:dd.f:BARn
> Hm, indeed
> I can only see a single flag RANGESETF_prettyprint_hex which tells
> *how* to print, but I can't see any limitation in *what* to print.
> So, do you mean I want some logic to be implemented in
> rangeset_domain_printk so it knows that this entry needs to be skipped
> while printing? RANGESETF_skip_print?

Yes, albeit I'd call the flag e.g. RANGESETF_no_print.

Jan


