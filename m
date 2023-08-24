Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62225786EF0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 14:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590054.922148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9Lq-0004Rp-4b; Thu, 24 Aug 2023 12:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590054.922148; Thu, 24 Aug 2023 12:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9Lq-0004Oh-1P; Thu, 24 Aug 2023 12:22:14 +0000
Received: by outflank-mailman (input) for mailman id 590054;
 Thu, 24 Aug 2023 12:22:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR62=EJ=citrix.com=prvs=593229a51=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qZ9Lp-0004Ob-4l
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 12:22:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f23b77-4278-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 14:22:11 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 08:22:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6656.namprd03.prod.outlook.com (2603:10b6:510:b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 12:22:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 12:22:06 +0000
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
X-Inumbo-ID: d8f23b77-4278-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692879731;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XIFeaXzGsEnOnJrD3/40WRgtQ71ECgMYBSGtFezaHHs=;
  b=dAflUo4eZdIcSg588vS4WmE+1gFAi5SvtgWqR7Izf1UUxsT0DXN724Bo
   yWHq4BbqBNt1pmGVLsDvvIOWy6PciLFaOBRn8sPMWFtHTkfYreck45YCB
   U+BXGHsjeKSVghJqLbE1hUFidq29tbtb8snrj0cKfOq15sx/jjSxDVQBN
   E=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 120938116
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ek79rqs4kfMTGV24MvXgMpgnyefnVItfMUV32f8akzHdYApBsoF/q
 tZmKWiEaffZajD8KIwkOY61/BkCsJTdmNBjSQVr/npkRSgU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A+EzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwawAtNxHAqqWK75XhS9Uwiuh+ferLBdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4W9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtpDT+3hr6ACbFu7nV0BSxMaWV2BuuCVjWufYYlzF
 l4q0397xUQ13AnxJjXnZDWjoXuDuBNaUdNUF+Qg6QelwLfb+AufCS4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9JmgEfjIAUQoD7PHpvY4ogxTACN1kFcadgdz8HzXty
 DnMqDUmjq8Si88j3bi05l3BjHSnoZ2hc+IuzgDeX2bg5QQgYoegPtWs8QKCsqkGK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:cRGoKqy+Atxk/u2t6S8IKrPwT71zdoMgy1knxilNoH1uEvBw8v
 rEoB1173LJYVoqMk3I+urgBED/exzhHPdOiOEs1NyZMDUO1lHHEL1f
X-Talos-CUID: =?us-ascii?q?9a23=3AGXdEZmiwXKT79ExWF+1ZlEwurjJuMU39lXaTDgi?=
 =?us-ascii?q?EJkEzSYHJRXPNqYBEqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ak4jyPw/NSbxf0azYpPR3a1WQf5xZ8eegBEwLq44?=
 =?us-ascii?q?fl86hFBYrFwqPsh3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,195,1688443200"; 
   d="scan'208";a="120938116"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFoqojZHhvC7jAUAx1SJ/WTxvKOXVOhGAerOsgRlxhmLOa5iMkPYssGSLM94Tf0UXeq2Yds9SzAuixU4fGqGnVM7nduoWzhU5CNus7QOW0qU3e4TYdT8Z5lf9yHH04fnkq1GQlDe5nHJa8m4/WJ7q7jRuhB2ImsZEf0gG+/s9V+6j2vOANVUm3XYnED5ODJzVER80NQ/HM6ibYxF3fhG//DKfjds/qlQAH9PdZTDBREM57bjOE6i9Gr1xEA6fSvP8wZRCmb9OKp53LnXQDuPIQ04JIi06G93d10zG7dh1y/nrapqAKcf1BJeZGInXsCrNEKbAxKeXOxKsqbY5qpdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjgF6cDuUhPFu0dtpLdxd6U/97OH7f0LbqY7pGJeh3A=;
 b=Ic+nh3NmdVXVfvJ41PTPafRyHTGNjye+Ui6pUG+1OzXYIQnP8ReIsNuKCzGreUe58kaIIXw4fOcnmchX2cRYFcDZ0abkv2LbC9T1epkJ76n8w+NhNCLmsgo5069U19UYchxe6Kas+KmWV+rlKi66HgI9Do5x9NFsSGYukVIypG8WSoNTucC+13aIruPZxtqB8sMHm93aaIX3Z6o3KFVChCQ4jsuapKzKdoCmd9XSmtA+qiEj1JbHYxWvPbLaTs30/0Tc3o8aq5pTjyb8VcKyBqoLw1u/dju0mlQmsxpJ/K4ixkNQlkB9/nvjiNSfyffXALrltuD000Jtb+vgANoULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjgF6cDuUhPFu0dtpLdxd6U/97OH7f0LbqY7pGJeh3A=;
 b=bG2aeq0S2+t3vj1nSmRuspDfPUzb+l6lrUN6+HvJ4RlvhDFjxsxkk2mowxjbqdUiI/tJZQLnUI7ak5ye/bwNnHDG+xDtLpSZ3Zz1Q73wPYLYHQHTeNWxxZyX2b8+dnhYmK76JJ5NWUrYRYLh6qfI46uKJAlZUuventl/FRlPe0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Aug 2023 14:22:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: Re: [XEN PATCH 07/13] xen/vpci: address violations of MISRA C:2012
 Rule 7.3
Message-ID: <ZOdLapF-1S_R1Xlj@MacBook-Air-de-Roger.local>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <4b97aa8203935ba6e202926add0baf8901af5ee9.1691053438.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b97aa8203935ba6e202926add0baf8901af5ee9.1691053438.git.simone.ballarin@bugseng.com>
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b91b1c-82ae-4967-870f-08dba49cbaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JevF72ONRGtfDRXl+tcf1EL24StGJP9GUa2/kEuUltOxFvwt4BhpdroyR3yKKPq7I+TBxOnHOgLxYMSb3Hlei9jFYJtpK64xCs2KCENoWsyyqTObzXCKTxJijwb8ifqdfgVsGL/+ledfslGc5Lr18vl2V5EyZs6qRPAVod0/DNtuanVNVZ5UnkpDawwLBV2F47PxjsCE1NfQDyA5GJCkuU+nVQN1EegK+J1d6KFwu5CWFUOtFY4NPET2UnxD9Up4VdtdgqZYew9V275HZvviQOBCP/FMSD4tS1DnIQsxHc/CBKKTl23DsCDVjIIFpoAALe+mkMjgVnMXhgUF526JdZt5gRPBFuZZvmKeCH5kUsv+BoQV3/QYlvgVhW7Cpk2uofVePUnGMko3kwa7iP5t1zBr6LedKUNmg6IEf+SUZpafyIoiOsflg4XpyHB1vCBJijnRKTfPseHNy5QR92s8Ei3kTDjoaw1BsMYHbHAvHTuw7HvsHdZp0dQrBzpPnN4CsIh0WWv315t/yAOQ5ggHYUnt2ffo/f8TIGTn6y9BQ93cPXfRorsewZ9HpBvZs/AP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(186009)(1800799009)(451199024)(5660300002)(8676002)(8936002)(4326008)(85182001)(4744005)(26005)(6666004)(38100700002)(82960400001)(66946007)(66476007)(66556008)(316002)(6916009)(478600001)(41300700001)(6512007)(9686003)(6506007)(2906002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFhEWWpsNjV6a0RqYlBCaUdrTEN1ZFdqSnExWUNaWHBBdHQ3Q2FrdXk3ekZZ?=
 =?utf-8?B?UTZ2QnY2L1QwK3o0eERnLzRGMnNSWXFlYXQrbHZObEIrdUFRRFlJdHZCWkRr?=
 =?utf-8?B?TVVSTGhpYVF4WnIrTnBab3RKRHdldllHS0dDdHFEak91ditsaXV0aHJBaU40?=
 =?utf-8?B?ZVhSSW5TWFpOTjVHKzRJaUhCWWh4RnprR1pnd0RyL1BRMWNJVEFPTEdqVzFm?=
 =?utf-8?B?VU1lQWgvSDBORlJiVFRkMk9veEZLVEt2SFVyZUxONjJpMWx1cTNFN3BWV3Rw?=
 =?utf-8?B?cEVPVXV3TmRhRm5DZWoyUThFZ3FPOGNvRXlOaXloQmpmUW50d0NlU25CZ0NB?=
 =?utf-8?B?Sm5wZXVuVVZ3S3M4S2p1aWJ1UmpwTnEwMkd4aktiaXNzYmpvQVBCMkE3Rm5O?=
 =?utf-8?B?cG1WN0g3V2RXU0hhb011SVJBVWpJZmxqS0tBbWUvV3NLSmNPTi9Relp5Yk5y?=
 =?utf-8?B?Rk9RWkY4T2xzTTBDcVN2eFIxRk11cHJ2UW1lZzdOOVRuTjgrbGtnanlVRWFk?=
 =?utf-8?B?aVdwVTc1Y0hoc3FLRlNOS3RhVjVkQ3BvdUc3VEZoVkFTM2krcXFGczlkK2Fh?=
 =?utf-8?B?RS9PcHRXU0tGVjMzN2tobGlZSGF0SEcwTkVJVE5OS2o5K2lUSm5LVDJ5M1dJ?=
 =?utf-8?B?cDAvN0ZaTllpTWhSOXVXc2xpcDUyRWVESjNXRUY1NjAyT2RUL1BwVGdtR3lh?=
 =?utf-8?B?Nk9WMS9jOGlib2UxYTdkRXV3SngrYW5QaFF6Q3hUWFJRd0k0dUJwWGI1R0tB?=
 =?utf-8?B?ZWNrMkFpSmNPOHhaTjFNWVRuWWYyMTZMdUkySzVOcnA3T3IvZ0dIRGgwaEtT?=
 =?utf-8?B?UkJpcEFqZ2FmK1pFaURyZ0RuTi9FMlhpQkpPTDkvdHZPN1NQTGs4TkE3ZFRW?=
 =?utf-8?B?NCs4TG15a21DOHRqb3pvS0swMlhHcnQwSlFyTDdCOUxSYkNKd2wvNkhiYjlm?=
 =?utf-8?B?YUVGejRpQlJieDE0dmpHazgyZkwwNUpoejUxYmc4K2tTYXNYWFNnMThqMHh6?=
 =?utf-8?B?RVhiSk1lZnl1MWt1dDNOQ2owdzltNkdDRjVqb0U5bGpYUUNLbHBkamNRNng5?=
 =?utf-8?B?UXB4dSs0K3Vway9mS3NiRG1HVUZ0bjVLVllOZmlGVENMMmFnNG1vZ0E4Y2tK?=
 =?utf-8?B?bXRvZ3pYR2ZiRUtzZTZFd0cybXMzaXlUSDlkanR1dkxsNm1MY29rREN3ZytI?=
 =?utf-8?B?ME0ydnpVZDVsUHl3TldjVTFiTnhwbkxwQStYdVUwNkgwVFJIamZ1VlptaEZi?=
 =?utf-8?B?eEEzQndsOWhYNk1JK2JaQm9KK2tHUnZESXcxMWN4SlVNYWdPTnE3R2tRK2Y1?=
 =?utf-8?B?dEt4VnFmdVprYXpSZnZXaTh3d0hiNldNbi9CL1dCUDBJakxGY3Z2SGVuM1Vx?=
 =?utf-8?B?SjhXa0lsOFdUMUY2NG5nL1FPaWM2RHVFVXdIRkFEelhkSGhFajZMQWZzOFQ5?=
 =?utf-8?B?c3k4ZE1Obkd1aENnS1hTUHVXNE1oVE9nOWM2NmhBRFFra3hoZ29FWjUwOTZ4?=
 =?utf-8?B?M0V2VEorKzFhaUs0WlE2eThTdHZOSTBDalR3Q3BZaWlOaEpkQlJTZ1l4cE1P?=
 =?utf-8?B?Q1V3Tk4zY0N0RkVJTjFVbVJkQkFpeVBoTGd1d2E2bjNoN0cwdVI3RDVzZkRs?=
 =?utf-8?B?aGhtRm1aZDdWa1BpMXcxcStKSTg1b0JDZVJpY29YRlhTT2NtdEV6QWRBQlVN?=
 =?utf-8?B?dWhwWSs3dVV4Qkw3ZDhaVDNzYkxFYkFUUVFOSk5VMExuRUY3bzM0ODJGdkc4?=
 =?utf-8?B?SVA3S2pYQ0tpN3VHVi96WEo4S1VxSjRCdHA3aitCYloyRkZVVlFkaXJjQWR5?=
 =?utf-8?B?eUROb2Y4ZjFIdmpXeFNOeUwraldpM3VUQmFvWXU5VHBaT1BhbEtyZDZLUUtk?=
 =?utf-8?B?eXBMSDJPaWN4MlJWa1ZtVHhhMFVGdG1KNVE2dlFpRDQ0NWJIT2QzL2tHNkpK?=
 =?utf-8?B?MnZsVlhkVlVrdlBvNDZDUW90SVpNdW1TWk1GWTF2dW1hdjZwaTFTWWE5YllL?=
 =?utf-8?B?d2NIR2dzdjFXMUpGaGIvaTJNNGdlUkczWHl0SHZBTmpncWp4c1ExMzN5Q0M3?=
 =?utf-8?B?cXpySGhBYmN4dzFpT0pPZGVZZk9zYXl1Nkkwa2NsdVFHYytqL3F4eVdiVng4?=
 =?utf-8?B?T3dYNkNFUDhMK3FjUDhvNkQ2K0dBMnNqYk1lVjlMN0ZxSGRyTG5icWpmNXRG?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	erd5pi15f8DnkHyCSfqD18JT4zkIPz7gsfbuCP6LbOE5foYihvxWhehYWB7mhZqlAv333YHm5FBagbt5bwDH7X0MS2XFctHqubFRNbhuAwdr1s5vS50hBiFNbIvlv8OoAQV5MgihXaTG9e0xziOrfYxr666GttrtBf/WJmS7QzdKj+tEL24W0/rsGJs+GOu1vPDegjd7e3aHUSEQxlHwJ09I6n9D1vb3gQWLsv4k36z3f/f6zAgVvgjNYKBabI4XNqhVPSpq6nfuuOWHmOKFLyJTzC8ryagka+tPtE4YexZkeZ6qdhfeMqMqbBI2531Mi41vE/LG5QHGjYIhaNxMeJonWR1ZeA7xWdMVjiB2P2z4IDqdX5IJKsROS4yfIMy1Km38egSD/B6Fes9iYaefVJRhtXq/LhQom+k4aqQgDqAQS4IjKNnHJBNbruS1GznCKugOdSUOEZH+12xMXhu2ngfbZ2Z6r+/fiUBD8xmLtyOjhCzEPEva4u9bfkeIzruvGNSV8209q0gk6BXadOgDMcjyLKOmF7a0WHR2kZi9clnuZ2wF9IQTTmhtLNfOYYCGoEbLRCtDZDdM6qX6JrfYivMhzJyu9OuuxTRB1/QyiHf5HsOyfngn3AWhulOnpN5tcPQt8YkYlyHLgLT9vs6S5M9O9FzcgF7jQs4L84TV//7mffv1o5skMiYxTIZK6SuC7lzSqfg88SZz/dauyERYMqS9LTFk/wJuG9BcfDTU4uG4fSWEjHhVlzxWCTZ95HDQULcOkNtV/9e5F6p3hgBoLfI6a+4c86W/Wrz0ry3tnl0rqZ/zB4o53MJ1mSEZW2HG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b91b1c-82ae-4967-870f-08dba49cbaf0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 12:22:06.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhR2O9PqVCI3FEgkV/c1K3p+pMa51NsKQZe3Q769EApOziQg0g4THkFHFqBmPgobPTEi1trM3uDjK8JnlQZaEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6656

On Thu, Aug 03, 2023 at 12:22:22PM +0200, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

