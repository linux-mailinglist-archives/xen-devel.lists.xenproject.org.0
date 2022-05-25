Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC635336CE
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 08:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336868.561299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntke6-0006no-F2; Wed, 25 May 2022 06:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336868.561299; Wed, 25 May 2022 06:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntke6-0006m1-C1; Wed, 25 May 2022 06:37:26 +0000
Received: by outflank-mailman (input) for mailman id 336868;
 Wed, 25 May 2022 06:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntke4-0006lv-S9
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 06:37:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2082757b-dbf5-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 08:37:20 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-GuqOURPIOb6mUAa6bvgZ8w-1; Wed, 25 May 2022 08:37:22 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB4225.eurprd04.prod.outlook.com (2603:10a6:208:59::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 06:37:20 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::85f7:b203:1f7c:c78e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::85f7:b203:1f7c:c78e%7]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 06:37:20 +0000
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
X-Inumbo-ID: 2082757b-dbf5-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653460643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrj6j6ByazHfv9sYruDhV7Ai8DxTHdaXfhYH1rTQORw=;
	b=AbTcUg+QXBlA2Dp0h1vvcFRfNd9wiAtGXVQ73Jv/nuuv0BgtWHbDrMhbhZj+bYJjSHpUKx
	ArvRo0GFGyc4+l3wnoRwoiONo4TOS8xa02zXYsyOftMgrJXn34i1rqMkItAfHQKrjhaffm
	LfOON8mFVQh03YiKfcwL2CPATJLv7sM=
X-MC-Unique: GuqOURPIOb6mUAa6bvgZ8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni0mx2Mb/Cv1Cjc56TQuxv9z20tWSKmixi2ed7j9QHNs0ftzEMbKSwV0JmNAZdGsW9g2m4LL6RV01iwO2dscmeCP5Tl8ywutf5yJEKSoR3ykFb+q3jmc1Xkyhzg2Si0geyqEwxZ6Az3WfMIudE94ubYsNQ/LnpEH5ulhVlAFGP2uzBjx8yqfcvRZ+HhTGIa175/mTGElV3FmiZKQNPwe+VMsYmNmQqvP6W00QVMjEw6wR3I1SRUpvDIeOBUVPdiF0zm4VmPi8mSYfyxLzhq16In0UXSlLWjlD76Hb73TeFQOER/OQKy/8tIOz0X84UbrPDtCUkr1jQfUJ0VrVnPH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrj6j6ByazHfv9sYruDhV7Ai8DxTHdaXfhYH1rTQORw=;
 b=M/fycyJyx8IeANKIRHMok/bPCpqmnriCbSveKddsOAeaaMCDPgtx/wbsC5ouLqfZN5wyD2gXbH+KGI6yfgEZPUSlZAmF3VUJMbIyB9eViTu1IFfUaxVIQUrmBV6AJDfprWccRZkRKMGEj3j0fAnOEfk55VocAl20Z027/Esrna0vwTL2yrJbm7VVoOyljieWFpv47M14nL1z//ihVh/2V+s/bkO253oQ0lbKdMq73hdnzH/95H4c9wDFGzzvfM2ddbmTRBFoWpP8wmJ761NM/8fijIK97XUsHDl9aUaemXGJfCbRbX8J7FxP5HK6vdJEhqbeZ3rc9Kh0gR7pR1vDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8aebc234-e870-9435-9f60-3c06013421d9@suse.com>
Date: Wed, 25 May 2022 08:37:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
 <dc50678e-0a35-e3a2-110b-9b5ba7f7364b@suse.com>
 <db5c23cc-074f-2c7f-8033-a4b6aaf8443e@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db5c23cc-074f-2c7f-8033-a4b6aaf8443e@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0542.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b23346ec-8c55-45a9-fc51-08da3e190512
X-MS-TrafficTypeDiagnostic: AM0PR04MB4225:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4225686DE6DE4904063BDC15B3D69@AM0PR04MB4225.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	thuwmuiF6+vq766BQ3ygYJHIyWLZiDLPML3CQlrN+VvqrjuImCpih8tUXKt+vZehXk8PzhSeHWGnY7+nbWNmKQqRY1yPhKIDAPeKgVwps0EKKfAxErvb3slOFZrZzoD7wKoFLkGX/af2S8wfbcYWVNScOt63/oUDuxT6LK0Bmcjp890uV++Jm4eydvBsMKwAUZhYaJobGfrDIj/kbFdxxSNrL9rMZmvrZ1ZE2521Azi/gS+pUyuM8OZhzSSM19LSeXSYN8jE6xhOQ53nVKWApAUHPr7noEGcgIeEhRyOS2CPBoSPl9kYfmopUPuAkgRhJ/zAsEU8A7nxBVSFauUMI6kxy63W1IFADFmSsXO+vjnmkXByvrwNBRUq6mRWPBybuUhYSkflz1RX/f4WrAnbnv+8ctlZbH8dSumriYsAqFlw5Kko9NUJdADo62V71yAI4uLxOPT99slpORgDoYxV3wuE5Md5RJ3knYYtc5csgGsTJQKWtCmCEPStnt4BEssGskO6HQ1vsgKclml+sTS2RjWsm1fP23rWJDVmOmLXtH+osMJ/RxKRlbw/O7uz5jLu3BfwgmByey020B5YyewYmjnJ/+Yqa6dipkANn/9sPtkU7/ijQ/yxqxIu92yZfe/vnTiHLuu5WpEF7QLnbko3VYmeMuMVt/FQ+76pC9/fN7hINgdNgKXsCEXfJsaG6PaqLk6yFUMKw4SacXcDtpmJ1vJT99hm3A8GF731fGq0LtiWS0fqWoAG2u8kjAA4l1o9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(83380400001)(31686004)(53546011)(6486002)(508600001)(186003)(38100700002)(316002)(6916009)(31696002)(4326008)(5660300002)(6512007)(66946007)(6506007)(26005)(8936002)(8676002)(36756003)(86362001)(2616005)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGw5bzB4S2pmMEF5T25TSEg2aEU3MjFqQjRDcVpBa2RTUGd2SGpqZjNaNW4x?=
 =?utf-8?B?Y3dOL1NUbmRLcUdQYkd6YVBDSm9YNk1ucXdhT0lxTHVjU0U5OGJIeWVGcitF?=
 =?utf-8?B?Z2hrd25OWTVpQXlBaEo3TkYwZVhZaFMrR1pxL2lKU2hhbDFqSWVTL1BrNW8w?=
 =?utf-8?B?R1duOXBGcjdjQzF3RlBnVFVEVmRLNWFoN29mUDJEc05EMEpoYklWUWc4WjB5?=
 =?utf-8?B?SmxlVURsdkFtYmt1bUp4RnJ2eWQwTXM3NnprVXBoemJNWEZHelNpWm45a2di?=
 =?utf-8?B?UjVpUXhNRG9xL3gzbG1NM2M0ZE5OM2tSdE85WjlldFQ0QVI1YmplVVFkZXJx?=
 =?utf-8?B?TmYwQ3BQVTdBZmx0c1VkTk9Ed1B3dVpnbXFISVBOcEdIZzJpbVJybjNKUHNG?=
 =?utf-8?B?M01JU1Mwd2pZUFpvNVpCWHZKNWYzWVErYVAwbzNBTzNOSU5LYVppYzlmbGRK?=
 =?utf-8?B?cEt6WFRuSGF4a3MyaGU4cGMyTkVyWVVIcTA4OE1od3psV1dxZzd4bk9ja3lZ?=
 =?utf-8?B?eHJuYnNnR1pKNkZjUFg4dDdJZE5oanRUcnJqZkVZSEpRNzF2cEhiZ0RZbTVN?=
 =?utf-8?B?bUpWWWZEMFNYTVY0UDNodkZ0V2lqYjYxaU91WGxsTmJIejZ3Wmp1VUVPWW9H?=
 =?utf-8?B?endpK0NhSkNETkx6Tk15MXRadDFwVXVaMlRlMFZRZ1FPdDUxMFl4ZFZpTTZ4?=
 =?utf-8?B?SG5SN1VRZ3UxSEtCclN2ZG5tb2UzSXhvdEQ3cjRDU1FleUpsRWJzS1d1Rnl3?=
 =?utf-8?B?amVmY0o5U25heHZEWktsVzZJb1ltY3VFd0h0dkNYY1M3RjFudXFrOFlaRFE0?=
 =?utf-8?B?TXc2aGtVRHU2cmVGQTl4QVdybHVnMWFUZktSNTNvNld6enZPc1hySUhkMVdx?=
 =?utf-8?B?eUR1aC9WcEFTQkE5ZjREYmUzbGZPT2Q3TVk0bVNnaStodkRzb3ZTMi9EeUZr?=
 =?utf-8?B?Z0hyWHNDSjhlN05zMEhEbCtWQzNuVkFuS3lqQmpTWS9ORFNEU0FRYzhLTjZs?=
 =?utf-8?B?S3RKWURKbWw2WXFqb0hvWnpzVjdJaXFCRFFuZ0RCdXVoU3U5dDZ5ZzBqbm4v?=
 =?utf-8?B?RHpzR1M5RHRjTitoV3VqaGd6QlNEeEtHcXlhR3p0OGpIb251UTBLMzZuTjNz?=
 =?utf-8?B?QW9GNG14NUxkNlNFaHZTR1A0SVhVbW1nUW1uVldqNVpJMWJ1Z1JOSVIzUllW?=
 =?utf-8?B?ZFdMZWYzRUhJVjJYNS9qbk8vZ0cxOFFNdEZwRDRrcWFLdHVialp6NTRueVo2?=
 =?utf-8?B?dlFkU0ZneHlQWi9HZXhpbVZsYjk5NGdDUzdnNDZKMTh1bmdQb0pBSTl2RmNP?=
 =?utf-8?B?U1lZSmpxdnVSSG01dzRPbHlBT0t4WUd6RXZEZitORmVkc0FoL2lNTXRXb1ov?=
 =?utf-8?B?dDc0T1FjWDYvWEoxbmFpM2dvTHRUN2JtMUNWTjE1OWF4M2VTWVlCdVp4cnZU?=
 =?utf-8?B?VWtWeW5BWVYvWGFQRUs4Nk5HMW1wQjVZbmRIbnVZci9FMTExYlREanV4dytr?=
 =?utf-8?B?UGRWaTFKWnh5TzdZNnYwdzBzNGJZWmM0QkwrSW1QNmRTQlZrZ1lNWmtSamlZ?=
 =?utf-8?B?STJieldSMmxyVHJ5OFR6Y2EzT1pzNHNtcEUyZnB5V0dhWHZQYWZmUTJZUUdu?=
 =?utf-8?B?S0lwa203RUQyeTZUdFExRVhPSStKWW80VUVxY3YrRG50U1FNb3ZUdHhDTFBY?=
 =?utf-8?B?b2NRRWRLS2M2bFNnOWlHZnZPVkxGUFdZNk9OTlFjT3l1NkFjeGVrQzF2bml3?=
 =?utf-8?B?N3NyS1JBYkZDWk54NW5wZU96MWtlOUFZZ2dPWTdlQ1o2S0I4c3dxbytUWUtO?=
 =?utf-8?B?T1BCTXRkQkp6enZPa282OWs1RjhrODVZVWt6V09sZUN4Wmt5RExoU2NGWEZk?=
 =?utf-8?B?RTRwL29YNXIwNHhVMTdGNzZjVmpiWWF6UGFTdHZOeFcwMnB1aWJEdlBDRHR6?=
 =?utf-8?B?dUIvODdtQk5DMjVLbTJYNFowTDBhdkVIYjcwcW9kS1l3MFlBazdXdXNQcTBN?=
 =?utf-8?B?TG5CbkVQSFBVSUhzMHNCQTBSMml6NThtUVFiU21WVTR5TXpTem43ZnFDaWpj?=
 =?utf-8?B?WEp4UjFHL3FtaWc5NjF2UjZUVi9qMWdwelVPY1htOE9SRm5FbHRUbUwxRmF2?=
 =?utf-8?B?bThZMVlycW9OakpRbG00NFVacFNVaGxxeHNQUnFITTNBVDZPRzhkMFI1N2JY?=
 =?utf-8?B?R2pFNWFuclFKUUhtZVU5bEhJWUJjOE5lWGdZNEVUckRUTTYwLzBYY1BVN3B5?=
 =?utf-8?B?RzN3T3cyUU9ldEI2MDA5WTkwcHJheFBwYmhXTVh0ejEvMlpCd3B5RTAwdWJn?=
 =?utf-8?B?bEwxL1VNc3BXVkRWSFYrK1IxNEoycFpnVlhZTGF5alFRQWhTdGM2Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23346ec-8c55-45a9-fc51-08da3e190512
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 06:37:20.7987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W93GnizHbVdNgAVk7uiis2D3XuCkM6lUfni0tQpp04EDjs4XDQJoFeiewzCXOTVg/e4FXV7++vPDyKhtoBgZCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4225

On 24.05.2022 19:42, Daniel P. Smith wrote:
> On 5/24/22 11:50, Jan Beulich wrote:
>> On 23.05.2022 17:40, Daniel P. Smith wrote:
>>> @@ -36,10 +36,17 @@ int __init xsm_multiboot_policy_init(
>>>  {
>>>      int i;
>>>      module_t *mod = (module_t *)__va(mbi->mods_addr);
>>> -    int rc = 0;
>>> +    int rc = -ENOENT;
>>
>> I'm afraid I can't easily convince myself that this and the other
>> -ENOENT is really relevant to this change and/or not breaking
>> anything which currently does work (i.e. not entirely benign).
>> Please can you extend the description accordingly or split off
>> this adjustment?
> 
> Let me expand the commit explanation, and you can let me know how much
> of this detail you would like to see in the commit message.
> 
> When enabling CONFIG_XSM_FLASK today, the XSM_MAGIC variable becomes
> defined as a non-zero value. This results in xsm_XXXX_policy_init() to
> be called regardless of the XSM policy selection, either through the
> respective CONFIG_XSM_XXXXX_DEFAULT flags or through the cmdline
> parameter. Additionally, the concept of policy initialization is split
> between xsm_XXXX_policy_init() and xsm_core_init(), with the latter
> being where the built-in policy would be selected. This forces
> xsm_XXXX_policy_init() to have to return successful for configurations
> where no policy loading was necessary. It also means that the situation
> where selecting XSM flask, with no built-in policy, and failure to
> provide a policy via MB/DT relies on the security server to fault when
> it is unable to load a policy.
> 
> What this commit does is moves all policy buffer initialization to
> xsm_XXXX_policy_init(). As the init function, it should only return
> success (0) if it was able to initialize the policy buffer with either
> the built-in policy or a policy loaded from MB/DT. The second half of
> this commit corrects the logical flow so that the policy buffer
> initialization only occurs for XSM policy modules that consume a policy
> buffer, e.g. flask.

I'm afraid this doesn't clarify anything for me wrt the addition of
-ENOENT. There's no case of returning -ENOENT right now afaics (and
there's no case of you dealing with the -ENOENT anywhere in your
changes, so there would look to be an overall change in behavior as
viewed from the outside, i.e. the callers of xsm_{multiboot,dt}_init()).
If that's wrong for some reason (and yes, it looks at least questionable
on the surface), that's what wants spelling out imo. A question then
might be whether that's not a separate change, potentially even a fix
which may want to be considered for backport. Of course otoh the sole
caller of xsm_multiboot_init() ignores the return value altogether,
and the sole caller of xsm_dt_init() only cares for the specific value
of 1. This in turn looks at least questionable to me.

Jan


