Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8BF444FFF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 09:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221294.382937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miXuN-0002lA-Rx; Thu, 04 Nov 2021 08:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221294.382937; Thu, 04 Nov 2021 08:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miXuN-0002ic-Ol; Thu, 04 Nov 2021 08:15:39 +0000
Received: by outflank-mailman (input) for mailman id 221294;
 Thu, 04 Nov 2021 08:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miXuL-0002iW-Vs
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 08:15:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 616d4661-3d47-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 09:15:36 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-kQWTqm6vMRyEri5tWctLiA-2;
 Thu, 04 Nov 2021 09:15:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 08:15:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 08:15:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Thu, 4 Nov 2021 08:15:29 +0000
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
X-Inumbo-ID: 616d4661-3d47-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636013732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrBAnLWCEJ+V7odonJowqC18zN8nm0yaxFTMbA0KT8M=;
	b=QoxJdwbAJnz3qtYk5IWYaBNirtzIT+pgtUBIAQSI/r5pYRkhmOV834cGz+UJ3DFvF9CXPS
	gwY2fwwIN+4mXBLyxz8b7RabjSfYlMcXHcpqOAQGPt15Icc+7H1K2RZhkf4uoMTHiEluWt
	Mj3ZbX+x7/A1NN43FYXXS3ae9Lbsen8=
X-MC-Unique: kQWTqm6vMRyEri5tWctLiA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmzyU3D8wwAkpsB2JaIdnI4duXWrewat7mAACivE199ChU4olo0BRa2w/CSEqnuyZIfHvtAcK03rQr0jIly5CtwpXVyXDpMZGAcXTuhCpwFzvTNdIoEpUOcarnwr28p1+fa3Vku69htMRbs9HieaFCk5OG8Q0EqgVHLvlCxFOn108tOIYeMBQQdvYg2lrHleIiG/QboVpbWrGtc8iLj3grN0eMXHb4+d7dgBxJlIu4BJVpMiAsPV6iUO6hazwgcjCyawYrsigyrixGHcvPJgBpBmNCLznLnS9c5uodhWps2+nwKP18VmqhYcgw27ByqP/zk90wau1UGw1B6jBryMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrBAnLWCEJ+V7odonJowqC18zN8nm0yaxFTMbA0KT8M=;
 b=elI2A41vmyhUQWpmsnIYVkBulgc6s7VDDoG9rEUAriwvGPFuCJhAqYVOFWcvgZkTilrmabZSqnZl/9GhSjljPqmBWGGrx5Hq+M9EJjlBea+6/mIJBjrOe3G9EeRO6kyqPSlP6Sqf+nRNO0Tw3h0WDnRdQSD4la84THDHX7M9ioV1ZzoDui5U7uhjpgqmxrz65oBl0+o7Dg4dd9TGNjSI++IWF0uY4EkLeNdYJemN/jvFL+xGtchsIhlKMUXGUq9MTFt9KkJ4lyQLB9OF944LYLpWDxYbRZPxIJK+K8F2wOFoBMuUcNQ784iA8Jrb8p3R8jIi0Z0G7EFN+gkYBveYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d65c4a1-129c-c9ba-15a3-6780c3c8d9a0@suse.com>
Date: Thu, 4 Nov 2021 09:15:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <a51d6449-caba-8a67-3c11-b593574f3839@suse.com>
 <dde21f84-861f-9c68-5e55-28f5bf407aa4@suse.com>
 <24962.46734.824520.805708@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24962.46734.824520.805708@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f3f54b0-c441-4092-6176-08d99f6b43f0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590298BE6AF52DE0C441C2EEB38D9@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DpzBi75+Z/M9LlgZv38+8GG0+KBM01L/nBVWDiGPMKj2Lc3vVQUnvRxTRM4c8Na+VTe1KHpxBAtD+iT2/4MW/Ndzq31g/beAEJv6hsN0+l3K6T6shhH5MsrkwXxfgD2xq5dsBYjl/pm26ddV84pIB38Fv4M+u2ZFxKVZ9SlK7tHC/IuUPVZUFtS5jUVfVy7vz46E/qbnEAxOmLEQTcSmlZjmtBEGGTSu1ZqCQ68c/Th6p1KpvbZRhOO76aBV/Ath3V+bZpq0U8gjN3mqALFTOMEQi4mUtmWi+D1w/k0duxsmkNyxlszpuj4Als7wLg57CvGiUkSknjpIrS6gDHXT36btyyygSlTvgkU/ps0MCHnglaPRYNwKUo23r3dWjzKwho1TF97NSh/bxQrEzS6SuhDFsEn8o5V+7bAgQyg/xkmSGxHjxRQupSGOPRpB8OpMIkw1LFkrl+MIYfPiBE7yWe5+HZW6E8wKIJmvC8VLIEot8lUUdas7lY9or7h1HzZ8FIGfBEcwzyxlH8IpTNTT0RrfUnd4SC7WJ1RyBKybFlnV/jGjsEJV1koXCxZDIvtDldP/sfXXYNhq7usZ2hdwWtQqU1NmL64DGacV5IUvf8UJDEHcgk8/nAyoWfqDmfqU1QSv5ukMfsFg2xEFRupS+txYCfbb2yQrxet1ejuMATqjqWMzei5OXHY0Mtxw5WjK3QEVwGGpvPWMxLes+ipKs5Mal3fg2PtzwZdl4bo/keE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(6916009)(66476007)(508600001)(86362001)(53546011)(8676002)(2616005)(5660300002)(31696002)(38100700002)(956004)(16576012)(83380400001)(31686004)(2906002)(54906003)(186003)(316002)(6486002)(8936002)(26005)(36756003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlR5UzBodjd6T3hYa0NEUTRCSTF6VnlzZnRlb3JIWXFlamFsVnFYZTY5a1lG?=
 =?utf-8?B?K0w4R1NJWW4zS0VrWFRQVE1ZeWh3V1V1M09sWEhaRTczZHJNOEZNMXg4OGJD?=
 =?utf-8?B?Q3Irb1BLOVlHNnNhd2duS1dIaVlXUS9uS2pQQUxCZU1XMWtHZEtpNW55M0xh?=
 =?utf-8?B?S2pOdUFlWmgvQlV3U3ZNQzZNLytrR3lqWjQ2ejk2Z0RkVlVvVExFbGlNemsy?=
 =?utf-8?B?RVFKRFdmQllrbGtlTGoxT0EwUHllY2JzOUxRVCtmcGhXb1UvT0VYaDF3QStx?=
 =?utf-8?B?S1hMbXZvbHJULzRNSk1naU16THdhUXZ0Ry95d2FLK0tTZW82ZUdGN1JpL0t3?=
 =?utf-8?B?M0ZaekJUbTJCVjQrVWxSeHJVeU1zWG5RYW5zTjh4cjg1UmNvUndKVDhyL2NQ?=
 =?utf-8?B?VGpkWm9QZU9kOHNGL1VGL1J3ZG5GSjlpcTR4OTR3c1VReFBDK3Z3eCttMlhL?=
 =?utf-8?B?Mk56WWVDZGxhcDM1aGdmRVVsOFI4enNPQS8ydURCSUhHaDZ0SkJFZFlaWkJC?=
 =?utf-8?B?ZGJZa2E2QjZQN0ZLYzV0eHY1MG45SW9GMVJ2VjFzQmswczFBYWtjMGNtRFcv?=
 =?utf-8?B?WUFDUU9VNyt0MkRHLytZUTByMmNna0pxWmNheWFqbkFSNk9rMFZUTDE1Q3Na?=
 =?utf-8?B?dlBzbnA3dW9zM0U0Y1p2Qzd3R3FqS3YvQ216cHJ5L2ozNGlFUkhSS2dkVXd3?=
 =?utf-8?B?emZydzZpRlJpaGlOakFYVlZhUmx6Z2VSdlBJYklVUXYvYjBqbUtvN2QwYWdr?=
 =?utf-8?B?aSt4SkdSWGJEWEVhU2RYcGN5QWZxQnhYSVZnMisxWkdiK1VjSFlETW5NVFZF?=
 =?utf-8?B?OUoxZ0IvWk00VHJ0clV4T2FEZ2cxc0ZiTjhXK0JVV0sxSEdQMk9mRVIwM0Ft?=
 =?utf-8?B?bHZ6dXI0T1d2ZnFqWk8zMUZZY1JWbkErSWx2eWlYRW5tZzFlbWY3OGdjRnVH?=
 =?utf-8?B?eXMvcjJTcEw2SlR1b0xUTzJpRHVjT1ZWVjlaT05zK0wvTVJuMVhHSnlpTzVF?=
 =?utf-8?B?RVZxTGRmc0pib1ZUcFJ1VDZoSVkzdWVjU29RTVRDWDRVTndFNmNLYVVEZE43?=
 =?utf-8?B?c0NhL2UySFFIeWtsQzFNL3BmS0tjTFBIZmZMYWJkNC9xRGltYmZtT21lbEsr?=
 =?utf-8?B?cHN3eCtDWXIvNnRKekEvc2NLS0hmU1k4eGI5SFp4Yk9RWGVBd2xRZC9sSk43?=
 =?utf-8?B?TWxJTTNRR2MvZDR0OWQxcGhsQ0M2SXFTaTFhWktBQVAvRVQwQ05JTUlyVTJn?=
 =?utf-8?B?ZGVZS1hGem9tVlUwRXp4SlJ0TXNLOWMxUmZ5bzREM0xvNHFZWlJxc0hiVmpU?=
 =?utf-8?B?ZWxGTjBxN09uRUNHQXR2cmgwekhuQUk5VmFFTG9hSEg4OHN6eVhCc0V3NHdI?=
 =?utf-8?B?aGZsUnp3MnNLYjJsdFBITjZyMFA0clVvdHJLejgzRlczLzV3N2h5aVNrMWFn?=
 =?utf-8?B?Rzd3SjlQTnNoRG80UEpNZDVBTit1d3kwcG42YThOaDB0NUxERS9rejBId2hV?=
 =?utf-8?B?ekxHcTlFSWhiU2VtOFZ3bjRGMS90Tm1nNlgyR1YzZC92TXQveU5wUXdRNjdT?=
 =?utf-8?B?NmJVZ2RLdzlyYnlqdnFtYVVkSVQ2Mkh6cFlKVkpYQTVXVHlJSEtZOERwaWZX?=
 =?utf-8?B?OTFnTDlmaVl1Nm5CZnVtMm1aL1ZrL3dDendKM1RxVVZmd0MzeE1LajhpU1Rt?=
 =?utf-8?B?ajRkdG02R21NU0NPdHV4alpZZUphWWJJNlhEUTVadlphRWVwdGE3c2U4TzMz?=
 =?utf-8?B?TjkrNzBqL01mbi8wbTlUb3B2a2cxWDIzQVlQZ2RGT3k2SDgzc3pxc2JQc2VQ?=
 =?utf-8?B?ZHpPU2RwcVZLODZoNERxNHRrYUJmNHFMMTQyRm5hVW9DYVd2a0RFYlJha01u?=
 =?utf-8?B?MmZHUTNXa05mV0JNUTR6WWYvYlprbytIZ0c2L2hKNVVGQll5Yk9XL3ZZZ2RN?=
 =?utf-8?B?N0l5ZkhmSHgrdkJCcTZicGNZMDROVVJVNzJPNDJSRzBPRVR6S0hkRFNkQ0tw?=
 =?utf-8?B?Wlg3eUxzNHI3OUNXRDFrQURhTmVXYTV3NUJGbks1TGFLdnFKVks0RFhBOHFL?=
 =?utf-8?B?RlJ1bTMrdjFaaytnQWdIVllJYXVGVlVpREV4WUQrVWlVVUtkQVZYdlFwSkxt?=
 =?utf-8?B?Y3JOQVg5WlRpTC9nWEl6dDdzZVp1d1dLVzAwdVpVZmlwTTc2cXZta2F2YmdG?=
 =?utf-8?Q?f+R1aLMr9DuKmurmJSpfkEU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3f54b0-c441-4092-6176-08d99f6b43f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 08:15:30.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6qRRebEw30S0q90YyiRqTR6yoxZLd6JYXcFdYQojmRPU6Hw62mFXv20ZjNOVWdoTQoA/NsRgB2XOiy3ZASAcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 03.11.2021 17:19, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling"):
>> On 02.11.2021 11:17, Jan Beulich wrote:
>>> On 21.10.2021 11:57, Jan Beulich wrote:
>>>> In the course of reading the response to v1 (patch 1 only) I realized
>>>> that not only that patch needs further adjustment, but that also
>>>> further changes are needed (and there's likely yet more amiss).
>>>>
>>>> 1: x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables are missing
>>>> 2: x86/APIC: avoid iommu_supports_x2apic() on error path
>>>> 3: AMD/IOMMU: iommu_enable vs iommu_intremap
>>>
>>> Ian, while we further discuss / refine patch 3, the first two have the
>>> needed R-b, but will now need you release-ack aiui.
>>
>> Seeing your reply on IRC, here an attempt at a release justification
>> (the patches were ready by Oct 29, but no-one cared to commit them
>> in my absence, so I thought I'd get away without such a write-up):
>>
>> Patch 1 addresses a regression identified by Andrew. The main risk I
>> see here (which has turned up only very recently) is disagreement on
>> patch 3 which imo has an effect also on what patch 1 does, as to the
>> (non-)effects of "iommu=off" on the hypervisor command line. This,
>> however, is not an effect of the patch, but pre-existing behavior.
>> The behavioral change (in this regard) is in patch 3, which is still
>> under discussion.
> 
> Thank you.  I also went to the list and read the thread there.
> 
> Patch 1:
> 
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
> 
>> Patch 2 corrects an (unlikely but not impossible to be taken) error
>> path, supposedly making systems functional again in case they would
>> in fact cause that error path to be taken. The risk looks low to me,
>> given that two function calls with previously assumed to be
>> identical results now get folded into one with the result latched.
> 
> This one also:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks, but your reply leaves me a little confused: Your use of "also"
may mean R-b for both patches but R-a-b only for patch 2. But I could
also find a variety of other interpretations, including that the
first R-b really was meant to be R-a-b (which otherwise I'd need on
top of the R-b anyway). Please clarify.

> I think, from reading the thread, that patch 3 is not targeting 4.16.

Correct. The other related one now targeting 4.16 is the separately
submitted "x86/x2APIC: defer probe until after IOMMU ACPI table
parsing". But I can see reasons for you to prefer to have that
deferred.

Jan


