Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22282638644
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 10:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448134.705024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyV0z-0007Ep-CC; Fri, 25 Nov 2022 09:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448134.705024; Fri, 25 Nov 2022 09:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyV0z-0007Cm-99; Fri, 25 Nov 2022 09:28:57 +0000
Received: by outflank-mailman (input) for mailman id 448134;
 Fri, 25 Nov 2022 09:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oyV0y-0007Cg-8C
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 09:28:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 945b391c-6ca3-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 10:28:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 09:28:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 09:28:53 +0000
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
X-Inumbo-ID: 945b391c-6ca3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7knIanIdZhIn5tyG55OIeGPHGxVOae0UINHrxnufLSv5KJTp9x0wCzIJpV0toVz92x0C29uouW+mWosx/ADvGMMJ2X5isKjKJ6SBYMFIyMEM6D7yDp5R7+B8j+KbXc1EXgCLin/n/k8qXdQgiGzZeWzGLuM+4ni4BTRuB3G+6rWBDCzXujxu1X84mCCLTUlcejIzaNQG/SWVvXty63Wonb9Ou2CIwbQ2uvghJEMHnO5Q8w5xobZ4Ve44pbkk/ikW0vqdbOCGxlMb4VqdMAuxmAZ6eyJM/a1dLz2jZhJYK+QoXZI6nu5hEL/ptbVbtEdA2a9WCrmEE17/PkpIa6YLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPyue251BK+G2vemnLqNepnkO7/seUcFG+WjoH8+TZs=;
 b=mD8AEuZDqipoQyLKmywdRc7Y7kCf0RuKAqVScCz+BMWvdJaKll7LhZ11chk7qLGaGvZpK2jjEei6V0LdLeSVcSPYal4LjJcVvwiOQ5QZ/ewB//AeUG9ivULqEgWHXzLHP4Tw6HbmYFwvbGA9HV37XH4iwoJd3JMcFTDG6qubCiMzRfXEc9Cb9MMkOqIMsxRQEffmUVrgtQdR+uqHRWyNRnLMUzMh/63UpEA4mCOhqJI1CyTaFCOqGHto+ovrmVf3icV+0Df48W0iANUjUp/yOvEakZHOFaiUhklRuKsUi5mrV3hvB9+3cpa1N/Fua1vlexh+JEiuHmsHuxERG0+XMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPyue251BK+G2vemnLqNepnkO7/seUcFG+WjoH8+TZs=;
 b=qkV5rcrgNCp/rzRATtPvkuwQW6G5xN5b0tAEnhjUOQaEMgnpqEmbOEZIhl5QRzxz2ADT2CH4xBAII75l0L7xmStnur5rQqL4BEsGj9eN1E0ve8oWco+87fKc+ZHxzVw6ftRNgQpvl0kAx7C14ujcL8DyxOzZFH5cTVdx3bizdHaS57yO4BXAph3yPDnOVJZ+sK/fbx12wqWQ6Baxggfyv7x37fXSTzCu6YbGjPVUpIfS7v0ZLbiboEr8hdg4KtMnaaQ1IgEmlOLrUGTOgU/ERXcwBIwykGjW36Siser7T/3qM6QXW4ySFaMVMqjH1gMnTi23LGKMLzE11YLa3Wqaiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c84ff394-cb16-937a-c2dc-d535d3887f4b@suse.com>
Date: Fri, 25 Nov 2022 10:28:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework
 COPYING for installed Xen public header
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221124164254.33476-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221124164254.33476-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8de151-2e5f-4166-0713-08dacec77801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q3TWV1vu85gBvb+4U9TRqDe9IU+M3rejJytveG17X96ZHPFs1GLa8d+5KczJ2V5tPxz/hrGDGgpxLWq5LEiJBMRfOhWpeNmhoMYriodExmpdbefTuccoYviPDS0IGJ+Te93WgZu6/v2Nd7RZ7ohyLw+hh4BVnhJ/QC3/1aEjO81rkGjaElDNeZQaP7zRHUAQBVJ98dTSHSuam+Sb3QdAmIJyxhaDPX/9ralMCm0kmJrm/nNXcdffsdeIur+NWRSU6GqznF0Shr8XF5ucbn/Z8mhqOaEVm7p7a/+AQscrQrSzBfINVj5N7ud0eF5/y6ZIxAY5vzLsgMb1f7cd/vv+Q3QWtYI88rJpqsgxfHHTyzBtFSOvne49svmimbENmjSUJmFxg/aeb0W2VgKcjS3HaXR4xX33F81Xu4W2mUf/VanzC1y0QN/Jyx9O+eFz3ZNYJeSrYMjoqIMm/VREPXLeEtuIiExObPbuZA4AcndK8A18g8eiYWSVXI36Vk2UnEPPjSy77a7KYdVt3LJPx8OKMn1yvhx8VOhM8sQRl9fUTJkM0CfGm+ygZMjoeQ6C8M8OUQm7KTrZQ9OCbUMc3JI+CdNyJrN9vzrRkq15OjJ0lbzVexeq3o6T9azA3jlBxpTpdCQFjk6U4PXAConIqwYUtvArI07iqKk8ruKjuS8p4sHbtPKfuDo26pNIZwwKnjTv496FXna2s4TpJD0hPWvFDB+kdfMADsblvrNQvehK6DI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(366004)(136003)(376002)(396003)(451199015)(2906002)(31686004)(54906003)(316002)(6916009)(36756003)(41300700001)(8936002)(66946007)(31696002)(86362001)(5660300002)(4326008)(66476007)(66556008)(8676002)(6486002)(478600001)(26005)(6506007)(6512007)(53546011)(38100700002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXRRQWRsd2VYbUNET3VUMy9wZE43MmZIQWFMeU5qdlgwMEZzRWpBaXg0OEJy?=
 =?utf-8?B?ZUtObXJPSnZtSHVNUEdoWXVYeDFFV2lhM0pLRzhaL25MUUlJamEyTyt1cmlp?=
 =?utf-8?B?cXBoSW5odEcybUoyREJBa1hKeE1TbW0vWjNBNGZOZ2NsZVFMK2ZjTFV3RFBz?=
 =?utf-8?B?Rm1IYzAzazRqelBKNWRRL2xncUxzWnA0V3lmTSsrdlhmOG95RUhxa01NVkVT?=
 =?utf-8?B?elVjTFYxdmVlL2lsTmFmL2NyVXhma2lGZEpGa2lNYnRXOHhYTEo2bGxWRFNp?=
 =?utf-8?B?Z2k1bHNnN1p2cnk0dWlWb3FXSUwrWGZmc20zVDZMTVd6aVNEZjBKb0dNNlky?=
 =?utf-8?B?aGRrTWxGWkZSYWpZVGtKSnEvSk5zcWV5d0l3SXRhc3FkTWVXMmVNd1hKUkNw?=
 =?utf-8?B?Zm9RSm1xRW0rQ1RLZy9valJzR1lVckpZMUR6bm5Cejl0ZmxSYUhPdktwQjA2?=
 =?utf-8?B?czVaQ1gxK1Y1Yk96VXhYZEJnbHFnbGRSdC9oWVZjSkpoQWZPR0JQdVBjM1Js?=
 =?utf-8?B?WnkrOUd3MHZKVGZkNHl0WW5peno0aGJKUldQRGJLOXpYTnFVNTUySHZsRXE3?=
 =?utf-8?B?eVNXUG1tT1lRMDlJbGZha3YybzZsWWFKOHhEb0E4OFhCSmNueTUzcjYzTGU2?=
 =?utf-8?B?M0NuRFVtdFhpRnFrVVZxM05pcGJveEd4VDUyY29oTDRTakFwZTNHRzdrcjZ0?=
 =?utf-8?B?SjlFWXVzZjV3Zi8xb2hLT1kzSGRNeUxseHA4TGpaNEJlRURxMlZteW8xMmZo?=
 =?utf-8?B?NVZMTGRhSW52THpRT3hWeGxSRm55Ti91OC9xNUdiRWJJSUZvakwrRWpwd1lY?=
 =?utf-8?B?alltUHhiZ0VVSXZNcXFRSlBTZldqdEVBVk1FL1dTR3RYdlpJY1c1RVZWT1oz?=
 =?utf-8?B?SGVubUZJWFdvUnNvOXJFR2prd1R2dkl0M1BaTUJnTHRyNEFDbUYvV1N1QkNV?=
 =?utf-8?B?SEJWMTFFdGVyb2xwdHc5aEJSL0R2ajRlcHdQcUFsOVZuMTVTMC9rOVMxTWd3?=
 =?utf-8?B?LzQ5TE9MUHVmczQrUFh1dS9CU2tDMS9Wb1hyOS81MXBrSlo5S1J0WWZKd2E0?=
 =?utf-8?B?bDcyMmNwSy9icHZKZC84OFJZTkorNlM5bHlIV1dMblZGZHJUR29ZS2pZcFhX?=
 =?utf-8?B?T2pPV3JkaDFmMjJ6NzkwOHhSTGR2VSs4Wk5BYXVCMUZzVWFTaUVZTTRFbjgz?=
 =?utf-8?B?cndUMi9EYldQOEd1MnBDQTg4WERmN1A5MXE2Q05USk9UWTdaczZCTzZjN1pM?=
 =?utf-8?B?Vm93cU1yRTBVZHVlV1JmY2NSY3UzYks5RW5CN1ZEbVliYS83UlB0UDFqZU5F?=
 =?utf-8?B?MzZNaVYyZjJRbFB0WFcrdHpOUU1tWUZZS3loUlBYcVlYWWtBRk1SNkxFSVIy?=
 =?utf-8?B?bHlXQm5MME12V1NYVU1SYXNBTDBLcVJ2b0ZNN1VLS3czajI0MTErbDl1T1ox?=
 =?utf-8?B?a2RDbzBXL0lVTkhIdTBWbVBuQ01nUnpMaFpucGFtL3BheTRJcFRLMXBoWU1z?=
 =?utf-8?B?MlBrSiswUndNMGxJMU5oQlFCTVZoSkhkd0RvV1p6QUIrSksrdWxDT0VLR3N2?=
 =?utf-8?B?U3p1dFkrcWlEUE9wYS9LbGNFVkNpbXp1dFZOTkdBOVVURHo3TFVNbkI0RnAy?=
 =?utf-8?B?Vi9jQzZaT0U0ZlNXSlcyN2NzcHZMM3Vmb2kxanloZVZNVDQ0QjBjS2hiT1Ni?=
 =?utf-8?B?dzBycjJKWkg0UnB6RTVmbHAzQ0Y0YnlXcEZtOGluM09RcnE4OXVHa0V3NnBu?=
 =?utf-8?B?cFVRaGpqSjEyMGg2QlRGSnk4bU80eGxLdEZXYzdVSi9tdHZJdHUzUHd2aG04?=
 =?utf-8?B?QVowRE1kYWJSMFVVSU83MW8vd3QxbVJUV2s2TTZLU295TUwyM0NXMzNpYzZi?=
 =?utf-8?B?STlnY2t4S1FCYWVJVTNSa0JHSTFOTGJ3cFBqWi9RUlVYbUpTVFk4RTVRWEp4?=
 =?utf-8?B?MWFjbVQxYkNBTFlLWkJ1ek81UUxvSVAweDZ6eERDQVE1UUNJVkRUeWxSTnQv?=
 =?utf-8?B?bHloRk54NlFlU0xOL0hSeDlFQnNpRURlZThkSEZDVnA5M1g3NS9JMmk0QjZp?=
 =?utf-8?B?d0M5b2lESXJ5QXY0Ymt0dm9YdUR6alA0KzNnL0Zvc0xBNVVWRGI3b3E4WUNH?=
 =?utf-8?Q?3ZZFWehDYw7UGaJRFiWkWjBU3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8de151-2e5f-4166-0713-08dacec77801
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:28:53.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaJ6qWKOPlgV5MY57vmCEUbDbeUw/9fnEMLcr/WYr1MdiEU3SGOfGFJ8Dafxo2KzflTYIjNpceoMvh6OUSUmTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

On 24.11.2022 17:42, Anthony PERARD wrote:
> Use actual include directory used to install the public header in
> COPYING file.
> 
> Also, move the input file out of "tools/include/xen/" because that
> directory is removed on `make clean`.
> 
> We can't used ./configure because $includedir contain another
> variable, so the change is done in Makefile.
> 
> Fixes: 4ea75e9a9058 ("Rework COPYING installed in /usr/include/xen/, due to several licences")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(with a question, perhaps just for my own education, at the end)

> ---
> 
> Notes:
>     For 4.17 inclusion:
>     
>     Doing `make clean && make` in the root dir is going to fail as make
>     isn't going to find the COPYING file while trying to install the
>     includes.

I second this would better be fixed for the release.

> --- a/tools/include/Makefile
> +++ b/tools/include/Makefile
> @@ -24,6 +24,7 @@ xen-foreign:
>  xen-dir:
>  	mkdir -p xen/libelf acpi
>  	find xen/ acpi/ -type l -exec rm '{}' +
> +	sed -e 's#@includedir@#$(includedir)/xen#g' xen.COPYING.in > xen/COPYING

Any particular reason for using -e here?

Jan

