Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47F4B0EE9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 14:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269853.463982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI9cc-0003h4-DJ; Thu, 10 Feb 2022 13:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269853.463982; Thu, 10 Feb 2022 13:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI9cc-0003fE-A3; Thu, 10 Feb 2022 13:36:30 +0000
Received: by outflank-mailman (input) for mailman id 269853;
 Thu, 10 Feb 2022 13:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nI9cZ-0003f8-Ut
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 13:36:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72081182-8a76-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 14:36:26 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-5jbB1LiMOSCcdehwqa4hUA-1; Thu, 10 Feb 2022 14:36:25 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5457.eurprd04.prod.outlook.com (2603:10a6:208:115::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 13:36:23 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 13:36:23 +0000
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
X-Inumbo-ID: 72081182-8a76-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644500186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+tznKeogrT57KmWNOatTCYgVS8pizllRRCBa+7DxEI=;
	b=dLEBA31mcWnJU5+6voTKt3uYv5C9dQ57z+Vk99dG/oDl6AY+c5hAHBz+s/KLSrWdHQ2i5r
	N/BzZtvoZQBNxKyUbGa4MwHH+55NlSc/phYN45c7B5psQ/BhFPhSzAHfcii3BFEDii5DeF
	ysLH37pmGtkh0TljPYnNQIbk8g9s96w=
X-MC-Unique: 5jbB1LiMOSCcdehwqa4hUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHXCKcXJp4JR1MhHPd9U5mUH9St8MCv7tWm4CaGfSNpmqmGwL2oG8BmCWK3giCFsGEQmGhoBoyQSQLiK7VF9EyAFnvu+duaWi9gnhPLmxO6sNaO4BQe2e6SDd3j5qUU0hRZI4NqWcp2HKNqNLrZZp9XVjLzHA88dWI1v6h9HHuFkCFRAG8M/YKA3pHfPHhgipiD97VJJIliPEuQFZB2PPkGobcF8OGrQLtppY1/U/BkDP4LHZm9OC3w/WPYw+KuyQf6WH4LbhxSrOsve0V3Qv6UPaJrdAvigQNiW7AkCVvsh4mFu1SyqxdZ48zjjjRb+dnF+a22+6YkLNTF+RekaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+tznKeogrT57KmWNOatTCYgVS8pizllRRCBa+7DxEI=;
 b=cNe0gmuqt341w3AymaJpU6gbA9A0pCQ/jqlSpmUeGTMA4BnK6V2o83veXryDzl/voFW+vG5eUPz/JpwAQNtnPCV44ajk2GNlg0fRCCuKx9LbF1wPHLX1VQoup9wraLUyqYQDcpj/UMG4DpLB5sr3JgLzC8RUbkpWznmV/EOG0E+8+LF+OsGA+fl3Db5cTEjN0ugVmIZMfFSM3VvXKdvGLHuWIu/C5w6dwbU/mKtZQvf4tngzNHyrOmysPWrTArqFRuBou7Ec6kz9TQIpCAZM1XSoXsQt5zdfgpbZmPi4AktM/iTuQmUInze9mFuYn2jwlI30fwQz3tLrVIMyExOsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33d77918-aee6-77ac-6999-2277f5db8850@suse.com>
Date: Thu, 10 Feb 2022 14:36:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
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
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
 <22084dc5-ba16-3e63-8be6-a8c5c79c9cb0@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22084dc5-ba16-3e63-8be6-a8c5c79c9cb0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0141.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::46) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e1824b-8fc0-46fd-6f70-08d9ec9a5446
X-MS-TrafficTypeDiagnostic: AM0PR04MB5457:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5457F60542784ADF6F8FDC04B32F9@AM0PR04MB5457.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Dqo81rLkF8baI0Shc3SZvUuDrC4/VmEFOKsWVTFRi4jD8ayBm37kkXD4zCqGWKnM/wL1ReSUpArWf4VwwjySkKlZDSJTlMLNfJTC/M+Gs2WfdEYmhfKraRFlVVzXfNmzxPT+BBdWcVowETO7UozqUol6ChLOX3Qj/4LQVtSXkRGSat8mhFLHDbiTxNlvpGRAY9OQstOuXLpsTShVZe0kX96z8JMmzrgGmVDTM4MAVAhyywdgFZ89PNO0W+5fAzsesczaDMDVOvT1a78IgkYuE8imGALiz+atgG83fXpqm6ic2MggpPq5MgxyAIKPVNCflLhNzZAOjnbgtU5gb/CSdcWg9tFD2skjAGj0vJ+EAjlCOD27p3ufYtL/j5/bJmhVRQJfXP66kcDwmNO43AuhcBbwwYOEuceJkbMDyM2gnXzWtPM5chlTa05yNpOU3dE26Msn/V4y4h9HWVcLr6EfQGZfEKtCaiNNzmCRW9VYHgGWckFL6SYI6DH8i4uy4DeeXxznlj87DRB8hX0W1in/nXpCsws/cBkuPFGKSqDxdn35n0C0FA32aMQfzTdWeQF3XC19ggrEc3ESLfssDmUwfGswUXQ3T216NNJMg/yg5iHXtHbrxNIgN9dVNVaRcMuGFu5reAnukPUGxEPLhf2sKGRgHwfuKv3/FUJTXobh5DgY9TxAVbg09YOXhRyaWamsV1u7FdhhqSNgGspqpxbLAkwOapgd/kEvPk7OjKkQM3QkIHMz5auT10N6k/kau3k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(38100700002)(86362001)(186003)(26005)(6486002)(508600001)(31686004)(316002)(54906003)(36756003)(2616005)(2906002)(66476007)(7416002)(5660300002)(6512007)(4326008)(6916009)(66946007)(66556008)(8936002)(4744005)(6506007)(53546011)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdEdGhyQzlkRUVzWGwyY2F5MGlvVDZxQTA1T2t3QThUYktZRHk5aUVxVENF?=
 =?utf-8?B?a0FkRFhVNUVaTkNid2xKTzlQYVk0TUR5UUxEYVZSRTNycFJxZ21sMjdJVU4v?=
 =?utf-8?B?S0pUUzVqTDk0ZVdrYlNUbWFnb3E2N093SkUwU21TOE9NTzVqbTJhaUNMR3ho?=
 =?utf-8?B?b0ZnZE1YQXJlQ0dZS0ZGdFdzUzQrZlg2TnNMMkRaRjZ5TUlaZWNobFhFOUpP?=
 =?utf-8?B?WkFhUmpIRG5RKzZESjFkLzU2Y0I1am1OdXRoZkVlL29FSXlVNXRUV2svN2Jj?=
 =?utf-8?B?VUtib2pXaDJrRkY2VEcwMDhadGsySGFneWMxS2tUUnAySGw4SC9BSCt3aWky?=
 =?utf-8?B?bmI2NU5yZTBvdlI5Zy9pWElKNFo1c1AydnBQekNwdmlaWkl1UVRpSnZnYW1X?=
 =?utf-8?B?N09vWi9CbTJzRU1wV3YwK0J5VURlSERnN3F1TkZnYi8rVUhKOFhFblZ5d2dz?=
 =?utf-8?B?anFscUJ1RU5mbjdYMndjSjRpNGJjQkh0MmZaZGc2ZDJUbHN0bGFkelA2cGQr?=
 =?utf-8?B?aUg1dFpzMXBsWE1KVk91MlRxK1c5STFsYnZrT2QwZXB2SlN6OTFsQlZPZHZQ?=
 =?utf-8?B?WWtMbUlwQ3I2OWdaNlVJQXhtQ0hqK1g0VWV1TWxOc0VJM29DL2craWpyVUJJ?=
 =?utf-8?B?VEZnZEZkTFZVcU1ZVEVFWHEzT1p5dG9lYzAwNGd2bkdIc05pQjhpcTh6ZnhV?=
 =?utf-8?B?c2FQb0g2SEVkOVFHYTZLK1BHQ0tRQ0c2NzBxZDNlZkUycjFlOS9SRDNiNDNF?=
 =?utf-8?B?UmM0cUtZOTk1eUlHRE80MTdCZ2pZa0hQMDhmbWlSTW9IQmdoaXJLZnkvQ0FH?=
 =?utf-8?B?Qyt2THZjR3IzQ3h0RXpXWWRLOVBaQTExc2M4VGE0cWxQVEZ1cUtLbHYxdXAv?=
 =?utf-8?B?bzR1alFQZEM4emlnQmE4Uk5HR3VGQ3Yyd0dMZ1UyUXFLQ3NHTTJRMHFpMXdM?=
 =?utf-8?B?Sk1vU0tJOERjVUhhUnBKaWpMT0lTYlJFVTF0NmlOYzQ2YlduWHRPbmNSTGV5?=
 =?utf-8?B?VWNjU2xrakNwblkvclJrMDI2WjBsNWxFa0ZwNVd0aFZYQyt0V2Ztb3pkc25j?=
 =?utf-8?B?cHR2dmJMcGJFS2xpU1lwMzVQVmlwUGVzY3ZLMjdQNis5elBpL21VcDJJNXdC?=
 =?utf-8?B?VzExb1dOZEJtTHZBK3QrMHlBZktIemNQRnRENVV0MTRUenp5UVRhTWZhVVU0?=
 =?utf-8?B?djFvN0xjRXhtRWNKMVZvZWpnWmRUeG9tc1lzRWFGeDFBS0RXa1NUcmtXY3hl?=
 =?utf-8?B?Y3RZOG1kK3BQcDliOVNNbG1waWVxUGxyNkNIZ1YxMWEzU0tTcXJIYUF2SFR3?=
 =?utf-8?B?UEhsVUpMQU1ya0k0UW1JSFdoZEJuYU1JbGE3YnUzT1kxdk1odXNCYkY0bW0z?=
 =?utf-8?B?elljZ3ZkTkhhQTJKdjBOZlFjeDcwSldWVXRxaXpYK3p2MFp0NmR4RHQzaVY3?=
 =?utf-8?B?NUgwZ09BUkRhVnl0QzdlQ3NEL0VwYWxCUUg2eXhRRUU5Slltayt4WitCenpC?=
 =?utf-8?B?R093cjBTengxVElNNmhjSlF0MWpQRjl3VUM0QjNPN2I5REJJV3JudkJmUUV4?=
 =?utf-8?B?VkdZeWk1RlphL21mK0dVTUM1UTljU0hKRmZEaFoxOEVQUFN1SnBNUE9WSCth?=
 =?utf-8?B?SkdJUk01NDBkMmlBQnlYeHo0aU9uSmRxR0tGenNENC9HSW5RZEoxVlUxUXpm?=
 =?utf-8?B?dEpjTXpOVVVCN25YSWczU1N2N25TemRuYXp0eER4TEZzMnZXYkYvVmcybXZu?=
 =?utf-8?B?bWlBUitna3hvZDVCdGFoaUdEdzN3UWg3V1dveHhiSTFqZUhuU0VrN1ZSUFhO?=
 =?utf-8?B?Sy9QTDl0eGZmbno5dW1iY1J1NlhMQ0Rxa2gvOVpuT2k2a2ZwQkl2Uk1HWDhI?=
 =?utf-8?B?VXE0VEU4eXo1TGhkRGNwdksvMGlVNzdoeGZjbVBkTXlZTlNtR3RtbWV5aG9w?=
 =?utf-8?B?Zk41TDdRckpXb1JEYUlSU2QxYnNXMkdzdmgyOUtyektUVmtMbzdxdlMwMktY?=
 =?utf-8?B?T0NzajlFdzA3NkRKLzVxMTgyZUV6SEJ4UDRUMkpTQ0FZVWdqQVVLMExtQkV1?=
 =?utf-8?B?ZGs5dHBxb1FuWHZPbE9BY0xtRGNKMitHbFg5cXRGdU1OTEUyaFRLcGhyZ2Fm?=
 =?utf-8?B?QkJUWXZTcEh0d0FNMDZydittWTVLR3Jaa0F1eDJmbTA4dmNJamE4T29KR0ZF?=
 =?utf-8?Q?EtQApqgGx1e5b+2JDgGZrAw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e1824b-8fc0-46fd-6f70-08d9ec9a5446
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 13:36:23.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tY5dBUZjcjZN6WL8gcWZTwH4yU3lSNB7M08XRFYSUPKQ5quMAm3Fbj1mW2F0l8rcsMEFboayV5ybOj+hVIE8qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5457

On 10.02.2022 13:54, Oleksandr Andrushchenko wrote:
> On 07.02.22 16:31, Jan Beulich wrote:
>> On 07.02.2022 15:17, Oleksandr Andrushchenko wrote:
>> But: What's still missing here then is the separation of guest and host
>> views. When we set INTx behind the guest's back, it shouldn't observe the
>> bit set. Or is this meant to be another (big) TODO?
> Why not? This seems to be when a guest tries to both enable MSI/MSI-X
> and INTx which is a wrong combination. Let's pretend to be a really
> smart PCI device which partially rejects such PCI_COMMAND write,
> so guest still sees the register consistent wrt INTx bit. Namely it remains
> set.

I'm afraid this wouldn't be "smart", but "buggy". I'm not aware of
the spec leaving room for such behavior. And our emulation should
give the guest a spec-compliant view of the device.

Jan


