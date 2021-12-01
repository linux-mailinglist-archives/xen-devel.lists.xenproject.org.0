Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878AA464A5D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235700.408852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLcu-0003jc-B8; Wed, 01 Dec 2021 09:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235700.408852; Wed, 01 Dec 2021 09:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLcu-0003hy-6m; Wed, 01 Dec 2021 09:10:08 +0000
Received: by outflank-mailman (input) for mailman id 235700;
 Wed, 01 Dec 2021 09:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVdy=QS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1msLcs-0003d2-RJ
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:10:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d21762ac-5285-11ec-b944-1df2895da90e;
 Wed, 01 Dec 2021 10:05:39 +0100 (CET)
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
X-Inumbo-ID: d21762ac-5285-11ec-b944-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638349782;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=N2dgs7dYT2cOgcBe2yWO6YyWzLCIKGSwRM9v33GX36o=;
  b=DRB9DNJ8jyM44kfnZl2tV29PYTriRyN4ZLH+4hFO3ptASyfOULXl3yd/
   b5H05Qcoc8YTjPSAjZcP/+9bvHnRfXQfnenVel9dG6C+X8eDGSCGHoMzN
   66bU8ZeUwa3NtSzITjQLOAVUWoTy/eqaML7pSBOAl70W3Qq8Nm2OWdkCh
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 588czbPMfHeXUR3aFb+A+VnhrxgQqwG+51DONnXkCu4dRV1PHs8cNDzq15KtfVHqH7twcLlk1A
 FuVOQURbS/oW21jenj1bITInSnQinHrRtSmsWc3zFupYUfh8wTeD9jhLJhrLbJCEyU+pFPvmbl
 TsbyK0bTHKbWT2UA71ZMFJKoK7Ode+8Qwfu5bW9Ug4/YAA/xDAhQa5154HzKunUi3srJP3fL06
 xVB+qj/i9NQxIfsbkn8t9AVomVDbxSFRk/JcyriLokrr4DMX5iihsAsErbHLuWXyYT823e8wZ3
 w29pmOdasPDYouB91BEm6Ejs
X-SBRS: 5.1
X-MesageID: 58503837
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1mpa86jwduLIa8Fxod7CPM5nX161uRcKZh0ujC45NGQN5FlHY01je
 htvUTqDa/aJYGT9fIt+aY6/o09U78eBzN5iGlZu/CEyRCsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1fhYe1FSI1NZT9p8UwcTBdKgdgZqd/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1p0WRqaFO
 KL1bxJQPDnwfhBuMG0HUpI3pteJpyLlSzNH/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0SepLFrEf9Aq0+5X1ziSwA1EiUGVLUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 yNsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ldB04bZ5UJGO0P
 Sc/XD+9ArcIZxNGioctPuqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WaQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:1hJlwqlFxGI1gKJT1gWCfnL3W1PpDfIS3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tQ++xoVJPhfZq+z/9ICOsqTNGftWDd0QPDQe1fBOPZskTd8kbFh4tgPM
 lbAstD4fTLfCBHZZmQ2mKF+qwbruVvWprY/ts2tE0DcT1X
X-IronPort-AV: E=Sophos;i="5.87,278,1631592000"; 
   d="scan'208";a="58503837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkxvWXbMlRyvQjaOdjQj7ZM4XpWX6e5J89WKTXuhKnMdNKsH8zSBw5yQ7Yge+z42b/NH2QE0cJTDDA7KQDPPqqhZWC3o8/kMWHHjJJQEntJmKPSiEO2Q9XDbcWR5eK33jtXsT9+veDVZZP6+ZhuhtupN+/IDzqEqVO1Y3P8jITZxgssKrkOIqc2AEvSJAQ4r2igvV6yNMP9onmuiAum/2gZwqx9nSAyHmU4JMqYOg8twBVYCimc9wCb20Q/53XmRZ8ZIhIBO1YfpEIkXqIV9H/wk5zXhFN+jsqkRvjkEEJmZ3qrDS1ts7t4h9a4KTL8vMWtNY6c2YWikJfrcto2BOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOfMdYOKQ0M8msuLutMG3uTpzbbxjTYNjnsruJDXtaw=;
 b=jRJJVMBkH1QGL2U6j84YkrVfGl3BoxxmLymEOQswMAjx/qMkuucDreLLhrVnfdnqVLnPVq99Y8oh4DDvCi9m7xwDYskCEEtLdMnImTuxT7RNIw5Gni687p5k3BUGi8BNwOfy/4RoQ8SYeOdv10ObttkjSj9sxrV4vywyqN1V38DqUDDj2WY74dcKd+95D+x7wmw+F2mFddzqZKJjGMa3jqV8TVhM5ULekSNwoW+kSR/h4qWZpUzV4+1mlLCcBpyEIFbgPRGcwai1Au3y9krfLu9pW0N5U9+V0Mg0WKRmOAKVFZNLorEKCtR7GzPYrCWYHqEl9ifL6H4pkZRR3OnpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOfMdYOKQ0M8msuLutMG3uTpzbbxjTYNjnsruJDXtaw=;
 b=tOUHmGF2Fo1J/GIvj++Qcq1WgWGRymLK+WWTgiQXuKpBBCwabR4gIcpadSnDjTYzMFqurs6pK9GZ9ijJThq0hyXYBA3N1r1JXCjpPwUdkRtiZvtUDGwn/lOaeL6S5kGbEM/AKJ0dixjw2q7jkz1ts5bQufw/xdDfJMtklY7dZWo=
Date: Wed, 1 Dec 2021 10:09:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <Yac7uLaQ1+YdCqtW@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3014f5cc-1ccf-4ee0-b981-08d9b4aa4077
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-Microsoft-Antispam-PRVS: <DM4PR03MB6047F4A209507D98C9ED22408F689@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2yXDEWta6MgXfyz0el0aLk/o+dPI8DKPz5VmFGKDwhJZ1zI7MBKeo/5HrwLtH0MRTTM3k1/Uxwy4lLCZpSrgPbY6ytq74pu+e2bMZMKzVlqUCeJ2xsJpnTacW5NzVHABNrPqTm8CvqK7EtDu4qUrKY5qeJKBvYsphZX58eqeSB1y9hLYn1IthDM8qUtVedVYxUb5mgYJBVASLhc7qMqsDe45WYq6wNIsyNUmi4INsnF8sBVcLgsrlguD0c8cUnCGMiDVJUjKQZRk/GKfdaQE7/iu2L59H9jrqzqSAomJ6NBEvrT7oo30xAmhSwgwK9B1v8tiKHynv7vS3iEQOO9Y0UHf1J6rPJ6YNnp7hzeElPoghi3jbH8J1fVWBP9k3Sw4l/hC++XewcAXxVK209sqtLTyd9Tg2uNgvGADH1owLTv1ixJQkSjNVOs/aa1+yca33c+Buly6wUUBf8gftsaQI/uUx09aPeZDVeuYnvpnXkzsxBaPK9DkvpjS54cw7644StGxyHradCW9IS15Kvcpd7aD2goYUtWXvCnfT5DQeOtzfWgb4hFA//hl2UznT72VhAYD7g/3hXDwUoPE5mNfklODhXfbE9UwPb0otuy/UsWDhxy6ngIfnUrw3BLAqOnxaRAefqxYuGfdFMQJ/kOdjG3380PfiNzhOZT/RzWyUxlWZjmM+w9JUPSvogWRiXFgl+pJNpKwn3mucaYlsjD9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(508600001)(82960400001)(66476007)(8936002)(66556008)(85182001)(86362001)(66946007)(26005)(83380400001)(38100700002)(316002)(6916009)(6496006)(8676002)(33716001)(6666004)(956004)(186003)(9686003)(6486002)(54906003)(5660300002)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVF5MXVmOFArMWpMaFBVTGJOZGFtN1IvdGphelJrMW1QSjNoaDFEUUFzY0Qv?=
 =?utf-8?B?eXQ5RXFTYUhTblpocW0wMTZmQi8zdkM3dm1xMWU1OXRhVXVPamxIMGhDNTdS?=
 =?utf-8?B?OFo3OXFlV1VLd3ZaMHE4aVluZ0ZUY2wvdFo0QjBsb213QndQUkFTSEUxcVNj?=
 =?utf-8?B?YmMwc3EwUm5UNXJacnNYbXc4NmExb0VHSlovSkJhQkdOODRvWW5xTEhMTEl1?=
 =?utf-8?B?MFBOdG9YMzc1ZWlFc20vVitycGlvT3loTDNnam44ekhBb2FRYlFiVmF4Z2Yx?=
 =?utf-8?B?b3U4M3NVbFBXayt1ZVdnbmNXcHZKQWo0QnJHaXhJMEpvL2dmaFpPcmFhT2ZJ?=
 =?utf-8?B?YUpYV2x1bFBQSlBuaFVyRk1mNFVkS2tyUk1VdklzT0RNVU1IcGIwQVNiL242?=
 =?utf-8?B?cnQycEFobmpkRHI3K3ZLaDBIM3pPNlZNODBsaHY1UlB2VWZVSXRhajBGR2V3?=
 =?utf-8?B?ZjRVZ25LSTY3Q3M3ZHZ4TyttYm4wajJRb2pnY1JKU0d5a1pZUTFNWXJCK0lm?=
 =?utf-8?B?dERhZDdENjdVZ3d3dDk3dllBVFJPc2ZTcWFjOVpmQWpCdG9GWms2WlRCclRn?=
 =?utf-8?B?SGtCeUR5bzd3aURrdFRWZUNIeXNrY3hmNU1LWUhmaS9Ja1BGc0dFOXdTMW14?=
 =?utf-8?B?TDRjVWdMQWdaN2ZvOHBRdG5wY3NuaXhtUWpIWG5yQ29ENkZpa0NqWHI0ZmhM?=
 =?utf-8?B?VHVSc0dSeGc4QkRXQk1aTmd0Szh0WEZMdzFKREo2eFdGUFkrTUlVSjF0cGhM?=
 =?utf-8?B?RWxqdVovWTRnL2svdUl2VjZXenFPaWdhVUZxVlJpbWIrb2EyS0VUZGRJYmhK?=
 =?utf-8?B?akw0VUVneElkeGV0Yk9lM09GOVU4Yy9XRnlnZkhJVUkxZm5FQlhtOUhnY3BF?=
 =?utf-8?B?L1pzdmNrVGRFdy91VEt3RXdQY3UrejYvMDlzMGxVS1BMaWl5dDlOZWlRdnNy?=
 =?utf-8?B?emNWRWQyUUVYQWs5OUlLWjZKSlJzenk2SEIwcWtaK1UxWjEvdXU1MzFiMVA5?=
 =?utf-8?B?ZVlheXlqMDI0My8xczV5UjZrOGRsYnR1WElDTE1OcVVYWFZzeVhLWEN4QnJN?=
 =?utf-8?B?amZTNyttRHpTdnF1eGluazlBa0o0ZTZvdm4rcm5lc2RoSFFRZVF2YlR3Z0RU?=
 =?utf-8?B?OTYxZk9lZXVIaFp6VTFjVjFRNWNtSGkwejcvRmlKeU1QWDEwNmQvK0djL0Y0?=
 =?utf-8?B?eTl5YnRPWmc0Z056TWJ0WnUvMVlvK2h5TDlnTFRIYXR4RVc5UWdoRVFpVmZh?=
 =?utf-8?B?ZFNFMXdESkl6T25KczlEWmJ1R2R1TW5oSm41UHdQZE5INE9pc09lSldwMG5v?=
 =?utf-8?B?Ly8vbGNIc1lucytpVGFBN3lJcGg5WWRmSVJDK1lSM1puMjA2aU9zVzhTb0Rs?=
 =?utf-8?B?czF0WHAxcHl6QTZQZDdYUVNBNXEvOXEvd1RKN0FGSkZLMU13aUtCYlVhY3Jh?=
 =?utf-8?B?TjVzV25Tc2xpQ05iMDgyYTh2dEprK3o5OWc3bHVVUnlVN2ZtYkVCTXFsWHhU?=
 =?utf-8?B?M0xScTY5NEI1QVFXTzk1b2JvVzhteUtaUklaRHpEZ1Y1Lzl3QjJCN3FxNjF0?=
 =?utf-8?B?c0RxRmNLWHo1RXNFekhhOEJQdGt1TFBQcy9uUFlkejhqN09GeG1weHkxNHM5?=
 =?utf-8?B?KzNJdWdsdUI2eHJMTDhhWXppRHIxNUJVYzV1L0xLOVVlY3RnUHh5QXpzeUdS?=
 =?utf-8?B?MHdaRWErT0M0dnhIdDA4eFJ0YVdPMzVRaW9UMWxveXNxMkFnTkdadHIxQitZ?=
 =?utf-8?B?Qld5OFhnVk95MmFMc1FmaGRtSVkrcVlROHhZSnQwMTBWaGQ5bUl1OGZLY2NT?=
 =?utf-8?B?YWxzN1Y2cTcrbGYwMytENStYbWpXa2k0RS9TZm9YSi9oclQzSmwwdDIrRkZC?=
 =?utf-8?B?aFZSZGtvb1o3NWxQTnJQYVlvOVN6T01xdVpKZmRnNXhTTHM4OVo3TkkrTUFG?=
 =?utf-8?B?SjBQVEpsOUZTK2VKeXZhVjlXVkUwbEJYRzdkOU03aFRucEZ0alRNQllrd3dL?=
 =?utf-8?B?b1J1VWFOYWRmT213TmxLNGlYUUxteUQweUh6VW9YeEM2aytrVmViNmluZFRQ?=
 =?utf-8?B?WlYvMVRwU2hzYjVzWXYrT0lKZFduUVZWMEhPOWYxcTFwY3JqVXAwTVZJSlpS?=
 =?utf-8?B?UmNpRnllSWZjaG81MlBZUGs4Ukx4Q0hHLzQyb29IRTVYc0dic2U3dy83aUtk?=
 =?utf-8?Q?m4h+UgeoB84HaU694tylvBQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3014f5cc-1ccf-4ee0-b981-08d9b4aa4077
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:09:17.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6r2uilTdxxUuIhC6C+tYt2+blw13fci75mLAEB2oEymABaBVQYjYw0VMaFCW3sS8zIre+6f2keE0Ybir9dWCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
> While already the case for PVH, there's no reason to treat PV
> differently here, though of course the addresses get taken from another
> source in this case. Except that, to match CPU side mappings, by default
> we permit r/o ones. This then also means we now deal consistently with
> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> [integrated] v1: Integrate into series.
> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
> 
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -253,12 +253,12 @@ void iommu_identity_map_teardown(struct
>      }
>  }
>  
> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> -                                         unsigned long pfn,
> -                                         unsigned long max_pfn)
> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> +                                                 unsigned long pfn,
> +                                                 unsigned long max_pfn)
>  {
>      mfn_t mfn = _mfn(pfn);
> -    unsigned int i, type;
> +    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
>  
>      /*
>       * Set up 1:1 mapping for dom0. Default to include only conventional RAM
> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
>       * that fall in unusable ranges for PV Dom0.
>       */
>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> -        return false;
> +        return 0;
>  
>      switch ( type = page_get_ram_type(mfn) )
>      {
>      case RAM_TYPE_UNUSABLE:
> -        return false;
> +        return 0;
>  
>      case RAM_TYPE_CONVENTIONAL:
>          if ( iommu_hwdom_strict )
> -            return false;
> +            return 0;
>          break;
>  
>      default:
>          if ( type & RAM_TYPE_RESERVED )
>          {
>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> -                return false;
> +                perms = 0;
>          }
> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> -            return false;
> +        else if ( is_hvm_domain(d) )
> +            return 0;
> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> +            perms = 0;

I'm confused about the reason to set perms = 0 instead of just
returning here. AFAICT perms won't be set to any other value below,
so you might as well just return 0.

>      }
>  
>      /* Check that it doesn't overlap with the Interrupt Address Range. */
>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> -        return false;
> +        return 0;
>      /* ... or the IO-APIC */
> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> -            return false;
> +    if ( has_vioapic(d) )
> +    {
> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> +                return 0;
> +    }
> +    else if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> +         * ones there, so it should also have such established for IOMMUs.
> +         */
> +        for ( i = 0; i < nr_ioapics; i++ )
> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
> +                       ? IOMMUF_readable : 0;
> +    }

Note that the emulated vIO-APICs are mapped over the real ones (ie:
using the same base addresses), and hence both loops will end up using
the same regions. I would rather keep them separated anyway, just in
case we decide to somehow change the position of the emulated ones in
the future.

>      /*
>       * ... or the PCIe MCFG regions.
>       * TODO: runtime added MMCFG regions are not checked to make sure they
>       * don't overlap with already mapped regions, thus preventing trapping.
>       */
>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
> -        return false;
> +        return 0;
>  
> -    return true;
> +    return perms;
>  }
>  
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> @@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
>      for ( ; i < top; i++ )
>      {
>          unsigned long pfn = pdx_to_pfn(i);
> +        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
>          int rc;
>  
> -        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
> +        if ( !perms )
>              rc = 0;
>          else if ( paging_mode_translate(d) )
> -            rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
> +            rc = set_identity_p2m_entry(d, pfn,
> +                                        perms & IOMMUF_writable ? p2m_access_rw
> +                                                                : p2m_access_r,
> +                                        0);
>          else
>              rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> -                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
> +                           perms, &flush_flags);

You could just call set_identity_p2m_entry uniformly here. It will
DTRT for non-translated guests also, and then hwdom_iommu_map could
perhaps return a p2m_access_t?

Thanks, Roger.

