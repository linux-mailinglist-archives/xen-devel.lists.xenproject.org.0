Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7674F6314
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299986.511397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7UU-0001EH-3K; Wed, 06 Apr 2022 15:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299986.511397; Wed, 06 Apr 2022 15:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7UT-0001CR-Vy; Wed, 06 Apr 2022 15:22:37 +0000
Received: by outflank-mailman (input) for mailman id 299986;
 Wed, 06 Apr 2022 15:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc7US-0001CL-MW
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:22:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b08c9c-b5bd-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 17:22:35 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-FOFylHJoPxWrGnvLNWK_vg-1; Wed, 06 Apr 2022 17:22:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8691.eurprd04.prod.outlook.com (2603:10a6:20b:42a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 15:22:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:22:32 +0000
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
X-Inumbo-ID: 62b08c9c-b5bd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649258555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAEZ2ZCi+s/8ZH/zDpYAq42Jpj14SURi5NhZc118tck=;
	b=QXzqdrEI77l/z9UfErMyhBZBiEfDFR20WjEHH5DWpR/nL74HR+ugx/43SFIZ3OIx84lqwQ
	FcVIr6IRLYVhpcmMXHTPuwF7vlXUOc9HbjFFa/ewl6Qcxxj8DaP+bEztcsGN59quljKhH7
	ZP3f4N+XH/VGet103E4iDvDqPbTyIxQ=
X-MC-Unique: FOFylHJoPxWrGnvLNWK_vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdXx0PaLduE6TBz2XbgF5JRsD2bQn9dQeabC9Nzzo1G5F6Kyw9tRwHLeJfUMagfP3r5r2l705GqlwZCDRCSXNYzcfIBN2bgvDWFwp6SlmqJ8lpfeRbqGAxZEuGsND4vAzLP2tSM7tk2YF/FjtBQaKykQeyDXa2i3D7o4ffc5mnhGy/Xm8LulxngpjzVrZT5d3vioeIIXpsuhLqikxIYzmZ4Uro7gZ0B+w3QKVcoQc66j4tUiAHCMjNOdznv1tzsfs6HfVWo+DwQ35cFfK0XQrMRv1Lc6oc35jdFrZWFEZtxT9HAsPd6YWioEqE6Txs+N03RqTWGLNC+jpIJMmeGJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAEZ2ZCi+s/8ZH/zDpYAq42Jpj14SURi5NhZc118tck=;
 b=FBStutJ1zwHTC1yxzhWpRqdQZR507r0HbSX9ivXQMrcnUbczJEEUsdsG+2bqy6cAAsgyRW3Uz4C+fUcOMicTwL6kKybAQ6JAGNsmCSzjecJAvwmlWDCpnKUIFPzbDXA/Xo6nr812hNKfVhWAfzVPSIZQZvEi6CxAOEXefyPEjvW71Bq4JGha50Ftc1yg9/W93PPLmKk6d4orjMIP6XmlhkyBK+yOyzDPxlPySsuv8MGR7UrZu6fMnB5m4pU9ez5IBXDAa06TFofEL7NQ7oN22aSGSWwz84C7XH0AP83bH4FarkDJV2ORnf+hdTxUzPfAwVeyJBKxnUkhpy+9vZ3CcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44883899-a696-31e1-c134-019de999d796@suse.com>
Date: Wed, 6 Apr 2022 17:22:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] SUPPORT.md: extend security support for hosts to 12 TiB
 of memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4c49e4cf-9d86-e630-a1bb-37afdf091c99@suse.com>
 <6ec0e3d9-374c-1caa-9889-f091dcf894e3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6ec0e3d9-374c-1caa-9889-f091dcf894e3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd7fa217-ecd6-4b11-5745-08da17e14524
X-MS-TrafficTypeDiagnostic: AS8PR04MB8691:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8691800D775DC4352143E8F3B3E79@AS8PR04MB8691.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2AjCxSe/jXudQBsbcBZSJsTAZCRLk4PlbE6cbTPC7wxYcgWP54kh3UveeGwOk0KvbT+QwoxwT4x9gxyLiT5uWj4mfiwAJgrMeoR6dN95JBCbju1vuo1pvkd+te3UBfPbOSTleYeeBttHiF2ucwA0Rnz0H6nxn6m4fL4Hm+LYfxTCwYMlOztdsA3Omdzh4gPhIoYSJ7q59VV5t6FAvPXa7+Mna/Q/bfYXwU9XtehH7yKv7pKOLzXgkY3IPeweWDDXPB3PV7h7TidTbgVl6xqZOVlVl2xMTyOqcKJC5flhHd1Gcdb6NqnrvUUTh3fxuF5CqafixCSiKJb95ZOKBl34n4Y9oDNpstiudlDl7YWNJ/92WzwJiRdVXzA70WworpAwWH9x2gqRb0leRQ+NRR3O+bGw57dB+zY91xegyIbdRR+0a2SpPscVdMlWjy8KzB4RWM0a8QozpA0QJZWKzn35c1qgKSUJiD0om7vNvp7YZ2zKHHq4em5xN9TbcpZJb/xC68Xbg1nNI1SwFem9CjPJLBdlKc/awiFCEpDACVqOexfSYmHt1DH7QzTQCfewEspAgDySHzFMeR+UJ+974xl5jq6GTuev8W98gqMz4YrX3C10ospzMXHDd80sInA7GO2wqnmQ1F1sK5LAeiQTI1Rz0mVcjBjWubFeclrM98ibtKB0RRlfuZdZTp1nQx55CXK+0vSdBZHJdC20O8GSO4G4A4vUVpbEr2SGyNDEnbhT3BI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(36756003)(5660300002)(186003)(508600001)(54906003)(83380400001)(6916009)(31686004)(2616005)(316002)(2906002)(6506007)(66476007)(6666004)(53546011)(6512007)(31696002)(66556008)(26005)(66946007)(8936002)(15650500001)(8676002)(86362001)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUdvbmVrZWpCc1lySEkvYVVoRFBqOHFidk45eXkybklkNUNtdnpXakpVbmxD?=
 =?utf-8?B?VjJLd1hSa2V3TGZYcXBMUm0yU1ZPOVVXMEoxNmtvZ1JTY0ZKTzN1R3FpdEdL?=
 =?utf-8?B?TWYrYzBDTXZ5SFVoQmtFSW1jZEp4c3FzdjN2NW5sajZSejM2WWd0bU5IbnFp?=
 =?utf-8?B?Z0ozWWhvcGozMWhoMytRTUFoVXNIQlVibHU5YW1ZTTB3eEVaWDR0d0xZWTgw?=
 =?utf-8?B?MzdEcS9Ba1VUOG84WFpUdXJIb3c4NUlWWmdXNXY0QUJ6SllJMytFZVMrY0Vz?=
 =?utf-8?B?WGUzWStYMlFJMytBZVR2d1V6Q2hab3JvRHMxaTJVaFNkcEljTmdHZXV4ZE52?=
 =?utf-8?B?VXptZWdDdmdHdEdFVjNBVklCVjRmNXh4TTNJYkM4aVFWazYvd3p2RFB4bDZY?=
 =?utf-8?B?UzBhQ2ZFTnJyWDZNU2JsaXdnUzgyWW9VUzJ5RjR1UTlhNjM3bk5DeDFZSWQz?=
 =?utf-8?B?L2dJNGxSRkt1Z0hSZlJlVVN5RUhPdE8ydnFSd1oyN2xPNFJ3RFAwSXNyN2wv?=
 =?utf-8?B?WUJ1b2J3VERZeGZRY2MrTDBOMXRLYTZGUmhNTkJoeWN0MFlvTVZyMzlNallC?=
 =?utf-8?B?d21xVWxMd1lvOXRDbDhocHJWVjRwaDY2YURrcHA2UzgrSDhvcmVGVStLYWhX?=
 =?utf-8?B?THlaaFh6YVdwcTZKOGd5WHNISklvUlAzNElmRjlkUmFTS01IdHE4N1g5cXlj?=
 =?utf-8?B?TlVmWlJlZGRZUURYaHBBamF3QVA5T01ac2dTV2NQUVRoWFYybGRTdSsxbzJQ?=
 =?utf-8?B?YzVEZ0swYnFIKzl2R1NhdldVWmRidXVlcFkrSkpsOGhnMktWWmtUekRSYUhv?=
 =?utf-8?B?YTBuN3BieXlMc2x6WGxpTXE2K3hTeTl6elZUaVA4Z0NIclpxTDBwWHZVdlVM?=
 =?utf-8?B?VXZ0Y05wV3k2ZnVaSXhFQ3ZuU0MzcVpKYm1tQ1AzT1o2UVFOU25QUFVRaU55?=
 =?utf-8?B?bTVxWm9lTmhheDlodGZZRjNPbzB5emtBbmI3VjBmTFFiYm5DMTZEK3ltbEVG?=
 =?utf-8?B?dUJxeGNDWU5wNy9FREE3SStYcEkxTkFRV2w3STN0azlDcERSVXVxaDJVVVZK?=
 =?utf-8?B?UWlrTXNqdFl0R1BhSFFTNUYvZHorTXdWNVNsTy9wUXkya2s3VFg5cXk4TXNh?=
 =?utf-8?B?a0FaNkdrdGZCTGxHM0xHWG1FQklzdlJPVEdOV1ZVWDIxMzBhRGx0c0xobk9O?=
 =?utf-8?B?VEhTcmJUZStob1ZxaFF0WjM0UjlpcnBxZk9vQjdWKzhReEhTbW1CSDBxVHdJ?=
 =?utf-8?B?SVMvK3h2QjcxUHIrdWlwaHo4RVpyTTdCRUN4bXhBWERBbkd1ZDhETUJXZDNR?=
 =?utf-8?B?b0FkckVqVEpuNis0NXdhRTNwcHpoTk5BQVpyNy84YW5La1NwZTFETm52RDlG?=
 =?utf-8?B?cDFGSnJmQkl5ZFVMbVh3VGNmbi9qTy9MaG0rZXp4Y0lVK2ZjeUhibk01Q21p?=
 =?utf-8?B?ZnRXZ25aZmhyNTlzZGplUlp6Rm54WExVZTd5WjBRQmxZYnFYd1NPSGE0MVl3?=
 =?utf-8?B?REN0VkszeExudDVVRzAzM3piMUYrSUcyR3FBRlpaZStia3dGVnpoYlhTTGVs?=
 =?utf-8?B?c0d1Y3FsSEhabEhjMlBqRWhJdHd6Tlp6Q0poYWE1QkhoTWNXaWtnVHFYSmtT?=
 =?utf-8?B?WmZSLzRFWmwyTjU2WkFPaEFVUVUrcm5yWkdaQ2RFY0xmR1NGMHZuTGIydTlZ?=
 =?utf-8?B?QnhGcFdNS1M1Q09HemxSZGJJMUlyd0dITUJZaUl1a1Y4V053R1huOXpUOGFS?=
 =?utf-8?B?cjcxMjdTcFJBZDVFakdFL3FMMkRQOHluNUJ6UDVhM2lha1hlaEJZTHh0ZzNj?=
 =?utf-8?B?OVV6a1hDMjF5YmQyRlN3QmJZRUtqYVdDWmF4VjhESmxpaEVBZXB0QzBQTUFp?=
 =?utf-8?B?NmpiQTQxT0Jndng5QW1zZnBIMk85ZktlVmhyTTl6OEpQeW9URmFWYS9ydDdZ?=
 =?utf-8?B?ZHhGbGo3cUhSWjRzUzNSVXNraVFvdGg0WWVtTFJpUmQ5TVJtSFpJbEpjMlVx?=
 =?utf-8?B?ZGpKTzlid0dCVm1mM1Fhakp3Qmo1RU1HeGlReU92czNNRzF5cHJIWVBROEx6?=
 =?utf-8?B?QTNVT1FhUGs2UlNIVHRqMnhpSWQ5ZHpCbTROZVZnU0VGb3hlQTVyMEFDaE5B?=
 =?utf-8?B?VTZCVlVlTGN6MmJsZjlqNWkyS21pU3YwOFlZbzZLL1poTk4remdRZUZ5OGJ4?=
 =?utf-8?B?dlVSbysyTDVmamVLMW82WU9uOVZ5aWZuK3dsaXB4bmU5cWQ1Qm1laDRvM2pq?=
 =?utf-8?B?NzY2SUFNamttcmlDSWRqaFhwRUVPYmREOTNoMU5HTHNvUmhRQ2pXNDlRWXNi?=
 =?utf-8?B?TWl4RTdmQ1kzeFp2SWU5UjRLT1Q2eE9jaVBNRGd3ZCtVd0l0U0xBdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7fa217-ecd6-4b11-5745-08da17e14524
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:22:32.2842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRsolWgFMldERDSHs4ZHE1hvV3FYhCd1LXSIqG/lCBqfgQTCwr8Dcw9TXcKDMbHH7QKId6kCkMG1A5IWmjGQ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8691

On 06.04.2022 17:15, Julien Grall wrote:
> On 06/04/2022 15:44, Jan Beulich wrote:
>> c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
>> much memory"), as a result of XSA-385, restricted security support to
>> 8 TiB of host memory. Extend this to 12 TiB, putting in place a guest
>> restriction to 8 TiB in exchange.
> 
> And this is even without CONFIG_BIGMEM?

Yes. BIGMEM only matters when memory extends past the 16 TiB boundary
(i.e. when frame numbers with ore than 32 significant bits appear).

>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>>   
>>   ### Physical Memory
>>   
>> -    Status: Supported up to 8 TiB
>> +    Status: Supported up to 12 TiB
> 
> I am afraid this limit is going to be too high for Arm. Even the 
> previous one was technically incorrect. From [1], it should be:
>    - 5TB for arm64
>    - 16GB for arm32

May I ask that you submit a patch correcting this, and I'll rebase
on top of that? I can't really fit such an adjustment under the
umbrella of the title and purpose of this change.

>> @@ -121,6 +121,14 @@ ARM only has one guest type at the momen
>>   
>>       Status: Supported
>>   
>> +## Guest Limits
>> +
>> +### Memory
>> +
>> +    Status: Supported up to 8 TiB
> 
> For Arm, this should be limited to 1TB for arm64 and 16GB for arm32.

Sure, will do.

>> +
>> +Guests with more memory are supported, but not security supported.
> 
> d->max_pages is a 32-bit value. So Xen can effectively only support up 
> to 16TB of memory. AFAICT, it would require quite a bit rework to lift 
> that limit. So I think it would be better to spell out the upper limit.

Same here.

Jan


