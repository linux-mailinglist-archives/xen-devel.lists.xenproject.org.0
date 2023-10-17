Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAAF7CBEF9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618157.961461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgGv-0005qa-2G; Tue, 17 Oct 2023 09:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618157.961461; Tue, 17 Oct 2023 09:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgGu-0005oB-VA; Tue, 17 Oct 2023 09:21:52 +0000
Received: by outflank-mailman (input) for mailman id 618157;
 Tue, 17 Oct 2023 09:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsgGu-0005o5-13
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:21:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a9410c1-6cce-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 11:21:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 09:21:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 09:21:49 +0000
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
X-Inumbo-ID: 9a9410c1-6cce-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Df+rgkpu7HkQoHuF78l4ZX8vrVT2raE/5E57qVKi6E0wu2Rwwg+R9sazsVlXaCWRkObzbEjrFi0EZDWD64zlhuGwaXDRIdEGCoB0bF6+gxpiznGHJ1VhIKuM+IZAeiy4Ag76SdHCtLlfI39n+GXgO1cP1QtR3rS2AIH2Xvd3gtIBbzrdQsTmkQsJbKbWyzcEY20nJ9CaRdFmJSsPbA2qIq3wN+XhWxWyTI8lGEa9fXMjNAXNxKZgDWeelJgp8ZL/ynBXEXSv4KTcbHgffcf71TJaeTdTKgTCzbULgoV4k1QxNHa1/cgdvt5twhT7gKKnJA6G7xSFWmYH/NEbpewxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWH6PyxsxbxR2mPdR/PgCHGLg1K4mC+PPMLkGM0TcsY=;
 b=hO/eu53kTEyYQLP/JGBIfGmQ/WjkEulawE5O9QN/r2tRQZxoeSwZ3WNGXYq735hHM1ZZt4lBmXncmsRLkNtr/Qag/bceeyHFFEbA6isj5XUfXgnWxNw/+FvNvErkT1ee1jJ+p7KgDdNa0TRbB7PEjvXAj0oZpqfqo2xzmZzxODW6Jktdcs+pcqwWI8CWfTBZTBsH8DzYHjKMTjwUWubws+hunvlPD3NVZRGcLgP/S22cWlBdLvVSY3A9UApDjgu1NJxA4evoJLXVZcPROKwhj4YWrla1Nr5hPfMrzkNEIgnTJnpDKDeROt/RKXl1CxCPDFPumRyPrzv7ugS2M04stQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWH6PyxsxbxR2mPdR/PgCHGLg1K4mC+PPMLkGM0TcsY=;
 b=xHOA8SHooen4V++aZVpfXj644KjjZaPqNKXKygj/GYXc7f/h9dMjn+uQDPwNFoG5IuNBpBC0jWGdoK5ZaKX+QLZ6+PorGhUGO6yLP60dZLGOhDRF+BiUAbjqrbCcz9FTzsmkLID3ipEGSE5QBX5F43tZPpL9qctXK6Mv7w7hNG1cJa+X58HhEVP4DJ4Guz4bNKwIgorXjemuXbtv2dEW3aej+dWhnPoDOlXJqEe7NuWqf1TGGp5jSQgZUNVAFI6yPTjcxKZvtw3f8BlcIyO5fjzJ8OZKxzWfwix3gdiWNk54Tw2g1u95hRZI5LykdbKBDPpG61ZUfjuzSUEL2c2snQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d043b4e-f6b6-1852-94d0-c0cfb5489661@suse.com>
Date: Tue, 17 Oct 2023 11:21:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] x86/amd: Address AMD erratum #1485
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
 <ca7a8bad-4d6f-1da4-b48d-7acbb5db401e@suse.com>
 <ac366b7c-497f-4a9e-873d-a961970c4ad8@citrix.com> <ZS5QQ8icFa-EQD4H@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS5QQ8icFa-EQD4H@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: abe805b9-36b1-408c-f8d8-08dbcef27d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Zi9Mwy9gzinevz6/C0i8N8FmBYQanA83xK6myFBxqGwFwGrMW20XfOY7ohGTwMLfwixEDsFXkpvvTSUmpd/TKHhFQHjLdk7VGeDwKDrn4WWhAfLKdgK2h1L2IrWGwAOoAmJY0zyyYhc+7dXIgHLZ6Uj6rtzm3Uy+aQxIk+ZSGtwdhhzVmCg+ivDU+93NUQH8qXb/Z/gqtXnssnak7GBU5Bjiyx9gVYinh0iH43zmQYsLOca9rlxuz66e4oTnA8G7gEs9Iv4TQjFRgvnqIaJEFxFt1rM/fcyZpxNG7QMdne/CbVj/9rgomwNXky/CGt9RIffHt2Kg00IsOQZ9vLnhbVhv1XPGhzahKoHrunVlr+aBEBpBCeFYaOnXpxeOl13wjlVNUngK3iGyVFK8bXx+gTzI/t1+UD9MGxD99TZC09GdVWYRGxqQjqDvvtjXZpheAyupsX5dXlWSns12XdHjusLQBmNM5+nQrzddjj0rv1v1LEUBPtEFDohn4sJ9fMhM92jb49DbkaPUSG2fftzCrjNMtEfByUWUMQMIiXp+a6Fo4zM+EbfeumpHtFDYNobXrANw5T8IStXPJ6KbOE2sUHhWuJhsGf4qRpcnW6ZBKUpoYCk7ET2BCmb0M72l8+nF++CuRbfABjwV0PrkzqRrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(6506007)(2616005)(966005)(53546011)(6486002)(41300700001)(5660300002)(4326008)(2906002)(478600001)(8936002)(8676002)(316002)(66946007)(66556008)(6916009)(54906003)(66476007)(38100700002)(31696002)(86362001)(6512007)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aytTbXl4MzFCNWRNSVdoMk5ZdHV4TEdpRHNEb2prOGN6N1ZuNnZPMXVMcHho?=
 =?utf-8?B?bmhMZldqYzNYTk8xclE5Qm1SLzVHczJYaFhjYTNFSi9vL2dFMllleGkxSWdS?=
 =?utf-8?B?RGhTckhocGJMWTJMVkNFbEJjcWVzY0d0RGVWQk9WZWtSRmhodTh3VHYrMjhw?=
 =?utf-8?B?czk5WGxCd010dEt3aFZ4NW5vYzZwTnRVTEJ6MVhLSGxiSmozQkUxb0NLSGhN?=
 =?utf-8?B?WFhYRmF3RVlGTWlVUStZc1lxNVdwbm5Ldkt4eTQ5c1dWVC9CYTM2NmUvdnVv?=
 =?utf-8?B?eVl2dlE4a01TMVV3eC9Wbk91MEg3bFJOd082Q0J2MHhhbzdFM1loTkZ2TStu?=
 =?utf-8?B?ZmYyNmNhWHVmRDBRbDlOdmRRK3lwZGQrSkdPVHBLM0ZTdWhJUkM4dkV2L25L?=
 =?utf-8?B?T1N0dmFWb3h6eGRGQUxpaU1oMUdYSjlENVQxMFgvMFB2cit4QnRvdlJ5Zmxm?=
 =?utf-8?B?eDdRMzlxcFRvRUt0a0k0UW1ObWVXbW84dEZocXh4U0NrWlI0R1FqTENQUGF6?=
 =?utf-8?B?cy9HbTNUWkJPMmpiYk4xMEN3TEdYVjI4OUJMMWlIdVRuMmNCUXlwYnJEN1VW?=
 =?utf-8?B?SWl6TWdxTmRFL1h3a0ZtTjk2REkrbkV0UXBGY0pLWW5WS3BHS09KV21zVnBm?=
 =?utf-8?B?WVZNTDl1cURGYzBzN3pIKzVSWFlqK3RkRUM5UWR6SUJkV1oxYmRRWHY0SHg3?=
 =?utf-8?B?NW1ERTJTL1d3RlBYci96eEJhaUk3MHRmcm5UdFNuUFA1MTU1N0VpWEFES3E0?=
 =?utf-8?B?UUVoSEFGcGliWUpYNnpwalVNcWNTUy9UUGQwNlNCYUhNRExBUzNhSEdNaDc3?=
 =?utf-8?B?VkpERjlvUlkxRHMvb0ZjalczSDV6UnZhNEFGVC8yc2tWNmNLNlB4TXdKcXlx?=
 =?utf-8?B?ay9KZVBid2NsS0hXUm9JcUFyakRVQkVHbnJzZWlNd2lPMVZ4TFJMZ1NRMXpP?=
 =?utf-8?B?ZnJyM3NBQVJvdUJEclp0eElXdk80cXEvMmNBSUx4YzhQdU51N0NsZ1VPWlIr?=
 =?utf-8?B?SDF1QnZVbHA5aDNicGhvSlhZQWo0L01WR1lGbGZIclNrYlJlMDVPeDEvbU4v?=
 =?utf-8?B?K2FVRFBQZXBiMVljSVlqQW1QSzdXeWJpbzdYMU1MT2lPMkNvdks5ZDJaLzYx?=
 =?utf-8?B?UEYxSXJrcDdaZWx2TjU4Sytvb1F2cHduaFM0S0Y0eTdJNDhrNHNJcS9KTWpS?=
 =?utf-8?B?dUNzNWg3NUQ0dk5IbUhud1IyWkF6azB0ejNIUjBJa3RaNE9CTnIrMmtaNUVD?=
 =?utf-8?B?YndsaUFyM3JPRXlWbU8zaVlwZW1JaWVqMG5CUWlXT2JKMHZqUm5aamRReGdG?=
 =?utf-8?B?bUtWQ1ZTUE1UL3M5TWxiYVkzL21COW5jMjlCNWlSb3I3c2ZnK3dXM1hVL0JE?=
 =?utf-8?B?bURNc0RKT0krRmFURHVRaHVqSEpRb0ZDNExKU1BXVVF2ZWhWNXB2YnhOcTJG?=
 =?utf-8?B?NnFURngycEtZd09lVzIxbW9MTExQTkhOTlM0UTBIUUVkUGFmUHZRNEVmTC9k?=
 =?utf-8?B?SGN3aXVuMU9xNzdsaUV0VXZKWC84eklBNVZKN29JWnBrTEpSVEJDZElxdDFE?=
 =?utf-8?B?TFp4ZExjeXdOczViQkNuanBReUliWGlPVzd3N2NXN0xsdkhaNGV3SHY2QUkv?=
 =?utf-8?B?dlg2UWpHRllpU3NLKzlPTURGVTY0N2t3RjBoVWIyR2R4SnprRnU4VC9ScW9C?=
 =?utf-8?B?OE5PdTR2Z3I1d3ZINWg5OEpmZ3lFQVQxckp3ZkQ0SVVIc3RRZ2pPUXhPOU00?=
 =?utf-8?B?cXJ0a2REaUVienMxSXI1bi94L2lRTjNqYnVKenhJMmhDc3hxUGliakNhczI2?=
 =?utf-8?B?V1h4SC9QeWhVbzdjcXhoUFVBTUNuUWNMZVpvMTJRTHRvZi8yaFhwdXZva0Fn?=
 =?utf-8?B?ZWhPYXByTkpydVZSVENFeWhVcHpLSzRRYjEyK1J5bGlyWTQ0cC95SFhJZWNP?=
 =?utf-8?B?NU53Y0dzR1gzSHp5N1JYUEl0MXNHQlV2S1o2K1NINFBlQmN1YXE4dExRVkdU?=
 =?utf-8?B?NFAxclVWTFA5U2VvcFplbThrQnVHVlExUFQ3MVpYV3V3NGZyT3BPSElGYmtO?=
 =?utf-8?B?aUdJcER6Ym9Xc1FkVUt0UTFleUZHWDRyVUV3TDNmZVBDZWJsamZsVWQ4T2dY?=
 =?utf-8?Q?mTHUwdIuMQQnyGwWjsBtJwcnz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe805b9-36b1-408c-f8d8-08dbcef27d9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 09:21:48.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zbarTzfBmkgPZKSue7KlDS/aPTLBxehGc++fd+ptFpeJuw7tW0BXue5CzyVG4sdKpsQqFSW/JbuSNsGb9Z1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

On 17.10.2023 11:13, Roger Pau Monné wrote:
> On Tue, Oct 17, 2023 at 08:50:45AM +0100, Andrew Cooper wrote:
>> On 17/10/2023 8:44 am, Jan Beulich wrote:
>>> On 13.10.2023 17:38, Alejandro Vallejo wrote:
>>>> Fix adapted off Linux's mailing list:
>>>>   https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u
>>> Why reference the bug report when there's a proper commit (f454b18e07f5) now?
>>> Plus in any event a short summary of the erratum would help if put right here
>>> (without needing to look up any documents or follow any links).
>>
>> That is not public information yet.  The erratum number alone is the
>> best we can do at this juncture.
>>>> --- a/xen/arch/x86/cpu/amd.c
>>>> +++ b/xen/arch/x86/cpu/amd.c
>>>> @@ -1004,6 +1004,28 @@ static void cf_check zen2_disable_c6(void *arg)
>>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>>>  }
>>>>  
>>>> +static void amd_check_erratum_1485(void)
>>>> +{
>>>> +	uint64_t val, chickenbit = (1 << 5);
>>> Linux gives the bit a name. Any reason you don't?
>>
>> There are multiple different names depending on where you look, and none
>> are particularly relevant here.
> 
> Could we make chickenbit const static?
> 
> I would also use ULL just to be on the safe side, because we then copy
> this for a different bit and it explodes.

I guess the way it is resembles what we already have in amd_check_zenbleed().
Also it's not clear to me why besides "const" you also ask for "static".

Jan

