Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74967E698C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 12:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629628.981966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r13E4-0005Gm-9t; Thu, 09 Nov 2023 11:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629628.981966; Thu, 09 Nov 2023 11:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r13E4-0005Ef-7G; Thu, 09 Nov 2023 11:29:32 +0000
Received: by outflank-mailman (input) for mailman id 629628;
 Thu, 09 Nov 2023 11:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r13E2-0005EX-OG
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 11:29:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f202bf9-7ef3-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 12:29:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9276.eurprd04.prod.outlook.com (2603:10a6:10:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Thu, 9 Nov
 2023 11:29:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 11:29:27 +0000
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
X-Inumbo-ID: 3f202bf9-7ef3-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRgy2PMvojR9jWi8UbY1wH49ZPl7DEx0gFfcaCQZq4DZ3w1WEf0K0JACbDvHTimCS/Vg4ct73m0I76ryF756XZcsBT1gVP8nkfJKXhEngXYl8Uba4YY14N4zBuZLHu4FLhzZDN6PcDGm+Bjo8Jr5jP6IbSmiwCKcODP4DYrd1AoFlq4kXYOgzrYc3AzeN4Fglj4Ap9xqBklt9nwic4RfMsmtoULW/t4Mqu8Y/6P3HihJkPKCvF8Jq4NClEnkHzuzOl++MGlpZpAWOUaWhQh0jBPbmwXZSTJrPZ3bHAd4DvUaYkofC5MMASReAa0PHXddtPS60rdH79Upbb/bv/cdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VX0xNaDL528VePobJEX4ml98M/H4+AczNJqVNQa5yo=;
 b=IbpmCbC/QqAhTs1bIQSxb5Cv0/dFtV4QONkUPm4te9hK8I9AkonyI8S5MUflB9snpbQxnJk66lp6mByF2aNjvcwyG57CidrcdvVB6HYCKwhH6/tJOAmZ0NSB8UyZ2/XrPRYtFL/Q7qKwby8ZR8Y4fI5NoPctnQvyxn7vLxvl3hLogkujvdT4Ym76Mkhzz555KYuf69b9mz2GnIldir9LI5NaBKdhSj0ILCTzsoXO1pCtJqAl/aAFsAwnHNTUaSuTs35kg8uckJ1EYGXDfRicYPa90ybDOcme/x1gg9iSP3N8WF2dDZvehzZmkeVLKTCfMemMEXD3s2mGalTich7xUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VX0xNaDL528VePobJEX4ml98M/H4+AczNJqVNQa5yo=;
 b=W/mg8nwe/negNc8/Yg2C870dBMgKoc/JWxJpKuXqC+eXSeK8knJA3OAOW06CY8xJrjYbbz1ZP4pJ8bv+/Xx7UuLk7nnJ3W0AT4gQvKkJ2L6Z1XURiuajrwv9Dqq1RW0RFZxtix6jciXzh+tAyp963ICiug2kRb1bgm1xr8+SuMySQY+bBDUgNUMkd+Vtn6mfSYQJnhEaZQp9W5nRKyOPs3R5oKh9N71vovmgd0IjzzuOAnmrua0pLVF7Z2bVcOGqlKthR0G7zb8ayTRuP7T2YnG8us4Yj5OL0SLEDA7/CkCRlHnbacmJ393hMEaBQadRao0Ehoc2iJD/Vz510i0ebA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com>
Date: Thu, 9 Nov 2023 12:29:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231108143751.49309-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231108143751.49309-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8453dc-8669-4d73-bf3a-08dbe11721eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HmyD6+ii1G3vsgHKge9p8/X+0uvKnc29gZRTz7Yx6wBmtokALKGdFK9ceD4uxsnJxMtEIVRZlmAZ7pYk8ZdM+Bwj1tDQImtcmxazECggQpaujA2KQTzoJ4x/Au+8Z5nG7PKeIr9dymbWFxnxyepei4OWaoHcLoCN0RO++2beQx7Fo6729D8T+v2F4QReDuS8RkMKK1xvv5PTfc2P/ptGtBkA6rkp6gKx6j6Fb5yTN4UPruWtnI9/GhmEaC5uTcfqSGbhBNNJbKG1Z8RU8Zvy4B/+LcmuGLuu2jNkr9rlU8NFn/KeVRi3kWFo0TGjqVb4oLa+ILS2NrNxYR2XiRW5eOjY9G5Sid8DXAArWz6vSqUTtQjilIK1BV4C4xwWKDB2/zjiDjLFjgZFzEaxwR/cF5Q6bpvWdaNowt4UEcSHB/FM1RnQ2DFeDH1lbjZoyKmqbCISrHFyUwJXF/sEbkoSU2Gs/7Y0fEr7LITHfNrWarBfDyLjne3bypBjm2vDDrmPdOm5bQuxU2/DxWa0tHPEuun1Bs4JYkFy2oV6JW0g16IngoIB2K3ufaQ5WZiDtlJcJI5sMcfOCYokzNXNrNqUOLSBHqS3eK+leIzRfzqnyS3mLMx8EsTO+oh5reo90+NNk6Z5gU7aMHo+at5MhNCEKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6512007)(26005)(6506007)(2616005)(53546011)(38100700002)(86362001)(31696002)(966005)(4326008)(2906002)(6916009)(6486002)(41300700001)(83380400001)(8676002)(8936002)(5660300002)(66556008)(54906003)(36756003)(66946007)(316002)(478600001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzBCQUUyNUNTbGI0a1gzd0xDWGEyeTF6U0xBMWFnMmxhdURZNkduQU5MU1A3?=
 =?utf-8?B?Q1NlazROVG8vMWJzS05kak1ubjdTWWtRei9mMG9US2Rxa200WjhyTUVpQXlt?=
 =?utf-8?B?RHlULzY0ZEVVdFZBaFQybHlJYk9ZOGNKM21OR2YzZjJqZStjUEplVE5oZGJE?=
 =?utf-8?B?eFZMbTJ4Ylo4TkdmY3kwUE9BVDdTWE9CaTVBZWpwbVN1ZGt5Wjd6Vkg0b2dM?=
 =?utf-8?B?YmFhZmVFeGpCYmpHQktuclZobkxBVk82cEE3UndPdlYzQjRjaW1YUmFLTFFl?=
 =?utf-8?B?SUdjNFNyejRsckpMRC9lWE1Kd044OHZud2JJTGh4WmJYY2Q1RHIzN2EvLzBr?=
 =?utf-8?B?M25iY2dHdVlvMWMzYXRUZXlBOFlCVDFrdG9xck83TDBLalliK09LUTZkTk1Y?=
 =?utf-8?B?Y0d4amJiWGh0dURUcUVoOFhoMHAxSHVOcXNzWVRjTGtKSzhOQXgwS090dnFF?=
 =?utf-8?B?dGZ4eVRxTHExNHBNMXJsVkNIS3dWSnNmdmxxOWJ5TTRyVmpzdFhGbVdLeEth?=
 =?utf-8?B?em5JUXN2R2YvbGd5aE1EcGhYWFhtUzFyNVM4SFZJL3ExR3hYOERGMXJBZFZz?=
 =?utf-8?B?VEJYNDNpTHFHYnNEQm0yNGU2WU4wcmJ3ZmMwMXJFNklZN1ZtbTZ5VVVhOXBL?=
 =?utf-8?B?SnRvZm9FZExDUGNBRXN3QUoydE9Qa3pvVlNTY1EwMEgreXRsNmtycU82b25J?=
 =?utf-8?B?YUQrYiszcTEzTkxpNktORjdoQUFmdUlmSEFqTzRtQytwai8vT0Q4V05wb3hB?=
 =?utf-8?B?MnhIZ3JlbGhnZXhSR1ZXREJTdVhncnZ0MDBVbVpVdmRKcFVCaWRDT21GWWdK?=
 =?utf-8?B?aE52UTRjWTdlNXdBeHp0K2FqK1NnNmhOZlcvbE40K3pVWkdTZVNnd0d1ZHZL?=
 =?utf-8?B?aVdBb2JJMitKWnd6K3Q3LzZvZ21ZcURUdDdnT3B6bzYxckhhZ0ljbG0zSzZM?=
 =?utf-8?B?ZEVDdjRBK1VOTDFuemZSY1ZFeEJWQ2ZuRkNoQ21yUHdVVlREOUVnNnRmUENE?=
 =?utf-8?B?M0QyRVg1Rlg0V2Z5NGV4eGQxblJaaVM1RVRrYVlVOExwRytIYUowWEZaZU5s?=
 =?utf-8?B?eVpQVURvWXFSTnZTaHhpODlZbnoxQ1owcDhzdUhUckxWZ0xTdTJDNnFGSm14?=
 =?utf-8?B?dDdMaWYzYkY0Q1pNcnE2M2lyN2xUcU5lUkgvVFo0NmtQVWxYWENib1J0S2Jh?=
 =?utf-8?B?QmhEYm1MOFhiWk1SQ3dXMERLMG84MzRsVUx0aXRJNlZkZHlCbDJQVHhobDdB?=
 =?utf-8?B?OVFTNVhvTjZnNmJSV1VrL3BYZklYSDIvdGZLUTJzNDRFTFF2WktwSXBpQXps?=
 =?utf-8?B?cWxaZE1uTUl1RW5FcU5JaGd4VVk4clArSHpUeU41QVdZeWVKTEZPYlpaRWdn?=
 =?utf-8?B?SU9iMTRybytXNXlNYVo0Q0VMcERtaGdVbkpybHVvQ01qVFhYWStTM1pwdW5D?=
 =?utf-8?B?UFZDQzhwVVE3UHdMNCtVQXFaNEJ1Z09CdkFJS3VvcksyOWU4NU13bWRlU0J6?=
 =?utf-8?B?djFRZWE0VFNaY0pNcGFES2JSZHlmOXNrdEp4cXdMNUZZUHUycGd2aHVqaXNE?=
 =?utf-8?B?UGNaRVhJdm5CMUErblcvb21taS92TmY0QlNuV1hYaHUvZVR2TXEyMVJhRGw3?=
 =?utf-8?B?Kzl6T0FHeHp1dC9TUWNHMVJtcXJ0K2tvSWRvY3owb21raUxNbjNTaHQybWpV?=
 =?utf-8?B?N25DRmtXSnhocWh2TVJ5YjNaaDFXc1lzRzRXaHpPdHFRNVpUR2ZRRGxuS2NU?=
 =?utf-8?B?R0EwYWVNMEJOYzZjYUVzZmhhL0lacWhYbHJMZ2ZhSW1BVWttRm4xQWxOUzRs?=
 =?utf-8?B?WjlocG9Cb3NweGlRaXVMeGtKZjJyV1grZTJrcVRkeWpNd1JDZ00ydzVBQWdS?=
 =?utf-8?B?MDVaMGU4eE5WL1lNQXdISGVzcDBPcWU5ZTVnK2JMV1hta1VvV1BPWlRTUDI3?=
 =?utf-8?B?THJCWkVGRlVvY1c4L3AwVCthQUhiTU9QcTdPWGJidFd6anh4NWZGdXlLdE9V?=
 =?utf-8?B?RVJjWVVoVjFjbjcwWXlCd0JXRE1nanQyUkZFbmp4cjVYM3lDWEpoS0FFTEhS?=
 =?utf-8?B?akhWUHc5VmEzKzBUR0lmY2tuN1VzbThiOHpXbFhPRXNGRnVaSzROb2RHRlFP?=
 =?utf-8?Q?z/f8sR11Vr9FE8XKjdZjsonmy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8453dc-8669-4d73-bf3a-08dbe11721eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 11:29:27.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I17hVAelygF+zyty7cEjCiUnA9YIzczUU0ufJ7I+OTQ3ixLONZpfCz9ScXZXaYM1C6BLmtjV6O1MRwbkHNpWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9276

On 08.11.2023 15:37, Andrew Cooper wrote:
> These 3 Kconfig docs were imported from Linux erroneously.  They are
> GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a way to
> be included by the blanket statement saying that all RST files are CC-BY-4.0.
> 
> We should not be carrying a shadow copy of these docs.  They aren't even wired
> into our Sphinx docs, and anyone wanting to refer to Kconfig docs is going to
> look at the Linux docs anyway.  These, and more docs can be found at:
> 
>   https://www.kernel.org/doc/html/latest/kbuild/
> 
> which also have corrections vs the snapshot we took.

Imo this reference ...

> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> ---
>  docs/misc/kconfig-language.rst       | 701 ---------------------------
>  docs/misc/kconfig-macro-language.rst | 247 ----------
>  docs/misc/kconfig.rst                | 304 ------------
>  3 files changed, 1252 deletions(-)
>  delete mode 100644 docs/misc/kconfig-language.rst
>  delete mode 100644 docs/misc/kconfig-macro-language.rst
>  delete mode 100644 docs/misc/kconfig.rst

... wants putting into, say, the last of these three files you delete, as
a replacement. I can't spot any other place where we would have such a
reference.

One problem I see with deleting our shadow copy is that by referring to
Linux'es doc, the wrong impression may arise that whatever new features
they invent we also support. Thoughts? (If nothing else, I'd expect this
aspect to be mentioned / justified in the description.)

Jan

