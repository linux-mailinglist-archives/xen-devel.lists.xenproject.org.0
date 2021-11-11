Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003F44D7D1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 15:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224771.388261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlAj5-0006fM-3f; Thu, 11 Nov 2021 14:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224771.388261; Thu, 11 Nov 2021 14:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlAj5-0006bw-0B; Thu, 11 Nov 2021 14:06:51 +0000
Received: by outflank-mailman (input) for mailman id 224771;
 Thu, 11 Nov 2021 14:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xatb=P6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlAj3-0006bq-7T
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 14:06:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a327a0e-42f8-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 15:06:46 +0100 (CET)
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
X-Inumbo-ID: 9a327a0e-42f8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636639607;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/tqGKANf6fxMPOumI2viwDFUzTOi9O4h62AY9DigH28=;
  b=NB2r7GYDvK0lae+g0Svfiec88tBX4YIi6zUEcysaW7fLzXflPir58iiJ
   iENzTzXDZMnl6kqFft7JyUimzHRguShzFMfrzhmuzpnyUAeoFwT5JjLK7
   uyppNXqodY6X/MntOOYKHtEsHgj76DWMac1R2PMkUHJD4/YYukSV5uGn2
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /orqQY6Hj7q/LRy/+8Xx69at+lsgmO5ufC8L1bG5aav1KUlJOfeWc0icvALLzayqQc6jKumx+u
 7Sksc9VgeCyhp5cWF44pBHP7nnmzDHf1NlvtDVqiDeLwrL7mV1mfOpMyPWtCzKgyKIieRl6c3t
 NusuB1xjoyVs1BJI3TOAh5LfTjUMThkvGa9u55rjXddXYfQ1U3Qcgf1pxp8kDovAiyUsulVSbu
 gWN4vrk3EKaXQATcbygVzNgu48pybAVsWeQ0V+BtTXBGmDfNs6xDcw+/6wYwN+rKKA87jSPJ4P
 F8MvRTRxISNDudCbUkwDd2pp
X-SBRS: 5.1
X-MesageID: 57608388
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:frZX9anHYuPA0nKTP87J0rbo5gwVIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOW2yBaP/bZWT0KthwYYi2oU8F65eDndRgS1Nkri1gQSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29cx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PtGmZPuVlwkB7LzvrkZeQZiTiUmH6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpv2JgeRqaOD
 yYfQXlFY1f7b14MAFxUT58zhNvzil7YYyIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0z4HRMyJNGZ0SCC8H+nmqnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ8+CAjsKwz/0yDVcTmUluzp3vslhcZUIsOO/Yg4w/LzKfIiy6GAkAUQzgHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxucMgQac3BZaBYbci1Y5/P8mtw31jDAG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAsACDtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzxpBZPnqgKuVmSwXuF1O5dKFcFh
 2eJ6WtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonowOBDBgDCwzxdz+U3aB
 Xt9WZ/9ZZr9If43pAdaus9HieN7rszA7T+7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4Aal2CCcd1zVMisLhXGGdc8XkE/X9BcEZD6A83MifZyu/OEYcZ42dqMg7+tt0bh/S
 PxtRilKKq0QE1wrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:WbIRiaEU08bj/JJepLqFDpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkgdCVbKXlvgxQpGlRGt9dBmxCe3+m+yNNNW577c1TLu
 vi2iMLnUvrRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIC/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF5nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSgGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KAoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFoLA
 BXNrCe2B9qSyLZU5iA1VMfheBEH05DUStue3Jy+vB8iFNt7TREJ0hx/r1oop5PzuN7d3B+3Z
 W3Dk1frsA4ciYnV9MPOA4/e7rDNoXse2OFDIvAGyWtKEk4U0i936Ifpo9Fot2XRA==
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57608388"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzxMaBaksybSSn7Hy86XGWNCpzt8yIheKmLi9pmIZgWDntOUG7Fmq9E2bHMGLfcVybcDkMxVKEGuyKmx6vdZZ0EjIbv1cqbvhkSn3unFBQbMiu8Df4X96jaFSZ3Ucw6vr+N4jmg97J1J6ZyonniiqHS4kJrLsch9kPKZmrVfJI9c80glWu5x9OcgcDBfc8MtBuYptFRaGrhlyPVypXlg69neJFQovPtzVpKQQ/nef8CMf5SXfpHN1kxawmTVgppsgNb+jqP0lYB72gXD7F7Osk4aLx7b0geNsfhuI6XcvWPYr0BjAqYIP0daWANidMe7QqxoyK58Pvtx7nCdYydHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaubetROC0v5/Oqbf0fLaoRM/IibhDZnWZFGvrlmQ0E=;
 b=TmgXiF7w8/U1BiR6Uq7xLY1G6ra+VRbznmlHKgTKSaDfNVF2SmCm1MTy7sixQ5rzi5Wt/O/42/GZnYbDTP8k63nMcV8eGT0pka1GicJ/rXNtfLmQdinvHY19siI5KYIRiaHTxGgjsKti5taZVGfNX8XMp2mntvyXCn+UyxNr2c6Jyv6ivllM+lLnM9ho04137LBR1ekZFkVBNsmjugRY24g63ER0P0NagM9UFryZ7gnweVT3oBR+Lb8I/7vCLR5DIqz2IBB7Dizhu6YugRXW4E62+m5/kBED3Tb/YP/cCyqzwYADUfEXWRp3mUIwVPB7oUGwG8H1/KQzxaVOFxnrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaubetROC0v5/Oqbf0fLaoRM/IibhDZnWZFGvrlmQ0E=;
 b=sX1yYRXy9QnT2+h+YBChedeh/dE/kSYhAdl8KUF3rYttkqWHWjus74EznntTioDDq76ONDkQnFqguTnXxLQPYEckyAvWhknYUTnxSZI6Wj/k4q9eJoa+riAYUDOUrvwi70SjuVGzADEJM0cUfUAWx9JfXn4cjex7rBzcU15Cesg=
Date: Thu, 11 Nov 2021 15:04:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <amc96@srcf.net>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies
 max leaves
Message-ID: <YY0i48LlRVizS8LQ@Air-de-Roger>
References: <20211110174059.64633-1-roger.pau@citrix.com>
 <519775a1-ba90-c5c5-82c1-abcd8c4ebb01@srcf.net>
 <9cb7444f-b1ab-524d-f94a-ede990b64f9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9cb7444f-b1ab-524d-f94a-ede990b64f9f@suse.com>
X-ClientProxiedBy: MRXP264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9bcda8c-5973-4afe-b86a-08d9a51c2bcb
X-MS-TrafficTypeDiagnostic: DM5PR03MB3289:
X-Microsoft-Antispam-PRVS: <DM5PR03MB328959FA0BCBE50FEFB79AA18F949@DM5PR03MB3289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fPQn6/tnwLWtO0o4BkHGAsetmxHTd/rEJGA6CUfdLzzaURUx+yb/gSA0xT3XLboUukxP+uH3oujj84WZzVfspzk0ZLmdmHtzZBfsZmxKQoVCcAqoaYyNupaTvW6ouNCYNJsoRDTphkpHCi2MQOcAMjPjZlLiS11QDfZL6BEHiL27Ap+rkidH8mLlO/PehOS1btwjLLACndUcQiMhi7lBlz8lTXau2y7j7JuIORF5Gk2QCmBVvcalNk1JhO5u8oADIKLjzHXnSaKpcbTsgAaTP85MYkNCPP73cG6xNoTsafxQrGIAW+sb9PGLbJr3xna1S5oIV7Ks82xZg8/unWX8phrSKzTtU5t8Y2xAE8w6MjYtbLzUk5851TKd0JYH4QA0F2xUk/2jJfT8p/E7u1fSrQyfFV2+ayr1kT0eQ4DmxNZznfTj+7tK/215g7eVNo+gMKpYYVt2tfr5492BvTP52/XD36v327LlMzx7+56MDprF6lNDV+l4ja0Frw2QyUr9dPXflefPI17BmUhwKw28YY94mbRj6h1NfLuyslNP236MnzHVLE7AF1e/qvCsOzsrBA6G1w/TYSi/yJDjkXi6U6KLnUkIBnqhm2c0pxgOEc3glNkW40Dg32aOteIly+hd6DyYvsx7LtLe50cWrHVPNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(38100700002)(33716001)(4326008)(26005)(8936002)(66946007)(956004)(9686003)(2906002)(82960400001)(54906003)(6916009)(5660300002)(66556008)(6486002)(6666004)(508600001)(8676002)(85182001)(83380400001)(186003)(6496006)(316002)(66476007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRFeXdiSGlLTXFIcEhGL0VaR2Z3eDZ3L0huWHVYdnpydVhWa1B4K3dIOTBG?=
 =?utf-8?B?YVBCUkZuTE9pbTd0SGNDRXdIN3VMeVEyOGZtYmFqaW45ZTBJZWJ6MkZOaURT?=
 =?utf-8?B?V2l2WHFxaFMyZitnN3BQV2dHN3crT0M5TWlFNVZhWjJtNjhIVkRpbzFZUnJS?=
 =?utf-8?B?amNIdGlLQWxMQmJ0MkhyUmRxeUM1ek93dWZqMG8rYU1NclFCRm11anM2SFJq?=
 =?utf-8?B?Z21ON2E0NTZQRlBUTW5QWFAvMlJDYkVLbmovWXVhTzBlcnNnMGhDa2lLYkpp?=
 =?utf-8?B?R0hCc2QxL2VucmpWaDJWMW81K3BmeDZOUUY0RGoweVFycWoyMDV6cSs0Tm9S?=
 =?utf-8?B?c2w0WHBGK0U5RG42MTRyUlFVM2FZUThObUx2dW9TNkYzbXNWRHlsTVV2RVZa?=
 =?utf-8?B?VWJ2RzZMQ1ZPYUJkZ1R2UXVtemlXMzgwUzdNVWh5dGJ2QU5NVFZJV2NWK3Rw?=
 =?utf-8?B?UEpkYXFCdGljS21WSXJoUW5wRCsrbFZwcnJnRmQ3NndzMHV5WW8zQTVLOHA4?=
 =?utf-8?B?UVlTcmFqUHMrZitVMHJCNzBUb1RObms2OTU3ci9heVd1TU93ODFUT3FnbkJ5?=
 =?utf-8?B?WE5Pak1DUXRmUnU2OWZGU1pWdjMyWHovSEYwR010NE1XcFZmdnZOSTJzdkds?=
 =?utf-8?B?TGFXTTB5UmJLMmMzWFJ6OE9FbXR6bVNUSjMwSFR0TStZblZtaHpycWI2TUk1?=
 =?utf-8?B?TDh6Ti9NV0QySWp1TE5XVWZoc09tQ1ZwQ0VqaHRBREJGQm9DQnluWjBVbEVD?=
 =?utf-8?B?aUR4V1h0RjBkeFltdC9iRGx3UGhqeWZhZngvL3pEQWFUL1daY2tuV1BsbzJi?=
 =?utf-8?B?dGxKNXRUMnBKQWt2Smd6cnA2M2syUWFtc09rSlhwOGV5ZUxGREZuSHV2QUZX?=
 =?utf-8?B?NGNIdG9xbHo4WGtmQzNYOVpUMmsyaExyZngxYzlWbktreGlKaktYaVVlVXpC?=
 =?utf-8?B?Z0lvODRTOUVkbkMwRG91blZGaUw2OHVUbURZNkxEM1JTR01ZdUd5MFRRY1dO?=
 =?utf-8?B?VVZ6WXBrVmUzek40VFlsV0E2MkxyaEVYMkQwQlNqMG45TlNlQm9oekR3T2pX?=
 =?utf-8?B?c3BBYmtBVE05bXFmZDdjMWJyVTFmY2NxeEVSU0xiYy9KYXBNakdqSWg0ZVVL?=
 =?utf-8?B?dXZRMFRHMUFscFBvZkd5MFluRkJqV3JqQVNRUWFZV0RKZUE5cElwdi96U3RG?=
 =?utf-8?B?d1U1alBjQUc5Ny9JTU5YZjl1ZnA0R2tYcGVhUjNxQkFRK0FLdjlFY2JwUmVz?=
 =?utf-8?B?WTY0QnRLYk5sRk5FejgrVTg3YnBwNDlTdjhrZ1VYZS83K0MrSFY0b0Exazdj?=
 =?utf-8?B?b3UzYVdyc211WTJzNXBUc1YwaHpPLzkrbmR0UnVUOWsrelk4TVJqN214KzMz?=
 =?utf-8?B?NjF2VTdaVW9HcTl1emVLRVJ1T0pRM3I5WThCZnZ0NitlaSsreDM3TmN6Y1ky?=
 =?utf-8?B?VlRMbG5uOXFQNWtUMlp0aXNmbFhzQUFWM1ZMb081QWplTDc3SFQ2OStJQkVx?=
 =?utf-8?B?dWtBc1Z5b1NMbEJvNVZXcnY4cG1wTXJDNmxjNmg4VE10Wk1mYmc1WUcxUFlV?=
 =?utf-8?B?TGZDQWxaUVRYM3RxM0gzS3lIVFpreTNKaExDZ1c1Uk1GMEVGV3JrT0N0OTlY?=
 =?utf-8?B?aTBXbjA3WjZxM1dSNWxtZExOMG9DbEZ4SllaV1lYaWlHK1dINTBNb3R3ZzRh?=
 =?utf-8?B?VVhuUWxxcEl5OEVoTzlZdnlNbE02N0gzQnNrM3Z0ZDZMT29RZ2VnaU40VlZ3?=
 =?utf-8?B?Ky9hbHk3bi9Fb3BVMHRhb0lnVDI3VGdVUEN2QWk3MlJ4Q1ErNzVINUVRZnhS?=
 =?utf-8?B?dHJuaG5aUlJtQVh5ak5KOHRnd1R4QkoxdFYweXRycU84dmxEUmdqbjU3SDBu?=
 =?utf-8?B?S0lMNmpkZmdnR3Z5bUpvTGhUY3pqUzRscTJZbUxha0FPTTdFUGhpMklPSHB5?=
 =?utf-8?B?ZCtodTNQZVZlcmJzVHoyMGtqdkJUSDFGek0xRVFCWkhXdG1aV3BwcVZXTm5K?=
 =?utf-8?B?Q0VHM0pSWjZYNzJTVGVMUWxWTllOOGwzNFZuVEVRYytheUhIRGZvL0NucVJ0?=
 =?utf-8?B?SFhvRUZGRmdRcWhCY2QxWk1SOWUwV1d3WkpOMGg0RW5qNUJLT3NNaFFhOHJC?=
 =?utf-8?B?bXFGWnlOYWxLSmp6UVJzakoxRThUUFVUUjhHdjlFWEwxbEltNVZmOGVkc1VK?=
 =?utf-8?Q?+To9JYY+IXsXgzTV+Jb0r7A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bcda8c-5973-4afe-b86a-08d9a51c2bcb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 14:04:26.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbn0cTCsWBzID+KcqGFwsdmWzRhH2dRLd7OH2zOmBvhs/bP9JlE2B2Zqk7N5SDt3FUQRgi4xpuq1B4KN/NEHrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3289
X-OriginatorOrg: citrix.com

On Thu, Nov 11, 2021 at 10:26:29AM +0100, Jan Beulich wrote:
> On 10.11.2021 19:17, Andrew Cooper wrote:
> > On 10/11/2021 17:40, Roger Pau Monne wrote:
> >> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> >> index 198892ebdf..3ffd5f683b 100644
> >> --- a/tools/libs/guest/xg_cpuid_x86.c
> >> +++ b/tools/libs/guest/xg_cpuid_x86.c
> >> @@ -638,6 +638,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
> >>          }
> >>      }
> >>  
> >> +    /*
> >> +     * Do not try to shrink the policy if restoring, as that could cause
> >> +     * guest visible changes in the maximum leaf fields.
> >> +     */
> >> +    if ( !restore )
> >> +        x86_cpuid_policy_shrink_max_leaves(p);
> > 
> > Nothing in xc_cpuid_apply_policy() changes any of the max leaves, so
> > this is dead logic.
> 
> I guess you mean nothing there does anything which would result in
> shrinking of the max leaves by calling this function? Yet even if
> so, isn't the call here to take care of any earlier changes which
> might have resulted in fully blank tail leaves?

AFAICT the featureset (optionally) passed in as a parameter could
result in certain leaves being zeroed and thus allow for the max leaf
to shrink.

So while xc_cpuid_apply_policy doesn't change the max leaves fields,
it can potentially zero certain leaves allowing to shrink the reported
max leaf.

Thanks, Roger.

