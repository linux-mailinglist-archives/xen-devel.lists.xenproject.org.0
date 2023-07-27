Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D7765608
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571138.894266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP23o-0005oi-Ba; Thu, 27 Jul 2023 14:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571138.894266; Thu, 27 Jul 2023 14:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP23o-0005lR-7u; Thu, 27 Jul 2023 14:33:48 +0000
Received: by outflank-mailman (input) for mailman id 571138;
 Thu, 27 Jul 2023 14:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP23m-0005l2-T9
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:33:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9790a994-2c8a-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 16:33:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9100.eurprd04.prod.outlook.com (2603:10a6:10:2f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:33:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:33:16 +0000
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
X-Inumbo-ID: 9790a994-2c8a-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA2As1BK5Jiu1bned2TySv5n1Z8aGRfZoCO5L76l418vruHirOPzVv2+yp1S95vbxyw92FzknwQydjhpMIQPoQWSVq1M9Z2e4keCS1CchXG5Eo76Ob/pnQOnMkL7Wq2VZ6c6zxVE+FpThnEL8hJfHUdY8o60RKfoOiiXEQOQF4YVse7QdSzstCg4IzgkHF7FcRNGXFUA4X0m1MEDslzMq9P4M83tvY8fs8ZY9CLEZ9o/MVIqoWdQ7HRwyiknPqdmGtY/2mAeNNW1LshTbUlTVIpO2L5FJaz4QpnCct8ZqtsxfcqWdFoVmDjSewb5wm1Sn2zRlm+VNF1CPvnIs41/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ8VFHLzAI05SKWB7ehWmpZpzVH9greL9ap0tjkiyso=;
 b=WDof8tYgRmdu4ESWkl5GI6WYIc8L2J83XLmtvZpMN6EHYF0KX6jeYoV9I3ZN5H8zo//b/28YMORLNhuKSx8uBeYtOaDFEi7YZTD75ifTQb2KZQFHLzJK4c7yrIury2fVbvjaihsAy7emxpWgaHMQBHmsVjZTI08a6gG9p0zi9TxAPhhfPwvvM4M+Ttytofwz069snB3Lay6CSl6hGytcGoy4vXx5qhA6WMl+8fU3+D9NkKM50sObrUsR2Ffjawmee+Olih+nBIArTqTED+2t/k446bSP8N3ZtUonp2G53So0kkWYTZ3E1ZuKmG8vj4zDJzFhjSD2HEvYGypWBCo/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ8VFHLzAI05SKWB7ehWmpZpzVH9greL9ap0tjkiyso=;
 b=Kau2eoSM4RsMXYJasaGAtldX8FVLCSb37PC3HJVJhKOe0chN2Tt0Pjj27fVxP5XkdRXqSp72kJtkhqpqc/Hd7EHhBroJ8wPdWbhUn17pYOoBBu0bCpeV/Bx8mielPCZEE8qd2Xj/u5cWRrS3UZqWSS8v9N1mknl9Ei5UbQQn3aT03/lSAvScW2RHYjwGZ5/EzbeGumL4Azma6EJyB086U08XSIrxXw8LAWjA36YlNfoMPNLGvcwhi0vm1u+L56SqQyVZ7f0KIHCIHroJcsNc8zGcLnOMZcnBsIZ/uInUGS1ETDGhlAV4rZM29KAaYMrvaZvtae3Cy7seDhCVrS0Bag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8c151e4-1e0a-1465-0d5e-be55e25df818@suse.com>
Date: Thu, 27 Jul 2023 16:33:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230726141459.985463-1-olekstysh@gmail.com>
 <969aacb8-a608-be01-f0f5-34fb1cc61d62@suse.com>
 <35a1988d-94a5-9f2e-2478-ab08268f02b0@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35a1988d-94a5-9f2e-2478-ab08268f02b0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac518c5-4dd3-4934-291c-08db8eae6a4d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7CczQI7SZzc0/a/3guHy7dZmjbnh5Bxtvh/RPOCP++1L50jlF3kHTUPS9uNWTVgOXypQpM5Bilji41FFVKvCp+TCxAKzgOAq06msxD6+rLj9cWd+eAFrHPZUlRAjJ42gNLL9pg6k06brtcw113F3fan86G9/LHuo9k2Kj0jiVDE7/4yQ4IABdjfDD2r2J109DN/9kVkIQ+ROojJ9XwvzgHiTb6ihbdV9Erc030jA018AjbOrVgCV03Maoo1G731AvWF9Ho566OTLeEUqCtNJH8wjrzka5qau6W71ezhqL+9YMqfaZqeskFWSFyLG+mKBAgnlP5mDUpFPQghyn95sCQ/HGA13qItPHTPHSyAqSjeyQEc6JXusKeVeMI1Kr4HzWgRkj/vim0bKlnKdT5B5G35P0E0y8HfqTRORZ352B/MPKeHen6kYV3QE4ZpqNFVnlVkg0iOBjE2sBrmKw6j3MLcsM/OZGmP4QJInWU5ylXxIKW76Nn6Pah4IOpMAyCxQ3MBasKZgbo3fNr8wbgtprtgEfEFxZh5ijJSU9ccpff7BwoPqLPtKk9Ado2JC3at6wdvWcRcctD2g8vqIfSjOeNOqHIgNPwsg4bedmH+uHqOvmYi74cwyNwFUiff2QPfD4YWVTdsK1JwarYfvrBsSerwSPPcMxNcRPihHl8ptHj3CG4tzas0ZQ4VmAIqXaboK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(2906002)(41300700001)(316002)(5660300002)(8936002)(8676002)(36756003)(86362001)(31696002)(6512007)(6506007)(26005)(53546011)(478600001)(6486002)(38100700002)(186003)(31686004)(2616005)(4326008)(6916009)(66476007)(66946007)(66556008)(54906003)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1k0QzRndWtZUkFSbHY4TW41Mm00U1BWc3VucUtOcTIxUWkwamo5NnQ3eHV4?=
 =?utf-8?B?WDBxVjByeFQ0SEFyY3VoQXBxNS8vR2J4Mmt5VkNDYzAxUE4rU3p1UFd6eUVO?=
 =?utf-8?B?RUNRZElKTHdDclQ5R3lMZ3FTN0NDL1U2ZTRvOVpEMm11bndCaWVrVDh5RmdP?=
 =?utf-8?B?RE5tUllrR3I0L3BBSUROcllpeDR2ckEvUTRUK0FUZmllVVFCeHNKdDdzUTRQ?=
 =?utf-8?B?SDRzcFF2bHp0YnBXZTlxOG5NMmFzNXYvYTBFRjRJSit1ZTJTK3NpUGdpVkR1?=
 =?utf-8?B?VW0wOEx3bDJtMW9DMVZBRk9rb0N2VjVaaFJPMWxvWEh6V0MzdDhObUE1bk9L?=
 =?utf-8?B?Tm1Sb0MwSjRLczRiOUxnNy8xV0hvNUk1Y0w0K3JCT1IrbGNLU3NLTUEvM3hN?=
 =?utf-8?B?RzdDeXFleXVVZFZsa29Rd1JaQlMzNWdDNFRWSFB5enZWRUp6SzRPbTR3MkZr?=
 =?utf-8?B?ajM0MHlSL2VVWFZEemI5eFRGejNlcThtMWpLdW9EZGhjZk4reW5ycmw5Ry9v?=
 =?utf-8?B?UU92dzZ5STNlUlorMVN3R2s1eHVVeTJSMlhURzdFQ0FwZDZQbFJEcmxpNFVD?=
 =?utf-8?B?MUtNZGhZTUxKS3gveVJjcGhvditTZmdlRTFCWDNXWVhLNDBIQnNJeW50OHdO?=
 =?utf-8?B?TEhIVUlXQndBL29LQUMxdWhldFEraTY5Mmh2SkIwZ3BOd1lCdGpXWlRGUHZK?=
 =?utf-8?B?T3NVcVV3SGRiNVRUdktValh5ZGdTVGt5UUhOSDMxY0xIMEdkT2lHSGVRMFJK?=
 =?utf-8?B?bmU1c0xDTmovTS9GM0RKWGtKSjU4RFU4Nk1KMVluaHUrdE5MQ3l2d1VhbnFL?=
 =?utf-8?B?Rm90d2JPNFhxdUpmeTVId2kyUE5GdkRaV2ovUHlFejFTMmMyUHBESG1ERkdU?=
 =?utf-8?B?LzZyQ0dQZVdhRnljbTFkSmZRSkZndzB5K2hYdHpYUzVNOUFqYzc4ZWFXQUp1?=
 =?utf-8?B?VExUeE82UmUrK2JJUUNleDc3N1g2SDc3MGdLL1ZqYjlXeWJtd3djMDRhOS9H?=
 =?utf-8?B?bDBtNUZacjFWZWpTYlE5d2tkRmM5TGlibWg2MG4xZzkzQjZsTDJaSnQ3ZGxv?=
 =?utf-8?B?QmVMcU1BL2VjbUkxcDBpcko5T0xQclB6eWlqVHk3K1kzTnF4N3FLSUlXZmsx?=
 =?utf-8?B?SGRPOGN5TTdMSEZ3TDhzTXVjUVVtSlhMSXYzZDFucnhIT3RXbXFjTU9DSDNP?=
 =?utf-8?B?WkhCeit6Qm9GamRXa0p2c0tjdzdqUUJUdEtURDFpOGsvZSsxTkdKclo3ZUpy?=
 =?utf-8?B?VzFPSTNEaWFvMHNMY2l2Y1J0SVJqV2paNWY5TlpqSlNzRGNaWVBUNlRRcFc4?=
 =?utf-8?B?NUVXd3F3bWROOGxZeFVBT3Z0anlmMUVNSU9OQi9VdzQ5Uml5Q1QrcWVXMGpm?=
 =?utf-8?B?V2xtN3VlcTdra04zN2sxSkNvMmRHWFgyU0FoOFZXOGRsenVvWXNBMHZ1Q3lK?=
 =?utf-8?B?cFNHQ1EyTXRpa1czRHFpcWJ6Q3JkRU5mSXd4TFpHOUJOMWFrRWVBTXl1T0Ni?=
 =?utf-8?B?RWRLak51UW9odzBDakxHRlBZTHZJUUtHTGhjSStBaGtPVGZpb2ZHanRrSnZJ?=
 =?utf-8?B?OWJITWQzajdNMjJqMzhrUDRkQkVMeE9nSHlGOFJiWnQ1ZjFsakZOVk42SXVB?=
 =?utf-8?B?Wm92VjMzOUdsQkw3L0RCRHBIUWJ2ZHRERnFGSFVQSEMydWNNazBYQWR2blFW?=
 =?utf-8?B?d3lUSDcvQnFMbDJLZzhLdVU4VzQ1SUJnbGlTbHNKOFlyd3pzb1kxc1ZRcUFx?=
 =?utf-8?B?NnpCbkJFdDA1UGZKYnFmUnJaUVpSU1RrZDVheDBkVEZDZW0yU0hpM2ozQjZq?=
 =?utf-8?B?dStBWVlGdjZYK0tLSjl1UXNGczFoNzlDMmZDcTVGNENVRkdVSW5oWERCd3B2?=
 =?utf-8?B?TXpJaWUwcnBwUlBiQzFpSmhuSXlhcmxnSk9SVnBZNDdxZjhDc3lDWFBLaitB?=
 =?utf-8?B?Zmx6cE5sZk00Tnc1T1pNV3N2c3hIV2dHN0EzNVMyb3JxS0Nwd0FMOHNHUjZx?=
 =?utf-8?B?QTZRMDJ4SGsxRmYvZ3pKU244OTBESzFDaHhLWEZ0ZHR6cENvQ2YwTlZPcjZN?=
 =?utf-8?B?MGJtYTRNeFdYdDNSQjlURjUwdHZkOUgwNVZMVVhxVlVnMW5nSXpsYlR5QzBP?=
 =?utf-8?Q?8/axD1Q24RzDBkc0kaAwFoP0p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac518c5-4dd3-4934-291c-08db8eae6a4d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:33:16.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCPg1aWCvX6r875E+FQTrawN+PTAQlJ2IEzNn4aajqdxcler50cJJzOjIFPeINp0jGaANVYZZKhN8RSZZaaQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9100

On 26.07.2023 17:13, Oleksandr Tyshchenko wrote:
> On 26.07.23 17:50, Jan Beulich wrote:
>> On 26.07.2023 16:14, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Without it being present it won't be possible to use some
>>> libxl__device_type's callbacks for virtio devices as the common code
>>> can only invoke these callbacks (by dereferencing a pointer) for valid
>>> libxl__device_type's elements when iterating over device_type_tbl[].
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>>   tools/libs/light/libxl_create.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
>>> index 393c535579..c91059d713 100644
>>> --- a/tools/libs/light/libxl_create.c
>>> +++ b/tools/libs/light/libxl_create.c
>>> @@ -1887,6 +1887,7 @@ const libxl__device_type *device_type_tbl[] = {
>>>       &libxl__dtdev_devtype,
>>>       &libxl__vdispl_devtype,
>>>       &libxl__vsnd_devtype,
>>> +    &libxl__virtio_devtype,
>>>       NULL
>>>   };
>>
>>  From description and nature of the change this looks like a Fixes:
>> tag would be warranted.
> 
> Looks like, yes. Thanks.
> 
> I guess, this should point to the commit that introduced 
> libxl__virtio_devtype
> 
> Fixes: 43ba5202e2ee ('libxl: add support for generic virtio device')

In light of Anthony's feedback I'm now thinking that no Fixes: tag
should be here, as is being clarified by the addition to the
description (which I guess can be folded in while committing).

Jan

