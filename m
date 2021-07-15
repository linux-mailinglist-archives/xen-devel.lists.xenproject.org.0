Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C383CA3C8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156878.289455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44z1-0008Rl-5z; Thu, 15 Jul 2021 17:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156878.289455; Thu, 15 Jul 2021 17:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44z1-0008Pl-1U; Thu, 15 Jul 2021 17:17:11 +0000
Received: by outflank-mailman (input) for mailman id 156878;
 Thu, 15 Jul 2021 17:17:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyhT=MH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m44yz-0008Pb-Fv
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:17:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bc28042-e590-11eb-8913-12813bfff9fa;
 Thu, 15 Jul 2021 17:17:08 +0000 (UTC)
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
X-Inumbo-ID: 7bc28042-e590-11eb-8913-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626369428;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rIDhdyO8WHsPmGPrZpjM1geJ1MS256ftgMCY4Mj7s/Q=;
  b=QR/aMUcPxz42grsYyvy/vA5/REf5zsqd/Ggzzb+u/3/EO7SEst/6YDh6
   xVIwM5DCYUPmZh/EG/nDtj7LMw/8Y+dUyQAmCBRQMer6T5bpjB7FtFAJZ
   cbLfw8ygw1HZ+RvepdUcItGmX/JkGoX70hvOfdaUsSEjxKmTIrBxqnH4o
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SyN415TcHg53nFCXJuUGXcyr64xL08XpHO7ZMfMZwFDn9iWcg07QYrvDOREzH5VYp527TQxdAD
 9spvRfAFhAyhEaqF7wRs/n3xQAZpVj+tlgPcvgCJzMfW7rTPlpCWjhLjXPbnhkJLvByUVeOixM
 CoH4VN+2+eNRYMAfHNNDWiSyhAAc43YKvm6qnykAlnNDMzbXtU/S6evZRo4HW1nFHtpiR6Pc+K
 bOB0LiZcEfCjOXtkbR/6Tx6kQs2O66RAMksLxB9N4Us0+1ULeghgSqfa54tGED3Umms78x8p/W
 l5Q=
X-SBRS: 5.1
X-MesageID: 48068661
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jrAPyKOTUAreFcBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.84,242,1620705600"; 
   d="scan'208";a="48068661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E04UA+cGTEK6rXdaA934QFSJKGariGokua3lid9EZHJTbSNSH/0KLPtXx250Y72AC3k6B5gKzkS92K6td00EbWU7t4HKRS4zLfpGsq2zUNFMM2izY0up/hicFzEVTHSc1iAu/R9zK3f66kAWdsCX49NiroZzFq7OZOf9DoYDNJq5HW0E1GPCBKvGKz2Qw56jVOHPatkgGFgevHRimBre8j/Ul/Fn+USU7zipihrs0Ae0Ptw+hPf6iq6x0NdLad8FnKUScwl5FPsZZwwGMEIqGSOXbYUCOZrmcNOsP50m5wLSPHV59QhPZGs/PWGrxcDAE0XT/2rZm3zVamnprDmG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIDhdyO8WHsPmGPrZpjM1geJ1MS256ftgMCY4Mj7s/Q=;
 b=CIffT4mrILuwN7/OTos1i/2aKPWYWE2f75TX7awPPNMz5jeGJ/wh+DExLEh8jB2lxBywjentmxd3AOpakBPbxyS8NAa85akhlcOMuEHyrKEJAiaJ5IVsVyLIFyvVD7jI4+3YL3gv/7FCg37iNsY4C3iw4cWEvQBsEt6zt/YKWWQzwHv2Shb5aSZBOXsrRW8NVfU3XoVMYFx9ytDNkxZ18uXu9rGJdtLL2Qd8XNWdElirUu0NJ0W5UMgaN3S+NbSqhwDkZ1yUSHnECe8x3iZuLK1NpAy43tKahOL/FVBI5eAuD/pG1CAMGB3UiEaKc9TM7THgFY+NdugcthmbSgJIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIDhdyO8WHsPmGPrZpjM1geJ1MS256ftgMCY4Mj7s/Q=;
 b=lTJMAkFVeWN2uLdItxh1y+aBKB9x6sEUP4GMfCqR86ViedW9hVRln6aIeZBMORxa2iK6AEWKLAj6+zRrtp8bQ5w/L94PBdDzwHXLfIzHQp4VhYtMkdsTkSGBfkljeZvmiPwDoWhLNQ18EgjWZ2p+s8Bn7Z+7PjqTMg4MMU5xZbo=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: preparations for 4.15.1 and 4.13.4
Message-ID: <8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
Date: Thu, 15 Jul 2021 18:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0380.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df8bdb5-1367-4428-2bc3-08d947b45d10
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5693934BAE35644362B4CC4EBA129@SJ0PR03MB5693.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yW1AcObh1cAUwPo78bUH4aLl1cKTG/lVP5sPfCza8Nq4HEfXswMw/VjXiwwc+evRiokOCcen44rwkQC1Zl08vQF/1QXNBUFI7+vr1VRpED/P4h2eDkwkpobCsin1QFWMqqDt+hiS0mx2EqLxkG7PVoH4h57ZbKuNPksDQu4VEktaIqoTVdmID469KDapD+fdE9s/u9Qa8R6XMRBFwAoGu0kjiqbHtAoDUrXZyYU5RxbW7uDlfYI3iAUOWJ0Jx0qpEdEhREw7DWVs9spcraEmXrEaLQo7yVtHtPoFwDbysxNr2NKUP5cn1jZ3Kr/A9iCt1PVW4cWvxk32cbX9WtyHwvdI4/ejhJwtoVDLaTWxe4D++sXIVl/2Gm4ljGLJJYTNiHOpbSUC61g1XrJ3RbskSdOiu5tZ/S0SmozLQ6vpxVBQVzbNZTmQYNfxAdO5BGeflF0vESsV1LK8hwovQMiCSdWVoLVN3U5hYMXlQRjNvQ6iSp0IhrHDz4j6S2lBINtkd3yl0L75f9fkGofMHKLs0bk8vQ+PGXetPeklnndjrYZ9hQh3ZZJ6loQWGcXEhih9uA+IdRQIstd2G2XB5fN53BkzQ8Zl9oxvtnaj081HrI8esvWg1y4y4wm2xEtnkiYKHkbLqI0YYCdwyz1gq/TrqA4zFPUHZ6OOMkEHErW9HmScefPqwES/Kyic0bRcR28w15VuQw803UWu6RvMzpbetU31p+eCfu17hcaxnH66ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(6486002)(8936002)(5660300002)(38100700002)(8676002)(4326008)(316002)(31696002)(16576012)(110136005)(86362001)(31686004)(54906003)(2616005)(956004)(4744005)(2906002)(186003)(478600001)(83380400001)(6636002)(36756003)(26005)(66946007)(66556008)(66476007)(53546011)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1FR1Bqb3VaTzRyOFViSW5RVExQOUF4U1RadXcwMUVBZ0hLczRjRnJQa1ZX?=
 =?utf-8?B?K1YrVkRmVm9HODBtS3VRMEtpZHhVeWx4NUVkbnZEWjJBQTl6UkxpT2djZmpN?=
 =?utf-8?B?T01ldzNmUmtLdkdXZWt1RGpaT1pHQkMxalhneUNGU1lqUU1ZeE5GWFRGaFJz?=
 =?utf-8?B?dFRiVzlsam1QVHZyOWJlQm11NnVJaURmT01xK3E0Z0lIK2tUUDJ6NGVPcFMv?=
 =?utf-8?B?ajJtOXlpcmU0cUhROWpxUkR5d3cyL3AyRCtFVHRyMEkyMnkxbVAvVWthMUlJ?=
 =?utf-8?B?dVY0SjRERmptVlRaL0txYVZyZU9MUDdleEppVVpWMlpuZ1VGRnNqeVdRcnVK?=
 =?utf-8?B?bkNsT3JuWlEzRFpHK0JESXduQ0VUY0hoV0FOSEoyeitkK0pVWjBFRFZpeFE4?=
 =?utf-8?B?ODVHbGxzMDJibjNxTm04RXhKaGZ0aVN2VXdjSUF4VThSOFY2cUFHblhpdENP?=
 =?utf-8?B?aHNGRitCZUtoT05OU0laZTdBb2VadkVVU2hwa1NkT0dnS0E3Zm9COXQ0U2la?=
 =?utf-8?B?aFdQcThQNXF2UEVDYlcxeVEzR0VROWs5cndtdVYxcCtLTWZzZkRDemRhK3hP?=
 =?utf-8?B?cUtxZjdZaW1tRmZWbnZHOThzaVlBOXU2MlVJVW1lT01FWjBxTnEra0grUDBW?=
 =?utf-8?B?SWozc0x2Wnh2Q2tzQzNsRDAvaDFQbEcxZlZIOUp6QUxMRVhSV2hwZTRvdzF4?=
 =?utf-8?B?bmFBWUZmQmNvSHBYQzlFclN0bHZEczEzK3UyWk5hVlR2ekYxbG5IVHJRN3RW?=
 =?utf-8?B?cmhnWitDclJURFNEZmFRelBvWUFCMWtIaGhBR1R6YWc2cWJUUFlsVEVwemRQ?=
 =?utf-8?B?VmgzeEx6S0F5NEJzcVZZSmNDb2ZRNlJPcU1aQXh6NnFtT1pmekRpOXV2VFRK?=
 =?utf-8?B?SXBubUtBQ0xQVDZYU01qVzRqVUphYm9LUlQ4YWFwSko5RUs2bE9BRld1Q1RD?=
 =?utf-8?B?SlpheENsZVZES3pBV1JUSktjVmJDWGxWODNXeXNNTkFjTGZ0Q1QvTGt1QVJl?=
 =?utf-8?B?aVdZQ1BCaVZiclN1YThFZnZwZ1JyM0hHV09hYlNTcFJSWGhwZ1grK0x0YVpx?=
 =?utf-8?B?dWpXQmFud2hUVzZLbUU0STZBTTE2OXVSUk1tVnYxSSs1N0hVUlV3UmhvSnp2?=
 =?utf-8?B?Q2hDU0R6Y2NRRGFtc3pWNDMzQ2JVL1NVUTBBTkNIZHEvbE9TTnJVdmJTRnBu?=
 =?utf-8?B?Z3NOOGNCYXhpQ0x0U3ArbEVwV3hKSVZIazQ0dHJIWEQ4dEtLN3NQcW9TV0Ft?=
 =?utf-8?B?bXprTjZGVHdKSnNkRkRSVm50bzdLcHg4eWphQkEwUlQwNzQwVXNFZ0tMbzd3?=
 =?utf-8?B?THdvWWZ1RmwycGd1Qk5JeG9aMHhuc0JWV1FRL1c5cGFmRjRNck93Zktra0hr?=
 =?utf-8?B?Q2x5SmUvQlk1VWRMUXhxeWZpaTd4dm95NUdzQlJKdmN6NzhFeUk3QjVVRjVZ?=
 =?utf-8?B?WEZmYk5ERzBGM0Q4M0ZLdksyZzVwNG4vVlh2MUlVNmg0VTU3MmljSVNqcERz?=
 =?utf-8?B?ek5YMjBMeU56OTVPazZFTWk5d1E4WDVCMW5SbmpTeXdaK2t6MHVQa3RsWWZh?=
 =?utf-8?B?UDFJaTVSSXVndUNDMGRqNkNKZHVFZXBzZGQ5eVUrbVFYR0xPaW1BOEtaYXYv?=
 =?utf-8?B?YzFGbVk5aHRJU3gxL3Y1OUlHMGdROHlnOEpjT3B5eEt0NUdvSmx3NEZMTkU5?=
 =?utf-8?B?K2tIbjZVTkFBcWFrbDYxdTJsVk5UT0puT3VkY2llMzdMVjUwS3JFbm1rSHZC?=
 =?utf-8?Q?iTNXGJlXb7CzUm9ToxnccQp/V9AyLe51qoXRYBx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df8bdb5-1367-4428-2bc3-08d947b45d10
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 17:17:03.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpjhRKTXMM8xnkqJOuySFNzwNveuw+6I+0eunXsi5z3Lx8ZVfuPVCdGcfzMJi07eevE4piYmvc4s4yGc5gdGChhA7HvPB4ROQ5Ytj74xIkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693
X-OriginatorOrg: citrix.com

On 15/07/2021 08:58, Jan Beulich wrote:
> Beyond this I'd like the following to be considered:
>
> 6409210a5f51 libxencall: osdep_hypercall() should return long
> bef64f2c0019 libxencall: introduce variant of xencall2() returning long
> 01a2d001dea2 libxencall: Bump SONAME following new functionality
> 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)
>
> If those are to be taken (which means in particular if the question of
> the .so versioning can be properly sorted),
>
> 198a2bc6f149 x86/HVM: wire up multicalls

We can backport changes in SONAME safely so long as:

1) We declare VERS_1.2 to be fixed and released.=C2=A0 This means that we
bump to 1.3 for the next change, even if it is ahead of Xen 4.16 being
release, and

2) *All* ABI changes up to VERS_1.2 are backported.


The ABI called VERS_1.2 must be identical on all older branches to avoid
binary problems when rebuilding a package against old-xen+updates, and
then updating to a newer Xen.

~Andrew


