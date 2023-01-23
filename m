Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FFA677E18
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482929.748736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxrW-0000po-Fv; Mon, 23 Jan 2023 14:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482929.748736; Mon, 23 Jan 2023 14:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxrW-0000o5-D4; Mon, 23 Jan 2023 14:31:54 +0000
Received: by outflank-mailman (input) for mailman id 482929;
 Mon, 23 Jan 2023 14:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxrU-0000nx-DY
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:31:52 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac4006b7-9b2a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:31:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:31:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:31:47 +0000
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
X-Inumbo-ID: ac4006b7-9b2a-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfZWGWLbdCUbNUgE7ZKomIDO+qqb/Rc00xYFyZ+FzMtQ32HlelosJajmB6e7wIUOrwBYEcq3ySFGne9EdKyng0ejgig5apFW/sO8pn53QmbNUcFTMuoOktfSusDRsfDzjKdyG/ZuiKU5flLg52/SrHF+RC8XD+GHGo+yWbxrGpNf9oSmDiE9Mjz7jnxZ+VBO5N2cr6wXhTR2fsoabFN2kz672DIigy7TfbE4LUbiKq2ct1R9fL+qQfx99zNDKDXit+UdKr1W1PVFpLrnr4CtiRL61AEDLR3P7gHMWSSzDi0/EoBWBXvwhrbUgz4s5I9znFmImGBeZx0tGDxaq/YrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgORcjBjEs4wfTCx6OQAaXyz7uoAGriVI8R68Ni1WsM=;
 b=WaSjOd2uxY2+QZxgfUBBZrbQnZ8JvqMXRE7YWgFu1f7LFbBFDeykSv3wKTGeKksmKFuhw0PpERO2QZBd82FEim/rB/lTyC85fpb5qqS4zuORnrWLU02pdLYiCfQG/0EVgFeUYObtWaKQqPkeSiP2tDXjQ5RrpHsAWA+yHCv2KlMpDtVb685dI3yJbcM1qzVpjwtqu/i/kYrPmNyvfj0AnNQ4yUp3ACmPu9O/CZUDgWdUQPMgMH3eUeZp751IQFTZW7MSwm3lxSyzjNPMV2IJAOiiizO1p1d59S4Nnr27vCpItNgnpzB1UzqMHMYX2taY1GmUWFX3jaieTRi3Duj8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgORcjBjEs4wfTCx6OQAaXyz7uoAGriVI8R68Ni1WsM=;
 b=ZrI4qe+SvxQp6p14crBuzoQrSeNTKaMQhojJGBBtUYcnCQCrJz5zu3B2W1FFk1TIRrpojiqKTHjiipe9D1TFj0hDjXpkiV+xgVilIz/qr57bxowmXhTkHTGPwpjUgPQVaEOSsFWndgRxzwdWWzH5KDkErvav+qDj7qijszM2ff2+45roUcN6nCw0MuY1EaLTruAYsbiR/6IRqKfAPQK6Bu8C1SLyx8Ez3xF2s5Ibb5eGQ8KI6FXUAUjLR94Z50UHhCS4AaRZJ+SkyxWrYvRNKXq3hK6AwDdK0Qkerc1SZoESpjh2dUEvyg4ZzlBXD1JuhqLTyK736Q2cQXdVvkE2JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e928fe9-1aec-f93f-b82b-4ecce9f49265@suse.com>
Date: Mon, 23 Jan 2023 15:31:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 04/14] xen/riscv: add <asm/csr.h> header
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
 <08ac78fd-85d4-2a43-1922-3128d5fd8d21@suse.com>
 <b6ef89747db4f8ce48dd66e7db8565a6d25f96b2.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b6ef89747db4f8ce48dd66e7db8565a6d25f96b2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c42148-14d6-4e57-c916-08dafd4e8f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sZttMoe1U4ZZE1hysdBnOK9xdINcmQmBIeS9aHbEhzweQyU6CHN1ddmby6puVwBA4a6KP6G7TcehFTyzi1IQzobkeS1OkPBYNrBFAevqxA3rOe8Zh484D/V3JjvWiW+ajEmJ30kzQpx0aoVhOd6M3+hydOca/uq3mJ7pQQhMDc/Y98818SYERSrK71tXyJKeLaL+GJTHFDzroYBjlczNIkLyl5MnfNoeYcAI/14ENmjo0l9BA/qSuFr89jME08D9f+FmSdXVFhzCRD0NNqD2edjk1/0YfcCS0gc3+xoShGsRLzZhvWkZlSJD26fpHV4ixAA7VEkWCPovoJwvGxdIQ+jM+O6ojmNxM7ufKP0aRETun9TkYIZ/qeqs2TwtKPPIQyhW7YrAd+Mdj3kTdh11f8wt5ZsajghdbbNmGMOxiGPAafrZ0GpOTn22xW3Conn7cEg4HqxDkGQv0M5AAHNCLyK2RuvVxKnFBezfzPz6O9SCFzLkYInWLCPT6oP2HfwUzINdw2eGZNlFOksLssED4hC/g0Jdi3w+eG9m73gaoAdVWtpxBMCSPP7J0AGSIvyrcgem0/8kNkhuhTFd0QFdcfPqlfzyzO4NHHWPXt1geOiVGxTQeQJw6dVsnMhnHK0bC78H8iWqEgbrVAF26sDFxbTQBDfcUkFHW8l47cCVnLD0P3pa/IyFrBrUs0KdeUEkepYoUFT1a5DAq905wU+PZ405k6QQPjVk/ooKqlMqpMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(38100700002)(36756003)(31696002)(86362001)(478600001)(316002)(54906003)(6486002)(8676002)(66946007)(66556008)(6916009)(4326008)(66476007)(2616005)(31686004)(2906002)(6506007)(53546011)(8936002)(186003)(26005)(41300700001)(83380400001)(6512007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzlveHpjeVY2eVM0Ky9PTVdocllNcDFZRGF5NGlXbFdOU3JWc1BKSmlPUENH?=
 =?utf-8?B?SzJlZUg3eXNhbUpiYTlETjIyZjU3ZU5rdkRwTU5ZNnhvZ3ZUeGtTazNzdzlh?=
 =?utf-8?B?ZlVEUGtEbDF0U2p5dGcyYWtkZ0xPV00vb3RyOG5ycG1pOHpBVUR2Zms3K0wy?=
 =?utf-8?B?bkltUUZBd0tmUnV0dEJrOXNBUHhtSkpaQXVUd3dpWFQ4MjNMOU14SllPK0ty?=
 =?utf-8?B?UXpsbExPZUtuSG1NUW51SFNURk90cVZyWlQrSENVTjR6UVhYZTJVdG4zNDU3?=
 =?utf-8?B?Wm5JcS8wOVZYVCtFVEtlWlprOXdQSDA2V0dvTE01K3FTOFI2UXB2MzhVa2NW?=
 =?utf-8?B?Yyt4ZVkrYXM0enh0VnEybnZBbTVjTWgwY3pJNVVVOWwrNFdMcmVFWER5dWRB?=
 =?utf-8?B?eE81SUFURjJxYVhrTkFLMmpVZ3doRVU0Z2sxKzU4dk1IdzFCQm8yR1gyczlq?=
 =?utf-8?B?VjZVQ2xsS2I3eXM4UjJrZGhaazRLYXdxOE81VjU4cDh4ajlUQzBGbmdLNUZV?=
 =?utf-8?B?SkduaDNibEhZVkJIYVp5SUZocDVnakxQemxFVUdJWi9rOTJaMWRRd3hjbENl?=
 =?utf-8?B?UkJPYkh4L3FqTSt0ekFSWlVOVXk4bnRVV2QyK1Bxb1g1RDZDRERYV3hYTEcx?=
 =?utf-8?B?Wnc2MjV3K2oxazVYZnNSdDBGQk0yV3NpdGZoNGhYM1NHYlZjSTZhQW1qcUZu?=
 =?utf-8?B?VmcwNFZaTnpaWTVoM2ZuQ1M1d3pNZHZ2VmlaeEhuOEJPMGlkNFJXRmpCSXla?=
 =?utf-8?B?aUQ5a0FZK3UraDNlSzljVWFZd3NQbHpKdW1ualhrb3IwR3c4SjNsRU1lbWpI?=
 =?utf-8?B?TG1KTENIV0trb2E1RDlDV3N3Q3BPWG9lZy9QTnZmc2pOMWZaenpwelVGV3dU?=
 =?utf-8?B?NTAvNzdaV2lFM2VtT2ZKaHBaNmJuY2xHZXJzNUlUNWJrOTZuK0g5Y2xoY2p0?=
 =?utf-8?B?bVZka2ttZzQ5V3RxVlVYRzJRaTdEZzRRR1JuQ0VldlFYcVc1QjQzbHc5WWJo?=
 =?utf-8?B?TWIrN3JBN01VUHA3ek15K3BrR2xhU2xIeEVkMnVVSGduVmVQT3Rxa1gwU01j?=
 =?utf-8?B?SlEwUy9zWVJQeTBaZE8zbXFxYzBrSktqV0pEWnczalRha2tZWWs0YmVNb2Mw?=
 =?utf-8?B?S0M5RHVlODIxbVVVblBmVGZZeUhDUllQUGJMZ3pTcVBPYUVqVlptN3FMa2x3?=
 =?utf-8?B?NDJkS2pvVDVDRzFvQzBkUVVpcURoNXl0bzhYbFM4Y1FGTlNqZ3V3TmFER2d4?=
 =?utf-8?B?QjZYbDhkb1hrbTR0RWxUekJwS1Z0MUpnME9ub0RQQml3UEJEam1wamR1SHZl?=
 =?utf-8?B?SDlFQUhqa0syd1RjWnNKUnZoTVpvcXBvSUZoZFBpRE9LaFJ0MEJTek1IRGdu?=
 =?utf-8?B?Z1M5aXNIVWltUzd3b0FQK1RyMC9pcjB3T2JMTDVXMVYxMW9oZW1ibUk4eDFV?=
 =?utf-8?B?YWZBaWFYamVyRjZwbzFWOXNnU0MyM3FOT2xZQUpXLzVtK1JFV1FFZDZtd1BO?=
 =?utf-8?B?bC9jNHlLZVQrdHEvdFBvTStxOTZ4WnlaNmQzN2ZBTnZManpIY2NwYzJDOHlk?=
 =?utf-8?B?OVpnNk5BOU5GYXFFUGFXWTRzNnAxTWJPbFZ2Y0NGM3V3ODgxcng3VkZJOFR0?=
 =?utf-8?B?aXZxdi81Z1ZOMTNkUFA3enlYUFpZV0JPajB0WmZnSC9VcXZQc08raHBaQVc2?=
 =?utf-8?B?MDQwNmdhVVptNUh3dFFvWDQ2L3pKZzlRYk15Y1BMbGg2NVlCQVRXdytCTmoy?=
 =?utf-8?B?dllNVWNXVzZuQTVqUnFQTjNEQUNPUFJUcTZuajFNVkJTWVc4dVdIME0yMmk2?=
 =?utf-8?B?Uk5vUVRMRlhab0dUdFhueUpuK1RZMURTZFN5T3ZkMTZmdWljSExvY0QwSUt1?=
 =?utf-8?B?Z3pzTlRtd3VkUmNJSlJUWEZlbGMwVGJONHBwVTk5NnltRDJwSHNaY2lsOGFv?=
 =?utf-8?B?eHVweFRTbjNNTU50czVKWGNtYmp2UWJaRmNJR2pDVUg3YjN4T0dFSjRzd21C?=
 =?utf-8?B?cEdrRjhXQjN6aHpleUZPNEwxb3hDZlNzNllreTRpV0I4OG5vbFg4amUvZTIw?=
 =?utf-8?B?ZFZtWm0wTTNNMU1uK1ExQW9sZHJhWnhWUjQxZXVzY0RBUkQ3VzlRdWhLMllv?=
 =?utf-8?Q?ZOgMjffG3NtE0yMMrHR4o1fGh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c42148-14d6-4e57-c916-08dafd4e8f2b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:31:47.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ileA3Du18K9b9e36ooco201Ctzs73/lg6lYjFfRMCIYrzjWo+80ssit4s1o9bQdXg5hFA0EMyHxbuzsHoGEMAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100

On 23.01.2023 15:23, Oleksii wrote:
> On Mon, 2023-01-23 at 14:57 +0100, Jan Beulich wrote:
>> On 20.01.2023 15:59, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>> @@ -0,0 +1,82 @@
>>> +/*
>>> + * Take from Linux.
>>
>> This again means you want an Origin: tag. Whether the comment itself
>> is
>> useful depends on how much customization you expect there to be down
>> the road. But wait - the header here is quite dissimilar from
>> Linux'es,
>> so the description wants to go into further detail. That would then
>> want
>> to include why 5 of the 7 functions are actually commented out at
>> this
>> point.
>>
> I forgot two remove them. They were commented as they aren't used now.
> But probably there is a sense to add them from the start.
> 
> I am curious if "Take from Linux" is needed at all?

I said, I was wondering too. The fewer you take from Linux (and the more
you add on top), the less useful such a comment is going to be.

> Should it be described what was removed from the original header [1] ?

In the description, yes (or, if it's very little, simply say that much
more is present there). Doing so in the leading comment in the header
is risking to go stale very quickly.

Jan

