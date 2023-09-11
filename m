Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799879A430
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 09:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599062.934309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfb42-0003AT-4l; Mon, 11 Sep 2023 07:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599062.934309; Mon, 11 Sep 2023 07:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfb42-000377-1t; Mon, 11 Sep 2023 07:10:30 +0000
Received: by outflank-mailman (input) for mailman id 599062;
 Mon, 11 Sep 2023 07:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfb40-000371-5y
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 07:10:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47cd5287-5072-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 09:10:26 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 07:10:23 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 07:10:22 +0000
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
X-Inumbo-ID: 47cd5287-5072-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elOHkGjxS4jq+SZfKtMIfrdtYffnKrdsY+5qsv9OtQkrr5gt7RoUBQKZIEeFRG8l2RAH8FAeGbWQHCWvkoO9m+i8ztcO+I8lTWWwe7bpwH92m5kkalC7sdR/pvT0ITOsDI6PdmrXg8U8f7DdlDFpYV63VOkvrhoTqRpfef+1Aw5/Q+0l78LVLtHZwdVM92SHEEE4zuXMUZ1U69cw60Tiy1kvKgkH001AO/6WQDHAl4lCTbquuaUTzQOtTJJKE04D/jclFzMJR+pMkv9+rTnf+RKFS9uO3F4YT57ouL681XPUmNVOKF0tbm5Qq0TEtJNRLDBTG/Mj6uukPBRHwHpWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpbNUNIGKVUOnUAO/I00pfeUU7z1oX2uAFj+OUCXMlQ=;
 b=LOzla7ojCtqnIe2BjRIlgWp46mWo61uE4CR/5HVSEQWoAKwj4zPFaHOIlsYttk/xt/4SWkl9IZwaZYPYLvNWQyw2oPWl8w9prgV61Ok484onMrCNQ/8AN0e9nbkpPLGJ3/jVB/WwHW/Kqo4LrDYSz/J5b0lnfhazVFUKucP36n8jEVOdBsftW/CKeNiy/O5CVLFQAyblWxpZfkt1i7DA/N4QUZ0OM8eawOwOxRBLTshg6XIDfvZjESsWx8Ni+hBw96XXMUM4HLeNppU7mcERIeH654rMggrFncj/TENd18pmKnOkqW7vC9gwfSG/Pk37k4NZvT/Xg0oKRzOUE0wa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpbNUNIGKVUOnUAO/I00pfeUU7z1oX2uAFj+OUCXMlQ=;
 b=FUZz+LfHaxjqFZz6Qnri9YJQF99Jhm15D+3c8qE2gGI5rpXMky8kk6h3sY8ph0Bbq+ETbySBP9KlZu947Hfg3r4sjVZkcSUpdHjWtEz9SoFt2enFssu91L1B8vfoqia0D3osvjhDLqhWn6yc57R0cUOJlULamHro0e+J3BolThgZ8WmTlp/xjhRommqsWKk8LDMiFz8RBEkG0cAAzxBoEzLsPcGRBuAwUA8aGM93xDxCAYnY3qwBuNd7/xA0GrfvVIQqcRznY4ylYL97m5pbm6b1xa8FQqzp9hQBpsTpkpt7W+Usco6A528Nz8IdWoiCqYbqvToqrPioGws9uwteiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55e215f8-a759-906a-a5b4-c72fd155f6a0@suse.com>
Date: Mon, 11 Sep 2023 09:10:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5f1fd2-e082-4d68-2808-08dbb2962a3e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BqnhhJU87VSSeSZQ1MdWJUVqCApHZl/WUnekKwyANmxjE6dSBclzJmhwTRqJHC5iv2lmPPiGbPE01IWd4TQcGa7sg+6DKDswmrFr2i1cHFfOBoOzIO4pqcY+9fHeX2OOqPtn4hRCjGSnQmDg240OTYdZq90YxEwmyXxUTU23f0Iv6LqwEhmSlalc7U2sXsTPIsh80ONkgVKhbTVf/8mAeA2fCC9AErAHSrBEtbfjY0UG+GEnVfzebCfB1ZMpRK8hm9ygXo06k4A0OfjdbQEYVhYxLxvQL4XoDAfrRuIsnGoWFR65nQO83KNdXnMZcwqDPc382uKbjQeK4rxBtgFPzJJf7t+ovDNczHJG0TQ/VDSbEe60/wAv4mCPgMhYX4u4SFHc2WAhkmEkzNg841SVWCmpDCCBEaD0NS/oq9Gl4pBAAascgltuksbPhekQXW/yc240EMeTIyF70P6tzGUgcDq7anhuMzlN9yBGTTmq3EFjkrSsyKtRdQ2Y6GDCHbnPqkggt9CFIjjdi5+w5q5Ge/OaVIbbnNSV8gL9WEv6Ef9/6YCiDLe6qn2aC/cew69B61hTRQ/GojiG5/sSZMYupi5QVpGKRzPInymPKVPN+4OVTwZ4NnhOnJKV2CuXPIiVPuWh35VzUqHS/Y8rH/nJYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(1800799009)(186009)(451199024)(6486002)(6506007)(53546011)(6512007)(966005)(478600001)(83380400001)(26005)(2616005)(2906002)(66946007)(66476007)(66556008)(54906003)(6916009)(316002)(5660300002)(4326008)(8936002)(8676002)(36756003)(31696002)(86362001)(38100700002)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHdLcUJZblpXZ2pWUEdYdU16RHI3ZG5nWkwvTTZ5VnN1aDRkbjJiTHQzTllM?=
 =?utf-8?B?TU9IeHkyT1VraGhhb2dMZmsvazQxNzRDZ09YcXhMQjd4emorR2VHUUNVODJw?=
 =?utf-8?B?WU5sSE9tN0t4S2NOMGpEWFVmN2hibURzbVp6UWZKR1BuTlYxRjJodnZJQ0VR?=
 =?utf-8?B?RXdrazhLN1BEL0M5cGpUTTVDVVZWSWZ4V0haUDMyanVPeVR0ajZVeG5EYVN5?=
 =?utf-8?B?Z3l1WHVMTUdrNFU3clo5M2YrcGlyMzJPUm5uUWhNUVpESzMvUXE0NDd2YmxI?=
 =?utf-8?B?UHR2TFM5anYyT2FpL2pXWkJEYVA2ZEhXaldWM0dtWUY4STJJRVorUWhFbm43?=
 =?utf-8?B?UlpudzFJM3JibDZCNmE1enVqV2Zpb1Vyb0dyOHUvenFYL3NVMnAzd0NrcHdm?=
 =?utf-8?B?Ny9TU09yRDdlODBGMmxHVnJJZEVJQkVZWGh1K0NPTDBpbDBsaTBmRGdNR01p?=
 =?utf-8?B?TEpJR25tamZsMnNaZ1d0bU9EcjRKeGUvdGxSVDJRTDRPSXN0Z0lNTmppb1ls?=
 =?utf-8?B?U1NtY2dPbFNaSEFGbEpKcjdmMG0rbUlCUjNwc3ZCcGVHeUc2M0w0bjk3L1M5?=
 =?utf-8?B?QzdUblE3elcxVktYRWRtZG85ZDRZTjhaTXNQODdkRUtWcWZibS9Ec3ROWmNh?=
 =?utf-8?B?TGIzZzRVM1VHMFZId05hTm9zbWU0Z1laQURJZVQzbnZ3SzBRZGN2alA4dlpn?=
 =?utf-8?B?WWE4ZEZ1Znh4RWxOOFJmYXBCRXV2Uk5mZ1U2LzVBWElDdFJGOEE4RENIVzZK?=
 =?utf-8?B?RDdGakVnbi9sZGRSRTFQM0JQMk03VXJEb0hQZTJHYXlaY2JIQ2E0U0VNMXNa?=
 =?utf-8?B?QWdubVkvZmJtSmM0dkhkdnBoWmwwYUlKdjc1VzFNZlR2QzRiTVZIUWZUV3A5?=
 =?utf-8?B?WC9HNHlkaHRxeml4Sm5SZjh1SkkzcTVjT3BldGNvd1lOajllWjEveEc2dldE?=
 =?utf-8?B?VnB2K0hZYXBsT2ZWaWhOK0VXZVNzWVRrZkRET0hUYSt0UUJ2OW5XUGRQeHd1?=
 =?utf-8?B?WHFoRVVXY1J5bFgxWTJMQWNwL25mN3hUaFdvVEJjWS9ueGNDZFNxQ0pkSVha?=
 =?utf-8?B?c2JnM2l2bGZiSVREN2pXa1JnMFM0SFlzRzM0NEhLTXVsY01Xay9YeTEvQkk1?=
 =?utf-8?B?MWluTUgzbWlQdFIwTU12dHpESHhZblc4bUJzZzdybWVlRzJDRUd4SHVlVUs2?=
 =?utf-8?B?V294TTBRRkNkYjBGK2JyQzZ2VWtxWTlMd2QwV2d0dkEzZnVJdEg4d2RaempQ?=
 =?utf-8?B?QU1wcUNPc1dmQ0pKVXphSHozUytuaHN2NWZ6OXJZbHVZb3pzRUJMVXF0azVB?=
 =?utf-8?B?S3JjTmsvamNHTkVUSTBxaFpXZGg2UGVmaUZWeW0vMGNORnFzQUZKY3Mwb3la?=
 =?utf-8?B?Z0pqK3RZdDdqYWZQanJUWjl4VzR2QXVKNVFxOUZ4NWJjUkNNc1VINlpvWWha?=
 =?utf-8?B?V1ZOcjllOE15ZFlLaDRhZVFoRDdKQlBOaDRHYU5aanlmWHNKTDFsejhDWTdx?=
 =?utf-8?B?RkNoOFlFRUZxQWttY0RIYnNkakdjQ1BTMlkvbFc5U2o5bFY3ek5RV2NNc3V2?=
 =?utf-8?B?U2Fra0lZNVRmS09QSFgzR3I2M1BPTkVmTWptWm5rNk9mL0VVSEVkVFdrcFVt?=
 =?utf-8?B?MWVCcGJjakt1dkxFUmNlU2psRWE5bDV6aUpUV0RHNTNuSXZUeHdMOWdBckVp?=
 =?utf-8?B?RE03Y1RyR3BwR1BIbG8zelN1N1prNTA1TExadFE5SXg2MnNnRThxVHg2M1Br?=
 =?utf-8?B?cHFyN3h5RmJ2SmFWSDEyYXU0VDRrS3dQdFNVSEhSR2ZTSE1jOFVPNDluT1BJ?=
 =?utf-8?B?S2Z1NkFpT3Z3N2ptWjFlUGNaaThJNEZtQWdWRmY1TTdlblNMbGcyOEdYak5V?=
 =?utf-8?B?V2NYbVFZdGVvV1BSZ25Vc2VHTmFwUlRaa2U4dXJEcDFKSTlZNTk5VE9Ialdl?=
 =?utf-8?B?YVJFaWd2TmM0TE00OFhWdjJMUXlIeFFjWDlkOTdpNUllYTYyVE5SdlRFOW5H?=
 =?utf-8?B?Uk5jaHhaZXdHcXRQaElCVm42SytFK1hFdWNkL1R4d3l3Zlptd1pjRi9Jc2dF?=
 =?utf-8?B?cWplUS80dmlXazNCRHppUnU2ckw0a1FoelBUa1dNQmxFWDlobk8reG9NVHVk?=
 =?utf-8?Q?HTs0yuEF8EgyPdK+CY7YHohLv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5f1fd2-e082-4d68-2808-08dbb2962a3e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 07:10:22.7925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IL7Yhro53Fu62n1sLeM7MwyA5a/VUOx2uepJzoDY0VWC2WD+MVHDTnP784E5UrYybPJjBBEYjdWTNNRhlLbbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875

On 11.09.2023 03:08, Henry Wang wrote:
> Also, below is the critical items on my list for 4.18 release:
> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
> https://gitlab.com/xen-project/xen/-/issues/114
> 
> 2. tools: Switch to non-truncating XENVER_* ops
> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
> 
> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
> https://marc.info/?l=xen-devel&m=168312468808977
> https://marc.info/?l=xen-devel&m=168312687610283
> 
> 4. The proper eIBRS support for x86
> https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/

In this same are of speculation control goes "x86/spec-ctrl: IBPB improvements"
(v4: https://lists.xen.org/archives/html/xen-devel/2023-02/msg00748.html).

> 5. [PATCH 1/2] credit: Limit load balancing to once per millisecond
> https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@cloud.com/
> 
> 6. [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI detach for HVM guest
> https://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/
> 
> 7. [PATCH v2 0/8] Fixes to debugging facilities
> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/

Other x86 items that among the x86 maintainers we've marked 4.18 material:

- x86: reduce cache flushing overhead
(v2: https://lists.xen.org/archives/html/xen-devel/2023-05/msg00242.html)

- DOITM (Andrew meaning to post an alternative to
https://lists.xen.org/archives/html/xen-devel/2022-09/msg01132.html, which
likely would derive from
https://github.com/xenserver/xen.pg/blob/XS-8.3.x/patches/x86-Activate-Data-Operand-Invariant-Timing-Mode-by-d.patch)

Plus, affecting all architectures:

- runstate/time area registration by (guest) physical address
(v3: https://lists.xen.org/archives/html/xen-devel/2023-05/msg00304.html)

- annotate entry points with type and size
(v4: https://lists.xen.org/archives/html/xen-devel/2023-08/msg00470.html)

Jan

