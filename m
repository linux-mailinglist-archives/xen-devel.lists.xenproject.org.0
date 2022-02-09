Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892814AF37B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269201.463218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnX2-0005fq-Un; Wed, 09 Feb 2022 14:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269201.463218; Wed, 09 Feb 2022 14:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnX2-0005d6-Rk; Wed, 09 Feb 2022 14:01:16 +0000
Received: by outflank-mailman (input) for mailman id 269201;
 Wed, 09 Feb 2022 14:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHnX1-0005d0-Oj
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:01:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be6c84db-89b0-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 15:01:14 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-SdOogXoENNWW2jztnP04HQ-1; Wed, 09 Feb 2022 15:01:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5267.eurprd04.prod.outlook.com (2603:10a6:208:d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 14:01:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 14:01:11 +0000
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
X-Inumbo-ID: be6c84db-89b0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644415274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5amoCfjhU59nhUznhyRPozLp59hxbfkFQLxJuIYR8Q=;
	b=DJ9zVl/KfFg3SCxP9sdstJgSP6NKmW8CW98wd8VT8x1ArBwN/9wmmI2powGHxztrZHHWus
	59O0hzu2XO8tRlCJ3ypjZwHA8AODuhgAm1wNSOpwC2/Amroe1EuFKoBUS2SZXhl3fL9BYn
	0oUe3rrf2jURi3yXNpzzikdkaasOU6g=
X-MC-Unique: SdOogXoENNWW2jztnP04HQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCFSVGMnSqScD08/HkdoSI1QYEScnliFD05fGJCkX20NGvH2Es/Qva4YEKeFmAwmllt1Ew8p9twNytI3s3b3YyaruwBCqRsMj9Lv84YxoyqtR7rmLZQ4EJyFMS78jgZ1ydPY13cIHu6iyj7h1P5BgK4rMh6sMp6nxSyhd5zXA1aZeWMQtapiqN2KT35LF7rXcupYQlt42S5QVE5jLqjALMpdRxD/+AwIER1S514kdiqV8k1XTL/GEkcQGncj6ou++CGPepPFINhbPkriUn6EYHSJZMyJWof3fMs3z5uLc5e9UBJ0N9e5xpttyAAdwHqCFfElxMr6Iy+HqKob2ThAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5amoCfjhU59nhUznhyRPozLp59hxbfkFQLxJuIYR8Q=;
 b=XykOymlZ9sYw7DNxM7a0uN3wjuA8dMb7hDfFcRpEuTun6dxCDljFJEVlx82KDzd0wLLM4pz95cqxCFRdF3LKUM0ZL7eUNy299A/1c1FkMxu51cdBEA+bBxQTWGKobd0j9RaCKe/FgJMGMqxCDMrYDtJtg4P6LRwLPijI+RoeFtuq9gK2Sdjw8tH08onoO7jPUbW5AwbPtACozToExVGsbKAcFkgIafkgg1srofGU45G7KChhDkxeGqsR+PdavGznu5jHDy+LWU67Re4wQrzL1UrspScLoESLFHaozDZjX/KeeTo+Fh0nBIMC6T871W8T/cKGKs7Lr5zUhxkM+lFgVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9319cca0-d437-fe55-9b13-967bcd3ef4ac@suse.com>
Date: Wed, 9 Feb 2022 15:01:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
 <0b3068fd-d06f-1135-7b84-5400cca0d3de@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b3068fd-d06f-1135-7b84-5400cca0d3de@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfbdf4da-d9f3-4a7d-c7e0-08d9ebd4a08b
X-MS-TrafficTypeDiagnostic: AM0PR04MB5267:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5267FA83453797EF1B197A56B32E9@AM0PR04MB5267.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hxvuDtaIh2cUHuAYkf8BYkG7CPS6B7QWByeArIXfR3BuF+hrzJF+mjXbkQTAi9cjz09achHpUKhMgtuLf3jFi2buQXOypEuX5XRF8wwMiErejgQOuim4YYJaUdPAeaou2pKFCHEnwwbivJcQohoQabLLwHBtEicF5ItwcOj94F2xb9SbqJux/G+VZNVg7vlwVUvCWLvYQFDDicdspnZ9mNwaoxlIHSTCbJRqKp3e8of0z/wd231f/3DHep0sfhFSehfGbe32kcZLxjv/NsTSsecjAt7GRnWo4hR2J/pFLKnLNR+zIcAg+i3sp118jxcImi6UXC2q69TRRwzjlGkh/j9lE7x1rN6eWALie4D+t0xjoJovTGfiet5Wvh8J0IghQn5M/8xvv+aemWZsHh4TjEcD8h1jO78Q1+5wLRXnCqlQ0rk+45DJWGdRyrqq+syz1HF0mZcMYdXqSHsSBYMNGfy2tY9ZEzDl6Z7t78Fmc+etXIOfNSZqxCW/5Q5ibUq4c1AOI0qlu/m9bm7RqCBLRdnSffg3ZSijkLIDjl25Zxl3VPuEKsC60uaBkcToQ3foRLVUY2iAVBTDfxc+cLxZtfO1fZPZVX1QHzPRi0fOPabX339HKI3iVOM4v23EGMEmfeemmuqqRFp1+jmtCD9jXD5LCZmSx/SFwc+K25Gu2eJYtUtNetwr9juky3JOdVHkrP0dDlzrCnFZiJ9YfDRpGJVQ2mXoiRWPqAjhISpEnYkk4f+vcixKEhNUFZ4/ulyp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(66556008)(86362001)(316002)(31696002)(6916009)(6512007)(6486002)(508600001)(53546011)(2616005)(6506007)(4326008)(66946007)(2906002)(66476007)(8936002)(8676002)(36756003)(31686004)(83380400001)(186003)(5660300002)(26005)(4744005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MElCNHF3UVF0dXZaQ203SDBETEZGek1PajBncFh6V2M2THp4ZFBKT0E3NmxZ?=
 =?utf-8?B?WkRaOTIzMFVvUXBZWWdXMEN0WXR4a3A4Z1QrMSsxT3RrRnVvbjdvdVBzTG54?=
 =?utf-8?B?MTVtZzZ6Y3c3Qi9HTFY0cjEzTjRIS0hRdm5kM1o1OVhrbXZ6T1M0cHdJTnk1?=
 =?utf-8?B?N2N6NC9YV1NSbXdva0k4T2M5OXVVakVQcFR3N2V0YTlLVjhidlFhOVpYWUkz?=
 =?utf-8?B?UjQ3M3A4V1A3ZG5JeDVzOVNTVHdURnBxaVQ4L3NWallQMC9QL251NHFDLzMx?=
 =?utf-8?B?YWhMRWtHcGd6L0JzV3lRTFd6UTZrUURsQmFOb2lqVllFSlNib1lraGJFWTJ0?=
 =?utf-8?B?YndFWTFvSjB5SjcrNjc3bmxBaVFYUDJOaWNCNlFSeGlQdDRrVERBZTVtRCtj?=
 =?utf-8?B?WGIrMUsxYmRGY1JnMm1WNWRMWnFqek5yNDFpb2tPMUFPaUhmNlVjTHJXS0cw?=
 =?utf-8?B?OUEralMrMW05QUFYTG5OeHgxcnFFUHJvUkZ6UFFVcHhvRlplRHNWUFFkeThF?=
 =?utf-8?B?NHJRZHo0cVFUc3pqWDdIcW04cjgvVS9NN3hsSEs1NHRNNjMrV2RXOUpRTHpu?=
 =?utf-8?B?Z1JCNklXNG80bFZsTG9ZVHZ3cTJ1SjVGck1nbVF1R0ZSQmdnd1lUTGoyN2lI?=
 =?utf-8?B?NEkrRDBVTG5rQnNDbFZyaXE2Nko0MVhhdWVCUWZWWTBIajFTd1hMMFVidk9L?=
 =?utf-8?B?RzdrSWF5MCtGVnpsZmVhUFRET1BmRzQvWnE5UHlFemNpdDZoOTBMcCsxSUM4?=
 =?utf-8?B?ZmNveURtdkplUVo3NVdOSWlBL1gxcU1zdm5jMG1PMHZodTBNNlhOSjM1N1Mr?=
 =?utf-8?B?OTgrQ1hyU2Fvc3VrUjJsRDRTSHNPOTdZUlc2WHVtR1g0WmhUMHNDUm13cExz?=
 =?utf-8?B?OUVNeTRKR09DR1BGNFQzajJNSkE0Snl6VUF6Y3ZXcWFWVDdpeXB0WEgyQ0Ri?=
 =?utf-8?B?WUI1dGNOWkFNSXdGZHRKRUt0TW9xT2wvQjV3dDd6YWR0em5EeTBlNTZrQWhG?=
 =?utf-8?B?M1o2MCtqQnQydzR0WlVncGpiV3o2a01tTTVzUVV5SmhyM0w1QzFzb2FtM0h4?=
 =?utf-8?B?TnprUnVuZlBBWEZTRXhrRWtyM1pqN3hHVjVzK2NVRlVPRjJXcjREQWtBMVVG?=
 =?utf-8?B?UFFFWitGUDE4WElBRDFzekFXQUpsak5QK1p4eE12SXg2MHNteGpNZ2VHMk1J?=
 =?utf-8?B?bS82V21pOGtZb2c0QXQ0a2lSSFR6V1doQWRNK2xxdDIrWUdsdVFkKzRPWHM1?=
 =?utf-8?B?bW44VGVJMzYzN0hMQ0F3dDJDR2I0emRvK3ZuZGNhRkxVeUo4RVJNK3FXaHBR?=
 =?utf-8?B?UkFwOXQvQVNldURObEJ5anpsU09hL2pKZFNzY2tnRmVrbW90UzBRbFhsdE1G?=
 =?utf-8?B?QVBJcEN6Y1R3Yjh4UnNtM0xMWUt0UElFSzRSREk4M0o5VzQ2a2VxVWp3NmFE?=
 =?utf-8?B?YnFCcXJqODMrZGRXc3FucnNFSjBGd3QvUmwxVm9YSjcwZjQ5OEY5aGNQUkdU?=
 =?utf-8?B?YVI0ZW1mR0k2NnRKMDQ4Wm4rNzB4UWtpdm9ramtPb3psWU1pVm43Sk9pWnhL?=
 =?utf-8?B?L2VyZUhQNWRaTm5IUFNMeWVGSHN0NEhINm8vWGJNOXdtazQrMWJMRWptbFBS?=
 =?utf-8?B?NnBlL0FJQWk0ZWwxcE9rMlFSZDhWT3pQWkFlVVJYc2JSSUhLVUxBd0pqOXll?=
 =?utf-8?B?N3pranhVZG5tWGJ0SHl5NU9nSEpVSGxmUlRKU2ZRMnFPcHVVRkdEeThnRWZy?=
 =?utf-8?B?VEFQSUpjWGRWQkROaTJzOEJDOUlWMFV2MDZGMHhpcjdKR2RXOU9QZXhIK3A3?=
 =?utf-8?B?aUJYN0l1ZUJ3UVJocER5TXBWQURQTHNxd25iZDRlV09rRGswZXF6ekRUT1N1?=
 =?utf-8?B?QzRhSmJYUElrK0laN1VaWmFrRklQTDRHSUN2RmcrRTZzWFd4aUdmbDBOY3Js?=
 =?utf-8?B?K0VIN3A0RmtXd3l6TlJhbGlYVStLd1FHbEhXa3ZndWd0M2ErbjJ4QTRrU2Rs?=
 =?utf-8?B?NU5za1Rsei80WTIyamVaeUlwU1BJZVI5L3ZRb0MwZFJkWExxcnFYa0tpdjVD?=
 =?utf-8?B?REMvOGNFZjF5aTFvWmNtbENjY0FtNmlGaVpXTHpXaURWejlPUFJZQ0FaUE1N?=
 =?utf-8?B?MGppTU9kcXA2NVhubVU5UFdaVGpIcUFHaWRXT2gwUEVnRG91TkozbkVrRHlx?=
 =?utf-8?Q?cgmgQBFkUt274sbNjLdV4O8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbdf4da-d9f3-4a7d-c7e0-08d9ebd4a08b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:01:11.1088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgJjLAnDRIa1xsDOzOOlx167YXUMlJtV6bqHNmF1z8wZ1cU6pF8UcH0ccpKh3HAwjFiZKofG58HnYN22PmyuQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5267

On 09.02.2022 14:47, Oleksandr Andrushchenko wrote:
> Hi, Oleksii!
> 
> On 08.02.22 20:00, Oleksii Moisieiev wrote:
>> libxenhypfs will return blob properties as is. This output can be used
>> to retrieve information from the hypfs. Caller is responsible for
>> parsing property value.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>   tools/libs/hypfs/core.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
>> index 52b30db8d7..d09bba7d8c 100644
>> --- a/tools/libs/hypfs/core.c
>> +++ b/tools/libs/hypfs/core.c
>> @@ -307,8 +307,6 @@ char *xenhypfs_read(xenhypfs_handle *fshdl, const char *path)
>>           errno = EISDIR;
>>           break;
>>       case xenhypfs_type_blob:
>> -        errno = EDOM;
>> -        break;
> This will need a /* fallthrough */ I guess

Why? There's no statement left before the next case label.

Jan

>>       case xenhypfs_type_string:
>>           ret_buf = buf;
>>           buf = NULL;


