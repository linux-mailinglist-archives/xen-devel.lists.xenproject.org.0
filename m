Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD394865C0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 15:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254027.435524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TMP-00050Z-Dp; Thu, 06 Jan 2022 14:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254027.435524; Thu, 06 Jan 2022 14:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TMP-0004yU-A0; Thu, 06 Jan 2022 14:03:21 +0000
Received: by outflank-mailman (input) for mailman id 254027;
 Thu, 06 Jan 2022 14:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5TMN-0004yG-Id
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 14:03:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66250c71-6ef9-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 15:03:18 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-Gs2abGBrPomPGmVdji0m7Q-1; Thu, 06 Jan 2022 15:03:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 14:03:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 14:03:15 +0000
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
X-Inumbo-ID: 66250c71-6ef9-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641477798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9OG7Mt3nj1MTF+F5dsEJcvWLLMMpxGVlaMwAuuxSTw=;
	b=Pia70J/jDFFJ2YYdItFk3rXwIDRS9LA2mLDES7Ljs7557MfEImdAlxnEkULo/T4nIqSwNy
	3xExuuFPGRF+XOLLnMovjRNet9snD4xjnECZMNQb4I5ex1+EYd7Bbkzg5vAnkamIFsaCoI
	8St+nxibrfmH0ay1oJFFHWR7pbT/MfA=
X-MC-Unique: Gs2abGBrPomPGmVdji0m7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CswebqODQSg3vUDicyndRidA6bjH8As1KR045LxaArDTPRDMFaDvpPrDdNiYYA50XGd9h10JhqJKxOhjhUrLHU4pY2KYeZh7ThZ8XOwHkNaS8bbujoiniY0fp4mWbx2UxECvCcR5Y0Zz9J0rNIBzaDBpgUuPpGfTKUjTYS5mW13XH7J4R9rEy39j8a5WHatnvlS6AzkYMII+E/q+IezX31vUV//YGMkjRIakuuWCQ/kWp09G0phJAZvkvSzd+HmZWQsO5K8Zt1LBpGMatOjSmkIDTz8sMMLYti3Y8LnhQIh4NBgeziqone4Q+VaqKIzDlJvRAn9QcusnElVQIzekNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9OG7Mt3nj1MTF+F5dsEJcvWLLMMpxGVlaMwAuuxSTw=;
 b=kw1243sfZjA5nO/d7QqW02fmpwRM/AdzLl4XQ5CaNzS7A8pVh7zRU6R68KtbFGFhQkvf4Z3P2EHZ+kxntDT8D1OwbUJAC8t1aVW4BGpoXB3SqKPgmNcYbK/mOpAtW+YGomNpZj6IObFOyoBddHQoGdrHyd1fUy8whbpP2my5qMVjBxvEr0Mpf4m1Weau/e8k8fMuJ5/XImJUtxea6ZB84Mk9s1U2npcvuHGQnFpiQNi1LCaW32nCoqv0Ufhzr16WWISYXnXeCX5lnce6icvZc3RbjNYN+bDvf9Q6uws+jh5raSyNxivr9RI4+PbYqtajVZsgtG6BzJykBiG/4hDDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09333371-92c0-5c90-4b4c-59b2ed9ac60d@suse.com>
Date: Thu, 6 Jan 2022 15:03:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: request for feedback on a Xen/Linux compatibility issue
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: julien@xen.org, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 boris.ostrovsky@oracle.com
References: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>
 <4ea34f61-e72e-76c3-5c20-879fefe4c7f7@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ea34f61-e72e-76c3-5c20-879fefe4c7f7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0039.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da96dbfa-831e-4771-7b89-08d9d11d4853
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61752AB9C795A6E854253E12B34C9@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HonlUUzntaa1KR+cPLDCZ7/TqRF7UlvRYhUvhK4tQrM1oxXIV5am67DszGP8KCNde2sGWpAIvY1yBQ8jFwyRG0MKesQ16oC02gi0ubeqfJ92NqrQPOaSVi522YrD8iMEhqphfVNjV7O0/y0Hjhpdzy/WKsVPuSAhDO4iKwQ7pO6Pr+u0xrYKPYVLajYKtSksAb7r+rMZJbKy/uVa2/GmXbf72nFlkA2mI/L8d7Fi7cmUoxBmv3TLZEAkrOHVfmNUWjXIqKy+m8fcoWSxPHDtskmiqHxVMc7YVz9BIW/P/4cp+WE3po3t5E+2Q5+Ed09DEBx40aY1mahartbpkBvjs0zmjRDZH4m8jLhth37VUSz2eTPJLMMB7XZGOUUBcyBGWa6738C5SGwbIo9gQWSqbC1eWu/euSXxJxGhh7A5Yaf5ZTD8mcd23bkd/fHj9VjA6nMFN97BPpfCxamfFPYDIRKHODSrl3amkQsBG0tT8oCw2iVga9nYQGuKI1vCZa0d9jIz+Ja2qbQRnSIHOsXBXo10VhKZPEB7N0vNIP+z7ESTYPWgsmQ61nyfpL22WHj5WYfvU0HC8LRExsytD8XeSqtdpQMzD2bvGqjCFtJRqBB1T5kBa9rsBD1xDuPAthYPHbuOmSwbAhKlFEbi3s3f5Rj2ii8Dc/QgLcqiqMR0eENl7NDFAiPz/Kyua1WI5UtLKuWtWOqDtiCuvlleH3YpsI1p+Hz5TDRKrW6ITfk8OSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(8676002)(6506007)(8936002)(6636002)(26005)(6512007)(2906002)(508600001)(2616005)(186003)(4326008)(6486002)(31696002)(66476007)(31686004)(66946007)(86362001)(6666004)(66556008)(316002)(5660300002)(83380400001)(36756003)(38100700002)(37006003)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01yMHpVdUc5TllWL2J6MHBGYndIYUh4cXIxZExuTC9Ia2VtV1QrMWg4cTlp?=
 =?utf-8?B?VFVZbW1qcFlQaTc5U29wSXlYd2tKLzcrdmlPSnJRdXh4aHdLMDRQZy9xRzk3?=
 =?utf-8?B?bVA0RG1RMUNPMlA2WVp3bzZVbUovb08yY3BxUVJFT3pqQjJWV1VueFl0N2oz?=
 =?utf-8?B?ZDEvZTlveit0ckxnbVVBT0J5OUZvbUxIdWcweEFzYWxXS1k3cHgzb1JSWU1h?=
 =?utf-8?B?ZmJLSWhEZjBlUEE5MWhqcWJRRUNxUmRKMStZdVpsaHgwelF2a1ZGVHlyWXRz?=
 =?utf-8?B?RVRtN0duTHZ3eTlLNXR0WXNZdzliWEYrY3owU3VJbUZ5RDk0em4xNFd2cFBu?=
 =?utf-8?B?Qy91ZU9hdFkrU2xTNUU1N1VkWUdhZmxiSFlBL2s1MEYrd01KdysrYlFQUzJO?=
 =?utf-8?B?UW42elhBZkFkYUFMSGtsYzQwTjJZSEREbTBuQmdKR2o1YnFTaVg4eUoxc0xr?=
 =?utf-8?B?bmJkZm5sRUJqMXBydnNXQVJLT0wzTzJ2QXVaZFp4V3FBdGpWWDJlUE9NZmdw?=
 =?utf-8?B?bVhzTkh4dWNnM0Q0WGl6cExqeFBINDVXNmVUTmZRY25UVjJobG81bUZpQTR1?=
 =?utf-8?B?TDY1d3dpNDEwdDNyTGZTRU51MG9xN1Z3MHB5NDdualA4dkU0RStzNmdubjZR?=
 =?utf-8?B?RE5xTERTaHZuNlBoUW82NHo0SzFnWlU5VjhHS1lxN1E5VTMwNXJjVGRNK2x4?=
 =?utf-8?B?MSt2SXJzcFhPNmM3VjU4SFllUk1vb0lFSGYrLzFrc01yVkp5UW55UXBUc1BF?=
 =?utf-8?B?cjkrQ0diUllNZ0R4NFk5OWpoaHM1c0NSZGVzN2hva2FMcVo0MXJSZWpLTEx5?=
 =?utf-8?B?dXhpYVA0cjRpYXQva01JWWJoOHNORDdlSlM2NlFTNGFDUHV1WlpIeWhLSDdW?=
 =?utf-8?B?OHcxcHN3c05VZXVxUVZVSmh0cWhpZTgzMDF2WGdrMGVzeEVSNEIwNVlQanU0?=
 =?utf-8?B?RVZZZFF1dWxTajVoNGw0UVl6OUhreThFVVd3d1VyVlZkemxZZFU1cEw0V1NN?=
 =?utf-8?B?SUJnamNuWnRvbFVpMGtLbWRyRUorakt0cVFacjFYcitsMEllaVFNREtFY3k5?=
 =?utf-8?B?WERBdUFaWWE1QVhudk1WeEluaEgva2NyeUdTZVlycWdIVVZYaXZUYmhMMFNv?=
 =?utf-8?B?clQvc0QrQmJKZXcxeFVUNjZEQmJKMmJFWTBXL2gvNStsaEN4c2FYR3liU255?=
 =?utf-8?B?T3NVY1U3K1pwV21ZZnc2cEk2cnEwbjhBekF4SkNPYTdCaUl4bWhyY2tYVWFC?=
 =?utf-8?B?eXh1clVyeGFaNFgyOEJLMW1RSW9QV1gyaDdpTzNWb3JQcDhhZE1VTFJLVmpi?=
 =?utf-8?B?UHVuM2JuaGQrdFZZbWJaL2pHRmxwaXhqb0ZhdncyWHBCTjVDZUU3UFczOW5Q?=
 =?utf-8?B?NXFPSTEwaisyU2k5MHUrbmtvY012SlgweGVQU0hWMHNJT0lucmZrVlpkWlFM?=
 =?utf-8?B?SStDbG45dUhZTU9HOXVnNXNMZWk2bHQyV3RibGN4NEJTcFNlVXpZQ2dRSUls?=
 =?utf-8?B?STFSNFFNUW5MVmw1TzV4L3Q4M2VPWGJWZDBZb09QTW9QdjNHemp5UG15c2N4?=
 =?utf-8?B?L01nWklSNTMvcStEbTEyWngyaEFYZW10Y3l2SlZmdlFLbGk0em5mRWVYNmNZ?=
 =?utf-8?B?a2pJYVlidmRsZGFwRGtoZXJCdGIvck9ZSWJlTkZnRDlGV0M3N3dqZUxrdnBs?=
 =?utf-8?B?TXI1Q0oveUxGazJsdVVVUW5sU1dwNGZqTDh4c296S3J6cFdZeGM0YUxWaTM2?=
 =?utf-8?B?QXlLWXZpQTFJT3EraGJOYmZBY0JBdXA0SHFQeDFidkdPeFgzUTkrZ01Fcm1x?=
 =?utf-8?B?dXEvbnl1ZHlUY0prOWx1M3Z5VURwYUZrUXNBaStnRXpWc0lZSm03Q09hUlFv?=
 =?utf-8?B?VVQ0Zk1kWUN0RG14T1NYNEloQzFiQlhhZVl5WFBha2ZoZUw2cXZXeGpQYlFG?=
 =?utf-8?B?RGVRSUhMK2g1RlJJZW4vdGN3WDdudGxoYkVmbzIrZFIyQ2xPaENuNnNoS3ZJ?=
 =?utf-8?B?NTBPQmxnRjlKNFBpaVg3QWhhWWwwTnJ1YmJHZk1aUmFwMmRyNDJLZ2hacDY4?=
 =?utf-8?B?bjJ4am1yQXl1ZzRYZEZtVGU4RWR5eE5pNmZaekpmaThOdDVhQjM3SFgveG9m?=
 =?utf-8?B?ZFYyQnJOUHlodDJoa1VYVVlmTUU5RnAvdVJwTW9TSFMwdDBoSmo3RjBnVE12?=
 =?utf-8?Q?mND10tNHKbq9daizayk4cCM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da96dbfa-831e-4771-7b89-08d9d11d4853
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 14:03:14.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1Dx/JU8C+fZrd6wbqk5HWb35sSDfBz3ZTbLPAtwKUm7b8odGK9tVKu5obFQF/zepc6qFQLE69tjFtgHM5gvkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 06.01.2022 08:13, Juergen Gross wrote:
> On 06.01.22 01:40, Stefano Stabellini wrote:
>> Hi all,
>>
>> Today Xen dom0less guests are not "Xen aware": the hypervisor node
>> (compatible = "xen,xen") is missing from dom0less domUs device trees and
>> as a consequence Linux initializes as if Xen is not present. The reason
>> is that interfaces like grant table and xenstore (xenbus in Linux) don't
>> work correctly in a dom0less environment at the moment.
>>
>> The good news is that I have patches for Xen to implement PV drivers
>> support for dom0less guests. They also add the hypervisor node to device
>> tree for dom0less guests so that Linux can discover the presence of Xen
>> and related interfaces.
>>
>> When the Linux kernel is booting as dom0less kernel, it needs to delay
>> the xenbus initialization until the interface becomes ready. Attempts to
>> initialize xenbus straight away lead to failure, which is fine because
>> xenbus has never worked in Linux when running as dom0less guest up until
>> now. It is reasonable that a user needs a newer Linux to take advantage
>> of dom0less with PV drivers. So:
>>
>> - old Xen + old/new Linux -> Xen not detected in Linux
>> - new Xen + old Linux     -> xenbus fails to initialize in Linux
>> - new Xen + new Linux     -> dom0less PV drivers working in Linux
>>
>>
>> The problem is that Linux until recently couldn't deal with any errors
>> in xenbus initialization. Instead of returning error and continuing
>> without xenbus, Linux would crash at boot.
>>
>> I upstreamed two patches for Linux xenbus_probe to be able to deal with
>> initialization errors. With those two fixes, Linux can boot as a
>> dom0less kernel with the hypervisor node in device tree. The two fixes
>> got applied to master and were already backported to all the supported
>> Linux stable trees, so as of today:
>>
>> - dom0less with hypervisor node + Linux 5.16+           -> works
>> - dom0less with hypervisor node + stable Linux 5.10     -> works
>> - dom0less with hypervisor node + unpatched Linux 5.10  -> crashes
>>
>>
>> Is this good enough? Or for Xen/Linux compatibility we want to also be
>> able to boot vanilla unpatched Linux 5.10 as dom0less kernel? If so,
>> the simplest solution is to change compatible string for the hypervisor
>> node, so that old Linux wouldn't recognize Xen presence and wouldn't try
>> to initialize xenbus (so it wouldn't crash on failure). New Linux can of
>> course learn to recognize both the old and the new compatible strings.
>> (For instance it could be compatible = "xen,xen-v2".) I have prototyped
>> and tested this solution successfully but I am not convinced it is the
>> right way to go.
>>
>> Do you have any suggestion or feedback?
>>
>> The Linux crash on xenbus initialization failure is a Linux bug, not a
>> Xen issue. For this reason, I am tempted to say that we shouldn't change
>> compatible string to work-around a Linux bug, especially given that the
>> Linux stable trees are already all fixed.
> 
> What about adding an option to your Xen patches to omit the hypervisor
> node in the device tree? This would enable the user to have a mode
> compatible to today's behavior.

While this sounds nice at the first glance, this would need to be a per-
domain setting. Which wouldn't be straightforward to express via command
line option (don't know how feasible it would be to express such via other
means).

Jan


