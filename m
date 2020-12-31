Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A32E812A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 17:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60574.106303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv0S0-0000xs-10; Thu, 31 Dec 2020 16:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60574.106303; Thu, 31 Dec 2020 16:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv0Rz-0000xT-TW; Thu, 31 Dec 2020 16:05:19 +0000
Received: by outflank-mailman (input) for mailman id 60574;
 Thu, 31 Dec 2020 16:05:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIAU=GD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kv0Rz-0000xL-08
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 16:05:19 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 930196ce-d2ee-4062-bdbb-f62984638c9a;
 Thu, 31 Dec 2020 16:05:17 +0000 (UTC)
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
X-Inumbo-ID: 930196ce-d2ee-4062-bdbb-f62984638c9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609430717;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4uDATtCqWB5GcwLc2lQU7nn/jQWnDygbWXQ4SgblC20=;
  b=NDHq3TFubw0woQuyF2oufmFL6tluz07LjaIeOfL0YM+d42JJLcwiv0qM
   G/dT891pzAnZTHvgj2V6YUo6qEvWyjeta+PuVJmTyFPYxO8kkZBWNj6uF
   7yPxZzQFvljd+z+PCy5iOEXBKscUWqS2hAqMARL/9DUbMpcd/NZ5xM/oF
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7KHSxq11SODM/6leymnCbThBVMSB93WwaIpalXUWBTyKqqLC5p+FjVCak+xCaVpvhoB4LT61Vf
 EDiO4qTk6ppfDW6q+QUOGK8EDMbV3z1OKyMWr3coQyEU0tWdvjbE1CXnC9QKDI3Wnhgkk9h37r
 Fr4CWriEKheHkAz4+ECl6gwVOPXlr2Bgx0IWif2Lkwl50Q+CXZXwuAl497Wlg+kaaJSqDUEuuT
 2QQmRmVNqOhr6/mFd5p7QFqO3Kp4xderc/Hr1qK35eg0TGBA+8tBXVXedzcRrygUYySLW/vmDh
 t/k=
X-SBRS: 5.2
X-MesageID: 34252489
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,464,1599537600"; 
   d="scan'208";a="34252489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNkEs07R8iQNu9uOc+y9xZkuZ41Fb08Op5GhweaeOlvX+wZwz/2CNQrVSq8a0LAwd4rqZvmEksH4vJ+sVOpxqTGWLnNByTBhHg8W0sRCqDvmLUrYqMP9HKkECfvQDh5a1w8YTIRh70sQa2f1STr/32vOl1xhyRJfBQAMYBj3zBrEYCwJv9/ADvA5cqub+mAqaR8kEQLJwJ1Dzg1rO5UmYbOJwLfoImEDlTpJAHkw+t0DFF+hd9wecuavt6gaHm3nT8U4Ew0PnX/6VEbzaK3IWqVDdLJUWKhx12nFj7NUtSBTyM4qPi+5vuXg4C97hc4VqLA19neJGYBsw4Hbmyq24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocPwi+vkVZuIUceVT9eof+2hSuosuCE0FhHhKbN7xGg=;
 b=Q5MWGZrsFqg0Lsk4ToStkOwnTC8W9uZHTjl3aRl64rl03oBWuXSePAGNtwE17PXO+BvAT7ehelIQMzPiiuZ2JMHZLgZxJ7ZCBqClG7R3iXf4OAtKRQnFXV+RQPMhG73lMD87Kut6HUSAdXke89c6WO3/GC32JIX8wnM449RlvnGpcu6CykHkehy5I61FpLRTOKbIr9o90b9u0ZR1YWzyVNMHbIZCxrejzDXhr3QNmzgD2AqugTppERtML330xDq7vTflX5gmUvu8Ss81Bz1q3rvgkzt5Sm91GABfQx3CsZfs51RE6mkqvzwh92bVDaY2JHxUTC0J0YtR9vHoTQ+75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocPwi+vkVZuIUceVT9eof+2hSuosuCE0FhHhKbN7xGg=;
 b=aVm0dy2qP628tAZLt3i+mH+S85mvAb7DUwVGLcFKt92nxygR8AL6lhQjggBthkH9I2918qXL0nvOjKXmhGyVEqZoAnZAZRkS2FHfQQhOYOF6nMPalrNOXQsDPzBid0svXW85zoKBA9HAHU+qI79f3cW/L4qSNLlxZSZfRVjneZs=
Date: Thu, 31 Dec 2020 17:05:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: remove the usage of the P ar option
Message-ID: <20201231160506.247ctn2mnfdgcddx@Air-de-Roger>
References: <20201230173446.1768-1-roger.pau@citrix.com>
 <b90b93d0-ea83-bc00-6dc0-cbe9e7cfa1ce@citrix.com>
 <20201231092015.ojmlwfvqky6uqyig@Air-de-Roger>
 <6a761459-7823-077b-2cee-b6d685eb10ee@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a761459-7823-077b-2cee-b6d685eb10ee@citrix.com>
X-ClientProxiedBy: LO2P265CA0331.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f25044c1-bbc6-41ab-7eed-08d8ada5db0e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB447641850AB59581DBFC437B8FD60@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvdy2kwirNvKDmQWR54AhbtX+7f+CwA/wsuDVZEjE+Da3V4w6C3JSQjUbwxZ/ee2Kikx9SXXjDF3IsBZbnIikQt/X97UQSczH51cEXvqeZ15F0/mnYNj4YfbfLjCRTN5RuWYeWdXIjMKH7TaUfSwdbIkErBC1OG7piLpdj6a8kDK2MmOJTU/kOxj7DTDt5YuVnXhqHZP9G7Q7qwWsjhK2IJybyvnDKabnO+ElbB4SBSWMbxBYvFmdjAgTBBHsu+sR+w9R7JuzDdksrmiCTfWb1fU9qnKe1wIrXoFWSGTWICJ4Dx+1oIZmoaUvQXSbprsk0n/8GCgqCskTvOPUciGKu+L6LwE9Y60CMMa4rwss5ke/yW/jz+e+ywmKHvV1ugaHil9XhFO7975t4I3QJyBfDasjKGsTipwdAmjN9sGKyL96RoLsuHCFnkv5zsxvwLmHp7uUzBEEvCQNVgn1c8OiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(66946007)(66476007)(6862004)(5660300002)(1076003)(66556008)(85182001)(83380400001)(6496006)(16526019)(8936002)(6636002)(86362001)(6486002)(316002)(33716001)(9686003)(6666004)(4326008)(956004)(186003)(53546011)(8676002)(26005)(966005)(54906003)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXBmcE5EcXdsQk13MDFUTGVLSXJRTlVQTm0rOVk3Y2p0QzAzUmI2YzlJMHNx?=
 =?utf-8?B?SDNNSXZhMDZ5OHpVa1hQajBiVGMzQzhsRU1EejhpOUgrVWU1aklCZ1gwV1Ri?=
 =?utf-8?B?S0Z3RW02WTJidzBrMGNwYjE5OHNJVEg4aGpGVEhQZloyMkZhMVFmZUEyWjJV?=
 =?utf-8?B?T2xIbENlQzkzN1ltWGJTVDF1ZWVvNG14b1V4QWJ1SGpSZU9HU0lVZTY2UjUr?=
 =?utf-8?B?dXdCWXZpekhoemgrYUN6Yk50T0gvVTNqbWxLSk5vdUtzTGpSMHloS3pxcG1i?=
 =?utf-8?B?MXdRb3FueHBFeU1obnpxRWkrVmdEaEdaVk9nZXhxQ2NiS1pKV1QySXlWOW15?=
 =?utf-8?B?TGpwSXNBNisyYmdWTHZmbjVWVjd0MlpmWkR1ZkRld01yUUk2YVFyQ3huNUVE?=
 =?utf-8?B?amMyUWlJTmlySEE4a1IxUmg3bFJsR2lYcjI5RnNxdk1wNm9FNUpIcHZyNFhS?=
 =?utf-8?B?WTh2VzVDOVdTQ1ZwdlpkVUFUalVIVStXOG15QzQrcVRVOE9FZkVjWXpxakJS?=
 =?utf-8?B?dWJXVDlZV0x6dUhDbTNzR3Fob2ZTR0gxVWg0bjl4UzRGbmdHLzR5SHFUbUha?=
 =?utf-8?B?QzNmakR0eW82eWVTZlIwWGY5MEtuajd1MTV0QlNVNzl1U1J5RG5xT1YvRFh1?=
 =?utf-8?B?QUY3NDUrU2l3dytOeDNZR0wzOER2NGxhNDBsYTR2SFNWNlpLTDZoQzVVUjBi?=
 =?utf-8?B?V1ZLakZjalNla2RsSHRBZjhSOTg4UFlJcnlrQVlqWU1ETkg1YTluVWttN3VM?=
 =?utf-8?B?ZmxGU05QV2dsQU1HaGVJZWJieFVYRWZmVTdsRkNER2V3NmZPTkxqMW9OQnJo?=
 =?utf-8?B?R3cvbFpTNnVHSnRCUExleUppUUhpVVRnMkFWMUY0U0x6RkdkQVhYczBHbTdh?=
 =?utf-8?B?Mi9zWWZOK1l1c0dYczVGK0NTMFlPRUpXUldTMmxCOTRwSWhOOVNGelZWZjQ3?=
 =?utf-8?B?N0twVXRyRE1GSWR6ZStGS0NvNzMvUXVacHZvWUFiRUNqRzdwZUhtVFdHRjBN?=
 =?utf-8?B?eENSTGFxNHVaQzJ6WFZmczgxVmlSQWtJMjlveGpEaVUwbmd1WFB1TWF4V2dW?=
 =?utf-8?B?MkxqUlVzQXFLWUpncVdrckVLNDQySmRVUURFNFZZUVAxWS9DZXdsQnhkYXdP?=
 =?utf-8?B?cDVReUVKTXRaaE5zZnZ4Zjl1TGgzYURVeExRSXdoT3VQcU9XNHlLbFd0UzNj?=
 =?utf-8?B?QUpkaUN6T3NUaDc1Mmt6Z2MvWFNrWUxTNUEwaldXUDJldjV1eTJGRXEwdTBT?=
 =?utf-8?B?Zk5INEkwL2VUd3lqbUs4c3B6djlOMzRHUTVXaFArYUVENUV1K1ladUk5dFlm?=
 =?utf-8?Q?FpFsxqvEdLS5I4tXppqxP/nvRH1mwwZ/lb?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 16:05:12.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: f25044c1-bbc6-41ab-7eed-08d8ada5db0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbVn0Kw851/938iZ4g+tQQE5K+dVCBiaGEk0KSUfXo1d8YbprHQlaGrmwm/Tif2F7iW4QjifK8HeTvkQe/b+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Thu, Dec 31, 2020 at 03:46:50PM +0000, Andrew Cooper wrote:
> On 31/12/2020 09:20, Roger Pau Monné wrote:
> > On Wed, Dec 30, 2020 at 06:32:58PM +0000, Andrew Cooper wrote:
> >> On 30/12/2020 17:34, Roger Pau Monne wrote:
> >>> It's not part of the POSIX standard [0] and as such non GNU ar
> >>> implementations don't usually have it.
> >>>
> >>> It's not relevant for the use case here anyway, as the archive file is
> >>> recreated every time due to the rm invocation before the ar call. No
> >>> file name matching should happen so matching using the full path name
> >>> or a relative one should yield the same result.
> >>>
> >>> This fixes the build on FreeBSD.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
> >>
> >> We really need some kind of BSD build in CI.  This kind of breakage
> >> shouldn't get into master to begin with.
> > Fully agree. I'm not that familiar with gitlab CI, but since we have
> > our own runners there, could we also launch VMs instead of just using
> > containers?
> >
> > It might be easier to integrate with osstest in the future, since
> > FreeBSD has now switched to git.
> >
> >>> [0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ar.html
> >>> ---
> >>> I'm unsure whether the r and s options are also needed, since they
> >>> seem to only be relevant when updating a library, and Xen build system
> >>> always removes the old library prior to any ar call.
> >> ... I think r should be dropped, because we're not replacing any files. 
> >> However, I expect the index file is still relevant, because without it,
> >> you've got to perform an O(n) search through the archive to find a file.
> > Right, the description of 's' between opengroup and the Linux man page
> > seems to be slightly different. From the opengroup description it seems
> > like s should be used to force the generation of a symbol table when
> > no changes are made to the archive, but otherwise ar should already
> > generate such symbol table.
> 
> Ok - are you happy for me to commit with dropping the r and s?

So after testing this, I think we need at least the r option, as we
want to add new files to the archive (regardless of whether it exists
or not). That seems to be mandatory on FreeBSD, as calling 'ar c' is
not valid.

I think s can be dropped, as ar will generate the symbol table by
default unless S is specified. s should just be used to force the
generation of a symbol table when not adding files and the archive has
been stripped AFAICT.

If so would you mind adding:

"While there also drop the s option, as ar will already generate a
symbol table by default when creating the archive."

To the commit message if you end up dropping s?

Thanks, Roger.

