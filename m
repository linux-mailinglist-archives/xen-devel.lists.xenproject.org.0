Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39A74743F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558427.872517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhAu-0005yq-I2; Tue, 04 Jul 2023 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558427.872517; Tue, 04 Jul 2023 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhAu-0005wA-Et; Tue, 04 Jul 2023 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 558427;
 Tue, 04 Jul 2023 14:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGhAt-0005w0-Am
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:38:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7676027a-1a78-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:38:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8136.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:38:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:38:36 +0000
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
X-Inumbo-ID: 7676027a-1a78-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gi8KVF04OZO9TAcimykRTgGSb1XdqstfXsNZeN2w/ZhdN84RjD4n/UBDO5yG4nRgpd2rWnEwBUGstJBVKgdd+zKIfaHHqEnP7tyZRUhfL5LhmltJUdxZTlyroe0rVHGc3cvgTMx7R2yQJGXEoQ/6+MC+6MCGcL6TXtIPCbt4ERSYR2DjB4cExkChWOsnXYwtaYkYOtZqxmPUyQAYXQVqzv7wqw/kZNmbNKvGBWF890osvZpj8f1aXxutiDunjXQdPrj6Ch9EMrMraoEKPdfDIjuKQyGXoXEUG7voK4tWPjJHqtKLWV/JDDhE4ED1TfiV+7IxUe2fAlyk3Uxxj6V8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuNhuMAqFMs1w6BxdSHXBrN+n65LvlYXXmD1XSEsnTA=;
 b=HVyjcapa7uK3PhrFUZfxTqOcv6igAfIeQdzQ+T5CzK/qVAlD28IHGNLSopgQLDcprlVTWXk2hv/ooG097wrXm9fN1qrkNmCbFTSwdHtHz1lsoDCpy1EGKks05Sr5U/gzhdiUrK9/e8gDBkNs/13/ZEMIG6oW+jCyM3WSwutXXdTxwkq93oYYF6CfICTrDwumHVpqE0vXWZp4fXVIgSeJrbNREplowwkTS6stsqaa+gZev+8Qzf/VY8po58a/E9c9gtVCAmv/K9aS/vg8KLu/AGRxeLOIkKdh1y1NTlcsXW5pjtP/j2iH89z/JHDfRvLFxC4H6BPDhxCIzDcYmHiQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuNhuMAqFMs1w6BxdSHXBrN+n65LvlYXXmD1XSEsnTA=;
 b=yoGZd9G36JzGuPZSm/OEDBSMYlcx6ECcPBAo1HlcmxpDD9JflaDw7ENH/QSPKbTMcRQPO/bVL3vL1q90eZ2NbPv+GE/TU4yNIt+wzEYBYShn2V5bZTYLYngHlg9DPwUvIDnUMJb/S/Dzl+/QzKIIYb7LB9OkoxzYD30dFL0JsmHpG2QQiys8aqHNdRz85Qw+s6Yd8AJHwIb8MPMF628LUpR4+Ang93gRNiMxneQLC/3XIKujkJHarOk0DB4lclE5Tqq5zG90nyzOe66Z5L+TExIiF4NAz1P9PYxvpwhoKip4sM2XtOAUT8M0uSvkN5Rwca0MNlCWfTYUGOz2QT3FDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba212e0a-1bbb-9576-f6ff-c6d46d80b17a@suse.com>
Date: Tue, 4 Jul 2023 16:38:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2.5 3/3] xen/types: Rework stdint vs __{u,s}$N types
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
 <20230628145403.3630-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230628145403.3630-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5e8731-c181-4e5a-40dd-08db7c9c59bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VgWVImoYrfpryuJGuUmCRBTu1rhQYuL9lyJA1xouNAY52AMftRfeLz5UdKS4hjbMb49lMgwAKbDqtgXy465G4SC7un48skZxtJsYWckc7jCGLQ16UCCMF5Ta9QsmlESkt8Q3Qp3dCr7TfoV4guWqkD9K/6wg/xNZmDrqcyxdLd3FCxMcAuoGZmv/dSXykrq650vruxkEtp5wh4w0c8LvvF/pYPWUsOBj7U2x65xq0SnZtgHkqvBC+6EyrA6JBq+UP9qofb1ZtBX/qnpzFsgWqjvJg0LOV9B8hOoL5sZrBEO4UlM2NGy6OpP9VXVC5i9m0Ww61Jh8SdnsyLeZZ4C5qPRtFsrEau7mFBCrR9IVGJc3oEe7EZnRV4nqrxtEAaG6iaxISNNk4t0sNa8od1Mw/FK4epaT6uM02fZgPC0mlE/UAj2tqw3CmLB19xodL3ri1lqGQrbjvYL11z/w5eP2Bp0+dB1NYsGjAldIBmhCxyC7pMxAsv2M5je7cxSblqb3KBfkhbJVeSgzYkIvVZwCy8p7EKev7t7i0wieVouPDdj8MriMamxiIEac0TTFwpcWVqe04TC7WlNEVDiJG3UolyGRwlyq94eocV95+BVXalhDQHX+BoSlPr+JplqySl7klZYCaHkk3yBEnqvOiJwSwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(316002)(8936002)(83380400001)(8676002)(54906003)(38100700002)(41300700001)(66556008)(4326008)(6916009)(66946007)(66476007)(36756003)(966005)(26005)(186003)(6512007)(7416002)(86362001)(6486002)(31696002)(5660300002)(478600001)(6506007)(2906002)(53546011)(31686004)(2616005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzZ5eStGQlVXU2hLdnFtOHdmL3JtKzE3RklMZmVQRFoyNk9pcGxuVDNybTRo?=
 =?utf-8?B?WTl3eDUrS2pwUkFFQ3BHV3ZvbzYvbmRKRnVwV2w4VGJTVlVmYmlDcWFpOXlx?=
 =?utf-8?B?Ykc3bWdMMmFWOCtLeUxESUdHbVI3bUJ4NGpKUG9Va3dBSlhlcW1Fbkw5NVNJ?=
 =?utf-8?B?QVdsY0xFUDh5TGNocFVUTHhGOHZPUkN6YzFpZFFhWmdBdjV6c1hNNitiNDE5?=
 =?utf-8?B?eHNKNGZPVXkvRUZDT2VQTHdiVGpnUGhUSlpWZUhzWDlObFkzdlV5ZllxaE8z?=
 =?utf-8?B?QkNQTUZlNkFvczFITjBWdU1BTTdUT1V2RTRsSWdVVXlRa09QbVNCY2JjVkhy?=
 =?utf-8?B?WjNwS2hkN1Q5R09tZi83ZzBtTGRTcGdaNmFFS1RHSm1hVWlkQXVjY3hMYW9k?=
 =?utf-8?B?V1dKUm9vQzg5K2NSQlRqd2lHblJuL2ZuWTlSRlVjZHlKMURMMUEzcEZDNE1H?=
 =?utf-8?B?MlVHMFRDdEZob2dLdHRBaGduQnBoQ3Qrbi8xT29PM0Nrb254Ri94RWJRYXNw?=
 =?utf-8?B?L0hmR3M4bXE4ajlvUG05NXRsbXVMN2RDMTJUZVZVOUhQdU8ySzlkRUMxUW5M?=
 =?utf-8?B?WUQ1UndDMmx6ek1PM2R4OW9ITHVKekhqb3U5UTMveWxtcCsyb3BycUcrcmRm?=
 =?utf-8?B?anVQajVlL1NrV1JjSERGcllUQ3lhR3YwTktrekhSTkhpUWpJTmkya0xNcEpF?=
 =?utf-8?B?UDE3TUp2dUlSc29LQ1RRZ3RTY2VURE04K1R0aW1GRTBYenptK08wZDBkS01T?=
 =?utf-8?B?Q040UXRNSHFheHBLZG54cFdRMWJUbkF5UFNXRjVhSWw2NjVtN1Y4aFZRb1Y0?=
 =?utf-8?B?RmNBaktBbVpBcFdlUUFXNmpZVzA1SmY2R1hlR0pFSHMybTU2RXBNWDQ2WGVm?=
 =?utf-8?B?REZ6cU5KQWs1dUFiRVZqU0JxMnE2RDQwbW9jN05Nb25Td3V5eHdOZmJQenBi?=
 =?utf-8?B?M3haR2Q2V1kzZXkyc3dKbUVNV05ieDVqVlhYWUxyQjZncWJwZGdQUDZ0M21W?=
 =?utf-8?B?d2I0QlViOTlERzFKMTFZeXFqekVmM2dlQmN4ZVpyZTJUTUNSc2NhNWJVMmFJ?=
 =?utf-8?B?RE8wVDF0WFV1R3lJaEFTWWtwdHhud0QrWW9IMTdOWWxTVU56RnZGR2tvNU5H?=
 =?utf-8?B?aHFrdU5uWDZ4Q2F6Sk9wdWdhSS9PcnEydUUxZkp6c3J3dHNseTBNbGFUSEJz?=
 =?utf-8?B?aUc3cC9sMkR0Y0paQ2Z2MUNZcnBGTXpYK1E4bGRramlESzlDVDNSc2lBKzNh?=
 =?utf-8?B?ZzNGbVkrUEhraWptVVBuQ285d0F0N3d4Tmt6S0U3MUtod3JnOWd0T01uUkpy?=
 =?utf-8?B?T1M1UGo1VWFzbUYvbmxaUnh0RTlOV1kweFh5RkQ0WEVBZ1BsdGpSTVpkaHNa?=
 =?utf-8?B?NUFJeW9SOGwzNEtYYnI4OVZqdk1nOWJvN3lNVDZXNDg3NUJHQzZ2Y01FQmdn?=
 =?utf-8?B?UnNKNy9TbG9VaTZ5VVhPY3BKN2liVFlTRk5UOUI5WGhOOUVGbnREVVJXWU9S?=
 =?utf-8?B?NVIrcVBSeVJEQithdEtZUlB5UDBSTk9IelRWUlNIeVBVVzE2RmFpYWFKbm05?=
 =?utf-8?B?VG0wZ0hoQVQ3aTR2ZFdERUY3a2lXVWdFMlduVEhZU1diQm9DbzFBNFYzT3Z5?=
 =?utf-8?B?d1RrN3JseUxMellHQllEYXFac2xhbEdxSGQyZ2gzU0lOWlRDMG82dng2UjVz?=
 =?utf-8?B?V3htTzNUeVpiWmxTblNZT3pKVmI3bWdwbkw5NFd0aWJMc3dUODIyU21GcXp1?=
 =?utf-8?B?Qi9Sbms2VEZVV0p1ZnhqWTIyS3FGZEJ3MG9qUE9mWjlIRnFodEJnSVhtRlNF?=
 =?utf-8?B?NHBTR1BSNmlEVjRRWDVHUzdzNEhFMFRNc1FtTm4yOVFPRGlSOXlIcTViUW5U?=
 =?utf-8?B?SXpheC90eVllRk9oYlZkM0pvTXdaMFIzYklwTVdqQXRvWUVlWStyMFJ1OS8x?=
 =?utf-8?B?ZXQxSjBFUG5OQ3V6ZE4rSG1kVWNpQTB3eHdhQzA0SE00T1VZbXNTRXVidjRU?=
 =?utf-8?B?RnJkb1NaVk1TMkY4ZHNWTlJmKzNoSkdWQzdLQmNoR0c1NjliSzduUTZvKzdk?=
 =?utf-8?B?TmhycjA3UVUrM20zOFlhU2FGUjBoanhrYVlUVTB5Y1JyR0xSNEZaam1ZMHd2?=
 =?utf-8?Q?OYW2wSX8kNg64uZeDFxW0IxCI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e8731-c181-4e5a-40dd-08db7c9c59bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:38:36.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmiH54OYEezYoKJTu5JCUKL8whwsZNC0BeC52dCwZ+yk3U4mwFAZSD/N34+CzIhcidMs5f12JiDvrJwFd5py4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8136

On 28.06.2023 16:54, Andrew Cooper wrote:
> Xen uses the stdint types.  Rearrange the types headers to define the
> compatibility __{u,s}$N types in terms of the stdint types, not the other way
> around.
> 
> All supported compilers on architectures other than x86 support the stdint
> __*_TYPE__ macros.  Move these into a new xen/stdint.h to avoid them being
> duplicated in each architecture.  For the very old x86 compilers, synthesize
> suitable types using GCC internals.
> 
> This cleanup has the side effect of removing all use of the undocumented
> __signed__ GCC keyword.  This is a vestigial remnant of `gcc -traditional`
> mode for dialetcs of C prior to the introduction of the signed keyword.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further remark:

> --- /dev/null
> +++ b/xen/include/xen/stdint.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_STDINT_H__
> +#define __XEN_STDINT_H__
> +
> +#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
> +
> +/*
> + * Define the types using GCC internal notation.  Clang understands this too.
> + * https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
> + */
> +typedef   signed __attribute__((__mode__(QI)))     int8_t;
> +typedef unsigned __attribute__((__mode__(QI)))    uint8_t;
> +typedef   signed __attribute__((__mode__(HI)))    int16_t;
> +typedef unsigned __attribute__((__mode__(HI)))   uint16_t;
> +typedef   signed __attribute__((__mode__(SI)))    int32_t;
> +typedef unsigned __attribute__((__mode__(SI)))   uint32_t;
> +typedef   signed __attribute__((__mode__(DI)))    int64_t;
> +typedef unsigned __attribute__((__mode__(DI)))   uint64_t;

Much like you avoid "mode" potentially being the name of a visible macro,
the mode identifiers themselves could in principle be, too. Being upper
case names, perhaps there the risk is even slightly higher. Hence I'd
prefer if you/we could use __QI__ and alike.

Jan

