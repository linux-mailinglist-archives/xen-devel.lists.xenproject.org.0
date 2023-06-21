Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FB738F0F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 20:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553105.863471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC2qm-0005GZ-Ls; Wed, 21 Jun 2023 18:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553105.863471; Wed, 21 Jun 2023 18:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC2qm-0005DZ-Ik; Wed, 21 Jun 2023 18:46:40 +0000
Received: by outflank-mailman (input) for mailman id 553105;
 Wed, 21 Jun 2023 18:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC2ql-0005DT-3t
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 18:46:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f23d7ad7-1063-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 20:46:36 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2023 14:46:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5140.namprd03.prod.outlook.com (2603:10b6:408:7d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 18:46:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 18:46:14 +0000
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
X-Inumbo-ID: f23d7ad7-1063-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687373195;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hBcCok7NZ1kV2z/uM3FO0uXtGgpAJOYcJ1MZ9EXDBbQ=;
  b=H4mbz4QIuCKODom6/z++25uFatsq0Dgba6C46A6emHIk8iZqV41c4Ffa
   UovfLj+mTnSTDPzgM9A/viOCXFC2InvGrs5X8KbNlHU0D7N2innGlPtFR
   ODybxjNMMxU4+KYnW1G8xa5Q2At82q4vuVRwlkriXL919B+T6LjKhJP5v
   I=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 112401450
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sowgbqk411vR+BmK0bwJFL/o5gxPJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUW+Ca/iNZWHweIt+O4m2oxgFu5TdnN4yHQA/qig8ESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5gaGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dciDCtRSjOdvLzowIP8drVB2soIPPC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTefkrqc23QX7Kmo7LDQJS3K7i6GCrRS5YNAHe
 w8tpRoBov1nnKCsZpynN/Gim1aftxgVQMZZCOw9wBuE0rbT+QufCWkCQzNbadop8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMZ+9Tqupo0iDrVR85/F7S4iNL0Hzz92
 TGMo241gLB7sCIQ/6Cy/FSCiTTzoJHMF1Yx/l+OBjPj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:PU8YiKmnCKg9j25HnnpiKPQzSOTpDfJP3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNU3I9errBEDiexLhHOBOjrX5VI3KNDUO01HFEGgN1+Xf/wE=
X-Talos-CUID: 9a23:uV80Zm0HudXBwvJddnKjgLxfMfoBaSH572nrfRG4OCFVFJDJR3SAwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AHNH3OA/mOrvuj1bmVfroKGOQf+NB/LqHCGpVqrJ?=
 =?us-ascii?q?cvPKGbXwzAmitozviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112401450"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnNJR5FpLsbNhO0Oj7sbn2e6KG3I39aXR3T6fNjmlFhQUlVaDChVZG0uCu/sM3ItucMlasFSaRffmjk/BGy4+aRRA8hrNTMeBTLe65o1upNfVz58YckR6yR4nxhn1DskCZyeHdtuckl5C5g545J18ksybuWw8xtmrNxmVi71ubJ6+s+lw/aSuZHp/KS2QkqI8j3etoFdBfF/RzU162iQ8omf7hCP7MRW85oKFx71iCJxkiwwqFYXsOd0m90bY3+LDR3eZqFRR/1qvWxqvu27OKSUl6X08Wx4RWrlrxDGc8oqYxwTXgddhy4SsUuNNy5C3KhL6oRIbFzWFWpY9pH1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGLkj4TUiEKuMMbJqtiiOqcjFW3vOw5+T+56DZ0G/2U=;
 b=Vbpf2kkCjGD/hupXlFKbRdlH3ZoigpGvwZamLN1ZjWD3MsNSzx5HRtQLEt9Yrhb/4JaIJ4qSXOwK2M/ejOlaAdkyw6Unrr/5Xpidym46mV28o1J+aNvx99gLpoSPVkdBphjHSMyyl0/6+T+6XBdo6dlzhfZL4yJBzb6HDnTXc3fmfCs+W4lsCDlevP2M1z8VWjUwt0AFj4mEa3fTr+HHARWWgbLh7kBqNeO8Qc8DHgVR0GfatCzPurepvKKP4bkxrCTYhBq5cW/gJokvV1FWfOxL3Bbzoe3ACJTEj3GAabzWtfChR1OZJterBv6GjbOEgXv58YPXItDnLaqnlo+vvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGLkj4TUiEKuMMbJqtiiOqcjFW3vOw5+T+56DZ0G/2U=;
 b=eiP9IWF3E2O5l7lZTcmbrPnYYLU/jPIfadxPeF8692FYdat39nVWDtJE2Z0YmRpw3RJhUfk9DSfqvauCSJ/3Q/UXg+PQELxBmf4FyZe78zfsSyUDAvJM8FhxFYXopJ3RwcoftkvaLbV+b8akQWzg5ruf8NCjKEziOuxZV0EqUzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9d84b265-129e-ba8d-8503-e72c76f2b112@citrix.com>
Date: Wed, 21 Jun 2023 19:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
 <8ac54b2e-b074-18eb-38bf-1041a8109d7b@raptorengineering.com>
In-Reply-To: <8ac54b2e-b074-18eb-38bf-1041a8109d7b@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c3dedc-770e-41d7-f3e0-08db7287ca2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JeODq139KqQRfF609MEuuMfH35gGXGVx1/YayrdULJoycD+gSP4HHjbBoiEMkpRoh2VTWbQr9g+jBcYoIEY8dMI69IMRCiLiV1M7Hruzdin1Ep4Das3QxvGWBz6dlReOzqxWbaEa+y4cYIZScL21DGJZViFjU9lg/amKv356BNrN5JJ4Igb7ZrqsYa1NddR6gOxiLXuMG2EvJXQghrlPVzCr+ONO2BCpUvEjVrXuwjZJBIdEYUOycHVgcIZ0yGRbN+7+BcwGGnK9HkAlpO0PDOcMpC7SZhevevh00all0D94FuUcwMpf4gd1fg3y0A0dgQ7Jx7MiJRyLts+w3zmFjRDtyu8FNvvKdsn+0ooweqjAJLjcrAWxN6rgBQXHaRDYIYU0xfenUFPcMQxuNftyYBthaRx6BGI9tAQEr4i2e0BEVjCh3buMDGPnhGdrBJcBeLWIiEHWMF8dEZTFKbQDw3i4EKPc992Ryc7BWrwUtfKHj13Ee7wZTnCTXDMmNcR6XJRHOev5JNbqSaJqW0wIC4hww73EL7/5eicvDEhGpzOYpusGvnIDFFW5o5yqAH1ROsBCwYP8/uyVyiw/yEZBpay8bzBmvBPa8EQW/U5LPjmJlTRAZh5i9Xw1UCiPT+EKRonDiRWcMcp6PEabJZc2fQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(31686004)(186003)(36756003)(5660300002)(41300700001)(8676002)(66476007)(66556008)(8936002)(38100700002)(31696002)(316002)(4326008)(82960400001)(66946007)(86362001)(2616005)(6486002)(966005)(478600001)(26005)(2906002)(6506007)(53546011)(6512007)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNhdXQzem5UMm9PNUFpamFFTS9yeDFYeG1jaW1VbHhqRFNmMis3cWxJMmsr?=
 =?utf-8?B?Z2Z3TWN5NkJWdEVGdGlBaEgxRkd5YUhicmZnRFVXd0FSSE5yYkx6ZDRDWUpt?=
 =?utf-8?B?QU9Xd2MrRnM1bkZocXFMKy9YZThDYzR3c0tsUStxQm8vdjhpZnhoSlZNc1Ri?=
 =?utf-8?B?R05aWnJhQi9EaUdZWEdFYmViZkJoRVpDNm12SnNFZndJdHBaSVBXS0RoaTVV?=
 =?utf-8?B?a2tsTmNuMnpVY1hTNUhYUWF4MElQZWRkRFhhK0pqbTAvNzVxTFZBVHRySndS?=
 =?utf-8?B?aFVQend3ejhPSVV2bUhhL2hzVG0rN29zYWxYYllKMmxPL2FuZnphZE9EeGk4?=
 =?utf-8?B?a3IzSkhsWkd1UVFTMzFHMDk0Qk9KS0ZQRFZuczdJd3g4eTIzZjV0OVIzSE9N?=
 =?utf-8?B?dWgwNC9UUU55RnFwLzB5R2ZKNHRGNXFtMWt2VU1NNkIyeDJnWHU0V0Nnd2hL?=
 =?utf-8?B?TldZS1BhLzg1cmUrblRpTmNkbWlPaDRQQTdvOVdwUnpGSVd2aWw5MUhtTUxL?=
 =?utf-8?B?MnBhZ0ZVRG16U1JpRDBZeHU1c2FGU1dNdHRDSHB6RUpoWHYva1hpQlZKMndQ?=
 =?utf-8?B?Tkx0bytic3d3WlIvRnBrSlgvVGdQRCtkUXQ1TWlHN01UWmQ0RzY2R095ZDJw?=
 =?utf-8?B?M3FnNlFUdkdIOFBVWlNwcnlCUVkzbzBZNU1kTnZBWm0zdFZyUVhDNURIbG5q?=
 =?utf-8?B?Y0E3aFcyTjRrR3AydFNCZEU5WTRVQzI1akVlWHRCVnRTLy9rQWh3RDJ5V3VN?=
 =?utf-8?B?THRnRjQ2MGMxd3VMUHY0M2UzK2ppOXRVVlRGMW9uSlAxK3BOWmtzejlTRUh0?=
 =?utf-8?B?NkVaNk05aE9hZzVxYkhST0JiR2x1VFlXUzR6SmJKLytTY0RXemtBUFFmMU1Q?=
 =?utf-8?B?OXVvK2VvVExFUldnREQ1d0FKVU5JTUVuMk5RczZFcTVZR0RjZklMcWN5SVlu?=
 =?utf-8?B?MUpFcWFLM0orUitya0p5YWtmRCtZRWpQMGFpR3JMRWQxWXl4Mi9GcXBtYnlW?=
 =?utf-8?B?M3dnMGd5eE0zUjlSOUJUOE4rc0lmdHRPbEZYd3gwWGxlNmRpOURPVzVSMG5r?=
 =?utf-8?B?UFdhWUNxWmhFdVlnaStwNEpaZUQwRzZCNkphcTI5YW5EN28reWhJM1EyRnJ1?=
 =?utf-8?B?MXFPeTZZSWQ1ZWpzbE9YZXZ6d2FjVFo1YUZFRHRWYjdTNzZtMGxiNU55azNG?=
 =?utf-8?B?Vk9DSlFsbVV1V0FMOC9jb0sxaERmbEplTk5PeDllQ0ltcWtldEJlRVAvTkls?=
 =?utf-8?B?bE1XcFhCY2cvbmdKRTRyNGRtM1VyRlZXa3M2Z0liQ2M0eHQwcllqbVFuYll5?=
 =?utf-8?B?alZpTGR5czhFNmUrR3NkdWZlMkJTdTUyUTFpRGxHTGdYMUw5VGFFUnh0MXpu?=
 =?utf-8?B?bmlnT3hmMGlmN2F6aUhCZ2FMQkNXS2hNWjlCc0xTR1o3Q2RFc3RSVlRXV1h5?=
 =?utf-8?B?QWlxSWFmU2ZYckNER0REYWlhZEgyRHZrNUpkdUdCb0hPWjBqUUN3N0hkdWpy?=
 =?utf-8?B?ZHo0OUNyeUJGcEh6eC9zelI0N3J1bGRFV0hiUXMwYzNCSHNKSldXUmZaQUZp?=
 =?utf-8?B?alBGTFEwdm1MeFdKU0NKQWNuNE8yUVgxbG02dTdDbGxhYURrWUNKSTFhYitR?=
 =?utf-8?B?THIyaXpLLzZxS1J0ZmoyMGlHaDd4VCtQWnA0M0pIaXkwTXBRVy9PT0JySTlT?=
 =?utf-8?B?SFpTbExyMTJFWFhOT2Y1TW1wSWl2KzN2eHFzQTdmd0RjOXVFZHpCRFBiUXpZ?=
 =?utf-8?B?WXdaUVhNYk5ZUStDckVtMmZsT1Jmc3lKRGIvUUxHbmhXeWpUMWduWG1kR3lk?=
 =?utf-8?B?Zllzd2ttWFRZN3RtRjZXd2hneHc5aTRXQWxXc3BlKzZSdUtldmJKOFNvdzh6?=
 =?utf-8?B?aVR0aHV5WUFha0tjL0JJVG1Kck9kYkt3YkFIdjRpZlZKSmNqL0cvU0pzelZP?=
 =?utf-8?B?aFAwM2thK0k2Uk85cVlQRm5LYktlVFhyWnk3c2JUYzlkTlNHNlNFWEY5NTRQ?=
 =?utf-8?B?aGxXY2prQTZTNnVQcWtuMGluV0l0VUhVenNVLzk4U29hYjBtaWNqS2RYU21p?=
 =?utf-8?B?TVZyTTBzMEFZQmlkc2M1Ukl6T2FtTVgrQjZWUGlGWkU2aEtFVXVkRkRoSGQw?=
 =?utf-8?B?U3R0aVBTNElMZzdWaXRLR2I2ZHAwekUzd3dBMUliV1dBZ1hwN1ZsQ3NUSUVv?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v5pyMWd4gbdYUk3KJK6x0r8IFovIZmsuMZ59ad/y67ABd8PlMRKiis7xIZXFiCwVSaZn4Id4cF4Tmqnpw7Kkkf6e63f5iWpn85j+BW6O8LmL/3pN/P34wueHzCXVrpcafz88gz0K/mqmGKmG8eJJPpb1gEJEBkeuaK87HFL9nu2R03PaCvg307ZSkF2D/hjXGG+R7crlHfQ4+i1jP0XdAYgl5t9mK7CUI86wj0WUc1p0uOFJwi34kEGVJ6LKrix6ZbNG5Nl3L6AGhbo+w0jBk32aYxDjqgf+BGhk/VU8Qdnnl5e0Yd23fWntUcRUcIJymQS0ByQv6PzLjwoGZEqJ2HGXCMOYQDKgDi2noJumCIayNLtFrJgIHH5VK8C/Dy01soZplNV4ljDQTvL5/vmbkXOWQsxEbkluh3U7ZDO5tHaoVNpypsFvI9TH9mvPbbF3EohNuqVR9ASFtMUMv4MQjA0xh6Z8JdT7EJcrfMRTGrbDF7FebHiI9orwmb/8rv4fwkBdbLZi5bU+28Bz5SvtK2h5pIdMLkWg4Fa9UbbJBS27zcT0IrQuJcNAraKS2Hx4rljoCK6lnRuQo94W/ak2qGhcNYOyHDOuDgtJwClMIugZ7EcvjdD5RmQuGb3Kwget9Sfz1njVQwivGhwjTKjY76Yp44lYi+MmRS3vnGXTNMIk296Jil6UO4l+aZcXxocjk4BNHWCbBQv1GN3Rh4ka9jaUCwixvCqMgWVEVVcR1b7bduQlLYE3KMa9fovskVs3TilMziyfwlz1BEEnKW82EN5Wdf/PJgFGTMFjMGj/CSsm3ceKA0GRDoWh9WMydvbVD2yWSOnV5XqLWrMaBa6Z6w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c3dedc-770e-41d7-f3e0-08db7287ca2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 18:46:14.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mSNmGhkjw8mhM0lzBjTcZVvhVFyRdbX1aUrtjva+SJ+rsIGEmzCYWp8SBeGEH3TM9/MnSvmCzLc+TO4JsjGCFn02fgj02ucwTV2+/vEX08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140

On 21/06/2023 7:21 pm, Shawn Anastasio wrote:
> On 6/21/23 12:54 PM, Andrew Cooper wrote:
>> On 21/06/2023 5:59 pm, Shawn Anastasio wrote:
>>>  xen/arch/ppc/Kconfig.debug              |   5 +
>>>  xen/arch/ppc/Makefile                   |   3 +
>>>  xen/arch/ppc/boot-of.c                  | 116 +++++++++++++
>>>  xen/arch/ppc/configs/ppc64_defconfig    |   1 +
>>>  xen/arch/ppc/early_printk.c             |  28 +++
>>>  xen/arch/ppc/include/asm/boot.h         |  24 +++
>>>  xen/arch/ppc/include/asm/bug.h          |   6 +
>>>  xen/arch/ppc/include/asm/byteorder.h    |  37 ++++
>>>  xen/arch/ppc/include/asm/cache.h        |   6 +
>>>  xen/arch/ppc/include/asm/early_printk.h |  15 ++
>>>  xen/arch/ppc/include/asm/msr.h          |  67 ++++++++
>>>  xen/arch/ppc/include/asm/processor.h    | 207 ++++++++++++++++++++++
>>>  xen/arch/ppc/include/asm/reg_defs.h     | 218 ++++++++++++++++++++++++
>>>  xen/arch/ppc/include/asm/string.h       |   6 +
>>>  xen/arch/ppc/include/asm/types.h        |  35 ++++
>>>  xen/arch/ppc/ppc64/Makefile             |   1 +
>>>  xen/arch/ppc/ppc64/asm-offsets.c        |  55 ++++++
>>>  xen/arch/ppc/ppc64/head.S               |  48 +++---
>>>  xen/arch/ppc/ppc64/of-call.S            |  85 +++++++++
>>>  xen/arch/ppc/setup.c                    |  31 ++++
>>>  20 files changed, 972 insertions(+), 22 deletions(-)
>>>  create mode 100644 xen/arch/ppc/boot-of.c
>>>  create mode 100644 xen/arch/ppc/early_printk.c
>>>  create mode 100644 xen/arch/ppc/include/asm/boot.h
>>>  create mode 100644 xen/arch/ppc/include/asm/bug.h
>>>  create mode 100644 xen/arch/ppc/include/asm/byteorder.h
>>>  create mode 100644 xen/arch/ppc/include/asm/cache.h
>>>  create mode 100644 xen/arch/ppc/include/asm/early_printk.h
>>>  create mode 100644 xen/arch/ppc/include/asm/msr.h
>>>  create mode 100644 xen/arch/ppc/include/asm/processor.h
>>>  create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
>>>  create mode 100644 xen/arch/ppc/include/asm/string.h
>>>  create mode 100644 xen/arch/ppc/include/asm/types.h
>>>  create mode 100644 xen/arch/ppc/ppc64/of-call.S
>>>  create mode 100644 xen/arch/ppc/setup.c
>> This is a surprising amount of infrastructure.  I'm guessing it's a
>> consequence of needing byteorder ?
> Right, byteorder as well as va_{start,end,arg}. I could try to trim it
> down further.

<xen/stdarg.h> should be entirely standalone.

But in general, it's nice to see if we can reduce the
inter-dependencies, and bringup of a new arch is the only time we get to
see them.

>
>> There's a series still out deleting swathes of junk in byteorder.  I
>> guess I need to kick that thread again, but it mostly boils down to
>> using __builtin_bswap$N() (and on x86, reimplementing them on old enough
>> compilers).  Presumably all versions of GCC (and eventually Clang) we
>> care to support with ppc64 understand this builtin ?
> Yes, those builtins should work just fine on any reasonably recent gcc
> or clang toolchain. What would be the correct approach to integrating
> these into byteorder.h? Would adding some `#define __arch_swab$N
> __builtin_bswap$N` macros be the way to go?

In the short term, that's perhaps best.

https://lore.kernel.org/xen-devel/cover.1653314499.git.lin.liu@citrix.com/T/#u
is the full series

>> Similarly, there are some functions which ought to be __init, so it
>> would be good to get them correct from the start.
> Good catch. This actually goes along with your subsequent observation
> about Open Firmware residing in the bottom 4G of memory. See below.
>
>> Maybe as an intermediate step, just get the infinite loop moved from asm
>> up into C?  That gets the stack setup, and various of the asm helpers,
>> without all the rest of the C required to get early_printk() to work.
> Would you like that plus the serial patch in this same series, or would
> you like me to just get the C infinite loop going for this series?

Whatever is easier, although I expect splitting this patch into two will
make things simpler overall.

>> A couple of questions before I dive further in.
>>
>> Given:
>>
>> #define r0  0
>>
>> do the assemblers really not understand register names?  That seems mad.
> Yeah as surprising as it is, ppc64 assemblers don't handle register
> names by default. I think at some point a flag was added to GAS (and
> probably llvm? will have to check) to define them for you, but I'm not
> sure which version introduced the flag.
>
> I'll do some digging and if the flag is available a reasonable versions
> of both toolchains (what exactly would constitute this? Are there
> project-wide expectations of older toolchains working, and if so, how
> old?) then I can get rid of these.

You can pick a minimum version as you see fit, which is basically
anything goes prior to PPC64 being declared supported in Xen.

It needs to end up in the root README (but a patch for that probably
wants to wait until the port is a little more mature), but if I were you
I wouldn't care about supporting anything older than comes in current
distro released this year.

>> Also, given the transformations to call into OpenFirmware, presumably
>> this limits Xen to running below the 4G boundary and on identity mappings?
> Interaction with Open Firmware directly shouldn't be necessary past
> early init, so it shouldn't impose any restrictions on the memory map
> once paging is up and going. It will just require grabbing all of the
> required information from OF (essentially dumping the device tree into a
> local copy) before making the switch.
>
> I'll also mark the relevant functions as __init.

Ah, in which case there's something magic in the build system which is
(AFAIU) unique to Xen.

obj-y += foo.init.o

for a foo.o which are expected to contain no runtime code at all.  This
trick also manages to string literals into .init.rodata, rather than
living in the general mergable string section.

~Andrew

