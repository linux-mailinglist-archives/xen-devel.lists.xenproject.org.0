Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C168BD0E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490345.758989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0ll-0003b8-7I; Mon, 06 Feb 2023 12:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490345.758989; Mon, 06 Feb 2023 12:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0ll-0003ZQ-4L; Mon, 06 Feb 2023 12:38:49 +0000
Received: by outflank-mailman (input) for mailman id 490345;
 Mon, 06 Feb 2023 12:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP0lj-0003ZK-Nf
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:38:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32cb20b3-a61b-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:38:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:38:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 12:38:16 +0000
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
X-Inumbo-ID: 32cb20b3-a61b-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nktsbzNQVZjYE5F5xYLhc7sdcN/OEgu0xBJaXb+Fh2A7W06FpI9NNpaphYuBJS6p43yv9sfvZcWG+vMkRFQRQWD5Cf4QgTKUT3Pgoe6+geH+Qhb8K9TTUO0KYCSenOZLczio3/yFSZjvRNVdw/SSRUbjw1gTHvEPCGe8fJQsJ5BJsIRaQcwlV7v24y2l24DfqteLftfoPxaZWtrjJwtWNnwZimJXzcIyozAG5IjJctvXILFYU5eiCjTrBWasUc7XGbsgGYfpUlWSkNbd7JWkUL3chTg6v+uMKROZrNqjX5vhm8dY7s/oIbQMLZojWOdCEoISmVVjnits1M8SdJ+rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkLg5SyEloLcxVZcSbvXyHj2WH8eTxhgyYru7I+bpq0=;
 b=H89p50GxG40O3hpmfsnSjaQaLqlLCfl5TUMahqD6EwQlIlS+C5AlVNs1C2efAbyTakgzXc6y/BCSZj9oUFjdzHxcXmI7O6pIe7tpprQj6053aE+4jG06YvCVdNoe5oLSRg/t3FU8tWilTwx7dTKE1WuNkGUyEVf78UfaHiVL9UC3ejW42u8Cz4F1Xz6Xm0crmyMDXSWVqSFHKan24BPhi0DWt9KQ51wU3vi8ykqWjweG8KLfVD1g+otO7m/6cubPwBud1cAc9hXqTSX0mrqfMKHD4q97IwNmZ7AYoaK/nCYEIh4KUY+WdGJoiOatNgNBnnNLLdGYRxnceqaM5i8JYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkLg5SyEloLcxVZcSbvXyHj2WH8eTxhgyYru7I+bpq0=;
 b=vfoGr4TA49Tkb82FbKTyKn9IHnktLa/mUolP7LZrVsL6KD4R7vcfCFA+7urjZQFw3sA1OwWb4sIWMdf9ZLYPy3oHw+F/9F9kHVyuuUMeAOuylUg+I/zNikLx4z5Uj17r++KlEg5lRabossUw0hAGSnWvVbBIGwHp1FjWYHSWFBy1iOpcfCvp7tKftRWVL5CPVg4En1xlGl1YKH5/haLSk7lpwc7TzmXm/9Kw3jvuLfY/YYObQqNpUpceUblzLVDHf0aXkcXp+wmiscppuSgsS9WMgZ+pQwXviQGC791D+y3D5dW/37LPq2LkjqDhXnWjjv2ZmO6va/ld6scsJCXiXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d945bbf1-69a5-8ffb-9a3f-2965864de9c2@suse.com>
Date: Mon, 6 Feb 2023 13:38:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposal: List files in Xen originated from external sources
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
 <005b7fa3-0f64-b15d-38d5-8135b0da06d2@suse.com>
 <9EDE6823-A6EB-4ECF-BFFA-2FE896C076AD@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9EDE6823-A6EB-4ECF-BFFA-2FE896C076AD@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d57964-3055-4d0d-fe80-08db083f0530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w7rFzK91nwwKhfb/XUnXHIrph9l2AGxLut8CBbLEsD0m1ERS1mBG5VxvYKvhtpGeJ804IznO57+c+mZ7wRCVHd5wTmZvt3pOtzDDQI+7GMqYbxEtHTXLORz4fnZVHudQAZtoGwRWWjV/Fy9BJ+F7Jem3rddmezuli+wj99m8CTmhW/0Rxk6pbM1km65YRNb/pnLzVfoHX3Z0gtCc7F17JrIQWnyQ7eIoowgXoSbPIXWeVcUwNJlGkpp69Zc7kmbm7PySOTkNuGpp6EDy7+VyQbyqT2mpSmsA81DQO05DZhpE0uxM71vYg79oN1bwqG0sqHG/ErzQzuHJwvrbnetwVdxOyYCXYRICZxGvdtKI1iHMcmDh5n54P3empP9+Eb65wOOy7TZ1cj/IpJNzlGeMXZ5WbfTFLBDXhBGlaiR6k1c2vRV+SLf/2f5N02sBqNRVeccTjMOs3GkiuTk1keu7VB/pK9k7+8gnpAJb86wDbX349lJmreuIfnqmaGnChZpkaEKEI195YMPY8CNyCUrasCwtkLq70dXn44yYeEWnCGK7QV7M3w2gBjbJcpC/tlNRl7Au/HiOD09rLy3gwt8jD1f9MlTIGhW3H+OHOQYOZLYU7sch1VQAZtjw64R8GUF6pzAIdLqwpy9cIw0b5dZMP24Fibz+3F4TvVw08YMlDbppKQfulvju+1QchlWdg8y9mc83O1df0J3zDVGKlask3DdkIpahAtJDstbXJIwWqWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39850400004)(136003)(346002)(376002)(451199018)(6486002)(2616005)(8936002)(478600001)(66556008)(26005)(186003)(31686004)(53546011)(6506007)(6512007)(54906003)(8676002)(316002)(6916009)(4326008)(38100700002)(66476007)(66946007)(41300700001)(83380400001)(2906002)(36756003)(31696002)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXBKTm5nbWtvcmlyOVdublBGSG5NbEZ0bkxUaTBRWTNDbnJmc0tIL0dBdFE0?=
 =?utf-8?B?UVR3UDdIWTlpN1ZxMm1ndFBhMFdOQnBteFFSdGFwR2ZsZDBxdjRwa01pc0hL?=
 =?utf-8?B?K1E5Z3N5bmRvS29kc1VobUlEcHpVUjlUL2FnOTdvTFhvTk9aTERndEhmNGl2?=
 =?utf-8?B?UGdoaFVpSTVDSVYzZ3JHOVZ3NnNsWFV3MUhjNC9BaE8xVUg5TEJvWXQ5RUJq?=
 =?utf-8?B?VGhJSEgwaWt0cWZJaTB6K2R5UEltVzFpSHdWQVhIRWNvNmIvSldWZXd4Yy9n?=
 =?utf-8?B?TTJSN0ZCZmlZTHdGZ2RrMUpwVVh6S2NTenU5aWU1dkh4UFZjNnlYUlNPQTVH?=
 =?utf-8?B?aG1QM1M2YlZEN3NIcitCcjF5NldYZnpFOVNzTy9zalBKN3I3YXJaOWRxQWR5?=
 =?utf-8?B?d2Q4NjBiRzloOTcwbUNRWnVRWWwyNlRxYmViZ3B6S2JleFEvTmhuZmZwRzNK?=
 =?utf-8?B?a2dRU1EyWHhRRFVEakl3cVpLOGVHWTRVbjdHUHYvbGk0ZFhXT1lJck1kYUJl?=
 =?utf-8?B?anpPZUNKS2hwb3N5K1ZGQ0NFdW9ZczBOZm5QWjFPOXFRYWpXS1ROUzFSeklx?=
 =?utf-8?B?akUzT3c1R2tCWXJzQ2pHU3R3dHhiQkQwSlVhdnpia1lSTGtaNlF2YmpXTXJ3?=
 =?utf-8?B?T0NubDFOWVF6UldmWklDWDRzeHdGTG51VFN5Y1JmREY4K1RtRnU5cm9nWXNs?=
 =?utf-8?B?WEhMT3l0Sk9zR1dDVWpLRUZib2VzOE0zL3IxMTJ0R1RqbmpScnBuaWI0RHhT?=
 =?utf-8?B?djQrbWI3WXlwNTlkbzdGeWpMY2EyL0swdzgzY0ZPV3N3T2xSVXByNFZLRGNR?=
 =?utf-8?B?aEgwdjRxNkExbzg1ME00dUZTQWY0V3Rzc2NEckUvY2o0VGlTdFh5VnllRjdn?=
 =?utf-8?B?cFNQdmVZdEpoam5mNWk5OWNMZjhsRGZOeTl4dXhpbW8yZGw3anpkVUxmMFZa?=
 =?utf-8?B?aGNIYVZjaW1pbFlwY3U0SGFqbzErd1F0cFdlbnVFT0ZRYlZlT2Z5TmRteGJE?=
 =?utf-8?B?WC90Z1hBOUdaalhka01yakJGOSsxd09aMUg2am5id0VLdnFBSVoxWEdpdFkz?=
 =?utf-8?B?Smd2QzYxalprUWtYcnNuL21INVpqUjgxYmdJNjhoOWs2L053TFFTMko4cEhD?=
 =?utf-8?B?R01qdmM1eDNhcHZaa0p2WVpLcjVNV1ovTUFLbldvQlVIUmZkZUxtNFNoNnB4?=
 =?utf-8?B?N1c2UUx2ZVc0VWNOVmx6ZVlTRHZVTnhuS1BFdVBYc2JpSzRmU2dQYjJFUk1C?=
 =?utf-8?B?ODBQWmZFSytrR0VubDV0TE1pVWU4UU4vc1B0bUZFQjh0d1RDcGE3Z1RXS0pN?=
 =?utf-8?B?VTNUa0JQYmFJU1NxUjR4cnlVdTNUUWJVVk12TFVlR1R4enhiczJGdUZNY1U0?=
 =?utf-8?B?bThVWUNTZHZFRitDQ0xNTlYrb1NHSS84Y1I2RVJNTXVFdCtCdTZodzRVMFRI?=
 =?utf-8?B?a2NKMkZmS0xIUjBURHFSKzd2dXpGTW5ROFRPNzZkc0txa202UjFtQWpJSWNB?=
 =?utf-8?B?bWhpZWx3R25YZXppSzVFUVp5NzFmVFNWUlFnWkJIU2Joc016aVd0TVRVTWlw?=
 =?utf-8?B?cWVibHNPRXNPUG9xQVJyZnBUOEY2eVBxWWJJcS81Tm1LZ0JJK0lHMlVFQjdJ?=
 =?utf-8?B?aFJjcnNWU3l0T0JkQ2l1SVQ3dVFKQUVHZDlSNUxKa2hjZHE4YjkrTm5yNEZC?=
 =?utf-8?B?OG5Ta0xPV0duMXhVQzdRcG1YTGNzZHdkVzdzSkFRZU54NFdzcGtkU1lJS0hX?=
 =?utf-8?B?alExd2lMNy84M3FDZVVnd0VNbW5jL2dnenJqenZPdkhVb2dXWWVSeVgwblNl?=
 =?utf-8?B?aEZSS0dDTGtVcnkyTjIxcSt0OEsvQ0RqTk5xVmVoNzNNUjN0bmNqL3VOZ0pE?=
 =?utf-8?B?enJUZEFwanhpQkhYeUJaZlBYOXZUQTV1OWsxc3pLVnFxd0oyb29IOHZtcWpI?=
 =?utf-8?B?YlcwOStTWFV0ZnRWOTJlZExaNXFHSyt4YlR2S3FGUWFhektZdmdDeTV0NHRx?=
 =?utf-8?B?OXVUM2FJR3dIZkcxblBxY0VyTTZPTjNRNW90VXpySk9xSlZkRG41QnhzRGQv?=
 =?utf-8?B?TjBpbnZ4bm1ZalhBTWh3bTFOc05KTTIrVmhJVDJSK2ViQkhtdWtITnhuYldM?=
 =?utf-8?Q?wEulyVDlgaJQAIK1WiMNoKNSy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d57964-3055-4d0d-fe80-08db083f0530
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:38:16.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kORcFm/m/ebnJLoY5yuAyb6iyWg7FcHPJHjo5pEfKJ4T6SP4zdNXuKMxKS52lKESldsFpigs3RJgsD3O5kJpEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 06.02.2023 13:21, Luca Fancellu wrote:
>> On 6 Feb 2023, at 10:01, Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.02.2023 10:30, Luca Fancellu wrote:
>>> origin_path: relative path in the original project, mostly linked to the original_revision field
>>>
>>> origin_revision: revision of the changes in the repository when this file was taken.
>>
>> I guess this needs clarifying: What revision is meant here? The one originally
>> imported, the one last updated from, or yet something else? Keep in mind that
>> we may also be selectively importing changes, in which case any particular
>> "revision" can easily end up misleading. The format likely also wants
>> specifying, e.g. (like we do for Fixes: tags) the first 12 digits of a commit
>> hash. For said selective updating this might then allow for something like
>> <base-hash>+<cherry-pick>+...
> 
> This is a good point, what would it be the best format in your opinion?
> Maybe we should have the field as an array of revisions?
> 
> "origin_revision": [
>    "Revision of latest backport”,
>    [...]
>    "originally imported revision”,
> ]
> 
> What should be the best to capture the history of the file?

That would be taking the 2nd step before the 1st one. For now we need to
determine _what_ information we want to record. Then we can determine how
to best represent it.

Jan

