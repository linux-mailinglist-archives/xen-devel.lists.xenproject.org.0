Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF7519CF1
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 12:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320564.541356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmCHt-0008MG-Ao; Wed, 04 May 2022 10:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320564.541356; Wed, 04 May 2022 10:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmCHt-0008Jv-66; Wed, 04 May 2022 10:31:17 +0000
Received: by outflank-mailman (input) for mailman id 320564;
 Wed, 04 May 2022 10:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmCHr-0008Jp-Nj
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 10:31:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c7ab4e-cb95-11ec-a406-831a346695d4;
 Wed, 04 May 2022 12:31:14 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 06:30:59 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6508.namprd03.prod.outlook.com (2603:10b6:303:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 10:30:56 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 10:30:56 +0000
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
X-Inumbo-ID: 51c7ab4e-cb95-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651660274;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CaNuGWRVeYOwtVEMeVDPqTIitrmDjgSOdjbtrA+zmKs=;
  b=HZenvrG61bSqrZXtgJJLO7yPn67jd3NUjvNFs8FWqfSlIO8q0tEo65tS
   rsMGJ/LoEa6+hM8bG1fhsBgfrHgTrtj57D4R19qFqXPrZFQwpCBrW23+0
   cvVD2jZzaosGho51+T4RSxfSK2ypwwPQkBm0FZHD+PkGsU8EdwCBWEblM
   4=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 73015646
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ckugqaw/miAEWAtvfbB6t+dBxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 jYZW2mOPvyKamCgfo1watmwpBwPvMeAztY1HQZoqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12YThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpluZuhTFc7N6/1xsMmaAN7QismA/FKweqSSZS/mZT7I0zuVVLJmq8rJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTu48wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKGUB9QzJ+8Lb5UD8kSo20ryxKuDIZ8eOZN9wrGmU9
 mHvqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJt//YS7QiMzu/e5VafD21dFDpZMoV45IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLTsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:eF6Z3KmyEcHVoTPjBN1AdsmFmaDpDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.91,197,1647316800"; 
   d="scan'208";a="73015646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm6NhCfLYLHMJFV4fu2FAyrRiYmkV7YbPAgJyahrQYX+r0AZLf6b6oVdeLL37qJIwpOEWm7mc7oKWAU6dcV2wMs5hcwjm7IX81X9K4O8kcWv4xso8U1dy+jCNI3yWEAcCZWQKoT/AUAP/EPQ2B1vCwWv5RQ9tTtrSzZtlAMt0sEyd0bYXKdWqNm3lnUWY5/+zBiK0Hr7JCvKlKbn7lzDqrddgFp8vPQezS02oWb1uL5sjpjRRU08WC9anznUN/33nxIAvMxsM+Hwyj2AKPvB5DmFHQ5q2MLLEJRN0gpWlQZAFiDJDxN5h1AFhT2Nn1yUMSxPMnIbG+3Pu0Ok6SC4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp+XssVel/hGWX2ziOq47qLGBWP2xQ/XrCSD0AYTXbU=;
 b=LvFFlJG1oFMQDOxEIXJ38F4pGao6FZlwrvOZDoNMAAY3xP4G3Vlq8ARouqMNNmGp31zdLsNAfRURtMKgtXoa9UM1X2DDfYZ182bvCBAOs1pfJvp0WuRYcCAPKjBLKl39zDN7fQUAfraIQJP8XBvDN3Pti1GXcZ39ZaEFbvdDJlbaMxDH/ZVFQBQPBQF2184oUxJEbIwTirSuguZbDLIEDIDkTzBLRiRQxxkDWeEUN1Rlhja9IS/VCv8rXVAXIM7zAuj2NatNco1akzYZO3JZTF/0cqPLhrUTK3YPkD7DkceO1dsj5Pu5wCEyXljT+KfbN2mjBjXQT+oUWWcBLtcAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp+XssVel/hGWX2ziOq47qLGBWP2xQ/XrCSD0AYTXbU=;
 b=kVKVMgumJy5lT5e1c96ebvNqG/jhkzVISL/Xi2+G+J+sTS21Xj2vq3K2FvWvh3bty8LP0G+uqGCR/nem8ikcrEP0qAYXwYxtMJZLvTyaqp8GsLz4VM/Q6dVwk0aTIaCigUhhjaYW6gkc67c2M7NlhUKh2ttZcKke6lW+dcY+70o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 12:30:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YnJV3EYq7E+4ajPN@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
X-ClientProxiedBy: MR2P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2ba0aee-e82d-4aba-2d7a-08da2db92ca5
X-MS-TrafficTypeDiagnostic: MW4PR03MB6508:EE_
X-Microsoft-Antispam-PRVS:
	<MW4PR03MB650866652B7068D9D1D75EFB8FC39@MW4PR03MB6508.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m9Jg3NFYWLtYiHD7VqQL8GWgjJPipp/0YgtQO1iceCKQcZ77r5f5f147Fw2j2IsyIlX/X4xzLsgrRw6iiWMjSWVYtV4Lc5DsG8+QTbzvtNA0dfd2Okp3uICYcJP7WRpc+dqAqJVKlk24rhP6wiBGGYp0JBTSSQB9O0q8xq7VjDGv29U1PbjU+TUTEzjiJu+z5ddjtTzHosdp6VU8V50/GZ7oZIfAwvP9KpFNWRaJfiW7vKuHBVyBdLjEmSdxe3oUyvmVnfyauqKOP9MaISp4x5yDiRXRjY8iEqLfM2KJyhTsCLxGbxmtWF4WVidc5g34hl0Xc7Wm+iCvgUxT/6xvSNCsW6HL4qpHN9xRHLyk4Ur+uYjFF7EQGTkyVwDPSVH2QwNKtsHW8iVF6gcsQekniGwpPGS1qU4RQDYRT+TubOIO1LJNbFkdZgqOlHeEA5KxQzjzq8/J4WMAjsCPNEaaCzkOYXvIhRqryvhFimUdWRpOD2l5Ly1ILukKJfcJfJCAjSz5sxXBWb2PjutcDQguFXEqvUtZJsUqjNfhat3mHs0sjqGBMqjft/qOnfHIbchGLcaaPo87j0fzqcu2qvHrmYSdUS4zQlCX/mJcbG+07bF7lNk0lJW2xDFcOVfsQjNbCptX3wRq0oR/l11RcLH0AtVwEQAmRXbFjAhzk/v5U/3vPpxncV3YWW/sZMqh2+sWrsp1f8D2lNKaRfaSI38SaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(66556008)(82960400001)(4326008)(85182001)(8676002)(6666004)(66946007)(66476007)(33716001)(38100700002)(6916009)(54906003)(8936002)(5660300002)(508600001)(86362001)(6486002)(6512007)(9686003)(26005)(53546011)(6506007)(186003)(83380400001)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0xNV1VHRlRmWEptODhmR1RvcEVvaVFvaFVEYlpGLzNvNXRvZ3NEbG9vVmtj?=
 =?utf-8?B?VndrNnFXUmxSVjhlaURFck4wR3Viek9HR2EvemlNcTlrdS9rZzBmbW81ZFJt?=
 =?utf-8?B?UjE0bGNZNEVlRFFtMTVYZ0NwR2ZuZFhLTWtIa3FMSHBWYnNHSXp0eVFEcSti?=
 =?utf-8?B?RDcxbFh5YWpwZVNXM3Bwa1Y5cndQMDJQcjFGWXhBM1hnNzdJT3hGQnpsMTFE?=
 =?utf-8?B?WU9uSERhbzd4NFFmaHF1a1pNaWo5WXE1QUtRVXFWcDlaSU52RVRRcXE2bjkr?=
 =?utf-8?B?d0ZqZjBBRkpuVjBtTHoxdjdaTlgrYVZhdGpVc3BPemp0MFdjZjMxMHVYMHd2?=
 =?utf-8?B?aG43K21PL3hVZHV1TFVaSDZlb1k0ZGF1RlgrS1BmV1phVFVkVUlxQVhpOHlI?=
 =?utf-8?B?cEhlZ2kxdS85RUVEWUZSYUNpemFEYmlTeTd2d0c0a2ZLckdySXVrNUZKTHhw?=
 =?utf-8?B?THZ3NVNmeHlKcEhtOWt5eGxueEFtNjA1eGhqSk5UaUNZYWtEbEY0V0FNUFhN?=
 =?utf-8?B?K0NEdUcraFpraVBHclNXVUJqaTFWNDBlNTk2bERZeTRjR3RXa0FCTEYyS25l?=
 =?utf-8?B?SXFHSTZhZVNNcFhtV1pRUTNuTFY1VjlSVWx1N1gvL3A4UEVWWm5vMDQ2SFhs?=
 =?utf-8?B?VDBFd3Y2cGpwVW84bk1nUWliM1IwK25GTUlodTQ1L2FhOEpvMWZYRDJXUXNT?=
 =?utf-8?B?bnVqZGpZMThwaS82V2hSVHdQVW9kZ2MyQm4vRFhQUWRkTTVZRUNaMzR3RHQ3?=
 =?utf-8?B?Sld1ZnFlR25Ta1R2YnFneTdkTThHQXZMU045YytZbmVqWE5oMVViWEdjS0x3?=
 =?utf-8?B?b1Fra05Xbk5RaUdGR1UxaTMzSklrYlRtU3ZSU1V3TU1xYkdBa1VVNjdXMVNJ?=
 =?utf-8?B?M0gvcUJMOEdhdGVFZFlSdS8zbTR5MHVvTkpySHd0OFdKVW9xVGdWVml4WDlU?=
 =?utf-8?B?VE12QTBiZEUxamRrRlpBZmkzaTNMQUp5dUNocExMVElheEVQR3IyN1RLRG5k?=
 =?utf-8?B?T0Ztc1A4Yzhvc0pmZTNNTW5XZVVpbjRVZmhta21OMUFtZWtoRndYWnFsTUl4?=
 =?utf-8?B?ei9pSFk2aUhrQWRzeVhMR2FmM0hIcjNLV1RNaG5NYytrWkJlTzhDSlI0YzhG?=
 =?utf-8?B?WXhBRWx1bW0vMExocDNMVG41cWtwK1lKa3c0WG02Y0JabmR6ZDY5WXIrMllN?=
 =?utf-8?B?N3IyMmNuNWNPdWR2KzBScFlXSytncjNuWVRFSndBeFQzd3o3dGhHTlNHNExG?=
 =?utf-8?B?cnpmL0RTcmh6aGtPU3BrYkRKUHN2YkxpRW8vcFRWaHBnVi96Qzh1YkhZT1Ji?=
 =?utf-8?B?MFk0K29OM2NpYWphT01lTnZpM2xqL1VmaG1nYVFuN3k1c3BCU2F3dkdobDdV?=
 =?utf-8?B?K1phaTJyMTFuMTlHMUxmUWxuY1EvTCtuaGV6c01YWEVaSld2eWczcGt2Wmpu?=
 =?utf-8?B?Q0VMelNaUTYxT25XbGtUaXc5ejFwYWkzYXNSR0xVVkRNa1NUbW5kV1lxU2Fo?=
 =?utf-8?B?NTJSRVZxdVgzdmNkWWU4VkRJL3JCdXh1OFFwaEFxaWo0MXhHQ0V6Vld1bWNp?=
 =?utf-8?B?NklNU1B0Y2tEUVU2Q293Y3hGREIyOTdBTy96ZWM3ZXoyMTBYNndFN2pmbDlR?=
 =?utf-8?B?dGdBR29DbzVidWF5OWt0L250VnBCbWVEa0VyOGFuZDd1UFo5SDNvV2FOSFQw?=
 =?utf-8?B?cjNrRDNFTXdNWWZJUlIrY0NNVTZNVHlyY0x3ZVo0V0NEY0g3Y2ZlMXhpYUI4?=
 =?utf-8?B?MHRrS3dlUUwzQzVHN05NTDcrcGJNM29DVTdDa0NwcXpyS09XZm1mcy9NK1FK?=
 =?utf-8?B?M01ubkpWZXpZNnp5UVZsOWhFcERPSE5ZQkxXTlFEcjZKZFRRcFVtVlpFanI2?=
 =?utf-8?B?UWw4VGRSbmhQamZqWTIrTzhabTJKMmlaVzhzeTlhZTFYYjhCSDZDcml4Zi9k?=
 =?utf-8?B?YzJ0M1ZZckdXM3BUVHRkZDNQL2h0Q1lhTFpxcEEyR0tIZmxqZDBKaTdWVEhu?=
 =?utf-8?B?bWF2dnZyc1ZhRW5FWkVGNCsyVTFoS2FRQWE2V2hVY3k3K1cwRTR4Nks2SE5Z?=
 =?utf-8?B?SFcvb0EwN0doRnBBTVQwVlBGUy9EV2Z6VkN5VEJQeFZjS25Ta2hkZ08xVGxo?=
 =?utf-8?B?THl3L1BvUkF0TmVLSjVDNUFBaEd2eTlCNHVRM2QrcWVHUGZMV1Jjbk9zdzgr?=
 =?utf-8?B?TTFQMFI2RDFtUnY5WE9BOFRjZU8zaCs3NE9odHhrbWhDTG91SElXT3lkTmt0?=
 =?utf-8?B?UVhINVpjNHhMYk11eHEzRVRPNk1MOWNUTERqaUw4NTI0Mmkvd2g2ek9DVTg4?=
 =?utf-8?B?dHN1OEhrYjZOR0gxbGc4bmFtL3B0THpRWFpEUkd6dW9qODZ3MEVtV2p6S3hj?=
 =?utf-8?Q?98vLzej8Qn/D0fq0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ba0aee-e82d-4aba-2d7a-08da2db92ca5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 10:30:56.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMsbRo8V88AwOkJwNuoNI5qPVGxNHgcscDCnKuOMLdvxa8VjUbY2V3S4CvTwLrmhRQ1Nq6+rO1oafncpj+ukLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6508

On Wed, May 04, 2022 at 11:32:51AM +0200, Jan Beulich wrote:
> On 03.05.2022 16:50, Jan Beulich wrote:
> > On 03.05.2022 15:00, Roger Pau Monné wrote:
> >> On Mon, Apr 25, 2022 at 10:34:23AM +0200, Jan Beulich wrote:
> >>> While already the case for PVH, there's no reason to treat PV
> >>> differently here, though of course the addresses get taken from another
> >>> source in this case. Except that, to match CPU side mappings, by default
> >>> we permit r/o ones. This then also means we now deal consistently with
> >>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
> >>>
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>> ---
> >>> [integrated] v1: Integrate into series.
> >>> [standalone] v2: Keep IOMMU mappings in sync with CPU ones.
> >>>
> >>> --- a/xen/drivers/passthrough/x86/iommu.c
> >>> +++ b/xen/drivers/passthrough/x86/iommu.c
> >>> @@ -275,12 +275,12 @@ void iommu_identity_map_teardown(struct
> >>>      }
> >>>  }
> >>>  
> >>> -static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> >>> -                                         unsigned long pfn,
> >>> -                                         unsigned long max_pfn)
> >>> +static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> >>> +                                                 unsigned long pfn,
> >>> +                                                 unsigned long max_pfn)
> >>>  {
> >>>      mfn_t mfn = _mfn(pfn);
> >>> -    unsigned int i, type;
> >>> +    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
> >>>  
> >>>      /*
> >>>       * Set up 1:1 mapping for dom0. Default to include only conventional RAM
> >>> @@ -289,44 +289,60 @@ static bool __hwdom_init hwdom_iommu_map
> >>>       * that fall in unusable ranges for PV Dom0.
> >>>       */
> >>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> >>> -        return false;
> >>> +        return 0;
> >>>  
> >>>      switch ( type = page_get_ram_type(mfn) )
> >>>      {
> >>>      case RAM_TYPE_UNUSABLE:
> >>> -        return false;
> >>> +        return 0;
> >>>  
> >>>      case RAM_TYPE_CONVENTIONAL:
> >>>          if ( iommu_hwdom_strict )
> >>> -            return false;
> >>> +            return 0;
> >>>          break;
> >>>  
> >>>      default:
> >>>          if ( type & RAM_TYPE_RESERVED )
> >>>          {
> >>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> >>> -                return false;
> >>> +                perms = 0;
> >>>          }
> >>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> >>> -            return false;
> >>> +        else if ( is_hvm_domain(d) )
> >>> +            return 0;
> >>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> >>> +            perms = 0;
> >>>      }
> >>>  
> >>>      /* Check that it doesn't overlap with the Interrupt Address Range. */
> >>>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> >>> -        return false;
> >>> +        return 0;
> >>>      /* ... or the IO-APIC */
> >>> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> >>> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>> -            return false;
> >>> +    if ( has_vioapic(d) )
> >>> +    {
> >>> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> >>> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>> +                return 0;
> >>> +    }
> >>> +    else if ( is_pv_domain(d) )
> >>> +    {
> >>> +        /*
> >>> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> >>> +         * ones there, so it should also have such established for IOMMUs.
> >>> +         */
> >>> +        for ( i = 0; i < nr_ioapics; i++ )
> >>> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
> >>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
> >>> +                       ? IOMMUF_readable : 0;
> >>
> >> If we really are after consistency with CPU side mappings, we should
> >> likely take the whole contents of mmio_ro_ranges and d->iomem_caps
> >> into account, not just the pages belonging to the IO-APIC?
> >>
> >> There could also be HPET pages mapped as RO for PV.
> > 
> > Hmm. This would be a yet bigger functional change, but indeed would further
> > improve consistency. But shouldn't we then also establish r/w mappings for
> > stuff in ->iomem_caps but not in mmio_ro_ranges? This would feel like going
> > too far ...
> 
> FTAOD I didn't mean to say that I think such mappings shouldn't be there;
> I have been of the opinion that e.g. I/O directly to/from the linear
> frame buffer of a graphics device should in principle be permitted. But
> which specific mappings to put in place can imo not be derived from
> ->iomem_caps, as we merely subtract certain ranges after initially having
> set all bits in it. Besides ranges not mapping any MMIO, even something
> like the PCI ECAM ranges (parts of which we may also force to r/o, and
> which we would hence cover here if I followed your suggestion) are
> questionable in this regard.

Right, ->iomem_caps is indeed too wide for our purpose.  What
about using something like:

else if ( is_pv_domain(d) )
{
    if ( !iomem_access_permitted(d, pfn, pfn) )
        return 0;
    if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
        return IOMMUF_readable;
}

That would get us a bit closer to allowed CPU side mappings, and we
don't need to special case IO-APIC or HPET addresses as those are
already added to ->iomem_caps or mmio_ro_ranges respectively by
dom0_setup_permissions().

Thanks, Roger.

