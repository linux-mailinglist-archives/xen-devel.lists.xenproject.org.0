Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21441622B15
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 13:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440890.695123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osjmt-0006Bs-EL; Wed, 09 Nov 2022 12:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440890.695123; Wed, 09 Nov 2022 12:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osjmt-00069b-B9; Wed, 09 Nov 2022 12:02:35 +0000
Received: by outflank-mailman (input) for mailman id 440890;
 Wed, 09 Nov 2022 12:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osjmr-00069T-U8
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 12:02:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d1b9dd-6026-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 13:02:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 9 Nov
 2022 12:02:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 12:02:29 +0000
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
X-Inumbo-ID: 63d1b9dd-6026-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfZgdrVM4ozJQHO4h3WIoYQWbgEqLujmumztq8zHtw/31sNGTjZ/Dg2i/u3GLWMUgninCnWEQK6ZbrfA3wIslnfOl/lTqG6pa5r1kEVmn+3MPGyEv7mPupPes6mq16TsoBGrSnccpCEqMHZ5F7mu5kovpAg/RWbpWqRLQz79/W36Mty4S6oqaVCCv3OLhDSq3TRK9nzIHHwmjRV8DPq06PADu2ScmT36jQlC19KBt5XE01QicTsU0Aar1ZuJdssa7Nhk07yAW942eSa63AAyZhFP0Oi5B9Ipw3jlyY4yLRrPpjN8s4LmppBvmXN61dKYq9c0HUzGn+xHcyMQrX8acg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YRWvhob7PLo/+0qHjSG6O0AeCXuOALRAFw2aOYy5c4=;
 b=JPEbm5o5t6Xpb6LGDs6eFhZKpPihRh803L79gRUxLditQfqIhRtf2fS3eo7OleoO8bUI76zRsygtB6s6jNxZrVfUBTBGU25lXDlrkwPtqDKX7OOznnvrVtfxhp5eTaZzhqdZAB8CNR3YOm/Kyg6nWhrbI+yUTiPEW3UaeJEVjPPQSpPJcKebbEnFZYQdYxQhpG8QBRjGe+Qw2X58CqfbdBEEh1PxySVrVula/U7EsXCaykSzDfBExI61dIl2XSwskR5Eo1Ost5FmPKBttAyhdA8YDQwekYsE8Yxf+RNuWDZSkpUu/buDI/ygi7g3/fSAvAPrQiZZCUaQeZ5Di6h3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YRWvhob7PLo/+0qHjSG6O0AeCXuOALRAFw2aOYy5c4=;
 b=CRIljZ68J6bdbZodV3wgF6fBjJ055lSkxqN/ub4RO6H22cv0sB0jZ9zwgc7npynAusnHtJ7RYfQOgH0Kl50/FgxQsx5WrrJbe9eCupb9WpLnA5DTwBa7CXl2TWbE2JU+awlyL+/RnrsUSc35ymZlBzPSbFTUaiW4GW/yCyfSy1DIVKtOrTMXqqRheX7JDlM4KukkXiRv9XpC0kDlvu1RUO8ytr6cJIAgmA9fJcUnGdHbff9XT0639NW95JbIQLj1l+eW+LAucHruGItBbxuhZEUTJ0tLg0Fx0bhiIRJUfTiGXZ85DTiegp57DqMODytcBbtoUfomHifvwi8azz8tbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31f048fc-f2e5-a421-0e60-98d1bed47ca1@suse.com>
Date: Wed, 9 Nov 2022 13:02:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
 <Y2t87YE5acLfiClF@Air-de-Roger>
 <afbc37a1-99cb-ea09-575e-dc6448cd6f92@suse.com>
 <Y2uQxiykG0+Jt7Az@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2uQxiykG0+Jt7Az@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0166.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c998c50-f4e6-401f-0751-08dac24a46b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZY0vC2sV0m5O6Rv874IMf8kdoFDA0yNG9EenbtXyqKIFrP7/i0+hOIBiGLBbRIhgQAvA6Hc6pi3alexL6UNnuPZJ6L1jPDd8IqHGGcLGA1SJA80hDg6TfWpOQRfivmaR/zFMHsejwaAkllU4EcDaNWWOuhXMefhom8jbbv4PqU3L06dU59S9WKRBLeULisXJ/YjTcGZsIDKlsF4FKhMiCXIdTf7rHXSyGSd7mEj6JiJa6Tgg9XYfaT8i4YDGrxOsnjvTiKtoTmv6ILujNPmswAYoPBaKbiAq3XEJKvVcL40zKbqTLNqR9iGd714AnurF279C/lvi0+WhZ8vPbI6a2JBaZMDH+jBrqp1QwNWB94OWf5cNud8t+3ShkPYpNhSpvOTGj2480Q4o7c/ixdRuYbYZmxzqKNmsa0Cc0MeSvTB/PDu6k4lvjzi3TQxh/H8sdm9ZkceNVpwekL7vo7qRChZZO91vPv4ex7EFup4IINV1JnHiXVIq/ApZpJWQZb+P3ceunpwFTgEivks8lli60uU8KRyTFMXd348z8hCBJtEBDX76dzTNH933nwcRpocpNVbu4qiZ3r3AotoXUYzQ9o/PpbMhcrmjjN0cW6sBHrshRYSFs9E/ibWrolzATzE2sMbfy/iNt9LsAP9cJGocaMX/DDKjeJ5tAIs9FjXbcZeuyvA5CbcOBN5WFg1sd76iNdAgGOQv1xJyC2eWUAvCVViigv8x6jFYlO7TURg1s6EFORgQV3Bb/Ifie9fygj5LYSTtKnqWGbXrc+IBEQA0MBVYXwaZReKd3j5jZ9W4kJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(41300700001)(4326008)(8676002)(8936002)(4744005)(2906002)(86362001)(5660300002)(2616005)(66476007)(83380400001)(38100700002)(31696002)(6486002)(6512007)(54906003)(6916009)(316002)(66556008)(66946007)(53546011)(26005)(478600001)(6506007)(31686004)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzl1b0NRa0kybHZsRnVaM1ZCTWhrWHdzWjRjekNic1FJRmh3NHFhYWw0Q0gv?=
 =?utf-8?B?Rm9PNmlDbG13TlpsVndvUDJMT2YzNlMxVlFDY3VqbEE2VlgvaGVJZXcyQS9I?=
 =?utf-8?B?V082M3pvalBWaHhnNGY2aTVGSUVibnFScGtHbnlDUzhKSzlkd3VEZ2ZsazV3?=
 =?utf-8?B?SEQrVmZMSUxlLytGS3pZUTJ6L0oxYldWQWkvVVkyNEV3UXpWY0NnekRkbkdN?=
 =?utf-8?B?eERQS1ArMk1nTWlZeGIwcmttdTQ5V1VYTFpNajFqNWZadWl1SXRNN3ozeEVs?=
 =?utf-8?B?OGZndWxhejVHL1owa1RNN3UveGFVWnROWTlOdytaSk85Z2NzTnVUTWM5ZU9B?=
 =?utf-8?B?WGFXTVYyOGYvM2J1bW1OWENuTlNNakZLNGhRcEhLTUFSa25DSGVzR1BOOGdo?=
 =?utf-8?B?R0U1d2drVWVTd3Z0UnZ4WWFmZWNoYmlJZW04ZG5ISkdocGpoNkY5ZU15Wmha?=
 =?utf-8?B?UE9nY1kyeE9rc3BlQXN3c0xYeTJvUC9pNEM3VERvWnI4K21lbFRBR0pZaUtK?=
 =?utf-8?B?Q3MzQlVURW5nNUVoOWQ2ZkdHM3g5T1l5bllINVcwT2o3ZUk1YndQdC8yeXJt?=
 =?utf-8?B?ZmlKZ213c0toeTNZUThTVmU5a3A5Mm5PUDZhU3ZPdEhWa1RjNGRJMDI3ZDN1?=
 =?utf-8?B?Y1hKNWs5NzRiQ212TVU2UHZWSkRBN2pZYit4dHRjc3F4Vjg1QnZoL2c4RlA5?=
 =?utf-8?B?VDcxTDRSSG5RR1Y2MWFmazhXOUZjYTZzK1lGTDdaRUhWbS85MFVORjlpNHNs?=
 =?utf-8?B?M3VIMWlUa1FpUlZ5WStTcDdJRHQyQmt6V0FWTzdQaFdSeDEzNThqbjJmVEtm?=
 =?utf-8?B?T25SU25ldzNJdFZ2VS85aWRySTg5aWQrTzJFcC9IcHcvN2pKRmRZaks1aWpt?=
 =?utf-8?B?UEp3Q0VEb2VtazBINkdTTkFtbEdpcWJIYmRyVTNLdWsxeDNsdzZaUUZBZDF3?=
 =?utf-8?B?V1hUSVpPT016Rkk1VDZnekU0VTZ2WjNBMSs4M0ppUlhOT0ZDdWZIcFNMNE1J?=
 =?utf-8?B?cGZIQnA0b0lDQ3hvR0FWdFUrY3FhbzZDVWNlaksvckl3RU1RWi9YV05VT2Rk?=
 =?utf-8?B?UDh1ZHJuUWMrYVI5VWtob29sa0NsS0s5NkpEcE85dmVRM2U2ZGRYVjBJYVhq?=
 =?utf-8?B?ZDhSWDR6cDkvdys0eFAwUGsyNUNmNE1RVkpoTUJYOW9UMFo1VlFiTXhnMmov?=
 =?utf-8?B?Q2IxY0NxY2NTbkx6eUgvaHgrS29BS01uZnhKY01PM3M2MGZkUjJuNHNWMWtn?=
 =?utf-8?B?N0RUajdZZHdHVGR5R04xZ3BMcHpka2xUUUcrOFgvT28zRHE0bEdnSEFjL0Fh?=
 =?utf-8?B?TkhGS1MydnJmYmR2c2grUHRRQkRrWExGOHdiZmFXa1FoKzRIS3RCZTJsdUJj?=
 =?utf-8?B?R1pscDFjb0dncFpudlF0YXFMejRKZENoSUZyQ29jTmlnc0M1ZjI5V2RoYUVl?=
 =?utf-8?B?YTlNOFZmZEp4ZEtjUjBObEZpQ2JFaUxHZEtUQ2RPYTU0dURnL3I0dS9pTlZr?=
 =?utf-8?B?REtpSk54OXFYRXhJS1doa25VN0NmR3BQcTE3b1RFTVRNS2svQ0ltM2RQWmtW?=
 =?utf-8?B?UFo1eStSUFVDMktaUlJHTVhVbnBMcklJYjR1QStDWHUycy94ODg5UGE3Skth?=
 =?utf-8?B?NmlNc3Q2WEozY2VoYnpMKzBZRHJGNTZmcU5pY1pvWDV6T0ZjcEFId0JBNGtI?=
 =?utf-8?B?N2RkUGRRSkV0RTVybUhJemZ6MnBIVDlER2hFRmY5Y01NZkRRTGR6SFVzQU5Z?=
 =?utf-8?B?NERSdTRybkY2OWs3NkI1cU16K2w4cGNlc2sxWkpQQW1lb0p2Ri81SFNleXJB?=
 =?utf-8?B?TkxkN1REZHZMMnZIK3NnL2JyTlVLQUJROVBkdXRmeVkxaUhzUnU3aGFuQnNK?=
 =?utf-8?B?RE1yK1hVcS9oSzhpbnJHUDVTODVESnhqM0haUXhvb29GOGY0NGVCUWhvMko5?=
 =?utf-8?B?QnBZa0lSQzN4MThnejlCNjRwVGxwbTVUVGUzU2JET2thZE5RT3pxVVZRTXFF?=
 =?utf-8?B?alM4VWhqN2pSWHZQWEZVTGN3NUV5bUF6bkNZSi84SURWN2ZBejdlVzM4ekp2?=
 =?utf-8?B?TXlNemwyL2dMNEZaTWNyc2FOeFV4SVFkUzJudTRtSTJmUzhwRnJWa0V0bTFk?=
 =?utf-8?Q?mFuLsMSKtUTEccm4OAOiRZiH7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c998c50-f4e6-401f-0751-08dac24a46b1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 12:02:29.6815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi0n2bAAu9BSAu3+kCDkLISI8pg8MJv+u5ComemY8bogQ35brmc52R+JW/UY0GvP5IFUXYmAXD079nCaUQfMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8820

On 09.11.2022 12:36, Roger Pau Monné wrote:
> Since I don't see replies to my other comments, do you agree on
> returning an error then?

No, my view there hasn't changed. I wouldn't block a change to go in
early for 4.18, but I also wouldn't ack such.

Perhaps just one remark on your other earlier comments: While you're
right about XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK}, (effectively) random
data in the bitmap may cause a caller to do extra work, but wouldn't
look to be otherwise harmful: Considering pages dirty which aren't
is never a functional problem, while considering pages clean which
aren't is (imo) not a problem for a dying domain.

Jan

