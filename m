Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803AD08FFF
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 12:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198637.1515517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAyb-0008VE-MY; Fri, 09 Jan 2026 11:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198637.1515517; Fri, 09 Jan 2026 11:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAyb-0008U8-Hw; Fri, 09 Jan 2026 11:48:21 +0000
Received: by outflank-mailman (input) for mailman id 1198637;
 Fri, 09 Jan 2026 11:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fL6=7O=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1veAyZ-0008U0-PH
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 11:48:19 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16deacf4-ed51-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 12:48:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB6960.namprd03.prod.outlook.com (2603:10b6:303:1ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 11:48:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 11:48:14 +0000
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
X-Inumbo-ID: 16deacf4-ed51-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5HStCkGJWdhWbJfMm6fBG2SNtRVaunGJXstVurZjG+nctWD6Xk5lVzX3XuR4sf59MvArJOFXoxhlGR0LeiQqcZcIDX+3vJAXJpKtTB7PIBs6HmT8o4EuZyu8/x2Jv5JPVf8wWJM53DowCFlU1PTsPYA3TXargn3m01JGmko3723GAtf/cq7w5B3RGEaHbeKqJrKgHUQQ7ORkNwIsKbaxxmsQvDsAqvZ9iy2iCU/VfiYkBU0kUD+dpANcQDIAYbk+5ctG/AOIIUOPpLrlUGOlOri2GBygsqDBeiEx4U45e3odPCmKWWEO6kNMHHfWlaQBQHowOMN/eVdhS0JcfB5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di0fXrQd0DWCckfBilDbgmuzrZ0kF0UTfw4cLrbm1XQ=;
 b=YhiU4AOdBIdGSPTm2JoNe68pABC/gMGqf9RKo00d/LG7Sr2HGs7f0ljnIB3jVgX3mIdLHdagllzeOvu+F6YLTysYf/28i4tD3fglVzUJ27NLNcq4rw+l6Jfl8sK8bpslzMms5oE97zctSUy5wwICW8ZF78MyYLXbXKlWR05Fb+p4I/RV8nq6VGZ05hyD7MNZJATUevk/hfXoiQ9+nTR13A2uQA6oKd/+0bjw00ob8X6ec6PFWMGPgLgElkxn1NkTsCWFy8PWLa5UGu+F49exLC8KSsHJ7hy0QBS6eVQxTk5lMe1CtLVk0QuTHRYTsbTkvehtr1qt62YWVASd4DmZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di0fXrQd0DWCckfBilDbgmuzrZ0kF0UTfw4cLrbm1XQ=;
 b=K11RWo9eAyapHMr/sc5hmnS0OehhRDYr0PD3gK3NcpJvjtETEOnh53zT2gCGsGzYo2BwQRBfcqN820udwXZc07VXab8l/8crCJCmomHvIa6aJKo1wxZu117jc6HLx81NrhrdMpYlH0gsfOly8snUSifP2+ZiVrXXklwgcIGMG0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac8f6210-e49f-44a5-9e91-f6e1ae77f967@citrix.com>
Date: Fri, 9 Jan 2026 11:48:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH] x86: fix incorrect return value for has_if_pschange_mc
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260109114330.2361144-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260109114330.2361144-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4eeddf-8ef3-4187-a9db-08de4f74f8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eC9hVFljTFRRV3FHUUltemRMUHZGNmNJVnd6YmZDazBFV0x1ZVFsdmtSNnNT?=
 =?utf-8?B?bUZ5R0E4YXJ0LzFzNHZScytxN2o1alFhM01mdFg3aVNaSnVsZjNleHlhQU9X?=
 =?utf-8?B?TXVBM2NiM1pGVkJiQ0tBRC9EVUdoQzd6TlFpdjRJZUFmbXZyeDdwWmRhanRr?=
 =?utf-8?B?bFV3UmlhakVRYjF5WkRYUC9PSlZSR0xMSjlqd29rM1A4UytXdXVVWFFwWnpy?=
 =?utf-8?B?clpvdWMwUWJWaU1MeWtEbHQ2SS9ocTNhUHJkUWN1cEpBS3RCckhOTmJKS0lp?=
 =?utf-8?B?aU9iZWlFMXNNZUlwaUkxRXFsUWtWNzBhOEpYR1dpK216TkhiT3Y0Rklvcnh4?=
 =?utf-8?B?MVRUVDNKa0ZNVnBPVzFoelVxTE5lbFdqOTJDWExvMnlHR1JWUUhMNzhGeVJ6?=
 =?utf-8?B?YVlVUW9EUFY1VG9kVTBMbDlLVGJYQ2R1VjVmdVU0UFV3VXhvaEFxT2JtZ1VB?=
 =?utf-8?B?VHdOblcvQVJzUFpyVCtUdkpmSHM2SHcxNWl1Z0VLZjhRKzg1SEFRWEdTNWNl?=
 =?utf-8?B?Vm9MYnpwak5ZUHlLdzVXWTVuTU1DcEtSNFNsUWQxS2tKR3lZdkJUcXNqWWVS?=
 =?utf-8?B?M0JBc09RZFczczMxNGZCYmdlbzJyby9GNzlyeEhhUFV5QnVVL3BhbXVlMnNS?=
 =?utf-8?B?RHUraXp5QVdLNzlGZ1plOEE3TnVHRTdpS1FpZ0Y5bG53OXdFSGhHZHpOcXNS?=
 =?utf-8?B?bmRPOTRpSTd3OE9JMUw0MnZ5QTkvMzJuVjY0UTVZYnZDSEVoa2YrWFQ3MDRy?=
 =?utf-8?B?ZmdtVDdtVFg2VDZJQVlQZTZSQ3R3RTVYZzdGWWVreVUxSEhCVi8rQkFKeGs3?=
 =?utf-8?B?bmdXMEVTWXE0R3ZHMjNDTlQzZ3hobk52d2wwWnF0NUVML0c2SG4zR1pxRUtJ?=
 =?utf-8?B?dWp3VE5wREdTalVQRTRpc09vUk5WQ1RyaU00MUJGQWR5bWF1eG1uUitYWlRy?=
 =?utf-8?B?bmY2dERMN2VIQUVoR3M0d1NnZGFzREM4S2pJcFNkbis0Y2JOVHZPMW1xT2Iw?=
 =?utf-8?B?cFJSbFJMR2E4bkx0VXRkSVFuZ2V0MzNOd2VPMEI2Ky84akltRERQNHpkTEJu?=
 =?utf-8?B?ZHJVSTZLS0o5enlLQ29xMjJQWEhnV00vTWtnV210Yjh2bTNEZWhaaktycnlK?=
 =?utf-8?B?RGtvN2xFN0crZmZ0QnBxNWlRUHZxOVJTeXpueVR1U29saGZweThGalc0bEhh?=
 =?utf-8?B?aDdYWmdGb000Z0pvOXRqSzJDTkQrcXBjaTFuTm8wTE53YzRGM21jdjd5enNv?=
 =?utf-8?B?cG1MRlh6YW45aDZTTmdCd2FhOHZBU0xGQm4xL3VLaHMvdU9tSUw0eU1jbXR6?=
 =?utf-8?B?T1pYaUxQVnVjWks0V0g5ek5UMUdCWWRMTFYzMEE2WDhlQkhMeS85eWV6NEFt?=
 =?utf-8?B?bFE4WUM3aXI0Uklhc3liaU9qWllJMWxrRFJUeEVqcWN6ZUR6QVZ2bFBZTCt6?=
 =?utf-8?B?RVJyUFlpdDJmUlRaVkFselJWeFQ0U29GWFdzR3dReTNhVmJPeVBhVnlVUTRq?=
 =?utf-8?B?OW13ank3SUw0S1B6ZXFPamVIWHg1RkZkVmpnaVRCVzBORHU3dWwzR1IvMFRj?=
 =?utf-8?B?Tll0bmVEdVZ1UllkMk1KTUIrSnlsUjhOUVNrTmpOOVQydzVSS0hFck1OdXYz?=
 =?utf-8?B?SVB6NTFhNjUvUHIxSjJCNW1wRVpoRTZ0eHVTaHAzM3N5TlZkbFNWVURkNklp?=
 =?utf-8?B?d01pcjBmNStOWllrYndneUV3QXF2TkNaN3JyV21QZDFYQlFOWmxsejhYMUpi?=
 =?utf-8?B?YVdRM0NCYnJLcGpBaTFWa2owSFFZc1I3Q1R2ODdENUcxYisyVTRyemN4anpZ?=
 =?utf-8?B?MGJrRVpEMllWblRVU096cWd2QjFUZWFTMW9XQ3ljYUVmU0NEOHB3Y05ac0Ez?=
 =?utf-8?B?OWFNZUZMaUxVUU90bWprM29QM0EvMjZwNmxnZEpTaDVjMmxxVG9XUmtLcUVn?=
 =?utf-8?Q?w2l0GwOBRcBaHQookzunXDqtQhWf92U0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3V6bFNKNEpHVWkzRUd4WVBwUU5YNE5DbForREc1NHdNM2xha2s3UFl0NXV3?=
 =?utf-8?B?MHpWUzBhemVLcmhpSW5jVHltK2R1Vk1TTjB1QW5tMlZsNjBiZlplUThIM0RJ?=
 =?utf-8?B?SjJjaUw3RXJ1cnZNNXVEZ1dXNi96R0N4SDkvNStCblJ4djRGWEh4UldEU1M2?=
 =?utf-8?B?SU1zcXlNM0xINlFMQlFZa040em5kdlZyRzJYMGROWlFGbE8zMmsxSWo0SGJ2?=
 =?utf-8?B?ZFJGOFk5dlJRelNqWVMvUnM3TEZWM1RnclVIR2hQUWd0dFZqUU1aNCtZVzRo?=
 =?utf-8?B?RHhGSXNYSHJpWlN2OWxZU3k4RmVUZUJzdHdMei83Q09OYnQ4OFRmQmlSQ3FW?=
 =?utf-8?B?aldSZVdza1h5dUJVdlEydnJFT3Jad21uSWlUV080cUxoMG9qOGphVWptYjUy?=
 =?utf-8?B?OXk5dFhKZ3dEakZpQllwQS9mbU5UWXFQMk1CWVJIWVRPR0VEdnJtMnBiYmJT?=
 =?utf-8?B?cStoelJpc2xtb2VOcmNabnZBYmsxSW5yQ2Rsck0xU1ByMGs5d2xvdVEwSnhn?=
 =?utf-8?B?VFNqa1Z2akltNSs2bUlHdGY2amZqNlArVmRzN1NxbVFEZzNQVllZdG1BRy9M?=
 =?utf-8?B?R05UUEN2dE5HUkhJOWo0SVNLZkFISTRXaDRWbnRjQVFQMVpDUjFhRlY3dnNT?=
 =?utf-8?B?UThvalQ2dkU1ZUpKTlk2Q1RPUno3b282eWtaajRCNnZSK3FkaXRnc2xjZ1NY?=
 =?utf-8?B?OHVxaUpoK2NEVDZQcDJ0am8renY0M2FlMksrSDJUL201OUI5SURvdCtvdFhC?=
 =?utf-8?B?U2xRRTN3M3NZOVVCQWtZQkRhcHMvamhramJLVk9IL1JNK1hnVEdRU3JhZjBm?=
 =?utf-8?B?NkhuSlE5ZTlWL1diaTFLRi9ucWNJdzZPWTRzSnJrNTNWK2c1UmtQTWs5OC9Q?=
 =?utf-8?B?WFgzbGx0TmxuSkdmUFRaMHlxMW8xNjJNMnoxVFkvNGtLbXViWThOVW5kckRE?=
 =?utf-8?B?S2JhL2U5YXM3VVRtUXRMTXFIRUFRL2U4QjBpbGFuTWNuRUdjMU85K1oyeXhT?=
 =?utf-8?B?UFdWYlBBRnNwK01Wa3VuRm9MaXdQQUJFRklCMmJXMVZyZktyaXlmcE1OaXAz?=
 =?utf-8?B?STVPMkVKUEt3Nk9GOEJZSjBTbE5WclFOUlNXc1hJWVMwcjZ0SUFnSzIwQkJk?=
 =?utf-8?B?SXlNUk0wZUlCemVMK1ZlYzR0cE90T2lYNExkSmJvbjVkMFJheVhKSVUwVWd6?=
 =?utf-8?B?V2l5VGFqSllub1NkOXk3MjJQaUQ0VThwczQ5UG1FYy9xZmJvemVJQjBIOCtD?=
 =?utf-8?B?TjdMMVc2SXhhRVhINGFsQlhGZUdycFYwY1AxTVJnVFhSWm1FT3NDY0lhdEYy?=
 =?utf-8?B?S0g0blVEbzJZd2VkaWpJZm94dUVETUo0eHZSS2hydXlIdFdLZTZjNFdUOWdZ?=
 =?utf-8?B?RWNGMlZLdDlKVzdMajRmSGo5TG96T2QzMzRFYkNmU3Z1K01hTGw1SDVXOXlZ?=
 =?utf-8?B?cWlvTWtIUjA0UW90ZVF3ekRNUHRhR3RJY2VybHVKTUJCR05Pakl3WktJdldy?=
 =?utf-8?B?L0NBZFFYY3pmSjhqblJRTWZrcUR3ZlJZNG8wTHNnK040enM2MzNBb283cE93?=
 =?utf-8?B?WjhCODQ5K0hhcHhDTWJjU3Y1My9PRGJUcW9DQU9iOENKekJlMkxwd3RtZVc5?=
 =?utf-8?B?b2IrUmxNUHlFWml4azVxMnNmWldzZ0YzV28yay9ndkk0OWt0ejFEVHVmaHJr?=
 =?utf-8?B?NXVieVdpSkdsa0Q2RlgrUGtxVmNMdnRzODZaQ1BLYW95cmJkT1paM1R5d2JQ?=
 =?utf-8?B?dGQyOWVlZzlnUVJJUVZSbnRTUDh4OHpLNWYzMjhuRHNIbk1oTnBqUEliUjBG?=
 =?utf-8?B?VUJOUG5ldU94QnFCaGc2TERFT3N4NWdzL1MxbjZHcW5JWXZ4Vm5kb0RtZzJG?=
 =?utf-8?B?eWhuVnRkUGFjVk9ML0EreXNxeHdOUDIydUhxSHdnTVN4Rlg4ME9DbDdnK2pB?=
 =?utf-8?B?alV6YzZwS2EzeVorK0pPNmR5RTd3WEVHdVl3NzRlV1NVbHJGd0Rub3JjWXFT?=
 =?utf-8?B?VXdmYkFtWUUvbWFZZFRpNkwvUDJiT1Y1ejlmZEVxd0Z4Vm9mZnlkU2lCSDB3?=
 =?utf-8?B?TmdubWxReVRFbEpranRIeUpHbFpQZlIxclZUTk9CYVhmb1JHcHpiQU16eHZI?=
 =?utf-8?B?TXhlUkZPRjBnWEplMTdaRm1iZUlTakVtWTByRUh3MFhqeDN2U2hrTUc4bnh3?=
 =?utf-8?B?OC9MRGNYUE5jNHJjSzFUeEpJd2VWQURDNmFrUXF2SktheUI4TDhhL21jd2dk?=
 =?utf-8?B?VUMyZ1JtN01mWUowazBRUXdyZzNNOVBpSVJUODZWWVNqNlNEaW82Y1Z1bkxi?=
 =?utf-8?B?YzhCVVFsTGF4ZjdZdFBTRVN5cEt5RXp4eVJ1Nll6dkROQnphRHJYa3Vrc0Vz?=
 =?utf-8?Q?0ovlCW4okCrVnUnk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4eeddf-8ef3-4187-a9db-08de4f74f8e7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:48:14.5811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: un++iIC3oWZrhyKt/Lihy+58ElWnWUiO0S/2HH26V2Cg9Gs1rUV5o6JBLPg7TXYA7pakQ4SYFXs6IgY1IA8hkIL9qXP4zSc9lR7eauMTAwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6960

On 09/01/2026 11:43 am, Kevin Lampis wrote:
> A return value is missing from this function leading to safe CPUs being
> marked as vulnerable.

It's not really a return value that's missing. It's just that the Atom
block used to fall through into the Phi block to get to it's return
false, and this was accidentally dropped with the Phi removal.
Fixes: 85191cf32180 ("x86: drop Xeon Phi support")

> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can tweak the commit message on commit.

~Andrew

