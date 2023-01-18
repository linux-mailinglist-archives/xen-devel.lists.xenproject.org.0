Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3C8671523
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 08:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480192.744452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI31U-0003Zw-Kp; Wed, 18 Jan 2023 07:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480192.744452; Wed, 18 Jan 2023 07:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI31U-0003WW-HR; Wed, 18 Jan 2023 07:38:16 +0000
Received: by outflank-mailman (input) for mailman id 480192;
 Wed, 18 Jan 2023 07:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI31T-0003WO-2x
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 07:38:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 106ca26d-9703-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 08:38:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7725.eurprd04.prod.outlook.com (2603:10a6:102:f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 07:38:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 07:38:12 +0000
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
X-Inumbo-ID: 106ca26d-9703-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmfQ+68iO4L/aDnbDtAg8K9SJwrNM7Pth6oncxND7iFLbC8Cp0i+DQj5gnmJOuvRsFwLXfblnHyVTOrFh6r4PYH1y+K0EZLpHcDzPgfD6jc8pPSQyZNqHRQbuf5lSq8sFsajvBOwTLvfZhRbtDM5JjRmQXYUY3oTiQdh1KRoAfB3hGoH0xNuT6jh0e5jj0yqoDoy8DaTAO8VTsvL48qpW96cz+1Q0H4QdCCWMlaC/OhkXCU7ZDCohOmEDPlV11sXVhxj4YPIe5C9qYulcZSnlSA/l84qfeXuqp4qjm7iuKgQhSrLklPPKySYfcYO4PFDQuxbNcDAjqvpRdO4oAXj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPSKKHQPH7bBkW3Yq+y1pEXmvB1EI+8zZGED24kyGOY=;
 b=RF9KJMSe1TaqhavDPcJ+Xee8DvLvo7wAQ8lOATLMWiCMMyqHIBscuqGM4A9L5V/SFy5luZdHU78YDPIi/5zCfi9HD6SVpQdzPP5Zy+vIP6SORWe0G0JZAMNIFnYw7juYVLSW8Qo4+reoAjVToHG34rHDKHYYdecoPJ7yxgeZ4UKhZTmDfZOClVkQWch6AaB2RjCrM0AePTx6lfblmRKCz/R3nwaBxQwOvklpG4Es+GOP76SExf8kv30/yos8X0blIZ0BXAaqwiD3vFZhDxBs6hj5dIgrZyDXv9tdnhZErpeYjr848oeFhhsxcQUD4bZqaStD1KYnyvRdgxK+IBmkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPSKKHQPH7bBkW3Yq+y1pEXmvB1EI+8zZGED24kyGOY=;
 b=K+NG5QYjV+LM9u3EIBKprNi0PAPsgW9G3TiwbdBaz68oLRC2CDcR99U5hdnyV7oJHIb6oQHFj44y4HW2zF4xvEgQQ1m0NmPpXExJfJ9hxbYik1TSFuhSm/A/5bSawL+EUKVylDg4XZPsavzz9EUX2Mcc9DzdVSMxMNsDUG/alxG65JaFMXRKhkvSMRAlAoVcsSOARQvYH2XqKxqaDGnhTpmOOevnYNcktgN8Q4sFDu8OfNS62Vmghqyzx9prTxOuo69G3dzDEbY7eOaNatjVFzBJAOZzWp4yd/uPTcJzca57QdO6HSHtA5X7Xmc6T+fX9OvXLLXqYOgfZEOgbB8JOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5e38496-3dcd-3a42-6c2a-43ccb988caf3@suse.com>
Date: Wed, 18 Jan 2023 08:38:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] xen/riscv: introduce sbi call to putchar to
 console
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>
 <7918f456-14ff-77b2-3cdb-1e879e030b39@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7918f456-14ff-77b2-3cdb-1e879e030b39@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 352de570-046f-451f-3fa7-08daf926f3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ga1b04TYP9z+i4tkfhfe0kLyKlmwjaodSmUvdWahqMvfYCMm22Ui+17YBlaGqgwZmqcCFzbgsXhE5iweo9NE97Jn9Fi7t2A0VRsrCyOuE0sG+ZCTBZpz9phBTDmuJYKPYkEKA5K5hONY401CI6WR3G7A5e0lsOupszbppxxy/MbwuPjwItqZ4SseiHNw+w2/BTQ2PF1QhDPPA3DRdeLcMmXRVvuXKUMGckO4hGT+HPXmffnEhhKvR1NUnuuw7Ga//njIrkr0hCIOK/aIGPLSgsBWJbpsN+iEsgZ7DwFgGYBcr0vb5/5rQGYbRCuvYWT6zSiOWSCQ5DENytPSkOE87JJTQCCwDXqJ0I72v/iE3700SHFORa/GFINXek3C/d/+ileviby0OeVW1VC0AcTtlRckFUc5fdAWi1Mrhyn0Jf7dlW6uYxHznlmF/2qFyZzpnd95rGXbgkPjZI59wbWIwTWrQq3CqORQKc36Xrl4mveELr1+6LoXgSgpm3D8kjCyaai2CKkWKElhy99EMtuw/5luiF253mQnf4AGBH8uyAqlZ1JK/NxNTMi8HTrhswpNQsCEH0gEVl3HNjRAcBSJ5LXowdH3pui3rQSFJlYqKt9yNzGhmt60/Lbq/4GnT3xB+synrvL5lgYWSSB2oTgbzyCiNA2uqLfVYzXDmiwso5Q3HTZX3D3LAmre/sJ0kDN7mWkPMzzgWdh/AhwLrTO7KRPwh1mTiK+xF8tS5nYiIJw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(6512007)(186003)(31686004)(6486002)(26005)(6506007)(478600001)(110136005)(316002)(66476007)(54906003)(2616005)(66556008)(4326008)(8676002)(66946007)(86362001)(38100700002)(53546011)(7416002)(5660300002)(83380400001)(41300700001)(8936002)(31696002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2t2MExvMFBhZ1ExczRIQnp4Y0RURm1GSHRRT1d6QmVMdS92emZjOEkrcXMz?=
 =?utf-8?B?MldKdEYwaythc0JXZjRmOWhkeWJ5NTlsM0hIS0ZOV2VuZU9EUjJaYVlseDVp?=
 =?utf-8?B?dDQ3YXh4QW45VmtwcFdLRXNHeW1oYnhwSHdzYUJTaU1FajgvbkdGdlpsU25v?=
 =?utf-8?B?S3dtcjVybjE3cUJNMHArS2pQWVBYc2JSRFNnUEFoT1I2YW4zdGUvWVBieTV0?=
 =?utf-8?B?eFJEZFRZRkNyU1BsUGRvYk9oQmRXdXhVRmRuQ2l0R0NUVlpBVFFUc041UWVH?=
 =?utf-8?B?a3l5b09wYy9QdjVvK3VtQXJiMkZ6YU9YNVZFdzNnUUdMTHI2R1I1Z1RvaHgx?=
 =?utf-8?B?Tk9NYW9mMUZ4VVJvWThnQWRGZEFvdnQwZ2lFUG1iSktNRW1SRnhmUm40eEt2?=
 =?utf-8?B?Zkd2bkQrRDJ3N0plelY1RVhyaXBpSk9tcW9lQXArYitCSmQxVnJOZHhIVVVy?=
 =?utf-8?B?cDlsNUNHTXM3QWRCTnlkanA3OUtxdWRZNlJydDNRTHZyMEZFNWs0SGlhVGY5?=
 =?utf-8?B?citoMnNreExPYy9DZVFGU3JPdXVvVFAyc2ZqWkRmbWlua2F0WE9JY1NKSG9j?=
 =?utf-8?B?TEtzaU1jZzF5Vm1NZHZMd1ByeENvZmRGdG9CenUxVDRKbGV0MkFua0hyOTJn?=
 =?utf-8?B?cENBU1ovSlZOaEJ6bEIxNzYwalZxdFE3VkNuRnpKc1Q2UWlrNGFHV1lUSlYr?=
 =?utf-8?B?anZmajdYVHJOQjAxNHM3bUpDK3hvL1kzN0JpcWFIMUhBc2t3UmlOVUQ2OHJT?=
 =?utf-8?B?VGF0aURYWklZSXdIRFI3T2srWTRRdzdLSW90eUx0Sm9NRmwzNGp3cFkrUkVz?=
 =?utf-8?B?M0FxL0FRRFptVWpxU0VuOEFNWjZIT20rL3Y0bWZ0Q2dlellYU1ZOWHQ3Wjdp?=
 =?utf-8?B?eHhmU3VUejl4ZS9FaVBBbnppNnJ4VTY0WGprUC9SSnhRYVNTNDJLSGVRVEgr?=
 =?utf-8?B?QUVNbU9rcTlmZ2piYyt6WFVUK25uNG5ZTS8xZ0NyNEhaVU5HUDVkeTNSZGF1?=
 =?utf-8?B?RThzNU1ncDU3cTY1SXBMcW55OTlwZVl0L2VDUlVkUGZkdXV6VFRweTZmZHlT?=
 =?utf-8?B?Z2xUVTBYT1NkWUhWNXo1NE5VSzVTQXhqckxaOVovRmJuSnlvZktNakJYajZx?=
 =?utf-8?B?Y0drbE4zY1QrVVRoaWNob3ZBOWFCY0taeml6NHBGMm8zZHZHSTdjOGtmSVNY?=
 =?utf-8?B?eWkxckJNd2pUL3ZMQjV6NGoySmQwcWZRdUdRamhFdWQvYU8xL0h3WVp4OHUx?=
 =?utf-8?B?d0hzQm1RMDhGYUpQbHBRZVltc3V5bTZ0S3VkNzI3Q3kvbXplTzlvYSt6VVUv?=
 =?utf-8?B?VlhoT050L0FJRHUvRWc4bnNmQTBSekxpWkIwK3gxNGFNeTR1eHpSMEJVTnNP?=
 =?utf-8?B?QlQ2ZzVwYWVjVm1tZ2hLdVJYaFB0WGdYTmViQ0ZFVElLR0MrS29nTHVWdUZD?=
 =?utf-8?B?M3JyT255SXl5cmp2UkdOczdTN0FBZitxS3lEWjB1ODVsa0JFbWh0UUwyMUV1?=
 =?utf-8?B?dm9kaVh3UXJ4TVdyNWFZNFR0TlZzY1Vodjl0czZaekRNei9ZRml0Q1pJZ0o0?=
 =?utf-8?B?L2cxYm9KL1IxTmoxK3ZZSTRzbHkxOUEzM2NVdkllSHhIWkRoWS9KbFFNUFBU?=
 =?utf-8?B?VzVZcTh0dmNDU3BnTDZ3TXQ4ZmhiK056dmUrMzkyTUZKbVJONlIzcm1mY3hR?=
 =?utf-8?B?T1VjUU92Z2lCR0t2cmF4S0NQc1JaQTF0QVVMbnJSbVdtRmdPcVRubmJGYTho?=
 =?utf-8?B?NVZtUHU0Vkhia0Z6RzczYS9kbSt0R0FqL2dKQzd0YUpGTm9reFAyUTFmcE0y?=
 =?utf-8?B?QUpSamJVTTd1aERpT0tzdGZoTUtBWW9RRnpjTnNvZG0xbEwwVGd6TlV6dW43?=
 =?utf-8?B?OVp2VThBUXFHL1EvdjNnclNnR3N4Qi9iUGo3dC9RdnpEbktrMGtQOXFqMWJk?=
 =?utf-8?B?UC9uaUZiNUxNWjJpRzVEaXIxSllQek9OcUlZVkErNUxyakRkZkN3NWp5TEFL?=
 =?utf-8?B?RkRGMDZCWVJuQ2Z1aHNwZUxHSHdOU3dlQkVvbkczVFVqUWdhUVlSeFlDYWFx?=
 =?utf-8?B?MFZVdTBIR28xb3FZemxPNzdJUURuNUxSVEpkV2pmLy9kVnZnUEJ3OUhmZkVL?=
 =?utf-8?Q?DKchs+DJaiwmhZdftyATeKLH2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352de570-046f-451f-3fa7-08daf926f3ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 07:38:12.1520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 858p7AhnQBjTV8Q0scCA9uxzAeBKSZ3WwFuPCpma0DCR7P6NFW3KpPHfLuq69Hrn5WcRuW4Zs7KLGDscYSFRyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7725

On 18.01.2023 00:32, Andrew Cooper wrote:
> On 16/01/2023 2:39 pm, Oleksii Kurochko wrote:
>> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
>> +                        unsigned long arg0, unsigned long arg1,
>> +                        unsigned long arg2, unsigned long arg3,
>> +                        unsigned long arg4, unsigned long arg5)
>> +{
>> +    struct sbiret ret;
>> +
>> +    register unsigned long a0 asm ("a0") = arg0;
>> +    register unsigned long a1 asm ("a1") = arg1;
>> +    register unsigned long a2 asm ("a2") = arg2;
>> +    register unsigned long a3 asm ("a3") = arg3;
>> +    register unsigned long a4 asm ("a4") = arg4;
>> +    register unsigned long a5 asm ("a5") = arg5;
>> +    register unsigned long a6 asm ("a6") = fid;
>> +    register unsigned long a7 asm ("a7") = ext;
>> +
>> +    asm volatile ("ecall"
>> +              : "+r" (a0), "+r" (a1)
>> +              : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
>> +              : "memory");
> 
> Indentation.  Each colon wants 4 more spaces in front of it.

Plus, if we're already talking of style, blanks are missing immediately inside
the outermost parentheses, requiring yet one more space of indentation on the
subsequent lines.

Jan


