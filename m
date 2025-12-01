Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DDC98946
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 18:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175938.1500531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ7xk-0001zT-9s; Mon, 01 Dec 2025 17:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175938.1500531; Mon, 01 Dec 2025 17:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ7xk-0001xU-6s; Mon, 01 Dec 2025 17:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1175938;
 Mon, 01 Dec 2025 17:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9V=6H=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQ7xi-0001xO-Ju
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 17:45:22 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9256f2-cedd-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 18:45:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4978.namprd03.prod.outlook.com (2603:10b6:408:78::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:45:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:45:13 +0000
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
X-Inumbo-ID: 7e9256f2-cedd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgIRA5sTmwN8e8vEz/PlgoBDY/3pvUhEHdBOikfrblp+PBB8q2M12SUeRCkOwKmhEc76MRYjwuburo1EeDdmQSzmwqASFplINt+5I6vx97Bfea0GLk4U8r8SE9vN/StLBNjnGvDx+1tkHtQgd9WYiwuX7bFe15XXNkz2FzpxOUP8wf8tG0vEC6eE8LmG4azXP85Fa402rEumLvpmHh3k9A2hZrM+BTrwdWzB8hAAwSmQGIx4OSQ9jair8QDZ+5eHTqjjvd8AwtUGkKfluHfZzAUdde2ge7RDe9vpGLMt+3GqLEgqcdsf5Ui8ifQ7ETigFZBSY90nAtf3Xc8+iGvPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqNmJ7YR6hEJP1RbETLwR0r9mKoImCRlDZDzPhR/11c=;
 b=di6fLZV0i2CH7cq5vwBOlpvCyN+95SVcDP4tujgbtLzE8tPx6iB0uUXJyagdPdBPF3wwW6/Csxo/uTJMS6zWbUKaJnLktel+pSNey8LCTDzI9KQyPuh7l3aOkx1ng53KYk3aN6l6YIPrzD3H+fM1az9kkWB4hKpssLoA/7h99yjfCO/CLsCpzWksl/Ych+/5uBUnPbH/udsGq4Zryqi6FtncU3bYzXmbjlt0Sre59T85fhMvOG9lInd47WzEkY4o3ezYSoc/9g03SwN9ecl+S5e2P7HXYyOpem8AvjrTifd3YCH3qNVdRGDpYl7D8+1zB/NI2skw5n4+UyQk8fmg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqNmJ7YR6hEJP1RbETLwR0r9mKoImCRlDZDzPhR/11c=;
 b=aSKXMJn1WX7ASH5DDM1++2z4Y2uB0NfUmxfi6YsKvH39vkTOZ85obV8i2AjTKZj6ZKh9obPbg3SnMCA47ZyG5DzfWO0OjnY+zsuCVrrb9gNr8l+QE4mPfck5Mnhi8KXCUq4BZVirZEX3AV7xNmeYHeUFeFcjhlVpkSyxxsPVvls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <12d2c454-7744-4b13-9156-48b284900c8c@citrix.com>
Date: Mon, 1 Dec 2025 17:45:09 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] viridian: Fix bank count counting
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <5e38608b45ad25e6582163700edd3f232b6d2325.1764606368.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5e38608b45ad25e6582163700edd3f232b6d2325.1764606368.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 530d9a23-2a0d-4930-7c3d-08de31016110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTdBU21KYmxvaGZtZ2NBYjhNeU96Y2pBWTgyUXByTzViR0phTEluZE5mc3Zx?=
 =?utf-8?B?SkhFM3U3dnBQNWk1MXNNdlFwamxrVENPb1g1MDNsOFRuRklGU3YwNVFEOWVQ?=
 =?utf-8?B?L1RsZUdjUG9hRnVBZmE5SkRhZldrVUdaZWNDWnBMYVNDUU43Mk95MnJ1d0NC?=
 =?utf-8?B?QkMydENSUU14alQvVWFPalkwQTdpZzJrWnozTC9qamNYRUpUVEJOZXBIVGx4?=
 =?utf-8?B?VlZHR0NPZWhzTUpZS2xaTDVKRGZxM29adUR5d0FkMDhGbnZ2bGdlMElnWm53?=
 =?utf-8?B?dWlldHJZTUI5QW4wbkpxV3BSZ3ZoRnBZRlY5bE9uQ3krWkxrRjd1VXp1a3FO?=
 =?utf-8?B?Q2k5RVFoanF1ekh4eXhrcFNONWpyNzU3MGdZMzhRS1JHT2h4Wlh2VlFQZlg1?=
 =?utf-8?B?M05XQXR0NWtJOFo3VUQvMWNCZ1dhVGs0cDZjUFFOMDVjRGhCcUQvUVlEYUJ5?=
 =?utf-8?B?NXJNLzJHVUxocnhnU3U1UnFIRGlOTnRrVzlBSExGK2tFbjMzSmMzREFHNDJ1?=
 =?utf-8?B?eHBJVjVkTXd1VjFMQnRhV0h3UGZrVXJ0RXlwMkVUZThlc2w1SEVLUVpFdWE3?=
 =?utf-8?B?Y0NpQ2NCajhtbmU2ZHJxV3pSdlExN25JUlV1eGZUUFFoS09pZzJPZXdLSmJu?=
 =?utf-8?B?anhhZkwvQ2ZjWWZMUThoTVhFL1lKc1o4WmZsRlZaZitDMkkxbGdZc1YyVmJT?=
 =?utf-8?B?UFhYamgxRTExbnNBdG9JQnljRHFzU0Faa1hUejR0NkEybDkrYmxORzVLNWpR?=
 =?utf-8?B?WlR6OHZ3b2x1ZlJMRVk1V1V1QTB5enBUbUpLdmpvTEtTVjNYbzZBT0hHSGdP?=
 =?utf-8?B?bk1sVnRQWHg1NDgzcHVLZEdmSnhhU0tOd2czR0htdzRZRnNQY0c3Wml0YW5I?=
 =?utf-8?B?bVdqcnZzWUd3d3E4aVZoTklud01TOGNhRmRnUkZIc0NKaktkdlFydHY5aVpZ?=
 =?utf-8?B?dmp1ODFiUzJQSEs5Zkh0N25ZSnBYZUFXT2cxV1lZSm1uaEFjN0ZEaktIcHll?=
 =?utf-8?B?dk9wMSszbnBDYmVwQjk4SkQ1aDZySFUwTXJFTnFYbU9tREg3cjE3WkhyZ0Zh?=
 =?utf-8?B?WVBnUXAyZDhUVHhRVVovanVJVklBME96RWNHZXRSUDV2YlZQTitnN1M4bzZj?=
 =?utf-8?B?TnRKZyttZHBROFJTaVpLalJNV1hMSzI5OWpvVkI4ZXNkRGozNFdlQSt5OFJT?=
 =?utf-8?B?VXltK0x4cVlJS1hpTTFrSk9Pd2VhdDV3WFR3MFZDekE2S2FyZkNJVFdPM1N5?=
 =?utf-8?B?UjBiOHcxYU01Z09jOFZBdU05Nm5mS1FLOFRsV2t1VGdhQXduMXA4VmxURGRB?=
 =?utf-8?B?Y0c3UUVOTFZES2ZVK3o1TXZ3aS9IY2lrS0dtUFpjbGpFVmFGQko0S2tqSUNP?=
 =?utf-8?B?NWliR0dZSWRIZzdWWWpURml4NFh2eG9DUExtODNpRjN1ejNUVnF5RGZQMTVO?=
 =?utf-8?B?Mm95cW9FNjZMTzJvMXN6bTdZNWZiOEs4MmJlNlBJSEFZVjltWFIzdjZjV0Jj?=
 =?utf-8?B?bzhRV1FwNG84dHZwd3ZiR2ttZ3JiRFB4bDVVN2lKOS9pSDlTaytyNVFndFNX?=
 =?utf-8?B?YVZGYzhrd3Z2NVdwOGRZSENlTXFheVk4cGJiTy9GdENIbnByVFluRHcvZHFj?=
 =?utf-8?B?SGpaaXd0blJPc0dSa04zTE9hNk4zazJMN2J0NE5MZWV4UWErNzl0WGJkcWp6?=
 =?utf-8?B?K3A4ajBhQlhXVVcxdElrQTY3NW5weXRUY2FZb1RyVlRGbUxGeFAyR1crd0tN?=
 =?utf-8?B?elpUZnJxL3E3ZFBKdHdwdUgrbGpsM2lBOU0wUjdWZjA2RWRPb3J2eGMzc1VV?=
 =?utf-8?B?OHpFR2lyQ29ubVI2Yi84ZERBZU9ibEdYY1YrbWdjdHMyZ2JaQUNjb2FIeDZh?=
 =?utf-8?B?OVU3L1lQN2Q5L2dNUDJINzdjZFFhRHF5SDAzV1dxVEZaSHFxNjFYbDFvaUlU?=
 =?utf-8?B?STlscmhDaXgwdGJ1T3h1WlNvMmIydkZxY1cyZUxxWUpFZE5sclN3cEt2Slh0?=
 =?utf-8?B?d3lya2podE5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNxczQwcUl1V3VXVENnNjlVbis0YndEa29VOXovZTBhVGJLb1BTQmphd29V?=
 =?utf-8?B?T0E5ejFYOXBiTVkvd2I2UjhJQ0Qva0E3UHpBeS9xQ0w0dmZWTVVDYXZ4V3Nu?=
 =?utf-8?B?Mnd2TWlMSlROeEYvbVpHdnBIaENjZUUrL3RnaGVYcllQMnZOZm1mZjVWTkdx?=
 =?utf-8?B?dmVzNTRlNlFBRTZydVhBZlNma1lqdXYwVzNtYURzVnBYbGw1Qm9yeEFTOThl?=
 =?utf-8?B?MXk0bFVUZkxQVk9JOXNXUFFsZjRoNUdyOG9LY0MxeGJRd0JWZVJacnFJeHVX?=
 =?utf-8?B?clRlMHIvUW4zcWMwWFVaS0RxeDVJKzdxTTFRbi9Vb3JPWmZ5ZllQdXN4OXVz?=
 =?utf-8?B?bnJBRkt6dE5xV01JY0RCVzdxeSs4Q21JQnRZdlFSM2RLU1paT3ZzaExjR0kw?=
 =?utf-8?B?MFVmK2xBZEdmVjRNZWRwYm13UFhJZUp0akJ5em4vd3krb3EyT2VhOTRtN2M2?=
 =?utf-8?B?cUg0dG9JTmMxbkZrWGZEMjlKSmhydjF6OUkrK0RvZkVoN2M5Y2s2NHZiTEs4?=
 =?utf-8?B?TmszUU5GU2xGNm5ybkxZbHRuZjIxNlhLa2lxaUNNYXkrSWlkVnJOV0JNcVY5?=
 =?utf-8?B?cmpsd2pHWUZXckUyTjJjTHEvLzA1c3Jkb25SNkNZZHdwcnBQcm5qM1JWSXcr?=
 =?utf-8?B?VUp6RUFCRzBFbjFySVU5a2hQSVAyMDNBbzJmVVhyTS9MdURKVE45WWNGbHJ6?=
 =?utf-8?B?VFgrVytNNUw1VmQrMFArTmxTd0x6ZXo5NjExRHhqLytSOTdZMUUzdDdoenVl?=
 =?utf-8?B?dEhOWnNUQWV4UURSVjduNi9peFpxdzM0aTByZytxbi80b2ZHQWJEUkxHM3Z4?=
 =?utf-8?B?bSt5TFovNW91TUhDSzFhbTk0RDRhVE1XNUNhYmpTZ3FoV2dkMWsyOEpDTFoy?=
 =?utf-8?B?ZWc5cWxPUzEwTExmWC9ScE1saFJSSFZjL0pUMEgyNkpzN0M4Vk4xcWZFZ1lW?=
 =?utf-8?B?dmJ3VzU1WnZRUDVOSVhCMUdlT2xpMEdGMkNhOGxHY3N3QmlVOUFpNWJmcTVq?=
 =?utf-8?B?ZFprRXpOMnBSZ1RpZkUvRzNHMmo1V3g4RnpEOUZJaWhkQVVTblFlb0JneXdl?=
 =?utf-8?B?azFvY1Vidy9hbXpRQkIrOXhrSkNqZS9VZXdJTkJJMUhEQllGMmRHTU9vNmZP?=
 =?utf-8?B?NTVxajdsVDcvb0gzcUtRMEtXTEdFKzR4c3c3blFudVE3Q0kwT3VsbHhvWWtS?=
 =?utf-8?B?K3llTEpNNzQ2QWhVSkx0R0VMTjVlWXZSS05EWFFVbnpsQUtyNEVtd3VJT3Ns?=
 =?utf-8?B?OVlrb3M4cFl6ckZ5bzQ0amlmY2tOSVRtZll1Q2REM2FjNHAxRTRzOU9OeTN4?=
 =?utf-8?B?b0ZLT0JJT1MxT0VOOVBaQWJUZmV3d2o2Q0gvNGNUUThiYVc0b2VBNUtuQlp3?=
 =?utf-8?B?blkwL3kwcnZKY29IMXVJcjdCZ0JqbTl2TTBGOTdzZmhmbGtydDd1cFhwd1Ju?=
 =?utf-8?B?L2E3TWsrazJLUHBSek1BQm9pWE04eVJyWmNXSWtFR1FZdW1Xb1N4U0hkREw4?=
 =?utf-8?B?WC9vNDMvVUZ3VE1XaFRQLzljcUdhcUdGUVB2ZmExUjdlSnZkOWxhQTk3d3Rw?=
 =?utf-8?B?QXpIb2ZXSW1OSjZaK2R6WmFwamVWSjMvK2pEZ0wzd2E0dFppUjltK2lneVB2?=
 =?utf-8?B?R1ZGUVFqTWZNalo5N3JDMy9QSVA2Nk4weXhOYmlGQUU1NkN0NlFXNUo3aG9K?=
 =?utf-8?B?U3c5a0tJN3U4MFVyeVB5L0hLQWduTVpSYVYxclh3MTFjemtZM1NzUE9semJp?=
 =?utf-8?B?N1Z2ZDUrY2s3RGJtdENrMmpxcmRFaW5QdWxKd1hOSWRETDdwTDFKSHc0RUZo?=
 =?utf-8?B?V3UwbnhwK3ZWKzZFMk5iMmhlQnloZC9ocEorbzJ1bzBEN0VRSHpNalRIY2pT?=
 =?utf-8?B?aFJ2Qm5NTDlQaVlzNmErR1QxV0QxMlhSa0lqaGU5VWNGanozemcyNm9neVQr?=
 =?utf-8?B?UjJMVm9FMUZYSWsrbjRSeml4dzdqSnJ5ak0wYTUvb2NjV0s1K055czQ2SVcw?=
 =?utf-8?B?bGFCU3AwWUtuTEttWm81ZnB2NVdBeFVQRkpVQ1VLY2RvRFYvcFNiZUl2Q05u?=
 =?utf-8?B?TjVCYXhHK1Y4dHcxZWhEOW9Tc25Fakh4UnZ4OVpmUzRoZHR4aXM1QkFHUnlv?=
 =?utf-8?B?eHpZVVZpRGUySllVVmVJZllDOVhoRjBhdloyTC9sWUNpZk13NloxRUc3VVcr?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530d9a23-2a0d-4930-7c3d-08de31016110
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:45:12.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qN7mfioaV8CP13PshowDiV+35BvdvNUHi8SQE7Op03g4wn5sVFj59DWRcR+vlDXzoLLLFyZVyF9/OqKYe+ZrjFm5gQdGWwCja8jNbkmZsQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4978

On 01/12/2025 4:29 pm, Teddy Astie wrote:
> hv_vpset_nr_banks() incorrectly counts the number of bank by using hweight64()
> instead of flsl(). This for instance problematic in case only the second bank
> is selected (i.e >64 vCPUs, where here hweight64 gives 1), causing only the first
> bank to be checked (non-valid) and the second (meaningful) one to be skipped.
>
> Fixes: b4124682db6e ("viridian: add ExProcessorMasks variants of the flush hypercalls")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/hvm/viridian/viridian.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index 90e749ceb5..f5e526241d 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -601,7 +601,7 @@ static DEFINE_PER_CPU(union hypercall_vpset, hypercall_vpset);
>  
>  static unsigned int hv_vpset_nr_banks(struct hv_vpset *vpset)
>  {
> -    return hweight64(vpset->valid_bank_mask);
> +    return fls64(vpset->valid_bank_mask);
>  }
>  
>  static int hv_vpset_to_vpmask(const struct hv_vpset *in, paddr_t bank_gpa,

https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/datatypes/hv_vp_set#processor-set-example

This example is poor (it has several errors in the text), but the final
statement says fairly clearly that the banks are tightly packed and not
contiguous.

Therefore, hweight64() the correct calculation, and AFAICT, the single
use of this helper in Xen correct.

~Andrew

