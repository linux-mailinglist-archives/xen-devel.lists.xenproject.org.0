Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A13F2B99
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169480.309600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH37V-0008Gx-13; Fri, 20 Aug 2021 11:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169480.309600; Fri, 20 Aug 2021 11:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH37U-0008Et-TW; Fri, 20 Aug 2021 11:55:32 +0000
Received: by outflank-mailman (input) for mailman id 169480;
 Fri, 20 Aug 2021 11:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH37U-0008Ej-6A
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:55:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8dd7dfd-83f4-4660-b232-9d437fc89e41;
 Fri, 20 Aug 2021 11:55:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-ZZKFO3geO7GKOJTXM4jPuw-1;
 Fri, 20 Aug 2021 13:55:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 11:55:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 11:55:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 11:55:27 +0000
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
X-Inumbo-ID: a8dd7dfd-83f4-4660-b232-9d437fc89e41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629460530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8xAUhEBDar5YM7Ezl9VSQJIR+KltFHLR4zA7sENwrw=;
	b=N5yQf/hLYQ8XdTQOf2riDRe/ziK2S4paf50RFLv/Dm2056xifF6Y3vyj3fk2HFrQMPQ9co
	bGFM70R9cvEt8K+bSNf/M5B7OjWL61yzx0Pu5+cSHyerdIRPxnzywK7B473w5a5qb5OkQK
	uEYdqC5VpZs3gxLX09fCndMF5QpcRk8=
X-MC-Unique: ZZKFO3geO7GKOJTXM4jPuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPH7rR5aW1Or7Cqdg6fq1k6dTgQxcwMqXncAGSXE0RsrdBVulOcgOkrQZhD4GimC+oa19io/LgfsOb997kXzSePhUbROj544YV+V6CRTxQNl9HWSwtzM1GkH8BjigZ86wOkI+S8dxNtZLw7ORER3bVVt2ofVCtcF+O73vv9hHuCv0ubRNeBA4GTFv48twie9m7emhfbgKh4elZKFuoPWRLon4rkFEoWxmZZAMAHkQVbZaLMfKO/dO90WFTRZRawsCb3rKbpqXJvYxYx+334J669vBpJBDCc2BAeIabGzBSJjd/RbEzuF2gub4UlPxlS5z9KlP0OIGJJI0sbJjV3Now==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8xAUhEBDar5YM7Ezl9VSQJIR+KltFHLR4zA7sENwrw=;
 b=LrdcRGZishHOdx9ZeOZHpDEU5wVd/rKn36YE6p+lU81OTpF6dgMgrE5efJYgjHJN3PrZR5Saww2/9kK9BrNrSah1nPBx9P/iNuI7Qeall/Da4n1jmNzq8wgHVqwAuAf/Py9g+xidIlVfQ71Y0D+1WSprQmzIFvsROt/Y+55PS4aOYa5ESwW+nUq/fLWZyNKf7ZoznVBxNJb6ORUXyuTLmxLL0EUg7qvhJaBNbhnY1SNyS7N/qINI/Me6Fbzf7SIylrY9ikdguCgLPbcAd6Ag8eYDEB/XqXuIVlrs0rUugMMfnkqKQnylSfE0u2PWGHjmVTa/FjzvoSv5X6n1TAGIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
 <a0d06e37-ec02-9968-01d7-907176c7c9b3@xen.org>
 <7F8FC9A8-5580-4517-BF8C-640BCE778D02@arm.com>
 <1abfb3cb-993d-3389-c627-6b8cf40457a4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09db7641-5cc8-13dd-f19b-558f7676a5a6@suse.com>
Date: Fri, 20 Aug 2021 13:55:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1abfb3cb-993d-3389-c627-6b8cf40457a4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16afc633-a598-44d7-fb5c-08d963d1670b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863EA45099B478C48E58D09B3C19@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GF7bLuTewAZwF1K77DXrkd2nkVVZiXczGL7hhXxltp2Xpvv/n1EtoaVxfVS2D/bs+3bMNzuAg1H8ZkQmTE34JSk2y7Rq1q14DSjoE+z/a6PpI1SjML2um17QTg0I3gRPxctJOXiPbVy9PRO1g+ul9Q6iOF8PfuwQDVowxSn9vQW0NMOdsoT+BA7qNue/LFGTDEqkgIZYDA+JFUKcRO6yqunhECNT3Jz6/udqCeK3fOVjiVOYs2vXOVn2d6kIUjurewbZZ5RBbfrcpRTirciQKbMqEidQKl0l3AGqco5i64GIMvcXRkupalm43nKngaM16HHq5Awsd4LbOf/Rk3r6UsQ/vSiGgvQ7Rg0y4x3fK2ix2l3nX8KNIkjQ3F2ghbr+WF9jkIFXgEQkdrZ5ZAFCVKZQ0LUbKKTtEpUjQNmF5jeOm5hGLbLxTamEc1UHTYVbnSWVgkSjIPodkk/tVZLWjQqO/bLB0qZFgBLlyDAVJn2jz8dGPFV9Fyqz8F47250v0eB9LctIqIH77xRP5xVu0pbHqjoVOpTqe4n/FIB/wRD0uKuP3DTOI4Md5aFF5L29kz9EH3PnPJfHm6cKEStL4C8Zasrh8m5l4l9kE4GrR2LhncfE2LphL66ORIOykBwcnqUdIcUQwjT0iJYlcC7W83AU8/UbE940tyWKyrgH8qd0BCgWkLBO+E7OPESycc8XN7Y6a65FMbWbkwngI2HdbO6wIWgbhNqduQW9vQnUh5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(39840400004)(136003)(5660300002)(956004)(38100700002)(31686004)(316002)(86362001)(2616005)(8936002)(66946007)(8676002)(31696002)(66476007)(53546011)(186003)(26005)(66556008)(36756003)(4744005)(4326008)(54906003)(16576012)(478600001)(110136005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UitQUVNYKzJHSmlJclJVOXo5bkpVVjVuQmFxVlNtTnhlYS8yd1gwSGdWYWFn?=
 =?utf-8?B?WnZMWTcyNmcwclFmN04yNlJ3TDBuQkthdmhJVmZGd09meE5FaUhERXF0NnVY?=
 =?utf-8?B?MWNSVEhUd1dyOENKS0FoUEh3RVV3a0YrVXIxeVRQNzlsUWU5czJtTVNCRkgx?=
 =?utf-8?B?dDR6d280ZXIxYVFmdWo1YUZKYVRNSVFIMHdKUFNYSlArMXdkZUlPMWZGNmpH?=
 =?utf-8?B?OXUxb1dsZFg5SFBHWkFPMlh2bTRBMm5ZY0Z3M1NKZC9iRXorS0FUZlpkWjA2?=
 =?utf-8?B?dUZDY3lrTzd0ZElPSzBoUFlkOFljRklvSERjMzg0bU01eGEzZjBib0VuMmJE?=
 =?utf-8?B?TW9qMkhmZlc4cC9xRUU3N1JUTDllWnVhZjJjZm9uT3NvVnVwNW90VnZKUWU4?=
 =?utf-8?B?MlNxSEU0NXYwRjBtY1JXZ3kwZnc1enJ3MUEzbXhxV3VoSFo0SXpVSnQ2SDI1?=
 =?utf-8?B?N0ovQklOY0puUDVNZWtkUE44UVlyVW1MdnpsaDFsdFZVUHkrTmxwU3JwbDkx?=
 =?utf-8?B?RHhuZGozVHFodjEvT1VTbDJ2MWtOYjFuR2lieUhGRm1xZGg2TXhuOVNDU3VZ?=
 =?utf-8?B?blg0RWR0S1JSQmpISzFDeWVCTXFvYVpZQUV0VjFoSGlnV2NPL1JBRmtWSUI4?=
 =?utf-8?B?MnV1SWZHRExaZ3RBalYvcEZxRElFVUUrSTc3QVFkQVp1eDFiYnU1ZW0rVS9o?=
 =?utf-8?B?MzViNG9BMjNrLzAzTmovbjlSb0pFdUVDc3dFZ2hEVEw1RDFvdWx3V0pHQmhG?=
 =?utf-8?B?ZEkrblFpSHZVZTc5UjRkK1pFNVRpNmFBczUxVVpmUEZHSWpWdi9JbDEzWERJ?=
 =?utf-8?B?OVhoNGwzN25TY2RSeGNneXByNmduNzhCMzl2ZDhSRU9VM0pzMUxmSGNleWtF?=
 =?utf-8?B?TktzTjdpRmtiRE1maGVlZEVOcnlLblZrb0x1cERkbUxXTWk1RnUrVVk3dnI5?=
 =?utf-8?B?Z05DWUZRU2hob1FQVGVVeWNsRk40YXFlTHl4Njl4MGpOVFdtYll3Mi80ZDNQ?=
 =?utf-8?B?aWhCbi9KcXVMc3IxRTZsNlFtR0wvZXl6WDZPelB1eCtqZ2ZGaGVqc3hiZndp?=
 =?utf-8?B?bnc0SFJCSWZBZ3BLZm1wbkFGczU1OGVueXJiVlo1dGZYMTZ4dWxiS0JENWli?=
 =?utf-8?B?TVYwVHRGMnhLd29NRVVYZXpoT0VOSE1JdDUzWllSMnRoTWJwUktHMHdLNy9N?=
 =?utf-8?B?VkdzZGRXdkZNTVkwYVVMNEgyUUxnbGxrZVgrNzZxU1V4eXpXSzBMVElYRDR5?=
 =?utf-8?B?OVVwdTVjWk1qSWxIcXZpb3ZXVUpHWVdFbjBnY05kUW52NFN0RXY3ODZhV1B1?=
 =?utf-8?B?aGwvWEZEVzlGRGNWb3RBaW5EUHVRZ3kxbDdNa2xFbmJscjM4R3pJSXBJSHQr?=
 =?utf-8?B?cGx5aEI1cnMzY0RDN1NyZU1yOUJmbGwvczhZV2MxdjhSMG5mc0w2ODNtblNs?=
 =?utf-8?B?cnBqU2tjM0hUZ2ZYT1U1VGlSb2Qya01Ha2FweWdFUXFzZ0xYZEI1blRZbTQ0?=
 =?utf-8?B?dU1seHFNMUJGNTdvYXduc1ZWQzBqR0hxWG1RNGlZV1B1Z3Jrd0g2RjQxcW9t?=
 =?utf-8?B?dGloZXQyWHh0WXlpY1ZjNmhudmlCMis2Y1hBSlNvUlFIVEhOZEhvYmtyanpO?=
 =?utf-8?B?eGhXWWxCdkZuMk1SYlA1N3RUOTZ6QVFZS3VUVzZ4VDJFWHlnS29oM2xMR1Ja?=
 =?utf-8?B?MlhNVE9hL2J1c1FtcTYrSVM2Yi9ScGg3dTdzRzIwZ2wweWE2cXA5LytrWXE1?=
 =?utf-8?Q?KrTNokpaVz1TmbBleYZLVFzgQca7J5LnUL8HFrK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16afc633-a598-44d7-fb5c-08d963d1670b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 11:55:27.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dph8mGFz/To3DqYcb6DEGbgaYJj4en283nGYjzkn05IRxh94SCbBjb07GIlvV3wVXizM9HVYpzlWUTIe5EmTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 20.08.2021 13:37, Julien Grall wrote:
> On 20/08/2021 11:30, Rahul Singh wrote:
>>> Please add a comment explaining why this just returns 0.
>>
>> Here is the comment that I will add in next version.
>> /*
>>   * Return 0 as on ARM there is no pci physical irqs that required cleanup.
>>   */
> 
> In this context, PIRQ means an interrupts that was routed to the guest 
> and could be mapped to an event channel. We have no such concept on Arm 
> (see allocate_pirq_struct()).
> 
> So I would write "PIRQ event channels are not supported on Arm, so 
> nothing to do".

Does this mean ASSERT_UNREACHABLE() might be appropriate here?

Jan


