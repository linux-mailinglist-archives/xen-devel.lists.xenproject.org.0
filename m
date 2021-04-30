Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED436FE16
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120606.228120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSu-0000nK-EU; Fri, 30 Apr 2021 15:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120606.228120; Fri, 30 Apr 2021 15:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSu-0000mg-Aj; Fri, 30 Apr 2021 15:54:04 +0000
Received: by outflank-mailman (input) for mailman id 120606;
 Fri, 30 Apr 2021 15:54:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVSs-0000lG-VX
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 842897c2-1b0e-4e67-9d4b-837ef2fc8b91;
 Fri, 30 Apr 2021 15:54:02 +0000 (UTC)
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
X-Inumbo-ID: 842897c2-1b0e-4e67-9d4b-837ef2fc8b91
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JO3corwwH7CRtk0Hj71DwiqJkvyHqQxAbPsRbBGQKto=;
  b=NkM9NtR3SkEWADHCKIpCybbAGrwZPeglH3tufxEO3LhTnHQbvVDtMYRC
   dXx8OSOQtqIn19V/TBu0kRLScfhiBFke0xpo0E/bKHGTq7CjYoFecRFiE
   9CU4oyVBNnz7pfiw/Awv0MS55TqI3mRhfEVGfn0r2n0iptOsDVL4TxFws
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8xIh4amYL5gHTXVoWaHJlUQ1bsKzWDhxeYN3cucW6wnbUy70IEd/5WHW94p+53S0ss9jPxzo5T
 H9//bQWE/5jnSplsY3ZTvD5turiAsrfx1BxTA5ZppzBggYgdrSl78wyHzj6Bk8uEJdk0A7AqmT
 HNW+uqhV1Nuva0CdeZ+xQr9a5CYgD0SZo+ORkyHq7THvpY6992RKMK+JARU9TeLLHXc3SaujqW
 xjkojvYqCl4nTd8zYFspN6qj8nApRkni6ySWFwosQQ2RqGbZsivecTrSZIx+CpcWNZJczCneJh
 mas=
X-SBRS: 5.1
X-MesageID: 44331706
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3UPkQqnmmKSNMLge4myFAzn/EjnpDfO+j2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN9AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 1dWoBEIpnLAVB+5PyQ3CCRGdwt2cTC1aiui/vXwXsFd3ASV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsnvZvjTymZHgRc4CHFmAINtKz7OHjuZr6bXc9dnsawSaUizfA0tDHOjiemiwTSjZehYolmF
 K19TDRwoWGn7WFxgTH12nVhq4m0ufJ7tdYHsSDhow0B1zX+2KVTb9sUbGDozw5ydvHgDpErP
 D2rxgtJMh14X/KF1vFxifF4RXq0zol9hbZqWOwvHr5rcT1ABI8BsZR7LgpECfx1ks6sNlwlJ
 9MxmKS3qAnbi/ooSKV3bn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHQrhgbpXXN
 VGPYX53rJ7YFmaZ3fWsi1E29q3REk+GR+AXwwrptGV6T5Lh3p0pnFoi/A3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMnTdaoDHfOBTbBKnibL1iiNKxvAQOCl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTcKU2plG9Q3MXXW9UTzhxto23ek4hpTMAJ7QdQGTQlEnlMWt598FBNfAZv
 q1MJVKR//vRFGeWrph7knbYd1/OHMeWMoatpIQQFSVuP/GLYXsq6jeePbXL7z9DCY8VgrEcz
 k+dQm2AP8FwlGgW3f+jhSUcWjqYFbD8ZV5F7Wf+fMSxogLPohFqRMUlly9+8GOJVR5w+0LVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ilT2lHvhYQM0T/ca8KvtKWfWw65grDGjZPC+ftVC
 JPrVV+/qy6a6GKzSc5EtS9LyaxlH0Ivk+HSJ8ah4yO7croYYkDE54jQaB9fD+7UyBdqEJPki
 NjYBVBblLDHjnu4J/V96A8NaX6TZ1ApyuFZeRTsmnSsE2Ao9pHfApgYxeeFeiNgQgvQDJIgE
 ZW6KF3usvMpR+mNXY/jOMkMFdFdWSQB/ZcAB6YYZhP84qbBT1YXCOEgyeXhAo0fXev/0IOhn
 b5JSnRYv3TBEFB00oom5rC4Rdxdm+HeVh3ZW0/uYphFX7esnIb6579WoOjl2+QYEAF2OcTLX
 XMZiYTOBpnw5Sy2ASOkDiPUXUgyZNGBJ2qMJ0zN7XS0GiqMouGiOUPGOJV5o9sMJT2qfAQON
 jvCDO9PXf9EackygaVrnEqNG19r2Qli+rh3Fng4HKj1HAyDPLOKD1dNvkmCsDZ63KhS+eD0Z
 1/g95wp+e2P2nrYtONyK3cbVd4W2fuiH/zS/ttpYFfvKo0urc2AoLSViHQ0mpbmBo5N8X5mS
 olMdRGyaGEPpUqecMceyhUpAV00NuOKVYmqQzwDKs1e0o3g3rSItOO5P7JpNMUczO8jRq1PU
 Pa9StXu+rBVW+E07URDqorO2RYaEQm8h1ZjZa/XpyVDB/vbv1J+VqxL2S0f7BcQrWUALl4lG
 cE3/iY2+uMMzfi0A/evTFnMrtD/mauT8S1Gh+NE4dzgq2HEEXJhLCr7s61hCr2TjX+a11wv/
 w4SWUAKsJelzIlkIo7liCvV62fmDNWr2dj
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="44331706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RorquNSTBsfgsLMkm0Anag3Yp5OPbuWQNAqMmUbDPHcZG2G8krTo/qsPumFNoHooh3qRq/nfurK1Rvw57Wtms+gsxWjePQXhyU/PYAMy87o9Hlu0nYx2ZzZS1pkuHmXbJfP9PBYyBeW8GFMRwx+4NA+mGoqEJcWD8ZBxN3Hk8tum950cuqLqgQxrNlCQLUUtDwXw50a/IXWgxr01NIBDRs+IQ5rwcN+Zp+CwrV8cya2FX3e3Td2EgcRgrJCQc/O7gVqEljGZgXncMKguIshw2MrzsAksct8d0oF60sMQB3nFyOfIdT07T4mDuAZ16x0Bj/XlhEH3Ah3U+hoVFY9gQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrqI6833NbHxFCO57sSX2aG8FrkbJegAmboNZQJdf7M=;
 b=No8HaK2DuEFNeR0ANtDMOwCsHi5AqjjxSVcni+U8VFXPElmfMLkLsSXvLHf+be2xXTrnjaVqM9Wy9+Qi9qh5LR1zPYYl5AbrmweW4AdJoJNK7LkpvkU2znW7KTKei/SBKRmC6rbm5I1JkfFctWeZoVh9EwY1oG3EzAlEbdaCtHv6F7in1zl5PNQYBX3ZK4nAIK0plEXvRjjOtuXZZV/c9On8fgovkm8AUtg9DzYE7o7jyakYMzCFfmdqHgfoCB7PIsLBlZ7fUA7xWzDprADsWx27Ct/4XFhq05Czc4nobawTk/q/PvNXAI3SASvHehZSHDZ2pWlFLJr2zK9WwAEdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrqI6833NbHxFCO57sSX2aG8FrkbJegAmboNZQJdf7M=;
 b=wVtYyY7eF+4J5bTiTZytIvRidnLwmQ+DTpn6pyDtIVZo4i/DdlLUwN6MxPVjFVn9YZrES6uFT6Bwa0y4J+HAAmUMwhg9hsFNirpSF91PNg10o4BzUBUl/zDiLVJYPXMAJ6ofRC0XbRFRRy85Ti/7TETAc6cOwZDBlp3X0dOieuc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 04/13] libs/guest: allow updating a cpu policy CPUID data
Date: Fri, 30 Apr 2021 17:52:02 +0200
Message-ID: <20210430155211.3709-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccc9d339-1e0f-4931-4466-08d90bf02ab5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923AC184E30640328759F018F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRxiHCRp82z51yuHbU7uDUgzM7ll/Vx+i1nwXdPkm828eavuk5vsvK3D4m2HU9wOTF/pEwL9KTCPBizhM766T0GcCsd3+H9KDX9kAVEs/+B5vflWL1WRhw4xudTEhaJGmylRocf/6UtNAYaXY3QGZolcAR6dAdyj7EM44l9Tut7ZJzjbFOq7QNOwQyNNcB5BngoEEtuOyzF5K90DCTqYiR9s3q1X5iSuiGPfvZdGNmXaRcfZm5kHHHr6mTcsLpEJL183YrZEruJ7QTYLJwrk/ibhx6Wi1X9K1D0Yf5NBQ9ER27R6dcM3ebLwOF2F2OzMEIVgcltTrFY4HZhxu4a1k7U6JBCxiA1KaarcKtqsmQsfGdZ0Wl/w9tC87Qw7HWd1XQSItG/QBZwL6BjW81Pct4tb9oV+qHCZWE1OZ03vjz81CI9KUMXXA5FnMOT9vqD0yNAFAlVUqnD1wQ0UZwUao971VPdeLUwePV5kRFVu7Gci6jISlLNFQvYS4H7RMal7+T735Jdm4Prg+Tbz5SgiWWGKwZnH8u3Su+hWRsD4khR9LndkuLkRPbgkz/1yT9zaPNb+dJj8sf0wsfQh/KwwkltvCovYEj+0uRsEDi+P9h0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(83380400001)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFhTTVlYamg1Yzc2cEVOL2JwU05Ybm9CbCtpNVdmOHNzUTRZamF6YUt2MHQ0?=
 =?utf-8?B?NHVhTER4NE1zMVRPaXlYelRndUo4cEdnblloNlNEUnF4QW4zWW15eWNmeXhn?=
 =?utf-8?B?ejdyMGlaT3BTUWpWOUFENTVydUZRU1JJUDV5Q1c4WkJJcEsyNzlkY1gyNCtI?=
 =?utf-8?B?dERvYUJjaFRnUTQ3SHcxUnhqUnhHM2pNTW82Y0p2Uy9uZzVFRHNtVWhXd2hx?=
 =?utf-8?B?S0FDRW1RUHFnT29uUHBJUE44SC8rTS81Y1RUZTc4bk5JOXV3NGsxZldoeW1V?=
 =?utf-8?B?WXF1OGhoejBaaW9mczY1amNLeXJMRGNmNks2cm1hcS9WVjk5dEZ2MjY3aTBC?=
 =?utf-8?B?U1dqNjdJNTZPQzBlMFpxZjV1Yng3R1NJa3prYnA1dWMvdWdiamp0Q0E2TmNB?=
 =?utf-8?B?cUlFSHJBelpLM04vTjZjeUhiRm9DdkJIc0lzVFlJR2tSZFp1S0NjSWp0K3Rj?=
 =?utf-8?B?YSthSmg4Rm00RURoRkdpUWxLdlRTUHcrd3NOelQvc1h0eUs0TUY1eHdIdXBq?=
 =?utf-8?B?WFhLWWRyenJFMmE0eGtEWWQ3RlZrekFNUzhvWkduMmJOMnhQZXgxQTJ2dFdO?=
 =?utf-8?B?cWtlT2FWTUIxeHByNzdscHFDN2FIdkV1cU1hQ0h5Snlic01Ea25JZm1lbmhW?=
 =?utf-8?B?QmVzbSt3L25WNXlra2llM1B4OVNod2RoTFpuWERJaUR4SGIwa0xKb1YzVnVN?=
 =?utf-8?B?Z0hJN1duUGNTLzNMYUhwNnAwazArTnppNG5ORDhNVUtVbEtSb2dSaGttcU1G?=
 =?utf-8?B?d3VmMlEyTmdDVG9PRVBEclQyTEt6OVgyQm0zZnBILzFRd0JlRHY5V0ZxbXJI?=
 =?utf-8?B?Zi9maERCazgyUkJDSHc0RWFVOFlydHJaME9lUlIza1FpZ29OemVEQkpLU09h?=
 =?utf-8?B?OGpyQkRlM1dVc080bHphWllESkRCQjVCRTk2RHZDdkZweU9XdXJ4L25CN3gx?=
 =?utf-8?B?RVhBeXVtU0VXa0NTTC9QK3haRzJ6NWtZMFdBNnJyZ2VzbldHcnVsSzMxTnJX?=
 =?utf-8?B?WHIvZTh3UXFRR2pMOTVCM2FUcUpMZGFWRG1GSjRlTjVKQ1E3eVZlMG9KaldH?=
 =?utf-8?B?cUthdlRwSUd2ZlpXZnJZb0Z3SkJsUVVOUG40MlpNeldxeVQ1bDMzemNRZ1lE?=
 =?utf-8?B?OTNJQzRDcUhPRWJvWkpZMHZSMG4wcFQ3MG9IeEF5dHdXd1FhRUxKUjVkUGpo?=
 =?utf-8?B?V3VLa2NiR1IrSlY1R2VPV1JrSFJPTnp5cURteVJycWYyVVBFWXpmM2YyYU9L?=
 =?utf-8?B?N3ByVEFjYlRtaGFxdEpGeGx1NXFOSlF3VXpBeFpmSHJiM2tLeFVxQU9FOXBM?=
 =?utf-8?B?em5Xa1gwZVhoNnNjS1cyTE5Pa1BJbEpaZmFNRGtSa1Y4c3lNbTVOcWNDNzAr?=
 =?utf-8?B?NGtVU0I4MUxaVm9lUDhoUmxSUkd6eGZmOVh5TlJmMXhVS1JJRDBJcGladmV6?=
 =?utf-8?B?eFR0Tm93N1IvS0xxREwzZTdJTjczQ0RpbjNQWndIVCtiVlVUZloyb0VpOEkw?=
 =?utf-8?B?QkVrN09LNXk5SkJqYmF0ZFh5U2oxemVJSFJSc1BZNGYwSnVOZ2VlZyszM09B?=
 =?utf-8?B?WmFodDkzV3RWR2xGUnBDSEFjTzdYYlpFWDgxMEZ2d2d1eWYxMzZacU9MSks2?=
 =?utf-8?B?TFNUQnBocStabmJ3V3hXU1c1S0pFaDhPNkpWUVR2TC9iUE1YM0loQ2xtVUNV?=
 =?utf-8?B?L0VCWURrZ1hra2FEM2dpU2lFZkJqS3ZvcUM1Wkd0a0lFMEJqanF2VnBUaGVv?=
 =?utf-8?Q?WItvgfEOsCk+n5FCz5SivlNOu9MBKZ5GAGSkOCZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc9d339-1e0f-4931-4466-08d90bf02ab5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:53:58.8046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYm2ke5gqREQm/UtyUgQHNRB1cMllabo7lOJLRru/8QWv9XQXJZR+dJVeRV+U2LGjfdsXBwS6Dy0oYLwjKAMrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Introduce a helper to update the CPUID policy using an array of
xen_cpuid_leaf_t entries. Note the leaves present in the input
xen_cpuid_leaf_t array will replace any existing leaves on the policy.

No user of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Don't use memcpy.
 - Drop logic to update the leaf manually - x86_cpuid_copy_from_buffer
   already does it.
 - Only print a failure message if err_leaf != -1.
---
 tools/include/xenctrl.h         |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 605c632cf30..49f919f16a7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2613,6 +2613,9 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
                             xen_cpuid_leaf_t *out);
 int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
                           uint32_t msr, xen_msr_entry_t *out);
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 9e83daca0e6..a38e75f8fb1 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -892,3 +892,23 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
     *out = *tmp;
     return 0;
 }
+
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr)
+{
+    unsigned int err_leaf = -1, err_subleaf = -1;
+    int rc = x86_cpuid_copy_from_buffer(&policy->cpuid, leaves, nr,
+                                        &err_leaf, &err_subleaf);
+
+    if ( rc )
+    {
+        if ( err_leaf != -1 )
+            ERROR("Failed to update CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+                  err_leaf, err_subleaf, -rc, strerror(-rc));
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
-- 
2.31.1


