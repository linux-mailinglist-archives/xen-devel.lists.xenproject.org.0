Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD60C58665
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 16:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161791.1489645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZJY-0000cY-09; Thu, 13 Nov 2025 15:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161791.1489645; Thu, 13 Nov 2025 15:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZJX-0000b4-Th; Thu, 13 Nov 2025 15:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1161791;
 Thu, 13 Nov 2025 15:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJZJW-0000ay-Id
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 15:32:46 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdf5a6c9-c0a5-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 16:32:41 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB9842.eurprd03.prod.outlook.com (2603:10a6:20b:619::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 15:32:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 15:32:38 +0000
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
X-Inumbo-ID: fdf5a6c9-c0a5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbsnjHfvJfxqCVCSwyL5zc/zGeP6jVa/2NzDKv99Q9umjJNgJU3rlzyh2inNhV8pMIfD+oPR+A6mJet3FFtQ6CQvUp/OSBrfz0B+8k/ljo9ylIdfM7IMG3F+3bo616hVvdV76+ziOHW0G3rY5le0D7CGUQI/knVSjRHl1YyX7ZIDslICpcKa+xURHmNQQIfvp3QX++oFtXwccXzUoWAcdmdSvDuvHJ2ADkDGfRZkZoLIMzNOJ1qG68AsvhZLw45zO+Lihydrgb2tVOw42U3nq3GFxq7ns76Q+JcmeVyfF45pwDoJ5GaMLXWfM2PQKVYGeXLn1hMp4X1EU04Zitg5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRT7Dn82zGHKLSXGS73GmyFra5EIgEKMZyOWtitM7Yc=;
 b=rr3f1fQh104B70YdcVjsBEubVp4ikXs3M/KiOe+N1Cs/ILD1SrrwOdU5mWt5WMf/zKoGTEgRE+15LchLfIYsdjfeXkU7uIX0qloUAkdu9IxrKlH98hGM0kbTR/VJ8KtXYpkGHRSAgad6pMUz8+SdFsbb+npj9fUVX1NsswtQ1JGUK71CZNapAmIDIWvssA0qU5YU7GG0lj/e4XIYOOetjVWUMqJu8EC/n+95wXu+Vi55LHrxwzgClrRPrdpc/IP8UDnRr7g2rM9vZF9iWuIYPt2kIBIgCremYgIQK0ROEUvvJkP6SvuQdt9w2q8NSRdO7/n4s1DsoNoerhWQ3kn8mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRT7Dn82zGHKLSXGS73GmyFra5EIgEKMZyOWtitM7Yc=;
 b=WoB/Zmq+992Bo8TbYKjPbO81pWYEwXTT5dnRiTi22SZNgDBMkSAj1lEE7fYg24kyLnRoiHM0Nf+VtFaFWbk9LfAgGTeiO5ZMbshvZL4JBGwAVKe93+cOAPjge2nlpKSDz+IZRGNTzT6iM1gGpiaS1Jm7mpjwH3alYpkSEBKhtQy2pn3+rd21AJhWNDbKjHqKXdVzDOUK+vAJVm5VDOAzfo4YYntxB8kTId6iqqfVPptywjshDNqVSJX/nIdLtCPvFZGDcpNknr/0rsAhX7FLLcC0I6T+A39+EyGPpnpENsPhZryQXeZSCcrhl30oqA8vGSg0BrMMvgRdg19FxIkHLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
Date: Thu, 13 Nov 2025 17:32:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
 <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
 <8aa7ddeb-fb2b-42ac-bba6-272b91fc1e8f@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <8aa7ddeb-fb2b-42ac-bba6-272b91fc1e8f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB9842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c13c841-72f8-4791-5316-08de22c9e09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEpCUlBMaytrQzlocDZ4U0t3cTNKNEFLUjYrMnlJSW9hYXZLeVc3aTNSaHJQ?=
 =?utf-8?B?TnZZV3ZKeGlpbDViQXVWb1RCZmpYaHN2bTdTYUh5YmdnOTdIVEhmMVhJWTJm?=
 =?utf-8?B?bE8wb1pWdTB1Z3hVQXd6OWs1cTBRYkE4Y25FdS9oMDczbFNVUWNvUW1hNHBN?=
 =?utf-8?B?bjFGbnA5cDBiV2xxREhVVURPNmxMYTgvNmdwOUJxVm9ySjhTaHl2MXhETDBB?=
 =?utf-8?B?RnhoWDUrYjBqOEU5UitKa1hxbldqZnByT1drbXNLM1BQYXRBWms3Znd4RlRM?=
 =?utf-8?B?aG5zUUV3Ynozb1lldXdkWmEyd3o1ZEZUOTI1eHVLYVRhVUY4THJnbThQblYv?=
 =?utf-8?B?T3kzaUU3elNEZEgzRXRwdHhMTDBWZFFhNnR2NlFVN1Fyd21VWXgwQnJtMU5K?=
 =?utf-8?B?Q1hnaEdhNys3eno3cUFvQXIzSnI0WTlRWlhnM3BoVzJQRmowNnVoL2tIanhM?=
 =?utf-8?B?RXZVckpYZWtZVGZDUzU1YkFGSTZCaktzM1UySEozYi8rcE9ERGpPZFpzRGFY?=
 =?utf-8?B?Sk9KdmYvV29yR2VtbENrUmFsK3BSY3BvdDJ5ZUttS1FmY3hMZlJxL3NGcVF1?=
 =?utf-8?B?MXdHZGo0N3VMUjZ5TVZnbFRZUUZlNXNGQXd3UVlwWXVXd1Q4dndVMVAwdEdo?=
 =?utf-8?B?Y0NFTjVGUmF4RFlXRkhKOXVLL0I1K2NiL3dEdlNpb2JyMmFVVHg2b2Evd1BX?=
 =?utf-8?B?WG1UbmdKMnRldFovTkF4aURuZFIxR3dFWk9yU25QSFh4eUFyN0hRM21jUzcz?=
 =?utf-8?B?aEYyTlcvQ0pNOW5iYStvQkxiQkR1TUJYQ1hPV2JlNzgwOEhOWnN5MWhsRWhM?=
 =?utf-8?B?TTdhUVhXSk5ldGpCUEt4ZFUybmY4TTVOQ2JEV2ZWZkJkSks3YmU5NzVZZE1x?=
 =?utf-8?B?SEpXT1RJRmxUbnlrZ0dwaEhiQXdTWWxzdDAvYncwMXZUVTlYU0hwQ1FPay95?=
 =?utf-8?B?YUtqOW9SWDczOEpKL3ZzSUpQTHI3ZDRIV29XcDBpaDBVL0ZKVnh0bUFiS0ZR?=
 =?utf-8?B?QW52K0szb0ZjZjV3VFMxblM5dVNsakdEQWJyRkU1M3kydm0vby9Nek1yUW1J?=
 =?utf-8?B?MVEvemZnSEFmL1NBZWxUSUYzYUttcXBoVVNOc25wdks4SkhuSVM2NmxnbHJ2?=
 =?utf-8?B?SW9zd1RWOFZsQ0RqM1JEVXhaZnduMVVudDJYSjcxVjhQM3ZDOW1XUTdHZTJJ?=
 =?utf-8?B?RnpMa3FyZ01nOVY1UU1CS1ZQK3JlbEFDOGJqaitaOVdXYys5ZTJsMW42aXEy?=
 =?utf-8?B?aFQ2WTN1aGtSclFIeFd0SVVacUtBcEgvbnRwL2Fic1pDUGluRkpNOEM1ZjM2?=
 =?utf-8?B?c0EzRXhuNlcwdmYzNzl3SnpXcnlDTjYyQk1OU0VxTVNNZ3hPekdaUW1KWWZR?=
 =?utf-8?B?ZFczUnVPTkJsdjFCaDhRVUM5TmVMcUVFT0RzUmZQOEJCK3gwV0RReHlRTGtS?=
 =?utf-8?B?eUJSZG9JcFlSVGpMQlhsa1Y3VzgzamVSNWpJVUdnTng2L2p2bGNrVmE5WmE0?=
 =?utf-8?B?RG5Na1Vndk0rK3hJVTBFN3JwSUZpNkltNjdHd1ZXaTl4M0ozWkRSeFNLWVBO?=
 =?utf-8?B?UlVCTzlpenRMZnNwbzBsVHBsZEQ4TzN5Y0dnTCtPWElycW8zbFJaVm1MZXQ1?=
 =?utf-8?B?QkVmL2VoODVpeGJZWm5WYzRQVmlWL0VwU3BWeDhCV3lEL0h0UzdhTHRIdHFm?=
 =?utf-8?B?T3FCWUNZK1lxaGlvemtpNForemFMMk5kb3llZFBod2FSaGRHR3ZIQUxwdFh5?=
 =?utf-8?B?RWxrV2JiTDVsdmVVVzg4MDFqcEU5VUVmMW83ZUFnVFBwT0hJZG0zQ2FpWkNw?=
 =?utf-8?B?ZjVwUnVlbDhtNVFiTWxTWHh6UUVZVFVta2Fmb0ZrSTE4UzJ0WHorS2EzME15?=
 =?utf-8?B?a096QVk3OEFJMlNFdGZPQ2tmRGhNUEd2MTZUa1JsVUJ1cFU0SUtycDFNK3Rk?=
 =?utf-8?Q?Gp6n+kR9o9fKG/PsZ9q1pQT5hO86+by/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTY2b25SYWJHdVJQdmg3TCtWQXB5YXJSY3VBRTYzQnhDdDlud0llZFZIM3Nq?=
 =?utf-8?B?T2xHdlJITGhaOWFhR1VKY1J5djJQM1VPUGJMNGhXWjFGYUI2U3g4aElrUStR?=
 =?utf-8?B?aXZHV3N0WnQvdWx1SkxhNWg0VGVmYjJaMEVWVFpMdWprbW1vejg2TmRKMHNO?=
 =?utf-8?B?WC9sVFhaZWZ6MXUzenlMbGEzamREb3c0czMzYzlwVHkyTTVUQ2hjK1ZVdFgw?=
 =?utf-8?B?Tnl0cWw0MFhzMTdYVjJYUnNXKzdXM0tOODVtS3A3QnV0dVVvUUZwdTAzOFRr?=
 =?utf-8?B?K2VwNGtpTElGVzZIVUhVVGhzSDRaMDF2QnNLb3V5Tm9acGxiQTlxVlNOeWU2?=
 =?utf-8?B?NVFLVHBnWTBjUHp3OUxNeFduVE1zby9LZDkweDJQYUpnYVlYS1JWK0p5VCs3?=
 =?utf-8?B?YTdqZkI4Tms5ZndZbTQyclBBcnJ0NVJYUzlsamE3ajdrWllOTDAxblBzS0RP?=
 =?utf-8?B?ZVJZUGVDSGhsY0lzWDljaDhDckt5SHAwdzZBNHZZTE9RWHZibFpndWpSeUQr?=
 =?utf-8?B?QWNDOVErM3dJUkdlVWFCOTBXajkwdnROYy9mM1hJOG12ZUUrQ0NYRktjM0tn?=
 =?utf-8?B?ZW9GNTEwRm1yLzc3VC9kZVgyNGZZNUtDVU5EZCtzSjFEOFNzU2E2dWY0bGRH?=
 =?utf-8?B?WVR2bU1XbmdCRU9TN3VLRGRWNkJ1WFZZSUE3NnpndkJLY21LQk4vL1BtNUNr?=
 =?utf-8?B?WEhNamY3cktCYXVMNXZpTjFzTjJ2Zk9vVGU0dDNvNXhvZGZJOENnYlJsL3dY?=
 =?utf-8?B?b05JQUkzREpmNkNQVW5IR01BSWsrTUNEdU9reGIxL0ltSTRQRGRPek02cm1s?=
 =?utf-8?B?d2tRMEVEbGluWHJVRGxaTkdOOFRpWXdGMVkxZy8xcmM2RmNjOGtkbjF4cnMz?=
 =?utf-8?B?czh0SFNtMUkvYklvRk9XRjhQSVg5NVZOYUdhdk5WUm5XbDRKYVF6Wjcvc05C?=
 =?utf-8?B?Q2dpdFpLamtSZlJTWmEwb21yQ3R3d3NScXMwdm4xWHlEZmhycHZ0TzlLS0hL?=
 =?utf-8?B?OWdCa3E1clg4YjMzTm04RElMMmNLcC9VWWF3ZC9YNE83UGdTY1V2MHB6TEx3?=
 =?utf-8?B?bTZVL01JdGh1U2dld0VFRVpVVlFQSk5HZ2RaK0pPdkx1RThKa2FjaXpKZTVB?=
 =?utf-8?B?VExwVjRlTW9UNm1iUGU5TzhNWEQrMFF0MXV5dkFoektic29xcG4rYk96aXlZ?=
 =?utf-8?B?OXRmYXdVbi9FbHh2Q2dSNkg3K0JoRTV3UHJ5SHZFYXR5ZHE5NVNlRDVJQTh0?=
 =?utf-8?B?bDVrb1FTTTd3QlQ0cFBrNEhQRGZYMlQ1SEp5QlhEQmpRVkpPT2hYOW1pVnR3?=
 =?utf-8?B?Q0VlTDZDeTBnWEpGVzQyRFhGSlA2MG5ESmhwRWFwcmliZWcyeU93YnRvTWJD?=
 =?utf-8?B?Q2FJRGIySXVqbDVUdDgwdHJwU3IzZ2dsQUhaNmVQMjFPcWxtb2FaOWRGb05v?=
 =?utf-8?B?TXBBOXpSRElyUkhHMStKc0pJSTU0T3QwNlVQUnM2YVp3TEFGVGhvM0V0WXdr?=
 =?utf-8?B?eHZpTElJYk5hdjdhdFBqdVQ1V2JZQUg4VmdsbmwrcXdMdE02eVJtS1VoYTl4?=
 =?utf-8?B?ajRhYzlvTjBkUmxIMkEya05kL3R1QTIrd0J1OGVlcGdxTjhnUXdMMnUzT1FF?=
 =?utf-8?B?VXZKVXZSbFNrQzQ3NmRiaURSZUcrTmp2SXVjQ1k0Z3FGTk9YeG1tRGNpeGUy?=
 =?utf-8?B?ZUhCMzM4K1pNYjFNQVZVZjFBSUI1WmNvYnpKUW9uKzVnRk4zUkRRa1FrMEVQ?=
 =?utf-8?B?bkNRRWJ3REx4QTdKTTBnTkZjSURPLzBRa1pFZWRQS251YkFsWGtLQ1NKdXpE?=
 =?utf-8?B?eTdUQTQwcWh5WS9EODNKQmp2MXBXUmJBTngxRmlzZUV1SG9ZWWhiZXQ2OFhM?=
 =?utf-8?B?L2s5Sm83NE5JdEJBWTdIcURaaTZVeVI4bDVFVGFSZXBSTmp0Z3FTaThYTjRt?=
 =?utf-8?B?N2pLeFkxMVhScy9McTdzZVJiSExCSXpacTFsK0RrR3Y4T2h6c0JjMjh2UldF?=
 =?utf-8?B?dm9MQ1ZqN3J6bU9Gck96UFF4WW0vM1RVU0RjZTV0NXBsUHkrZUp6TFN0K0NN?=
 =?utf-8?B?aXBzbkVmSFo4cjBpVFd6bTg4bjhwcEdMNEo0Sk9xbDg5Rjh5Yzk1MW1mWEto?=
 =?utf-8?B?QmhvdFZEVlBicEZRMDRBOVhraUVvMXZBbHFaR3BkdW5pT2RDTVBKeENFeEpV?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c13c841-72f8-4791-5316-08de22c9e09f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:32:38.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAZ82gy8wlA7EpjxjAPOGEY5+CV41LHQw4krdUau8lDAtsfG2+lLnJQGSasjzNyB2qNus9QC+Sgau9Ka/Tjq2DNuAeKJRr6X8qU3EsUhraY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9842

Hi Jürgen,

On 13.11.25 16:46, Juergen Gross wrote:
> On 13.11.25 15:39, Jürgen Groß wrote:
>> On 13.11.25 14:23, Jan Beulich wrote:
>>> On 13.11.2025 14:18, Grygorii Strashko wrote:
>>>> On 13.11.25 14:30, Jan Beulich wrote:
>>>>> On 11.11.2025 18:54, Grygorii Strashko wrote:
>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>>> @@ -29,10 +29,12 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>            return -ENOSYS;
>>>>>>        }
>>>>>> -    if ( !vcpu_is_hcall_compat(current) )
>>>>>> -        rc = do_memory_op(cmd, arg);
>>>>>> -    else
>>>>>> +#ifdef CONFIG_COMPAT
>>>>>> +    if ( vcpu_is_hcall_compat(current) )
>>>>>>            rc = compat_memory_op(cmd, arg);
>>>>>> +    else
>>>>>> +#endif
>>>>>> +        rc = do_memory_op(cmd, arg);
>>>>>
>>>>> Why would this be needed when vcpu_is_hcall_compat() already honors CONFIG_COMPAT?
>>>>> (Same question then applies elsewhere, of course.)
>>>>
>>>> This I do not like by myself, but I was not able to find other options :(
>>>>
>>>> hypercall-defs.h is autogenerated and it's the only one place where functions
>>>> declarations like do_x_op() are appeared or disappeared.
>>>> So build is failing without ifdefs as compiler can't find compat_memory_op()
>>>> declaration.
>>>
>>> Oh, I see; I hadn't thought of that aspect. I wonder if we wouldn't better take
>>> care of that in the machinery there. Cc-ing Jürgen, who did introduce this
>>> originally. Maybe he has concrete arguments against us doing so.
>>
>> No arguments against it.
>>
>> You probably will need a new Prefix defined (e.g. compat_always) and set it via
>>
>> #define PREFIX_compat_always compat
>>
>> unconditionally. Then it should be possible to have
>>
>> Prefix: compat_always
>> memory_op(...)
>>
>> outside of #ifdefs and drop the memory_op() in the #ifdef CONFIG_COMPAT section.
> 
> Oh, this might be wrong, as this will break the PV32 memory_op() hypercall.
> 
> You need to keep the current memory_op() in the #ifdef CONFIG_COMPAT section
> and move the compat_always stuff into an #else part of the CONFIG_COMPAT.
> 
>>
>> This should result in the compat_memory_op() prototype to be always available.
>> Having no related function should be no problem due to DCO in case CONFIG_COMPAT
>> isn't defined.

Smth like this, right?

diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 338d7afe3048..e85943320bd2 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -80,6 +80,8 @@ rettype: compat int
  #define PREFIX_compat
  #endif
  
+#define PREFIX_compat_always compat
+
  #ifdef CONFIG_ARM
  #define PREFIX_dep dep
  #define PREFIX_do_arm do_arm
@@ -156,6 +158,9 @@ platform_op(compat_platform_op_t *u_xenpf_op)
  #ifdef CONFIG_KEXEC
  kexec_op(unsigned int op, void *uarg)
  #endif
+#else
+prefix: PREFIX_compat_always
+memory_op(unsigned int cmd, void *arg)
  #endif /* CONFIG_COMPAT */


-- 
Best regards,
-grygorii


