Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1E79EBAD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 16:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601476.937479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgREV-00070D-W3; Wed, 13 Sep 2023 14:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601476.937479; Wed, 13 Sep 2023 14:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgREV-0006wx-TF; Wed, 13 Sep 2023 14:52:47 +0000
Received: by outflank-mailman (input) for mailman id 601476;
 Wed, 13 Sep 2023 14:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq8V=E5=citrix.com=prvs=6130a4f39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgREU-0006wr-El
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 14:52:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30559458-5245-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 16:52:43 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2023 10:52:40 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN8PR03MB4932.namprd03.prod.outlook.com (2603:10b6:408:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 14:52:37 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 14:52:37 +0000
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
X-Inumbo-ID: 30559458-5245-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694616763;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=uXfCRbfodv+q4yTeq+lli5/Kkhf+BJKfLLdKG2T4Pzo=;
  b=B5UqfdFx5hK9ilr5C/AZbzEgKhruniIRaTjNLXoCBTCyUbhtFIsbIC63
   ZormvoGacVOJyidpEdGK5SeoubItE/emfHdm5AvQNvSrUeAmiYYoUdskC
   kkZSuxYjS1yfyJYj5PJLXEP/tTFM/n/5DHmBT2xwntFv2Dl0+AeeIjaxq
   A=;
X-CSE-ConnectionGUID: for0BP3DQaWYgclEjQQqpw==
X-CSE-MsgGUID: G73E2aezQs6DjpcA0IP+QQ==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 122386469
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:DZ5Y961v8wo29yRglfbD5eFwkn2cJEfYwER7XKvMYLTBsI5bpzZTm
 mUWCDuDb/2JNjSkft4gOYW0o0kPup+Bz95jHVRspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfD2ZUr
 dYgcxw0Zy+yiOmy7bCCc/B0mZF2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LWUzX2nBtN6+LuQ2aExrQeay34qE0M6V0OwiKGYsg2HYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxRupPiwYK2IqYjcJSwEe75/kuo5bs/7UZtNqEarwhNulHzj1m
 mmOtHJn2eVVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:3tzwU6tVvXKeoa+OOqI5q3Kh7skD29V00zEX/kB9WHVpmwKj9v
 xG+85rsyMc6QxhP03I/OrrBEDuex7hHPJOjbX5eI3SPzUPVgOTXf1fBMjZskDd8xSXzJ8j6U
 4YSdkBNDSTNzhHZLfBkW2F+o0bsaC6GcmT7I+0854ud3AJV0gH1WhE422gYyhLrWd9a6bRPa
 Dsl/Zvln6PeWk3cs/+PXUMRe7Fzue77q7OUFopBwMH9ALLtj+j6Kf7Hx+Ety1uKA9n8PMN8X
 Xljwe83amos+i6xhjAk0ff4o9bgsGJ8KoxOOW8zuYUNxTxgUKTaINtV6bqhkFMnMij5Ew2kN
 7FvhcnON4b0QKgQl2I
X-Talos-CUID: 9a23:C1sql21jF54yjFh3I7nrPbxfFMc/Klfll1vpKnCJBm1tZb+scEaI5/Yx
X-Talos-MUID: 9a23:r5ET7whbuA7VintVQaChNsMpG5gzzv6nBVI0issqudGPHHRRA3SktWHi
X-IronPort-AV: E=Sophos;i="6.02,143,1688443200"; 
   d="scan'208";a="122386469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MklpIv5QZ/QbedSQSyUfhOb7fb/l+vDF8ROilczyfP7wh85RB+4LA19bk8XVC0DTXke5DdoQ1NWPbSUDeN0HMbhQwv3pvmNPdu/RS0DqGrVIgGMCldR6hNLKo9B7mx4cs1HQkjEflZ5Q+3zRmdQhcCDWGrfinbDEJRqqfGW2YRvNjx5WI4Kz9mFMh6rXh4u4tzOcBnvh9xUvHM6V7txPR+uO8OdACqRmfvQU+LzAF7P+vL6kyQ1jEEWogTVjbzwgB7MZfyzFkaadCqW2I+t8VgdqqpGn0XoieZzC6nGdJswrgxmkaXbC5nlGtOYU3OegbAgZfFKXfCkCKk0oFSm6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJW6Iw8KHl2ZFwdrOSWrwQahsI9S6yNabUtrApUZrTU=;
 b=c8Oq0Rz604WRlP1bLY4x201ZiGYolDtQb2EUvoCFqs70EJs3KOX8bLW8WXjMgdB4uRe5E3OjPB9HHUEinz1Tlp+lrPW5LMyN/91OlGcoUZmYvlgTI69CvWhvxbZW2ycrxqAQW8SGGP6IBlxPx7twUXaAgUDb9EHUg4qHXimUlvxAatmOZ7672QRmxpvVSCBy4Fr72pjmBGhwYoSacY34m1/Wq53ezKtdOW5q7FDZh+VNoajBGKKn0w+zBWwLVf2O0InQ36cF0z/6oHT54hJNrdOZnYmpDZ+2D/TGa3Bm8QeTt6IBQXxE/8sfIQu/JotA6AC1PJQp3h/2M27WSWFcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJW6Iw8KHl2ZFwdrOSWrwQahsI9S6yNabUtrApUZrTU=;
 b=Xc/fLJ7t+cyhsbINGosC4QLH951mGHmCVbJsbHnjZe1/UkvOaEJMTrCU1tJvN+ZAduUxgXIwfvEfHRrSRva+CE05OHxBobLV71AFImkJBDJgXfjPFvLe0C43Dw27Cl6+4spSXrAeX2kNFyvsDBeQdWIEXixJweOTGI//DEf6G6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Sol=C3=A8ne=20Rapenne?= <solene@openbsd.org>
Subject: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Date: Wed, 13 Sep 2023 16:52:20 +0200
Message-ID: <20230913145220.11334-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::20) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN8PR03MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: a63af712-cb2c-4b56-18d0-08dbb4691240
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AGe7OlnW0HfaSeju5Vm7RxaooD+WKvfVll8HfwavXpjaMqj+ltzXBUogWOx5nkaNDR5e1s454Uk84QwwaXoV0LbdtAV6oXikJLR0f/Nxylhn426/C3IPfRyAZlgdAsibOeJn1CeoyES2OUn8IFVtmGXGWTiBR97IAlEiJ0C+rLtLJqWTu55LM83hCc5sVepSuqsEC/yGfa37BPyZ3wAI8bW5SgkPBArsAMhyBWresdNzE0CancJ9CeDsOMWyNyz/fz58YwJ4BBsH34BbSy9dWdIzCuuS7IlanLK9ZHT+FKG3FIwcrs+OPpzlZGvOMGF0MRJz/1qXCy2wGnfu1zC+1wm0xuyN7m0VOc3Zhn4nDU6a7Ptz2QV46RPS1BcYlnBejvUX+AGNLohLp1FcGudFrRxGt9WpoEDC1/oztoylwUeA+DN5LYU8kwsaDGlLkCl8zllVIKMyvnhg7OJID5lQwSalI4RA9IOBXSljQwWSGBf/hus5zoVkv6znjPDZGLlZgRnonpvxQmKEfLmuqoH5rdcUiL3sUol6FLvE1zFvgTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(186009)(1800799009)(451199024)(6486002)(6506007)(6666004)(6512007)(966005)(478600001)(2616005)(1076003)(26005)(66574015)(2906002)(83380400001)(6916009)(54906003)(66476007)(66946007)(66556008)(316002)(4326008)(5660300002)(8676002)(41300700001)(8936002)(86362001)(36756003)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTZ3UjVPa1BvN3VMb1dxWmZCSXFIVC9tUzV4K3FOZ1cvRmpTaVhpb0Q0QTBJ?=
 =?utf-8?B?bU8rdnRHU3p2bElvaGFOcTZ0UVRXQzNLd1FHWmhpS1QwMnEwWjlqNTZMY2F1?=
 =?utf-8?B?RVZ5aDdqbk1kbVRxVTRIVk1UR0hSMUxhUXVNMkNBY2srelVCVjRVcHBIRXNo?=
 =?utf-8?B?ZU0vKzZSY2FWVG5kNG1vYm9YY3lnLzJkQXdvYnBZZGlrak4vYWlTRzFJTTRn?=
 =?utf-8?B?d2ZBMTV0cDRUcDl1K3kxNlMydEVIbStzN2V4V3ZzZjlLZHVnTmRUeHVCOTB3?=
 =?utf-8?B?aWNsOGNNekQzTHhJUWtidGRqY1A1U2R6QzY2NlhkeHZSVFF0cmtSbGZpVVY2?=
 =?utf-8?B?MkZ5VkM5M1dncXF2Y0VTUTdFQTJIQWl2eHdscUdtNWY3bTg5dUtXSXdVQkd0?=
 =?utf-8?B?R3cvNEhobEpldGliMTUyY2phanV4enlPUWdlS3lhNjVOK0x3VzI0REd0Y1ky?=
 =?utf-8?B?OGJ2Qlg0NjdiRGV0eTArSzVmWno5aVpDaXNYczRGMWttZUl1VVV0aVhlVnZC?=
 =?utf-8?B?aGVWNWdPSVZVb2kzTjl0ZzV4ekhXeldJSFU1QXlUSC9oWVhjRjV4U1A1Sjdq?=
 =?utf-8?B?S3NLSzE3ZXgySWpNQ2hXOS8yUUQwWTZ2OXoyMEgxb1U5dHRxdEt6OHJDdndr?=
 =?utf-8?B?c2k3dG9ZcktJK1VBOEp2ZnR3WWxlMCttSG9VaDlsMElMR3RvZzZBTE5EZk1x?=
 =?utf-8?B?NkV3aHNvUi9saHBpRktHdEZreTROZXBjNC9ObHBwMlNlTlI4TGNya092cXhw?=
 =?utf-8?B?ZG1KRnVaSWVVLzRDT00yM3k0bWZaby9iSjNic0VyWGhRY0k4NlhlcWtpNVdU?=
 =?utf-8?B?U1dZWitCOEc5RlM4cEpnSGpMNjBXaU5Da1FaNEhjSVg1a2hCZU44eWd6cGJK?=
 =?utf-8?B?Q3gwaUhzd3dVVVllSGpxTGdMVWwzcVFYakx6L2hZQW1nVHY1eG9OQlN2cEZi?=
 =?utf-8?B?Q1hySDV5dmZNNU9KRkxNNmpaS0I5STJtdFZpeTNYOHVEUVJaNk9qY0xNNmhq?=
 =?utf-8?B?QnJBUGFNNUtyL2RCWnR2bTNmZCtiZlVHN1pWSFQ3WVpvbktTY0ZYQldQV3NK?=
 =?utf-8?B?eHhtYzNzUE8wWUtJeVFucGxlYVlTclByYmtvSEpKU25ZRmxXb3NVVVBuZ0dK?=
 =?utf-8?B?QU1FMkMxN1A2NklCdFNlWittc25Vcnp1R0svQnpxZUdhcDJjVEY5ZnBIOHdi?=
 =?utf-8?B?WW9mU1VOS1djazlhUkprN1NIelIwVzhNdGt4MFNEUDNQTnplbmYvcXV0STQ4?=
 =?utf-8?B?NS9QNkdhSFd1bHIxM1BZdGlzcy9WY2pMWVcyM3l1cm1UemJ0RXV3Zmt5WXBq?=
 =?utf-8?B?eU04UkxMdTB3ZERZcFpOVVQ3NE9lcEh4ODFWNWxrQ3NZeW9uVUF6eEliZ3Fm?=
 =?utf-8?B?bnlDVzh4ZEFybXl0OGkvRmZUZWpKRzZaV3Y3SGQ2SVEreGtTRkwwSWVZTWMx?=
 =?utf-8?B?dG41eHZtckU1VFFRSjBNQVRZTlRxczdWMVFsMW5WdGJTRkdyeVk4bDh2NEhU?=
 =?utf-8?B?b3N6Y3NkVFNVNWl0N3BZaGNSOFoya1hRVFVHckhQRGtRQWxYKzdpY0M3bjcr?=
 =?utf-8?B?eWZSMys4QW1oTTB2QmZSWEZKLzZESlFQZ0c5Nk0xTWdteHVJUUY0QWNVekN6?=
 =?utf-8?B?UmxCTkFEaGxGWGdPTVRJWTNnYjB6NU52d0djQVR2WUJYM2ZJWG4xTGdVS3BN?=
 =?utf-8?B?T1EyaEhXR3lnRmR4RUI4QlIwT0xYVEFDSmNLM01RbWhQR3RiVmREZUd4WnFE?=
 =?utf-8?B?NW11UGlJNkNSZzVGYjdRaURxaUhHTXNmVUM2ZjBmbU9CeUhJZ3pLTDRYYlhU?=
 =?utf-8?B?a2UyN3lJWkZPNU9OSVNNekZiMFIrd1l4QktzcitwTE5pSlBVT3ROdEJEbXJN?=
 =?utf-8?B?QnlTeU4rWE5yR0Jwd0FoZDU0cDJwc3hZUFA4bTRpSnlFN1JEb1h1cit6ZXZC?=
 =?utf-8?B?Vyt4eVMxQklrVFE1VWlET1lrZThybkVtQjJMMEZXZW1UY2xtMFZjK0lQbDR1?=
 =?utf-8?B?dW0xcVJTNU5GNXpaSlFPNUdlN0lWaFZXY3dRMWFjUEdNb2JIckY5MzA3NDJQ?=
 =?utf-8?B?VzBRNnlzbGdNUTRqaTFidWhjQ1lHd3I4d0ViVUNrK1ZWTEVvTkx4dUkwdW01?=
 =?utf-8?Q?3XbouUx0iw25Hc3aJVcyOqj/C?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ojvQqonf+Fix3FG5TtFywJjCrPT890soum9iUmGK7rSpmCVL+pT+KbEp73Mo43AlE81e9ccx9AqU/NCvYgMJfTcdkhj3UrOOXq3aU2I7uIPmZKF20H/3gQcxXrcsxVFmqcS/TjQzMPQFksIB/uTGwLNoVJoaYzGRXr5GuNgeKZv4yr7dG+NzbP30IfLO/DXrDFfDBX0EqZHnkUMOfhjhFJ5olyxXJjAl7b5AvazYl5at7z/51+Ggm4F5Sez7CpZCpymW13UW4Ovj6zm4ES7gzy3MUenp5W3Hmg/B+wn261UApm2skZZpNaoEmCoyowXoFBKR5lM2kwCL7rsSS8xS1S8KK7gusCcUTonCrGi9X5dHrYPYJ6RRTiaf97MyiIvnkTBVQFzKVD1f0h1TN/VudQ+MVKPVckAVBsSAE4IiU6GodAQ2yrG0qeBxB4b5ib6gw0BaXWaKYGINCpzcT03Cq2nrldPgWo7Y6oFWoZySb1IKKFjNwk0e43ccdwNd/9pfGIeboUvsjaDh9XfzwOhxBPX6nMFotf+RJjeXCHvAiXwISAnCw9MBmaoki04ly0ok6WpzJ5ObnIJMpE3AW3l7KvqvuTd1LI2S09x5GXzbqipmESzv/3ieHaj/rBe78PgV3pgLXDdQxGouu+8VyRLxLS7lNshYhjcuPL21J3ub7NRMXeb6lUVeNpdmxsVZPxBzS2Nvs5UbYMxx0+ofcOjHhtJjYY7jc0nf2O5JEa5I7rcnMSNTAIt2mL8woN2kL6Zfwpd3AUVweO4/2I12WJjgudt8rWOvodWW24ZxdQijxEuj4rQuYRFfW3y3MkvyyWATpky7BFQQ74Vn52xtMhGWZgEETECHtb4Iwo8uI6+r1Vo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63af712-cb2c-4b56-18d0-08dbb4691240
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:52:37.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8wtKsTzUyo1yi2HIgVpb8T5ZsHiIXQt3AnrxjxpOnFHIJWfp43hZZt+QDR6v95ntsYhkBI9tbyUcqauY4tHOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4932

OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
Invariant, and it will then attempt to also unconditionally access PSTATE0 if
HWCR.TscFreqSel is set (currently the case on Xen).

The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
TSC increments at the P0 frequency.

Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
because the PstateEn bit is read-write, and OSes could legitimately attempt to
set PstateEn=1 which Xen couldn't handle.

In order to fix expose an empty HWCR, which is an architectural MSR and so must
be accessible.

Note it was not safe to expose the TscFreqSel bit because it is not
architectural, and could change meaning between models.

Reported-by: Solène Rapenne <solene@openbsd.org>
Link: https://github.com/QubesOS/qubes-issues/issues/8502
Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 3f0450259cdf..c33dc78cd8f6 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -240,8 +240,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_K8_HWCR:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
-        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
-               ? K8_HWCR_TSC_FREQ_SEL : 0;
+        *val = 0;
         break;
 
     case MSR_VIRT_SPEC_CTRL:
-- 
2.42.0


