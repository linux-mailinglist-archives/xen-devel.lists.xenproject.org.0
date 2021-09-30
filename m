Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9041D4B5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199484.353573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqn4-0007Yq-DX; Thu, 30 Sep 2021 07:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199484.353573; Thu, 30 Sep 2021 07:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqn4-0007WD-AI; Thu, 30 Sep 2021 07:47:38 +0000
Received: by outflank-mailman (input) for mailman id 199484;
 Thu, 30 Sep 2021 07:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVqn2-0007W7-FY
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:47:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acd36a3e-21c2-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 07:47:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-HnYUTLfINT6vVIUT86yEDg-1; Thu, 30 Sep 2021 09:47:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 07:47:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 07:47:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0089.eurprd06.prod.outlook.com (2603:10a6:20b:464::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 07:47:30 +0000
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
X-Inumbo-ID: acd36a3e-21c2-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632988054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEi8YCGoQCMd3c0uBLGf8bg22g3wYRC/W5+8MykFD+o=;
	b=Xt+B+ofSbMjt6smFfe4Y2c8vScHPIs+MHTP+D4XlvZBIkbX6is30hGxz3XmpVE8xvGMTuf
	2ibTjQuIEzUwirwMYenwVTxzDA+xvdP+hRNqIfs6WFqIqYOS4sfyUa9gWI+W7OUeE+xbaZ
	CAgsqmGa4s6QSsSEHsLXa8rcXhr+fJE=
X-MC-Unique: HnYUTLfINT6vVIUT86yEDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk7SdqfppdGZzjp+6m3i7iBD24pwR/eivlmK79uoxUzuCMOi1WDogT8kj6pIZf4Nfl7D39U1DkZe/UsHa64F7WvtDqqaZVROYwCeNcGIq0eOeksJ7TMSlYR7Cic90PCLYuojy2KpbZIV1asBHZz+2/fMi0fxU+erEQeKyS1x9TeOew1rWFZ/0eHO/XDc/SmQLJ9/rh5WLob3NYgRIjsBpCLDyjWYZ35Uoan5W0OGxF20CaZ5ezutBFCC+BN0+g2CDvszo+s8v+oBcPHVHh/MrPF6QG+iA+FhbBpCG5HM4Yp2IKKEqyRZ6I7RsiBDfQtLE6EWuXcehD13fCzSRGmWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rEi8YCGoQCMd3c0uBLGf8bg22g3wYRC/W5+8MykFD+o=;
 b=Jtb5Fvg8EDXGr+/2WggMy1APWXiyFshtxoXSOmpBHazCv+aEClvVev8nvioo/oFxyWtDQ7tU6jOjIS9fy0vXyzpRoNMFCuPsdgycudA/LLihTBygNfMwYNqyZDNAF0Xq4xCVNLh7kbXw1gY2BNnedvwulMBHpUZecpQcXb3emRZNH2vrFRDdZqcOjEuPOrzwkrBgOFP7pOPk+5cddYVRZtLGsY3y2YoT2vS9RlUbt4ZSG4cyl+xBi2TP0/vGYrjUGlovZI7s31bA60uopBi4uUSb3L8mve2NO8nxQ82cwg8FgirZFY8BfQTQodaFMhwbVp4qn4sMRusEFL+WPWFbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 11/17] xen/arm: PCI host bridge discovery within XEN on
 ARM
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andre.Przywara@arm.com, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <a16e90a04ecb722e0f6c5fb8f9a9b0129b4fe96c.1632847120.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109281636420.5022@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adac8bc5-2af3-ccf0-0dbf-6e17d21f6ee1@suse.com>
Date: Thu, 30 Sep 2021 09:47:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109281636420.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0089.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac8ac913-1c06-4f2f-b22e-08d983e68e9b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31182D4AAC3DE4BEA7087208B3AA9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0bV15i/1X09UuKz/LYtGQ75C73J3VWHA3FyIDHPoTDC/WrjcsRuD2NF8fn9S19ebFBsqNR7J+WDXiq8x893TeNpEE699/hh9PIZLCceMw9nD4BKSSn8OBTwfHC4D46HjpLUlTzxgTwFrcEwK2F72FE9YIXskw0xCvRxwYwHPpnIghi/3ptWKcPP27F5d8fwbWtHeg6zSh+MCLM7FeOv9f3bP8O07fl68qm8t6G86qjUQYapw8mAHjrJefmWuzkUrXm2jBLHBKNxPaHLWoiAtdMLi5Rrn6sLiWVFqSEDXyXRztLJulva567fBzgRUEKiP5KaBUp2FZc7UfH6XYaBFoj2iobDKEjkMiBZBod6TH7wL3eRLQ44AYNejvXfVtZ2WynRyv1He6IVgJ8sWgooJzbzTbxR08M5vqdBrBGlyldNL3slJvGpLbYCnXCNyNBxS/Gu3d7YCQVKZpAsCmX1PUiCTrsDN8Wanig5prfKZEVMF0pxoT/ysg7ca1Zv98YsGn01xyboZtxZThQJbnG3grTTJsacb37iZTWiOaTZsEE358jI1ifgItOnZAsovPeifQaY+97O5AAAC/YnyHLsHtLs6JAEpKmzGXdbzDQiwPtRiUImec+g/06qsYjptDhpQ5Blo1xvd+kFYpDgcoGPhBxOAvayNJcmKtKjTC6X0k9NHqNMZ9X5V7ULkfCPj3oeDG6J7bKZvsd/XdgiTB2XJvAESDI+CL0FDDf4ZHKNluUNbrpyx4TnnNBLfSzx79oUTlJcqoURLYw09tvXfe1Uoi7JvGeL8Jx6p+9PmHz46R0kaNHUo9aa/Ce9BEaExo//qol+oRRypSoFaRG12nY5SSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(31696002)(186003)(110136005)(66946007)(66476007)(66556008)(6486002)(86362001)(4326008)(54906003)(16576012)(2616005)(31686004)(36756003)(2906002)(956004)(508600001)(5660300002)(38100700002)(53546011)(8676002)(7416002)(8936002)(26005)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHkxV25uS25nclloUzVhT01MSllCT1dQZlMxa3BiRGZLUUU5Z2tQWS9NVzB4?=
 =?utf-8?B?YmdXeFZJYUFYeEF2MVVsUGJBa3NrZnZKNmJnTHlVRk9pUGxldDR6ak5oeFA2?=
 =?utf-8?B?dHhKN3BSWVplc3ZlNVZtNnd2dngxVVVpbGljc1hoQzUrY1p0UXcwczhUMTZi?=
 =?utf-8?B?eU1NTG52aG5ZaXBsU1ROWmZLL2JHOUxpUVJBcmt6cDJyamRCRGJTbCt5eERF?=
 =?utf-8?B?L3A5eUphcGRhcmVXSzVkWXdzWDNVdnc4SWp1K09EdU9rT0dCR3lEV1FjcGsv?=
 =?utf-8?B?V1pUVUxPb0k2QUxReldaMVlIWkVWV0hsS3VmcS9CTytMcFE0Vk5MSHBYOVBM?=
 =?utf-8?B?TlNzRnhvRnZ6dGsrMmQzTWtXWEV3MkNWdHlOSWpkSWYrYSs1WHBpQ1FGNnJo?=
 =?utf-8?B?UlNZbmViNklwN01tVG9mcGUycFR5cE9aUTJkQzVkY0hwY3FtTm5zV2t2MjhT?=
 =?utf-8?B?NjFLTnFNYWRHK3QyMWgyMllQL2xiMUFJK2JjcHFuVnljeXBBY29jeTY3dTlV?=
 =?utf-8?B?R0puY0wxVU4walM2UVdOcTBXU294TGlxUEJxb3ZvYnM1cnh2NHUyNVZadlZz?=
 =?utf-8?B?NXNWRlIrWCszVk1EK2NtaVBxVDFGSGl1T3BFZGRWRVhnS0dncm9VN3JXOG1N?=
 =?utf-8?B?dENjK0ZwZ0lvdnZiUm9BbDRORnFkOHZMVUNiZGhOMzM5bHhvSDBvQXRZMmRu?=
 =?utf-8?B?MkFFcUR1K0ZkN25aaWVHbjE0K1UreTB3T2cySk0xaHhnVUdYdmxQSzdvbHV4?=
 =?utf-8?B?Vm9sWWFMTkduRXpwMkhGZlRCaWd3dlpNVWEvYi9DVTA5SnovR0I5eDM2WUU4?=
 =?utf-8?B?M0NyVUxQb1FiNHpYTHdqbkFkbFIrMjlROTFZUEROYVc4dU95c3cveldhZnU4?=
 =?utf-8?B?bndzSytza1N2UVpWRUNUNFNQNU5adFk5VHRLa2tMMnUzaGY4dGRPR29QWlpY?=
 =?utf-8?B?V3NOeXZMYzlLL3RzN2UrVU1DT01oZGRYazlvWHBMbkwrSVl0bjkzUTFSdzdo?=
 =?utf-8?B?TkxRK3RnVy91cUM5U0Q0QXpNUEswRkhhMUZqZno4KzRqelY2MzVLMHJoc0dP?=
 =?utf-8?B?VDhHMG9tUEZaRFZOK3l5YVJ4c0xYVi9ESGJIZWRJSjZXL0lUUXdxVzJ6N2Jm?=
 =?utf-8?B?R2NTNHN3cDdlVGFTSmVTSklFdkQ0YXFDS2JkODZSNUVtS0JFL2xOVk5iZ0pZ?=
 =?utf-8?B?YXh3emZIdXR0NkROUlZWTFN2aUFSa0UrNWNkanlFZ1crY2Z3S01HSDd5TWoz?=
 =?utf-8?B?elorS1kvOStpZnNnSEMvZUt3NFhGZ3JENnZaUmVodTA5UDN0eDlWQzNML2la?=
 =?utf-8?B?cjU5Y1JVcFZCWGxEdDE1MHRBcGwrLzZqanJWQ0Y4UDBRWlpCb2t6WitETHdv?=
 =?utf-8?B?a0RTNkx5VGt3K3RWa2NUL0R6L0dDQTRNQmU4VURhRUlkVTJVYkVVc0ZsLzJQ?=
 =?utf-8?B?SUNwbWVtbDFDdFhoY2R6emNUV080WVRZMlVyMzlwYUVpNHArTy9QNTkyNG9y?=
 =?utf-8?B?YklWdk1tdXl0YmJndUR4ZzNDdlJVZlF1cm9BOXpFUzdLaTc4ampEV0x0M0k5?=
 =?utf-8?B?aDdnVFdxWVA3VkNjbzNyMjJaWUFtdjRCZUg5STF2Q3VDZ1JkcFJ6SThHRjFB?=
 =?utf-8?B?bmIvYmFkaG9LYkdEWVJBelBaNkl5cnl3UXVhL1R6NWpQK1JYOEk3SE1zaW1J?=
 =?utf-8?B?TGZMdUJVLzNXRVJ2OGhHa01SbFZJc3FFZUViaWlZVU9kZzhWL2xYb1hhMVNP?=
 =?utf-8?Q?ThEw9fLiZDM8STcWCWfP+SJKw84Hl7/AiUSOFZj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8ac913-1c06-4f2f-b22e-08d983e68e9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:47:30.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JsBZFwL3dwCcdR0q1i/K7QvAH3aSVQuA9kF5wjDsHhlGwmdq1fcfrGGpmzOKaJP6ugFt9HSDmkDqAhq6SLBQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 29.09.2021 18:40, Stefano Stabellini wrote:
> On Tue, 28 Sep 2021, Rahul Singh wrote:
>> --- /dev/null
>> +++ b/xen/arch/arm/pci/pci-host-generic.c
>> @@ -0,0 +1,46 @@
>> +/*
>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <asm/device.h>
>> +#include <xen/pci.h>
>> +#include <asm/pci.h>
>> +
>> +static const struct dt_device_match gen_pci_dt_match[] = {
> 
> This could be __initdata

__initconstrel then afaict.

Jan


