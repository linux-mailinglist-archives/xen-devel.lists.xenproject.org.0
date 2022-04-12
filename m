Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B34FE21A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 15:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303668.518100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neGMH-00023L-0F; Tue, 12 Apr 2022 13:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303668.518100; Tue, 12 Apr 2022 13:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neGMG-00020a-TA; Tue, 12 Apr 2022 13:15:00 +0000
Received: by outflank-mailman (input) for mailman id 303668;
 Tue, 12 Apr 2022 13:15:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neGMG-00020U-5t
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 13:15:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8db96aff-ba62-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 15:14:59 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-jZ4IJJJzMSmqqjsumEholg-1; Tue, 12 Apr 2022 15:14:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3742.eurprd04.prod.outlook.com (2603:10a6:803:1f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 13:14:54 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 13:14:54 +0000
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
X-Inumbo-ID: 8db96aff-ba62-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649769298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3ppk8XyJhwi8FSdtWt0sOX31crdVW93WwTaDONC7Mk=;
	b=RofJb0NghxQahZYIbkBOT9yiEGl2wYPekWF603ulWZb1uTbtLyJrQRcrF7vbrVeK/qMTMa
	9AvkdrT8mQ/y9OwiT111nrzVpX/PNHyYHYXOIWdp+d187qlJLw3PmGhYxxOwPUQPq6RfIc
	5avD7AquCCQWfaWtpIlyU+1h2fDlzws=
X-MC-Unique: jZ4IJJJzMSmqqjsumEholg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1s1JEu/Rh3TnvmNo/Nlpx/6FLizba+HKhOW9LrR0wOAHGrGfvX5czviY3Lo6nEjBsl2kWOyLB25ca73IInR0zN6O7FpqbH8l/tD2DNZB9fJebTkfWKqIrZ+teuGJmwSBE6QTJRhWHsSbmybNc7FLqD0b1DQKEK8Ks5goL5D2INsjcDjzAIMXZCjhrmWg4kJYgWSSEc/sNwXyWNqm3E73AELJqMYdfF7MvieCR1nj4wXG8FNGpEmW6L/rWTYGz8DjMXHYAF5iWJD6LNKIuS99crHFmtbnf5ROjSDGbiO9oHq7GsHLwp67Ce3RdKLZSfFurOHOBoyC6Kd0YfpuK+KYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrXLvynpQtfJ1BHM6+6H2L3/h6HhE7FyYSNJwGux3i4=;
 b=Xy14g7X4QKFBAYFOZZ4gnZrKAx0ysK7MHaYDI0QKolDGxZ0wdAd7cdVt7EjVGAOoddYDPVyozoZpPCPSDKTO16EVrL2UeFl+eXWBRiU0EaWzx0JNEESar6kFdp4SABpQ4PQTIryTT4wTI1kOxGr1qB4hNdJWrBI5MAsbESovrvKDhE6qI2DAQ+KEPi2kz35gRf77Q2IdX1h979D1HiHiivAmPxIeTQBtv0Sd5cZvgmb5AYd61uIEBRNMffTqg3mNEUcDfspHG34kk4ftgNJ7kjyoBkKA9q8615n8fPUVx8W1k2dcdx+bcUNyF/+cNcv/1CnAU0r+rNIkmaJIljxcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b0eeba2-0012-5a9f-27f5-5f85f039ef06@suse.com>
Date: Tue, 12 Apr 2022 15:14:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
 <7b79d293-80c3-d368-1abf-581f57dd2f82@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7b79d293-80c3-d368-1abf-581f57dd2f82@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0195.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc3add3-c5c9-4ee4-76b8-08da1c866f13
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3742:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB374220FF221E3DE4C29DD0C5B3ED9@VI1PR0402MB3742.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r1UwJZtEsv/VacTAEOup+TPslbnoHJnW4VmBooS2p8qgB/5q9oY4eCQ4BWnIKjwsK9/CDHpPmc/R9WrOezhJ4S35VNw7I8YBdR9/NPBT3riEAYAg6kpuGaR/Vxs3CB/2bwEmqXbRt2iPK5Bzu3uH5wT+hgE4VH4DPfan/W7LPsNNZ3sXMk3OEx4G/Pbf4LDenfMgE0W3Wj1kUbuqlf0LTbDmror07ScmZFGy7Ohf2bUnWmtTgZSt32t965lqf+wru8EZrb0T3xcMxRNagwmAXSF0x3bgg24DATLRj2UK82aHQPhqiu6ns2t1BhSTAP+efVCbO0TNzdZNc/yhr/NbWbF45EIxiRK1slqhywZxqX8EgNs9Uu1ocCtk/Y392f+t3Z+vxUkRO1M7nj7jK37tpsN0JfruIKvnNwkXCVlZXKjTcKR+jNMc+E4HCtp51g4VER8UoSjAmZrVAfzwqZPAk2wM9liV2NyY5wsxrm8IBs5n9V9oEmxK5yYU+oSHVoxF8DmACbsQKKV/IR3bqtoh4EFyxahcdeO4PBYhyVn0hvI29XW+hPeUwNxQnSWzXZG3UZC0ju0D9BUznHDH1g6IrkIoajUrmFS7lBhj0Vj/kfS77yQ0MEhpfclf2f7NcKQu5Ri35kP8JI6AQUwN0rwYb6WvynX4UWpUG3BXCv5Om8EQt7G/EZzuQDosUYf73px/p0dR74sY+6t3R3Q+Fu2uGM9VkmUkkOgxtQt1bwnQyEgWkB4EVerz+V6ktT8Llktu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(86362001)(4326008)(66556008)(8676002)(31696002)(53546011)(8936002)(6486002)(6512007)(2906002)(38100700002)(6506007)(54906003)(6916009)(5660300002)(498600001)(83380400001)(186003)(2616005)(36756003)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ElCrIM6XCAh9qn8ufdqHGhoqauy0m4L/RWcacOfXvEN1ibJBdqw+wA9O1hKo?=
 =?us-ascii?Q?bt9KqIDVK00qqfh89yl4xGBgwVAooom2rbEXNhozvVURtgtHoy1YJgyBX5Z4?=
 =?us-ascii?Q?tiy949/RqPKwpDNkq001eS8T2o0cTc7PPwu8p7xtcbdUH5tn9VLU0ddkmFAv?=
 =?us-ascii?Q?ZkajD/Vt2FhrhtefgJ1QShnAMmadUYsHOthY13CLix6Ppq/bgHoFBzR/O8KQ?=
 =?us-ascii?Q?Gs8ULpjSZdF2WGngr7GI2CYtzyz4niMlvr3gQBm6IdejNvuV8hzqF9Vv0NeU?=
 =?us-ascii?Q?W/tE4Egy7G6axeI2jwXxIOreeHrfCk1200h+OriaKZzRO0xkf51tjWajb7v7?=
 =?us-ascii?Q?5GJPN+433Ejvl5CsrAES/mtJuXB/psKe/JalNLntDJRf/UbAvwySwjmWtzC6?=
 =?us-ascii?Q?kZNLq6ZK3WbbC5LmSWuSBpEuMvI38gvfp7N6xErPSDGeHOkdP/seBTtqQYxJ?=
 =?us-ascii?Q?OJMCAoLQZ/tAbEGPUZNKpebqYu+rbeP3I69G2kPW/3CZsHYUF4P/T8n2YPME?=
 =?us-ascii?Q?UxNztZLdGzR6KKuXBE0AsWWgZSsTmrb5VhEuG5yo+CdknAcwTrrbLBP07vLn?=
 =?us-ascii?Q?VRCtc28nIjP+vCkRb8StSIXZzB+JlaryzqbHq9EoT80/cOf1Jz32JplOQdi4?=
 =?us-ascii?Q?+ZNKyNCmDnaalDBWiT9fKwTSmNiiYR6i+b06dt6w0Qi/yiQY/Za2tJ/GAJsU?=
 =?us-ascii?Q?cu0aI6LOMpUayVzpeYOISr9HL3Fh64KnCBE9cCYvpfuuV5fMxglDkOCg2mWn?=
 =?us-ascii?Q?VLiQXZV+8D8RY59fC3zuuywJVrX6w07ErxxTKaIW+QV/eJ94QjVVyTNeG+mg?=
 =?us-ascii?Q?k1kXWdPlVkUwf5Ew7PCCLTEuKBipmq2zaii5LwlDO8oPVL7FvUEXHgxlisoQ?=
 =?us-ascii?Q?aWAhrIls3yUb6FhGEx7e4L7zJl3h0nmRZlfRJGpyM84fur1E1qAoE8iOEHBj?=
 =?us-ascii?Q?US3cmrj4B4C5oXnubcgHU48Uf6brQfYNRm0plgiq8D23MoAZHZkZxhJjY4tV?=
 =?us-ascii?Q?8GgS5IuYlMrRx54t1QS/c+zlJmMKX8USDFQrS5Yaq1RNmxuZJPxmEU5wqH3g?=
 =?us-ascii?Q?0GCzS0nVe4nj9Lj+2V/pop6/wJgDCnm91wjZSdsdnvyEJv59HgENDJ3v8D69?=
 =?us-ascii?Q?7D46p1VKdtNmwSRMUxWRs2x0GSEr5kkiJ1kjW6FhlM5n/vg6VZde/XKJcJ2s?=
 =?us-ascii?Q?1WKGh6GlP7ivmF7McZFjPkiow4ll4M1kVH8SRIOFCmcNWJGW3HCJo4uwPuaA?=
 =?us-ascii?Q?OJAznudGTKuoWu22kZzp6E3FGqTxlSCH3T6QX8mRqHGANdMwiOxTQDLZ21a1?=
 =?us-ascii?Q?ck9OSQaLuGkUr+ZuRvw/JDbYChtZFiLEYyaC5ZPkZqteX2vFQwJZ4ffWX6pW?=
 =?us-ascii?Q?/72a7fxcuDNTnNtRQEEJhJnjYW+EQrOYTLnq77zAHKmDCm4K+cHXqtQ2x+kg?=
 =?us-ascii?Q?tZiipKflqTZRimLRdFX/s1QFU/ugWX1D7lA21c9R2jvqfWIAa8oNtKBBb4xQ?=
 =?us-ascii?Q?8LqshEE0PHCepvAe+P3paGOzZz+qSC63f2O0sdkUGxRf2Uuw24GUAO+qdQ5v?=
 =?us-ascii?Q?OsIZR25C7zgHV3M2kBnByN0LrbAowdB5wzWZviNNPZu/r8TzqcBESqCa/CMy?=
 =?us-ascii?Q?+5aJOMfs8lUyJEFik0rOtXui7z/qs+ohwKVoLimLRIX44Yc3ONsq1yDifbSE?=
 =?us-ascii?Q?/yDYa/SR5PWS/wxtniHIFocWydTWq4aifGA43qFThBT97IVt0wkfDx8Jetr3?=
 =?us-ascii?Q?3Irqj4JuNA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc3add3-c5c9-4ee4-76b8-08da1c866f13
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 13:14:54.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 686kansDUfzHmIoBMsRb/qLVpLu73djh14Is078p42hKH+8yiG7O29IU/CtgymzoUIcLU5eVlnbM1b25FMV3Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3742

On 11.04.2022 12:01, Andrew Cooper wrote:
> On 11/04/2022 10:35, Jan Beulich wrote:
>> Prior extension of these functions to enable per-device quarantine page
>> tables already didn't add more locking there, but merely left in place
>> what had been there before. But really locking is unnecessary here:
>> We're running with pcidevs_lock held (i.e. multiple invocations of the
>> same function [or their teardown equivalents] are impossible, and hence
>> there are no "local" races), while all consuming of the data being
>> populated here can't race anyway due to happening sequentially
>> afterwards. See also the comment in struct arch_pci_dev.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> It is only legitimate to drop these calls if you delete the mapping_lock
> entirely.=C2=A0 Otherwise you're breaking the semantics of mapping_lock.
>=20
> Your argument of "well this is already guarded by the pci lock" means
> that these are uncontended lock/unlock operations, and therefore not
> interesting to drop in the first place.
>=20
> This patch is specifically setting us up for an XSA in the future when
> the behaviour of the the PCI lock changes, the fix for which will be
> revert this patch.

Further to my earlier reply, may I remind you that changes to the PCI
lock won't go unnoticed here, as there are respective ASSERT()s in
place.

Jan


