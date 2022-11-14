Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D9627A3C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 11:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443224.697767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouWTd-0001Pr-HE; Mon, 14 Nov 2022 10:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443224.697767; Mon, 14 Nov 2022 10:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouWTd-0001NQ-Dt; Mon, 14 Nov 2022 10:14:05 +0000
Received: by outflank-mailman (input) for mailman id 443224;
 Mon, 14 Nov 2022 10:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouWTb-0001NJ-Qd
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 10:14:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fe82300-6405-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 11:14:02 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 10:14:00 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 10:14:00 +0000
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
X-Inumbo-ID: 0fe82300-6405-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4rUQHgBuZLw/ICToqjKgatK9uiK1qk76bXO4bpGQnAIa/cm0RdIPvY9+sZew/Q38yGb+++V42byyH1/y38DOkwljYGUZRXarA+jI+p1xCSyvAnRfnC8GYxeEyj6aJ6kaTJxcXNJurRrFEotPYqjIPTTgay9z3O7cVf/kY2nYhUx7DCMGbGVzyr6XNGgWB4GlH6hL6BtIJFYZaLQ6FrSwXldh5FAdN3lbH+8H9zodee2H4Vd+7kV/5P6Zlo5oFY9hicpcTXZldheraQ6JEjj6k4yoCO0IvvXTP5JSFpiJvXXQ/NOALD1B644ABxHX8e+KODGwEfP/zv+igOkvw+k1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDg6WjHBKLnweFvSdnfYqoVVNaj+eMRAPRBVESqmdOk=;
 b=iMAyvvW6mer/wBFU/qin7C4c9EshKsftI/j02fC/kpa4uIHjyVLe+Vna7W01KdN+Gsfk8K9/m0dSE1Md91+tptLkHEKh5ixx8ksscUgD95K/GkI+lqtrlKW+cpEv0kcZIYxCscl64PTgOE1M7o4hEsPjTkMvDLG9hEJNBvNN4wG2a9T2C0hgalct5SaX4nYa6GTyeSSecaAFeBLs6qefp+hl9haXjVWvHxWUXSfNBFnjrGrujTPT53SXCUr55iloSppuHL2pG/FtAsDa0H/SpfzGGZ/b9W6knOHdnSgj5gb6RDgizJIS3i/hmw6UkYONaTn3XEwEnlMhoqAYhiRg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDg6WjHBKLnweFvSdnfYqoVVNaj+eMRAPRBVESqmdOk=;
 b=YoTFiIH3pKeh6mjcTeK+7uTBzYZxqBLrqF3DNN0fLtkv032a1yC1krRKH1xKDyDf8sSX+N9Zi7QpkRs93D/qwyuSWtZxMCxCcDipCeLUkWqmQwy7E0LuxPukNB9yYa4s5xjbdvt2LFvGEXf/DVgKXdq9zEsXHNLD3IksT23p5p337xK9uiSF/Q3rc1gp8QD5t2j946vBOKKCRxtafX9KsuwhSND+MZd8MEFFOpVOM5UYTCFtL/h7uW31G8EJ9XF7go6VC4q6cIlNqK/26j/K+VRFwgaHG57WI0ZHddiggGSJ2LKTSygyTOaOboRWtS7HcZ3hNcxoPFRpgzKCK/9dxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9ee99e7-d306-223e-3fdb-af5f10264c95@suse.com>
Date: Mon, 14 Nov 2022 11:14:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] x86/msi: remove return value from msi_set_mask_bit()
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-3-dvrabel@amazon.co.uk>
 <29e6e6ca-ffb8-3719-5004-0cccaeb5578b@suse.com>
 <2991d69a-eb13-7044-d65f-14540676e642@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2991d69a-eb13-7044-d65f-14540676e642@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e50b56-0c60-489f-b0a8-08dac628f316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+P1sKUlsUSQPuZVSqHmdTMrAu2no4aCLgOwQ0YoPJSd3H8vkBrI06J3HprbjULVfWn4TRES9ye3dX5ZvJDCge+G6Qsle3gGVwOx2u6wmpUpFTPkVCwoFMNtXp0bxZku2wt+kuz3aRtQ9T6xKwo61jMw0p85bwjjEpxSxEtHNo9uYCdUTLVyhEQqgWgtiA/vvJBjIO7BEw/VfAqNLekPEMH48EiW4bTBssD1NPt+Nc4DeOC6PhOPi3JsLSoO1KgMqNzPXHkULeI/TmQSuchKyF74BnPnYOlUDXQVsQoWVyrRs4JzGxmoiVmAPNyegu2u8iGZFrWjiov8X63WKBe7ZoLNROV+UGb8eHZ47TeLBF6wf/BaEsKFFBBES55t/d0WmNHHJsQi6nAIuijehSOaScom1js0fvu5EFn1bvmCpjyQRLeAiXKGB66stNNZD4aMzO9WJNl6f1gUWFvvHxdEy41ZutI70INtnr0Olpcxfdo4lLUNNVu5qrR7nryuE8IGOzMHazVVCNyW+7RWLapIP4LWOjOR/MFEc0bDNko0nkg2GA8BOXZx037oTyP9cSzteCoe9rFyCnFvDw1+nBRBvKcMXO+8Eio9GUHR/GQofOcRtsluF6w1n3FmlzSD143kN7cYcaOAeHK+OYXKGBoN9MpbV7ZvR5hAequypSGn7FG2rgcAlq5XG5Vsvp37jOFdZE2UcM0jHLsOlmJZ8fQmHmYwW2Zvj8G0P/qCm1hJrI44CNLM+hXz75yeQzfHjCmr9gumxltwDuPR6SFbHWoLVCTOoaLkSH2B/oFltMJoBvoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(6486002)(31686004)(53546011)(478600001)(66899015)(6506007)(6916009)(54906003)(316002)(66946007)(8936002)(6512007)(36756003)(4326008)(66556008)(66476007)(26005)(8676002)(41300700001)(2616005)(5660300002)(186003)(2906002)(83380400001)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWRSUy9nM2NYSXpsUlA2WDBGdFlvclFjVnpoeC9aZjFwUWdzaVJXNmRvakFN?=
 =?utf-8?B?cnB4VC9uNlBqbXI4WmR4NFBJd0lRdFRHdSsxc1AvK3FUNFB2VW5WSGF4bmVK?=
 =?utf-8?B?eTFQNk4zeWRaTUUxYWo5VjJSak5NNGxuc2N0TFF1YVdTeW12Y2lXSndCK3Mw?=
 =?utf-8?B?QnRIa3FPOXlZcy9FQWlQTHU5Y0Vidm5HN085a3hSVzZSYlo3WUZ4cFlGenVD?=
 =?utf-8?B?UGViQlc0c01NVThmYlQ2bzlyTUQyenNwSTBJMmdJZzRzcjUrMTV1eUh0dCt4?=
 =?utf-8?B?aE1OUFFwSzBIUzRmRFRvcEQxQXk5cXljd051NWNNZXJwbnpkRmRVMGpNdWhX?=
 =?utf-8?B?dXFGc09uMTdWNis5aUovUUo1WUZQSnA5QXRER1MvOU5CYWhHT0Z2WDRGWkow?=
 =?utf-8?B?OFd5RDBIWHlsTExOZ0lBVmZQdW93UFZsc3E4b3h0TTdmbUt5RTFWakdYeXJG?=
 =?utf-8?B?eVZNY1FoQWQ0WWZoU1VBSnVQc2xKNHVBK1VyZDBSZEFBT1hvQklrNDhuSjI0?=
 =?utf-8?B?K2QrU2xnaWRmSTcxRWtTWjU3d0k4a2N3OStNZkdYeThubzJRREJlZnNUbFV2?=
 =?utf-8?B?L0pvUFlPMEtEUzJJNVhIVFRVWVZuV0VSUUVnQVJVSDhXdEVFS2UzMGZPMmNY?=
 =?utf-8?B?SjM2SGxBUEdSRnF1WWowS2dEYktFeTdVekxJTHoyRkNmUWZyMEUwVmFDZGpG?=
 =?utf-8?B?ZXltd0RXLzRwOUs0a3loWXdwaG5wYk0xOStucTFVQjFmbkwwbWFKRXlVcXZu?=
 =?utf-8?B?NGd1VEhoUGxGUStLMThkT1hPdC9wQjJIMlBiNzN0VUtqcmpqV0dwWXFjR21U?=
 =?utf-8?B?d2V4Rm43REpYc2NRQlNlbExqSCs2YzhUemxNdE9mQWFrZWpnRlYyWS9pTGJQ?=
 =?utf-8?B?bThMdUp6RVRTU1AvYitFeExjT3BtRGhmeTRNd3ZTbnJxekRXZGpJcHY2aDdw?=
 =?utf-8?B?ZnN6MnUxSHN1TDhKM3FKaTlsZnZMNWNwVWZXV3k4ckd3aEpVTlFQQVYvSjFn?=
 =?utf-8?B?SWM0TDlSRjVBNDlhZU1CWlFrcit5Nm1aZkVUUTBnUFY5d1pFcE5paitSbTlj?=
 =?utf-8?B?QTZyaUg1aGRqLzYzK3Uzb0x2MDJHWUJDK21LVFRpbmxkT2FoelZPSTRGT2hT?=
 =?utf-8?B?NHQyb0MybWJaRGZWM2pBQ0c1QlpPVEV0amdRZW1pcnJQZUZJWEVVNEN6T3BL?=
 =?utf-8?B?NytWSVJ6UXQ0WjYxc05XQnJJOHZJYzZUeDJiRXkrQ2QwWnZucHkvaFBST1V6?=
 =?utf-8?B?cnZQSGFWU2hvVnBsbUdsSGZ2MGtET0QrOUNKMTNTWHcvVnpXeWVzMmRuUEhk?=
 =?utf-8?B?dXdxTHIvSXBuZW5iYk44TmtKckViR0wxeHZleStMQnBPL2hIdlp1OU1wMHZX?=
 =?utf-8?B?QUF1NVU5OTNwaXlTc3B0ak5tUFFtb1BleGdTTThEaEN1VmVaZ0hjMWJsTk84?=
 =?utf-8?B?TE1IWVN1dWlxejlGM3ZlSkFqUmNiM1VhdSs1bXgyeHM0RFhNS2JWSDg0c2Zw?=
 =?utf-8?B?TkpRZ0xCSHVWanVzcmhTdHQwR2lhVWJUV08yRjBpV0FSaGZ0WVJYNzVGb2xE?=
 =?utf-8?B?eVN0RHFmMEQxUnJHMWNreWhQMm0wT3QrVTRzWDdVOW04UTg1UElCby9uVXlo?=
 =?utf-8?B?dE1FWXNETE1jZzhHK2tGN21SN3AvREl2UWhXVW9zcXR4dXNzL0laRUFWSm13?=
 =?utf-8?B?dFErdmFITGlXeUl5dGdWR3VXc3FZV01iSVEyenBMeWtOYjZNRU5kN01Fc0dH?=
 =?utf-8?B?ajhmVGdqOHpkYXRnZWVCVkt2VEM3S1ZIMzJBQWczV3Y2ZFhhSVJNckJ3cWlP?=
 =?utf-8?B?Y3djdVliK3VpVjNtUUhILzlpYVJhS3Fzd0VPeEtQWlB6ek15dk9oUjNKd2VG?=
 =?utf-8?B?QVJoQmVPdmtXR0dTMmQyb015M21yZmZWUDYvcWZRa0VNWGxLcE45MCtaUlln?=
 =?utf-8?B?VkdhcDFnYk03Y3VSemRNZmVNMmxjMWsxUWFIRGEralZ2cG5Sb3ZhN3gxamIx?=
 =?utf-8?B?ck0reWVldndrenNNVVBCaUZhWXJOVXdvRUd3ZlZuT053NnB3cEplc3RWcktS?=
 =?utf-8?B?di9JbHJRbC93WnRtcXBGTVZ3OEN6NVVhS1VCTnRXYTBLa3FPQUtKeFNVVjEr?=
 =?utf-8?Q?7mKnh4xVskvSuRGuKWw0R6IcM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e50b56-0c60-489f-b0a8-08dac628f316
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 10:14:00.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7XwhS9OeNlQP2JB1Gz7l28+whmTHYK1fY0+nbCjUoPFx6lXmbztv7Cwwe4TU8KLgiEA3uQrteRzEmdc/cMYog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

On 11.11.2022 15:41, David Vrabel wrote:
> On 11/11/2022 09:44, Jan Beulich wrote:
>>
>> The idea of the WARN() / BUG_ON() is to
>> - not leave failed unmasking unrecorded,
>> - not continue after failure to mask an entry.
> 
> Then lets make msi_set_mask_bit() unable to fail with something like 
> this (untested) patch. Would this be acceptable?
> 
> David

Hmm, that's quite a bit of code churn for something which, for now at
least, I'm not convinced needs changing. Yes, ...

>  From 837649a70d44455f4fd98e2eaa46dcf35a56d00a Mon Sep 17 00:00:00 2001
> From: David Vrabel <dvrabel@amazon.co.uk>
> Date: Fri, 11 Nov 2022 14:30:16 +0000
> Subject: [PATCH] x86: Always enable memory space decodes when using MSI-X
> 
> Instead of the numerous (racy) checks for memory space accesses being
> enabled before writing the the MSI-X table, force Memory Space Enable
> to be set in the Command register if MSI-X is used.

... there is some raciness there, but we assume a well-behaved Dom0
(and DomU don't have direct access to the decode enable bits), so the
checks are more to be on the safe side (the original change attempted
to merely deal with the specific pciback behavior, without impacting
other [odd/unexpected] things Dom0 may be doing, as long as what it's
doing isn't plain wrong/buggy).

> This allows the memory_decoded() function and the associated error
> paths to be removed (since it will always return true). In particular,
> msi_set_mask_bit() can no longer fail and its return value is removed.
> 
> Note that if the PCI device is a virtual function, the relevant
> command register is in the corresponding physical function.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

What I'm missing in the description is a discussion of the safety of
the change, in particular the taking away of the control of the
memory decode bit from Dom0 (over certain periods of time). Without
that I'm afraid I can't answer your question (and wouldn't want to
review the change in detail).

Jan

