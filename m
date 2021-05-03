Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B437144A
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 13:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121529.229216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldWnK-0003Wb-KG; Mon, 03 May 2021 11:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121529.229216; Mon, 03 May 2021 11:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldWnK-0003WC-H4; Mon, 03 May 2021 11:31:22 +0000
Received: by outflank-mailman (input) for mailman id 121529;
 Mon, 03 May 2021 11:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iacE=J6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldWnJ-0003W7-5M
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 11:31:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c90eec-0b2b-44ca-987d-a3799e44353c;
 Mon, 03 May 2021 11:31:19 +0000 (UTC)
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
X-Inumbo-ID: 80c90eec-0b2b-44ca-987d-a3799e44353c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620041479;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UsI4S1ogwDdtRD4iFtW2CZGXOdt2DdSVZnLUuhx2rk0=;
  b=KazlAJa3bnub6nInT2mHC7B9O8CyfIYJuVyNO4ohhmFNL97RgA1Wu93h
   7waZ1NOIC7hKFPWSUJc5wJq3J9gsumy0ytj9OOnAb7SG/OA5xHZlWJjuB
   MwbK1ElKhGYx0fZSoOjsa4ARJlUbY/Xxs/gUQygHQa/V9HnwN7HqDTrLT
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W838pPB9O1JsB46vbd8xThuA+5JUpSC19dRHcLk5qB7LPllhqzOukpRRoxSx/SnNp6l1lG/fqW
 Jl415aWyaUWfuVNbL0JWc/KSVcP0T6v4d1dckrEtfdvQ7lLc5cmb5aP59xK5ZyhtMx9tMwhcEA
 cTFiKhZemuzv5laYSM9KEhbAIg/ks6p0J6NLHOQGtuGA24sANAjsCuVlAa8yKnZmrHzpyd/DKU
 0c6eL1wl2OIJOc0VUXfZL54zq2Ahv0uiGC94j1dxM5t3Rkab3+0H6Q/fv0+nno9xNdhgblGQhX
 NYw=
X-SBRS: 5.1
X-MesageID: 42937013
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ajVWH6xTgvE9QCUGfjJSKrPxv+4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf8LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7Le0Utde7FutHNidbacQcLbiRXkjWmoBGJzPrBExae1goDSD8n+9Yf2E
 XMjgCR3NTHj9iV0RnZvlWji6h+uNyk8ddbAdzJt859EESRti+NRKBMH4KPpyo0pubH0idbrP
 Dprw07N8p+r1P9F1vF2SfF4AXr3DYw53KK8zbx6hGP0K+JJkNJN+N7iY1UaRff4UY71esMq5
 5j5G6Fq4FRSSrJgSWV3am4azhRikG2rXA++NRj9kB3bI12Us43kaUvuGlREJsGARvg7pEmHO
 REHKjnlYhrWGLfQHbDsmZ1xtuwGlw1AxedW0AH/veYyj5MgRlCvgcl7f1auk1F2IM2SpFC6e
 iBGqN0lItWRstTSa5mHu8OTea+F2Sle2OCDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJxrwcJCgLTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSWopj9Crr5wkc4zmcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQlc08X36Iv8LXOqznvuHWa5/oVfjQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oWkGXx+M0LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 93ILbtlLKHtXC7lFy4q1lBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR00GaYIAR8C+fbCh
 RWqVgy2a/fFe3f+QkST/acdk6KhXoao3yHC70GnLeY2MvjcpQkSrA8WKJwEg3PPwdvmRljrV
 pCbANsfD6dKhrezYGeyLAEDuDWcNdxxC2xJ9RPlH7ZvUKA4f00SmAjRD6oW86PiQMITz5Z72
 cBtJM3sf6lo3KCOGE/iOM3PBlpZH6MCLxLNgiDeb5Zg6vmYg12UGeMiwGLkh1bQBuYy2wiwk
 jaaQGEc/DCBVRQ/kpV1avn63tYXGSQdUAYUAEwjaRNUUD9/lpj2+6CYaS+l1aLYlwZ2+cHLX
 Xuej0JOD5jwNixyT+YkDuPDm8d250rJ+DRZY5TNY376zeIEsmlhKsGF/hb8NJZL9joqPYMSv
 /aVAmPLj/0YtlZrTC9lzIAAm1Tp3Ylm/+zh0Ggw2i8wXIlAf3dZH5hXKoWJtmA727iA9aEua
 8J+e4djK+VCCHWbNXD9IT8KxhkATnXqXStT+4ppYtP1JhC/IdbLt3+a3/wyHpD3B8CN8/6m0
 MVfbRj7Nn6S/pSVv1XXxgcw0Egm9uOJnY6qwDaAucxelc2kn/QVun5lIbgmP4KAkebohH3Nk
 Ta2ypB/+3dVy/r789RN4sAZUBXYlM78nJs4aercJDREhyjc6Vm8EChOnGwNJ9bR67tI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKfevyJaTj8UNJgwpidIlSDgqyj/c61gnPWcFKAGjslrL
 wAU1cRYMRFgiQll6st3EGJO/XKnn4=
X-IronPort-AV: E=Sophos;i="5.82,268,1613451600"; 
   d="scan'208";a="42937013"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWCbPfCJFVRN4EqOUxvAQgHhDBzqYVz4MgcZYPvtXdpmwVvbU2FFNSA4aEzB++iEG8B8jX4iVCq7LAcSKI9ff8dJQmwRMguV20Pr1e1tBLS8ub9saAN/lh41bF2aIsLGUeaq3iroU+OTZtzR3uRX0lV8/dn094VB9PJOf8TyU88XqlOw0K10BV4UXVnkOEdre8pSdA4xPeCl0GOQ3OUX+rSa9I+YJkTFV35bkBXooEeuRXCbtbcZ3QYpHaZDeuvEOMcbTba9671jF8Rze4v7LprSnRIH49Z0hq3213I/2TRTgtyWmz4fxfzn+UiPCm8ty1Q0oZnj/ejrgUoiqF0e1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWOmhvm9C4pHAby/0NnjW/zJa6dHfClEjD+lscXW5ac=;
 b=I8FTvzlHFAwS1j7Hs+kzqZD34o6aDeLvtjFcfmaCxh+i6PHjl9Wy7jQdcQkDIN6G9SuxX1xK2WFC2UaRNl/gUaIdX8OBVlM9nKDyJ9NHL9ChSj63olvZDXU6S2B4XxKy2cRSFD9F6Rq+GDGkNUdaS1pjQO6sro964ti/43cd9JznX5Lc9NygBc0GEQlD3I6QV63ARIwc0emaFElgBTW7bY8f+3KbYcMnEqAExcFrUrc7YeBrgHYdOVZTbNZYByESKZEcdHxXI5RM+helpx7vG1SD9D1kDgR696AYsX51qqWOOqfaXmKq+pIa7xn/M1dcceBmd+YPVOcOBYf0kdZc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWOmhvm9C4pHAby/0NnjW/zJa6dHfClEjD+lscXW5ac=;
 b=ajSVQBTi8YVYDAxhjBYGWcvfyTwY6ATzKrzoH4MnIgCPezvwN0DGyS7JLyEfbdNjG3kIlZIA/gKrwPH/rzA/pXbQycDSGrLdWDTObtGdCB2ekXU8IeQIt7zE6deHQIwnnVVBXH1AIaGxOuMR+3bI4FFVALQeQimnKfg88XaE45o=
Date: Mon, 3 May 2021 13:31:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 01/22] mm: introduce xvmalloc() et al and use for
 grant table allocations
Message-ID: <YI/e9wyOpsVDkFQi@Air-de-Roger>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <69778de6-3b94-64d1-99d9-1a0fcfa503fd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69778de6-3b94-64d1-99d9-1a0fcfa503fd@suse.com>
X-ClientProxiedBy: MR2P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e8e39f-3a06-4baf-5317-08d90e26f310
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60478818C743F650FCB532938F5B9@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bovDp/t0TPTK7fulk/AYpS0aw9zs997a47Tnto5QQ32rqRISxdmAxhv4hEGjhdRvWnUR21tobPlTj6bmIAemKu67ctlC+CV8E50EaadNrGpH7e72m+PUi0jdWzjVej90ew6EAxmHatMWNSqiPlJjgVDCVLJsVCUO5GU5jFpeQnDoEVL8CGpHxVRGeZ0KpcoKTJr3ecXolx2ZjZKQLknviGEPmpzbUswMjGnU1u4gI1/F5lxW/pZt8C/Kbi+T4+t3FRKjX31Xy2xHL3LkSzL0nnOZjJP8CJWW9rdpGp+2Kyz4+RESgsArp02VV4yF1Av8lPJHjhEtRl4Dj5EVODAEFrZO/RKF3ocyQYDuMOHOdDsyAlbr6DlFtOPBPAQZIjaGO+JHX81EEyviWXltwmZ92mSOssOQ8XuANmRwRY9JK2ZpGGJ96rFtb3Z2/+7aMZTd107MNixkOrcYfXxu3/GWoHL7g10ZES9negZAVwuHVXbBz6QUc6ijn5+va1a2YbYbzUqczu7ABUEnmb0LkSsCQiiENu07tgdlV/IMn8Qa7Suorx28Tj4Tzc07GJgemvrkXFDTA4lPZHasWGH0GTMCgqgIlrMGH0ogEegpIeUt1Rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(2906002)(956004)(6666004)(38100700002)(6496006)(478600001)(6916009)(85182001)(33716001)(8676002)(54906003)(83380400001)(316002)(5660300002)(9686003)(4326008)(66556008)(86362001)(6486002)(26005)(8936002)(66946007)(16526019)(186003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QktFdytHOG9saHR5NGRkRi81cDgrMlJiUG9VRTRNVmwzc09NTlB3RlVUQjBJ?=
 =?utf-8?B?a3VtN3BRNFhnWWRpeHJrRktJNW5sRWl0NFp5TmNSWGMveldJc1FKc3FhcUls?=
 =?utf-8?B?ZmRiZlZleGtrZVJ2OWtsZklaNWZIRXhxNFdVNVkxSENGL0dhT21DaXN2bWdZ?=
 =?utf-8?B?bEpxVHAzY2sxL09kL0tEWTZWZzV6N0JXYW11NTIvdWM1dHYrRHd2U0EzaFNC?=
 =?utf-8?B?eVlZdld0alYvWGdMYVlvTE1kL05RNXlsVE5zbHcwT1Vqb3FTL05Kc29zeVNk?=
 =?utf-8?B?TVJhZ1kvaDJ6RWgzdU5ERGJpOHhjeU1OMDVnb2w1Unpic083aGkzNnZxcVZz?=
 =?utf-8?B?eWxYRGRqUmsvQmxtdVBkbVNEQnEvdTA4cTd1QzZSS0NHbEI4eW1DRWRlUTBD?=
 =?utf-8?B?OGo0L08zVUxrQmpQMnNKV2M4SmpwZytvYTdHcUVmdGMydmNQR3Eva1E5UFN4?=
 =?utf-8?B?bnNjWk5QcjU1RmdYNEppMmdpN0Vya1JiMTNRK0tJdjd6TENJNmtkc3Z2TTBZ?=
 =?utf-8?B?NjhWMjNMN0pGTTZzV0NHa3ZHRm5WT2wyNDRIUHFwK2hoMS9TR2o5dFpVbmhX?=
 =?utf-8?B?cnZiSDcveGZEdmNiTkJLcXgySEdOVUh3cWR0cHdKZEFmU3gwWXdXOXcxYVEx?=
 =?utf-8?B?ZGF0MkhrdGJGM2p5RW1FUnVHRjZBNlBsRW9VNjdBL3lsV3QyQTBkMHA5WVFP?=
 =?utf-8?B?S3NpTzhzMmp1dDZGUHhDQzBZSVFyV3ZNZEtwTmZ3cGhNWkplVktXWERVOHFN?=
 =?utf-8?B?YWxIbEJXRG9RWVFBUFlOYzNEajFSdnY4aE1HN2FtS1VRek9idlJrdDJ4K244?=
 =?utf-8?B?TE01UXNhME1wOGt5eEhaZW1ud3hMNUNzRXJwbVYwTlF3b0xyZTM0ZGFXM05M?=
 =?utf-8?B?aFZlSzVubXVXMEMyVFVHcHRFSG13ZFg4M2QrbUNCbG1PNWVoV0hYYnZKM2li?=
 =?utf-8?B?Q2xXcFovYmUwNmpiZWFRT0R5cjBydzMwaVRDTDFibXRzTXhCZ3dsbXZhSlNu?=
 =?utf-8?B?UDJjMU0yQW1HRThzdmo0VHFuZFFaRHVveXIwWWxHOEVNYkI1Vjg5OC9ibDY1?=
 =?utf-8?B?c0VkY1BBWXFmRGVnME5acGdJOXVFTXlqc05xNENJelRYSlM5Z2U0VnRuYUpx?=
 =?utf-8?B?dUphTEIvdlBQeEVBYVVycE5sWVFhVDRkQkpVLzFXUEh4bVdHTmxDSFR4RVRR?=
 =?utf-8?B?a0Zmc2tzVW1rcmZRVXJOUXpwMFNyajAzQkptMjJDcUY4dW5tRHVXRm5Yc3VV?=
 =?utf-8?B?aVpVVEZOazAwYXp3d1ZmRWx5ZGZhWWtQTTk0SmlqUVNaSVU5L3kzcjlKczN5?=
 =?utf-8?B?cE5WL3dJZ0NWK3NsTE9IY3pDQkJudUlkOUQyeGlEeml2WERiNWZkdVRhQTdO?=
 =?utf-8?B?YXB3Z3MycWVLaGRUYmZSdnRMWnhpb2tNK0k2Zi9yTkV2OElaMzdsNGVYNndT?=
 =?utf-8?B?R29XcVVQSXZyWG00bEk3WEk3aTg3UFhpQ3pqTm8vbjVUTlVxUFhYaVdnWWdW?=
 =?utf-8?B?NkJTam1GMUwyMzJDeUNjTEVKd2xQNnFWUG8rZ2wyNm5TZXZxdTFIcWRnenB6?=
 =?utf-8?B?R0FDTmRkSVZQbUNCaEdoNkQyNEJhUTJzUXFwdW8xZkNnZmpzYVJUVktHSEo3?=
 =?utf-8?B?Vk9ZWTQ2cXQyWGJQK24rbS9INkhWSGdPZG15SkJMV01kOXEzcmVKRVl4WkVW?=
 =?utf-8?B?L0ZVSWtiMGEzRXl6MFhPWTdtUUFsRVFLSGVndm1jQVQ4Wk5kbnBHMkRWeFVV?=
 =?utf-8?Q?m/yN6gQLasQ4OQHgqvo1fj+yAaee5F+t7V1G3VZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e8e39f-3a06-4baf-5317-08d90e26f310
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:31:10.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BUxoc/0H9/dmJPBQz2jFfNqf/3SgGBXypdgh8sc4/QfoYiUQEBpUIEvSUNF8MoFsoucmgF5KxkWSeu1CqD0gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 04:43:39PM +0200, Jan Beulich wrote:
> All of the array allocations in grant_table_init() can exceed a page's
> worth of memory, which xmalloc()-based interfaces aren't really suitable
> for after boot. We also don't need any of these allocations to be
> physically contiguous.. Introduce interfaces dynamically switching
> between xmalloc() et al and vmalloc() et al, based on requested size,
> and use them instead.
> 
> All the wrappers in the new header get cloned mostly verbatim from
> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
> for sizes and to unsigned int for alignments.

We seem to be growing a non-trivial amount of memory allocation
families of functions: xmalloc, vmalloc and now xvmalloc.

I think from a consumer PoV it would make sense to only have two of
those: one for allocations that require to be physically contiguous,
and one for allocation that don't require it.

Even then, requesting for physically contiguous allocations could be
done by passing a flag to the same interface that's used for
non-contiguous allocations.

Maybe another option would be to expand the existing
v{malloc,realloc,...} set of functions to have your proposed behaviour
for xv{malloc,realloc,...}?

> --- /dev/null
> +++ b/xen/include/xen/xvmalloc.h
> @@ -0,0 +1,73 @@
> +
> +#ifndef __XVMALLOC_H__
> +#define __XVMALLOC_H__
> +
> +#include <xen/cache.h>
> +#include <xen/types.h>
> +
> +/*
> + * Xen malloc/free-style interface for allocations possibly exceeding a page's
> + * worth of memory, as long as there's no need to have physically contiguous
> + * memory allocated.  These should be used in preference to xmalloc() et al
> + * whenever the size is not known to be constrained to at most a single page.

Even when it's know that size <= PAGE_SIZE this helpers are
appropriate as they would end up using xmalloc, so I think it's fine to
recommend them universally as long as there's no need to alloc
physically contiguous memory?

Granted there's a bit more overhead from the logic to decide between
using xmalloc or vmalloc &c, but that's IMO not that big of a deal in
order to not recommend this interface globally for non-contiguous
alloc.

> + */
> +
> +/* Allocate space for typed object. */
> +#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), __alignof__(_type)))
> +#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), __alignof__(_type)))
> +
> +/* Allocate space for array of typed objects. */
> +#define xvmalloc_array(_type, _num) \
> +    ((_type *)_xvmalloc_array(sizeof(_type), __alignof__(_type), _num))
> +#define xvzalloc_array(_type, _num) \
> +    ((_type *)_xvzalloc_array(sizeof(_type), __alignof__(_type), _num))
> +
> +/* Allocate space for a structure with a flexible array of typed objects. */
> +#define xvzalloc_flex_struct(type, field, nr) \
> +    ((type *)_xvzalloc(offsetof(type, field[nr]), __alignof__(type)))
> +
> +#define xvmalloc_flex_struct(type, field, nr) \
> +    ((type *)_xvmalloc(offsetof(type, field[nr]), __alignof__(type)))
> +
> +/* Re-allocate space for a structure with a flexible array of typed objects. */
> +#define xvrealloc_flex_struct(ptr, field, nr)                          \
> +    ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
> +                             __alignof__(typeof(*(ptr)))))
> +
> +/* Allocate untyped storage. */
> +#define xvmalloc_bytes(_bytes) _xvmalloc(_bytes, SMP_CACHE_BYTES)
> +#define xvzalloc_bytes(_bytes) _xvzalloc(_bytes, SMP_CACHE_BYTES)

I see xmalloc does the same, wouldn't it be enough to align to a lower
value? Seems quite wasteful to align to 128 on x86 by default?

> +
> +/* Free any of the above. */
> +extern void xvfree(void *);
> +
> +/* Free an allocation, and zero the pointer to it. */
> +#define XVFREE(p) do { \
> +    xvfree(p);         \
> +    (p) = NULL;        \
> +} while ( false )
> +
> +/* Underlying functions */
> +extern void *_xvmalloc(size_t size, unsigned int align);
> +extern void *_xvzalloc(size_t size, unsigned int align);
> +extern void *_xvrealloc(void *ptr, size_t size, unsigned int align);

Nit: I would drop the 'extern' keyword from the function prototypes.

Thanks, Roger.

