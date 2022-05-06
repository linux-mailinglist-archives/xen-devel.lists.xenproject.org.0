Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB951D5C6
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 12:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322893.544363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvGR-0000xl-9f; Fri, 06 May 2022 10:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322893.544363; Fri, 06 May 2022 10:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvGR-0000tp-6G; Fri, 06 May 2022 10:32:47 +0000
Received: by outflank-mailman (input) for mailman id 322893;
 Fri, 06 May 2022 10:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmvGQ-0000tj-3W
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 10:32:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd8e699d-cd27-11ec-a406-831a346695d4;
 Fri, 06 May 2022 12:32:44 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-P7C1Xv04M2qGnW4pGDcwJg-1; Fri, 06 May 2022 12:32:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5825.eurprd04.prod.outlook.com (2603:10a6:208:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 10:32:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 10:32:42 +0000
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
X-Inumbo-ID: dd8e699d-cd27-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651833164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBQaB2sZPb208sBnZSPd/XKVkSsfPTM0ag6+UNZh5TM=;
	b=j28tnklILJ4O0E/RoW9ErrtN6RfE7tMdcf8Lt6CcFD0a0+ThajhJnZuOOu1kLzzYdqadkD
	LpjWEHkCFOnIMBUBj4RjiMGv+0c5xt5c9Hco61dP4I4ZPlQFHn8CTqXUBAcMDGm/vUZOtu
	4EgwuiDm3a7SydiyUuukV9B8g5WGRmw=
X-MC-Unique: P7C1Xv04M2qGnW4pGDcwJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw0B3evi2UOinBV+dqtVJWmb6CMYS/Xa9R4KKNF4MStljy7msSF4tQtY4GDbEj8Kdc/EWQ6bZIx2AYKTgvOr8ZccO+tIpST0mcNxbBLGW3L+EpkHnMoYsny6usvRAcbXxUARJvuiI4JNGKjEgt/MzFKHKi5iRvNI+coVsq5IQwbgu2u4M2oZWModkFMSys7s5aGgl0E9VPHtOF8+c5fIVzhKLNMw42PUTXZQJoNvWLCrIT81E+me1f1wujHOQzKU7pviNgPzTbLgD9j3vQC02pMyIvFtU1Ugsifc6Ogy+yE0FsxEXaodHWPGRd8EFwiQ8Q+ZVndw19yFLw7vW3zrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBQaB2sZPb208sBnZSPd/XKVkSsfPTM0ag6+UNZh5TM=;
 b=akcWXf7K0r/ZHmGdpK2r41KWlP/asRT1QBn4wUMINHmcHYMfcwEToHoXcwpEaQkZ5Bit/qOhY5FoqvOOHH0VNh6JMSba5nCOIsWPVO8HS3beipYbGywEqFgdjbpOOhqujk5n7d62QGGpOJ1Urfsh3FW9PaSE+7pegeV/iYSi1Kews+Kah+KKW9lS3ZPaE9bPD1PCpaq7b4G55EbMLTztLUe5pYZQggYoHVs02qiLPR4fMHOt9kYLTQKDJ3/7/hnt8RnjWLgepGnmqwJeUKut6X8VYl5S7OeCVQgKYHifK2uC/PRGLe+Uc706bZA3e3B3cRJ7pkmQJKKWzga4p/i0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a44bc43-c392-2eac-d350-ec87cb2c3ab3@suse.com>
Date: Fri, 6 May 2022 12:32:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Wei Chen <wei.chen@arm.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20220506055201.999277-1-Henry.Wang@arm.com>
 <20220506055201.999277-3-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220506055201.999277-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e51bc2-4986-4bfc-0484-08da2f4bc023
X-MS-TrafficTypeDiagnostic: AM0PR04MB5825:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5825837156E68C4B1BA30F68B3C59@AM0PR04MB5825.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	od3py4I0Hcnjg6u7j5iGYVWwzwcWswG56UtVXI6ch/JhPjUEPnWChgg49b9EdOm7JXjotSsO9mjDxX9wzDTSR04XeZfcZMq8Vniub9Cf1xlHWC1FBc9nhwNgg0AyRqqtGTjCqd56btfQfdyX6V2O5jGH7Ug+e5xt0lHLODJTGZhpOgAUecZG8/XY+kdWowM/0hgGRFpOttNUS0EqDbUuOLcM8MyuV5p6V1FM2KARiREzFZADByoi9wTqaMA2+UpPrCOinGZ2mrqSsfqYapis03ahfxbBM+ezq45QsuSMU4j4Uc3HniPbj3mfFqq+CdvgcDwIW4LY/g3eHIprStDMCVC8cW6K9YEpXlX8JuScbwElIMtuke/N+0g5O8Dqpi4ldrmSQSxFHDj9HwWm430ka3JNcWQs5y7ESX3QBt4PbXeZ7n6SFUb3sWfZ1iJ5tzm4ljnfSJB/m8Wm3svc4gY6j/o08mb2k8Mwb4NJ48bUhENKnK/TPCf4Lnp55O06PGhWo+1zG+zOQ+GHj3BZxdVvmUR7zVeXisr4oTBEAuKwcnu44k1n71pxq/IzIhB8gb5jhz+i960wyuN2f2oGjTE2GDVJYlMVZ+Ua3nC5uRhKy3sAH38yC7oXwXU85uNGVzHDFjTY7azQtZYrkf1pcnhAudb1rvphV/EATc3b//FNxDEqwYDr99WVAw+BwP47OGrsGuOVKqJ1yOK4mK7xV/5tnOgtvVS9SaIXjj4j2FMuwXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(7416002)(4744005)(6486002)(36756003)(31696002)(2906002)(5660300002)(26005)(31686004)(508600001)(316002)(38100700002)(8936002)(2616005)(54906003)(186003)(66476007)(66556008)(6512007)(6916009)(53546011)(8676002)(6506007)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enR5TjQ2Y2F4M3NlUjdnUDRzTGt5SitDZlVVNjlqM0VTZHJEV3lrbFArcjIr?=
 =?utf-8?B?MVBnS1lHZUU0dG1UNzcvL3hZVk1KUXNVVTU3OVdhOGxBOUxHUUZxZUVuSVcz?=
 =?utf-8?B?U3BEeEdSWEQ5Wnh0L0hxTmFwa20zaXdRV2lIcDZtVFU0T2I5UFlybHRMU0p3?=
 =?utf-8?B?b3cyWjRFWHpFcmxxVmlnTWVPd1FLMWF1UkFKaEZPcDR4b2M5WTVqWDFmamM2?=
 =?utf-8?B?SGRRVEdBZjUySDhEY2EzOGdnOEpaRlM0SUJoVkdTcU9KVENmS0hGRjR3cmRG?=
 =?utf-8?B?ajd3MzV6N1AvNTRNK1FQWVpOSDNtQXN1NW51NWRuZm9uZC8waERjTEwreEFM?=
 =?utf-8?B?ZGFNai9QaGtSems1d1g0VngvZ05xMFpjYXFZQ2EvWHkwcmhoMUlNSzdyUC9G?=
 =?utf-8?B?L0VyMjNKSjA5WWJWN2haWEJuVURIaC9OUFl6aEhuT0FkbTFta0tIU01NRmQ3?=
 =?utf-8?B?VXF3YUM2Z0ZnQjhjbEl4QnVxLzIwYklCeEtJQ2pzZERXRFc2YUhtekw3a3R2?=
 =?utf-8?B?U2dJZmNRYW5nT24yNFlQRTA4WEpiYUJhZHpaclJwMko2YkxTYjhubGFFcXRU?=
 =?utf-8?B?WDBOTlpHdndCMEN4SkFkdk00ai9mSEh0OVMxbG8zOHlkd0NGbEl1cnZteVds?=
 =?utf-8?B?QS82YStScWJjWkY2SmZZZHNqRUF0QWZOdFU0NnozUUJhS29BdlFRK2V2enEx?=
 =?utf-8?B?TW4ybG1jeHhHbDFqcXJVejBGdGgwQmx4OVRYUThpaFpOSElZdy92ZWJWeWg0?=
 =?utf-8?B?QjdaOUIzMmQxVHRnTU1VdlJVNjBtWVVXSjU2OW5ZVWVRR3pOQVdwZmFwRnNs?=
 =?utf-8?B?REtZVHVjbURoWGdQenFDR25wL3Z3Z2lJMkFOUW96OWpGb0oxam94YmdBOEhI?=
 =?utf-8?B?QWhiUEtPSWxoTWIvZTI4bjRNd0EvUkZrVkFuQzZVa3pmeWNsSFN5aTFiQmI0?=
 =?utf-8?B?SjJSTFc3ZnF4a0VQeFlRN0ZXdWZ3T1Y1TVZyS3BGQVpCci9ndlRaam02WWhZ?=
 =?utf-8?B?aDNZaVFOZ24zZWl0bklYUGpVWWUwc0lqVkVyTGlzeGRIeTNvNUlseVd4dFRy?=
 =?utf-8?B?RzN3SS8zd242S25XREJPQkxyUWRJNE9HTENlUVBWQWEvd1NIU1ZZSmk5N3RH?=
 =?utf-8?B?eDFDOHRlZnpiZlc4TlJDR0Z4dm1FWHJUdmRxV0lDNDVBNmJBbDV5VVEyc0tS?=
 =?utf-8?B?NUlXWUhxMmQ4TlNjbExNbXNCc3phQmgveXY0dGVLSzVyeUg4cS9DVmdwd1VH?=
 =?utf-8?B?dXYxb0QxZ2Mvb01pZ3VUbHhSU0R4MUxRYVZaNUZoREEwSWNRMmcwQ2M5blZh?=
 =?utf-8?B?ZlFWMTVmRnZOMmljWXhGd09OUG5yMmx3bVI1ZFhFNVJBL2t4Y1pBdFk5bVBr?=
 =?utf-8?B?dXVMRW16K016a1BkNUFoa000Q2p1WEorRnNFSHNoM0wzVkFLSnBIYWswQjMw?=
 =?utf-8?B?WTJqQ0djLzAraUJINFdLS0l1V1dybnoycEhENFdPZCtmbUV0NnAxR2IvNTR3?=
 =?utf-8?B?emtGYmtYQXRiWTlIZjRuTW1PcGF0SThjTTlXZ3BtcFJSNllDeFc4UEdjTmND?=
 =?utf-8?B?ZmJYVmZoU0JZdGVCL1NWZVVQWUJzMmd1bHFXalRrQytwN3BiTGMwZWFjUVZ2?=
 =?utf-8?B?T0RISXBxdWZaM1ljbXdIb0x0RWhnbTBEak5wczF1V0JMMmJ4cTBKaUpQZFlL?=
 =?utf-8?B?NTFJN2JhZzMyRXRDdi9ieGlCMlNHWWgxZFJiS2lGYjBzZzA1emtMdDFld1E2?=
 =?utf-8?B?cEtHQUxXMG9TVHJQU0ZNbFE5cGp2VS82d0w0QlUrTnVGUkRXdkNCN003VUdl?=
 =?utf-8?B?clFnS1owcU9nY3Vydy80V203aWFlV1FNbDRPOGR3QU5DZjRhTkgrTCs1TGQv?=
 =?utf-8?B?Uk1laXdiblcvckc3dnoyR0pENGJoUC9tdWFsL2tFbnNMTFhQbjcxdFN2REEz?=
 =?utf-8?B?WGR2ZUxibFBMMlpzVEZQY2ljSkxvNXozNUEveEQ4bjVSQTZ5cjY2SlNWVTFP?=
 =?utf-8?B?YXV5NG9rd1lTL2lsZ1l3ZHpITm4wT0Zwd0RJaXROTFV1aHJmcDBZYXlyeWRB?=
 =?utf-8?B?R0JLUjZLMDA2aStlREpzQUQ4c0hHMnJNVWoydjZWT2ZPRXVRdXU2czVmV1k1?=
 =?utf-8?B?REtmT1FQL3RPSXU4Y3hMK2szKzNCNTNzaStSeks1UEJSY0hyT1lQUTBWMTJS?=
 =?utf-8?B?Z21hTTNjcEl1UTJQbFRDR0gyd2lEWG40Q3ZJS2ppK0JYMFZaSWd2WkhlVHJr?=
 =?utf-8?B?aU12dDE4YmlKR0VWVVJqb0R4V0w5VTFyUHNSS2FkdUJEZnRWS2xnV0pzVmgw?=
 =?utf-8?B?OWR6UTNabWhnR1V1YUpFdHA3K0xxdnc0cHpnZXpvU08rOWdQOW0rdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e51bc2-4986-4bfc-0484-08da2f4bc023
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 10:32:42.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQnl2jgsSDxekHjnRFaSB1smdlIony63JY0I2eljybI0os69nHYsyB8wz00b9SpibsfzHK6uCi2sj+e0kYLwOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5825

On 06.05.2022 07:52, Henry Wang wrote:
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -594,7 +594,7 @@ void *_xmalloc(unsigned long size, unsigned long align)
>  {
>      void *p = NULL;
>  
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();

For one - what about xfree()?

And then did you consider taking the opportunity and moving both to
the respective pool alloc functions, thus giving even better coverage?
Granted there's one downside to moving it to xmem_pool_alloc(): Then
the early zero-size and error returns won't be covered, so maybe we
actually want checks in both places. In xfree() I think the check
would then also want to move ahead of the early return.

Jan


