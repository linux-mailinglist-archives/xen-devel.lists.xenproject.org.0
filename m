Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC43F4843
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170293.311066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6s8-00084U-VC; Mon, 23 Aug 2021 10:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170293.311066; Mon, 23 Aug 2021 10:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6s8-00081i-Qz; Mon, 23 Aug 2021 10:08:04 +0000
Received: by outflank-mailman (input) for mailman id 170293;
 Mon, 23 Aug 2021 10:08:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mI6s7-00081c-4s
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 10:08:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd5a8c9e-03f9-11ec-a86e-12813bfff9fa;
 Mon, 23 Aug 2021 10:07:58 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-wuVUA3avO7uJ6KGL9xqxQw-1;
 Mon, 23 Aug 2021 12:07:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 10:07:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 10:07:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0243.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 10:07:45 +0000
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
X-Inumbo-ID: fd5a8c9e-03f9-11ec-a86e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629713277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdBMyKTHFaYUPWB5WhpAnWW3mJOLfufORfe7ZsuOY4s=;
	b=f+e1mpGulFik6o4PcJOCjeWcnCS3H9JZ/bXRFr5QJJi5OL9axIT5BQnj/aFLUUgHYSPNx6
	k4Hkdu2h/RADr1Y6rhkEkpLvN/7y84tjvi6ugOQqsjsPJTiCsKFSr3//dAhIGDWcHboQV8
	5aPzIsWjf4xQYMLjl/P7ZqMYrTMkan4=
X-MC-Unique: wuVUA3avO7uJ6KGL9xqxQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo+EXMNAX7b13Xw1EStrXAfHRU1DFAbHS6EcII5ezHUU9DJI1BKw4Z/WjZiwuA27JHnPOcO/XNwaFL6wk+xgXtopVVBGHxRlRW5xcO0JKFqd9n0oskhz+JxUPW/MJsAWQWfMwTCth1R8ByDGU4SjwHU0SwZ3VldAnCOb1pNCQNDorIhle9uYulbZR5HiCPQ1+6y7sxEP6xA2ubLuY2wvO62KXo95DSU+NdaO8N7JgwBl85BGlgXniCdigXn+H0TgIGiA+GFbf03hTZkTB2xwRUkHyRDYHNd9HdfXY/+UlMvv6pEhcpRFjdxiHq6F9vilDDypXlqUHvY0siyBRZxp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdBMyKTHFaYUPWB5WhpAnWW3mJOLfufORfe7ZsuOY4s=;
 b=IBo2OVdtmTAnE65YmASDgM8IPnLN8ANG8Bt+s9hsXoxIgGP2L4LmAl0S8Kop/qDS4cevamrwkeo4nlN/iy6vEfuFO+6ucr5/tLpLPiHkhT/U3WRxKA6OPoAZ540dexVOvCpSNKyjl3BvnBMXVu+k68i8GYeX7iZxhfpeiIVqfGzMrb3WkNEGHEEqH5UIv5+RzHQpJY/Ny1Y9OCx7hD6OTMH4thzv8sHnvoVCno8C41QZmvcyc6MrRjGXbztKWNhG6EujyLV5KtMTF77MIgreLlWbX4a9f3EeSiuvKE8IySeLY20bU9pl5s/E+hd3TAPma17AT5+KfQWt/JjPfgQf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-4.12-testing bisection] complete
 test-amd64-i386-xl-qemuu-ovmf-amd64
To: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <E1mHy0c-00059n-HR@osstest.test-lab.xenproject.org>
 <9e009e5d-41cf-71de-fed4-88a962b4ab66@suse.com> <YSNrZfjGJzdKUlvV@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3700f293-001c-c01c-c443-86be60e5601f@suse.com>
Date: Mon, 23 Aug 2021 12:07:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YSNrZfjGJzdKUlvV@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0243.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::15)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1d61fa3-6272-4010-bf5e-08d9661ddab4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607A057006E415B4042F007B3C49@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ioA0yTWfkxoPP/sd3x/8Hhi7cFELQeW/TN2KKhU1rhSpZknZWa1iu9NcgKnPE1zAvEMWvyzJn/6iBW0iau3tZREnXXmhCt/qEhb4VSSUQhpfSRGmh7O0hEcdyghOfBBAy+DdFu5KkEA68mZEQnuCMs1k+tGuUtLrSnkeAbcicpjWwm0vZjLxpxAD5pZ/XMrDUwC1Bem45P8KH5Yog9A9m33349kZ1L2HzXUfHDHyg1p6GhLKQjTiD8mP6D0S+iUOYwlFqj0eRi1QRc0AAhLQPi2rgXMbJi3/5s5UgTFebghzIOkPWl3Ze+pEvPt4/KfaOfHvAtYFcu/bckpyQDl2slQ1l7pw2mHdlX7j6AX8piyeOS8QhOEfdC2LU8awsI8Fv7HAHtRGWbaZro1dSNspEEoE8rYasJoJesodEcJHObLon6MHD5njCYYMfcVuP3rwXYUlKuJjVTbUWBMe3cAW8FjX06WjE15+TSjc/8Dkuf7X4qCpaFU16DSqaclXhr1/UpQFAsVvQx4VO8ohZJe00NOn7S6ebz2J/QuXwPmBJjQBwIXnfbQUrpPxrafEhAsgywYeh9EBJtlX+SEytFG9b/W1Y7q/YuX60mFuWKicweQ+dI+OG12aI1UVU8kLXOa7sM9isVN+GJbg5IDunmH+R19gu7lvGXTV+B72LOrJppbf6Gl0QQSvboHS6wwRlZ2Zuk0S+x6UVNj4bISuDdN0AwLTYAbc5R1mg3bUTHoc46k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(366004)(396003)(346002)(376002)(26005)(186003)(2906002)(38100700002)(6486002)(5660300002)(31686004)(2616005)(956004)(8676002)(66946007)(110136005)(4326008)(31696002)(8936002)(16576012)(478600001)(66476007)(316002)(66556008)(36756003)(83380400001)(53546011)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emxyNFVRZUNTczgvR2VGYkhwWGU5akhmZk8xVHRxc2lBdFBpZ0NVTElFbzFw?=
 =?utf-8?B?SmdWVFdDSE95MUgzMnlyQk1UTWl6aHE1aXpxTmROQy9lczVZWVAyRWN2M1FE?=
 =?utf-8?B?R2ZsRXlIbld0cytuVlRhenZvbWJjWXlIUndvOWJKSjRJb0xiNWMxZ3l2ME9E?=
 =?utf-8?B?YzdWai9hTjY0VTUzbEVMd3FuSFBxQkhER29XUk10clJ4NFJ6NzM3bDlNbVZR?=
 =?utf-8?B?Z1lZSWtra3JmV1JRamNOczJTUHVWQ0xnREN6RTRXOFN0OFMwbWYyeE9IV3hW?=
 =?utf-8?B?c0ZsVW11c011ZFBRb1pQTzZwQjVyREU3WUxJMWwvclBpYzVhZUJxdC8yWi9N?=
 =?utf-8?B?YlhwSWpCbFRZVnNadXNManVnTTJUYlVXNFBtQ2VJbDNoQ3pkcHptMVZxaUt6?=
 =?utf-8?B?MUxnWlF5SUx3ZjB1TUZrTFpaditxdWtyTGNrRExrK2tOSU9KQXVTL21tS0Jj?=
 =?utf-8?B?YlplQkVWZkptYUVGK3IrY3JEeWwvM01HMU9DdnFES2xodXBScFhwdmt2OHZW?=
 =?utf-8?B?OHFjQ2VHYjFUcVVORCtUYU53VW1yYVk5clM4VEd5Y2JzSFVSalg5WXVmaEo0?=
 =?utf-8?B?UnlaNHdNU01RQ2RNWWJsdzBHZVZ6aUhKZEd3djdibGluQ0tEU2Qwd2gyLzhH?=
 =?utf-8?B?NWJzSFFuNU9BaU9XbzVUb1RNNi9qWndGTmtzVFFhcnd5RFp0N0p6d2F0UVJo?=
 =?utf-8?B?WjZOUm42VE9ZS2tlenZIU1BseVFPV20zNHczcGUxYVREUEJLK3FlZlB0QjFX?=
 =?utf-8?B?ZkowUG5yU1o1b1dJS2lOYytOMkFjYmc4QjF6d1c1WTE1UkZ3cDhSYjBzcURR?=
 =?utf-8?B?N0JGVWVlUktWZjQ3NGoyNjA1SVRFYmM4Q0wvM3NyK2lMZkZYVXhnRVh2VVlC?=
 =?utf-8?B?ZFo1amZHY0pFdDA4KzFRcDg2QWlKN2hFaTRzT0pieDFhWUhiZVpObmVmUXhD?=
 =?utf-8?B?akoxNlNVMFJnYXFWRjMwaHROUTlnZ0Z3Uk5MMTdlN2xpK3VXL21qL0NwUDVI?=
 =?utf-8?B?TDF4Uk1RY0p3ZDd0OWJ3Zi80WUQ2VTdNZzltQzB3OXN4L3F3NlU3RUhwQmQz?=
 =?utf-8?B?c3JGb1F1cU1YQWl1a2IyR1R0QjhROWY5TVpKNWZQZ0pxbEY5cjZMcnBVTUZD?=
 =?utf-8?B?S2phLytTa0hpQmdBdEJ6UmxhMTdwSkUxc20wL0ZZdEpHZDNMYTM1U2l5a2FU?=
 =?utf-8?B?amR0TjVMYUdFK1F4bms2SGs1bk92YkVobGNPUEJKMW9LTVpLMkdncVB3K0hJ?=
 =?utf-8?B?NFRReW5nU1BtMzhUdzlHTHZKb0k5S0JUQ1pJUitlb3VTVkRzVjJDeC84THVH?=
 =?utf-8?B?Zk1iQzI5U2xTNmJmTlJCdm5pQmQxVGN3U3FMNXBmSFN0U1NROU5aRmNKZFdQ?=
 =?utf-8?B?MW55UUNNVUZJQjIwV1BscnVVM2dGdEhFandpVWRwYmJYV2krcEhIY3FCK0Yy?=
 =?utf-8?B?T2hCM0s3Ym4xTUg1M1liOEdJL2NhbThoNzRVUThXSnpnd0p6TFZsbkpMdjda?=
 =?utf-8?B?Yjl6Y01zSG5nYm1nUlVnTjZwNnNYWVowMXo4RldtdmkyT1lxVVh3SWZnQ1Y4?=
 =?utf-8?B?U0w0M1A2MTk0VWRVdkZLeHVNdzB4ZnRPUW5zeGxOS2tBMVJwdWxRd2hkRjhI?=
 =?utf-8?B?a2d2eEVjelpRODJvSVpmVnhGRnc0eXp2aW1ZN1d0L3ZsbmxJY2RmK0wvUjY3?=
 =?utf-8?B?WVozNjNxbmQrMlhJL2MxRHUrUFV2bWswOTQxbTlsSFdQLy9ZaXFkcHhXV21F?=
 =?utf-8?Q?UUmnIXXU1wxBbF1eLzfq1+BW78qEJlaA3yPy3S0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d61fa3-6272-4010-bf5e-08d9661ddab4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 10:07:46.0238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+HOls2W2DrnAe+ItBtVDoOmNX01vuVIg9aISL9py7BfjK2RGDGP8QX6/6erAcbvovLbtBZ5EodXO8JVs6828g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 23.08.2021 11:33, Anthony PERARD wrote:
> On Mon, Aug 23, 2021 at 09:07:32AM +0200, Jan Beulich wrote:
>> On 23.08.2021 02:40, osstest service owner wrote:
>>>   commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
>>>   Author: Laszlo Ersek <lersek@redhat.com>
>>>   Date:   Wed May 26 22:14:24 2021 +0200
>>>   
>>>       OvmfPkg/PlatformPei: remove Xen support
>>
>> Uniformly from 4.15 through to 4.12 (the latter of which shouldn't have
>> been affected by whatever has been pulled in in the first place, given
>> it's a security-only branch, but with the OVMF commit to use being
>> hardcoded in ./Config.mk I don't really understand how a possible
>> change to the OVMF tree could have affected this version) tests are
>> now failing, everywhere with the above bisection result. Given that we
>> want to get out releases from the 4.15 and 4.13 branches right after
>> the batch of XSAs going public on Wednesday, something needs to be
>> done about this pretty soon.
>>
>> Does osstest override ./Config.mk's choice? Albeit I guess even if it
>> does that's not outright wrong, and instead it would be bad if the
>> older versions wouldn't work anymore with an updated OVMF.
> 
> Yes, osstest uses "xen-tested-master" branch since c9d1e5896fe2
> ("cr-daily-branch: ovmf: "usually" use xen-tested-master") for stable
> branches.
> 
> We are going to need to backport a commit from unstable. Either
>     aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform file is exist")
>         (but has been reverted)
> or
>     81f291420238 ("tools/firmware/ovmf: Use OvmfXen platform file if exist and update OVMF")
>         (but it also changes the version of ovmf pulled by default,
>          which we probably don't want to change)
> 
> So I would suggest backporting aad7b5c11d51.

Anthony - thanks for the quick reply.

Ian - that's largely your call then I guess.

Overall I'm not convinced though that backporting either of these
changes is the way to go. But I say this without knowing what the
background is for osstest's overriding of Config.mk. Plus it's not
immediately clear to me whether backporting is perhaps the only
approach to keeping older Xen versions working with up-to-date
OVMF; I'm getting the impression that it might be.

Jan


