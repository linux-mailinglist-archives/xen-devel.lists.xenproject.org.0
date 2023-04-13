Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF76E0E91
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520744.808689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwz1-0005uC-Fr; Thu, 13 Apr 2023 13:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520744.808689; Thu, 13 Apr 2023 13:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwz1-0005rh-CP; Thu, 13 Apr 2023 13:27:27 +0000
Received: by outflank-mailman (input) for mailman id 520744;
 Thu, 13 Apr 2023 13:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmwyy-0005qb-Hb
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:27:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e97e78c4-d9fe-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:27:21 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Apr 2023 09:27:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5824.namprd03.prod.outlook.com (2603:10b6:a03:2d0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:27:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Thu, 13 Apr 2023
 13:27:05 +0000
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
X-Inumbo-ID: e97e78c4-d9fe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681392441;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r0MfYP8Wrn/gvQc3A35Iu17mJutW0KFbhur4W7xAmNM=;
  b=BprTPBdu8bg/Xyz87zIJqREbpdi0xpjC3ZyJM/wurshdfyHyT/s03OcO
   hKrhe7gp7IVVO0f82aIjljLiA1qlFY341w5SVoyJotAwNotgj8Ta25lRH
   2/l1ltlfqACm0NL4CewZo31Fs+OSIPhkt+O0KbnKynIG+JIn//cfcI++y
   g=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 104168221
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vxB5BqsS+zR+cMMd6AaLjVNTSufnVP5fMUV32f8akzHdYApBsoF/q
 tZmKWmEM/eLa2L9eNonYd+yoEJV6pTVnNBiTQRtr3hhEH5H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwERIVdAqq3uGNwLPiYLlXwcZ8EO62I9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqc00AfJnwT/DjUKUluLjMW1inehUo5wA
 GAV9CUfk4cboRnDot7VGkfQTGS/lhwBX9tdFcUq5QfLzbDbiy6bC24fCCFAa9gvssM7XxQu1
 1mAhdSvAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZvxuCrKvh9v5XxT52
 SmXrTMWjq8Wy8UM0s2T+FndiHSmoZ7PTwU0zgzNWySu6QYRTIeuZ42ur1fG9epJBI+DSx+Ku
 31ss9OF8OkEAJWJlSqMaOYABrek47CCKjK0qWBoG54t5jG84UmJdIpb4Cx9DEpxO8NCcjjsC
 HI/oitU7Z5XeX61N6l+ZtvpD9xwlPCwU9P4SvrTc9xCJIBrcxOK9z1vYkjW2H3xlE8rkuc0P
 pLznduQMEv2wJ9PlFKeL9rxG5d3rszi7Qs/nazG8ik=
IronPort-HdrOrdr: A9a23:znOweqjue/whnwXg5HKdHYKPvHBQX1B13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftWjdySOVxeRZgbcKrAeQfBEWmtQ96U
 4kSdkHNDSSNykwsS+Z2njfLz9I+rDun86VbKXlvg5QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Lk1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoOOCXMsLlbFtzfsHfoWG1TYczDgNnzmpDt1L8eqq
 iDn/7nBbUw15qeRBDxnfKn4Xic7N9n0Q6f9bbfuwqonSWxfkNEN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3am+a/hGrDvAnZMZq59ms1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgn/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9MKOM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaCqDgDKFC66
 gpfGkoxVLaIXied/Fm9Kc7gyzwfA==
X-Talos-CUID: 9a23:elUmhWC/SzGqgqP6ExBF7FQOM5kmSX3clV2AGAi6VlpOFaLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Aze67rQzpJvP/2VrN0wdOwxdlMvqaqLipCHAgrZk?=
 =?us-ascii?q?GgtaNaQNbFzaTgwWJbaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,193,1677560400"; 
   d="scan'208";a="104168221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO6Th7zRZ0WB+3rGUrGuuNyAAHYVJEkq9dwKT3jO7oRF2yazjnozjrW/j8+bC+3A/4KM2xTJmugDViFjEQSah+gKhkkA9dkfMh+crHuxbr+fZuj4/kS0egO5eLZMPRpolKdjXy9nqe9lRWwBeYJJLKlxACWamhPPvY4NTbYI1NvEOA2zNrolecIBCnXRCIBU99qogvpxuIz/eL+hEj/2emB+K3xUZub/R+Futc2j61clxx3vIh+95OeGWJixI8Z6xL2IjoyPYl8yydXXtm5ikLYvDfywz4ZSScrmAF0pgOrtKd7R3+MFFiVvkUXGZ30gScc6awQRPOlt5uWP3EXisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0MfYP8Wrn/gvQc3A35Iu17mJutW0KFbhur4W7xAmNM=;
 b=MFYoaOr44U5Tv+WUjELtd3dPFqpEm+n8qQHTymMZwZdz5y2xFibSG2evltvFv7UhmnlHAj+Oi1fKd0mhsVK2H7BN3YCxDrVU4NMcOvQlDddT+i6ssVCigxwa/GABQNnkZAbewb/d1TGdPblwrpDgfs0drwDLsa3gc68M6NT8TMYP9If4ikpgb1qw26gv6Hfriwo6VkJFq5qnoDVYUbSHJu9yhztWbeUWYKSVCMqt7PVmgLj/tXdy0XRv0pCjJEVugGcZIdUfb0ALIc6uAUEul/KHzthrZdjxdK7BUiI1v2uugqBzJd62/bR2xOXH0aiBhjuG+VivXoInwCu2sT0i8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0MfYP8Wrn/gvQc3A35Iu17mJutW0KFbhur4W7xAmNM=;
 b=iAm2CTIeDPCg5Pp+lvNQYfTLXvjvXBzAgqQh3Ttc2/fkZTuZBIvESqKTflUvSbPRUhGGOib4tPycts5S92vLfsK2UD17zAN7j+UFWQc3St5T/xgePLtbEwkI+ICMK7mO2+qokPwxK328WXY7tV4WmyQqIbfX+B3N8Sx2Spbyd2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d7f18393-262b-f2b1-9af3-a371dae75994@citrix.com>
Date: Thu, 13 Apr 2023 14:26:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jens Wiklander
 <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-3-jens.wiklander@linaro.org>
 <ad1d5ebd-38e5-bab9-24ac-6facc8ccb95c@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ad1d5ebd-38e5-bab9-24ac-6facc8ccb95c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 37544ae6-4e45-42bb-031a-08db3c22c62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dKUsDklUK1GRYi3J8PFG/pDkc8aDWd8TsPcDbCV5NLlEEf0JHfYcGp1FuE6zRtZ2/u1p1neY/VUTsMMGGlI/b5fUf4UXCf3zdkWcSj/Qqswtc0fnn8jjI45ThPBp47oH0jGaxdSKJ0FkhgilAu2WtEZM21ekOwDXB9DJECCJro6g9KTW0qmmjZT1l6JNqKU+qFayn+clhg5uAPJHQ7e3Bs1Ei3/4I592/W6imgF2SJxRZ8R730ib8QN8+xxCURfWZeTukaHEzKtEd7Dxh33OYFL2BbBqgMEMZ7QR9DbzdaUjVdlytvKtgpkGSO1NSjTTVp0ehVKbqm7PbuJmG9WM1mO2Zi5lpzU8ActMcCWtt1bZANI5q1LCunxntjidwoOVsw6P1gFvN9QTtXUUW1BsZD+jsDe2QVtM69D8pvkKGZsOg5LeIT468wYlkWl1nrFHx7HLGgtuHfF8MmCrRJz5PPDOpF8Xm39tmUuOeph3Eq0vXM2UHIlMsa5VDwwSnBa7aHSjut7smfcJJrcAjBKe1hQA9MeYcvAw2hVw8F/xsUBbqgDjNLr7ssOhxRt4ZD2gtXJbrgsi3BwhbJiHVn2FqsmGvbrHDotFml9hDQ7EBSMxkuFyuxYA7A48UGFyLEkHcAnLrxylD1jXa+G+zrANQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(6666004)(6486002)(66476007)(66556008)(66946007)(4326008)(36756003)(110136005)(2906002)(31696002)(86362001)(41300700001)(82960400001)(5660300002)(8676002)(8936002)(316002)(38100700002)(478600001)(54906003)(53546011)(6512007)(6506007)(26005)(31686004)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1R0ZFRHSFZ5SlZxd0hIVitsTE05QWZqdmVBL3drOXlnSXAwVkhmWWZRSlh2?=
 =?utf-8?B?bGVUbjR3WXFsQmpWWWN1d2ZuSjl5RkJ3b0JqMzR5cEVZbm5vTnR6azNSWDF0?=
 =?utf-8?B?cnFNYXF1N2VtYmt6UHd2cGNDSU1VbkpITXpjOUtzVnhFb29OaU5JQUdpeWtk?=
 =?utf-8?B?MlIvMDdjcXJFUHNyODZUNTdWeXVraElDRm56N2VzdWNrK0o0aTdLejExRTJl?=
 =?utf-8?B?Y0I4UWpScVpKZFh4ZGcwT1FoQlBBTDZCTFZBM0M3cGhWNUJ1blZOVGpXQ2lG?=
 =?utf-8?B?QnpMbW1JcnNjbkcrZ3ljOExmWXZzNnhBSHFldDhveURCV1RJZmcvWm5kQ09O?=
 =?utf-8?B?N2V5b2dvNEdENm9xNnlkOTJIOUhqY1dNQkRSckNyaGVwWkpsNHBlWnpoa3JT?=
 =?utf-8?B?dDZxUkx6ay9MZzdDTURPL2h6ZnJ1ajBYQllWOEVlUjdsb3ZmZ1UyRWtmN1E4?=
 =?utf-8?B?WUVzRThJcE5PSFQ5bGs5YzYzWEg1Slo0S0Fjb0l4MXJJc0RMZEJ2KzRYWXZE?=
 =?utf-8?B?TEwrM1lGTTBtamZORUdiM3NTcE1QOXhMMll6cDJaejJLVHJCZGQ2Y2xMSWxF?=
 =?utf-8?B?Z1QvdGsvZ04xaVZQU3FqRlg0SHplelFhOEtWc2JIQ1h4akpXdmxxeEd0UGxx?=
 =?utf-8?B?bitxVzRicVBJNURPcFhSdEIzUDhBUlZ3NWJGUHJMRllvTWc3N1BkY05BZ0N5?=
 =?utf-8?B?NXp4blp1OVN4alZaMkJBY2VIVjJmTzZsK1dUWk0wYTZ6eHVGK3lkNUhLS2d2?=
 =?utf-8?B?aW5KODdDNk41YUZUcXZmdTZ1YVV1MCtlTzYzY1dleENzYkpMSlZpOEs5RklD?=
 =?utf-8?B?MWRjVTA3dG0xamRpdmZyQlY0ZmU4K2VuV29QeHBjU0MyVUwvRHV2eUpkVXpz?=
 =?utf-8?B?NFBMZ3hYRldQdDdRdnI0M1NKc1ZlVVQ0QnBWOTZwK21hZWhURlp4bHIwa2xv?=
 =?utf-8?B?cXBFTXpEdWJhdlBuNE9rc0g5Rml4Q1BrZXN2K0hLZnZUZVk3Q3ZlQ2VHL1Ar?=
 =?utf-8?B?NnVUL3g5azZzWllrR2VlRUhZZ21LS3dQWlNMV2s2bElJeWF4SnVZNlIyN0pl?=
 =?utf-8?B?OEc5ZU0vRUpsQ0xnTXVYZ2sxR1liTGgzdnhvcDZZNllmaiszMmc4b1dCVWIr?=
 =?utf-8?B?ajRjQnkwTEFaNHBSV0kxNWhCRnVaNFIrOWhLSUtMcWN4R2k1L2RHcndNcEtM?=
 =?utf-8?B?UEJReTZIZSs2OWpjZFFoWGFVOXhCUGtTRWc3MkJNOEpadU9sV1FpYU0yV2wx?=
 =?utf-8?B?dU1ucE5MSm9QeERVVE9ybk5PdTJOQm5XcitLY3NvcXdiZkQwUnQyaVpNL2lQ?=
 =?utf-8?B?SUZtcDhYL3NSWUNza3JCNDBsQ1liUFR1ckFoL3dzbzlGbS9yNEI0Wi91VHNX?=
 =?utf-8?B?UWowSlRHK2YzMDJhNEFxdU1jUE1qWjlvb1h0ZUd1QlFMbmtnWHZNZytNT0pY?=
 =?utf-8?B?eFJlMjUyMWIza01oRmk3ZGFVdlFjeWxqaGYvendXdGRFdThpblJkVEdJSkpT?=
 =?utf-8?B?Qlh6SHIzdFpLYWh0WDhtcWNuVnlNWmJBWHFZb3pKV244ZStFTk5USVBYcjBv?=
 =?utf-8?B?cGFZalR2d1dNRE9JcHlQZjJhSGM1dkw5OG9VNWZwdEs3dGkveDBqODdaNHFZ?=
 =?utf-8?B?RXFZYnBLelM1eUhhbGpNOUFWK081STFQRmMyWFl3ZEhreENuaGhVLy90ZkxS?=
 =?utf-8?B?S0JEdURxOEtRbk96OFA2MUJ6UEJGYXV6aEhBT1YvRkc2NEN6NGVrbzRGL253?=
 =?utf-8?B?MTU1TkVtdHVnclNsZUZockdobmdVYVh6RGRrZzNGYSs1bG4zNXZBUTFZQWMw?=
 =?utf-8?B?MHNFdlV3RlVaQWk5S1dMUEFvMko0L2NXbzBlUUN6OEFRcmFaSlhDVHFGSVFx?=
 =?utf-8?B?eHB0M1J6eG8rc0wvUTduekdScmJ0RjZYaWdJQk5qN2Y2YmpSMXQ4WFRkcVQz?=
 =?utf-8?B?V3dUTFc1Wjc3WFNYcjBOTG04OWF0bHRoMGFZV3R1c2pWeHBsckhXMlhYMnQw?=
 =?utf-8?B?WlRHWmxZSmluMERmL1hsZ21mWFRia2VvRnZYRlZBeGxLN0lZbEx0TC9YV0Nz?=
 =?utf-8?B?d3dneVM2T255dDk4eDVZUHcyMkJDMlI2emw0eCtxalZOa1RnRVFFZk9KWEhV?=
 =?utf-8?B?d2Rocm14dW5wdVVkcndLUkhCMHFNM3N5K3RGMnJadU5XVy8vMnpLVFVYUHB3?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g2HpqDSPs1UWzoV93MCYkA6IlhBGNqbZUvauUaAI81Tdsqq6iq6/vl3Nu2Aji8yDjDjFq5oJNzihSJ9SFs6ZBoA7r6il4Gi7NWnGT7BJXzxPySk9iopzjRoU4LwqvymFqMT+hbp2HvUf3tafJdLqNXKmaAE9S7oD+YYZKNGapt+EYJk1v7QVE0SDrPsqLFYZS0oqlXgMiBg2W5ablih4oJV9iFoX1F5sfs12ks3oPJ01wQLytW4pWN4tTD2nzJJzofj6/MBIncmtJoTQ/dBKLb/TDWpF3AP4q9iyNyt9b/gDCtrmdi7JBO0jTg27wOgSM6Sdu2BOSxrdsxgc5JYJhz/nedowY/GHsoIM6XsPbW17Z83GbZhHn8P/e6kDusJQQpbqxeyKN5AsnhbBRfBDPJuZ+o3zQXEUsnFTacgd05rHBRNpxpOGGCiwmhetriIZ9NuQ6wnl9xC4QTX6qTg3/CZYriG/LeN+dMPUZ8cyLk+RzlbwMyYRzNNwyCpIc03+GwSA+xT9S1kngMFm6fP0BA8EEJP4IqaG3wEix4n6zKLiZbjrU00zf7MOOwyyVUCPQGxndOyi1gZNCCc+4pV6G0sugJYqSG7wDHopQMQvepJ+HfwXogyGVIdPIfzfHSpcUmb/ow9hnMfw4HDBR7/bx+MYzRogASglOUHT2xs3Z5S5h9Uf+DP9kTQVqA/sVJwPMU3wIbiho9RB0BFSXgU79kCQO9tH2I0Xh9/fnzcDfoMxwCns3Baz+3Nty53MtqboNdBa55xDJg2LRXZQC0RTFxWFi+AeUtereREq5lXlL++a6z5LKFetaaPfKdYgUzTUD3R67bNfZathHDSyuyGOl6lP1ghK1AEVXpJq2XF6NEEnlxKX/bWMCWGexwC+sk9XXAhcni/WNH1/dU+NBJ44PQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37544ae6-4e45-42bb-031a-08db3c22c62a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:27:05.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZIvLrlQ7euwEIiKXaqE8s+m96IpwhKkt72yn/eC8N6HVWBqZSs3SHaMJrD/CGNjLcitGakoardLLckochw6TwnVge/gSOoSpIRD24dPssU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5824

On 13/04/2023 1:26 pm, Julien Grall wrote:
>> +static int ffa_domain_init(struct domain *d)
>> +{
>> +    struct ffa_ctx *ctx;
>> +
>> +    if ( !ffa_version )
>> +        return -ENODEV;
>> +
>> +    ctx = xzalloc(struct ffa_ctx);
>> +    if ( !ctx )
>> +        return -ENOMEM;
>> +
>> +    d->arch.tee = ctx;
>> +
>> +    return 0;
>> +}
>> +
>> +/* This function is supposed to undo what ffa_domain_init() has done */
>
> I think there is a problem in the TEE framework. The callback
> .relinquish_resources() will not be called if domain_create() failed.
> So this will result to a memory leak.
>
> We also can't call .relinquish_resources() on early domain creation
> failure because relinquishing resources can take time and therefore
> needs to be preemptible.
>
> So I think we need to introduce a new callback domain_free() that will
> be called arch_domain_destroy(). Is this something you can look at?


Cleanup of an early domain creation failure, however you do it, is at
most "the same amount of time again".  It cannot (absent of development
errors) take the same indefinite time periods of time that a full
domain_destroy() can.

The error path in domain_create() explicitly does call domain_teardown()
so we can (eventually) purge these duplicate cleanup paths.  There are
far too many easy errors to be made which occur from having split
cleanup, and we have had to issue XSAs in the past to address some of
them.  (Hence the effort to try and specifically change things, and
remove the ability to introduce the errors in the first place.)


Right now, it is specifically awkward to do this nicely because
domain_teardown() doesn't call into a suitable arch hook.

IMO the best option here is extend domain_teardown() with an
arch_domain_teardown() state/hook, and wire in the TEE cleanup path into
this too.

Anything else is explicitly adding to technical debt that I (or someone
else) is going to have to revert further down the line.

If you want, I am happy to prototype the arch_domain_teardown() bit of
the fix, but I will have to defer wiring in the TEE part to someone
capable of testing it.

~Andrew

