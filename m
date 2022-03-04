Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CEB4CD10D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 10:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284103.483251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ4Hu-0005Oy-Qo; Fri, 04 Mar 2022 09:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284103.483251; Fri, 04 Mar 2022 09:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ4Hu-0005Md-NY; Fri, 04 Mar 2022 09:31:50 +0000
Received: by outflank-mailman (input) for mailman id 284103;
 Fri, 04 Mar 2022 09:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ4Hs-0005MX-Qw
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 09:31:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e83ad058-9b9d-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 10:31:46 +0100 (CET)
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
X-Inumbo-ID: e83ad058-9b9d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646386306;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jifoNZv29ZUyfi+/fhy8//JPzu9WaOPYlLcB25hHUcA=;
  b=BEbAFVSuZP6ro+AVKcw7/ZVa84Qb8INTvA22yUtAPVfd6gMO7cZmXXIw
   ysZyAxZ6KI/ajIxHFf5VMRwMi5BXMY/bcAuP6rlUR+Ctxbo+ZtVrg13OT
   CDChcXQeNMMjVUXoZQWwwduzRvMR5AhyhYBZSn3GS3FgtNwMEFHMpygY2
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65869201
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sMnA36O/yABwGEjvrR2zl8FynXyQoLVcMsEvi/4bfWQNrUpw1WFTz
 mJODWvQOP2PN2WmKYx/bo2xoBgPvMODyd5hSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tIw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 IhSjMG/blsQZZbnovpNFEh+HyJsBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmpg2JEURa+2i
 8wxSxxobTuaQSZ1FV4eBZF5xOCWv2LkfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla84wElBtV3T9Rh0yq31PqTsiCVBXo9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzDJrVml
 CJY8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id4Lu2svfx83bp1sldrVj
 Kn741k5CHh7ZibCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikE0OALWjOXCMqeb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:mGF1cKuvMIHzuLdDdQSw9v317skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,154,1643691600"; 
   d="scan'208";a="65869201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtxZ8Jd2ZOr7m1aDZjmQlSwX2sWrV1Uy51Dob3CD4+yh1u4ahnWMQabadcydxUXgTQxHMY+17MDGXHxiVgEy5MEAmDyePmCu0L+lTXKzpzURStbHn91INDL6ICM9b+m4o/Ni5sUwdzdcSOreqBAM6ksdM3oWFjU89GBGnxm/2uz1pEHCPiyp44U3AbXPMEv2IgZrRMSI/ndEgToZVIl2viDelb3zIUMfdFXXH+23EwdvEUV3hbdIT6+JO/DNC3w3eRkj2Gl42UfSSpeDF8HOgkDOPD1AcinQQc8+mjFxd+CAHgU2at9bh4TUyueQL9PwZCPuj46RRCF/pgEOf2dnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8sXyyt3L3wZhfLq9d8zDwJ7p6dp2ouhmGJlKbKFa+M=;
 b=DS7G/9ojDp7zTPwgbqgNZpyOqfL5QiJ2/9spCNdg8LBI5zn6oOHP7pK4JheRvPvlHrwRJ+Z1niBS/FzuustUsoAIGMjtSgOXZmkcgeoXxNNAPlfQK85osKOB1e08gFbPCmloUjdpEXE1jBbZDPApw/QmmGtDocKSViX3GgcG1STyrd/wRtxnRVFXzajs+kBU2s/9wn8ER1AderHRi5oBkDlqC4zOlSOSNY4kIV7SjP0vqQrLYJdW5n5VjsCxvN6S1IKuRBKHtWxL4CTBuq+KBxPTTM6nRMVfGoesvueiGLmniMgF0h3sk9wjYYkN6S5tQ4T6UUUmFpiOHyK/M3WGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8sXyyt3L3wZhfLq9d8zDwJ7p6dp2ouhmGJlKbKFa+M=;
 b=IMOxWHHmJuMe2ZJUGxKj53cKYEwWJN9IpVXGQuby+4cQyMi/cGy8f/hxfWDP3qZz+GzcGyk6UnZdwjKzuvlcbNbo0tTyIUgWmioaqyK0KW9jiltF+AowJDciaei2Ybuk6AoFMe3NWzaTpSa9ETH4rOR/PtneaF6xm60NxKt0GjY=
Date: Fri, 4 Mar 2022 10:31:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YiHceSbi5SPim/4S@Air-de-Roger>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
 <YiDaQY1ToO8G2QYd@Air-de-Roger>
 <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ad54c06-a698-44e2-96fa-08d9fdc1c9e8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4844:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4844840133A5B35EE89894898F059@DM6PR03MB4844.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ckFuyQG90zcOCUkSbF6L2IyxHonNdlaOEu3faxlW5yRg42YLfISwarR5aVXy60IymvQ79XLvt2nhVMh4ukgTAb3KiejDtG2Me0RytxdGokUKCaUGxqzG0E+TyqD1WaYBtbVvNxYXq3q5UugvF7Cyqw21Zh1defPIaxFsIu4bxP9/UaxqiUVebJRC9/dGSqRIalifszRTWs7JXmO3sI4TZVNpf6YZshr3gqkDzXrpodVWfn16uoc3YG+F8z7KJolYosnQ/OhsEummt/xET9YZrCEu63MJ8Efgu0edd02RI2MHrqx9nMqOTpZmqIGPhFyQ4NxL7Uy8R28Eu7gnalbmKWsMZZwbZ+Kvl5dT/BeQBGD4c6SdCXuUsKNp9otaIKVJ4ry8IwDQxZbkVh8jnpq2k9mTMqLPMzJmzWcXqth/9mIit4el3PJH9h/Xk91YWRSnBCle3rLks1o4t4Ln0oi5tFat6MI21ffHjEVRcjVrKfS2HCm2u4Sf5dqOls1Eg3uia40dWKj9RqFWSSRB0aVAcOP9DIRHXgR6Sou2HxlD80+Ze3J/qTJR0hC44VK8mi2M+d42UzpwOBl8LdY7Jls+zqzqEy7zGQVMXAmYzAXySePkysp3FHzqt/Ky0+Wakbpbns43XOKydU9ViLX/yJr0wvwhlCR9zJPF3yuxZdeQbhdjJQXf7GRgfe1ZK33nTSSyRaHMDkLkXzpVLL8+BYl9YXrJ1j+bQd7qW5Mas5p6+LM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(966005)(6486002)(83380400001)(85182001)(54906003)(86362001)(6916009)(508600001)(33716001)(8936002)(186003)(26005)(5660300002)(316002)(6666004)(66476007)(66556008)(66946007)(4326008)(8676002)(38100700002)(9686003)(53546011)(6506007)(6512007)(82960400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWEwNE05UUZ4NUd0UVhkckk3amorQWdxYk9VMzAyenNOS1NXeHZ0REN4WTdS?=
 =?utf-8?B?TGpGSGx4M3V4aEpzdVYxV0pVWXhHNms2T1Jpc1dlTEZzMEIxOVBROXVYNkJk?=
 =?utf-8?B?L2lOWDlkYkV6cExZMlNYNEZ1M0h6VFVIb1VBck0vRENaMk5IZzJ0SHo5akFo?=
 =?utf-8?B?UVpKY2RWWUVIcUtsSGJlRnp4WS9CamlmY1dtbHF6Zk1ka3RabElDem5IL1Zp?=
 =?utf-8?B?RzNvR2pzRjZIamZveEF2SHIvZk1XZ0RJcmpxMzNGSkxBNVVVck1ETHpaY1Zs?=
 =?utf-8?B?K0syTHBXRGdYUDZoUXVhR2NXTm5QYXlYSEUwQXptVmNLOG5paFE3VHZPeEE3?=
 =?utf-8?B?T1E3dTlETXFZaTk0Y3RucFkweHBzei9GejF3VTdUOHdzZDJDS0ZaTm44RnR1?=
 =?utf-8?B?SUh6VXIwZERtOTYwR3FQTUt6MWNUYkJFd25GMy9EZXB2aUJ0elc3OFllZm1s?=
 =?utf-8?B?ZnErZE5DRmFmVUR5RkNxR1dyQlpRTElBRnZpcEx1ejhoblR0RklIZkh1eUVV?=
 =?utf-8?B?bVhEMVJTeXlBemQ1aWpQL0JzMy9zRUpCaEtVcCtKYmVQeDY2SUpHVFY0azJi?=
 =?utf-8?B?SXFacTJNYXJxMWtYZ2lITFllRU04QTFGWVlBTzdRbStvb2w0NmxqQ3NDWC9O?=
 =?utf-8?B?ak1HcGRoUHhNL2dOd1hmajFhWmRrRmc1UlFCQllqNUZEWnpPbkpvZnNpZTBP?=
 =?utf-8?B?NzZ1SEpsRHpzYnR1cmdZaHFiYjUzUlJFbExlYm1PRnJQUktZbUZxRGFSditx?=
 =?utf-8?B?WTRkQk9EN281NjJ0a0h4MEZTa3ZxL2kraFpicTVZYWR6bFdrR2JmQ0hjQUJ1?=
 =?utf-8?B?bUxYbTk4TWlRSWtFZXNwNXcxWVZTQ3RORENsNXBEdDk2RjkrekFZa04zdmNT?=
 =?utf-8?B?TU5WVDNsTHJtK2U4MFdVbHliTlUxbXRhRTBrd0ZkNHJzZ2I4cmMxSWlxbzRu?=
 =?utf-8?B?dWkwczJKZDBkd0lNRTZVTGt5ZW41NnFyWFZPWDVZZ1ByYW5CWllRWmhNUDJo?=
 =?utf-8?B?ZTJMSFZBUVVGeHU1OEUxM0Rwa0xGdUd4bFhmbnB2M3Q2SCtXTWI4VWFEV3Nk?=
 =?utf-8?B?R3JYVzlmSlZZQUEzbjFCcUpTbk9VYUZtZE8zb212Rm9YOFhpeko1a01KbmZQ?=
 =?utf-8?B?VmFvNU44dXdJaUVqazVxYitiSDBLRzRic25tZjBOdnBzVW1POHNZRHBzRDZr?=
 =?utf-8?B?MXdDNWQ2TGJqa2JGbFVwMGRTZXV1bFBJMVE4YnNIbzNvRGpqWVl3SnJ6QnVN?=
 =?utf-8?B?aVZjdXdjWmo3QmtlUmJEQW1yOFNiZjVyaGhlUjNRdnhYMVZDVThFaHY5bE9Q?=
 =?utf-8?B?TXRSMVhyTkdNendVdEtKSDVpTHJLMWVmZ3V0WHNUK3NSVTJOelc3Q1g0YXBG?=
 =?utf-8?B?aGNKT25DWEZtOE5xdjBkOGZpQWd0WFhqY1RHSUJCVFI0UW8zWVM2cFBsdDNp?=
 =?utf-8?B?VTlSTE1TTVNUblVsTHZnL1ZuaXA2Z0Nhd3pua2l3SmJ6eW01dnlKWmdpNDM1?=
 =?utf-8?B?Qnhnc2NOYXMyT2psUW5iTDMwRGt1TFB3VjZTb29aN2t0ZXUwdFdjVXFjM3pT?=
 =?utf-8?B?aHlHZ1NQWFExd0NSRm5lWkphbERzNmIyQ1dtNll2RHFiOGtRUHcwZU9DT25X?=
 =?utf-8?B?dFBYZ08rL3hBUFRVaTdJQUdaNDVHYnpYSlZyZG1VNGUrQlV3cmlrTWlJaVZm?=
 =?utf-8?B?QjNsUWhQU1piLzBWWm44TU5mUytuanZneG5zQS9MSnZzYlcvdXBVU0kvOHpx?=
 =?utf-8?B?Rnc1aVYwYVdmOC80eGg4M1g5aG5OSHNXczJZK0NxcVdFN2FhcjA3OWJyd01o?=
 =?utf-8?B?UVl2SlpVRjZDMkJPbFE1dWVnQ3czSTNHTUZsbVJQRTRiejFVQklmWExWQmJt?=
 =?utf-8?B?MGVNT1llRUlSUStOQ1pySU9Iei90NW5pTXZaYmdpQ3lGMmVKQ3pzTWlRckFW?=
 =?utf-8?B?djJRK0pIZzFWT01uZkF4YmZ1QTNpUlh5WkFycUxBQ2ZZdVR2STlSd24wUk91?=
 =?utf-8?B?N3RHMlBGS2lmR3ZjSlVSOHk3TWxIRXhLZUVxLzMyZEhtSE5yaVc1SVdGK2tY?=
 =?utf-8?B?Z1owZ3Vwd0dlQzR0a21BSXhWUDZIZ0h4cWZwbzZ3MjgzR1ZncXJsTXdVMFVw?=
 =?utf-8?B?alIvek1VRzA1N1FYb0lTSHl2eWRyMWRsdVdwRWN3YVlsOXBSZEh0S1dsS3Rj?=
 =?utf-8?Q?FE7MpxFO855D+/uoaf4vhI4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad54c06-a698-44e2-96fa-08d9fdc1c9e8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 09:31:40.8552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leSjykit0I66LUwBkndoOiyG9PFbcceqV8K2+TKoWqv4WEOAX5e27TIYDARt9i2SvtSsQy3Uqa+f8JzzF2Y3fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4844
X-OriginatorOrg: citrix.com

On Fri, Mar 04, 2022 at 09:02:08AM +0100, Jan Beulich wrote:
> On 03.03.2022 16:09, Roger Pau Monné wrote:
> > On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
> >> On 03.03.2022 12:19, Roger Pau Monné wrote:
> >>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
> >>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> >>>> binaries"), arbitrary sections appearing without our linker script
> >>>> placing them explicitly can be a problem. Have the linker make us aware
> >>>> of such sections, so we would know that the script needs adjusting.
> >>>>
> >>>> To deal with the resulting warnings:
> >>>> - Retain .note.* explicitly for ELF, and discard all of them (except the
> >>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
> >>>> - Have explicit statements for .got, .plt, and alike and add assertions
> >>>>   that they're empty. No output sections will be created for these as
> >>>>   long as they remain empty (or else the assertions would cause early
> >>>>   failure anyway).
> >>>> - Collect all .rela.* into a single section, with again an assertion
> >>>>   added for the resulting section to be empty.
> >>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
> >>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
> >>>>   .debug_macro, then as well (albeit more may need adding for full
> >>>>   coverage).
> >>>>
> >>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> I would have wanted to make this generic (by putting it in
> >>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
> >>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
> >>>> LDFLAGS would mean use of the option on every linker pass rather than
> >>>> just the last one.)
> >>>>
> >>>> Retaining of .note in xen-syms is under question. Plus if we want to
> >>>> retain all notes, the question is whether they wouldn't better go into
> >>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
> >>>> notes are discontiguous all intermediate space will also be assigned to
> >>>> the NOTE segment, thus making the contents useless for tools going just
> >>>> by program headers.
> >>>>
> >>>> Newer Clang may require yet more .debug_* to be added. I've only played
> >>>> with versions 5 and 7 so far.
> >>>>
> >>>> Unless we would finally drop all mentioning of Stabs sections, we may
> >>>> want to extend to there what is done for Dwarf here (allowing the EFI
> >>>> conditional around the section to also go away).
> >>>>
> >>>> See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.
> >>>
> >>> LLD 13.0.0 also warns about:
> >>>
> >>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
> >>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
> >>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
> >>>
> >>> So seeing your mail where you mention GNU ld not needing those, I
> >>> think we would need to add them anyway for LLVM ld.
> >>
> >> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
> >> pre-processor conditional keying off of __clang__, as that used as the
> >> compiler doesn't mean their ld is also in use (typically the case on
> >> Linux).
> > 
> > Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
> > but I don't really like matching on human readable output like this.
> 
> Same here. But Linux'es ld-version.sh looks to be doing just that.
> 
> >> I also don't want to add these uniformly, for now knowing what
> >> side effects their mentioning might have with GNU ld.
> > 
> > Wouldn't it be fine to just place them at the end, just like it's
> > done by default by ld?
> > 
> > Are you worried about not getting the proper type if mentioned in the
> > linker script?
> 
> I'm worried of about any kind of anomaly that could be caused by
> mentioning sections which a linker doesn't expect to be named in
> a script. That's hardly something they would even test their
> linkers against.

Just realized, in arch/x86/boot/build32.lds we already explicitly
handle .symtab, .shstrtab and .strtab for LLD, it was added by commit
10d27b48b5b in order to prevent LLD from complaining about discarding
those sections. So it should be safe to also do this handling in the
general linker script?

Thanks, Roger.

