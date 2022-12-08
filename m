Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6582064734A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 16:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457245.715139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3IyF-00088N-IC; Thu, 08 Dec 2022 15:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457245.715139; Thu, 08 Dec 2022 15:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3IyF-00084o-FC; Thu, 08 Dec 2022 15:37:59 +0000
Received: by outflank-mailman (input) for mailman id 457245;
 Thu, 08 Dec 2022 15:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3IyD-00084i-Sz
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 15:37:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 498f151c-770e-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 16:37:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9587.eurprd04.prod.outlook.com (2603:10a6:10:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 15:37:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:37:55 +0000
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
X-Inumbo-ID: 498f151c-770e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYBMFxtlKet9X7P0G+C05Gi1rc0pfUnrLjKLxR50nD/jPXQu4JquOMfXIP2QLe/UByawme7CZsHVU6b35yTGtLgjVLJANyS292zwWCZ3Viq40G+O8UNHeBj5Yo3DDN3maJrjsbOVJ00/gqRPSZ5C3e69k90wea3ipev6lkDx4AHOD+a9+IjA459uf79UKUyITjwK5KSjXYX6RBj/J/2OnuTD5EMjBd3JcXZZCGVwnINs6Wn8Nw1vts4fq00lRm0XttjT7gAfWS+zTVo1/Gas6WK7cYVpLO1UV0CRrKkwmpPab61k68/hduHXZwh4FtOAN9k3vwCoEARNUgm8X7mcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbRdUMaK+Marz8+3bYJyfREhkRFbkc6N0kAcWt/xB00=;
 b=mf8sNgmjutdMqPOiTQvcaPwun6rXJEFh7Tv+NrMIfMTLDODqfYj4sRX/zR4FxCsfFND7ZbKqdAE0WBIyszRi+yQH+ft2asgPZnfVkpN4d2JjOodDzINfnvfiTX8bk13j5JA2ajOUK02MLrwFGc0U2cSeyiTzqEUMQKMaZRhbS2IRLUy5WvkQft0TScfPGl23E1roRBXfu5OUaDOoKMYEj0z9FB11a42pmYK1szTGlPnS3fDpRD0XG9Gw9azv+QjSk54+w8YMRELPX+LjlBFH2G1ni9QWNxOvSGnDDTmea33s5nmnVhj1Ouq+CjVQwFe0LYbR4wqV1TZpJCyomG1mGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbRdUMaK+Marz8+3bYJyfREhkRFbkc6N0kAcWt/xB00=;
 b=LQzA7HWMUWhOJIW4nNn2TuFhw42iDIXvFpjD1ni8Z2NoOCCIZ8fI/vnseTWrR8n0RxVdhnVeA8O4lvwYWA5ie6LdzNb44VQmpLVTc6AQx7eiO79arfqg9PvmAV6olpTpF6lVu8KL7nlA+vrsLBopYAFfKItcn76zdB2qH0BLaOkXKQOnI0PuJCqQ0kPPiw7NLx3wGUrlnYOybu2bqYElutxWwPDL8uW3rBEGHRd7zIV+ImEHqc/QLbzrYzSuA6q53lRbX69k8ACgsMOuJPH/sa4SrikCSZtnd3RfyW+Goz/R/aZsmmPtmbN4zShXEIBeVYU9JcEW3MPeEX+pxe6dWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bc83075-a033-10f1-2e0f-916e84153d35@suse.com>
Date: Thu, 8 Dec 2022 16:37:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9587:EE_
X-MS-Office365-Filtering-Correlation-Id: ae025846-d023-4cfd-9fb5-08dad9322cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bR7P/nr2RcjcHRaKdMJx7sUVvO67OZvpsZpA5kmITS2gFRTpFlwi+jzyTeADCLtmOXsbGM+uAAMFwazLaDiP60kqvGQn5CwB9gMqY/1/fd1Nl3SN9HPJLSyIzdkd9fLRGmZWjYq3GQJMh1pcyw4UB30iOvexD776Hkpq5ht7seGlxlzVaQSWiOD+XmzaVZX2gRV4bYOm04qA3y5xekZ23C+JKXCyqUM8Q1h822kuPS6JpDSt03/+EWWFlb8fb89LNVo7V18v0SQxuyY9gNvdU9Tbm2qnIRnvGy/JKEx8m9mIrYNiCoDJ/iqe5ufBRbki0/RfDCd8mZLY56iCU1ShglVLn9L0t/QFUiqZve8V/xpfWS8+qujbdAWUlzrcC0uStyqP/4UKS+ye1uipk5aOZ22Dl8dUD+qEmHgPNwtFY6loJGRcCiW2XaP8ISFQHPYDg953ObZ25akuzTrGp3bro1uz/9CkhpBEfIfHsgSgJFIs4Vf3CyNNjN2xOC6v7K3v2ipM7GPF3YwfD781SibScEexgDfJEXZg4b2K9B1d+nkIZwRQ1SJPLbQHk7hQinJs5Nh6GpnFlrdeUhRPj1J3Xxoqmf5w6v5vt8j/ZFqaWV6v/y7e/PmygkM/Onjp2CtVSzaw3dKEWNIjeHncIcoX3qygDSwdQsbc5Z8b6hWsjYc4kuL9ns1saaniMg0c69hE1IUfja0OdpJHpVq6i/oR55pzrJ6O6X9o6g48Wh5PWN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(6506007)(6916009)(6512007)(26005)(6486002)(478600001)(54906003)(53546011)(36756003)(38100700002)(31696002)(86362001)(186003)(2616005)(2906002)(66556008)(8676002)(41300700001)(4326008)(8936002)(66476007)(31686004)(66946007)(5660300002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0FnSEMvNGI2WHNlcmFDVm9DOWVtKzJTQTJZWHdLU0pSeGdBTDZJRmpDWlo4?=
 =?utf-8?B?Q1JSaDhQalR0eDJ4RkR2QzF5VnRoa2tldGRzemJXbU4yVjhGQVNGc215VHh6?=
 =?utf-8?B?OWN3MmVPMkZIdUlJN1RWL1hHeS9Zbjc3N3RBTllvazFNcDRvOUtNY0ZrQzg0?=
 =?utf-8?B?MTNCQXJoMXl0WHVPVy9DZTMwQ2FtNlVYU2hlMC9vSWlSOHlGWkdLalAveGoy?=
 =?utf-8?B?QXVGcTMyQndFT28rcCszdVJqQWFOQUc5ODN3QXpiUGV6QXlob1FiOXhJaEdv?=
 =?utf-8?B?Zkw1azgwOTF5aDloQ29ZdU42Qnp4NnBZNWRRVFo3NXBJOTQvUnJGa1cxUDUx?=
 =?utf-8?B?OUFQNjR2ZWFUelpFOTY0bWxmZEJHcjIrWnZoTFNHWlRXc0FzTkpGTFg4NUlN?=
 =?utf-8?B?bHJNRk5yei9Eby96Y1pNR0JXc2NOc0RRa242dWtMaUcreVc3WHNDblFnN0o2?=
 =?utf-8?B?ZjdnN0hHeFJqajhFM28rN1dCbHRyc0dGNmdPaHVZaXh3bXhOcmVRTVQ3TVpm?=
 =?utf-8?B?TjlQRDRyRkFKZ1E1YXNjQ1JGQWpEdWg0ZW9NTVVpeDlSVkd2bVJXTlJNU3lR?=
 =?utf-8?B?d1J3cXowR3JCZkpoWCtHeU54anJCNFVETm96alV1K294bXVMd3g1NkNSQmhr?=
 =?utf-8?B?bWc4aW5sOWExN1NTRTJ3ZTRNQzEvOTFSUTlQaTF5WnpDUTVGR25NVnNhWm5u?=
 =?utf-8?B?TVhLczJjMm15KzdVcUF1cVp0WVVXZTZydE82NXR4M0gzYmtveWg3VkliOVBn?=
 =?utf-8?B?a0I4VWhvRDhjQzUvRFE0RGZidzJMam53ZUswajJWb2YybExqSkVJcWt1NkF3?=
 =?utf-8?B?Ui9XT1QyZ3dsODRUVTNOeEo4MXpURWhqTVlFTGFDdURqVll5anlLWFc3V2Jk?=
 =?utf-8?B?Wk1mM1dieFRiUlN3ZGxhQUpQL01FQzVWTkNOa29aaVhRU3Bva21BVDRtWllz?=
 =?utf-8?B?dUluci9OemMzMStHSFlxa0V3TlM4WWdFSFRlZ0s0K0pBTUtOT2FYZHpKMC8z?=
 =?utf-8?B?T2xMRzZPZXkrVkppQXpCVU5uV3pLQzV4ZzdpRmNHOE0xK21EMlhTSDdqUzdO?=
 =?utf-8?B?alY0UUlFb3VQRDR0eXVVcjl4K3c2eVhWc1Y0M3JlUWlhK0RXakFDUlkvZW9N?=
 =?utf-8?B?eTYxWTZ0Q20rT2MyN3FrYXBqK0dtbVZSQjRhOGtCWTlaZTVMcTVseFN6R2pO?=
 =?utf-8?B?ZnhHRndvOXF0S1FTaUlUcVJwOG1jTEtmd3NrRXpNYTAySVF6TWd4SGxLSHVD?=
 =?utf-8?B?YnFBeU05eVVLTnUvdlROeHF6Mk9uTno4blhHaXIycCtjYy9Uc0pVdU84Z0tL?=
 =?utf-8?B?REZvMmEwcW9Fb1l0bXdsdy9CSkJURkdNVzU4aXdYeFpkdVlwM3JUeC9OWGRE?=
 =?utf-8?B?TnhyVEhHcWJFTlBGeGdQZmJYK0dJNVpxb2l5Z2M3YXVZcHdJcE9reGhsVnNC?=
 =?utf-8?B?bVQyL0lvMWhoQ0YxTUwyT0g5a2VBRDUzZTRGbEtwWERuUmZjeHhNaWw5elpR?=
 =?utf-8?B?WlZxdmpnOGQ0bm1SWjEzTVJ1eHM3Zi9lbllzMWlHYWZTaHJVSHNENzVINEI4?=
 =?utf-8?B?ZW13L2h5Z0g5WDdxOEpwSjVuNFgvNit0L1gzSVN3TytWajVreUNkaWRJSllG?=
 =?utf-8?B?a1FVOTZKNnprdUJ1TGFIVjRuWjZEMldoc0RkZE9TN0tuM2hCODBDcDc5ckxB?=
 =?utf-8?B?OEVXbGRIdkZBQjFUcFdIa2FvSW4vNFBEZkdyQUlHSnYvTGNGTmEzNUNIMG81?=
 =?utf-8?B?bkJQYTk0RlFtUHdMRC8weSt1NlBuK2VIZWFWUlllVEVFc2k4aWpoNjdjU0pU?=
 =?utf-8?B?d1M5UHdhM3d1UUgvSENvUkR5UkorNVgzTU0yRndVZUx1TFh0eHJyMFhwcXU5?=
 =?utf-8?B?VnFIZkdMR3Y2NXRvRzBqSGpDb1NYalVWaVZCcEIxUFR4UHgvOVpkQVlBN3BX?=
 =?utf-8?B?aHQ1Y1pXUFlYY3RQZnRvQkhCbGgvYnVKZXM4TEFMSktmL3FJcnBBdVU3eDU1?=
 =?utf-8?B?dUs2S0c5ekxMdzEzcGdWU2UvaG9vNWhERlhDTXROaG85emtyNE13WUVOVXA0?=
 =?utf-8?B?VUJzRWplQkhkQTZWVUZVTXJlZ1MrNGhRTmlyQmNmL3UrWDNQUlJHTHZjQnFY?=
 =?utf-8?Q?v+PhsKCBjPF9MhBVEDJ9hQPq4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae025846-d023-4cfd-9fb5-08dad9322cc0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 15:37:55.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKxh/xot+wVjDiuRehzyKeaLbcexee3ZkQGWTbkcugeOlkFdfYI7R1iEIlegcvz7oTUUoK54eHf07UyyZnRm8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9587

On 08.12.2022 14:51, Julien Grall wrote:
> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>> result, it contains the default value (ie 0). This causes,
>> kernel_zimage_place() to treat the binary (contained within uImage) as
>> position independent executable. Thus, it loads it at an incorrect address.
>>
>> The correct approach would be to read "uimage.ep" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address.
> 
> In non-statically allocated setup, a user doesn't know where the memory 
> for dom0/domU will be allocated.
> 
> So I think this was correct to ignore the address. In fact, I am worry 
> that...
> 
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>   
>> +    info->zimage.start = be32_to_cpu(uimage.ep);
> ... this will now ended up to break anyone that may have set an address 
> but didn't care where it should be loaded.
> 
> I also understand your use case but now, we have contradictory 
> approaches. I am not entirely sure how we can solve it. We may have to 
> break those users (Cc some folks that may use it). But we should figure 
> out what is the alternative for them.

I don't know anything about the uimage format, but is the ep field
required to be non-zero? If not, it being non-zero would retain
prior behavior.

Jan

