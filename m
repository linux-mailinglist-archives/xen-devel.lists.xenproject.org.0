Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AE3AAE76
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 10:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143742.264786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltn4f-0005OL-OA; Thu, 17 Jun 2021 08:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143742.264786; Thu, 17 Jun 2021 08:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltn4f-0005MT-Km; Thu, 17 Jun 2021 08:08:29 +0000
Received: by outflank-mailman (input) for mailman id 143742;
 Thu, 17 Jun 2021 08:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltn4e-0005MN-1A
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 08:08:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb3bf5a4-daab-4f1d-a48c-55f88a58c7cb;
 Thu, 17 Jun 2021 08:08:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-34eOnv2vO5KZja_SEzGdng-2; Thu, 17 Jun 2021 10:08:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Thu, 17 Jun
 2021 08:08:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 08:08:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0059.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 08:08:21 +0000
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
X-Inumbo-ID: bb3bf5a4-daab-4f1d-a48c-55f88a58c7cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623917305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8aNzExAo+zTxDcWbNyqc8wNERoLqS9+E3nd0exZcj0=;
	b=YL3Ii+w+g91Dz70S+FDHpUr600zFY3wg3Rm2D9TvsatqzVhDidBjfHjubCsOlXxKHE1cEJ
	zY2/oHLUCbNNb4kajAZppjpY+ZoidJYQPvfb0fHeh500IHQ4eGYQ3lHQEqU9gHLVtbbWKE
	awdQ8Ly9I6p/Xl4zyTtMOQOSnmmUfb4=
X-MC-Unique: 34eOnv2vO5KZja_SEzGdng-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfoUhBdmaa08SPk/PmhdFTms3wq06V0NBEpGBaszfBHNIndHzFN7ENR//gdoVc/w0Ue3Zn4vWu6CscWdTxBr5lGV2xS4+A2l62dYncXKRgc6kbxR7LrkcVy99majpFvMbGbXHFekDkaVwERLJGM6Tqq7WI6C1unqTzdyj8A+ELWZx49cHK8V8uSsyj+CsW48oNQlEWxrzeynQVanpg09WJjBAAziv02pWUWv69ej8t8b3PZ5vSEiajXApMhdFNOz7yzu2fsDViGBFnjYFY+k+NMJWYcAZwfov5/mSeWqspLkWL1XuhwGBYqQSbv7nhS8RT3GTH6ggeTuegmVl98h4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8aNzExAo+zTxDcWbNyqc8wNERoLqS9+E3nd0exZcj0=;
 b=D6lFH2VdLp5PX2kNHJpBo9/d2zOFmrkrdux6EUAp/E8PgqZYJNMXRQJUrHp8CIl8OrIdmXM/guEpUcEnQ5m19dyOP8deF4xBN8xcheeUNW9eccAJj9uPGF2bNlTHlUFi0A1Na6m16kL3WJNLgiIv//bUHpCINlAwx26ndaay1TfT7i9XTfUXJDEH5tNwRf9YZX8i8BFSMaNTMtEDWYUCR7hOPpWJ76hT3q7yHfHPcySLhOcf9FbN6f8eoQKS4ge/twaEm51vdu83M1wZh0KxbM3jkZlqrp54aKH/TthV7urYGNg35Cwsm86DfDg0e8vlnvgeq4VykDEBeRMw3Nt03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: hypercalls with 64-bit results
To: Juergen Gross <jgross@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
 <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>
 <75d84a60-1857-f62c-23f5-eb3bfa3b93b2@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c151faff-5ff2-af59-fe95-1675aeb5be33@suse.com>
Date: Thu, 17 Jun 2021 10:08:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <75d84a60-1857-f62c-23f5-eb3bfa3b93b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0059.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fd5e433-bd50-41c9-6a90-08d93167133f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43499BF7BBDB179E6654B1F2B30E9@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XN7Kdm23iHPfwG9U5EMx+hGM3FA8XQH881K6/+55TTcUVwYKr1AUZJk+i1q80AOEJf90f2uNxkcatPlrnlj0JUwUjicnT2T3esoMCEBfajjl1hTkYlmOwByD7BMo0BBJH4KogYl7t2JYTkN6F70oGG0DHFLm01LFySvKIqKNeeKsrKsrGMD2TRw6iuw4R4Or4vlv8WR6iW0McZsHtvab9+W4Lb0j3QPj06Xpsg1L7s5JXMoUbt4sg7IBeotfuQwXZuNc4okYU4FutWoAurRP5XbbYfk3xkre2A404yhCPUWF967YebMF5SWMvGnwhW+TOSLk3E482fgzYkPmzxlzMl08SmDbZdbbAA8ZHB3YOyjD/Z++xtoZM8dRL7SaHZgcC+3zI6GhAqcocF5zNlxpuKIcuUA7vsRv9SjqHOoWYxZIGCO47zvEXKJaeGj/PUmVkX7izDDYbQeNYLa4EA1tgn6gURqnVFtoXSvre6X3lovLf4B5aQCkCSp1zs9OoB17Y78xXIl0DWgEBjNXmvXjMlgGynP50pGI3zjtx5zCdHLmLjwRZqVWFwnnT4Q1/vJfRsOSuHwYZLUBdZn9rFBa7vf4F6kqXy9QxYTZ3lLSHeQEVGFngZgQ6kuiOAg9xgE8FA9aRkPXZZPJOpr+kVltbKConc9Ox65BPi3qgAuxn7jg4F8Zw98cKoDEx1Qh46ar
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39860400002)(396003)(376002)(5660300002)(6636002)(186003)(26005)(53546011)(6486002)(2616005)(36756003)(956004)(478600001)(16526019)(2906002)(54906003)(66476007)(8936002)(66556008)(66946007)(7416002)(31686004)(37006003)(38100700002)(31696002)(4326008)(6862004)(316002)(16576012)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1hCZHJYZkNTZnZXNXdtT01vNEFQODR6WEErVXl0UVl0cW15eFppaEgwb2Rq?=
 =?utf-8?B?K3NGN3hFZVIrN3F2M3hxSzkxS3l3Y29OY3R5RHZrZXlNY2J6N1ZXcXhvQWh4?=
 =?utf-8?B?bnp6MlVGUVRLVHhnRitxMy9uMDluVHZ3R2EwUU1DM3VrQWwvZjJaWEFSRDF5?=
 =?utf-8?B?RjRjbnFaN2M3WW5mdUtkcno2OFdYSEkvYUEyVlh5SFdGcitISll1b215YUtO?=
 =?utf-8?B?aGVWbTdPb0tXTWJFZ25keVppQWJGNWJhTU5BdDN2RUJEVE5EYnpMRWJRYzh0?=
 =?utf-8?B?VlpYL09nbXpaOXI4YzB4NEx0OU13KzVrR3l5bjdnaVM2RlFLREMvQTNEQTQ5?=
 =?utf-8?B?V1RXem90ejNpTmxTWWkzSE9VVTBvRUt5TXlZdStOMHhXK1dJRlFNZlFLdEtY?=
 =?utf-8?B?anZPajJzWENYNUQ3UkVjeVlWWGZibXhYMFMxQ1FIMUppbDdIYnlqeUdZUWhV?=
 =?utf-8?B?bWtsZ0U2WUU4am9SNW5rWFVwMVZwYTBEZURNdWJCcEhoOEVzTUM4QXlCcU96?=
 =?utf-8?B?OEV4ZGRoTEQ3QkdCcXlJZHdPZTBsaUw3Qlhta2hVdXNtZmJvQmo2QmRPYTUw?=
 =?utf-8?B?MEVhOHQxc0p1Nzc1YkFqYzZuNE1nREJhV08xSXBleU5oZFNNTlpvUUpIOXlx?=
 =?utf-8?B?OXNqUklGbVRoUTZDdE1nWlh4WUNwWC9aVWZwcys3T2tBNTVVOVdPYnlFSFFI?=
 =?utf-8?B?WmtTQ25jM1JJMm9DQ2xOeG5tQVBFYkZBYmRjTHdHTkxnVDFWR1BtZWpyNHNO?=
 =?utf-8?B?ZWNZU3JJS3BMYVRkMTNTZjgvdU1rSXJUaUZvNjdCV0lybVprbFYvbDRZUlB4?=
 =?utf-8?B?MTZlNzRaV1pMVk1KWDZ3QXpwZjFTOHFRd3QyaUw0My83WTN3ODVBaUxTRWl1?=
 =?utf-8?B?SEh0Zk5JRHJuZW1QM1plZ1grNFRsYUdyWDBZdDVXTEZibjdhYlpRVDhOdU5I?=
 =?utf-8?B?WE4xUGlFVlQyYXdZbVY4Y0pmcmRvaTNMTHpuS1lDOFEwamZqTVFQSEJ2TUJU?=
 =?utf-8?B?NlNUSTNGVUl6U0VCTEYwd3pIZHFLY0JUOXp3WHVrWVBLZ1RURTJRRG9BQnht?=
 =?utf-8?B?SkcwbzZ2S3BIeGw2anJxRFhUaS9MREdmbmkxdUEzZzhsdDBGb1UzY1lkUHcx?=
 =?utf-8?B?blBLNmlHUVVPejNIbExKMjBINGFReWdGRnFNSmhhU3RKSEhsbnl0TzVMdVVp?=
 =?utf-8?B?V0lleUVndEpPUmg3cnFManVLUHZCaHBWenoyOW96YVZ5RDVmc2RaRU1GZGpQ?=
 =?utf-8?B?L2RLNm9iM3Nxd29nd0sySkRaSkM2RDAxczFmMlAyb1pYeXhyMGJIMGdPVnM1?=
 =?utf-8?B?U3lIRUtDNGRiMSs4MlBWMEZqVXpOakd5Y003eUpyRC9GekxKdEZtcVRUTllN?=
 =?utf-8?B?QUU5emk3ZitBSFN5S0p1RHdXbnM5eXpqYVJZVTRyQTJaV1ZGYkxyUkxhWWtr?=
 =?utf-8?B?SE0rQU5uMTRNSW0xU2RyRTdncUxaK1UveGxuZml1N0JEUEhaSDlsaFF1bGVM?=
 =?utf-8?B?T3FiSDFVbzB2MWVMQmpaOUtvUkltZlg4eE9ZYWVHcTJnNi9ZemdITVR3dmxy?=
 =?utf-8?B?U0VSU052K1dEa3ByNWMybFk1N29TOWQ0RSs3S1h6RndSR3Q2QWZOWGxKYTZE?=
 =?utf-8?B?bmJnMUZSVHAwQitmV3pXNitoaXBCazlhd21yZ2F5blJwVFl6LzZhNDFBVnU2?=
 =?utf-8?B?cENPcFVPVWY0WE5uUXdXU0owZUoxcWE2RXBZbHdjMTdKOGFacGlOci81bWJK?=
 =?utf-8?Q?UDJyyw0guS8ywSiLIEFf/rZXg5/PFPod5KitTo7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd5e433-bd50-41c9-6a90-08d93167133f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 08:08:22.5170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dM13C4KRnQCwcwwmH71idEjqPjDgfZ3n0mVecOSqGRRrwEDxDB7Tdzp1w5UKwiSjInSr5OxJHIEW/Q58oeHAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 17.06.2021 10:05, Juergen Gross wrote:
> On 17.06.21 10:00, Jan Beulich wrote:
>> On 17.06.2021 06:55, Juergen Gross wrote:
>>> On 16.06.21 18:04, Jan Beulich wrote:
>>>> Since hypercalls from the tool stack are based on ioctl(), and since
>>>> ioctl() has a return type of "int", I'm afraid there's no way we can
>>>> deal with this by adjusting function return types in the libraries.
>>>> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
>>>> subops (for those cases where potentially large values get returned).
>>>
>>> I think we can just use a multicall in libxc to wrap the affected
>>> operations.
>>
>> Hmm, we might, if we're happy for these to then not work in HVM domains
>> (PVH Dom0, which still is experimental only, or PVH/HVM DomU-s using
>> the libraries for some purpose), or if we finally wire up multicalls in
>> the HVM case (there ought to be a reason why they aren't, but I have no
>> idea what that is).
> 
> Me neither, especially as on Arm they are supported.
> 
> And TBH: PVH Dom0 without multicalls might be hard anyway.

Okay, let me see whether, while trying to wire them up, I run into
particular issues.

Jan


