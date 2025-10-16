Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B54BE595B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 23:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144740.1478026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ViC-0007kV-4g; Thu, 16 Oct 2025 21:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144740.1478026; Thu, 16 Oct 2025 21:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ViC-0007iz-1G; Thu, 16 Oct 2025 21:40:40 +0000
Received: by outflank-mailman (input) for mailman id 1144740;
 Thu, 16 Oct 2025 21:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2gh3=4Z=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v9ViA-0007it-U1
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 21:40:39 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ad8226-aad8-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 23:40:37 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBAPR03MB6405.eurprd03.prod.outlook.com (2603:10a6:10:199::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 21:40:35 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 21:40:35 +0000
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
X-Inumbo-ID: c0ad8226-aad8-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0ZFx09Qt3bStbkUXtc00wNlWeKMjOH0bgmr8JfQH9chogtGETyOnaIG40gFAe5fATJQ7Fe2odqv0JxJbu0DMakqXUDwqEe3GWv+dPBMJ+8g8FTeBGLcJASwez5uXMeK5OAkWymSXKrC11WAX4dgzGWpYnUW+FJgmbgvrgaSPYNw3ESd9CfhA/qMLQQQpNOr7dVBLQo6IFNJLhEL+h5973M2oS0xs4B03OV6rMaZ6OQ0HdyotD9QiI6ujKnhU82Ff5v5HHXABaCg/bKrZiOdLIjiIpY5y8ekr//q89cxGhAaHbI2QodLVfiNFUsUKzoX/t/VebrCe2KSLupxfzuJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcGNlrh5ri7DMwSAe7hx7KlVZ+ujAJURigqbDe14/dY=;
 b=Me/JSCjC2q4B6AgbkfMwDa97HuO3pmtpAW8k8l28uuVsNlh70mOsUkTY/Jx9Nl1vDaxOxtkIN2cHnmD1qBofMRxCwr0ynatcZ7PMFje+4RskqjhJJlVB6vQ71Uqtb9H2dMjTg0Cq6nXRFU7jq7L3inPf7J3Uhp2N+iVYz1e0FG/t0l4DRpT/lh15qWGAF0rcSTGmerTBV6hbv8A46iuKIHcDnQ2yZ7UE1NfQdzz7+vCS6jAa73xc159yB9YjscA35ATVR9s2jCtTgGkMku2wwJ+ircFRlenbTnV9XGRyTc0W+6FyyuM16f/+BspE4Uk1LYUaUu4JQSBNiSL7eQz2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcGNlrh5ri7DMwSAe7hx7KlVZ+ujAJURigqbDe14/dY=;
 b=a17iRel3QrnSv8PSlI22xUT5kxc4Y7pytNY5bTlOYXBhgIbUISXQWBPPATzHoxGkrUly7z2RMQWPEaI40qdoQGRLz71ugPecGo+foIVxkwwqT0Q5NplfG4Dhv4Ff0nJCs+JwEFyppcDTtljDZ9fnn894tNpJANZBSEXNPjvWODflWyq3HLgdn8RpqWU6I+rdrdMjNJht9LrWQ0tOQUv/KgU2nPdjxQQwK/ESjh3viP2USkJoOjjslxgQlZ5muKPWZ6TMyd8dX7124K0H0G1Fw2fc0S4eX/jmzrK3WSAKptgxpiRJAFCfsnY2c+wupKTBbT6yIpLcC+5afKXRJKhQ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
Date: Fri, 17 Oct 2025 00:40:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan> <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan> <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aO9UgQ3J27hVgGIa@Mac.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DBAPR03MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3ad45d-bada-48a3-582d-08de0cfca37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVZqTkw3c3pSVHlZdUhxMFh0U25JRWFna3llRWZGVGhzOHJna0RheTJwKzBy?=
 =?utf-8?B?QnozdElzbGhmWE15M3E2NWtwVVo0MGhqUFpUeGFzNnlBdVlaWjVIQWphcWhv?=
 =?utf-8?B?SHNRd2oxNnVwbVVJKzRGYjc5YzBhbDcvMU5IWDBiSnBZVXlPRTRaUzJlS2oz?=
 =?utf-8?B?eGdoSWV1bXBkQmpSd0RnK3JzYUpXV3hLU2kzTjlOdFZZdGZ6L3ZDN2hPNWpO?=
 =?utf-8?B?RG93R1NKbWpGVWdUcU9IcjhMOUZhQklNMk9uMUV4eUJja2d2OHRocTFNQnpw?=
 =?utf-8?B?RktCeFRpVmRZUzJxVGxjSDNHRE1rdTZBSzRrUjlOTTJIakRCWkJFMHZVYkV6?=
 =?utf-8?B?dHo4SUlaSThRQlpVQ000bzRHVnhYVjNaNW84NVlRdVRPT29GbVk3QWp2R013?=
 =?utf-8?B?RmtyazBralU5YUNMdUlEWWx5UnhvUElCbzBaNTErZkc5TjBTazlHcFFEQVQy?=
 =?utf-8?B?bnNYdllBcVM4emlTMWFWN3JDdlFFdDhCWGhHZ2VUNi9pNHExQWdKNmpkeUlG?=
 =?utf-8?B?bEZJcFhnMElzZm84eEtkS2VZZTM3UjZXY25zRHFYSVZ3QTNWNmZDLzZhem1L?=
 =?utf-8?B?ZCtMeVpFaVAzNWpNTldLK3pOYzh1STJSVnpMMisyZ0hUaWh4Skc5SGM3Nllm?=
 =?utf-8?B?c2ZpSVBZRnN2NHowWS9nWjkyRHFYUG84N0Fma09wY2c5OGVaeC9UYkxscWFN?=
 =?utf-8?B?dktIcTF2cXgvUDB4M0laL0drQWJmTjE0NVk4TStjQ0dQeUxrcG1nMG1MYnBN?=
 =?utf-8?B?UVZpb3lTZVFIdHhIOW4yS1d4ekZNSlJqZEpob0tiTVZRZmYzNFE0ZitvVFE5?=
 =?utf-8?B?cDNYQS9KYkI4U0hKdzBxNEdmK1lrV1RjS3pyZ2FFWFh2WVFOSytiUkxUTllz?=
 =?utf-8?B?dWcrMmVHeVgvL3JZKzUvY05wRjk3WEFwaHI2eVh6c2p3eG9kRVkxanFqczVv?=
 =?utf-8?B?enpQVVhwRDhibGp5aVBpK2R6L253Z1VVajRWRHJVeGZtSmFSR3loeVl2MGll?=
 =?utf-8?B?aVAxeFB0MkhUVlNKTDB6VjNhV2FhcE1nRnMwenBzMkFSbHVyRkFCL3lKZnpI?=
 =?utf-8?B?ZFQ4a1lXdlJXN0s2ek1Cb3M1K0lnQldwVVppV1ZYRE5wYk1mN09KRnA2ZU9y?=
 =?utf-8?B?QmpXVnVSdytHaXRBb2Q0RHh4OHhqVDlWZmgzMmh5SVAxREZkTi94OWtlUFY4?=
 =?utf-8?B?bGpnc1JqQnNNRFlWbm1zWXZGNDd4QUdtRlUzODFGUkZCU0V5THpYSTUybUk4?=
 =?utf-8?B?a21ISTBsazJIbmZCWlJXZVdRbEJDcFBJVHNzVGZmZ2djeDR3TjV5dDZ2UGhP?=
 =?utf-8?B?bzgwQ2pLZEZWaWtwb3ZVQmdTczZlNDVvZmw5bnUzWDlOZGVVUnVsN2RPVGtZ?=
 =?utf-8?B?TURWUlRYdlJoejdWYmIzOGgxd3NPOHMySEdzM0lHeXpKWXJYcmRKNExWaWRU?=
 =?utf-8?B?M0FhUDJ0c3hIdzQvN2lVS2lOaVpETGhRZVRDK3kwb08wSFpYaTRsblkxN3F0?=
 =?utf-8?B?WXBodU9CYW9TNzZ3cDQrNU9KUlQ4NGw3OFRydCt2Y0hsaXp4eUcyeXFIb1pM?=
 =?utf-8?B?RytrVmJacVhMYThYU1FNU1dqY0ticTlzdXdYTlh1b1h0Z1BKemc2SGJERnRK?=
 =?utf-8?B?eVNtVlhWL2VERWM4UDE4TGl3VnQ4bHQxY3dmb1ZJbXgyOTVUNS9OWTArVUNL?=
 =?utf-8?B?bHYreU5YOFVkMjdxMjdGeXlNUnhQNmVnZXhUb2hNa1Z4NGFWTEkxTUJHR0NU?=
 =?utf-8?B?R2NDaHRHMVA3bzM1c3pLNGZRMjFySDk0dk0yb0M0YTBVeFQvSHlpNWl6U2pQ?=
 =?utf-8?B?WUpyUTc5WDVQZ0FpVGZYWW5kWTQxTTE3R3VvZUM4OTZNOCt0T1ZHai8yTWRk?=
 =?utf-8?B?Mmw3V3lhR0JLc3ltWnM1d1J6Y3dtV09rNnZOQk15RDZTUjAxMm9oN1RsaC9P?=
 =?utf-8?B?RTN1RTRyRm5yUTNESFJDcWdXQVZaV3JYaGsrLzF3ZlhDT0RuRk1BT0hkc3BH?=
 =?utf-8?B?R2xmTGtvbVpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0dsRHNtNmhWUEZ6OExkelV0S2tTaVhUeDYwYzVSc1R2TnZMbTY4dlFsTmdE?=
 =?utf-8?B?Zlk2MGdIQmxrTDN4TXpSb0xPZUlqc1I3VUh0VTlwdEtnZTZGVW9pcUFsa093?=
 =?utf-8?B?VkhTMHY2NEVwUXRPRDBqK1VOUWZRVG9rZlArQ1AvTmxRM0diWjdJWlUyeVIy?=
 =?utf-8?B?Y2t4Yms3amNFM1pRV2VRd1VFVFRKRXNKK0JuRURJdk9GVWNHNWxHWlB3SDlv?=
 =?utf-8?B?d2pZV09zcEtPRVdNOVFWRElIZDUxWktiSy9Fd1dFY0lBSERkTTdaMGMxdmpG?=
 =?utf-8?B?czlJamkwZXFtb2J2ekZQN3JGVldJc2FtOG90WDdPbjkrdVBBNGtmRVZqY1JL?=
 =?utf-8?B?M2taT29WYWhhdkNjZ0lMb3R0eWVUcHdMcTE4eXF1dEswcDY3THNoSUdvMnpm?=
 =?utf-8?B?QUQxNkZDU1daSDcrdFc0NGE0YkdCY3NTaFNrK0N4NFhKcGZBellsazExbXpG?=
 =?utf-8?B?MnJIUGpUa1I4blFkMHcrSWpjRFlZUzYxL3M2QXNjZEFzMmVxRHZYbjcwejVz?=
 =?utf-8?B?Y0VFdEVmQjhZcnlTelNYNlMraUxOWWxBQXpqeGR5RDVaOERaVVNVbXM5a3FZ?=
 =?utf-8?B?U0dlMXUxUDI0UDdGcFlJdlpwaFZpRmZwTjZneVQrWUxUTkZFRG5WRWs2c3Ay?=
 =?utf-8?B?eEp1bnBmRGtNdXlMMnhDUmtKYzFHazZaSmcrR3lmQk92Vm91ajlKcytKQng5?=
 =?utf-8?B?NHJXUWxJZUR2N29DaUtlK0pZZ0ZCQVlYbC9IQ3NvSUtIRFAwaEsyNGUzc2xT?=
 =?utf-8?B?S2k3VDVZd3RQUDJRYWhhbjloY0RDekFZbkpsWlBldE9KU1pGeldIVkdJN2lZ?=
 =?utf-8?B?eTM5c094elA1WjdmOTVhRFpYb2NUcXdlL3E3eWxuL2h5QTFTUytEajNSMDRj?=
 =?utf-8?B?WXNYaEdvSCtZR1R4ZFZCamJhOEdwVUM0cnJGOExNU2JmTk5BZFN3UnFKTDZI?=
 =?utf-8?B?cHBvNWVmL3hqVE5tNFlrWGtSVzlVZUlMcFRweCsrRityZng2QTFFZ3NVMGpt?=
 =?utf-8?B?bDBHR0VJNG43aEZXR09qL3p6VlRaUXNCbXFaZ0RKeUhWZFpyMGFpSkZzS1JR?=
 =?utf-8?B?Q3hBMFhNTjBlaFFnZ1ZGS3RYUm5hT1ZwNUNZMzZsU0dpWmFEWlRNelRpdnFD?=
 =?utf-8?B?K2J2Mlo5cll2L2xKYldWcG1NVEZrZmxHY2E0OEFGRnloSTliWEpXRmtoc3Er?=
 =?utf-8?B?N1VVcUFWMGE3RW1mR2dZeU1Sd0RYR0crK1AvYm5FUGh2dGJiZkFCM1AvR1Vw?=
 =?utf-8?B?ZkJycDN6QkozVUc3UURNVGx6QlM2UWNmNnZSWlNkazZ4YzVZaXBkNEJ6WE10?=
 =?utf-8?B?ZE1SRVJiR2FFYjdBRXZ3VWVDbW01QXF5VVlKQ1pzQ1ozQ1pJWVRieUZOYzc4?=
 =?utf-8?B?MTNtZWNmVFhXOEZoaWdxQU4xQS9RbHJiUmlvUHl1RmJMeXZESHU5UE5zZnVv?=
 =?utf-8?B?d3JCeGtaQjg1QWFYOFVKVTlKQVJjQ3FuRjE4TkdWNHM4RTlmN1c4MXpnN3lp?=
 =?utf-8?B?WUYrb0tQUmtqc2hSYkVkcEVhQk5tUDVrbncrZWlYZ1NlU2ZIVEhMUUtmcERv?=
 =?utf-8?B?QzNHdGkwYk52S3dZSUd2TmRaYXNNNGNFL09iV2FlNVcwdWp0ZmVEZUl6eTY1?=
 =?utf-8?B?MFMyYkZaU1hBem5FclUzSTBlVXZReG1ONlpiNjlGZkh3U3ptaFRWSkg1T3hu?=
 =?utf-8?B?bVhmdCtMTWx5NkQxdWdNQXZZazFBb0tpTVdqa2NSN3JjRmRDN2pKOGo3ZExr?=
 =?utf-8?B?NUhpdUF4MFVGeHZMeTczQStsU2RaMCtJcUZsYTR0U1dTWnprYmxGQU5zNU1P?=
 =?utf-8?B?U0FoZmJwZnZWdzg0ZnFWVXBZMjRiMEhCUm9zYmkxcll6MFgvQmVJWDBFcGUz?=
 =?utf-8?B?czROUHlYM2c2ZGtEcFNxN0lhUEtEMlJaRjA5Yjg3dWFqWFd5Rnc0eXBiaklz?=
 =?utf-8?B?WnJsNmJ4ODZFQkFsT0h4OUY2WFdBRVZLRUYzeThIdmg5ZUNTL2REbFQxbXRU?=
 =?utf-8?B?bzVHaURxMVZVT1NkTlNNdXhob0o4N3BHeERveGVHNWJRVGN4Q2UvdGtqemlD?=
 =?utf-8?B?Mm8weERJN2tQVXZuc0RsUFdVZjJmQ2Y5cDBLSWpkVDRpeUZEckd6MjRSTnhX?=
 =?utf-8?B?NzJZekNXLys0VTJiUWs2YXVhdUE5MjRkbnYyeGZ6WDFtbjBaSU9NYWoyMmRh?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3ad45d-bada-48a3-582d-08de0cfca37a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 21:40:34.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWOnr8IWeT8qQgx8mXypbdFvif6MOjaq+7lQ3zgEyUFwG7GMt5nLDno3O+IuZ/gWkfN/riTkpooeLi/YN+t5CkmOKBLvQSQlvAyOfr5XzEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6405



On 15.10.25 11:00, Roger Pau Monné wrote:
> On Tue, Oct 14, 2025 at 06:48:23PM +0300, Grygorii Strashko wrote:
>>
>>
>> On 14.10.25 17:38, Roger Pau Monné wrote:
>>> On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
>>>> On 13.10.25 15:17, Roger Pau Monné wrote:
>>>>> On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
>>>>>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>>>> +
>>>>>> +	  If unsure, say Y.
>>>>>> +
>>>>>>     config MEM_PAGING
>>>>>>     	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>>>>>>     	depends on VM_EVENT
>>>>>> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
>>>>>> index 6ec2c8f2db56..736eb3f966e9 100644
>>>>>> --- a/xen/arch/x86/hvm/Makefile
>>>>>> +++ b/xen/arch/x86/hvm/Makefile
>>>>>> @@ -1,6 +1,6 @@
>>>>>>     obj-$(CONFIG_AMD_SVM) += svm/
>>>>>>     obj-$(CONFIG_INTEL_VMX) += vmx/
>>>>>> -obj-y += viridian/
>>>>>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>>>>>     obj-y += asid.o
>>>>>>     obj-y += dm.o
>>>>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>>>>> index 23bd7f078a1d..95a80369b9b8 100644
>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>>>>>         if ( hvm_tsc_scaling_supported )
>>>>>>             d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>>>>> -    rc = viridian_domain_init(d);
>>>>>> -    if ( rc )
>>>>>> -        goto fail2;
>>>>>> +    if ( is_viridian_domain(d) )
>>>>>> +    {
>>>>>> +        rc = viridian_domain_init(d);
>>>>>> +        if ( rc )
>>>>>> +            goto fail2;
>>>>>> +    }
>>>>>
>>>>> Are you sure this works as expected?
>>>>>
>>>>> The viridian_feature_mask() check is implemented using an HVM param,
>>>>> and hence can only be possibly set after the domain object is created.
>>>>> AFAICT is_viridian_domain(d) will unconditionally return false when
>>>>> called from domain_create() context, because the HVM params cannot
>>>>> possibly be set ahead of the domain being created.
>>>>
>>>> You are right. Thanks for the this catch.
>>>>
>>>> Taking above into account above, it seems Jan's proposal to convert below
>>>> viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
>>>>
>>>> int viridian_vcpu_init(struct vcpu *v);
>>>> int viridian_domain_init(struct domain *d);
>>>> void viridian_vcpu_deinit(struct vcpu *v);
>>>> void viridian_domain_deinit(struct domain *d);
>>>>
>>>> Right?
>>>
>>> Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
>>> flag you need to exclusively use the Kconfig option to decide whether
>>> the Viridian related structs must be allocated.  IOW: you could also
>>> solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
>>> is_viridian_domain() for most of the calls here.
>>>
>>> The wrapper option might be better IMO, rather than adding
>>> IS_ENABLED(CONFIG_VIRIDIAN) around.
>>
>> I'll do wrappers - less if(s) in common HVM code.
>>
>>>
>>>> [1] https://patchwork.kernel.org/comment/26595213/
>>>>
>>>>>
>>>>> If you want to do anything like this you will possibly need to
>>>>> introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
>>>>> domain has Viridian extensions are enabled or not, so that it's know
>>>>> in the context where domain_create() gets called.
>>>>
>>>> In my opinion, it might be good not to go so far within this submission.
>>>> - It's not intended  to change existing behavior of neither Xen nor toolstack
>>>>     for VIRIDIAN=y (default)

[1]

>>>> - just optout Viridian support when not needed.
>>>
>>> OK, that's fine.
>>>
>>> On further request though: if Viridian is build-time disabled in
>>> Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
>>> or similar error.  I don't think this is done as part of this patch.
> 
> Another bit I've noticed, you will need to adjust write_hvm_params()
> so it can tolerate xc_hvm_param_get() returning an error when
> HVM_PARAM_VIRIDIAN is not implemented by the hypervisor.
> 
> Implementing the Viridian features using an HVM parameter was a bad
> approach probably.

I've just realized how toolstack need to be modified and all consequences...
Have to try to push back a little bit:

VIRIDIAN=n: Now HVM_PARAM_VIRIDIAN will be R/W with functionality NOP.

I'd prefer avoid modifying toolstack if possible.

How about sanitizing HVM_PARAM_VIRIDIAN to be RAZ/WI for VIRIDIAN=n?
Or may be produce Xen XENLOG_WARNING"Viridian is disabled" if value!=0?

This an EXPERT option and end-user can get Xen with VIRIDIAN=n only by
manually re-configuring and re-compiling Xen. In other words, the user
is an expert and knows what he is doing.

Another point, assume change like this is to be done for HVM_PARAM_VIRIDIAN
- there are another HVM_PARAM_x which depend on build-time disabled features, like:
  HVM_PARAM_VM86_TSS_SIZED
  HVM_PARAM_PAGING_RING_PFN,
  HVM_PARAM_MONITOR_RING_PFN,
  HVM_PARAM_SHARING_RING_PFN,
  HVM_PARAM_IDENT_PT
  ...

if corresponding features are build-time disabled, above HVM_PARAM_x
become R/W with functionality NOP now.


> 
>> Sure. Just have to ask for clarification what to return:
>> -EOPNOTSUPP (my choise) vs -EINVAL.
> 
> Let me add Jan also to the To: field so we get consensus in one round.
> 
> I won't use EINVAL, because that's returned for deprecated parameters
> also, and when the passed Viridian feature mask is invalid.
> 
> EOPNOTSUPP is also returned for non-implemented hypercalls, so I'm not
> sure whether it could cause confusion here, as the hypercall is
> implemented, it's just the param that's not supported if
> build-disabled.  Maybe ENODEV or ENXIO?

-- 
Best regards,
-grygorii


