Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E16C4C28
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513456.794470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peynL-0008UV-5F; Wed, 22 Mar 2023 13:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513456.794470; Wed, 22 Mar 2023 13:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peynL-0008Ro-2N; Wed, 22 Mar 2023 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 513456;
 Wed, 22 Mar 2023 13:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peynJ-0008Ri-Bc
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:46:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eebe33c7-c8b7-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 14:46:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:46:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:46:20 +0000
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
X-Inumbo-ID: eebe33c7-c8b7-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC2rjLwGJL2y/veXSBJntVfpyatr1kelRzBC3VXJxeYVmKLc6ozelJkiliGXWlh7Cj1uzuwhzHXbq5BfpxLbViEDGandaK9s9vYNdAcvYWJp5/+Q+cpbnMp4jRFO5xQQ3XTPIURsUaz/Rp4IbwPgijq8h0RSNBuCv5eFWL//ZkCzaHtwaNfhlDMN1LgqPEXjfGxEXqd57Z7wqh9Cks4UXaHDGZ01t7mjkNqWNeTSvECWWwMpz5NeYwzY33ENPkosaEtPfvAUBxFXp7EJxVI90lqNw3MpbB/JNkwKdlW22YXKUqsgSycZClh01KdH1bzN10ge8xN2BfR/ptrQ9U9tVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+nfGpvmEs9pf/rc4mTbuoXpQh49a15/WtCPHhJqB2g=;
 b=NpC5xjmSzD6Mn5sQxtmhoiou2blZRFwnQhq2HK5OfwFODFa3gBqE30PGmQCtdi1cANoSGn7S48jkq9m/4N0R4y3fAfIPyo35Sciyfa+q9p4N7mXrDQEDnWRvgo1TapQ4P5AzkQ378ew3/omoPXocNoHQQioggoQBBu97Uc6GQYk/ymKxHUp5C9whgyiSVMSKpx3JXx13JZ39an34vN/PfTXvYZ3PYSWiyQCS0/S0oNM9pLkUebiDtHcS6ChFNUVotHwHylANMy1Oe4p2/6G9OgMEDJeS+V9rRRxVRM4LQwKp2+5EG/RakX0SEqpkzuLH3vwYXc+1vWiwU43376mytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+nfGpvmEs9pf/rc4mTbuoXpQh49a15/WtCPHhJqB2g=;
 b=u+teRx6M/dh0qq8sOJhOYvBEgK9XhAwV7o4hu9yvIeARQ6e2Dk58G6xDg5sxXSBeoHBHoaH/X+j5p4CPpKhkLQazMotGXWN7dHolSy4SUSOhmOcxgjn6Ui8D9b0KfFYlvHhQO66gSzQQrFDgKQ/11TGNwoOU9R6ZiAnfePa9yN9R60J93qAyR0UTfJRJuSi6ebIHHps+C4wLdiAbMA6idwivMsG9SJ4LHczf8C4sIO8w9Ujc2wEyWcki7EHZdw5W3MOlFPGJbxlsehoDHEIT1IjZHaVv/mBkW/I8aWLtdPLLxWFCjQ8QBijYLyJmjUSTqnAYiEtHlcgMvmXHv+HIfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <486cf6f9-4e28-17b5-3ab3-31272955926b@suse.com>
Date: Wed, 22 Mar 2023 14:46:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
 <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
 <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
 <771418cf-9515-cc93-14c7-4bea60c30b2b@suse.com>
 <98a891792446e72d910ee49a62c7e3b3d2d6c186.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <98a891792446e72d910ee49a62c7e3b3d2d6c186.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf1f2a1-39c0-41e7-e16e-08db2adbd193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B6I9RTwUUER8n45NeRLNDjpQi91ElmQM547hgwfWNZ7uJzfFYla1ovTpDvJ0cCZZOZy0ChY0af6X3Ookb3oEFnqFIYzw01e6lmhx1Y+p3FrzvCQduKfQYp7W6hhL5htozJLpM8P8egniqqjlxclxtttbmWCiAf7068QtOA3ecmJjs1kSzIGH/0nctDJG+O6r2wA8G6HEB3OIYBxtU33zozzd8jjUt6+VLB8jScoLtXQ6SihLlnVOPbb6VEoQLadp7ALOiIOS6WQw8zWI39ceXOLeW0DQ6cn+Bc2fuaFZCXfWomFbzpI/VhLsjFuvTkdR6ZTm6s8iReSYsHcVIxx06d9LsNYVykusq203HlkmkJ/0lKHNdsVzcFVUOz1hJIdoZ88HIHa4tGzh/s4wCysuhThxodkLhrzdGgJKAYPPs0JhHC/DYmL8QCU0RWWKq6AxO7sAmwGpRPK27JKBYrUeNd+IRBr0hMrHxxB/BvqfQwCqRZIZTOwPc/jAP7K0dFaEZHJKHJ8Bha/BXUoXbKmvqvkdoyqPsZS5wxlTHw2YUDfCuKNUrT1y9fPigkLOfQERTYwddMC3PNrwmL87j3qgl4Pz13doyZxwS+dDa4z3XeoYT4nJQq075Wo4pSl3Eke1T8LYbekxQlMQx5o/SGeYEF0UO1g0Q2gcyZ8SJDe8KZ6cjDihSxa+Yo4m9/kvLmNhck6AM9XRoTtX502Q3xlO34L6Sbk0zvxyfF83fEuE9Po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(31686004)(478600001)(316002)(66556008)(8676002)(6916009)(66476007)(54906003)(5660300002)(8936002)(41300700001)(86362001)(31696002)(2906002)(26005)(36756003)(186003)(66946007)(6486002)(6506007)(2616005)(53546011)(4326008)(6512007)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejIyNUdMZWV0K1FaalJXTjhHdVBlYVRKdTZYcm9ZdmttUlo1d0NnRFlXcnRr?=
 =?utf-8?B?V3IyQlp5SUdXVlRjN3VNaWNlbjVlSHM5WDE3ZDZWUEFBUzFmczNiL0Qybjlw?=
 =?utf-8?B?eTI0aFJhM2lVaWJKclB1NkIyMGtJNzJ2S0V6R0pKR1lZNENOL0IzdzQwdG5Z?=
 =?utf-8?B?ODBiODNReWhMTkJZSjczdTlOcUEzYmJkcUhWVEJnejVtOFg2OFhjeFNoYTBO?=
 =?utf-8?B?MjRKaSthb2RScWxWSXlEUHRLOHN1Q3lBQ3BxTERiY3Q0WmdYWHBQRmlPWnlQ?=
 =?utf-8?B?YjBZQW05N205eEdWcTlZVktpWFJMbUdSNHErMlE5NXRJd1VSaE9rREFzMDg0?=
 =?utf-8?B?YzJpanB2WDQ5WmVVUTI3dkdDZ0M0TGpSVkdzY3oxZTNrZHplaHIwcStiZnBQ?=
 =?utf-8?B?SllOenBWdXk5cXBlQkd5NXlYYnBOS2NJMmZFakp4M2ZsaXZsdDFRS3dVSlgw?=
 =?utf-8?B?RTduUlp4NnJXc2lDMlFpckRWWlF2NEN0YVBYZlVxZEFkSUtFSTlEL1l6bmZi?=
 =?utf-8?B?OXRYSzFkSGpqUkluMkwwcVk4dzdLU1cwVVpDSHNGUlpnNmNXSlU2Q2NPd1NI?=
 =?utf-8?B?UEN4RXhNa2YyOU8zdHlsZGxDYmNGWmpwWE1FaVppNnlzSHc3bHZhZDRIWDUr?=
 =?utf-8?B?R1RoVjYzdk5UV3IvNGJ0Mll4b09xaEQ1cGRCd0gzc0VHUC92dnJsZXFUVjBw?=
 =?utf-8?B?eTVkMnZVY2tDMmJVUUR0dmF0WjNreFYxcUt1WkN0aCtPak92NXJ6aEw3THl3?=
 =?utf-8?B?YUlCMTJTU05iakttNUlaYTBqL1FneG01U3oveUFvVnBxK2d4R24rbFUydkE0?=
 =?utf-8?B?bkZicFNGamM4RzlaZERjb2hNYUxGcnZhWmxXOW1hRmlaM3Z6WE5Ea0lYakh2?=
 =?utf-8?B?SEpJYkpMQUpmZ3BEV3g2ZU1vRG5WeHYvb2psbkdlMjVwRUJNVFNqK01QY29O?=
 =?utf-8?B?SW40OXB2ZFlEUmp5TWZTdDBnckxrZXZLdzhiVDNjM1BsQnREU3AvK0liNHV3?=
 =?utf-8?B?TFBMdWFPdjRSbFF0ZVRCamxaVnZjdlIrQ2YxdFFrVXBHZEhnZTJJd2xuZ1l6?=
 =?utf-8?B?OERBWVZIYzRuanRHSWFkZDh5dkwwMnNhczUxK04zNUcvdFUyUkpLVUtrNHdp?=
 =?utf-8?B?TzFFc2h4KzdtK3k5UWt3cVVuY21mTFh1Yldoa1pKQ0R2SjhzZWlEMlpuVW13?=
 =?utf-8?B?U2xJUmpxUURXbTVIVEdoMkRWakNJYUZpdTRlWmQ0UDBhZ01rUWsvZ28rYmdO?=
 =?utf-8?B?ZDRGSXg5bFQveWpJdjFmWHYxQWJtZ2ZubkRpay9DbVBobys4WTF1cTdzM284?=
 =?utf-8?B?Q3RpOW1QT29IYzBPa0lTdFZxMkNUYU1hcmJsenpONDFIOVViMlpoYk1wRHR5?=
 =?utf-8?B?cG8vT3dSN0ZLck05VDh3aUNORmc4SjdiREpzOXpMQnpnRVpCUzdzdmNyYlo5?=
 =?utf-8?B?eGhReER5czVvSzA2WnlNWEthQlRlRm40dHZvTVVUa1dzVnVjNk95ZEtZM3VL?=
 =?utf-8?B?d2dRaGU3MnNMNlpMaFYxK09pR3RadGV4bnEveXRYVTBYVVV1UkFkeUh2VzUx?=
 =?utf-8?B?Qm9TU2UxT1JHdkNjR1pqTk45dDdnT3d4S29yTGRQUElxSkFnY0p4bDJjNW9Y?=
 =?utf-8?B?dGRxb3RjeE5HQWlGUG41MmhPQzUvMWJwbWVPRHBQSHZVYVplaXRlMXJob0hR?=
 =?utf-8?B?Uk1wK2pMeXRXYnRsNjNZMjVERnM1MkJsQi9nWG5PVHhOeGFjdnVhc0E3eG9X?=
 =?utf-8?B?ZUx4SkJ0d0l1a1lhOHd2cHh6S1lPK3ZNOGJMM2ovWkJHd2o1Q1B4QnMremh3?=
 =?utf-8?B?NVR6MnA1Q3A4M0pKdHdlczdtaUJDeUgvdUVIeVNrZmJmTDB3SW1tcDlpMUdY?=
 =?utf-8?B?VDUwalpLZkFDaEhPeCtwNHZSYmswRUJJNU5QNWdDUndIVDVwTHVORTdNcVZr?=
 =?utf-8?B?UTNVemFoRUF0Szh4QXJiZ1p2OWd6QWZyVExrNFhhVzhnSnJRaWpKTjVuOS83?=
 =?utf-8?B?OFA4WnpZZ053a1ZaRzBoVzg2blJheFNaNExlVFZ2RUQvL2VyK0YycG5rUVQr?=
 =?utf-8?B?eE9CVy9RdWJkMWk2aG5KSzFtVnJTUEdQSFNTRVBub09ESUwvRHVFMUVraDN0?=
 =?utf-8?Q?UVP4wkNGsX7yKRtpoNTAEfYTe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf1f2a1-39c0-41e7-e16e-08db2adbd193
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:46:20.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4ST1b61sD3E4uI40A7HbINCSCyovzS3dW4zWwOSXKp6zfpxDNDEIbK3YXT+sKQ4vhDCkAzQGfcNNZMzBf0+1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523

On 22.03.2023 14:32, Oleksii wrote:
> On Wed, 2023-03-22 at 13:26 +0100, Jan Beulich wrote:
>> But as said before - I'm unconvinced this approach will scale,
>> because
>> you'll need to apply the wrapper to anything which can be reached
>> prior
>> to you enabling the MMU. Whether you can contain this to RISC-V-only
>> code is unclear; I don't think it'll be acceptable to change any part
>> of common code to meet your special needs.
> But it looks like it is only two places where it should be done:
> 1. As you mentioned LINK_TO_LOAD() should be applied for trap_causes.
> 2. And it should be applied inside do_bug_frame() for getting an
> start/end address of bug_frame. I want to note that do_bug_frame() will
> be removed after RISC-V is ready to switch to generic bug
> implementation.
> 
> The next step after the current patch series is merged is to enable
> MMU, so it shouldn't be new use cases where it is needed to use
> LINK_TO_LOAD().

I'm not convinced. You can't stick to using earlyprintk only beyond
very short term. Yet I expect you also don't want to use

    if ( early )
        earlyprintk();
    else
        printk();

everywhere in exception handling code (and anywhere else in code
which is reachable before the MMU is turned on). This extends to
uses of BUG() and alike in such early code, which - when they
trigger - want to use printk() (only). Whether printk(), somehow,
involves an array access similar to the ones you're presently
aware of you simply shouldn't depend on (it's an implementation
detail in a separate subsystem).

> If it is not acceptable to change any part of common code ( as I
> understand in this case it is do_unexpected_trap() and all that is
> called inside it ) have I to introduce two types of function
> do_unexpected_trap() for when MMU is enabled and not?

By "common code" I mean code outside of arch/riscv/. And I
sincerely hope you / we can get away without duplicated functions.

Jan

