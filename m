Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E37B15FF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 10:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609363.948405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmNs-0008T0-B4; Thu, 28 Sep 2023 08:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609363.948405; Thu, 28 Sep 2023 08:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmNs-0008R5-7X; Thu, 28 Sep 2023 08:28:32 +0000
Received: by outflank-mailman (input) for mailman id 609363;
 Thu, 28 Sep 2023 08:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlmNq-0008Qz-UB
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 08:28:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feff9be1-5dd8-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 10:28:28 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 04:28:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5635.namprd03.prod.outlook.com (2603:10b6:208:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 08:28:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 08:28:16 +0000
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
X-Inumbo-ID: feff9be1-5dd8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695889708;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3xvMs48F04Ir8BQ+lgfUD7pIuTIwAz1z5AVnaBgPikQ=;
  b=gytmRiM2k23EGzo5jInaGIoRTfdDGt0bVR13B0Tw7y+oWGY28d88K0KH
   +BB1GFdGT+CS6CZVx2D7Vhvy5SGAH7N71f3YHOvwpPwgxF2DauSo6K5xT
   UCkzoPDTu2gz4KpJeWICuxrbVmb4EuG/5CuBjqyOEPk4Wd5Jtm21j/hkm
   k=;
X-CSE-ConnectionGUID: ZfBXJ+yNR+KWoe77r12Gqg==
X-CSE-MsgGUID: PrYZa4gBTa6gGK52J5ZW/Q==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 123299732
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:9HYcwqgIRYunwGA0KZ6tddJnX161WREKZh0ujC45NGQN5FlHY01je
 htvW2mDb6qDZGD9fYp0O9nl/UsAsJSAzoNkTFY9r39jFSIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sT7QWOzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQqJho9TFOSodj14428R7YznJ15A9DkadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhA9hDReLjrJaGhnWr3F0hAUEZf2ey//aWqRPkeY9tF
 Astr39GQa8asRbDosPGdwakrWGNpAJaW9tUH+Aw8giLxoLd5grfDW8BJhZ/b9ghuN4zVCYd/
 FaDlNP0BhRiqLSQD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65uAZAhn1y
 jGO6SI417MaiJdS073hpA6WxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:C1mHoKEcpMqGZml2pLqFiJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD/nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MC40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFvLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/blpgR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIWiYcLQTOvNSSy5uwJzviUK1/NHwgFi/suq6SRg4eMBYYCaka4ORUTe8jJmYRsPiSUYY
 f2BHtsOY6SEYLfI/c24+TAYegiFZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-Talos-CUID: 9a23:uOf4SG/we29rcfIyo2iVv3waMPAHMWz79jTzHEi1VjlzEee6UFDFrQ==
X-Talos-MUID: 9a23:SK6/HwnV/Ba+llglEgUVdnpaLvZa6vihInwEz5opmJTeF3FCBHCk2WE=
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="123299732"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFgZbNV1v16cMKzzMcoT90EYpb2Hg8NoL1jm2qzqsR9QiHJXoVOZtSIPiqkuRwzM9WXfSTcDrq0bGB9/ftTg+F13YIu7C1r0v09RpsKGdCEqhwK2m5Yn1c1EU7Uu56WLlsTkdefWBpEUwSQkS7qV2SlZUSwj0p1vzbAggQJhWRdhLMAvdclTZFQGFdsL1s5KU5UtvqoNZSepX7veCQ3IFnqzvPombxz+7vMZA9gv2O8yT1gAyn0sjUsV6UGiQeaAW4GZQfcjv3W9OI7F6RSQWSLwGzytirrA9mXleHYbp9YRUFsBJWlWlNm/vORtgnxKlcNDF7lrrvo4+WpbIaXKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phUvxmXs4K3ahXvVb0MlG58+gQmZ+yZ/sIHjUV4Rhro=;
 b=kBXvyVN37zQO3+pmTpmUhOY8cY+NgCMA+MFrFmtFPWK3UFt6c+W3fLv4Ks7vyWf99Uwb3kBybeqGh28iNpxtnJmEqgRU1omRf/ofiHd8a9/hV8WE5Pk9EIFxn0aDzye6L6XjNLKdcL1UOpJh6u/79i4neye4xoFThkTI+lBlHsB6U2vhGjlGnm6caXfphdbBxzrZN+o0Pi6Gou9gif29PAt++F7m9eTYyVNpmVkDJExZCcLkeLKsftDRDNHZbLrYRQuexZtlQ/e+XU0FQrEwj0WXpVmMupQ2vaBUbsS5asHlOuHasnll0jjHSOLkp3v5w3+Z2pWs4Z4iN6dTvwQ3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phUvxmXs4K3ahXvVb0MlG58+gQmZ+yZ/sIHjUV4Rhro=;
 b=d1CiIT7BPk7NhW1T0d2lcbQ3pW17WaFAHyUsqi7dRFf1INkfyZLNxryGz5dO/L8tQoJ/b4X7ulcyYWSW57ImSiKvmsAxwRzQoy0c43rhLpzCuU6GeFQg0i9MU35CtcajrJvOfeBMF2XrWz8c66FhvWbKnZodAgmnUH3IXVoYNkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 10:28:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Message-ID: <ZRU5G4Ae8B-A2iWd@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
 <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
 <ZRKRNcypuvP26luu@MacBookPdeRoger>
 <8a300dad-29d5-2017-70ad-09abc2c62368@amd.com>
 <ZRL9QalvI4VrDQhF@MacBookPdeRoger>
 <0d4b7115-8cc6-3b11-9a46-0f222bcb864a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d4b7115-8cc6-3b11-9a46-0f222bcb864a@amd.com>
X-ClientProxiedBy: LO2P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::29) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ca3654-ae4c-42df-ea4a-08dbbffcdcea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sFtCLlf0WUyiPcfmOK+SlmfMX0bXohisI0GupIiQ0HxCbNhX3sw02kk7NQK/z5BbtpZyKwqPh7E9wEq4e2sauaMf1DQ9YJYOsIrAk9Er/rT5V6uXCSdhO3afq9pJ0HcX2UM5qW37A5mUq4cmV5JC/y32cYLhYUIxQuhwEW17v+ScEpzkFD+MML7ODFRNmLoCMKdj8k6z3q9A8Ii0pwbuWSrrR0qmyBPultsfq8SHc2euEUeInloTXeaZOYDPaS8iLdqwFe9HMJBjMZ/FQvy/EN7yGSfP7SfJPn4BEnhy3DVricDY0oZJLwXyLFSAJUNNYyaIXa/uxrU9wB4lVHb2XLPHQcE1uy7CUFVZgU//hmeUAi2uK8/D0OuvD67kkdrhCWKvnGcwaUBVVyRETBW/r4mYSwN9pp2TUBmX7lnPvT8yHAYfUNIjh9Q694b9SFUgGm8m1PiqFJQPz4D9nCdef3x4UqDZVw0RwqZDl1xOfwqs+AmgESOM/6fvdnh6aYt1ckKr3lhCQffuIGF10GNvG01T9vNfnHe4QEBtOzmhi7kxlJLXHO8DeHqxG6tMVB+S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(26005)(66476007)(54906003)(66556008)(6666004)(86362001)(9686003)(53546011)(6512007)(6486002)(478600001)(33716001)(2906002)(38100700002)(83380400001)(6916009)(316002)(8936002)(85182001)(82960400001)(5660300002)(4326008)(66946007)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmRiRUdGQnUxYWxBN0tPODNUdndXMEphaGtFOHh6TkJRNXBLZmszMDliZ0Jo?=
 =?utf-8?B?bUJpbzU5UzNDOTU3OUxpRWFBTlNGN0NOSmE2QmdvcUV1d0h3UFVEUkNOaExv?=
 =?utf-8?B?enJudkYySmQyOVovWTdDeExsVEp0Q240ZmJ5a1dOMDk1c2VtNEhGL0dOTmJs?=
 =?utf-8?B?bmJVa2hnQXdDNTJ4aVB4K3FlaE5wZ1JIZjJWRnpoS3BmWjd5M1ZaejRSNUtt?=
 =?utf-8?B?SkRMS1dPNDdxQUNXTXRYUGpnODF1N3J5OStIcWM3NHRqMDdRU3FtaW12VEk5?=
 =?utf-8?B?RXBDVm00L1FTdmFuZUREUitRVlJNc1d6OENLOVZWZXFNNWl0blo5UmJtVnVB?=
 =?utf-8?B?V012VjNYbjF0SU9hSXQ0SzYzWHVGTkVDdm40S2RiU0FzNWVQS3E4ZmVhaWQ2?=
 =?utf-8?B?UGxrQloxa05jT01XRjZGcE1ra0JMbFVCVkRrODlaRFBEVnZZL3RCNE9xb1lD?=
 =?utf-8?B?WEVVbERlWnp5OC9NZWVGK3RzNGIyWXBxaEpaVURXOXZKM0ppTXljZ3NOY0lS?=
 =?utf-8?B?akw5NHlkYU5VcDNhV2RYRURzSm94d2NrWUZhM3BJN2FoUUF4RFM3Y1RHbExH?=
 =?utf-8?B?WGZ2c0cyOG5IVHVIN1BFQW83aWtERWppdnJ1Mis4bHVaQnQ3NkpTMDlOdTBl?=
 =?utf-8?B?b3lHeHlnVlNUQkNZdysyUEJXOTl1YUV2K1IxTWlwVmpKSWpqTkE3a2hCZlhR?=
 =?utf-8?B?ZitFU2ZmaWFoOUE4c0g0ZkN4RTF2eGg4U3B0TSswWjNuV0VCdHJ6c0RCNlFX?=
 =?utf-8?B?RUkvT0VmSUE1UmxCL2ExUkpPQllUVlArdGUxNk1SNERaaUhsTkFxd3cycWhl?=
 =?utf-8?B?bXhCVFZyaTFvMXRNWDFXdE50U1p6QmJuakhXY0tlRExJNi8xclNxY0JRREV3?=
 =?utf-8?B?MjVLeHFidlVlQUlYZjJGNElPSkt5RldhM0dyenZFU2ZWQ3htTG02akJzNmh6?=
 =?utf-8?B?b2lrYU5TNlk0TzgvT3VVdnJYWk9LTTJjYjZhMVhaczV5QTRWNnptSS85TER3?=
 =?utf-8?B?a21zUExlNC9tRWQzM0ViL3hJSVpWc2JLVmpHcTlUbzh0Rk9OTUtVeWhqd0ty?=
 =?utf-8?B?THhGRkJPU0pRWkp6VS9qY09tbTlMbTlMdWJFV3dxYi9nQkJjd05jMi81dWpF?=
 =?utf-8?B?d2NuT0hnY0xYZEttWHlGZm5qejhqLzNyTjZzbmVaVGE0WmZhRWtvVlZvY1BF?=
 =?utf-8?B?Y2Zlc2ljL2lYUzJoR1EvU2ZyK1piQk9mY3F4bnRzVENKU2FTanNzbGZTdWtM?=
 =?utf-8?B?R28xQUpUdkdWL3VhZ0toVlFRdkVDd1JIYm1UWEVMOXlIYkpPMkZwZUhIVElR?=
 =?utf-8?B?Rk52b2NqaW5WMWVTUVFiNWF3NHZqVEh2UjdrcUMvMTk3TlhoQWcxalpMZW16?=
 =?utf-8?B?Uy9kTUM1eXNtMzNYVHIxazNyS1l3eVp2NnFMOFJZVkJHVGtjbmk2Tk5OVnNs?=
 =?utf-8?B?K1ovd3hFOXhHUFNVemp0M0IwUjBUNit2b0IvQmpUbTN5Z25Oa0p6OW43K0RW?=
 =?utf-8?B?a2dQU2hkdG95TXNjRE4rNGtLSFFQYVFhMVQrbUhVaWViUC91T3RzK0xlR3Rk?=
 =?utf-8?B?UUpNTnBXWmJZVEtzVDdQcDJQakM3Rk5XQVB2L2pBcVJPcncwR2ZVaC9rVzdH?=
 =?utf-8?B?QXJGOGxGRWw2N1lPbkppTnhaaTg0Z20yekVMbGRXcjRIYXVpU3RSb3NhdHJR?=
 =?utf-8?B?WHhCSktUV0Zjb0paMnVQSnJxMFFpNWVsRWVGQnVHVVVjM2IrSUpvZGJpYkkr?=
 =?utf-8?B?WjBJVk1md1JwYVV2Y2dFd2JYdlN2QjVMbzMwZ2tXQlcrU0dJZlg2ZXdqT1Jp?=
 =?utf-8?B?enlXeEhpZUhsOUcvR3ZVVGFPaWt6ejdUMVUwOXlLREYxRFVNd3JxdlRZM0di?=
 =?utf-8?B?VXJoZDV2c0xCU0JveTB5R2NNYi9PcXA5cjNRWDlWR1ZpTzkzS0NOWWVtMy9T?=
 =?utf-8?B?dDJqbmdnalI3dFNsNDN3MDNXb1JVeWRITUFwbXF1WVhWankyOXpPVFpCb0ZS?=
 =?utf-8?B?UGlxcmFDelRPSzJTTVJvTWJ4MFpKamljNDNSa0M4RllhSE1RRVY0ZUFCSXdE?=
 =?utf-8?B?ZGJiaDVGaWRPSXZRS0lvYTQyZm9VT0wyUXFkc1cwQ28zMyt0UzJDbGJ2Q1Rz?=
 =?utf-8?B?djgvWEdTbTNqVXNlQXBFS1RnZUQwRmZtc0hQRFc0UFJQcytjVEMwa1hheGs5?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T/nGE2xR15nxDRJ5yQ/FxIHDLFqwZrbhNFJQXPnw7NmgK15bqcSx9jZ4HzbA83uMGEn+HWd14WRtNeI4RG+7Z47USemp3+CK3yqAEWiPbnFzqLDk7LsDqwtbAf3cBlFs9ADC2ol/VNGA7qEMYLSPovzroin8jC4DIJU2Wu0ku7/SOH8KhuUPAhXbLOBbefCBEfVS/WkhkyGscs27Xzt8L2F1pvFJjJCKx+RHoqbz3KgjlHtpSSzBSmi99TB1rQol2hA+0kLS49zf9PqXqP/Z6viQHBzcVR/aC1XB379CzTbd1OTF0i63e6FTaoPXhulyUmdsyXhKtTNIv8uF2FLrWbpeW/R/7j6WE7dRrPEzOy1YAUfJ/10tuZLXsSvybyinm6il+l5ODujWaM7r3VZqutIxPTvfrahiXcivsRgoE9VczECcbBUOGSE2U0YYtIOoVzYu0kcNLgC5c+wR+41WtDxElM/bLng5b4w+LjTZpY+fIiqqmWp2XLw/xX2haFbSHjmUXc4n/z6Rql4m05NiDrAbQjmmkyqEa7Uwvi1ahdG0mw6rbgdnE8MmDLazi5Hi6A+Lz7FdWwiUdDnjRtPSMdAAlnzqrzA9JUgX5NzPeDQej+IHOTUt+w9zPYgvUH9HEWRjv8pdC2w23rYxcZgixulVvfxq67uDCbVKcPOJXGV/RLSllO+xPA40/2i/QXuZPD+CSIXnk/7g6bmv8VvTpdpzGLUge4ZrUlLufYGQyv5WfJcLcP9QELaCPwb1o1+GTerv24URAn6QU21x4bq3+6lwL6+agKrxNCuXEqUUUc7CYxpru0TPu62uT7c56Ho3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ca3654-ae4c-42df-ea4a-08dbbffcdcea
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:28:16.4995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FuOCQoF4zv8uSgEvs9H2TBv9HTxZO3viH71CZ1On0FSFgHbkVQThesWydURCpFGyorfUFFn8NCIxHtqZSgQ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5635

On Wed, Sep 27, 2023 at 02:03:30PM -0400, Stewart Hildebrand wrote:
> On 9/26/23 11:48, Roger Pau Monné wrote:
> > On Tue, Sep 26, 2023 at 11:27:48AM -0400, Stewart Hildebrand wrote:
> >> On 9/26/23 04:07, Roger Pau Monné wrote:
> >>> On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
> >>>> On 9/22/23 04:44, Roger Pau Monné wrote:
> >>>>> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
> >>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>>>
> >>>>>> Skip mapping the BAR if it is not in a valid range.
> >>>>>>
> >>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>>> ---
> >>>>>>  xen/drivers/vpci/header.c | 9 +++++++++
> >>>>>>  1 file changed, 9 insertions(+)
> >>>>>>
> >>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >>>>>> index 1d243eeaf9..dbabdcbed2 100644
> >>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
> >>>>>>              continue;
> >>>>>>
> >>>>>> +#ifdef CONFIG_ARM
> >>>>>> +        if ( !is_hardware_domain(pdev->domain) )
> >>>>>> +        {
> >>>>>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
> >>>>>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
> >>>>>> +                continue;
> >>>>>> +        }
> >>>>>> +#endif
> >>>>>
> >>>>> Hm, I think this should be in a hook similar to pci_check_bar() that
> >>>>> can be implemented per-arch.
> >>>>>
> >>>>> IIRC at least on x86 we allow the guest to place the BARs whenever it
> >>>>> wants, would such placement cause issues to the hypervisor on Arm?
> >>>>
> >>>> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
> >>>>
> >>>> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
> >>>>
> >>>> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:
> >>>
> >>> It does seem to me we are missing a proper cleanup of the rangeset
> >>> contents in some paths then.  In the above paragraph you mention "the
> >>> old invalid address remains in the rangeset to be mapped", how does it
> >>> get in there in the first place, and why is the rangeset not emptied
> >>> if the mapping failed?
> >>
> >> Back in ("vpci/header: handle p2m range sets per BAR") I added a v->domain == pdev->domain check near the top of vpci_process_pending() as you appropriately suggested.
> >>
> >> +    if ( v->domain != pdev->domain )
> >> +    {
> >> +        read_unlock(&v->domain->pci_lock);
> >> +        return false;
> >> +    }
> >>
> >> I have also reverted this patch ("xen/arm: vpci: check guest range").
> >>
> >> The sequence of events leading to the old value remaining in the rangeset are:
> >>
> >> # xl pci-assignable-add 01:00.0
> >> drivers/vpci/vpci.c:vpci_deassign_device()
> >>     deassign 0000:01:00.0 from d0
> >> # grep pci domu.cfg
> >> pci = [ "01:00.0" ]
> >> # xl create domu.cfg
> >> drivers/vpci/vpci.c:vpci_deassign_device()
> >>     deassign 0000:01:00.0 from d[IO]
> >> drivers/vpci/vpci.c:vpci_assign_device()
> >>     assign 0000:01:00.0 to d1
> >>     bar->guest_addr is initialized to zero because of the line: pdev->vpci = xzalloc(struct vpci);
> >> drivers/vpci/header.c:init_bars()
> >> drivers/vpci/header.c:modify_bars()
> > 
> > I think I've commented this on another patch, but why is the device
> > added with memory decoding enabled?  I would expect the FLR performed
> > before assigning would leave the device with memory decoding disabled?
> 
> It seems the device is indeed being assigned to the domU with memory decoding enabled, but I'm not entirely sure why. The device I'm testing with doesn't support FLR, but it does support pm bus reset:
> # cat /sys/bus/pci/devices/0000\:01\:00.0/reset_method
> pm bus
> 
> As I understand it, libxl__device_pci_reset() should still be able to issue a reset in this case.

Maybe pciback is somehow restoring part of the previous state?  I
have no insight in what state we expect the device to be handled by
pciback, but this needs investigation in order to know what to expect.

Can you paste the full contents of the command register for this
device?

Thanks, Roger.

