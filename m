Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FB35E0D3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109815.209677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdX-00068e-6Q; Tue, 13 Apr 2021 14:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109815.209677; Tue, 13 Apr 2021 14:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdW-00067r-TH; Tue, 13 Apr 2021 14:03:26 +0000
Received: by outflank-mailman (input) for mailman id 109815;
 Tue, 13 Apr 2021 14:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdU-00061C-ON
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:24 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 345d3bb5-816f-421f-9baf-99c1469d0a13;
 Tue, 13 Apr 2021 14:03:22 +0000 (UTC)
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
X-Inumbo-ID: 345d3bb5-816f-421f-9baf-99c1469d0a13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=P7vZegBKQVl+IyYesoWXa6XMSoDS3GTeMrPPYL+vXSg=;
  b=NYTw2J3LXRIZgUv/X+cBV//HyHSuuqZxjKm+WumfmB2GeGypxKT711j0
   AKzGYzqh7GVpXFT3MCzkXLVvi9DAq1yeXkKj8PvSvdaXoP03F6KSh0ZWu
   ZSzILfMEYhr7WWicmcRpTcxvH/VlpBAjcXjsL6tbQu/uUggvgJq1vwgG+
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ReybT6KogXa0ELTILVm6G9a/Bu3uI0d3wWk4nXoA8A2cATtw0F9x3mOa/1VsVKZhl/gBI73nty
 8HoGnVC/MZDz5vZ4IiviSZ87My8OcMveOk7G217r/9ToWVkjRYKnN9K6DIfpFYD/j1gNVPHe9Z
 8jgH7gx6op+vAQ+vwf30NXc9+pq4IHAzNB74PUoH2atceXRWpCEh9Zk6qt4ulssXyk+j503UjK
 kJgixf5l3Jc8l1kI+b1JaAdA5T/R99l+5lHlZmKc9QMqWgMF8FKN+irXTQN6dw1iOtHxPcc4me
 oCw=
X-SBRS: 5.2
X-MesageID: 41613969
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mdrh16o70XB3PVlHx5JIu4AaV5uuKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYylLbSNBAoc0E4
 fZ29FOoCCudW9SQsOwAHQEWOarnay2qLvNZxkaCxk7rDSflD/A0s+GLzG0/Dc7FwlOz7Ar7H
 Tfn2XCiJmLnvmnxnbnpgnuxrtMnt+J8KogOOWtjYwvJizomkKUYu1aKsa/lRQUhM3q11owit
 nLpH4bTrROwlfcZHu8rxeo+ySI6kdW11bYxVWVgWTurKXCLVpQYaox5vMqTjLj50Utp9162q
 5QtljpzaZ/Nh/cgD/7o+HBShACrDvEnVMZjeURg3ZDOLFuD4N5kIp3xjIxLL4wWAj+6IwhDd
 B0CtDd6Pt8YTqhHg7kl1gq79q2UnspGBCaBmAEp8yOyjBT2Et01k0C2aUk7zs93aN4b6MBy/
 XPM6xumr0LZsgKbZhlDONEZcesEGTCTT/FLWr6GyWpKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPHE6S1rd122yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8os8YHtbQV5
 +ISdNrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/LjdnMLqHsq+zHYNfeLLfgCl8fKyHCK0
 pGeAK2CNRL70itVHO9qgPWQWnRdkv2+o81MKWyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oeypWy8+3f0/3xkUyAtSnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1tZQ97JFh
 Vc43B647i+IZDV5S1KMaPoDkuqy18o4F6aRZYVnaOOoe3/fIkjM5ogUKttUSPRFxJ0ng5ugH
 xZaBANQ3LeEj+Gs9TnsLUkQMXkM/VsigaiJsBZ7VjFs1+HmM0pTnwHGwK1XdWvmgYoTTpMjl
 hX+6sS6YDw3gqHGC8auqAVIVdMYGOYDPZjAB6ebItZoLztZTp9VHyHnzCclhE1dFf77kl6vB
 2TEQSkPdXwRnZNsHFR1ajntGl5cWiQZGpcQHF3u48VLxWMhl9DlcuwIoaj2WqYbVUPhtwHOD
 beeD0IP0dF3NasziOYnz6ECFQrzpgjJfbmEbwmar3fs0ndbrGgpOUjJbt57ZxlPNfhvqs3Su
 qZYRaSNy69JOUz2QCZz0xVThVcmT0Bq7fP1xLk5mTjgyJ6LvrWPVh8R7YUZ/ub9HPpQv6U0J
 N/yfI51NHARlnZW5qj8+XwaTUGFzb45UiRZMssoYpPva0zuKBodqOrGQfg5TVi5lEGMMzwlE
 kiW6x177DKB593c6UpCldk12tssO7KEVAivQP3CNIvZF0Bj3fUONWS/rrDwIBfdXGplU/VMV
 mb/zY1xYa8YwKzkZobAbk3O2JYdQwV72lj5vqLc+TreU+XXtAG2FqxKXmmdrBBDICDBLULtx
 5/p/WFhfWeeSa9+Afeu1JAU+9z2lfiZcO5GwSXH+FUt/S8JFSXm6OvpPeJsw2fc0rzV20owa
 tfdUIRacxfij4tyK0PuxLCNZDfkwYCiFtR4TZui1j3/JOpiV2rRH17DQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41613969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo2nELJLnbLtqD6I6ancgn3nd7+YlTZZVTaddpd9oxnERrmbPHy0ExxA/HImm8Csz3rwtzzi2lHHHDzHVn6MB+JdDOqylm5ioR/7J4O8++Lb6CiKgzG4mwyZmoM2Ou+mC+ga1VY5EgQYHHT/YiuZp0xgWWdQH5b/VgAroQErdN9maZ1XIs4WYKKVDpCYQSd9TLv3I0w46hh+h/0lFwEu6I+ZccWrpoNTHd3HGbopdoPEkv/3bnuKcKVcuJjWpQGbwMmseqSicMFQm/bFA6OKe3wIXtDKc/0c64uIfN2X17eRtMAfXruAvzrHWQBA8fyarOb5B6L3VCJYvdS6HnODeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc+lsGkoLxXeZ9V8GLxDMIl6AZXl0djGMA3EPzv8W5U=;
 b=aXrjwAYxCXP8eATPEZNKVBZykfxtVTaeZW9mbzlElmpoX8YKrQKILNF6d00/nepdgSCoE4Beye1kmn0IxGMDPSrpvZWEOXgsi3JgAJkV9xRi++c1Py63/R5w83d9gWYSCzBRglvEQld+GHBtR+cZ0sBwnNPahge0XV3gwbDBfO6sTiHlyM6ssrULKhHq6+JaCM1tF424QQ4N6iZpinQ0F/UXaY9tzinC+61O8QfDe3hDN6h5pTPacFFl2/FSs3spP5FSMHpDpKk2RqmRHT4ReV43lCR8GEgxwPq3Q9uX4mR1AXFCakQu3pLpmCZhDiS/2c7mC4C1MwRlt/QrYK0NGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc+lsGkoLxXeZ9V8GLxDMIl6AZXl0djGMA3EPzv8W5U=;
 b=VB/wgPdfL35wxlNKEjcNSClsN1dgRQbUZRyt/tvktA/sEeFL0PPf4TS7INl6N/NWCCyslkC9Ur0FbebfStqn8kgGm8vCpF303O3PPARg1PmRqSOesB+Wsu5TTrdgQcex0DzCmh0hVZXHQFEL/vBjqsiF9biR4Kw+NFQ6Zxc5gE8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from two input ones
Date: Tue, 13 Apr 2021 16:01:33 +0200
Message-ID: <20210413140140.73690-16-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 958eb659-fce2-4b33-c0b1-08d8fe84e4b4
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB255312F6447F295E8556EFD38F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+h8U+VU8zche7Jo+QHnYzhr1DKC3fH17YRgR/a2cnbWyucCKyYA9V3eQP/cZ8Xe+arhUU8Nvkl5EpD0DHDBjMy24gVRMiYQItntB8lThU5AvkBZME5l7APPjbcevpgZIkGsB/NsLbH4E60Xf1sGLC6e0K/82fuvrMUyWoGJMSZ1rAgA9AE1mjv3hGoCng3uI6k/JNOO+FNIbWdhHMgWbMPLapwL4YZ4GM5e1aRaZac00mN7J9OJ7lRBi0v4b2dvEUYr7wTrGicS763/EyKr7dHrdetlNy/EUEuRnInDgx1uirqzmF+wlK4+34RSWPQm5bLg3Sys+bt7TDF7ApTgkWmwKoCoWMQsgU4NU3QxT6mdxQjrd49gWBaA3kuzeWLx/XEVC+ust/4/tgxalIDMDR0bwoU9MvT6eqvY9pwmBqV5VLMQceXBrmETufNBZViEs/S05s29eF7HPxSQc1xyuUmvrCS/+SQ+czoPhPV10XzA4QfxW4qlTIGHeCi0TL93XJ5LPiWUntxOyVFoK4G667F7tf3tSBHqNYOt12kzkj4/bp9HHJ1QFkG4CF4iFfXPBULYBVHPM9ufhZu6MlFTNjlYLVgWHObKbLwQIMRV03A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(83380400001)(107886003)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWkyV200ajQ3Z3BYS0RESWFWbGYzeUpUc0VwZFhOQnR0TWcwajN2RjNmQ3NI?=
 =?utf-8?B?YTJzM0ZnV3BXZ3ZUZXhMZGtlTzcrOWozQmxWSC95T2FvRHdESVVTaVA4bXg2?=
 =?utf-8?B?QkM2UldhODMwUytDbE5ob2RnRU4yZ1JJbUx2RldKVzhTOG45eGNwcmFpQ1RV?=
 =?utf-8?B?QXFrT2xTREp2bElNblpUeWV5V3JXVEduVk9neHhaYjMvVWhOS1E4UGVWc1Zo?=
 =?utf-8?B?MWpKU2QybFVzVWpHWVEvWXBvaTV6ZWlvWUNWRjhyc3FscHY5OUVRTFB6bkRI?=
 =?utf-8?B?OEluOW5iWmpLT0lpKzJZV25wQ1hTcHNBNWp1c3QwR2JjNjYzRzBUcWI4anNR?=
 =?utf-8?B?Z3E2a3VkOFhpMGJnRlhOV3ZwZ2VQNHpJM1BTa0ZrUTU0c3lHQW1GT1JabStw?=
 =?utf-8?B?Syt1OEdpemFkYnFMdUdBUThleksyTFp0WWFzQ3NJMjNqbWVla3gxMytEL2w5?=
 =?utf-8?B?U1U3ZEU5ZXF3WTJuR0lPU01HazVsTXl6RzNBQkxzRnNzYWpwcHlOOVR1SnNT?=
 =?utf-8?B?NGVQUmF4SGE5djl6a1hPY0hqdDVqYnNwdDdxOHlYQXZlbk10L0p3endGZGhD?=
 =?utf-8?B?NDFPS2dVZ1BGQTRnTkVKRUV4WVMvUU5RMDFPeUI4VGVLZTZzSTZ3SE04czU3?=
 =?utf-8?B?dFNGR2VvdnhwQTBEU1ZhajFXRE1KdUN4SVpBbTJJWE0yVHYxRy8veVR1UkdJ?=
 =?utf-8?B?ck41M3ltV3M3dkpFOTBvbEFXWHZZU0t2N1ljWUZwbG5JZ3ZDbUNGcEdIcDFC?=
 =?utf-8?B?OEpSSFdPWlJHVEFmTHFyY3Z1UUE2UjBTdXhHTG9qb29raW1nMDVTLzNWWi8r?=
 =?utf-8?B?QWlHQXNwMHRuVWtMR2JtSkcvVWtlRUNQUmVqSTQzZVVRYW5aTmh0RkZoQ21B?=
 =?utf-8?B?RmNQL0dsVlpHVXk0bXNpaVNqMnd4NUYxSHB5anpzaEtKK2dpaFFiOG0ybWN2?=
 =?utf-8?B?cWM3RVlqcjNTc2JVdXFLcUZpcGxRWHdiM3JQSEtZRWFBSmVwb1pPdGFKVkxp?=
 =?utf-8?B?OTIyM3ZrcmNtQzFPdE9Oa2wwQUp4dGlOOURWekpReWdTcHBSaDY3RXRsYkJz?=
 =?utf-8?B?aWRoUkdOYzBGQWVBeCtEY3ZxUnZmRU1XNFhEbFlxR3RYQ1ZQYS9rUTlQQWQ4?=
 =?utf-8?B?QXVwbENhVWM2V3lVT3VIRHY4SjFxZTdZUmphd1pnc2hWMnhLTUlubnFvOGZN?=
 =?utf-8?B?MFF2TVhLY0gyTG5iZGlCNEJyQ1Q0aGVxMlhBbFpEVllyR1RWMDgrZHUzTVo5?=
 =?utf-8?B?RTNyZ01kci9iVzVqcDgxQlpXQlBtRzVQMGExUzlQZVlWQW5aZ0RqbDhYZXRH?=
 =?utf-8?B?MisxT1RyQ3lLZDE3RGdPRGxPeVp6S3FPT09lbEEyK2hJVjVSMEpBeUNOWGV6?=
 =?utf-8?B?akVVZ2k5NUtyczlnRS82bU5VSUlzUVVQblhnTmNjeU5VUFlNVFBBYXo2K0I5?=
 =?utf-8?B?SmhHcHJpSUg0OE1RdDJxOGppK1pkOWkwWi83TllTT09SekpjL0N5OE1oUXFX?=
 =?utf-8?B?aE1IUlByR1dObGZMNUw3OWM2eXV2UHZqNjNwZHBzQytnUW93QW96M1BmSm1m?=
 =?utf-8?B?QmN4MGZQQlpvRHREbFllbVJ2ZjFSRytzTEQyY3RFYk1vSlNzR0c3OXdmTEVQ?=
 =?utf-8?B?VlNIMm5zRUFzRlJkdzVUS2dpaUgyVyszYTFmWVVPb09GK0M5V2VpVDBMaVlp?=
 =?utf-8?B?TFp5NFdvOFNpMDVNVUVodUZ0M01FYi8zRWxwYnlRMmZralAyMVRBUE4wVmFh?=
 =?utf-8?Q?L8/XkFzxGzS0YAsUtiARm8oL/WAtasqor+yCJLw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 958eb659-fce2-4b33-c0b1-08d8fe84e4b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:20.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r03MpPPP20qqMRWRm0h/hzzMKozKy009boBr8Z4xv4OLfHsYAI/INAM4ItL2CsXTnvJwIcPsHrT4W/9qDTCbxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

Introduce a helper to obtain a compatible cpu policy based on two
input cpu policies. Currently this is done by and'ing all CPUID leaves
and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
bit or'ed.

The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
since it's required in order to use the msr-index.h header.

Note there's no need to place this helper in libx86, since the
calculation of a compatible policy shouldn't be done from the
hypervisor.

No callers of the interface introduced.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Only AND the feature parts of cpuid.
 - Use a binary search to find the matching leaves and msr entries.
 - Remove default case from MSR level function.
---
 tools/include/xen-tools/libs.h    |   5 ++
 tools/include/xenctrl.h           |   4 +
 tools/libs/guest/xg_cpuid_x86.c   | 128 ++++++++++++++++++++++++++++++
 tools/libs/light/libxl_internal.h |   2 -
 4 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c38070..b9e89f9a711 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,9 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef _AC
+#define __AC(X,Y)   (X##Y)
+#define _AC(X,Y)    __AC(X,Y)
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5f699c09509..c41d794683c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2622,6 +2622,10 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
                                  const xc_cpu_policy_t guest);
+int xc_cpu_policy_calc_compatible(xc_interface *xch,
+                                  const xc_cpu_policy_t p1,
+                                  const xc_cpu_policy_t p2,
+                                  xc_cpu_policy_t out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index bd2f31dd87f..6cfa4cb39d1 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -32,6 +32,7 @@ enum {
 #include <xen/arch-x86/cpufeatureset.h>
 };
 
+#include <xen/asm/msr-index.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen/lib/x86/cpu-policy.h>
@@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
 
     return false;
 }
+
+static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
+{
+    uint64_t val = val1 & val2;;
+
+    switch ( index )
+    {
+    case MSR_ARCH_CAPABILITIES:
+        /*
+         * Set RSBA if present on any of the input values to notice the guest
+         * might run on vulnerable hardware at some point.
+         */
+        val |= (val1 | val2) & ARCH_CAPS_RSBA;
+        break;
+    }
+
+    return val;
+}
+
+static bool level_leaf(xen_cpuid_leaf_t *l1, xen_cpuid_leaf_t *l2,
+                       xen_cpuid_leaf_t *out)
+{
+    *out = (xen_cpuid_leaf_t){ };
+
+    switch ( l1->leaf )
+    {
+    case 0x1:
+    case 0x80000001:
+        out->c = l1->c & l2->c;
+        out->d = l1->d & l2->d;
+        return true;
+
+    case 0xd:
+        if ( l1->subleaf != 1 )
+            break;
+        out->a = l1->a & l2->a;
+        return true;
+
+    case 0x7:
+        switch ( l1->subleaf )
+        {
+        case 0:
+            out->b = l1->b & l2->b;
+            out->c = l1->c & l2->c;
+            out->d = l1->d & l2->d;
+            return true;
+
+        case 1:
+            out->a = l1->a & l2->a;
+            return true;
+        }
+        break;
+
+    case 0x80000007:
+        out->d = l1->d & l2->d;
+        return true;
+
+    case 0x80000008:
+        out->b = l1->b & l2->b;
+        return true;
+    }
+
+    return false;
+}
+
+int xc_cpu_policy_calc_compatible(xc_interface *xch,
+                                  const xc_cpu_policy_t p1,
+                                  const xc_cpu_policy_t p2,
+                                  xc_cpu_policy_t out)
+{
+    unsigned int nr_leaves, nr_msrs, i, index;
+    unsigned int p1_nr_leaves, p2_nr_leaves;
+    unsigned int p1_nr_entries, p2_nr_entries;
+    int rc;
+
+    p1_nr_leaves = p2_nr_leaves = ARRAY_SIZE(p1->leaves);
+    p1_nr_entries = p2_nr_entries = ARRAY_SIZE(p1->entries);
+
+    rc = xc_cpu_policy_serialise(xch, p1, p1->leaves, &p1_nr_leaves,
+                                 p1->entries, &p1_nr_entries);
+    if ( rc )
+        return rc;
+    rc = xc_cpu_policy_serialise(xch, p2, p2->leaves, &p2_nr_leaves,
+                                 p2->entries, &p2_nr_entries);
+    if ( rc )
+        return rc;
+
+    index = 0;
+    for ( i = 0; i < p1_nr_leaves; i++ )
+    {
+        xen_cpuid_leaf_t *l1 = &p1->leaves[i];
+        xen_cpuid_leaf_t *l2 = find_leaf(p2->leaves, p2_nr_leaves,
+                                         l1->leaf, l1->subleaf);
+
+        if ( l2 && level_leaf(&out->leaves[index], l1, l2) )
+        {
+            out->leaves[index].leaf = l1->leaf;
+            out->leaves[index].subleaf = l1->subleaf;
+            index++;
+        }
+    }
+    nr_leaves = index;
+
+    index = 0;
+    for ( i = 0; i < p1_nr_entries; i++ )
+    {
+        xen_msr_entry_t *l1 = &p1->entries[i];
+        xen_msr_entry_t *l2 = find_entry(p2->entries, p2_nr_entries, l1->idx);
+
+        if ( !l2 )
+            continue;
+
+        out->entries[index].idx = l1->idx;
+        out->entries[index].val = level_msr(l1->idx, l1->val, l2->val);
+        index++;
+    }
+    nr_msrs = index;
+
+    rc = deserialize_policy(xch, out, nr_leaves, nr_msrs);
+    if ( rc )
+    {
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 44a2f3c8fe3..5709bcb93fa 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -126,8 +126,6 @@
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
 
 /* Size macros. */
-#define __AC(X,Y)   (X##Y)
-#define _AC(X,Y)    __AC(X,Y)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
-- 
2.30.1


