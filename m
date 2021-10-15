Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216742EF86
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210322.367141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLDo-00072K-Nx; Fri, 15 Oct 2021 11:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210322.367141; Fri, 15 Oct 2021 11:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLDo-0006zy-Kt; Fri, 15 Oct 2021 11:17:56 +0000
Received: by outflank-mailman (input) for mailman id 210322;
 Fri, 15 Oct 2021 11:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=doKy=PD=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mbLDn-0006zs-3i
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:17:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b22bb89-e968-45f3-9173-108994f2f2a7;
 Fri, 15 Oct 2021 11:17:53 +0000 (UTC)
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
X-Inumbo-ID: 1b22bb89-e968-45f3-9173-108994f2f2a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634296673;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1uo8Mv0D2r70UbdMK/P/Vk+E+XAdltSMPlY3GeqN5xc=;
  b=KtDt4awZU4d728ZDR1rt0xKLj8uOjxDuCJNydMJWjiRbC+zfOUoc5G4w
   OZ9GZKSqKXWTSq2rbCvGotD/L8vvEG5ys/Ax1dRhySU0b+PXhuItZTOCQ
   6QdXPk5sx9jjBwe6SfyL0YLaLYm2kcW7Ei/h1hVzyL973nuSKxV37RlDp
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RNCy9xWIR22Inh+vqh0P5UKlcfr/tUPfKPa9gcprqZDqBWQQbtNNqGOaxPJ4mx8H+YdN39YsUe
 6hYdQf+GThep0cshtRnTQHTKrbRwVvGUxoIMyksFJPk+H/UsIIt+Hg1Dn6sfXh5JRWlxRZyCff
 DEKg0ETScyFsO+/0YXSf8shFW0N0VzYt6BfHe5D9o1aqgeQS/JIGFmZntS9T6kHHikFXtLepVY
 eDUDLFbPhouGMR5ci4Cx1bGcY0DxoJjvvxNhmf0Zj07lV0kz/GhR7T0+mnelf2iNwmruHoMA4Y
 FGx/url0x1tLH8FvB19SG7nj
X-SBRS: 5.1
X-MesageID: 55308482
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zkzNxqwciataWNq369J6t+fCwSrEfRIJ4+MujC+fZmUNrF6WrkUFn
 DEbXTjXa6mDNjD2KdpzPtnj9U0FsMSEnNVnTQA6rSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dk2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8htl
 e9Wj9vvdSwkPavoteUPbTBkFD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY250VRaaCN
 5BxhTxHVRvaYkd/A2cuWMgFl8b12nvyQj1fkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntSHxVZ8WFba43uV3m1DVzWsWYDUKVF6TsfS/zEmkVLp3N
 Eg86ico668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8+xrEPHM+CWF9Q9ElsusbRC4U/
 2OOgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+95r0EqeJjp3OOvs1IetQGCvq
 9yfhHFm3+17sCId60msEbkraRqXrZ/VUhV92AzTWm+0hu+STN/4P9L2gbQ3APApEWp4crVjl
 CRb8yR9xLpXZX1oqMBraL5QdF1Oz6zUWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8MJZyHxMPYnOdzZ5yEWIU7ITomNuhf8NYImX3SMXFXfoHEGibC4jggBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8JIKKLTaeVQ7QQnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:2+7Rs6N1EUctXMBcT0/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzY4t6+pnay9qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU811rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxz75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwthrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGbgoBW+q3pYp0PJGbAfqBb0fbllQS+3UoJj3fw/fZv20vpr/kGOsB5D+
 etCNUiqFgBdL5PUUrRbN1xN/dfMVa9NC4kBljiaWgPJJt3SU4llKSHlIndxNvaNaDgn6FC1K
 gobjtjxCcPkgTVeJaz4KE=
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55308482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJJf0ctgfrD/pwfNrGSe86uv2TIMoEd55A+0KQQY4Pn76Klkf+U/Via79u571ofBrWlWQSz91/HrU3J5e2MRuJeSqkC8rrsD1VIht4160yTRbmUhLYPMbrTef0EuhFyrMFaEnM12hONLSNsnU4uhVjZaiLcAsq0u03N5CUldWFUWUbyybLSWmhzzvUpfc/UiG9VZ3o/sOvYQM32FTN9F9fqWTho014wisIvmeH3OguKqt0sj8PfpxiGjBCihUwwlhoFkDMRV/oH0Iva9SLCqew5CkJ6TI1wJikD/e4yCRwiYhA/rTrvplouSQ5UVVIiL+9iUdeuWnsAAyHmHiw5Ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uo8Mv0D2r70UbdMK/P/Vk+E+XAdltSMPlY3GeqN5xc=;
 b=Xdh+V4sAaKw7CWBKrOfhjmQZnlSiA1La3XhyoBPY1ivys+xsrker0BE0iGZlTILfxmlxr2PB702t2csoFv8qGSsgd0brD5CAfAsL6SVHpFcp/h8VKDM9DUDw1NjDkH/sJWHPFJEYzP0Wt5akGSfO2+njv5OfNfM2cDiuQxht+DX8U++zy6QhAF2vyKI3CX1SzUhQja9B9zx1pVJ7IVsIgJZ4Edf/eUq0ga8rZpZ+mTKkdzsziCQplfSQ5SUREiKOu0DPBVDRABA6WyNlHlUi1YoIXGfocwF97poHir3EPhw0jHtbrJUbD3zlBM4cxM8HdYdc1K7eou7ji3X5ZBeIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uo8Mv0D2r70UbdMK/P/Vk+E+XAdltSMPlY3GeqN5xc=;
 b=OtpxICKbzfgWWULzepW5BbgcqQMXO14SCQoUOABGokUpwnf2SWhWLRn7qrjJJGet9q01bLihuFL5OXvtYo+3qNFVNagXVxRpL9jTcRnILsXaSndYlHADX3hC/WnQs7wu6FzMHo1kLl5rrZMxuMFzxSuhUAGuKQ2vw6mnU9Bij1I=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
 <b2f750c4-3aa3-e560-626a-c7fa921cf4df@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/shadow: adjust 2-level case of
 SHADOW_FOREACH_L2E()
Message-ID: <b5a2eed4-0175-17c6-b3a6-1678244294ad@citrix.com>
Date: Fri, 15 Oct 2021 12:17:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b2f750c4-3aa3-e560-626a-c7fa921cf4df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0369.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bbe55a7-790f-459f-8b4d-08d98fcd630c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5032:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5032B7B55CD61FCD5689FE17BAB99@BY5PR03MB5032.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewfrKke1qpG/ms8Y+YQd288sz6WAAEaTkL+He6wsxgL+ITaxPRUhcLPP6G9aXj5pu5qfIWzjPzjYvU6T9S0VQrWqUuH+BLXV71yIYa4L0CLYdxWO7EjEXyfBQamhp36E2n1ODYoHIFqbf5oiqvGruLZZW7eb32aSqShiIprtiNQzgEZnax4s8CdKmhewFtSw4P5VbcXFz39DPstjG+ImpOBJZUQFGieE6+fKeYdcpJbPYJP017nXM0qJSvU8FQRpWLFNDn7XCXgsDc4jmbWivo3PNntsPxd0CYFWxmVFKMHaD/SV2ZGwscxBYbwKVijYblZ577VjJUN6qSxNdOmsCBv9FnZHC663EBsLn4cnv/DNiw2vlep/JQJySmDjTtF/rE9pzvZyEseVy3I/WGR+0qrYMU0txgjqWYFRk8SliibBtLumYqFBnyHaz0wERJXCSPoJimqBSY9tvst52KjTfctss9C1du3exr747wlMpyStGX4FfnVlBeRhzfkSxUNShsmZmywySyo67PygpFA4hOoNkq6d6MCknomtkUc5O95oLS7Ess6Nu76G8wKh81VFEjPcdrtJcUlAJCnwSX9sepOYNPIvGm9AGxiSjV4XawxdcIDCwPERNzVDaNXhAsLhzysqegOUyt0ldsRU3GYZcyYQODkvclgt7gqiHbI9wZZ6/3TOWO++DrVUiwsyKSRVpdRx5QE/C2ucSZ+uzMbmzQvN1HPQ/6MW7vX2WOQZblquREawDJLGiam1V5t+7H8c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(54906003)(110136005)(38100700002)(5660300002)(36756003)(186003)(82960400001)(4744005)(2906002)(53546011)(31696002)(66476007)(6486002)(16576012)(8936002)(31686004)(26005)(8676002)(66556008)(316002)(956004)(508600001)(107886003)(2616005)(66946007)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFlVeWV0cHNnT3hOWXZTS3ptODJsYkxoZ0xYUzJqU1F0ZFdXVXNRR2w4a0JF?=
 =?utf-8?B?SmQ0bFNKWXZITEZuT1FFdXMxUEI4cVVPVFpNeVhZY0poWmlFQkg1ZllMak5U?=
 =?utf-8?B?ZWcwRFVzT01GdVJ2d1IzbDVQaEVPTjJXdk05MkZBS0c2QitjZ1hraUVSRkNU?=
 =?utf-8?B?WFp0RUpPeTEwdkwzaGlxc0RobDZqOEtnMHpCQ1c3ZFkzTDhUZUlSdmg5YjZ6?=
 =?utf-8?B?UU44M0M1cmNqcUQ5M21hdWxWTkt4M0o5YWJBaWo2di9SSUo0SnVuY2tyNWdv?=
 =?utf-8?B?RVZHVTNIYkNBdGd6aDZEdEhPRGtnNThuQ0VyaHRGK1g2SlJvaUZSajlOMUYx?=
 =?utf-8?B?Ri9xRmpPa29zWWhhNHBEdUw5YkF4cDJ6K2hIUEZQNWl2SWxZYlpvMkdJOU9J?=
 =?utf-8?B?OWRuRnVMcVdsMzc3ZFRUNFBRWFBnM08rSzFVY1dwaDNKLzFUTXdVcDEzakFQ?=
 =?utf-8?B?VTR1ekU4aHNlbmlPSjc4RFhzUW5mMm1uYnVuVHkrV2pWQXBHTU94eGpFRGVL?=
 =?utf-8?B?a2pjZE12S0pUNEh1dmlLdEV4TXdMWGdSV3k2YW1zcDlJeC9BZlVrYVo3emt0?=
 =?utf-8?B?UndpNUhmdHhmQ0wyVnJDWi8rcDJ3d3NuRmsrSDJyRGdkTU9GanBYT0pWc3VN?=
 =?utf-8?B?RHVLMjdwWkpDU0RKZnJZNkthWjRFTnJWK3pLaVUxU1JTMmdLOEpmbUtJakY5?=
 =?utf-8?B?ZXFxdlVFUDVhZU10UXJIWnhvT2lkUmNnMnZiMTlxdW5QQ1BmMlNMYzJLSTRi?=
 =?utf-8?B?RTNlN0tBU2VRUVovNW5TWms3MWhadWlRdlRNOEhzUnI0cEJCNGU3RlBZRlFL?=
 =?utf-8?B?UnFiNFhYb2h5OWNwVWZqTXYyNStWL3NjVHlUV3VJU2FkNXJwSzRHWGVKQXBq?=
 =?utf-8?B?SUNQbVZSZThueW9DVE5Telo1S0tuZUZ5QnQxM2duc0orVUsxZHhOTG8rOG9n?=
 =?utf-8?B?QmxBNXVlaUczR2gvUm9MMkV3RTdUTENOS1ZqeWl1dWhoaXN2Mm5HenM3L1hy?=
 =?utf-8?B?eXZ3eW0vYVBoRFVFSUR4UWJyNks2aWkzeFpUZnM5bXdNYVR3aG1XM3FpRWVU?=
 =?utf-8?B?QnNEUjE3MzZ5anBXTVZKWHExVnNBWWRvcGlkNUhjME5BQmhGM3Fjem9lRWND?=
 =?utf-8?B?cXJSMFZqaUhOZnFHS2JJTk1JVm1paUpka0ZyYlVXaXN2dW4xbkNkSXprVy81?=
 =?utf-8?B?T3BsVGNvU3pCcmJVNmxWdUpXK3lOK1RNUVQyaS9BVW91cFUyQ0ZVMnp2VW0r?=
 =?utf-8?B?SElKNEpPeGFrb3c3cVJPTzRDblVPcnJDQ1RmeTNLYzBBQjNtSElKaWpoNlFR?=
 =?utf-8?B?aGF6RklQTmllMlFYOGl2elQveFMyUHoxNjM5ZEZwVk9uZGZGWG1EUXVkTEJh?=
 =?utf-8?B?YmR0UFZlRFc5Q09vdG9Nb3JTdHQxblN2YmdSVVJpTHdFQUMxaDFmVzZvaXND?=
 =?utf-8?B?WkNINUErM2NSK1lWUjNDM3hweDdoWkEzbm80Ry9JWVQwZmJLNTU0SVFaNzRk?=
 =?utf-8?B?ejRJTVdIZVlMRWE4ZUVDc3lTekt5RWFZQTBxMldPd1JRckRvd1ZLU1ZzUHNM?=
 =?utf-8?B?akpqd1ZTejlrR3NBZU1JM3RkaUVOMlE0K25yeGZwT1o5MWpzL3BDZm1EU2NF?=
 =?utf-8?B?emVDZmNxV3dyWlBJYUVwR1E3RHRqWWV1WHpad08rSGR1eUM3VTdQcDVzYkcy?=
 =?utf-8?B?OFZNVDlhU2ZEQ0dCSW9UZlcvbVNjeEh2WHRhejJFVUdmMDhsL1FiZkRvazZm?=
 =?utf-8?Q?b0SFvz/yUJLRVn7C7Ya3ZtB9au1k0/QcXZkQgV1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbe55a7-790f-459f-8b4d-08d98fcd630c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:17:34.3899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGp9tjWEC6Opigsmq6swRFcamzwaqIXQlshhngAZNOdZEvgPgdvFlnHev6x3xo+HeVMGk5wB7eyKNnC54SsIxly/qG1X96i6NSxpCGpvXGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5032
X-OriginatorOrg: citrix.com

On 13/10/2021 16:38, Jan Beulich wrote:
> Coverity apparently takes issue with the assignment inside an if(), but
> then only in two of the cases (sh_destroy_l2_shadow() and
> sh_unhook_32b_mappings()). As it's pretty simple to break out of the
> outer loop without the need for a local helper variable, adjust the code
> that way.
>
> While there, with the other "unused value" reports also in mind, further
> drop a dead assignment from SHADOW_FOREACH_L1E().
>
> Coverity-ID: 1492857
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Looking over other SHADOW_FOREACH_L<N>E() invocations wrt their uses of
> "done", I find the audit ones particularly odd: The respective variables
> get set only from AUDIT_FAIL() and AUDIT_FAIL_MIN(), but in both cases
> after invoking BUG(), i.e. in an unreachable position.

Sounds like there is dead code we can drop.

This logic is all horrible.=C2=A0 I think this is an improvement, so
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


