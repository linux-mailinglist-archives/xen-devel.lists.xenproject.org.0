Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDAF690F01
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492797.762515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAXT-0001MZ-IL; Thu, 09 Feb 2023 17:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492797.762515; Thu, 09 Feb 2023 17:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAXT-0001KX-FT; Thu, 09 Feb 2023 17:16:51 +0000
Received: by outflank-mailman (input) for mailman id 492797;
 Thu, 09 Feb 2023 17:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQAXR-0001KR-ML
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:16:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 873a7160-a89d-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 18:16:46 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 12:16:29 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Thu, 9 Feb
 2023 17:16:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 17:16:27 +0000
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
X-Inumbo-ID: 873a7160-a89d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675963006;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=giigtPHYRUqpsXx8HCxypn8sKhOTkNCN48q7v0A35vg=;
  b=QZEfDOy881OnZDU1aeTj47DrU2STGMy7lr3mYXbMDlHX6IiThyW0R4VJ
   dc0+hRVz3rEy/qT1dlcVaA36nxQbRwSIyxLaRpOp6D4M92jdqX0Eyh6x4
   qJd4cj5WW9K/cstA+mDTOK9Vak+5R3xyFK4/yvRG72D4ej3kVVbW1EAza
   M=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 95243317
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GzGQAamBYBwzV4lngO5jV63o5gxUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWGjUOviDamD3Kd5/bY638hwOvZ6AyNQwHgBsqiEzQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5A6GzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c4edHMMcUuNu+C73rm6CbZhi9wYIfC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDSefkraUz3zV/wEQwSw0Nf2TqrMWJgw23WOhnD
 WIO13sh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWJqTK/PwAFIGlEYjULJSMe+MXqqow3ihPJT/5gHbSzg9mzHiv/q
 xiVqAAuirNVitQEv5hX5njCijOo45LPHgg841yOWnr/t10oIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF6rFxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:SOwmwKgKUMAkdnGEhj3FAJcTwnBQX8d23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewKkyXcH2/h3AV7EZniahILIFvAZ0WKG+VHd8kLFh41gPM
 tbAs1D4ZjLfCNHZKXBkXeF+rQboOVvmZrA7Ym+854ud3ATV0gJ1XYHNu/xKDwTeOApP+teKH
 PR3Lskm9L2Ek5nEvhTS0N1F9Qq4Lbw5eDbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK7aY+/X
 PDmwnZ4Lzml/2g0BfT20La8pwTwbLau5d+Lf3JrvJQBiTniw6uaogkc7qevAotqOXqxEc2nM
 LKqxIAOd02z3/KZGm6rTbkxgGl+jcz7H3Jz0OenBLY0IHEbQN/L/AEqZNScxPf5UZllNZg0J
 hT12bck5ZMFxvPkAn0+tCNDnhR5wCJiEtntdRWo21UUIMYZrMUhYsD/HlNGJNFOC7h8ogoHM
 RnEcmZzvdLdlGxaWzfowBUsZeRd0V2Oi3DblkJu8ST3TQTtHdlz3EAzMhapXsE/IJVcegy28
 30doBT0J1eRM4faqxwQM0bR9GsN2DLSRXQdEqPPFXODsg8SjLwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3adM7gvGTAyGLHXQI/llltpEU4DHNf/W2XXpciFrryLgmYRQPiTjYY
 fxBHoMaMWTalcHGu5yrnnDstdpWD8jufYuy6UGsmK107P2w7LRx5zmmdboVczQ+GUfKyrCK0
 pGegTPD+N9yW3uckPEoXHqKgbQkwrEjN1NLJQ=
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="95243317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7SWLBe0bVvOfwIkOZ308lS6XLYwMxvdZURj//9o5akKU0mvTtmhBTtRG8hC1hGTHzHGKJIOn1EF3Ctkyfwj7g4ydEIXVIu8RR8FZre5UFLd1gmsjT1ZZzmEbQl3x+Qi5uZ4ohOQSQyZuYFpn6L05+z56orvwPMLcKuRMYB6zNU//dOMXKBuMZntxenFUF5Xuus1hfSWG66qks+baM0OFAZCScJrelqqG9l1eFkzoDj0dpU5MzPY8feL6sZBgEytgVxcQyjIVI9iD1+5RMVb9ZCN1b8z4FaNQsPcvE1t9+EarZcevvbji8exp99DAZ2L/vLivJPheKmKCeHPbRYNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giigtPHYRUqpsXx8HCxypn8sKhOTkNCN48q7v0A35vg=;
 b=ZSYcMtLPTqC+U8bqFrESM2C9l9DeCJ8xhr69Pvk18GKG02UXLX+PlqOTM5/D8JauIPQzB77afPYLaWYVfG9Gxjkd5TjVK01s7SuWuNSR4BH1jqubAaTWkz1cXBwW4a2VS6Cz9xBFg315sMwasCVuElD7Sz6q6gDju2sQPZ2MXEh+F6EcdzQujv72p5+CaElgZR+cmlon2jyKDFiEU0qOmbcyRR4h13TIy/HZx3vocW3dDulnVpmatoP4kjgB3+zMmw0uSlH/iSzhdolWz352w7NRQx9CFL5taipwxnf5vRwb0aU6BcdRnaXIDZ6r07WVGzYamfRJNDDYHuFWhlqSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giigtPHYRUqpsXx8HCxypn8sKhOTkNCN48q7v0A35vg=;
 b=m+GrwPKXq44O2Os2Rg4TJkB1HF1C8q/0nEXQO0XfWG0YaS7L0BEcs4Nd1WzOzPOV8U7iulLlN2JcQ86tJQFKimDCk6YdIDOrv/x809a05lzg21wZNOyDbTskvyAyWAf6ztspi0WhhE+iV5ey1ooxfjT/662NCNHHFGnJZRAacyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d4f8963a-fe1f-2e51-c832-09b75360e2fa@citrix.com>
Date: Thu, 9 Feb 2023 17:16:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] build: move double-$ into as-option-add
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6eecd308-b871-7826-a99e-57c6d7d52140@suse.com>
In-Reply-To: <6eecd308-b871-7826-a99e-57c6d7d52140@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce2c12b-e483-44e1-071a-08db0ac160a7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WdFq9ydNzJMxA/iYARpysBHUYi40TejOCnhd8idCQYeqGpHQMdjL7IHnLfSIwAYZ4V+7P9Vqd/L5SgqFZbjkwAd42vM4Y6T/iElhVsroe13YwFO0MRBM+DwjmePEUQE96vwA6Pm+wZzhiPUTuL8RSjnZw85crNl+QHoTNInq9O2coyQcBOU+t1cvKgAA4rYlm+XNi3u0AXv1Mkc+1JlV/qS8smRi83X4UfH1mrFOnytK3NLEwysp+6XjYsfjry6d2Z0Z3b2ARcZQytedkmynY7mFwPZFaGNN0kEXe6vttQxV6izcEaLc5Si/jDsH/gI179LMM0aRuGjXCHcD83ka1C/aBa9Ngbk144wpV83RjNVNES21S2P95xdgRfgPgywHSQDlSGFTVuI18gy/XSW4sUc23s9jgJnE26WMJk8G5V86o8hHHHpp1g5stW92Ydvf1pTLeBvfo6t5r+9UZRWbBMn4GO1q5RYledCNiZZrAcI3XVDfni1tQBQfvn4eafRzW9vYYwN6VzHsO1v3lPvcDaeHgtTkcs+qyg93+2Wal2eAYejENERfoEvbMv6oSQiN2XZzGpPtbMO8SJW3630tHcKGlwSsxS9QNV++OCf14KmcOmOlUx00xWreTAYJf/NytvtOavPL0nxd8JGIzGGmoYhhO6egzRegpTD4hHOSDBfYbbwwRpu3DRJQg38tMtZ91CPPRgzRt2CB0gHrJaOtJB3Fh8zXozNJDBZOXYbeO1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199018)(6512007)(186003)(6506007)(53546011)(2906002)(26005)(36756003)(6666004)(5660300002)(478600001)(31686004)(107886003)(6486002)(8936002)(82960400001)(41300700001)(2616005)(4744005)(8676002)(66946007)(4326008)(66476007)(83380400001)(66556008)(86362001)(31696002)(110136005)(54906003)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENVS3c4Y21lT3UvaXNXZElqRmFCd1hQcnFCWkdoM0xadzBKYmpiTzl4Q1ZH?=
 =?utf-8?B?ZEtOT1MrM2s3NkhYd0Q1NDVzT3Z2VUpJamordUUrVWNNZHRHZHJvbDZWT1RK?=
 =?utf-8?B?NkN4NDBZQUlTTVFmZWsxV0JaNnMrTE9mSUZkS0NJOTkvdnlrck5xcGZkc21q?=
 =?utf-8?B?TFViY1FMcHhtZzlycmpLd0N4cTJ4SFNnUHpzTlZRTnZLWklZUTBFMCtqd0tz?=
 =?utf-8?B?cG1kME9kZFl6QUlZYkdkSDhsbEdHcVJ6dmRkeXd6RURKL1o3RHkvYlVGVXBO?=
 =?utf-8?B?L24xSkdvT0FTRnY4Q2NIbzk3RHF0VmJpUFJYRUJJY2xxS09ZdS9xK09CcUpD?=
 =?utf-8?B?d0RSK29LazZmNG1WSE8yQytZSXVvaE5qSEc4ZERmOUsyb2l6V1UvNkFhV0cr?=
 =?utf-8?B?WWwyeHdEMXVKeUtRQmt2V3hGV1BXNERDTm1DOFBvUmdIK0VnZ04zSEE5YW9C?=
 =?utf-8?B?aURrZCtmMTNLTXBaQWtjNjJJbC8xN0JWczJBQXNmZ3BYdDBvelZ0N2xZSTZS?=
 =?utf-8?B?K0I1RUFENUdTZDFCbGZIQTVFOWE3UHBtNDhzV3N0ZmE1dFIxSTE0NWFSSVFU?=
 =?utf-8?B?bWhKUHFsNllWV1dleEhacGNjcDdTRm9xQTgyZ0hhd05yNTUwVzE1QjJuMHNK?=
 =?utf-8?B?dDFtWjFWdHk4bzVFb3prSThEUmhMN3JCS016ZXBOQWNZNCtDMURaS1c5T1l4?=
 =?utf-8?B?dGRDaVFiZFhvbmFKZ3NXbWR4bURpdGx5cXRqR2NvQkZVNGhrQ0JtQ29yc2x4?=
 =?utf-8?B?ZGV2dUc5elhnSit2VExPM1k3RXl4MFZCREdEck52amJZUFBmUXVrRzU3K2Fm?=
 =?utf-8?B?c1YvRUFoS3BYRGQ2MkJua3ZOVEJhdk1mQXZCTU1nZXNhYTF2ZEZFYy81NVhV?=
 =?utf-8?B?eHF0NnRQRHhRZjZCVGlNZFVuNHJETXQrQzNNNm5mSTJNK0tjMVQzcVlwWjdC?=
 =?utf-8?B?ZE51TkRpalArTVhuWVc3UUZQMzFJdVJIdEgxeU5lemNDYlR6SlNkTHpuN1g3?=
 =?utf-8?B?UVNXa00raTl3eklRMDRUNG1aM1dwSXdZeHQvc1FKYloveVV1ZjlTTnNFQTQ3?=
 =?utf-8?B?c0s3R1dNZW1UMlZaaVRsczlGZWcraURJcURkTGVWVWEzWFRqV0xXdE50YmZJ?=
 =?utf-8?B?ZEJVVEROQlRBNmdwZ3lKcFBHcWF3SVhmZEpNYkorbjMyVHJkbkpCSVVDK2Ez?=
 =?utf-8?B?a2VnZGNseCtHaGdFcjlSVnRpQnhRK0JRODI1NzNVWXllcEFXdXYzQlh4aWNF?=
 =?utf-8?B?SUM2ZWFlb0Qwc0VFNnhUOXVWNlFkQnVwOUI2eEg2Z3Awajd6cU9BQWpGRTZE?=
 =?utf-8?B?UnZFOXRsKzZFZDhGcjg3M0R1TkRIYXRqMWl4R09xN0F2RTlRZHpQdmpvS3p2?=
 =?utf-8?B?QjdJd1FMdzBpRHlkenc3ZFZpalFaUW0rWTljMUZpRTkwU3pwdFN1M0JtaThG?=
 =?utf-8?B?OUtUQ0JNazNEMUFtY0JuRHhOVHVlclp5YVVPT3ZhYVEvNHRBdUdKUEVaQVVz?=
 =?utf-8?B?SjlJWS9RVHdrdm9OOTRSOHFyZzYwSlpEUkl5ZGtzY3ByMVVaeVpTMUpCTC9R?=
 =?utf-8?B?SjZoRHFMcUE1Z0pMalV6WlFVemNzY1pROTNkdVlPWEhkaFU4Sjk0Umk1aDJn?=
 =?utf-8?B?anZzNnZWeU5ZcDRFaW05U1h6V3R4QVA3MFRmU05IaWo5Rk1TZHVCYmxMV1ND?=
 =?utf-8?B?R2lJZzB4c0RpRFhNZ25KdkRBb0U4MkgweXRtb0JjQ1p2ZnYyU0JlbUZEV2wx?=
 =?utf-8?B?QnEvenROT0krMEVGa3hBZ2dVMkgzVGYwZ1A1WG5PR3ZjYU0xb1dzdGorelhM?=
 =?utf-8?B?cDhENTBRa052bWcwQit1QjczY3NoWnlwNlI4NWxwOG5XZHR2S1BsSEE2Tm83?=
 =?utf-8?B?S1B2R0pRTnZkQjZLUWpXdVlSOFR5YW1jQldKUjk2aiswZXp6cmdYUUYxV2dS?=
 =?utf-8?B?NXYyb0l0cWU3cFFpa3V1NnNCcnhrWUpMZThEeXFFRUlHSnZBWENla21hdkRw?=
 =?utf-8?B?Z2VBZGU1c3o2NjNJcmRaVEhUbkYzNDF5QUFqMUVybTZLTXh0Z2V1alQ5YmRS?=
 =?utf-8?B?M0xuQXI4WW11Ty9FQ2NOc3B6MkRwVTdDd01laFFSRjRxYVFCTGJXbUxzRWlX?=
 =?utf-8?B?NHBvNnVDeFpRRTAxeU9MK01KaGp4S0t0RVdTcmlYcTRId2F6SU1SbEh3Vld0?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6f7/2COhkCASqrQxFfehXQTM7wg42X3iAQNUCG4E8aUp8t1jjdiccplJYB4KEhkJe6rxjqBRB4ydGb/OeKxv0lYVVuDlEqzdD+Hm5XKLSv331KrURx6xbE9HiNti9OlAqXHp0qc780aqPhZlvO7OJjyR58upcvViHrys0OiNwY7jvWRM5LUi4w5EWsMS8enF1iGEOTfANEd5v8awOsWgANh600ZTTmUcqC3SwxZbG/ItaQ64fpWXQrcewWjtSnMycq/MhO2vivCzNl06wEIVCUnyQh2RoQKDZNLgIHO0kMJYx/UkjDHWhf31rFgYiT3aDbqXbny/yE8MJpjBhunwQkMQthB4Xy+qRSCTwz9T72YC+KjVXsvYa7Dp5I0UE0m+5c20M6sObulYB4IYt50INw5yhcutf2ZyN/l9llGyZ/55ePlSSifD8hG89ZUJ93Y9f1eNshkhgTLhsqTXG1LgBD1Si7BNF+G9eKOMjMAJw+hZRky8rjpy8KTU6Gk8f1StvH4toXhGa1/MsslU3EVDiFP5xVmEkKHpebQrUOztDhz2l1UZC6Lg35MFKpAmC9/Ilj9lt7dddCpNFSFoPmxosBoXgtG1Bkfy0xSCEfHe6d1L73k5eQZq1duaxnOfF6fZQnNvsbh9fclyaWxB2gUKVy06qpJ4EIUMwYa1v5UbnoDGNkTa1dPMO8XCAQ1PdDb+jgyY8AO3xf22HJBElFxOV3dpb9kepsM3hB63VKxeXy3l1v8yFfhOiNoz5IZixvCp/qAYcZNaA2sV5PjQQY/awXoEEvI9qKguF6z2LSuhAy7jUEF/DbmqNrYqdu5eLK6rkQ3ZgeR41xlyns0IMFKYXNv/YOlSlYReQeX9kuRbvKw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce2c12b-e483-44e1-071a-08db0ac160a7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 17:16:27.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mneIjQ3ORdmCmsXK8z5GbCQwupUz78KpE7d2vDX6151y+55EHBmXLh7lCyqmuo3uCyeqrkKoWBe+/CuIAeHiyjHxNLK1li0rD2vhsVO03KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

On 09/02/2023 3:26 pm, Jan Beulich wrote:
> It's imo helping readability as well as uses a little if properly
> arranging for sufficiently late macro expansion is part of the macro
> itself, rather than all (applicable) instances of its users.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It is an improvement, but I bet this is going to trip you or me up on
the next relevant security backport.  Just something to be aware of.

~Andrew

