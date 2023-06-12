Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A43A72C27E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547006.854164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fO1-0007lN-R6; Mon, 12 Jun 2023 11:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547006.854164; Mon, 12 Jun 2023 11:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fO1-0007jO-O0; Mon, 12 Jun 2023 11:07:01 +0000
Received: by outflank-mailman (input) for mailman id 547006;
 Mon, 12 Jun 2023 11:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8fNz-0007jI-Il
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:06:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e799c20-0911-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:06:57 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jun 2023 07:06:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 11:06:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 11:06:52 +0000
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
X-Inumbo-ID: 3e799c20-0911-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686568017;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9K3jqVEeFuqDh1yvy78DpilXb7LocEMxzCr6JtyyfZU=;
  b=JoPdmIb8KhXJd/o8uSOf135MDRQCPfECCAztkhPKpsC15kuqImpeDs9h
   VhZCyy1phJVFUfYzSC5+Wede9MhAIuIyVwuiR9ivM4P4aJK1A7Nhum8pi
   dLKlQDXQi57mf268bchKh4eSyYdiBnvlBS88OqvpD0p2Ufo6Ei+pWXJua
   o=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 112466269
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:STZ33KNzaPUKdYrvrR28lsFynXyQoLVcMsEvi/4bfWQNrUokhmECn
 GpOWGqGaf/cYWWge40iYN7g8xsB6pHWzd8yQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s9rDUFr1
 8NGFAs2SgDfh9+a4667ceY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeOpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHmnBtxISuzQGvhCrnzPwWI9ChwqcEKlm6CQu06FHIxUA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6Dm0aS4cKDZYYTdeFFRYpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:expmmqCMAfLHOzHlHemK55DYdb4zR+YMi2TDgXoBMyC9Vvbo7v
 xG+85rsyMc6QxhP03I/OrrBEDuewK+yXcY2+ks1NSZLW3bUQmTXeNfBNDZskXd8kTFn4Y36U
 4KSdkaNDSfNzlHpPe/yBWkFc0t2dyWmZrY/ts2DE0AceipUcxdBstCZTpz23cZeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AxPBdYGiKdt1V7be63EE2y50/rDJuW2HR7FLyHBG?=
 =?us-ascii?q?EMl1NWOGVdHOz5KNfnJ87?=
X-Talos-MUID: 9a23:114a/waKKSI9RuBTmR6wgz9MNsZUxr2wMhkkoJU9/JePHHkl
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="112466269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZDwwtHIACMM61fh29XmWI/a4q5yUAKH/nCUIgwYkwJ/Yy3rfQS8Uhcpv8ETtzyVATucIduPKi4bN98QJrB/wJFWqJietqNXVMcIdUSe3D3ZdPOZXOlMR+rFjBZvB/d7OLXRakwx6ZdYUQwuhgQnak3dvFjBjuCMC9JIWbOa2Dhnia0KBBmOIHd+Tc3YyK1fZlqsLtIvcIfvUE6gjh+U89fZaxDg75Imx+bkZ6c6KGlnQ2X42/yAopfyLxTvGvOM+YVgM8voMEvzx1akJ8YtgvhXFVqsQYtb1s+1IZy1mR0m3Dg3fFXhNHHm6mNlAkLjE0BNS/GcRk6cnOGt9ROqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yoXIEgY1VAU/jKDncu1ErBzDxBe2phqSIXTLjBDEXM=;
 b=PtqCe/XBADszhZpcAMJTZv9RZ7hCjzPB2e3ZMmMeL1hWz28RNbfMjFrCvRMJA8Dbb1oqpvojcZ598YmQCHuyMcXZBFaOK2hrtMtIJd7uqXKZTDgymrMRXpMFdQvdtCuZ+wpBHIJsjFkFlPFPmW5pcChLXX9dML+GUUWLkfsjlk3+UopEW3F17geqdmw8WQGtgFBx285IuBZuKKORr2d36Qdz5Kcq3l3EtDqp3CcVPFIFBnKlgr3LSrGj/Sz9k7BxVzub/UpKrBfuy2p8jEgHxyhGfhJgy5WI05l4Je7z5tb0ifpzPyE6b1clstovdV/z9tyg494I9NG0RYOH4dVCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yoXIEgY1VAU/jKDncu1ErBzDxBe2phqSIXTLjBDEXM=;
 b=ws33j1/wG/qfzpgWTByncyMcyD4L+6J0PjsJb5TX6Raz4XQFPxN1ZGNMg3DxM1f5Lr2QGX378JGWMWZ7lSLNaYAs+uHhJCx0z/oI/jdRU0isU77gcDjpKMAJJYfHW+Wl8VZfFbasuoZLko7wcaYmNK9Xcw5XTn65sj1FQ3ERJBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cfba8e6a-1c76-c678-b0f5-93af91d27606@citrix.com>
Date: Mon, 12 Jun 2023 12:06:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: New Defects reported by Coverity Scan for XenProject
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64859cf3a1e46_712752abb10eab98834b9@prd-scan-dashboard-0.mail>
 <59b7b181-9f31-c3b0-e54f-b5f22b08572a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <59b7b181-9f31-c3b0-e54f-b5f22b08572a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0620.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bdd96e-d98d-44ad-6178-08db6b35202f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gl097JsTDZ4J3qEyKGokZCqHWcOcXjQ9IMhPN3v1gqFH+bVrpT3U72cUIuTeUh4j2FLHTWTUML2jY0ZdWG9BdSyb8fQzAiL6TgbzQO2R3RumSwfo5iZFYrVUjJp//lKNbYyOFzi1Vn5EZZ+1GToGIPlU82zU2pxR2MWE9eveMvM5WB9qjBTETietzKj2xC4kpbZjQXfyuIP6bLGoIH+k2HgF0PU/tzFGrdX3FE2M2uM2wvZ7YU/rHOfvjyd/o0uD564Nop7gu04mgTcwcMZG/TRnGURH5Psf1aj3X8LRQuIO+kztJZjhwS1Cj0fZVMeJ+Q5E8BISC7tmZynwJdBVM8GTMnKdJ+ovOB96Ob/VgKsl3K9glDpvdFtI8jC4OTCGlQtLLtXAHpmychV0uj0r7ghvgs4QHNA6XGp0WdNY5cgCR8gKImpHLYdrSQ9k/Ww+A87q9Oo1Fv+ciDkNesIr0Omo3QgQ5akk+LXCgA3I4TsHEHn1auTfqZ5L+Ki7s/u08JOiYmNtlb4c8wu+nlbF7sWMAN3N33fzq+PPocq5o6XI44Z9GdA9Bi22SpymovdWewNYzMSDD9+hIjI19nBj0xF8/GEovJDna4N5x0938NNuP3Y7v92goFGP9byNNjeisUDQL1+O8TNKyKFIvZKWqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(31686004)(66946007)(66476007)(66556008)(36756003)(186003)(478600001)(110136005)(2616005)(2906002)(8676002)(316002)(41300700001)(31696002)(86362001)(6486002)(6666004)(6506007)(53546011)(8936002)(82960400001)(83380400001)(5660300002)(26005)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFJSWjQ3U0MrWmVyV2dWQ0Y2M1pvRjBIZVJLc1dyWE1nUjVyWXVVYlovUStF?=
 =?utf-8?B?eDBzT1NOSWdYeWlJSFVMYm5aYnF3SmpmZU5xSTQ5RmFGUzA2U2Z4YzJkb1Bu?=
 =?utf-8?B?d1RieXFOSkNqVC9vQzJLL3ptRytKdXJ3TUxtck5ONHpNZVo3MjN0YVJONWtu?=
 =?utf-8?B?UWJ5aEFHenc1ajB2TEE5c3pDbWFnMy9BT20yd0d3MFVPZENIdURvNlVXcXNU?=
 =?utf-8?B?enZHL21IcWxNNG8zRlZVb2cxbVVzWHNYSDNFL1RNdVI5cFp0UzhqYUx0bUhr?=
 =?utf-8?B?US9NS2dORVQ5OEJMd1RvOGtmVSt4MlFsdkt3MFBDeE1xcjArMFBXbUVxQVpU?=
 =?utf-8?B?ajI1TWJ6ZFlMUjRXK3Y4UUliVEUzMCtISzJHMU9CMDhXMlU5MWxuTGtJTEtU?=
 =?utf-8?B?Um5aWERha3FJR3JPbklsdHoySUFSajdlaFVTQ1pxVTJhQlBSNklsT3BoNGlJ?=
 =?utf-8?B?dDAzd29pbFRhZUpDalNycVg4YVRLeTZUdENOOXR5NnIyNWNNZmpHbURnakgx?=
 =?utf-8?B?bmRmdGR5QzlPZUt5Uzk1akNRNmNKRCs4TU03VHVUTms5NXE5anpqNTlxb1V4?=
 =?utf-8?B?L0taN1Z4NTFvYWZ2STJRTE1rc3RpU2R4Tkw5cFJqdElNcnprSGhkNzkybUhK?=
 =?utf-8?B?bFIzY2NuREkzZk1UeHZlQmpaZUh1MXU5UFdRbVd6TE91T2Y5Q0FRU2hrZTMz?=
 =?utf-8?B?enA4RVBzNURSc1AvMWhjK0I3bktQTFF3bTdqbkFWckZJbUk2NWlHcnd0V25q?=
 =?utf-8?B?UVRwd2VYaitjZkp2Z0NNajF0UDdXSWJKcFRSaUtsdS82eDVJbkt3QUxCTy9N?=
 =?utf-8?B?NDNtRkVpc21uc0tiWUZkSVdqajhGWlFQWVRGR00ycWV0UnMrZE1kUVpscEVr?=
 =?utf-8?B?WHNUVm1QZExsNWUrY1FwcEMxckVJMW9MZ3ZkaWlBd3lIMzFuTko5dW0zNzhG?=
 =?utf-8?B?QWl0anZ6NHZTYWNrcFIrNE1TMHg1TmdoZFFjMXZId2ZTbU03NlllS0dvT3g2?=
 =?utf-8?B?dDI5YWRNK09JVWl5VTNMaG1CVXJJUTR5d0w5Z1JibjBROWZVQTlSeEs1VFFu?=
 =?utf-8?B?OEdlUmxtaFNUY1MxcTFqWno3aVJ1dUt0SFRkSFFGeFFiT2J4NDJPdVcvSFRw?=
 =?utf-8?B?Y2l0Y0FpQWE1VjVTRCtRNVpYcnVybldTNFVta01SMjFBaVh5TjJpSnhleFky?=
 =?utf-8?B?Mkp1SjlTdWF5TDJoZ2huMkxraXpJU2xSWktud1F2QmJXcE1qY0d3TEN4M1JZ?=
 =?utf-8?B?NE5EcFlTeGlDdE1YeHF6NVpxbGZjcGdTa0diNVlBaWQvU05rZkJGMVlMYlg3?=
 =?utf-8?B?YVJCNGJaUG1SSDNsTklrd0xmZXk2WHczTXFZem14SVpYVStNWFdjcGFTTkRp?=
 =?utf-8?B?L2ExcDdnbEoxWDlvNTNzRVFuYklDNENlTGFvQzZCK2tXc1FhTFVrSzFlUVMz?=
 =?utf-8?B?dGtlRG55RG52YVRielYwanZHSlZsTHNVTk05a2RuS2xKeUpoZmROaDBTZXpW?=
 =?utf-8?B?N2ZsQTJydHRINmhCcG9iYmVMWkFCNDVEVko2OHdpbzhROThJVWZiNlZlWHZm?=
 =?utf-8?B?NVNLTUlYeGV0Z055b25CL2NBSzdJK1lLYXg3ZEhNY1JZelVpWkl4UVg3MG9l?=
 =?utf-8?B?WnQ3ckR6UGY0a2p1RytDOUFzenZlN09wN3ZoNDhCRDNHbUNnS2NTeVJBZmk0?=
 =?utf-8?B?TlIwQi9icTdrTWdLL1pYdGJucXpoaXN4aG5ySkJQMENWM096Q2pzOTBpZzN5?=
 =?utf-8?B?ZTdPazMxY1FoZm1hTFg0TklGYVBWNkIrYkJBTjhXeEhzQ0NLSFNhbW9WM1Nq?=
 =?utf-8?B?MURsb3Z3aE1qL1ZmQ2NNa3ByblRXckFEdk9nUTZZY1ROOVZYY3dKTlhHa0Vh?=
 =?utf-8?B?OEpzQTl0bVYzTGxXV3NJWEZPWGw2U2NBOGQvY2VsbzROUnRzMmVHekZKa1Q1?=
 =?utf-8?B?a1R1Y2E0MWRnMTJ1TlRjaU9FLy9ZNlZuYU9rWlRxbllpaHVUUGRIYStmcDc5?=
 =?utf-8?B?ek4rNTNQOW5HY0J4V1BLQUM3dFBicTV4aS96NzBhb2F4UmRwR3h5SzZNdXJk?=
 =?utf-8?B?MGVIWHdZclBqQWcvYnEzRFh5ejBNSWVhMU4xejN5RUc3cUNSbGNQejZKVk5H?=
 =?utf-8?B?NWlIWWhGcS80c3d0QjJZeGROWGRWbmprWGZMa3dVQmNxcEx6SzlqUWRQeGN0?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CP33/dXSgeW+RCcnQcXiQSZM3dcZaXZwR1Qlk+VkWmTy9BVyFNV0wPL8fITRSUgYNv1yfwN4Syrcyl8fcDRiRejxSbZQkpDOe53Fo3I13gNz93sQ4BByPK7fyYcRrE/4gu/FA6iGl/g0eaqN0o4FrLQCZV26wfhu6kIxMknsBt7B17NNmDbrYYSVR5ih+nHpaumizIKHYRnqY2CD4jvSJLxqQKIigswCMeIu/qYG9tcolJtMf7ehy9R93qadN0PTUDmw1VWjBf7k4yHFT/qPOf8xf0ahiDPqruQoqZ6+9xOiPXNb9MYuC4hQXaMTeG5q9cAI7JtkF5fCrQMmw3G/Kol0VLpe39UGgCMpkLR9xT1dJZkoLXMz+0AH6FUuc3344ln0cIi22ElNUsyDetPZeGV9Re34uZgY/j+6FbahW/AJgLEjylCSP5NFJ3rhRGrYlSwpI3N3dyWIHS8b/qxRxwsVYV6t7zltOCYfcxNC80BKf98drAVMlFfSFvapV5jeVqkx8bARH91CLY8fyviYvSSIMCA6SO2+Ym0Q9OGsmcMKqrG06rgg3xGxvC0fSWFOWUwzITHphO8/YzerkkIeFsJyB8aelT41JnSLk/lMQml3NnrY17Bk+bu+bjZbglnySSXYY9U9Gt4faY84VRFo/R1bCWkxrBugUJL/wNL07N92UTiXlMCxGi0sTtnfd4pDetwWdhMD5fHENqG2osCRy8A75UOqffaqCfqTaGlUzpKI9zNe3kiVFYPuJTs8ObtaUkTa144Bw4cYUGkxuzghZqlWqYYHgppODnKhqhZJXcXkSBe37p5jECoY0kTP+kS+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bdd96e-d98d-44ad-6178-08db6b35202f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:06:52.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0e1sl2MQvcwwsHvdffq/Ip6JsSklBtR2k3K2pvPFr/1AcBpmnqck7HWZW93/27c5uesAnWZTF5f17jbiWSAHk3sMZBhK9ot/shdOH2mxDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878

On 12/06/2023 11:54 am, Jan Beulich wrote:
> On 11.06.2023 12:07, scan-admin@coverity.com wrote:
>> *** CID 1532318:  Memory - corruptions  (OVERLAPPING_COPY)
>> /tools/firmware/xen-dir/xen-root/xen/arch/x86/x86_emulate/x86_emulate.c: 1987 in x86_emulate()
>> 1981             dst.val  = *dst.reg;
>> 1982             goto xchg;
>> 1983     
>> 1984         case 0x98: /* cbw/cwde/cdqe */
>> 1985             switch ( op_bytes )
>> 1986             {
>>>>>     CID 1532318:  Memory - corruptions  (OVERLAPPING_COPY)
>>>>>     Assigning "_regs.al" to "_regs.ax", which have overlapping memory locations and different types.
>> 1987             case 2: _regs.ax = (int8_t)_regs.al; break; /* cbw */
> I was under the impression that reading and then writing different parts
> of the same union was permitted, even without -fno-strict-aliasing. Am I
> missing anything here that Coverity knows better?

It's permitted (hence why it compiles), and it's almost always a bug
(hence why Coverity complains).

In this case it's intentional to sign extend %al to %ax.

>
>> *** CID 1532317:  Insecure data handling  (TAINTED_SCALAR)
>> /tools/libs/guest/xg_dom_bzimageloader.c: 574 in xc_try_zstd_decode()
>> 568         if ( xc_dom_kernel_check_size(dom, outsize) )
>> 569         {
>> 570             DOMPRINTF("ZSTD: output too large");
>> 571             return -1;
>> 572         }
>> 573     
>>>>>     CID 1532317:  Insecure data handling  (TAINTED_SCALAR)
>>>>>     Passing tainted expression "outsize" to "malloc", which uses it as an allocation size.
>> 574         outbuf = malloc(outsize);
>> 575         if ( !outbuf )
>> 576         {
>> 577             DOMPRINTF("ZSTD: failed to alloc memory");
>> 578             return -1;
>> 579         }
> I'm afraid I simply don't know what "tainted expression" here means.
> xc_dom_kernel_check_size() certainly applies an upper bound ...

"tainted" is Coverity-speak for "externally-provided value not sanitised
yet".

I suspect that Coverity has failed to equate xc_dom_kernel_check_size()
to being a bounds check on outsize.

>
>> *** CID 1532309:  Control flow issues  (DEADCODE)
>> /tools/ocaml/libs/xc/xenctrl_stubs.c: 840 in physinfo_arch_caps()
>> 834     
>> 835     	arch_obj = Tag_cons;
>> 836     
>> 837     #endif
>> 838     
>> 839     	if ( tag < 0 )
>>>>>     CID 1532309:  Control flow issues  (DEADCODE)
>>>>>     Execution cannot reach this statement: "caml_failwith("Unhandled ar...".
>> 840     		caml_failwith("Unhandled architecture");
>> 841     
>> 842     	arch_cap_flags = caml_alloc_small(1, tag);
>> 843     	Store_field(arch_cap_flags, 0, arch_obj);
>> 844     
>> 845     	CAMLreturn(arch_cap_flags);
> I think this wants to be left as is, not matter that Coverity complains.

Yeah, this is deliberately too.  It's there to prevent other accidents
like we had last week with the bindings.

~Andrew

