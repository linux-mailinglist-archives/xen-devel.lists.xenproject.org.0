Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982C622476
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 08:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440659.694759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfEY-0001tt-Sp; Wed, 09 Nov 2022 07:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440659.694759; Wed, 09 Nov 2022 07:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfEY-0001r4-Q0; Wed, 09 Nov 2022 07:10:50 +0000
Received: by outflank-mailman (input) for mailman id 440659;
 Wed, 09 Nov 2022 07:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osfEX-0001qy-8N
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 07:10:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2960634-5ffd-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 08:10:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8522.eurprd04.prod.outlook.com (2603:10a6:20b:431::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 07:10:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 07:10:45 +0000
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
X-Inumbo-ID: a2960634-5ffd-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoigmJBFTxyyyTtE1evjan6VQoA8NZkDbKKeLXS50FFKXUgBEjmWR2ju5uNEu+/nzvwmKESuAJUX2kNIgFxgsH/cWqrlvTkK4VDon/iaBb5Jy4XgVLj0fIE/R/XYuZmMPdkg1nV0V3vgI5mGzIkDJ80pqC7zyVMvDONhMRr5LvJaNTBQ3XzJoc2DoLRQoE+x9NJFkgLpM0CZrWYqEUmqf4RQnVeQAqc4/EHURkDuVJHKHhday/EUtk+awZdDhEGrLNJ+ftIV2xOgVeeaIE3rcDEwVxuLw66mvUcTeZwT50+obXCXfd4dOLvQqfmsqL/ASCIAXkjjSwYPSHzed8JOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyHoDLJn8DwgQm0hKK5XgbxE9dkcOm5pVw+9QOr2wf4=;
 b=UEGXVprfvfW92XaGy43P6FkSAR7wm15fuKpoerys0XALzTbPhnc7Zsyrhuc/U1LlsZbHrXIWeKriqg1Q3MCYE8CRts+KMW3OH0MDJeuOnx1ohHd0zIXR2d4iFLSjva3rdJIW7M7j+RZQ6PCTpBah0pUNiwaRUF4qYNevIhv4kykL8UBhLPcfgAG921CBZ0oVtdYdnqdLPMqgFYRi19A3QE2pLhVM7qJ6lgvwkbOLtWEIfUEORwnVV5a37VIfBrP8DM4CTUsXu/Vd8/SMaTqRfi3xancmNz4HfCUWpSxgENrqIRdFZBb2ERqOoZFDRKzfsHRSsMIawKnqeu5wp95ELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyHoDLJn8DwgQm0hKK5XgbxE9dkcOm5pVw+9QOr2wf4=;
 b=NPUsE/1CZcAc/3LOQqNDv2ROJE/nqs0A8acM6wF8k5ZBqON9d1G7Vnu8KA9GySuEf3ia32wU8fZRhN/p9wQ8G2IOKGk/829unY7/AvJiHz8UiOgObcVqBu+IZEyqJHH0GuzDaWwAyBQMHQiJL682MJw7de935bMfs1GjLsbEJo5KJbKExgpmmsGXHIb/Kx6FX8r6DTxsTYRABQx0Ywgn7HZ8xtbQhFP4wTZsagVtmlgc+mq+dydnWkSnxMUnOAQ4sD81NXxrFYAebS88yW2XOsAsaSnfctVoXyiF56KM1DwBqgR1kEfDhTEpSQtW1u/lEA1oF71iGVK1XkXfOvV0XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e994604-7a3f-ef5f-63f4-d03e4abe4124@suse.com>
Date: Wed, 9 Nov 2022 08:10:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edvin.torok@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <09afc07ba0ba65afc02028bd6b4950d8e51af69b.1667920496.git.edvin.torok@citrix.com>
 <AS8PR08MB79910C8281C7C356450152C4923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79910C8281C7C356450152C4923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cc306f-3c3e-4ceb-5462-08dac22184fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p1T8qaeYzSs19WAsyfuGK6Z45hfvbHg99KgkGKnaEQLWoxOv+143Se45IwqFihUiyk8+FljIL+Dxc93p4GLCb/hm3KsGUlenFAcDssT0YrPQqmU8kuCdcvMYR3eJ488dkteKs6BEXq+anP/DBxIQzrLy2NLyaNbX3UclBELbJI9MF2qqcGYaIoFmo+H5kBLrzlFTJgB8ah3/2mfLhwp97zO1vI+kYsWempoQtZeRv2ibX8dhyo6U1l7bz6G/76zcGAt+P718bvASWJQbY/hSU+ZSEgCJ/cLDmJx7Kb+k21yPrxaHFLZpc5NNWkOuNmnZi2IoCeHGkHaotW96zDAP61mdxcWYQ8UdgcZeXr4LmzvWXfkc6krgnHtBSh47HL40SgsHA0bteK92aNQOm5OyrmmuP0tQ/wjaWVstTy+dg8p0ze/KF7pjhwzMyWNmKm/MrtOCsTIo2LCgVb/4hgpgLfrS/vuo8+uEXSF7/j604aTrkhP2pY6uLEXCWwRZu6tf3kmxdbp9Oq35zL4XSvoOv0tx1l9Rf0F8tkMIGfjS4ssQloibmDJj91UM0j34fiUHpyJe0MIRN6euQl1LLBzKQ6gTc94/+NzmCsleDLlVTzo6QiFZNfDtF3HEDAad4Z3fB0wZD3yCpb7JEb5TICwOqk5BoC0VC5UVONHWwO3n0fTqWMHyeiGsARfGlxcjPQ+YrOnA97jfwwRBVaQP135PdnQm/EU1oSqR+CiQqmsh7PpBxKMLhcEqiR6B3kUrtZkRPwdFtzC4FLQ6mqABh49eXSreoNLCCA6JoD5ogSPI9j8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(6512007)(6506007)(83380400001)(2616005)(26005)(5660300002)(66574015)(186003)(53546011)(2906002)(4326008)(8936002)(41300700001)(6486002)(316002)(8676002)(110136005)(66556008)(66946007)(66476007)(478600001)(54906003)(36756003)(31696002)(38100700002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3YydldqVDR3SW5JUCtGZVUwNGg2V2llYWF4bFduTkJVYTAraUhuQmdJL2Fs?=
 =?utf-8?B?OUlSNVhodDZvZ0ovSm1YRGJxbFFvWEh6WVh2dmxHTWdSR2l1TFNoeUI1RVdy?=
 =?utf-8?B?ZDlyVWJmUFhYZjJVVHdqNnByT2lnRVRlaUV5OENqVjBpZ0o5VHk1bXVtZmxR?=
 =?utf-8?B?Vy93N1hVZUZvTmRvTGhSMGxNdFlzUVlxN0RwUGk3clNpSk1MM25OdDVrQm14?=
 =?utf-8?B?NjVhZVo5ZXNCMmIyb1pYOUxMMm5vRFZldnIvd1NWQVBROVR2aG1QaGcwZHNo?=
 =?utf-8?B?KzlsM0JCekhzb2crOWNOeUNLQzYvV05KRlJmcE8vUzVZV1VZN3RaaWUzR21h?=
 =?utf-8?B?dTM1RVNGYnZzeFE5dEhJSkN1QjFhVXNUY29SeDlFakpuTVgrd1JtZWtpMkJu?=
 =?utf-8?B?N2dvdGsyQ3N3citHcFk1a2lMM1hzczZnMHFvTlBSUHVRTjU5OWlmWExjamRo?=
 =?utf-8?B?WUlhdUxXNUdvb0gwRmphRVFtK2dTQ0RjQ281WVlZNXNFSEJORzk0dGdhdC9C?=
 =?utf-8?B?T0NTQlN0R2VLektRajVsZ3EyVkhFQ2M4bVVUTGhxK1BXMmNZcTQ0UmxDZ280?=
 =?utf-8?B?MUV3UkdPMGNZU3RuQjJTeEtzRGJoNmRvZWI4eTRDNTkxMXd5Wks4dkZkQ1Rt?=
 =?utf-8?B?eUk0eTVOc2h0WlVvWkdtUWZJU1o3UytId2RlWDUzU0NPaHpXVS9weVVYOFFF?=
 =?utf-8?B?cS9XSUVKQVdxVmY3TDl6bW93S3RKMk80bTIwYllXaVR6ZTh0eE5lZ2dBQ3FN?=
 =?utf-8?B?cGRQdG9IK1JnT1FYcW9meVl0SlU2azhUWWZpMXZUOXY1c2hQeDRZeVNBbmN4?=
 =?utf-8?B?dS96VDJPVm9yOVh2dnBDNHc2MUhxaWNsOXRkZHovcStmcXRGbUszTEd3cnpL?=
 =?utf-8?B?cXFOS2RBU09BTlNXbkVhbTNkdUxYcjBRSis2Ylczb1ZUSm41aFREREFiMkpD?=
 =?utf-8?B?ZkJ0QmRZT1VGMnFZZlBOWjJjWEdReWRsUWJSTWVoUytyZm44aVlmY1NwTWtz?=
 =?utf-8?B?eWJsbFVNL0VHN09aOGxjSzBoY094TWtLN1k3NzR5amVoQlVtaitoT1E5dy9T?=
 =?utf-8?B?cXFrQVl5ZzlWcUExVWVydlZaTEIyME43NjdKc0s2RDJuNU5FTWZibXk3a2ND?=
 =?utf-8?B?M0NpcFhUSi90THV1OVpIeGhhdG1FS09RREFWcmJMVVpMQUlXdjVXS3JLZWhp?=
 =?utf-8?B?R1JjTkhXT3Vnc2xlUGFmbGZIQU1zZG5IMTlvNExEcHVrcUUrTVJ6MlYzcnpI?=
 =?utf-8?B?SVlqbUR1Nzlya2Z3L1VBUHd1aW5CcUtBOVBrYmJEOFByTVo5c2ZmOEJ3NHVr?=
 =?utf-8?B?TWVUWmxSWldXWEhNMSs2b1pRYWtjQlVXV2dwU0NMNnArMTZMeDI1SzVCaVE2?=
 =?utf-8?B?L0FqaWp2ZCsrNUNsV0Q4ZkxabGZRYzBXMHpxZm9xcmwyTWkvM2w1cmtyaTV0?=
 =?utf-8?B?QUF6RmhoK1Q3ZnpIUzNmR01IeWRydEdGUUgxdUZKR2NKM2o0OEN5SlFMandR?=
 =?utf-8?B?Vi9HTkRPTE1rMEVsWnV4VDlUdFdtNHpwWGVMVWVUbW5FdGNpZ3k3Q0pHdnJo?=
 =?utf-8?B?dS9zREsxYmQrN2duaCtUWit3bXNMcFg1RXpka3krUTlWK0FDS3hIM2ZNWTdo?=
 =?utf-8?B?ZWJvaWF3OHplV1ZYVDkzS3VqT1hpN1hTVGYyQXlqcm9rdko2Rkw0TEdPK3lx?=
 =?utf-8?B?cGdNNTVJdXFVU0tuTTdmRFVJMEdOSXRFWDl2NDFHUGdJN2tFKzZKYkhPNjBG?=
 =?utf-8?B?OEhIdGdpdUx5L3Q2ZE5SenRDaldiZFZ1TTlaaFVCd1N5dXI0N3JrckRlUERt?=
 =?utf-8?B?NWFuMk5XR0haM3hUYzM2Rjd3UHRjSWFjUWYxUUxPdHRGMTYrQVRtSnBqVm1R?=
 =?utf-8?B?aXZsRlZnZjJnNnAra2ExSU03QzFHMXRDVmRIZDNSZ2NacENEZVd6N1VNZnIw?=
 =?utf-8?B?Y0hmbmV2UjA3TTV4UzIvcWNVWVh5RTdXSzlaV2FBWmtWWE9aaHR5LzhyamZD?=
 =?utf-8?B?OVBCZWZwVTJZV3BVdkRsSzNYdTRKSGV5U1F5RTV1V2pLZ2VyUnZwbzd4TVVm?=
 =?utf-8?B?L0loRDV5MWUyU2R3UXd2Tlh2RXJsYnBuaDAxMVV5bnI1OElKZUNQM2lScldq?=
 =?utf-8?Q?WoKlkeNDDFOCFDr381suEPCMq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cc306f-3c3e-4ceb-5462-08dac22184fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 07:10:44.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuSV49Sjfnbukdz7APwzj16kN4O+bt8oiJ7wx0oLysB7J5vQV6pEEjd+U0wwN1EZx51VcZTk7oK81OTQfh5zMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8522

On 09.11.2022 03:47, Henry Wang wrote:
>> -----Original Message-----
>> From: Edwin Török <edvin.torok@citrix.com>
>> Subject: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix build
>> error
>>
>> Building with Dune in release mode fails with:
>> ```
>> File "ocaml/xenstored/store.ml", line 464, characters 13-32:
>> Warning 18: this type-based record disambiguation is not principal.
>> File "ocaml/xenstored/store.ml", line 1:
>> Error: Some fatal warnings were triggered (1 occurrences)
>> ```
>>
>> This is a warning to help keep the code futureproof, quoting from its
>> documentation:
>>> Check information path during type-checking, to make sure that all types
>> are
>>> derived in a principal way. When using labelled arguments and/or
>> polymorphic
>>> methods, this flag is required to ensure future versions of the compiler will
>>> be able to infer types correctly, even if internal algorithms change. All
>>> programs accepted in -principal mode are also accepted in the default
>> mode with
>>> equivalent types, but different binary signatures, and this may slow down
>> type
>>> checking; yet it is a good idea to use it once before publishing source code.
>>
>> Fixes: db471408edd46 "tools/ocaml/xenstored: Fix quota bypass on domain
>> shutdown"
> 
> Nit: The format of this "Fixes:" tag might need to be fixed?
> 
>>
>> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
>> ---
>> Reason for inclusion in 4.17:
>> - fixes a build error in a previous commit that is already in master
> 
> Yes, given this is a simple enough patch:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Afaics this patch was previously posted in isolation, and it was
already release-acked. What's lacking there is a 2nd maintainer's
ack or a proper R-b. When it now is patch 9 in a series, it isn't
really obvious whether this could also be committed in isolation
(it looks like it does, but a clear statement to this effect
would have been beneficial).

Jan

