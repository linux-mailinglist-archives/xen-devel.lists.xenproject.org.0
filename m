Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3A6A2161
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501407.773133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVciq-0005NI-0c; Fri, 24 Feb 2023 18:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501407.773133; Fri, 24 Feb 2023 18:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVcip-0005Ki-Tz; Fri, 24 Feb 2023 18:23:07 +0000
Received: by outflank-mailman (input) for mailman id 501407;
 Fri, 24 Feb 2023 18:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVcio-0005Kc-SK
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:23:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46b72825-b470-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:23:05 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 13:23:02 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6269.namprd03.prod.outlook.com (2603:10b6:a03:304::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 18:23:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 18:23:00 +0000
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
X-Inumbo-ID: 46b72825-b470-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677262985;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lQks1ken6pnYzR+AaHEvkr0po9hqHuWv4gZOW9pA3jc=;
  b=eFo72SpkPf/9ZDUPMmy7CUXCjnojId7lBf0iir8rgdjE6dNubyXnQIP4
   xqxOO/7H9UMjtP1qciph4mHOfi121e2stYN9UPO8BEb1iNtNZfzZYZDvf
   ZpldGotwt65QfbDbdxhWFhn5NO/nrYt7WyAATLvHHe2SUxRWdHdQfhX5G
   0=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 98361465
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iVHjz69NHnQrPaLTliaODrUDtn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2QbX2yFOquCa2Pxet8iaoq/oEgPsJDVn9YyHgI9pSg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklk3
 qcnNBJXRCuFxPCzw5G0CfBgq+IKeZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUui9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdJJSuTkqKMCbFu7yWVQEi09Wn6Hh9Klu1W9AOBgB
 HYd9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMQ/XzAt2
 3eClsnlAjEpu7qQIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyLzflTrKR9dnVaKw0Nv8HGipx
 yjQ9XdlwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:vdPq2K4FQs8rkalErAPXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98361465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpFJjZsJlVn252KHxjGED70+UYUoYujtyiAzb7kxyeFQWD3yHKusJXtb+Z5bO0G4XwNRM+MYN2FUK0AmJU8bpHVVi/LnGrvWxcKX+jTLiPXEVJNkW3IQWCP5QNLEWQNzXj7BqohJ+V3gXiBmx40mfKAXVuiaSiF80GpxpCnjUweCudVzm7TtiFwjqIXVpKcXj2ZgPaR7vA9fQPuqbLIT+pykdZpESPAJDjkdG/HazstVJBE7PO6UTjBh2Cd8Eo4/QzNtdOLKpb7l8WR6X0LAwO2Prz+4b+SUVkp7qUvCeggV9VZhcGehj7JHCL1rFvm5jb8RIY6yYzbuFw5Ae03PpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVu5tVFhfS4KWENS5o27ClQFN70qQ4D0sbmH7KiiZqY=;
 b=VmMJnh2STBi3s38iJoRnbnJCWAi1qZoREiFC1ncuGWhSJxHPOW/SkCkL24oDHiqgGqQ1aRFuglqz8mNavc1uW8m8WTBqKilRRO/j6/OlH0yDdHw3QLZrIpprXojfdfu7xXLRbUg/LyjxlN8dJOdfSd75eCKN/EvHPhvFSXvP0slPegUgjfCd0qHInG9NSM5Vzta9b7UY3fxQiVFM1Mfee067zEgThA7CGRMtlv3bh29DFnsAzkv9ZQNYzZegu9q86NmlqsRPpPCr+8dUZbxs1BQs1/7PokPzG9ez1ztXzFZ1KfeX7jq6FfrlEd4x3p6AGxxDybxLZyE0A+oBm5165Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVu5tVFhfS4KWENS5o27ClQFN70qQ4D0sbmH7KiiZqY=;
 b=bbrgwiJU84mNxhhhfUo5kkAYHwRopgts0vY01vWPnKBWRXRnBGH0fXStVg2dj9S0SfUPeHYXZybOajS9cbNPGqdyaZVG589E0ijWuEQCXQULupBmhLhnByT9jlMNyeWKx1ZCEycMG+kaHWNwi3u3jTP3UQ1DZCpf4KmkHkd77vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ff81c19c-49c8-f3e9-f120-eef0f177a5cc@citrix.com>
Date: Fri, 24 Feb 2023 18:22:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3 0/4] automation: Update containers to allow HTTPS
 access to xenbits
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
 <c8c99704-ee97-596e-d964-8071fb2b3f1c@citrix.com> <Y/j+DHlj0jJF1Npj@perard>
In-Reply-To: <Y/j+DHlj0jJF1Npj@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e61543-0d23-4aa8-16aa-08db169428ce
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VihC3P+EdceucoV2MW2bRPrNN3QWeuiqPi/wW0OXwx9uMr5CcKpNFQq1IoQhTJhSq/fHHIrkwDEN3F2QIjAK1uxtpi3VsmzOECz1uJb33s0knlxZ0wY3nJ0JfjlQpwD3o099fM8PvQ7WtIYXPT+Ibxzr6CisYwI4yYgwu1Yq1rgx7SkpBPbIo4rQ1M02eWXl+JvYjwRdvUY7r+NdivjripCDH8u4k4x14ZxXp6x83uCCtRO7rcB1m2CvD0/aVajGBVvKrnlwzLr/4AvNjLk+gKKCU5yrnPdBXTNa3jHi7rcvFmJRy/FfsduSq1wJYog5qYgf1HI6QN+80XNHCyBpYH7gQBpYpQEasioNlta9D/bnDAPyj4KDtdduh/WwsdG18xIGtDWYB3+2Pcp4jY1wmgVoiJIt8gSE2S4q/h9UWWz54mjuK2x+x9AWbZgrAhe1TYz95KUieDVutNbQ1zp6aHETTRrG5Dq4dgEKoeuFDdGs63KzsVjD8+wcZyvBUaCmZgFWyAswoq+B4aTRc1NJgW/cL15x/ada/ymS6ebDc+Glq4RHnQiQoesnZTXGkyQbFweuEMcldR0M22KNV2fumC9GXDpj9000IM+d7GAGgJapU8HdyvywHebFLUGWlxcDfiF27fq4Nw+wRIvaB93erAaEEfjOb76SK5yXE5lOzsqxWcRNPpnlvAxJt22XOVURpbBehE2yeQ7r1p9RPUTyIp7WJPADFmC2xQl8RqD2Wh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199018)(186003)(53546011)(26005)(2616005)(66574015)(478600001)(966005)(6486002)(8676002)(4326008)(83380400001)(54906003)(6636002)(66556008)(66946007)(66476007)(6666004)(6506007)(6512007)(316002)(37006003)(31686004)(41300700001)(8936002)(6862004)(5660300002)(82960400001)(2906002)(38100700002)(15650500001)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ry94cVN0eE5VYUdvendmUjlpaGdzOXhIWWxXU3RKWEUrM0Y3dXpRbWUrWnJm?=
 =?utf-8?B?cUgyUUhWZFRoT0lVd0luaGFydUh3OGNGcHFhN0RLL2V2b0ZmYnFKa2crSmto?=
 =?utf-8?B?aWJEaUtyejMxZVZoc2RaekpUYVhRR3R4anRXaFBxY2Z0Y0t6QUdTMmovSUR6?=
 =?utf-8?B?SFRub0p6MEtTM2NMWVNrT0o0dFhmdlJLdjZMR3laL090WE81WFQ3VmtkMjM3?=
 =?utf-8?B?Zm5XNThnMDJnZ2Zoa3BKbDdtV1V5UnBpbnp4MlBmeWxTSTV1OFBGaHIyNWVJ?=
 =?utf-8?B?ZkRMRmtTSDczbU9PWXZ4c2FsWks2Z0lmQjdSUlJpVmJsdnJPTG9pRlk5VFEz?=
 =?utf-8?B?R2xvU01GbyszejFuYm0yS2ZRQk1lSVdvQ1U1a3JIRzVOK3UxN20vUzFOSDVW?=
 =?utf-8?B?eHI5STB0bTRnWXZNWkdvVGpxRi9lSkJvUE13L1NCR3VCeG9WWTdDVVJqaSt1?=
 =?utf-8?B?Wk1XdHdwNGFhYVQveWoweEdWVm1JWDlVQ1NhdzZNNEdSMFlUcWoxZDRlSml2?=
 =?utf-8?B?ZlVVODVCalIxd285T0ZBaEdIUDE2SGVZakJEQm0yMk5teDZvcHlIenVKUW1U?=
 =?utf-8?B?YmQwR0lXS0d1WC80NGFTVXFIdlFYV2VoZXBZamZZTUZmckltaFA0dnlOYWNj?=
 =?utf-8?B?aGVyVmQyQ0hnNVBnMVdRQVk5MnphbGgxVHZWdWFrTHZSU2U1NUg2RWtHVzFF?=
 =?utf-8?B?Q3lDbEdNdWxCWGxRQ29rZHJicTJkNU45ajUxOEkzMWVjZ1h3NW82WXd6TWVD?=
 =?utf-8?B?S0NCNXpsZ0pTYzhMMU4rRDNtWUwyMWRkS25IdWtyNnNKRHVWTXBjTDVNdjIz?=
 =?utf-8?B?Zm9LOU9QRW9hL0ZFaXFMVjdiR1NaZU5nTmpkS3k3MmN6U2Q4dFcvMFVEaXB1?=
 =?utf-8?B?UjZaQ3RFRmN6QXRKNDgzV3RUTG9VK2RjQkgzcHh2TGVNdzdXa01xNVFJMVEr?=
 =?utf-8?B?N3B6Ums4R3U5Tm9EV2lQWjhmZlhmbnhzL1E4MW1Qalh1bmpiTWJ0NGsxc3RL?=
 =?utf-8?B?b0diT244T3lWeDJPMWR5bFpJUXpaQXNnYmRCempUL1M5MTA1UEhXRVM2eGJO?=
 =?utf-8?B?N2dTRjY3SzBLbWRtYzl3L1p0TmN6SG90b1lWVW02M2RBdEtuTTJhYzAzTkx6?=
 =?utf-8?B?ZW5BcFdLb0VpM09ibWU1RDBvRUtRVCthUUdwTTBrcUttS3lVaTQxZ2ZmcEZX?=
 =?utf-8?B?RHlKQXlTdS9nYXdaMkxwZGJlZVFQUDdUVlYzc2Q0b04wM0Zoc2J0MXNTYndm?=
 =?utf-8?B?TUVBaTRTaFdab1N4Vkx5Szh3cFZCZnJ0MzVocUZRK3ZnR3pXdmRmZUZYT0pF?=
 =?utf-8?B?ZkpWTkxXSnhkZnRVaDhrV205OGFXMjNsY1NVOU5JeFhZb3IzOGlpcW9xMFdP?=
 =?utf-8?B?RVY4dzdlSHlYQ3NJdlNSMkQybVA1KzNPV1p3YWd2aFNBSEUrd2xYanY5TFF3?=
 =?utf-8?B?Q1JENU03R1JtUlg1YUFham1GRG5kdzhFU1p1MFVoTHQ2dWZGUkJyRURtRjlv?=
 =?utf-8?B?UTBwb042TXdWOFhCMCsyUHo5cG9lYjZlRVVzWjl6RDEzZ3UvTHp4UllJWmZL?=
 =?utf-8?B?U0w0ZjlqalkwMmtZMFNTS3E5T3FaRU5ucERaOVFXNW5ZVVExYy9odm5WeElH?=
 =?utf-8?B?QzRlQ1ljckd1V0ZjSUVRc2VmNC9QWUVxMzNRbStUenh0SnJrd2FwMURnd3V2?=
 =?utf-8?B?Tnh4OE42dDNobTBMTFllbmE2S05mYjNOQ1N5SG5nRGVNc0kzVXgxc0kxMGIw?=
 =?utf-8?B?SSt6VUZsNzNaM2RmY2NGcVZDMm5hRTFKbEQrSUt3dnE5UnpIWFlINk8wd3pU?=
 =?utf-8?B?R2VSckRoMHRwcWtadFAvY2RpVCs1RWRKTTU5Nlh5U0xydERHeTl6dkowZ0Vz?=
 =?utf-8?B?SGVSWWhxdGFjVG1nT3FEUHdrNXF3SVZUMjlGQzR5Z0JDY0lXQTcxMEJBWkpn?=
 =?utf-8?B?S1JhZVM0MllxSTduV0liVy9KdXpSUjdVRllMUk5yTnJQZENodzNSaTk4ZnBO?=
 =?utf-8?B?Z0l6Q3I4elJyMDI2aGJVOVRoVGtNWmJHSlJpK3R5eXdnT3UyL2RBL1Y5aEY5?=
 =?utf-8?B?NUNVMXdVRDZ3TU5nWFJZcFNib3dtOHE2cjdwUmJxT210ZFY5blc0ZlpDa3du?=
 =?utf-8?B?Y1FYRjhJV2s0OG5vV1Z2Nms0U05LbGpiNkJsWXZKa01mTXh6cjhuaWJ2Y0tN?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Z/JmNuOBsFMTgEzs65unZIXqEP4Wz1mNquC97/6b4oGzRRDlKGFU52902vHSDWmOoS5fUdn/dr2IkXl2YWgdSdr5ZdSxWeUuI09UlVu1EWinlKNkdFCXIToI0YEw+rrQW6ZOPJc6w1KYgcd/mUAkcV7ESVTYPwJEJuqIZ3mingEzgGUCxZ6tq2HxL218EsqH+nZiumwH/9rjMuk6/TFAu1GxZoP/eWxJQtmTvzhxmvuIzAkYtEJCnp78n1N+2A8kX+AQmoAkhSMigqh7u0DnhSOmnRSUATf9JVvGrZByytwTX4y24Nc0hchP+gaYn+nXrzM4ivcdAxTmhL1eyWQumls3tU06lpPsyIFAQZEUzIKb4YpkRmmGv/vIb4PxJNEa7pi1DZOWfyXhBBUkKrlOWIKryvyKtQZypjsnQlFPYrfq+rRtVo26w6zN7qTLnmeq+nL31GFOnRxTLWhVfnRMKmjS+gLtA76vKFAv+b8K3vM5/X8TA5ubsPPR+sQAA8jhhd/V4jijYjMcmTAW3rkLOA97equELtgHrcTDA6+Clr2+1qlPvMSddnsK0t0BKSsNhaTzJliP3SsFzo/gTBftKpd4Jla2Y1xXlJdg9lpO+ShTtLqxHSP16f/w1hVw7SbEsG2ADwq6Z1N2VidAbWQqkDSE0xWQSvgYNIek2HvGCArsbCw+xwV724XI4ThYnWpNHwDX2SLs8zU7Wb2CYs9r319xSfNTcCNZJRiap31nkWJ4j7d2uMCluF5LIgRX4JfVpem1/byEsRfUMEkfmX8yYIkWS9ko8+Moh50DnkAObCZxCZTdvjEoJyels4CFJkOJN4tdEdbxhrZDWPlrR/w+g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e61543-0d23-4aa8-16aa-08db169428ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:23:00.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz5X7aBQDrhXo9aDsktn6MHhgw7JfRxXLTHCe8UXkHJRw6RP9i1iIGnnpt5IOoNj7gaN86SlWA1GnDns+SMaBlYGsoCqn282kcD1rZn8tIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6269

On 24/02/2023 6:12 pm, Anthony PERARD wrote:
> On Fri, Feb 24, 2023 at 05:37:44PM +0000, Andrew Cooper wrote:
>> On 24/02/2023 5:29 pm, Anthony PERARD wrote:
>>> Patch series available in this git branch:
>>> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-update-v3
>>>
>>> v3:
>>> - new patch which remove non-debug x86_32 builds
>>> - don't fix root certificates in jessie containers as those won't be used
>>>   anymore on the main branch.
>>>
>>> v2:
>>> - Remove CentOS 7.2
>>> - Remove Debian Jessie test, but update container recipe for the benefit of
>>>   older branches.
>>> - Fix CentOS 7 containner recipe to update all packages. (Fix missing update of
>>>   HTTPS root certificates)
>>>
>>> There is work in progress [1] to update urls in our repo to use https, but
>>> those https urls to xenbits don't work in our containers, due to an expired
>>> root certificate. So we need to update those containers.
>>>
>>> This series update the dockerfile where just rebuilding the container isn't enough.
>> LGTM.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I'll add this to my commit sweep, and rebuild the remaining containers.
>>
>> But on that note, I noticed that the debian unstable container was 2.3G
>> when I last rebuilt it.  Which I think is obscenely large for what we're
>> doing.
>>
>> Can we see about switching to slim/tiny container bases?
> I don't think that would help much, the non-slim container is only 116MB
> vs 74.6MB

That's 64% smaller to start with...

>  for the slim (amd64 containers). But maybe we could try to use
> "--no-install-recommends", that might save a few bytes in our containers.

Oh wow - yeah.  For buster-gcc-ibt (which is already slim), we're getting:

Suggested packages:
  binutils-doc bison-doc bzip2-doc cpp-doc gcc-8-locales dbus-user-session
  libpam-systemd pinentry-gnome3 tor debian-keyring flex-doc g++-multilib
  g++-8-multilib gcc-8-doc libstdc++6-8-dbg autoconf automake libtool gdb
  gcc-doc libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan5-dbg
  liblsan0-dbg libtsan0-dbg libubsan1-dbg libmpx2-dbg libquadmath0-dbg
  parcimonie xloadimage scdaemon glibc-doc sensible-utils git bzr gdbm-l10n
  gmp-doc libgmp10-doc libmpfr-doc libsasl2-modules-gssapi-mit
  | libsasl2-modules-gssapi-heimdal libsasl2-modules-ldap
libsasl2-modules-otp
  libsasl2-modules-sql libstdc++-8-doc m4-doc make-doc man-browser ed
  diffutils-doc perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl libb-debug-perl liblocale-codes-perl
  pinentry-doc readline-doc


which is a whole bunch of junk we absolutely do not need.

~Andrew

