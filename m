Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D996A1DD9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 15:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501102.772698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZUt-0001vK-GU; Fri, 24 Feb 2023 14:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501102.772698; Fri, 24 Feb 2023 14:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZUt-0001s9-CZ; Fri, 24 Feb 2023 14:56:31 +0000
Received: by outflank-mailman (input) for mailman id 501102;
 Fri, 24 Feb 2023 14:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVZUr-0001rE-Er
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 14:56:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 687d3aa8-b453-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 15:56:26 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 09:56:12 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5607.namprd03.prod.outlook.com (2603:10b6:5:2ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 14:56:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 14:56:08 +0000
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
X-Inumbo-ID: 687d3aa8-b453-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677250586;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sJ2Jlpcul6YwnIOvkMF56K/vaXxTyKCFXKUyWo5CE3U=;
  b=a4X+9fKjbFv/qkUZJRJ3L2E3KkD6bl1hBmMUCJII0d7UWRrkzseOKSx/
   Ae8K+Y9p1GOUQfpFE6+u+85TfGaf+snUYbf1ZUuGgLL1kOLsubblpGrLV
   Qqu+mF7w3BQGxPnjL9T0TCOpqS9Nac2D7mFEeZ3rNm10ECXDhJT1uirVx
   c=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 100846098
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S4DwDa1xTX/fMn65KfbD5etwkn2cJEfYwER7XKvMYLTBsI5bpzEPy
 WdNDD3UO66KZDD9eI8iO4nkpEkGvZWGm9QwHAdopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfRkcW3
 9EdFAA3LU6up/jvxo29b7dNiZF2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1AZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjANJOSuXpppaGhnW4wlQ6FAIvaGCbqPiLo1/kespbd
 EAbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOucMpRDpsy
 liTmNDBDjhorbHTQnWYnp+LqRuiNC5TKnUNDQcGQhEC+MLLu5wog1TESdMLLUKuptj8GDW1z
 zXUqiE73u8XlZRSiPn9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcvlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:WfFp56o0gxYvWFLIdSBXooYaV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJ080hqQFhbX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YZT0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dND2CA5sQkDuRYTzrd3GeKjM2YqbRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="100846098"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKx3Gy70ZjyLer/Zn6Qm3Kjou4bbaQc9jV3zQLZr5aPuFxdqxeepar6zsPCD4w5isYA+ToXo1M42UfR3v9MQYN35+LOD892L5naJJcJp+j7YhAwQXG5db31N7bDZFEaNOuCRUEmdEF6ZcaEtXVFWEkGg6/uXmXBoBqaTNYnIls+dk1ssqnQw1XIAjLHSmkmHHPuxNyyqTaEaRsisz/U5MRdkn58voAqzLtdbXZbRI0FDQnp1ibgnHQfRi4GRPewc1hqsmUtigD24xBbS9WoNflMKl0iUTPUqA/aUH0OuLRGwlRaZCfqG7cDHm/SGepunYZbVNXlQOxhCFBuveGvCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/oaELvFBpy6DwLcgD6jhADRmlgUKUV1FmnIE6QgsK8=;
 b=iDiqWB/dPQtzklQ0vL58Ena6pytA1Ob88NcOmDcQGrA8St7Bw7V2LBWFozDS1NNC7LOCQ4phV2YrZ2wEtU4/52nITfRKJIbFpV6JR5CNBG6NymBKGwMMpAcqyUfdGOh0nZKtG+yhanvoNQzOuLzU/FTNtUi3uI1jx0yD1/lFA9GWpauy6ZfO3WhZv5aiPfVoxznPqLmcr/ZAtjyaBfQ4jVLkKU8laJSD00pGgQlVu01bpTifMHdn2JEBcB0GutmXMfMVCrFGqCz/fcec0BlfipM3usQYHjaVCtVcq96qIvrbg1as9vL2aNMurUYTYbcXPwk0qIrfpjUVHb0ehze+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/oaELvFBpy6DwLcgD6jhADRmlgUKUV1FmnIE6QgsK8=;
 b=KtK7rSKJW4ZomdE2LeRhF5iB7SRyuTPaY9yQpHBSMoNiHvj2329sV2v6SFHjeuwyCL90vb0umizVkY0LuQi3UaQbHNgl1LdKYLOUQS1Tjju3R6a/c9FvUAVdnTL09tRhpfpmK+6NvGQAtgZ1IRM1QEGZBczoeaIdC374PVxZdEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <12b656b2-76d5-2ce6-9548-5ee8e57451ae@citrix.com>
Date: Fri, 24 Feb 2023 14:56:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/2] xc_core_arch_map_p2m_tree_rw: fix memory leak
Content-Language: en-GB
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1677245356.git.edwin.torok@cloud.com>
 <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7da24f-a34f-44c1-7195-08db1677427f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rihDQDLFHAezddv637i8hwBj3H/RTpYRlomKgK1oRaNI3T29UcahcubOGjnWuHW87QljyTCwcorbQy29Ja9M0v3Xgc807+We9/jmtwMYdUrWLLC1Mqa5X/fNal0PkJ7KTBPszyDm6CyBY78J/qZnqpThZNy9wQTP7epAsJV9BMUPLYdKgT3KERqY5vb5inWHkQldMHfXzExzOtecSgYdQT6VNo5rctKYrT9f+EOqNRun7XvLYX7XA3nolAXY53Y6gPG0ivnTQHXNG4lCROCWHw9jVyFKZdmt+DsSKrHMj3yLqJKIrfLNFqtF6RLe7639eB6HPEzH7I3TBBcFgcKIRFkN/steFeFKzDSfHYIWM2bDwocnNeob2pMYKkUkI7vmqYq20/HGUYW5a2vR/D/A5+HY0G/TqEQ+yiGPjkwh9EFaYWiQTCE+V2/5VkaKmgfPTkSL06vfFPEVxMign//+GEVN8fma9OrVasl97jqgZRFK0NgcXmeBDapHZP25NDA2x3Fvdug2Yx5i/txmRq7IqofKJZYc87t3Fs+mxQ9L+ILxuXXB0wh/BDza+2gQjsE/S6GSjxpjKai9cvi76useXmVWsEMHlV4cMUgwlyA6CrYuAaiITaWwPjxhpSMlgcHL1zgkwoV6JySZpGHVDlQytcm8mTeSvNLzoNPTXqp0856sJoAIXutYB2RXHvlI1EQ8bx2SY5o0dEoEp7OhlkvdSgjO+VdGlA/Cboj5VV/ve8c9VcQ4qXvlKDJvoN5t/5plUBQTRK5bFkMbbh3u9tIALA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199018)(26005)(6512007)(186003)(66556008)(66574015)(82960400001)(38100700002)(36756003)(31686004)(53546011)(86362001)(66476007)(66946007)(2616005)(8676002)(4326008)(31696002)(6666004)(5660300002)(478600001)(6486002)(54906003)(41300700001)(2906002)(316002)(6506007)(8936002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdNNnY5dUFQckJzblg0NXBkMEdkSDh4M09rSGIvSlNVM0ZNREpwQVhtSEdn?=
 =?utf-8?B?NkNEU0JlU1k0a3RrV2RVamtTWGEyZHB6Z294ek1tREdVT3JPelcrS1djNVY4?=
 =?utf-8?B?WUpHeCtqck9qTVlpWVgvdXN0aGRVdFhLekF2V3UvblE1VkdvWEp0SDJmWWtr?=
 =?utf-8?B?TWlGVVlOYytKdGZkOGZ6RVNWV2RrbGc0eFArcXJWcmhwWkJEUjkrcGZZRXQv?=
 =?utf-8?B?cE52bXhqMjBybHlETld4VER0SDM5OENxOVJUKzIxcnNMdjZ3OTNjdnhCUC9L?=
 =?utf-8?B?U3Vva2xPZS9yUjBINEZkZkgveG83NHRobm1LNGpjUTZRWkRySHhidWtJcExR?=
 =?utf-8?B?MXZYSmdCbzN5K3ZyckVaNk4ybmk0bVNTbVRCUmlGWEZQaGZCbjBseVU0N21h?=
 =?utf-8?B?aUM0VWRSaWI5TUEzQUlocjFHS29uNklyU2Z3M2dUMHBvN2pDWDFDd1VSZ1VS?=
 =?utf-8?B?NFNPb2tWQmd2L1pKc0RUZGdJQzBoWStsWGNUZGVuWFBQWS9tbGtYTEwzcUJQ?=
 =?utf-8?B?VmNnZkJjSnhVeEx4MUZtV0I5SDhaU0pvUnYxbzVvRlo2TjlKL1FjT3lERnVq?=
 =?utf-8?B?MHRtUi9jVmkza3N0MzdickNGL2ppUmRmZFhnbUNKT01HUFpwVHVwWHRQUXpu?=
 =?utf-8?B?NHF2NEwveXpmTDcyVUVlQW45OFI4bVFVcGRtcmJQNDVXeG9HSFlkSXptRFoy?=
 =?utf-8?B?SkpsNzhzeW4yVllzeWVyU0l6ZWIydG1TRWJQcHVkZHU0MlpGd2owdHRoZGJt?=
 =?utf-8?B?eUtkKzVUL1M0NVB3dnprWHAvN0tZZHhCZU14VUZEZGxZNDhFK1JHZnduVlRt?=
 =?utf-8?B?RVorbi9BVXhPOWZVTEtQczFUelVNNE9zdytjek5XT3JLbGUzZGZUSllRVzdu?=
 =?utf-8?B?akhPVlZJQTBpN2Jsd1paMk9RWDR2M0NvMGV1ZTUyeDBqZ1ZzaEI2Um9laVBR?=
 =?utf-8?B?Tzg3N3JQOCs0a0dMLzdSU1dBem55VHROVnZqSkY4K25QYWkvQlJmc1hBdktP?=
 =?utf-8?B?cGdqU2VZb3pDL0xHZjRkZFNKV1puaC9FQTZZZXAzS2l6ZENpMmZhS0d3b0xD?=
 =?utf-8?B?VlJ5d1dNTGZxK0l6RGFMdk43Q3JVcWZaNk5CQ1ZYK1JPZGdQRDN4NTByRVN6?=
 =?utf-8?B?TGJNQ2xQTzFrRGdpZFBweVNDZG9QSlYvZEUrUUdPZng4cjJNRWtucThlSXlW?=
 =?utf-8?B?eGdSVjhQemNBVU04SnU0dTFXK25aYzQ2L05lTElEa29XZUlRamVhN1lFOFMr?=
 =?utf-8?B?NHNQQ3pvcm5KV0FZMHg3K3l0RkE1RklBclI0SE0yVThqL3RuOFZsU2R5UzYr?=
 =?utf-8?B?b2VMajY3Z1JBS3lwV25PUXM4dGpVWWF6QXJQd0pBdTR3SUN2Y0QwVGpkSGlv?=
 =?utf-8?B?VU02endJSWpES0QwVnNlN1NCTjczL09PWXRLL0pSUGROaWsrVmhnZTZXZkE1?=
 =?utf-8?B?K0lzR0srOFFZNXh6OUNxSXNjR2VpNi8rZFcvelhXNW53cCtVUzRqNlAxVUpy?=
 =?utf-8?B?MVMvckc1SWFvTHcxME9VY3E5WWxPa0hodi80VDVBY1NQaG5vd0U1QWM2cGdR?=
 =?utf-8?B?cmlOT1MwV0gzOHFuS3Q3Q2didkV1eWsrNVV4a2pENVdRaTQyTlllZkY1aFdC?=
 =?utf-8?B?UUh0djdWY2NpSWJ1eUNXai9DbC9xR0JIaCswK2F3QnFQdWgrV1dzTFdJWmdt?=
 =?utf-8?B?ZkFBL0J1cUJDSUYwcTRxSWhRVDVuQzVmbDBHZmpGblk1RzFNVVJzSkhOUGQ5?=
 =?utf-8?B?NGRPN1V6SFEwamQvZWROVXRqWkVjYnFlYlExRzNSYnIzMGVwNTVlV201bWR4?=
 =?utf-8?B?WjFpUFQydmpVeEpIOXJ1NW1DLzQzVjZHNU1oMW95aWJKazNKVUpxQVBwaXQ0?=
 =?utf-8?B?MEFZNHBldHRHMktOam8zWXNzRkRFcFVKSVE4RloyRVp3bHhQeUNyV3FMM2Qx?=
 =?utf-8?B?b0poQUZXM2IyK0grUWMzNVNMczZnYTRxcWZ6M1hvQTNSb2RoVHU5YnR2bDIw?=
 =?utf-8?B?WmNEZGdqWWt1ZmZ3NGNFYmI3bjJJMk1HUWZHcHZBZytsbDFHRnVuRjZaMVJt?=
 =?utf-8?B?TjVWMElrZjJtZFErNUVPNXFNYWIzS2U2bk9qR1oxQ29LalZ0SWtLQnpaUDg3?=
 =?utf-8?B?UnFOdE9DVE9VNUkzYy9pTFlyY0J3Z1Jndk5KZk5helpuRTN6QlA2aW9aNFB1?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2A3VbU0Eyh8SnXJNCv/RkG0GzGoWkoVCiEHXX6J7Go0d90vNqg4LEOI3ybZTbd8a7WTfFe0KzdTEe9nuoO52VUSUCxq1LbPwydf72sOGJsKIpnd6R9yE7GxTXgVeWDPEzr5u4mjS5c3PENKCm7oTTeiccdJ5EMfHBdN+Almlc/0wYngbiv2MhRVXJ3RrZjqAWWZentG//Ex7mZXsUQ5TWLdBZ7Yxi8rmg6Xm601+csltOJ2gZuNvhlsIbXD+ePvSRS6+pyKWK3hez80vGM0IQo1Tit29dgxTAGepsNQpTJcuZF9q8bBQfAx1sCeWkzH7LqzW4cBeO9WGN/EWq/EEO0YlJskvVLi0huzJnWZrRwuy4A7I8wW5CjJ7JRq6K38eOtsNcZwl93Gf2ucjsNsSFkQvOitGSS/ELchzjsnq031nzPPVona92NvUa+UtiuLDzy4wRlijLhb/M3b0Nyw6LuQ+r3KG2VyXn/VfTipcx8f+ciQ0cdcu+09xv0sbnRdxpZPc166SF6rghbyMt4qZ7wky2CGwcatGbHdPB+gA/w3ipT6GzW4UUO0Xh8+dnBXA6S4kuevEo+/ilIi79DvlsSbdwDzcs4se+uA0may3E/0AtuYO3GDjkbJS5KFKsJvqsMclKIrwmYVH4hhfbKPhnkLFkxUYziu6J7lrQngqnJplAI2a/+JIUQ8rDKvaQmAmwArQIgU0lx8qZksqVCaMcDJ+GeXvTGwGdTOGq8Wu5HszHgdH4x6nD+0UnGOE2VV+l0IB97vgZuxaiWlyJ006VPEm+/vfAQTPY2WRj7g/x8aPmXhu9UaDUX9tjkyAHEN7yf/i+bCG+6BBuc0nNAYXZSXXc/CFUdLVkSy2FjQI/b4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7da24f-a34f-44c1-7195-08db1677427f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 14:56:08.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /V1ccFGEoV/9OTenH8/ahlNDk81Q1eaQj3hXqLAsi2VlSbkSjIjv3fNNfIzEmplRN4wN+d233MiEhLEFZxJzxxkQM/N5+eaJT2SrYwTJ91I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607

On 24/02/2023 1:36 pm, Edwin Török wrote:
> From: Edwin Török <edwin.torok@cloud.com>
>
> Prior to bd7a29c3d0 'out' would've always been executed and memory
> freed, but that commit changed it such that it returns early and leaks.
>
> Found using gcc 12.2.1 `-fanalyzer`:
> ```
> xg_core_x86.c: In function ‘xc_core_arch_map_p2m_tree_rw’:
> xg_core_x86.c:300:5: error: leak of ‘p2m_frame_list_list’ [CWE-401] [-Werror=analyzer-malloc-leak]
>   300 |     return p2m_frame_list;
>       |     ^~~~~~
>   ‘xc_core_arch_map_p2m_writable’: events 1-2
>     |
>     |  378 | xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
>     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     |      | |
>     |      | (1) entry to ‘xc_core_arch_map_p2m_writable’
>     |......
>     |  381 |     return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 1);
>     |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     |      |            |
>     |      |            (2) calling ‘xc_core_arch_map_p2m_rw’ from ‘xc_core_arch_map_p2m_writable’
>     |
>     +--> ‘xc_core_arch_map_p2m_rw’: events 3-10
>            |
>            |  319 | xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
>            |      | ^~~~~~~~~~~~~~~~~~~~~~~
>            |      | |
>            |      | (3) entry to ‘xc_core_arch_map_p2m_rw’
>            |......
>            |  328 |     if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
>            |      |        ~
>            |      |        |
>            |      |        (4) following ‘false’ branch...
>            |......
>            |  334 |     if ( dinfo->p2m_size < info->nr_pages  )
>            |      |     ~~ ~
>            |      |     |  |
>            |      |     |  (6) following ‘false’ branch...
>            |      |     (5) ...to here
>            |......
>            |  340 |     p2m_cr3 = GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width);
>            |      |     ~~~~~~~
>            |      |     |
>            |      |     (7) ...to here
>            |  341 |
>            |  342 |     p2m_frame_list = p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
>            |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            |  343 |                              : xc_core_arch_map_p2m_tree_rw(xch, dinfo, dom, live_shinfo);
>            |      |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            |      |                              | |
>            |      |                              | (9) ...to here
>            |      |                              | (10) calling ‘xc_core_arch_map_p2m_tree_rw’ from ‘xc_core_arch_map_p2m_rw’
>            |      |                              (8) following ‘false’ branch...
>            |
>            +--> ‘xc_core_arch_map_p2m_tree_rw’: events 11-24
>                   |
>                   |  228 | xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinfo,
>                   |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                   |      | |
>                   |      | (11) entry to ‘xc_core_arch_map_p2m_tree_rw’
>                   |......
>                   |  245 |     if ( !live_p2m_frame_list_list )
>                   |      |        ~
>                   |      |        |
>                   |      |        (12) following ‘false’ branch (when ‘live_p2m_frame_list_list’ is non-NULL)...
>                   |......
>                   |  252 |     if ( !(p2m_frame_list_list = malloc(PAGE_SIZE)) )
>                   |      |     ~~ ~                         ~~~~~~~~~~~~~~~~~
>                   |      |     |  |                         |
>                   |      |     |  |                         (14) allocated here
>                   |      |     |  (15) assuming ‘p2m_frame_list_list’ is non-NULL
>                   |      |     |  (16) following ‘false’ branch (when ‘p2m_frame_list_list’ is non-NULL)...
>                   |      |     (13) ...to here
>                   |......
>                   |  257 |     memcpy(p2m_frame_list_list, live_p2m_frame_list_list, PAGE_SIZE);
>                   |      |     ~~~~~~
>                   |      |     |
>                   |      |     (17) ...to here
>                   |......
>                   |  266 |     else if ( dinfo->guest_width < sizeof(unsigned long) )
>                   |      |             ~
>                   |      |             |
>                   |      |             (18) following ‘false’ branch...
>                   |......
>                   |  270 |     live_p2m_frame_list =
>                   |      |     ~~~~~~~~~~~~~~~~~~~
>                   |      |     |
>                   |      |     (19) ...to here
>                   |......
>                   |  275 |     if ( !live_p2m_frame_list )
>                   |      |        ~
>                   |      |        |
>                   |      |        (20) following ‘false’ branch (when ‘live_p2m_frame_list’ is non-NULL)...
>                   |......
>                   |  282 |     if ( !(p2m_frame_list = malloc(P2M_TOOLS_FL_SIZE)) )
>                   |      |     ~~ ~
>                   |      |     |  |
>                   |      |     |  (22) following ‘false’ branch (when ‘p2m_frame_list’ is non-NULL)...
>                   |      |     (21) ...to here
>                   |......
>                   |  287 |     memset(p2m_frame_list, 0, P2M_TOOLS_FL_SIZE);
>                   |      |     ~~~~~~
>                   |      |     |
>                   |      |     (23) ...to here
>                   |......
>                   |  300 |     return p2m_frame_list;
>                   |      |     ~~~~~~
>                   |      |     |
>                   |      |     (24) ‘p2m_frame_list_list’ leaks here; was allocated at (14)
>                   |
> ```
> Fixes: bd7a29c3d0 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
>
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>
> ---
>  tools/libs/guest/xg_core_x86.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
> index 61106b98b8..69929879d7 100644
> --- a/tools/libs/guest/xg_core_x86.c
> +++ b/tools/libs/guest/xg_core_x86.c
> @@ -297,6 +297,8 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinf
>  
>      dinfo->p2m_frames = P2M_FL_ENTRIES;
>  
> +    free(p2m_frame_list_list);
> +
>      return p2m_frame_list;
>  
>   out:

I agree there are problems here, but I think they're larger still.  The
live_p2m_frame_list_list and live_p2m_frame_list foreign mappings are
leaked too on the success path.

I think this is the necessary fix:

~Andrew

----8<----

diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
index 61106b98b877..c5e4542ccccc 100644
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -229,11 +229,11 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
struct domain_info_context *dinf
                              uint32_t dom, shared_info_any_t *live_shinfo)
 {
     /* Double and single indirect references to the live P2M table */
-    xen_pfn_t *live_p2m_frame_list_list;
+    xen_pfn_t *live_p2m_frame_list_list = NULL;
     xen_pfn_t *live_p2m_frame_list = NULL;
     /* Copies of the above. */
     xen_pfn_t *p2m_frame_list_list = NULL;
-    xen_pfn_t *p2m_frame_list;
+    xen_pfn_t *p2m_frame_list = NULL;
 
     int err;
     int i;
@@ -297,8 +297,6 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
struct domain_info_context *dinf
 
     dinfo->p2m_frames = P2M_FL_ENTRIES;
 
-    return p2m_frame_list;
-
  out:
     err = errno;
 
@@ -312,7 +310,7 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
struct domain_info_context *dinf
 
     errno = err;
 
-    return NULL;
+    return p2m_frame_list;
 }
 
 static int


