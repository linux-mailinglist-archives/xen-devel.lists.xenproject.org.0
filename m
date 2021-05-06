Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67CF3758B4
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 18:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123656.233284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lehBo-0000v4-02; Thu, 06 May 2021 16:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123656.233284; Thu, 06 May 2021 16:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lehBn-0000sU-TF; Thu, 06 May 2021 16:49:27 +0000
Received: by outflank-mailman (input) for mailman id 123656;
 Thu, 06 May 2021 16:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YkD6=KB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lehBm-0000sO-Gv
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 16:49:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a6dfc79-5257-4f67-9a65-f856308390e4;
 Thu, 06 May 2021 16:49:25 +0000 (UTC)
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
X-Inumbo-ID: 9a6dfc79-5257-4f67-9a65-f856308390e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620319764;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MNmEysxKi1C8vLv+oGi3bIL1QdN9QGF6+tqFhukZcLg=;
  b=GXAicGKVtJMZ/IGGCRlJWY2BbpcwwqO4mewaaJwmI2kZPVihBpaRSDq3
   GEwvuoveQUHF/SF7/deR4jXNFTOMF7EhBlgPp4V90FrvvP4iJR2uKFHAs
   /zHO16JUzlkD4Wk4RxxOG7JlX7VINwNoDafyq4yfdQUhqVscvkq/U4MKg
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q1Kh7AZqKddfJKQ8PxL5eifappJWea3o4KrEF/4c/HLAQXHrksWJ4GGGri8SZZBC9Dzvb5TFGt
 V4DsEd5f7IELu8Mzaxs9ISHMtctGvlBcZRxmH8cEEujRg1MidZEWFOlF6BZ8gSoWU7cJcjnfZx
 8LGZubgYWqopOkAPhiuviVR1QDeaChGCqaGKeszi0WStEcStMKzCKRaIoD9LB1GTMImZPFjek4
 mPSvaciB0pcAe4cBBNmeh1RWrBJj+JEj4JOZDL4Y4nKAnB8bmgdHMwRWSRLstegPAoPfNoL8XM
 BK4=
X-SBRS: 5.1
X-MesageID: 43345083
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ccxmv672LRCYgpCN0gPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.82,278,1613451600"; 
   d="scan'208";a="43345083"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0J+OrFYWvLqr4wYhhEOdu9THMw1eIDR5W3U/MZbVfK8epGRwEr+a6F26QR12p3/WTBAvSxhuXusLWShtTBW0swGnbj6rFpClMR462rVEvWc70hc9SroLULstfjp4Al523NEIL7w8e4GsMnTr1IV6G3icUz7KIxL/2x9oZHxgvCKbvd/CTP/zb6dWhxbE7AJjY+NSwLR9hNsbj9mr/utBS4y/9Sw9q5//bWgjj56DmNPD49+O3cseB9CeepvdpPNsKoI7E6Uh4U3E3bvu5iWm+eRkrDwCdckgHSE/MFrt2ybNT8V73H9y3A8kSJbAitpRwJ5WgMYy6N+RLWHX7T/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNmEysxKi1C8vLv+oGi3bIL1QdN9QGF6+tqFhukZcLg=;
 b=Yq1+FharPZQ/sf4TifOL+J8zOPKEzxsFVjfgwIQHx3cqrVSYL4ApVXMwe3can7U7IyU1qaOy8sV++Lnk2UZxnjA+6I2nfCvKPNkfR7qJkAP1kUvihCmAab9CAMoyJxprzaCukAGNt7x3jeXbrnKpX9eV2EDlh/R7IPB97Fubns4KqBBO5F0g54Qi/619faXbWeNqe310iWu8s9M4S5AVPMuFYtmB5A3gx05HT0sQitKMCD2pZPE1ae/nTBXV3DsYujYoQXddEjvJFlM2bRofRkLcK8uQ+/c2i0900xbLpIWEXVVgLs8o4HhIylq1v4swLGk/nAqHRzUXyMcyK00PKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNmEysxKi1C8vLv+oGi3bIL1QdN9QGF6+tqFhukZcLg=;
 b=aD6sZhkjEQt//wXMccJENZJk2+oe6RfEe5p/8xp4129KkicADZoHAgcIeWCAScCJlea7O6XCAqGPNczyWvwuoEQDVpawChYHBSsRR8XYBYYg4v/4h8yHUO+tn06JPFXjGmIPiylyEZdFUBop0aQ6qD4fpeFQ0vDkMPKpyIa4omQ=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210506151631.1227-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools: remove unused sysconfig variable
 XENSTORED_ROOTDIR
Message-ID: <a236f079-1771-7808-bb16-97b9dc5ed733@citrix.com>
Date: Thu, 6 May 2021 17:49:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210506151631.1227-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05666179-fee8-4cce-4ec0-08d910aee5b0
X-MS-TrafficTypeDiagnostic: BY5PR03MB4997:
X-Microsoft-Antispam-PRVS: <BY5PR03MB49975D9A31337F6A52936E4EBA589@BY5PR03MB4997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5XFYTFlA0HMR3m4vuSyuczcVz4aHHvctzxLhag9Jf5rjnjLDprei2ynHBJ8jRaAnKFdDdtD9XRCY5JQip8fEfg2K0xThmI4GshJ6Tfi2ajFV+RRBlNePUr2noo6Kk/tXxwoqanjwAvspCpyrNKOKJggoGky6qJ2jvzR5cPUEtYtN/ZKOU1vGBc6QIHAs7LLwFkYRAE1jXyal9bUfzYgWKngDcLgDNAhkav7pSvgOY3ErjxqYUocTkcaMo4fkgzUyP0fCIAJE0aEMv+22q9qLfuqKBXDK5yhAXL0lOdFdTzs34GcpetsdrKvUOSQYB+BF5J0ulllrn2MTfH7aJShd7S+Ht5/OPvphrhKb97eB8VVWkGdZdSpQ6ldA2pC3xNLYN+hUZsqRUIAZVh6ueoNdsFtR3Vcxl6o+6CEwn5JUD92gqTQA1+axm9XAXPVYNLF+MTGIky2Uvo6Rf2xT4DJtAYpqBxIo8bYK+MdTM3h8jm40PTRWtSr8Y/SZe4ei303r5ZOVI4DqJoZf42QPSyxqx1YM+A2h4dguBZWcRNZTSZlxsJ0P4XWoR/pZZLRLW6zDW6K+9Vtnb4VJYnRbqfnLCmo+AEP2jFbOlO82fBm8g4wCJRyp8uydjQiRG16/d+BNZstU3Xz9IHR57Sxnbl+4XYHaWnj7UGZtZDRz/kSHzIYMwFLEwgfpiT0RLNJkwW/F4QFDKCpA47JzLlEIy+ZLsWTXIxJorj1pCQwLKUcSNJ7s1eXlxWydnt9ydV7gQESIa0CD0EO7n9KkJ+coepQ2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(4326008)(54906003)(16576012)(86362001)(8676002)(5660300002)(6486002)(66556008)(8936002)(316002)(6666004)(66946007)(66476007)(36756003)(956004)(38100700002)(16526019)(186003)(2616005)(26005)(31686004)(53546011)(31696002)(83380400001)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGVSY1ZNdTNjR1dyamp0em1nSVN3dnJUVWYwZ0VYS0tpVjNoQmsvTHpVSWpk?=
 =?utf-8?B?VVlDLzYvMG5tSEdWUnNqazF4eWx6TlZMOExkN2pKNnJIQnlGbTVoUmh1RkM1?=
 =?utf-8?B?Q3RpREgzdkJKU3MrUHZ5RXpmNysyc3Z4a1pFL1RzSU5uYmdSL3o2NThvVllv?=
 =?utf-8?B?aEFUZVdxTU54RkloYkhZN2o5aHBuTHU3bmh1OTdwU1V2YXljRWtlaEd6cDFF?=
 =?utf-8?B?c2tKeE53b041WndnbDdLR0dRcHVPMEMzNmVCblY3SllWSnA0YnczK2xYN0U2?=
 =?utf-8?B?MU1FRTVZT0NZTVhiemEzb3dQbGFDb09sY0ZQbm1iWjg3U2dhZXFPd25SaVZi?=
 =?utf-8?B?SGxRL1F5amdldzNvTmx5MDVpTm85dU5hVjRrV2N5L0h4M0d2RGE1N3VoaEhK?=
 =?utf-8?B?SkJOSm5nbVRNSUYreWU3bEdrQWt5eDJyYU43N0luRmpnekZZbmRnQ2JRWTVj?=
 =?utf-8?B?WnErZ253dUYxZ2JBdThVeng3UVNGb0R1SzJWYkJFL2NPMVEwVUlEYUtqbWZ4?=
 =?utf-8?B?c0VQY2R1aGZPNU9yQ2R0dysxa2M1aTRHVjhvcUtNTERpcmF2elJsWTROWXZW?=
 =?utf-8?B?alM1NFEzdjgyd25qTFFvSGljazc4SGRxYi95T0p0MUhIOEUyNUR0NkIzd1ps?=
 =?utf-8?B?MEh3NjRuUlVlWjBhaUxzQzI2VFo0Q2hBRXNoNldydllhTVc4S0dsa3ExdmtW?=
 =?utf-8?B?clFOQTlZd0JGMWFTTUNDdzJkejEzMjZLOTk4aXU5NHJMa0Jlci9sYlY5MW1n?=
 =?utf-8?B?MmVLcEUrZjJhV0tkK0MvZkhxd2czMng5SVBqZ0Z4N2Q0aDc1QmkvZEFabEFk?=
 =?utf-8?B?MmVVZlRuTk4wdGJ5OHo1NHNyaitxeTkwT0xuaUU3cGU4RDNXWUpka3FJc3Ja?=
 =?utf-8?B?SkN1d1o1eHpVSktlcHdYb0dYdXRvUGl2WHNEY3g1UGtZYjFLYW5TK09wbWcz?=
 =?utf-8?B?eHRMclhBY1JpdG95alBhdEtETmRXQlEyNEtKZmRhMzJveWlaQ09UNGxuNExL?=
 =?utf-8?B?aTFzTFBBU3VOYThYZHVyVkRRNnZuMU9RcGpGcDl3bXlTaThxWWY3cHJRQTND?=
 =?utf-8?B?bGVjS1FoRU5FeW1BczV6bGQ2dlpHbFlxLzE5VkFlME9BVnBZOWd3STBZS2NG?=
 =?utf-8?B?VkpxS1Q0RGtQU1k5QjRjbmpCYTdicHZPM1VIK1N2MWVHRVhwaVVPckR5TjBp?=
 =?utf-8?B?cVR5YnRMV08zMVI5NmhaWmg3NnBqUXcrK0h6cTBuckc1c0EyTHByQzlhVDNH?=
 =?utf-8?B?OThzcE9sOVJzM3dzL25mWXdNUFpURnpUZXR6ZGtQTUZoMnVkLzJoWWZxaTJz?=
 =?utf-8?B?elBrZ0FwVnFmUmkrNVlnbUhoTlVWYUF1ZkdZOE1EVy8vR254dk81Wlh5clZn?=
 =?utf-8?B?TGZNK3NHYzY3b1BoY1FvOFNVdFZleDQ1RHVSSXpxc2VMQUlybzNGak9Zc0pH?=
 =?utf-8?B?dEVkTWVEWHFnaXNMRjNGU0ZwRTVOMUcyelVWUWRwWWNsbnRtRXU3bXd3TDlS?=
 =?utf-8?B?b3pDaFNwbUI0MURtaTd5SVpUMzNpQTNzT3gyNzZGOTVTZmwvOU5QUDdBa1hL?=
 =?utf-8?B?VWczYzcwTmV3b2VBcitwbnhibUxldUxvR1FSKytxdFMwZ3BROS85N2NCVFRk?=
 =?utf-8?B?Q0I4ZWh1UlBmbGU2elljSXFlbnVZeHNRbm1yZmlyZHA0TjVXZWR1VHNScldY?=
 =?utf-8?B?S1JnNFhacWNra0lFZlgxSUV6cFhjQ3o4clpDVjY4cG9rTGR3ZWRCYlhNZFps?=
 =?utf-8?Q?LqfVSdFHYNx9EaGBOGZr2xHhkvRFK1c38SmY5Md?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05666179-fee8-4cce-4ec0-08d910aee5b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 16:49:21.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4ZMWGnXNmshG9jjTab8CmA/dlENm6wQLP4KlueP0e01se6N5sTwD54kuH4MrrWq0xxXbOoPFNeoANHgy3Q4rZKwCa7F38gCFn1i6gs+Zjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997
X-OriginatorOrg: citrix.com

On 06/05/2021 16:16, Olaf Hering wrote:
> The sysconfig variable XENSTORED_ROOTDIR is not used anymore.
> It used to point to a directory with tdb files, which is now a tmpfs.
>
> In case the database is not in tmpfs, like on sysv and BSD systems,
> xenstored will truncate existing database files during start.
>
> Fixes commit 2ef6ace428dec4795b8b0a67fff6949e817013de
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by Andrew Cooper <andrew.cooper3@citrix.com>, although as we're
trying to keep on top of the changelog this time around, we probably
want the following hunk:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 0106fccec1..6896d70757 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,10 @@ The format is based on [Keep a
Changelog](https://keepachangelog.com/en/1.0.0/)
=C2=A0
=C2=A0## [unstable
UNRELEASED](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3Dst=
aging)
- TBD
=C2=A0
+### Removed
+ - XENSTORED_ROOTDIR environment variable from configuration files and
+=C2=A0=C2=A0 initscripts, due to being unused.
+
=C2=A0## [4.15.0
UNRELEASED](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3DRE=
LEASE-4.15.0)
- TBD
=C2=A0
=C2=A0### Added / support upgraded

~Andrew


