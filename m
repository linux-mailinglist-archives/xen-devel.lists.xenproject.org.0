Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B34A5AD7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 12:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263518.456234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqxi-0001Md-4H; Tue, 01 Feb 2022 11:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263518.456234; Tue, 01 Feb 2022 11:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqxi-0001Km-16; Tue, 01 Feb 2022 11:04:38 +0000
Received: by outflank-mailman (input) for mailman id 263518;
 Tue, 01 Feb 2022 11:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEqxg-0001Kg-Ty
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 11:04:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb69993a-834e-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 12:04:33 +0100 (CET)
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
X-Inumbo-ID: bb69993a-834e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643713473;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Un9NHOZ6sp+YcDz0DUU4S6AtNf9ZzBSZmX4SHQ/Uq8Y=;
  b=Go56plv4XNvtTYC26KuHUej0kGJsfzn0lA8eroiQdRYOsdFgx3VrNPf6
   8H5KwrpUqGifiZhXE+IskeEFks1pREsxtvZjStVNBRreQbLx9nejhIyuR
   qS2yMcfreQyZXkT7p5EookPeXfW+wcY0VmLzVtH+vim7golEHjs+5SgA2
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: og8U2H0Qz3Gt9cOgeyWeD5F5UaDEBgaT85D9acbasBiXAOuy5o67OjXMlvywlHziER66or8uWO
 mJuwf9Csjd8VVj56Lw6uPzXqNbmE/9CdEqVDVNWqFTlyMdSrSzQBcePuNcMxYZaCufxO7sURo7
 KvS5EX+TgSxBwsclNkPBkavDpBytuSoGAnlRNlLKOBKyTDyE9x4VdmbOGLAreUVyf0Dh1bgx1E
 c5lKVZpLTNAmqb2SJCWekFr/szExQQDSB3cgecm/cpmJtJomVGA9d406RyIf5tVZ2S3XL/dYcx
 MqldsFafLhq8jMmznxk2W/7c
X-SBRS: 5.2
X-MesageID: 63201479
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:M5epDauCFEH5mRuX4GrhbeOt2OfnVLBZMUV32f8akzHdYApBsoF/q
 tZmKTjVPqmNYmL1Lt0lb4qx/E8GvZ7dy99qHgtlrSA0Fn8R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7oehTTYlIqL3nr4keUF5TXxaGp909+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsURa+CO
 JtxhTxHcwnMWDdlIHorV48mwbuOv3CmL2xykQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZHQMtUIuEm5zqLkJP+uyfHW0wjfAxOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP/D2BLwQKChRqlEGp/ZgPb1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGojdBgxYphVJW6Bj
 KrvVeV5vsU70JyCNvcfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQlUdSBlXcyn9J0/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:UbB7r6pGnz4ZlKARVXCDx5IaV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnlE422gYzRLrWd9dP0E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="63201479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjlUgElF5Se8UGHM+Jo6PE4TgEr3JOtvI3VcOrSO5jVGHUCDTxK2U4qX3ENeST8iA+pitP8xIXWDmuKMtecC2w39eMzcL+KcTgBrd0B9i8cswyFrbzgCaLRRxEfnrlw5RvUUPbu7PYdTOL1dV2dyt0EspLTxXfsyiSBRq7TwaGp6niiGJfLJNb8MHIFNPGRMUewRRV0/PcrUeFprysEzC666HxvySa08XHEZ1El1jLAK3V7LC9GKlnMU+0I90RSb18CAcOiXAONBJaqnPVaV0E1SQ2ZK/62mke/B6jbXukHjrmEh/5ppoEfOTCPz62hioe7IueGYEFbR2yBtHRhmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRk7Pr9VrtrcE+pq75pNFroRdOWz6kG2YK+mKpsPAWs=;
 b=KmzvKGyBtbQCM2xxGUEx9sHbhhbavSdc5iHl9iioJPwq7t2prTaMtscRS2xN539fgfSqBZPJbST72F/04GCGVM3gb+hqFiMHU0VU3WCDgHcN0IYvJn+R6UG4NdRLjNdqFAFe8nFwryaxiS7605ry+KbPbtUsdJ2jvzLDp0IX22raZl6Al547kcT4QL2m9SSBeOtoTTRUkJP5BiGk676QFBGuR6qwiMGkg8C0d8PhfhS6awapbYCWnlMLsyK4vhQR/DelOcrTZnY0HCJSjLLsW3ArxEAbitdnDCYz+L6dREUt4TtJzxM2X3r0bW9BfGWZODs7R/rawYU9VY0J2o66ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRk7Pr9VrtrcE+pq75pNFroRdOWz6kG2YK+mKpsPAWs=;
 b=Q0R6Rd2wyJBT8gSJu8SRLQjM6LgtZblNMAZc6xFXimcsZbiDw8VsvXW9u0+LmvTPPpmA8eRQToVFdDwGqiVM3WyowJogQ2Iq8YHbL49vLuJ9NQiRIW/Egd5LnGz8iK/oefiGKangQ0lqeCBdTdjSBbzl2JfMI79EAQLXa7gnQ+c=
Date: Tue, 1 Feb 2022 12:04:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] x86/mwait-idle: squash stats update when not
 actually entering C-state
Message-ID: <YfkTt1k4XLnZtaJj@Air-de-Roger>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <6a9152e5-1a7d-c569-3483-66f022027597@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a9152e5-1a7d-c569-3483-66f022027597@suse.com>
X-ClientProxiedBy: LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e33fceb5-5dc6-42f1-6be5-08d9e5729d7a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5871:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5871A2BBE1FAF9AC1444251C8F269@SJ0PR03MB5871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTW7x7DyNyD58xoSh3UcN3K5rRd70EqA5/TmDNfKwH/dRzWj/ri2Gq5AZyH0wzDWN9/iEr241ouxQ6rbeupkDW0d3snjvk+U38pafT3SarQZZ86fHswyl6cZaPuwf3BC04zFV4LSPvyAY7WkS6Yfwg/hlSjYBhwXgohaRIcZmojEOtRqB4pR03UbYYcWrLaqgBN9f6kyXE0tdBT5fWCFZIUBWDTHyOfr648XcFk1SXCmfXRvRTVl0rjpr9ta4/XsgeuEP3OEl6tTXrjR3eQIzr2JLVzg720Co/diQCDijeEqokRCbTFIABjahS+6f5BLqnw+uboTQo4N//SaCp9csKWGC7h4GMab2rQF0UTp9DMe4ARB6lN3td3bKd7PkbX0ZwIwdX+DhOccGL++eS+HnnWnWxyTnWfZlUGqaItfsqn9S36av3nXGKNhJ/LWVU41pLhtC/FWRw0N2btijTUp/BNtOMnFfWnRMZbsQ3lEyykmNH7GKVB9oQBWP8s6R7RzfOg1QtnA4OZ+Cd5AbfU6vQGxlmFqPeEfyLISkqO6/AjI00aCWPEiJkZuvk641l3T1VzdroPCEQbs+GkXas5l7aP5RuOJLoSPpy0GuB47Hx4UZ7uOl0iRfzZRIkKP5SLIXio1/N0IAbzjyKRDK7w2Cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(8676002)(8936002)(6512007)(6916009)(9686003)(508600001)(66946007)(66556008)(4326008)(6486002)(6666004)(54906003)(316002)(2906002)(85182001)(186003)(26005)(83380400001)(86362001)(6506007)(15650500001)(5660300002)(33716001)(82960400001)(38100700002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVVGalE4QW8yeHFNdGZpN20wcDZaTndoNzkrVXJPQ0Q2ZUF5NW1LQllBV3pE?=
 =?utf-8?B?aHRNNHM1eTFmaDJYT0VGZ0p4cC9QdEdIczBHV29DZEt1MjU3bjAyODR4NnJU?=
 =?utf-8?B?T1VxL3VsMlVwUDRuemlvVEFuOTZ0M0FmZG14VFJseXNnTnZ4b3oyeDRUdG92?=
 =?utf-8?B?MGxuZm5laitIOUNsTUhmL0luQWVhcTdLQ3g3aW9JNFNpZWhCdWdFVmJDUXVy?=
 =?utf-8?B?MlpiRm5EVWRVRldqa3V6YVdleC8vbXRMc1dVazBaeCsweXFJcStpRmM2S0Nz?=
 =?utf-8?B?MVc0cnBRNEJFMWpkVFZoUTlIUDRzTVRpa2RESysvYUVSaDhQNGZ0Y21ZMEdQ?=
 =?utf-8?B?ZHFiVE1acXVnWFNkNDNFaDZ4dUFMMDFDOUNGdGJWNG5RUjhWWTFScnhYOXNZ?=
 =?utf-8?B?UXBvTUhTQm5jVlA4bXFHdzU4M05wdjZybzlsWGswcFNSRHpEZGRzcTZNOFVt?=
 =?utf-8?B?U3NYUjlEWU8ybUJacnJDazFxSDdmQndQSVlhOC9wTzVRZG1LUnR5Vlo3alJp?=
 =?utf-8?B?VURMNTRLT1l5VFlXMnRZNStYVHFMZGVGcDcyYk5jTktVRE43dDRlK2l4RER6?=
 =?utf-8?B?encwS3h0YnhGZnlmd1hqNU1Dbnlrc3dBR254eUhYNnAzMC9va2ZGcThOTVV2?=
 =?utf-8?B?Vnl3TEYyVkpNd0xxRHBRSStvb25kU3V0UmJDajFiSm9GcEhyaVRMRkZkY085?=
 =?utf-8?B?cm1CYTIvWDB2R3VaZ3Y3MkdTNGcrZkxSR3BiSzMwQkREL3Z4bG9zR0RwZEcx?=
 =?utf-8?B?L21lT1JvSzRHeHpHYzI2bEZCSUVPcDN4NzRzbnpVeUNmN2l3c1dKblFnWGJR?=
 =?utf-8?B?Z29FK0lMbGpTd2xFSWhJQlhneDN2ZlpzY3hrc05YYURZZm9sYnNCZXRmc0Y3?=
 =?utf-8?B?TjRUY25SMHV5bXg0b2luTS9mSnRmRWVBN1pJMURVOVJKUWZ4Z2Rib1FuQ2FN?=
 =?utf-8?B?WmFrRXU3ck1Wbmt5ZE5hc3hOaG05Z0NNbVk1U2RnRWpmeEUrSW55Tk9ZTTF5?=
 =?utf-8?B?WHJWMmcrbUI5UWlVbnRuK2lXcGNwVFBZTHhaUERmSVFRNWx0djlSK2xMbFkw?=
 =?utf-8?B?Q2FqaVdseVV0RTlOSkNGR1crdjZlNXh3ZVFPMGp3cER3WXdjbG5MczRwdTlw?=
 =?utf-8?B?eHFkRDZJMU83aXNNb1JDZnlMWVhlYVVGTGxicDdMZHdKUlFTVHYyb2l0ZHgv?=
 =?utf-8?B?T29Idmc4NFg1OTdIN3pVbVVocHpMMmF5NG5XdVIxOGxJN2M5NG5aa2N5WDBZ?=
 =?utf-8?B?bHpaUHZ3UWFxdENlQjluYlRxZkdHVWhWUE5aRzJ6VytSZkFlOHdNakg3K2hm?=
 =?utf-8?B?YUdCV2k1amJFUi9ZNytGWVJRNi9iTnI3aXZDZENFRFVuN3lWMWZkVUNla3R3?=
 =?utf-8?B?cEFHU09yOVM1YzY3eTlXMUM5YTF5WkFFVUx6QXowTjBZSzloWEdRZ1V4ZW9W?=
 =?utf-8?B?ejRIbHRnVFNrWHdqTHUwSW0xMlRDcVZtc2c2RjMwdkN5Rnp3ekxvckVuTVpI?=
 =?utf-8?B?ZGRVNEtKM2Y4NkNGUG1Ed1BjL0ZrbFVVRWhBYys1TFN3Y09TNlNsSUM5ZWpS?=
 =?utf-8?B?dE1SaktnMVJHbnY3UGM0NU14L1lCTVkrd3c0WE9HendHSUJ6VFMvWkthRHVR?=
 =?utf-8?B?NisrU1lSUGoxdEc0WGx2bktjWGxtTVBhTGZ1NU9LYzFZMnc5cks4U0YzKzR1?=
 =?utf-8?B?R0VFZ3E3MmFOaDljU2h5ejhJY3ZPdXQ1dis5NU1uS0ljUTNjWTg3VHF6NXNC?=
 =?utf-8?B?OThMNWlmL0N3OXFNUVdwZWFUWUpHQzhsdVpwR1BzMTBBb1QxYU9Qc2liK3Q1?=
 =?utf-8?B?QXJzbE5NTk9jMHR3WGwzNzk2Q2NmZVN3QWVuYm5XOFgvNWIyQzNGY21OMlpZ?=
 =?utf-8?B?WGEzV0ZFd3p1dHJVU0pnakVLSG1IVnA0R2FjS0xxWnVWaGZvUUF5d3hoRkR4?=
 =?utf-8?B?dllQOExvbHdkUnNib2dVdmhkRWpiYVJacUlud0RQemVxUjFyMVJ2Y0lkSjZu?=
 =?utf-8?B?NGxpSWxRZ0o0M1c4cnZMVjNxWFhyQjRvdi9CaDFrM1IrYXM3ODVTdTdpb0xR?=
 =?utf-8?B?eXVkR0FqT3VWcHdHUExxMlFKSlZrYkl5MnlJc2h4TEVGcEM0MDBnc0x6SVRC?=
 =?utf-8?B?WnBSanN0bEJZbHQ1M3lEclJld0NEVzh6YWZmaUppN3o2eU04dXJBcnBML1hh?=
 =?utf-8?Q?lALQTcl453OwX9geVi+gJmQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e33fceb5-5dc6-42f1-6be5-08d9e5729d7a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:04:28.1650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrEiVxjp8SP8R7aEg6SwIEqaqLAzSfgNWj//uTNjyVb/rs7rNCr+XA+7nuh3a6b46RnHny7493XuKUgFEglFsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5871
X-OriginatorOrg: citrix.com

On Thu, Jan 27, 2022 at 04:13:47PM +0100, Jan Beulich wrote:
> While we don't want to skip calling update_idle_stats(), arrange for it
> to not increment the overall time spent in the state we didn't really
> enter.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: If we wanted to also move the tracing, then I think the part ahead
>      of the if() also would need moving. At that point we could as well
>      move update_last_cx_stat(), too, which afaict would allow skipping
>      update_idle_stats() on the "else" path (which therefore would go
>      away). Yet then, with the setting of power->safe_state moved up a
>      little (which imo it should have been anyway) the two
>      cpu_is_haltable() invocations would only have the lapic_timer_off()
>      invocation left in between. This would then seem to call for simply
>      ditching the 2nd one - acpi-idle also doesn't have a 2nd instance.

It's possible for lapic_timer_off to take a non-trivial amount of time
when virtualized, but it's likely we won't be using mwait in that
case, so not sure it matter much to have the two cpu_is_haltable calls
if there's just a lapic_timer_off between them.

> TBD: For the tracing I wonder if that really needs to come ahead of the
>      local_irq_enable(). Maybe trace_exit_reason() needs to, but quite
>      certainly TRACE_6D() doesn't.

Would be good if it could be moved after the local_irq_enable call, as
it's not as trivial as I've expected, and will just add latency to any
pending interrupt waiting to be serviced. FWIW, I haven't spotted a
need to call it with interrupt disabled.

> ---
> v3: Also move cstate_restore_tsc() invocation and split ones to
>     update_idle_stats().
> v2: New.
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -854,17 +854,23 @@ static void mwait_idle(void)
>  		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
>  
>  		local_irq_disable();
> -	}
>  
> -	after = alternative_call(cpuidle_get_tick);
> +		after = alternative_call(cpuidle_get_tick);
> +
> +		cstate_restore_tsc();
> +
> +		/* Now back in C0. */
> +		update_idle_stats(power, cx, before, after);
> +	} else {
> +		/* Never left C0. */
> +		after = alternative_call(cpuidle_get_tick);
> +		update_idle_stats(power, cx, after, after);

While adjusting this, could you also modify update_idle_stats to avoid
increasing cx->usage if before == after (or !sleep_ticks). I don't
think it's fine to increase the state counter if we never actually
entered it.

I was also going to suggest that you don't set 'after' and just use
update_idle_stats(power, cx, before, before); but seeing as TRACE_6D
also makes use of 'after' there's not much point without further
rework. I also see the RFC note at the top, so while I think this is
an improvement, I agree it would be nice to avoid the trace altogether
if we never actually enter the state. If you want to rework the patch
or send a followup that's fine for me.

Thanks, Roger.

