Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759EE69A22C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 00:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496822.767730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSnVw-0007V7-KR; Thu, 16 Feb 2023 23:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496822.767730; Thu, 16 Feb 2023 23:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSnVw-0007S1-H1; Thu, 16 Feb 2023 23:18:08 +0000
Received: by outflank-mailman (input) for mailman id 496822;
 Thu, 16 Feb 2023 23:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSnVv-0007Rv-Ca
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 23:18:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29690b1a-ae50-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 00:18:05 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 18:17:58 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 23:17:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 23:17:56 +0000
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
X-Inumbo-ID: 29690b1a-ae50-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676589485;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oPZ+skCAQtcDLKyYS9kuxx/ORCORHxOUWc/buW43KkQ=;
  b=Wc7oISHbL4/mHZ4jBrxsx7Qhv+nop15jIVky5lIaTxv7RPrdrV3mUAnd
   3rhSMnpCRecBgrp8QvZmF2O1NtjvtGiNVXGMuj+Z5odsv6n9S/tc6Wcxi
   j3YKaFx7d8F+HlEe9H0gbiBWr9VCtfUFLtf28HuhZH07nJ6WCzQct1ZWB
   4=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 96228750
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YLUCQa5cLrKTuUEiA88CpAxRtBrGchMFZxGqfqrLsTDasY5as4F+v
 jFMUDzUPfyPazf8ct1yPYzg8B4Bv8eAmNJgSVZu+S40Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoS4geF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 vUEBwBRaTO5uriY3q34dPVQvu8OI5y+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOKF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNMTufoqaMy6LGV7jwyGTZVVkOjmPywjF6FcdIEM
 WsRxgN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zppt41hxeWFtJ7Svft1JvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:zeeRCq7S1SMh1VtIQAPXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="96228750"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxUHMiE0DjCwFF2401odZKcMSVxnZsIBdN2pDAkaN39ZPd5YJRpi7QFL+7QBclV0Ahes18vZDuGIk4GUot2D5A5x2/k/y9ErjJmKuiNnEdjv8SGtHiM9fE+Nv1ql0E2SrXq/hjRiHtbzvxLsA1t1yGAkvo1R/9lmDNMG9iAV8EJd+7dU/0tlki4MRJkA07p6qV4jeLVIJii9VIKfRrkJl9pkNPUctGnNFsm0y1QouFAICR/rtF1yr/9Y34c8zlG72idibAzEF0R77eIOVIkxHCIOlneKIKhLrqvyDG64fb7k6jeUJGZ30ERGqf61nP9OLZn6woH0CTb2W0hStwXmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf25VlnnNv1fszSb5sncly0SRB1jltSI/r7xw4S63+A=;
 b=kjbEuFGsWayn11SXWq6LjNRPFvlcTkKE0gLxAdZwXaGI2hP0sThqzZN1SktcNV8E+J8fg3vZ8sLOl90Rmhlig57rErzq/daNO5PZdO+Jv7nTEcCof8TvrTOcbLpLqx+NWa4eJDl7zTuIFyuRe2j1D1UBuSrejFvt7cRr2yOTJFXzEl8VlDf2buFcC+ea6qqmVibdHWmMWCeOCCXFVP+CIvzckCkOCTmkoxiZquuvEaVUTf02M6aryLh7qpjU4SAN3aXmmjLhxNfeGpX1Y5ceWfOkgRyUf+BZyAiXAxDZGoqWE9wBsqYP9Lm+xeqGfdse/IGBTkcGRK1Frq/fmZKi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf25VlnnNv1fszSb5sncly0SRB1jltSI/r7xw4S63+A=;
 b=rLhEmU4kKcc13xO2VtebiXVItxtPfv4zQNCLhpQgyOP5uVg9e/WX+dxhmERlTmb6QHBP7Wph3/+L3LnoXsULIW/4kFUF/ArpDV9VRYsfz9s6K5dficae4KAU05t+/UTJ83ULMLeohkJrVNS+GuFYm8NZDUdZrTuVMYa5IO6Pk8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <65cd4fae-f6ad-1a2b-043f-665cb3903576@citrix.com>
Date: Thu, 16 Feb 2023 23:17:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] xen: Remove the use of K&R functions
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230216224438.705395-1-andrew.cooper3@citrix.com>
 <a3e55b64-8393-c236-44d1-0db050ddec4a@citrix.com>
In-Reply-To: <a3e55b64-8393-c236-44d1-0db050ddec4a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 66300160-2077-47b7-8d68-08db10740942
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mwFUBOsd86wsF3507EmuzPebbrM9T4tfx0v4/3PtA2/dKcxyHQbSwQwLDrc232MtyFb7/WO7FJRd5LnJL6ESCgzQ1M7Yi8I8t7Chw2Ig5GnWmCtdD/aRAaObRhxRPdy2EwXwlu1mHLuSh4GSHr15UhiQlnM9v5FrYfov1hqML7DRALGxEk1+XytP8YZ0iI0QtsmalBOsQihMzOtQA/JQP4whZxy+4dwIrvveLDT8H84hhnG+cP4QRFZowI2YvjaHu/Ah1ZzkvIrqKB3aeiBa0jL4RR0iLy3hEy1azvgOALviLeFzCEhfr8m2WkmKuWdOarU9FSlclqAm8lcsReHjboz3h1TB0/CRbIlpemCxCXD0iOz4+bCjZMZkjUfYLnyU1vxJIO64HCKr1ASszUK/9kJdGIbyv+/OrQTZIpvasoVrdnq7VnlfKu470AsKcao2JY0blFl1t8WBN6I+cMrWGUbqciH6gSMgvXdQn4oSArvzTXctNHMNNHEugiNxub7Xxg/6EVVzIa5Qj51Fmz8PI468gyGaW5UfvWnBma74bUFt51rlLEU0tScHhkUNPoZSyW3uJkCUQR8/8y5hK7uRUBODJSTau6de5n6rCkh9ps2ZMZQedhpOEx1kdBjQqIKuDT/RJLLxYwpoh4xAoJf05bNRSFZ42eTm+QCSFUUQ7WiJNzihAHkjR4d5RZ9DumI54Wkxq62aDG+ed5gUWwBPL4lyM83aVitieoQCInyHp7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199018)(31696002)(54906003)(86362001)(8936002)(5660300002)(316002)(41300700001)(66946007)(66556008)(4326008)(36756003)(6916009)(8676002)(66476007)(478600001)(26005)(53546011)(6506007)(2906002)(2616005)(186003)(6486002)(6666004)(82960400001)(83380400001)(6512007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG43QWZFWXRpelIyb2hSQVFKb2dOMHJTMXYvaVJ2cko1UHRzWUxEK2JRTk1n?=
 =?utf-8?B?bDBiSGkzUm9HUFNYUWNNOS95R250TVVFREhHZ1pORFVZOEpNVVNESTZVaFAr?=
 =?utf-8?B?ZWUycEtaTDBvV2p0bGx5ZndveEJCL2lUbzJjV3FSdmRXL0JtR3BIRWdiVm1D?=
 =?utf-8?B?VUZHb1l2Yzd1VmhXbVZkTUhqUm4wdTZhdTdITnQ2WTZPTUNvVExJcGkrQTQv?=
 =?utf-8?B?cHZ5d2hUTGZjaFNKdzM3KzIxWnlsRUFjN0pWUWdqZ2w5c2FnRGl3bWFMVE8r?=
 =?utf-8?B?cDdrZzdadVFWMUtUN2NCT2pPbXNEOGhSMTlLeWJRaXhZZEpUV0pLSjVGUW8y?=
 =?utf-8?B?UW9DNWFSd0RBQ3ZvZkdudzcydWlHVjJtbE1sSHNzcWJ5TnFsRy9vaHBiVDg4?=
 =?utf-8?B?eDZ2eWRhU1Nhb0crVkEvMU0wQ3NlakRjSEVYSmVaQmtVMWZYZFdZZGhCNGZW?=
 =?utf-8?B?RXVyaE1LNHZUSUM3VFFySWFRSEwzei9HTnJiSkF3SFJUbjE3UVFBK09lUEhz?=
 =?utf-8?B?L01Dc1lKcTJJV1Z0TkdHYUZXdnJzMW5jMFNWd3F2cWJmZWVmOEZRcDU1R01Y?=
 =?utf-8?B?SUpKOEg3MHNjVnRaUEplbzBwUjV6c3B6UloyUDFWbE8vQUptL1hwS1JWRXUv?=
 =?utf-8?B?VWlMR2NSOG12aXgrNi9JaUc3eTI1T01rK3BrcXVydktRdm5CY0hBbzJCUDR6?=
 =?utf-8?B?c3g5VytLaXlvS2pGa2cxM1crRUFienBCbHZiQjdHUlhDQjJlQkpBWUQvbG5P?=
 =?utf-8?B?SWpIZWxTSCs5dmY5N1RORVYxNzVkamoxR0VGbjQ3ZmtxSXVNM1lHQWxMUE4x?=
 =?utf-8?B?SW1seHR6N01IV3dhcUdteWxKRHZxQzVWZWJ2SFVEdzE2L1pQYjE5NnJBTHFx?=
 =?utf-8?B?NmFVT0tvOTZCaDJUZWkwa3FKbnBFbU5nQjhwNklVcWJaeXZObis3bHo3cGJx?=
 =?utf-8?B?NUxwL0Z5bDgvQW84eXBDMDBveTczYk5RK3IyczdEeGhldlNEN2toOXBvMWND?=
 =?utf-8?B?dHc3SlVUUVRkRXlwSVlBRUpUbHpveE1DQi9tVWtuMWNVQTN2Z3c2eDNNWEdQ?=
 =?utf-8?B?YVM3bWZYY051VXJMZkpjYndsQUd0c2MzR09qN1hJSiswcFJEb3NJQm5YTWtV?=
 =?utf-8?B?Z3dNRGFHYlVMWXNmNzhtZkNMdkFMdW9lUUtsS0hzaFZJWHF4c0E3T2RIMjc3?=
 =?utf-8?B?aWExNVlTL2ZZVUk1b2w2UUlLcWVQbkd3cmdXUlJMWUU3QXZuYWZNbFpFT0sx?=
 =?utf-8?B?QkJYaURVOEVDN25FRXF3YkZ4ekpKTThhK0ZHRnRwQTN3RXZ2RERxNUw1MWli?=
 =?utf-8?B?ZHpmSXM5amFWSVNML0hSOGQ0cVduNlk3U3FEUnFRTGcyK2hQZ01ZSWdhZnF2?=
 =?utf-8?B?N29xQ0xGak9rK2NESXNXV2RHRWttd0NXT1N6NDliOFltSk9QRFdheVRlTk15?=
 =?utf-8?B?V280Q0w1N09ROHh2ckFvN3RQWDNoR1lxL3U3QWtmVFVROHFpY2hpTmNKbkVm?=
 =?utf-8?B?ZENHTk5FVXlSZ3hYS3RGNTEwYmg4MGIza1BlWFFpN3kwNUJBWWRNT3VBTUtV?=
 =?utf-8?B?WkhIK1FvOFUyRUNrOGczQndNaitrS0c5Mk1mU0g2MFQwTTYrREt2bVYxVEFo?=
 =?utf-8?B?cTY1aDU0UFhXSVYwc0Q4WVVYSCsvVnBkYW1PM2szUUhVS0Fsd0I3QXNVcXZ0?=
 =?utf-8?B?ZEdrQS92YlBTd0RZQytvL0lrd1UvVS85OEs1U2F1d1lMTXU3TXQ3aDBaTmUr?=
 =?utf-8?B?SHJmODY3SnlQV053YWEyZlBkS0h1V0pnQStRQXBydGVNM2xRck5zeEtJTUZ5?=
 =?utf-8?B?UVNsSE9qWGp2SUxmMGtNdEZtOXV2a0cwRXFRVG5QeGFPTTVwMi9lTm50aFdS?=
 =?utf-8?B?dE9hWldCclJDSkN0bllQK2R1TFYyQXVpVkxkTjU5eHNWQTkyS1YvU01pS2M1?=
 =?utf-8?B?aytNL0QvS0JJL0YrbFZScEJLOGZCZEFKWTZnRklnWjN6YWhPUjZXV29hVkZn?=
 =?utf-8?B?cGIyT3FwL01RYWtMY3dxUk9rTnRwUFBrVi9jeS9HZEpUczBTZWk5aDBwQkxr?=
 =?utf-8?B?LzlmYThxUzNCNHNPRGZhK3JNbHFsV3ZMQVBNZ01Xd3pYNVU1b1dLWlNvWUhv?=
 =?utf-8?B?ZWt2TG1GZnR1elRWMjVtNlZ3amFqSXBMOEx6SWYrc0hPZ1NQVnRhNXhIL0JT?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7nqFkCkloRCDXKP7BbNJkMRng6U+zO0Gvdfe7G9ALbHQmZIpQ9zjRYeSrOROIT0yd68hw/uz/AgX9FZG+Pu/6umBeo8GP9/RHptRoKlddMB3Sf5nL1CzIVQw/TGj1qWfgiKm17xDb/ScxoO2pf+k0hcdsmy3vXgG+Ffxk0SPeL0jRlWrGhiCkk4zTXNnb+VcXm2PD9F5rQwcWnSBtDLNzYj49GC8Go1paECUqc9fd/7a52XyD5rHX1b+2UHUHy3L5qXrUy0dFyKUu2bZ1CJ1RWwHYBMgxRA4nsEZ3XT9rbCPWb+6Y1+Nt6fiPBC8GaihSy6PnKjsqfSU0bzxuLzBQ5JgVFuUF152RFfqfsNdqOwUNGdf0xU+1Igo6mZoSpUfWEJUnK+1EM52xBZeTW/JmWc9FZ6QhdJFCFO01RgM89ckbJ4Htvc2Y4gcVSZvSh0rhMTXlboM7+uVC5FBCerpmZKa+ZS00oqJXqYNo3TgZvJJkDl5NdxkvMmpn6rnYTkiX+IhMZ10zk1K0Ferb08ZCNvXDao3oXzx7v4MvRk4uCkC5iCy4iwYg12/vWLMIjbCevOFY3yTK6oDDvfzZg/iqTEd0NB2xfjlObsUIzGrxPzA91VInRkOdsor6/m1kw12Vsl6v5kZY5L6I3MrWlKHThjD3E1LuWfmQ9pwle5omgTx2UwSNZJeykIVLDbLbwXnCMx4ue9eHPbGMTwPOsjMynPdgE6lalCK7nGFOKair/cuSkhCjpDA8uJOWqudUnFE6oEUO2ygn4hkCyZ2bzGY2GY049iQguPjTi7qVTBm+LoOSScpYhiIRN0ThCnw9lL5vnPP+4pxK4mwDsEA3sVUhg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66300160-2077-47b7-8d68-08db10740942
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:17:56.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giHAq7XxV1ewKjFPyxpu/Ww2qFtlBdW29npDULPyP4ZzauXysojUFiwXLy2Vg3lm/kyARo8wlHQqNC6RpGKTka7jRyrjrD1jMRRxYhjfL60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

On 16/02/2023 11:02 pm, Andrew Cooper wrote:
> On 16/02/2023 10:44 pm, Andrew Cooper wrote:
>> Clang-15 (as seen in the FreeBSD 14 tests) complains:
>>
>>   arch/x86/time.c:1364:20: error: a function declaration without a
>>   prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>>   s_time_t get_s_time()
>>                      ^
>>                       void
>>
>> The error message is a bit confusing but appears to new as part of
>> -Wdeprecated-non-prototype which is part of supporting C2x which formally
>> removes K&R syntax.
>>
>> Either way, fix the offending functions.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> These are all the examples found in a default build of Xen.  I'm still finding
>> toolstack violations.
> Apparently not.  int cf_check vmx_cpu_up() too.

Ok, finally got a clean Clang-15 build.  I've folded this hunk into the
patch:

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 09edbd23b399..e1c268789e7e 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -781,7 +781,7 @@ static int _vmx_cpu_up(bool bsp)
     return 0;
 }
 
-int cf_check vmx_cpu_up()
+int cf_check vmx_cpu_up(void)
 {
     return _vmx_cpu_up(false);
 }


but am not intending to send a v2 given how trivial it is.

~Andrew

