Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7304759257
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565731.884166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM43b-0008Tj-Vr; Wed, 19 Jul 2023 10:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565731.884166; Wed, 19 Jul 2023 10:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM43b-0008Qq-Sd; Wed, 19 Jul 2023 10:05:19 +0000
Received: by outflank-mailman (input) for mailman id 565731;
 Wed, 19 Jul 2023 10:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM43a-0008Qk-PP
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:05:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb66566-261b-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 12:05:14 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2023 06:05:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5919.namprd03.prod.outlook.com (2603:10b6:a03:2d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 10:05:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 10:05:04 +0000
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
X-Inumbo-ID: bfb66566-261b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689761114;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sUTJyKDTTHbwqMzisdbhNUa16spItvBINFV6D0pAn+8=;
  b=LJPhvKxk80HbXStlaxbmRhRZep6D8hwsILlPc5pj+Au8hYuB8sfstJK8
   XOhXMYZ51RZszlchNDCqDrAyBCnzYbbiFmiHus9DN0GGqq5Jy7f57zFEL
   2ITce00w9FCs/RXo46R2XGe/d8tsfYAaIIhGsvHJGN4XdoqTjE5xO6OrF
   o=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 116733452
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:azNzLqooKLvhjRXYxSM2jGMcOw5eBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBnSParbNjDxf4okYNyz804DvJ7Tz983S1Rk/iBhEipHo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzihNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACtQVRHd2b2H+fGAFNYzge4oAsXpOKpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6A12wbPmzZ75Bs+bFC7/KeWsmeCfcsOE
 khTqhss9/lp6xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJTbp+PHmqYA3yx7KENBqFffvisWvQG+gh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:pudJl6mFHAb6wWDPBmD7ALEgTAXpDfIH3DAbv31ZSRFFG/Fw9v
 re+cjzsCWf5Qr5N0tNpTntAsa9qArnhOdICOoqTNWftWvd2FdARbsKhbcKpQePJ8SUzJ8/6U
 4PSclD4erLfDxHZJbBizVQy+xQu+VvKprY49s2Ek0dKj2Ct5sQlzuR1DzraHFLeA==
X-Talos-CUID: 9a23:FX3+VG7Y4Oy5pON8bdss7xMvG557LUzkj0yOHBC/I21HRL+RYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AsQN7yQ6KKr63ZiRy/UGXUeELxoxR6KTzVm81uKk?=
 =?us-ascii?q?gopi9MWsgCjXH3W+oF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116733452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOqNXjY/Ds9ikYpbkX/7o3XJWl2Kv8Uns1YqWLjTiWklQUPEr+bkhVzmRwvMpW88WUqX33WUSb/k4ZPU0r2Cqu2QtW5lYemB9SEgNeCiP7q+OIEVUZqIKIWhFBWSdmzKOGqXxnJSLkzu3R6VKPVi0qwuHy1nBWUPuNzR6eJxuVs1ULSI4iyP7J0QkS+Ke83/lFqzEPSOLJPsEarM/LgmJnQW1pRAl7woIiowFZ92zwlOdUsvYArFZ53OxV/A4xyz4LYzZfFpiBeTvwX9o9WoZvNe9kumUqxPMV4VFp4hhjaQR7X/bRLAquXvgUUp09tEGnKapfGqPMuk2KJdIu5Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlYpYnPJfzYMFldqzB+wsYVPb5M2tzyK6CbsXxYmFNg=;
 b=l79FFGuHqvrYMp5hGuHXPGOJOrTGI++k5qUuuf361JUWMrf3lL3wcDuyfdi3lCy7mcDu6e4wgfy+N05CTxujgvKK3PJTcITqI8G5glqPRANVG9ZY6pAuO4/T5eUrXPij30Jjaq/YJiZU9Rgn5xJf3PbAWr16zssDrTK4Thq1ieCJcPzojzEkCc38aR0Vqf6St496SRrELgiTm9rQu7RbvLE89IT3iqsFyn1xyB2ACcKlKSr6p2S4GFsYD8nA/l8AhGJwcRlWPN1bXJx1p0waCPcIZYplYQPQe3LKRVgR6jlYxk9UBT9cN7+AxFHjdPx0X79bj1XPs4oPljs6Q8ijHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlYpYnPJfzYMFldqzB+wsYVPb5M2tzyK6CbsXxYmFNg=;
 b=UkPF/vFFQFSk14kECTdbziOxNVJqN13A+rBtrcOsM3kQnN5bEGOGcqGajYlW7NHVvwNoVSEW8WMD6hzi2RvsSzApBCPWcnqYvX2UJ/3NbuCFNF+HMk9bMk9e/aLwnO2zmK2fwycP51JN0+qWCo8KEaxxQ2oEL08XbTCHq11SSgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bb671300-543f-3754-b428-73b91ae321a5@citrix.com>
Date: Wed, 19 Jul 2023 11:04:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/4] x86: allow Kconfig control over psABI level
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
 <28a84bbd-b0c4-dd80-b9c2-59770d0f54fc@suse.com>
In-Reply-To: <28a84bbd-b0c4-dd80-b9c2-59770d0f54fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b9adb5-f240-40ca-c24a-08db883f9f25
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JEWrqKcmdBr1myWHfa7YWZEdNWyCX/cAy0Cijms71FYvrmX7CJG5ZDEl2hqjrAo/c4xWXT3WFWLumlpEhiUF2Ad4hRtlCh5zjkJOMsaf67BMZWQA1cAT/UfV8LuoAd5b53Svm/plETGgegjr6MvoaDgsH7o8Ybp0yLMAUYjUI1oBqkehlN2w6mAL3eG9j1fyhr9nD151QGyCyzHvifhZH5I6PH8oG/o/9ygoPEL0CAqhrznSgZbfV+0OCqbAGKO6GUzdzTirQJlNS6lDlTuh7BRmGdWeuIwBI3VRGgelA+LmWZMLDOyeoXhnnxQnaYoOabZ0Q5O+DjlpIJoFd0CfPwnLnZOx/8zBUvlK0slNpOEFiScKff3JtSJEfD7fc+5InQvcqgrEDdXilwYCw+lV9VCGjPqrfz7DJ07lIzGWoYeXvssB9VWLy/x3slcsgtH5p3y0fwX1H1ENR6Iv6paW33rFn48NOK1XEwt2vrLSCxuGhEw50MDobF4JkHN2b+pWsGLc5vrBz8I/0SNhG6Q6D2CP6hEifr9gTI83Zl2v3T+TNim33Fphtu7PE1NxntBKpUrKvBWcBJ4mz7lt3BgJknXVSu9MF8SLuhTteK/TrPL++rLfxNX+na/I6mLcW07IIWMCzp2O9cQCKsXDhocbGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(110136005)(54906003)(478600001)(6486002)(6666004)(53546011)(186003)(6512007)(107886003)(2906002)(26005)(6506007)(41300700001)(66946007)(4326008)(5660300002)(8676002)(8936002)(38100700002)(316002)(82960400001)(86362001)(36756003)(31696002)(2616005)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2R4d214MEhKWnJPWHNlNlAxeXNqVVRJOTRLcjhoa2FoVEt0ZkMxcVhYQnZs?=
 =?utf-8?B?WWZFdkRoZVVUNVhYRkVpUWVram1CaDFvLysrdnJqNTFuaWU0M2hpNDAzMGNX?=
 =?utf-8?B?eXJjTHJyYi9rS1FpczhjSUJ5OEhCUFZCS3B5SzJybjBnSFRadFJzTDNtUS9n?=
 =?utf-8?B?QU85VEdraGdlYnMyZTF1d2tiaUJUSjVMY3d1QVI4UjEzWUtTK2lEZUxHT3Bv?=
 =?utf-8?B?NGhsL0IrTzhxK1JEdDV0VDR2MG9lWUNnYWJEa01UdUtLd1ZkTkhVUWxWNElh?=
 =?utf-8?B?d2tSbTBzdVBYYmxmTGtXaHp5c2NkVjJLNCtUcG5zSEdQeGgxa0xYNDJ5bkdu?=
 =?utf-8?B?ckhHOTd1cXhESWI2OGJiS2hFNW9UVW1nUGpJYzZXaHhHS01mYnhxaWYwQWVO?=
 =?utf-8?B?bGdQcUZXN3VvTUVTV2I1MTgyelQ2bnQwbjYrZUVkNmFGOWJjUklzZW1nZHlB?=
 =?utf-8?B?NDF0ZkFpNDUrVnl6K1Ixa3RpTEx4L3BBbVhreHdCaTFObjd1WTc1SlV5ZkpB?=
 =?utf-8?B?bjdOMHF3T1E1UkVJLy80RFd1dVJNOEc0L0JyK1hLYjI0enROSHJOUkQ1d1gw?=
 =?utf-8?B?dFltTEY5MG94NE5meUZXTzk0SXQ5RUZ3QWZrS0phS2pGTW5rbGJBWXFlVElN?=
 =?utf-8?B?VDdlaEVKcVIwRnZzQkdZL1hqSzRDWjV0Mm5PQkl3eG5tamJ3bDMzUjAwcWFy?=
 =?utf-8?B?ZzE0WHJPYnRyenFrK0lHdlpGYzlUYTdVY2VVcFltM2ZpWVRFZmtZK04wcXNM?=
 =?utf-8?B?a1ZneUNlRHBuL2Rwc213QTUrM1FseHN2RFVaR1FLbHJ3NFlqWnB3WW5kbEsv?=
 =?utf-8?B?blV1dkZaMlNjL2piTzNVZ24wMjB4bEZ1eEF2V3BnaHFiVnpQN0FDUWpvUTFo?=
 =?utf-8?B?b0hxOExJeGJML2M0eUs5QjdqZmt0VEtDcUJielRwNEpDc2FkdUs4ZEtFbXQy?=
 =?utf-8?B?U2w1SnArZDFSZ3BpNWtQVGM1WFUyNHVFMm92d2FoaUVwbXFOTVpsakN2UnB1?=
 =?utf-8?B?amNoVW1tMWpLYjQxOFFTMS9QT2hrZ0VZQlhoSU1NYm84VEJVVUUycE1xOWQw?=
 =?utf-8?B?dk1yWkx0dWllLzVSeVhqSjBXdlE0cVBud0ZUNnNwTEtOdGdiUWVoOTJwNmh6?=
 =?utf-8?B?ekxQdnFQaG8zRkpIMFBLNEw2V0taVTd3ckhsMkEwcnpHY0JvTTlINHB5UlEy?=
 =?utf-8?B?SzVCdUtMdGxDY1ZlS2ErSTA3V2F5aG5Eb1B5T3IyakhnSTd6ZVFpZS92bFJD?=
 =?utf-8?B?SWdnNEFPNWpURU1oRGZaWGZSMDhXNy9BNkRUNkxDYk5leGZnQ2QwcHRTYjdu?=
 =?utf-8?B?L2w3TUlqalgzc2IwWHZoaWhDMk02Lzk1Ly93VHRYTmE2TXBmN09XYnU0Qnpv?=
 =?utf-8?B?Mlg5V3JpeTQ5OGxSTlJEWHp0M2hGVnUwNWN1UVZWdWpYK1NQckczOTR4eHVa?=
 =?utf-8?B?KytzdWtCRTZzQ0xtRWJrc1FKY002RG9CcVJKYnJTMS9VZDNvaGl2S3V2UHd4?=
 =?utf-8?B?M1p1WGVXM0pCZ2dDQlRWc3JMcUhoT0VxL1hIb1h1YU8vNFhtWmF3dFR2WENs?=
 =?utf-8?B?VHBTTnM2S3NOZ3h3K2FoamVkQitScC9uS2VjeldQQ2dMRVN1QWhsbHM0WXhM?=
 =?utf-8?B?V3NVRTBUMTMvd2dMcVk5K3RWRmN4azQxbzdjK2kzS0Y3RkVvUkdXcjlFWHJa?=
 =?utf-8?B?dWxLRlZCU3pkbVZZWkZOOUN3bGdjcUpXSnYyTEVFRml1dldQNjI5T2NiUmZ3?=
 =?utf-8?B?aWI0Qkk1MTBoNUZobDIwaFFYYUphbFdoNkZ2NDVNNVhFQ0NvR1pCR2kxODE3?=
 =?utf-8?B?S2hjZ3NSZUt3WW00a08yem1KWWhpUjMxbUNwcTUzNGVFUGNubnlOa3ZlbGtr?=
 =?utf-8?B?RGwydzNzZnAyUkR4UTVpQ1Bha2ZmVHUwM0JQVHdlRVhzU21iNHhqU0ZWQ0Qy?=
 =?utf-8?B?eXVhL3M0QUNqazByazZzSm1sVTlLUWRnekIvYUoyb1FzdG5BMXgzd2FaVVRS?=
 =?utf-8?B?VWxxTXVXNVY2NlUvYS9RL2xiajlrbUhKSTN1T3lkR0NyVGtmSEljalp1RlZ2?=
 =?utf-8?B?WmVaNGRMY3NUQXI3ZUx0UmsxWDFsT3BjaUZ3bUFzZHhNby9YUkRNb0RZdnFx?=
 =?utf-8?B?KzRoWGxtZ0F0RUUvLzZpVDRUMzA1UHRRRjNHZitSTzZBeXNKd1RnOWFKQnFo?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m8Xk78end9Am0eiFZ1R33xdtSWB6u2mccgfvueutur94/jjd0eiHHY/mDAcb43aBnUqAV5PjcGK5AWq+TibyT7I8eHqPgsXPUDOc7VOy/IOyY5+uFqcEwCmunlBUv5u8a6Qywhv9h9OpgUAiBoqDEuOTLyOnmxYE4/80y0dmKji7wyFeF7EXK1OZm+83t55/mDw2EQaGzyzsZO7crKt5Z67ot6UP3xkyT3p1eJeb698yHsE0dwcdGfY1hwq3l9s+Fxj+ixtE1a4A3K5PweQqc3pj4CdU1RoosyMaBTRSaDF0K7mRlyK71hvXssDMGYDI/iQAFM2azfYEdPQLRy7nay4z7vgL0QsLLmNP/nbSwlMJ+kXbQ9OrGt12dd1qmKD/mWr7XD7LLeUttan8520jvBY1vqBQpddybC5jpFFLEldGemRK5T6WZ7P8AZI/PFBJyiv7EvE9MqP1HkTA5bcgpZMj2fcNiqcfWUyN+da6YB+SkyBAAoQjPxFvcRWzLG0Hks4v9G4DK9xS2QQVDHr3pqJVmKV7gdWccH2s4oJQDUzRgw1fFq+XPy2zJCwjwdP7++2CdeewFESQ3d5jfAqJJ0S+4WfC3b+V94FWdH3H6GKr2kzPaWIbvmzc8hTYVI+0YO0AJuE60qqaeuNhSXHLqDkoj6KkfqWu5BoqRCpM/8fT0tW62yUKHzHs3ZHwg7GbnsWcpz8WK1jupbyaTwYOQebLZRbZRcChyroJPCq4M49rVnUV+fEUhZ2xkGtTsLmv9CjLZ09nbY1JrpouosdxJVWVH3s5/Kz26sez3rpWhhEcXmlT6iOBqX0UmLYOU53rE+G+E5TKCelMQwPJcyXsPA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b9adb5-f240-40ca-c24a-08db883f9f25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 10:05:04.1077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzbdzqcuM9Htpmw9w5lOHRS8i6XR5K3B5PkqgVE2MRUTiREstXmR+xVdtYBly519RdkaiazSolhNRB/I2ONW//GN8T4bdZcqWDIM3ZVNsR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5919

On 19/07/2023 10:44 am, Jan Beulich wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -118,6 +118,36 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +choice
> +	prompt "base psABI level"
> +	default X86_64_BASELINE
> +	help
> +	  The psABI defines 4 levels of ISA extension sets as a coarse granular
> +	  way of identifying advanced functionality that would be uniformly
> +	  available in respectively newer hardware.  While v4 is not really of
> +	  interest for Xen, the others can be selected here, making the
> +	  resulting Xen no longer work on older hardware.  This option won't
> +	  have any effect if the toolchain doesn't support the distinction.
> +
> +	  If unsure, stick to the default.
> +
> +config X86_64_BASELINE
> +	bool "baseline"
> +
> +config X86_64_V2
> +	bool "v2"
> +	help
> +	  This enables POPCNT and CX16, besides other extensions which are of
> +	  no interest here.
> +
> +config X86_64_V3
> +	bool "v3"
> +	help
> +	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
> +	  extensions which are of no interest here.
> +
> +endchoice
> +
>  config XEN_SHSTK
>  	bool "Supervisor Shadow Stacks"
>  	depends on HAS_AS_CET_SS
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -36,6 +36,10 @@ CFLAGS += -mno-red-zone -fpic
>  # the SSE setup for variadic function calls.
>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>  
> +# Enable the selected baseline ABI, if supported by the compiler.
> +CFLAGS-$(CONFIG_X86_64_V2) += $(call cc-option,$(CC),-march=x86-64-v2)
> +CFLAGS-$(CONFIG_X86_64_V3) += $(call cc-option,$(CC),-march=x86-64-v3)

I know we're having severe disagreements over Kconfig compiler checking,
but this patch cannot cannot go in in this form.

You're asking the user unconditionally for the psABI level, then
ignoring the answer on toolchains which don't understand it.

The makefile needs to be unconditional, and the Kconfig options need to
depend on suitable toolchain support.  This is the only way we don't get
a false statement written into the .config, and embedded in hypfs.

~Andrew

