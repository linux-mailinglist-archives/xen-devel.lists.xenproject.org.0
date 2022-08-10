Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972558F22F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 20:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383806.619004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqDy-00031g-Ah; Wed, 10 Aug 2022 18:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383806.619004; Wed, 10 Aug 2022 18:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqDy-0002yE-7E; Wed, 10 Aug 2022 18:14:34 +0000
Received: by outflank-mailman (input) for mailman id 383806;
 Wed, 10 Aug 2022 18:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLqDw-0002y8-Vh
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 18:14:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46c06ae0-18d8-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 20:14:31 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 14:14:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6711.namprd03.prod.outlook.com (2603:10b6:303:17a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 18:14:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 18:14:25 +0000
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
X-Inumbo-ID: 46c06ae0-18d8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660155271;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mo4QdnL8Asg/l2cDu1TAiBlnUnWRxIQ963jSg+8Dnt0=;
  b=S2gmNaJG0d6/TlNyKntc1BXeHR50daoEddcwCJp5dzBEPIOELF94QGNo
   UZ/ufzX08/Pf9DpqmrfXEEtUPvD7ncAmltnBVtfyrYd0T70XD1mluWP/H
   SRiOMLgefcX/twtdUgwhCdziu2DQgJM1T4bJ8phFAOnXZVb317fQM/OlH
   A=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 77809786
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:th0aIKu7VZ9S5qIT1rapUbm/w+fnVE9fMUV32f8akzHdYApBsoF/q
 tZmKWDXafiLamb1Kd5wOYSyoEIFv8WAy9dqSQJvr300Hy5D+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4WtA5TTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZAh37Y0Am1Nz
 9EZBiIXTgyct+eG3K3uH4GAhux7RCXqFKU2nyg5iBr+VLMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QzT/PVti4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91rz2b+XzHyrBur+EpWgz+Bl3maey1cwI0crVhjmgt3jlWSHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHbihdSwIAuoDnuNtq0UiJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:6ttC1qwf/MQZynE6EsMtKrPxBOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MJ40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH5AJlO+1GkUKp
 goMCju3ocRTbpcVQGBgoBb+q3pYp30JGbffqFNgL3P79EcpgEF86JR/r1iop5HzuN8d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqYndydvaD6Dg9qFC7q
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXDoxttF75Z0t7XgTP6zWBfzA2wGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIkeu8o9WViJvsXXQ7ea/tDzYbLWPv7gADwkUmTwDj
 8KWyXyPtxJ6gSxVnrxkHHqKgfQk4zEjOdN+YThjpguIdI2R/xxWyAu+CeEz9DOLyFeuaore0
 Y7KK/7k8qA1BuLwVo=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77809786"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpQLvtsoI330uS2GWtk4R8a81/oQS94Bf/mP/EsNdAxonI8DMJkpZ+nIXsFFGeS93XRGoAtl93kZSm/+DMBJJZAyU3kbMHq6Hfi5yUMnIrB2yqkjgnB7BoxoHm+9+fSXdhWqFjw+NvRczqfOG+64prHjZcp2uN8Y1tbSOfxGOzTpXZpy7qvf8Hp/WgptnSRURlGPddz4vQVH6HeBKsS51EULQSXBOCHfSfE6c1b/h4+6RkQmIMoWQLp+bcX2K8DphCiRNb9gnTMxkkFDZVk8YyJc7wa3DSDSJohdWqA+40wswwlq3USwWdskNVPuNraN2LZNPuh3Jb96ANu2oU77pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mo4QdnL8Asg/l2cDu1TAiBlnUnWRxIQ963jSg+8Dnt0=;
 b=HZOCHq0/HatIKW0xXYnoOIvaxsI1rAD1oOdkJ1AKJgjI22jh2IF0F0P7CrC56B/tg1FoxLSLGpeBY00m1FSLEYvWZPUlSzpcSB3KPyvFW7xwKNI+n6G/BbqxZRxez3i/Bhj3NT4ggVTnk3W/A5ZfImFVSqomtCUV9Dc1HhXlKsdfWUyi3uwiSVYvAgjvW/G8J9QbuBB6MQSU2/tUEUOtuzCzV2CfXEkgre9/zefkPi91iNJSv1DLoU4UkSHFf9liHlcO0qzDCQLqTJ0wlZgXOQ9LO1ym9+3zHtYheC47K4WWTlC9iqNict+QVtXDGVjUeyTd+9Wo/9WQLQWkxVe/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mo4QdnL8Asg/l2cDu1TAiBlnUnWRxIQ963jSg+8Dnt0=;
 b=Gdv7qF79lUTbKm80RzHpg3nXR6qC+j5HmIJT+rI1/6wqtUcGMr+X8LDcOOoZGJEw/LprLMkS7ZjJ75NBc/BSsn3GyVMG/sakJLz+/4C+Y/hq6ftu5IJjl5Q52D0cxoA6mlWdlzpI6zpDtlK5U7ZYfgBXjZgMvKvCDGeNr+gC23U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 05/11] x86emul: handle AVX512-FP16 fma-like insns
Thread-Topic: [PATCH 05/11] x86emul: handle AVX512-FP16 fma-like insns
Thread-Index: AQHYgKLMYZVUVS03kE6CW6Ot9D+s3a2oyMWA
Date: Wed, 10 Aug 2022 18:14:25 +0000
Message-ID: <f6ced614-4ade-8993-bcb2-1ea5a0378080@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <36fadb47-32a2-b06e-4cd3-218635ef8aeb@suse.com>
In-Reply-To: <36fadb47-32a2-b06e-4cd3-218635ef8aeb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c49370bd-f380-46e2-fe78-08da7afc287e
x-ms-traffictypediagnostic: CO3PR03MB6711:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wSrjijDMkF1p5//kIsbe8AX5QThWQFhy7a+P+V65jRo/55FuCAHjmlf/emgz4/WS6Nw3oAQjq4xI1q22yZQIgVEe/U/OqmR3w8dernX5p1Bsw/X+xGWIfslSWHLIOqxVCF+MRlxA9yMI6/R65wkV4YHDuP+XS1VRCpk4Y3mtq15cOSVugS7+RCOUko34Jbc9AX7kKj2an3dQHF4TUtojUZw8OefKxDihNHtuS4sfI84G5dNihVdBG9yZcMMVK5sFmvH5s4/omqBYhZUbsArz4ZHWeVmaSTSgWMC4yBk75J2oTLNUauRNUzjLYE2PzCIl+Uf5gcohNFTI777Hz61fn8bYh0zahxWRH/Ey/5tmfsHzkoOpx4N2fzXooZ9VfxH/pLdGwL1FDpzL4Jdq7xvSDsx19BjZHaUDmaSgbs0VLuK0IxJm95Q66UqSzimKpu9GhecpxX2SfkDmcNIiQunuJogOLEMWzhZ8ujk/8GCf2T+i4Z0ZiyxMGlChnEenBwKkNB80FFE2aZe19p7uQEuI5VM7PJanlUXu+wawc+LBfcuxShq+KTrMxBCs3BLJMB5eS50otGS7aUq1iMS30KNpQqFJ5VqjKcJcZDC8nn6MEr7FX15PRnLPqCHT+zkt58gzrJP13PynGN1DM5JBKZDjgqyOxL/K/RsgapCP13REBa48LsyMs8iyEKi96J0naXr7Xu1e7Mh4ltrKX68Bx+X7UlLCnwwedEzAnoXl1fH84vPBubUGp2Mx20hhPqI0jBbAf3Sy5z2LVIFYibthxEm0Q7qt+Mkx/b5ZZ2OVyqBH8eYNBKZoxVWPQLteJTmuYiwGquLSMlwQ1z0bdK+5cO3P3JIxEJdAAHG0UZwwkdVlDcKl/+NhPhw06gs9sWDyvKLS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(8676002)(6512007)(186003)(26005)(4326008)(64756008)(54906003)(316002)(66446008)(107886003)(6486002)(2616005)(66476007)(91956017)(66946007)(66556008)(478600001)(76116006)(36756003)(110136005)(31686004)(2906002)(6506007)(53546011)(41300700001)(8936002)(82960400001)(31696002)(86362001)(71200400001)(5660300002)(122000001)(38100700002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nkc4eHEzR3ZUNUNrMGZBMnA4QmNyWWZzZmtkMCt5Z3drMzhyVW5FTUZFTWJh?=
 =?utf-8?B?YXVsclk1WkxEV1hmOTNDSVVFZXgxUGVCVVZWN0ZtbDRkN0R1VHpaZWNLMnBX?=
 =?utf-8?B?VEhzSDlJUnowU0crUEZoZ2grS2FHZ2tCNSs2ODR6YUpkaU1idmVyNjBTNC94?=
 =?utf-8?B?TVBneE0zRzEyQWxBUCtvRmUzemJpQzVIbXYrV2dadHY4aE5YVkJiNVU5OXhN?=
 =?utf-8?B?T21oVnlFVi90dHEzMnhyNW51Q3hqamNxdnQ0T3YzdHovMjBGWG4wTjNrckxq?=
 =?utf-8?B?Q3k4SjNJN3R2QXQ3YVZWWU9tQlpYMnp1VnFaam1vcDZEQkFydzlNQnJSZVoy?=
 =?utf-8?B?eEVHUHZKa0hzcHRuZFBTVWR0YnUzdmFLZis0M3l3MHFWOUVyeUhxcmdseS9G?=
 =?utf-8?B?azBxOTRQbHFmVXJHMWZVY1VpOFZlTXp4NTc1L2g4c2lkKzFlTzcwbHUydnlp?=
 =?utf-8?B?a0JqTW1QL1NIUmFkVk5nTERRUGEvWnVRZ3VZVFNvVVA1SUJ5c0pDMDhBbUpY?=
 =?utf-8?B?SHFFMm9FdUxHdnBERUpJWVo1czF0L1JvdGZvSmZ6by90MnloU01ldDlNQS9M?=
 =?utf-8?B?MzN6TEZTK3lXZ0VJR1VMV1RQd2N6S2dOYThpVXNJZzNIQ1ZUYStnVHdobkk1?=
 =?utf-8?B?eVBrWm1NVTlWY3d6VTZ0R0JzelRYMnFQMGpwMzRpQUE2K1JxcjYvcUFYTUwy?=
 =?utf-8?B?eTl2WC9hVHdjZmduRmpTZjZwcnJCL0ZaVjI2d0ROdFd6WGdlQWhIMXVzNjdn?=
 =?utf-8?B?VFVQS0NjbGRIMS9jR1hJSHZVMnhCQVUxbmluek5BWlkrVHdnZm90dFJ6T09s?=
 =?utf-8?B?akNyY2RSQVlPZjJzOVNlWFBPdXpsWkdkamRRVnR3U0FvTEFianlJL2NSa2pj?=
 =?utf-8?B?UVhJQzMwTzk3MmNlREdVQ2JsUFJtYVRKb0Q0Z2Z0T0ZrZ2ZkdUJBZE9KNXZQ?=
 =?utf-8?B?c3JZZzNKNVhZdm5YSG1RZUx6c1M4dFJVLzgzQ3BYQ01VOGNhNGpDalduLzNi?=
 =?utf-8?B?cTZRaVBTcWU3WmV5UjIyT2xqREhqL0NJaFdJY3N3a01UVkF6eFRwTzRaenNi?=
 =?utf-8?B?NG9ZN3dMcUZGdDF6YTMzTXJOT0Q1UjRVVmNkWHRGVDhxbkFEa2pxNkRRelJE?=
 =?utf-8?B?OUg2K1pqTzhrOVUxQmt4aWVLL3Yva0x2NjlPRjFlSjd6c1hyK1FNT1g3YnRM?=
 =?utf-8?B?MW1aWWtLM05rMkJsdW9kYkNhdHJKSWN1YS9ZTllnQW1zVXpxVlcxVjFsMzQv?=
 =?utf-8?B?d2RMdnpYM2JKcTZ4Vk5jSVRrQ1pGL3NwbFZ2NUV0QzBGVnVDbVZVbi91bU9s?=
 =?utf-8?B?MHRybUVCcUNYVVNBaU4vNFprM3JINnFtVS9xSlhnTGN5bUVUSldJeFphYkJT?=
 =?utf-8?B?bEVtcy9aRUY2M3Q5M3FpYWZYNy9zOVU2WjBuWUwrNVM0UGhnaFJoQXdkSWh0?=
 =?utf-8?B?R1BVOW8wMXl2ZHB6Qk5zeTlIZFZPenJualNDaGNETUE3eWE4L2t2eG5iN2lW?=
 =?utf-8?B?OUlkTmE4ZGFKUlFTY0cwY0xrbFlkYy9YNnF0bmJ1UDFOd2xxYVJtMXhab1hD?=
 =?utf-8?B?WjNZdTU4YjFLZlpMWVZad0hkSzdzaENPelRtU014bTFUTklCcERKb3R0aWZM?=
 =?utf-8?B?dDQ2anBmeTNMWUJHM3J5OUxNam9hWnNDYXY0RGROQlh1UEs4bFhMbGRqYUVE?=
 =?utf-8?B?UHZDUkVLTGRTMXhMeFBZU29leCt2aC9QQk5FekFsT3Y5dVZLVEx2bE4xNFlL?=
 =?utf-8?B?WXN2ZVhMMTdJQy9iZjI2RW52MkhUeDRUdHJZMUF1d1kwNkFORHJrUUt1TUla?=
 =?utf-8?B?OEhDRkY2dkduQUoveWdUKzJlTmVEZHp3WnVzY0xaYVptRXF2NUxvVnRSeDVr?=
 =?utf-8?B?Ry9lMTR0Tm5YWS9FV1Vwa3l5Y3RGTlFMOG9TSU0vU1lJelBRM2V0RnI3TUFa?=
 =?utf-8?B?RElBV3R5ejA5dHhSVjVnQ0pnUXAvZENJSmNielBJQ2xPNmNQWXlQNFlpVy9B?=
 =?utf-8?B?SlJkdFlPNjJteUpDQk1tQWVPY2N2cE84dlh5cXRTeHNaM2l0OFk3U1FpaW9Z?=
 =?utf-8?B?SjFvNXFWMW1EWnZwVW5vZ243eEppQmpmQUpSN0gxcFVqa0tZYUkwaGg1M2Fn?=
 =?utf-8?Q?iPGxqhS3K8xbgUNVhcFdjANzQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0BFDBB17257BA4E97C8415F14137433@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	INLeksp0DR9n9fH3/R/WihH26lATddR2qmNf2FJlZph2T4L5M1YPkp4UvaRdKRtk1KueyHahRFp+262YyVP+ok7TwtRQhDvpZDSxw1CTb1RjqOz7sc91h310ZHFh1D7PbARYXeeFqB8Cxg+qbS7clKDRPHeZ5NbS++TC3Jj25cSj1NLHo9JMkUQpeVM0oirp/IXNr/g5wV6SHA5Iy1FAuoPsIfG3Tk1yW2MlXNRdXDjbGgZcSmNpaa7XvWT3KDpK458VGxz8qfF+J0o4NezwFKaZrF53xRMz38/4mw3mUaIQYLA3ihrXgNY4cr27H1z03nAWovXlB71r6kaAXsz0zMxob9tIt5S+rgkGx22KKMNhBoMaJO4nIj1/ULST8Bu2H9kZhl4y9gueZu4yh/9SNmnBObnDhcjD1T2FpQdfmra5LXREuezabz+9pQKSBQotGLVbof4vMvSZb7NQYzaGEtheAJCACW2gDM6slE6netjU2qJaoqfreFZb50yKY7MROJjbj87BqrA+LJvyzVcSmpwhWG/ZZBuD24srOQqOKewyaqWWGQ8/R9zKCE8Zk7p9PEhHc/x4WTGM05w7U1tjgcH5XfOOtpurSJyNdL3Zg/PmheA8WRQDJltJOrvJsKGNXfzpPp7kS8kHYtyRpFzjUHqts3iTnkZsZjDQPBPuiR0eCARZ7V5I+chH63iRUynZeMA43D2SBI/DRXr4gCiQ0jFwvtEgIYNofA239xXdv7MH2u7RK/ia+QK4Wk8fasugNG78W7GVgnoT6xUb0j0H0zuRp/WEOLmSuzlGscDWrdChycN4V7VCwfLtZ1Agt/z0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49370bd-f380-46e2-fe78-08da7afc287e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 18:14:25.5792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGzGRw3Bi6pTZJ7RGK4QQtjb2OQw7yVeWJJq7ZvsamXbhHOK8I18ZkRpbZmk1ajr2vQGQ1thQNstVf5+rIC4zf/5CpGLX+jaQyfBG8sqY9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6711

T24gMTUvMDYvMjAyMiAxMToyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBNYXA2IGVuY29k
aW5nIHNwYWNlIGlzIGEgdmVyeSBzcGFyc2UgY2xvbmUgb2YgdGhlICIwZjM4IiBvbmUuIE9uY2UN
Cj4gYWdhaW4gcmUtdXNlIHRoYXQgdGFibGUsIGFzIHRoZSBlbnRyaWVzIGNvcnJlc3BvbmRpbmcg
dG8gaW52YWxpZCBvcGNvZGVzDQo+IGluIE1hcDYgYXJlIHNpbXBseSBiZW5pZ24gd2l0aCBzaW1k
X3NpemUgZm9yY2VkIHRvIG90aGVyIHRoYW4gc2ltZF9ub25lDQo+IChwcmV2ZW50aW5nIHVuZHVl
IG1lbW9yeSByZWFkcyBpbiBTcmNNZW0gaGFuZGxpbmcgZWFybHkgaW4NCj4geDg2X2VtdWxhdGUo
KSkuDQoNCkFnYWluLCB0aGlzIG5lZWRzIGNvbW11bmljYXRpbmcgaW4gdGhlIGNvZGUuDQoNCj4N
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPg0KPiAt
LS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUvZGVjb2RlLmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL2RlY29kZS5jDQo+IEBAIC0xMjMxLDYgKzEyMzEsMTYgQEAgaW50IHg4
NmVtdWxfZGVjb2RlKHN0cnVjdCB4ODZfZW11bGF0ZV9zdA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgZCA9IHR3b2J5dGVfdGFibGVbYl0uZGVzYzsNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHMtPnNpbWRfc2l6ZSA9IHR3b2J5dGVfdGFibGVbYl0uc2l6ZSA/OiBzaW1kX290aGVyOw0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgY2FzZSBldmV4X21hcDY6DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBpZiAoICFl
dmV4X2VuY29kZWQoKSApDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICB7DQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmMgPSBYODZFTVVMX1VOUkVDT0dOSVpFRDsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICB9DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBvcGNvZGUgfD0gTUFTS19JTlNSKDYs
IFg4NkVNVUxfT1BDX0VYVF9NQVNLKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGQgPSB0
d29ieXRlX3RhYmxlWzB4MzhdLmRlc2M7DQoNClNvIHRoZSBtYW51YWwgc2F5cyB0aGF0IG1hcCBz
cGFjZXMgMiwgMywgNSBhbmQgNiBhcmUgcmVndWxhciBtYXBzIChpbnNuDQpsZW5ndGggZG9lc24n
dCBkZXBlbmQgb24gdGhlIG9wY29kZSBieXRlKSwgd2l0aCBtYXAgMyBiZWluZyB0aGUgb25seSBv
bmUNCndoaWNoIHRha2VzIGFuIGltbSBieXRlLg0KDQpJIHRoaW5rIHRoaXMgbWVhbnMgdGhhdCBT
cmNJbW0gYW5kIFNyY0ltbUJ5dGUgd2lsbCBjYXVzZSB4ODZfZGVjb2RlKCkgdG8NCmdldCB0aGUg
d3JvbmcgaW5zdHJ1Y3Rpb24gbGVuZ3RoLg0KDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gICAgICAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgICAgIH0NCj4g
ICAgICAgICAgICAgICAgICBlbHNlIGlmICggcy0+ZXh0IDwgZXh0XzhmMDggKyBBUlJBWV9TSVpF
KHhvcF90YWJsZSkgKQ0KPiBAQCAtMTQ3OSw2ICsxNDg5LDI0IEBAIGludCB4ODZlbXVsX2RlY29k
ZShzdHJ1Y3QgeDg2X2VtdWxhdGVfc3QNCj4gICAgICAgICAgICAgIGRpc3A4c2NhbGUgPSBkZWNv
ZGVfZGlzcDhzY2FsZSh0d29ieXRlX3RhYmxlW2JdLmQ4cywgcyk7DQo+ICAgICAgICAgICAgICBi
cmVhazsNCj4gIA0KPiArICAgICAgICBjYXNlIGV4dF9tYXA2Og0KPiArICAgICAgICAgICAgZCA9
IGV4dDBmMzhfdGFibGVbYl0udG9fbWVtID8gRHN0TWVtIHwgU3JjUmVnDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBEc3RSZWcgfCBTcmNNZW07DQo+ICsgICAg
ICAgICAgICBpZiAoIGV4dDBmMzhfdGFibGVbYl0udHdvX29wICkNCj4gKyAgICAgICAgICAgICAg
ICBkIHw9IFR3b09wOw0KDQouLi4gYnV0IGhlcmUgd2UgZGlzY2FyZCB0aGUgdGFibGUgZGVzYyBh
bmQgY29uc3RydWN0IGl0IGZyb20gZmlyc3QNCnByaW5jaXBsZXMuDQoNCldoeSBhcmUgd2UgcHJv
Y2Vzc2luZyBpdCB0d2ljZT8NCg0KfkFuZHJldw0K

