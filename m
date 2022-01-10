Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199014898B3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 13:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255326.437497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6tvV-0007so-CD; Mon, 10 Jan 2022 12:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255326.437497; Mon, 10 Jan 2022 12:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6tvV-0007qd-7X; Mon, 10 Jan 2022 12:37:29 +0000
Received: by outflank-mailman (input) for mailman id 255326;
 Mon, 10 Jan 2022 12:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mw0=R2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n6tvT-0007Qi-7K
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 12:37:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f2bb321-7212-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 13:37:25 +0100 (CET)
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
X-Inumbo-ID: 0f2bb321-7212-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641818245;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RveZWm/ih9ie9MFMoMkWxz8wdmo9arCliZt0D8lycW4=;
  b=bl2RaHKNNuWMwNZY892vHAKJmdWCNNJ1Bp5/2Lash0eoFdWiphw9zsOp
   AqpMn7h0HXfbvvAzVGZZZYUVamP8Xw+QgGpOk28iGkGl7Ai5KEieghO57
   SdP5vUmjak2QW2vRU2CWJjIr0GDeB3mCya6bQ3YUv6FHKWj9rj9PrxutY
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4a0kuLaA8bK1vC0VvN6JMCop2KY3wfZzlxsPtIYYIi8bwo6qkXa/G1TuEQvG90ycRSX05a48tt
 bLCADmUgOBA1QDgaUEGde3IZL82HdQlxKsb1PnwA93EkS4awYlaUx/cSg6IBG8lkKSIrzNsDy5
 xZIbyXiltBd90xgX05FS4zj1g9hdMTs8lMJs7DQYapociFDt5Be5rqyieO/ZZ3LuhgvUFu9vUO
 XeFZD/Q2YkBFF9w7nevlkQ/g+W0IEuIg2KG24OQWLHiQTB8YgU7rog5li4Ne+oYSXPrgYnDCTI
 dnbwlHMsB4TdWgrJ98Vunt1Z
X-SBRS: 5.2
X-MesageID: 63763237
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7x+0BKnycPpLyLiA0njjAqLo5gwOIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDWiEOqrYYWH1ftsiYImw/EsCusTWy4A1SVdv+3g1FiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IRXi5eIcToYB7LnuPs4f0dWHgYiJ6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glr2Z4VR62BD
 yYfQRxGaRGQWV4QAXQSEYAijtWstECnIhQN/Tp5ooJoujOOnWSdyoPFOd7YatWMSchP2Fyfv
 XnP12LyGFcRM9n34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3E6iS9TmGg21plaIvxgTRNNUF6s/5UeQycLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BVCZRu4WtdEOk6Zy0shaeZyYYCjMYanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0vZ5p0xWG2DaD+qXNERz2ohZPmqgKsFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i8Ca2PM4ETMskrHONiwM2ITRXJt4wKuBJ9+ZzTx
 L/BKZr8ZZrkIfkPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilksDOMWjPHi/2dNDfDgicClgbbir+pM/SwJ2Clc8cI3XI6WPkepJlk0Mt/k9q9okC
 VnmCxAIkwSu1CSXQehIA1g6AI7SsV9EhStTFQQnPEqy2mhlZoCq7awFcIAwc6Vh/+tmpcOYh
 dFcEylZKvgQGDnB5RoHapzx8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMpRXRlmAebXdOmrkwG7s08Clb8gREDPONRSJhnhqdA4Nyzrg/YrCMgQMhGflCCC3
 gObDE5A9+nAqoM46vfTgqWAo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBexQREqYtxFbpv3JkS3dq3qu8I1BlgEVXKc0+vVuFqLE6Z0JQdraZK3LJY51e7A
 xrd5tlANLyVE8r5C1pNdhE9Z+GO2PxIyDnf6fM5fBfz6CNtpefVVExTO1+HiTBHLaszO4Qgm
 L9ztMkT4g25qxwrLtfZ0XwEqzXSdiQNA/c9q5UXII73kQ56mFhNbKvVBjLy/JzSOc5HNVMnI
 2PMiafP71iGKpEur5bn+aDx4Ndg
IronPort-HdrOrdr: A9a23:2t8/5qoQYgQP9Sb5b4Ok8NsaV5o9eYIsimQD101hICG8cqSj+f
 xG/c5rsiMc5wxwZJhNo7y90cq7MBfhHPxOkOos1N6ZNWGM0gaVxelZnO7fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.88,277,1635220800"; 
   d="scan'208";a="63763237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5e4xOl45cCTqThyWWbaSQu0kYfFQFn3MSHn4uLoVRqq81M4bAZUT5Y9S5aWtav8cXXburc+DGawONaZkWSa5RSMOLXI/bnjnw/usnRgofGFTydX55j1EKx5IyJlcrASiiH605CHgDjt3INHJ2raXKvBuOeNixCBYrS5sY9gbf2D9xh6ivJ7eA5PnlDdZTmlJy+xwxW/uVSX4fXX2ZFv9MlxC60Gm3sJq5vbr8hbkd/yiC/jHc1qNGbomhVStC4jJFqJTNP6BOTxzml84BwerZiR4YzDHJPbgX0aDrHzZ+nXIGvrTXPTNkv7FnAnpXJsPqS7EtOOu7wzM0PRHuqqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTQ0SJcaijGjmXCKZShy1mI/QvewbPnvLZHrHZ+oB3Q=;
 b=BLQ37xm3McVAJP/Jb+8TRd8EVRQetu20BgeiaVXOwaX9MPPWzZ0/ZHhS8wU4gHbvuh+b6f4EGWDkPPasKSvmWMkesXpGRwaCo45cCGx2S3WruPeBZ7t+8WCL3JKS68AkyAslQjIg+UT9BVJUrFTRvX9GTb91iToXuyTLPedrPKseMVOOhA9gy1Oj5bmjw0LHWV4z8XMQNlVN+BUAGDLRgJ/LH304Nq9J3ratLtA2CXvAc5F+HEJkfE6Ch+5krMdkTtxSxfouMgix3rtFQv9DUia5Ry8juCbcPwsgwmt8vtpY77t6tAFs7dM0GbVRfYIuMee5G0Sx73xKvwfg2Oex7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTQ0SJcaijGjmXCKZShy1mI/QvewbPnvLZHrHZ+oB3Q=;
 b=wnUkumbFg3/Ea32CQwqNe7tJnOb2uzzidVrgVrgf3GKL9oQHSvVvGaaj5RF/+Q+szqsuhfl6sU92goCXwGp/sqvLxvc/Aiwlt1+zglKMmOxPZ0amYrruMN3Kk34j8ZtxD8R9NtUjOzUz1SivBS6TZfQV2hKKfZxO/14P1w8kY50=
Date: Mon, 10 Jan 2022 13:37:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: James Dingwall <james-xen@dingwall.me.uk>, <alexander.rossa@ncr.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Message-ID: <YdwodzmyvNwGJaSM@Air-de-Roger>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
X-ClientProxiedBy: MR2P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ea0c0aa-591a-4ff7-1e14-08d9d435f0c7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059AF60980C7DA316F8F4DD8F509@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mj00hSqP/Z+uTQgUsgQJGOr2xuZCCCMrjTB9E5e63EFd179XkMzempeUHw9JphsVWf2qVpGuTvCttFCFlyyZlmnaUsfYrMr630/N1mpR4+SHS3HGTVAog7vgqTGJgdqg48R7HqK28e6n65ddzEAxWTVE+l9h7Kfpdq6ju673MBFgAZIgP73kCHWWMcBWsRaf2VUhHTcbYjLVVPyPhSF9wQQYEw+p9WBuM9cRqNz64aMPuhYr7fKnnqsKePYgwMDu41C0J30eDaQw8OL+dSWjkNFHw6+s0jaAvOArkF4M8lTHCUiJakQO4u3i6N00ghwcpAE+a6atYLlQuwhbE23dT0Ny1cyEtbIsjJ6BjXzgrPpdsa9AAtsPXqXQ6oGVJQ5nF1CpQtby8yKV7EijS9rJ0HgrTRAUh+Lb99f+wxdzlKvQ9mTPfuZ7Yo+DISBCbAOsm9xtPoXAEeCURGaVgFR8MHXbuwGXG13jNy0d5SXTKKKAv4/4IN59Jy8mabY3dC0cQ1F8ncnCQ/5QlLAREy5R1XIE/AMhdoTaO0LGy1cwHpkIVKhjylo4Owwn0mA5hmpEtsqtEG4IJxNyKgu/bI+FXPDnBCyvb9ZnqHuygqy+RzMQQfqBacv+XPUkbFQz9sDfGtnjKsjMkg1lEIaNbMmgPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(85182001)(186003)(8936002)(2906002)(6916009)(9686003)(86362001)(33716001)(508600001)(4326008)(6666004)(6512007)(8676002)(66556008)(66946007)(66476007)(53546011)(6506007)(5660300002)(38100700002)(26005)(316002)(6486002)(83380400001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzg0Qmp4UFByYzR1TTJBaUxOOHdLMDN2MU9NY3ZUYUJqRXp5RzF4MTJFeGhI?=
 =?utf-8?B?V0hIelovRnhxWUZVczBmOUtORUExb0p0UXpqTm9TUkx6THF2WTZpZ2NQTDNi?=
 =?utf-8?B?SFA4eUl1c09mVnU0ODFjajh2TGdKdW5ydjFhTDVESk1Ja0FETGQ1RzExRTZ2?=
 =?utf-8?B?OExyTTVlZ2tOREpVZ0ticmllM0dReWVtSHZJclpZTUZUSHQzN0huYjRTWEZM?=
 =?utf-8?B?SXdXcC9tazhCTFFtZm9teDc2Qk1yNlI3aHFvb0t4Wk13N2tzZ3pzd2VZRXZQ?=
 =?utf-8?B?bkt6QXJ6ckpENHFVcVRRMTRyRkFhbmZHeWlVSXdBaFJwWHlneVN3NlFPQW5W?=
 =?utf-8?B?WTRSRnpycUtqTC9rdnJ0MjhFVHpRak1vQ01PSFRyVE40SXc4NmhtRFplTVd6?=
 =?utf-8?B?eTNDb21INmgvb1VLVUNKZjJEdkMreHlCZ0RSV1RFSy9aS0pZZ0wxUWZxRUVr?=
 =?utf-8?B?c2RYeHlRdStvNk1hVUFxSmgvN0dyQk1ub3d3YjU1T3RCYllzbDV5eTFhWkcy?=
 =?utf-8?B?WCtINkQranBTNmEvME94Y2htRzdRVm5DeFh4MEQ5dEpOaUNCNG9GaVNTQlRa?=
 =?utf-8?B?eHk3Zm0wSXF2ODltd1lISlBTWVo0MUNvSFVzcEl1Y0ZCTWNSbjR1YURWcEdV?=
 =?utf-8?B?TXV5MFZrOG0wd3BuNTJISkNIUEpVOTVZUVNGZ3IremI4V0g4Y2hxZUdSMzRh?=
 =?utf-8?B?cldqekVlaTFMMjFqd3RkbExoaldMZGVCcDNCNmx0ZzVKQ3VqdWxBT2lPMGxP?=
 =?utf-8?B?ZnZOK0VjdzNhdlJUN0ovRVZYQnlFRHVyUGJQb0I3ZlgyTm42eDFwclVweHEr?=
 =?utf-8?B?QXlranowMGtRZGZBUUJDTjRKdXIzQ2RodGVJbXVBblhRN0ZMS25wdkFNZWhR?=
 =?utf-8?B?Q25QRGVmQU8xaUV4cjY2cFROVjU3Mk9veFhzRy9iYm82QVVNUjZKMk1VeExH?=
 =?utf-8?B?ZGJLeXhqTmVQeDJPaUFkbUdEZ0QvcmFmaStRTDExWU5qRko1VnAyWHlCS25F?=
 =?utf-8?B?UTVOaGlpTHhDSTBLQ3FHT2xSV3FHcDlOZTliRGowQjF3YlAvUWgvYVJuN2lm?=
 =?utf-8?B?ejFPRCt4eVFSSk9NYVRSS2dlVjEwQU5XYm1GQ3NKNUFndVBTdWQ3MGUzQWk0?=
 =?utf-8?B?bWhVZDYxRmZOUXh5RE1COHV5U0xKd1RJdWc0Y3NpSm9NMjNaNlZ5dkI3NzB3?=
 =?utf-8?B?bVdLZVZUREdlQTZaMytKTm9SS0YzaGtJTEVYTkI4LzdYTXVOYmVKV1d2aEVy?=
 =?utf-8?B?Y3UwRmQrRy81VWhGRWdLOE4wVHMxcjJYQXRlU2l5SjBwUnhsU2pMY0dNWE5I?=
 =?utf-8?B?OWtEZFNkSlhOWHVVUi9rVS83TStZRVcxQzZIbXkxcndkanlRck5ORWxVQTc3?=
 =?utf-8?B?bzJ1aitGc0dxSUQ3dWtPWVlqTXBDMnE5NEcrZzQyQ2NyZlI3SW5pYzJVeHdV?=
 =?utf-8?B?TE9ybmM0UCtwTXhLWk9zZW5tU3pqa210anJzMDY5YllmdEd2dTlrdlVNOEFO?=
 =?utf-8?B?OERQeVROQXd1SVJXNForM1p4aXBtU04xV05ERkRGTDVRUHh1UUMyb0dxc0JQ?=
 =?utf-8?B?K3N4Ri9vQWw0TGR1RHREeVl4ckVoREhveVhYKzloNlNwZElUdWphSVZGcTlM?=
 =?utf-8?B?aEZacFowZXNyQlptU21UbGhjWlY3Y05naWpxK05sUS9YRFltRkR0Zkt0UjBl?=
 =?utf-8?B?U3JpRUxHeXlGNWpDOXJTeHhCdFhidWcwemVZUHR4QXpTNHZGejlHZkV2cmVi?=
 =?utf-8?B?VUlHRnFTa2Y1dkpZT2tYcWxBMWhzQlBvSURhbmR2cmVPY2orS3NScmlNNDgy?=
 =?utf-8?B?SVU4YzdIRFdhOWlIb1Yza3lmUWVtY2w2cDJDL1JuU0MzOUk5UWRqWThlZGQ0?=
 =?utf-8?B?blh3Y011TVhsTEFiaWxlZ0JQZ205MU9kTHc4YTA3cFhlMmd1SE14bGdSWFR3?=
 =?utf-8?B?WUVVMHk1TWpLang0T3ZkMjRQWEVUTlJnTzR0R0tqdk1Hbm5zYzVYdTNvWko4?=
 =?utf-8?B?S1lTTmZGQWQ4dmRZUXhsWGNjTHAzczMzQ0FBUU8yemNESlJpQlhsRGROZENX?=
 =?utf-8?B?dnloMVVKc1lNK1NXVEg2RXNBSkJsR2xPbTR6czlVRWJJWmJ4Wkd0NjlzT1Zn?=
 =?utf-8?B?bWdrZ00xMFgxV1drUy8vZUQya1hTVlM5YXI3TGdHWmpWWUE2bkE3RkhtVnBZ?=
 =?utf-8?Q?bxiHDWIlun11rR8Wy7OVo+4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea0c0aa-591a-4ff7-1e14-08d9d435f0c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 12:37:19.1321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bna+PEi60meDVg1ncDWxZkSGnPwJ2jeztWg+I93WzeI+HMmyPJ8GVx6cKH3WOO3ad9U9liiOHvlR6haCvVnBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
> On 06.01.2022 16:08, James Dingwall wrote:
> >>> On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:                                                                            
> >>>> On 21.07.2021 11:29, James Dingwall wrote:                                                                                             
> >>>>> We have a system which intermittently starts up and reports an incorrect cpu frequency:                                               
> > ...
> >>> I'm sorry to ask, but have you got around to actually doing that? Or
> >>> else is resolving this no longer of interest?
> > 
> > We have experienced an occurence of this issue on 4.14.3 with 'loglvl=all'
> > present on the xen command line.  I have attached the 'xl dmesg' output for
> > the fast MHz boot, the diff from the normal case is small so I've not added
> > that log separately:
> > 
> > --- normal-mhz/xl-dmesg.txt     2022-01-06 14:13:47.231465234 +0000
> > +++ funny-mhz/xl-dmesg.txt      2022-01-06 13:45:43.825148510 +0000
> > @@ -211,7 +211,7 @@
> >  (XEN)  cap enforcement granularity: 10ms
> >  (XEN) load tracking window length 1073741824 ns
> >  (XEN) Platform timer is 24.000MHz HPET
> > -(XEN) Detected 2294.639 MHz processor.
> > +(XEN) Detected 7623.412 MHz processor.
> >  (XEN) EFI memory map:
> >  (XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
> >  (XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
> 
> Below is a patch (suitably adjusted for 4.14.3) which I would hope can
> take care of the issue (assuming my vague guess on the reasons wasn't
> entirely off). It has some debugging code intentionally left in, and
> it's also not complete yet (other timer code needing similar
> adjustment). Given the improvements I've observed independent of your
> issue, I may not wait with submission until getting feedback from you,
> since - aiui - it may take some time for you to actually run into a
> case where the change would actually make an observable difference.
> 
> Jan
> 
> x86: improve TSC / CPU freq calibration accuracy
> 
> While the problem report was for extreme errors, even smaller ones would
> better be avoided: The calculated period to run calibration loops over
> can (and usually will) be shorter than the actual time elapsed between
> first and last platform timer and TSC reads. Adjust values returned from
> the init functions accordingly.
> 
> On a Skylake system I've tested this on accuracy (using HPET) went from
> detecting in some cases more than 220kHz too high a value to about
> ±1kHz. On other systems the original error range was much smaller, with
> less (in some cases only very little) improvement.
> 
> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Do we think we need to guard against the bizarre case of
>      "target + count" overflowing (i.e. wrapping)?

I also wonder whether a value of target close enough to the wrapping
point could cause the loop to stuck indefinitely, as count would
overflow and thus the condition won't be meet.

> TBD: Accuracy could be slightly further improved by using a (to be
>      introduced) rounding variant of muldiv64().
> TBD: I'm not entirely sure how useful the conditionals are - there
>      shouldn't be any inaccuracies from the division when count equals
>      target (upon entry to the conditionals), as then the divisor is
>      what the original value was just multiplied by.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
>  
>  static int64_t __init init_hpet(struct platform_timesource *pts)
>  {
> -    uint64_t hpet_rate, start;
> +    uint64_t hpet_rate, start, expired;

Might be better named elapsed rather than expired?

It doesn't store the end of loop TSC value, but the delta between
start and end.

>      uint32_t count, target;
> +unsigned int i;//temp
>  
>      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
>           cpuidle_using_deep_cstate() )
> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>  
>      pts->frequency = hpet_rate;
>  
> +for(i = 0; i < 16; ++i) {//temp
>      count = hpet_read32(HPET_COUNTER);
>      start = rdtsc_ordered();
>      target = count + CALIBRATE_VALUE(hpet_rate);
>      if ( target < count )
>          while ( hpet_read32(HPET_COUNTER) >= count )
>              continue;
> -    while ( hpet_read32(HPET_COUNTER) < target )
> +    while ( (count = hpet_read32(HPET_COUNTER)) < target )
>          continue;
>  
> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
> +    expired = rdtsc_ordered() - start;

There's also a window between the HPET read and the TSC read where an
SMI/NMI could cause a wrong frequency detection.

Thanks, Roger.

