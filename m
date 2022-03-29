Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F664EA88E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 09:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295694.503303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ6JP-0001Jf-2G; Tue, 29 Mar 2022 07:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295694.503303; Tue, 29 Mar 2022 07:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ6JO-0001Gb-UX; Tue, 29 Mar 2022 07:30:42 +0000
Received: by outflank-mailman (input) for mailman id 295694;
 Tue, 29 Mar 2022 07:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1vv=UI=citrix.com=prvs=0801e2fd5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZ6JN-0001Ek-KP
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 07:30:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 200a29f9-af32-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 09:30:38 +0200 (CEST)
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
X-Inumbo-ID: 200a29f9-af32-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648539038;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P7LaVwEUO9o/mUITr9NXl39pFPd/fZg8cHV9j957Ytw=;
  b=ZTgDGK2Q4UiE9bdTzIdqOwdkDcFd4OndPb8hIp0t6JGsxJgFIsMh6A8l
   N4cexDlNQaOmLHqmDgW+4Q1bnWL9VkATYuegQE+EuDFw/fptGXsdNPy6P
   X2wbceZ49zGQicR2PaiL21cotd6p48CWBBNZWCF3r7NJtPfhUya10iBly
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67405460
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gOUO8KJndvvhUUjSFE+RUpUlxSXFcZb7ZxGr2PjKsXjdYENS0TwBn
 GdNWDzXbvqJMWenKowla9yyoxgA78DTm4cyGwNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dQ52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IUdv7CcYAU4B6fVvc8NYSUEF2ZzLKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv2pgTQaiGD
 yYfQSdNQizmPExEA3cWN6IlhMG62CPOeQQN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S3yyeB83+qrv/Cm2X8Qo16PLG3+vNlmlS72n0YCBpQU0Cy5/a+lCaWRNZ3O
 0ESvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAIViVEacAmnMYuSCY2y
 0SSmNf0GT1otqbTQnWYnp+Wpz6vPSkeLUcZeDQJCwAC5rHLu4o0kg6JQt99EbWdlcH8AzX5y
 XaLq0ADa6471JBRkf/hpBae3mzq9sOhohMJChv/DjKvwi9QZp+cbZWNwkjp0apEa4uIQQzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPLt4wOuBJ1+U3aB
 Xt9WZz2ZZr9If47pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsPPY+FqPq
 YgEaZviJ/BjvAvWOHO/HWk7dw1iEJTGLcqu95w/mhCrfGKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AGXuJEzEi3TMioLQOq2Bf5X9CtnVQRxbQfA8yVyOu6HsfZAH6bbiJF6rYSPO9YvF
 KJbEyhBa9wSIgn6F8M1MMCl9dc4JU3x7e9MVgL8CAUCk1dbb1Wh0vfvfxf19TlICSyytMAkp
 Kan2B+dSp0GLzmOxu6MAB5z5ztdZUQgpd8=
IronPort-HdrOrdr: A9a23:iObBtqE5FOHLHaFKpLqFBJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo+VvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvj4lLYIk7zU9HakGOul5Dt
 T/Q9VVfY51P7wrhIJGdZA8qJiMexrwqSylChPhHb2gLtBDB07w
X-IronPort-AV: E=Sophos;i="5.90,219,1643691600"; 
   d="scan'208";a="67405460"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul9CzycNzfhy6Vvne+NJ5iL1LHC4JBq1XaDqpZ8SlKZDKqlOrskkM6QuXj6ibndOxvWG8z79uA1xGEtdKEDSen2y+A3b+AY7WtjxMnC8inf8iOwNCPTNRCUR941T1cXa/A3CqXe1UF182GMCnlIrXNgyPm/SGU4vL7V378ROS9bJemG/gad004pejSqTOeDC3vJpUkpuiy/rC1Iv39TcBI9wVtB0P6QlZCHHse7LmZhxYNnrv9dGUlwX2Xqc5/j5AjmU4c0hZzaN+6HOCiihCJZuGn4GLz+kn2hoQ4+pPIDMdJxBpRNuy8MpP9t3Ox8R/00p7eUo8JAUh9udqxXKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7LaVwEUO9o/mUITr9NXl39pFPd/fZg8cHV9j957Ytw=;
 b=SMXsL2K5XdKyPiZ62hUEsbkUorAmyBrPP3l5mJUvx9H2aP2swgLy7toQNk9V0Ho6TEZc8xx6bxjeTUo7Mp0+gXiWSpGkD6P2GgTLaEl7ZRiOkQ5q5MCj3KyaW900M2pr8Fk1Y5FO5FlGUUL4fAZ6MiFjsQNblD9Eq90rmO3z0mqXAyXl8sUF+BZhx3DGlbjsCh4l4YszgpqiGtCJIhOinsdh5YQmrnBtQERiMxTGkvjM69LqZzKxKXF0YkPMuOF9Yl2rq2v8wOm0d8cLGhyDHGrtewgIPK+JJsGeYBDN2tYLLc3Ef8C5gCNpMjfyKDAnTHvmdALhh5FYV5lwafPo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7LaVwEUO9o/mUITr9NXl39pFPd/fZg8cHV9j957Ytw=;
 b=G/9S1h68n5f1kRnjldkY7J4Bq8cohBuctSOrjQkJV5suwMRcWJyrlUrF8pMvwwH9EnVmNUHASIpRKreelWEkIiBeR8rTMJL6KAcWx6KBksdo5my7k0V5dLCpP1F6f76+THhqbAaULaS1dfxGxV0mS3bZKnxJWg4Kv2od0o/QUoU=
Date: Tue, 29 Mar 2022 09:29:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Message-ID: <YkK1dSS6RZ9hzyh6@Air-de-Roger>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328203622.30961-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: MR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14a9391e-9c7c-4965-9647-08da1155f0c2
X-MS-TrafficTypeDiagnostic: BN6PR03MB3092:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3092E15DD77F0F9979B488458F1E9@BN6PR03MB3092.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ILhd2+9AfojH/tbemQa/6aRT+8R6N80Q6IKHJWX7F0GcfbkO6uv9DSXW5Nn6dphL9beLqryT6GjlR937H1k4fyWqXo+nA2qVRpJxtlAo9qvn1YPUsRmDHMCmGPPcbRTDnqag9u2aJtyPEy5WmwWCRzXuBgE319vmJ46D0qW3qFf1PnR8bicX1+RH32Bf5fRXGkQpXUQm1FIf5w3ui07G6Wej7d4G12KUII/P3K3gIJuychJWIrt2TU3b8NMbWniEyaJyBTwngkzG1E+B4l1bdCUHmU3EL1k2DPyIjG2xI6E3IEe7JMsz+GrclTPD18c9yb9tH5pPN2RWwZ2EsiY3ygrDLOzqu9AJVenkrLYk1IYZLRoCjO1DroIfYN5t6Fy+LCqGekt7B1dvzAd66h/jKbAUNBLFvooNXiXpN/ZujKNRCgydQNS+KtyblL+oKU+qAgZTxAtfbvokW3cryjY518cU1JHFLlXj+sc0xu1mLUGefejOSXod1UpDKv1lUKFySAW9NZO9ZAH+UEEvm42x7PHHDJ8RoJny2li2EMsNnHoDj4ljtKSSsSCLd56LeJJ1sLMniOaq9QJhAiyp8jgp3Qd9u30987cdcQjGdGYsP7hTBIH0Z+x2q0X30U2aEdpNco3O6NTDfXBheJNPrXzbTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(6486002)(86362001)(54906003)(316002)(4326008)(38100700002)(66556008)(508600001)(85182001)(82960400001)(6916009)(66476007)(5660300002)(6666004)(33716001)(8936002)(6506007)(2906002)(66946007)(186003)(26005)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJ0OTFYajBBd0RRWUJtdGI4SVQ0UkY1dXNKd3N1S3pUSXFjcXNwYTcyTW9N?=
 =?utf-8?B?QzVMUTIzbWNoc3JlSk9OWHhpSFlzSW5JNmVsRm8zU00yUSsxUXN3ejd4cTNY?=
 =?utf-8?B?SUVKdkV4MWdYdkozdEpZdFJMV0RMUkFEemozUUN0VnJLR0lqcng1OTRFSUNl?=
 =?utf-8?B?bWVDMDVGeDN4anVoS0hzcXc0SGdlQjdnK0RhWUVIcHhMUXlBMUFXL1hMeVJF?=
 =?utf-8?B?Rk1wVjhlTktRRVZtdENyRnl3WDkyOGVhdEhmZS9qMXo5QW9wSTQwQzhHQlhG?=
 =?utf-8?B?cmNmVyt3MVlGTExkRHVQNkRDNXF4K2h1MVc5L244OEJ4V20vM3BFRjN6bCtX?=
 =?utf-8?B?dld4b0NtQnpwemdCUnhwV0plcGJHS21vVzdLT2tuU0NYUWE2MzFUOTlyMjZs?=
 =?utf-8?B?S1dKQXdGMzI4S1c3NzV5ZWNDZmpLcDZyenFwT3JPNkoyZnhIWlEybTlYRjJh?=
 =?utf-8?B?NW02S3g3cmxKOFZrc1QxOGFXcGpTYStXWGNsanVub3YrZ3dHZHEyanZPRUIy?=
 =?utf-8?B?VFl3V0wySGZ1NVNKSnA1cThDM3ZhNnVqdjhnS3N6aHVIOWpZTHdHNDJDZ0t2?=
 =?utf-8?B?eGxlVEkrRzluYTlHRGdzZHFpMTdkRU9nSkNCMzNzNWFkOWhPUm9hbmlUSFBX?=
 =?utf-8?B?RHp6aWlVOExHZ2pqQlpPbzlxR2U4cEZvQmtBTXU1azhHUWRsbDhwWWY2VXJB?=
 =?utf-8?B?ZkhTTy94N0NLTEN3UXZBMXplaFhSTkdiYjg0NmZ6clF3ejl5R1hhWjdTTCtw?=
 =?utf-8?B?a3EwOHYzZ2ZMZlQ2eExWSXdmcHROZ2hLU2dtSDNqL1RzOE1tbXExcXUzN0Jl?=
 =?utf-8?B?MjBodHRrYm5ycURySXczT2M1L1c0bU5tcXZhd1RUZDllQ3pFR0grSkNlaHBJ?=
 =?utf-8?B?V2lUc2I5emV6a2l6ajZuSlRLTmkrbXFqUG53bkQ4U2VWREN4ZSt5WTB0SjhB?=
 =?utf-8?B?Qzd4VEpyOWlNUTlxQmtRTzJuLzI3UTJwclZCcXcyZEZHZXZ3TTQvQWl2Y1dz?=
 =?utf-8?B?SGJsalhKTHc3WFh6SjBRVitrRlRDcHZSdkpOcDF0K3VOaDREMHJjdmp2SUNQ?=
 =?utf-8?B?L1pnU1BURHgvTmlidHgvZE9qQUN1N1h6cVowL25zNCtGclE3V1dJMjk2d2w4?=
 =?utf-8?B?NWVQaTBwNGM2T2QvV3ZUN1FwMnJNQkJZVUN1RWJEcHg4d2VQMXhtZlBrV1lo?=
 =?utf-8?B?UjdIK0c1eWpwU3FCU2U0WmdRbnZSdTM3WVlGREo3SHgvYTU4ZE51Y0tWOTNl?=
 =?utf-8?B?U3luVzFSRzlwV0VsTzBOMEliUmw0K1pKL1dwTGFiRnV5QUZxYnRBdmpZMDRq?=
 =?utf-8?B?QU9SSGgrWjJVeU53SmJaU045eFpOMVRBU1dKbVE4NE9kRWx0TzVaQlZubXVz?=
 =?utf-8?B?bmNlbnhyaWJZOW5WZUZoUVRNaGRVajBvN3Z3K2xKRzdSK3cvU3JXbzR0YVpM?=
 =?utf-8?B?SVgwMFJWblg3bG1FYnhzdzV0emZzSjQ1T0NlNVFYQUlydU9NWU0xeEVhSFI4?=
 =?utf-8?B?MFlsQzB1U292MVdRS0g2MkQ5TmRZQ0padDB2SFlVbHpYYjJoNXg3Smw4OTBL?=
 =?utf-8?B?L1ZoeklLbjZjTjVZcko2RjljK2FwTStwM3UwbjZxd1ZSQk14ZWRsWHJJd3lU?=
 =?utf-8?B?OENOd2JiWDRxQ1Zrd2xFMFdjTnl1SGcrNEFEcDhZenVmUDZjcVBBNWlNWG1z?=
 =?utf-8?B?M1ZaRzA0ZXFIb2tqMUxZYXU5cGMyMCtCUkU3cGgvVDZySWd1Wkp4MGxTaW5s?=
 =?utf-8?B?cHhDZGtmaUY2WHBlRHNYUkVlakFRUXBCMk4rWUh2bHpuMlhTVkdLN1BWZDlj?=
 =?utf-8?B?SFdaUDZXcERwUzFmL1pTcmdqVkIweXRqaGFXR3A5N0lDWG9YUTJKWTRvRkVy?=
 =?utf-8?B?M3JpS0JWVGY1RlZ6ZzFWNGhYY0FMU0JEeGh5OG8yVUtnL2tERTF4ZzBsMmY3?=
 =?utf-8?B?Ly9wQklJc1UrQkJUYS9SalVCVTQralRVVi9LMFQvZEJVdmYxU3orV1NIZER6?=
 =?utf-8?B?bDhNUHBmNXcyWXhzeHlnYlhZZWRKcFZrMjlMMUlpUEREOUdwOWVyZWdMa245?=
 =?utf-8?B?Q2txNENuMXJFZ1BsU1VpaUFnN1BMTU5xQzUyQkYxSkkrOUdqejF6b3RnUk15?=
 =?utf-8?B?cmxDTzNsRkJBeFJQaGRtV1ZoMEE3anJsOTN6Yk9EZVdQMEZVVkJJODJDRWls?=
 =?utf-8?B?UlFYei9MZlpmazdqMUxZRjZRUXFPT21WUjNVTUdadU82cWplN05QaEVyWEUr?=
 =?utf-8?B?NWxqYUFuTVlpRVROS3g3Q2xiVjY4MnF6azhDSEtFM1RGVW5CaytDUG96MTRm?=
 =?utf-8?B?ZzVvUWdTaTZSaWtCVE5CSVEzZFgvSlduWG5idW01VXhZQlhlOXNoQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a9391e-9c7c-4965-9647-08da1155f0c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 07:30:03.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BquwW4oQG67l53Zb9HktRG40IEBqV5VM/svNab0ILhlCtPOHuvR6EQRo1R3fRQpcW7c1ZmHMPNruzqxDL195Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3092
X-OriginatorOrg: citrix.com

On Mon, Mar 28, 2022 at 04:36:22PM -0400, Daniel P. Smith wrote:
> During domain construction under dom0less and hyperlaunch it is necessary to
> allocate at least the event channel for xenstore and potentially the event
> channel for the core console. When dom0less and hyperlaunch are doing their
> construction logic they are executing under the idle domain context. The idle
> domain is not a privileged domain, it is not the target domain, and as a result
> under the current default XSM policy is not allowed to allocate the event
> channel.

I've not been following the discussion around this patch, but I would
assume such privileges are only required for init code when no other
domains are running?

Since it's only at that point where the idle domain context needs to
allocate event channels would it make sense to temporary elevate it's
privileges by setting d->is_privileged while doing the domain creation?

That way we wouldn't need to grant those permissions for the lifetime
of the host when they are only needed for initialization code.

Another option would be switching to the initial vCPU of the domain
being created, but that's likely to be more complex, or even create a
short lived system domain with is_privileged set just for the purpose
of building other domains.

Overall I'm not sure it's worth giving those extra privileges to the
idle domain when they are just need for a known and bounded period of
time.

Thanks, Roger.

