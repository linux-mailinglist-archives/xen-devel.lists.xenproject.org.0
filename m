Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA42456F05
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227856.394200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3HA-0001AN-JR; Fri, 19 Nov 2021 12:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227856.394200; Fri, 19 Nov 2021 12:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3HA-00017s-GP; Fri, 19 Nov 2021 12:45:56 +0000
Received: by outflank-mailman (input) for mailman id 227856;
 Fri, 19 Nov 2021 12:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3H9-00017e-Hi
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:45:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2598604-4936-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 13:45:54 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-JwAVNPjwOv2v-NOTLV4egA-1; Fri, 19 Nov 2021 13:45:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 12:45:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:45:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 12:45:37 +0000
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
X-Inumbo-ID: a2598604-4936-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637325954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgkxDi+g+yAZAflnhrwVtM0vlYcq/0qqjGv7gaV7P7Y=;
	b=OCx60+YcQRE5PALfJgTj5QxOlPIDNJflrcClXoq19QRjdDpDfXnNHBklAVhWRjyVGVOwYs
	bzf+8K90JqOdeozZ9VOOpqLVaVMZmluuLrmmYJ7y2wPu4eG7YQhlKznY8S4D+PcG3uvAu5
	ZOl5veIXIDUZt/BW41lGnJYrQl4l0I8=
X-MC-Unique: JwAVNPjwOv2v-NOTLV4egA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/dQP3IUfjpK0lKXLdmmYmhjJNWx/dnQzNTWWmDkTska+riwGLJ2MAq3tYc0n5lB/mfo+ebWXvJqT5AH9qeS93UPX8W4RKGFJfR0LPPlWKUafOFkaeFZIpudl0mT9fCYfdWVDp5MuPvir/XkY/z3zhiIdBO/YS0enUG8D9QC2LLjyiwOCFJkpbGHVqzXJO/1C/H/WFabhtdK0cqlxyARoEDedFN8XC3Kr3Is7s53auy93ZilBOzRiOwKchJzfVPX+4yOMo6FlS+iNAuoJ4bKieeKW071ZWUTLnHp2si9T5SMWCxbeZ/oJDJn0lAeq0TWZHAyrdWLj+hB65yo51j/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgkxDi+g+yAZAflnhrwVtM0vlYcq/0qqjGv7gaV7P7Y=;
 b=lWa20ovA0ETsJvUV8pj78XoDfc4EllEZPQYzPbs0IE9MdBjI8nVpM+LxnsfyJRnsJrrlKHXP0CvsP1m1qjmGd2jJSsGoqCKh/4Mrnohn7gmoYTW+7SKfMLG1ZEzD4vbamu2HrKOFI9S7to7vHRmma2RO3eqvO4iUNb+Rtpu6qxzePTz+bsHVT+90QDrXMqWHdvlqUFaYjB2kbrdM3YUQ38hq0cv7/T41+/D4EWRs+XT8KUJI9kbhBKTw9BbzrjVSYYiHFRLL63DfZ5kAPax/cxHjMxt6KeJTVMBBpvz7haRSwIPUYQzLdVSChYWTBDlfi4AOE+7mN4GY3clNvBzR+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
Date: Fri, 19 Nov 2021 13:45:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
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
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
 <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b920f56a-47b6-43c4-6598-08d9ab5a845a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192267B7026171DFB827537B39C9@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJBn8Bp8dBgU9esICAozFHagp3GhKr82BLbPLnFOf5AHnqraxIIcZ7WfVTIxwkwEJvY47TCxyFRFv06A0VilcR5g6e3vgCdly19gbemxBJZjRdG7bjkAFM2sRNO3r4uWau9k1rQrvFLNZVKWIJY10A69OlLEnaUs4LOBrrcZLcx7VL42k0RWCg3oFz0YXMolW1GxUiCJMfVN4cTvGHRAoxvYYmQYpW89WSW9uQllHSAe6RoSetQdeEnl8z9B1JzCJtp1WoE2YqE9k+1Up4SbB+OeH8xjSa88P0BOE/wp6Q8C0rljzT8b/5EQFN49+LN/7JxzWz1AOdmtpQIR26yrICMQNiAKOR2dmS9nHNhUU6ecniIj5bL3yJ6iFzF1qE8yg3KoDNkKXdRbdUgzby6cc1c1IzjQyqqVbWf+hgOrlrS65rb9dtUxrbO4W3hgk+MDM3dtS7ruxULeqPNRt77AuWmAy1ZEdjo/NOxcJL9lnyfKpynhZN/rbfkN93IqGfjPKAhUEHvJ7H3kq2TvUFOus9cpLT826VY3gEfUpYaGNlJ2JWwwGNjJjfdcWvHCBbaw0Tr7kq6hKWkDWsjywTBp6rVPg2Szb4HG7S7QhE3hCHKJgeJYQKlhN996A8ySvrSEDh1UKXQulBJr5f14ZQdStk/BfINCqZelAHWwgFxc3Lz61wQ9ICzuuF3JlsfQDGZpzcLk2smKq2coGdZPaMVE2pk3G0aHju/tOZZmDAHJJN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(54906003)(956004)(6916009)(53546011)(31686004)(508600001)(2906002)(31696002)(7416002)(2616005)(16576012)(6666004)(38100700002)(5660300002)(86362001)(8936002)(36756003)(66946007)(6486002)(66476007)(66556008)(186003)(26005)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmJ1MlE2bFIrMFg0bEdMTHRtSjZid1ZaNnV1Z1VFS1VzSWJpSDB6YzlUUmJm?=
 =?utf-8?B?MFNlSDFEcjBLL2Z5Z3NIK2x3MTh6QmFSYWF1d2NhNmwyWHhEU0lHcU8rSzJR?=
 =?utf-8?B?NVFPeHk2OWZmdTcrQ3MzejhjdU93cnBzOURRbDlxblF0Ty9JN1o2R3p2aHc5?=
 =?utf-8?B?Y0hXa1NsL2dkYWhRM3I2NkFBRXB2MjZ5cjUxWG90YXRoMm5oSXlRRXhoN29U?=
 =?utf-8?B?NHI4YXJVTWlmNTl4OFZaWEZRS0dPRmZzOVQrcURFMzFKazNiUThRaWdxVGdV?=
 =?utf-8?B?RzNyVXFlZ2dQaGRNT3p5ZTJWa0EzYmIwMThpS0dlL21DU3pPY2xVejl6NmFw?=
 =?utf-8?B?OTZzM05rSlBNZWdvckU5ZzNBSU91dW1BNFkremxTZHQvdENhWDZQdGF1YlFv?=
 =?utf-8?B?emhBNnp5SENtRmd5RTNFdEZraHg0OVdmL0V5aHYzVmRoQWJWYm1JdkhsYzk1?=
 =?utf-8?B?TXgrWVMzQy8yL3FFS3VZVjQxNC9KRlNPT0Z6YVhteXU3R1pSL2FORGdVM0kx?=
 =?utf-8?B?Tlc4VE02OVhNNkNaREtiWE1mUm5Mc29EUkIvL0tNNG1rZUNMOEtFeDRMTGxJ?=
 =?utf-8?B?UDZUc1B4Z3VzRTBqbCtsdUxoamNZQjNMRHhlWHA3anJ6SjEzakFqUWtCZjNZ?=
 =?utf-8?B?VnpxU0x4QWhTak5aM1hhQzJmTmgyZTZmYkpUWkpQcVlWZGw3b09XeFJ5VXBK?=
 =?utf-8?B?d09uemI2Q3QxYVFDZ2NsajNqYmtlTVFBVHhQSFNlL3FpaHcxVEZtWmJxVWRo?=
 =?utf-8?B?THJIcVUxY3BSYXlyMWtWUUo1QkhyRUFab0JxcjVZSjhETng1MGprNHdjblJM?=
 =?utf-8?B?QTFBb080akxkWjhtTGVlWTZGQ0thS0hnLzlHOGdJTHU1NU1qS2I2NXJ5TFd0?=
 =?utf-8?B?KzBpcDJCUHdQUFBVQWJmL2k2THdyclh3SmNKaU9lK0JmYm5rb3NidVRjRkIv?=
 =?utf-8?B?QTRYeEtiVUFXVThFdld4d3diOElOMXJXQ1FlUVVaOFBtT0I1QURLZk0xcnU5?=
 =?utf-8?B?MVV0aDExVVp2WW1kZ2hqOE40UTVvVVhEbC9OeHlqckhmbmRlUHRtQVBOcGMy?=
 =?utf-8?B?dU5oWk1mV3RMOC8waU9TMWFZOTVEUnFtVVZGc2ZUcUdVOVFvcHB3K0lad0Jh?=
 =?utf-8?B?TjhBRklGdVR5ZzdzOWsxbHVvMDYxcHQ2MDJoRnNPSVpUYXJyWUIvUzF6Vm5k?=
 =?utf-8?B?R0c0NHMzbEIxNmJKcU9qMGRHZUxkRzlDdjREQWxaTWlNb2ZpSjk0Z1BiV2N3?=
 =?utf-8?B?M0liakJSN1hhVzVvVXo0UHkzSVllR0ZXWTdsV3JIam5hRTlGOVdPdlFla0Nu?=
 =?utf-8?B?YXppTTNWRGNTdGxnVXBHZUhkb1FhbzRMMjVIOFlZSFl0TENPL0YxV0N4ZjU2?=
 =?utf-8?B?YkxMaHcrS0U4OTA0SjJaVUVoek1QcHQvTnF5NmkvN1hSeXNVQUJmMHRTN2Fv?=
 =?utf-8?B?aTdNV0NWQUVTaFhxUTVkQ202RUxtVndERFUwcFB3Q1k0RW5CK0hYMVBjdThD?=
 =?utf-8?B?N3RnRnBvTnRlRzU2Wm1YWHpKL1BNNFJkaEhIeElyTEZJL2hIVXF2ZGoyM0F0?=
 =?utf-8?B?bUVBMndCM0xMdk45NWZNc3RhYUkvaXFJYUFUL21VTjc2c201OGtkTHppay9v?=
 =?utf-8?B?SDdmcXJRdVArTy9SWFlSdmlLZ2w5TXRrMTk5SUd2TFdwaUhLMXhuNDREcTYx?=
 =?utf-8?B?cTN0Sm9MTXJDa0JZNlZXVWhwRHZiaWh3ajVwMUJLbThPUS9tZEFNTmdZekxZ?=
 =?utf-8?B?aDdXREF2QUNORDFCM05OVVRySE1nZUtaNFVZN0ljRmdrbzVaSUtOUnVxUjM4?=
 =?utf-8?B?aGV1clhuY3hiSjFRNk9odi9Ic2thN2ZXckt1THp1YTlNczJBek1NeG9kbjRx?=
 =?utf-8?B?dkx1Wk5wZWt0bXJya0liU0hhTHNUb2dkSXNIRjZxckxwd0JqU0VuNEp6bEd3?=
 =?utf-8?B?NGlPRmJ3Q3ZDbXNMakdudXZBbDRmUUdXZWUxR1FnRzFuYnBVek9WeXdTay84?=
 =?utf-8?B?SVlzREYwczc4azExSWk5cmJEalpCenVySitIWTQxYmM5VVZRZVY5bnJRUDF6?=
 =?utf-8?B?RVNadmYrL2RnVTFTbXBaWFViY1JrZThUUEVScGI0K3ZJOUsxTHFLQkxWQUNQ?=
 =?utf-8?B?YTJiemhURnhGTHI2UmVZN0Z1ZnpYcm1nejlWNVJsV3RBODNwWE85VTJLenI1?=
 =?utf-8?Q?OhQjmkkflXqB8n0wFEsINSo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b920f56a-47b6-43c4-6598-08d9ab5a845a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 12:45:50.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0I5Ib1jIbhw9d0f4Y+NPxmfkWVGQKrf+JDeoKOHqDvNlzfCbhB42yoxUT/iKbLE8y6urI1Wxu5dN/3FVOZdcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 19.11.2021 13:13, Oleksandr Andrushchenko wrote:
> On 19.11.21 14:05, Jan Beulich wrote:
>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Instead of handling a single range set, that contains all the memory
>>> regions of all the BARs and ROM, have them per BAR.
>> Iirc Roger did indicate agreement with the spitting. May I nevertheless
>> ask that for posterity you say a word here about the overhead, to make
>> clear this was a conscious decision?
> Sure, but could you please help me with that sentence to please your
> eye? I mean that it was you seeing the overhead while I was not as
> to implement the similar functionality as range sets do I still think we'll
> duplicate range sets at the end of the day.

"Note that rangesets were chosen here despite there being only up to
<N> separate ranges in each set (typically just 1)." Albeit that's
then still lacking a justification for the choice. Ease of
implementation?

As to overhead - did you compare sizeof(struct rangeset) + N *
sizeof(struct range) with just N * sizeof(unsigned long [2])?

Jan


