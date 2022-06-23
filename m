Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED6557B3D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354934.582310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MLQ-0002dM-Tw; Thu, 23 Jun 2022 12:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354934.582310; Thu, 23 Jun 2022 12:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MLQ-0002aE-QF; Thu, 23 Jun 2022 12:54:00 +0000
Received: by outflank-mailman (input) for mailman id 354934;
 Thu, 23 Jun 2022 12:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4MLP-0002a8-82
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:53:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10053.outbound.protection.outlook.com [40.107.1.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b726a72-f2f3-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 14:53:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6598.eurprd04.prod.outlook.com (2603:10a6:20b:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 12:53:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 12:53:55 +0000
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
X-Inumbo-ID: 8b726a72-f2f3-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvkbocTtxcaCVSeHg7oHtO4WMLlxBQl8MEjAMh/OSZ++DwG8lpYHhh2RPL7iOIy7C9llhgC+ebsMVnI8gYeH63oIi1BVeVF7If/lvYCbAxeW8smpO0ixxsupxlJU5MJZAQEML2kU3IpVlnQBdKyiOXZM3Vta5tEMmx1xfxw6hS3gzRI+bJmiR1EMFUVs1rkBqDudrk9BwaL25ZcIMFj0ruEub5mQHgi/KKoTHsFFrJcD5/kNzPfc+T6PBNfEg5V+Yl9nfJSngkzSva3bQWLdZkr2923W216OJIoMsmTy7tcTYD0BuvV2HLaX6zTK/cRco2DUmeS9bhfQvQNrhJLSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcv18ceQNl32sTf34KHRDEcfxbOjbBVxPy7/ESfq/CI=;
 b=XGA8c9mvJSZaWbqBYWgealZjdeaScrF97dKJtarW6UpuObLT349tzsU+Gf3eC2MQaIV2cmfplnfFJ8RICRNLMmOEsZZmFd2mnYaNDIRQEXna4raJG9R7Lv83RSKzpksmobx8zjugmi4PuFDSexYx0VBjogHDioBvZ2kSXnUa3TpLYPXZJRB1F9lTXCoXCXVWnUU4LjbGIHzqapWVPLigyI7GCp2nLhySgpmVgX5HBL9eRzQVa6Ec/Fguh6X1R4fKRutto7OGgQYP6Ae7pg02eZbCgRGw7dpvjDcCFAT7jMygFY6hnOy33knR8EHH9D32PujuMirLI5/M73oprpE/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcv18ceQNl32sTf34KHRDEcfxbOjbBVxPy7/ESfq/CI=;
 b=jGTcplUnr2kff6/v5qW/R+lKKr07Cx0E8O3rH1l2sce5L90nbKuUNaNx2YX80mqeQ+Yrc+mg+p3Ssk9rsFcZZMTyww0vTM2hwD/nB5Yx0+f/NDfz8TrEDzZLDL9h6pAgLWLZ/gbGQR5l40IBfNH34HMSOcd/D1YS6U9JpPRqVNRJICKzPPk85HTa3t7P6j5ersJR4YlLFYTEvmu001/+uv2aLwtwgX+XIFdCBCl488XhtBZDq+hTQa0fyumND1hQelq74Yg3ClxOnNSq07y6PVzbV+PZP5H4Fc0KGUW4kihnMyA5/LKA9DgP0KY/+CUmh3LkVXykyWYGXpfff6gtGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
Date: Thu, 23 Jun 2022 14:53:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220610055316.2197571-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0065.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a66582-7643-43ac-e2d1-08da55176e7e
X-MS-TrafficTypeDiagnostic: AM6PR04MB6598:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6598EF1512F8CF5900B7C3A3B3B59@AM6PR04MB6598.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O4EjJiuy+sf4UEV83TeDrnboqd0con93KP+1pdRrfFaxsRnD0263dC7bgF2et15cno2fzKUCxIh3Wtf+5XuY/OO+3pyN+R0ipIPqzWTCBZSf21R2nqy56xxqxiyLr3eE/ZIsD65gGDbmBqbKZD2E5vkJ1N+SrpS+7+4DLfcx+1VoRVVEkmD+a6NPbv8TThccWioakEmGn3fQOe3PNZMLV6AizOdrNz+dLeS/I3eA8T0SXGYnufDHlCwY/I01mBn4CxDNQi35s0gHrNWqbgxE1dNYOiIzI5t6Gl5Qremu7K6eQ1PYUeKmg0dCAvizg8gcQuIq2LSst3Dw6bwceVYYyNhImV6Sihns3HchkD48rlAwlNgV0j0+LCGxUoOzjciHcMoDsUryj1EtUU7Z9ns57EGMuWfEMkxOLmoPuVEQvf3+Rj1Uw/qNFRAbImYVNw/I/BQbw0YSQjYUM9MNIkM5o3w9YSsIwYMHCFF1UpuAPgEKSXMf0V7tznVjNEr5/bw2jfa2ZtDKlzH9sXq6zlUKt9JPabriUCICyEZEKielvi5qA0iWmuMqWmGsRF061aNhQDrz9X7obR3cC7zBhJCZh80nySrvbVz0l4f0yM0vDG7K982CYD/RKQvPEF9APlMhE4qOVMoLSzTK74kzDSHwrLkiTyYTO+nSD0Bj/IY6B3POyiKuHCbphH5ArrCqZPghOU9e2fxXmKOFKkOaSN/mxkHvXx9ib8r+1ZFGHggKoen1ErJv2+PpqD9H4WtF4vgRSEZfAPQE+ue0d9pzmKdAWXgios83VuwegPrigWk95ps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(376002)(136003)(366004)(53546011)(6512007)(2616005)(41300700001)(5660300002)(26005)(7416002)(478600001)(8936002)(86362001)(6506007)(186003)(31696002)(2906002)(83380400001)(38100700002)(4326008)(66476007)(66556008)(36756003)(66946007)(31686004)(8676002)(54906003)(316002)(6486002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU9IR0lyTENyeFlLWld2ZTVTZnlJM0JhdXNsYTJIa2tYeFpUb0l2dlA1bDBG?=
 =?utf-8?B?NzF1K3ZvQi9QRnY1cFRtckcyYW8weVJ3QVJnQXdsdUlHKzdtYVZNbmdDMzFz?=
 =?utf-8?B?OTQ5NkRJbDJQOTE5R2xZRXl2SlVlYVY3d1IrcUFEVXRSN3NDZWFnUTA4OXRK?=
 =?utf-8?B?NVAwdndwdjZ0d0toMjR2M29VTmRQWUFOVGtUYS9Nc0RzRktuejM3MWZWbURU?=
 =?utf-8?B?a0lFWm44V0RzcXRCOUZwQS9Vb1VpM0J2emV1cEVzbDkvUzJ0STZCSXdnVFBv?=
 =?utf-8?B?ajhDOEUzcTVrVkpCL3FpQTlnaVVhK1VKREpPdk1zb3RQOEpjZnRyVmpaNGVn?=
 =?utf-8?B?WkZMS2NSenFkRzBxUUw3aUcxTXlLbU5VWkR6aDlPVUZtUmMzSW9sOTFCdUEy?=
 =?utf-8?B?MVhsWG1yQTNzNGo3ZDd3UHFWN3Z1RmgwMWFYSUlsNURaUmhHOW8rNnRyQWMw?=
 =?utf-8?B?TUN1NGlDMzFGNmZZb25yVGZYM1FjNnFlYTM4YnZHS1Y1Ly9laHh2anA1MERC?=
 =?utf-8?B?QmxQTnJ6UThuMEtQWEIxQ09aQWJSR0Rsd2NzV2k5Mm1JT0tpbDlabVE5REFQ?=
 =?utf-8?B?OGxnbU1XT0JLeUx6cWVlUFVRUktDajJLcGZyOHZTVnQ2MmE3b2FuTmtORVRw?=
 =?utf-8?B?K1c2NTJsT1ljWU1ETnd0eWVSTDBDZ1VVOXdVZ0dpelRYaVRtZjNHS1Y4V1c3?=
 =?utf-8?B?QjNQZmwvL1hvUTZ6N2J3QUY3RytmMEtGU1RkWFZUSSs3eDZvWGxNNSs0eHFN?=
 =?utf-8?B?eVZ5Wm91ck1ZMEdHRjFPNXpSbVc4Ump0UGlQbFkwZDJTSHRwSDJaWk9hREFV?=
 =?utf-8?B?b1kvYnVqbjNzREVqZ3d5QVdDVXNIN2oraVgvWEovdkZqMlFOOXdNd0x5YU5q?=
 =?utf-8?B?VngwcHZ6ZWlYbTN2WnZXaWx4WStRRkhWQUpkakZpdmh5NUpSV0ttWHoxSDZT?=
 =?utf-8?B?NURpcmM0UXByWmRHd01OMzFqQzVsalBjSDM4djRVUFJBSlVTM1FUMlY4MmU2?=
 =?utf-8?B?Qzk0Ri9LalpwUUpLU04zM0N6cHhBMzJMV21QZTNVMmtva250OHZGMkduYk9H?=
 =?utf-8?B?Ym9KWXRZNHN5SFFXaEIxVjM2OTlKV2ZDTEJsQTg5b0FHanUzNVBORTJvL21H?=
 =?utf-8?B?OEJRN1JOd2hyQndWa3g1cVN1WkJpcW1YOHVXbTBUeU1NL2VTb285UmlXQitp?=
 =?utf-8?B?QVZtcW5lNTlMWUdReTZUb2JaWkorcTRqV1J2dWFOdjM2dTZzK3YrOE5YMzI4?=
 =?utf-8?B?RTU5bnVDSm1pQ2pJa1o2ZnQwd0hBMWtBeHFCbGZZSno4UkNBYUhCQjhZK3hY?=
 =?utf-8?B?WHNZQndnWGpZaFFHSElaQUMzbFNseWcxMTFURmludnpvR3RsWWxIeG82KzRL?=
 =?utf-8?B?elRjRVRPcDA2SEc5KzZseHZzajNTMC95dkk1VklJVVBGNmJ5L3hHM2pTRjA3?=
 =?utf-8?B?UmM1b2JXL0hRbS92cU42ckp4SDZoWHFVYXBqT0xKaVBTT21xUGtNUHhER2t1?=
 =?utf-8?B?aHcweldYK2xtVW9qUURSaUpsWmdNNWdmN1g4K3lqMFo5OVh6TzFWN0hUZ2Iz?=
 =?utf-8?B?aDl6aGRHVGh1L01xTXJFL2Z1YURpbnlSb24wQnNJZUdubFhZbkdKbzVTZG0z?=
 =?utf-8?B?ZE9HNFpQVG03bE95bTIybWRkT1ZvQ1E3RkNTWm51TkN4VGZzSDRzb0V3bmhi?=
 =?utf-8?B?dmlkUndmdkJweSs0Q0grTXg0WHNqbStEa3YwRFREemRHelVvMTh3cTc1b1JT?=
 =?utf-8?B?R1lCbFdHYkVuTzhjbUREYTRwUlJtM1crKzlKY3Q2NWN1V0o2dlkzNDRCR1J1?=
 =?utf-8?B?K1NxYnR4MHdIbm05QWpzbDcrK2ZQZGwwTGtnTDFhdDlkcEJwVVpxSVlTT1Uy?=
 =?utf-8?B?M1BocHU2eHd0dUgwU1BFYWwrVUpaTDVId2Z0MERYWVVaWEtOVEJUVHNtd3h3?=
 =?utf-8?B?bWdXS28wTkQzUHV5NnplM1FmOXVFdUR4QW5OOUQrVnpSSm1memlKSHR3b25D?=
 =?utf-8?B?bUhWWWE4d0picmU5OEVZYWl4OW1zWEV6WTdPT1NINHRGSGxDQzZ5d0xWVTlR?=
 =?utf-8?B?eFZBeEllT1hYT3B3UXRLWVRwQ0dFN0x5ZXAvTU9wS1Ixazg3T1hjQVQweWNl?=
 =?utf-8?Q?W+zd9R993UnfZXuxd1nA0f+cN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a66582-7643-43ac-e2d1-08da55176e7e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 12:53:55.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysFubP2iZx7lDTlQuyrG+2NJB7auD5tbcC8NckCGTzYw9xUfFQtbbu8+3VZCmQCxdzpx+XF01J7T58XQymJWNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6598

On 10.06.2022 07:53, Wei Chen wrote:
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,5 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> -obj-$(CONFIG_ARM_64) += efi/
>  obj-$(CONFIG_ACPI) += acpi/
>  obj-$(CONFIG_HAS_PCI) += pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
> @@ -20,6 +19,7 @@ obj-y += domain.o
>  obj-y += domain_build.init.o
>  obj-y += domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> +obj-y += efi/
>  obj-y += gic.o
>  obj-y += gic-v2.o
>  obj-$(CONFIG_GICV3) += gic-v3.o
> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,4 +1,12 @@
>  include $(srctree)/common/efi/efi-common.mk
>  
> +ifeq ($(CONFIG_ARM_EFI),y)
>  obj-y += $(EFIOBJ-y)
>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> +else
> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
> +# will not be cleaned in "make clean".
> +EFIOBJ-y += stub.o
> +obj-y += stub.o
> +endif

This has caused

ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail

for the 32-bit Arm build that I keep doing every once in a while, with
(if it matters) GNU ld 2.38. I guess you will want to consider building
all of Xen with -fshort-wchar, or to avoid building stub.c with that
option.

Jan

