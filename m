Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF58766968A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 13:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477263.739886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIus-0007C6-NQ; Fri, 13 Jan 2023 12:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477263.739886; Fri, 13 Jan 2023 12:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIus-00079L-Jx; Fri, 13 Jan 2023 12:12:14 +0000
Received: by outflank-mailman (input) for mailman id 477263;
 Fri, 13 Jan 2023 12:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGIur-00079F-Aj
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 12:12:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80b8d274-933b-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 13:12:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 12:12:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 12:12:08 +0000
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
X-Inumbo-ID: 80b8d274-933b-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHQDQTCGZfldRvjcqP9EiqYB3H4a0NRgw7GyA2XVOhE4th5FqkYdGORZwTbyrkZ2FQTkf5upfCMlYWIWkbniiQshG6awJQ8NDDpPGQMh7ldBBjg8fVjRRkBi+esHkje3nvbWmUkxoKoR3CZuAzoBu3b4ELhrjzZFJjkx5xMjdLLf8/HhmS8b7+odVkKnrhgxrcMuhmWUgOVaO1xgUvW/CJt+Y3KNHKwfJIZXfZJJai95Jq/Tm0rAvWNei1+J2Y6kgB0bQ+r5BzJPdGhab0AghomWOjyMdtln9uluJuvflGuV+4QpkWOz64pN6EV/1slGTpOAmV/7sKYGt/W5C9rFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jLHwocxj1mglFArwuvTQcMnn2Y2aw8W13iWvIKC528=;
 b=iyZtC1lqcXxiq2By/3NNKzr5lS4mhrKhji+UxSa2LigCSo2NwMZndzKSUjqv0HzPenG6rGyG/v0O7rupoqVsBEhdNty3Ws7WzDGq5ElyDfNgC3RbXBptvHiwQZYxch8kWKYA3QDW9mWQlBx9s5Jj5vw5lz035JTlwgb/kieW50EGzV5U3q/5cfnuN5YZF/y/V6z20DDLUXzqX3W9UL3NYxw902Q9aJAXSrOplSemQe75jsdoHNTuaMRKrlmO4MHGDUyx3LgAvVSb8Do/fmqv6DNTiMB1wj0iHde9k5mnzvy3DracO2ICyabnaDE5vLD8+atRN21LUjNWrxQoQ+t0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jLHwocxj1mglFArwuvTQcMnn2Y2aw8W13iWvIKC528=;
 b=yYce8kiaumkCtNiA4bWMoZxUGp2goYwRMJbDw5T9/4vo6jo0vebxTEbLK6JrmqR+9IHiJkX/tIv2qw8FfGleIzX1OXeIsWEmfKI2itWhDCEi4jKGSRHeedZnLsZAKfhq1Hj5r3NeFNm8O8iPUJSAgd2UY7xg6fzbhOHYdBtRGWAavWLCZU9UQZkmA8CzXLacQvjQdUZD93Qaf59lZcs3tOq3inS4S3Z8xsoPOHc8aUgXzT2RpsfTH+kfIfUdKX8MzsuY4uONFsj7c06nGdUVroBCrjMR413lxU0Dh4/SAPz0HGB2em1a/+Ix9qr1UUjXWdWGRlrhrEbH7IsCz1afCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <512d8768-28f6-d9d6-c1cc-18c5fbf2a636@suse.com>
Date: Fri, 13 Jan 2023 13:12:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
 <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
 <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b29b9d-5cf0-4a53-ba71-08daf55f644a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fqsYwF8+u4dpY+K5Eo8UTdGP9+DlDZoRwesVZZoAYOTPwSxOLb1CRyxxhoe/XGuN/J/x0pwIqZLK24S+/ZDS6Fo1IWUTzI8kmCDTTVMdteZ3CC8i8DdHZnAY00kWtQVglQAQKrqsNIk4hde3CU468wOhV9bUdMqBXp1jCwNxiwPY2MgQfUqBKe9Amj1j6benMYM9tCILwX4q76RoqXaVn8uOLJELQGKx6Ggj4fT5GQcWkd5ArNp1E7ASFe9GpFRCJGrfJZpRI4+xQ6wR0hwvTgou7WKAJnv5mqaOSbm+Wqd/uhz8b6gSCusDCOjV3OEubyeUDNk6B7PjWIZrJeU+7YKves77H2S6J6pxvKaqdhiTOi7v4S1ZIGqnAhdrKc5jlkWEEvLK0UCxEBlX6XXkRmhbfVnWsSmPEyh3zZBeweoO1Y4+sOrR0OSd6JbAqOQaKeN5fQTSqE+IfQe8wknpoEXG7MiLcUtHI0GSBN3xhbvEf4nEDY/RDWumAW2XIHc5RjANpRzinR6OaiPctsyUpOryr7hgAdq2yREnYY5+RoNGgKWRXCTYcPFju2eeC56L5+j9yPMUmWHfKFpsoKn0sW5ut/MMj5/IloqVtCBHgVQ5NA0pN4dJOczpB+qFq1BlNzhx7Qtp/0lSDznYeaiLvRbe9X89zY0Q/G9gI2a8xhhstdTcDKPX6rYtnCvpg+ZEyU1mN3OegT76SOCimHLy8hCkvOnylJp7dg8zD6XmZ8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(6506007)(53546011)(6512007)(316002)(6486002)(186003)(26005)(478600001)(83380400001)(41300700001)(5660300002)(8936002)(4326008)(6916009)(66476007)(66946007)(8676002)(66556008)(2906002)(38100700002)(86362001)(31696002)(31686004)(54906003)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FHR0M3WUduZEdlQytsVWt2REx4aDNhdHBvd2hBM09yZW42eGpHVG05SjJW?=
 =?utf-8?B?czJmVXNpOW9qMm53QkxaeWFMaVpFV1pNZUZONHFoZFFPV3FDaUFuU0tESm4w?=
 =?utf-8?B?OGVRVEdLWWNqVkFkTVh2Zno2SVBLUjlkNHpac25rQVBXSDFCY3NFVnpBU3F4?=
 =?utf-8?B?alVIWjlvVFZLMWxNZmFFTy96Ykw5UjNSeU9PbHVDd0ZmL2pIQVFHczZ3enRh?=
 =?utf-8?B?NDJhcHhBZ2l2UWtuMkp2Q2VKRFUza1ZVMVVsUGZsdnZoNjJXaGE3aFk3amN5?=
 =?utf-8?B?QzR2ZTh5eUhtTUVidmZUYno2WDF6K3lnSWhtOXFaTEthTUt5NGVRa2w3WEY3?=
 =?utf-8?B?YzBLRjVXbHorNkNGL1I3bkk0dW5aaFl2UGpZa1l2SUh6ZzdsV2h3MHpudGR6?=
 =?utf-8?B?cE1DalB3QWlDRytRYXRtb25FRFJ5bFBVaUN6RUZpQzd4V2s2SmpOK3BhMGhj?=
 =?utf-8?B?Q3lKZCs0WENxSHZqOHJJN05kRkRFcnpnekpmQ1J5L2VWYUU0UE81MmRyT3hn?=
 =?utf-8?B?UEtvMnlQRFMrMFd5Nkt2YXRiRG9BN3NvWUNyc2pqL2I4Zlk3SXkyaWxzY1FC?=
 =?utf-8?B?Tk90a0U0dXpEWlRvTWRLbXJ0NzJZKytocUtESXg2WTAyam5yT25ZZlBLQkl5?=
 =?utf-8?B?b3licldqRmdyZU8zSEJYaGhZcXlmY2VIQit0dHIxcjUxV3Q4VnlxNkhzNW96?=
 =?utf-8?B?eFR4UmR0bGRhN2IwSjRuWEdicEtCOWhkaThIQkZGNjZhbmNvUWhrUG11U3gx?=
 =?utf-8?B?aEJ6QTJXZk5NbUFRRE9JL01RRnJ5MUxjSEZMTUZvMUNuTXZuZThERXAya1Ez?=
 =?utf-8?B?REVUZnhPaENLUDhIZHdFaysxd2lFc1kwNHBlY2pmNkVoWlE0OStpRDlFU2Zp?=
 =?utf-8?B?V2E3dndmVTJVNTBwT0hESWlTQ2t3bzNZYy8wRGFyUFl1a3k1YlczNXRPVjdI?=
 =?utf-8?B?UnJKSitNbGlYZjBHZ1pObG1FTytFc1RaczByREhyL0UvcTMxOGsyN3d1RDB0?=
 =?utf-8?B?UlJLQ3hsWFNnMWpWK2ZYQmhMZlUzNW4xejhCNGpxS3lJczdZc3NCSWEzZ3d1?=
 =?utf-8?B?elZhb2ZyeGRuYWUvamZmNTgrbTRvWHQrOUtHRkY5TEc4eWkxcGNPWHFXMU1l?=
 =?utf-8?B?dVdmUGhDR3d1NW5DSGJERFk3d01hSk5WKzRLeUNvV29ndGJFVkljWGxhSlc2?=
 =?utf-8?B?elVQSVhSbE1NRktsMDNraG9qZ1p5Y3ZmOVVEa2U1TTJMald0OGNxcy9KanA2?=
 =?utf-8?B?SW16TCtONTJiZkpsd1NXcjFzQmhoYkJZdG1xeGdDTnMxV21PbllIUlV2SVYr?=
 =?utf-8?B?cWNoTmw2ck0vd3hWczhqeW1DTytNTmVPQmExSG9UeFJlQmFxaXBLczBRNGJz?=
 =?utf-8?B?dFluUjB2ZWV1aGsySk9qamxKeDZWZ0RkUGRPblp4dXRKeGk4ZHdrK2dHQnAr?=
 =?utf-8?B?clhMYmJHWWF5MEFrVGZyc0piOVFWTlZpOXlOM1FtVDB1VVV2d0xzV0xkaEdu?=
 =?utf-8?B?SlcxVnM2a2NNbWl6eWVHNDdUQ2FSREU4dkVjNUtMakdKWHZRajVYandPNUxP?=
 =?utf-8?B?QTF5a3Nnb0VLam9Rc2tyWS80UURLc2t6cCs4MUZGTTNEM21RVit2aGFwZ2VS?=
 =?utf-8?B?WGw2eEZ2UzBNY2VGUjZITzdrdkNzejNFRnFraEx3ZVN4b3BXSEZwdy9HTWZI?=
 =?utf-8?B?UHd4MnI2Z2dKenFMczh1WE5sRE1RSVBXTFhVR0EzNG8wM01ub3NabHp1Tkt1?=
 =?utf-8?B?OC82aTdhNTZLR096a215NmMya1AybHNQaGU3eitvVlVCNjgwRE1yZVNKREc5?=
 =?utf-8?B?QmtXLzFrd0k2bndHZS9HVHZyQXorWm9JVkY5MHJZU0hsTjFYc1RObUxuVDJL?=
 =?utf-8?B?V1pHb2dPVitacHdKNGVheUxlODNqQW9uZ1VLUFk4VW1IVTMrcEp4UmhsUEpD?=
 =?utf-8?B?ajVicGsyUHkzblJNVVVRVVVOYk9wQzRJSXZuNytibEFEQmhhMG1MSG5neUJS?=
 =?utf-8?B?WWZnRDN6M3VpVXVWZExqNEhEZ0c2ZDcrc2dCdFFqVFBkVE1kaVZPMTJvdzNJ?=
 =?utf-8?B?ck9MemdLckxHcjFCVnFMZnQrVFZudkM4YkU5Yk1kcDIrN2JjL0hJZDR4SnJX?=
 =?utf-8?Q?tUxY/rIbjuHPB0xVjZH4EOb+k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b29b9d-5cf0-4a53-ba71-08daf55f644a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 12:12:08.1226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Clo2W+/5w8qE7/VNl8fpi3/ph6rf0+Aqs0wIlHyhvBNNIkioEy+fjCjYESTRH8eM40Oq8b+sgD59EpBbpYAEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962

On 13.01.2023 12:55, Xenia Ragiadakou wrote:
> On 1/13/23 11:53, Jan Beulich wrote:
>> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>> On 1/13/23 10:47, Jan Beulich wrote:
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>>        if ( !acpi_disabled )
>>>>        {
>>>>            ret = acpi_dmar_init();
>>>> +
>>>> +#ifndef iommu_snoop
>>>> +        /* A command line override for snoop control affects VT-d only. */
>>>> +        if ( ret )
>>>> +            iommu_snoop = true;
>>>> +#endif
>>>> +
>>>
>>> Why here iommu_snoop is forced when iommu is not enabled?
>>> This change is confusing because later on, in iommu_setup, iommu_snoop
>>> will be set to false in the case of !iommu_enabled.
>>
>> Counter question: Why is it being set to false there? I see no reason at
>> all. On the same basis as here, I'd actually expect it to be set back to
>> true in such a case.Which, however, would be a benign change now that
>> all uses of the variable are properly qualified. Which in turn is why I
>> thought I'd leave that other place alone.
> 
> I think I got confused... AFAIU with disabled iommu snooping cannot be 
> enforced i.e iommu_snoop=true translates to snooping is enforced by the 
> iommu (that's why we need to check that the iommu is enabled for the 
> guest). So if the iommu is disabled how can iommu_snoop be true?

For a non-existent (or disabled) IOMMU the value of this boolean simply
is irrelevant. Or to put it in other words, when there's no active
IOMMU, it doesn't matter whether it would actually snoop.

> Also, in vmx_do_resume(), iommu_snoop is used without checking if the 
> iommu is enabled.

It only looks to be - a domain having a PCI device implies it having
IOMMU enabled for it. And indeed in that case we'd like to avoid the
effort for domains which have IOMMU support enabled for them, but which
have no devices assigned to them.

Jan

