Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A5eDT77eWkE1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FBA0FA0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215582.1525754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4HG-0001QX-58; Wed, 28 Jan 2026 12:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215582.1525754; Wed, 28 Jan 2026 12:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4HG-0001Np-1U; Wed, 28 Jan 2026 12:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1215582;
 Wed, 28 Jan 2026 12:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl4HE-00011L-Md
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:04:04 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ec8a4de-fc41-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 13:04:01 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7357.namprd03.prod.outlook.com (2603:10b6:408:195::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 12:03:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 12:03:56 +0000
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
X-Inumbo-ID: 6ec8a4de-fc41-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuD1AF4zBk93psEIiAhYb8aleWD5vDeD3N8ZzPcim+g7OiZI7X8bal7VPWvmuztISHHVomdmw36adjSnYLiBqv735/3+cdGhUFGg15IAmuEr1UnZusYOIREc61oiGLaMtJyVU9V0w3kQybIXIMNFFXwFH6c8kSk3/ZCtIh0PTZ9A1osv/0VOQCPvBFExIym6U9xGrPrD8D6culBPrKIW8g+5cqfA11QwIijovc04gRJ5/Can4U2qlkwe3ZnosppQf675NTt+0lU+2pBGSHOSVsBfVGJ1vWGUHXxTTd6gIcdd2NrcsR/SifDv36ZACGAxPLtSkhkwMpZuWX/lM6fTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r2flN1GhCLglXiQh0ydKea2Gg7WUY65D/KjaJqBONQ=;
 b=AoTt6fq3c4L2Al5YvDqsMyffoRO0ngwlsE5RmTJmQQM3yXQqonwsJT9kxS37J7dPc5sKbAs1lhfYrhkh2P6w4rgmT/hUtt7370Jw0VAdrO9UN/h6IWZxcfjBzChdyvB3xNTlfkJLhud0P0mj+SsOoojKaSchQyGjkQnzgNH7HKM3MSKaUtndJmFg5EszddCqH+luWjICdOgOI5xuQxAupbmM21mceHS5mnaV5CqLp1yHnJ6nSlNsJ4zI6cNUpArh0dMKb3DgnuvwC2b2PMVzbXwEFi7FxbgcNsVfXkBbD5SWFPhLXqQCd1gNHMXInpElW2jyLnodYwukjuT4r6Ufqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6r2flN1GhCLglXiQh0ydKea2Gg7WUY65D/KjaJqBONQ=;
 b=Hv9zyjM46d1uk2yzLDbGPO1FCCmnrmDDNqV4NV1nMMx2tKhxWYYCYEdLRk1dhCnRr/oo7Z2QpHHM2wCFzKX5IDKT+EXC38j3wM30yF8zwKw+CDKdOzWywuO+zAaacewVo12AkX0VpoKNgnH1L94w3mbUOR8c2rGdUXKvAMHXFpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/3] xen/mm: limit non-scrubbed allocations to a specific order
Date: Wed, 28 Jan 2026 13:03:39 +0100
Message-ID: <20260128120339.47373-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128120339.47373-1-roger.pau@citrix.com>
References: <20260128120339.47373-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0046.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c02c47-8eef-4548-a08f-08de5e654f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHRzR2RySFZycWlLNWV6eVE2OTZLWEdUamFXL2NRazJ0aGMvT1JldVBYWExY?=
 =?utf-8?B?eDVKYWJxeERZakJFbTBsLys2azdEUWlPYW5NL0RJSWNUYXBUM2N6aDQ4cm9x?=
 =?utf-8?B?bmc3bGhqQy9leHBPK2xMY0g1bEdmOXZTNUZwVDQxQ3lpQ2NKa1NDSjZvSVd1?=
 =?utf-8?B?VDNPWWNvRE5FTmlGRm40aGUxamo2K1FuVnJsUmE0TjhOQzJWeTExelNJUEx3?=
 =?utf-8?B?MjMzU2pNYjlUK1IvSWdkbGwvajViMUtnc2xYYjVhNlZzTWd3QTk3cTNubVY3?=
 =?utf-8?B?b08vUTE2b0EybmpTekVNb1IzMUxzaDY3MHliaWlLMU1veGpqbjdoYUUzQ0N6?=
 =?utf-8?B?NGV6UjgxM2ZXR0ZkQWFhTURkTlRzZW85OUovbmdNZzc1cG1Ba3lpM1R2OUZu?=
 =?utf-8?B?STNUR1JNcFVQeHZuZG4xYzdIbXA0YzE2dkNqWktTNm1oT1hMQkhOdDVZVTNi?=
 =?utf-8?B?OFlMdFkrZi8zVVNTRjhKUXY0NE9OeFZOT3oyai9hdGFTMVNPSUpWMlZ6b04v?=
 =?utf-8?B?YmVLVVFUbDBnUkpKM1BnRXhqTHBXZWpKc3RZL25icExEMkN1WEVEUnI4T3R6?=
 =?utf-8?B?REhiQVpqZUg4U0RoZm5jK3Z5TDMyRlI0bkZ1ZVM5MUVQKzNCdTdRZEx1U0NL?=
 =?utf-8?B?R0dGWjgxR1BtWHRGMEp3Kzg2ZThrTEVreWhLSHNzMTIyN1ROYWpDc3Uwd1BP?=
 =?utf-8?B?NjlSUHcyR0NqSFV6a3VFbG1zRS93a3JIRStnYlJIdGJaS09oY09xUldMVkVC?=
 =?utf-8?B?ZlRGNnpXdHJWL01hZXBEb3JSNUtWZHhqeXhKdzBkSFJjS1Q2UEdwY0lYVitI?=
 =?utf-8?B?Sy9ZMzYzcUFGeGZGYnhHQlQyVDZ3V25hSFJkWW9XZ2E2MDYxNU9OTDdybUww?=
 =?utf-8?B?QXJINmdaaVUwbEkwalN3Z2JzMWs1ZWM1SVY4dGpFZktWU3BjODVwdlJzY251?=
 =?utf-8?B?UWM0TTlNem9pMFdaYkJOUnBxV1gxZzhhTmZwUCtNbk9zWm9YWTZacENyK0R6?=
 =?utf-8?B?R1o4cml2L2R2UXFrMTRpZFRKRU1OeUs5VEcvZ0t0QUVuZUJTTXo3VURmRjZX?=
 =?utf-8?B?dXpPemZwM2RWWWUxT1hXRTdvY3RrTUd1d1I2KzBQekZaVjFUQXM1d0NUOXp4?=
 =?utf-8?B?STlGejRMbDFjWEszWmlFbEUwdGJNYno0dlROWUQxZXN5a2NTdG52eEFiMmx4?=
 =?utf-8?B?TVVzeTk2bzRXNE93clpSanZVbUFKWHdScnhjWVBnWkd1QmVBclZpVFMzcXFi?=
 =?utf-8?B?MkZLMXl2bG95dmhvVHBjOVRIRzBQTWRDaFlQV1gwTGo2Y2JvMXczK3VBcFMy?=
 =?utf-8?B?UTJJUG5KQlRNdjg5TmhRN1lRdTVxZ2hxdlNZY1FYd0hVVHk1R05TZjZuNGVK?=
 =?utf-8?B?cUhQQzdvS08vQ0tjRkZQYlJtZUhUaUJGbEtjWlgwZTJibEhIVlZiRnhtMk1W?=
 =?utf-8?B?eGhpcnU3aXQvdDRaQkpaMUc4aGdqeHFOdlV4cThGZGRNYTNlTHU4UkVjaURr?=
 =?utf-8?B?YVpSdk8vdmU3dFlhNHpQcGRlVVdjZ0lQL3VGL0NlWkV1bGtSYWtuZkhEeld2?=
 =?utf-8?B?NXlVOU9ocnNGOWVMa0p4QklrNUFLUVAwSVRRYmd0RGQ5N2dNRHU1Z1l1ZzI2?=
 =?utf-8?B?ZHM4TGhvMGlBZDcwL3ROVWlaOVJORzZOcnhDMXhrYmtvd205a0owdDV1SDJo?=
 =?utf-8?B?NG9URkdNQ2MrK3JGVjFWVjlTdzNyNGxKQTU2Tk54ME9qU1hHVlRXUSsxZDZz?=
 =?utf-8?B?MkI1OUVXcWpMVU42L01jTXhib2plbnNqcG1lQ3k0WnJaQU1vQ1ltZklrV21v?=
 =?utf-8?B?cFNXUUk1VUYwMXpMK0J0Y0JtYkdjeFV2SXZaUUJoOFhxR3g0QVNGR256bC9r?=
 =?utf-8?B?SkRScjUzN2t1dmpQQTY5dEl2aVVpNXZzWDd4TitYdmdWRTBWeVc1U0RGaHRv?=
 =?utf-8?B?eUw5T0Eyb1ExZFl2Tmx2Um5OZ3hPTTZpVnFMVFFveWNNSG9DYnlBbkwyYnBt?=
 =?utf-8?B?ZTduVGVNT25JM2xES1pNQWovamxRbzcvWFFGTTFRRzIrek5RaWNZSjR2Z2M5?=
 =?utf-8?B?QU42LzRnMGR2aWVhWVNpSFVTeFFGWkcvdlpBYk5yMTk2c2VmLyt6Q2FFT0FY?=
 =?utf-8?Q?ExoY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FpQlBZU0lDRzg3OUVQbTRhR0pTckIvakw0MWYwc3lEdm5JSFdNcW1kZUZU?=
 =?utf-8?B?Z094UElhREtTbjdEUnNHcVh5QmRRT3p6OXRDYXBzU0s4WVoyZDNzWVFZU2pM?=
 =?utf-8?B?NyswanNEOHgrek9kS0dwWXlHbUpUWlRKQVRKZnF4MnRMRjVSa0FqNVdQTkFC?=
 =?utf-8?B?eVU1S0d0TzczVXJyQU1PNDVWa1Z5MFBwc1NvSXF0N2MzbjdZYUdwVTJEaHhE?=
 =?utf-8?B?WFpwRE5MejZXS09FN2dSZjFNV2F1SHZqRC9QVldHRUpKRmxBS3FFeVNhY1py?=
 =?utf-8?B?eGlJaVNDS2Z4cFdwcGExSExOUWtwQmNnZWRkSVBtY2cvZmhXbFMxcWdicTdJ?=
 =?utf-8?B?RkU0SFk2MWJ3Y0NBNVYvZUQzZGp2eEZVZnJ1bUNqajhiVGV2Q3B6aTZuaWgx?=
 =?utf-8?B?RkpUVXMreXR4Vkwyek9MTDJOelh6STlqb0R2RGVQajJ3NEtUZFZ4SXFIL1Rk?=
 =?utf-8?B?T3QwN2lTUUtPNFFTaS9lY2hYdGtPNXJkditJN3NYSkkzZDRuc2pMelJQM3hZ?=
 =?utf-8?B?YXpxak51ZHRnTmJiQXZnekFkakhCYU01YjlzSlZadFZoNlEveVZOZUV1WGg5?=
 =?utf-8?B?Q2NBOU4vVnpQRWtZZE44ZkJxR1Z5bkpJd0NGUzFMQU9Oa3U0Yy9raFJtY2l1?=
 =?utf-8?B?aEhpcVZCUWwwb0FjRGJsVm5HRFB5TUowYi8wVStUNlJaRlhYb1duVng3QkxP?=
 =?utf-8?B?YWVDMjJsYWZZUFVkeEpVTk9YQi9DeFVZNm1XZUdRQjBERE1CQ1l0VzBUS2N5?=
 =?utf-8?B?YzJFbFJoY1NybzRDMVh6Tm1Pb3BuWUxQb2R2NXJqMjMzSmZvaEZtMzI2MnNM?=
 =?utf-8?B?cTQ1aHdQWmxoVUcrNmszTWMzejl0SG45SkFQSlpuK003T2hXTFROZ256VzlY?=
 =?utf-8?B?U3dlYmZWZzBpc0MySnBNRU0xdU1xdmt1Kzg5YlR5bU9DaFVpUml4RUFGL3B3?=
 =?utf-8?B?ZkJkZEYvOWNiUEtkMmFGZEU3aWx0Rkt3bWdaNjEyWk9Na2twNDhROUZ0Vkwz?=
 =?utf-8?B?RmtsaERuUHgvSE05cDdoREExTTVBK0d2WHkweVRHWmVRMWtwT1k4YlZOVEcv?=
 =?utf-8?B?dE1xTnl3Uy9BV0FrMFBLUExrTEhnbmJiOXJic3B2ZWRHU0hESFFZbmEwSko0?=
 =?utf-8?B?UDJDUTl1cU5sZ0gzdVdrZTY1KzVocGhQdEg3WWRNZ3VxZVA1VHplaXVVMUdL?=
 =?utf-8?B?UFRFN0xZM3BpalppbXFKM3FRKzhXNk4yYnN2S014MDdObjZ0K3dSTU9YRzRX?=
 =?utf-8?B?bHJZckxQSVVEY1YzM1FSSW1VZVVkaElWeDhqZ0dzOUE1VGMxSlJiSllZaHN6?=
 =?utf-8?B?ai9BcmdzZ2NoYS9MVmtKNUNBYmZIZjQvSVRBUjNDUkY3VjNlazdWc2t0SzdC?=
 =?utf-8?B?bGNhT2s4MDhjUGhTbDBHdVhDUi9GRVpGcExEZ1UyMEZHSW04Q2N1VFZTYjkv?=
 =?utf-8?B?dUdQRi9FSVBtWUZwWk5lUUtLMy9VUFRic2JmV3FGZHZpTms3YnFLZ2pRRHZk?=
 =?utf-8?B?WWFFakoxN2ExeDVucEtISW9PKzJPZ3E0elV4WU92bXVlTWliQ2NyYzNtSkJj?=
 =?utf-8?B?L2w3TE9DV29acHg4Z0pkakQ4dElvdXRTYldreEE0c0FES3JRS2cxRVZjd3pw?=
 =?utf-8?B?cmhnNURpRmQ2M2p1ZGUrMHQraVBlbHNEL3ZaUzcvKzljU3NReThvc2dyTFFt?=
 =?utf-8?B?MWtaZ2UyWjZBdUlqUmFCQWhCS3dqMzVXWFU0OVpuWkw1VHNFU2RVa3BuMUJ3?=
 =?utf-8?B?d20xWjQ1d1hER3phd010MVArcm9SRHJxZm93UnRrNnZjODNpR2FUUG9IUVEx?=
 =?utf-8?B?K0xtcWVNWHJuNmQ4a29udUpYM0xRY3h4b1dwRFBtbzlmekpBbldSK3ZwOE5w?=
 =?utf-8?B?L0ZyRng0dXY5dWZSUXQxektUc3YvcmxpaUtCMUpZNHh4U2huQnUxS0JYbHlu?=
 =?utf-8?B?OTJ3NGxBR2phZEdQelFnYzRjbFJnZmkwWUJDaVVNYzFDanNsUUJWSnludkJG?=
 =?utf-8?B?TXJxYTZPSDI4NSsxYUxVSG9tZnFuL2Z6QmVOM3R4bndxMUUzSnArQWxPWnI2?=
 =?utf-8?B?N0NqOFRqTWJMaDQzT2RwcUNHb1NzejVkZUlZOWRxY3lQRmVtc0JveUgzNDNN?=
 =?utf-8?B?UGI5Q0pCSGwxa2lBSytRRFNieHZrUEpVK3VzR25lSlFxRTYyZEVLWHdnTHFO?=
 =?utf-8?B?YXc1Y0NKdUxnbnJ1bENPVHpBN3kxVGVlb0g4cXBnYnpvUDZ5cUw3bjVxWndQ?=
 =?utf-8?B?QURQbHk4YUhXYlhMaG5jK3hZRjVleFFYWjdTTkI4L0dEU3hvVWQwc2Vzd1dG?=
 =?utf-8?B?a3Z0d1lOWEI2WjBEWDZTVzJMb2tnV281YTI4NlR0UFE3Q01jRTRBdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c02c47-8eef-4548-a08f-08de5e654f61
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:03:55.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGkWu6HVxiVgg6TDUSGmLhFcJRxOkWQGdrOCLayF5nebZB+VILLilV461fV9LSXJmBPi+mN10XnJMVCSeuJE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7357
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B41FBA0FA0
X-Rspamd-Action: no action

The current logic allows for up to 1G pages to be scrubbed in place, which
can cause the watchdog to trigger in practice.  Reduce the limit for
in-place scrubbed allocations to a newly introduced define:
CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_PTDOM_MAX_ORDER
on all architectures.  Also introduce a command line option to set the
value.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Note the order limitation is only post-boot.

Changes since v2:
 - Move placement of the max-order-dirty option help.
 - Add note in memop-max-order about interactions.
 - Use CONFIG_PTDOM_MAX_ORDER as the default.

Changes since v1:
 - Split from previous patch.
 - Introduce a command line option to set the limit.
---
 docs/misc/xen-command-line.pandoc | 13 +++++++++++++
 xen/common/memory.c               |  3 ---
 xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
 xen/include/xen/mm.h              |  4 ++++
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 15f7a315a4b5..3577e491e379 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1837,6 +1837,16 @@ presented as the number of bits needed to encode it. This must be at least
 one pending bit to be allocated.
 Defaults to 20 bits (to cover at most 1048576 interrupts).
 
+### max-order-dirty
+> `= <integer>`
+
+Specify the maximum allocation order allowed when scrubbing allocated pages
+in-place.  The allocation is non-preemptive, and hence the value must be keep
+low enough to avoid hogging the CPU for too long.
+
+Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_PTDOM_MAX_ORDER`.
+Note those are internal per-architecture defines not available from Kconfig.
+
 ### mce (x86)
 > `= <boolean>`
 
@@ -1878,6 +1888,9 @@ requests issued by the various kinds of domains (in this order:
 ordinary DomU, control domain, hardware domain, and - when supported
 by the platform - DomU with pass-through device assigned).
 
+Note orders here can be further limited by the value in `max-order-dirty` for
+allocations requesting pages to be scrubbed in-place.
+
 ### mmcfg (x86)
 > `= <boolean>[,amd-fam10]`
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1c48e99a6ab2..a840bab87b34 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -56,9 +56,6 @@ struct memop_args {
 #ifndef CONFIG_CTLDOM_MAX_ORDER
 #define CONFIG_CTLDOM_MAX_ORDER CONFIG_PAGEALLOC_MAX_ORDER
 #endif
-#ifndef CONFIG_PTDOM_MAX_ORDER
-#define CONFIG_PTDOM_MAX_ORDER CONFIG_HWDOM_MAX_ORDER
-#endif
 
 static unsigned int __read_mostly domu_max_order = CONFIG_DOMU_MAX_ORDER;
 static unsigned int __read_mostly ctldom_max_order = CONFIG_CTLDOM_MAX_ORDER;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index c9e82fd7ab62..fd6cf92daf51 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -267,6 +267,13 @@ static PAGE_LIST_HEAD(page_offlined_list);
 /* Broken page list, protected by heap_lock. */
 static PAGE_LIST_HEAD(page_broken_list);
 
+/* Maximum order allowed for post-boot allocations with MEMF_no_scrub. */
+#ifndef CONFIG_DIRTY_MAX_ORDER
+# define CONFIG_DIRTY_MAX_ORDER CONFIG_PTDOM_MAX_ORDER
+#endif
+static unsigned int __ro_after_init dirty_max_order = CONFIG_DIRTY_MAX_ORDER;
+integer_param("max-order-dirty", dirty_max_order);
+
 /*************************
  * BOOT-TIME ALLOCATOR
  */
@@ -1008,7 +1015,13 @@ static struct page_info *alloc_heap_pages(
 
     pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
     /* Try getting a dirty buddy if we couldn't get a clean one. */
-    if ( !pg && !(memflags & MEMF_no_scrub) )
+    if ( !pg && !(memflags & MEMF_no_scrub) &&
+         /*
+          * Allow any order unscrubbed allocations during boot time, we
+          * compensate by processing softirqs in the scrubbing loop below once
+          * irqs are enabled.
+          */
+         (order <= dirty_max_order || system_state < SYS_STATE_active) )
         pg = get_free_buddy(zone_lo, zone_hi, order,
                             memflags | MEMF_no_scrub, d);
     if ( !pg )
@@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
                     scrub_one_page(&pg[i], cold);
 
                 dirty_cnt++;
+
+                /*
+                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
+                 * interrupts are disabled.
+                 */
+                if ( system_state == SYS_STATE_smp_boot &&
+                     !(dirty_cnt & 0xff) )
+                    process_pending_softirqs();
             }
             else
                 check_one_page(&pg[i]);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d80bfba6d393..cf3796d4286d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -232,6 +232,10 @@ struct npfec {
 #else
 #define MAX_ORDER 20 /* 2^20 contiguous pages */
 #endif
+#ifndef CONFIG_PTDOM_MAX_ORDER
+# define CONFIG_PTDOM_MAX_ORDER CONFIG_HWDOM_MAX_ORDER
+#endif
+
 mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Private domain structs for DOMID_XEN, DOMID_IO, etc. */
-- 
2.51.0


