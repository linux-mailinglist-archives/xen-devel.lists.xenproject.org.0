Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB0739923
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553336.863843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFTq-0003kM-2w; Thu, 22 Jun 2023 08:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553336.863843; Thu, 22 Jun 2023 08:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFTp-0003i6-W6; Thu, 22 Jun 2023 08:15:49 +0000
Received: by outflank-mailman (input) for mailman id 553336;
 Thu, 22 Jun 2023 08:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCFTo-0003FY-GU
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:15:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdcc5116-10d4-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 10:15:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8728.eurprd04.prod.outlook.com (2603:10a6:10:2df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 08:15:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:15:45 +0000
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
X-Inumbo-ID: fdcc5116-10d4-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD/4+ZINEeKqyOHL8OgxCsPvrA2P1+uesXva83EM5p53Mr5lDLbpjCNe29JwXwxg3MsYM6BIVtO8Auz5QbqNvnODtXPHPk7mHsONo+MvM+ZQng0GofPIyaJMtP2vgCHVHg4LWZ/INLnaxXg8UvloUV4RZ+c269ZvLePRnhp6M5lehTuuAr9tPQdzSZZK/JZWd/DdAZ4OGEzbYydOSxQJ8/M1nHB/AY90q20CL3O64/xyW0u4fQaeksntW8r7Y/36+m0Lkfuy8bFswAubky4XImAPNzV0Zke+nQ1Zw6dkN03PSw0EKkAxnoFBMNLM1AlkXdRezMENm8tffYdHHocz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eg0nJrcVbuxTVtvD1KesIjeAKMEADEIssyGnJkmt4OY=;
 b=Pssez+T/xLEsnx8Ro04KIJlg+p1KwHV+SxIN/Dfphgoan3Dqg0tfzj7GjKgQJOm34EC5+zlo2pSUskrZGMaBqnuTs/pX07VBTO3uNMh06ibltYxjKyGqvEhgZYs6t33oMZIvC+rW6FWuL6vXK8zOQEGl62IIshSG4M54zRIuO1ja1PN6Hs10R9HgfKXlq47cWLVAcQdQPsYD5XGAXHZMlQyp6K9VSf6KNsh4mNZaoIWljF247ixRVcG7HAL7o5pMsARTjpYH4ql7RdM5pQomExibKEEag0R/8sPNBnE0B0PPaxf/TuarmnEdsKsl9WL9Q6nhR1ycg3FUdjuqcOAong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg0nJrcVbuxTVtvD1KesIjeAKMEADEIssyGnJkmt4OY=;
 b=aolsQaGYi0P+/08BNI/XUkDKjJhbbiowsXD8eIQn/EaPH0c6F2mKEQHJ7XKYXOwH+w3+Kg1uEZAG1b4sMHy9UuzfaGSwd4QIF1APsP8zIp8zAjj6KuY27T33R3UnEgE+Fw41RObSHdUCJJ+qLvnee6jQQLexfcOYdF+OtaXY4rgRGKEHQ7BXLwIMpA3oeUb5Vk0rwb24tHfhnhg7BuYB7szZE0Ai2UyX+Wueg2XLATelg33j0R9WwnOK0tIxyb21RVhy4NQb0J3CHh+j+p36qjWM8LcnHkVwHKsharCtq0GSBbx2fcO+rU3kbuR+8MKc5Lll9Wf2OefcorfjYjr6CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28d92bf2-5157-665f-9c91-9112dc8892dc@suse.com>
Date: Thu, 22 Jun 2023 10:15:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
 <20230621161959.1061178-2-anthony.perard@citrix.com>
 <f7d9e5a9-993a-89dd-3026-3b59f9b52bb5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f7d9e5a9-993a-89dd-3026-3b59f9b52bb5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: cf686c06-e8c9-4805-9754-08db72f8e0b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hrz0PscnKP2eVH8raljLrjuEWsvDQEVBgZtcvOSLyf6bT4AX/thx6BqUMzhI9G69IRCK/7ZqJur0FkczdxVSc1ilPJF5Khyzy7gZ+xi01CHVIk7sygFDeyyPKdI/vcxoTJLTxYJht7x8W9iO+7dqO6cAazSnjrHhE5YdhApzKnAVq53avPcD5viLetlgtlX9c8K2hP2vl3eKi0ja25p39hf3fgjP1PJD0fbmD8eT4NWouuhwt8x0X+O/6/XGXVbDaeN9LhhhiiAkZ4UppjmviedCSI9acl3BO5oM9+seRZvIwlMCHIAonmPW1fZygZyUfqgLMUp12Kw1kIUFJL798yINed0Los8ShfqX8XknLxnq5unUo01fcBWCb7hE7P5G/4YTcXM0e5T9whQpWyf0SrEBXxf6zyuOgBuBQZG0GJUAO/0rvvcnyN7DDuC5jI7wkVv8WAsIfzo47zA/Kn7tiTpjqCtAELXlqYv0SiiGG8rPk5pf4TgOgVEk1jwsHTTMCTXcRqalUY5sMNMabXMM7qufl9KgA4lsmRTbBRJ4pWZITV6MEoVBty2Y0Ro6/i5fRkQleQpfEBtD3oWocYwRsagYdmP+5WhFly27dBDJD29JQqymJFLoR+nCOtpaNZ2sBWaghsYV3e2rSRi4idCwdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(8936002)(41300700001)(6486002)(8676002)(2906002)(6666004)(36756003)(66556008)(66476007)(110136005)(54906003)(86362001)(4326008)(31696002)(66946007)(316002)(38100700002)(478600001)(2616005)(5660300002)(83380400001)(26005)(6512007)(6506007)(31686004)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTJROUNDQmxjeDVUbDZjUnpDSHhOc0hjRm1Qa3I2UFMwUDArTkE3UVZRWWMw?=
 =?utf-8?B?R1RGQ1ZKWnpBTUpPaVluTXpKZEs4R2tlaVVGVzVSTmk5U0pKOHRsY3RpNXJG?=
 =?utf-8?B?cDlnNjVlNnhTVFlDLzhISHhtQlJkeEE2L0diMDJTNGVKazVpMWhmQVd0MzNS?=
 =?utf-8?B?ZG51UDZCSzE2TGpyK3hGdkVFSUlaQ0FPUUJqSFpKRWRGcHJtUDNqVStta1U4?=
 =?utf-8?B?TEd0OXh1eWxjbFRwOEs5MGVFVC9zaWV1d1pKcndIUGp6VHY4Vnhmc25MdVR4?=
 =?utf-8?B?MEJDciszTEwrTTNSYmZFaUZTV1JidUIzWjg5MGFwRUU5S2ZjNzRnbUwzK0g4?=
 =?utf-8?B?TnEzK0pibk55eFIzTW9jelo2Vmd0Z2I2UFUrazhGWXpONmNsUVkyQndxcmVQ?=
 =?utf-8?B?b1VQdGhxNG9tT2V0U2xJMWFsdWFXcHF0N3MyQjRqbHBhR25OQll6Q0xvTWFZ?=
 =?utf-8?B?L2JRQWt3KzBza0dXbmx5a2VSTnoyaURBTmFQMWJ2d3RoVzNLSldUZHRhdXNS?=
 =?utf-8?B?Rnp5RWNiQVVGb2xIb3hiM1A1T1ZPYzJkR3czalJkN2NUR2lUeHd6QTB2SkpT?=
 =?utf-8?B?WG5NRHBjTGM4LzNOcVJ5MkRNa2UzMVZablZxL1JmcTRPbS81N2YvcHR5T3FS?=
 =?utf-8?B?ekdVdUdXL2NLaTFYamdtSHA2ZitjSVBEZC92MGRYWFNZeVZsYmtYd29ONXc0?=
 =?utf-8?B?WDByRjM3eGNOTldFZVZyWTlJSTkwaU01eDRoYjJ2WmR1cGR6bHNoOGZNYlFI?=
 =?utf-8?B?dTNTaUlZNVJYay9XUnUrYks2c004elRBc1VjRDhFaWM0UGRCbDJVd09oY25v?=
 =?utf-8?B?TXU1VmNCK2lYelQ3VlZZUFBJQjZOV3h6TVhkU0twbm5Db1BzVm9xeVBCMWNR?=
 =?utf-8?B?V21OTGpXMjZWOTJDU1BRV3BJc3dIdzRRZkhSM29VbUNOVm9IYmFuNk80SkZQ?=
 =?utf-8?B?WFBrYjUrU2RUL2huSStzQWxtQ204a2ZYVFBOS1BWVGpsQW5tUFp6bWdIeGJ4?=
 =?utf-8?B?UlF2Z0FwMDFFSWV3cmpheEF1dVhsSUNUUEx3Q0JKekRoQ1llZTFVSnd6ZXI3?=
 =?utf-8?B?T2FhR25hdFRWSCtVQ2tQZ3pJMWJLTUxTZkpQY2dBbFJxMXJrdkVlejFFRmlq?=
 =?utf-8?B?ZDhkVmNHMklSUURnUDFST2NRaWk2M1MrZDRTQ0x3QkRSUzdCbElhcUE1VlE4?=
 =?utf-8?B?b0ZScEVPNG9aNlY3NHNONm91cG53YXdNdHZWSDZpbjljRHpoZkhBQWYzVktX?=
 =?utf-8?B?S2svTHRuUFlFWkw0RkIzaFN5QmZGVWl6L1VnZDBIT0xoOHVuMVFzRHNzU09q?=
 =?utf-8?B?RFFIS1NkNVNGMitNcE54aENrUjQwV2lYSG1iamZidnRwQ3NoVkx1OHlqNHBx?=
 =?utf-8?B?MVFkaW9KblRkOStmVGp1UEFFc2NQMW95M1F3S2V2YjBySWtrQnpIeWZFUUlO?=
 =?utf-8?B?ckN3RjY1b3lHM25tb1htVUpSUEpBQmFvaHlqSjhWSXVIaG9wUUxwUVBod1Jw?=
 =?utf-8?B?OVVmZmRLN2tTeEdtM294Nk1SeElCRlIzNnd4NXFzMWl6UU1YektWMS9udDFI?=
 =?utf-8?B?RnNVcEJKYjlneEVRQlAxK1hJTTFicGhjRlRVdDVYQzM5Wmh3RDI0dkRkYklO?=
 =?utf-8?B?RnNuaDVoVWx2alNuK25XdWN4eCtibjMyREtCMHRWVFdXS2x5eWJRQVJ0b2JN?=
 =?utf-8?B?MEgrK3hIS3JWUXlLZHFORzc0VVFhcFlld2pUVzdJL2ZuSmgvWVMwcHE4Y213?=
 =?utf-8?B?TUdYT3FIWFczT2lqTDRyK0s0MlBoR3haNnBLb2V5YktRVllBeW9kNGlRaDdC?=
 =?utf-8?B?UzlJSXF0YnBjRkJUeS8xNjZEclZGakxyMkgvZDBYNyszWkVMY1h3eHU1ei9l?=
 =?utf-8?B?RE5rb3pJVlQvTjlPaDZJZFhuTkwvY1B1ODJXdW5sdjk2SHRXdVR6VVJNRThD?=
 =?utf-8?B?bmx0ZUJUT3RxMmVQTStqVUNWM0VKdno0MGNRWkhmaXBNZm1NTVliNGJubXJ2?=
 =?utf-8?B?ejNOMGgwNTV1bGtqSitUWnBXc2lKczV2TWxRSnZOQ3JiSjJxVXUzS1FpbjRH?=
 =?utf-8?B?YmNaQytuNlNucEVpWDFvQ0dhbkRlRXg0V3MrUjlacTB4V1dJSld1aFNwaHN2?=
 =?utf-8?Q?iJt6MVsPfKrHcFGgjVU1yi6kT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf686c06-e8c9-4805-9754-08db72f8e0b7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:15:45.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaCaNTLlFZVnBYkTTgWGn4eDJ6J3nhMR6f44Ft3862IIM2lJgF3AS1wie+76AvbE8X02lfiCU9EHow5RAR6NBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8728

On 21.06.2023 18:25, Andrew Cooper wrote:
> On 21/06/2023 5:19 pm, Anthony PERARD wrote:
>> Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
>> immediate evaluation variable type.
>>
>> ARCH and SRCARCH depends on value defined in Config.mk and aren't used
>> TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
>> sub-make or a rule.
>>
>> This will help reduce the number of times the shell rune is been
>> run.
>>
>> With GNU make 4.4, the number of execution of the command present in
>> these $(shell ) increased greatly. This is probably because as of make
>> 4.4, exported variable are also added to the environment of $(shell )
>> construct.
>>
>> Also, `make -d` shows a lot of these:
>>     Makefile:39: not recursively expanding SRCARCH to export to shell function
>>     Makefile:38: not recursively expanding ARCH to export to shell function
>>
>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>>  xen/Makefile | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index e89fc461fc4b..9631e45cfb9b 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -35,12 +35,6 @@ MAKEFLAGS += -rR
>>  
>>  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>>  
>> -ARCH=$(XEN_TARGET_ARCH)
>> -SRCARCH=$(shell echo $(ARCH) | \
>> -          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>> -              -e s'/riscv.*/riscv/g')
>> -export ARCH SRCARCH
>> -
>>  # Allow someone to change their config file
>>  export KCONFIG_CONFIG ?= .config
>>  
>> @@ -241,6 +235,13 @@ include scripts/Kbuild.include
>>  include $(XEN_ROOT)/Config.mk
>>  
>>  # Set ARCH/SUBARCH appropriately.
>> +
>> +ARCH := $(XEN_TARGET_ARCH)
>> +SRCARCH := $(shell echo $(ARCH) | \
>> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>> +              -e s'/riscv.*/riscv/g')
>> +export ARCH SRCARCH
>> +
>>  export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>>  export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
>>                              sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> 
> The change looks plausible to fix this issue, but could we take the
> opportunity to dedup the sed expression into a $(call src-arch ...) or so ?
> 
> Except, given that ARCH := $(XEN_TARGET_ARCH) now, doesn't that mean
> SRCARCH is always TARGET_ARCH ?
> 
> Can't we simplify this to just be plain aliases?

Or, putting it differently, do we actually need both TARGET_* values
when they match other (exported) variables anyway?

Jan

