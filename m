Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB606C6607
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513775.795285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIhO-000552-1z; Thu, 23 Mar 2023 11:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513775.795285; Thu, 23 Mar 2023 11:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIhN-00052B-Uo; Thu, 23 Mar 2023 11:01:37 +0000
Received: by outflank-mailman (input) for mailman id 513775;
 Thu, 23 Mar 2023 11:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfIhM-000523-8P
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:01:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 133d4d8f-c96a-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 12:01:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 11:01:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 11:01:32 +0000
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
X-Inumbo-ID: 133d4d8f-c96a-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYmLGS5ShK77cfOmxzVvaK+g70V3IBNEe1s6LF0YjdpOpumdoqPi6NBY/qIaD5c1r78fIdnhn5Az+a3gt1pBoNNzOsAuhHmUvuaM6JJi4cPnzBCuq97apx68Lre49nz1ini8+ZLpMotYLu0OynzX+qN8+XHbe+rXPM6xHwP9Mt9Id4f7pIX7xz99GmA35NgMYwwO9gotGIKVSL1JaH01snHtXfJ0XrqXaUt+h1o8NWRkbTrJ7FOPwDc/6yED67uhjBuOQ4I8loWiInTvISlU/tTEBxR45nkwGlLEYm4l7LwX0vvIaksHmsl0aCLXZSpq0V7RfRykfdzHgu/l40bEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKv5w8g5/kTOEI/helHq5LiOVSvHw9iXU++S4LZ+QRE=;
 b=demp7rCB522/CGYVjT4jDrttsgXL5MyAsraV4/qge+r4xN6JZIpSqAN4Quz4KUHJYb6VsUXNZuxhNknqGTBlQD3Hp3pNDRLyIxSWch9DwbsJcqa36xO+xn081eH50WsHltR2SQtdIns7g5UYgPCWjA6Va5fyhFfzj/UoJq57LNZ0aYOoDWK0iMIvXnGNYoK+8hKT6alVSeiH73/WHHKm5+/CkKFUWn+MFSUgmxUFNr98SrT1NoeiRk5KCPATP91C80XJf0u5rC7ai48xQU4hM4yRAS3HPpGLeU5MCc+xvWcWxVXPKEolK3LEbhSfGjXlMeQXSld3GEo0SavNiyrObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKv5w8g5/kTOEI/helHq5LiOVSvHw9iXU++S4LZ+QRE=;
 b=uE/SF9sju6aCdpjR9pgorraMd8oh4jhPWTbiyLo3mswBWr2G9ntmOHm6E/Eznr0lapuUr8fYgl7gkkd/IUq57CQSgRKMHf//1FKQQ3ykPDgcDtFYsLL1TFyIxKOAIY83KnoWCBSaL17MI4LF/fJxs/TC43E7Wuoe/yl07aas5tYJbDMmSoJ/Y8SsoCBpVmw0nRKAs5FwG8rLpUr93xpbkLMC4kyquqlR5OkCeHVjGT28Rja9J9vnAhV0lykeCNtd4IJ+6n422UZ4SGc36VwKcONEf63/VlLuCjcEUn2+ql2tPK2hbprD6xoRn7eQ4z53xo7EELaLVlm/WP1IlSF0MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <effdbb11-b86f-54d4-f8aa-e57f27290f51@suse.com>
Date: Thu, 23 Mar 2023 12:01:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] tools: add container_of() macro to
 xen-tools/common-macros.h
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-3-jgross@suse.com>
 <41f0ab93-c919-4d0a-9592-ddff9a4459c2@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41f0ab93-c919-4d0a-9592-ddff9a4459c2@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e42d1ad-74a0-4089-be4c-08db2b8df646
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JVGZL/Yuq7uotEYjMdZTNCvmO71fmVVyc0Navt6n6tIHOR0dw5X76kWXiL56Cue1z5ko+9+u0aUik8km9uzrHGLT/xuguodNb0EKEEQQe9vVcczyARFfbGnBfAPKCc38bddHFyOXCnpcmJR3owzCajfoTi4hfeWuBKa6sP+xLO3mXoCJn+S1L9XhsMz0Njd2ik9T5J4fN0D0kgWEllkesNZbwlT3QzpWNa7uKc2TwU8VDLz1FVjXCidndfW3F4oA0mmH9U+xYd2tjKlm5GmhQx9cTf7P+rHjHTumsuXhIp2aLIIjmX4H94j/KFtYiOSK2nl+XBdOmudb8W415LGAxfA+/Xzyk9f+VfBk++zv2TBZ292g2U3onlYeYYG3x4U/6IDu0L4iwRj+wDrgJIj1sqwrnYsm7+ktBlyfiwClbU8qTI/nJ+Q0eDyn7VtYvFeexTdLqybVd6duzZGDXHEBuL4DxvbSWCCVXdO8fdXcjW31qpzpWxWkW+xmS96FNyjmLxqHOzJlSBxOdGALw8fzzfnA70ad7CDd/pdSOJET36LZplcagYhZNJcdXvC9h4zP/+pA/VkFDVb48VqxIuBV2c5U5re525jQ86VbB7HQTP18b1E/zfBLwla7kxFtQr2f641lu2P/32pNtsJKKGQu9pMN62pSoqxw5KaYgj9w6ffQVonP3tcbW9MRsmDS46vx+Pw9GC0hv5nQE47IM/Xgfam/GA2K3nbqX5qvLvdDS+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(366004)(39850400004)(346002)(136003)(451199018)(31686004)(8936002)(66946007)(66556008)(66476007)(41300700001)(4326008)(86362001)(8676002)(36756003)(38100700002)(26005)(53546011)(6512007)(6506007)(31696002)(186003)(2616005)(316002)(478600001)(6486002)(54906003)(6636002)(110136005)(2906002)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkdsajVOd3lBdlhMdjVwWjVwR0FxeEhXMkQzNkwzMDFZYzBYT1RVN3FNSTk4?=
 =?utf-8?B?dWswSTFGL3Y1QlBpY2tHdnZGek84YUtYcmRkVzlOcEVYWUg4dG5EMDg1SFQw?=
 =?utf-8?B?Sk1WNS9hT1V1c0pUaFd1NzU3NjA0QlRBUDhiUE1Walh3akRTNzZNeGhMSzBC?=
 =?utf-8?B?NU5kWTVnK3B1eEdwdnBpcFp6NmNodnlJRmxnZGlRaXlGT2IvN0xOcURBK2FL?=
 =?utf-8?B?Mk02anJxZ3owTTFKMks4OUl5WCs2LzJXNnZteGNzUmQ1QW16WWpHV0xUZjFG?=
 =?utf-8?B?ay82bmlBSHlqdzdJVWdOY2dZdGtsUmRuUTZVTVkzeHoxaUpOYkkvZXNTc3BQ?=
 =?utf-8?B?VXlQUnhscUdsRHJ5bXZWR0JYU1kwZ3BpODdMc0RLQWQ1aFdObllEbUZlb2tB?=
 =?utf-8?B?YTU0K2ZaOUcrNlE1TDRiYnJqR0ZGd2UzN212d0Z6eGwzRjZUT2tncVczUUxl?=
 =?utf-8?B?Q1oyUjJFM1VhRTl2cXI0K2VCSGNlaVR3cWprTjFKTDNXM0E3QStRZ1U0VGlT?=
 =?utf-8?B?Ly95VytEN3cxT21peVVSMjcrblF2VlIrK3lQMmxEdjRLbjRIQU9hNFVyNW0v?=
 =?utf-8?B?T0paR01YWEtjOUlJYkhMM0hhQVFwYlo2WW84R3BPUzJVdWdvU2dnS0hqTVVs?=
 =?utf-8?B?ekcxMUZjTUM2NU40MmhnQ08wbCt3VVYxRjZLaE9hSW9ESThOMzRhejlMZkdV?=
 =?utf-8?B?MnM4SWxRU0JZaUFTQmN0WDByWEd3MytGc2NWMUNZR1I5c3pnQ1lsZTJ6bGJY?=
 =?utf-8?B?eElGU2ZJWVRwM2h3R3FNY2dEN0FaTTdTZ01hR2luODl1eU1TeTN2ajR5Lzh2?=
 =?utf-8?B?OVc2ZitGamNnSWl5QXhNQllzQ2d2Q0Z5U1BCQ3ZNRm1ZQjBBVitiVmdJK2FZ?=
 =?utf-8?B?dXlsM2VHckRCdGtGMUFWd3pVcWp6NVdTU2xDUkZYRSs1NHFRdEFjMVdTdEdy?=
 =?utf-8?B?bi9RUlF1aUwvbkxEOFRYc1FnN0VnL2htUlhOeHcxWDFSRDZ3Q3JWZ1EwZEVP?=
 =?utf-8?B?WHhBOWd5RHVIQXNFblhzaENwWGtDZjFScCs1aG82NzFOOUkrSHcxY0doMnNt?=
 =?utf-8?B?bGpQaGFMNU1LdmlBOEgrZlRlSHFCQ0ZPcHVJUGpSaksvb000WWJ4NlFkUzRx?=
 =?utf-8?B?WURLUUJwTFMyZ1FWWmJ2SEtpczQwcTBnQmtlSzNZMENIZERXRjJYWEMrRkND?=
 =?utf-8?B?Z0F6Y2pVdGQ4WnR0U3ZIcE02UWdaRllvNW0vQThJbUFNNm5uZjM1alhsT2c3?=
 =?utf-8?B?ZmErRHhSRTlrODN2Z0pFbnFLdUVVYXMyVXp4UVRCbkZsZURIN2VkVnkzK0F0?=
 =?utf-8?B?RUV5Nlp3dVBsMDlNK0VKL3YxUkFEeEQzY1A0LzhEZVVvMEN0ZnI1aU9qeThy?=
 =?utf-8?B?Rjl6MFFZbkdiaXN1VmpkWS80aWR3dzJuRFZxdXhhVHdSdm1DbkpwZkttbkpV?=
 =?utf-8?B?NStJTVJlS1NnRmxRZmJDVXpLeU4yS3dORlFLQUVIWUtkc3JnZU1Fa3N5V3Zz?=
 =?utf-8?B?bk5TSVZvdjdTUFkzMjJ4a25GbXlJUmtwMHU5OEh0T1l2N2RENDlwbUpQbHI5?=
 =?utf-8?B?NWZqRGdxcTFIeUNscFFpTEgveVJnUzN0T0xCMVlPanlkRXZYMWdBWmJmUlBQ?=
 =?utf-8?B?N3MzSXRhbXIrNi9VWjFXa0drYmVNUnB0cGx6ODJ4TlRhQVB1cjFiNGp6RkI2?=
 =?utf-8?B?aC9LdkJ1MlBpWVRQQ0NIM1ozQ0wxcWJFZHRVLzhQR0t6WDhpeWpxMnJTczFk?=
 =?utf-8?B?TDNuS3pDSU8rc0RQdmlTNUU4blU5WDkzbVBIRE8zUnlLKzJNdmNscVdsWlZq?=
 =?utf-8?B?ZnFRaFlMV2F4VVFNK3Zmby9HUTAraVB2Rm0wTFIrWkRGMmhoay9FejNQUkZx?=
 =?utf-8?B?NTA2ZGhiNjhGVExCWWxubCtQL25wOTlzQlJCWnhpWTZWRUdObERoM3RHRmJM?=
 =?utf-8?B?MjI5YzlFQUlJRzlNbko3ek5ObFFMWENOV3VLekFQaDYwQ0FrcVUvQW9HU0Qr?=
 =?utf-8?B?TXpLYngzMHRvOElRaW9pclVJV0tzYnFtVXUxK21UK2lQZEwxeG5Ta24xQ2dQ?=
 =?utf-8?B?WUZNOUlYZ3F0a3M5V2lpdXFaMWJidmZwTmZLZXlxQ3lBZEdlKzRGdU1pMmNB?=
 =?utf-8?Q?zEBvJx5qUsNOViZ0zrrwkPNpO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e42d1ad-74a0-4089-be4c-08db2b8df646
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:01:32.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzoSGEXiL/FwRr52uwL5+76LwNJ0bgbBdvcaIJHGrBgkla3POV0SAG3JVyVq4nR4OEc6NgP78prtqnnA/xZOtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7213

On 23.03.2023 11:44, Anthony PERARD wrote:
> On Mon, Mar 06, 2023 at 08:21:38AM +0100, Juergen Gross wrote:
>> --- a/tools/include/xen-tools/common-macros.h
>> +++ b/tools/include/xen-tools/common-macros.h
>> @@ -76,4 +76,8 @@
>>  #define __must_check __attribute__((__warn_unused_result__))
>>  #endif
>>  
>> +#define container_of(ptr, type, member) ({                \
>> +    typeof( ((type *)0)->member ) *__mptr = (ptr);        \
> 
> I think identifier starting with two '_' are supposed to be reserved.
> Would you be ok to have just one? (So "_mptr")

Except that single-underscore prefixed names are also kind of reserved
(for file-scope symbols). Hence why I'm generally suggesting / asking
for trailing underscores to be used.

Jan

