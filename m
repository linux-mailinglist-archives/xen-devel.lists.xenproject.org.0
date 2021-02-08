Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F33139A7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82972.153559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99ZC-00064H-06; Mon, 08 Feb 2021 16:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82972.153559; Mon, 08 Feb 2021 16:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99ZB-00063s-Si; Mon, 08 Feb 2021 16:39:13 +0000
Received: by outflank-mailman (input) for mailman id 82972;
 Mon, 08 Feb 2021 16:39:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k8o=HK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l99ZA-00063n-7G
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:39:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44961016-2e51-4c6c-a965-6f420ccb7e8f;
 Mon, 08 Feb 2021 16:39:11 +0000 (UTC)
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
X-Inumbo-ID: 44961016-2e51-4c6c-a965-6f420ccb7e8f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612802350;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=recupDDv4itL4a7RNXRsCzbocB9loR8wVm7fC9/Kl9w=;
  b=Ke3MYw1LeN9yrhNuoQMTlVg0Z2SS0thD313iY9BCrG3NPfwcL11cUbIt
   foGJDCUJ41cW+mCuDCbgjHPmT5T7NcgMcYB8076/L0BdAk82wLCXH7R5/
   UwBHCJxTLoGOfUjYGLJ9zIqGT8aaRbUVLIJz8pqh1bQEgiEcuQnFJndB5
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PGtIZCY0ufzCg8dZVnxJFNGZqp35E9o0ymQdqOEc0P1B8u6jOkOFaug/zzvnZ3ilRRYbYSvC01
 jgA380lwXVs4ABS3HAF1+sP7om2CGspWtNPuBx+m5mZgTr8r7JUZaTnlFmOwzDH/fPF1KUE93M
 BIUpIjNPu4U+k4Vd+VBtL6im7CWeLEqvSp0kwVngCwxFNnTsiGZolgU9PEnwkuvl/6RogG7Rhs
 kUaONQ52gIWgNTx7M0m5BhuGu8EhCtd9zj0tH6aYBnrLq4dj4f4wTHbhL6mfm3+GWU123adZvx
 ZBw=
X-SBRS: 5.2
X-MesageID: 36734626
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,162,1610427600"; 
   d="scan'208";a="36734626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKiPZUjfj1kDHUqphLFcOmOWBdN16YWiUXH0akvW+kEhnmFj9SNcLhkK1Mr43HtKtDzLzxmmKXO5heZpmC91w8vCbraK4jVwMri35ChSb74KTjQX56co3+YF6TOTug4hedUZd7ypi3ws7HdJSNXYdUtRl4qS0Lk+XOp5ypKTtJ6aeJB0qqJfMC8sVYFtPyX/sJOQFKNnAEgqP9uKN++PfZudY1/iDR0ZeSZSI0/fBeB+aqSQJOYpnysBnHQPd3p7CDcVpL+V4QCwiSV5aMnW5/w+yxmqT5i5T1PgzQpBDP1r5QQRb6wnHr+a7zwE4cf9GbQ4/P5vUw/mGnoP3lCiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=recupDDv4itL4a7RNXRsCzbocB9loR8wVm7fC9/Kl9w=;
 b=g/LzgpAA4yqhwEphLpZbfX6+VBIbFcu28b2ud/CzEYxE6jtnaD14iB8ZJR6zVV570nCbLfwIHkoUybf412XlGjsDDKiu6EhEW9r0nC1MPb8yk044031fxAAkSFPeQKGHOAo+MWsDE+34q9iuj6YLVISgAwVhzyFpX9wFIPqd/3+ofCnqtK4vBKv84t6IcvCSvg/oQSOJvqZ8OI5GLOEqzUdQGK+ARSKqCpJWPP4Fn08faA05vv3ldwfzf2M59Y8Z1KIQO0t2QP/y2zsqm7u8MwV3IXQW1xABc1Bk7uvJR33R5AEYH5IOF8f02POXV3TEBdBFUUevK49ZpSE8ssiBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=recupDDv4itL4a7RNXRsCzbocB9loR8wVm7fC9/Kl9w=;
 b=nv6x879b1tXMWHYxL/ERCKFneDWG7kZa8bB1rZywJf3otXgbb2XxZg02+WKyCMCkymHhdtraJJXF7bWvD72VBoVb3spI+cHDfyLPZ8bjLyUVpUSzMdGuOUYuk0v86bkdrQRmo7xGJYU8OXTd1kwNo4t0WNILinSRzM1AqDDxBg0=
Subject: Re: [PATCH v20210111 08/39] xl: fix description of migrate --debug
To: Ian Jackson <iwj@xenproject.org>, Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
 <20210111174224.24714-9-olaf@aepfle.de>
 <24609.26131.733756.369535@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6debd4a3-2d12-2b9f-c857-11dc2346d750@citrix.com>
Date: Mon, 8 Feb 2021 16:39:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <24609.26131.733756.369535@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0447.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62209071-085f-49f4-ea43-08d8cc500dd3
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5567:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5567A6B9E9D65DCA1F9642F0BA8F9@SJ0PR03MB5567.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Izw1IKV7DhpEOpYULu8AXkvbvddJNX4ocLWx2zEVUg50yqzb8k456QIgWUpuPUgGWZKaUr2Sb2BesbOEhXlv6O4FDfUetEVsZO6D2I0tO1ddKT0ffS0wihVlU/MdN6oA2rxW1bhHm+uI5+V2IU1CQfZdXDzHcxTYShQQoZo50M0qU6yjrTe9sHBZbqXD4Vmd8Q/3/Rbs+/ncI8VDCIobhZcRNy5grfzIxaQvYo6doEJEyiOR1dLp/aFUm4RUFLCLBMjI8p0fT6KYdDYd4e5y5SE+ZZZq2E3ph2UhIsFC7NjIWiYf2PTI6Brp+5cHxMfEORZR+UUofiQROQDZfOkZGLjGirmCB0K2CjnQJqqQXUe3DnqMhECiSFLEIifa/lo512Fo6Eo27RlN2AJJIuNs5ZcAb+jR7HIqgw4mVDU8cFrP8MQFCY7rFH3XlUjAPpt7PSTmarO1VRI2fTxRLot1dLS8gaeR3KaSYooccp47GU3Zjf1q8YzfGlebjFHYilT3VgzImjZdi2gOSF/bKoPWnUVBEfQnLyhr8U4jBZT9Lpu91ShvVYk1J5rcofbz/QBurzWq991B4RgeJ0e1wbv+uA4xDLVt+xp7O7ptB+dO0b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(6666004)(31696002)(36756003)(2906002)(107886003)(66946007)(6486002)(66556008)(83380400001)(66476007)(8676002)(86362001)(53546011)(2616005)(186003)(5660300002)(956004)(31686004)(26005)(478600001)(16526019)(4326008)(16576012)(110136005)(54906003)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NzVBblY3VmR0NHFLbmtkdGtmR3ZveC8zTDNHL1ZUODhJbGo4NkpBOEttVkJa?=
 =?utf-8?B?RktSREF0QkhRZmRsVDRRcFVxWDJhZUVLZ2YwYUNETStxOEkyaklMUnlPc3Ny?=
 =?utf-8?B?bXl3OTU3bkFYemJST0U2djdxYjk3cXBWSTh1SFJBYmt1dTBtZVhYZFR4VVhp?=
 =?utf-8?B?OW5iUjRRQU9JM3RYYTBHdDhmQjZtdHJJWUNFSndmTzNmUHY3cENFeWNBNzFX?=
 =?utf-8?B?NzJjekcvTHBCR2NCaXlvZDBmaEVPMmRtNElCc2lsYlpKcExKbC9JSEJieUxm?=
 =?utf-8?B?Q0p5a09FZW51U3ZTajBXSHllN1FobnluaW1GMWVyYnN5Q2FTaDVzb01EZWtF?=
 =?utf-8?B?cmdsZzhNQ3Z4QitQSk8zUXV6NUMvZmNOR1RLa1dZbnVEN2M1UjdTU21CVmFZ?=
 =?utf-8?B?TnJIVTNFSklIeWpadVZwZjEwYk1FQ0llTXd0bDZkOVVYbnZqbUZXSUlvSlZM?=
 =?utf-8?B?VnBoZUxBRCtVRjlWYmlvOCt6LzV2RmI5UnJ4ZnFESlpOVWU0WGtvSWtleWRj?=
 =?utf-8?B?NzZ1Y1VTWWExbm0vWEdhNzdDVmRiYU4yQmFUU2xOemVSYmpab1pZaFN6M3pL?=
 =?utf-8?B?RDRoSlY4aTREV01BSDVXTEFYdTJ6OGcxdFZXTjVOQis0VVJCL2xJK1QwOXB1?=
 =?utf-8?B?NzdOak51TmE2Tm5DTUt4eWJxUEpVSUxIcHBUclFGS3dqdmQwZ0c1NVZqcmo2?=
 =?utf-8?B?aCt4Y0VRbUQvWXVpQklnU3pWRWU3OHlmWUVRb3QzVWRRMnJvdWpuSjM2ME9J?=
 =?utf-8?B?RnZWY012NW5ubHdKQnBOY0tlL0xJTzFLZVNYRU1JRTBwRnBEblBWQ0szSElp?=
 =?utf-8?B?U1c5blpQQjJNb2tJRmxzN3FGRXpJaWJlVDhiRWFlQUlRQzBRUmR5aE0xNUVT?=
 =?utf-8?B?R3RBckNmQ251M3dwL0hyYUpzZXNvQjdwbktkamtkRUhOZURXRGp0ZlhuUW5V?=
 =?utf-8?B?ei9VSmZTdWJCTjQzb2JXU0dCRWlxSE41ZTBoWWEvMTdwcUpLc1R4a3NxQ1pE?=
 =?utf-8?B?QWl4RzZ4RSt6c3pqa05PMU85aHpHMlU1YkVKV0QrQzExbTZ0QWZNTmdRbEt2?=
 =?utf-8?B?RHk0cytyMUVGUng3QmJBQUdnaFM2amFaOWxLNWlFZkF4M0VDMnVHZXJvTnBV?=
 =?utf-8?B?aEQwakJOQ2hwc0lsMEUzbXRleVZQMjNNUHh0WVo2S0dFbFF1VTdZd1dJMEh6?=
 =?utf-8?B?eGRpL3I3Vkx3ODhFZE5XcmsxaGRMRkgvaTd4WlZoL1pBandWSWdnaWM3MXFr?=
 =?utf-8?B?eng1NVdQZGFiSC84VU9tTysxTEcrOWNwM3MrbWlaMDlja0FJdmtDU0R2NnJ6?=
 =?utf-8?B?N1J6VVBQWlVJQWRPSjVMVDBQb0dmYkwwaXJyRmw5UEhmdnc2SURaSEd0akNZ?=
 =?utf-8?B?Z3VZaVJQOExWN0ZxSXNsTWxBTlh4akF4aXU0d3UxNVVGVG16UGVmK3dzOUNH?=
 =?utf-8?B?WkxnRlpxc09ra1daeHYvb0ZEdlRZOXpPam9HUzBWU0FYemNEMENZdU1mbHps?=
 =?utf-8?B?NlpVSDZGeTc2U2RvNkhhQnMvdWVKNm1pTmNWMVFxSXBWUzRrbW95ZzN2RXkz?=
 =?utf-8?B?UWdzbXZBdW9mWnl1ZFQza0d6N2praXVkeVBkbDBvWHYySUZpZXN1cXNkZEJh?=
 =?utf-8?B?M0RhRG81aU1IZlhUeCs5N2RvUjYvUXF6VGI3NVczVnF2emhFL0hJTkJ5bGZB?=
 =?utf-8?B?MHJwcTRrc21mYnUyTTNKRFp4MGJ5by94NGlrc2dLVUVVVWN4ckZ6TnUxbm01?=
 =?utf-8?Q?Kk5xJO0MWE/5sNsNTKPC4UUIj4te/QPW7iZ1UVB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62209071-085f-49f4-ea43-08d8cc500dd3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 16:39:07.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tb9AS9IwTzZu8lVRpNeXVz7zWijI9mJkaabL/YGZBWukewMcbQYBAB+RqyhP2zAEk5nnBfxQ/71ww7tiSqmGM4AsodSwb4cLGNAgn/JMCEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5567
X-OriginatorOrg: citrix.com

On 08/02/2021 16:25, Ian Jackson wrote:
> Olaf Hering writes ("[PATCH v20210111 08/39] xl: fix description of migrate --debug"):
>> xl migrate --debug used to track every pfn in every batch of pages.
>> But these times are gone. Adjust the help text to tell what --debug
>> is supposed to do today.
> ...
>> -Display huge (!) amount of debug information during the migration process.
>> +Verify transferred domU page data. All memory will be transferred one more
>> +time to the destination host while the domU is paused, and compared with
>> +the result of the inital transfer while the domU was still running.
> Andy, as our expert on migration, can you confirm whether this is
> accurate ?
>
> Docs (including usage message) so
>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Yeah - I totally changed what --debug did in migration v2, and this is
stale.  The legacy behaviour was unhelpful on any non-trivial guest.

It is possibly worth noting that you typically do see changed data when
using --debug, because of how the front/back pairs work.  This was a bit
of a curveball during development.

~Andrew

