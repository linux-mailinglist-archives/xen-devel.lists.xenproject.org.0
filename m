Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FC57B74F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371770.603617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9d3-0005Xr-3O; Wed, 20 Jul 2022 13:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371770.603617; Wed, 20 Jul 2022 13:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9d3-0005W3-0Y; Wed, 20 Jul 2022 13:20:41 +0000
Received: by outflank-mailman (input) for mailman id 371770;
 Wed, 20 Jul 2022 13:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE9d2-0005Vx-7A
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:20:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10084.outbound.protection.outlook.com [40.107.1.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be85722a-082e-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 15:20:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:20:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:20:35 +0000
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
X-Inumbo-ID: be85722a-082e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGlJQLh6ZpdJFH3BXyRgynXQdZkef6psuKtZYE+BS5HpXqwcTt6eo9fqMZSENyU/xIa98wv2WiaGY0aemkCD54Tj+yykQRbKIRH10dkrVXG250Kr7byVPmASsxGxsnCSgJ4BLD2QNcu9JPyLO+O2kfx/1s/HUHlKxW0AqYIjApQDtcoNTSEqO9nnhj/Rbf3yn0OtCyUY+nNWHEMrVv6KpDizP7yE3F+qYZ2CFEfDgAvYPWZmgWRK47pu9AgEZL5RYvoxlvkw6FWAh+zrlELBNuH4HWWckVk5ZAEFkB1nk9PJ+DGgrLVn+58rxhaqUWIu3rzZ2tc1220iYrmbqfHfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E662UjOG/dd4T1UFc9fVSeya/8Qb8FOhoi4evWEj+fc=;
 b=CcH4v9WIuT/UTknXdy5O5uP+uq/sa+siXjFzNVY06DY3jI9aUt6SpOU23XQLPfLwuI6/p4fvMbGNW+wVPWcExUimP7HdoXQN8faFUrOvkhGp4EhSqJSif23YlEzjoZ5BFkNEM8L0P8ZnX7LsYw7CRaoKgThpMPeaO8Nm5cfNW6Qxi55yNKAjtIRBFMTONJCW4MP7qHn62glZwwGRODRolQ/NMXLX7d0Bx35VwdMbXKa9CgmCs8zAF3vULLgBGIT9sTQWds2MjFOoGv2OTVfwIsmB+e9ILCop1dKblEqLrGiM4Iu9B43khtTcOJlGhSNDKm0DoeL5sykkcyBNXf4UQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E662UjOG/dd4T1UFc9fVSeya/8Qb8FOhoi4evWEj+fc=;
 b=EBlZEZyiEixSUo5L9Nrxu0zZWc37HML7cyO2GC+CD7C8Kql8sSFIwM0odrKqcKqTjHYleQLFU46Cok+0nuUkzdkqISjWH1gSkA0wwy1XxbLtt/5YJbO/bUNmqJxB16SP8qTLASQwKTuIoHXD5mWEts5L4EMNbTw3WabrzZySPxM6fzbYU/xA580cQSBbEoGP4z2bc4KvOwryT6MvCANMQnjYIkwUheuXJf7EvMxgKklHqWZTmt1k2ZXpd50G7reWoMzXKvs0SQrlU+gRXqpiohGKkusbq+Iq9Ydxb8qVHUVHwkpr1IelYQBGYLhDhesIHmhnkC6yFqFUtWzeKAjWVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0199091-ff79-6353-71b4-108d0a84e87c@suse.com>
Date: Wed, 20 Jul 2022 15:20:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Michael Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 ChrisD <chris@dalessio.org>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
 <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
 <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
 <5bc211ba-96b4-b705-d600-e01e41e936e5@suse.com>
In-Reply-To: <5bc211ba-96b4-b705-d600-e01e41e936e5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 437b8726-1355-42a8-48a3-08da6a52a185
X-MS-TrafficTypeDiagnostic: AM9PR04MB8603:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UHhcNq3M2TFmfuOi6rqj6gLIqxwgAeVPU+Rqud1AnTy8cKlSMWy5cSI17rMAFFZdvxuDUh54gBifz3C0If5hRJEn+tReQRtfh89ONW02KPVmAShV1Q9lWGQCVL5xHjefE1G40R2Y50Bm2COYBknU/Ehgr+yB72ypK9N3N9ciOSI3AsnZgJmL+pH4RPEdHf4HNT8wULtCeYTllTH4u8L/uALuHXL4TcxsE1OtJ8nwABp5JdyOcmtC0XXp/16e926lrf5oVJHey7xsOMxQsrz7NNT/OkMUn7ehPH4b+Yj08Jh04n4iFb06jpZ8T48YJ+FC8S1W3DzJblXgnif5JlGXK9q7SAWnDydNmclxQ10Iyw6+al993xSHoRcxy0eQbaSc+OtYE6J+fH3PKVsPntU/n3cVgIXZhMj9aPjn4j2Wxyk7UVHi3wf9y89iJqd4eAXeTrah9VdhiIOBxMiBYuIj5eXuA6tHeEBUb+5VID2vilkCLdR4tc7MxipdvfQp5hWZJJY+hmMKnIXC6RaV+KlDJZaOqllyQoKleEYz9L4/dvhmraFvVM0fY8JL9JKDQbsEU0nkZuSMdK5/b1VvvikrzNdRsNQLaIVTGGcWXODiO+3rCZ+UrYaWZ6f8rOSCFrP06l1ZEJ+b3WO+DLyrV6CjKxkVf8a4tPPfmCCZNoCK4wgNuhAGVqLi9RmZguz4wYXcRs3OpNbQRJOsepaTWuVotbwwfzzooW09cTQOCkw2vjP1gMthunZPiVlfT5UrL2AdFuvUAk2Ho9y/46D916oZq0sPbA1lPN9e+wB6SCAZiQrmeM+vqoWg6w4qRiUZpxiMU4VUo3W5DigLNhUjgTpvqYp4O4oKGrCjQaHcB8YYH3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(136003)(376002)(346002)(41300700001)(2906002)(31696002)(86362001)(36756003)(478600001)(8936002)(966005)(5660300002)(6486002)(38100700002)(4744005)(31686004)(6916009)(2616005)(316002)(54906003)(186003)(26005)(8676002)(66556008)(66476007)(6506007)(66946007)(83380400001)(53546011)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVpSVDJqNFdiQTZjWFpwWXdBNExuY0Z2Sk9HODM2S0NKRnZQWVRidDcvdDZI?=
 =?utf-8?B?Nkl1RTdLL0tmL0FQVmZDS0FVdDFyZ1cxOXZRV3RqY2pqRW9nVTlrTXduUnVs?=
 =?utf-8?B?MzFsYmdPNWFVaFFJSmpxQlZqMjUyQ25XRkNUUUhldWEyZ2hjRXFEbDVBeWJl?=
 =?utf-8?B?NDRma0Z4TmU1MzQ2STV6YXVQeEU4UWpaWDRnVkRCd1lqZ1ZPY1AvS3ZZUTlY?=
 =?utf-8?B?NkVYWUh1Q3kvYloveVpyZWdNWDZxOGlXb2FDK3A3dzlUVnAzcU5qd0I2UlFY?=
 =?utf-8?B?eEhCZ0JuQnhGZXc3QTJtc3B3SzFBcmhVd3NTU2hSRE9MVUdPbU03c3VqMW5k?=
 =?utf-8?B?dE9LSzVsSk83QTl4ZTlGcHJuU0Rma1oxYlVJYkVpbmdpQjdzNFd5bGRwR1NC?=
 =?utf-8?B?UDhyTnlqcW5FVkFmUjhtdzN5aWs0V2JnV203dU5KVHBUc0xLTEFneFY5a2t6?=
 =?utf-8?B?SnZ3TzJvendVeFJ1aWVKRXhLTzlVdkVrY3VOVys0bjc0OVlWaGIwck1aUHpq?=
 =?utf-8?B?S21ra0x0cXJqczV3elF4QUhjMFJHS3RJaHR0djJEdmxvWUhsN1VUNXF2NFJO?=
 =?utf-8?B?aE1Rcll5V0FHVVorV1dNL21ISHV1U09sT2g3UjY3bDErcHVhbitIR21QM1Iv?=
 =?utf-8?B?NlRCdXlCVWx0U0FlNmFXQytLTHNuM3dZTldqdWN0YkE0bVhQYmIyVTMrLzE4?=
 =?utf-8?B?SmpTZ1RQRU9lWjVjYkpQRXVzVlJuZWk1K3hXajQ2eW1xRHVjM0hrR3pOaXF4?=
 =?utf-8?B?eEJ4c2xmd0hhNkwzYnp4K1I1YlJVNy9Sck9XSU83OG9GU2hYQmt0ZDA4S0U5?=
 =?utf-8?B?QUh2RnI4RGk5R2VsSjlIZGF2Zk1MSTRmWThnWXlPamcrTCs2Vkt0L2EvR1d5?=
 =?utf-8?B?M0JvMkkrWDJkdGlKQWRpb2tVOUJlYnB6dUdwTVdHQ1lsdGhBMVlLL1dmVWRC?=
 =?utf-8?B?eWlRemg5ZFRtT0kySEJyMFZZR21jenlVMDNVSzFWYzZ2MGFnT0VENHRRUE81?=
 =?utf-8?B?TFQzaFhnSVpFY2c0czFTRVZlaVRLb1BadDEwaUd1VlAzcldtSHUwTlJDMUtm?=
 =?utf-8?B?Rnh1TUJTWmwyRXMveFoySGR1Q2VFTjRpOGlDZWNsLzVlQ0JYYU05NUtPZ0VK?=
 =?utf-8?B?SWpmQ0VCRUNzWDVFNzltZTNsbFgxUzNldFdoTzQvb3VtTUovOVpUOS9HOG1T?=
 =?utf-8?B?SElrdzZWemJMMU1GNStJMzJaaFdkNEQyYlhBai8vNFNBNFdIei8wQngzN3F4?=
 =?utf-8?B?UnR1c1RmRUIwTGE0dVBJNGFDakw0UGhoRFcrODViWm5iaUtyMG9oczVtdWh2?=
 =?utf-8?B?ek5hWlQvd2YwSm8yVzd4ZWpKSkZHbjUvVGwycktLNEhBcDl1WUNQL3BxNDkw?=
 =?utf-8?B?ZUowTFhMaVFybzViVTRkeEJLa05jK2pEZjBpejBCblhJdWZidS85NFpJeHp6?=
 =?utf-8?B?TlM4YTlsRkxDWE1ZVmlsanc1dk9PdExlc0NTVjF3OXQ3OWlhR3JYV2NPL2U5?=
 =?utf-8?B?U3NJTmZiRmtQblJIYklqTlhsS1ZrSmNybGRJV29QeFRnR3VtcnRLOE5NRVJH?=
 =?utf-8?B?SG5LeFJGc3lRaXord3JNUHZNVHBlbUlzS01EaUExTEdpWFhGVXhEVFhUNncz?=
 =?utf-8?B?VnNEMFlTQnlVVGtoNnpHRVVDK1dsTkpOZHRaemZweUdYTkZBc2w0S25VVzBW?=
 =?utf-8?B?TjNHajRaQlY5Uk1uZXVERGhobW0xQmJMNlZkRjFzbHVid0MzN1luQi94TW1y?=
 =?utf-8?B?WlFNdTYxTEpyNVFsaExGbFRoOTZDSGpVVGNXZThoUlJ1V2gwM0x6NFRxWjNz?=
 =?utf-8?B?dHgwc3VhUk5EVXIrZnUxbCt6d3ExZ0VVQXF1blk2ZEdsTE5yWldYREt6QVE3?=
 =?utf-8?B?Rm9LS2paa1l6UU1JVlYvaGNHMWN2UzVGemZvSElaaGw1UFMwUGdlU3dSTTNM?=
 =?utf-8?B?YUV6VXFwYnZNdE1DU29yUHIvNnNscWNsU2E2bENCeWpPTnBlVnNhZDNhVk1j?=
 =?utf-8?B?MGNQUmp3aSttSlVDZmZjeVJNVFY4ZjIrbkZsQllTVWdmSGtqUFpSaVlVRTRW?=
 =?utf-8?B?V2VTR1dVNjBTWURRV1o1dGdvTmpIOXNQKytEa21GQUxzNXBQbnN2YWQ2dnIz?=
 =?utf-8?Q?pybaeIoZwyHHpmgh6D4/dKfi+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437b8726-1355-42a8-48a3-08da6a52a185
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:20:35.7638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLiphtsXOAoEF5NP+lPO0ADeDJ3GHKh3/JnKUNEax8YvepVZrfObcnbx9RIUPPpB6LC7Xj9h9fBMX50a1ztgbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

On 20.07.2022 13:28, Jan Beulich wrote:
> On 20.07.2022 12:02, Andrew Cooper wrote:
>> On 20/07/2022 09:19, Jan Beulich wrote:
>>> On 20.07.2022 06:48, ChrisD wrote:
>>>> So, you think it's a problem with fc36?
>>> Well, if that's where the binary came from, then yes.
>>
>> So
>> https://kojipkgs.fedoraproject.org//packages/xen/4.16.1/4.fc36/data/logs/x86_64/build.log
>> is the build log.
>>
>> For iommu_init.c I don't see anything overly concerning, although the
>> quantity of nonsense on the gcc cmdline is speaks volumes.
>>
>> One observation though.  We do pass -mno-sse but not -mno-mmx.
> 
> Right, but that should be no problem - the compiler isn't supposed
> to enable MMX without -mmmx.

Or so I - wrongly - thought. Will make a patch. Nevertheless I consider
gcc behavior here close to insane.

Jan

