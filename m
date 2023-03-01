Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F296A6C80
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 13:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504018.776491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXLmi-00034k-KS; Wed, 01 Mar 2023 12:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504018.776491; Wed, 01 Mar 2023 12:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXLmi-00032X-HT; Wed, 01 Mar 2023 12:42:16 +0000
Received: by outflank-mailman (input) for mailman id 504018;
 Wed, 01 Mar 2023 12:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXLmg-00032R-SJ
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 12:42:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce8c775-b82e-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 13:42:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7538.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 12:42:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 12:42:10 +0000
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
X-Inumbo-ID: 7ce8c775-b82e-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0bd9Fku6r97plSGD0rTKUGHP4dfjyTSjJz0J9ikW3EzeLhXAg51Uh6rbNFCyQuKj222NsIE02iF414C2zrM/bo3cAqW0pjtn4WYllm6syDOi7B1R/985VBT8SOvq/+Pd9m1BYMD1pi6Yk7kYgkcPs11t5bcAmvA3Z2dY0mm3bt0Us6lyyRHOTWDnHVw8G+WG1iXzgD6QGqZEsTBOz77ugcYWnMZ9ZiR3e60gpV0JwhGUdt5mLsQoeYIF8qegSMMPUL7JyuJ/+sSzrgo80N/UWRRPuWusxfyZjtTcJEf7DaXzh5u39mxFm1YIqV+3PWxtwV4K97OWV+7B5CqY4AC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CStBhd9bS7lIXJO3ROS0qxmbvDkgJOl69tY2BEYVb5o=;
 b=KffpaTLBSf8H4UrM0re0GNeSdLh1ZBxROF43JSEC1GJ62J1TD11JIpO+UcPe1g5A2kBFVgMrjvXM2MshWpjTdwAvvveI/boTgA0GUYsL/ceKweZl0L9Am7o7Nysk9OJ3dSYKTTSFBaxJw7vH74tvHs0CWNr8rVWnIwd993t1Mpo1Dctu1Hvn7c0Pvhp1hFR06cz3izlYtpn1FdUUcoOYNXb74h7B64//iDKgt+bW/q5SymcM//N8IOzt2f34VQxXJoHOlqLa4PWqM7Ew/3gVBAej6LwG0V55anxwFvPupBSk0mLtSfGegN6cHuRu8JryNR4Vq6HWoi9DXoCBvOVYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CStBhd9bS7lIXJO3ROS0qxmbvDkgJOl69tY2BEYVb5o=;
 b=2SA4hzErUNczJ0ZxfXGm02MJNM/8eoWz3ikrZshBI6utg/Of4Ji5J1Pu7JLzUEeXzVeA+V+zxiXdzpZRNfAwsGCNR1htLnTG24LN7FFrnau0uUorqv3A78gs/Aq8+JH0fT4jqKy5c5dqjZHAnTTKZBvgQQXARbNKrCxnJ9E8ThoPZnAU0Lrhz6AWRT0sFb2ImaSpBdbeUaG9whyXrOIxSPy8E1G+bqRbIqE2xGI1DVRbF0irZtjBMtcDysZFJIvZPXz4HhHqmtzN7wD2NWDdIUdpwLrDgwT1KjEwPZZlRAuSugqZMotYueSTwo6m+RBSFVyIbTAfTdOUYYCUhyufIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebd5bd25-0645-810c-6077-fe1858454dee@suse.com>
Date: Wed, 1 Mar 2023 13:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
 <a70ce0599da9549b5c4e601e5b410cfec5fc185b.1677237653.git.oleksii.kurochko@gmail.com>
 <e34c0315-dfd0-c176-52bf-64780befedb0@suse.com>
 <87902639b4d80c82833be96689f101a3ff151646.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87902639b4d80c82833be96689f101a3ff151646.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 73609788-4768-4d66-9b06-08db1a525fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8RN6LYgXRc8fvcHDQZW3zHNSZL2AbHuKtNbNQdhO/J6tpUWXxinHTANsdp3pCKcb4/DgY+B/clW8ccXWWHE/0cpc/f8wKohFW4Pa9Rl1zw2h105HwkZd01FtEsWHwtmU0U1HtSJz7kr24qbujzdCIeqrZpINspqahVRKn/beammMaylSB6leWOtOsdKrD2UaDjMGqWxDdHSSjBGxvKqNXWrIuWUVVYOZeAyPzjoZ5DUgII/v9Q8D7HNXiZFEWnHvczJgPr0hUwaPWpgkOiDP3qehOMtMF6+Bt1/XbVVEy5HfhK9q0LyM95RlFKxEj/GOQEFiHO5y5HdO1Ov3ZivRNzUjSmr8E9UuH2TeHk1TnZWnEtdB6oAalW7NnQNoYubda88BSq7C6zuCXA9zPe8/PYS2GSTijjIAzYDHCcIDHze2dpDBMOpR9Ca1M7fNs+QMtW9/M9TPqqS51PZscjqtSjldvNM+JaowQS4VemGdRbni/6WNurOo8lGaFkg8VQ3p3iWEn5tVOHQE99G4G/qx2+UwgoSgdYpc2e8hFNa6XU8RS6AYcVGypCWtpv4YDtKthF1ipRV/yZxH/ztCkq7GLDqdH+6LZ2oQqlNH2m+m4foQMCJBcFj/+uU1mVG36mKSl2mdEaZOQtQHT6hvMyRYZD/dMeveJKPEmFNIq2E0gAzqeTea4Nq61dkrJQYEQgX6VTzIv3grmnHLaXa7Z9XWSHfKB/o1RQs/SUxtpUAXJQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(6486002)(8936002)(86362001)(2616005)(316002)(31696002)(41300700001)(83380400001)(54906003)(6512007)(36756003)(53546011)(26005)(186003)(6506007)(8676002)(66556008)(66946007)(66476007)(38100700002)(4326008)(6916009)(478600001)(2906002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d09LTWlWVWhLUnFudCtHeDE1czZlY3dRTDhXRm9oM05xeTNwYlphcGlNWVJr?=
 =?utf-8?B?NC9NSjAwZDg5a0w3WWlOS2U1c2N1c0FVUll2WXlDbVoxS0RiQ0o3Q0RJT2V4?=
 =?utf-8?B?Z3VaWnZ4ekd3VFByeG0vMWQxcUwrMUg2cUhnS1R1dnQzNmQ1b2pYSkNVNlhW?=
 =?utf-8?B?VE14NExlTytKNndFaVFJaHp2bkxQZmJWbi9LQTJmM1JHcWFRZDIwbU8vVE1U?=
 =?utf-8?B?NkM2YUN4MVVGdVVSc2J5V1cvMkp2VHRQTzd5cDEraFlQT01iQzFMZzNDOUps?=
 =?utf-8?B?dVZJWk5PL0tmZjNjQ0lqQXkwV3JLNyswMnpzWkJlL1M2dTA0TklLK243d2Fz?=
 =?utf-8?B?K2c0dk00Yi9qcVc3SElaVFVuRDRvRmttNDNDZThUM2hZbklxWWJUZkdtQmZt?=
 =?utf-8?B?cTRpRUJYUk9Ma1NseGVEbWZDdCttajJSNEZKZ0p2TDlKV1gwYVlwL3R4RS9S?=
 =?utf-8?B?MUFmRjdwbm9ZT3o4eUh4Y0dNMDNrZWRjMnBSa0xEMFNjZnowem5ONVl2eHMz?=
 =?utf-8?B?dFAycm8wd2lzbnpHcWRoeEt6QTNRNFVSTmVoVko5ejZ5dk1MaGhNUkxoaXJD?=
 =?utf-8?B?REI2L25RL2p6Z2xPbjU0THZNOWtkNUZyY2cwbG9iZDBNSXM2YXRnNjI0Qm1B?=
 =?utf-8?B?bWFpMHFvMUNqZU11WTVLT0xMcGNMNFhGM1FTaERpTkd3bUYwRFdsRTZWekRv?=
 =?utf-8?B?TmN5OUt6eEkrL2JyWmU0dTdvc0F3cHBTRytzZjlTV0M4RnAvQXl2dHcxenhD?=
 =?utf-8?B?eVNreEJMZWEzNVZDQVJYWElreHlrNm9pM1NUbHgvazJSbmoyY0FWbGlHeDF3?=
 =?utf-8?B?cVlnZXQ1WVVBa1dTL2JiMXFjOVNlWVIzTlBPOVpZZkJja2lTYng1NXNuNXVp?=
 =?utf-8?B?Q2x5RFB1ZzA3NEVoakFTNzl3NXpJSW5TWVpGUzN1blpnS2JHVm44YjhmQ2xi?=
 =?utf-8?B?RGQzZkxaaVJXNm0vTS9qSlZRNVRTMllEM2RzQXNDQ29EZSsxWmFQeDVmQnRD?=
 =?utf-8?B?eU5lZUlnMnJQZm8vN052cWQxaVU0Mzh1OVJDQ0pwWjcyQkMzT0R0ZlZuaVQv?=
 =?utf-8?B?bjhyai8zVktWcGFLMGRUNkZtcXRUU2ZRSnVXMlBJQVRITlpTNTNyaXdxb0s0?=
 =?utf-8?B?OXF3aWs1RC9Rb1NHWHFrUDFPeC9FZTZOL2F1ZTNLcHhpcTFJbS84KzVZb0pQ?=
 =?utf-8?B?MUxEWWlianJhbWVUek5RNFdMekRGMTRPaklzUkVjVE5NMmpJaUFHVnZHQ3Fh?=
 =?utf-8?B?blJzZGlkVVl5Y3lYMTFXUzFzOG5MdWNiK3czaTBOUVVaUUk4Ykt2c3BrMmdv?=
 =?utf-8?B?YzlXNmlaYVArQkZQc21GdjZQYkk4bkpRRTZRb2dzNWJkMC9UYWdiUFVQOGg5?=
 =?utf-8?B?YlZFbSs4aFgvRTFYL2Z2aWxYTVNJU3BUclo0SmRYR0F5dnR0T2hqVHg3ejNo?=
 =?utf-8?B?aUJhQTJaVzNONmowd1l5dTZVTXloN21GQ3RYS1djcDBIUElxOGVNMVNSS2hH?=
 =?utf-8?B?WTkyeDg1MXk1TFBVZlk3R1h2NTRaeDNRNHptRDRWTGZKLzVOQ1ZIZnpocVIv?=
 =?utf-8?B?RGdwVlljV25XTnBjUGFHK0RieUVZQVRmVit3RjBjNG5hU3FHMmVzWjBqUFVE?=
 =?utf-8?B?Y09NcEtjcCtWSGs3YlBUbUJLTDg2SzY2dDVUUEtxY1dlMjV4R0VyQ1VEdGxQ?=
 =?utf-8?B?QkZEQmR3VjlENEhldGllL3dLaXkweUVVV3VuZm9JbmZWU21ZQXRXZ0l1cVRU?=
 =?utf-8?B?dnh6c2ZiTVZmbWx3VkxNblVxQURhbWJ6TytWem52Q2ZyVS9sWmJyTjVRTS93?=
 =?utf-8?B?SzlTQUJ6SmdmWWtyRXdWeTJYOVF0aUhOekFTYzNiSzBnV2xEbk56cXFRWUla?=
 =?utf-8?B?SzhsVVViWXBXMldHeE5PcXdWbEY4a1cxQ3c3RkYvdkFuZ1N4VXAxYTNPZVVn?=
 =?utf-8?B?dnpxS1FVeGdRQnJKRlpFMGZFZ0p1ZG9LZ0FScTVodW5xdk5GVkZnR1NjTFg4?=
 =?utf-8?B?TEJBQm50OVN5VFdwU0hnTTFaV3JWOEppS2NEMmZ4Wm1sQTBEcmpaVDVuZWtN?=
 =?utf-8?B?TGY0aFdKRDhvSk16SGRWNUpaSWZKMThFdXRGOS9xaHJtWjEzeHlZaDVvaUFa?=
 =?utf-8?Q?DJfj3R5YRBKvdlCpf9q0rSHIL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73609788-4768-4d66-9b06-08db1a525fed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 12:42:10.3979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZRbNOl0nhyaius0pm4K/tgaIQriUirBddzqGhNBVuPXU/Gl+cfTObyFRM00aLhCmVRd5ucC5Djx+VeYDWW2uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7538

On 01.03.2023 12:51, Oleksii wrote:
> On Mon, 2023-02-27 at 13:59 +0100, Jan Beulich wrote:
>> On 24.02.2023 12:35, Oleksii Kurochko wrote:
>>> +{
>>> +    if ( (insn & INSN_LENGTH_MASK) == INSN_LENGTH_32 )
>>> +        return ( insn == BUG_INSN_32 );
>>> +    else
>>> +        return ( (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16 );
>>
>> Nit (style): The kind-of-operand to return is an expression. Hence
>> you have stray blanks there immediately inside the parentheses.
>> (This is unlike e.g. if(), where you've formatted things correctly.)
> To be 100% sure, should it be: 
>   return ( ( insn & COMPRESSED_INSN_MASK ) == BUG_INSN_16 );

No, that's yet more spaces instead of fewer ones.

    if ( (insn & INSN_LENGTH_MASK) == INSN_LENGTH_32 )
        return insn == BUG_INSN_32;
    else
        return (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;

or, if you really want the extra parentheses:

    if ( (insn & INSN_LENGTH_MASK) == INSN_LENGTH_32 )
        return (insn == BUG_INSN_32);
    else
        return ((insn & COMPRESSED_INSN_MASK) == BUG_INSN_16);

(Personally I'd also omit the "else":

    if ( (insn & INSN_LENGTH_MASK) == INSN_LENGTH_32 )
        return insn == BUG_INSN_32;

    return (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;

. Plus I don't think you really need to mask as much, i.e.

    return insn == BUG_INSN_32 ||
           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;

would do as well afaict.)

Jan

