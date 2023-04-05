Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92F6D7899
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518368.804831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzdL-0004XA-2T; Wed, 05 Apr 2023 09:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518368.804831; Wed, 05 Apr 2023 09:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzdK-0004Ud-Vg; Wed, 05 Apr 2023 09:40:50 +0000
Received: by outflank-mailman (input) for mailman id 518368;
 Wed, 05 Apr 2023 09:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gxas=74=citrix.com=prvs=452091250=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjzdJ-0004UV-IC
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 09:40:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef39a336-d395-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 11:40:44 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 05:40:37 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5195.namprd03.prod.outlook.com (2603:10b6:5:240::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 09:40:35 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Wed, 5 Apr 2023
 09:40:35 +0000
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
X-Inumbo-ID: ef39a336-d395-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680687644;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Lg5WL66Cxisvq0Y7xWdHEEoEbUlpjZjugaRK5I+aV/k=;
  b=hzZI/J3q3O12f8xcSWtw6wP7yYjuajU2TL1C36IQlBWYj0ApKnE/j69i
   40Rw7iuPNZJi2xFcHqiIkAkikJqalhGzDnXiZkUnpVOoDW48VhOMmabMj
   NsZE77uTi2A/Dw7+2ioefaaQLhzxJB1Aw5d36S9MUrkrowiCHKDQB0Ozq
   U=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 106819497
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H+DvbKLWOGC0tkDYFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS12dUy
 2oYWWrQb/iDNzb9eNsibo6yoUoBuZbQzd9qSgFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lCEBN0
 dwoBgkLSR6Km/CuzOuJVNdj05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02L+WzH+qB+r+EpWi5r1U2QK86FAdCVoMWlWXsOWEkESXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHaSpaSwIAuoPnuNtq0UuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:FhMQ0KvYb5F/RrTRic1Vj8cN7skCM4Mji2hC6mlwRA09TyX4rb
 HaoB1/73SbtN9/YhEdcK+7SdW9qB/nlKKdgrNhTotKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyOMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrYHGfhmN9dOQE/F
 733Ls2m9JkE05nH/hTfUN1O9TrlpnwjZf7ZhxDLwc/gTP+9A+A2frBCh2F2RVbeC9OxLpKyx
 m5ryXJop+7tu29yFv632vehq4m/+fJ+594HcmRjcpQDCvqhh3AXvUGZ5Sy+Aotpf2p6hIRsP
 SkmWZZA+1Dr0nJe32zo1/W1xL+3C0I43vvoGXo+kfLkIjCXTcnDMgEuo5DaBve7CMbzatB7J
 4=
X-IronPort-AV: E=Sophos;i="5.98,319,1673931600"; 
   d="scan'208";a="106819497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nilq3Neu6MV/8GAvmrJwQYMu+/2UeiiSQi3Daacq+/5pk1yK9xekFlIkzXbZTuzpjWm4ohTrCJgwqBRONqpvwj2lmF3xS8+x7oIp0fFGDadxkjkAmMpsLBX6DuqjeYLJeCq7sZbRDqeZIfqhN2yrpHqOXaizo3TGITM/xeRxuEFfi5+Em4lEp6aS6cDY9J/zbhnK/RxLbt6f2z/imrmeuVRPNSFUBufFDI2UMfFjSjej1iheHKH0QpZV3ATzza69a0g9NuCN9olfckYMfWQAaSc1MX3xl43DYL2NWOSUF12CI8xfp4oDoaCLDlzAb5Bd9drgOP4uZhfw2UTryLCwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glMDDIPA9Olrwj9DPq4D9sJNv7NzFuBiUuVcNTR6e80=;
 b=APKEV0hloO0/ehkM0yydxWyZdBS+QvvdnL6iHYP8vXWku+zvdchmif1zYz99lMIsiDAXSlECG1fA5FjTIxkpGO8vQaVOjj31r3CeF4SD4DnnQAyx5FD1PxsHzF8K/HBuX4FT/+oY0TP2Tr4osTutSumrYRtDQpEJLw7LBTFF+yg2uO0YoHcudW7jxuc1PcH9+VGybBVVe+PoXDfYG15mWSjr+f0TMtMHZIk25aeP3ClflNplHctoTAgUqiHMpRCopYQmy0rhWBn5Y7mUVZhO+EbgFu3qYd+4D9noJQMSysuCqw7zvENDsgsxuXvfYFh+2ix+G2+fb7fVsH4RBEqaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glMDDIPA9Olrwj9DPq4D9sJNv7NzFuBiUuVcNTR6e80=;
 b=DAeIalqQ6ha+6gwIGfD50S7a1himneV20yKWHCZv4lfL+GcfOfEVuoYDZvrf6wyBZ9fac0lBaegc+WA9uNS8W678iO7lczAu9yuAIEN9EYrUYWl8iSSgdQP2S7CA9+w90GoLS0FJK+I2v3HtYAZmp2S3T+5RvKZuqdHY5DlK1WM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Apr 2023 11:40:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZC1CDs2Rei5OTE6d@Air-de-Roger>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
 <ZCwM1SfCAfh2koBD@Air-de-Roger>
 <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
 <ZCxI18gb8zK5X+nR@Air-de-Roger>
 <ZCxSooPqPwpGW6yv@Air-de-Roger>
 <5cda250b-57b4-2833-99d3-84ae8ca32059@suse.com>
 <ZC04cu9sXVeephOf@Air-de-Roger>
 <83cc6b93-6a50-1eed-1588-20b3bc38c318@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83cc6b93-6a50-1eed-1588-20b3bc38c318@suse.com>
X-ClientProxiedBy: LO4P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 0172ef3d-80a3-4e2f-22dd-08db35b9ceab
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fTS6iAqLmtDEj67Qeq20fxoEeHNKcAMTGEpv97NE+A7xkpbIs9B8k3jZ5p7cecJ6qXMIOpRAgJKv9ZznIUjtBVbs9Gov5IFTgz0XAA0puPsvPE+MqX+P8GPp6HLQ+GeyQ2i71ITwmt2gxrWnC32vARGSo9y5GDnRqJ3at0IiZ6ZLu7YLqdpdffzdvLmXTBMcyFRKZu7sxfYVBmh3FZMNM9VhlQy8xcMTUq/pHCDpxoioQFhjfVe5HfbEI3i5U4guHbiK+n71GG5TZdaR6MR4kRuNXSjkhmriXZOGswOsXUyvPCNwfN5njoPieOi9m3hBQZFnGnOBx1nJtpdRqDEoFqAhWtEAJuvuKPpoINgGFqZ2Nv0K0ohTzHz0pahMZ+Xsz+r2RQopfiL779QRv2ihkUb87HxHaQ9M567dLSs0UO1slDSASKfnen0D3bqCusDAu9/0iAny3j2PV7qaVLlGdTBdSbHVXIa9H0ZqOkIHJAqJ6uvUBRksJ0aSbNS3RdVGRJWHGJIpU+Lub1K8/tnzNX7DjG90XlV6LuUtte1lQ7Bgd443rU4zhkQHXbgQcqfi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199021)(4326008)(6486002)(5660300002)(82960400001)(478600001)(85182001)(6916009)(8676002)(66476007)(86362001)(66556008)(38100700002)(41300700001)(316002)(54906003)(33716001)(8936002)(4744005)(186003)(66946007)(6506007)(9686003)(6512007)(26005)(53546011)(2906002)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bENDcHVVYVFLdERmbFdUVzA5dTY5UFo1MWIxM3NVYWxGM1lkTllKaWM3YUtJ?=
 =?utf-8?B?MzdwYlp1dVBZTVJQT2VuZHp1dmF6QjI2aFJLWVNkV2R4cEVmK2lBMkN5RVls?=
 =?utf-8?B?dE41VTFxcXE2dWxickFiQTEyVUZPTUVlL2dTRzdiMUx5VTlWaC9OT3d5TU1G?=
 =?utf-8?B?UDZMODFQYU0zeEVrMUVWdzloWE8wWmZabm83TndITnBYck1adTBlb3N3NUhq?=
 =?utf-8?B?bk5tUXBmcTlXOXA2K2lBTzJnSGRTc0JLTE45VnpzeGNML0Q2a1Z4bm8yaDUz?=
 =?utf-8?B?L21UZFRXM3M3blJvQ3NENjl3bWY4STVVMFl5SjhQc2x2azk2bEJIT3dpNHk3?=
 =?utf-8?B?QlgycUxrTEFOUnB4cXlScG5YS1BkYUtSaEFPMmF6c2dPMVFnQTZTdGRVbU9h?=
 =?utf-8?B?bTZnb3pWOXgyMmpnTnQwaVhTNzVMT3JuZFlzVVZCbURqVWJRc3JXNytCeHRO?=
 =?utf-8?B?WFdvKzFWV2hnSnN2SmdyR1pqU1ZHOG84Z1Flb0Q4Z0VxOXplUmVlY1lzN1JV?=
 =?utf-8?B?TkpQb1RrOHMxMmhkV0NzRE84UGt4Z2pTcmxNai9UVHl2Z3QzeHBPNUdDenNC?=
 =?utf-8?B?QmZBeWI5WXFYdWNjdFZoMGx3K1RVSzlVQVY0RzBLNXcweUFLQ1huYkE1eFBI?=
 =?utf-8?B?L1ZSc0FlMWFVTnVSVkwyL0FNK0dkRmhDUHJac1dtRTRya2dyRUpjd0E2ZFFE?=
 =?utf-8?B?NkNhR0RlMXNnOS81OFE2R2JEV1F1eUdZeWdEWHd4N1ZQT3JJdkVTSEZtT0xw?=
 =?utf-8?B?Q0N3enhHcE9lMFowQVJCZDhIYmh3NFlkUnk4a3k5Yi9UTHlkenFyZUMrZjJG?=
 =?utf-8?B?VVBIZGxrVnl0UHlXWGtNekF4ZG80RG56UVZPbVNVWWRsQTFLMmpZNnJYMjBs?=
 =?utf-8?B?MGh5Q0JUME9RWXVUQ0F4cVJ3WE5yZm94UUt4ejJXU1FqNEpFZ21qZFR1OC9K?=
 =?utf-8?B?cFJBZEdvNnRGL3RXRllBWkZwNVV3eFJhZGJWbHlLMmJMTFFzUy91bEJQTGYz?=
 =?utf-8?B?elc4UUxtalI2M0NCc0w3UmMwcDcxYko5VngrZlF1TW1PaE9YaXI4eWcxeHds?=
 =?utf-8?B?ZElxZTA3SldpMy9uMnBrNXFzeXFPZHVHdE01alJvVUhMbTNIMlIvNWlqR2Yw?=
 =?utf-8?B?eEFjb1hMLzF1VGU1b2VvZmVScWxxMFFzVVdWaCtod3YvM2ZjbVMrNWdMQUx0?=
 =?utf-8?B?NnZmczllQUFIWk80YktST20xbWIyRzhZaER0ZjNIRURURHBmd0tsSXF0YXJN?=
 =?utf-8?B?R1UrYXZ0M3ZZL3BsclNvVk1CM3dFTW5HZ1hrWkVwM3lIWlc3dVI4aCtaajZz?=
 =?utf-8?B?Q2pvNCtvbTBwYmFjNU9WTHpSbUlaQml6c2Z5WHZDeXZxczBORjZYT0MvUzdG?=
 =?utf-8?B?bmRoY0hSU2RqS3NIbENsZWRZZzBMNHlYMC83Lyt1UUR2c2J4Y2xaOHRqUmVj?=
 =?utf-8?B?TVV0ZjlVMjkxakxGVmYvZnRLZ08vV1V4YXZESW5ScDFEOTJlUzJyZFEvaW43?=
 =?utf-8?B?clhNb0FqcXdrSVdPZysrY2orcHJkRnVMbHhRYTJ1dkJRSVdZdkpQMytzZkFL?=
 =?utf-8?B?dFVjQldGR2ZEVUEwNzNGZlZUR0p5OG9nOHNMdzRFSjdXQng1NnN2UnhEa1Ew?=
 =?utf-8?B?YVBNTVdHaEp0aVNkbEFHRjZtRmFwWFljcWhLMmx4Nk1rNjloZVViRm1rUU56?=
 =?utf-8?B?Rnp5U1c3cE9DWElkNGVwMGVyaERTY29DVDVrM25JUk03cUJRN2hMb3NlZkJB?=
 =?utf-8?B?VGpQM2FlZmtzbVU1a1ovcm81amNjUDFHQUhTUEFCREdKajdJbTVkLzlPV01K?=
 =?utf-8?B?WC8zMXU5cTkwQ29jbW1pUjFZalFTY0hnUEI3dUNsY0dKWjJtMVhZMjA2NDhN?=
 =?utf-8?B?T1hZMlBwMnVIUUxsMzFndHR0NUZyeXIwdmtCbXVJRC90Y2Nsd3NMZEtXL0Qr?=
 =?utf-8?B?c2docmllNmg0RTN6UGc4WEtEMFlPQjJQL3g0K2hSUGxpeWpITmFwR0pPTnh3?=
 =?utf-8?B?M3pzK3duVE0zbWhHMjFkVDkwSCtXMlFaWkVQN3pxVVZES05VVFFhNmVxU3ZT?=
 =?utf-8?B?dW9panpuSFIyOU5XNlBNeXJCVDRmbHU5d3gwV08vbDZYZVV4MG4vd1NpQS9M?=
 =?utf-8?B?bGhMTzhLdXVYa1FLYStXRzZUNmtvaE5RUlB6TXJmN1ZnZVFGS3Rpb2xQNXJp?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4rj4joOK95djKLYXW4ilqscTjL3Dfx6UOafqjbpDVPhNNIsWOf3bDxPE4tjPfQJ7lXDwiZ4nD89SulXlPavea0hjSSkWzTqHYs1t/9S2wUclNqju7wDnVtaM84/gRJ1BrgojPHQONfNUeNzp2PcOessR/2x9rGhrZALV938aNQ6GylOZLwkgEFBB/eILkdrZZ8DTaLUsntIFeTGcS2020o0fRzCxcvhkS0OZyZo93NFBtPZC8g3tX0Wjqq5F8EimhxT1ogwL02YGLlAe0lpS7H3vVQmXqlRKElv63Uj5H7x0rIGXAfawYB9JJwbU4YozLkIakHZIVP3DW1FdOeMYV6tLEtmcCukkir22R+wmjk33woTfApAJyfhd/F1h+baf1W/Sts/ge6FY/Bh52aby1u3mkcwArru6SGICLLziGeLzWkNGRYmVMju8csGMS0s1HpCTRTYT6ropuC9yrW36PuWJHBemWKWN19c8/7w3vUydbHOzTmKRF5Hj+an5mIjo/17Q0MUou/UXNxKnm/QM2MFQ0DjntGYSlsE/w9nS02efzyQlgd/ek63K7BStZqxwHngK0AGK14F+3KtrySPj2fJg362axzG8vbJMpUfHde9M30Pkt+7iI95JQ9yhmoHwWX38XdGmau5hWXk477J4PwtKnqBO1NNspDuJusn/HnUosUpvzXxACmqerD+69xZCjgUOqC40q8wIb0yUM8fLXX8YsYRZypsLSM1BXFJqR7o0jniiTjADt5K3C6vCMm8+soNBfJHC2i1V+cVSwd3TKlvddUds4XbNXTLPJhx9whNu7r4eOh8+GlNiqV6vdRbY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0172ef3d-80a3-4e2f-22dd-08db35b9ceab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 09:40:35.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnKwD9Kayq0djQDEgPywh6RZLNE0F7G5BNYYAU1PRK7lX7dAKY0oUxaEt0L6PHmyrw/Fq/Y4K/XYc0aj7Z8DJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5195

On Wed, Apr 05, 2023 at 11:29:51AM +0200, Jan Beulich wrote:
> On 05.04.2023 10:59, Roger Pau Monné wrote:
> > We should likely move the setting of vm_assist to the domain create
> > hypercall, instead of doing it at vCPU initialization.
> 
> Perhaps, the more that setting the assist is limited to vCPU 0 init.
> Which in a way makes sense when considering domain creation, but it
> is odd for the case of vCPU 0 being brought down, reset, and then
> re-initialized; IOW I think arch_set_info_guest() should further
> have constrained the setting by a !d->creation_finished check.

Maybe, but still the right fix IMO would be to move this into
domain_create.  We could add the !d->creation_finished check but that
feels more like a bodge than a proper solution.

Restoring the previous check is better than nothing, but it would be
nice if long term we could get rid of the vpcu related conditions.

Thanks, Roger.

