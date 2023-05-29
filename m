Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80741714A75
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 15:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540642.842533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3d23-0000h7-AR; Mon, 29 May 2023 13:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540642.842533; Mon, 29 May 2023 13:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3d23-0000eL-6W; Mon, 29 May 2023 13:35:31 +0000
Received: by outflank-mailman (input) for mailman id 540642;
 Mon, 29 May 2023 13:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxNl=BS=citrix.com=prvs=506ffa617=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3d21-0000eF-GE
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 13:35:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a916561a-fe25-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 15:35:24 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2023 09:34:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7489.namprd03.prod.outlook.com (2603:10b6:806:39a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 13:34:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 13:34:54 +0000
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
X-Inumbo-ID: a916561a-fe25-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685367323;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mm/mjZDXWXp0viiSqxFreJYp6rstE9w8o1HVuhdlklk=;
  b=BOLnh11bBQkzxfYyMnqcsRb7wWni/rF28y/CzsjudXOh46Gtl50N1hTe
   lzaYICbwMazD0USu2cfkue6pa6zUyMXZj5EaPQ07lRXtfiX92UxaA76vM
   ONDOCLrDGYGhb04k3zTMo8YqXUjJgBNXO00hr8G3v8QT9RDLdaqSVv8VI
   8=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 110135326
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uzFzQapynw7bYPuLgevraDRgQCheBmJWZRIvgKrLsJaIsI4StFCzt
 garIBmOMqqMZ2SjLd9xPIuzpkwB7cPRn4RgTlQ5qCsxFX8V8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzShNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHdUTQHTjbyo++iqdMNe2/scLujLAJxK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKPEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtKTeblraQ06LGV7k8WFBgoWVKdndOgikmkevREF
 ksUwzV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/7u8+VfLkje9vK/DRwQ+5hjUdm+95wY/b4mgD6Si5ELH9/9GIMCcR0OYo
 Xkfs8GE6aYFCpTlvCaKSu8cEaqp4/uAOTv0jltmHp1n/DOok1aqeYFL/Dh/PgFnKM8Ccj7yS
 FDfskVa45o7FHCta6lwYY64FcUx5aflHNXhEPvTa7JzjoNZcQaG+GRkYxGW1mW0yEw0y/hnY
 9GcbNqmCmscBeJ/1j2qSuwB0LgtgCcj2WfUQpO9xBOiuVaDWEOopX4+GAPmRogEAGms+m05L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:iHu4XK69+28YcPFwIgPXwA7XdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0B/YueAcGRSvILBzySTV/wb57C8gceVbeW19QYQcem9AZsQkDuQCWygYzNLrBEtP+teKH
 IFjPA33QZJfx4sH72G7ilsZZm6mzXT/qiWGiI7Ow==
X-Talos-CUID: =?us-ascii?q?9a23=3AaOWWdWmXyU9Bk69CwUYzh4mQRwPXOTqE72aAKRG?=
 =?us-ascii?q?mMjx4dpenFGCv+oJEr9U7zg=3D=3D?=
X-Talos-MUID: 9a23:P1/CQATVGst8rWoMRXTPgS1nCsthxZiEEUAKi7QgoPSDNRVvbmI=
X-IronPort-AV: E=Sophos;i="6.00,201,1681185600"; 
   d="scan'208";a="110135326"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmrBsyTCWfv2BJcHEb7XxRLtev5fOgYo3Mjyh3n0czsukyV03ykrUJ77/Fikq6TtR9Mg5ChICoXjpO5PUA+uKkj/FkbjA6lMvMTZQ6v7EZRar+uoz0+8P2ARdhfQdC2NREXdJFyaRHeWuo0jzWfaXlZNkk0pMZ8Rcy/Rbf2AARVCHXH8FPTwkyHDVQ15KTnrCritx6RgnwGTJ6lTMlFs/IN8gqoQtYHXTQuHu9Eo8SNwYKK70LUhCukZijNXotBEt4nyA6xRgHyq5J04PszV49oUTOeKowmv/gfnP/z+Jxf86xraNNlkUPKuLxQBpq5Kc50QDfSwwiaOYKVojGS3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5fh7T91ZW40vbvUofnxfdRuyhsnnORmYCbrJDWPat8=;
 b=OohwWHc7ZWK7uE3xgD4ta00zT/5FJEdBQC/LXSQh5C4Zwyu+O/rw77lZGW5rPDnQ01FmoQ/lxbNHF570/fmzuqR7aaSdxG/FyFMKLLp2pYlMV10k6hCskYqvQmWXPsQXosbIn1XktCkEFp+9mdBPhlQdpBv1jaLQasUjbjW2X2Usr041Jub3fMf8spHNnO8FSmpTjDLKu7KzFj4zcqIlvqfnGBCGS6jwTEFl8KLKsbDQrut2iKyLismbco1dDd0AXz5o882yZvRDDwwMJXxDMs1brPXjDVEm+bAgY73f21tQ9s9qgRLRyLKmVuZB3ed3WWtKUgZjDTftPc7lIR2w/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5fh7T91ZW40vbvUofnxfdRuyhsnnORmYCbrJDWPat8=;
 b=h612c2fxWBkE8GVBp9xIzOhoCECePE/x6R5WCI55QaHViOtPmbdXU3WeiDOSQZoJuq7JzMAgYAzhyMgtCABp+IWbYF05K1ptgb6T19U0ThjIBkBUwcOUAc3aCZ0FVokLFMAP7o+nvx72I9VxN9a8+e8OqBD3vSYysQ/s2/HOae4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 29 May 2023 15:34:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 1/2] x86: annotate entry points with type and size
Message-ID: <ZHSp9+ouRrXFEY4R@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
 <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
X-ClientProxiedBy: LO2P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 143f69fc-1569-48c3-e2da-08db60497c74
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/A1qIgfCzGrEjr/7X0RHOupG41dBuvio1l+D1kt+IZOQxyPcjvvcAp9i+Om+deFS2cSqm3OOyGcVfPQGSdMuwnVNHNjxKYq5hLIaQ4G9VPZWKAIdefyx+gyFkZJrOo43MZPUGrc0r3+NnwvP/9FQ5omksPt3qI1d+UdW9l5o6NN8cWBsbeSIbwijPc9E7Kg1oHfTuSqXAcX07rYTt1aMbXz6+Qa1Q6xAUksFfvrw/P4QcXSaapDTqmuvcPzEBnq//vXE5LEsHtsevRsY6AMZzDpqwFIKlQ1Qk9ky5w8I2vPKgd4icfn2ROLpCDaXt5LGXfyfXesFofx4a3U6SOCXpmUbpdjR0vuNekVHbsmecPEBJEBTs4HgVn6yT7/NzcvZWHz82ZvLoZg4BIxEWjzq9fFm6+8W62KyEhKomL/lYo0l+wtWKNzAaX2e+U/ReSfWhY+2YIuR4fHtMox/pwxz+UQQKTfWPC49gd+tt6KX7NjqPFk5n2wJ0zctrY6Fr5OzAc8SSiZZlQScRF0aACQUOeIGpGimR/WDcUXK/kbgyt0dOjG7H4TMsCucQxMD7QNsDJ6E/nrEsaDzWusco655zbWgBiai3fEq2eVLCce5M6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(54906003)(478600001)(8936002)(8676002)(5660300002)(7416002)(85182001)(2906002)(33716001)(86362001)(66556008)(66946007)(66476007)(6916009)(4326008)(82960400001)(316002)(38100700002)(41300700001)(186003)(9686003)(26005)(6506007)(6512007)(6486002)(6666004)(966005)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXZBWjFJNU11d08zTGxsT2hlbGN5b2hPeFdyN0g0ZU9IVXdrcnYzS3V4SE9S?=
 =?utf-8?B?Q1ZQVUovUUtCUGtIOWJwRThnZVZQb1lXakc2VmxQOExjYnM3VXpnejZLNlYw?=
 =?utf-8?B?MEZXWWxXWVZnM3YyUE5QbzZIQ2U4WThXK1k0MC9PT0NFTGRlSnFXSEZ6TEhk?=
 =?utf-8?B?dDRNTm0wRkkvd2dTVnNjZGNwQlhWMTlBL3ltQzJpZmJSQmlmYVdsc2VlK0c0?=
 =?utf-8?B?bm1na3VEZVhhc0R4cFFUdkNaUS9KLzJySzMxU1NQeWdmVEczR3FJcGRLYmlT?=
 =?utf-8?B?eitIM2UxYi9OODQ4UkpQWEJMdktnL2MvOFdTd0NaRDFlQWpPakE3SG5saGRQ?=
 =?utf-8?B?TjAwQ0Fubm1ocHA2cGh6MGF6Qk1jaEk4SzFyVmFiMnhXL0gwcXo1ZlFiMlA2?=
 =?utf-8?B?TFh1cG1vTmhlWmw5ejdIYWp3dk9UUEU5aGFxZzRTMmRzOURXOVJsSDh6WWdM?=
 =?utf-8?B?MUM0aG5KUXpZUklSUkZyS1p3UGdhYWdub1EzSUFsSEVodnlDSXZpZDR4bEZL?=
 =?utf-8?B?OUJZWGFkNUdqbGZMNDBjK1Z5SjVNTThhZ2dQVXJIa0h0cVpYdXdsWkdLOE9W?=
 =?utf-8?B?OWJNeHFHbXdiUEFITjNGVlJnejFLZk9nRzVFRHF5QkNzRzluQitYQlRHbXIv?=
 =?utf-8?B?eURGd3ZjQndlSmM1cnJFK2RFNWdxVVAwaGZzaitIaFVVcVpOQ044SVlNVVNV?=
 =?utf-8?B?WXI0NndYaHlVUnE4UERpUnVjTXZPOWxGQjF3ekUxT2NVbEhVMkVSaGJoNVRj?=
 =?utf-8?B?MW5yQ29UcXFNQTkxNDlOdnoyRzFUcitnd0s2Wm1COENUZXkwNGlxYy9jdlF0?=
 =?utf-8?B?MGRCaTNwOC96MU55MlM4M1hhSXhvQjlpem5vMGNsWVRMamRDVHUvcExmK2Rp?=
 =?utf-8?B?U3Zlc29GK3MzZEFwZjBjc0ZxK1htSXRSSFRVWHJ4MElUQVFDZHNXekJ6MnZP?=
 =?utf-8?B?MVZoMmp1NWhhanVjQ0p2aWZGZk5sN1U5ZEpRSzE5akpxVzRZdGNQSy9ydkRX?=
 =?utf-8?B?bEJBN2hOZXVCclJRb0xrczBqRU5FY2hEb29EUTRNaWRmVDg5UnJlYkpnaElS?=
 =?utf-8?B?ODBLQVpibEk4UjZ6aU1EUDlQN2QxV09nelgvbWhaMWtEMEE1bWFmZzhjKy90?=
 =?utf-8?B?OWtYL3htQXJYVUxUbENXT21vbVhOdE9mMXd6UThqUlFtQXFNREhLSXhNZHNz?=
 =?utf-8?B?a3I1c3VZZHBvSTJYODlUWjhJTnVVOU1SdGRPcWUxL1hCVlhFS2pOa1J4clRE?=
 =?utf-8?B?cjUyL2RNM0ZwSGlxejdzWVJ0Z3RCNmpISWcweG56WVg2NmF2RTkzRll6eFlr?=
 =?utf-8?B?MjRtTWd6SnpzWFNrcWY5Nzl6STcwakRYc2dRdkJPMklBZHplTEpFWkh1aExy?=
 =?utf-8?B?dU5tM0V4SFgrcnlvc2FvYWYvMmZLT0FzT1B4MDVFNSt0WWd0L2dJNjdldzlU?=
 =?utf-8?B?ZWMyRDBDQkM4eGxidXpxTW5YNUwxakRLZ0pHYy8zM3VOdXF4R2RYS0xZbFJZ?=
 =?utf-8?B?WWJtK0ViUWk1UGNxYktPS2plMEdpUUhQWGNXcG5Vb0ZDUUVKWUxCbForMHQ5?=
 =?utf-8?B?a1dOdzRQdDdYVGZCeGsySzVENk9JcysxYWhxd3BhUG8zNnVSa2N2YUZXQUwv?=
 =?utf-8?B?YXU2L2ZQaEZtSld2TmpMSFErMzh1c2VzSDQ1akNxbGhsbHhOYytpUVMxbXJD?=
 =?utf-8?B?UFUvTXNXRi9GOXlocW9YTE9WODZXdGg4YysxQ1NyWmZ3WHVRdG4xcWw2Ty9R?=
 =?utf-8?B?R0YwelBxand5NjhSZHErVzZOY3orM2JTYjhId0VFMmZtTTdjNEVMUGpVK0ly?=
 =?utf-8?B?NytBZVZiTFRIeUhPY0pGKzNJWGJVeWd5c2Erb3VSdG5QLzFRMkRPM0JGNnUr?=
 =?utf-8?B?Rnl0V1VXM0dPNDJ4MEJUMjhQcWk0QUhvMkNxTmkwNVpGWXBTTERFcG5KT1N5?=
 =?utf-8?B?R2tIWjc3QmR3Q0Vib0NnR290a05YR3M5eHJSSENVdXB4WFF5dnA3Z05rVnhD?=
 =?utf-8?B?OUNJLzdpejJhWDZFcUtxQlRmRVZwUk5vbGdQNk9TTGRFZHN1UlRFVHhrZ2Jv?=
 =?utf-8?B?OURWS3V1NEJwV1V5LzRaYk5QQk5MOGMvSExIWkFjM0JKdTdGL1RyVGgwenZK?=
 =?utf-8?Q?kDOvsCNyQge2HaSGyLeDPyHKU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Y2xteUkrU3YzbHZFMm1vSWt5MnRsN1phc002L21DS08vemw4MEEzbFF1TFRX?=
 =?utf-8?B?UG1hbStsbmd0ekRNR3V1a1pYMXhhUzFrYW0weGVJbkE5RWFRMzhieThjU1Js?=
 =?utf-8?B?eUF4WXVHNFM1NUFtV3dVbzArSTVDVWJtVzZWQ1p2YzAzZUNjUEZabTN2RG1s?=
 =?utf-8?B?SHc2YytPd1hjM01rWlFxL2gvdjdJWHk5Ukh0M05FUE5UVWZ1Y29yZkZTTS9D?=
 =?utf-8?B?V0pEdTFkRnBkc2d5Ym41MkU1eXREN1ZSU0UveUkybFV5bGNmTGZYK0tEQ094?=
 =?utf-8?B?eldFeWVwbkpEbHdqbWVhd2ZkK3k2Qkp3dW5mOUpYbXdoMXZHK245TlQ4VUdx?=
 =?utf-8?B?ODU4S1lGZTh1ejhYdEJGNE93Y0ZNbGVaTXROMjJPaEZyNmRCbWlDbklQYlJN?=
 =?utf-8?B?elRtVU5GMkRiMGNLdUdtZ3BsN1NWL080WnV5cjhabkt6d1pTRTU5dlBpNmZk?=
 =?utf-8?B?d1ZzdGt1QzdEaGh4NGl4Rm5QeG00YW5sZExDa0Rid0JIV21OeEVtZHdvaC9E?=
 =?utf-8?B?cW1OVFViOXZ5NUZDVkdGNWswOTlTMmhkY3hqOU5IRzd3a0E4TDhiNXB0b0o1?=
 =?utf-8?B?N0RJMmRyemUzUzhOaU5yQ1ZlbURmbTlPZENScTJtdTJDdmZ4ODVHaG9rLytx?=
 =?utf-8?B?YTRxRTVQbktCa01vZUdNTGhQbm1rNWNROC9GUzQrU3I1dTZlUVZkeDhETWVR?=
 =?utf-8?B?MEtmNUp5NEQ2UmEzb05TcmM3R0FZdkg0RVVZOThGQWtKUmRCNWM1cmdBMmtL?=
 =?utf-8?B?bkZkbDRVN1c2ZHl3U0ZRb1J5cng3TXVVNVI2M3ZCUk9SM1VwVXZ4cS9Gd3N0?=
 =?utf-8?B?c1pNVEp3THR5eTZZYXE5T2FNS3hyNHBOZVp6NGtEMjZRSDNIRFdSQ0ExQTY1?=
 =?utf-8?B?NkpmK3p0WDhEdlJ6aHZlbyt6R0V3OFAxcm4vYU5BSnYyWjBFTW5HZVRjV2VU?=
 =?utf-8?B?TmZJTFN3K1RpeFo4WWhYTFZpeDBFSmNFakZ6Qkt6dE1Yc1lsK3RsRE9jZE5L?=
 =?utf-8?B?cElLazE1OXBOU0Z2UUZVNmRad2RGQTI2ZTNZNUhQZ0svdzJWbUVYUTJYVzBT?=
 =?utf-8?B?dFU1b01hSHk1eDdiY3dPbG1vQlhoNWltcXZ5OE1XZ0pzSjdUcHdyY1dMckUv?=
 =?utf-8?B?ZnlUVkRtcjNlaHBLbHE1U3BrWXBOd1U2YVVyL1B6cjhTaEhEaUc3UFpGWWxU?=
 =?utf-8?B?S01ObVlaenZudVh1aXpkeG0zb1Q3Vi9pc1VBZ0RKL0Z0VlRyeStBUmxSSUh2?=
 =?utf-8?Q?gsUQARB9OIeAUWZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143f69fc-1569-48c3-e2da-08db60497c74
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 13:34:54.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8a62VdDbJ38jB5y4XZDdB8GAN//JUnYUyEYEyCMvPxl4PUZ/JiSZ9H+LnUqJv0Ixzj8JP2gw+GXDrCgX6azGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7489

On Tue, May 23, 2023 at 01:30:51PM +0200, Jan Beulich wrote:
> Recent gas versions generate minimalistic Dwarf debug info for items
> annotated as functions and having their sizes specified [1]. "Borrow"
> Arm's END() and (remotely) derive other annotation infrastructure from
> Linux'es.
> 
> For switch_to_kernel() and restore_all_guest() so far implicit alignment
> (from being first in their respective sections) is being made explicit
> (as in: using FUNC() without 2nd argument). Whereas for
> {,compat}create_bounce_frame() and autogen_entrypoints[] alignment is
> newly arranged for.
> 
> Except for the added alignment padding (including their knock-on
> effects) no change in generated code/data.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
> ---
> v2: Full rework.
> ---
> Only two of the assembly files are being converted for now. More could
> be done right here or as follow-on in separate patches.
> 
> In principle the framework should be possible to use by other
> architectures as well. If we want this, the main questions are going to
> be:
> - What header file name? (I don't really like Linux'es linkage.h, so I'd
>   prefer e.g. asm-defns.h or asm_defns.h as we already have in x86.)
> - How much per-arch customization do we want to permit up front (i.e.
>   without knowing how much of it is going to be needed)? Initially I'd
>   expect only the default function alignment (and padding) to require
>   per-arch definitions.
> 
> Note that the FB-label in autogen_stubs() cannot be converted just yet:
> Such labels cannot be used with .type. We could further diverge from
> Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
> labels get by default anyway).
> 
> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
> still have ALIGN.

FWIW, as I'm looking into using the newly added macros in order to add
annotations suitable for live-patching, I would need to switch some of
the LABEL usages into it's own functions, as it's not possible to
livepatch a function that has labels jumped into from code paths
outside of the function.

> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -81,6 +81,45 @@ register unsigned long current_stack_poi
>  
>  #ifdef __ASSEMBLY__
>  
> +#define SYM_ALIGN(algn...) .balign algn
> +
> +#define SYM_L_GLOBAL(name) .globl name
> +#define SYM_L_WEAK(name)   .weak name

Won't this better be added when required?  I can't spot any weak
symbols in assembly ATM, and you don't introduce any _WEAK macro
variants below.

> +#define SYM_L_LOCAL(name)  /* nothing */
> +
> +#define SYM_T_FUNC         STT_FUNC
> +#define SYM_T_DATA         STT_OBJECT
> +#define SYM_T_NONE         STT_NOTYPE
> +
> +#define SYM(name, typ, linkage, algn...)          \
> +        .type name, SYM_T_ ## typ;                \
> +        SYM_L_ ## linkage(name);                  \
> +        SYM_ALIGN(algn);                          \
> +        name:
> +
> +#define END(name) .size name, . - name
> +
> +#define ARG1_(x, y...) (x)
> +#define ARG2_(x, y...) ARG1_(y)
> +
> +#define LAST__(nr) ARG ## nr ## _
> +#define LAST_(nr)  LAST__(nr)
> +#define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)

I find LAST not very descriptive, won't it better be named OPTIONAL()
or similar? (and maybe placed in lib.h?)

> +
> +#define FUNC(name, algn...) \
> +        SYM(name, FUNC, GLOBAL, LAST(16, ## algn), 0x90)

A rant, should the alignment of functions use a different padding?
(ie: ret or ud2?) In order to prevent stray jumps falling in the
padding and fall trough into the next function.  That would also
prevent the implicit fall trough used in some places.

> +#define LABEL(name, algn...) \
> +        SYM(name, NONE, GLOBAL, LAST(16, ## algn), 0x90)
> +#define DATA(name, algn...) \
> +        SYM(name, DATA, GLOBAL, LAST(0, ## algn), 0xff)
> +
> +#define FUNC_LOCAL(name, algn...) \
> +        SYM(name, FUNC, LOCAL, LAST(16, ## algn), 0x90)
> +#define LABEL_LOCAL(name, algn...) \
> +        SYM(name, NONE, LOCAL, LAST(16, ## algn), 0x90)

Is there much value in adding local labels to the symbol table?

AFAICT the main purpose of this macro is to be used to declare aligned
labels, and here avoid the ALIGN + label name pair, but could likely
drop the .type directive?

> +#define DATA_LOCAL(name, algn...) \
> +        SYM(name, DATA, LOCAL, LAST(0, ## algn), 0xff)
> +
>  #ifdef HAVE_AS_QUOTED_SYM
>  #define SUBSECTION_LBL(tag)                        \
>          .ifndef .L.tag;                            \
> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -8,10 +8,11 @@
>  #include <asm/page.h>
>  #include <asm/processor.h>
>  #include <asm/desc.h>
> +#include <xen/lib.h>

Shouldn't the inclusion of lib.h be in asm_defs.h, as that's where the
usage of count_args() resides? (I assume that's why lib.h is added
here).

>  #include <public/xen.h>
>  #include <irq_vectors.h>
>  
> -ENTRY(entry_int82)
> +FUNC(entry_int82)
>          ENDBR64
>          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
>          pushq $0
> @@ -27,9 +28,10 @@ ENTRY(entry_int82)
>  
>          mov   %rsp, %rdi
>          call  do_entry_int82
> +END(entry_int82)
>  
>  /* %rbx: struct vcpu */
> -ENTRY(compat_test_all_events)
> +FUNC(compat_test_all_events)
>          ASSERT_NOT_IN_ATOMIC
>          cli                             # tests must not race interrupts
>  /*compat_test_softirqs:*/
> @@ -66,24 +68,21 @@ compat_test_guest_events:
>          call  compat_create_bounce_frame
>          jmp   compat_test_all_events
>  
> -        ALIGN
>  /* %rbx: struct vcpu */
> -compat_process_softirqs:
> +LABEL_LOCAL(compat_process_softirqs)

Shouldn't this be a local function rather than a local label?  It's
fully isolated.  I guess it would create issues with
compat_process_trap, as we would then require a jump from the
preceding compat_process_nmi.

>          sti
>          call  do_softirq
>          jmp   compat_test_all_events
>  
> -        ALIGN
>  /* %rbx: struct vcpu, %rdx: struct trap_bounce */
> -.Lcompat_process_trapbounce:
> +LABEL_LOCAL(.Lcompat_process_trapbounce)

It's my understanding that here the '.L' prefix is pointless, since
LABEL_LOCAL() will forcefully create a symbol for the label due to the
usage of .type?

Thanks, Roger.

