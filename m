Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B840680E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 09:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184129.332696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mObOB-0008GN-Q5; Fri, 10 Sep 2021 07:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184129.332696; Fri, 10 Sep 2021 07:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mObOB-0008Dq-Mb; Fri, 10 Sep 2021 07:55:59 +0000
Received: by outflank-mailman (input) for mailman id 184129;
 Fri, 10 Sep 2021 07:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mObOA-0008Dk-N9
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 07:55:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87dfd106-120c-11ec-b217-12813bfff9fa;
 Fri, 10 Sep 2021 07:55:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-wO7ZVUGlNEy4R0Rmg1XYKA-1; Fri, 10 Sep 2021 09:55:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 07:55:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 07:55:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Fri, 10 Sep 2021 07:55:53 +0000
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
X-Inumbo-ID: 87dfd106-120c-11ec-b217-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631260556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0AUSXHWrpYau9cutFqeoraUwY7Jd8T4zu3u+14PR4M=;
	b=INXHYrxDsJCyManrKCYBEL0u2e2CoZoBHlGZeTHhtXb0DNN59OVwKPLYazRnDC2C0tbmR3
	ek0lpiLR3viU7wO87VEOJ4iYXP/4AZxnXxSLHmkmLjkSFjzRNytumQXQSfXZHVrw8s/CxD
	W+c1ZkcZn3UvtmzQIwtF97+i0DwaMV4=
X-MC-Unique: wO7ZVUGlNEy4R0Rmg1XYKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4oD2ATM11z4tadBIciX76Sw9vYXDIIn+P5kuhq/EH62whl6eSHvq8wiquXgCHdw57Ph7q99mD/ObjlVNbQXvazrUNXWKVWLh9lCGUAB+nqIGhKpL0vTdPBkI8GZrciOQVlZOP2yJMsuVYHltSgQOJGkfclQS91lM4HNlG/1zvBidvU668O9zZIBjdgW4Id1g1iv4f0Zp7UQWJmSKekfSEaAvguRu7exbfNK2oCSmYT3zTKXMgDZS0mqhh1obW1vOouAJ6fDN7mxS+bW68tsxyOHHNgf2tWFsIBfGwvUKpKOSIM9i3K9tA4n0rMyai8j+NAvT9y+UJq9goEKF3YABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w0AUSXHWrpYau9cutFqeoraUwY7Jd8T4zu3u+14PR4M=;
 b=mx+1rmc6FusyNCekOcKSlst451S6DRCcehtWXWGQUfSJQ5aQG6FFdkSsatLcoHYGVdTDYaEDsBJfQRAPAstc1Yvw+n50Z/JTNoPWmv/RgRo8q4xex+0m8CGphYzi/B/c6xoZesrPE29GGM0bH6eVgdgfxREEi4f/6+syi/6DLJ6Sqdu3YPggFYMT4JyhKP0DJ9//4b856tc6W7WqVafQcnldnbu/anvtLGBPOuUSlm5zTybjMy9T5oh6aV/+/XQI7Igxjfw+nXJd38xn60H+lwhDwi9LnXou4KmZTbED38NZ0nJJKRq/Cq0mFl1Zs7iE35F6usacgXmxFhz6YDppnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/3] tools/libacpi: Use 64-byte alignment for FACS
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
 <20210909163441.44418-2-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a948d9d7-bc87-b6bc-f3b7-8fac9915f3b3@suse.com>
Date: Fri, 10 Sep 2021 09:55:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210909163441.44418-2-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa41d1d0-b63d-4765-06e1-08d9743069ee
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2447CD407B8D54B103B3415AB3D69@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b+yfBo7rQUT/ObOR2PYlW0u0TWbD5YFtSwRPyFKH4y1A9lO3h51OTV5pi5q+THxfdt1ewo3auW+Y5zlK8TXMfuOfCsOVL2RUJu7BqdFNqaNJZ8qW7m2Ke5J6jQ2aOZa09zYEAE2Sfa5KbRHZ6xbEbjIOKO1QxpWlekOH1hRlRM7Z9chYwIz5/+pQXeE+NhXCIx2fi+Uj/V/w2mmPHdrYHpjtO5pqP2p/sKoY3EcddIdr6EuOBqvOuC9GRO1A/T0/MxUQJrpWtMVpM443pVrV5jh56U/pAjMjTiH+DWLTzFbjIfN9aCRQMRumTrybW0hrf3ckj/WDupKOIUakwu7wUnP0ZTOr+kla0otEB7Vgq+ZUbt8BFJmiVYbk+uMjRUR3f1SCwoPN6+fjZ+GpfKm1k8tCxKTgVAEcxWkjHbsZ/vV8PXHvP2fnKaF7QGLXjG8Tv4yM9p674JQuIz1ZLmyusWflDV+0BsuY9M7pWvheSEpNjkkjv73aU0PDCPqVNPcjmF5xEgLU6IHtAcBRZjGte9NxeTL6LhtBc/JEd60YYsj1H/NquX7/2yFzfiR18it8Tberh9+szX8G6k09JDR1+hcWqECYA/qUJUVQhoJe6t+IDXhxyeWkNKw6+3tlY/n6SNaPGgg8c5/bBhFG1MLyLRwdZ2aTgP67yzMjDKdAhveTS5jkK73xJWuIdem1Rc9NfozRiOu8Q5ilPqeEG0lVtXDDO1E18m4oMYkFnhS2/r7ZLLAGeSHPSluuUlvaZSHx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(346002)(396003)(136003)(376002)(36756003)(31696002)(2616005)(956004)(5660300002)(54906003)(38100700002)(2906002)(86362001)(16576012)(316002)(8676002)(478600001)(53546011)(26005)(6916009)(66556008)(6486002)(66946007)(31686004)(66476007)(186003)(8936002)(4326008)(558084003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TndrS3dNaWllNzl6ZzJsMXYrdE5QOFJBb1ZMRDlLdUh4KzIzVmFhNW1na0Rr?=
 =?utf-8?B?Wnk4SDJIZVg2VW5Ha0xKaWdVUm9pdWFRRE1RTndycEJ4Z2VVN1llWnFnektl?=
 =?utf-8?B?czNKMW9MN1gwYXZLWFdlUGk3UStQajVFSGo1WEpKRUM1SkhXM2hLU3dUcTFn?=
 =?utf-8?B?N1RLdUdmUGJ4cUdsSnNvOUFXbDJZaDNHVFY4aENETVY3VEpNTGY0a0lHcHdF?=
 =?utf-8?B?UHpoN050ZlpFTVI3SWtQU0VMcndSMmNMYUk5WGNtdU5iVUtiekFFb251eXZz?=
 =?utf-8?B?enVtbjVaWU9xWGs5SENnbXpwZEFUc1VaUlAxc1c2aGZJdUFQNm1SdUF0cm0x?=
 =?utf-8?B?MWJ5S1hqRiszRDVxV2RBR2lvYlF6TUJRSnNrWWZCT1pSbmppSjRSNm1XNXJu?=
 =?utf-8?B?RktKRmRVSVJ0S1V1U0RzSHBmMURwb2l1ZWJ3KzI3OUpURkFwdndmSTYzL0ZL?=
 =?utf-8?B?RzRMQXZscFhHVjZsWDM2OHBSeGJRN0g1K1l6Y3NLSUJwUjA3bzRBbktsRVhZ?=
 =?utf-8?B?Ym9GWHR1OVZZQzBTeS9JcnI3U2Foa2hzb09rNDlpRGNvRzNNc0xuWVplK1Vv?=
 =?utf-8?B?cmxINW1IYzNMNmZ6ZTZoVk96QzdQL2xlTmNzMTQ2cVk4QlNjVE93MXhYYzQw?=
 =?utf-8?B?VHNuMjdFaGlZaUFodW9pOXN0MjdVM0VUZUVMZlpiUy9GU3VHRXg5VUdJc3FQ?=
 =?utf-8?B?dUxuaWV2YnRaMHlGRFl0anZ3cldZQWtSZFVTb2hidXNjcStDRklNd0tVM3M2?=
 =?utf-8?B?UUwwWm1yVVdrdkRiaC9KTGV0WGhkUVlqUHQvcENDamF4ckxFaEF0UHFObFh2?=
 =?utf-8?B?UVRZNWY4UFkzd1k5Y05vdW1EV3BULzI0UTJ6aDlKRUVuaUgvLzRHYXBUUm1n?=
 =?utf-8?B?NVU0d1FDSkNpUnpPZTZjYStmZ08xeHY3bS8zL0lmSUFySzdYSXdPZUxhUm5u?=
 =?utf-8?B?VU90eFp0c2hYZ3JEQXV0RGEwcG0rZml5Um14Y0RtWUpxQ0hXTURnQ25wcFdz?=
 =?utf-8?B?M0hycndKbm9SVnNnMVlQSFNZNUs3L1Y5Y3FNT0pINW5MTU8vUEJJRytqWno2?=
 =?utf-8?B?NXlXazJnMVd5MHZFT1QwWlNGWWJHdlpPcTVqSnRnZncyUmhjTFpHT1paTFhT?=
 =?utf-8?B?aDJEZ2IyOUJuWHB6bzA2UjBsODZ2SE04LzZNb25OYXhocGx2R2ZYeGFkazdm?=
 =?utf-8?B?SE1BYU4xRWEzRmlpcmtZSVBlZEJvUGVaSVhQWk52amU1TkFLaExnbjRuQ1JK?=
 =?utf-8?B?SnhLdmsySFdaQjRFMTgxTktkUWEwS3Q5VjM1MnhaZ1V3Sk9mT243R0E3N291?=
 =?utf-8?B?SmN1alhLZHFPSHZ4S3Z2MGV0RVd3L01mcGkrcTJWTFhQR1QvUzNuUDk1OVpB?=
 =?utf-8?B?OXFFTWZnOUEyWWhJampLWVdrWGtRTmsrZ1NsRmo5WllQdzVVZy9YY0N3OXhh?=
 =?utf-8?B?cmx1UXV5Qjk5aUxZQzg2a2lnNVg1MVFKUnFZa2dOWVlIWjUvN0hsbkQxWE9O?=
 =?utf-8?B?bC9aeTBScEpiZzRGeSt6NnlJSjdKQngrbEhubW00K0d2MXVxOWVNS3JXR0pX?=
 =?utf-8?B?YnFRN2gvS3ZqZjlhdi9ySXNYNzhWSXl5ZEF6aTYyZGN4Ky80a2dBNjdiWExl?=
 =?utf-8?B?ZWNwOXVBRlk2bDRwTkJZTFRmOUpHeVF6c1RpaGFFdHZFM2tydnVnTDU2WTI4?=
 =?utf-8?B?d2hsanZ0Ym9qTUtqOEVvcEpOMFBKUkF5VUN4bFJUK3Z2cUhySTBKcjczcCtF?=
 =?utf-8?Q?DXAqgZJFiiEVpOlAO10JiIXwzCyDyd6rDL+IhuM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa41d1d0-b63d-4765-06e1-08d9743069ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 07:55:53.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz9tgDQTztLnrmtjc9dMn4vtELbQeU4AwJXg/ggZV9UV6q5czoDoFIPMOEospWaXecxfOb7ku7kyJOl8ZG91FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 09.09.2021 18:34, Kevin Stefanov wrote:
> The spec requires 64-byte alignment, not 16.
> 
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


