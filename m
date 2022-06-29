Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481855FE3A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 13:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357825.586656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VZB-0002Ur-MI; Wed, 29 Jun 2022 11:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357825.586656; Wed, 29 Jun 2022 11:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VZB-0002S2-Ia; Wed, 29 Jun 2022 11:09:05 +0000
Received: by outflank-mailman (input) for mailman id 357825;
 Wed, 29 Jun 2022 11:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6VZA-0002Rw-5A
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 11:09:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e233b831-f79b-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 13:09:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6700.eurprd04.prod.outlook.com (2603:10a6:10:109::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 11:09:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 11:09:01 +0000
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
X-Inumbo-ID: e233b831-f79b-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXN3hE2ZRqUat6oQEm7UgaJzUPUhG1o0vFwv03tFzGx/ILgBbHoSQGUsAuokCxbJvMF7Iq4e6G1VfrLuJ9WIswf65dg0n06zGmuTxBqHmZjcstq1TtecJtBJMdp1C6eJ9w6HhZdwLMym31A9sXDSMx0tAj+fDzUe8wQZ3OEI1dZSk14EpqDjDVuab1ZBDnjKt5YWJQM7EyrQnjVkvmyQjb1IWGRdNUnhJ8cmJ4w9FdxqqCTYFLtB01KWSN2jtGTFFqkPHDp8SzYKr3MQekVAMN97e73rlcgMdkgsFrqSdhpcKyt3hmoIhaVeocqU6x4rfhx1Te/3AAOzncKaIEKQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoaNgmGvsxM2XJ3pqymMDLiSoEN7vnOQiiS6ig3BON4=;
 b=PRv99yt3D/6worm+S3fhmMX3iQn6M9WYNRTIBn0E0Fq/opwhS8yFCq+JgKuTWlDm5Sz9MqdLU6oHaAP5OCuV+NoH7tKUZdTiIwS1+LM9rC3c0WBsQusNlLBkXO0InGfRUsAijfmiqPgwD5xW5fHROsQyHZOJc6wtJkLCWnkJ8MLV6qHRBg31MIOF+MR9FsP/UUbuZApyHUXy9RxNmYZxMvTMjmuwaZsCtVoozs1QOqVtLldOEHvFb9/L68gPfsN/EF70BD/PplC7yVnDcextWc5Sl7LEe1suhVJSqJKxpHD3ZlwxS5fJs1Xio91uv+JmrBBQAamJw5mJ5maGRDE/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoaNgmGvsxM2XJ3pqymMDLiSoEN7vnOQiiS6ig3BON4=;
 b=VC4rOaqkNcK7dnsTMWB2CtPMvZXrOtPCb3gPIUM3q+9wX4yNtD6WAI4cQeWeullOcSIlUj4kkW+B04rQWTxHIOaHC8wrKQbsSO3eXl3n51J8ftoY1ilEBnfFUD/mHjXBgfOUPUL+xdfOBT2mAwuEuXcL8gAsIM3WrEBBDCuKZQxeSp2AXbBY1MshqV+ASyulipZohUbDL229WGUYzdSy0RpYvglXKPH2p2mmc7s71jQbPIlho4oP+a8uRhJFUUUIjf+pTUgV1sToQBw72vqAwrcaNkBcNxpEN2m4HyIVej7UYuKESGa3Gr0S/TH0Dx/Q2v10tOSECdHSqOWx16jDOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bb4c5d4-325a-d14f-038b-7206b3b6b29f@suse.com>
Date: Wed, 29 Jun 2022 13:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v10 0/2] xen: Report and use hardware APIC virtualization
 capabilities
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jane Malalane <jane.malalane@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <e16b3b4b-45f3-a520-0360-c1d59602469b@suse.com>
 <Yrwste7T5DSeazjh@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yrwste7T5DSeazjh@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0497.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b5c9c0-5f6f-4825-9cc5-08da59bfc5a1
X-MS-TrafficTypeDiagnostic: DB8PR04MB6700:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VDrWiwBG3WRhzHtiP9FUCM2TskZnh5Tc6slhFhox8Rzu+RoRSPam4VmVNv9XWq8jwpypKaYaGlQKFuk1qmOonWcE5atVg4oGXNqtnl1/jk8YEIr4iYZOAcKdAPraXFDQfPY/wGvBnY1R1+fg8VIGWOvCw2h9jAtiAaF8rdoxbHxnKsSZwGpK27CiHwnlOeJG/VwtEiSNLiEtklJ8OkFsNM/vHOq3ztc7a2IaN8PK2+Bjsz9/tBIphY9PWLcg1Y0sDq4oHa54lp1urfT8x6vQm2sgrPFIUr9UwMSeaNJw56+gNNXzFIfQr7uftFnlCgXz77yv+ncn1nl6WzeRwrQ6oLQF0FcqLFagGroBjEaMVmzXve/XAY3RegLbdvzEC+/5Ooo2hfQhqkawPo1cIU55fuxM19NN6v+/5LuQHWmpcFPNZ+nKFpy4n2z8qj4VzDOePoo6yy7r1AK8t6MUuGFctAFm5glvdKat12j7dZ8QEtHZOY3WaaQ9cDy7taHwWK8k3Auo5SY06Zzaesj9Pa39VX+0me2/kMgl06QSEK8jHT+j5Lzv+0/21D9fYEcmrIKVUDViel8oeu2eAvg4w/bP9CZw/YLxrRkXT9zU3FQrDdvaNhsplKsBFaRx35Q+d7k9wtUwZrXtsEs2p1Qc2ZNanV0lczUwuVwPTJkitBGgiNn7f+ygWKgpTUlKI0KBiKgVa1DZMhvR2hMbquxMpRSRMP6CdIf6zNtRMPiPsWUVqyLXafLYRDWIYjsPk90g5Sr1JfvvaQqpv0qWjZgD97bLeZf7XtXqcxif26l1b7K0GFwhLcySw5dT609iWLt+xRLoeMFfGqWOzCsrH10shCk2Dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(366004)(376002)(39860400002)(316002)(54906003)(53546011)(5660300002)(6916009)(2906002)(36756003)(41300700001)(31686004)(86362001)(2616005)(186003)(66556008)(38100700002)(8676002)(6512007)(4326008)(66476007)(66946007)(6506007)(8936002)(26005)(31696002)(478600001)(6486002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDhvb3hMbVBoRnFkNmZNRDhpNjd0NDdCUU45OUxmTWl3ZmlLM05kRHNEUnBT?=
 =?utf-8?B?SGVDdW5lWXVhYTRmVlpWZkpkeDI2TUVvK0lDcjI1cUpmamNCTXlFV3pHQ0Ey?=
 =?utf-8?B?UldsYk5qdGF4QVZwR21QNkFMVnVhL3gvYWRFSkZwQnpkWGJHVmM1MjBadWZU?=
 =?utf-8?B?VDRQVS9FRE5FNk1qSG1RczJIREhISGd2d3ZxMkJIa0M5eXFXS2lMcHc4M0Rq?=
 =?utf-8?B?T2NlZnhoU3B3bmc5R3RSSDBtaEQ2Q2hPUmhwS25jckVUMnpTanQxN2xwZFJT?=
 =?utf-8?B?dHdNcnorWkpIbmRFUEdhdisxSnUzdFhNVmxaWnFsdWZoNkk2ZlJCN2wyN2pq?=
 =?utf-8?B?QWdlMGpzckkrTks0a1A5cjE5eEpjR3VwWkk3SkNGOGp1QkJ4Mml2cExVM2VX?=
 =?utf-8?B?TitpTnBQMklNWXBVaWNXUElFcDZQN3dZaTF4OFZ0blZxaW8wekJPbEZ1TzB4?=
 =?utf-8?B?L1FZNXJ0aEFWSFVpZ1hEaU5WdXVicHBUS1JjOEtIWGRWeE5zakZYckZzLzdG?=
 =?utf-8?B?eDZ3aEVNSitzV281OEhyK1VoN01hcnNnNk1wMElnNkVOT2E5Z3hMU0lLZTNY?=
 =?utf-8?B?czFZR0w3VjZjdzQ4Mml1QTZwLzFsMXhYTkVoZm5tUHJNUUQzWm4rNmlxZEgx?=
 =?utf-8?B?RlQwbkRLdEtXQVVlM2txaTBLOUE5S2hGZW9TbXdOVWxjRTR1LzhDV1lUTHpw?=
 =?utf-8?B?VitLenlCNllUdVVaaFRrS0RIaURRdnVvdkpsQ1NwOFY2RkFxbENCYWJ0cEM5?=
 =?utf-8?B?TWZ5Q0c1a0g5Y2tPNGRNTnJKNzh1aHJ1OFdTTmVlTlVmUGlGVjVQQk1oS3l6?=
 =?utf-8?B?Rzdybys5SmNOYzJHV2JjN2xNdUZEcU9URkZWQVVaaFRIVi9uU1IvUVFFWjM1?=
 =?utf-8?B?MGlyMGppYnk2a2p5U0lNZVJXSnZaVG96MElWdk8vakNuMW0zM3FCbHlEL2Mv?=
 =?utf-8?B?cHpzSDNEZmFWL1BlTnNRNTVoQzNoa00zdXJBc2VYZldHa29hai9YRHVTWk81?=
 =?utf-8?B?ZmRFTEZBcEtKaHpOdHlnaVVEc3Vwc3RjUjBJdklhUjFiWWtIZzRFVElXL0JS?=
 =?utf-8?B?aHdlRE10RXIzUHFHUE1EVTg4b2svanA0bzlrK0Q0VzBnbS9mOEIyUjUzRkNG?=
 =?utf-8?B?ZGtaVHZBTzRSZmZaVXhtVmN5MTFxOWd0TkJidzhCU3dEVktjUzgzdS9FK0VR?=
 =?utf-8?B?MFpkVTMzTEJ5bGpLL2FxeEhNUFh6ZzRkY0o0WnluQ0dxbmplemw3c0h6RTgz?=
 =?utf-8?B?WVNZeHlNQTRiRXc2aW4yeXd5SGYydnE4cmtjYU9YSThzZlVTTHc2ZEY0Y0VZ?=
 =?utf-8?B?RCtEY3llMkZUUmhhbGltd01qWUtRMmIvSzN0emc5RTVWaXFsdFYrcDRTRldN?=
 =?utf-8?B?YjhZZ0dNM0JwNlozQ243dHRTc2VqZkpqY3RyalVETmxBVXpwbjNOY0x0NnVo?=
 =?utf-8?B?ZXBGQnhQR1FoRHF2WHFMSVZ4OEc2VVN0OGJPQS9aYWF6Q3Rqb1QzQ1luSWtx?=
 =?utf-8?B?cnpoQWF3d3NGNzNocHBmbmZSdnJBYVRkWDdWaW9Hb05HL2w4blRIMkQ4YXlo?=
 =?utf-8?B?c0UwaktRVjdNd01MQXhQZStZOHo3ZStGSzlwTEkvZUJCY3QzTnI1WHBqdUVU?=
 =?utf-8?B?cUFDcGRVMEpzQjRtZVFlNlpSd1pxUlBuelYxRGdiSU1vU3VCNTBCbllxa2ZN?=
 =?utf-8?B?VlkvTFpMUUpNNzF4UFphR2lvWmluNjZPVE9IY0R1b2JmUDFEM3FRaGtHWG5r?=
 =?utf-8?B?emgvOTVhckQvUGlYSlkzNVBBTFFzSjNNeVQ2OHNPZ3BSaFZSajYwVGoralBC?=
 =?utf-8?B?UGR2S0twUitaYnczVzNtbFFtZDA2Sk05aDRibnhzWW5WNmVRYmRQZ0hNYXBU?=
 =?utf-8?B?Nm51Y2JmMjh3WXVWdXUwODhSd0ZPQ0NGdmZPNnBoYTRHeURlVU9OSFFhcWxL?=
 =?utf-8?B?K25iUmYwN1k0a3ZNa0VGKzVyYWxiUHlTM0xHRUw0c0FtUWNMRDRud3Y5bGRD?=
 =?utf-8?B?TlVPb1JBY3BrckRQbkM1WERoVFJEUGEyRVNnN1lSTVBNYnNkV1ZLL1BkTkNL?=
 =?utf-8?B?ajJZL1JlSitHZmlVR0hUeDN0Wm90NkZLZW5KL3dJUDF6UnJ0a01HMWJEWHZ3?=
 =?utf-8?Q?A21v6QJtVNVuG1x3Pkpj++mgG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b5c9c0-5f6f-4825-9cc5-08da59bfc5a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 11:09:01.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJj9KPzX8OfgvNWGnqbSG4hpb8TilX/UlxesS/ZsZvN1yqD077dJrwzO3NswsdwCmXKCWe2GF8RkcaOMJL790Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6700

On 29.06.2022 12:43, Anthony PERARD wrote:
> On Thu, Jun 23, 2022 at 09:23:27AM +0200, Jan Beulich wrote:
>> On 13.04.2022 13:21, Jane Malalane wrote:
>>> Jane Malalane (2):
>>>   xen+tools: Report Interrupt Controller Virtualization capabilities on
>>>     x86
>>>   x86/xen: Allow per-domain usage of hardware virtualized APIC
>>>
>>>  docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
>>>  docs/man/xl.conf.5.pod.in             | 12 +++++++++++
>>>  tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
>>>  tools/golang/xenlight/types.gen.go    |  4 ++++
>>>  tools/include/libxl.h                 | 14 +++++++++++++
>>>  tools/libs/light/libxl.c              |  3 +++
>>>  tools/libs/light/libxl_arch.h         |  9 ++++++--
>>>  tools/libs/light/libxl_arm.c          | 14 ++++++++++---
>>>  tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
>>>  tools/libs/light/libxl_types.idl      |  4 ++++
>>>  tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
>>>  tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
>>>  tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
>>>  tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
>>>  tools/xl/xl.c                         |  8 +++++++
>>>  tools/xl/xl.h                         |  2 ++
>>>  tools/xl/xl_info.c                    |  6 ++++--
>>>  tools/xl/xl_parse.c                   | 19 +++++++++++++++++
>>>  xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
>>>  xen/arch/x86/hvm/hvm.c                |  3 +++
>>>  xen/arch/x86/hvm/vmx/vmcs.c           | 11 ++++++++++
>>>  xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
>>>  xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
>>>  xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
>>>  xen/arch/x86/sysctl.c                 |  4 ++++
>>>  xen/arch/x86/traps.c                  |  5 +++--
>>>  xen/include/public/arch-x86/xen.h     |  5 +++++
>>>  xen/include/public/sysctl.h           | 11 +++++++++-
>>>  28 files changed, 281 insertions(+), 34 deletions(-)
>>>
>>
>> Just FYI: It's been over two months that v10 has been pending. There
>> are still missing acks. You may want to ping the respective maintainers
>> for this to make progress.
> 
> Are you looking for a ack for the "docs/man" changes? If so, I guess
> I'll have to make it more explicit next time that a review for "tools"
> also mean review of the changes in their respective man pages.

No, the docs changes (being clearly tools docs) are fine.

> Or are you looking for a ack for the "golang" changes? Those changes are
> automatically generated by a tool already in our repository.

Indeed it's Go (where I think an ack is still required, no matter
if the changes are generated ones [which I wasn't even aware of, I
have to confess]) and ...

> Or is it an "ocaml" ack for the first patch? Unfortunately, the
> maintainers haven't been CCed, I guess that could be an issue.

... OCaml which I was after.

Jan

