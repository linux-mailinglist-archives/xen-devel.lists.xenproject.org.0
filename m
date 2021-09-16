Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD8040D36E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188131.337200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlDs-0004Es-3e; Thu, 16 Sep 2021 06:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188131.337200; Thu, 16 Sep 2021 06:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlDs-0004CS-0T; Thu, 16 Sep 2021 06:50:16 +0000
Received: by outflank-mailman (input) for mailman id 188131;
 Thu, 16 Sep 2021 06:50:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQlDq-0004CM-T1
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:50:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23a98ab5-798f-4f7f-8af6-90433c5bddb4;
 Thu, 16 Sep 2021 06:50:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-xS9GE1LtPt2cEnDBHmEiJw-1; Thu, 16 Sep 2021 08:50:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Thu, 16 Sep
 2021 06:50:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 06:50:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 06:50:04 +0000
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
X-Inumbo-ID: 23a98ab5-798f-4f7f-8af6-90433c5bddb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631775013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k1gPeTyjFrHTLA41PiPhhSGUR96qFSIoFFCjAFprlOA=;
	b=SblS2KI9KGQvdPtGe9SkRjEMF1ZMkDnAVtngAB8z6ABKUuw+cOpAH/sZkHF1IuZt5VLqKO
	nCHiZylVJNJvLHGYgeeBkawyJwNXFEq/1zy3j+EFNsptO1ZJwXjJpiYpuincMht4/1oYzi
	0osgX3ZtzkhH+zTzZsnhqKdqFhOdWqg=
X-MC-Unique: xS9GE1LtPt2cEnDBHmEiJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRwsCDYZlLclh/ceRD/3oLIRE9PKJr9OZrmeE4ic4FONLtiVeRwMDIAlolLYV8DT4UUwwMT5g8vu4Vmyor9UGBs7OOgcj6dBxF/i9ajYdXMMbDPKy8nwWJpXyluYeSRdM57KLIzeiH4+gf79pL2wEbk+ZWo2euXZEuuFzjnqpuaA5kzrulj0bNoLsAFQkk/f0LS7WVQOIziHYLO1aeP2aD4M1l19svMy0bPD1WNCTAjFdURbSxmpIJ9BpOkc2UHB4xH+oN/qm2nBpZP6/clyWdyt+3Pzw8J5oNXLVIWwgu+rjznEWY2a7AMy+tiagImA5n79bcGPsV4Mi9P2IH0diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=k1gPeTyjFrHTLA41PiPhhSGUR96qFSIoFFCjAFprlOA=;
 b=AKEpB8H7NcVq8Q4gNT8DrWQqnktufhD+YZUcbV+52MwR63yPdpj0+QYDx/dTjPDaNwNU0s/zhILGaz5I3pGIRknHq46KwHW39kJpEeA9UDJjKdWBNTVgDRYKpvH/hFD9C11SlC9GcGnJ30uqqX764Rz7phkRpNoKrwPFtCVHi5WmJv3LfB016iql0bgVgzlMXCY1WJj/0XtHUNTvhiExqP7eD/S9kYa8EPWcncSANP6K1nyMOYX1/yT/mZNsAf017OcakxfT8KFAp6gfkjji3UmfNH3neY6SRsRDHBRuroYzH1MfeCR5fGxpo0yVfjhbryEF8KFRgptKxKMPmcM52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109151721210.21985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e272a26-e1f7-a861-feb1-350293a9f809@suse.com>
Date: Thu, 16 Sep 2021 08:50:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109151721210.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81bd7bb9-a1b4-45a5-e21b-08d978de372b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5326579F63BE714B055CDD48B3DC9@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hLVG4JzyOONaR91DT4laiaA+WBbyuoFB7b0tuzsK54ZxJiBZJGOZRRtUfUCV/3PY+95BROPJc4BlCRYqirON30KkXLKl86M+ZKoLZC7GM4SNWu/L1CJKGUKBvI5aG4Ep/xTjwTa3vFuFgqRoNl4cJePrB1kyXgCoS4lJTDX6fFvlkDCnWQjaQ7mKa8njLOXmQEV6cr2BNcerGujxk5Zbt+xeYW95+wiQeYnStjPmCgYKqypqSfeIQN/0FjNht3zGumTH3bmZ5Dkr5w5t+qfIpIEE2k/82GVePPGs0n0GAdn5fSodI5trBFuoiFDfOv+uQNL2gi8/BRuiUqhEdaj7FpcHO/Riat5wlrsocAbf4EAR36UvAUyLtKPEnYss+0gN+6UQcLt1buNMD6/z9sNIuimXf4ESix0UgN73qfJmHsJhz8oxwqZ8phEHeZtQsD8YMcIRxMrpbOadN5QAYwD7j3D3tlGePa6ZJK6L+0RnB/nFS0JWOXxzu5cKorDn9I8MbtyoA1wA2pR/21uaa2z1O2XOQodMqumig24JEeUtpci9AJrhtgMYpoybtRql4E4lBr7s3deBJluDb8n4SLWjd1x4YWysm1WUXQAV+LgH9uE5qRQytabwoVe8NIttQNXUkRE18QrBiVv3P8mzMu9C3yzAH7vfOOvHHImk9vTjxgComdRxP8nwBbj2uITtVe2A9zRX9/+PxGnTAE8n7bvr08f4XkRoVZRurY3kTOYIjrIUf+Fs5sMiYL4I2tld7V9fut/bR14dj/9ziVkfTfA40Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(136003)(366004)(376002)(16576012)(54906003)(956004)(2906002)(2616005)(110136005)(83380400001)(7416002)(8936002)(4326008)(8676002)(5660300002)(31686004)(186003)(26005)(478600001)(38100700002)(31696002)(53546011)(66946007)(36756003)(316002)(6486002)(86362001)(66476007)(66556008)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUVHOU5GRVdCZEZ5Tmc2UDJ0cTNCRDhFeGNDUmpDUFpBV0ZmeGFOclpPdEJ5?=
 =?utf-8?B?N2tXYVJ1d0s4K3VRdk50U2M0ZGRMUGNHMXZLbXZmRGtDK081VktPRlI4bGVB?=
 =?utf-8?B?aHVLQlRSQjUvWmsvWmgxc1oyMUdYRlN2anQ2cERieHAvRVFvRjVheTlBV3Vh?=
 =?utf-8?B?M3hzdEhiQTZHVUc3dVMwalczQWdCdU1LdmpFSkVlaDVGcCtjMEFERFdSaTBh?=
 =?utf-8?B?S0tlajdYOFl6LzZucGVNRDljN1Q2MDdNMG1zNHBZNHhvcnZGVmUrKzFLWnU2?=
 =?utf-8?B?WmJLYnA5QXB0M0ZRQzBhUFJIdnRuVFRsaU1ydWUyMzZzRHBzdkVWaFlXSW5N?=
 =?utf-8?B?aW5oS2IvaHY0RVJhamQ5SVpHRUJWUi9iYmZuK3BzemxVeG5ITDB5YnN0Wjdo?=
 =?utf-8?B?R2x4UHUrZXBzOWF0U3Q3Q1pLQTFONjNPZC83T1FoUjRTZUtGaWk4OUVBZXEy?=
 =?utf-8?B?WXBiejl3d0FCMytiNFlQb2grMzVqdTdBSm5wTXpHZTZwZmNENVlYZXZObjhJ?=
 =?utf-8?B?bWlyOVdXWkhrUE5rYWhHQXFvSXNPVWJMdTBKczZITjVIVDQwZzBkVlg0UXFU?=
 =?utf-8?B?QjZGRlhmTG8zeThUeVNHQ04veE5NUkdJK2I3aThOelNHcUdwaERrMlljcVVJ?=
 =?utf-8?B?dWxWVnNITlBRZHFtQ0I1a3hMZXhNQ3pVaHF5THJEY2Ftbm0xdUlUSTdGd0ln?=
 =?utf-8?B?VkIwVUFRSWNOR2M1M1IyQi90RlI3Q1RGa2JkdlNhSmh5Nm9jZERxa0Q2VmlX?=
 =?utf-8?B?cXJXTFlBQ2JIVEVTTjgrY3pJODdhdjNUZW9Ob2VLUWh1SzVRMVBCcGsvOXk3?=
 =?utf-8?B?VUw5SkhJWFB2WDdqOVR0THRWbXlVQmp0cjZHZ1cxWFFYWWxEVVM0V0dCdWl6?=
 =?utf-8?B?TzRoaTRENllWeWNFaWNvY0VGSnJZMUw4NXlGaEU5UXZNWkRJdVBZQ2hXMkNq?=
 =?utf-8?B?THhyazg0dTNFamdHOExYSHlSakRkWmJ4dlpwR2ZUb0ZTVlY4cDZWR0FIVnVY?=
 =?utf-8?B?SGYydFQrSTVyM1RjRzhkNFhOZS9ZM1E5WjY5RVY2MjRvcEZkaE1YM0hjdTFB?=
 =?utf-8?B?Syswc3NYeHJ5Zzh6RTdnNVVZSUlXdVdrYXl2bVpoRFpoUFVHTDJMNlVGY3RG?=
 =?utf-8?B?cGRCbnkrRlkvcHRuR0g1b2FjME82OHlHR1ltRE1leGlTQkcva2FaaVBYa0U3?=
 =?utf-8?B?amI0QnpXaStQS0NMZGp1SENtN25xVW5BTVhZV3lQWmNPckkvQSs1bGFOQ3da?=
 =?utf-8?B?VmYwdGdJQWV4KzhLRWdhTVFTYlJOaEFRRllkZHVsOG1UY01SUHdxYlA5V1hI?=
 =?utf-8?B?Tjd2RkFPR2FucEZRNW1ZQnZkMnIxVFpTNFBDTnFSNlIzR2JXRUhQaHhyU0Nu?=
 =?utf-8?B?STBjcHhaN0k5SitMK2NRUENpN0dKaElnNkd5NnNOcGY2NjVuMmd4WmJVTVg1?=
 =?utf-8?B?TFRpeHp6VW5TWitEdHdaZkFiLzZ2Y09oc1B6ZXRGelltS0FIVW9nVTI0czYy?=
 =?utf-8?B?UnkrTXQ4aDNLNStxd1cxNzc2NERld0FBNGR0Q3VkMzg1SWh4L2dXdDNIY0ps?=
 =?utf-8?B?VFlxdkV1S25HSmorRmw0VWNSM25GeXc0bHZjQVlaNzIyMGJ0U1UxK2N3cUgx?=
 =?utf-8?B?MlYyTHRFV0ZZRWRNV0VZT2xWMlh6emNkTmNsNTh4SDVJSHFiUlhWNU1FMExo?=
 =?utf-8?B?azIwbTl6Zms2RXNmdG5USGNuL0hSK1gwcWtNd284TlBqMW14TzlPNHlydjFj?=
 =?utf-8?Q?rzix/AMA7Hw7Z8N53xLtZC3psSLME35VIJToEOk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bd7bb9-a1b4-45a5-e21b-08d978de372b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:50:05.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NPrVlfxtDgo08eJHpYgcR5OUu8/RGyqQXXJvPFOhFXkslEuYLgAaVdWdd9f+1wfO+3YP/ZzvvxZxGh3ebiLTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 16.09.2021 03:16, Stefano Stabellini wrote:
> On Wed, 15 Sep 2021, Luca Fancellu wrote:
>> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>> +                                               int domain_node,
>> +                                               int addr_cells,
>> +                                               int size_cells)
>> +{
>> +    /*
>> +     * Check for nodes compatible with multiboot,{kernel,ramdisk,device-tree}
>> +     * inside this node
>> +     */
>> +    for ( int module_node = fdt_first_subnode(fdt, domain_node);
> 
> int module_node;
> 
> for ( module_node = fdt_first_subnode(fdt, domain_node);

Not just here iirc from briefly looking over the patch as a whole
yesterday: Use of plain "int" would better be limited to cases where
values may also be negative. I don't suppose that's possible here as
well as in a number of other cases.

>> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>>              efi_bs->FreePool(name.w);
>>          }
>>  
>> -        if ( !name.s )
>> -            blexit(L"No Dom0 kernel image specified.");
>> -
>>          efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>>  
>> -        option_str = split_string(name.s);
>> +#ifdef CONFIG_ARM
>> +        /* dom0less feature is supported only on ARM */
>> +        dom0less_found = check_dom0less_efi_boot(dir_handle);
>> +#endif
> 
> Rather than an #ifdef here you can simply implement
> check_dom0less_efi_boot on x86 as a static inline returning always
> false.

Indeed, and the properly named (efi_arch_...()).

Jan


