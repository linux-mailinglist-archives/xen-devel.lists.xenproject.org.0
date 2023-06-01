Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA51D7194EB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542284.845969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dDL-0005c1-Sn; Thu, 01 Jun 2023 07:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542284.845969; Thu, 01 Jun 2023 07:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dDL-0005Zj-PT; Thu, 01 Jun 2023 07:59:19 +0000
Received: by outflank-mailman (input) for mailman id 542284;
 Thu, 01 Jun 2023 07:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4dDK-0005Zb-Ha
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:59:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34623a6e-0052-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 09:59:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9668.eurprd04.prod.outlook.com (2603:10a6:102:243::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 07:59:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 07:59:11 +0000
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
X-Inumbo-ID: 34623a6e-0052-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvc50qa/kGd9Yn+eALAAtKC7891w8lXp+E7YlpHnyXhcSYH60lSNP+ji5VGaL/f/YN8vpChW2Ip1HDBATxDMGvk2+puVsTObS58bBc63WNuinG6a46DWk7tL4C/7mwhqOiZkU41Filwq2IWnabEyo8XSF3l7XeGuswD/M7kGWT8W3e4rSArHCfs0TyDs+jLUg7lBrCSLe2ceNzQ49UepaUTNZVW3vHzNXv2O8QO7iLltYlWrm+XLdcdWSU6wTawJEPnpAssMSfwzqeXgZGgv8wgSvpdIQw1+LhT6+VD+iSgI7D+eYljpUrtJQNrnasq8JUhmPd0rqdPvbAFgrXILEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MoER1r269wAgXUNhYwrT5v4NEVmiygIQb8BKs0FnO4=;
 b=PQmkSWsYIu6eJz0knMwkTT8Tpfko4s0+fi33w53UydMfrtxAp7Qrwqsmd5e+UZhbHK9UrpE+kt/yi/bEQlwfUhuV/JuJLiz26umG/VS0BByH2f28FviMJChHRvewp6tFOJNXJazzt9vYdWScJzmoJmN2GchKemIq3x8luDceduhEChyHtx9TrabZQd0AcnpXJK7ti5l48hdo/TtxuW16dEM/ZyFwS6uvhtPlGNBghMlXPeuFQHIEcwdFGF9vE7LjEhNeDh3ZaBhjUB8IMMMJMEtSiH4ia1Ti4FXf9ZhJzSwD4R/gtbMjto9/jYU1LhpCbZ+A9mx4ov31SQQ0EYvnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MoER1r269wAgXUNhYwrT5v4NEVmiygIQb8BKs0FnO4=;
 b=JSyeurQIoew+u2JAWE8J8qZDoRwaqDjhpLKEJMgFCqm//9SQBMTZiWVnD5Fuj7Xv8xN1gdTVHrLJQwrAmVTbDvU2tux1uMJMIvdsPisaX+nvmESak2vTqSsXbKThF2C8ly4SRozvWdGnBfK5ncfe6gHkRXVKD8XATOElXn68PKNyxYyi5oEY4gnJsmoba82KhjFGZHee/1lek1VQKjqb7Hfc3xbxq6eJSdJ+7iX8OGGmFXQYCzX3cGUfLy05LxZk5FJaZuaXQHqmcHpmyWdjngC54segfgK+wpRT+dD9e2cMp5LcnmK3V8VRtXynLJcKBbU0y4NaRS0iwmyV7I6A7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eff59de3-d4f6-4f0a-7670-4223ac6f8f3e@suse.com>
Date: Thu, 1 Jun 2023 09:59:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
 <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
 <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
 <4073258b3a3c6a0cb19843f02941d1e62e6f882d.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4073258b3a3c6a0cb19843f02941d1e62e6f882d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: b832eece-e559-46db-e438-08db627615d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6+NlwPPbNNZemeeRMKw+OYTYKYsarXS3KZGxAT6VD1GwbCVdaNrgflB0+dUvDSXHgeh+G+1uKTkXNOjHG5aCif9+GyxUNLam9SzFgkAlN+7RSKFNG7B7yjQXrFpIKlkB8es5i0fam86/1AYL/TCWLOCfxB1nDnhsdkOJWvhLHT4J0tIFI29QgcA3ugl2VEKKoYEm3Fg58LM1H/veaPtKXjK0hIq5FRCS2PQ+UbvGdeIqR/7xReLetGX49XSqiNCfPCrQfq6Dm5XBR04TVdvkQ5j0qQarctyQ9GhzuGA7HsipelTvdTrAWLNhwYfqzPTT3Vt+3OFiTmaVJL+Ax2xk6xnbChe02i6ro9eIPRQ3Fz1VNnA3tE7zjAIlotxcyJJIdb0DxMo8oMxh7rGprDr+gnVtoNt0yj6wKdea5/Jo1rlaWHSG+6A5P35ZD1XI+WwXHAP4l8BFVUQeFRmCoALhqG3madZklSHOyiK2kUEjcEj2zXIunOJqzoAB9SYUb3StQCrp4I32XgX5bUlFNxKAIpW4ehJ5nGCfqLghQ2w+DNVMHPKN+ZhUWulJAg95dCpRj562/sbXloGPtEAu5ebcwnTN8VX/iPnxgStixUbYejjFo59yos7jUBQqfD9gfg1ARLtCMjTedzZRt7EMMk88Fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(4326008)(54906003)(478600001)(31686004)(66946007)(6916009)(66556008)(316002)(66476007)(6512007)(2616005)(26005)(6506007)(8676002)(5660300002)(8936002)(41300700001)(2906002)(186003)(53546011)(83380400001)(66899021)(38100700002)(36756003)(6486002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE9HQlltR2Z1SkRMdTBwKy9nQUJYZjhwNlE1YmdHMVpQalkzYXhDWUVzUHN4?=
 =?utf-8?B?aHFMcU9hMTFIQTNDcThVd1I1SWdQTDNUdWJ2WVJkcmM3dEJmVTNaWFpYQW9x?=
 =?utf-8?B?TzJvYmdIV2s0ZkNJelpyY05WWVZ4ckpmOFlWa1pBRzBmOGFobzdBaFdQS3ov?=
 =?utf-8?B?VHZqbkgyY0oyVlZ2NzVja083NTMrU2tpMEltY2wwbDNCcjBTOTMwYmJwLzQz?=
 =?utf-8?B?d1c1NzlKZmZTcHdGdWxqRS9PZU95SlFYUUoxR055YkJwekVtWTdUVUVuTytI?=
 =?utf-8?B?S3FBcHdBOXcreXRJelBIUk5PMEtaRURsOXQyTXZYdXhpeHp0NWxFTjlHOVAy?=
 =?utf-8?B?aktqMUN1amVQb0FMRTZYYXhoYTZsN0NobFdDRHM5R1Z6SWpLSnVlNTRWS1ky?=
 =?utf-8?B?aEVPd0F0UjhOUUNiMytpVDl5MWw1UFRRYzRJKzdzWDFWazhsbmhySDBLcVVV?=
 =?utf-8?B?eTVvQVp6NGtVOUJyaDM4UjJzbjk3N0RJVjNvMkhEamR1bVp6NzRwRWQreE9T?=
 =?utf-8?B?SkJvdHBVYWovZFI3TWtvZCtHMlRMRXc0ZTh0QkpXMktiMVNMY2dJSmhjUUM1?=
 =?utf-8?B?RXFOMFRlelVlcEN6ZElVSzZEVjR3Vy84cWQ0M1IzMVBlS3Yxa2pPbzVTditK?=
 =?utf-8?B?VXM5cTBqWVpKcU5YWHNsN3h3azU2TlpqdzlFeVJTYlNtTjdXN1dJeml3VDlz?=
 =?utf-8?B?UzFlM01DengyMWRNQlVVTE8yd0FCZElZWjRoWFdRcG5mVnM5Y3lMbEppRTNC?=
 =?utf-8?B?ZGY0VGpzL2NCODJHbnpkRzlYbVZGYkt0VWZlZ0kvRXZoK0NUc3I5RGRTbEdo?=
 =?utf-8?B?SXF6WTRIci9MMFRNSkorSjI3dGJUTjZwbjlVbWhhUlhEVFNBZmc1YVNyQ1Nx?=
 =?utf-8?B?REpUZllMRHZkRE92SDk1UTQ2eTBRWmVBREZrYUxNQVRBbXlkKzJqUkx0MFNr?=
 =?utf-8?B?ajlhZHM3eDJ3ckV1SzlUNDRFMkF2TVgvcE43UzJpU0V5b052S01MWnJ5dDN0?=
 =?utf-8?B?cG9DODErUTNkZVo3dmt4ZlU3UXM5SzN1WXIxYm9kRTgvYmJoYzNVaC9BN0Ny?=
 =?utf-8?B?dkxsTTZOcERJWEt1bmVJSmpGbkVPMjlNTmZoVDlxa1UzSEcra3NaRVRZR2l1?=
 =?utf-8?B?bll0MXl5Y1JxNVo2ei9iakVmc0RCd3V3YjllUWgzMXRvVXBnR0hEcURSOW9m?=
 =?utf-8?B?c3pZWmhMelZ3bWVLWWtpV0N3QmxVeSsrZk5hVytYVENCTzFuZUJnTEQxb3VC?=
 =?utf-8?B?YVN6WjlrK1gyL0ZoV3JtSUhtN0hSL283SVI1OFByblFuaTBlU283c3RQMGRH?=
 =?utf-8?B?M1lGKzBUWEV2dDh0K09hVlVwSFlqVVZsTHpMUjA0citGaHAzOGZOY2EzOFZp?=
 =?utf-8?B?eUJXN092cXo4cm5YZmNkekRyNUFTcmtnRG1hTXFxVFRnZDhPU0VYTDRmd3RN?=
 =?utf-8?B?TFp0MFlTNThoOW1qSklBOCtjcWtFNEYxL0RHWkxRRE9lMW9XUU8xMTd3VFNM?=
 =?utf-8?B?WVRKWmNYSCs1Rm9TSE4vYzI4dkhQclVZcHlEQVVYOWd2cUNJU1VleDZHbnpV?=
 =?utf-8?B?cGl0MnBjQjJRSmpBSXJjb1Z1c2gwZEVVN01PWkJEQXdMRmU0REttWTNoQldq?=
 =?utf-8?B?RzQ4OGpXdENsY0dodE1IcGRCbWdwN2czTUo2ZTZxQ3hFdlZYbXo4VWM4dXJ0?=
 =?utf-8?B?UnpVWFppb3lSdGRXcG9pUjIyemZCMTVTeDVhT1ROekl6MXlDTUtWU0Y1bjVk?=
 =?utf-8?B?WUdObzNjNmYyUUNjTTZ6NnE5SFhCM1JUVGc0c2k0N3dQZFN0L0RpejRHWEEr?=
 =?utf-8?B?NHFEMnZocFZBaHYzbk1tWlBVUTBMdWV2WjNScStBbVBMYWlYZ2Frbk9RWldu?=
 =?utf-8?B?Z3c3WTN6RVlIRHd2VUxwc3gzNGJMSkZCSXYzaWVjSlBQZTlFS3I2N1pLVEdk?=
 =?utf-8?B?L3RtdXhOVWZUVVhNb2hyZ3JZemtyYmVEL05lamgzSXNycDNkVDhFM090RjNT?=
 =?utf-8?B?Ylk5VmJmZHNvcnpDUWx2NUkzRzJySFNod1dmWXdTMWp1WlFxMWJKQ0xCN09W?=
 =?utf-8?B?QmdhSWZkMFdsU3ZpS0JIbk56RHlhWnJGekg3Szlid1JrU0JveEVPbUd3UE1N?=
 =?utf-8?Q?vOGQIcT7j2mjZdPGzDtBCJo0B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b832eece-e559-46db-e438-08db627615d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 07:59:11.8165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfFMXD1xOKN8LunDDiDo4pa3sIzzAveQZstsFh7YTPAiz/lsdvTu4aqgFUjZwGJriljDLFoKIEq7piF2nRcLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9668

On 31.05.2023 22:06, Oleksii wrote:
> On Tue, 2023-05-30 at 18:00 +0200, Jan Beulich wrote:
>>> +static uint32_t read_instr(unsigned long pc)
>>> +{
>>> +    uint16_t instr16 = *(uint16_t *)pc;
>>> +
>>> +    if ( GET_INSN_LENGTH(instr16) == 2 )
>>> +        return (uint32_t)instr16;
>>> +    else
>>> +        return *(uint32_t *)pc;
>>> +}
>>
>> As long as this function is only used on Xen code, it's kind of okay.
>> There you/we control whether code can change behind our backs. But as
>> soon as you might use this on guest code, the double read is going to
>> be a problem
> Will it be enough to add a comment that read_instr() should be used
> only on Xen code? Or it is needed to introduce some lock?

A comment will do for now. A lock would be problematic: It won't help
when the function is used on non-Xen code, and since you use this in
exception handling you may deadlock unless you carefully use a
recursive lock.

>> (I think; I wonder how hardware is supposed to deal with
>> the situation: Maybe they indeed fetch in 16-bit quantities?).
> I thought that it reads amount of bytes corresponded to i-cache size
> and then the pipeline tracks whether an instruction is 16  or 32 bit.

And what if an insn spans a cacheline boundary?

Jan

