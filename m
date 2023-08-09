Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19B77752DB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580674.909050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTceu-0003Rr-2d; Wed, 09 Aug 2023 06:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580674.909050; Wed, 09 Aug 2023 06:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcet-0003Pn-WA; Wed, 09 Aug 2023 06:27:03 +0000
Received: by outflank-mailman (input) for mailman id 580674;
 Wed, 09 Aug 2023 06:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTces-0003Ph-UD
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:27:02 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c00180cd-367d-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:27:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7218.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 06:26:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:26:59 +0000
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
X-Inumbo-ID: c00180cd-367d-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1wLjXGCfJvvLH+UwLlHB2ZF9vn75+QXPmFBsjgugLA9Bv5QS1xMAW5SHnvMn/gVLdkl2N68KSLLdeq8fR1Yay/x5M35pEwiiLXK4icZSbBHOTA9EF8InsgWkD/EruX19z94118j8pkcc59B2WT4C8cEp7pRLzoP1QFdj7MpGNorj+DgI7mEydSYwyPP/5KD/bndC+2DwNdyKalGNBexRAvwEoTZN3mwrYngqQCfeTX9KPcyAWpvMetTXiLgCgNnugVenyZArW2yKreiZnKbEslnWJ7NS9Dd96smNGciXIU67TGDU6gp15mEwavizh6TWdlDoupKTsM1f/f/iu+v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2nDJ5XMJv2EifefEbEul9k7J4abXSvgY3cIrzd6hDU=;
 b=KEJmEATHZswOQ4rUFL7XmoK2CHP+/Wyh9YfmDk8qHVjtg217AiFccKYAWTukQsDzqKIRB67O08WrdWXSQckSqxaxOtYHw1BvqlqazyQxU4Y+XJiVqibR907K/P+GX9SfE1KXs7FbTaS80xQumG+fuf/N7vkacpMgqy8MfNmkWwMbu8k4Tyuo/Oekt2OM2rLOBoHS4sIBgBCBg7fZTt8ssq9ofAtWgI46aDMDu7d6zn71xEu03vmzX93/Mw9z9HKM78m8YlcpfQV46oFe2HxA61/bJ8oy6wPUtdtvygjbKmXgxV5epXWfHQZYEoDoc/PfWdxcQvPKM5VHlPog3zYf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2nDJ5XMJv2EifefEbEul9k7J4abXSvgY3cIrzd6hDU=;
 b=BWERm0lCsmcliqX4I6GI27IcuHKhARM5kgvSImH+HHy43/Svst9tOuvKSrQwVKEfDgWMOBA1T5jndnxu3J4l4XNCfNaXu5wlhyCsiQQGmSDdMiJnVEEYZ01aCNeFMurpBVgZsVwLpp+Rh1rZv4oAM326iz96R8u0O2Zw4rojjnFQjuiS7rBcRXTg2AEtaP5nKb4DiVF6EGk8OvPWx1B1DdpqJqv0aoZGSlwiA4zrE8sFp0fcYT8lXPLCWMe6s8tDnvuD8BS1+ck9qiqMBH545LNcZNVkhy++ILFys781KIbkomKozHyqy3SzmwV9SIPjGfjwiOdn3GRw0CXR55ivig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1292dc4f-2966-d8c7-53c8-f465dd9344dd@suse.com>
Date: Wed, 9 Aug 2023 08:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] common: move Linux-inherited fixed width type
 decls to common header
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
 <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
 <4ee78808-5807-58e8-2054-016486607713@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ee78808-5807-58e8-2054-016486607713@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e5668b-086f-4c23-2733-08db98a1a2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U+EREC3PAhqKpT8wMC6aS2zX9IEMpWpY7dpPh9r9jyuDVA5LXEX8uxuiHf69BjleRhau9mBAR8cgsF0obA6oFPzsyTUomtMLNamdmiMY1E29MqQg1kleOXiw6yLoCgE88jfVUwPXuH+JrOMBDYmmnr1SM5r4k/KR6nuimOBmp1J6tVr7bYjKUf0bCFcBU5v7djb+6oCvLdDgxlh13VnSM0l4vnBGE/Is21SX5gZbYEswak3ZIFZgnaWgLBKU185nG5a+oUPCTE4DFS+yZd57QBE90tnod5SCQeXj4QJI+yLmNRYlO+h1+q7sjVz0LwnuWiaRHaPUnWaJUiAL30lBwKd9+RdTMAok8EQ6MXbWRmTG9oLejZpeNI+wlqET7g7ECwyo1fFcXCBysIhrPJnBPhFJu/9GC40DD3gIaVctOGTxUIaxu+O/GZd1VAQv3UYuPC7nuNW1jHggXFbDHMnIALYU8iHIVR74VqRPym0VWbXf4poWBhZEZgHxhuNxpTuEFe8U7ON4TWJKVonaFaXIDDkK5H4eWI2MhLLg1qvkzg7OFQpRUpdDyVLBhpL2BsbqYLZtfJPGHN6mzTcWo/Kr3wHsOOOGApDiwInYRBOI5ELRQc8CpjQlfn3pBH5z36SMry9lZP4gtFO+OH+shHgvMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(186006)(451199021)(1800799006)(53546011)(26005)(6506007)(36756003)(31686004)(6512007)(31696002)(86362001)(2616005)(6486002)(478600001)(54906003)(41300700001)(83380400001)(316002)(6916009)(66476007)(66556008)(66946007)(4326008)(5660300002)(38100700002)(8936002)(8676002)(7416002)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHE2dVlGQ2hNaEsrS0J4ejFnOFZBbTFybjFVbjg1N0Fkck5zaWNmWURzTFNP?=
 =?utf-8?B?akZuUzNBbWs3VlA3c3FLV0ZCOW9KQ0xtNEZvOExQbUllLzVNT3kyT3I3d3RR?=
 =?utf-8?B?TTc3alFLOU1LQmZDNVl3MW1tNFluVFBXOTNGR1BTQUhsTXNYREw0bGxnRlQr?=
 =?utf-8?B?d1U0eUpyNTl2UkxRc0lJK0xZc1MxcURFT2hrSTNCNmx2b1l3NTFjQWwvaHZT?=
 =?utf-8?B?R2o2OEM1YnVjQ09qM05TWXhTQjU3TEIrSFI2NXp4cm80ZjhnTjUwQzZPblNy?=
 =?utf-8?B?VmhUaU5ad1oxL0dIQW1ldWlnd1IrS1duT0RwTmIzWk15T2NNUHVsdVovTWlD?=
 =?utf-8?B?VzI0QkZnWG9mTWlUMHlvVXJkclo0M1NkaEJTcVdLc2ttc1BvbHhLdDA2QnlK?=
 =?utf-8?B?UGhVSWpFM0p1NmN3aXB2TlpnNTR2cnVSd1B5OW5KcXdNZm9vRXNPdHI3QXdj?=
 =?utf-8?B?OUtyS3FGVVB2NklTdk5XK1d6M1FqdlY0aGdXNFIxN1prY3czdUFMbnRBNHFp?=
 =?utf-8?B?bWNjLzYybjlYWG9rakt3eUJjeUtMdzgyUWVVQ005dGlBZVM1MUU1UFNIY000?=
 =?utf-8?B?NDM1U3lNREYwRkduRzFiMjlnOSs2N3pOMXZlQ2VMVkkwZmIxR3JGRytPS3lT?=
 =?utf-8?B?VkxheVZQRFRQbFZmTU9qbGYzaXVNVFdzTW5DUGF6bHRPRW5NUm5ERml1cUVQ?=
 =?utf-8?B?bG5MWTJwY2ZKVkFEQkpTNDFzZTVJNXN6RTJncnJxdnArUm0wTUJ4TVdNYTgx?=
 =?utf-8?B?VGZST1RNQzNUa2V4N21za2RnN1RkY1BYak5vbnBia0pSS3dNZW5uZkduRG1z?=
 =?utf-8?B?OC9NZ1phcnh0aVMxRTMvNmt2VGhyeStzT3hyYVVidTNOQ2Y4d3lSdVM0WjZq?=
 =?utf-8?B?Q3JHZm05MC8rWFM5YkhEWTV5WXVHUi9pMGFHS3pMb1BkSmcwL09McDk0U0hz?=
 =?utf-8?B?VU1hdnNSdktsV3djcHlmZ294TmYzNkhYUUVkVnEvMVBVcTdHV1cwcko1QUZR?=
 =?utf-8?B?cVFhVzI2RTAyUjBMdW1RQ2N3K3JVS0N1MGVVb2pIRTVaYngxeWdYNzd4aVpn?=
 =?utf-8?B?NmpUQThLUzZGalFvaG9nRVZJa1NCYkloUWZUejBmUlcvVWw3eGRDK2ZkdWRN?=
 =?utf-8?B?Mml6S0dUaWdiRjBVUm1zMlczYUhzZTNXeUJsK3kyaGRZVXBRMDVMTEtqc0JN?=
 =?utf-8?B?UE5jQTZwUEVWWVp5WmV4d0ZIRjA2eTYvZVlIdEJmME9HakJraEJJZjJZSysv?=
 =?utf-8?B?Nkc4R3l4MUJ4L1JZV1VTS1hBVmJ4UFFHSFVRcWQwSU43Z1d4Y2FlSGg5V0FO?=
 =?utf-8?B?S054K3BBL1ZNc05uVnRIOGVCZ0x4Q3A5MWJWd3BqQ0tVNUpsc21JVTNKV3g5?=
 =?utf-8?B?YlJwZWNNT3lVOFQyam95NjZJZWNQS3NzR0JMUW5SVzVVNFoxU2pGM3NCOWRB?=
 =?utf-8?B?M3dXbDFtRTRWeDl3cVI0dUEwSk1YSk5OK2lwNThBenhpWWw3ZFg3RlNNVVpz?=
 =?utf-8?B?MHh5NEJ6WlJueTRPYjFVRUtNanNUSnNOdTFCblVqekkwRkFFNXd6SXovT085?=
 =?utf-8?B?NlB0RmlrdUxaRmhoWmMzMFk4UUFGN05EeXRVcFBFSVQ1MWEzN3hmVkMrTDh6?=
 =?utf-8?B?VUR5UDU2U0ltK3hBczl6bG5XYnE4RFFBWXVwaW53dnlkNDBSdis1MDVlNkhy?=
 =?utf-8?B?amRhZnJ0RVVIalNpOWZOOXF6VzVOUm5GQ20rYlpmSG9FeU9kVk9teithV1Zy?=
 =?utf-8?B?TS80VWZYdkk3dWFYdjNxR1dYZnpoWFZ2aFhxK2NTTDFxNFJBVnNIVXVXWjJS?=
 =?utf-8?B?VGUwT1J2K042OU91dXNsNXhwZ2VmMW5kZVdRa3Zlc213K3NQZ3VRZ3BPbUlp?=
 =?utf-8?B?ckFIUkFnVGxabk1hM1JtUi9nZlZueERmZjZpVjZOLzVUR1FWVjJPWElxK0RZ?=
 =?utf-8?B?bEYvT3ljRFF2SldjcVJFWFE4SytpZ08zWTFDcHkwZXVmaGJUdDg1QU9TaHhm?=
 =?utf-8?B?dUUvTkpneEQ3S1E5UUx0L0ZEUmhwaVczSHEyNXZMcE1yMVhYSExVTVp4dC83?=
 =?utf-8?B?Z1dCaGEwZUp2R0ptUnFEWnJ1RmF1L20yQUZ2NnIxNnNKN0lsREY5dFR1eXRX?=
 =?utf-8?Q?ca/zJz+NILBO6iEef2Rz2Ey15?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e5668b-086f-4c23-2733-08db98a1a2b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:26:59.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09lnmJIU0cSjYOk4Xl9PrAni9HYQEoHFS2oNRmx4uWndW5idTnnr85UZGwODWmr+yWf9UHaCPZplDXzZ8kJhow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7218

On 08.08.2023 18:43, Daniel P. Smith wrote:
> On 8/4/23 02:08, Jan Beulich wrote:
>> Have these in one place, for all architectures to use. Also use the C99
>> types as the "original" ones, and derive the Linux compatible ones
>> (which we're trying to phase out). For __s<N>, seeing that no uses exist
>> anymore, move them to a new Linux compatibility header (as an act of
>> precaution - as said, we don't have any uses of these types right now).
>>
>> In some Flask sources inclusion of asm/byteorder.h needs moving later.
> 
> I just did a test build against staging for x86 with all asm/byteorder.h 
> includes removed from FLASK and it built successfully. If there are no 
> object to a small non-functional change patch, I can clean up include 
> ordering as well and submit it to xen-devel.

Of course, please go ahead. Simplifies the patch here.

Jan

