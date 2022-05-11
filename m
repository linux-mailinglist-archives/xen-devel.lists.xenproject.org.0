Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79E6522C57
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 08:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326522.549060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nofrl-0003Pd-1L; Wed, 11 May 2022 06:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326522.549060; Wed, 11 May 2022 06:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nofrk-0003MT-TH; Wed, 11 May 2022 06:30:32 +0000
Received: by outflank-mailman (input) for mailman id 326522;
 Wed, 11 May 2022 06:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=menc=VT=citrix.com=prvs=1234ac902=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nofri-0003MN-LA
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 06:30:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d69c118b-d0f3-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 08:30:26 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 02:30:22 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by BN7PR03MB3443.namprd03.prod.outlook.com (2603:10b6:406:c4::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 06:30:19 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 06:30:19 +0000
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
X-Inumbo-ID: d69c118b-d0f3-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652250626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=TFL9dlCMfxbvGqkAsRJlC4OhrUU7mwiZe5djc7sZHy0=;
  b=g/dwzcc2XP6v+rrBzgxj3RtSJl8ftA1DuRztZvhmeRbatTRRwxdE0fm5
   Qh3Mzk6Q685X0tLHzj6Mvl0EHUXaIbrjCRWWX1Slv9mIejWYy7N07XJIE
   9PxAGUVXFMsbwKqzAexYdoniHSwUiTfQKsworxzx2VH+ABO/kzyg++Gfm
   s=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 70430529
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:msIuUKIBdS5ffLL2FE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS0zYCx
 jMcUG3UMvqONjb9KtF1b4XjoE9TsMDXyIdqHFdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39cx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MsV7o21blYsApL3tbkYbyt9FntzYoQTrdcrIVDn2SCS52vvViK1htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM+FGvqWjTNb9G5YasRmGffYI
 c4YdBJkbQjaYg0JMVASYH47tLjw2iKnLmcJwL6TjYMuw1TMljFN64HWIOXnXvfWbMFq3UnN8
 woq+Ey8WHn2Lue3yyeB83+qrv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGtrMu/UamSt38WRyQo3OeuBMYHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mLicSHbY+rLKqzq3YHERNTVbOnNCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlVdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:fOHhIKgvo5dW668Cq5GGN7dpY3BQX2913DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftWjdySGVxeRZgbcKrAeQfBEWmtQ96U
 4kSdkHNDSSNyk2sS+Z2njfLz9I+rDun86VbKXlvg5QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Lm1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoMOCXMsLlVFtzfsHfqWG1TYczBgNnzmpDr1L8eqq
 iNn/7nBbU215qeRBDznfKn4Xic7N9n0Q6f9bbfuwqunSWxfkNEN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amAa/hGrDvCnZMZq59ks5Wfa/psVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV5Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r+NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC7K
 gpkGkowFLaV3ieePFmhqc7jCwlaF/NLQjF24VZ+4VzvKH6Sf7iLTCDIWpe4fednw==
X-IronPort-AV: E=Sophos;i="5.91,216,1647316800"; 
   d="scan'208,217";a="70430529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOcqn5i9vkgFXDHWy4MTe6juThZx0BWTlUoj/S4QiVwqNPcK3BctUY8IPwZE3cfvzk6537aRaDBJYe6cGNEH+7EihycE/DiKTQUgrshzhsGY983BKyDE8GyzunBTNLT6SCWkNNjwdtSYgQ0Up4qXSDofGD2E+GED33KlptPm9xY6RXd7gC8jqtZ7chmW/4g9VEvNT7bGK9UFPJAFImQJceo68Oo3obD/4OX+r2WSFsx/xQoZxKiIjeaZBSt9QtgSRpzeNclukrjWyJe8LfIjvDgfjjCINU/3u54zOXC4l8cmyJwDWWSZBB/OltSj4FYr2b0/TsRrhW4asAnosfzRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsMDPhkf7hpkp4E2x/aTlXYhIAKY0+sqxGm/yPQjrpA=;
 b=Jl4N9IPWNVD+xy0ktqwLba2tmSogNNK24apmCIqOcQDb7fAhJ3k8730jGM/aPlvXuSIJly1P6XKN01hIDG6AYW0OS9HTkehWzvwnwUoQ1wOd62sBl7qhNeuOryd2dTOyjJ2rPu1hq0tmzbP5Cuz3zbGyk2sg+MF4pNd8YQno6ltoto/MMvRQhOoppx/vKDJYm25kraNpjfdBgOTEhAH5Xxuo18QujEBKRTWxSIM3CVkOMAOnP8EU01hm4bu7GFmbv+BQXPR55jm2F8V9yYvuAQkus45YQihvSEymm6ELZq9qBU5u9bFeq1tCnAq0HynDp7sM8zdhgAFjSXJ+dnslmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsMDPhkf7hpkp4E2x/aTlXYhIAKY0+sqxGm/yPQjrpA=;
 b=W4aEEDibzxAUn171mRh65mrPwnCcRNGPp1h0Z6HSn8wkBcSiPSDl7uCfIChQH8KmtD3aSKGHqajwrchyMhTK78/E2LxhBKripoyb/D6m7zLNl+1jYDy0HmamTrRBaNpYbEyu/G8T/EbZs0LjHS6t9UgJlC2+hX0om1sl7DLEHMY=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Index: AQHYZFbwMAUPLb2cVkOFb20aHHYzoa0X7v0AgAFIaw0=
Date: Wed, 11 May 2022 06:30:18 +0000
Message-ID:
 <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
In-Reply-To: <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41cba1f3-1ff1-4e89-b03f-08da3317b7f1
x-ms-traffictypediagnostic: BN7PR03MB3443:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB3443FCFE3B9FA47BE06FCBF39DC89@BN7PR03MB3443.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6bRy40ICPJoKWzHqIah1roWnCezEsUil15MDXp3qpJM4fO0l/anAq6Rg+9EN9PZpzFuPmmbbZlacgBkY7UDJ2Gl0dcy3E/yNWD6Oi86NXtHNZozXNcYLDrtgnG2rslLlk3PbI5PUAaOXvzltd7VvAhC12Dso3DQa+i/ArLgNIhxl4I8OkQfvOiuL7U+AkBIbVmLs6+rMtk6kXtSxJPDUUk+wZLQkrHsdqeEwZv3JpIrNCND1eZPQCcmaOzz07K8s1KSQ2DRc6WEbPUUxo8DRJ6xUzkiY5A17ebkd5nFzfpt3QVXmJ4f0bx7enoyQM49yvJdlBdSedUQcLkM56U3D/367vTI97FmwhypUMIme0p2msifqlG6Bvr49cxUz52zWgcAWXbx3Is8Z6EVPmIcFYu5yIH4BfVUwSj+p5ZikCysUR/8AqSbNSUQftUTufvydT3J087V4niTuElX8MMmrHCYBc7faIq4pPqo9KjYg/5eWBcSUIK1fjPB76bG2vWhiDxtDV8f6gFJkaQ2GP3DVfpe96vstunL+3iw4e0beQ2L3T2/X4O0BUCRfdBPEQqaNjcNbA+ykzkda8gBvQqt4Iwz0T9O4AGL4posOCAMmHMbqLBIi0fHCoJUk5eUZS5vSn4JzjiYgMlldgWI6eLj1s8dwIJ7XV4BxkJwhunNjbMqjZyIwK7DkMTfg+rcsps4ZCG+//eICP1EAV6gVZas7fcw6UhJqcCw80Gs532BIVwtgv7AF8zvLt1q3lxb3wTCRh5uh7P7I90sp0HJ8SvyrWRmmAfXd2gvp5qiDD1h79T8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(76116006)(82960400001)(55016003)(91956017)(38070700005)(38100700002)(966005)(316002)(508600001)(8936002)(110136005)(54906003)(8676002)(4326008)(66946007)(86362001)(66446008)(64756008)(66476007)(166002)(122000001)(83380400001)(71200400001)(26005)(53546011)(7696005)(6506007)(85182001)(9686003)(186003)(2906002)(33656002)(5660300002)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MlErd3liWTN1Nysxd01HVXpYRnNJaUh2ZEhYRlNuOU4xc2Vwa3FPQitKRU1U?=
 =?gb2312?B?OVl2aXppK1ozMStHRC9EcGhnTnlsdDdSWEF3OG1QcGlneHRrYVhPR2IwdXF0?=
 =?gb2312?B?UEg4ZU5uSnVDOStKVTFLZ3h6dWoydHBSWUZTRzdJaXFWZ1NQY2hhcGpGL1lK?=
 =?gb2312?B?KzRTd3dyZlFhcUM5VmkzMDBBOEwxWSt2NlJ6Qmh3VnpxYkd3UUYzcElsTm1p?=
 =?gb2312?B?bnROZ2xqdlM0T0IvcEQxZ291OGo1c2c1S2txSjdRQ2Q3VGs2OW9sTXgyTnhY?=
 =?gb2312?B?eXM3dnJPTUVkKzRzKzI3ek9JdDhnb0ZIYjllbjh1Unl4b3RlL1N2RmVkeHR4?=
 =?gb2312?B?VStYZ2VrcDdxV3dRY1o0bFljVkRTb1JSR0tMLy9QazV0eUtKcHMzYWI0L1E5?=
 =?gb2312?B?ZEpqY2NESnZBNitaRytvM1duNVc2d1N1eUY5OFBWSVBMNmRLbFp6eUxCekZE?=
 =?gb2312?B?VGhabGJUS0NMVmpZVmcvOG5pVVRPR0o0ZEc2ZHFuano5YXhaRWxSbHdTMHpZ?=
 =?gb2312?B?Z2t5ZkovTjdvRzcxVFo4VmIvNGNmQUc3NUxjTmtpL2MzVi9Xa2JzMG4ycTJG?=
 =?gb2312?B?QTZYMmR0TDlUdHhUZ1hKa0VRWEZGa3ZZTG14YTZMWEd5RklHdmlTYkVqaVVX?=
 =?gb2312?B?STFDUTZWY25QTVdTWFRhdlJMUTM5dlk0dXJwbzdKNWsySFQ4K1F5M0ZPZTNU?=
 =?gb2312?B?QXR0SWR2ZWxaWmlkUlh4Y2Q0M2w1VG1oQ1N2TnFNY1lNM25yeWlvM2IvV1dK?=
 =?gb2312?B?anpNSmZCZGRSQk9sdDErNExrVjMvbmlGOTltS3d6d1p2RzRDNXFGNTljMW04?=
 =?gb2312?B?RjNKTTR6Zjk5by82RHM5QXJmbm4rRmhOc2Jyazk5S05PMDgwZkd2U3B2WWZv?=
 =?gb2312?B?YVFRbUs2bVlBUWpacFA1MTY5T201MjZGcERRbE9YVStWNjFON1FCZSs4a1Vh?=
 =?gb2312?B?cUNVY1ZIc2oreU1Xdk9BYkdWb3NNQiswcVE4Nm14Zm4xakpKbURQTXcxb1Y2?=
 =?gb2312?B?aDFuYzQ2eEh4b2NwMFcxUUEyR0RHWmlJQ3krdXg0c3BraWRrQkJqY3I4THpr?=
 =?gb2312?B?bEg1RW5PMWNNbXFoNzByVlA3cXlqTjRQdFlxS0dTNXJFcUh0Z1UzY09iUG9a?=
 =?gb2312?B?RmZsMWRnZGhwd0xoSW10UHhTeVo3NXJaS1ZwYzZzUUlxVkVwN1k3QWtkc2Fw?=
 =?gb2312?B?Z2FrOEI4SzcrWDJUN1lpUGRENjBCUjEyc1BJMXNxL1F3bGpKc1BVTWN4eGZT?=
 =?gb2312?B?ellOd0E3aE5CMDA3TjREb1BRZk54cjhmbFYyQUxJdjkxd2pnMjdET0kxNXlJ?=
 =?gb2312?B?R2V6NGRpR2FxM2pOaG9qb3lLVVRDRFpCclFGUHdCZkNxZWlLb09Ebk0yMUhH?=
 =?gb2312?B?RmJNa05USHZjTytLUmNkcjkyNkNvSnIyYUNNK1ZJeDRJM0pDWUZ1WWE3dkJR?=
 =?gb2312?B?WmpCVTFMSjJtREZTM0RtVUFmcDg4TEl3NHNjd0ZSa2FzNjdoRXVBTGpWNmpZ?=
 =?gb2312?B?QjB6eXQ3WkpOY25PNUZkR0MrbkN1LzUwVVl0aFRQVlhCRWtWckt0ckZ5dlZW?=
 =?gb2312?B?YUpTK0tzMXpUdUJjUnlzZll5Q0E3MHJUK3piVm1welMvaHA2U0J2QmxvQk9i?=
 =?gb2312?B?SXhPRjh2RnZJSTJhdTJDeXpobjV3dUNHd3Ayd3NHQnk0MWxYNjZRckQrOU5U?=
 =?gb2312?B?OVFlaFRoQk5rNjlHVEpMcHdlTmwyRk9hNFZEcHoyQVZlY0p5cGRDYVdnSFNw?=
 =?gb2312?B?b1lsZkR0MTg2NWx6T2MwajR4VzdUS3VFcEMycVdlelBzWk1pamNMN0NjK3Bv?=
 =?gb2312?B?NVJ2aE5ML00yeWMyWjIyYnhlUnVsZUNHcXFzbnM3UG9EZTF2Mjh3VjJnUUlH?=
 =?gb2312?B?M2dDTGQ4cGNBR3dSKzJCSVNCQWc1eEtRbjJzR2Y0MTU0NjZRcThxVkw4M21L?=
 =?gb2312?B?KzQ5TXVwN3NoZ0ZDQ1FDeUkyakt6MS92a0dhMFdPTU9SY2NNcTNvWHBqdjVD?=
 =?gb2312?B?a1BpWHl6L0pDbG9iL205QmRNcEUwT1NiZU5DaVNtTGp5dGQxR2MrOExHb1pG?=
 =?gb2312?B?RlVEZGNUN0pRNDQ3UmhDcGRzbU9zN3JmQ0Y5VHdXam9BMVdjeGo2Q2psaUxY?=
 =?gb2312?B?ZEZ1YlFXQllTQ0NsZ2NVUzlQdlNFQmdmYlNBeGRkQ0IzZ0IxK0gxaGg3Mk5w?=
 =?gb2312?B?VUVQa2wyZUo3bmdxZElhcVRRck1WTnJ0Z2RJMEFVeVB0V05GNnAvb0RFb2dU?=
 =?gb2312?B?ckNINGg0bENPdUF5alBjLzRVTDIwRVNEYnNyTWR6dU10QW5jUmNaaXBpY01E?=
 =?gb2312?B?d3VVaWd5cXFRdzJ1d1daYTZNUmllR1F4RnI2NjRNM0l0Z2ZzV0piNFdQRGlt?=
 =?gb2312?Q?OBSAkiD3caWQuSq4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB5405E449B19691A916EA3FE79DC89SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cba1f3-1ff1-4e89-b03f-08da3317b7f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 06:30:18.9368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAybjAzVBGP4x57C5hhjOXU70ZmfHg4R381tTrGRWttQgNEGLHmiORjoNIXgawqPCgS+cT/1uGtuKN5KfpzTog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3443

--_000_SJ0PR03MB5405E449B19691A916EA3FE79DC89SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzZdIHhlbjogU3dpdGNoIHRvIGJ5dGVzd2FwDQpIaSwN
Cg0KT24gMTAvMDUvMjAyMiAxMToxNSwgTGluIExpdSB3cm90ZToNCj4gVXBkYXRlIHRvIHVzZSBi
eXRlc3dhcCB0byBzd2FwIGJ5dGVzLg0KPg0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogTGluIExpdSA8bGluLmxpdUBjaXRyaXguY29tPg0KPiAtLS0NCj4gQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPg0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBVcGRhdGUgeGVuL2NvbW1v
bi9kZXZpY2VfdHJlZS5jIHRvIHVzZSBiZTMyX3RvX2NwdQ0KPiAtIEtlZXAgY29uc3QgaW4gdHlw
ZSBjYXN0IGluIHVuYWxpZ25lZC5oDQo+IC0tLQ0KPiAgIHhlbi9jb21tb24vZGV2aWNlX3RyZWUu
YyAgICAgICAgICAgfCA0NCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gICB4ZW4v
Y29tbW9uL2xpYmVsZi9saWJlbGYtcHJpdmF0ZS5oIHwgIDYgKystLQ0KPiAgIHhlbi9jb21tb24v
eHovcHJpdmF0ZS5oICAgICAgICAgICAgfCAgMiArLQ0KPiAgIHhlbi9pbmNsdWRlL3hlbi91bmFs
aWduZWQuaCAgICAgICAgfCAyNCArKysrKysrKy0tLS0tLS0tDQo+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vZGV2aWNlX3RyZWUuYyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KPiBpbmRl
eCA0YWFlMjgxZTg5Li43MGQzYmUzYmU2IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2Rldmlj
ZV90cmVlLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jDQo+IEBAIC0xNzEsNyAr
MTcxLDcgQEAgYm9vbF90IGR0X3Byb3BlcnR5X3JlYWRfdTMyKGNvbnN0IHN0cnVjdCBkdF9kZXZp
Y2Vfbm9kZSAqbnAsDQo+ICAgICAgIGlmICggIXZhbCB8fCBsZW4gPCBzaXplb2YoKm91dF92YWx1
ZSkgKQ0KPiAgICAgICAgICAgcmV0dXJuIDA7DQo+DQo+IC0gICAgKm91dF92YWx1ZSA9IGJlMzJf
dG9fY3B1cCh2YWwpOw0KPiArICAgICpvdXRfdmFsdWUgPSBiZTMyX3RvX2NwdSgqdmFsKTsNCg0K
PiBUaGlzIGNvZGUgaGFzIGJlZW4gdGFrZW4gZnJvbSBMaW51eCBhbmQgSSB3b3VsZCByYXRoZXIg
cHJlZmVyIHRvIGtlZXANCj50aGUgKmNwdXAqIGhlbHBlcnMgdG8gYXZvaWQgYW55IGNoYW5nZXMg
d2hlbiBiYWNrcG9ydGluZy4NCg0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3VuYWxp
Z25lZC5oIGIveGVuL2luY2x1ZGUveGVuL3VuYWxpZ25lZC5oDQo+IGluZGV4IDBhMmIxNmQwNWQu
LjE2YjJlNmY1ZjAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi91bmFsaWduZWQuaA0K
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdW5hbGlnbmVkLmgNCj4gQEAgLTIwLDYyICsyMCw2MiBA
QA0KPg0KPiAgIHN0YXRpYyBpbmxpbmUgdWludDE2X3QgZ2V0X3VuYWxpZ25lZF9iZTE2KGNvbnN0
IHZvaWQgKnApDQo+ICAgew0KPiAtICAgICByZXR1cm4gYmUxNl90b19jcHVwKHApOw0KPiArICAg
ICByZXR1cm4gYmUxNl90b19jcHUoKihjb25zdCB1aW50MTZfdCAqKXApDQoNCj4gSSBoYXZlbid0
IGNoZWNrZWQgdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIG9mIGJlMTZfdG9fY3B1cCgpLg0K
PiBIb3dldmVyLCB0aGlzIG5ldyBhcHByb2FjaCB3b3VsZCBhbGxvdyB0aGUgY29tcGlsZXIgdG8g
dXNlIGEgc2luZ2xlIGxvYWQNCj4gaW5zdHJ1Y3Rpb24gdG8gcmVhZCB0aGUgMTYtYml0IHZhbHVl
IGZyb20gbWVtb3J5LiBTbyB0aGlzIGNoYW5nZSBtYXkNCj4gYnJlYWsgb24gcGxhdGZvcm0gd2hl
cmUgdW5hbGlnbmVkIGFjY2VzcyBpcyBmb3JiaWRkZW4gKHN1Y2ggYXMgYXJtMzIpLg0KDQo+ICAg
fQ0KPg0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwdXRfdW5hbGlnbmVkX2JlMTYodWludDE2X3Qg
dmFsLCB2b2lkICpwKQ0KPiAgIHsNCj4gLSAgICAgKihfX2ZvcmNlIF9fYmUxNiopcCA9IGNwdV90
b19iZTE2KHZhbCk7DQo+ICsgICAgICooX19iZTE2ICopcCA9IGNwdV90b19iZTE2KHZhbCk7DQoN
Cj4+IFdoeSBkaWQgeW91IGRyb3AgdGhlIF9fZm9yY2U/DQoNCkdvb2dsZSB0b2xkIG1lIF9fZm9y
Y2UgaXMgdXNlZCBpbiBsaW51eCBrZXJuZWwgdG8gc3VwcHJlc3Mgd2FybmluZyBpbiBzcGFyc2Us
DQpodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy81MzEyMDYxMC93aGF0LWRvZXMt
dGhlLWF0dHJpYnV0ZS1mb3JjZS1kbw0KSXMgc3BhcnNlIGFsc28gdXNlZCBpbiB4ZW4/DQoNCg0K
PiAgIH0NCj4NCg0KDQo=

--_000_SJ0PR03MB5405E449B19691A916EA3FE79DC89SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">Subject:
</span></b><span style=3D"font-size:12.0pt;color:black">Re: [PATCH v3 4/6] =
xen: Switch to byteswap<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi,<br>
<br>
On 10/05/2022 11:15, Lin Liu wrote:<br>
&gt; Update to use byteswap to swap bytes.<br>
&gt; <br>
&gt; No functional change.<br>
&gt; <br>
&gt; Signed-off-by: Lin Liu &lt;lin.liu@citrix.com&gt;<br>
&gt; ---<br>
&gt; Cc: Stefano Stabellini &lt;sstabellini@kernel.org&gt;<br>
&gt; Cc: Julien Grall &lt;julien@xen.org&gt;<br>
&gt; Cc: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;<br>
&gt; Cc: George Dunlap &lt;george.dunlap@citrix.com&gt;<br>
&gt; Cc: Jan Beulich &lt;jbeulich@suse.com&gt;<br>
&gt; Cc: Wei Liu &lt;wl@xen.org&gt;<br>
&gt; Changes in v3:<br>
&gt; - Update xen/common/device_tree.c to use be32_to_cpu<br>
&gt; - Keep const in type cast in unaligned.h<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; xen/common/device_tree.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 44 +++++++++++++++---------------<br>
&gt;&nbsp;&nbsp; xen/common/libelf/libelf-private.h |&nbsp; 6 ++--<br>
&gt;&nbsp;&nbsp; xen/common/xz/private.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt;&nbsp;&nbsp; xen/include/xen/unaligned.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 24 ++++++++--------<br>
&gt;&nbsp;&nbsp; 4 files changed, 38 insertions(+), 38 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c<br>
&gt; index 4aae281e89..70d3be3be6 100644<br>
&gt; --- a/xen/common/device_tree.c<br>
&gt; +++ b/xen/common/device_tree.c<br>
&gt; @@ -171,7 +171,7 @@ bool_t dt_property_read_u32(const struct dt_device=
_node *np,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !val || len &lt; sizeof(*out_=
value) )<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<=
br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp; *out_value =3D be32_to_cpup(val);<br>
&gt; +&nbsp;&nbsp;&nbsp; *out_value =3D be32_to_cpu(*val);<br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt; </span><span st=
yle=3D"font-size:11.0pt">This code has been taken from Linux and I would ra=
ther prefer to keep
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt;</span><span sty=
le=3D"font-size:11.0pt">the *cpup* helpers to avoid any changes when backpo=
rting.<br>
<br>
&gt; diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h=
<br>
&gt; index 0a2b16d05d..16b2e6f5f0 100644<br>
&gt; --- a/xen/include/xen/unaligned.h<br>
&gt; +++ b/xen/include/xen/unaligned.h<br>
&gt; @@ -20,62 +20,62 @@<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static inline uint16_t get_unaligned_be16(const void *p)<b=
r>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return be16_to_cpup(p);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return be16_to_cpu(*(const uint16_t *)p)<br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt; </span><span st=
yle=3D"font-size:11.0pt">I haven't checked the existing implementation of b=
e16_to_cpup().
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt; </span><span st=
yle=3D"font-size:11.0pt">However, this new approach would allow the compile=
r to use a single load
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt; </span><span st=
yle=3D"font-size:11.0pt">instruction to read the 16-bit value from memory. =
So this change may
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt; </span><span st=
yle=3D"font-size:11.0pt">break on platform where unaligned access is forbid=
den (such as arm32).<br>
<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static inline void put_unaligned_be16(uint16_t val, void *=
p)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; *(__force __be16*)p =3D cpu_to_be16(val);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; *(__be16 *)p =3D cpu_to_be16(val);<br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt;&gt; </span><spa=
n style=3D"font-size:11.0pt">Why did you drop the __force?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Goog=
le told me __force is used in linux kernel to suppress warning in sparse,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><a h=
ref=3D"https://stackoverflow.com/questions/53120610/what-does-the-attribute=
-force-do">https://stackoverflow.com/questions/53120610/what-does-the-attri=
bute-force-do</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Is s=
parse also used in xen?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><br>
<br>
&gt;&nbsp;&nbsp; }<br>
&gt;<br>
<br>
<br>
<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB5405E449B19691A916EA3FE79DC89SJ0PR03MB5405namp_--

