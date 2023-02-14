Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E445F696B81
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 18:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495464.765825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRz6D-0005Uy-48; Tue, 14 Feb 2023 17:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495464.765825; Tue, 14 Feb 2023 17:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRz6D-0005Sb-1D; Tue, 14 Feb 2023 17:28:13 +0000
Received: by outflank-mailman (input) for mailman id 495464;
 Tue, 14 Feb 2023 17:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QOgc=6K=citrix.com=prvs=4026bb75c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pRz6B-0005SD-1E
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 17:28:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f14bc1ad-ac8c-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 18:28:08 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Feb 2023 12:28:04 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7243.namprd03.prod.outlook.com (2603:10b6:510:24a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 17:28:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 17:28:02 +0000
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
X-Inumbo-ID: f14bc1ad-ac8c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676395688;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nTSXLQPpCPW6qbfpGYwlXvcD8cTUiR1Wpdsvt3uxnaI=;
  b=gMuEOIlkB9CCan7zkvXt7HG0TqQ5upEoBivqa3MzdXriosBWihWKgwIe
   Ci466A0pgRRAyL44AhfYt1UFDqZx2hQJpdPxEHbWv5Sx2NFgZCqcmHVYm
   6F8kZxh2Xoooy/9AklvpDOlorhZDXRbpRweyDHX+onT+N2tU01srbSiUn
   M=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 97023797
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4r4xaK4+8J0wIMUkTjkslgxRtPTGchMFZxGqfqrLsTDasY5as4F+v
 mYbXD+Ba66DNzTzfYh/bIq39EoF78KGmNQySgRsri02Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoS4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 KAHCGtVXjW43cW96qK/dfdJ1+UJFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOWF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNNTOfjqa816LGV7kUpDwwRTnTjmNWoqBKhdP9FB
 Gc3ozV7+MDe82TuFLERRSaQpX+PvhcYHd1KAeA+wAiIxuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8pjqoNS8YBWQLfyMDQE0O5NyLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWulkIpcsC1qH+91aYhTup/8DNVlRsvliRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:uboUa63LmkLbfawr9nihzwqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.97,297,1669093200"; 
   d="scan'208";a="97023797"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGhWJfmPZ/XvffMDnP96YMhyP2R5y0msgsXhXit+B1JEHYmvmVC/d+KfY87QZKX8MNbPXmFgT42AhkB4S/ld8FXNcC9kRko4C6yCh33FSsQSKd1CLf11+xdFc7c+w/oT9gDTtmeh0mzj8cvs1eMzM0S8uh3FZHyNv6DGoSWh4abY+ULAy4jja4on3r4Nyf57RowAKyoGjgZxmlDUh7hpsK7nt3YvCvcxJbf8eZofpekLs4lIGs3npIAWppphDJZQcGS8s7gT4a60EMoiYZKTVAIpahoLbsYE2iHOqqTqpPdPnmVRpjOQDWyzV93Tvqu/Vcmu0XaLJtm8VzdQH/XP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD4xoZDchmtQQmEqkMkMDcP4VQxFcxj/KCK0hPvM5Vg=;
 b=DCJUn/St9Dsa+rU5ot2GJh16euCNQGqBfU+gBGgWhv8L4hACXzY6j62OhFyDr62lAcolB4vPnF3Vt99BTZOJ+Ns14dLYN6R8WugQuRq8dUT76UVj4f+YztGFPFdFaXKGZxmJXDst59SCtUAuAQ/UTZrm8b1GVP4gLyXQi5GmJ0XZY1k/+QOL3E1P8m+S0wVveizgQ9JPoledq6P8n2Tozxm9t3gXcyY7Mx3LRx6v3wXOr/B81kNtNPfzpMDXIZxkQ9Vt/GJuLt4Yn+o4rXIMa/CW/6ZeTThqm0wtIstQmxwvkJ8CsIXrp7rDlkXHiPuGiPV69u9Qt7m281jNjl8uGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aD4xoZDchmtQQmEqkMkMDcP4VQxFcxj/KCK0hPvM5Vg=;
 b=npnkUS6e/TrAXd/e2RNT9yVJ6xJrasJm09I/aI0B3ZMmOPjEgBmgewPWpWJ4pWeF88HznsWqUzxTAHtr1ieBNIKzBiXZABntIRI/gpV3wbQfCIUibSiz5zRps053NKfxD1VjWapajS3ncQl2wMcavNDoUA/LTcCahHmEVSpfXrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <59da3abf-7c56-7a46-03a3-b11537d0527b@citrix.com>
Date: Tue, 14 Feb 2023 17:27:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] automation: Add container and build jobs to run
 cppcheck analysis
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230214153945.15719-1-michal.orzel@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230214153945.15719-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6c13a7-e475-4d2b-0d26-08db0eb0d2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/5XHLMkBppWa2nGNd5pJb9Z2liuc3AIRFj1jX+Oku4aitjOZpBIX0vEYkCVucpfNvDfGG+aNZYarYNHT0hO3UshHMqdVOPS+FC4mvMB4xQG103jviNdJyL62RE70tVarMKFQAZPEz6sRK7ZpAzrt3HvlNGBYxhoKRc8D2TaBt5FAfUBdUwv7vTq20rJURcPxjvqCrdwR0IQEK3YeRiexi36WRseROGl0Na+ZAq1s1HphOMZxoYTxWHiQE+iXOFd+56ff34oGz4ni3pqfpb0CtHTj+uaKZDEbjbmBGSGTeSRG4p4WPvPlVhsLnGr3ZqgzqdHEC/D/UMqriM1XWqmyTA1OW4XR9sSVYTBEASluQ7XlEfXh3Ld4uHzE4X8ZWH+LO18zFD5bOEUNSJX1vNPxra47UdwAqC5uMWj28kdU3h08rVuHLBXSTZfJh5aPpRrz64v4z/Uz/pe3V38F7WBbDs7/55D8VjZW1nBoSzdFDWZZ5I0TdR2XeB8cJ9fbuDAL5ZVWHFZb7yJ0zM4zKGvCdOReAfh6Pc2TPGJluv04ECgXnxOMeFuj0fZftm9JKDptbfpZ3atVWt9tZnkddXiDzYy/sXZvraHnjY53fzp6tevaj4hJUdAs5eZ4CUL+uEIMZi8+0vywQsmaBg1ZVpq/5aB4A363znQ+Va2IBrBRAeV9W3YoY60wgcoXOKyRYr9K7ZulpYgu2PvdxX1gTAPzRRXNvRLwltSdURaacVzfq2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(31686004)(41300700001)(38100700002)(66476007)(66556008)(316002)(8676002)(6506007)(8936002)(5660300002)(4326008)(31696002)(86362001)(66946007)(36756003)(82960400001)(6666004)(6486002)(478600001)(53546011)(26005)(6512007)(186003)(2906002)(54906003)(83380400001)(966005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmF6VHlRemNEN003V1NuUGpKRW9HMnVJZlRqZ2ZBZlc1K1R2US9pOXdUNjFR?=
 =?utf-8?B?eCtUcVdndjF6bzUzdWxmbjU3VitNL1VRQ3Bnbm9oeDc3RjdHRWN1SHJzWmVj?=
 =?utf-8?B?Zi9YUnRpUGJPYWxreENraEo5bjZqeTFDQ2grOHphSHZneU9FZmd6NFc2WjMy?=
 =?utf-8?B?MzVZdVJuZFJDRm1YTVlXZUZzQmJyMUt0Vkp3Rkg5Q2pzQzBaSU1NOFJCR3Rz?=
 =?utf-8?B?ZzNGVzFIbDcxTTFpQ1hNUEhnVjBsQURkb2xZUmJCSHhOOWZnWisvb0pPa1ZF?=
 =?utf-8?B?Zit1MWVCNkE1R2tlVTc3YjZiNmNxMDEzWnZoWTVzdmkzSll4TjFZS0x3TXdo?=
 =?utf-8?B?cCs0V0hCUHNlZUNLcytST2NST255cnlJSmFXS2dNNlFSR0JHSG1JQWV6U3NG?=
 =?utf-8?B?c2R3QmM0Ym10dXNUM1VITkxLRWk4ZHlDRUg4R3VVMXZOZW1pcTdZbFF1cjhJ?=
 =?utf-8?B?YkR2aTNGeE5Rdk1BKzFTNnRhVUJIZUFGaXIwK29vUmd2alkrdlpKN0VWQitl?=
 =?utf-8?B?aC9CbWpGNXp2RXNGZ3NJaFFFTTAwRmhKWWdhQ1QyYllaaU0xUTZGdkRVMVBy?=
 =?utf-8?B?ODlZanRLaXJFSHBsQkRzVVp1YXBnaUdYbFF2UnlLNkJib3lBNks5V1JCUHRu?=
 =?utf-8?B?SXhROVVIOVluMzlWdjM0RWNWZ1FJcUFiNXB1cnFiT1BuVkV1Nlo1Z29HNW5C?=
 =?utf-8?B?NXVvaXpHVkxualJLZXNVeHdWeVBmeHpKWDZlYXNWdjlMdm1KekczczhvUXFy?=
 =?utf-8?B?dVNXakVYcDBUK2tUclM1aXRjZEtXOCs1cWNadzR6cU5uUGRaSDFRQXpvSHBw?=
 =?utf-8?B?RnZSeVpWdUxFcHYrZ3JsT1VTMWVhTXV3eW5IZVpyN2JXRlFPaktXcWd1UUpL?=
 =?utf-8?B?S3l5SmFWWG5leUtGNnpNSmMxZE5Db3NpVzBRUWg5NkpYK1l4K1pIOWYxbXdC?=
 =?utf-8?B?NnJBY2ZiWVk5T3pVWTQ4bmdncmRmYzhzdGpuRW05SnhSUWRYcVNHTnEzOVZy?=
 =?utf-8?B?N1h0Q2RHOWZXV0diU2hyYW91b3dCd2h0TDR6VHFFTUwrd2pOWDI3T1ZZRjhK?=
 =?utf-8?B?enFVbC9qR1VqbENIUkhLZkgvMVFvaEptZDFtNDY2MmYvbFBQeVN6cS9zUEpG?=
 =?utf-8?B?QjhjeDFPTWZVOHRtNnFLU2cxZ2xXWi9RbWx6MGtYdjRCU3NaY0pzclhodGZS?=
 =?utf-8?B?cnl2eEIydi9LV2lJUlN1RExDb2UzSVc4UlZzVUdrRGZTMGZpcVJnc3VQaks3?=
 =?utf-8?B?RFZicDNPdVdKT0VvUDRlN1VKWlNoOVY4dmxPRW9PZk5VOHdlbFJaUTA2OXo3?=
 =?utf-8?B?cFJEZXhnb2l3NzkrdTc2STR2RC9qd2pzUy9ETDl3TWVuRFRlU25xdGlVVXE1?=
 =?utf-8?B?aW5ZQ2dwNktoZG0zSkJwNUxZT0R0U3MzdnZUemJlekh3RnB2bjZvZUpwZzha?=
 =?utf-8?B?dlNIZVVROEFmb0g1VndqaXprWSt1VVZPbG1NTTJSSHRWT2pxaTREa1hhT2cz?=
 =?utf-8?B?b3ZSME5FN3N4b2Y3NUJQQ2RvV0FVU012OTZqOHF5aWY2SThsM2FlcFJhekxs?=
 =?utf-8?B?bmtsNHJud2dZa0l0Zm5tMUNGcXBlUHU0ODQxbDVWUlpSY2ExS1dqQm5BaURJ?=
 =?utf-8?B?QWMvL3BMd2Ywazh4NERmU0NmUWd5NFdiUlJpUGoxMjNVMHlNTGg1VDZLdFll?=
 =?utf-8?B?WlZvNDRJZ0tDYWRNR1Bia1JTSHdrbmFGa3ZmTjdLZHNoT0JNM0tIbWFWUzFK?=
 =?utf-8?B?M1VpSkM1cE80OFA3S2lHOVA5V2xLNG9SS01TQXBxV05WeFVBbzRsd3VQYm1z?=
 =?utf-8?B?ZW1KOEdFdmZGVGhVYTJtYkJHRDNOd2Zub01QallodVl1dUJsTHhxeHpUTC9D?=
 =?utf-8?B?T1k5bmVNQTdBMlRUL0pSbUtDWk5xdUJwZnB1U0htVTAwRVFXQmtTRmNPUnFY?=
 =?utf-8?B?cmpBSjY4VmY5b2hJQ3RMa3FYeDdDSTdGYUw3cDNSWjhucHMwMENteVdpcVVS?=
 =?utf-8?B?WnNWd2pTNUIxNkFPZlZhYW5qWEY4S3ppM1ZONjVNYUNzblQ0N21RY094dDJY?=
 =?utf-8?B?TWpBemRBcEhEblBjSTJuVGUzZ05pOGVNZFhGVkYzMVpON0Rtd1VHVEkzKzRJ?=
 =?utf-8?B?bnorMnVwNDlwdERNTFYwRTMrdjc1blBqZ0I5RWM0bGhtVEEwZ0trMEtjSEJ1?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oN0VFvydEe7icUWsTrAiW/Z6sVoGFfD/ZIOoy1ULHxBnNEKqf3FwIe3RSNH3GNO9BqFGcwAwyCJcU+0u41MioZuzel+oaQxxuzveikzSXCnu1KROpYp+vGeK5YQiovvUkyeDkdmpfR7orkbg2uGrdg+eYSnx4jTc+DkfqittyqDB5pHyOyfalr6bqpksD4nc/kRJpLhX2gal95VBF3b5xKw/adzo5V7ei/vnG2GiTQQNMtT5II6y+sQaobQa//sySTHASiqnNgBhuXzruXW0jJwqXOVHdq+bwXgoAUW60dz/9024l8efcLoyJJlmRFF8V+YKN930lHD73DA92U+TQXIOvaUYyZfWeSUH1UAVC2acTT/cORlEwpCWeKRbdZF++zHaOLDtScg9mq2NpUj1rY1JezU22W3Cff8sz/m/wP91xn4Rdwc00AGFkYsTR3pGcSHEW4FuVvRFaK83NfkT2Gb1yGvBTTsIoEHk4Wc/MrxW9Q0Bh+9+wjr5WzZF+NwaVLin1lwNS91TO2J7jWaAgdTsdYw5wIb+4+6R6Mm0pTzQCalOH8B+5pRXC+wAcSZFeu1asIMJvFxEY62+ly3uWcRLj7WKdKg8iQHY/rZV1GOVGicw9eS9KivNjIcYFT8GLy94uNkGkg7Dwtvni7yEl3rr1O5FjXcfK3t0WAOX2LxtoYtuJZ529PsHvX6mMgrcJtpixcVfrwhgSCSDeA28iR2a9bnsMqoWdjbKjgZAIMjZ7VjXd2DYwMi9aELoBqZXaeQQ9s849zGPOGr3jXaLsk6YLU07bLdjz8MdV9KWx6lbrjPezJRIaDLGFAsRTyec+ffRKY4RkGGjPCHAf9WrW3ubmJabqbJm8k5GCP/gT3A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6c13a7-e475-4d2b-0d26-08db0eb0d2f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 17:28:02.3361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fuf6p/aI0/uA2yIIdYwYQwuf70zJpNSkDus3oY1eLyGIJmbxVqGcg7oSBGQvYcZxSBrW4rCoUuBOx/VmcpqEfA4OwnIPOwMsVcHbCVwSDcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7243

On 14/02/2023 3:39 pm, Michal Orzel wrote:
> diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
> new file mode 100644
> index 000000000000..54b99f87dfec
> --- /dev/null
> +++ b/automation/build/debian/unstable-cppcheck.dockerfile
> @@ -0,0 +1,37 @@
> +FROM arm64v8/debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV CPPCHECK_VERSION=2.7
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# dependencies for cppcheck and Xen-only build/cross-build
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        curl \
> +        python-is-python3 \
> +        libpcre3-dev \
> +        flex \
> +        bison \
> +        gcc-arm-linux-gnueabihf \
> +        gcc-x86-64-linux-gnu
> +
> +# cppcheck release build (see cppcheck readme.md)
> +RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
> +    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
> +    cd cppcheck-"$CPPCHECK_VERSION" && \
> +    make install -j$(nproc) \
> +        MATCHCOMPILER=yes \
> +        FILESDIR=/usr/share/cppcheck \
> +        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"

I think you want to be using a mutli-FROM dockerfile here, otherwise
you're including all the intermediate build artefacts in the final image.

See debian/buster-gcc-ibt.dockerfile for an example.

That said, I'm not sure we want to be making custom containers for every
minor tweak we have on a build environment.  What's wrong with just
putting CPPCHECK in the normal container?

~Andrew

