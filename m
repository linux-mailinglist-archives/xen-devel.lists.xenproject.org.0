Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B340F750
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 14:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189353.338999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRCkX-0001do-Fs; Fri, 17 Sep 2021 12:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189353.338999; Fri, 17 Sep 2021 12:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRCkX-0001bI-Co; Fri, 17 Sep 2021 12:13:49 +0000
Received: by outflank-mailman (input) for mailman id 189353;
 Fri, 17 Sep 2021 12:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRCkV-0001bC-Di
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 12:13:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac81270-c439-4e05-bd01-7a23dab0d2bd;
 Fri, 17 Sep 2021 12:13:46 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-S3h9_AvENdKWIa2K-qSsPQ-1; Fri, 17 Sep 2021 14:13:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 12:13:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 12:13:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 12:13:42 +0000
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
X-Inumbo-ID: 1ac81270-c439-4e05-bd01-7a23dab0d2bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631880825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8F/k79EhMHT3GBRKH4JctgK/8Uqk+wst81sqDUTHM9I=;
	b=UK+K/Y77HuQKddygaHNmsFcX3cNHaIkrm3+OHltNYMXi7BeWQijrf/MUt0b1DvyM0U/gvO
	tmryKkae2coL/tFyuWIjeBaFiB5loMK/ZLiGi9JI37SBUE7TFoYxgufYj+QZr32+QHvZTy
	H5nQqmeutsvvqCpufB5R3ibbxrmkJuo=
X-MC-Unique: S3h9_AvENdKWIa2K-qSsPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJnBINjIc//vEDQnFihqQY/8i9/C0wr6xH6W44N8kFmXc8aRUZ+MqU1tbSpy3U9SGo2MjhMgknEmxSWz/sJnnoHCkJySyWk6NRpKZPqjjsQUShBEQGTm6o5ie0l7j0QpxLtST9A0DnxhE/GSZ3RI0EBKS3k0fbxsPkqHO4lSuSlyn4DYowV3FTHLpVrPpQMz6MdB9+923F72hOi7Kvo3CxYHmqc55dCezpwPkM82zxr5piUwWQhKE4HHBWrVyxPLvz7eAZA5EaRQht/qBh4CDjgC0guTiqbmjmYBsBP1v3G16w5pDnq1gt+HOC2s1guAulqLwaSgfNnPeowE6LaiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8F/k79EhMHT3GBRKH4JctgK/8Uqk+wst81sqDUTHM9I=;
 b=a32RJeqHP3F/ItJ+wd796j+ORuUXLOVUVkEqiy92/5l4Mji2fOezKwskcOp8dlpnqODBF2TheR7mSmxTUAefaAmUtGHPQre+lfkdYxPB7thSWnr6r/otaleJ1mqLymtyqw++ZytyDhsEBjEev3Oij7Bg9DK/ThJKuIaZnW38mFsfSB/cX4qsmz2Foqa51GeYEbM+eEuUD5XiXEz8Ez2YiV88qh8Sawei8lw4sjku5Es/3W1O+LoP2nRploldDE6+3uR6BSwer3nMwF4f4LVbCnjrnkItstQywuAAp1wPLFVP424gXg/CDtkfMS8pY6tLlANVJyQAxVru+zVXaa367w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 10/10] xsm: remove alternate xsm hook interface
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
 <20210910201305.32526-11-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f438520a-4692-5487-5bf7-86b71a723e49@suse.com>
Date: Fri, 17 Sep 2021 14:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910201305.32526-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f68737fd-5835-47d5-2266-08d979d49712
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33923782CC492AA5B293797CB3DD9@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tRQJ4l8Ow39znwr3VL1ARbxlYzv7FdZh6Zr0ZTHCkLCLKwimTSEtorHOysFy5jzd/lZxZA4Zn5W8O2N+J3JpXeVNjgE/ezshQ2m/UdvFqxaVFY/MYbATLqzE1ELkcwJBVvfMek7uyOAj9uaNpLbVyHR7Hjn35ojpNHzrNTHXhlGmolY6qlVU+gLjy2yC0hffL6hpnJwzemX2TNHxuLPmrdrPEw1LSF0HgZEhsYPoPAbIR0q0ePsZWFYbWTVRQDCdRMrIMYqC64/8H86yypdkOjYjOnsT2BvthosRKkMUX62k38gq8lXl2Y2oWfxrMyV/ELix6zhPf634PWuC9McmVrKM8v+x2SQNGMef/Fu2dETfGzT4cTm7tMgahnwdE73zIJXytmfqgogxM5Sz+sOqz6EAAIJH+KkCLC/Myi8QPJpRmjvwM/uGv8DB+p686u9tlPmCeO57FL/DPdCy9TFgTDvLtxgqmqTrHYjlF9/Ui6XEBpQzg86QN5WsJCwiYQBkshLT0iDa7f00BBaOW9ulp4c9Rb/X8f6R96wKixhiU17Puei0hCGFFWg1NPHBG5V7guhzykeDTBVmR4uFRvjWyse3u0tJ4cAPqGbR2cGsCSSasA3lcs3sFM+rfwPEVpUCIccWm0zYo3EnehJ/bUvln/NtPfqmhQSLS6PnApGHSkWtsRb9GwQce/N9gNtum84VsjSQXOt93ZoHDsEyG5caWDm7JDJiMChzMd/2DYTlvCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6916009)(16576012)(86362001)(316002)(66556008)(66476007)(38100700002)(8676002)(956004)(6486002)(2616005)(36756003)(4326008)(5660300002)(186003)(508600001)(31686004)(53546011)(83380400001)(2906002)(8936002)(66946007)(4744005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VVWm9GQkM2NzRFaFQ2bGdmTDNBMlFGNk1vZkpwQlp6a1NHZWw5T3BJcjhv?=
 =?utf-8?B?cm40S2JlemZvUnd4bGU3VndYMno4RnpXdk1NK2I4ZUpmSVZEbzZtMjRjaU1I?=
 =?utf-8?B?WnF4aWM4L3A4Qk9EdUt5ejFlS3lINW1YN3BQL0YwTG9GQ0V5djl5MDJSeFNB?=
 =?utf-8?B?MW1ZWnZ1UzNqbXhwcDRYa0dOb3pJU2NUVklrTTFBSGFNNm11bnN2OEd2NDh5?=
 =?utf-8?B?QUNWQ3BHZ1hHYndqZlpYeWNkTWFFM0hWUzlieU1EVnJrZDZ0YUoranF1R2xE?=
 =?utf-8?B?eUxsUDlocDFwR01vNU9sZ1pudmtMVEN3NTVjOVVTZlNWU1BDT3drbHVVR2xZ?=
 =?utf-8?B?WjQ5c2k1eEUydTE2N0FqSVU2MnhEMnloQ0tHRTVydVJKbFR4WTA5WUI1eUZJ?=
 =?utf-8?B?S1dqTU9GTUVpNmc3QlNSc3ZxUHo0ZTVXR3U1SEltK2NLeDZoY0k1T3dIQm56?=
 =?utf-8?B?anhSd0dpVkF6dVFvR3FaS3ZYb3JDZ09ZaG8vc0pGNExNM0JTRjhsMUxobW1r?=
 =?utf-8?B?U2VKdXhqWmRZZG5vY0lkM3hpV1NTbnJWb0xLK3pRYkIzUmJFMTJnR0E1Vmpm?=
 =?utf-8?B?ODVMZ0tqR1hqWCtpT0d1UzgvaVltUmtadTlDclJjNkROMVZYT3k5YkxVSE9s?=
 =?utf-8?B?KzJ2UkI5aVFQN2NoVDQ0TXJIUXRQSG9OZUF6NTlvZGs4UTZsYk4xT1lMM1lu?=
 =?utf-8?B?cWF2SCtNeitHWUhTRGo3dTFRK002RUJ3K1hrbUVpVVg1SUc3TmpSVjVDbEwv?=
 =?utf-8?B?dFBFY2FCMzFsTjc2YXN4NGE1OGNjck0reHA5Ym9pWExHdDg1OCtyOHNyckgr?=
 =?utf-8?B?cnczSDc0Tmg4K1dUR0lTVW52R1VOVGQ0SmlBWmVRdXEwT3huN2RqNVNLOUND?=
 =?utf-8?B?S2FWZGx0T0MrZUR3MTlQY2FTVG96RVVTVGFVRWVlUy8wVmY4VUpxZHd5cTAz?=
 =?utf-8?B?MWVCYjEyNERPb1lTYWZSam94ZzRDUWliT09ldVZVY2w0WDVwbWxSYWlDaFF2?=
 =?utf-8?B?UXZsUDU2NkpBQ2cwenNobHBIWUxMbWtHSjB1RTR0ellKczlzTWJ2Vk4ybW9E?=
 =?utf-8?B?M2RYUTgvK3NBd0xsK296MjhaaDV5RTFGY25UQkZFTnhsWTZOQ3VWSi9sY2RH?=
 =?utf-8?B?d2dYdkVIWXZyc1B6ako2K21xL1g4b0V2aFdHcnNlR0g3RGlBdkVOclRwdGpV?=
 =?utf-8?B?eXN3ejJUYVhGNW1GYzhwNVJKc3VGNFBlRFF0VVZJYVpTV2VvcW5OejRvOTVz?=
 =?utf-8?B?RHFCNUphTzQ2ajRQZHRaMGtjVk9tdTlHOWcvNFNvS0RRc1FSTU5IRjY2Tytp?=
 =?utf-8?B?cDdSM1pwb25IUTNvY2hhbG5KMmVTRyszM0dUaTM5eWJRQU5jdDE4enROQkx3?=
 =?utf-8?B?Wjg0Zm80eEo1K0NsSFUxU0dXTk9Kc0tJeHEzYVBWOXpkN1FZUXV1Q0dDc1JD?=
 =?utf-8?B?WEdHaU4xUlJyK3BHNCt0ZWh0MS8rMVpxajhEUEJNN2lsekx6S256UkdMcGt5?=
 =?utf-8?B?RU5TWWRsdU4ranllSGtBMXBRUCtTUDN2QW53YkpFelNBMWZ2ZlVBWkJ3dkRN?=
 =?utf-8?B?b1Rwam1qenllUzNkcGQyNURKL0pnaHQyNlpLcXg4aHpUYmdCSWJRQzVEQ2sy?=
 =?utf-8?B?MWtNK0lFa0FoemFuZ08xQ1NVVWxTczVsQ29GRkVkRHpaRDJmOFNTU2R3R0Yy?=
 =?utf-8?B?R3ptaUlwZ0srK1UrZTZIV1c4TTczY05KS015T0FwQWdTMlhndXRBdmdGb2xR?=
 =?utf-8?Q?fEGc+zNHTy+4e+J5cvdBnBIvnuxHBq5CNudutHy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68737fd-5835-47d5-2266-08d979d49712
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:13:42.5800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+7WAxKrA4797zcxk4x+UZtuYo2rluw3h6aBNLTwMpXQkUluO5X7fMMQmHCcvIycexJHST5PMtGrzOAnsWxHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 10.09.2021 22:13, Daniel P. Smith wrote:
> Hidden behind macro magic is an alternative xsm hook interface dedicated for
> use when the dummy/default policy is the only one built. This alternative
> interface increases code complexity and code size in the core security
> framework of Xen.

What does "code size" refer to here? I would have expected the binaries to
be smaller with inline functions in use. And ...

> ---
>  xen/include/xsm/xsm-core.h |  51 ++-
>  xen/include/xsm/xsm.h      | 275 ++++++++++------
>  xen/xsm/Makefile           |   2 +-
>  xen/xsm/dummy.c            |   2 +-
>  xen/xsm/dummy.h            | 659 +++++++++++++++++++++++++++++++++++++
>  xen/xsm/silo.c             |   2 +-
>  xen/xsm/xsm_core.c         |   4 -
>  7 files changed, 868 insertions(+), 127 deletions(-)
>  create mode 100644 xen/xsm/dummy.h

... the statistics here suggest an increase in source code size.

Jan


