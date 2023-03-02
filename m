Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642696A7E5B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504811.777211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfVH-0007kT-Jl; Thu, 02 Mar 2023 09:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504811.777211; Thu, 02 Mar 2023 09:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfVH-0007il-Ew; Thu, 02 Mar 2023 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 504811;
 Thu, 02 Mar 2023 09:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXfVG-0007if-DJ
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:45:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f900d207-b8de-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 10:45:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9775.eurprd04.prod.outlook.com (2603:10a6:10:4ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 09:45:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:45:29 +0000
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
X-Inumbo-ID: f900d207-b8de-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaT5G/kKzrI3Cm31QPmfRWkDmW50/Mpz6MG0DWkSEAdjMzEGIqMcygtcxfKLDl4TXvAVmWTOiTqFribCDUKJ7+o+2i4p8O1sChb2WPmTFIrjmtG33wtwVeTs4xb6kGeEDMmMddMLqmgo9pYjerVXzHy6NWHwCKnCnRb2Qo+745K1Ih0zik7okkV77UyMnelUiU+b8mC2oztzT+iEcXAMccWC/EXdbN81ujomsUVKyNi3+rDbg1/X8/XAbsEXws0Ganu8v/TYdJCgudanwE0vKU2/7CaGFKrNnLoQXVi06EXG3OWDwovERAXG7/x6q66pleXUwRz3YkDR0EVWMuvdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz+96J6RnzvmNBwoSS02Fr1es7UJweyPgt6Qr541iGk=;
 b=Ee081kzj085mvIEwbY4kbfqX+u+ICcS1u7C3tGwp/2dgQR2xVPWrxLcYHileQ0RU3JTv689H3pL1ub0gkADPhRdzirJseBYqZtCW7B0tQ6eG4Q4vMihEc93bmwgWxkTADM8X0GXG/c5RuQOqPsNT6MjVtWV0tHJaM5uRwPEhx9E5sSMvEXR33bgkDGowjreoIrU5ikZezgy5NUIuvEfyYVjIdWPceKwdoWovdhsuVXA3vCPvpxmM9lUVEwunWl/mrvnioC6KdNi5L07s83Zg86pwVEtVPeBWVwzllw2iiI5H0HwWQWdkWbaG7DNZGayPYiTPfTz05qY7n4CqGsWm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz+96J6RnzvmNBwoSS02Fr1es7UJweyPgt6Qr541iGk=;
 b=FmjD9QFLLtIJjvQss1UnlVS7b3uQhtVeyWdnBojO7nkltU/U1t4Y7JMmoswLgXRvpg9ytZLGZNvOClBTc4GXu8YtflqcpOtJ7k+j8Mwu+fgZ1li0G4Ln8oNnakmagyriPoW987GUdyE2sTZlKdQ1ZIADDaHBBEeCdmkvK7Ybqh23FyAO+qKcFq2C6AdHLUQiUEU2X4lL6tddxeX+yUyJKFfQhqWxxuQ0EeUkWt0nwBH6ZIkBuZfmZirp3nY9uxxZQ1dpQzUzFYTHYH7rZC1jWBJqvVeRFNmDN3Qd6kbNjytK9sGADAmW8rUdrcxP/KGcySEYDefBvRzleVQCp2XsSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e34f587-d42d-3709-9c64-b5e50afdd046@suse.com>
Date: Thu, 2 Mar 2023 10:45:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd7e91f-242b-4bb9-2318-08db1b02db89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Myuh2ooEFJtoT1jqtk4fjTzm2WEyzbZer9eJMJ9ixz+P66KTk0KYD2E+GQaaSIxRJSe4WDNdundHkqykloPzSiJ2jjuA8uJwBcKrpKFCvT0pJUQYhDMwJeOD85E+66opleRNPpLE4M8nt5dnu6oWtF9anW8SPcjbb1CKy14hmaZVRp9Kq2nqrOKOUvKyea5fu3RrplHWrloOCFkJP1fblvqQjEJui48n6lRRMXxFr/CyZ+sG5/z4etv0ZI2C6fCpv4AE0CGazY/DaxqaqU82fXM3wyOwAPXrbY6r/HSrRW2ShhcpifrkNf4yasTIofbLTMXPEP4HMQb1Wu8UOSZ2cykSY+8B1D/tj7BYz0UJzb2J8rovQPztf7KB2uhuNFNhDqdEHZZyjoN9Cv5FZdwso9F6aiJQl6XAqbfhCxte0mntdBe3/Vk1SUWpF+wYD12qX/E+bJUcaN18jP6ToAteCLKrL6G78+sVaDqluaH2aAVdQNVd5qCMUqzSkCGXW5BNpOdSdNZrUF8hD0wWkZbjW5gtLqmWKPG++MjMnWdHYSDabUaMeETOXwJrjSxPyaiz23RdwJlp4FO3I5M6l0mWw8wvGl1Ehy7t+n8GC3cpjiqWIo+Jw3CrlMYnC/MSI6rxVztn9FOdbUa3vAGy+Q+Ri0hGQBInvS7uZ9eILWG0NPbdWYL+rjTOMctpVf5O+2RwvPCLzFzEWiRfXTUGPDDe3H9dfkevrMik2v+hnneVzqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199018)(8676002)(38100700002)(31696002)(36756003)(86362001)(66946007)(66476007)(2906002)(8936002)(41300700001)(66556008)(4326008)(5660300002)(2616005)(26005)(53546011)(6512007)(6506007)(186003)(110136005)(83380400001)(6666004)(478600001)(316002)(966005)(6486002)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUIvd3pPVXNkRElnYlJrQjRlbDhtQ2ZpcGJMdDJVLzdnL0hYOENRRWdBWCtP?=
 =?utf-8?B?ZGZYVnVURDdzZ1B1Tll5WEdNOUJVWmJVM2s4VHhmRW1kZlBmQ3FSdDF6VHgy?=
 =?utf-8?B?bTRDeHUvRVA2dHNjeDN1aUJReUNDZHlONWtqSUpUYXQvZEg1L0FtbUVXYllI?=
 =?utf-8?B?a0lwYlluWmpSTngvdXllZVp4em9aRjJsaW83UEZBMnREWXZBSllRcm9CYXVs?=
 =?utf-8?B?d2lHTFQ2eDROdTdRTkFhcCsxbk9KK2tJMXB6cUJ0RE5CQVF4L0k3Mk1sOEtN?=
 =?utf-8?B?dUlzcXU1OEs0NDNteVdMd2grTFJ4K01ocFpmZlI4WmxUdXNJUEhEZTdLSEZp?=
 =?utf-8?B?WHZ6VFc4Y1JaUUxFYTBsQ1J2cVRWN0UyUHhUbEs3QWFpS0hoK3h4eEV3dllC?=
 =?utf-8?B?SGVBa1Q1L0EzdElOUy9NTzZ0MXhFeWhPQndXSE50aGZTQXQyYittcTFQQUZU?=
 =?utf-8?B?WEdOa093Z0IrREJrc2NYOHcyU0hoMm51bW1Wd1RRY0FnM3lTK0p4QTJFcWtt?=
 =?utf-8?B?VUdZR1l5a0d1b2k2Q3Zmem9DWXBsaE8rQnQ4UXd2RGp4eXYxSkhuTXBqN25r?=
 =?utf-8?B?bk4raVNvQ3I4bWFMUHdrRUZDMHpMZm92VGRJNlpLS2VpU2NnK1YweXlsOG5a?=
 =?utf-8?B?a2xoWjJ3Ky8rSTVZV0JZcGJRODhKRGFYQ3JzYW41K0FkNlRrQnk2Slc3eXpQ?=
 =?utf-8?B?M1diMWxtWjJLK2JMK0VPeFNHeVJFTVBpSE9QOXFmV21FMnd0bzlrYkh1NmlS?=
 =?utf-8?B?VnByMm5iNnd2b1FBOExzdEgzTENsQ2lLMWhHTnZUWnFLWmZkaDlXV0lXSkpE?=
 =?utf-8?B?aXJyMk1SNXlFNUEvOHhTTm9aOUluRThTYzJBVUpwTU5xeE9CaXk2YmlWbEh0?=
 =?utf-8?B?YTczYTdmekYyMEZDWDNpSDlwNXBQUXl4TFJhNHdLekk5VDRndms0RzVVb3gv?=
 =?utf-8?B?YURxTVJLWFVnNFVNZ2FtT0lpK1p0Um9CZlJDRUQ2U05JV3BZTmVnZ2xVTGdr?=
 =?utf-8?B?OWtEdmp2NzNBVENxZE9wOXNlYUQ0RTAvYUNEeUlVR2c5N3RmeHp6bzRXRzB1?=
 =?utf-8?B?L1VDc0k3b0ErUHRvSEQxM2VVM3BBWDltYm1LRVBScU1obnVTRktLWENITi8z?=
 =?utf-8?B?RWxrRmFBSEJHR0tNb1JWQ2MxbHdVTHZUYW1mUUNvalo2eWVrK2xNbWZnZDln?=
 =?utf-8?B?SW5lcW45Y1ptQ0EvZHJsME5lU2lOTFZGdnczTzNmQTVORDN2NEU1dUU2MUJH?=
 =?utf-8?B?bVNyZHJIWGx1VXZsSkE4MlE3MXYrL3NTVlF5bjFuVlFqdmI1R0VVRHIxOGRD?=
 =?utf-8?B?am9TanpWMktDZzJ3MGM1S2ZGOTZXVjQyaXQ3dzVBMElMUWszTXFPR1NXNXhv?=
 =?utf-8?B?eUdpNnE1ejNZUkJWdjh5WVh3cEdLWUw3MjMvRlhxcC96UlVLTGlWSm1Ma01r?=
 =?utf-8?B?QVdFZkQ5Rk9TQmVDbHhHNVUrakNHUFdiVzc5VGZ1YlpYSk1SaTJWK0xjNEJM?=
 =?utf-8?B?U3g2MWNsZ0pOYVZyU2xtQWZkaklVOGFmRUZHVUZWODgzSjdzRi8weVlEeUgz?=
 =?utf-8?B?aHVka3ZKZEhDV0JnSFh4ODRhRk1EUXo3TDBxQVovaXdidjlqSEYxZXJVRmFs?=
 =?utf-8?B?azhPcktndW1qQzVtL3hIbjNDQjdHRitCd2tPc1Q2a0VxOVA3UVEwNkdGRzZX?=
 =?utf-8?B?Q3VxUFNvQ09SUkdjb3EwRUhMbG1TeE8wRm9XTmtneXdieFJjQmJJbVRKQmpU?=
 =?utf-8?B?VnpTSWtTcTlwU2FJeVlYU3didlFHUUpMS2ZJTEtqcVg1dUNqQm9iWkNhbXZx?=
 =?utf-8?B?T1prdzFhbUYwR3pDSUZ2RkhlY1FiL1lsQ3FnZjF1MmJLNTZaemNsL2ZLRUM1?=
 =?utf-8?B?czN0ejNuTFFYT3VQYXdwZDRQdHFWRmsyTnZ6QjJxZnFnOXFoVWV5OS9reThO?=
 =?utf-8?B?YXVuMlhOVkxjbU1ubzhHREIyY25iVEpyYUJnRkppSTQrdE1ZRE1LNzdWSzJI?=
 =?utf-8?B?WDVUTjJFQStJZzhWbzFkcnJ3TEZFL3FiUmJFL0R2VldZSGxDY0tnZlpuMmRC?=
 =?utf-8?B?dkVjWkc5K2swZXhJS2dTcWtzMU4yVFl6bE1zMTdySlJ4YkY2V2pZZzZ6c013?=
 =?utf-8?Q?lAHjiHO1M68OeI/0knjs9BNYJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd7e91f-242b-4bb9-2318-08db1b02db89
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:45:29.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkEkZiOpzrRzy6w2xRIwwj06bK4T0xCosA+W9DHrdhVMSKKq0XW/f2//GYNvna0CYkANobNE0iaAmEmRLJSRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9775

On 01.03.2023 21:38, Julien Grall wrote:
> On 01/03/2023 17:50, Julien Grall wrote:
>> I got the answer. The problem now is gitlab only keep the artifact for 
>> the latest build and it only provide a zImage (having the ELF would be 
>> easier).
>>
>> I will try to reproduce the error on my end.
> 
> I managed to reproduce it. It looks like that after your bug patch, 
> *(.rodata.*) will not be end on a 4-byte boundary. Before your patch, 
> all the messages will be in .rodata.str. Now they are in .bug_frames.*, 
> so there some difference in .rodata.*.

Strings in .bug_frames.*? This sounds like a mistake, which - if indeed
the case - will want investigating before the conversion series is
actually considered for committing.

> That said, it is not entirely clear why we never seen the issue before 
> because my guessing there are no guarantee that .rodata.* will be 
> suitably aligned.
> 
> Anyway, here a proposal for the commit message:
> 
> "
> xen/arm: Ensure the start *(.proc.info) of is 4-byte aligned
> 
> The entries in *(.proc.info) are expected to be 4-byte aligned and the 
> compiler will access them using 4-byte load instructions. On Arm32, the 
> alignment is strictly enforced by the processor and will result to a 
> data abort if it is not correct.
> 
> However, the linker script doesn't encode this requirement. So we are at 
> the mercy of the compiler/linker to have aligned the previous sections 
> suitably.

May I suggest "aligned/padded", because it's really the tail of the
previous section which matters?

Jan

> This was spotted when trying to use the upcoming generic bug 
> infrastructure with the compiler provided by Yocto.
> 
> Link: 
> https://lore.kernel.org/xen-devel/6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com/
> "
> 
> If you are happy with the proposed commit message, then I can update it 
> while committing.
> 
> Cheers,
> 


