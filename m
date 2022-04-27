Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE35114CF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314818.533068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njemW-0005rN-Ai; Wed, 27 Apr 2022 10:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314818.533068; Wed, 27 Apr 2022 10:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njemW-0005nq-68; Wed, 27 Apr 2022 10:20:24 +0000
Received: by outflank-mailman (input) for mailman id 314818;
 Wed, 27 Apr 2022 10:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njemU-0005nI-BS
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:20:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4983544-c613-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 12:20:21 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-eVWiP18JPtOdnUeTVHGJ4Q-1; Wed, 27 Apr 2022 12:20:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4345.eurprd04.prod.outlook.com (2603:10a6:5:25::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:20:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 10:20:17 +0000
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
X-Inumbo-ID: a4983544-c613-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651054820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oFcAJJD7wZUtZ3smuXsQeyj7/hBvpybWVkJBpPSY8PQ=;
	b=FKnb1fzadFpkVCbJwupA59+7z1eMXGL9XF7l1JTYMsGcJFEDsQxJ5LU/FrpTRQ7VPcj1st
	I4/xsR4fg45tb5V1ovxaGPRADcZRC07rWIt5Yc6HjUGK/RG8QLLQ3eTf4BqHc0BkIPRKSd
	X2qGjXaM4Pw23neuuzC+gMm+ceYHXWw=
X-MC-Unique: eVWiP18JPtOdnUeTVHGJ4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBY8qcI1Z5Xk7YtnKYu+2TWqk/ioJRH/qOvTN/XrS/wpFwzsB43eVeHfiJTb7tcIKkOxqgc4ZTMm8Zbm8EkBcdnP1DhyyWaRh7I6flTk+QRlIowHE0FSYk1wpbQg6WoEz1VObsGPVEnVciQOWIFk6Rk40NnY6fdDka7F/DJxc4as1O/GdpL09m6JanNpc3Uo4b6IIL3ofLMeU0y5lN8tFI6fsOw7mIY6KX9Db6QWmAhmWFplg2gkMRgYJU6t/sXAfa6p7Cu63+KC7x3fO35e/kEiOvelCzKWIZeECzMNWPyekXgyN1uhrjkI+YwqMesJS8c4IpmLz4Mg9o80Z17lzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbQKfysjlsQbCx8NstU6XjoUwqPZYVhthJIJrWJvnH0=;
 b=YWdMMc0nZKAVNarB/Nm1miUMBNsBO+A+DmhvKiUYOKwJSUpn26qZtOkFeJx3JGpVNFW/tfKFVm9j8SuajOSmHBlS7oPG1tmnfI3Qub4IT3ze05v0btjX+0iv/eof+mM5LjNW88B7ASSQahCgtiwBCsarnq2ncmWAk8ckZf8sFQtBLOIxJ8Nvh3TOUK9z45hhV94AwTqUEX4ijrg1HgHh65xCGQba8ulDd89zp8L4cJVSBP1gUmq9HgebA4rAjEZhklMG1ONZ+mM5OzFflWVZ/bdIGffJdHmKKJ9gAeunwMWIdEua/zsmYE0whe7kAHeG1+RBIj1TkR2iOOKRypAo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf90610c-cf86-2d67-c069-63315ce1dabb@suse.com>
Date: Wed, 27 Apr 2022 12:20:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: RMRRs and Phantom Functions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian
 <kevin.tian@intel.com>, Edwin Torok <edvin.torok@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
 <ec1efb6f-9d41-c018-582b-718254b55aa4@suse.com>
 <f77ed15f-3dfe-e4f4-2790-7eca18ca9dfe@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f77ed15f-3dfe-e4f4-2790-7eca18ca9dfe@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0044.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ddd710-d49f-465b-4c57-08da2837867f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4345:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB43450179C437F67F581B9921B3FA9@DB7PR04MB4345.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oOD8ArH2/Qi2G7qt2SVHyHo9T4WlxXpBzdUenNXnIYIJ5Rws500KpiRCKtxXX4HYBxUZKOg3TQ2eDIXBJgVi74XKRs0vUqRK438rlGTE5K6HbLiu5LeES3uZNEnTDcP5/RCGe+pHfAzdG9XN8tiMf5H2tJly2108/ldp0llZIoWXSPTsJ6HuMVr9761575z4NTJEiYBf3kJqUHSj0UPsIlwu8K37Uq5XBpnpr0IG3qzegk/+XI0jv2Ff2027a3gSf4QgPceiSYJg1xlDoxhNHbhrlrQHwQjPKH/XRDiUcZt5F8E/Tn+OOjMfxbC+5Y0eJ59ma7hrJ0vUq4a10wSkktsTOOMvQWLJg5WXZ5inyYE3dhpoGfC5TK56WZkZ6k27xTbM3jfpJKAOGlJxBrlobDs21AATsd9k74kWFHxm5E5w5pu/9rwbgcdvJBE7RKZESKZxSdhbb7xWXHo5qWDD75xp9pTidwwfguiB9yOrldU8eYQ68XwBjNLOQSzy7pgTKjRpa0CElBNDuFWIS9cZK/QYfDkgbVzRpbfTxNvCg188ttbKQJAbKG5ULhYJU2fnmK9dICCIGWpP/AQP6PIwgy/tzli+hFeOYDsofcm/1g9OhMFeIBQuwpUEM5wlbKO9fVXeCpgpRnsIp3oI0THgcjel/KBQvfb3LC9WFkCuglPmXXcp5QbjnqmtEMQiOXJjjV6cj//ZxbTwefjXabwD43m4aSS8owa8dMPaBQOr0Gw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(2616005)(83380400001)(186003)(38100700002)(8676002)(66946007)(66556008)(66476007)(36756003)(31686004)(4326008)(508600001)(2906002)(3480700007)(6916009)(6512007)(5660300002)(54906003)(26005)(316002)(6506007)(8936002)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FD3y9mGA0zTmWzEipZnelG0tAa+yNaguqqnD6Q32nAfxaC7D3m3bIfFZCgRQ?=
 =?us-ascii?Q?Zen4uep87UxvF6OUt9WclqXRy7hKqd5IXxJY0b10ItYjSXuOYRdHD1Iyfoxq?=
 =?us-ascii?Q?fuW8mW3K+dnXWc0yhiSSDcPVwsbRcruEjL/OxkiSVXkFGTnxWScs/x3U2aeh?=
 =?us-ascii?Q?+4J3du46UjV4Ws/IlaiD/AXHo5MsXrPmoWcDlHqMZMUmbo+D43vpYD4JdH/I?=
 =?us-ascii?Q?wMpKfVKte7XlbFlR321fS9cFoQhnwlnC81wSYTSYJXCEq8XyMm5248yNMwlO?=
 =?us-ascii?Q?BGgRWGY0tEjqSSAfINU0HMDiEEHsnPTKt9SjQ4AkefzNysqPxPZWNpZwFCSB?=
 =?us-ascii?Q?l2l1jPLCmKyWqRh/7KYHR/lXAQI5CKwUBYJD3BOqOsUEOOgEFF33hsGyqEPj?=
 =?us-ascii?Q?vgxAUmyWDz31j0TlvbWG9H+nt2QkF6nYryVuzb9maFOI1YqBogvI6GbBJIEx?=
 =?us-ascii?Q?aHmrZHFIEE2Ei0siVy3LrV1TA8Vs/7N6y/1HJXQBoadDyTb+wQpFfEt8zHQj?=
 =?us-ascii?Q?Ixq2Fpwa2Hj2Ab07u0fEqIGMGFT2Um/xTy3y4m9ZxPe0mOla7o/CXRwjG74u?=
 =?us-ascii?Q?mV3alq9uo8w+gMpdG1KQNv7+Yk1R8cZ3XC6Tc84Q5MdUrG5y2lovc7riAxWW?=
 =?us-ascii?Q?5f9gzCHeV3g2KgDXuNXij6jaf9ngqFuhalnMwGdXDhxRG0RyZXbsJ6IbqVcZ?=
 =?us-ascii?Q?nJu3qhJkI7OPelRiwXbZsEVWVSaNS0exiXb+cWyQQN7YZ4KlsPR8Kp+11BIG?=
 =?us-ascii?Q?XSub7qhfPtK0Gs+j40uIE//UC9LOBXm5bo6SpW2/MgXbBxDU+ZDTEihe5XW3?=
 =?us-ascii?Q?vAPNDQiDWicOJUOQWYDDdBs3WU0LLwSkt21VSkImQngNMbRUWSpnvI0MKyyV?=
 =?us-ascii?Q?4oRrFjtI7VuImWNqLGNzKcDiKxFcivm+qQjJkDdC+BP1mRYUhxCilH934zfr?=
 =?us-ascii?Q?csVIUhZldo4wXMzI6VeGpRdlqQ3vjGTQ4LEIBcEDHb2myWlZoeoA8rEV8p6Z?=
 =?us-ascii?Q?7+bgVljl2KDjgq5bc/I8SgqG9iVt3DT3vAEbfpH5zOnoZCk2wmJlQomvu8c0?=
 =?us-ascii?Q?ftX6p0SJyQ6axHLLCdE7yQOaENd65Xd+bDyoYe4gnSgKVVQN6zcA3dnF2/33?=
 =?us-ascii?Q?M+77orfb0CHBUIlRtJ4S1dHLB/2amQcNuEUEB7ogu0Jm1QI3AEgDz0NFIo5u?=
 =?us-ascii?Q?R8onCvjaYjNCRvUbitl3uQZsS698USYqBg/ccmgUL3SC22o7oM7NYbaV0Ctw?=
 =?us-ascii?Q?vVBSP2HIRGu6Jdvnw7VsK+VJUbD61yK2BS2S9ZTgDOPadY8GnXgq8FYoxXN4?=
 =?us-ascii?Q?fTi9hMa2c0z7qqUXRCpCXIyerP5SaJ84K3VpLw3tXaibgkbTOeMUzg0Nlrr+?=
 =?us-ascii?Q?1ySOH1G0+x4rZi37EUAynHc+bZdmNLX70tokEa+COMsW0z5Fyl2c/S0yHwnf?=
 =?us-ascii?Q?7Mi+b3m4ItdULXCzelNSFpAqE30plqU/eVoPE37OE4CxUMW1RYQwKUBNsMC2?=
 =?us-ascii?Q?3o2KpmCtfif9bmyK54GFoq8Voqy2+Ru61GDBTzSKrAy1yOOBZ7qA3lD9UWQG?=
 =?us-ascii?Q?NIGkHcnoEwuXQpQxvIrDNCWi4SZWEvrxUS7i2nvHvSXfeyABKRhEA/ytmHz3?=
 =?us-ascii?Q?FAO85ERn+HknHpvrkOL+ls92WTRu/9ai/QXRGFuMjfi9j0CUFkyssWFi2G/E?=
 =?us-ascii?Q?p6Ww2oGpvDH5dDglk9EQH4n2lP98bD+QebyHVk0qHvvUn/WortWXYhOxOekQ?=
 =?us-ascii?Q?mCdjuKZxXw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ddd710-d49f-465b-4c57-08da2837867f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:20:17.2241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcvEikoRCD5UbYi4g0KUAditOvAND7vFcKxuZcPAGTFJH0Aw4LuRidbdGuWgDvEppuuo4+dvVcfvEM1ERRK2+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4345

On 27.04.2022 12:05, Andrew Cooper wrote:
> On 27/04/2022 07:59, Jan Beulich wrote:
>> On 26.04.2022 19:51, Andrew Cooper wrote:
>>> Hello,
>>>
>>> Edvin has found a machine with some very weird properties.=C2=A0 It is =
an HP
>>> ProLiant BL460c Gen8 with:
>>>
>>> =C2=A0\-[0000:00]-+-00.0=C2=A0 Intel Corporation Xeon E5/Core i7 DMI2
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +-01.0-[11]--
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +-01.1-[02]--
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +-02.0-[04]--+-00.0=C2=A0 Emulex Corporation OneConnect 10Gb NIC
>>> (be3)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-0=
0.1=C2=A0 Emulex Corporation OneConnect 10Gb NIC
>>> (be3)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-0=
0.2=C2=A0 Emulex Corporation OneConnect 10Gb
>>> iSCSI Initiator (be3)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \-0=
0.3=C2=A0 Emulex Corporation OneConnect 10Gb
>>> iSCSI Initiator (be3)
>>>
>>> yet all 4 other functions on the device periodically hit IOMMU faults
>>> (~once every 5 mins, so definitely stats).
>>>
>>> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.4] fault addr
>>> bdf80000
>>> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.5] fault addr
>>> bdf80000
>>> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.6] fault addr
>>> bdf80000
>>> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.7] fault addr
>>> bdf80000
>>>
>>> There are several RMRRs covering the these devices, with:
>>>
>>> (XEN) [VT-D]found ACPI_DMAR_RMRR:
>>> (XEN) [VT-D] endpoint: 0000:03:00.0
>>> (XEN) [VT-D] endpoint: 0000:01:00.0
>>> (XEN) [VT-D] endpoint: 0000:01:00.2
>>> (XEN) [VT-D] endpoint: 0000:04:00.0
>>> (XEN) [VT-D] endpoint: 0000:04:00.1
>>> (XEN) [VT-D] endpoint: 0000:04:00.2
>>> (XEN) [VT-D] endpoint: 0000:04:00.3
>>> (XEN) [VT-D]dmar.c:608:=C2=A0=C2=A0 RMRR region: base_addr bdf8f000 end=
_addr bdf92fff
>>>
>>> being the one relevant to these faults.=C2=A0 I've not manually decoded=
 the
>>> DMAR table because device paths are horrible to follow but there are at
>>> least the correct number of endpoints.=C2=A0 The functions all have SR-=
IOV
>>> (disabled) and ARI (enabled).=C2=A0 None have any Phantom functions des=
cribed.
>>>
>>> Specifying pci-phantom=3D04:00,1 does appear to work around the faults,
>>> but it's not right, because functions 1 thru 3 aren't actually phantom.
>> Indeed, and I think you really mean "pci-phantom=3D04:00,4".
>=20
> As a quick tangent, the cmdline docs for pci-phantom=3D are in desperate
> need of an example and a description of how stride works.=C2=A0 I've got =
some
> ideas and notes jotted down.
>=20
> Do we really mean ,4 here?=C2=A0 What happens for function 1?

With stride 4 function 1's single phantom function is function 5. With
stride 1, as you had it before, functions 1...7 would all be considered
phantom functions of function 0.

Jan


