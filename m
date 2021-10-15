Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E439242F576
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210737.367722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOGV-0004gN-7s; Fri, 15 Oct 2021 14:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210737.367722; Fri, 15 Oct 2021 14:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOGV-0004eQ-3R; Fri, 15 Oct 2021 14:32:55 +0000
Received: by outflank-mailman (input) for mailman id 210737;
 Fri, 15 Oct 2021 14:32:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbOGT-0004eK-QE
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:32:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ec72e0-2dc4-11ec-823d-12813bfff9fa;
 Fri, 15 Oct 2021 14:32:52 +0000 (UTC)
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
X-Inumbo-ID: c6ec72e0-2dc4-11ec-823d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634308372;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ceJzGrY3tK3KWw61ipDVYOoTuR8tGS9ocfRpj3ZkZzU=;
  b=QJ03exw/OBG2WhgoZ5Ls3mVuF1s45SzId0Xb1+JyJB8D/sZ50FaD9qaD
   EsL1g4wKrHlwdB9iGc4aInQ6H+3R7x9Z8XQPsLn5KFZ3v4f6wGq30r4nc
   y7w3OkllFb4a/KGa/Fdr5EI9gTkB3TqPKaTaXyOqVeCitOz4Cgy3D/Lm5
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VX82wxF8sE4BhkLI26/5J3nnWeC6TspYti0NC5DHScDioYJYDAMvaPFf+cb9c8KxbsigN96AZm
 UJobM4In5qY0TQ507FACX/LraQd6LgWbg4rtwL9wduMIVQh7pzKoTosE2qljPlDLUzwHJDw2vI
 bvodQWXX2+naHFi5CRh4r1s1Ou4h7CCVK/ZUMsEN2+J6Flz8V8zQZqw7YZown7s6iz7043YICG
 ZDCe3HaN9nn5Lh4o9aAA71dLxZy1qVOywsObcxflotu4djHi7FP+Ea9Ns3TYFLy6NwQcunSd70
 iQhyd7o/spbytDcs3b0znAdA
X-SBRS: 5.1
X-MesageID: 55324201
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XuSUHqg3uRtzKlcw6siNuVT9X161SBYKZh0ujC45NGQN5FlHY01je
 htvWmyFaPbcNDf2KY92OYq3oExUuZ7Qzd8xGgRrrH1mRC0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yx3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0KpbjvR1kEHJbvnfYMbxpxDSZ7HoFZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t25sUQayGP
 qL1bxJscy3vTidXE25QDZ5mnfa0vCfZTwdh/Qf9Sa0fvDGIkV0ZPKLWGOTSftuGVMBEhHGyr
 2jN/3n6KhwCPdnZwj2Amlqum+vOkCXTSI8UUrqi+ZZCm0aPz2YeDBkXU1qTovSjjEO6HdVFJ
 CQ83S4jrrM78kCxefD7Uwelu36PvhMaWN14HvUz7UeGza+8yx6QG2wsXjNHLts8u6ceWjgCx
 lKP2dTzClRHsreYVHac/be8ti6pNG4eKmpqTQUJVxcf6t/v5qQ6lAvST81LGbSwyNbyHFnYx
 y2BpW4wjrMYgMoPyo2y51WBiDWpzrDzRw4o4kPsX2Sq7itwfovjbIutgXDa8vRoPIufVkOGv
 nUPh46Z9u9mJYGAkmmBTfsAGJmt5u2ZK3vMjFh3BZ4j+j+xvXm5cuhtDCpWfRkzdJxeIHmwP
 RGV6Vg5CIJv0GWCKr9TPIzvJuYR7q3yBOjmf+7Ta/lifc0kHOOYxx1GaUmV1mHrtUEjl6AjJ
 JuWGfqR4WYm5bdPl2XuGb9MuVM/7mVnnzmLHMGkp/iy+ePGPCb9dFsTDLeZggnVBou/qwLJ7
 80XCcKOzxhOOAEVSniKqdBNRbzmwH5SOHwXlyC1XrLcSuaFMDt4YxM0/V/HU9c490iyvr2Zl
 kxRomcClDLCaYTvcG1mkExLZrL1RopYpnkmJyEqNlvA8yF9Otr1t/1EKsJnJ+dPGAlfIRhcF
 KRtlyKoWawnd9g6025FMcmVQHJKJXxHej5izwL6OWNiLvaMtiTC+8P+fxuHycX9JnHfiCfKm
 JX5jlmzacNaH2xKVZ+KANrynwLZlSVMw4paAhqXSuS/jW2xqeCG3QSq1aRpSyzNQD2erganO
 /G+WklF+7OU+NFoqbEkR8ms9u+ULge3JWIDd0Hz5reqLyjKuG2lxI5LSuGTej7BEmjz/c2fi
 S99lqqU3CQvkAkYvoxiPaxsyK5itdLjq6UDllZvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMbslTtihcjPtucoDpT8mCAci4JX6k978lIC473kAs7jFpFZMWEWCPx5ZiObfRKM1Urf
 WDI1PaT2ewEyxObIXQpFHXL0e5Mvrg0uUhHnA0YOlCEutvZnftrjhdfxis6E1ZOxRJd3uMtZ
 mUybx9pJb+D9itDjdRYWzz+ABlIARCU9xCjy1YNk2GFHUCkWnaUcT84MOeJuksY73hdbn5Q+
 7TBkDTpVjPjfcfQ2CouWBE696y/HIIprgCSytq6G8mlHoUhZWu3i6CjUmMEth/7DJ5jn0bAv
 +RroL59ZKCT2fT8eEHn5112DYgtdS0=
IronPort-HdrOrdr: A9a23:UfwgWK3uRjh0YrG6ahgECwqjBSNyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfBwndL5jUUtHPpZyfSKAMB26ffv9ChPgHb3ZLtBzB5vske+93Fxn3pDhRHQ3pKFC76
 gpFmko7FIPRw==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55324201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DALIi+Prq9V4SwTYINtw3zhnn/Ra12OWT6qLCvSGNYRJixiWXxIrmIOeJBsnoae3/liNnrSRK1O8kGgFuesrYX3TmO/soRyHYtojXQG8UqDa+2P3wD4/tNan2EaBYFX44VZFEfgqSG0I20u3h+H5ql1cXiO2KNvaYYOvrzw8DV4LL2ktYFl4HCHVpXrjhoaba3KuXklbXVHaekJ7C1Dk4iAxHj9eCxXpVtS6pjmlyLGStlDlS+L8d0mPA8cuYc9Zm3t6sHcc4AaUR8hJJuFsNCbBKO6I2lA+v+3hpk9231XrMSr4N6kSfIup4jJoC3WStfGITHcJJJe/rVhnupc2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+H1+SA3XGSvjOPHbiJJ1jibJht7HXe+gh1tDK4mLA4=;
 b=X2W1tpu6FF8OclRe8I813VY4BXpsYRZPJr3OJnK4pE2P7m1It+nIlQVb2Be2iBdyFG8jV9InkZaEUQGxaxUpMZ9vmbu7TdFyzobZp79ANIBBPoNpwBbevywMdb8jGiBXLvxj57m+xFWxriVp2iKYF72hjkI/UeYZ2z+oObrXH4gkqq+rnPyJ8VBOGPvMsvnC19gPQwvangdq1hn0CqG0qhyiCdrprIZ7PoE/LxlHpewSNoygylN8tcjBW0CUu/KzKh/kypFT1ppSQ1qZ6PcRVzogMbDez1vavXnsqNib17E+ZTwYgGtnCdZdLcatvdDImuetVqRf/v3UmWUEC7iYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+H1+SA3XGSvjOPHbiJJ1jibJht7HXe+gh1tDK4mLA4=;
 b=xHSRiPNV0YDb+3bd0k0yjCA+4ZFX48AoGu+kl/1X2pM1w5jgBWFYnGNj/+KGiMI3EHurMel+t2wsVnrNFK/XdfouNfvHmDZ8u7tWVQkkQqA+R99s/YOX5NZkgAWQESBDkCyAI6OJ2I8UzdDucvREJUeUb3to/hCD9jRbcRVOC6o=
Date: Fri, 15 Oct 2021 16:32:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWmQ6HDY53NtPguP@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
 <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
 <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
 <YWmGbzPdCxmwfdIX@MacBook-Air-de-Roger.local>
 <90FEC0F8-A5CA-4B7F-8E94-38223FE3F6D2@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90FEC0F8-A5CA-4B7F-8E94-38223FE3F6D2@arm.com>
X-ClientProxiedBy: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5177d765-95f1-4585-a5c9-08d98fe89496
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55421F889C45ADD22FDA6CFA8FB99@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUfPqIQhaPHJPglYsko4TwforGs89XHNn5pMqHA7scA2lETl5RBVfTqMtlu0G3ljPjP5/42wIdUho+Dh12f3X+jBHUVvd3pvIeLMQoh1CppVtk09QkmBpH3DZY6QnxCWg7i8I8ePkf+rcZ7xv/q16zkNA67dt6AljJ+zmjjA0XPNw6ol+U+UYMqdcSCEwR916Kw0c3T8rngVd+BQ49dle9roM++0JjdE/fi4IYG7GM134DH+Nlb9egb94O/OWYcY8hXKXZ2dj6wpI5H3vG8uPheYBYZ70bxMOAfKDaBWjqt3fBh1fwjAKrr3xN03l7xYhFou+xy5ETDeLLAqKP4zRVpQfhacncMcqGt8xF7IDxnHAPN9uqYitmj6zJ0NGzyR5nuXEPCMZ2SO63TDNZNR7FFYyX9ed+N+s220J1TVgXX2IkPTmt5wr45mjrSzisdMH1b1KruzQNKK0WISl/ulhGlsuOfGITtqC8Q5IDPNQviVOjymkodcfJkrMn5ahqyrAJFA6E3nCFtH7XEejcuxUgZHwpHes46D7GwL7kUSB9Nam36KPLpGg0jOAt2pU40u/qeSzblml4hyDAsJl14LCWGHr+ga0zGKhEAeDe7kU40/dKzvGPUQc5l8NO1H9sWfnpp0EY0ZXw01DqUdROgefQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6496006)(508600001)(5660300002)(6916009)(38100700002)(316002)(6486002)(26005)(7416002)(8676002)(9686003)(8936002)(82960400001)(53546011)(66476007)(66556008)(66946007)(186003)(2906002)(86362001)(6666004)(956004)(54906003)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXhLNXpReWpxNmJVN2x1VHpmKzJoSnJ1Y1MzT1VhV2llSWxLWHQrL1haMzF3?=
 =?utf-8?B?MERFZ3V3MFB1UlcyM2lkNFlkcVhKV1VDa2szcU81VEhYNnBaclIwTkVSSnBI?=
 =?utf-8?B?cTNFWkhqaW51eEY1THJCbmtSQzBnUFUvUkQ0OE40akhjYVZXN25WVzRtNi9Y?=
 =?utf-8?B?em1PaTRNZXhseU0zeXZ1b0NHUTVrVzMvdGxzUkdBUkFkR3hoR1VQQkY2K0gz?=
 =?utf-8?B?ZTV5S3pYZHFwU1NVTytrVWoxamdkYlM3UlZ2WVVDMXFjZTNjTHZTN3BUS0cw?=
 =?utf-8?B?RzFUY2c5cng2a3RIZ3BnWGRyWHYycGFPSTJZUHJYdjR4bklYbVhYS0Uwd2Qw?=
 =?utf-8?B?bS9SZXQwTEZ4MDBmbExiTnZtVTJ6QllnRUY0ajdBOUNIdWpTc3FRSFJ4TCtP?=
 =?utf-8?B?ampFalZtSWpyUHZxcWlmUlpuakNiVnNHblYvMFd2QnlxRGI4S2s2Q01aaEhv?=
 =?utf-8?B?b2VIcElMMFVPWGtieHVyaml1dG9FQnc3cU56WXRmTU9SeXNSdGYrZ3JHUkNH?=
 =?utf-8?B?bURRbWYreXorbzNZQUYzQlFxN29FQ2FtSVdobjJNWS9zWTBmQVUyUFRHK1RP?=
 =?utf-8?B?d01INkdVR3R1eTgyeStjS09SWUhqQW52YmQva2lNWjRaNTlWUEVtcGlOZjVS?=
 =?utf-8?B?Sndwc1AvVHhnNmQzTUY5MmYwUHpvVlViOUZzYjJ4eDhzUDlYTktpMkFRUUdI?=
 =?utf-8?B?M3JyM1VqVFhXb0JlRUwwVE9rVXgzTURCdHFOUXl4N0pXb09jWHI5VFIxUjZm?=
 =?utf-8?B?dVE1b3h6MDEvQndRTWRWMmJzQ3dPWEtyWlpiR3BKcTRscFlBNjdra0U0TmZJ?=
 =?utf-8?B?SlI1YzA4N1pFd012azRUWFFmZit4RUNYbHFqOTRaM2tVRWcxLzgrQ1VrOGxw?=
 =?utf-8?B?ZkZwMHJuNTFGd3FlQnM0aDhUYlJHeDAzQUZJaXlGNExNU2lQUlB3TU0rcWRQ?=
 =?utf-8?B?MWIwdlY4VE9iQUQ2Uk1rNzMwRjB2ZFN5R3hIaWVjenlUZk1ncllhTXFGVjJZ?=
 =?utf-8?B?QXFmd05wYzF5MFBBSzMzcmxQdk5mMUU2bDNnVzdGZkwxYWptbm9PWnlnN1hQ?=
 =?utf-8?B?UzRoUUJya0RvcmplQUxoOEFaOGUyd0liem9rUEFvN2pKRXRrMTMxeXc4ZHRs?=
 =?utf-8?B?UlZrbU4wWEZFK2JiV1YzZ1kxeWk1b2t0TnpmSVdNSDNtY0diRWNtMjUraE1Y?=
 =?utf-8?B?Tzl6M3VUcTVLbGVRblRTT1ZXeUFQTHE0V1VHemlLV1pQUHUvK1QrYTBXdGdO?=
 =?utf-8?B?MFZySmhHV21qb010M21Cb0p3LzFRTEtadGFBSjJjSjFkdnN1MzV2TEU5Q3N3?=
 =?utf-8?B?MzRBTHZzQ3RjQkd1YWNhNVBmRktKOEh4UUVMNzZid3RZOWFuVHhRZGtucWx5?=
 =?utf-8?B?eGNnenZwcjlQMUpyZkM5RFZwTkwwYlNvMlN6cjVEeldoanczdHlJbEREd1RH?=
 =?utf-8?B?ZG5oL3FYK2VFUWJFTmt5NHpUUnAxUC8yMGVjbUpITTQ0cjlwQkNTVTVuYjlB?=
 =?utf-8?B?bEo5WThVaURsY1p5cHhsOFNXdUwwL0NHV3pUcjN0REZCY2FneEFZanZmbi96?=
 =?utf-8?B?eVp5RnQyR0Y0NllJS2dVMFE5dUtPMnBQcUpTMWdOMDlJQ21ycUU2R0YxVnU0?=
 =?utf-8?B?aUgyT3Bvc2xQQkhwV0dSazdUdXp4QXYya052MGxXTU80WFl5dmxmMlg1ZzBZ?=
 =?utf-8?B?bjR0M0pmYTA0SFZTZDFXMFZOdzFLaGFraXcwTmVHN1UwUEo1eWhBMnc3emwr?=
 =?utf-8?Q?79cM8GSaFSOHkXwyUjVctaCjbAbRtSpfaq1ADb4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5177d765-95f1-4585-a5c9-08d98fe89496
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 14:32:13.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkxDBOgnJQ2yB6b8WKqMH2fBWvOi2EI8hTu6qbWFOhMV0lUwklKE7O7sRIi25P0FI9ZM6yPCl3eWnYSYTHwFaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 03:00:21PM +0100, Luca Fancellu wrote:
> 
> 
> > On 15 Oct 2021, at 14:47, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, Oct 15, 2021 at 10:48:41AM +0000, Bertrand Marquis wrote:
> >> Hi Jan,
> >> 
> >>> On 15 Oct 2021, at 11:41, Jan Beulich <jbeulich@suse.com> wrote:
> >>> 
> >>> On 15.10.2021 12:33, Bertrand Marquis wrote:
> >>>>> On 15 Oct 2021, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> On 15.10.2021 11:52, Bertrand Marquis wrote:
> >>>>>>> On 15 Oct 2021, at 09:32, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>>>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
> >>>>>>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>>>>>>> 
> >>>>>>>>  check_pdev(pdev);
> >>>>>>>> 
> >>>>>>>> +#ifdef CONFIG_ARM
> >>>>>>>> +    /*
> >>>>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> >>>>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
> >>>>>>>> +     */
> >>>>>>>> +    ret = vpci_add_handlers(pdev);
> >>>>>>>> +    if ( ret )
> >>>>>>>> +    {
> >>>>>>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> >>>>>>>> +        goto out;
> >>>>>>>> +    }
> >>>>>>>> +#endif
> >>>>>>> 
> >>>>>>> I think vpci_add_handlers should be called after checking that
> >>>>>>> pdev->domain is != NULL, so I would move this chunk a bit below.
> >>>>>> 
> >>>>>> On arm this would prevent the dom0less use case or to have the PCI
> >>>>>> bus enumerated from an other domain.
> >>>>>> @oleksandr: can you comment on this one, you might have a better
> >>>>>> answer than me on this ?
> >>>>> 
> >>>>> Well, without Xen doing the enumeration, some other entity would need
> >>>>> to do so, including the reporting to Xen. Obviously without a Dom0 it
> >>>>> would be ambiguous which domain to assign the device to; perhaps it
> >>>>> should be the caller in this case? That would make that caller domain
> >>>>> a pseudo-hwdom though, as far as PCI is concerned, which may not be
> >>>>> desirable according to my (limited) understanding of dom0less.
> >>>> 
> >>>> This is not really related to this patch but the plan is the following:
> >>>> - enumeration would have to be done by the firmware or boot loader before
> >>>> - xen will have some code to detect PCI devices
> >>>> - dom0less can be used to assign PCI devices to guest
> >>>> 
> >>>> Anyway does not change the fact that this must be called when domain is
> >>>> not NULL and I will fix that.
> >>> 
> >>> Since we now all seem to agree that the NULL would have been a problem,
> >>> may I ask in how far any of this has actually been tested?
> >> 
> >> With the whole serie currently on gitlab we have extensively tested passing
> >> through PCI devices on Arm in several configuration (number of device, MSI,
> >> MSI-X) and check that PCI was still functional on x86.
> >> 
> >> With the patches pushed to Xen right now it was checked that:
> >> - xen compiles properly on arm32, arm64 and x86
> >> - xen compiles properly with VPCI activated (using a patch) on arm32 and arm64
> >> - xen on x86 is functionnal (using basic test on QEMU)
> >> - xen on arm64 is functionnal (with some extensive tests on different targets)
> > 
> > I thinks it's unlikely, but since I haven't checked myself, could you
> > see if the vpci user-space test harness (tools/tests/vpci) still
> > builds and functions properly?
> 
> Hi Roger,
> 
> Bertrand is going to send the v7, however I’m keen to do this test but unfortunately
> I’ve never used it before and I don’t have an x86 environment, do you have any
> resource that I can read or some guidance?

Oh, you just need to build it (make) and then run it (make run). If
it returns success everything is fine.

Regards, Roger.

