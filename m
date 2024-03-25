Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB31889C10
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 12:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697709.1088747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roiD5-0006rC-GD; Mon, 25 Mar 2024 11:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697709.1088747; Mon, 25 Mar 2024 11:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roiD5-0006pT-D3; Mon, 25 Mar 2024 11:09:47 +0000
Received: by outflank-mailman (input) for mailman id 697709;
 Mon, 25 Mar 2024 11:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qPWl=K7=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1roiD3-0006pJ-Lt
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 11:09:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01olkn0810.outbound.protection.outlook.com
 [2a01:111:f400:fe02::810])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e76b9b7-ea98-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 12:09:43 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 DB3P192MB2060.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:432::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Mon, 25 Mar 2024 11:09:42 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7409.023; Mon, 25 Mar 2024
 11:09:41 +0000
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
X-Inumbo-ID: 2e76b9b7-ea98-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKip9s3J2Rh0mpKY/LbKF9mUyt5avRHw290Fnpe93BVFsEpe/Trrk2h8PAsQpEojWBKtDPibiAWO2Sy2XHhLxAxT79S4FbPbEyQaZZbM2G6NKdYjCxLJMUpo70I9UkAGdaOt7RdQOQ7PrMdoWo/SRRkpyE4McZPMfWWCU+8+Qn404WIdULBaJYzurQBQ2YrM9p/XtuKB5NoT2EbM9UZU3xITh5wU+H4E0NLXe8XUbPZSFTe3qvR6og2HpDsvJ2vpJPJoKTuPbDJewZqKmWgVU/Dccwx69PTeqP8C9W9FGbEDD0kTUeH9rqsfBGOwFt9BGYzo3EjJIiniDGQIUJLZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13O3vWjujuICVCMCryvtTZnNiI43HEuqbfs30qmqdho=;
 b=Fp36MXhnwMxPwzKuEwRma7H2cueaslms90GeIWCL+kBZjpBC8da2459ogXiAl+3hgUODNK0mSpIG5lmKLRwWfbY/qGtVCr4t0zO0rquGzKMMnHKIF/txoNZ0nqB2YU+EzAT9s9tYxB8LKhsDm+rbMpehK/XUaRsh6gn/20SYTBjKS89OQmc0gP5jebE3Nrrx8/u7Zk/7ssJIIDSrrJnbV6cylRLUvUvw+BcEuDE3OSyy162ePHOnCn6jDl2dPZsidLTIlYZ5pEy1fcO2wt8gBDGy77sDL0vQwFRRXH7rhDLvy21KgbLD9JR4I44UJm3//jPUjs4d85TllWIKJ6okxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13O3vWjujuICVCMCryvtTZnNiI43HEuqbfs30qmqdho=;
 b=E5cY24yTDPxA1Mlj3DK9Zrq/tNTl1j6eRAT6oRjoduozMe6+5O2RB581oHWdUjQj2bYCyZtYlxXPXpzBwoai9dvtdfCNwy+LFr/MKx2cQgY8fFMi1DDgMPx4i6z6heTJe5OSJfYQPf+5lNrow/sieiYqL8eaJnTzxioXQBETqvQHaF0HL3LnG2uuggbPaBBwvC/u6rq7qzN7Ht2Ljz+yClaIgaSDcXGSyk0yoaq6GcHig1BxykIMTJsS3scqX0JbFV4UKQpjr6JQ2ZF0kbHnA5VRQChTQ6CJMZht1WMRriSqaAtylw0lQrQOVriBvL71q1Sn0pc9L7BCf3QNE/Y4hA==
Message-ID:
 <DU0P192MB1700FAE0D0CC005546F5363EE3362@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Mon, 25 Mar 2024 12:09:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org
References: <cover.1710920673.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700AA0337B5E6598E23EE0AE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <a7055af9-fae4-46d1-bf10-5d6ccf0747c3@perard>
Content-Language: en-US
From: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
Autocrypt: addr=rafael_andreas@hotmail.com; keydata=
 xjMEZHDtHhYJKwYBBAHaRw8BAQdA4C7O72UZHQbhHNm1BUkAM/7+KQKN3tupyuGVGyj2dIHN
 KVJhZmHDq2wgS29vaSA8cmFmYWVsX2FuZHJlYXNAaG90bWFpbC5jb20+wo8EExYIADcWIQTv
 ioHnE84MxV6adj/iFi3SALEToAUCZHDtHgUJA8JnAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJ
 EOIWLdIAsROgP80BAKeJdh3YQ5l3gxGp8R9wIvN9Ac3vsMfy8I4kZ6TXksLKAP9vLRV4G3yw
 z7/seKhWc27Jjl4uI/+lIWhWaWrUYZmjAM44BGRw7R8SCisGAQQBl1UBBQEBB0DE61lbAezY
 NhOlHgxdZ9V4klIhSajeU50O8wHIPQnCLgMBCAfCfgQYFggAJhYhBO+KgecTzgzFXpp2P+IW
 LdIAsROgBQJkcO0fBQkDwmcAAhsMAAoJEOIWLdIAsROghHgBANU4dj+WnuSaWemAHVkjERJg
 m0FQpmZzNI8hdolS3gYdAP9zGK65ilpHMDj4pGvfALabruZA4NPJYxSqeamHvOuhBA==
In-Reply-To: <a7055af9-fae4-46d1-bf10-5d6ccf0747c3@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [3JxXAktAODLT6vKlQnO9ghwN+eW995DqLnMzCwfscDeabb17eBzVFo9p/Mj1Hkm0]
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <2e49710d-cd5c-465f-a4ad-54548c0b207c@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|DB3P192MB2060:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a3decc-9a00-44f9-571c-08dc4cbc117f
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBvZAU3gE70DxtLQxW3YuafP7V8ojlLPEz6KlGUKPny5HuMqdmLAuw7zLB0xVwK85Fg/eG2KzNpuMHHBZBmBLsuoWPh0qDZ2/iIKy6WWfXKBf4/a/16FVqof0M3DGJ02YJRjag2uEwdvRS8FED5rGLhcmTRhfYPlY2o7oWBJuDZK4clpAOPXC6/9n95fAFl9vHn3UoPmmOyUAa+aiInJTunPov8XxnkyU8sYoeRMTZ2YDxo/9lcKQWFbzIxPqpbYR3wmhP+EqQDWxUoiVK+pUwSfqQTCVA+l77gt0KD4J5JVdBq8XlaqmU3z2QAgtFr0uWtwSiuTWhLSoZdzC8uHHXO84wCoqXjVYnYR2hoKLla45jrY3KBiV+aBk7IW9aDIV+U8DBxnkmjXu3x4AKXgqqip0spg54bQultUX3G7YV1Ft4tBb4wQvBHKgd3s9tDs4zhu3fCELE2WjuwzUyrFyI22uoXX1d8TRqbREy9MWRsebKLxmm8EcABqWPEIL1inZklJIriUxB1zBmSJfSMpF4RhRMhqB2tHVMnNQh6c4XnKGMTxX+me/tG8iswTjJnvlIZp968oy627p7KLxu59hx6HVTqlmw5MC3tZV3hg0GWriX9etgqBhzibrGe7GGjycC9CpGjAZv+u/VssdZ3jUcUsmN6dnK4LvV0ynU17CXzX8vMb3rs37xvm4VdA157FgNIuTIBoQFCR6QfO3CLyaUV402wolEuTMYJ3BNPbfvoH7uKGVeIT6ar8cY9vWERzoLAHaz5bKiN2JemfF7WMgArM
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oHJLFBSR9z5klvclngf3kWXQfc8UEeDQzA6XvYCjUiRp0w8enRRo/8wyPudRtC7xysByv/Sa0wDoNBk0dis4Nbf0WjgLgpxCNihKFFQxgxbCHW7SO67e985snDHiU6dJ3A5h/lG51G0C79JHkE3KHoj37OTD8tYtuYWTzTNw7pAzpLrk8pWftoA2DSRCYF7GqX1M/eq6vkKATmWra9tggSEPcKhuNXq1kBQvFzgAyAOB2xsIR7UJQZuLeNdyv4eRK9Eg/1lxAmZ7lqAoxMW6wOcQBv6Akc2EbgswVgzUaYk6OjFeEw/fi60dCo7/RnIa6hKtgHvJjLZG2BRfs86q6CYxrmii/9MuYVpyNXVISet8guxPi+QYoZSqEDyYJg4R/TjZarOBcSH8a/nyZVsxVpQIwPXiad0Nk5notbJjL0WkXiet+vcpgDOn8epxmQf0i+rJeetrYK8ngDRa9Vc7VRBqoF1tJdAlxer4+dIb0EbxCZW9r0e6epA8EMUNwBuxPOeojkMDJvgL7KKaCHMZVVMNxH1y5r+D8/N3p9OyC/WpFGR+xa9FWCPoHPVHrwt5
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SklRVHhBOGpEMlEybVlyU1ZJMmVmdG8veC9kT3ZKUXBtbnJsaGN1YjJvNXli?=
 =?utf-8?B?bkNsOU5pU3dmc3R1OGZVQ3FqbDJJUG5EVkdodVRrRW0yaDRLT0ZkZmxsa0tN?=
 =?utf-8?B?UTlVbmVHZzR6aGwwb0g4emgvbjNZc1V6WEhWc2g0TzErR01Bb2hMOGF4Njdl?=
 =?utf-8?B?VnFaaGhOZVFmak9JYlpVd3ZndWVOUFU3TkJNRmVnam1lUDFBQ3JCRlB2Sk5Z?=
 =?utf-8?B?cVZmTU5JOWg5V29UVXJKNUNyZWtSbEswdnVkS3Q4d0hjemJQT2krK3BRclQy?=
 =?utf-8?B?L3lIS1NlSk1STjhpT2NmTTZLRGtTQVRVUEpiMUh3emtDcWZwUDBVMkZEMFJT?=
 =?utf-8?B?VkJWZDJqUmRGZmlqUXlIL080RHloQU9lUHdCNkNoUS9GVkRzN3ZzMEQ0d2R0?=
 =?utf-8?B?NlIzQkhUYXYyZTRmWFE3azFpN2NtVXVVdXp1cUFKcnlvSzZ1Ny9DcWZQOTNp?=
 =?utf-8?B?ZkZZeUJvQXdKa2ZxVjVVRXNEUURTK2pTMVJxTnZNOW1scDFMMFVOUzF0d2hX?=
 =?utf-8?B?dEJKOENTY3BOeHdzeVhEdXN4YUlUbkx1MzBvQlc1M2I5WEdVZ1R0WDFuMDAw?=
 =?utf-8?B?WHd4aXdqMEJVbG10VnFRUU1vMGZuUHBNNksxMGt0U05EZnBDeGhrR21VOG9r?=
 =?utf-8?B?d0piZjM1b08rZ2NuZzgzdS85eFMvSkNRUnJxLzFxS21WaEtIRTRYRDBFM0c0?=
 =?utf-8?B?WXZ6OFNVcDloK2VXR29YcTF4eTBSNVNuS2Y1c2dwLzNDd0ZXUkZyN1hpUHJF?=
 =?utf-8?B?VVgyMFFON0NJRWhXUWFBZUROZXJtTWZkekpJaWhHeXJCQ1h4elhScDJ1bkNB?=
 =?utf-8?B?SkRXdWNHaDg0ZFFKdkltcTlDMWZ5eklmelJmWUIzOFlSMVFVNHhQUE1EdlZs?=
 =?utf-8?B?S3BWbDNTbmx6ajMzeVBtT3g5L1V3MzBFVnhCbC9ZYU14enhXTWpIRXh2QWpB?=
 =?utf-8?B?NCtKSFg4bklrWHBoTXVIRHpuOXYxN3c1Z1k1Ni94aTVLL0FTVG5nOHB5cUJJ?=
 =?utf-8?B?N3FTWVNMc1lJR1VQTmFtNmRVUCtGTVBGZWIyaXZXV012eWNSYitoVk5vcllS?=
 =?utf-8?B?dStJNk5NRm5rblJVNS9sOCtZQ2hIWVhEczRyem5NUGUxczQwQTlEN3NQWHI0?=
 =?utf-8?B?MEd5Z1Q5ejgrS0RXb01zazF5VnVKK0c1RERacXhoaEo1bFUzNVBuNVYxdzZD?=
 =?utf-8?B?YVM5S1pxUXpYcTFCd0l2WG5Mbjl4MGVtRlREUVJncUxycjBocEFRbGdZYngz?=
 =?utf-8?B?Vy9ncG9uMzEzaVVKTEVmSnBrUUpCanFlOWFpQ1d0VXd5blZyU0kvVmNmeDli?=
 =?utf-8?B?SVhmcTlIaThHSGltN3l3YkFrZVVNT3I3ZTg1SjhHbloyS0JnUnUzMUdQSC9Z?=
 =?utf-8?B?SW9uZ09FU1FYMDFZS0k5TThXblJtelUzajBIekFoQ3ZXNjRSc0cvUGJEMGNV?=
 =?utf-8?B?SUIxdXRrWVRGRDBJMzlrSEg4QVQ4SW1NbzVXTnQxc2FjRW1Oem1ReDA5Mkhk?=
 =?utf-8?B?VHNxM09ZSDNvcTh4UkxZdEVwRDF5bWhUbzdhU1BhMk9kZ3RXcW5yOEErMElR?=
 =?utf-8?B?NkNYM1lWZG9qNGZha3JaMlhaaXNPQWFBaTBSTFpSdHliWkQzWTVQQmVRUGhI?=
 =?utf-8?B?ZzhMSTJDUUdoQVFNUUZBa1AzcWJjbnZCTEd2cThlVXo4NXlDelJzRm1LdjBO?=
 =?utf-8?B?bFdOdWE2Ym45Rno2ZndDcjI0cythYkpGUlZwM0JhTWlmUmJkUE51VHhESUdI?=
 =?utf-8?Q?N59uoszqSbs1+92Fm9ADFmvbXcGtBgWUk0HqgGF?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a3decc-9a00-44f9-571c-08dc4cbc117f
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 11:09:41.5320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P192MB2060

On 25/03/2024 11:32, Anthony PERARD wrote:
> On Wed, Mar 20, 2024 at 08:48:33AM +0100, Rafaël Kooi wrote:
>> The systemd xenconsoled.service uses the XENCONSOLED_ARGS variable, but
>> it was missing from the xencommons file.
> 
> Actually, I'm tempted to go the other way and remove XENCONSOLED_ARGS
> from the systemd's service file. In the other service files (openrc,
> sysvinit) for Linux/FreeBSD/NetBSD, XENCONSOLED_ARGS is simply used to
> construct the command line for `xenconsoled`. For the Linux one, if you
> set XENCONSOLED_TRACE, XENCONSOLED_ARGS from xencommons won't be used.

I assume you mean the OpenRC/SysV init script?

> > On the other end, with systemd, it is very easy to modified a service
> file, to add an argument to the command line. So removing
> XENCONSOLED_ARGS would make more sense. But some user might have notice
> it exist and start using it, so it's probably too late to remove it.> 
> So overall, I don't think it's a good idea to advertise
> XENCONSOLED_ARGS, first because it's kind of useless for systemd, and
> second because it's broken for "tools/hotplug/Linux/init.d/xencommons.in"
> 
> 
> 
> Side note: looks like on my test machine I've used systemd instead of
> editing /etc/default/xencommons to change XENCONSOLED_TRACE, so there's
> really no need for "xencommons" config file on systemd:
> 
>      # /etc/systemd/system/xenconsoled.service.d/trace_all.conf
>      [Service]
>      Environment=XENCONSOLED_TRACE=all
> 
> That "xencommons" config file is just there to be compatible with both
> init system.
> 
> Cheers,
> 

Makes sense. To be honest I don't even know what arguments one would pass
to xenconsoled other than setting the log level to begin with. I would
assume this to be a niche enough use case where very few users would be
affected if we do decided to remove the variable. Maybe we could opt to
advertise it as something that we will be removing in a later release?
Maybe either through an "ExecStartPre" message, or by updating the comment
in xencommons.

Thanks,

Rafaël Kooi

