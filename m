Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706706C4B0C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513431.794401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pextP-0005oG-3D; Wed, 22 Mar 2023 12:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513431.794401; Wed, 22 Mar 2023 12:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pextO-0005kw-W3; Wed, 22 Mar 2023 12:48:38 +0000
Received: by outflank-mailman (input) for mailman id 513431;
 Wed, 22 Mar 2023 12:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pextN-0005km-Ha
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:48:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbbc4866-c8af-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:48:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8744.eurprd04.prod.outlook.com (2603:10a6:10:2e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:48:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:48:32 +0000
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
X-Inumbo-ID: dbbc4866-c8af-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkbwIHA1KYaQFcexWI/Rml/sVUWtCpvmKuBw1j1CZWGN501m53r8stKP0cUf6e1QU8fSxKlWSVy0QxP5EYxZhcmx5b1TxdyXv62tX2TJFziTKemRjy34dApm6xXj8fKadWiA4IdczbEXWaumIeMX5/f2uApg1yyX7hIaDHDEG3GMF0xnICt97VXi5aHKr6GAAPgUhDNFBhI88/Opdg9HhQsj4gdU7dZbNassKfPHRrJ6TsNudsLMfytEGs/hfHG+ZMq0jBh1uStwJlNi80kKSek/waEj22+RlrbHe4jBfZg4GuxxXNJWB+AGF+Gr1G3cLKQNpdKTpfUHE9WgoHPWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoyRnUxsEaNy6rjjBZUp94UvGqkVw5TgohOxf4QHXTg=;
 b=OjNeEGjJp0ZXBdkwdpusW5v6SNvHVa14sNBXIz96FUicHOGG4XlzwE2t9cHpHQaL+ORIj6tfBoO/jNUrjOtDEj+0niWnfe47xjyLa722z4Vqr9xPB3NWSY0Kgr/H+QhlaraP2vj9xkYYZmUeozNvUb2JjceOMDUJzBvi7qaqCY0dIseROZyfGS5BK6ygarIykRsmBYVlNKgxNiPL14rD+t+DQ9UBMZIZiHtB0Q2kWdTyF+cNvPvy7TXmXpeCxOpnm1u1uI0QsuIRNDm4lbJlyVVrngx8yUCrpOkB7+HRSC9L02rgLdilkg//PSGgngMol7p4hvoNNWf5QTFbBJYCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoyRnUxsEaNy6rjjBZUp94UvGqkVw5TgohOxf4QHXTg=;
 b=QPAU0mF3gWGQCQKjUrfi+Aq/Qe07mDM0uno3ZZfaY7kpzEQz8ywpW+MCTIyv7jJelfA5BjCS+Q/WSeUaqADNMROmG4cCfLr9LMmcqQumTD7nr83JCupH16RkZoSP3AEg5ZBcUdFlMw9Ta2j4MhOVfjk7qECMmUnhyIg5u8DhU8rJbHqPIrVbd0DIuCtuTHZaQ1Wmpd/gIPnYsizyJ2SY/+aAv7/Pi6C1/OfaKeYbBqIEmMqHqU8XDegr4EOGsGJwkrSkyRkD3F+I7DP5/KI/9//Xk+Ji9fCH9sKEmyXRsFz/5MsFnPOa+naPNMv2K2wKLYbpiG+BIiDrFSR/fyFWYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
Date: Wed, 22 Mar 2023 13:48:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com> <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com> <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com> <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com> <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger> <ZBr1k/B/ve8NNqaJ@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBr1k/B/ve8NNqaJ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: fda8849b-8658-4cf9-9646-08db2ad3be5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	diK569KzuXR1l7I3taIWG3/EQNVF6GE9IPTbQEVkYP0XgRHoVQOT6hyhjP8lAEWKKAko8UBLts1dnBzQ6BBQ7fClm5LT8c9sP3vj0kVIoFdqFygFEItBGBhSfZYClPNo1c52kxN7TVDZ5doAcAh4nxqKgIcpycZetKm+hLPvt5QSJOWxepyRVFtR0KjHT3tGt0OtHxLlTrZS6Ex5NGGS+VAh9lh9mrtXVm2kRDL+N61NbCWy+BoYBf/nW5ZTcvgtx34/8OKqAGupF6pH+QNrvyaTK04P++e0RcP+A1nosNP3Jb4qFysor7DFurHty1qNgUoa8NqIe10FQ6iSDjMQCK/yqfmKI/iU4UV6TkqFU6D4RYrX7CzOpw9RqMfnvdwLbHzaO7vqp7ZcPgr2TefDKIJN8FUmSmaVyVeNvAWs0JfQWtAH2mmIYVhqgiSzefioLBPxdDt1kpKdQaOUFSW8/DrCvx7G06QCsV4ObKNbug3gHElgjnACI2M6imMXPuXr7iysCNKiy3qMbDwSrwzHkAIDDNwn3TuuiEs1kRdYVnGMGsAVGmjZ9ehGp/AdZsOUEOIrLokbJfK5ZaFxc+ShNi7Nu0PFfeqfI4bCG8sWiCbzMkZk/q2gSiti9aPyHH5a2pjVxArJtp73jH+G7pB27B1u5MbouLsdl1wcP5TxRB6K15S6jg7r0+biwnifkRyCx3OxAQmAv8qRXy0zX1wdsEJ7th7+w0qNo/3sNto5qhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199018)(5660300002)(31686004)(66946007)(41300700001)(54906003)(66556008)(316002)(36756003)(7416002)(8676002)(8936002)(4326008)(66476007)(6916009)(31696002)(478600001)(6506007)(6512007)(53546011)(186003)(6486002)(2616005)(2906002)(26005)(83380400001)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHQyU3pEVW10NHprSTh0cEpYUUY5MFdTUThUV3B4K002bVhuSCtsOHBmREo3?=
 =?utf-8?B?NEwrVDk4c2ZVUXY3cFJ0WjhvK3NKR3F0cHFOcXg3R2I5V0dWU3pJTWY1ampT?=
 =?utf-8?B?ZXhaVm5HeFN2aHVhd2oxR3B6NHJpcXd2emdoMVBQSG15RVBIbGN6SjJ3Q2s1?=
 =?utf-8?B?dmhNRWZHQ28vSXZnSTRtY3hyV3lBTHZINndScjRhUEE3SkxVSmtva0FTVzk5?=
 =?utf-8?B?VTE2d3dzWEtPWVQ1OFVXNUdHNkNQMkVMN1paYUMraXAvOWdIVjM2cll1cFdt?=
 =?utf-8?B?ODB3QnB1Tmo1U0xpQUtuMk9ERFZvZHJZQU9iZ1FpeVZXb2I4elJqaGpVTXlK?=
 =?utf-8?B?dDdQbklJYTJ4Q1RXV3JtczJja3Z5dEdPL0JPR2NSR21ucGFQVXVXdmVFaGc5?=
 =?utf-8?B?ZE93ZGwxcUE0OXpJWGU0a0xtQnI5TlJ2OGJOTmwyZVdpTWNnMmZnN29sWCtr?=
 =?utf-8?B?b1l4dWR6QUJhcEo2Wnpqcml0R0NaQU9hNVVEMGNaVFlKZXovbittc29VdVBC?=
 =?utf-8?B?UWhhRndqcFVQS1FId2RhdXBmV1ZtMktybmE2U0FjNUpjZ1FuVWM0M1dnbllV?=
 =?utf-8?B?eU05ZzM0ZWtuQXFTdHdqMUVLcmhJZTFCWFQyZEpZRmRSOTZpMzhiVlhyblpk?=
 =?utf-8?B?U2R3b3dZT3Z1ejlGM3RlbjczWkZDVVY5QkkzMm9MdzJjRWRtOHQxK1dSZ1Zz?=
 =?utf-8?B?dmVVQWZNOHdBMmJZL25PdHExcFdEaWhvb0lyY0tHTGNsdWlSbU1QMFlERWxs?=
 =?utf-8?B?S3FCZWg2dnJrZlY3OS9TUndyNWtNbGxyZytHcUlNSEkxclVjc2JndElQTUpW?=
 =?utf-8?B?L3pRcnFaeWlIaE5iUlZhNnpTL3NUekVUZm5uMFloaVZFRWhwMStMZWwwZ1ZJ?=
 =?utf-8?B?dVFZRDdzNTNGVkdMT0VNbmRML2paVG5lZUhuOEVDSHZLY3NLdHd5TExQNXgx?=
 =?utf-8?B?ZjRDTUFacE9NZFFxRDNIYlRiLzhRY3FnMHRTKytVNFJacjVYdXhHaVl4Tzgx?=
 =?utf-8?B?bXhsTFJ6YjRVcGc5c1hqcXk0a0t3K0pHT3paSGxUazNBczYvTWpHU0U2dFFI?=
 =?utf-8?B?V0c3YmFjU0JEaWNaQ3djc1JsYlMrY056SzFQVHgrck1yWTBYSkFiSm43U3Nh?=
 =?utf-8?B?QlNJTkY0cWMwa2lXTXdaSVdyQ3pOVzI0aXFDenRTb3l6L05vOHlSQlRISXc3?=
 =?utf-8?B?SjlJaG5Cc2piWHJBSVdXOHBiaUJCWk1BZmVmRGNSOU5qcUZlTnU0aDNTUjVv?=
 =?utf-8?B?NWtnNmN5dVE4dHZsRGVzajk2ajJ1elM4RFFTN0VVSWEvZTBubHd4a3VqZ0RQ?=
 =?utf-8?B?dVEzMVpXOXBSY0t0bDZxNVlYL1FwQjY0NG1ORHVBR0ZxUzNmYjNabEJMc0cz?=
 =?utf-8?B?RlRGWjBoQ0ZuenhzeC9PS00vTkRoZW9KNnB0VEpsdjFkUSttVHBuMmxkdUM2?=
 =?utf-8?B?dlVkVkdLb2hLaCsyR1pJRzFNVTVUcUpzbGwyQ0poekhhdmtRY3N3ZWwrdFBC?=
 =?utf-8?B?dkNEaUNsQXorSHc3MWZWdkhkT21KcHlZclpqeURvOFRqVTVQT2QzZ0VXR0Vs?=
 =?utf-8?B?eG9nbitoQmVJb0pDRHBMNE5xSUxaYWt5bW9XZU53K1pKY2JyNEE0bFAvUVVz?=
 =?utf-8?B?UVNGN1hJMkE1V2xJL3RSb281b1hNd2krOERZbkw2M05lN3VZSFBacUY5c0Fa?=
 =?utf-8?B?Q1poc0hGbVEvaEFSbmpia3ZVNHVTSGZxV08vd0dqek5ObWRJenMvc0llOThY?=
 =?utf-8?B?L3FnKzk0c3Bzak44Qk9vQVpxRFphV0lEbDFuZ0lHNmZMc0JEcUxrcDRkV3NQ?=
 =?utf-8?B?UDh0Wmg0NzgwektYWEFEd0VjZUNkekV0eC81ZjI0OEptT2gvYVNoZFNFZGZ2?=
 =?utf-8?B?bTNVWDlqbDZway9vQ21WTDR0YVdyMTZDRHVta2VDcWhUYU1vVm8vZmVRMHFI?=
 =?utf-8?B?RENiNVlHQVJRelNSRlJMYnFMMmJ5NjhiV0NMRmFkN3daMmh2K3orQUIvRDFZ?=
 =?utf-8?B?ajQ2cG1tcWJoTUJXZW03ZXJqcmxuV083dmY5RVNZSmJvQXlvK0RWTnNMU0ZV?=
 =?utf-8?B?V0srVzZzZ1pQL0ZjWnVVVXFlSmNnaVlTVHZCSmNiRXhjbVRMem1LaTk3SjJk?=
 =?utf-8?Q?+Oxbt9j93tjAIbaQT2XWhIvVN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda8849b-8658-4cf9-9646-08db2ad3be5e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:48:32.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDi9BX6BRJNo4Pmg1aBww8aG8uc91e/T2INbHFne/60kfp6ySAgNKnAupnbp49wutOJYTJB8AsZaBfK4L/h0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8744

On 22.03.2023 13:33, Huang Rui wrote:
> I traced that while we do pci-assignable-add, we will follow below trace to
> bind the passthrough device.
> 
> pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
> 
> Then kernel xen-pciback driver want to add virtual configuration spaces. In
> this phase, the bar_write() in xen hypervisor will be called. I still need
> a bit more time to figure the exact reason. May I know where the
> xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?

Any config space access would. And I might guess ...

> [  309.719049] xen_pciback: wants to seize 0000:03:00.0
> [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
> [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
> [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
> [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
> [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
> [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
> [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
> [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
> [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
> [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
> [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
> [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
> [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
> [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
> [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
> [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
> [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
> [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
> [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
> [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
> [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
> [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
> [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
> [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
> [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
> [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
> [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
> [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
> [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
> [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
> [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
> [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
> [  462.911658] Already setup the GSI :28
> [  462.911668] Already map the GSI :28 and IRQ: 115
> [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
> [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
> [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device

... it is actually the reset here, saving and then restoring config space.
If e.g. that restore was done "blindly" (i.e. simply writing fields low to
high), then memory decode would be re-enabled before the BARs are written.

Jan

