Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65F7A1797
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602928.939755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3QS-0000FR-KG; Fri, 15 Sep 2023 07:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602928.939755; Fri, 15 Sep 2023 07:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3QS-0000DK-HH; Fri, 15 Sep 2023 07:39:40 +0000
Received: by outflank-mailman (input) for mailman id 602928;
 Fri, 15 Sep 2023 07:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh3QR-0000DE-KB
 for xen-devel@lists.xen.org; Fri, 15 Sep 2023 07:39:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 046477e9-539b-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 09:39:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8118.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 07:39:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:39:34 +0000
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
X-Inumbo-ID: 046477e9-539b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1l3VI/uWF0Laa4DY6rze5xdw8vwBfkpkIXQXN3Qw4pNJiS+z3uFWDbNhBZEEqj3XP6iTw8aPO8PKnIvWqaVZfHLUlOdQ0o9eO6lnVeMuxm4/OLN4WEc0W6uiYB4qZ5E8plMkU6RtFXmqsrmKsyC367fHYtWCC5EogbGDycoFuVKmSF/Z0vS4yWVbpsLk8YAsWpBkkKD72L9iiowSfuZ1wY58LKhJv8/TFCy4GT5QYkheTXF1ZLuCvnQ5716f0slsgyKcHtub6ZbpXVdXK0SmQ7WAP9MvBhC3fHtv6IDrT/mzTGt4D5VYWJ3UnqvFfL3efBV+tu3XaoYyDLsZHgQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUbO3jjyMqfCYlCYF2jaaZHG/l3Wz9RYmwqLwnPxhBc=;
 b=k78y4YyipTq70qDBGQ7ui4/RI6LivlLo2+tqwy85O1dzkTZGRH7jP6r8B+XQmOUgJI+rnJf3xoOyTj2sBFA726swUqJ6zFIB51oXDpIs1lo/5vekZ94Rh7Lu4XTAtP6wRI+3efOniS5HN/wdzt+r8272KTuLQ0fAPX8jm7WyXxl92oRnnqJ5Co1A3JcvoNVIvfWe8wZne35d7HAMIs8GHdte51mLsfh4xVyqWz15r06Ku8STIl9aWD7jkVSAcMVpO4ywpPWzTDknuJglE8h8TWL/giZt6ysq8x2XZ8brb6jqFYxAyRUuJdArurLZiVE9Ltet50tMaItd1Hjh7yUUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUbO3jjyMqfCYlCYF2jaaZHG/l3Wz9RYmwqLwnPxhBc=;
 b=vmrNLErYKp9Ozk+EIrIWcwrtz/eHfZh8PPPTGxEVu2obGhjZaRX0QoS7xA2L8y7y1gxTwglCdm7VNnc9NRC6GJpsGyQ6iNplUHRsR84toGZ8/18NMSCZb2evPk35J55ChPZUu+BgD/TF0m/wqp3lA3hcDEooBX1Ldh3GnL0vLCIv3+deJeWlmeyb6uT9HoXyeTRCYnnrAL3PYK02G48QjXqX/oVKfu1vivdHebEp7TG55HM3MmonJlUkdi+2OqiPYCDrIDGMvm/U0agoZ44d6TxdpuXd0b+RKnWWYkOMTGwoOcQ6zKk3wu5gDEchfCEujWu2lITX5qLKrDtcdJey4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d5312cb-07db-a765-896d-b80e7f5f8bf8@suse.com>
Date: Fri, 15 Sep 2023 09:39:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: 4.8-unstable: building firmware/hvmloader errors in Bookworm with
 gcc-12.2
Content-Language: en-US
To: Pry Mar <pryorm09@gmail.com>
References: <CAHnBbQ_KTWXQiw7PuxzsiH563uCCNaJL6+VkmcK+V_n5M8RaPA@mail.gmail.com>
Cc: xen-devel <xen-devel@lists.xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAHnBbQ_KTWXQiw7PuxzsiH563uCCNaJL6+VkmcK+V_n5M8RaPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce661b6-3142-42d9-4bb7-08dbb5bee7f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fehgxMmAJx20z0AkjcbCnOvUGmhiW37JDPAIu3g5DrVjj1lQrAmvSbDfUu74BKySw+GknE/KFd3q1N8eDFM7xbAvW5gtckQsmGqFe013QZOb6yL+nve7bGL8U3yCqvVPVPuH2JFKPmwYOAxo2MNqET4iZKFp3Bs24qa04verXX96RKysYAhOaMxhaGE9c6S3o5Q9vk3laHh/UhEilsflVQAyz23fBMZZ46CMCtaC11Jpcrn7fRIFrCFOpTyBKsAmZWrFQ7iP46hc/H51X6LM4ITRP1hYuB2qwHRCLIk+O91Agltt45CNH88QImWUJHLyN3acjvWRvMakhDUbQf+Mq3lsTVwXnzhuLvfuO3ThSEoexfmMZ8/hSfENph3basVUFIbhjq+PQNlNNMCPSQ8O6wrmxjXPi19xn9pcbCJVNyHi+VVJUVusivwAU1ewsvbwmpmVPBya9Er/XVOmD5tu1tmRP9B759I90/kk/3ofRzgvV2YP510mQ1n9O4PY6ppTwsd6TPTBChc8awg6yNs/toacFsaEx5oivhRLobsu2scfbZM/z64JdoNsqMTF0oEyfdh5od1cHPkjQYGAf1ljvUwKLjJp7JlbZwuS2GNZJBEKFrXD5nHQXX/pdbjKiDixt3vT9gCxBfx5af6Ril7ySw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(41300700001)(86362001)(66946007)(6916009)(316002)(66556008)(66476007)(478600001)(38100700002)(36756003)(2906002)(31696002)(5660300002)(4326008)(8936002)(8676002)(26005)(2616005)(31686004)(6486002)(83380400001)(53546011)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkpXR1Y4anREQjczVDFaYnYrbFN3RlNwR2dXL0FyV29MTDF1S0NwNUJtWXBa?=
 =?utf-8?B?d1lOQzZMQ1BQTHVkRW9FN0syREFYSVlHdnI5UGFrK1JiQ3I5VnR1VElOZitO?=
 =?utf-8?B?TmNBMDNYZkNMZnVuNDZCTG1Pd1N6L1RPd2Q3ZjY3VS9RT1N1dEpxMHV2aGd4?=
 =?utf-8?B?LzhZYjZCM2doQ01tSWh2TnRlT0pwZldkVE03VUsxMkdSWlFlMTFXcVFwVkRN?=
 =?utf-8?B?cUJNQXBoZlU1WEVRU0U3OHhXZGcwdlE4SE5Wb0pnOUE5UkZ4cHBLYTlXU01K?=
 =?utf-8?B?SzlsQk83VnNSSEVpQWJwVGF5K0Y5VExlOTcrRFFqNG9BRktBSDEvN3hvVmNM?=
 =?utf-8?B?WUxINzhLVVNCVXFzeVVNWHAra1hZRjltbHV5UWhaUnhWYVNLQUhYY0x2RCtm?=
 =?utf-8?B?aFFvd3lPMmJ2MmEzMGUvbDJIRWc0UXFPVHBHTkdkcE5BOHlkc013ZWljMWU3?=
 =?utf-8?B?TWpjYnVmd2ZCcWgwYWNuRk1tU3lWRzB6ZitFNVhIS2UwMnVFeU51V0F6clRj?=
 =?utf-8?B?ejFLRkxROFM3ZHRxUUR1SE1nUEF6SWpNWXhmM1RTa3dqQlRKUTl3aThyUXd3?=
 =?utf-8?B?VjhYK055anB0NnFkZ25zTUpaMG9qM1d2TE5JSkhoR3ZmNmxZRURVa01uUEJX?=
 =?utf-8?B?ZUoxRUNsVDhMZVk2bTVCV0dEY2FHenNDV25DaUdrSktpdkl2ZWFUMnIvQk1x?=
 =?utf-8?B?RUxCNWpXSHhSYmRJM0xwZHdodFhWVmFEMXovdHVDdXVONXVta2JkMzh2ODFu?=
 =?utf-8?B?NGVvN2tqTm1TNzZLRnJndGpWWHJyTVd4eWtFZ2dSMFVDSDJnNTk1UzNmVzBZ?=
 =?utf-8?B?aUsxeVZqd09FaTFZQldPeVAvYlJTakd5eHpsVU90YWQ3SkE1emZQZ0xhQmVm?=
 =?utf-8?B?REpBUGFheWFGRzNPQWkyRUVqQjhYN0Q0ZitDaUJJRTZ0SnA2YU9UWlFBRExq?=
 =?utf-8?B?M1BaWnptVzlheXcyL0VMTkltQnJvYkpkaWptK3JZMnBrWStCOHZsZzAvYU9P?=
 =?utf-8?B?blkvYXJVbHoxemMyaW1DZ2xoZVBuRzJFT2I1WjdiMHpRZGxGWE1peUtWWi9H?=
 =?utf-8?B?N1BNbkRxTHNsMVFOMkJHRVgwUGtVb2NrdWJqSm1tWlUraUhma0RJWW5ZeDJn?=
 =?utf-8?B?ejdNRjloaXZBS0dwejR3YU04MWFOaTZGYW9DeDZ2andHMlJBUzNET3FpcXlL?=
 =?utf-8?B?WC9BWTZFeE0zQXR6VFhOd0dNN3B4dUhOTitIeWpJLzJ1SjRtYXJOUGNvMS90?=
 =?utf-8?B?ZmxjTjA3RUlYWW5KR1FQSDhBNTNLZmpoSVozUm9NajZRK2lKbll1bnpCVW5S?=
 =?utf-8?B?WTNCU0VWdGhvUjNkOEdqOFRyWXlZeFZnSDFSNDY2Z2Q3dmdQeU8vRGYyK3cw?=
 =?utf-8?B?S09xc3gwbDhaU3c5azU1Zm1vQXMxa0t2b1BRdHU5MEt2L1AwaTNpb2JaWjZj?=
 =?utf-8?B?KzFTMjRWK056YnRpTnhYdFl4Z2srem43UlBKNXpFZDNCckhWeG9IelNpS01o?=
 =?utf-8?B?YzUvZnJWQkhWcGpRUVVnN0hKTUorZWNGTi8vQ1p1K2FYOUpUU0NYZzc5b2FK?=
 =?utf-8?B?S1NFaU8zc2VVYlIzR1JXLy9WTWIwcCtRbUxzUElFNXBPTkpGOVlsd1Z5Njd5?=
 =?utf-8?B?UEZ6Ni9zdHBpUDg2dmNBaVNzK0RVMjgweXM1TktHS1hWR2hSMkNyMXN1dWRM?=
 =?utf-8?B?SDNWanlzb0RuN0F2ZVg2OW5QM053NnAzaHNKSGhwNDJHQkJOQ0lmby80Nkw4?=
 =?utf-8?B?bmpIeFFkZFltRkR5NWlySEtDQmxHZlNoc2NkakZmellFQjBSWEx6aDJ6YzU1?=
 =?utf-8?B?NnpiZitISkwzQ2V2WWwvMzBGckZQajcxR0gwRGhBYkhLMXhpYzRjejRNVGtS?=
 =?utf-8?B?YXg4U1F2enN4NklYcU1jWFlXSndaSzJlWEVSQTAwS1FDcTM5UFJadW5JeGI1?=
 =?utf-8?B?Nno3S3BhOEJRY0NUSS9BWk8yRW4wMXRuUHpHb1pxeVJHeGVaS0JxZk90K1lD?=
 =?utf-8?B?dTFDZzRjUHJIczJHbFNqZlNaVE83V2gzSXdQVkRPTFdtRmQzazhIN0xTZHp4?=
 =?utf-8?B?TlQwSXc0YTlrQ2NrenZJNjVLTWJrQjhkbFprRDM2ck4rUG9wQWlibTd6Q0Nq?=
 =?utf-8?Q?QCBFo7RnaUusFEcK61BYW1SCo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce661b6-3142-42d9-4bb7-08dbb5bee7f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:39:34.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kN5RgA8tPPCE2vbnAAyWXpu5YpSBwd5hI4CQIkhhnFa5xntLN5HH4N3RYcFgOf2jDnTRqY9G8vplQLie0qyxqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8118

On 14.09.2023 22:53, Pry Mar wrote:
> First attempt to build xen-4.18-unstabl in deb12 (Bookworm):
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.asl
>   9851:             Name ( SLT, 0x0 )
> Remark   2173 -          Creation of named objects within a method is
> highly inefficient, use globals or method local variables instead ^
>  (\_GPE._L03)
> 
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.asl
>   9852:             Name ( EVT, 0x0 )
> Remark   2173 -          Creation of named objects within a method is
> highly inefficient, use globals or method local variables instead ^
>  (\_GPE._L03)

Two remarks here, and ...

> ASL Input:
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.asl
> -  397476 bytes   8140 keywords  11139 source lines
> AML Output:
>  /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.aml
> -   73130 bytes   5541 opcodes    2599 named objects
> Hex Dump:
>  /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.hex
> -  686160 bytes
> 
> Compilation successful. 0 Errors, 129 Warnings, 2 Remarks, 2762
> Optimizations

... no errors here.

> sed -e 's/AmlCode/dsdt_anycpu/g' -e 's/_aml_code//g'
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.hex
>> /home/mockbuild/pbdeps/xen-4.18~rc0/debi>
> echo "int dsdt_anycpu_len=sizeof(dsdt_anycpu);" >>
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.c.tmp
> mv -f
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.c.tmp
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmlo>
> rm -f
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader/dsdt_anycpu.aml
> /home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmload>
> make[9]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/libacpi'
> make[8]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/hvmloader'
> make[7]: ***
> [/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/../../tools/Rules.mk:206:
> subdir-all-hvmloader] Error 2

And then a sudden failure here with no indication what has failed. Did you
supply an insufficient fragment of overall output, or is there indeed
something failing without any error indication? Of course it also doesn't
help that your email is hopelessly damaged by undue line wrapping.

Jan

> make[7]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware'
> make[6]: ***
> [/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware/../../tools/Rules.mk:201:
> subdirs-all] Error 2
> make[6]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware'
> make[5]: *** [Makefile:37: all] Error 2
> make[5]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/firmware'
> make[4]: ***
> [/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/../tools/Rules.mk:206:
> subdir-all-firmware] Error 2
> make[4]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools'
> make[3]: ***
> [/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools/../tools/Rules.mk:201:
> subdirs-all] Error 2
> make[3]: Leaving directory
> '/home/mockbuild/pbdeps/xen-4.18~rc0/debian/build/build-utils_amd64/tools'
> make[2]: *** [debian/rules.real:218: debian/stamps/build-utils_amd64] Error
> 2
> make[2]: Leaving directory '/home/mockbuild/pbdeps/xen-4.18~rc0'
> make[1]: *** [debian/rules.gen:57: build-arch_amd64_real] Error 2
> make[1]: Leaving directory '/home/mockbuild/pbdeps/xen-4.18~rc0'
> make: *** [debian/rules:24: build-arch] Error 2
> dpkg-buildpackage: error: debian/rules build subprocess returned exit
> status 2
> 
> any help is appreciated,
> PryMar56
> 


