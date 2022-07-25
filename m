Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F357FF02
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 14:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374569.606652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFxDV-0002Lr-Ev; Mon, 25 Jul 2022 12:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374569.606652; Mon, 25 Jul 2022 12:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFxDV-0002Iq-Bw; Mon, 25 Jul 2022 12:29:45 +0000
Received: by outflank-mailman (input) for mailman id 374569;
 Mon, 25 Jul 2022 12:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFxDU-0002Ik-3F
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 12:29:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d3dea7-0c15-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 14:29:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3440.eurprd04.prod.outlook.com (2603:10a6:803:6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 12:29:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 12:29:41 +0000
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
X-Inumbo-ID: 75d3dea7-0c15-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBY9k0eLvaX030arjIqz5QhpeXF5+q1k48hwR8zpADFTybxpEjaIedlL98ZE/6LsnufrZzY1+mZIVpa+MpT5b10WYCB7Tfo91jhmR2rQXGsI8HJjbKn3FFy31gBW5oEJmNmkK3FSjwDaERMR9xfo9l3a4/FIMRFVLvNGXAd8479AFR/PG1XSJgNf8Go88VMfCXmbwOtNYOiK36e4jf7Azlje/l3YITW/H+CMVJGUhiMPpvpJkuhgBAykSHG2QTpw6UyrECa1ch7MaFXoXVWLZBvhBTWhsOzqKD/5QXMFiUCe7MhSQE2EZMUlNVbit9IOjytTojXl08soJanpWTmMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRqYbcHK+4yb1FARcdcQ9AdkIFK+6TUR+T8EfUhaX64=;
 b=WLPKKvCR9WMO2SDOj/HFf6v5CK2qfo9pFMcjWtQB1RJgpfAok7B7Yi5agTOiymx+IGrsW9qNgcBPmIUFlbcualbV0Q5NxzMWBN4XXM3MrQHa996bjds3bSQTYSBCQUrA63jtoIB6UzmQdUgR12Pm496o3stfNH6dVaPDa1C1x9Ap9CqnhmgoZmSl1rxpoQTtb4ajWfhz6dTi4w3VncVEKXnaL/Fo6hVxeyx1ROQ0TwtV1NHBBncPyTBQQsXbrrxnrlnx6TQqQp4by2Mk5nyZuZc3TN6O3BZr85AVA/xGIghtSJLJUz0vdUUqemmGbHsrdPO8GPqlkPZDvJXeieSUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRqYbcHK+4yb1FARcdcQ9AdkIFK+6TUR+T8EfUhaX64=;
 b=Xqve01ai28xTdk6Gi4rO0vRYqpZk/0uP3JMt80Up6L54+eYM0LPo0DrW9Q5h/qGwjc6esFjB9O32Eufz1hDGmGb7Luaot1XZmnePJ0mg+5eSn/e2DYKU7ibEzKZYfUvM1qzJ+9C3vycF7fWqM6loBZDi4Uog/+mnXAMCRzlw5f6BIIykXujCGa/WsqXQcKhK3dEYkWxPEALAmS21hoUcFM3Q+VI6L31xvdw1THNXa5jBlrWTuSPg23vxs535O+B2ds5YwCb+Yt2Y24KAtt1LV4sSwy2q+19+oKG/oPEKthfEAYcyabBtctLaDwuJoECCxBEaHlphylWnT3uen2wXOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36ee5129-18e4-1fd3-c3bc-55894696de96@suse.com>
Date: Mon, 25 Jul 2022 14:29:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] include: correct re-building conditions around
 hypercall-defs.h
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <15c8b790-f6a6-42e6-d244-8f7d83c880b2@suse.com>
 <Yt6Lg7RmCTj4N21T@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yt6Lg7RmCTj4N21T@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5165a66-27b8-442e-b026-08da6e395923
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3440:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wcb4axAAIgM82EujqIPJ0ZoosCANGzn1cVXiJIyuuf+yYwCx8Ko2zgFUzSaBYF1L4759SXvLsqNYTQkwVPSmYpvY64/CqriXncYGPrq7xtFZ+udzFhLkt5utOBU87YOoLtibaG/bDLOdUdUeuJKR3iEMrmVhwKNiLuB9mY+B74+349Csmk+qJM3DPTYllyzeeW9UCB91c7cb+/ntwCpmiqw3rRbKc64Ta5PLoJ+kauCamnKvQIrFjSg6h0siWRpri26uVt2x40dVBccY8lJRPiakRKDiXLDhJCXTVHyFQCEmV6SIg+J6scBoGNAXjezkbfACpnMiYnYGE9MGiVxUFkB/mo4u4Uibzz0+hIhq0vq2LmG4JzHKkT/dfLoJ99Hy1K7JdIriH3zZ7eqxKeXe2lAYp7z0xebNfiuLcBoIhyaq1WNlM/WMc4Wo6DVhm/rwwYYYrxzh66rVVz+HIeNnSL+H+I/oHJTo3GN0TXQ1F/eF886/Zm6EDxlIYRscJ2mK4cbflZoYn6rcBKyIWOk9EvDYeyBYKWwWhbXx3xrggVKC5DROW0mVZCiylHK5RNv4cPfKffyQbkF9MIn49r5YjMN0RVGHoxE/FrocZiVbfk64JFccIwrT5Qa/KZJluw3As2Q1z0aSR+FhNAUNmeTOxU9PcDi+XZZ1b9h9wOChPXEbd88dxTWMX1v/lhmCFH+r2bpPo4rtGAi3bYXHtfmdRo57v6MUL1wCWbyU6JN4iP0MtGXn79L/L0lzerbJlSifXR9MH808wbTb/SpiAzSx/3rOpa8eXWU6OeIjg1iPQk7OJ56k8BKGl7tWruu2dadYVjoYfWcCYGtNff4tufzBeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(39860400002)(136003)(346002)(31696002)(6486002)(8936002)(36756003)(53546011)(6506007)(2906002)(478600001)(6512007)(26005)(86362001)(41300700001)(5660300002)(186003)(2616005)(66556008)(8676002)(4326008)(6916009)(66476007)(66946007)(54906003)(31686004)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBwUll3SVZuMUFWK1dFVTF2VkVJaWx5MmVOYmdSaXg5Q2xqUFREV3NoY3pl?=
 =?utf-8?B?ZTU5MHJMRkVvamp3RkZuSGZpQUpnQmkxMlhCYzk2YzduUUhEbmpuUmlLZ25u?=
 =?utf-8?B?TUk2QTRla04rOFNJRElpemdXMXkyRUVhYXFVYjR1V1FIVjdCQ0JscURNUkZx?=
 =?utf-8?B?OXdkSE9tOFJ0SXZqK2Q4Y0JJamYxdGxobXlVTmh6RDBxYkhIbm0waVNCa3o5?=
 =?utf-8?B?TUMzZFUxbU1pZWhzZjBRTllNalhpb3dmYStJcFh6NTFLdGthc3FqOWJaZktv?=
 =?utf-8?B?Y3haR1FOa1BOTkE3UmJNdHJRN1pYNUZUTjg2d0ozaFZBbmxHdGVweS9nbk9D?=
 =?utf-8?B?bGg2YWVab0NtK3VDOW13UEk1YmhpdUMvanFDcUNIb1VIeVYxYzU5TUttRjJQ?=
 =?utf-8?B?cVlyTTJZenZBN3U4Q0pEZmZnZ2wvc2NjTzBORjhIaXI2RkZyUnFoQzBNSmw4?=
 =?utf-8?B?Y2JyeGlUSnB5b0kvSkxnbEd0VVpCSWIwOFBiLy9PMzcrM243dC82WTRNZTdR?=
 =?utf-8?B?ejM1Yk0zejNBL0lWMi9ZREgwS0wyTmhXR1lTYjBtenJoRE1wUHJpYU9DRVpN?=
 =?utf-8?B?c2liYmJKd0ZnVlhsU0JqdE9oSHdQN21rbGFiNFJZYUdNdjNxZUNuUjVQclA3?=
 =?utf-8?B?K3pDcFdyOS8vOUtQSDdYZ2FseHErOTZSTHBYaU1naWJJdzRQZWNDOXlrZVZK?=
 =?utf-8?B?YjJvUzFHNU5kMTd5dzY5MTFyekVocW1TVUdRUjJKckVlMVJvVW9kUWtWVlpr?=
 =?utf-8?B?Njl3dmJHYVpVYkNubXMzS0RHSkJCVGdXV3lqTjNENkpJSm5CUGVPajF5bUtJ?=
 =?utf-8?B?Z0UrVlp4WFFpeTVaWUVaN3FDMzFSdzZKajl0b1hZbk8xVy9SRVUzR2liUXBQ?=
 =?utf-8?B?MnU3NzhNVVhHMFZ2OXFtQ1RiRXV0amxMTWhVQjFQRSsycVZOR2JJME9UZTZh?=
 =?utf-8?B?aC95NUVGb25JN0g2ZTlqUm1rbUZ2N0F1SmlHdlRCNmRuY01sYjhLdWN0SE1Q?=
 =?utf-8?B?ZTBqNWhLcG51eEp2c1RwQm82SktTOTFTM0VCalYwcUxxOUw5a2NUQTBOOGRG?=
 =?utf-8?B?cUdsYi8rY3QwbDdVSlBrREVLR0hNdm1HL3UvLzh2eC83RVhyNSt4ejRVanIx?=
 =?utf-8?B?dUk3bzNiSXlsdnY4MUl4dGxHd3hQN21HdlZkVEViSjBKOFhDM1RQUlZXMjlm?=
 =?utf-8?B?SzRRRm1Md0xrbXBOTE0zZU16RE9naG1wbmhMK1cyNGRzOXRWNDNsQnNuQWE1?=
 =?utf-8?B?cDBYUzIrRUZDNmZrQW1GL1NxeDVKbkpNd0RYQklLNzQzQ2VsTk1ONDVDNjQ4?=
 =?utf-8?B?WnhpYTIvZFV3NWk0UUtZZTM4RThDN3BVYWhibEpiL1ZXTEc3NjM4Ukk2bFhR?=
 =?utf-8?B?SFBza0hxdU4yTktHOENvcW12djNpWmdQeG9Ec2VtS1l6b0lwZ1QvRTVVOVVV?=
 =?utf-8?B?bU5QVTNSdUxtckhxYnVQQllBdElHVWlOMlpndkpIc2hNVmlTWXlmd3doSGJN?=
 =?utf-8?B?RXlTelZ1WXplc21BSVJBU1VlT1J3UFovWmRMWTdqUDdKT1FGcGFPTHdSemVw?=
 =?utf-8?B?V3Bqc0lHY0dPc1diWVRBUmpXZlhtVTJIQ1VPQ0J3Rll0WWJMUnBGUmZja0JT?=
 =?utf-8?B?emw0T2JBc0lRSUVrREtZYVNHRVlJeit5SWJhaFMyT1BSdXZ5SXBCaTNZamp1?=
 =?utf-8?B?aDl3RXAzbWZLUVl4MmQvT2dSYjFxcHYrWm1KYldyb3FZclVZSW1DWHRKdGkw?=
 =?utf-8?B?NFlrQkx4c0l1MCs4eW5VbUN3cUxVd2w2NThTY09PbjZZT0JnVXd6NEtoYTVa?=
 =?utf-8?B?SjBhWGtnUndid1J2MGp6M2lNK2pxN2ZrY2Z3WkQyVkhtbm9GSTZWM0FFNkpV?=
 =?utf-8?B?Y2NmUmFMWVJvZENKNUVBRitMa1RIK25iUEJaWUFibTFYSWNpUVZIVEhxYnQv?=
 =?utf-8?B?Y280UXJQVHl5VWdnUUJTelVpd0tqU28rNkNTOFhNeDc5WlBYNmdDYmlzRGYz?=
 =?utf-8?B?clZZeE9pemJxWFRBcWJHZlhObnIvYjY3am5GS0ozV0RmWjlkbEU3ajcyRW4w?=
 =?utf-8?B?RGdWWlVMT1hmeVp1bC8yNDJub1BmSlFSMmhIeWdZSmRQRWp5dEZkVy90TEN1?=
 =?utf-8?Q?PsXjIDDajR9VZaDqlz7N1YL4y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5165a66-27b8-442e-b026-08da6e395923
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 12:29:41.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycVbTqODNTQrIXZqkeXnhkTO1W+axGKs4LZ2hIN4eAErDgoxiTxOZhPwx0w7szC7vxKJcWVHerEox14D0U6t0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3440

On 25.07.2022 14:24, Anthony PERARD wrote:
> On Mon, Jul 25, 2022 at 02:08:04PM +0200, Jan Beulich wrote:
>> For a .cmd file to be picked up, the respective target needs to be
>> listed in $(targets). This wasn't the case for hypercall-defs.i, leading
>> to permanent re-building even on an entirely unchanged tree (because of
>> the command apparently having changed).
>>
>> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/include/Makefile
>> +++ b/xen/include/Makefile
>> @@ -114,7 +114,7 @@ all: $(obj)/xen/hypercall-defs.h
>>  $(obj)/xen/hypercall-defs.h: $(obj)/hypercall-defs.i $(srctree)/scripts/gen_hypercall.awk FORCE
>>  	$(call if_changed,genhyp)
>>  
>> -targets += xen/hypercall-defs.h
>> +targets += hypercall-defs.i xen/hypercall-defs.h
> 
> Do you want to remove "hypercall-defs.i" from $(clean-files) at the same
> time?

Oh, right - I certainly should.

> In any case,
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

Jan

