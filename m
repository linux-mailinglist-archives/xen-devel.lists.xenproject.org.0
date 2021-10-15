Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82C42EE70
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210129.366864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK99-0003sm-IW; Fri, 15 Oct 2021 10:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210129.366864; Fri, 15 Oct 2021 10:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK99-0003q7-FV; Fri, 15 Oct 2021 10:09:03 +0000
Received: by outflank-mailman (input) for mailman id 210129;
 Fri, 15 Oct 2021 10:09:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbK98-0003pz-2W
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:09:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea50780a-2d9f-11ec-822c-12813bfff9fa;
 Fri, 15 Oct 2021 10:09:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-m0YwLdz_MAOuDl1-T66vnQ-1; Fri, 15 Oct 2021 12:08:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:08:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:08:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:20b:100::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Fri, 15 Oct 2021 10:08:56 +0000
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
X-Inumbo-ID: ea50780a-2d9f-11ec-822c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634292539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUDAo3tVpGKKJeF98JoZ41MZHO9meDQxahh0ucIWiv8=;
	b=avpbSAaIqa1zl6nzirtyPPzB9/OP16wkIlCis3hugd5xtyO5ElMUQY3bo/ykjsiAei9Q/N
	X0OUXrPCrN+Du8RpbKYacWtC6UUCEgxPOamUwem9EMX8+U5ZkIAsr7tH5F6zYfkT5NwKUM
	BZ9LY7zm51lAVgp9ZGxAs/lcrEjJORc=
X-MC-Unique: m0YwLdz_MAOuDl1-T66vnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYjWyZXIyfXQ2mJixILjYZGFB3b0r26npNclY368PMcSUcbnA74auipC7cO+hEYICcS3JJX4OgZEiZDi9O0lfzl37eg01i1L1Kn6Vp5f2fNdNeiVwvr7qq75HMtCTdU3F79+y2/NJYbdwUdoTuOqa+PZox5TVxQmCQDMI3DCb2d1iiCIKaKqCoshpgR0PAA7pCLE26er/P8iUbaJLxHHDp1wpETC0MI7uSGeDHuwEcxxGPYMe6ahbi2oect7Q59LFx3IWc9XnDSCEdCADvjE4KTb/LlCJRzKhCg7dNlEyIKdzTOi6YStecx+SRbIWVWNgd3/auqovkTdF2J2e+LCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUDAo3tVpGKKJeF98JoZ41MZHO9meDQxahh0ucIWiv8=;
 b=N+cbx/y3muq/gO1XJai1MzyE0PSLbFeHR+1UHcAkA81e/x+mVHv6Pl25AHGtgKTeHHsxMWmY55J5C7v8cWFlD6dxnorzpx+09ydWeJOu7bwdytFKDFNYN1RpeEWpbsjJ5gwa9KCbEwamRQgh+C+kmvTYG6dgVm7arVqu1W0vMD2bRJNYQHNqBcvfuJx6E5iEG7nzMbtpq+IBYECpp7T3vpaZkc7QDaKY+UAyx4Q3jMAztzXDqbCIsAYwRJPHtOCFbhPnWwz44DF3amxsiMVtD0Vo8fUHh/KY/8YIet+F63DlVjPmibigvALVI6x8q+NtlqQZC6+Cn+Qs7fX3zObRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-2-penny.zheng@arm.com>
 <073d4b36-cb2f-88b2-76d2-3438d4ef589a@suse.com>
 <VE1PR08MB521583497AD2D7A3FA3AAA8CF7B99@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e4895d7-9a89-59a4-af41-83668bfd1ae9@suse.com>
Date: Fri, 15 Oct 2021 12:08:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <VE1PR08MB521583497AD2D7A3FA3AAA8CF7B99@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0016.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10e1df13-8ddc-4639-990b-08d98fc3cd32
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352EAA3EE7EB7531BA9C567B3B99@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2b+l5jgQq8rtLSrXeM4LFk1Nwr81mbtWb0+7amkFjTdcPjfewWDeQvA5zdJ5a+i+sZBmf71yzrky3epv9NRW68bgLwKvz+rvORIscbNsa3Ykos1bqtRVc3GAPBbYRK149IuVnVYdKFZ7Je6zIt9QJhJLVTA/4pnBoRkcsFUxBjI07Ve1KfTsIWsJBRcdlEacS8t8xxrjdPAPCvH7xguNG+gTdYv2lZls+XrWo98BBkzqxaf+iOg8f9kenKmCu55Ok622R5P2tl8bmzrqpDkgMeR9k3UmUYq8MFrLpHg4LTQy7mKrEJr/M9+jZQElyAMSGdgbNRHLadtVr/+LUXQpHEdfXAOJ8uvErB5T40aPDGfHe3u52h5Mvl55ij1plal0l4Sl+d1x55nDwObcz3Gzy+T2dD9mPETeUrwhQRaNiEAFp0pXDOZGtlaVHEDPKQj9gfHx81hRlY2Q1Z9JjHBl6yY17TyXo+g6+PUXShHjAg0Qelf+39z2/WqaAp9uvlqJIAQBhofUs9hXaV6q7QnaysX9K/hfrAPmNSc+Y+PqCviDSxmIPUFJKahW6pbWxZW9KVrbpCoG/+Dj/Q4h19l31fCsXVT3OYBd6oDRXal3kMtya+vMDmo166E5Bd6cKy9AvpdBtGnaHvNbaIJcOyh7cdeUmi60tKLczusfgV7udWECkjCQXmKuq1gflIfcMM2iOt3j7w1OmcZlYR8ybn/kwieH9sDHS9Uqc2dj/WW9cehaleRhvqDTsZ4M7CP0Kx9HSyHJahT+OJHjAgyqMO8fWzNgCHr5iUxlhRKoZnqRxdjYNyrOpy+VtS/dcnMqI0CsFfF8RWFJN0lvFxOrR5b1FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(53546011)(316002)(966005)(956004)(86362001)(31696002)(8676002)(26005)(31686004)(6486002)(508600001)(8936002)(38100700002)(36756003)(66556008)(66946007)(83380400001)(5660300002)(2616005)(186003)(4326008)(66476007)(2906002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjRhejg0RWlacElNV1lDL3FzR3FQa25uYUhPYWVGaEMrSmloWHZ5SHRQQ3FN?=
 =?utf-8?B?eXdBM2VKQWw5Rno4ZlRIVDFYS3Y0ZVpITmpWdkpmZ1BJc2k4YWJKLzVzU1d2?=
 =?utf-8?B?WTQ1M3lLeHZ0Nkhpc1p3U2lkYjFXVzIreWcrMUl1MHNqRlRaZDUyYlNKaTdZ?=
 =?utf-8?B?RW1sK0s0M1NNZnpXaWZRRG1LV3g1UkJxbWpwY08vM1BsL2dwc1BBWXNUOWJt?=
 =?utf-8?B?UU9HTmpaNE80ZXp5dzZuMHBuY0F5WTdCNnlnSnQ2bDFpTEYvSW1EOXJhVHd5?=
 =?utf-8?B?MThlKzVaWGQ4NDkxZjVYNnhpdGhKYkVndlVzVHdRdnBHS2pSblNXa3VJMDdK?=
 =?utf-8?B?SllXdTBNY2JXR1E4NlBsSUxKNXJYeENteFF3RGhOTEVIT1EwV0x4SzNNdE5E?=
 =?utf-8?B?MlZMN0xOTWxBN2l3dnlwbVBVTmlFRnFmSnI1QnJ5akNZbytCUWM4aWVCVVZX?=
 =?utf-8?B?NkdCeW1uelBrUzJyYmRGNkZrWXFyMGxEKzJqYWlrbFRZbm0xNG5JYjQ2RXVs?=
 =?utf-8?B?YldxQmNza2w4UlJOS20xdGtyOVk0T3ZRQXc1Rkhud3RJTWJ5NVNLSTQzTFNp?=
 =?utf-8?B?U0s5WlFkQWJYRmFFUTVvMTlNL3hXMVlvV0J0RzRGU0ZQRVFXejkzK2piUnk3?=
 =?utf-8?B?WmZrZ0pCdHJtMm1SWVNWUTU5MVg0eHNxQ2orc3RLZmFYdTdlalJKOUw1aGZH?=
 =?utf-8?B?RmV4ME9EWmQ3MEhOR09jUEtQZHJTUExlQVVGeDFPMTBDVms3UzRnSGpqR1A0?=
 =?utf-8?B?WEpLY05FTTJqZnNvdUVYYVlRUTkwODcvQ05vTTF6QU5mVkVjZ05SQ0daeXhR?=
 =?utf-8?B?Mk54R2M1T1J5L1RhL1FSaWI2ZTRqVDM1Y3R0VU5ONDRtK21jeUZWWlhPcngw?=
 =?utf-8?B?TnBJMHZFYVlrcnZOTFA5eGxzQXJUMVpEYm9aVGpXdm54a2g3NlFWQU0wR2tY?=
 =?utf-8?B?MTI0M1dpWjhiL2VnU0diWGxFeVRFemtzRjZoTjF1cS9sdkJsVjZiWWViYmNP?=
 =?utf-8?B?dG4wcmVDUzB0TThlZFp5bzhJbVZqN1VsYVh5aXRic0pLazJDY3NwalRxenFl?=
 =?utf-8?B?cERpVjlaclkyY0xnS3hIMURGTCtLQ1BhL25jdlB2Qk5LM25iKzBJWmh6T2Z1?=
 =?utf-8?B?UjVsUjNxWEc4eFlaOHY2N1o2UDFEa2l0RVVqY1YrN0RFZ1laSEdQS09sUS9r?=
 =?utf-8?B?M2hpUzc5T003MHBxQm16UnR2ZGp1b1FFN3pVSENjaC91U3JFV2lBKzc2LzJZ?=
 =?utf-8?B?dFE1R0Y1WTlDV09xWVBFcW5Ya1hmVUlJMzVneWtyMlVyaWF3enZvVTRJTUxP?=
 =?utf-8?B?cGxlOHVKMHB1OExualMyaEh6ZlV1TU5zV2dqSUdaVlAvYS8xd2hpYXR1RGJO?=
 =?utf-8?B?WnY4TnU2OHhNMmNIeDlCYlJxcFZLTENZeTdoeEc4VkVDWmdWQ3NJTWhsbjN6?=
 =?utf-8?B?VDNpajE0dUlnM1BscFBDOVg2UzBVSnFwWGVEblYzYzVydHduNEpjS3dMbnRv?=
 =?utf-8?B?VzZjbHJLbEF1MDlxU3dMWHJoV0R5WmMwLy9udERFYlBIOFc1YTFvM1dGelc2?=
 =?utf-8?B?azFmTUdNcjRJL0JDQU1KdDNrSldySmZmcWtDOGg2cUhncGp6bWJ2Mm1TL2Ry?=
 =?utf-8?B?WmJLbklhUVNJNmNUcy9SWGJUV2RaL1cweEFTbmp6RzN5Yjl6Vy9PUFA1cUFw?=
 =?utf-8?B?YkprSXAwYVNDNktCcENQQ0NqMGFnRWp4cnhBK2huRVNyT1pIc29vRk9HTWhW?=
 =?utf-8?Q?/48zZ1AE3SWGLQ8ALSVEy/ru5xq1emNS0CKhnJa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e1df13-8ddc-4639-990b-08d98fc3cd32
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:08:57.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFrcXjlTGWLt8/MwvercCkjFYdYrWgQDu9vDtF4FN1KPK+pNTSUq/p3AETNmbVDb76Dm1c72Usulju4ZwHQtEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 15.10.2021 11:59, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, October 15, 2021 4:47 PM
>>
>> On 15.10.2021 05:09, Penny Zheng wrote:
>>>  xen/arch/arm/domain.c        | 3 ++-
>>>  xen/arch/arm/domain_build.c  | 4 +++-
>>>  xen/common/domain.c          | 3 ++-
>>>  xen/include/asm-arm/domain.h | 4 ++--  xen/include/public/domctl.h  |
>>> 4 +++-
>>>  5 files changed, 12 insertions(+), 6 deletions(-)
>>
>> You clearly had to re-base over the XEN_DOMCTL_CDF_vpmu addition. I think
>> just like that change (which I'd expect you to have looked at while doing the
>> re-base) you also need to at least fiddle with OCaml's domain_create_flag, to
>> keep the ABI check there happy.
>>
> 
> The patch serie is based on the staging branch with an extra commit "
> Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag", which
> Is already been pushed to community for review.(
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html)

I was assuming so, and hence I didn't also refer you to the vPCI
patch, which you could also have used for reference. I guess my
primary problem here is that I can't see what you're trying to tell
me.

Jan


