Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB437502F7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 11:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562098.878670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJW3n-0000ie-OV; Wed, 12 Jul 2023 09:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562098.878670; Wed, 12 Jul 2023 09:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJW3n-0000fN-Kl; Wed, 12 Jul 2023 09:22:59 +0000
Received: by outflank-mailman (input) for mailman id 562098;
 Wed, 12 Jul 2023 09:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJW3l-0000fH-Vz
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 09:22:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af476379-2095-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 11:22:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB9217.eurprd04.prod.outlook.com (2603:10a6:102:232::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 09:22:53 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 09:22:53 +0000
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
X-Inumbo-ID: af476379-2095-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwpH33Yj6xIZRmMPtkSbBwVriIndUHwslfvkyTgfiDo9H12id1fQsPGOHrGb5k9e9vFyRaUBhmsmcUxYiSWvTUyosTEHIZFe70rRjIryZ5jX2GSrP7PIn7+9cOWXUU3J4qzAc4iKTDte/CBuifmCz5w4/X3NKyTMeCBBkBARviH+3OehxBCx94MTk/8HwVjjnEXr+h1iHtKh17N2sN/d8+IIX3MI8RWtG3EeY9r6o9EaJ5rQg2quzNdLcvN8CB7d2r6lMtqjnAKsvaw0uk6yWzi1GPENM0I7970qSl59EmyzsjrVhxKAKu0KbH4jChIxKzBrkSORPuUU7zFUbcjspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZBV+H90nEt74P0BvK/S1m0ZVPmeIRK7ayHgTTu/NrU=;
 b=S12AKVMB3EETSlu8Dx+bGk/qpfMVysRrCVA7Hn3otBLSAhmNkci1C158equye8ZGg8GtVpI9wwCaGQmZBLNWUMRkjh2uy6PKdglYKTwo9kKL0/N+pFWyUAVQ6kTwqUiNSjUFAQ0fRX+iyixMF4xKqkWcgL7ewoV1Z5jai2cMjyIC0LlAlfb40NfQ3WXdDy8T5FEgBaggZYL63w3/4hKW48xzQw8VT6v5oEr7LC0zqmhiThCmhg9W7TP57TAzMjAQX/e9FLJ9vXTb5xxv9V5+c+t9sMpR8Rhtq6D7j5n6TctzpulqKMfKw/+06LGigL0sIEdevAZtq9wphJ/vaxg9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZBV+H90nEt74P0BvK/S1m0ZVPmeIRK7ayHgTTu/NrU=;
 b=U40LAzy48LkyV9p9v8AIVp3qaLTS8GDvmrlI+ddn8nKRVvf/WerlET0Pv46OjJ/7KHGojwZ1s570sxyiUAqKyMBPonZcBfg/zTLIj/366dZuDrks8q7iwerV19q8YaDoVbxATTJO+YGilD1PkIgUUFMlzWs6Ywabxrv4seqMAYD/rSkiwkH9xxIGD+K6neSeVlJzdIBgUpb39/0XSDOo/tFcNU/eFlNbIa57qoVjf/Er/9+skowDgOSymI9y75Y0cqgJksB2bOXGxmFjDi4mNCovug4JcT/97n/W+rXwNeuHWn497iuH+tn60rz9UcWnfvmjWWLLMsjVeAnAkmGpYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9016145-c325-75bf-08cb-c1ff7855bc33@suse.com>
Date: Wed, 12 Jul 2023 11:22:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/misra: add Rule 9.3
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230711202145.2334563-1-sstabellini@kernel.org>
 <AD59BC9A-B2A4-47D7-A010-2FBF08DA3840@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AD59BC9A-B2A4-47D7-A010-2FBF08DA3840@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b569567-26f3-4e35-159b-08db82b991fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VfOOYp31OBRffdaeZNchoziBoCTfa5wyghfqc5a6TpeGmYPBKM6xV7aqsOhvF27yucG9BnfgYx1r+jpgraeTy7dj7abgFb2ci/Y8sNaZVzmDE5+QYAomAcbbcIVOrAG99CdBDxwcwt3wHFmHisKTBR0nYsx7xqbGF4V9QUkGHJ1dXGoN1nOIh6j98Q5eSQsdC1U0Zk2iPWFGuYT88vOu+FkCHOdphbtbthfWcHV35jSBxWkDMO0q7/0JTZ0Br9aVj0xbhiLgA9wqlkNGtJLJrG43f7dKKVdz6OKSt7aXR8MAp9sFQxvDAFlnnQLwRhnWAVjBJWhGgb7Kzp9U1uzgGNKx5Kqssy8oQf4WKZSPAHR5C139Xf303t6psPCLe/7YxQo5omLCKCV1DGs8BKgD4L13F9wHZctNiWHd5OxhfYk2xP+v9GoE9ekYzD7lrLidE+dJB4cFOus8NO4w/wDuWJcDWsRu+HshVkfAmYEWDH2LbrgQx1+rpBKg0RuF4aLeptieeMlsDasU40opM67eewubQhJ6KQ2GfOtnR4PRcPrgwREOnrQjFgUJ4yvYkeV4KO4eJp/SSx4Zm7ALo5DxGAO1m6Gfm5WL4ol7eHDbTivA+YMBwRbplTBKLzo/X3hV4f4xbcqG65r6ZSSTnXI+dA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(2906002)(6512007)(38100700002)(2616005)(186003)(26005)(53546011)(86362001)(31696002)(6506007)(5660300002)(8676002)(36756003)(8936002)(110136005)(54906003)(6486002)(478600001)(66556008)(66946007)(41300700001)(66476007)(316002)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzlneVh4TURFR1JES1k3WFpPQXhIWGVpeGtMKzdVbDI4KzczSEpnajZCRnhP?=
 =?utf-8?B?TXYrU0p6bnBGTjRoLzlnaFd5MVJWY1poUFBIWlhKdGlPQ2JEQW4yb3ZUaWpn?=
 =?utf-8?B?QU5PbjlkZGVKMktYMytOR3FtZjVnTlk5MlZQaUNCOGtnQjArM1RVWmZ4Z1N6?=
 =?utf-8?B?TWFKdU10NXhJamVaVkRjUVNKS2JsaUVPUVFUdmNiOFBWU2Uza0c4M1Q3YzFR?=
 =?utf-8?B?NzR5R1dmSmVSaFRtRVd2NEdieG9WeDlVa0x5V2IyREpFaDRPVm41MkxOQUFZ?=
 =?utf-8?B?WDg3UXBEdWdtYlFXbGl1KzFDWk1rU3JlYXJTdVVRMXAzV1BPZ1FCZm1pRVUv?=
 =?utf-8?B?MmoyamIvSUpqWmx0aUV0WitnL2V3cHBrU3JpMUNvVHFvQ01wV3d5Ukt4bDM1?=
 =?utf-8?B?WXVwWjdwRVRPNHpjVXVZZzBSKytvb3pYUDZ1cWVSZHpzQWM1dEZrbmtsNWwv?=
 =?utf-8?B?bkxrOWhyWk1COHhqS0htSmZiMEM5MHdWS29WT1A4THhQL2JZdHZOYnJVay9O?=
 =?utf-8?B?b00zZnBPLzFROXFVT3JoTkNmSUNHbTNEV1g1cW1Gc2Q0ZkhpcnlqcHlUemd2?=
 =?utf-8?B?ZDg2VXlBVmNUTmZGQ09ZV3Bac0FzOHVlVlZFdTJ4MGFkSVZFU3h5SEdtZ1BF?=
 =?utf-8?B?R0ZXQTJqWXFiZXc0d0F6MHgybHZDa21sTkcxeWJPcG5UbjhWd0JFV3FEQkpS?=
 =?utf-8?B?bnNxTnZRclhKWmFZbU5rQk91UFJQWlFSNHIxLzgxa1pxcytmaG5nTzl5K0Fl?=
 =?utf-8?B?ZVFNVS9zeU5xeWJkQm5RcGxmcGV1YmdEK0hQMy9lbEZsSzc3TG51a0ZubWVF?=
 =?utf-8?B?K3hTSGtRRTZLWFAwMlZMektuL01rTVV3NmZBQUV4K2dwOUhzVjg3VFJpZFkw?=
 =?utf-8?B?Nm02NDdURWRFRjhyNE92Y1NLQTNxVi93aFk1eEZ2RDNLeUxZeVhZWXViYW0v?=
 =?utf-8?B?eVdLVWsvNGs0eWZPcG1ZMmhhemRWU3lOeVdJOFplU0ZHams4VHpkWU5KV1BI?=
 =?utf-8?B?bWRYbTI5Z3FXU0d6SGNRMzNYQzdMMEZDSm1KS2lvQkJXNGxOWW1yRFpCTXBS?=
 =?utf-8?B?RXY0ZEYxNEVmTzl6elh1di9xL1V1L3Q0RHN2eUFjZHZER212Rnh0Z081cVdz?=
 =?utf-8?B?dy9mYUxvWFNrelZVWjdYUVpXN2JLK0ZBOWtldUk3emx6WDZTWVBCaDhsQUR1?=
 =?utf-8?B?ZGRlWkpWRkpIdU9KY01wZ2xlakptalBaenc3cGJQT1ZtS00xMnllaTJTVWY1?=
 =?utf-8?B?ZUhQbkxKbENLT2JFSkYrclo1TXluS0I5bWxrbUlJKzNyTWd4TUtySXVvR3Rr?=
 =?utf-8?B?cFk0bWNOY2RDWWcvMUR0WGlhY25QOEQ0WmMzYXVsN1hnUWlJZjRXbFAyVzly?=
 =?utf-8?B?dTdkN2ZDZHhrbERpbjBLZW1zaGpMMW8vc1czL1Z6YlYwckMyRll4S1FRekI0?=
 =?utf-8?B?cEhtb3F1ZTZuQ3dDZEpxUXpZQ3pmMjV6ckNpZklFYmJybnBNcFR0aHZyTVlE?=
 =?utf-8?B?aTdVZDhWQWlWNWpNUFR5WkR0SGNlbDhTdk5BYlMzTGVGK1AyQXpEeFd6MW5T?=
 =?utf-8?B?VzhXdUxlMm0xWERuN1I5QkhqUEt0U2J0c0E5ME9UN2FHNisxZ3RQZnNKaW1r?=
 =?utf-8?B?MzhLbUZhTEozWldNc1BGakVuaVowd3NQQSt6V0I1VnArd3BEcUVZZzlLS2FQ?=
 =?utf-8?B?MlRHRHl2SmJYcldObjBMNndaUWx0ME41UW5LdGlzdDZEcGxkVzUreFNKZ2Zk?=
 =?utf-8?B?M1NYV0xtMnJ1THNVMEUvMlNjeGZBaWM0a0ZCMDNvUjBPRTU0YU5NUGZyNFhm?=
 =?utf-8?B?bng5TmRqRVlucHFVVFVpcDFHUWlGdHlXU0pPN1g0UEY2cktSS2xZMUlIcEpS?=
 =?utf-8?B?dnFBZE9tRmt5ZzE2dG9SaFdaQlNSNU8zdWs0eUltc3BJcmFoaHduMk1rR0tz?=
 =?utf-8?B?OEZERkYzeGp3SzI2dEhoRWsrV01BZ1Y3WnQrc2dXa2pUOVlHTjE1SVdSNlRu?=
 =?utf-8?B?VlRvZGlCMGs5L0d6Q2o5QlJBU0FUVlRLS0xvNm8xMGY0Wm40bGliM0cySjRE?=
 =?utf-8?B?MmJjT0FxS2kraXpwTDYySVJXSll5cWo3SWRGMnpEYm5lR0lXdmZNQWcyaGlL?=
 =?utf-8?Q?CMpbkWW/hm4027WGJJXMmskY2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b569567-26f3-4e35-159b-08db82b991fd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 09:22:53.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpHXMNeN/LXMgFYF2VZcNXvJ7oWnMjBe5h9jm3tJp3oe1y4hG8fKhjY9FjY1NjnTl5SyXC+tDXG6bDI/z/Rj/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9217

On 12.07.2023 10:21, Luca Fancellu wrote:
>> On 11 Jul 2023, at 21:21, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Specify that {} is allowed for zero-initialization.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -284,6 +284,11 @@ maintainers if you want to suggest a change.
>>        braces
>>      -
>>
>> +   * - `Rule 9.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_03.c>`_
>> +     - Required
>> +     - Arrays shall not be partially initialized
>> +     - {} is also allowed to specify explicit zero-initialization
> 
> Not related to this patch, but how is the coding style for this? Is it {} without spaces or { } with one space?
> It’s not specified in the coding style

In the absence of anything written down, I'm inclined to infer both
forms are acceptable.

Jan

