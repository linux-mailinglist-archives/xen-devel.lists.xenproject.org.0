Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FFA315541
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83366.154961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WzK-0005aK-RZ; Tue, 09 Feb 2021 17:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83366.154961; Tue, 09 Feb 2021 17:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WzK-0005Zv-Ns; Tue, 09 Feb 2021 17:39:46 +0000
Received: by outflank-mailman (input) for mailman id 83366;
 Tue, 09 Feb 2021 17:39:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GlY=HL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9WzJ-0005Zq-9n
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:39:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdf44238-4457-4d3e-87e3-2916d7e42f81;
 Tue, 09 Feb 2021 17:39:43 +0000 (UTC)
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
X-Inumbo-ID: cdf44238-4457-4d3e-87e3-2916d7e42f81
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612892382;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5DVuKO9dEJDdo9BehC6hnQ9RZzyM1cGiInSHA0/R130=;
  b=bgPhZG5cBnFld//7ej5DYJzumIfXnaZNNiczNHa6RdbLmPQI5IFaa7hG
   VumS5KakORBYB2fU/A0JEqfsp5pkWwhNNiyJ7Prv45hYiF06+9akGNrbm
   2PY3ieq1ndqY98eOJVuLdjz4vkndb1FuJN52rpWJf45yrKM9yHDkWRYoc
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8QT1x28PzYwSByDlQE4pguL8FEPFcmNiRpkTesBCQ/a1Ph/tkAr73EcwQeN3meekWSTDcP8xCT
 FR+Y+MouZnJBVGKRGuM56/9MnpTyPLUEoU80MwN/DR0WYpjd0xUVjl3S073iKcjE9nGVlQBSlw
 MMvVVpUA2sTgQk9VfTxLMc3ojaFejxjfP1MdyQ+7v9+M3EE2FMR8MkpJL1eNtcoL9brOVjnXSo
 m90zDmfxh2VcvwmLkjvopCiLLk2OuMp7RYVhQQft8Jwszk6V4rKFrApO0gkSZz0CY16ymqobiI
 JAw=
X-SBRS: 5.2
X-MesageID: 38240198
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="38240198"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQ4JKCN7FI9lrh/6QvgivZhHNr2YPkLkGa1JBkQXfEXT9G8H2u3H4DbZc6UUTXVGcudtHSAa1mtgS1szZ7CaiUrBkogdBm/bduWUMBUmcbxTDvDUiyMMES/LuNyZ+xjJ9dM5J9PG2ZM4nKSrMTXP/k5iTqKA/2ANf8+zdH2tCy1VVEVh+3Jd2H27eUfxwLIHoRXUYsHQONq3D4sj3cYg/trWBfIkVpdnA7zPlqXb6JBIpL3vd12qdFle/vCd9EU58fWxkllswq0hvF9+OFgtB2sLRwKX+s2UGH3LeXjbFW+ucDV7QK186Jxbz9JnZduagU/MC+NIuIxo5rK/JMr7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXn9QUImd1S3SlodRF6h6lNwYvlJo/Pz7byyPzeRIVA=;
 b=Giruf/oHuAOWLRTULtX9Dv0aECB2h5X2Oxc0xMwnT2aFGKLXbgCxwcSfpUsWxOvUkKQEg+IskiaAdiBDZBcreXuE1oM9g8Ua8hivyfvDTcFA1ee9t2+BNoEGh175d3HBbCTF0Osy6pKgVNO0syTtBVSkOrSqjFBqqFTJv1NzBRkOXQiktueKQzuiRlqwHwz13lxSPpsSd459ZKbfw6xKrOLYJF3F/3IZv6nq8pEIwemsTkA1aa2OwjFJgQz8e3AgB4eHAYjFHKDuJmAsgj9TtjIw7zReh3Sr0TAA/yU2/Tl6L/NDu3y1jtETwm9acZQqpXJo36+AqJWsvep8xDOzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXn9QUImd1S3SlodRF6h6lNwYvlJo/Pz7byyPzeRIVA=;
 b=h/5Om46nTzuQVTBqnkF31JARi32RX4zBu24dj/MQaEsi9Uw3YwcuzKJyz99e8bgXz46SkMZZ+GRxfRi9wC/WIDbINxSh3fLSlP8a1aJcNS0Wc/US+tSThh4d8FrMpQPOc1H+CKiiGcEgeVyVPb3yirCujXau/CxolfwlMT/4+xE=
Subject: Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19
 processors
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210209153336.4016-1-andrew.cooper3@citrix.com>
 <c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
 <24610.50089.887907.573064@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6f44ae66-9956-3312-c4c8-b0f1e4b568bb@citrix.com>
Date: Tue, 9 Feb 2021 17:39:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <24610.50089.887907.573064@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4725b79a-ad31-4081-6158-08d8cd21ac4f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB487210C9ABF22012651727EBBA8E9@BYAPR03MB4872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iz9C9SqBMz/jmKYNkm0boZNAxru6okW/m8A+rD1v/XGZjCSM7obZgW3uWt7XD6OI089X7+PRkJFKDC1M9M2/rmNzMqHCeXEffob8oLJJVPLzlVXQeVwZhyc6CMz7suW8S/2hJlqExkSt0PjWqOmt8e591wK5+VhC/koeTLz+7IYHWGzgDdWsgx+0h3RbV9cCRD4IKNERCmu6ftP2/eH1aGa9B40pKTq8Frn/zqBxVG/crWbdadPgnOrefGUmsGnr/MNyTS7uP2kSOsinxVnPWT1T4+qKepx64mb/FXjgCnQAM0WnbHxMz8qXuduiAZ6mXhMj+TB9sgnawP3dtlac3wbj1LRMBDUY83+DzAtXw7H6vmCrcc4cc6mNdJZzpeTvF44dO/D0DqLS5bdvAGC4RHBnd2oiGDVcqiOX4vWKw9dqPKGeEhJmj57LaPFe0ZLbjMP1gXzL5f4STMo8IFcPskX7+TqFq4/LzA6cdkAraVUHzbF0gjV6uiNhzTkofmv2ebBGMMtmB/wCO0vliAzSH9QH/PMb/txmAERrnjAqLa1fC03vJgdfQywJbxKDLb/4CM6mvFt62/uuCcMTGIm1dh9HO+55+FuPMgx14YzrNx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(4326008)(66556008)(66476007)(83380400001)(31686004)(2906002)(6486002)(66946007)(5660300002)(36756003)(6666004)(478600001)(8936002)(956004)(2616005)(53546011)(31696002)(316002)(26005)(16576012)(86362001)(186003)(110136005)(54906003)(8676002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDFQZDNGY3BqSGhvRkxhcDRFZlpMeUZha1J4Z28yU1k5bWV4U1FhSmkwRjdq?=
 =?utf-8?B?V21LdXJxdWd3UGtjYVR2K0JPTzVkbUZ0VWYzWEpnMS96MXVFcEMyKzdLRC9j?=
 =?utf-8?B?bW0zWmljamd0aHRoVFI0dmJ0eXUzanlFTmM4a1kyeC9rajZaZ1JNY0YwaEE3?=
 =?utf-8?B?VUtocFVSejFLVjlOZ1VyNDdmQTEvMnVXZVBJTmJVMWpWR2VqbjBPVFZQK3pk?=
 =?utf-8?B?NTdTMmFOTkVyRGdmTyt6dmxpdXJRL1ZvTkd3cVo2V1hlTE5QYTFuM0JmamM1?=
 =?utf-8?B?Rk5GKyt2WXhSVmljaTlnc0Q1WkxDOHN5eUNDZTVEWUw0QzEwSUhiVi94M1Z5?=
 =?utf-8?B?UzV3dkFSSXV0QUxYMExGai9XL2cvNExWRm5rcGMxR3BaK2lkdEZJajB6MVNj?=
 =?utf-8?B?MVNMbmpQR1Y5Um1MTTFyZzhiWU5vMVFIdXZLb3ZZUjBUV1dYYzJuSnRYRm1P?=
 =?utf-8?B?djB3aUZrVTFQQjN0MG5pdVZCWHdmRnJQNEFnOW42RllNL2xRY3RuN1poU2x1?=
 =?utf-8?B?Z0RFNWtOaTNmcU1Lb0g4M2IwNDVBeEJVL20yUSt4Z2NOa2gyS3F0OUJKd3lK?=
 =?utf-8?B?emI4eC94U0NSd0EzL3dsV3pWOUlqcElFTWFBbERTZFZxdEYyMEJnNHd2M1c0?=
 =?utf-8?B?WjRhSXBYRUp4SFYrOXJBYk4zcHJLcWh3eHgwSVBNUEFicWpaU2ltRitxL1c1?=
 =?utf-8?B?Tlc3RXNPd1BmY1ZuZnVOcUwyTGFlTjc3N2pSdDExWXBxZVoyNVZEb2tNMGt0?=
 =?utf-8?B?UlNndVVIQXZwUGlIdXZQQnZmZFhEZnZESzIvcTNuTVJmSjlYOW4vNlpHZVlw?=
 =?utf-8?B?ZW10RjExalpyTFpRK2Z0MHpyZHAzbDNrZHFBcExRSkV2K2docm5DOUNTNXpH?=
 =?utf-8?B?bmNVY3NnQllDZGE1emcyYlBGSGFIdDMxcUthdGd2MmF6UVpSRXllRHJlOS9w?=
 =?utf-8?B?aytxQVFJVnlOVEZRN0JXdHFFZWpWNk9kZEI4Wm50RHFibWlsNFhjenAySGd4?=
 =?utf-8?B?aGcwVUZhOXVjd1k5T0oyYnlYa1A2akgvK1UzeEZzVTN0ZUxNVU80bzFHNm1r?=
 =?utf-8?B?L2FEenB0NlF0UUVTSUtZNml3Z09KdWxCOElSZENKaVhCYWkxb0dRT01oaTFx?=
 =?utf-8?B?MjhuVW9PQzVQU0M1aVFmU3lmS0xJblR3ZDdJN243eHVlc3E0ZVE3bFV2ajZn?=
 =?utf-8?B?KzZGQWN6eFJHR2lDS2JCZE9UaEVTNmFkSm1UNnY3NWhzbkVhdTQvK3N4L25C?=
 =?utf-8?B?d1BJM1F2NFRKTHNkMlJ5VjMrOUtLYklXWU4rMG1idmZFSXBIMHlqYjhjOEEw?=
 =?utf-8?B?OUl3dEd2WUhUZi93OXB1MVRvK1BheHBCQmZqLzBlWlMwZCtaUWRkR2JBQmU3?=
 =?utf-8?B?djZHOWNxTk4xcmFBL0tOQkpyam9tMjV1VjJoK2VmVXRzOHFKdXNFU0FJWE5k?=
 =?utf-8?B?a0VuQ1ZUV0Y4ZHlLTi82TWNyRlBUU1BPalRJYS9oVWZkbUZTb2c1Rk83UktM?=
 =?utf-8?B?MEJnZHRtRzY4Q0FBYUlSeWJUYit0Um9WRncwbXI0S1ZTdmVTbDM1a1Zpa0tj?=
 =?utf-8?B?Uk44ZGo1RUVOanMxSE50c2Uzcm5JakxWUTVKRUh3RjA1V2pVK0hQaXE2aTdt?=
 =?utf-8?B?aWFUdnE2ZmVSUE5XMFVSd0huankrcDY0dWFxeDdEVGNGcDhPNThDQ016UHcy?=
 =?utf-8?B?ZW5MZlJmS1E5UUVwYkRod3FQVkFjT3Rrc1JCWXBRWG9IZjQ3amJEMGV5cThB?=
 =?utf-8?Q?Qu203H508CiXfTqWx7tYMMxxziiiP3FzwTpyeps?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4725b79a-ad31-4081-6158-08d8cd21ac4f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 17:39:38.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQcT7sWEk/ddrKDO/L+Bj4dy+LV5fd/HZyRhV6ELPnbs4uE4LkQG7CTTsNurygiZ6xIs4DDvh9KEnUmJX64VbFKEqoE6AOSbbwE4UjfLDMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

On 09/02/2021 17:17, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19 processors"):
>> On 09.02.2021 16:33, Andrew Cooper wrote:
>>> The original limit provided wasn't accurate.  Blobs are in fact rather larger.
>>>
>>> Fixes: fe36a173d1 ("x86/amd: Initial support for Fam19h processors")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>>> --- a/xen/arch/x86/cpu/microcode/amd.c
>>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>>> @@ -111,7 +111,7 @@ static bool verify_patch_size(uint32_t patch_size)
>>>  #define F15H_MPB_MAX_SIZE 4096
>>>  #define F16H_MPB_MAX_SIZE 3458
>>>  #define F17H_MPB_MAX_SIZE 3200
>>> -#define F19H_MPB_MAX_SIZE 4800
>>> +#define F19H_MPB_MAX_SIZE 5568
>> How certain is it that there's not going to be another increase?
>> And in comparison, how bad would it be if we pulled this upper
>> limit to something that's at least slightly less of an "odd"
>> number, e.g. 0x1800, and thus provide some headroom?
> 5568 does seem really an excessively magic number...

It reads better in hex - 0x15c0.  It is exactly the header,
match/patch-ram, and the digital signature of a fixed algorithm.

Its far simpler than Intel's format which contains multiple embedded
blobs, and support for minor platform variations within the same blob.

There are a lot of problems with how we do patch verification on AMD
right now, but its all a consequence of the header not containing a
length field.

This number wont change now.  Zen3 processors are out in the world.

~Andrew

