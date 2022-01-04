Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47504483D54
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 08:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253013.433969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4egm-0001Hq-OB; Tue, 04 Jan 2022 07:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253013.433969; Tue, 04 Jan 2022 07:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4egm-0001F2-Kc; Tue, 04 Jan 2022 07:57:00 +0000
Received: by outflank-mailman (input) for mailman id 253013;
 Tue, 04 Jan 2022 07:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4egk-0001Ew-Sk
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 07:56:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3070510-6d33-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 08:56:57 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-0BDDwKrrMOm2trhkW-gozA-1; Tue, 04 Jan 2022 08:56:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 07:56:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 07:56:53 +0000
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
X-Inumbo-ID: e3070510-6d33-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641283016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBoCkLs6qT/O0mEpPW0e3+Vzozj5VqtrgYJqvQ18RvI=;
	b=MnB1TGFQKO76rRn2nyNK5xRnpkG+zh5YvtS854xifJ0f20V7By4eJh7t9DdDM57sPLEeyQ
	vyRNy1EZemED9ktbEcbFQwaollWA0KNRnhN66q53Ghd1KjGqQhjhyMWnw84w38xIN+zE/w
	qv04sIh1N4VMWUtpK5Fexde0023Blio=
X-MC-Unique: 0BDDwKrrMOm2trhkW-gozA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUvJteDawxVvKZHJwzmH7u4LPMXYukLNCjzs/K3EATy+qnI3rBCMB7QmhoM9jWU7uFIqQFZrVHm4sD5cxMc42TErgwvorBwNrVshdZGOIOEOBgAdU/RnBJ7V9m7RtZA2eCbgO74wLEpLxjzZsaQGFSI3fdh7040tytLCQ880PZJyYTZTDzcehCXdarlM1oroEV5DOFY1kGdPLqE35GWh4pUkopBbWriquqzOHOvXALzMLYDFe4mWEKs1cHFRVh8QWRtwgljG3H40vQXeXvzyl2VwCQcDDKkaC9RiTR1oQY9gcjo35dblDcIEJLQmP9JlNeAkM1pMcZKDK5VitTZ8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBoCkLs6qT/O0mEpPW0e3+Vzozj5VqtrgYJqvQ18RvI=;
 b=XM6qS4Qf0I/NXzpPInakyvjgKemOYbfjXLbfl2ukD/cmuHFc6ozWnEQJwpE9h6p/99HrCYgH/hZxZGDuRmSJt7dekM0B6+osJpOZ7LFTpntIegUmn07mDFtk9eKF8YGMyTSu7l8W8+hcm1sHnBDlNVue4ZT04gcL+GV3nC2MVqA2G1O4ru7c5d2rfar3w0d5H7aUuygE5GIk6lqHUqTJAV16GNyQt0dvpskVW+3oiUdIJNvMfF0d0aym9hUx/IOEesA3eDhVuY96qTFkzhYxVt1bnJ7gtcDv+e9T25gUdYCUVJXPu24LdEwotPlFa8QxwWewjF63t3CK5uHUxpppYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9e984f3-fc98-9179-1958-0330c828fbda@suse.com>
Date: Tue, 4 Jan 2022 08:57:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] SUPPORT.md, MAINTAINERS: De-support qemu-xen-traditional
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20211209142640.24437-1-iwj@xenproject.org>
 <4ed5073e-8083-ac72-6477-676eaf2e2eb8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ed5073e-8083-ac72-6477-676eaf2e2eb8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0286.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0b0bbd4-74ab-46c9-e9f3-08d9cf57c5c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039DF19B39DA12B782E2087B34A9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M31BrMxcgU8WYtrWDR+A7AkYKLNPu45px8TRfnOJluCHhrl7UaDdvBvxQNexfFqHk/X602ce3/Xjai89MR3jHWZR/b5HpDUJTGFZwwtywJJqPLVQFy7qQmFwVeD0wcHf3mmnlXVLti1tEPxgiVetjPHA+xOEUx7OHnKxj4RNiJJ4EgRhQmLx0YocszqK3uKEl0sceND6/4sdI3H1iBLyLUTIEYbRujCF4yr4vMk9EKwahFq3Xln1ZJYTYIDqRTeCH3/D9EwYBEhOmaJt0ghWzB/MzpXjDaOZHGV2TJg0DU1cWFDSmJP4OOqXE9ORKRlnqL2l0ZsTEPk9YO6OL4rA5DUGHp4Mo5hB4Gbgknoigj6CkSOGGLmCQS6C+OfGCQnr5JMK7K9KpsXEffeM1XKwdh8BDjgfnGN/JYpbCMe0OWPwpMr//T2r3SpWVE6eP1qm515UVf1hULBiQoHiU/ZzmcE3ZsjLnL3gICSdPAsH35V4OyPYQgK+Jt3IIq3E5eHq121z7jthVJK/JpZydjImrojo8MWu2fDY1YZ6LrmhP41wE8fuR4ExCNXTCSWxQSWjUHhX9naF4spn/tdQnm3sRP3voxVkhREzQVdooxOf0HrwPKdmWJSZEMpGfg2d/y7TFLa+t2Si6IpJr51H0+9KCG/RySLBUTEIzbdokVZOUUiKMPHRUroCkGgX6d1x3M5Tgkx0oTkCdalTLKK1LDNjCzzZrqWeP2POgZWIplZRHHUXeghz3IAJWxLsKOWX6gQ8cm7K8YFXLsgLjX1tGsW8recyChvI0BvbvyvW//VpPLB+6mS3It9nHbXgcjA5j98m3Z2aRdMdhldOk4AWbujwhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(36756003)(31696002)(2616005)(54906003)(316002)(186003)(6512007)(26005)(6666004)(66946007)(83380400001)(4326008)(508600001)(66476007)(6506007)(8936002)(38100700002)(6916009)(86362001)(5660300002)(8676002)(2906002)(6486002)(31686004)(53546011)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUN0Si9YMENGT3RoS2xDbnNCZTdaKzBJKzhyOHFFdDdmM09Yd01GdlV4SzZx?=
 =?utf-8?B?M1ZhZURQU3lxZ0JGb0RIYkZDemdqanQyRk9PS0tDU1J3UWwzeTMxN1BPZ0Nl?=
 =?utf-8?B?NDBtZk1TYnZ1elFPYkU4N3JDVWpRRzVGU210MDk2QXpMRkpMTkIrZGdOVlp4?=
 =?utf-8?B?N2NuRnBNRFRBTEVCb0taOEV6TzVPWW1FZk85MTRhdnVOZlhBckMxbHVCUW9h?=
 =?utf-8?B?L0d3SmlSdGI3U3UyVzRHNHFLNU1ITVF1Q0VESEhIczdLNmVqYngxUVpwSHZa?=
 =?utf-8?B?YWx0SDFzYTdRTmdRczNyU3MxYXZpREJBOTBlZ3F1SHR4ZjM4QklMdmxDY2VY?=
 =?utf-8?B?THhQUWs3Vk00MWRub1FQV01MMkYvVk5ZaHFQZVhlclZrb0M3WDVVbkx5aWxX?=
 =?utf-8?B?ZEhuVEdGZ2dnaXVmWUwvdHlHWHRFek5NemhYT21FY2F3QlZZT1F4ZWNKVVUv?=
 =?utf-8?B?V1haUnd1WUtwQndLa05IaThORHJZdm5BYWNBaSs1eVdjQnZ1WEdMbGEvWGJO?=
 =?utf-8?B?QUZBTWU5SG45V1RlakhYV1YzajZUVWlVbUVaeVB4dlN3TlBDT0gxb2xxYytL?=
 =?utf-8?B?czlWNGpNcUNRTEdhY0pRTkxEeGI0cTA3YTNNWm1YVjJYbUlZNnlFaXY1MlY3?=
 =?utf-8?B?NlFXT1FEQXlOOU0ybHQxQ2ZOQVZ5RjRiQ1M3ckc1aC9RZEpOR0tuYUZpS2M3?=
 =?utf-8?B?bm1zR08rdEpycGx0eUdmTGJxRzdERVUzY2hmNk5senZ5OTIyYWJWakRsUHZh?=
 =?utf-8?B?bnFaanpOYW5wV1hYYklZSldoVmZBTzF0UVNIeXhCd1Y2K2FtVFcvSXJEOEIw?=
 =?utf-8?B?WHVKTWF2L3FMbUd0S1BkM043OFNVc1d5OStCanp4QlZNQXBMaFlGUytsSVZ6?=
 =?utf-8?B?aEJSNjdnL0RLS0M3aktLemVPYU1mLzYzZ1BSWC8xUHA4VEt1YStQNldXbkJ6?=
 =?utf-8?B?aEJTaWlERUtFTHRLWDRmNC9hUm5kTU1iVHMrdzcrdGRPVnVQZWUyMGZoZkRP?=
 =?utf-8?B?NmRLTWxwRnM1UnhPdGhUYUNGcDdRZldpK0w2VWhLQ3FGN0VoQTN3bjJQejFV?=
 =?utf-8?B?aDFEenN2aUhkOHdCM2U3aWxMdXBFbXUvNWl1anQvY3BWV2o3eEpKZkJsWWhi?=
 =?utf-8?B?RzJET1hHaHdHWHJZR2FxaHJDblpvMWlESElKUXhUK201QXhML29ycHcxUVFl?=
 =?utf-8?B?aUliYkZpRm13bXZRWWFpK2N1SU40bTJML25nZ3c0S2FxdDFVMUN4MnlNN00y?=
 =?utf-8?B?djQyNVFUNGdyVS9HWW5xd3k3MWs0YkdnMkFNaU9SV0ZDS2pTMWRpMHRYclRm?=
 =?utf-8?B?YzhERkpaaGZYOTMyRkVVdVp4cnNwYStVVlFCU3NDV05xaXJlMldBdk9XSFQ5?=
 =?utf-8?B?ZEF5cHZ5V3d6TjB0dzJPVzZpUHMxV2VTdzhNeHZWVGl3UHZDUHZEZEo0ZFQw?=
 =?utf-8?B?S3lqNSszaUdGTTZ0L2hCb1NBbHJDekQzdHVqMnJsQW5sVXhDTThOTnF6WlVj?=
 =?utf-8?B?WUEvZUE2blZ4UTVNMlVsWWQ2OHozdGlNZDQrV2h4alFzbkd4V2pMUS9CeHdw?=
 =?utf-8?B?RWJnYnRHa2htaXQzUUg0ZFR1QndsQUF0Yk1SQ1hkZTdxU3ZlTDlqU1dKRDE5?=
 =?utf-8?B?ZWtmekR1RG9SblJIaXZYVkN0Vy9IanIrTmVhZnBtZ0lHZ2xVL0dQNXVFOVRJ?=
 =?utf-8?B?WlhMNzVldGtzMXRVd0dzUmYvcGNhRG96WmlEa2F1TkFuc1VWTTlhcW1YSlA1?=
 =?utf-8?B?Z0Rsak9zSzlXNUIyQ2JvWVBjM05DdDVQT3B0dFZmc1pyK21PYWtCN3pxOUxO?=
 =?utf-8?B?L2NpYkZ1N084eHd5dEFQVTgrOStneklSUnJlUGZRQzdmTFR6bHRRb1lvcHVO?=
 =?utf-8?B?L0lyRSsxUzFzZENwT3ZmTmlNWG40b0pwcko0M055aXFFck1iVFF3aERxYzgr?=
 =?utf-8?B?YUdzSFNQcVVPemQxQnZzOEt4aHBRUlB3Njc4TVA5bzF0WDJ3M1ZCbHAzZ0kx?=
 =?utf-8?B?QzRERkFzbHF0VnprcFdvdzJyU1BJWWpvUDdHN1NqbEs5MnBiVjZOTkgzWkhN?=
 =?utf-8?B?UXJ2OHFGZ3dMUU1IeHpMRjZLL1ZqV3RGMkZ3OGhMeWVEcVg3YVhpUG02YUdN?=
 =?utf-8?B?TWZSRnIyeW1vcjBlbk5Bblg1QXFMWi9zWEtRaGZucUdQNUhsRi9vVElySldQ?=
 =?utf-8?Q?0qJqLdINIn4nWqJhFrLmoyk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b0bbd4-74ab-46c9-e9f3-08d9cf57c5c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 07:56:53.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVdtrrjkIUPdFi13StsBlYkw6E51S9h8QiXqHTd+jvMx4SvhJ2gv+Sg9pDZrtHfWAFR/hc8h+O/frMArSCzmoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 14.12.2021 20:19, Julien Grall wrote:
> On 09/12/2021 14:26, Ian Jackson wrote:
>> In 4.16 we changed to not build this by default.  I think it is now
>> time to explicitly desupport it, completely, in favour of Linux dm
>> stub domains.
>>
>> Signed-off-by: Ian Jackson <iwj@xenproject.org>
>> ---
>>   MAINTAINERS |  2 +-
>>   SUPPORT.md  | 18 +++++++++---------
>>   2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e43dc0edce..933579541f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -455,7 +455,7 @@ S:	Supported
>>   F:	tools/python
>>   
>>   QEMU-DM
>> -S:	Supported
>> +S:	Obsolete
>>   T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
>>   
>>   QEMU UPSTREAM
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 3a34933c89..b64ebee93b 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -802,17 +802,17 @@ See the section **Blkback** for image formats supported by QEMU.
>>   ### qemu-xen-traditional ###
>>   
>>   The Xen Project provides an old version of qemu with modifications
>> -which enable use as a device model stub domain.  The old version is
>> -normally selected by default only in a stub dm configuration, but it
>> -can be requested explicitly in other configurations, for example in
>> -`xl` with `device_model_version="QEMU_XEN_TRADITIONAL"`.
>> +which enable use as a device model stub domain.  This old version is
>> +not built by default.  Even if it is build, it is normally selected by
>> +default only in a stub dm configuration, but it can be requested
>> +explicitly in other configurations, for example in `xl` with
>> +`device_model_version="QEMU_XEN_TRADITIONAL"`.
>>   
>> -    Status, Device Model Stub Domains: Supported, with caveats
>> -    Status, as host process device model: No security support, not recommended
>> +When device model stub domains are desired for the additional
>> +security, we recommend using a device model stub domain consisting of
>> +a modern qemu and a Linux kernel.
> 
> Looking at SUPPORT.md, we have:
> 
> ### Linux device model stubdomains
> 
> Support for running qemu-xen device model in a linux stubdomain.
> 
>      Status: Tech Preview
> 
> Is it still accurate? If yes, I am not sure we can recommend user to 
> switch to Linux stubdomain until this is fully supported.

FWIW I agree that this needs updating at the same time or in a prereq
change. I guess it'll need to be someone other than Ian now to pick
up and progress this patch, though.

Jan


