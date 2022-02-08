Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B164ADB0B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 15:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268414.462245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRMd-00077X-SR; Tue, 08 Feb 2022 14:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268414.462245; Tue, 08 Feb 2022 14:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRMd-00075a-Oe; Tue, 08 Feb 2022 14:21:03 +0000
Received: by outflank-mailman (input) for mailman id 268414;
 Tue, 08 Feb 2022 14:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHRMc-00075U-Lv
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 14:21:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c81d923-88ea-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 15:18:56 +0100 (CET)
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
X-Inumbo-ID: 0c81d923-88ea-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644330060;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pIte53h44x5fhUYlY3VTcKRLTA+ctGQktC/DEOz+c6A=;
  b=ZUN9YZy2AinhrN5M2fmSggFaGLkBZgCe0wolBeGb0rLnaDxuewTGLVb3
   gwGI60tNyHoDD93Lh5KuUkInOYIeFLjTKpO3svwR7fzplcrFQu6DqRqeb
   ObjgqXBZgILAqN03aW0oyvlY0UCtbfFnPmB3k9gIsVgpNsffZfRbyk81/
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +xiYGoC+qsegN+JHcbXLsLRJBdoO+nyMEAIssiK/Pn3YZtdGYrMFUl695Rb8vK3pRUqnKp4mBN
 nPsG7G61p3llZ5uXqKEvovMBTbnSW33HOuJwhRLE5T8AuJQfcFg6X128GBk8YUaVfrmQ0CHpGs
 GrenPpz+N3tti5gNmwuDe6HnWuVfAicqRoDPeL3IwUPbBR2iqUOhD8mJuKYNS3NvFNET12K3Uh
 OrqTVgzaD9s1bzOElx6xJkgifxrFXRKaNmUaSCMyNr6RzLKteFVZc8cz3EGa4HkTgbVU4cKQjm
 IRU8uJ0f37Tk/DNsDQEUBQDj
X-SBRS: 5.1
X-MesageID: 63193085
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kKQwVayrbMWrbaYjgKN6t+flwSrEfRIJ4+MujC+fZmUNrF6WrkUFm
 zYdWW6AbP+KMTH8eogkO46zpxkHu8PSzYRnSgJq+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZp2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9xXx
 exzvKaicAsgA4flocoabSJzGggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDhWZr3pATdRrYT
 9oaWzt/RTbbWRlCGG5IJak4hbyKnVCqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrFiJhyAVYchpH+QHwii05K3q2C2QLz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3Ct4afe6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV9rmX0oiDyJ9kLiN2bGKuOGpxVEQIFn
 WeJ4V8BjHOtFCfCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCZLYYw6nWHeb7pMjtcDmHtkrUuNHs+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Fb5TTkEgEALSlCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnmMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:XesoaqNIqtUw+cBcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63193085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pbol0T88iJijiMaBr8DtkzSbbt+C6/VXFFFIubn6rJ551rlt0CcmDPn8PmFtHUzvM32ofscfupah62OmiX8T51FThAOPncCWA5cFEHnzSHQKB+81ZlbrO2tlsbNEiGWSPIifh8DzivHI25RohvCNHS7UrPAW1fsqave6pYkjrOuuNxXbRPj4abtVBEIradEEoCUDrA4tWMzEyDC8aLOV02LUS1tfAvXAzfyV6oRgjRENxkgypzfcfnfykIIRtH6B1y/vFnIrKvjV5Oe+tOmFh9v4Li0JrQkL2owpa3AcmOwJ/nMfl6RWPLOAKX04LzOyanYIDj4sXF5At9FyEolWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gxTzl/mPoCjmNud5hzbeUq0vipQfH+7SjjRAOhJ22k=;
 b=nwns9HNFYzkQGt7kllRS+APKAz27Qs0vwohYA7gknEusqLevxK6M5lKEh8ZckTcMi8+4x2CH6767u37w4x/YLYf1+bNYH5r3gb68lJNy1pOb7pAx46z0n4hqBlMuKrq2HR16GNpmNC6FC6/TC//iKudzQ3nVHr01T2tNxB5ylPkkIRIArUVObbdfvB8Mi6Lt9UK9jx8jszxV2ED7huW8feUHmoASmo24P13Mko9hGke2S6T8Ojim5ecLvZTmZ9DypXX19ONk4VfRv46hY4FeOzD0CrKZV93RHzwIbtSTMWkzGUyzyWkdk8lIOrg3c7jjzDGqt6oeVHiRGHvcoZXiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gxTzl/mPoCjmNud5hzbeUq0vipQfH+7SjjRAOhJ22k=;
 b=nEMgPPOidvTOgUX3i++x4KkYZ0DH1FYvY4pd9fGSmjBNANb5ArsF6/7B0FVp3i6dX/eYslc4rrpnc2slHEOAJ+5agPajoA025OALxhOd5bXfTuLZuQgNcumDj6nfYTGiLvrE0tnjmL5r6f6OpR/cviIFgpkINN/LCgSomFTzVI4=
Date: Tue, 8 Feb 2022 15:20:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/Intel: don't log bogus frequency range on Core/Core2
 processors
Message-ID: <YgJ8REZepbp7WKnv@Air-de-Roger>
References: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
 <YgIv3O8ojoDK+wiR@Air-de-Roger>
 <1680d537-fb6d-c589-66bd-f845b8280308@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1680d537-fb6d-c589-66bd-f845b8280308@suse.com>
X-ClientProxiedBy: LO4P123CA0231.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c71f93d5-fc9a-4fca-4a25-08d9eb0e38c2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2570:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB25700BFB6EC3C1FF5E9BBFEB8F2D9@DM5PR03MB2570.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cU1tJfhbpUjmT3oH6WQ2Dna5YssjMCMEKmMEwmkmqCheAzszzSx/9EpdMUvUenvx6G1wc+tO7A1kI4RRahL1xDdSxqGI8FfOC5BGJJ70CUKwLE7uf6XOMCubQdjCJdhJYPjAMCZBGAGN+kzCkRc3qIqhqLjrhAfjcvBc07gj5AIEGHwBAX9Ocmb9W4aPTFEz1RpfQA5XQXca8tMQFMITslTjJKfRUeyfj626+s0fFEIDdS85cpl4YJ5XcGn7WteZ/EJVdQ4wZ36Wj/NmvU9PQdwoj9O+gk72WNI7DelkcFfg3sO0Pwd1SvWEw4tj9H57JrIaOGBxJsp9EZ88uNCcYbWoW8AAt05m5TkPFArnGXEnqBkaU+EuVlvxqYxmzSsP9PV8U1rFeE2Hy3pF1OtZm5fB4+3z3q7mFsfcDm13dfyJJb7MHVPyEAmqit8C1Gm70t7SV2+S/LlXWmMgFzGSTpXZVKcqsZyCQzOsk7QjhDh+2pwPLbqdSNp3t3AyH8YzvljFEnp/EVlhFgkXWwA9j3j7ndBfjOYObMM/my/VVWmHszewxe9jA9DrP0D7GdSZ8nsFw2loyxZoK3Ojg26P8EFN+1tEl5KksbGTRRSIlU7eUnHUo/hUymB1CHkSEnu79Dzm3bdLd3w27EqIwI7Cig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(5660300002)(6916009)(6486002)(508600001)(33716001)(82960400001)(316002)(85182001)(186003)(54906003)(38100700002)(66476007)(9686003)(6512007)(26005)(8936002)(8676002)(86362001)(4326008)(83380400001)(6666004)(66556008)(66946007)(53546011)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHdUNlBZbzA2OFFpOGZTUm1oMUFjMDFJdXlhOHN2d3ZlUFlBUTRqTlJmWTkx?=
 =?utf-8?B?Tkp3OFNhbjBpSmNITHZMM3hIMGdOYWJTYTEvYjcyQmI4eGhFeVovUWRVbFBE?=
 =?utf-8?B?Z1c4R3FhN0xuL1pPU2RaVWVaMmxYcmJhT0pzMi9BaFZjajJ5eG1yOG5ucjB0?=
 =?utf-8?B?cVJ3Q0gvdEpYMkdqUlUvanFYL2RIU2ZQR2ZXb3lYUWtYOTYrQkYvaE9JbkJx?=
 =?utf-8?B?QmVtTlU4V2NRS2lhN0dLN3l1RmpONlNmdkRvM0IxY3FpNUREK3h6Y2tQR2FV?=
 =?utf-8?B?V0EreVJHQUdTLy9IUDNzc3luVzgzUGo4bGVVRFo1QlhFZHJqYWtvaFlVVjQ2?=
 =?utf-8?B?VGdEZVVzSTYvU250K0tsamYvU1JZZU1ac3FnSi8yam5DVVhUSm5PRmlOc0N1?=
 =?utf-8?B?QVZCb05vZFVlWnk0enVVRmFuQjJheDZVZC9CWXJySVN2d00rYmJaMkhmTW1D?=
 =?utf-8?B?UDdqalc4eUxNZ3YyQSthSy9kbjQ5MTVENUVNY21pQTV2YmhUYytJNllXTzZF?=
 =?utf-8?B?VjZIVWk4cGFFZ1FUNDBpeTFBL0VjU09mY1lxYTI2cURCQUs2Y0tjdzlaUEdL?=
 =?utf-8?B?bTR4SytSM0NXMXRTYzZ4eXZnVWQzRUJ5eGF0dzBWY0hJQWlLLzd6VUYvcGlX?=
 =?utf-8?B?eWUzZVRmbFlaY0d3RVQydnZpVlBWTGlEOTd6eG96RHozYUFEZm1wdHp2MVNF?=
 =?utf-8?B?MG1ueStIUnd1YlRSaWJOSHV3RTlzSUtDY3F4TCtodGNqNkJhU0pLVjdnWXlz?=
 =?utf-8?B?dUlGK096VW41Qi95OG1GaHdkVFZITUVIMGdzRVRMbndpVEVSbWtieXRrTVlm?=
 =?utf-8?B?b3RQbTJuM3FFNnkxRTloYzVtbU1qTm8xa0QzbHVaVUdOeUVGZXp1S0R0MHRE?=
 =?utf-8?B?bU9PR0RtZ2FiS09ZeFV2K0VOaGRWZXlMK3Vzd1hKbTlSUXM0VHNvYktIcXRJ?=
 =?utf-8?B?dGMvSldFUG9DNjhhc09obEFpd01vM0FiMzhJYTJRall0MmdkT0ZUMDlCMEFC?=
 =?utf-8?B?L2lkdCsvUEw5WW5oR0RwajlkVjdXMmdzL04vbCtPSGJkeEFyQ3VCT1NLRUxV?=
 =?utf-8?B?M3JWdnYzNE93Sk1NZnAxTENPVlF2eTdDNmd6Z0t5SVpQWWpBOGs1bEMrd0I5?=
 =?utf-8?B?NTJGNE5ncVUyV3FNNlA4R0JsTnd4Qm41UlNnNXlIMmJNYmcvSExWdk9sR3Vh?=
 =?utf-8?B?MldacUE1N0tDVUowajRLZmVsaGN2Zlp1RlNjWnBLN214KzYydmJGdC9RR3hU?=
 =?utf-8?B?Q0w5bnFWaTBRcHJkRnpxRytJM0FmYWpqaVRTNVdkalBkZUtNWnlzUHppaERt?=
 =?utf-8?B?N1RuM0RWMzVncWhvS3N4MUdxakpVY2RHay8yRnVCS0FPVEpiZWUwNXZaRjFz?=
 =?utf-8?B?S2VsbWZqL3R3MC9jRExDWkhHelFwMVhwVmdCanYrYmJ4TDlnYVhoc1BZT210?=
 =?utf-8?B?OWxWdFR1TkhOTk1LTDFTZFVhRmxQYStITUVTQUpYSndyQnNpWDRMNWUydVFm?=
 =?utf-8?B?SUdQb2d6bzd3eTMzeGhBOVZIUEREMnE4d3MxaUh3aGlKNGRmbkFHdVp5dE8y?=
 =?utf-8?B?REZIWkZTTGNaeHVwdDcrUWZpczloSlZFMmtwQVhVdHMweFpDWmd4K0lxeVhm?=
 =?utf-8?B?ZzFvck10enV4YnpiNnRZK1B4dEh5L0NmVVdpRmN5Vi8zT1Biayt4Y2tWWWl3?=
 =?utf-8?B?WjdIQk9WSWUybmt1UEcrMXBZVDlTNnkvcDdpVEJtalJrSXRuOC9TMnJST1RM?=
 =?utf-8?B?OGJIUVg0bUxVMlQrcFZaRzI3bTZKTFFIQVRkZ05ndkhjTFl1L1RhM29pa1E2?=
 =?utf-8?B?OW5oY0NVVkV4QkhZU1QxczRRbzZHbmxHcUdPT1dIbkNsWkdyQmNpL3YyRDRV?=
 =?utf-8?B?RHFsWTJua3gwOTNTZFZmUks0Z1hmZjJGb3VJVU56Y0xoVEJRUlZyOWowb2oy?=
 =?utf-8?B?NzBHWEFsdU80Y1p4WnFQSkJOa3RaUW4vcXZYbDE2TGtZNTV2OFZUajZLMnlh?=
 =?utf-8?B?MTRaQ2tla0VmUWNLRjNpR0tCYWxLM3hoLzI1R1cydmtyYm1lN3BKVXlmOHZ5?=
 =?utf-8?B?OUZEdVFlcVRSTlBhYUExUnZLRnVIajhzdlozSTJWckd5WHkzVnhmU0tKSzNW?=
 =?utf-8?B?eFhKQy85amdrb3UvTGw3ODViVnlEVzBZQ3lkZEhLQzlYR1JzeEh2WlRwZEpp?=
 =?utf-8?Q?DdT8LlxON5r8EUm7d4y36VM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c71f93d5-fc9a-4fca-4a25-08d9eb0e38c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 14:20:56.5524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8U/n4qWDvDPaodVgNrKAuzS2PDa+1m7jV5aewCoK2CTPGcj5iVqTxtb7YbWf3Y6JWeeIAUJ6O3SKjXQGxLkeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2570
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 11:51:03AM +0100, Jan Beulich wrote:
> On 08.02.2022 09:54, Roger Pau Monné wrote:
> > On Fri, Feb 04, 2022 at 02:56:43PM +0100, Jan Beulich wrote:
> >> Models 0F and 17 don't have PLATFORM_INFO documented. While it exists on
> >> at least model 0F, the information there doesn't match the scheme used
> >> on newer models (I'm observing a range of 700 ... 600 MHz reported on a
> >> Xeon E5345).
> > 
> > Maybe it would be best to limit ourselves to the models that have the
> > MSR documented in the SDM?
> 
> Well, yes, that's what I wasn't sure about: The information is used only
> for logging, so it's not the end of the world if we display something
> strange. We'd want to address such anomalies (like the one I did observe
> here) of course. But I wonder whether being entirely silent is really
> better.

OK, let's add the quirk for Core/Core2 then.

> >> --- a/xen/arch/x86/cpu/intel.c
> >> +++ b/xen/arch/x86/cpu/intel.c
> >> @@ -435,6 +435,26 @@ static void intel_log_freq(const struct
> >>          if ( c->x86 == 6 )
> >>              switch ( c->x86_model )
> >>              {
> >> +                static const unsigned short core_factors[] =
> >> +                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
> >> +
> >> +            case 0x0e: /* Core */
> >> +            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
> >> +                /*
> >> +                 * PLATFORM_INFO, while not documented for these, appears to
> >> +                 * exist in at least some cases, but what it holds doesn't
> >> +                 * match the scheme used by newer CPUs.  At a guess, the min
> >> +                 * and max fields look to be reversed, while the scaling
> >> +                 * factor is encoded in FSB_FREQ.
> >> +                 */
> >> +                if ( min_ratio > max_ratio )
> >> +                    SWAP(min_ratio, max_ratio);
> >> +                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
> >> +                     (msrval &= 7) >= ARRAY_SIZE(core_factors) )
> >> +                    return;
> >> +                factor = core_factors[msrval];
> >> +                break;
> >> +
> >>              case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
> >>              case 0x25: case 0x2c: case 0x2f: /* Westmere */
> >>                  factor = 13333;
> > 
> > Seeing that the MSR is present on non documented models and has
> > unknown behavior we might want to further sanity check that min < max
> > before printing anything?
> 
> But I'm already swapping the two in the opposite case?

You are only doing the swapping for Core/Core2.

What I mean is that given the possible availability of
MSR_INTEL_PLATFORM_INFO on undocumented platforms and the different
semantics we should unconditionally check that the frequencies we are
going to print are sane, and one easy check would be that min < max
before printing.

Thanks, Roger.

