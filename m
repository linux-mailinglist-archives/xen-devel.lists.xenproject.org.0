Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD296C7033
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 19:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514051.795984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPhh-0005cw-KF; Thu, 23 Mar 2023 18:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514051.795984; Thu, 23 Mar 2023 18:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPhh-0005Zs-HZ; Thu, 23 Mar 2023 18:30:25 +0000
Received: by outflank-mailman (input) for mailman id 514051;
 Thu, 23 Mar 2023 18:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfPhg-0005Zc-Bx
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 18:30:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c451499e-c9a8-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 19:30:21 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 14:30:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 18:30:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:30:08 +0000
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
X-Inumbo-ID: c451499e-c9a8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679596221;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Of7156c3zk/YjPA0gfESys8/Np6ygfs47Mi4th/4sZo=;
  b=VCxrPp3kp9gBSVbxd7NuWyfuioMXH5GOvCEh7xv1IGIk3F2u61FsDxQX
   VG4a0IbUuRpg8NdJyOMmHSne9HKEX0Fk8sUah5c1I1ihji8OQmhHG6+Y9
   O9sy35My13bKfOn4AWZ7lhQdCCujCpuPWoXqG1yB/7VAhqxiAuG0XjpzS
   w=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 100873718
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D3NCPK8RbXbJY/dAmOnRDrUDsH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WUZC2vTPKnZZzHzKYsgaoixpksOvcPcy9ExHAQ/qH08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkR9
 dMqAhBQSiqBqNucmK2Gabk33cYKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpKROLjqac66LGV7l40Vwc0cguimKPj0neTafYcG
 nwK5RN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqeS4BZRsI5Z/kuo5bs/7UZtNqEarwgtirHzj1m
 miOtHJn3+VVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5P2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:cbhWj64Kql7Zghr5fQPXwPnXdLJyesId70hD6qkmc20xTiX4rb
 HUoB1/73WYtN9/YgBGpTntAtj4fZq+z/9ICOsqTNOftWDd0QPCEGgF1/qA/9TOIVydygc379
 YHT0ERMqyJMbG4t6nHCcuDf+rIDOPozElgv4fj80s=
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="100873718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/Hk82gS0FT5rvB/QeFLb+ryvAJOt6rPA97qubspOgbjCs469F4rwAPCRRZChvP302Xns2rxM06Op0xPBbEBXU4PZakPrJUzd+jkc1jqE0zKE5Rmkx1lm3kYfEZF/0CZGK6Xs5RvaJcsXjDTJ4acWVqMhzDbgWJV7bSZ5+qMFdmc1fZ1a/nMaBb621sAzbhL6zSDFiHQP9eovg0MX1spdEpPTATZpFgH2JXBz3n+WDqCFjVds2EOTY0J+J2htsIpKORzu75M8+LjdyNHmMzvOQhsdkuejl4+Bsjy8Ia7gBgNAhPSy5nBCTG2szztBOP2zuYHkqH+2qlYP6mGAsm18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of7156c3zk/YjPA0gfESys8/Np6ygfs47Mi4th/4sZo=;
 b=AMASLbq2G70/Iot6zST6oj4qvXWpdnFqFp4PwSoq7JUThoE6o66hifn3jHMDRXLRxyPd1QnyvhHwtXgRHYHX/syAqMZ6OOWZZfp8kS1z0UXZmjXt0f/QJJxjuyFTd8rYuTE3qgFlasIX2SOMy5Bo8cyZqF9p44DK94ZHMEATjZdYpE6qcMW4q1MccB23rspx3fpY20RobdGbSuGIzLqUncQkxInmyuIC5UHzDACzVtM2cI579H+LRtj1rZLFXKMA7lCFICJl/6Puo1CH41Ui/i64dCRWGekFshWPsOBbJyxfz6xlu7UKZfUCI5NTP/glrKZMET76eDTn0BsXhLiayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of7156c3zk/YjPA0gfESys8/Np6ygfs47Mi4th/4sZo=;
 b=mHmhqtTwIknSzWbB8eSGKCQz8KSXkrJgnYh9AZ90wyEii5MGgWTpslUkTjtwUkrTh2I1SuayY2hN2avxefd3sb9yHp9ffsvs/iulxkqJW1SIH5iakqYQtb1bOEmtBN/2GMittomoMhNx9ml+K5m6h2PEXTgW51t5EUQjrxwszaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f9f5efc3-9d52-9ac4-1c5e-024e26214437@citrix.com>
Date: Thu, 23 Mar 2023 18:30:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 14/16] x86/shadow: "monitor table" is a HVM-only concept
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <eef2f500-7b77-8120-0c0c-8a8b4fcaac26@suse.com>
In-Reply-To: <eef2f500-7b77-8120-0c0c-8a8b4fcaac26@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0177.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 5202bdfc-3da5-4f12-da25-08db2bcca184
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dXKR1eAAbqkf4pYFJfBLovymwBPF3oiloVGJAQ1yflmHVnuOTizef+aDfqcRnAZr8+tX7lQRtGjI/DuXwxggBoXOeiWpEtDxYIZEZe7nBtFBcQLvplgZHUpjqRP+LfP4jQKbBRBaoYWnHTVhr74C91/JCFSn50C/09BBZ2LGlsjAM0wr4daW1vyYUpNtJxIPyMEkXt+zY3Ph0oZnhqAUutsT4f9zP+K8ylny+G1Ij1iC5QrQv38mX2aRMld1f+J0vOdzjxaN6MNg4KckQccd+MHQCbYqaG9BhXaFvJnsb5IBa7TvDMfIVUUDxaU51imnhuNPCeUZy+ueFsKpCAcH/ILTu/QAin140f58mUSF2MxdLnCJonzkOXdWwegXHWgqR+eCt5ZJnrljKrjO9pOrchpncGt0yfBopbolkHWyY71oXceCnJN3qnIMSQy3kZyOMyqm08KIPHyipwY0EuTd6rAA7Mu+H6u3fTUsEz4bKwSZL/sKKVRbRk5qrpZSbaNp0ap3PKWmwudEDulm4+R8ZgwRyw8QPROOQT8qOyUtuv15QP75mkj5GgBmtD9ZF6fhsBgHBOM4iOa6HW5/fSQd9arT8lXibhNbdhqSa8KJONh4mn8CM3vQx0ik3Z1ScqNesPdl48YfVP1xOdPI4wS6WDs/14e+hO1yJrQAahFu3frKiH7JPPWcIEz/PD9vHqlGMXNCgt3X9bdjVRGk+Ib7Js2cI1ZaO0k9Y+IOJ0C8zKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(31686004)(8936002)(66946007)(66476007)(66556008)(41300700001)(4326008)(8676002)(86362001)(36756003)(38100700002)(6512007)(6506007)(53546011)(31696002)(26005)(2616005)(186003)(6666004)(316002)(478600001)(6486002)(54906003)(110136005)(5660300002)(82960400001)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEd2d1Q1ajhrYzRseUVXSjVrWHNYU2NYNVVNK0pPNml5MW91bkpmS3FlUXl6?=
 =?utf-8?B?SG9Ecyt0WmI5eEhzN2Y5K3ZPL3RSbndZQ0UzOWRud1pOUnVSQ1VDaWZENzhn?=
 =?utf-8?B?bm03bFQ3TXNlaFhYUTIwNytwcUROVldkSlp6K0VSTGUvZjk5ZkVzZENLMFUx?=
 =?utf-8?B?S0ROenl2amlVSUh0Z0JmZkUwdm9zTW5BQU1EYTloUVU5dHBobjc1ZCs3WlJ5?=
 =?utf-8?B?bUNNd2lhM1dWMW5Kd1NkandPSWgwSU9ubHU1OTg4MlAwa1U3L3hNYVNRTDkw?=
 =?utf-8?B?TXNyMmxsWVNuNFFXUDh5UUtMU3I5NkNIMjFpaEdzbmlLN1lnQXVsMFpVMkEy?=
 =?utf-8?B?SERrZ2dPNS9BVFFUNGlKL1pXdmU0SERnT1ZZY0l1MngrV2hSMTBGZUovZnR5?=
 =?utf-8?B?RDZhaUVxQkM3WlR5c3RjaUNPb1g2VEx0MXNwYi8rd3dJNnVDdTVPMUZSYkVh?=
 =?utf-8?B?cElGY01QQmYzZFRoWjh5ZHdudDJUYnh3UWJJNTA3ZEVxcTZEbGs4b1B0UlNU?=
 =?utf-8?B?RUk2b2t1clMvTVlxQklHMFpTYXVqNklVcXJLdTBkOVVKblF4M0U3YSt1eG9z?=
 =?utf-8?B?UnJDZzI2OFc4ckpnaE1GR3Mra3djTEp5L0tyenFrS3ZpZ2NVOFZKam9ydXU5?=
 =?utf-8?B?VHF4ZTQzcHQvUjd4MXBId2lFRStiTElLUktjcXp0K0l2ZnF6bWplT2RTTUJF?=
 =?utf-8?B?RDJOV05YdWtaK1NSME5wb1RQVm1MQk9DdjY3bXN5NVo3alZGVUttcGlwNkpu?=
 =?utf-8?B?NjQ5YkczNjkvZyt6T2FvWlU2KzZ6NFcvZG04Vm9FeSt3QU5CSnVIbVRKQWVC?=
 =?utf-8?B?TDVnalZ3Y1Ewc3daSHAvZXNWUlVhUGNTdThGZjYvMDRJVjhDeStOVWRQU2wz?=
 =?utf-8?B?b1Foc2N1a1hFZVpyVVFheXBJbWNuK3FWS1FDcU1CSUdJRnBpUUtCaTB6aUpx?=
 =?utf-8?B?cTJpUmlkWjRNRzhtb01CbXg2bHo1L29ZeTk5NTRDcEpoUkNmTk5oOEpEK1VV?=
 =?utf-8?B?U2wrWHFIZ1VZSjlTRVBMOUF0ZGorWWw5SkRrc0NSanJlWnFJWkluZVRnSVMv?=
 =?utf-8?B?UmdONUs0NWtmL3Z2c2RiWnE1Mk1TMEFWNlp2bFlhandJbFZmV20vRzlhMmlh?=
 =?utf-8?B?NFBlbVA1REZyYXBSWHgrMU4veU5OaGs1dHU5WFprL2tURlAzSXNGWUxPQm1i?=
 =?utf-8?B?c2tpUVlGUGZRZFl5MUczYU8xcGtPTGxoRCt4VnRJNGoxY3d3NUFyaVAyTjN1?=
 =?utf-8?B?c0paaThMVmxFTnB0QkJNQTRkQUplbnRGaTlzendBSEJyWlJWWXFjYnR0Slc4?=
 =?utf-8?B?aVlDdHJrSlpPZks0RXE0c3lmZ2ZZZlB5b2NnQWJlWVRNLzRwU3UxdDFWeVVX?=
 =?utf-8?B?a3Z6UzBFVGtNRUZnaStqVUFRTmhidEZtSURQZlcvWi9qMFl4UC9WRWJrclZp?=
 =?utf-8?B?b3UxOEJ5OTdsT0VMamdTM1hmR2I3SnFNbXo2akZDaFJIb2V2Yk1QdmNwc2gw?=
 =?utf-8?B?anJHUit0TWxWSytmTERHZW5NQ0dGUWpYMTVFL1dzV1RUQW9tK2dCTVl4bWMy?=
 =?utf-8?B?OHNIZjBrY3ovT2VFR1JGYkd6NzRyWGNjUUduYzZKQnRRV09YYUs5Vzljdndq?=
 =?utf-8?B?V1hmSTZNT2ZCd1dQUGhIdlRTck9tMDY3b2hGQW0rTG9haUl0QWRZcXl5YVRB?=
 =?utf-8?B?YzlOaU81Z2JyemQxdVNHYUhXYi81ZFpRNHNPbFoycDVoLzFWdEs0NlEzeUVV?=
 =?utf-8?B?N2F0YkhTank2OVhkQ2ZjaUN0cWdoM1B2djgweG5hZGpyMkN4RnNKRFZZcWcv?=
 =?utf-8?B?NlZvZVVuNU4zT1Z3MmsvTXoxbzVuYXMxbDBvRkhaT3BjQXBBb2llejVoUTEw?=
 =?utf-8?B?WVNBbWRiaGw1RWlOTG43KzJwY0k1aTFPZDJUYVN1TC9vVmNvck1qdVA1U2xK?=
 =?utf-8?B?ekZPYytpbG9Odzc3TnY1V3M3by9LU3kxOEx5TXdBUjgyQ2tlQWlRbFZPTVk1?=
 =?utf-8?B?T1Vqa2V4SEVtWmx4dVIwV0NaWFNLa3JTWllISHpweXJPV0ZVYkVQbUpzTnpx?=
 =?utf-8?B?R1lZcDNLNGgrb2pIbGJJU2NpY3FzTTBreWlMNUdiejJBWFgwUnVscTZrSTc4?=
 =?utf-8?B?WmVzZ2U4ZTRGOGNYeVVQVnpvbU1UNVlDcmtvdXg1YWZCdjh2OTY0NlhyYjZR?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KaGnvkGu71mpxtmsuYten99v5x3ho3Bhx3BcCPEcqO3j4KgXhCZjmr60U9bQ8oGpILiLX3pAmhgMDC0eIJyi2EJM14rt2MM++THLOkZyUMLfNv1OmOheYJSyii2BTH0A+boiTJrkI+HZxyGcdPsfG2Shw4Q+PjUrDaLIvcJqd18rydF6MPIKa5eHabzp7XwIbTRRTZOKgfqD8jP7Kb+u5nZUBsIe9wdENvv6hS99ZIxOJ2OR7jzC5Y4frXVbHQ5ROnCHRUZdlxxLcxbYPiyQq4vKIYb/z0eXi3PPsXfYIlo8ntKiwvf0ThnGuNaSsmVGChfk9Q3K0DbjUzVQ7+Y6wQXmgGhexdl2nHPZphZ9fG9KXyFmm4FgSDrH7nfD+JtzQOj8hZ9SfpHzaGpCEGkrHHw/8pPofzu2t2AWH7ALW25qFAfYhTtnd/6VlPoDJ1FTxKOJHQXGsZN3ty8XTBBQLy1NU5OZGlZkCX8bfymMoSLQJGDKJzKhNjx88YWe1CsDgJyfJc/8mpDFcyv0fLbf9BsrBtSC5c0Hbaj5xhD4OygoYqQWzZvWFtu7Rrbb7LiNjmoTp+32iwXCDwu4c4rG1jKtNZ8ZqGoUqe4CNlrQTUuiFsmrmfNDx0A7ITgG9tRLfhh+xt+LvneMO6ltmlPswta0T84ijUumxaJ8O/yaRzatLaKzPW3ZMeXysLF2s4EnENBShsmTr8wr4DuQX/lS5Oe6gjrjpMsUPdd7ttJLU77CVxJIWI0rP3eQ3NSXH381O7AA5rco/SMuNlvz9AIpbi9SKPx6df53kSICaRefvaRqpd/3NLtDRqeDkTi89xuk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5202bdfc-3da5-4f12-da25-08db2bcca184
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 18:30:08.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CdwVvCc8OaNsqN+IijQFfzIC0SsC7RdBj+CsWTEGgg3M4A9Y2BdHv5672AECSlNPENdzoedlZ2zDbsq8JrErrPDdcdWrbASrdlMq9IUHqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5665

On 22/03/2023 9:37 am, Jan Beulich wrote:
> It looks like in the combination of aff8bf94ce65 ('x86/shadow: only
> 4-level guest code needs building when !HVM') and 0b841314dace
> ('x86/shadow: sh_{make,destroy}_monitor_table() are "even more" HVM-
> only') I didn't go quite far enough: SH_type_monitor_table is also
> effectively unused when !HVM.
>
> The assertion early in sh_destroy_shadow() can have the type dropped
> altogether: it shouldn't make it here in the first place. Pages of
> this type are freed directly from sh_destroy_monitor_table() only.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

