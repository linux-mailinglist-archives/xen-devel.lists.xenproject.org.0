Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739436F419A
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528460.821628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnFj-0007KM-AX; Tue, 02 May 2023 10:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528460.821628; Tue, 02 May 2023 10:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnFj-0007Hw-7T; Tue, 02 May 2023 10:28:59 +0000
Received: by outflank-mailman (input) for mailman id 528460;
 Tue, 02 May 2023 10:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptnFi-0007Hj-ES
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:28:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 247f1ae0-e8d4-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:28:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9099.eurprd04.prod.outlook.com (2603:10a6:10:2f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:28:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 10:28:54 +0000
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
X-Inumbo-ID: 247f1ae0-e8d4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ikwz2xTLMztoIowwUlLUlxyZuq6NeHRMzSqD8gdcgkeCYk318rqZPhKXOArDDPEYjT+A6Rs5lMhW7PZnZNlOiJ6/SKG81cBMHtwRP17KIzwDC3Rdbq5Oa7qGkngHzKYVEqc0aIpKeaTs6BTPr6Q4bX4T6uZ/S7W20wg4tb0iEqm09KOTGTm2eXUZ1zAwNeN+uWtSqOIv36NIgyTPSKFOsY41hEkDYzwZxGwqIOL0B3ARf1Jpo0EefzkLMNGo8M+u64uMcL0jhBX7fQvyvavkThTW0r8XquvfaRVMOUTi+ckKQW+wavMig6PguTWqJ2pSHNEyl2CpZ+Om6vKui4HIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0ielytoTu6NUD/JoRmt6M7O4JGjqcE4ERzlv1AGDK4=;
 b=K2KFHNrDxIduEUI2O3sn/OoEkKlWmTH72OiK8fU2eQmefMdNPrufN5k5VfUflrLSs2j1MLsiRapYCHSViLH1S2f5MlQWs8YFGPjZ0c3f93+Vqe6xtC6cezz82M3IvsWMtU898KPUbwb2iKM7cO61hA7ZA+Jsr+c9+ENwrd1qPbC2RJB//EglLggU7CNYGIZC4e5sO/huP4AeptrmZyHS6tJSVzhvGXLTw6f3MJKpgqfdvcYZDZXa/Io3akQjlI8s4dfxEljtu4FBZRLaSOlbHoRR62Pf/kV8dF/YrktttODrBJYYF12vEVEqZRSf+5Y4iFZpuoVN224mB6JusAAZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0ielytoTu6NUD/JoRmt6M7O4JGjqcE4ERzlv1AGDK4=;
 b=kZr6FI53XNuN0Q57wUaZzNrCKe4WwPqNTiK2eCNN0SGRAVOF3w80LWVHI3Pk8bgUIkm5FnDruGgsOf0zaZHEfOl9ftgUk9to92HJBTfWBThXIHPgLFy06QVrzrhJ+5WSg4eHXu8AbW+XgzMknzRFqE4Ivu1HW4RShfNdXPgfMh1F2mtiWSTzqR2IUJSXUQcvtjOM7FYWsVelfiV7nfu7ZVdc8OeNqyI6nznhvPER5SRwoSacIWcFO49qIPOVKsm8QH0PQS1rhSGXKI9ybqkZ0mvnw7Yk1a0pBOu7cFc59U2i/5mPcUjADpk9C8KELZwTt0fu3i3NmU2DBetoEEzUew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
Date: Tue, 2 May 2023 12:28:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: 163cb86b-45b2-400e-7de4-08db4af8073f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BbAy6CO/WTeNfLlW09u5lHhUBbMph0VF5VqHvcs0R3yqZ2NOYnIqa1WPuSqEqVGOtbs684XGxPyS4qNbeqGSauP460K8aPBxYukoF4qGjXCQzJImCf+6X0qR3fdF+gUmhHPXKdjFn8AQ8Fv+1djgxRMWN7sA4qtQTWyKlabE7ab2vl240wToJpDw0AkdIAVDDA+KJPgDioOR4TaUjSeF38PBHzg7yQRDDX1Uh9g53xFceOuSE0ksYhuV5aGrKMuvQtD7GNSj1nmsE0Au9W2E75G0WgXlCLvezZMez4N5XDv7NV/t8XZ0BNjWwNfpM0hYO72JMOkcb2fzhULuwMb4amLG8Hc0QbrnyiwzpQIaugdUrnjBDiVPIIG0B37VvAH0yOj2+6I5UpmQCoYMVE7HmK0XyX95xzbDsvhX2n/D5xyC829ibBlg0qK/AKry/3dCjFoTANbuoK2QqeFZhg/TFGp3EivhA/dqJnXS516bJV7uanNz7gG2xHhZgVuEGz0rbCK0QPJzLU1sw3UW1NJUYmNpUt3J+Syr3uIj2EEqx1u9qOlqoADWfP/MD0oHqpTMJlaOQ/RP4tJlnf70gjw4zg870eVp5UIF1tad4u57Xrxa/6nJe7BnTMTrMWzX8F/ktZVrsNF7zUYPsjw9BDXPYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(31696002)(86362001)(36756003)(110136005)(316002)(66476007)(4326008)(66556008)(6486002)(66946007)(478600001)(5660300002)(8676002)(2906002)(8936002)(41300700001)(38100700002)(186003)(2616005)(53546011)(6506007)(6512007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1NzalVFSTZ2bk9RalEzdE8zMUdnVnR2SUNCUUkvVVBqSVczenN0MzB4QlFX?=
 =?utf-8?B?VGFSTDRwenJqVWx4ZXR4dUMvMUhUUEM1OFMyNnpRclNXb0JQdldDbG9UUzh4?=
 =?utf-8?B?dWVQYUs5MXVWUDJoSTdPNCt1bVEyNDUxallTR0pxWk0xSFpRVXZReXpXeGhz?=
 =?utf-8?B?cXVJdDlUQkY1MmJmZHVTNmpXeGdZYTVRM2V4cWRRR0FoOTFITjlvbXR2UERM?=
 =?utf-8?B?TnRISlBKTmt3V3YrNmtJamhJdU10Wms4bUNUUVF6OWRDaTlaZXl1cHNyd20y?=
 =?utf-8?B?UitmR1VqVngzRWF1QnRYdUNrNDNWQUJJYXJSVk4yQSt6dmNrS1NoNmVIT0RY?=
 =?utf-8?B?czA2b0Y2WDNCaGszeDNCR0tHRmhQSG52WW9sUzZWSytrdEtMZmFtRlBMeHgw?=
 =?utf-8?B?RkRub2xGRURHMUpvR24rTmcvdlJwVDZFc29aMWVsQktkM3h5TnRuS0s3L0Nl?=
 =?utf-8?B?OEsrdWNpNDEvOXFMZGo5aCtZUW5tejloQzJDZXl6aDJveFZiR1Vqc3dmT0NI?=
 =?utf-8?B?aDh2R2hOL3pheGRvNFpsSG5iQS85S3hhQUpCRWxOQ0xQUW9oT3ZxUnU4K05H?=
 =?utf-8?B?NzdFUEhKOVV5RzZYVk5tMlFBc0Y4elRHbXRVOUl0VDYzbDNRR2pIN05mUjhy?=
 =?utf-8?B?U0pna3ZVYU4wN3hjcDRkTWZzak1LeEYydXA1NHlzRXdoOVEwYTNHOElhampO?=
 =?utf-8?B?MDZjMStaak5XbGlrcHJqMEtINVRsQ2drQk5hK2JwVjlBcnEzalZOK1pvRlc1?=
 =?utf-8?B?R1pJdTBZdXVEc1ljWll0MHFneUt1emJtSDRaUENDaHdZcWkweWJQR0tYYy9V?=
 =?utf-8?B?OVBQeVVFME0xUmlNTXNYb29zZkdxa2pkeXRYT21MTW1xZnRCQjZpdEFjUHRE?=
 =?utf-8?B?djBOemNLaGdIOW81RWpyU2daSzYwdkkvMjNvcHJZRWs2N0dNYnJ0VEx1R3lV?=
 =?utf-8?B?eCt4bHJaZTAxK2ZqcGVYWnE5d3cxZlZzZ1hIKzVIN2tMZ2diWS9lL1ZJdkV0?=
 =?utf-8?B?Mk95TkduQ2d6VXEyL2MyWnVCVG8wNWxFQmRCSGRrODNLdzFwR1Jwb2VFNkRk?=
 =?utf-8?B?RGNRNUhKc0kzVW9UMnZGZmhLN2pWNEpkdStMN0R6R24wU3hmTEJDYjE4djhl?=
 =?utf-8?B?YlhkV0VqOWhRS1hHalF6Sldpd0M2THRtQmhNd0JVejZNUlVlTjY4dTRMemNN?=
 =?utf-8?B?LzRBTlI4ZTBFRXZnVkVIb1V4Q2laL0s0MVNxVVgvdnV1cldNZFNkY2FqaGlP?=
 =?utf-8?B?dTBMSERiU09MTFVNdC91WVd6dC9OQ25qdVl6MlVxN1h0dXpQR3BiZ1RoTUZC?=
 =?utf-8?B?djJuWEFnNU5UWTByRUtIRENoaFFJWkxHK3JPR1pXSmt4OFY3MGF5RDcwVXZn?=
 =?utf-8?B?bHg3RW0vRXR0U29LNEsrSzFRVlE3WnpHSnE0cVJJMkI5NStLdk5aL1YwQ3Qz?=
 =?utf-8?B?dHZjZmp0alpDKzZUd1RKendLaTdyRWUxYm5KR1YrOWt0N1JDL014VWx2Z041?=
 =?utf-8?B?UkQyMmpGNW5YSy9uMDF1eW9yZk10bjZ2VWhDSE1SdjdwREh1NlMzNktjWmlD?=
 =?utf-8?B?VGhUWGpDTWpGdTdZTkF1Rkd3UEV6enBKanJLZjB6cWJzUFp4cWlrejl6VjQw?=
 =?utf-8?B?cUlFc3paU0pVTFNvSUhmMDBmM0tqVVFUVW8yWU5JMWozVjNSdUNwZFVnUGY2?=
 =?utf-8?B?dlViRmJrbUF2S29WNHdIVDN0ZittVFd6NEI2VUoyUVdmemxKWmpoMVFzTk5B?=
 =?utf-8?B?MjVzUVdNamVJRUZReXBlMHJFOFBBTFhGRXN5M0EwSUhsYWFnNVlCM3hLYlpO?=
 =?utf-8?B?d2xLRkoyN2dOd2d4aHNsT2FSSDNYZ2NVT0k5RXl3My9RdkRKRXhWR0VlS3dW?=
 =?utf-8?B?ZGI2OHZ5OWZNQ05nc2ZVNEV2OGdHcEJhc29RQmNVWXY4dTdVMW1VTzEvbWwr?=
 =?utf-8?B?NVBhYk4wTE1QNjRKY0c3Nm1SenR0RmpUZ1gwVFdidHFCVnBwczhyTkNnQm4w?=
 =?utf-8?B?dGtIdGJGVHpyWFVRLzN6RTdPc3ZTTC9RYVJvMjhIeG5IOFpXdEJ0N2FDbXEz?=
 =?utf-8?B?dE5odmE0c0RLSTV3S0VJUzVrZk9pQ3hhblNORTdLUm5ibEsyVFJacS93S0gr?=
 =?utf-8?Q?cTATU27mjsM9VDtxPG8r1amFL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163cb86b-45b2-400e-7de4-08db4af8073f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:28:53.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxVB2ZCnab8say83gbbxq9UE0jyl3BRg7fMovXNAc4ZgOUkoobH86BqTZbzEkWTx+seQzuif3DTdmFQOgaXKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9099

On 02.05.2023 11:54, Andrew Cooper wrote:
> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
>> Ensure that the base address is 2M aligned, or else the page table
>> entries created would be corrupt as reserved bits on the PDE end up
>> set.
>>
>> We have found a broken firmware where the loader would end up loading
>> Xen at a non 2M aligned region, and that caused a very difficult to
>> debug triple fault.
> 
> It's probably worth saying that in this case, the OEM has fixed their
> firmware.

I'm curious: What firmware loads Xen directly? I thought there was
always a boot loader involved (except for xen.efi of course).

I'm further a little puzzled by this talking about alignment and not
xen.efi: xen.gz only specifies alignment for MB2 afaik. For MB1 all
it does specify is the physical address (2Mb) that it wants to be
loaded at. So maybe MB2 wants mentioning here as well, for clarity?

>> @@ -670,6 +674,11 @@ trampoline_setup:
>>          cmp     %edi, %eax
>>          jb      1b
>>  
>> +        /* Check that the image base is aligned. */
>> +        lea     sym_esi(_start), %eax
>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
>> +        jnz     not_aligned
> 
> You just want to check the value in %esi, which is the base of the Xen
> image.  Something like:
> 
> mov %esi, %eax
> and ...
> jnz

Or yet more simply "test $..., %esi" and then "jnz ..."?

Jan

