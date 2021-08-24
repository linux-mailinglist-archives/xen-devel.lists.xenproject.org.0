Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43053F5DF7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171300.312588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVVw-0006c0-Rw; Tue, 24 Aug 2021 12:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171300.312588; Tue, 24 Aug 2021 12:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVVw-0006a8-Od; Tue, 24 Aug 2021 12:26:48 +0000
Received: by outflank-mailman (input) for mailman id 171300;
 Tue, 24 Aug 2021 12:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIVVv-0006a2-JT
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:26:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5125718-25e5-49b1-b13b-0caea619dea3;
 Tue, 24 Aug 2021 12:26:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-qOB7LWHQMB2rObZHQHtt9w-1; Tue, 24 Aug 2021 14:26:44 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6004.eurprd04.prod.outlook.com (2603:10a6:208:11a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 12:26:42 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 12:26:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.22 via Frontend Transport; Tue, 24 Aug 2021 12:26:41 +0000
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
X-Inumbo-ID: f5125718-25e5-49b1-b13b-0caea619dea3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629808005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MfqT2WJO30CfmTzwUqbmbnLr8PHIZ8WLomKVonAbYI=;
	b=cD4aYfUFVGWMq9hcrd4DlhXL3v6VT2yjNd3zjU62S5wLPs63+Eqe9xToTPhpjXoUDeHnMW
	F3qrMCWFwhb1F/sCuFsipk+2h1DmTXnWDZasxgx7M4rtkV+2/5O96bhjrBUWRc70JobqWZ
	sUyb//dXvVxfu5JMgJLffItCGh9mECc=
X-MC-Unique: qOB7LWHQMB2rObZHQHtt9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iz/lpFxgggHOy6vSKB1KOKD0lDy73rpDE+h3a2jSFf18K/s70BRQkuss6JijIhzyjPnPW/N72Eh5WRYVrRzIx0PWuvUoTuskL2a0xPYbqgDqO7ljQ8EjD2H5WzRJSFkYrRVL5Z9J8SnFIn45U3uU3C6GuheLOfMF0c8ubKof7VwulPvRVTBYq52/pIawRJ9dChKjB8An9Uj/o8frk4bvLhDQcP/B3b0Dgzl2nqT1q/sXSRK2helsdDC5r6pTzvO5yNP4QJJJYofSrJTahNfN2m5dygMN8q1gBHvjy/NIS6R42u0BxEwF7j6tpc11dMFBEwOmK/sw//Gc+hZNj2kYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MfqT2WJO30CfmTzwUqbmbnLr8PHIZ8WLomKVonAbYI=;
 b=kSreOHqsGr0eQMz4FhfXSmNPo79Hap3qNjRei/ucbAQW5CKV6nbl4+TyAMqZcpkSF+OC/tD17rgeWYvtYQcjTb/MnIx/YmdFpzxEc9/+SvwYtVY17/dfXnaAdr1DkMcS+ZCYi6ExmLAXwUIGvPFi8tdfg0oE5YKK6I7QAqyqLDexSwFD+WFwVPwg98DE6fOjA3QDmKr3y/wGl/xWoNF36NR++UIb0TXLM3A2v5WkeV5iAXt88kCjPbkYj9XTJHlFzXzR3uoRA7uCi/JImrUr87J3vUIHoCO9wfLWeEpQyCQp31qKyz8VnSr0+fWLpAtSrmtMRRObrKWHd21oIwmgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 5/6] arch/x86: move domain_pause_for_debugger() to
 domain.h
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <e185531b79b73fd353b4cfbe2cb7625498e9c9b1.1629315874.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a291c5b4-c865-0858-62e2-806a337c2407@suse.com>
Date: Tue, 24 Aug 2021 14:26:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e185531b79b73fd353b4cfbe2cb7625498e9c9b1.1629315874.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0057.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::32) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52732bfa-cf26-416f-82ed-08d966fa6db5
X-MS-TrafficTypeDiagnostic: AM0PR04MB6004:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6004B122850B82A06AF1467AB3C59@AM0PR04MB6004.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rWjq1s8IVYJEsfTBOEEVuqC/mWuVw0ERtGEcF0L8vCe39GR0iHLlTCyOwW3s1yJbEgN9ox1TNZlyytKi6nrWHpA9+mR8r97+srOc+/EjkawXLKs1Af29FeY/0p4sgnQDgc3eWmeaqYJX7wgpLTV2ScCk8dJ9DDshIgxspMa+nq55sZZxaHoLvC8xu9GywPbf0vNjzc1BVCl+l/c5f+saNnbBmqA7JVkbmEe07m1qD6iB2WSd2iKKD5nsNSUsG6Cf2iOr7p1VB4CcJ09M5ZWCUhFIeZ6uxP2ZfvMMY75ow9IwZXY2TebNmMiNcDxaVZPGAr6mYx7Xymu2NHl+LcVCiZPdxC3+7UROMbuTCllhLKgrkmq0n6OoSsS01lBH6tlHn1naBp1rJkMzlYrpVK7bA4megMLw4BHoBDH0ch6U+DGw+TEBq3WkTjkqvMaAwGV+J7cjdiWKJy9gioVAgAZFOrYunKxkc84CKydOFpYNgfzlEJh+tdaFEYOXNJ3c7HTyH95cpedvUFJ/DwrvfCMGsQ2t6I9qHkbpJ5DkFNx0lRvguHt+Tjrh4N4lwEmt6DrEzFnzKoGJaKdIUGsEZPUA9ohU6+pHnCxrvbh2bsOEMV8Md6SKUJYkA4qAXVD8uqHc6/8jeokUwIxex9PmriNBJBIVSr8kz4msS43e3QrSew6RfDE4dZ1Rcuj9i2rQNInkp/UeVPiw/3wm2DtY5R39wqnYAMXuSHmVMkfytXhQntc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(396003)(346002)(53546011)(4744005)(316002)(16576012)(54906003)(7416002)(2906002)(8936002)(478600001)(31696002)(38100700002)(31686004)(4326008)(86362001)(66476007)(8676002)(6486002)(186003)(5660300002)(66556008)(66946007)(36756003)(956004)(2616005)(6916009)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFd3VStlNlN3c1Nlb0VxeFV5OXlZYk1HYTRTSXBCM2xmQUtnRk5jU3ZJWVZW?=
 =?utf-8?B?aGJwcisvZGNNeHc1VG9meTVoaUhsOTUzUS8zdXg5aXFOcXQxd1FwbHdqczQv?=
 =?utf-8?B?aXB4OHIzMzVMV0pweVcxbGhEYm1vV3FWSm1yeHVxclA0RnZ2OFJWTkI3LzJ4?=
 =?utf-8?B?OGxneXRyWGlUQ0s0Z3BLb1lQV04wdTA0T1VhYk5lSWZSVDNrTEd0cGRyOFll?=
 =?utf-8?B?MmNMTVp6S3Y1bDFRNi92ZzRhVGJKcG14b0taSisvQ0RUMjdnWWVBVktIajN1?=
 =?utf-8?B?b1ZvY0lOTk1NcTV5MUE1UjVqWDU0K2ZTdm1ZL2pFUDVqc2hxRHp1ck5TN3FS?=
 =?utf-8?B?eTVzS2FhUjNLTWNYeitjWlRIOE5keTNkcTJNVGYvUFhxa3oyQ1hPeWpWeDJt?=
 =?utf-8?B?WCtnZ1cyaHFkWU0wdmlZb2JmbVB3UEwzZTJtbjNpVUlpaTMwU2RjbW1nRGVQ?=
 =?utf-8?B?em5FTjVvaGpJcGRuOG1hZU8yUW1zS014aWFJd01GbjhzWTcvOEkrT0xtZ3VF?=
 =?utf-8?B?S0VzNkJIckxnQloreG01bHp1cG9jWm1EdTd2RzRmdjVqUW16N0xHdk9YUE5H?=
 =?utf-8?B?ZFNoaVBFK3E1eklhTkg4cklsODdOTmJHeUNPSkNLZUFJSTVrbGxwS1ZPMTdF?=
 =?utf-8?B?WGxSZ1JhVGx1MnQxczgvWHBDdmRUSmJndURRRXEwRkJidmsxaG1SbDg4ejVs?=
 =?utf-8?B?TkpWTVlzVlhxZzIwb2UxRzdQeHplc1FBZklDYWpFY3NSMDRkSU1CWTNCR0Rs?=
 =?utf-8?B?bmVDWTFkTmYvODdwWTVSQURPY2VUUXRHQTU0WjEyZTlQZlJETi9jZmNFcCtl?=
 =?utf-8?B?dVZRZXZtUXdpa3lNMkpudDk5ZFl1Mk9vcExjcGQ1V2NTTHgzVDlyQmN4YnJs?=
 =?utf-8?B?d3dnWVRXUnQ1OG5PUUJyWWZWUkkraHFrWHpLUk42cklTcmFNcFVLQVI5Y0hT?=
 =?utf-8?B?d2dTOFVOMjBXeWtmNDNybTE4TDdBSHVWRFRaYU5RQlZlejM2SXFHajFvSVJj?=
 =?utf-8?B?TnE3cm94emkrM1p5TGJtdkRnZVBEcFhqajdCcCtpeDdOZElvUURiaXE2UU1E?=
 =?utf-8?B?SDRDVTUrcjJoOXREZG5yeG52MGxWOUpNRHgzMldoYVVUTnBsVHNGeWw1WDdC?=
 =?utf-8?B?WnpZbTY5VGZoREh2aFNRNUFZR3hWRzBONVdqWURNTUFkSTBjY2ZoRkJ3cldE?=
 =?utf-8?B?VnBXK3IwT0NaUGtoaEx6dnNELzJramRiOExCWFk3L0JXWXVlbEVlVE4zMVNM?=
 =?utf-8?B?cUVadSsyUER5SVpmUVRETTdjNWd5dS9XYXY5cVlITGtGbzlIS21mWnNEWUJy?=
 =?utf-8?B?RUJmWGdTSzVxaVFtSmE4QmlSV1pqaitLS1psWUZVbmVwR096RjZHcTR5UWxu?=
 =?utf-8?B?S3l6TUV4VzVVS3pXVzN5UGZZSkNmZnBMWUMzMTVMMFIxYVFobmlEK0JTeUZ3?=
 =?utf-8?B?Y1NSTmxlN3d3WDRZV0JnL0p1Vm5rYmhqS2QwWjZLNW4vYzRQNkVBVjdvaWNO?=
 =?utf-8?B?Q3V3V01uZXdlUzZQYnhuV3YxczRhK0trTWZGZzQ5SjczZnBjbUFaUGVEMWls?=
 =?utf-8?B?SjMyTW9jeFhLT3JxbnhzbzEvMElEa1g2azc1cG40dlFLSnFyVFpLTTd2cHk3?=
 =?utf-8?B?d1NoNFZ6d3p2bWdqOXRtbjZXTEd5anFFaUJ5a0ZMZVVGT2ZSTDM2WmRKSHpI?=
 =?utf-8?B?MExYT3BsSVZZMDVKS3EwVE1TUzY5ZWFSanRGY0tveEEwaDEwSjFuT0ZVQUFJ?=
 =?utf-8?Q?UJwyvRpxpyiXFFeDym9h8qtcV2PrpXIJvSKXC2g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52732bfa-cf26-416f-82ed-08d966fa6db5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:26:42.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFxAs81iNXrSDXRb6o0IltU2pUt9kPyD89lk3sIAlANGz2krLGqA8Llgz8nMqwSLfAVI0VYLuYDYRbbunu8IfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6004

On 18.08.2021 22:29, Bobby Eshleman wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -36,6 +36,7 @@
>  #include <asm/processor.h>
>  #include <asm/amd.h>
>  #include <asm/debugreg.h>
> +#include <asm/domain.h>
>  #include <asm/msr.h>
>  #include <asm/i387.h>
>  #include <asm/iocap.h>
> @@ -58,7 +59,6 @@
>  #include <asm/hvm/trace.h>
>  #include <asm/hap.h>
>  #include <asm/apic.h>
> -#include <asm/debugger.h>
>  #include <asm/hvm/monitor.h>
>  #include <asm/monitor.h>
>  #include <asm/xstate.h>

While it's generally a good idea to explicitly #include headers that a
source file depends upon, I'm not convinced in this case: sched.h
includes xen/domain.h, which in turn includes asm/domain.h. And this
dependency chain is very unlikely to go away, as sched.h needs to see
full struct domain and struct vcpu, all of which come from */domain.h.

Jan


