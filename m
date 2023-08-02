Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9676C7CD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 10:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574781.900375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6nv-0005Kt-Sq; Wed, 02 Aug 2023 08:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574781.900375; Wed, 02 Aug 2023 08:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6nv-0005Im-Q2; Wed, 02 Aug 2023 08:01:59 +0000
Received: by outflank-mailman (input) for mailman id 574781;
 Wed, 02 Aug 2023 08:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR6nu-0005Ig-7C
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 08:01:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d999d7ec-310a-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 10:01:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 08:01:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 08:01:53 +0000
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
X-Inumbo-ID: d999d7ec-310a-11ee-b25e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIWV1IrFXSzknm2xKbIrS0v+CXZnYv5Mwa5bQK1VCf3nCvKW66OPvwhxrpw5zxFRF4sY3z8QYfE+EsRWqsXre7ZKfFJ/8aZ5XHgT1gTl7Db42cZmnm+2X40n4QwLTI4bXmPrll1KnLkyvJE6g0YLRCpl8VVqH9lfqNSbx3kLJcyI2RsOD4d2TDn/BcaLG3C2SgjZnJgTIxBp+hdZkxcls5cHVOKhmdvf05zVaoa27y+UIxdmqYQhOGwXxWZuUAG4Yqbp7K/WxqciFdWvBUXYPvup1GVu/VvhGkg5IAiOQYlzy1nvfeKppbX8Bv4CAMltmkQ7ivCD6J9jtkm5HMO8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DetXZRLRb8zggcsk1BEVOLIqZPtJHYj5cs+EhHzAgkc=;
 b=a2jZzlb22lLM90zTiR6A5Cdgl+AKXvS4wiDsWNeYxeK++QaIMLem/nZTRWhtAxBYC56/hxmQNIVXzf+T6TtRffpgO4obhvcyABLUic/d2hzfmceBEB0L5m2fo0fBegzLUtBCxBZCMO+h/DD9RxDS0P5TbzEIyz+kXXhlFuTmqe9y0DtBJ9WKIl6GoYWJRg++qkx5z6Hvush7DxYCvaZlcmhP4u+Yj2hw6QpGCth6k7h90JqhPV/SWiVilO9+aaEwxSgoHn1JJ57JYO/LNWi+Vi/kjP9pg4dcsYzkX7umxgW2aZ5kAmMkK4UlSSQ9JoLJASIW72WQpuiN+WhlUY5q3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DetXZRLRb8zggcsk1BEVOLIqZPtJHYj5cs+EhHzAgkc=;
 b=R/i3Pl9IZPzxUpZYXcQsU6NZJLVPo16h+QOc3h7cqJXCQa9/0EzuHq9xwpQrV4SxQ2LtZIW3FuuKycDXnQarPykSHlRqjiJEQzSdNf6W+4WwOlJT0NxxX1znuGCR2o7WHIVuMTAKVvFunPd8SYlHUmZkFkSKejGBbqy0+wDgf3+BueceJ05TJE6DpjI8dmNKQIyqdW8IDk/+JL3Xzqkyoo3ceMC032E9JYK9n93bGDDgGo8ghDOMmo2Mg+8gTCSajayfQNYKeCh+PFAKe7lsJBufnEC8DKzUPjqbayPPsn76lKl2kWiwzmipfzIIDkrZilY5PM39qK+7Kz6IjBLyzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a56b1da7-05c1-fcd0-d39f-0e528ea066a6@suse.com>
Date: Wed, 2 Aug 2023 10:01:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section
 directive
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>, Khem Raj <raj.khem@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230801174930.2995947-1-raj.khem@gmail.com>
 <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
 <f7501e7b-2064-38dd-af32-738e01a830c5@suse.com>
 <c75870a3-d7b4-891f-7c93-c62e97b25fdb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c75870a3-d7b4-891f-7c93-c62e97b25fdb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: bc917bb7-6a32-4a6c-bcf0-08db932ebbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xyniPKc/BRizI6ps8tT8s/2zketR0Q4j7bOwMZGR1n4FHWkYAna0jfGVynyU9oysWBuYnPH62vbrcYkcqCRDzcpYVTFzxpvw1RUFy+SWhAyazW0OQaPLu2CNVrrciNMQ/LClTay1sEralbKkzsn5ogSD0X+Y9zwxrmwaFNSnvFlx7UrFKs32eatH2FpnHNtTVwaooa8bk/aKkQ49tzpn1lbC9LS9ZAQX0gEGyj8vY8CBS23T/wf5Q+OJdfp2bEIVCg0mLjUtiqDJMmAtPOjgXmQgcQX8rbOsVc0gvtOacwJp5DVRG2vips24veBf2h8uW9HbpdAJZEsZz3YEgwwr4PxmxoKC42IKp4enirGbAuzYnAh/FyT7bTM7j8F+r5x1VgJMj2rDIi0qkc8XxyI7Ka2nGWiZG77FMTpAnALxcuwfOCjeArgW2amyenh0LdN0RsYHCdpSw25GEeVbGh6Q9z2IKRkL7hRs9XJBlerpPAS/vhMQLkCseq/zXuAmiq+Kb3jeBXW2FHPltiQiRYpsuLA38ycVKystzpNNWx3DNgZDCORLhNujMYax0fwRSJV5jxeNgIw0wqn0/eQ3z1DihckWzOYJ5TmT4iZX1uDzVn3v7jYconCfbayq5OvTtfqRlW7Ag1NPuPv+DHKJATeb11rl9Tg9wqt9Vhoh/cPdF9OF/tZW8paeo3Ld4z5xIofn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(2616005)(186003)(6512007)(316002)(86362001)(478600001)(54906003)(38100700002)(66946007)(66556008)(66476007)(6486002)(6916009)(4326008)(31696002)(6506007)(53546011)(36756003)(41300700001)(26005)(8676002)(5660300002)(8936002)(2906002)(83380400001)(31686004)(142923001)(60764002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXk4a0tDR3JteW0zNjFxK3dpamFMNjVOMXhJeWpGcTBYNEoxVVN0S2xDSCs4?=
 =?utf-8?B?U29MeTZCaUppaTFHajdrdGFEUkFQVDluenh1NGhmR3JlNzdkYy9VQVl2bHpp?=
 =?utf-8?B?RUZUZThKeVMzU1ZPOFU1NzZjK1ZmY1d2L2NNQm4rZkRUSnB1cVYyeFNWTWo4?=
 =?utf-8?B?T2MxUUQydUtIUXl2RnBSQS9KVldTUEQ3OFduUnpnejVVRlBxWGhNMlBUMGt0?=
 =?utf-8?B?bUxqWEZ3UDlXZ2lveVhvWHdjNVZnaU1MNGFVdnM5cDVtR01YNDBhWlhKQ3Jz?=
 =?utf-8?B?TzduSlhZSURUbnFnVHJzbkFjTkVpbXYxQlAyc3ZjaXBrSDBVVjhJQkVON3Fp?=
 =?utf-8?B?SUloZFRBdUx3S3JDem5BNE9GV21LTjU3VEJhSHBJMzBwSkRXSjlCWlRVbEdz?=
 =?utf-8?B?eDE1MTdaNHh4Sy9nR1V6T2JIdkdJWjdodzhQdTVXY1orc1pmbXNOc2VFTjhQ?=
 =?utf-8?B?cC9zakFpQTIyMDZQa1Q1c1pCb2Q2TnpsMVMrSXRIbkVPQ2xqRmwrTzlSaldZ?=
 =?utf-8?B?V2NHV0NFWFQrYjRiT2hHdFhBK3pQVkpHUXNQS0x1a0FzSFRtNnl5bS9COTF1?=
 =?utf-8?B?Qko4TlpGdEFtL1R1S0laYUk1NzJ3dHJGeUhRc2dCSTlIZ094aXVLalU2UFRT?=
 =?utf-8?B?eHRxajU5WFhudWNEalExOGppYXR4cnNhWkVuMnByNDJRYk56SlVhTnB3S3Zs?=
 =?utf-8?B?OUtoc3FMdmlQVnR5T2dnVGtsSWJyRDFOM1RkREV1TGpRLzV0VTFxSzc5U09H?=
 =?utf-8?B?K1N1R2l5dUtMMzhvZmlua0tydnJrV0dJL2dOUG5qd0VVMFA3blJMS3N6NTZt?=
 =?utf-8?B?cncxeUEzbmFOVTR0SENqS3ZSMTUraXdxR1NYeUpXRFp6MURVN1hTZzBQR3ZI?=
 =?utf-8?B?cFRGQTkrYXRkNXNteG16eDNTVlQ5ODladXg5em5sdVR6NTZoRCt1Vlg0K25j?=
 =?utf-8?B?UUhkb1dmNVJqN3Z5Wmc3NGxSMFludTgyc1g3ZnMwTnRLT3g0REZHSC92Y2F4?=
 =?utf-8?B?NmtoTUlFWFhoeXZkV3dNS2dNSDU5bzVpQ3pTaHhQaWFWTU02SWFyQkh3cXMw?=
 =?utf-8?B?ZGZVLy9KdWVEMVV5Yk1sL2kyZndnd2QvaCt2VS9CRXhpWHo3OEJZVytpUkNF?=
 =?utf-8?B?WlVZRXdRNHpkeHM0TW5tUmRtejViRFhBS1hWd0FDd3kzSE5YWDhaTk1XN3BP?=
 =?utf-8?B?OTd6a29kTTlSM01lYVd3aFpIVW4xNUl2QzRUcnovUEVzZkJOdlQxL21DWm1n?=
 =?utf-8?B?OW1kR2pjazBpdXY4bmhnbGV3VWZIV3Q2WWdVRFlpRzJYb1htajBqdnFpSHBp?=
 =?utf-8?B?Uk5EM3RhZ3JkWk44RkxkSWNnOHJpTkE5cjRrWUR0RkdUbGc1eGtpTHNyRlFo?=
 =?utf-8?B?RmprY3VzNUdlOHR4UEdwa3JDK3dQd3lDVWN4MFJQYjYrNEdsWHkwakcxWjhJ?=
 =?utf-8?B?LzdEVUVBeHRhUXk5Yjh4cEtTQnVLL3lSVmNrRGVFNmlXSDhxVHAxLzlDUUJO?=
 =?utf-8?B?ZTB0Y202WnRNUmZrZ0wxb2FqNmZnd1krdmNCek11bHpnOGtzZHRpZldWd3M3?=
 =?utf-8?B?VXk4L0plc0ozSEZXcFo2SC9NcTZTRHhiT21Cc3lXOVBod2hhYWN4Q1NBeGty?=
 =?utf-8?B?NTVweWduNDhtZHVjMXN1ajMrOC9DWmI3V1NFbWJsVlg1aE1wTjlETUd1SXVx?=
 =?utf-8?B?bUlhcncveFFnK252ZjFObWNCQ2hlQUEwZElrd2FEbEtveGZzSGE5SDV5TG5O?=
 =?utf-8?B?dlJMcWxDTlQ2RktYY2diZ3JUVjQ0d0x1ZTNMY3JNdW1sVjZaaE9KNTVwQ3JH?=
 =?utf-8?B?cHVwQTlLNDFwblFSNjVyT3lqejZhczBSN3ljQlNFbndwaGpreFR1RjFOMDRK?=
 =?utf-8?B?TnRaL2FDYzg0S09PVUd5ZVNkcGp3OEoxZFcvc2krd3lyeWVjRlhSMlNQQjds?=
 =?utf-8?B?VEJvRTFxUm1rRDVwbWRLc1ZUNTNQbWxxeXBmOGxRTmxpaUU0V3B6aWFnQU9q?=
 =?utf-8?B?ZDFzUlNGSTZUVlFieUNrdXludC9KVnBEM1NuaWM4TTlGZzRQbVZDUWQ4cnJm?=
 =?utf-8?B?TVhJMFRoNmJBakIwREZZS2h1K2JQejBtblZzQnVNUkFBRVVYZUY5VGlJVkdp?=
 =?utf-8?Q?LhT1mUFNkbcopONJhfKH5c3CP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc917bb7-6a32-4a6c-bcf0-08db932ebbda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 08:01:53.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7F+YbT0aHmOmzoEV8kMpCDFyZaTasdqMx5wq0EjPliqy9vtTNjk4fTr/NHuynmLq5WFVlPZFf55Q6o53eYf9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332

On 02.08.2023 09:54, Julien Grall wrote:
> On 02/08/2023 08:22, Jan Beulich wrote:
>> On 01.08.2023 23:02, Julien Grall wrote:
>>> Title: This patch is not arm32 specific anymore. So I would replace
>>> 'arm32' with 'arm'. This can be done on commit.
>>>
>>> On 01/08/2023 18:49, Khem Raj wrote:
>>>> Assembler from binutils 2.41 rejects [1] this syntax
>>>>
>>>> .section "name"[, flags...]
>>>>
>>>> where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
>>>>
>>>> It is almost like a regression compared to 2.40 or older release,
>>>
>>> The next word after ',' start with an uppercase. Did you intend to use
>>> '.' rather than ','?
>>>
>>> That said, the documentation has the following:
>>>
>>> For SPARC ELF targets, the assembler supports another type of .section
>>> directive for compatibility with the Solaris assembler:"
>>
>> But note that "SPARC" was added there only by the commit introducing the
>> perceived regression.
> 
> Yes, I noticed it while replying yesterday. I still would not describe 
> it as a regression mainly because I am not convinced binutils will 
> revert the change and it feels like a good move.

I agree as to it being unlikely that the change is going to be (partly)
reverted, unless someone strongly advocated for it. It also wouldn't be
of much use to us, unless a 2.41.1 was cut very soon.

> Also, regarding your point about older tree on the bug report. I don't 
> think we guarantee that stable works all new toolchain without any change.

We don't guarantee that, no, but I think it is in our own interest to
keep things building with the newest tool chains. When build-testing
stable tree commits before pushing, I don't want to always have to
remember to force the build to use an older tool chain, when normally
my build rune would default to a pretty up-to-date one. This is also
why for this specific class of changes I typically prefer to see them
also go onto the security-only stable trees.

Jan

