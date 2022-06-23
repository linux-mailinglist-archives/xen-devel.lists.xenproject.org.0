Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC75573D8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354452.581563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HBf-0006V3-KJ; Thu, 23 Jun 2022 07:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354452.581563; Thu, 23 Jun 2022 07:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HBf-0006RA-GJ; Thu, 23 Jun 2022 07:23:35 +0000
Received: by outflank-mailman (input) for mailman id 354452;
 Thu, 23 Jun 2022 07:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4HBe-0006QO-8r
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:23:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 622cebb4-f2c5-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 09:23:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3662.eurprd04.prod.outlook.com (2603:10a6:803:1c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 07:23:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:23:28 +0000
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
X-Inumbo-ID: 622cebb4-f2c5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOXaOUqWpw1GoMadxaAoYIUKRYjSi4Juz4c0CCd4uxtbfZGsxlDICsNBVPGM+pgosLp/TCDx5jRtAKZwxJZOCl7R7Li23etplNyhQdQDa6MspkZr0EzgLbO8Vy5T2/OsV8RTub0wVEw9xqCt7rjiL4nLvwa96mwbjGkQqGUU2ev9s8QUdSwOnNXPQimzRX+Ogf33KwOPe7ZhI2lR5eYg4rT/OD4i9IokVQRH4F/eGfc34cxbnljEFHvUd02xiToXcoUc1kR7wGgs+D1blG/1qxjLyS5xa0GY1bcrCCzpGzoH54ya4aYOzdRval/JvEImv/V0sMKzApLIB1yCGhHIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhVcCrq+jx0jYmRPaybSl8F3Py7HhKoGOD5h2YPRjNA=;
 b=cBs/2ScI+2oQrmU24LX8JrtERKaQunB7xPC3tJBD9Is3R3Op827FsmYsXhJCyEYTT22Zb3ithrQx2e2jfq0cIH4Z8yx2cRltLY5fGLxHfUldnzQym9GR1bynTPh1aIuVMYcVLmdyDnseesxr8oRC4RorY9ieI/+Q1338nVkuC63qmI+2zPMU3OOI4mVm4iktjaj6nAP8Bz5vwPml5gXzxtrg7Sby8OS0AZa2r9rxMlaPxwCQw+vFWX+VvSuyowYf2yAnECdYBRVXUos+faHX0unAJG8TqF4hecB8kDOhQo3w1a1eCe4FKeTOaeDOIzw5AehI1p7TfV9bJ29Y7GFPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhVcCrq+jx0jYmRPaybSl8F3Py7HhKoGOD5h2YPRjNA=;
 b=48QHQvfVTwAn71SBrwuxweQfZ0qIlHsH4xU/OAQnMDPG7u3+jPY9DrGxj/a5mORa6vm9AYw3BX4FyI2vABQ48bO5CQLvhmSiy7nu/jrC/a+nS1FA5rPsAWemSmWDcRMJHuUPNtuU5c4wQicupQEevN+zF15sFRM8OBJ4/pUa9i6oO2C/O+RKYCksbpDqjRoeOru+nuRiMyqdUVtHu0/sZ+cpvZdWaz7xae9V8NyjADTMnKJdkBSRNarGklbrLnjZxpywlEfu5fm/u3eXrPctfM8cvfiCcnEthTZ3O7z6dQBQzzJ91ByJ9+2oGUvQQbJBjpC5wF1Qt3UFxRT5MoRA3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e16b3b4b-45f3-a520-0360-c1d59602469b@suse.com>
Date: Thu, 23 Jun 2022 09:23:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v10 0/2] xen: Report and use hardware APIC virtualization
 capabilities
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220413112111.30675-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 347660a8-cd3d-4bbd-5037-08da54e944d4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3662:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3662F3D5DBB27DA383B8C7ECB3B59@VI1PR0402MB3662.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZuMwVqgYjt5QoWiXqXhevGrL2JIkh/qddlC1VUyVg6LoxXmF3eReHCNT2KHxuGodxhZUeYZZQju4qjhfUzYIEz90AD9I62oIDsetvvJAKSwsuDH2d99DMGs19cdxe56V6Z0iGNUyMgOZ/YXzpOJXZC5YXLo2oholmvLExXyho4FO/PVpwBYIsu2kAMaEkSvbnfz7siNdrujFjpkEP2htlOpxv2avP0w5dJ0x+/Rqbv8XMAc0auQk3LA+QS4RfQFrO/cDZEbSg6O0rhFEesGPDKREaq8Op/YptBhxnCb4zVpqYFA24wtrud3suIV9C+b+sVbwbifKs5A61xJJBMexlI9Q8PzNPbYjFVToOL0fcP1tsUUStOxYqLEJgJIwlNiaHHmBbDPxDv157FqBiHbFbGFcVy7Kv2vJJ+EmJn48ZoGfmTZt/XqtwxsKmsHIdoZ/XWdHFkAgEtVesIEzp39WB//yt6RoV8htyNVSKMi6ZEC7XCS9l/z2kZfUyRmxXsMwJCkSsKpYhaaYTDeVeVbTa1NXcWL2z7/V88MN/953UPEdV45Ai3AJ1aCKsaRMZgWYgr8CIFHhvzWsgo5IrapXTyac2jEBN39ug6Y8Zf4P9fiHTfq1geIpaDk7G3TkmZmxmOnA6sgsxiQyru9/l3Cr8V7ZSZPsCfLOesLBCg3gZHd/iq6zBiN/3S9ICfAjH2MjWPwuJNJgWymlqcxDb2Ln5pNoT/0lkw3g2gdAv2C0AXkw2gpmWvrgaz4Wm4RSfv3mYA4oZB4x0hx6IcMgfd2ZXZWmdxzZa/W+sJS0n23rt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(39860400002)(346002)(396003)(6512007)(2616005)(31696002)(31686004)(38100700002)(26005)(316002)(2906002)(86362001)(5660300002)(83380400001)(6506007)(4326008)(66946007)(8676002)(6916009)(478600001)(41300700001)(66556008)(186003)(8936002)(36756003)(6486002)(66476007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHVjdHpEaFh5UzRZMlJENStlbDN0b3dLaHFIazJudkxoeS82a1o5WVdGeWE1?=
 =?utf-8?B?Y3FYdGl5VnJDQ2hSSk1BdU1OR0lyd0RmNEhzYWFCdnpuSFg5amFpRHJObXFO?=
 =?utf-8?B?RGU3M3dZbW5vdVhMeDhXRkFtaGwzeVk2MGIxdjJPalBuR3F5ZFdBa3h6aFov?=
 =?utf-8?B?TnU0NEhGSC9WdWpoZHFKRXdmQWhUUGNLa0dwMjU0a1hieDErWUNBQjlvWjdC?=
 =?utf-8?B?WkRpZWlOT2tEM3lRWFhnbWtjaHJtU05jTXI3TDN5YjRwbVJ2b0R2Z09LRzJI?=
 =?utf-8?B?RVBUSElVaE9sVjdYSFlJdVEySmNjK05xem5xZ2dWYjhFUGRocGlBWFdiTkZs?=
 =?utf-8?B?VlJMVWtJN1BVSjdEbDZPU0JuV0d4LzN5SkFvdVhIQmp5emFzM0dLa2RoNy9H?=
 =?utf-8?B?ZTdVZ0pQdmh0TFBBQVhoUFhteTZ5OFpYVVlJV1YwUVBLOTNnQWtqZGVsTFE0?=
 =?utf-8?B?eFl0U3ZrNy92cnJUdFRiL1hpclUzMmJtV3dyODZnZ3YyVGRWWk1qVlRhL0RF?=
 =?utf-8?B?UXNzcktWa1AvNXBlYm16WDJiOFdVd2pYa2UzUjhiVjFITUEvN3BUR3lzSk40?=
 =?utf-8?B?eWdnYWdQMGdNd2hOdFVkYWZnMkUwaS9CUmpzUGtqSG9IajBnS3QrS2dmTkg4?=
 =?utf-8?B?Ly9UbnpHc0U5ZEFOM2lDYU1FbDVXUW1YZFBVZm5rZks2dkxSVGhYaHlhUDI3?=
 =?utf-8?B?T0VGTUNZWitPRWNFWWVvTlRuRkkrM0UzWFlQQzl1OGlOZ0NFVDZIQnRybWZQ?=
 =?utf-8?B?UWN6U2ZubHVTaDhwWHlwMDgvN2ZSSkJnbkhlV0N3VUc4YlVJcWk0WHdYaXEr?=
 =?utf-8?B?djA4UVh4a2FYYXhnaDVlZWxhdnhybGYyKzFzZTFZUndOWUs1OWx2ZjNTVlZn?=
 =?utf-8?B?ZWEyVHNoV2I5NnJhT2pGbXJISFhMczJPeTZESkkzWGVmZ1REZk1UeWUyR3l5?=
 =?utf-8?B?WjhtcW9sSmZLaXk3andudzZiZ1Vxa1hJQ2U5dmN1QjFUZnZGVWhmYmcwMjho?=
 =?utf-8?B?WmUxc3NEazRHVnRwYUNwTlFWbHVkdGdqTmZsRnJDelVrZStNNGlUbkltNHVv?=
 =?utf-8?B?bUlWOXU5SmZYaUpQV3RqV0dzYXF0QmtVUERjK1dsdE1XY2NleGNxSkVTLzVs?=
 =?utf-8?B?bmNXMlRuMzhiZ205dWJkTFBqNDYwbk5JNmZNSU1ya3JidkxFSFFGTVhEZDF5?=
 =?utf-8?B?SGhFUHNHalNqQmxBbmxKbmdDekR1a2xPTGxBZ3B3cTFSNkN3R3o4a0xIbUdT?=
 =?utf-8?B?Wjk2RENNTXN6NjYrSSswbEtodEg2Z3Jmd1VtUmhKeFB6RlRSTGREbVhlZVJ2?=
 =?utf-8?B?M3VkbkpzcS9nRHBSU0VKcEg2aU9udkhWeVU4YTQrRzdHbnRIdE1ncTNibGk1?=
 =?utf-8?B?THVVZHNjQ3lFNkxvSk5hSHBWa2s0T0NTdkdVdi9CWFl1UHp5NlFHYjQ5cFZL?=
 =?utf-8?B?SFFGQkVGTGQ0dnRMajRYQ0g5NCtXY2l5bk9ySHdtOU9aL1RKaE9vRnB2aXZz?=
 =?utf-8?B?emZUSmtxL1JNT3pDYitZSW1DZmdQMzFpODkvZFg3NWk0a3RYbGZaWFllQmJm?=
 =?utf-8?B?RFJNU3I5ZVFnU2huTC90Q2crazBOK0VsREdJWnh0eW1UZ0lyczFwWmpjalBh?=
 =?utf-8?B?NWIzbCs1TGExQ0RFQk92RXBOeHE5N3ZTaTMrclJkdTc2WGh0S2lseFdXTlcr?=
 =?utf-8?B?a1Nsb2NwdENUeTh3aFd4bDh4a1dnQ1Z2WFhEejYzWU1zQlBzbTRuNUdRVHYw?=
 =?utf-8?B?YTNNNlc1UFRQempaaGxoaEV0cjZwdHQyT3IwS1hrOWxyRFpNQ2tUV3Z5K1pj?=
 =?utf-8?B?Q2d2YnpibWNFQ0c1U2doNkJRL2tFUm92aGs5NHRMOStlVG5qM1JHNzVHbFdO?=
 =?utf-8?B?MXBpeFh2WExUazZuZHB0N2VUTFc5Ry9oeWRuMktjSWpDcFF0RDNrckhTcFJE?=
 =?utf-8?B?K3VmWXZId2dMTVFIYnZhKzIwMVRnN1doVmUrb2d3NVlOa1dVbjc4b1BUR0Zh?=
 =?utf-8?B?dUhQcXNGR24zUS9vZFpFRjFtVVlVZm5xOFdWcmM4Ym8ycTJXQUJUenpsaXVJ?=
 =?utf-8?B?UFJkSjhTbk1ublJ3cE9qazViNkl3bCtFbmFyVENrNjRaYnNObHZZek1ob0ky?=
 =?utf-8?Q?LbPPfzgaOcdb1+/kwLs1KQuLI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 347660a8-cd3d-4bbd-5037-08da54e944d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:23:28.6786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RV1JxBoJaxUMijGO/amHEr+KgJXTJgCMtsgrbp3dV/uCAjudyXN/6wSJ9/mGWpJ1dtTajcazUor9u9x8kfKnNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3662

On 13.04.2022 13:21, Jane Malalane wrote:
> Jane Malalane (2):
>   xen+tools: Report Interrupt Controller Virtualization capabilities on
>     x86
>   x86/xen: Allow per-domain usage of hardware virtualized APIC
> 
>  docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
>  docs/man/xl.conf.5.pod.in             | 12 +++++++++++
>  tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
>  tools/golang/xenlight/types.gen.go    |  4 ++++
>  tools/include/libxl.h                 | 14 +++++++++++++
>  tools/libs/light/libxl.c              |  3 +++
>  tools/libs/light/libxl_arch.h         |  9 ++++++--
>  tools/libs/light/libxl_arm.c          | 14 ++++++++++---
>  tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
>  tools/libs/light/libxl_types.idl      |  4 ++++
>  tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
>  tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
>  tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
>  tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
>  tools/xl/xl.c                         |  8 +++++++
>  tools/xl/xl.h                         |  2 ++
>  tools/xl/xl_info.c                    |  6 ++++--
>  tools/xl/xl_parse.c                   | 19 +++++++++++++++++
>  xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
>  xen/arch/x86/hvm/hvm.c                |  3 +++
>  xen/arch/x86/hvm/vmx/vmcs.c           | 11 ++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
>  xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
>  xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
>  xen/arch/x86/sysctl.c                 |  4 ++++
>  xen/arch/x86/traps.c                  |  5 +++--
>  xen/include/public/arch-x86/xen.h     |  5 +++++
>  xen/include/public/sysctl.h           | 11 +++++++++-
>  28 files changed, 281 insertions(+), 34 deletions(-)
> 

Just FYI: It's been over two months that v10 has been pending. There
are still missing acks. You may want to ping the respective maintainers
for this to make progress.

Jan

