Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1377EDFA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 01:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584952.915869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQGU-00012o-PD; Wed, 16 Aug 2023 23:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584952.915869; Wed, 16 Aug 2023 23:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQGU-0000zz-LH; Wed, 16 Aug 2023 23:49:26 +0000
Received: by outflank-mailman (input) for mailman id 584952;
 Wed, 16 Aug 2023 23:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG9s=EB=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWQGT-0000zt-Km
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 23:49:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 868fa5bb-3c8f-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 01:49:23 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 23:49:19 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 23:49:18 +0000
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
X-Inumbo-ID: 868fa5bb-3c8f-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0dYzEWEP/ODVIt/A88RT2q/zGlCxPY3FvwXBKZntBC2ZcBRQzT1rWrJkz4YcZEwlXrEAtddgllf0q1DB8o4Dcf+62gzh40fo+OlFB7U2lu1N/EHAB9cMS3Vh1KgOcMy4Bahg8qZ1bDPS3Biu3+4LwuMt/EKoFLChwzUKPtWaN5lSH39LCKmTNdecM9sodP+ckLVbbAvxQlxS7wcqwc7eHWMGgs3DHLBJkRTfVY5MrDIui5MQXq+59/1ErnsWZT+cgxUFldlluKWvetnOvKAcMtyf7dRJm97VVNj3f9ZW0nWFJt5lSmQ3BuS2q4xV/9eX/yaJOwk9lDRikkSPoDm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv2pDIZT+BdcNGyfqnnd9d4TphEMH5kdaDyRiKt7+Ok=;
 b=jjtWANc2VTnKth3zMvYVIsB7cGu2I/10y49ezryP6Im2cOUdAcWYw5/em88VsW5Q3okD4wcp50yRQ/QjswpxVGyyo3ruJhDat622Qacq7/0Pqx663JwiV4PPxI+CtJbtes78kGzZkWqdh4Co0Xi1bYBbBtzt823Una2JfVD9fdHRO8V0G3iblxE49xJimoGt8BQ2c16fcrA1XCulraqqJENjcVLyHSI7uiccB/DZ+PqIdmrKy+FWxszMQxXimB+Mfz214JZhoOKCvpB+iiucRbXY6R9jk9f8do1riAndhlun4cJ+7g6TTB/G6mFLdFWrY7M7v6T8jcsdoVqQrF++SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv2pDIZT+BdcNGyfqnnd9d4TphEMH5kdaDyRiKt7+Ok=;
 b=JcA/bFrSUlFX9lF0ssTPao/HcKr0QJ3J7RNP3zXVXayc6C7VIeddYNr6NjLvXtZO4pscv9XPYg55oUrk82Jz5wfiiTzs5x8P8Jjpkhnha7JHhxKNyZ/y6mpfB+SaRZQP/TLOUCj5xtyp+ptT/UIm5M+dpQu2OTJkc+mPads86Es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 16 Aug 2023 16:49:15 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v7 04/19] common/device_tree: change
 __unflatten_device_tree() type
Message-ID: <ZN1ge4pmAmcllhov@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-5-vikram.garhwal@amd.com>
 <ad9c88a0-bbbb-1ef7-0104-d201468897e0@xen.org>
 <308f68a8-9eb5-87d3-aaf0-61a6af33fd33@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <308f68a8-9eb5-87d3-aaf0-61a6af33fd33@amd.com>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcf0fc5-a8f4-404b-9526-08db9eb36807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ilNvQiVi25I5RFOtaQofE7YIWosoZttW50mgaJkjgUdIVchOTewaIpmCHt+yI5eJWM4dh3WzntDW8YLC8PhDwHSXGWzfAWtZ936KMZxU0wXaxVRkn5+stiiRoS7mvPO+HeFP4g/yr/GKl9ru5ItExpHjsAZmWiamMrMpoqoXnEUNhO0PDiErc/Gka3eKoCJmy+VabLYsK5nBS3U62wXDfgwtR70mMAEgFI99cdHgEwsXK6UfHNdtRi03SZazDXWDwGTUTjnCpuppK/iCy/H5s2FuXIAP6FNxw+ksfhv+aJ4+mKV1cXGi/48GErOLN4SpwBf6fD0QjbFfBjKbSewnn7H4hisH5gX64WtrwkkebjsfamAhLTKCqSLgGeTWfKJagMDPf4XQpSvjEq3E1N7a9bcq16j1bFiZxRi99Gd12cNrnFJsL24X+9B76sdAjOTe1bVHzOp7eVECmyCuJoFheULb+wrhfeQabyy/B/FWQa0VFWMgwyNJeYBmCCDI0UV/J1oPus7w68LGELuqBHPNwNVtFjvbmUHg3J7y9CDv68aD9VoNy//9xtp/LApKRo8t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(66556008)(66946007)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(36756003)(6506007)(6666004)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2VXQzc4NzdCbVpZTzNBRU5Mb0F0L094UWpUWXhJTExSVlhqOU9LMy9rUG5Q?=
 =?utf-8?B?T2hYalJLZ0pWZWhoMVpNaFd3cmhTVVVMcFpLY0NOUGVmckZzUnFWdU1JeEtJ?=
 =?utf-8?B?cGtGQmtJWW5yZ1RtdGhuREhtbkdvYUEvM2ZJNmJ4OWNKODZ4Ry9IQ2dxSGFH?=
 =?utf-8?B?ZjlMWXhPNnZDdk5ldFNkWVRGZE5MajZiUG03bDZTTFJxVW1tbVFYcGZxWW5h?=
 =?utf-8?B?UTVBUzc5d3YxYy92SFova0E3bEtwaldQQ0NlZHBJUGdWd1dBQVJWenJGUHc5?=
 =?utf-8?B?a2JDbFk2SVp5eUVHREpMYTFEaHZTbURPc3V1UVk4NlRvM2JUM0tmWTdYVkk1?=
 =?utf-8?B?TFRlT1VNZXpZNEcrck0wcHRoT2dDeWdYLzFzNjNiTnZ2NERYalBHRFh5T01t?=
 =?utf-8?B?Y3FaZzNNdXQxV24vOEpmTWlTYU9NQTJrMUFkZFlvSWlQYjVSTEtmWTJIMFZt?=
 =?utf-8?B?NndQTzVLN3Ewc3JQK3VCSXl2ZUEwMFp2R2ErM2VxTnVlaG00aSt3RXRJeUFu?=
 =?utf-8?B?U0JsdjB4aHZjaVdVakowZXlKVDdUZFFVOFNQenQrTkRPL3FreXNRNDE4SHpi?=
 =?utf-8?B?eHE5ajlKQWNJV013S0pZN3RxVXBGL0xhTU5jeDQ3UzRleEt1WVZ0eUk0bVJ6?=
 =?utf-8?B?WVBkaW5xc1FraEJrY041Y0hXOGtpUUxRMW5jUGdsOTVaSU12TlQ0Vm45YitJ?=
 =?utf-8?B?emt6dkxxWVZCT1VJUThkS2lTc0FhbWN4Wk5qbDI5UGFYejBaV2NRKzdrWUhm?=
 =?utf-8?B?MFZoZWtPMGF4cnc4MmdCaUlwQ1lFNlNvRFZCQUJwZ2VMVTJRaG4wYTZUUVd3?=
 =?utf-8?B?VTRFVVdiaEFsS0RBUUdueTZZamxvUkdtWE9DVHIyZ1pWTmJYU01Dd2VkcEtW?=
 =?utf-8?B?eU41Ry9WQWZDdHBYU0xEeEJGZmQvYjJYc3QyNFBKN0hLMVROeVM3WldrSXNs?=
 =?utf-8?B?dTI4VGNmQ1RlM0JldWl4WjQzeVFoaFlIRFBxcDduMFQ5Z1JKdFFnNTcyQmlz?=
 =?utf-8?B?Y00zbXJXQXptMjk4VU95USsrL3dUVFg0WW1pT0xsc3ozd3pmM2tiYVJ4WXhP?=
 =?utf-8?B?clplL2szUTk5T21JQ1dBbE9QNUJ3SjM1Z1NxaC9iNFV3WHk0RTU4VjRpR1VJ?=
 =?utf-8?B?VjlOUlUzWVhPcSt3dXZiZGFlSDJYbW5Sc1NYZit6RFNYOFozRERTdFVLb3VV?=
 =?utf-8?B?V2lCL0dyOGNPTmFOeDgrOUExeUZVbEJ3YUZNWUhGbGM0QnFidXdIL3h5dnpZ?=
 =?utf-8?B?SG9BQjNINHhNNTg4UTRjZ1d2eHJHL2J4Rkt3MVE5NFJZeTFyMjgzbGE4WHhq?=
 =?utf-8?B?eUo2ZGdKYUp1bkRLdjJUZFY2TER4WXI1c1VlMldnUTJkL3hJZXRsbDEySi9s?=
 =?utf-8?B?WHBEVzZwQU5RaERrN3hvaVRLWDU5ZnJKMnpYUFhGek5vUEZQRXJIT1FqWVFP?=
 =?utf-8?B?SkRnYnE5RDdaSy9nY0ozNlJla2R1U2ZZWnd1WDc2MXpVSVVtSTdpTWplK2Zn?=
 =?utf-8?B?SW54ZzJFNE9oMXZabkgwU1l3cGE0cVBOY1hwVGRCbm8rRjgrbURHY1YxbU0x?=
 =?utf-8?B?QXAxUFhOQUllUTk1alhlSmVQQ2Yrb2JTVWNiVUZoZkxKVU5DQ0RMaVZhamlr?=
 =?utf-8?B?ZGRGMnRVbGpCOHk3R3BRMzdxU0gvSllXdUJyR2FIZjJyMVlLTzVXZnUzQXZX?=
 =?utf-8?B?K2FzYVlSeFVPenEvZU53Uk90WFBZbGhkTjJDNklYUWg4MjBScDcwOG5lMXRq?=
 =?utf-8?B?d21IaDUrV1hWYzVVYkpXd25Wb3JrbFV2V2VvNk9KRk5YbEl3OFpiOWVKUHZT?=
 =?utf-8?B?QlpZb2NHWG9xcUpOREZNQi9GVW9iYm1aQ3k5ZzZZNlRZRzRYbldrQkJVcytR?=
 =?utf-8?B?MFg2dFVoYzRwNHZyRXZmL3FUWU1iQ1hXU2NaYlJSQ0JlYlMwSEVSQkRqb1Nn?=
 =?utf-8?B?SmhwZWhnNWFjb3ZHb21ZL1FSRHhpUlBZNVhFc291bnhHWi9VT0Z4d3BGdXVz?=
 =?utf-8?B?QlpHWHhqNmJ2QnRIWDNzZGhYUmljQnZQUHV5WUtQYlVqMUo4cDF3a1dvL1FT?=
 =?utf-8?B?SENKc0d3RUxsVWJidjIwT1M4WlAyNWJBR0xWRExxTkFta0Jib2FBOFA3bTZU?=
 =?utf-8?Q?YVp3NZRMLmvGew40K47hI6+qS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcf0fc5-a8f4-404b-9526-08db9eb36807
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:49:18.8020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTHnYuqhMBwACJlzdf1+dcgrFk7BnpR3mKg1Mn5F44UTQHxXfgNhgDoenQD4ryLFzDHUkmpjQf7csIdjH84nNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

On Tue, Jun 06, 2023 at 12:09:35PM -0700, Vikram Garhwal wrote:
> Hi Julien,
> Will update the commit message regarding why we need to export this for dtbo
> programming.
> 
> On 6/5/23 12:04 PM, Julien Grall wrote:
> > Hi,
> > 
> > Title:
> > 
> > 'type' is a bit confusing here. How about "Export
> > __unflatten_device_tre()"?
> > 
> > On 02/06/2023 01:48, Vikram Garhwal wrote:
> > > Following changes are done to __unflatten_device_tree():
> > >      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
> > >      2. Remove __init and static function type.
> > 
> > As there is no external caller yet, please explain why you want to
> > export the function.
Update the commit message in v8.
> > 
> > Cheers,
> > 
> > > 
> > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > > ---
> > >   xen/common/device_tree.c      | 9 ++++-----
> > >   xen/include/xen/device_tree.h | 5 +++++
> > >   2 files changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > > index bbdab07596..16b4b4e946 100644
> > > --- a/xen/common/device_tree.c
> > > +++ b/xen/common/device_tree.c
> > > @@ -2083,7 +2083,7 @@ static unsigned long unflatten_dt_node(const
> > > void *fdt,
> > >   }
> > >     /**
> > > - * __unflatten_device_tree - create tree of device_nodes from flat blob
> > > + * unflatten_device_tree - create tree of device_nodes from flat blob
> > >    *
> > >    * unflattens a device-tree, creating the
> > >    * tree of struct device_node. It also fills the "name" and "type"
> > > @@ -2092,8 +2092,7 @@ static unsigned long unflatten_dt_node(const
> > > void *fdt,
> > >    * @fdt: The fdt to expand
> > >    * @mynodes: The device_node tree created by the call
> > >    */
> > > -static int __init __unflatten_device_tree(const void *fdt,
> > > -                                          struct dt_device_node
> > > **mynodes)
> > > +int unflatten_device_tree(const void *fdt, struct dt_device_node
> > > **mynodes)
> > >   {
> > >       unsigned long start, mem, size;
> > >       struct dt_device_node **allnextp = mynodes;
> > > @@ -2230,10 +2229,10 @@ dt_find_interrupt_controller(const struct
> > > dt_device_match *matches)
> > >     void __init dt_unflatten_host_device_tree(void)
> > >   {
> > > -    int error = __unflatten_device_tree(device_tree_flattened,
> > > &dt_host);
> > > +    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
> > >         if ( error )
> > > -        panic("__unflatten_device_tree failed with error %d\n", error);
> > > +        panic("unflatten_device_tree failed with error %d\n", error);
> > >         dt_alias_scan();
> > 
> > This function doesn't seem to be called in the case of the overlay
> > device-tree. Does this mean that it will never contain any alias?
> > 
I haven't seen any overlay example for FPGA use cases where alias are added.
I have added a TODO in patch 16/19 where we are calling unflatten_device_tree().
> > >   }
> > > diff --git a/xen/include/xen/device_tree.h
> > > b/xen/include/xen/device_tree.h
> > > index c2eada7489..2c35c0d391 100644
> > > --- a/xen/include/xen/device_tree.h
> > > +++ b/xen/include/xen/device_tree.h
> > > @@ -178,6 +178,11 @@ int device_tree_for_each_node(const void *fdt,
> > > int node,
> > >    */
> > >   void dt_unflatten_host_device_tree(void);
> > >   +/**
> > > + * unflatten any device tree.
> > 
> > Most of the exported function in device_tre.h have documentation. Can
> > you do the same here?
Done!
> > 
> > > + */
> > > +int unflatten_device_tree(const void *fdt, struct dt_device_node
> > > **mynodes);
> > 
> > NIT: From an external interface perspective, do we actually need to pass
> > an extra pointer? Can't we instead, return the pointer?
We will also need the error from the function. So, that's why i kept it as it is.
Please review v8. I will send it in few hours.
> > 
> > > +
> > >   /**
> > >    * IRQ translation callback
> > >    * TODO: For the moment we assume that we only have ONE
> > 
> > Cheers,
> > 
> 

