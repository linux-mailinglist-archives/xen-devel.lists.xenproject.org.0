Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DC56823D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361989.591810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90rE-0001mn-Su; Wed, 06 Jul 2022 08:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361989.591810; Wed, 06 Jul 2022 08:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90rE-0001jc-PN; Wed, 06 Jul 2022 08:58:04 +0000
Received: by outflank-mailman (input) for mailman id 361989;
 Wed, 06 Jul 2022 08:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o90rD-0001jW-Qu
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:58:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde490e1-fd09-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 10:58:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3474.eurprd04.prod.outlook.com (2603:10a6:208:1e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 08:57:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 08:57:59 +0000
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
X-Inumbo-ID: bde490e1-fd09-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et+5U5Kwtft6tpbcu+eq2lLGrfiDpO5YOy2tMEoE2kfQO452c+Io7JGHSbzS8x5Ll3jemOMcNQCscEkU6R7qzfNyA9aoKQ3uOqzNS10WwFrfx5zoW0NpXamezz2wRMABO5qsj2Pg3mI5CJB4HnoY5+Fmau2htBeExFfOxSbIzv65PImXxYycy3nB6tDsrac0MMC5Og/XlejiqzlqcxrSoxtseuRxO+UIrlHMMlayHTrksM+Mkeeg+YvI57fuM4QhglN5w8H7Djh1qEhaZ/kcIvJd14E/RnW5R+yNmiof8WUfZv7r1rerelTCdkBzQRDcPba7Zfp/LB5VKtFxW2Yd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc5aGFUSIi/PDU6V2AkIewtQkMKYDfqx5xJxUHFfjnM=;
 b=I/bE7Ez2o3OCuWw/5PiFJ6P3QcQyDv7L6eaL3a+5c6lKcicv7BkHlnI1yJDxa5ltlR6jZk2IoZ38zYdfyGv4rdZOR/8aPRd6Csr5B2LYsf+opMcDfz0tqNHLyFimYUr9qlt1Hu3/QEilqwgX1Bc3cR4qqvUosw1++ap/mbkqRBjX/5y9nhFlAmWYJjV73i+X5QoM3ZWrk3MbIAOTx1g/o+OcgscieXYC0kZJOF2v8WiobNFTCrs9N2Lu63+cPEuiHbX0ZvA/nmtbNyt9F7Gb5UtYS18HX865btQaRZEXkFmjy1xM2sXSj7gAhAhgtqce+2DIWjhZYFsZp9uQwEWnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc5aGFUSIi/PDU6V2AkIewtQkMKYDfqx5xJxUHFfjnM=;
 b=fV+b9cK/VuTwGQ948Ie7sWlIsKfwsEJLlyZLK5skBceMqGbxL/qexjOQeML/+vEyHskkHzzNys3Fz/XQLgMO8sOyq3HGj747pEC1nLeQsw3yB6gv7RRCTEYbgeRcm/QjeB+w4Z7PzuFxe6qaPWliIJfOjIuIZGBNY5V+Q4lKTAj8+EKg0cd7ZO/2tch3vaNL8YtVzpX7zpoc6TtIcJGkb1DlfkdILFqTlhY7rYJ+VGeFAD+qDleJuD4IHpyw/rtLg4OpFE0IhAlmR/IUnQ1dTEnjTSPIH3tWjIfS5YYo65V4Yg/SwyXqVFRYuMBRsPT9gD0MTKAnWGnv2jhuh8wb4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5a66b05-7f8e-7219-1aa3-fdd704133cad@suse.com>
Date: Wed, 6 Jul 2022 10:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <AS8PR08MB79919E80E3D321527A4BE91F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79919E80E3D321527A4BE91F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0114.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dc78095-24c0-45f8-20ea-08da5f2da050
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3474:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pTv8DcyzfFAzUHIzgGLUatDseiueNAj2LGfKLYGBW3lTGqkEUF2hlpSmUNTKDVfdfoPhjZi73J0EqBOrZPd2U4uZ/MYIX7r4DKwoEDUDEQ5B6Wcee8/FYUSMbSZEC89/LuJ4D3Tie46s9yPZOB3kq18hnDEIpqATl7PGvohdPKIDial9f9icEYaBzPqAxwWECVnITNFYhrDVhQLaeahN62ou4WcTniBFwRhBR035smbtkgnGIRtObiAWP8qGo49B+/ggwIEPMPq3LvHc6vr+N/K/QXUYaglyAgyxUVYS5gBh7EphDh3nn2i9IDen9sgv8L0sMW9sRyxKD01phFcut1nqRK3gInX5T0IPG514TRGgFDPPncCojwqkGnleFZ//4LPYFsg5O2hJQEmiOJgkamICQrEHw32yxlTTHIf+Ld4Hq9zQijFxNFpF+IjO8I4j/7q5IyJCBNFaJmlQZFQ3uwL+9RuV+vxabSiNF4wci+hTl47W8qCBy96wUHBzWZ9pqNPiCZkmfCQw0ef77Ii7nN1HTNEajMWZtk5e5Zja88IykAdJLrqHOEUdrh5VPgR4tZB7GN1iYOcOhocO4q4rfqZnCNTfNavAlN6kzNXCrdKKKJZLiISJXHRK6YTyMb5+uJOztLQQf8HboCcfOsg8PqPIeuJuO7XHgpGMnpCIWepRhQDyl+T+vhhNV8EedO0WcYQPD6CrFBY7fvEubWe3RvyJoNxJbDn9O0ny9AMzrbarpRUYDgim2SHDQ5JxBv44VQfvz/Dp8gISX7+vbmzjkrxmSWblGpatSx0tSklwBE6LqS6cQG/BbtLc8s4HtBopgXk6KfpDhbnibyZJ/o17mK8ghG3AyqkEI4S/XckjJoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(7416002)(26005)(6506007)(83380400001)(41300700001)(2906002)(54906003)(66574015)(53546011)(316002)(36756003)(31686004)(38100700002)(6486002)(8936002)(31696002)(6862004)(5660300002)(86362001)(2616005)(4744005)(66556008)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUpyMTFkT1pONlRrSEtmZzdRUE5WVjBpaTNLNnBFQk5yTTd6VENwK3FYcEQ2?=
 =?utf-8?B?dVRucTJzZ2IyTXQwNTAyVmZaUUh6NWthS0dmMmtFMkVIZk9DTzBXUVhSM3JB?=
 =?utf-8?B?dFpPZDRsUXlUWHZYVFZ3NlVrdFlCTGw5WFFWOTBHaE9XTDRacXh4QTRuZGxS?=
 =?utf-8?B?N0xNa0NpRjRVZHVUMnFiV243UTR4ZTZxbFlWVzdBTURmWitTSW5HNGx3WnVm?=
 =?utf-8?B?VXIyZFpUVzRNRnIxTUJMRDU5dCtZUllqSW9PTjlONzJKc2hEakVXbndzcFJJ?=
 =?utf-8?B?UEtudVJMWHhPeEhOcXFod1pZTU0yRmJ1L0hwRS9lL0NyRTVzU2hsMWRodENG?=
 =?utf-8?B?UXFSUkFieElXWjBjZUs5bzAvcFFLZ09SOVBubXV4bHZUbi93ZHZKblVLanhi?=
 =?utf-8?B?dmlxeE53anl5ajZhZnVhWGpmWERsem01SjJZN2NwelA5RVF4NEpPR0hIeVIw?=
 =?utf-8?B?UmUzZW1EWW1QZE5vUWxkWEpXZnNDb1dScFg5UHU0TGJzQmYxT1dqQnZ5TTlw?=
 =?utf-8?B?VW5oaXNnSlYwOVNBSFhiU2VERDJqb0FrQ0R5YkV1blFoZldmdWlvVnkxT1Yr?=
 =?utf-8?B?T1FjU3NyQ0F3NENVRFpseGVNY2FLN0w1OU4xeDdzU3B0cTAzaU5OZzVTRk5V?=
 =?utf-8?B?Z2w2cHFZTXFremIvYktJMlR6TzhhQ21SM1BKZkYxQXJ0bGxPN0t1clErcjk0?=
 =?utf-8?B?bU9LdmZvVmtxK1liODNXZ1B6bHp1M3FGUk4zOWtHU1ZETHRXZEJTWUdsOU5X?=
 =?utf-8?B?b1hlRlJYQ1Zpekd2ejlwTUxxbTlwYWJEN0RkdWZ4OGlCRDRBSUNIcDN3WklQ?=
 =?utf-8?B?cXVsQ0UyNkFCWlZ3ZnVRc01FLzRNWWlaQXBUUng4NGd5WHd2VUY0S1V0blY3?=
 =?utf-8?B?SE9GajNnRGlSL1hOVnhveDZ2SzdvckIzL1c1QWJjN08vLzJuVW1SbXpqOUNs?=
 =?utf-8?B?bU1ISVN0SmJhVjVxZHJYa095YlpDYS9UNFh4QUw2OEZWWnZGQXJ6bXVPakw4?=
 =?utf-8?B?NE1oMERTQzhNU2o2UzR4eUhZY01kRE1sZU4rQ3U5VGpIMmF5cHBEY1NmcG9k?=
 =?utf-8?B?V2IwQXhxbzhMNEI0ZVRGUmQ1NkczWjNjcVlmK0RnTHRqSXp0Q1pmYzJjdHpR?=
 =?utf-8?B?a01pTnpYR253MC83UFZiYjFUemdKN2tFeVNNNXBUOU16WWs3RXpJd0NRMHlK?=
 =?utf-8?B?cmcwb0lZaXAwR0lDeEFvWmZkZ1I5bFlsNUNlNU1Dc0VhOXVFY1NYTUk3Wks3?=
 =?utf-8?B?WnRVMkFKQk1VTTg1eG9ET2lINi96VHhVQW9Pbi9HbTUvNVJOK1duUDh2M3lS?=
 =?utf-8?B?RmU3ZW95NjMwbjd3aHkzdDF0ZG9rRHgyWmpVNHRRZjA0UnBXNVNFTklybnVQ?=
 =?utf-8?B?RVNFNzZpU082enpkUjdYSW90NmxKQzlTL0ZDTU96dGlPODU2cnY4eENFV2d6?=
 =?utf-8?B?N3BEUXBTeXMrV0ZVWTVWUGN4d3BjZEJ2a0VZVHBsZmRYUWFjdDNlb21xYnpv?=
 =?utf-8?B?ZWRUVUFYeUY2Z0RUVkhBaGY0aSthUXpPQjJVMTA4Wnc0R0lPb0xheFVBSGJS?=
 =?utf-8?B?VHRkVzVZaFhZY0psK05UaCtNUXppUnJIanJvY3hBeC9pOFFDL3gxQjdnUDdi?=
 =?utf-8?B?YnMwWUZJaDlDUElaeVVDb3FKSTNhbUJHVUUza3ExL3JDemdTZkl5eE1wSkJM?=
 =?utf-8?B?a1VJZUtHSXQ4VUF2SmltM1lzTVBHMmpxN01reHdBc0ViMC9LeEpVa2JDS2RQ?=
 =?utf-8?B?c0pGQTV0MlFCS3dzODdKb0hkS0d5SHRLUHhDOGpNRDFmejVWWERIUktMZE1a?=
 =?utf-8?B?ZDVyVEZNNDJzaXFsR29pSUlnU3B3aTJmaURBeE15cThmVzhRNW5teEZaOGlT?=
 =?utf-8?B?d0VTWm9Tbkw1R3BsK1JacTNxOXlKNytnQ0c4NmtWRG5IMW5KMHRTZ1BURVI5?=
 =?utf-8?B?aGdSSkU0OGc1VWFOaHNDL2ZOeWJjc0piMWVVcVFwT0VJd2h0S2w4dm5ZVVpm?=
 =?utf-8?B?eG1PN0NyZzB3dlpiU3QwM0pRQ2NsTE9qT0FmemQzbUJTWjBodUt3ajhiRWVI?=
 =?utf-8?B?by9lSFRMMWhHbVRicHBmdU1panlxMDh0cFRSSTM3cDh5UlBRMngrbnRUdDZO?=
 =?utf-8?Q?ZloHXv5FA1qSSNFw8BGAs1oXu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc78095-24c0-45f8-20ea-08da5f2da050
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 08:57:59.5369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLhM4fBgXRbYe7DmnMD+IzFd3dghzM8GMEszC1YJh8Nq4IhNpeR2QjilhnKsdRSVCWtgUHM0Mr5wFkYFrzK3Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3474

On 06.07.2022 09:30, Henry Wang wrote:
> It seems that this series has been stale for more than 3 months, with:
> 
> Patch #1 merged.
> Patch #2 need feedback regarding the kexec and argo changes.
> Patch #3 #4 #5 #6 #7 #8 #9 reviewed/acked.
> 
> So sending this as a gentle reminder for kexec and argo maintainers.

Patch 3 was also merged. Patch 2 and 4 indeed only wait for said acks.
Patches 5 and onwards are pending a clarification by Andrew as to
performance concerns he had voiced. Jürgen did send a number of pings,
with no result at all.

Jan

