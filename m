Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CED4C4748
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279131.476693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbQU-00063r-Jm; Fri, 25 Feb 2022 14:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279131.476693; Fri, 25 Feb 2022 14:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbQU-000612-Fe; Fri, 25 Feb 2022 14:18:30 +0000
Received: by outflank-mailman (input) for mailman id 279131;
 Fri, 25 Feb 2022 14:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNbQT-00060w-7F
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:18:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc962dd3-9645-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 15:18:27 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-kaqRjf8aN_m5-Q99pTwMZg-1; Fri, 25 Feb 2022 15:18:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB3106.eurprd04.prod.outlook.com (2603:10a6:206:7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 14:18:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 14:18:25 +0000
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
X-Inumbo-ID: cc962dd3-9645-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645798707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBtE1pAC4/ZFQqbHod0OFuE8vkASdxzck1Sh6w8nfMk=;
	b=jSqB6kQMW81ejLmNL16OQXpU9G61gw837EjFNcwfgorBN+4V+wdzkNz3EjCJ8iWjdTkpjg
	17kezjneRLxJ+iHtPm56uKoamu+tIKMWd2uRUk74f/Wiv4Y55alJJsL0rmxsi5C+q+/FmW
	Wk15d+uk5pnHevKq2DqXKfdNYjYm1cQ=
X-MC-Unique: kaqRjf8aN_m5-Q99pTwMZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PniVy1w4kuMyncQc1qBl4RS58v3tWrpZ6BfxnLQRWciVGy9ENmb9TigdSjRjAKJZH1YTmlXkj3A8gG/FxkxnyhaUfa98s26xeBh1+sxefTuMS2ySpUQSTpXQkxaLBkYAbPME8USAW9MLeUT3nntzbVFfWGnvo90PUn3nDyTEt9nkUwWhjvEbcX3x0KYLSXt1qgThMkLDGkrESagIeHDbtVwK3K42dI8c+5TQl/V4wUWOr2E4YdGJv5SAEbk4EpZqvB882zKkevnxUXFJi2WNPSg9m64/ap9CLfs6eb1NQAwQLufXjhTkgNkX+xvHKO+MrpIfmmh9c4BackdvSbZ1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfJFsvFnIwGC4dJEX2zbYAMwN2OPOR+mLARDA0M3EKQ=;
 b=fk+SOuNax25D7QBZIbAy9FhnW63RwNlQSRBNwi/T2skyxulGUzdrVh6H8gQBpktv20iYtLHz4G7ugY0pxxwYWb8PZn+OiQu8tmAlEXzUrPr7BvPOGlpV3mb1X6rSVHy2xb8aWawgVo5ViZsQro04b1UeiVBrVjcJB71ejsw7yEMeiKWDj3WECsXxnWltxMrFh6s5I2BlQt6SEeR25QTSD8zory+CgV/spbIcL8F+Qnm7yxHfUA2O90Ca/oI+FJJAgh1KhfA9pgtpmu+/1sazMt+q+4fyr1Cdh+EPvGfqxWXn7u/yPIB1m+ABttIACxehTgukD3556iKZ9McEPRwMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b8ce52a-559f-dabc-717d-98b8acf5afc3@suse.com>
Date: Fri, 25 Feb 2022 15:18:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Thiner Logoer <logoerthiner1@163.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com> <Yhje4LFNt+RQJ5E0@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yhje4LFNt+RQJ5E0@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c115ab7-08c9-4108-a579-08d9f869af9e
X-MS-TrafficTypeDiagnostic: AM5PR04MB3106:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB310679EB36F7D5D647FE7606B33E9@AM5PR04MB3106.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IRI9+nmILhFgJj/HYA2dDbl8q/M2/1xd7PyItK95nADYLmT1KVMSGZ0kakOG928zxZM30OjjdfGE/ToMT6pX2P2SwAnMTITfxMlO/tHUj339fetfNaRfjrPvrw6OtAAkyyBNRpouC83Z57kY3r/r83q/Tiy+92OWth1lUV41jseRZ7n7d9KPOvK6bWBTe/BlLFjzcVprIW/UWYJP4CVP+Mbd6nMi11OfHs7Dcjps429EWQWROwDz4pVXIYgu/K2GT3q3rqwG4TjXdffzZplfWJFoXc8VeFvIUKC/jK8Grnfhs37mAm8NhfZ57KtoT2tvOJwJr6b8WZgCOulc92QX+J1549bQDgJFHioomwSc4o/nVpPKjZwp2hvffTLBji6gt6UjwTYww+D3GdmvSi4/2zfsJBKSNSEX/Pg7rh3tjleQqACDxiPcmBxO3NwBY8C+Z3g05Y+hQqi7JIciQlYGu18LDthV3a8xe8OAQxm4UCe/43AmKYCXPKi+1ZOhP+xdxglsR8F4CA+oAIV96SQkNGqkXfLp9AzKQEo7DCQoI3eYU6arFM+MjIKCSjDKDXzObM8+RjQNbWWJuME2j1E/My43oQ3KEoGqzYZcif8sllm8Cq3Ky34jNg4n6urJ8jGyOuNGubMy9EVLzYPb/6/PWh3efamF/KqnAZgdsZd3+sPxJ8DFPVpPmemSXyLcGMaB0Aq/uq4SnfzSGWMGmbNxXc6O9j1D5vDuChHbJx8ZCTtVzHXIopbIpsnEL5W5oluy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(508600001)(36756003)(53546011)(6512007)(6506007)(316002)(31696002)(6916009)(6486002)(54906003)(66574015)(8676002)(66946007)(83380400001)(4326008)(66476007)(66556008)(5660300002)(8936002)(86362001)(31686004)(186003)(2616005)(26005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jpq+0EIWQq8yDiPmEVqWZn8KhrVgWvCgSePqar7IittQe/mgTJ0jkIv4B3bX?=
 =?us-ascii?Q?qmkfljy0O9tRlqQ4v3qjsoEtm6t/sNng89SzTAnu1Yo8r51fzYYwHa7A6qhM?=
 =?us-ascii?Q?2BgwLdgBqTXxjAPFKNjq3eYFjEfo1RHUIL2IgnfGb0RLDn0AXwq54ceqicVb?=
 =?us-ascii?Q?ipayenPrZreccXzLjFKVGnrFnr+U0D8Jh+xLZ7y2KmRGZw0gyXEFb6oDVd3f?=
 =?us-ascii?Q?TSpDaMEhwFCN3GEs5bvl49t6ZJYtv8htRjKxP5B6/CLC3m/sVrcpKEPTb8zB?=
 =?us-ascii?Q?tzwEpTtkStUfA2285cd3HtZYDPbThWhq2dOFxljXz+MkU/UPfXesuZS/NRDj?=
 =?us-ascii?Q?6a/bjKRYiTxU8yu6v8Euvp2Qokm1karOheMQsvBwPqjuWknOG+VEtdJkfF+P?=
 =?us-ascii?Q?kgyt0Ud/2bgEgRj5TsLECi/UjoUYpIx08uqtQi4zIw5QGJulRYziQfFG9hBx?=
 =?us-ascii?Q?bNSHv2JeKpJ51RjgKaNz4eURZumU0al/PzLRChXbGnX/GZRETkv9tV4ZNO1I?=
 =?us-ascii?Q?uGHR/OmApuKGik9YjPkUjbJK9r+pctRJOtAGb0cuN3hcEuHHu/P8oLeY7a2/?=
 =?us-ascii?Q?RbrZI4Wv7vXGi4C4rRHXGIuwhwYMnqJXhAQCQOl7trntl8l8kg1fLFF44+RB?=
 =?us-ascii?Q?v4XdxogP0OO6n0uEe9XenO1Jd0QSnZSio+Dg8/DCc8mx9tgnaLUNn7zj/f5x?=
 =?us-ascii?Q?kN7tYDlpste/g/KNrZF5onu2bNymWAM5ZdaMfpehUQ8YVYUa8ZuWE3pi3/9i?=
 =?us-ascii?Q?KWnVrqt1aAu3bmIP7uz8Nsf7veGyn7CEhYatfl4sRh1L/EEMhuo/t2GgG8xD?=
 =?us-ascii?Q?SQXJH0vhmLaMMD9cStKCTtnFV43AuPKL+GGYODG3h+h3rg12z5Ow5qs0SmlD?=
 =?us-ascii?Q?znIVeRjkAufhHnrKwRXZLgIb+eYw114QuZs9BKrAlxzro0dEcwQdFBVOsXIJ?=
 =?us-ascii?Q?MBEbj2Fa/79M5BHs2JNQ0q/RSWlemqrgcDkyhhXVCmL5f3OJfhQIc21Pgh+H?=
 =?us-ascii?Q?cqcXodXK5LJ1EP4oASyCmR0XE6kiOdvtFLxZrBzl/1JwCigK3f+DFUyHF+IV?=
 =?us-ascii?Q?awOLyRqzTy0V0qgLO0012XYyXHRSOP4mO5O0FI0EJ0Y2ftghS4+Zwr/iA/8Y?=
 =?us-ascii?Q?CIxSDblE84L7r5LilHl7r91/gYx6WCOy3kmNcvNOZNcSqXjkSrp+EnlQlkN7?=
 =?us-ascii?Q?W8VC/nAT1Z4zpjrBWkPb1mpHoyI0FbXcql3PpYNBzOWpO+4i628KNfO0G+28?=
 =?us-ascii?Q?g6o5f5Vl6eZrJ9QQhxAzBYww6bVDMlJ3K8zYKigX3KqxKP9KOy0V3xNu07no?=
 =?us-ascii?Q?tLX0pYXwxS41hVqmKFWQqMUXqKwzseB1wxUbgAzC5YOBVVFQOqpdbj+TC36R?=
 =?us-ascii?Q?tOrRAJ7aY4GAntsm0FtTsWUOF5NjdiNd/ulVBpi/CyoBhnt4M/DoV6jNNABQ?=
 =?us-ascii?Q?rlySnZ3LKkFaqsHP+7lgmGnj/kCmGdf2kWMJrTlQ4IcxLjra7f/ZtnL+zLZw?=
 =?us-ascii?Q?qsXVu2wcqnb55noEVgDYhl7MnQcvbAVGt8rJa6tif5BjqajuhGP7haGz/W8+?=
 =?us-ascii?Q?wrYKoixK6RvyJBhBZzbQ2fBF5HnQPXIon/4TIL8gjZXd7qEGh/YfEQr3H1jJ?=
 =?us-ascii?Q?lvPHv2ohOk+mH0ctkQol1j4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c115ab7-08c9-4108-a579-08d9f869af9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 14:18:25.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFq9y+NqsObErUEXAi7nPr3wwFxx2L+3UGtYK6iEopg6tPH2aH0JCP5X20kSvJS45rNckpIjQpJ/SeJ1IHN32A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3106

On 25.02.2022 14:51, Marek Marczykowski-G=C3=B3recki wrote:
> On Fri, Feb 25, 2022 at 02:19:39PM +0100, Jan Beulich wrote:
>> On 25.02.2022 13:28, Andrew Cooper wrote:
>>> On 25/02/2022 08:44, Jan Beulich wrote:
>>>> On 24.02.2022 20:48, Andrew Cooper wrote:
>>>>> In VMX operation, the handling of INIT IPIs is changed.  EXIT_REASON_=
INIT has
>>>>> nothing to do with the guest in question, simply signals that an INIT=
 was
>>>>> received.
>>>>>
>>>>> Ignoring the INIT is probably the wrong thing to do, but is helpful f=
or
>>>>> debugging.  Crashing the domain which happens to be in context is def=
initely
>>>>> wrong.  Print an error message and continue.
>>>>>
>>>>> Discovered as collateral damage from when an AP triple faults on S3 r=
esume on
>>>>> Intel TigerLake platforms.
>>>> I'm afraid I don't follow the scenario, which was (only) outlined in
>>>> patch 1: Why would the BSP receive INIT in this case?
>>>
>>> SHUTDOWN is a signal emitted by a core when it can't continue.=C2=A0 Tr=
iple
>>> fault is one cause, but other sources include a double #MC, etc.
>>>
>>> Some external component, in the PCH I expect, needs to turn this into a
>>> platform reset, because one malfunctioning core can't.=C2=A0 It is why =
a
>>> triple fault on any logical processor brings the whole system down.
>>
>> I'm afraid this doesn't answer my question. Clearly the system didn't
>> shut down. Hence I still don't see why the BSP would see INIT in the
>> first place.
>>
>>>> And it also cannot be that the INIT was received by the vCPU while run=
ning on
>>>> another CPU:
>>>
>>> It's nothing (really) to do with the vCPU.=C2=A0 INIT is a external sig=
nal to
>>> the (real) APIC, just like NMI/etc.
>>>
>>> It is the next VMEntry on a CPU which received INIT that suffers a
>>> VMEntry failure, and the VMEntry failure has nothing to do with the
>>> contents of the VMCS.
>>>
>>> Importantly for Xen however, this isn't applicable for scheduling PV
>>> vCPUs, which is why dom0 wasn't the one that crashed.=C2=A0 This actual=
ly
>>> meant that dom0 was alive an usable, albeit it sharing all vCPUs on a
>>> single CPU.
>>>
>>>
>>> The change in INIT behaviour exists for TXT, where is it critical that
>>> software can clear secrets from RAM before resetting.=C2=A0 I'm not wan=
ting
>>> to get into any of that because it's far more complicated than I have
>>> time to fix.
>>
>> I guess there's something hidden behind what you say here, like INIT
>> only being latched, but this latched state then causing the VM entry
>> failure. Which would mean that really the INIT was a signal for the
>> system to shut down / shutting down. In which case arranging to
>> continue by ignoring the event in VMX looks wrong. Simply crashing
>> the guest would then be wrong as well, of course. We should shut
>> down instead.
>=20
> A shutdown could be an alternative here, with remark that it would make
> debugging such issues significantly harder. Note the INIT is delivered
> to BSP, but the actual reason (in this case) is on some AP. Shutdown
> (crash) in this case would prevent (still functioning) BSP to show you
> the message (unless you have serial console, which is rather rare in
> laptops - which are significant target for Qubes OS).

Well, I didn't necessarily mean shutting down silently. I fully
appreciate the usefulness of getting state dumped out for debugging
of an issue.

>> But I don't think I see the full picture here yet, unless your
>> mentioning of TXT was actually implying that TXT was active at the
>> point of the crash (which I don't think was said anywhere).
>=20
> No, TXT wasn't (intentionally) active. I think Andrew mentioned it as
> explanation why VMX behaves this way: to let the OS do something _if_ TXT
> is active (the check for TXT is the OS responsibility here). But that's
> my guess only...

One part here that I don't understand: How would the OS become
aware of the INIT if it didn't try to enter a VMX guest (i.e. non-
root mode)?

Jan


