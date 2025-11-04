Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00642C322DE
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 17:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155847.1485228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGKMd-0007DC-3i; Tue, 04 Nov 2025 16:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155847.1485228; Tue, 04 Nov 2025 16:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGKMd-0007AT-0Q; Tue, 04 Nov 2025 16:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1155847;
 Tue, 04 Nov 2025 16:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zez4=5M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vGKMb-0007AL-MD
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 16:58:33 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e45060b-b99f-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 17:58:32 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DM4PR03MB6142.namprd03.prod.outlook.com (2603:10b6:5:395::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Tue, 4 Nov 2025 16:58:29 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 16:58:29 +0000
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
X-Inumbo-ID: 7e45060b-b99f-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keORC+2gmHuo3bKuUZLiLGq+H+DTYgJ64sdHozvWzZyXiKe0bspvlphHakLTqQ1YEOG/JW70bbz8VQM0+7LxJ36hZhj/smvFO4nWPTHjUYLdv0pUvWSdTqVuImU33K6jGtA5JZoxdLlxyh5CIjQt2yGqhcShNZZVn5tnyeHB3Iuhj+/iLZggQmZnw+0kswnSmku8Ssl8RfDNzXKy/fhMp66RHKXZ4F0yjEensmPZa07blHv85OpuOz8AHzbxw3SuSpVFEYCjyPUgEp5Ri5F3E/ZK5qNCf7uUWmtraP243q+V8jVPsoaV4HFnvniurNYo6oTZiIPzboJTqesNJDmpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtLpZZ4ESq/ed3WkfxLCgorHzR6X0X+uThKLdpEQba0=;
 b=f1Jur/DfBCZhS2EIFyWmvwv4MPfGTlzMEZjOSdSHEd24CrQrwVQjb7yqFVmz6+F+M+myJcOarm/kgfA8lM9h+yqwp9EJAy6Ob3E3x60AvS4CrtoSCS0jJ2ObE++hGQa+4sQRX9ZKTp54WjMCXCT3RiK7e8NBItoqpgf7GmZUh5V8k947qaoO6h+vSpNCR1mx6mi7dFW0W3Sk13tiMditxCIk+9PZrpd/+3+XhXQg2Mmfqwve+7y6HHGRLQO0u0DC5x3Zo7ZGa5LocFl/ErjDL7EvOhoHc9efiTb3hIhuUTIQsbkkBckY2yoKQUh4UNL//eisRGRFLQVylvlUjWRPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtLpZZ4ESq/ed3WkfxLCgorHzR6X0X+uThKLdpEQba0=;
 b=RVo6k2+QPIWnqB60jBrdKu+CW1gHoam4TH3ec896zyZi3/0gVRNulT1oGpKMsHToOoc2NOdByIyOKPs7YI2Rf14yaXKJoW+44VzleCwNOs5QTows6Urvzdk7NPE39cwdwRyC+jev8n45EFwYcE5azhFxHrmo407nooO6kdwnwTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c38676c1-2018-46db-b6a1-50954c5f2c46@citrix.com>
Date: Tue, 4 Nov 2025 16:58:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] ocaml/xsd_glue: Fix dynamic linking
 configuration
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, Pau Ruiz Safont <pau.safont@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251104165644.4011663-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251104165644.4011663-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::11) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DM4PR03MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bd5f97-8415-49be-26b8-08de1bc360fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFZRYVB2UElGWWlyQVZZOUJWTmJtUlBsVEV5MjQvNFZybTBmUklpVlh0MHJJ?=
 =?utf-8?B?ZG9jQjJHZEdNQ0ZmWTFpekZFQ3VDVnZjV3lhMGUzN2c3TWM1YnFkM3VTb09v?=
 =?utf-8?B?dWUyOXFHaFNMQ1BmR0JjZTZjaVVxcnpMaGJRc3dnc2xRVkZLRTFsRzNPaVU0?=
 =?utf-8?B?NFZmcnd6SjVoc2lsWTRMNWp1Y09VSlZRMDZaa1h4VGFMYkI1UU9YTEIva0lN?=
 =?utf-8?B?Y2UyaytKTzBvaXhONDlaQk51a05OUk5LQTlJYlppQ0VpZmtHSTNQaHVYV014?=
 =?utf-8?B?VjhTMzlZMHR0WkZXSDBQa1BGaCs3NFp4aXJERE05SWEyb1BPN1VmT2dGRkQy?=
 =?utf-8?B?U25jeU5zeUtKQmJodjhMSWJ2cVFQUG45czBKcDZlenZ1d0hvRzFydTVwYnRS?=
 =?utf-8?B?eFdFZGJMUXJtMUZMcjF2MG5iWEtkTnFDQ1ZEL2xRNUh5QWVRamlxZ0hoOWJw?=
 =?utf-8?B?RUVMckloYTJ3Yk1ZQUFhT0phRHA1ZE15dThnRG1XTTNyTjB4Ukc5SkowVm1k?=
 =?utf-8?B?Z1B5emhzYUlzNkVXd240RDNqMkFYQ0VZUnlRQk40czRzQWtSZGZIeDdZckxw?=
 =?utf-8?B?S2huSGRYVVZMZUNvbWYzSFhkNEc5L3RFLytiUGd3RHh3a1VDUVFvbC9oR2oz?=
 =?utf-8?B?aXh6MGRtRWVzN1kxb0hQYUlUSGJSVzhvekx4TndzZ0k3Y1pDNzhMak1WRVNF?=
 =?utf-8?B?Ny9yVWFWQklsQkw0R01TUjVmM0NoV2NQMHVtK29HRjhiM1hhWTIxYUkxOU0z?=
 =?utf-8?B?YzlJdmU3eERoTG5rUEwzRURIZ2Z0RzhySDRxL1ZwT1duUUtVUnZyL2dERWJq?=
 =?utf-8?B?WXZzNVBXbjZnSTVpaDVDTmcrWUJBc0ZBcEdnVGt5SThadzhOT2MwQW1sWTRL?=
 =?utf-8?B?MVFEemliN2xaN3JvbFRQa1d6VUgwTjlaZWRhOW1kS2hscVhXQWRqUTZwK3I3?=
 =?utf-8?B?NjNiYmdGNU90WjMzV2xYMS85Q1ZiR2xUR2FBamtIUTFDV3pIaU1aYmdWVFcy?=
 =?utf-8?B?dTlhcThwZ2pRMERtakFKZnNkRHpTUEp6cWI4Qktnc3o1eSt4a0NGeWNydnE4?=
 =?utf-8?B?TllxU1QrYlRnK1h2bElzTUk5WnVaVlAvWU5DMmw2K0J2UG96OU1DV2RsN2p3?=
 =?utf-8?B?bXVBR0QyRWtDMVI2ekYwTktMbnVVUlk4UXlJUmUvYVA5eWwyaXRpcWRkT0sx?=
 =?utf-8?B?TjBsaDRMQUMvcHY0S2J0YUtIdlJ5V3JVN3dweTNwb09BdWFMOWRqWGFpWnJ4?=
 =?utf-8?B?UE44OERSUitGTFdaNklWbEw2eGh5dklYekRMUExreFN2UGhJNGVWRm9FNXEz?=
 =?utf-8?B?QWgraVhhc2ljcWNoNzkzYmFIbVZYZStjYjFUbGV4UWNabm01TFV1SExsV200?=
 =?utf-8?B?VWdwRVRJM2ZkbGUrdDVubXArQmtRTzR5UVZBQ3h6NEFTZmF3MFVnM3NzcDc3?=
 =?utf-8?B?dTBJNU1JMkRjaDhGbEoxNlU0eDNYNzl0SE50SHBDQVg5d2I1QVNhRmdlQ3Iw?=
 =?utf-8?B?Yk12RkpXbHN0bCtlazFlVzEyZXhVUzFJSXAvdVhSYVlOYzRlT1NqU2dwb3JO?=
 =?utf-8?B?U0JvZkNnSE56TU4zWDlueUlhV0hUM3kzZHg1NTF3bG5nbGhUSUZMZnZUNy9i?=
 =?utf-8?B?d1ozMWk5VnFZQmlwUG1FWW45VDJEM1ZxaWVic1Z4VWEzaER0bGpYNzREU2c2?=
 =?utf-8?B?dkFUODFoK3RPZG9TQlFJeS84eWVSNmVJZDJiYTR3c3llOE5jbHVTNU54Y2tW?=
 =?utf-8?B?cXZRcjhYek1BRTh1eko1R1J0STF6K0NsVEtmaHc3VkdGeFNrNFFyMEhoeVg1?=
 =?utf-8?B?bzNEK0RaVWFmeXpINGpIOEFLUmtwOXQ4dTR2NUdpZE5HdTZ0aEtaUm1RM0Fi?=
 =?utf-8?B?MWpud2NBOVJIZXRhOXQ2Y0NGNklWbThLRzZ1aXllUUk3dllXNi83YW1SaTda?=
 =?utf-8?Q?xRrHpFkBZkiE19Z5WZozDuXRaletRHyQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlJIdzV5aExjWFEwNWpNcFlzTzR4QnFicktjWWc4SjB6NlBvWjNGTE16Y2d4?=
 =?utf-8?B?Mm56NmRlVmNBMW12R2I2REs4NUx5dm1ZTkxxdzJGVFh1SHVLeHl4L09udjJG?=
 =?utf-8?B?YkFCN0MrQ1BXZ1czOUMyT1lPMVFFS3F1d1cxeUlYbkcrSTRxMzJSS01GdVJz?=
 =?utf-8?B?U1ZldWVIV2dZN3UrU1QzR2NzSHZGTmJVZWMyNWw1V1FONUtqWjNjc2RyVXRr?=
 =?utf-8?B?S2hncTIzWVlLTW1TZmlwczNRWnFtejQ2R0Z1V0Q0UWE3cVl2UmRhUDVUNVdy?=
 =?utf-8?B?MW5TTkZSSWFjMGdhZjhxQ2dzMUcyNXpOTGtUNHU2MDdueUhnYVNnNTMycFdR?=
 =?utf-8?B?QmV0K1VZbVN0SjdLNHdueE1La0psR053MzV1aFF5Z2NwamZuZkdzT1FIdmNs?=
 =?utf-8?B?WHRjMXVjMktuMWRFM3Q0dG15ZVIrT0dBNFZSeE9ET09uUDk3Y0FINEVCYUFk?=
 =?utf-8?B?RXpTODFZa2tTd2k1NnlDalR6czBzeFhlZERGY21RQkYrM3Rua1lyb1RLUW9y?=
 =?utf-8?B?c2h3N2hSSFoyZUtOSlQySFBuQWtkV01NNERMMWNPVDhlSFM5NkduL0tmZjJG?=
 =?utf-8?B?aTJMTlBvQ3NrbitJVjc4MzFZZjJ2aEtRKzdkNDcyVXNURVVhSnZiU1lOTUw5?=
 =?utf-8?B?bmhEdGFkOFB1cUthRWlBWUxSSkJVczR4N3lhNGhJc1U5KzZhYm1aUW81Y0d6?=
 =?utf-8?B?RmFlNEoyVytRa3JvT1o2ZTRBL3dqNUE1alVRa2g1bW8zVnlrSHBQSVgvZmNU?=
 =?utf-8?B?VTgrVTVXNnE4RTdyTWR1aXdsQXV6M0ptK0VLeXZEak16QjM2T21weFRjV2Nt?=
 =?utf-8?B?Wnk2amlKU3VNV09OZU10UVV0N2VHcVNVUmNqR1N4ZzZyamlkYUhpTHZyVjlE?=
 =?utf-8?B?R2M3ckJBZWxjUEVtbGFVcFBpZy83bWhTcU85UXBDdmZscy9zdy96WlIvOVFr?=
 =?utf-8?B?ZlgyTnNoQ1UzdzVxOHA3d29tZm90WWcreEtUZFoxNmNaNGxDazJYNFBKUnhz?=
 =?utf-8?B?UFdPZkxMWmJqOGpHZ3h0cE5IejVhcXBJKzJCQnpHbXliWFViWnZ3OGpaMFBp?=
 =?utf-8?B?am9kVjVJM29KZVJmcE1wQjQ3K3BTcCt4TUpPZ0FzVlJFd2hVWVBHZElWb3F6?=
 =?utf-8?B?ajBDbmN0SlNNZll2YzBraWw1SWQrV3ZwTlhLa3gxdXFDM2UyVHRJME1xajRS?=
 =?utf-8?B?RWdzTUpXemt2SXErZ01zczQvR04wVlVXMGZpVFBLRkRBTThEQXVzbFlpRnhl?=
 =?utf-8?B?ZnFoNS9oRWxIVzI0NmRKc2E2cVRNM0RhTnQyandpQk4zeUhWRitwcUZrVlVR?=
 =?utf-8?B?VHAzMEtCL1cwdS8zUytrbkNjUmRyRWs1dWJqVFd0QkhLVmdsc1UycjhKMVBJ?=
 =?utf-8?B?S25Wc25qYllrL29KMXU5eW40aHFnQktqTVF0MWl0UVkzcEVMRDNjYWlubitS?=
 =?utf-8?B?dHlmYnZnbjh6NDMrSzdQcjJiL0NSNjNWakdOdVlvTEk4cW1qV21ld3c2OFBm?=
 =?utf-8?B?RTFOeStNQ1lOTmpQRXI5OWZ2WWJOU0FrYzIvTlBwSFpKVUFjZnRoR3lmVmh4?=
 =?utf-8?B?cUV0RzVYaGNmRmNVM3lLVXgycU9uVE8zdEk3c3BxMFhjYWo1ZE9BSlQ5KzlR?=
 =?utf-8?B?U3lzb3hteW03UVN3R3pYL3hrNjdkWkdKbVpJT21kbkl4UlNEYVZ2UDA3Zmgv?=
 =?utf-8?B?dDNxbVNNOEQzSEMxWmc1c3FvZW5IdElOcUE1L2NoS2ZQSFRBSVFOVlY4MUgv?=
 =?utf-8?B?dklhTXJNY1paS3lEb012R2svaFdtT0s2MDF0eGtydnpOWjhkWGxURDNDbXBR?=
 =?utf-8?B?cHVIVnVCaGJQc1l2ZmtXUjl2ZjAvZUlmRlR6Rzl5TGdjWlZWd3RHVTVCUlN5?=
 =?utf-8?B?Y1JTUXRXLzU2R2hiR0dLWXRPSjNPR2I0SDFKbVJGbXlwMThxUHdPVFhSK2w4?=
 =?utf-8?B?MTNVT1lTeGEzK2Y1MnE4U3owWS9xdTJqTTZidTFnN05LMUlIWFc2Tmx1V0FK?=
 =?utf-8?B?S0QvWlc0SFNTbmZaTlQyRjZFc3BGa1kvakpkZ213NE55QTIzNHpTT05WTzBo?=
 =?utf-8?B?SlZmaVJXdHgxaEtpNFIxMjhKaGxiM2Q0WmhqNzBkZUtsZG1vcElzU25kV1Vq?=
 =?utf-8?B?MUhzNHpPNzdqR05CRFlGMG9qcCtPS1pBaS8ycTdnMzVjenlqZEt1QXZDRnhC?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bd5f97-8415-49be-26b8-08de1bc360fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:58:29.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hh70mfxD60k2Pej2SNuTbEKDz/AQJiaU+8LQwL+js/2U6n2QsWFCjDGZvd7YgGxm6ktzf8TkeSo9Wy5fZfo6z2ONxDz71yNPL/vX/MX+zm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6142

Sorry, forgot the for-4.21 in the subject.

~Andrew

On 04/11/2025 4:56 pm, Andrew Cooper wrote:
> The latest oxenstored from Xapi-project fails to start up:
>
>   launch-xenstore[1201]: Starting /usr/sbin/oxenstored...
>   launch-xenstore[1222]: Fatal error: exception
>     Dynlink.Error (Dynlink.Cannot_open_dll "Dynlink.Error (Dynlink.Cannot_open_dll
>     \"Failure(\\\"/usr/libexec/xen//ocaml/xsd_glue/xenctrl_plugin/domain_getinfo_v1.cmxs:
>     undefined symbol: xc_domain_getinfo_single\\\")\")")
>
> This is because domain_getinfo_v1.cmxs isn't dynamically linked correctly.
> Fill in the correct variable, and remove the xen prefix from xenctrl.
>
> Reported-by: Edwin Török <edwin.torok@citrix.com>
> Suggested-by: Edwin Török <edwin.torok@citrix.com>
> Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: Pau Ruiz Safont <pau.safont@vates.tech>
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> For 4.21.  Without this, we can't proceed with deprecate oxenstored.
>
> This wants backporting to 4.20 too.
>
> Previously this was hidden by oxenstored unexpectedly statically linking
> libxenctrl via the ocaml-evtchn bindings, and became exposed when the bindings
> were moved to use libxenevtchn.
> ---
>  tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
> index 4be1feacfe24..6356159020c1 100644
> --- a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
> +++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
> @@ -11,7 +11,7 @@ OBJS = domain_getinfo_v1
>  INTF = $(foreach obj, $(OBJS),$(obj).cmi)
>  LIBS = domain_getinfo_v1.cmxa domain_getinfo_v1.cmxs
>  
> -LIBS_xsd_glue = $(call xenlibs-ldflags-ldlibs,xenctrl)
> +LIBS_domain_getinfo_v1 = $(call xenlibs-ldflags-ldlibs,ctrl)
>  
>  all: $(INTF) $(LIBS) $(PROGRAMS)
>  
>
> base-commit: 9632ce6fe5b288244d2550cd2e619a55c5168bf8


