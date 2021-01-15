Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB52F8030
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68391.122456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RXx-0007Xu-E4; Fri, 15 Jan 2021 16:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68391.122456; Fri, 15 Jan 2021 16:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RXx-0007XV-AV; Fri, 15 Jan 2021 16:01:57 +0000
Received: by outflank-mailman (input) for mailman id 68391;
 Fri, 15 Jan 2021 16:01:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0RXw-0007XQ-AL
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:01:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1336066-5ccf-49ba-b121-e90b7cb0ca71;
 Fri, 15 Jan 2021 16:01:54 +0000 (UTC)
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
X-Inumbo-ID: e1336066-5ccf-49ba-b121-e90b7cb0ca71
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610726514;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oI0zFH/U1BR9hqp0UHS2GQK7TBZh5yZjcUphdMNeH28=;
  b=J3eVwR92gnqpocgtTJKfuzBPTszgCebf6zu/lQ85KrNjGEH54mEmlF2E
   5uT/t/fYHrHmbCeNK1nGkOOEELfeZ+WK9aNzqkp2V/2GYhTHU2hXKrmKv
   87Np1zjs8Cvv0nuYgr+fFDVK1vuJAy/AU92pnCidFk+0rTIBPC+/0Sadt
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7YrfxHQqDkOymvRSWfmCAcBCvlJHaGmAjqP7l54cnYBN+BWI04UA+4sKVzC78ckqycDi29FOpP
 E0K54+mEZgeSZDTjR7JyQydGBrVJRqSOEDmH+YpIVLollsjiapIWMvrEu+7M5+sZIUt9kuKny/
 RTtx0YjssSf87K42S9y83cJduJykxyi6ThQZ6GVzvt8mt9n0/qAI20sCbVKD1s20iLY00P6vwk
 BD/XDeNvuZJKmGSDAYOIrj12FEbhf9+TVUrqgmN3YRCu2KkyKyDtDwJyxlSdBVwMXrrODmZgSh
 +Lk=
X-SBRS: None
X-MesageID: 35230594
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35230594"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8K+AitqvXH7Itc+8uDhIJ1ZKvBjp+MOuZhLEoqus2fauiL9Rm0P05yAfJxphn2f/MstHSd5wxSPf7TnBvQwKf2mOXazmJytCpOqroPmEy9b521O97VYjaeTa4ITOI6TQgY4Z4OBnY79/XmuMetrmnA+FJ32Br+/Ye000EXDPyEykidIBbLvTw11jiqxXJumVGHJ2K6GM2RgiEL1YyK2LP+wctwBD9dyDFL2db1fRXq7Bv69v43zhofYKrLaFc22LYXEXTL9ewsDFG+RTAhtrRnFW/8JvO4S9cF4BuSoptOCjG99w0v6VUAby2+p6bCc52YHCPyIEC7lCHpRnEEN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNzDnZS+9OVinH3EFa9o0u3gNsTH4gJSjGgvA/aD2Xk=;
 b=HMm81+ZDidMM7amCetZ6FC6ipxLZOcmpgOdHH10aWeBgx/iDaaoMrt3VBoTwR16rHn+qNMxsFHfSe0y0TN2rID/nCdtLoBbFup/Q654Io17QlDAUu6jHhqamhnI41BGidRpXCoV79ausZdPKf53CLS3pgp1D7MEhXaFsAo1mvDTBETogYOh1m8JyfBfBS8tKWbBQ6dscRW+4MBO5BA0NFmHFifyxs5SAfv24mlXJ7sXZ7daCWAWu5fXiNgQmN+0wb2BIsmdszlr2KQfE8jK/WtZd2z0+hUY+qnZmhPDrzu7HSqtqRpRBzOzZdh+93FRgfuGQLC06mlQjPHletE/5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNzDnZS+9OVinH3EFa9o0u3gNsTH4gJSjGgvA/aD2Xk=;
 b=d0hDD4J9vvj4AqGEgKonjRrmWwx3xKFOOGoUqI7Cu9U03c+dc2LXN3/O9bD2GzAw0uw0voMjfTPotQC02llxVjG8upuAVnpd5plcqNptSpN/R0A8h93jAvHhFpD5kt4Uk12pQX2/OxX7vk/tGxAAa0nCUimWU+tDqlCz9EJNQdU=
Date: Fri, 15 Jan 2021 17:01:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>,
	"Elena Ufimtseva" <elena.ufimtseva@oracle.com>, Ian Jackson
	<iwj@xenproject.org>, "Wei Liu" <wl@xen.org>
Subject: Re: [PATCH] NetBSD: use system-provided headers
Message-ID: <20210115160135.6zag4py7izd7f7cp@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-7-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112181242.1570-7-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e0bbdf7-720c-401d-233b-08d8b96ed8c8
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5445BFC26C8EFADB96EA3A7B8FA70@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbLYA7Au75AqhV23blcS8Ts3WXez9dEMloo91nV9/PgOUhOLz6LMmkYIEiW8pc/shJ6WDIiN2yRrwYDtQkDRq9U8sOKJEgUfiEGigCP/DmVhxi/XUhtOcRT5Z3rZWRJ53UT87Qla2F85alJqzPM2v5YoGgl+t04hfUa+7ugZVU6RMQsqXloK+5gIyv/jMNl/XeNf2i60qiCTB9Ty+PLkVfOd5X1le47A7t+jYXIiAyc2q/FHjbZtKVbs+IQ65DsTegpnblL6aUvxB0I2Qmrvi3FHXS3XJwJaQeBfpyc+EagHQGXkICxPmzTPVESL7L0iTbZbrNbNzeL2xyPcDDm0I2QDbh8fO9vhulVnKLLmT7ap5JJH7uTKiH7q6DAZZIjTsjEDj0HymNj76HCh8q43rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(346002)(376002)(136003)(39860400002)(33716001)(5660300002)(186003)(86362001)(26005)(16526019)(6486002)(54906003)(2906002)(8936002)(6916009)(83380400001)(6666004)(85182001)(1076003)(4326008)(66946007)(66476007)(66556008)(478600001)(6496006)(8676002)(316002)(956004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SjFZTUlqbDQzTzBZYUQrZXlzUmdqcmxUQ1lWV1daVFVFNVhiYjlXbEhBWHVJ?=
 =?utf-8?B?OHAzeXMyWE5kSWV0K2tYZkZSRGkzeHIyNWoxUUNhRVdzNkpIcEZJYkhJajQ2?=
 =?utf-8?B?a1hkTStENkFaemljN3ZOUGhOWFdrazFQUGlGMEt0VnhRK3J4QmpQdCt6ODRN?=
 =?utf-8?B?TW9odXQxL2lOaENzendrUGFMWE1mWGZLNEdWLzBuRVF1eUR5enpKV0pPTzI4?=
 =?utf-8?B?WWt4NnBvNDByUm53VTNZUHA0ZEFXcjNOVmRJaWZlc2tIbVZITUg3Tkl3enJt?=
 =?utf-8?B?VlJLYzR3NFJuaVRMd0dFa1BiNStHL1RSa3ZLbHZ2VytBeUlwT0drTDFOWWpV?=
 =?utf-8?B?MTdJSGN5MXkxWU9Ocnk1MXVlUjkvVHVwYVZJMStZQ1NWS0ZRR2JIK2ZNSEI4?=
 =?utf-8?B?MzFnL1hiY3NYL291MlcvdDZrOEZjaFBEZWpxNzNRUGFpMWREay9uVk5Vd3ZR?=
 =?utf-8?B?YUV0cE50d1NhelF1U3BDRHdHd3Zmc1J0Sit0M1N1bnJXUk82SWtZSHNzbTV6?=
 =?utf-8?B?V2hST1RXZ3FnTFNTbnB2N1VJdWxtaEpmVTlmam9GUHJXd2lJVkI5UkZnb01r?=
 =?utf-8?B?ZzcveVhucGEzcE1YUlRzTUM1QWVRZGZkMEd1bWRBZHVsVzRrRU9aOGFzaDIv?=
 =?utf-8?B?Q1ZlY2Z0REY0VmVkYUluS2ZqNm5HN1d6dVVYOWtyNkt4ZGJlOXdPZFF4ZkpY?=
 =?utf-8?B?d2l4cVB0SGxOWWNDTmJBZEZ1TnN2OHh6bVpZS0hVZFpxOW9sMHczZU92Tndx?=
 =?utf-8?B?di9LU0M3REV3YlBQS1MyK3VKWGNTc1p0dGJLMzQwekVVeCtJeE9KRkxDRDVr?=
 =?utf-8?B?WXhFTlRqZ3ZYN05MSzFxMlR5bTN5bWJBOHE1RElPNjVJODhlWG5pOEozcTFm?=
 =?utf-8?B?VHVUOElBNkFKMThsTkdTQ3pONjU0QTFvZVV2aDZSNHNQL2oxMWMzaCs5cnhS?=
 =?utf-8?B?cHRtYjVvSG9LbUwwNkdpdG1TakltTnloY3JDeCtydTErQWlwdVpmUEVwZ3N0?=
 =?utf-8?B?ZlBkUGRRVzE4dm1Xd21jZHRCQ3hYcjgwZkpPRmtYRlNBM0xjZjZ6U3Z5eU4w?=
 =?utf-8?B?RHJOVFl5KzV1bWRQMGVCMDFxQUc5ZncyM3gzYWFzSzNqdkRyMzJ4NHh1SExD?=
 =?utf-8?B?UkVuTkFrem1CeFVaTVZBR1VJdWVrTXZLT1ZtN2dYck5Fa1FyUDZPQ3QyZjEz?=
 =?utf-8?B?MHJ3OUMxZjNtZUQxNEJtQTVrWmtnNUxMSERsc2p6aEd6Qk51ZkM1TXdqemlZ?=
 =?utf-8?B?YUV4S3VmelAwMFhXWHZzUkJWZVM2eS9qOG1JVVJDRHFpWEl4UVNDcFl4aFh4?=
 =?utf-8?Q?W6OgevkFHGu7mXOYJLqHVRpMkK1sOooSid?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0bbdf7-720c-401d-233b-08d8b96ed8c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:01:41.0039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58YVHPa7P9+8fFj96/zB/OLPsJJd19XXjeZGZUb62fbvlE463O+PPQYGJCiuR349V4tGFgAXQbFBRm/Uf3tUvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:27PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> On NetBSD use the system-provided headers for ioctl and related definitions,
> they are up to date and have more chances to match the kernel's idea of
> the ioctls and structures.
> Remove now-unused NetBSD/evtchn.h and NetBSD/privcmd.h.
> Don't fail install if xen/sys/*.h are not present.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/debugger/gdbsx/xg/xg_main.c      |   4 +
>  tools/include/Makefile                 |   2 +-
>  tools/include/xen-sys/NetBSD/evtchn.h  |  86 --------------------
>  tools/include/xen-sys/NetBSD/privcmd.h | 106 -------------------------
>  tools/libs/call/private.h              |   4 +
>  tools/libs/ctrl/xc_private.h           |   4 +
>  tools/libs/foreignmemory/private.h     |   6 ++
>  7 files changed, 19 insertions(+), 193 deletions(-)
>  delete mode 100644 tools/include/xen-sys/NetBSD/evtchn.h
>  delete mode 100644 tools/include/xen-sys/NetBSD/privcmd.h
> 
> diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
> index a4e8653168..ce95648e7e 100644
> --- a/tools/debugger/gdbsx/xg/xg_main.c
> +++ b/tools/debugger/gdbsx/xg/xg_main.c
> @@ -49,7 +49,11 @@
>  #include "xg_public.h"
>  #include <xen/version.h>
>  #include <xen/domctl.h>
> +#ifdef __NetBSD__
> +#include <xen/xenio.h>
> +#else
>  #include <xen/sys/privcmd.h>
> +#endif
>  #include <xen/foreign/x86_32.h>
>  #include <xen/foreign/x86_64.h>
>  
> diff --git a/tools/include/Makefile b/tools/include/Makefile
> index 4d4ec5f974..5e90179e66 100644
> --- a/tools/include/Makefile
> +++ b/tools/include/Makefile
> @@ -68,7 +68,7 @@ install: all
>  	$(INSTALL_DATA) xen/foreign/*.h $(DESTDIR)$(includedir)/xen/foreign
>  	$(INSTALL_DATA) xen/hvm/*.h $(DESTDIR)$(includedir)/xen/hvm
>  	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
> -	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys
> +	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys || true

This will mask real error on non-NetBSD OSes. My make-foo is very bad,
but maybe you could do something like:

if [ "$(XEN_OS)" != "NetBSD" ]; then \
	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys; \
fi

Or maybe check whether the directory is not empty before attempting
the install?

Thanks, Roger.

