Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F301C071E8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150671.1481740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCKBv-0002Rk-8J; Fri, 24 Oct 2025 15:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150671.1481740; Fri, 24 Oct 2025 15:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCKBv-0002Od-4E; Fri, 24 Oct 2025 15:58:59 +0000
Received: by outflank-mailman (input) for mailman id 1150671;
 Fri, 24 Oct 2025 15:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0w6I=5B=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vCKBt-0002OX-V6
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:58:58 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55ba3032-b0f2-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:58:52 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ0PR03MB6534.namprd03.prod.outlook.com (2603:10b6:a03:38e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:58:48 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:58:47 +0000
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
X-Inumbo-ID: 55ba3032-b0f2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCDjiUCmyLTqsIihqq/1MmpbauffOy9XF5A/+oGlzmyh4VvFeSlW8LAhoCqWhDP+ZYlnHxR1DAR71BhZeakPENbdib+TA6Wkyq40ROJJEA78tee4cWZLZNudAelhJAnP1HXybBVrd+a6Kiug0sp7U7OlsxkiwMInAxPFni1rauk7lgN7AeUUa8J13RO+RjE78+cLjnaVn/klqFgofcNpKLHsy9pU/63XyR+BXVAg8Ah4HxqDSIOsE+VuU259UR8L3xX8mCA9B9QIvJQEu/+px3erQPSX/ge10O5sSxnJuozzhsGt19QnUYmDrZ7YJz8DiypNfEO53pc5PfjuuKUmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ4jZiYa1mFI+v3PreJeAKEmTZm5Gv6M8P2JfTG2QUs=;
 b=c0Mz0lDlGhMnxGETya94gpSrg/QGo080cv6YIRuzWxC+zGkEX2NHBtprMM32yTfmdsrmE8yx3jV7SfXdf2gq4DV/UARH1/jBCSO1vTv2A5M9bXdBZ6b8XWJ07jNPB0ymnwSs8LQcbqhPQ2/UbH2G7HLYGjYltnyw4PaTeCCtebyx1tblczjVoApkW7cjkQPEGMt+ne5eus79O7wBk5Jryg81qajpd1+lwYRmNjt/uwnS9tqNrI7VF2tvjEqmrnamX11EA5ijqDSoi5tW1ga9ihcbQDwx8Ht1mKjNveQQ8WmuhRt0+YRENxgXEby+x7VteFN8NQKsq8ohKRPvwwC0Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ4jZiYa1mFI+v3PreJeAKEmTZm5Gv6M8P2JfTG2QUs=;
 b=m6EoAY/fsZhYqg6s16YBHukB5PoFQeMMIzkyWCBccrJACy4PESuI4es2UdfIeVtgnD4zTubMp0segf49k1FoJyfQ90QZcNMN2meJ04dXvW1VF6c8hdfDzLKR9TQJgA+5/rV0W3DZ6LxvlSpxcMr9PxKiepkLRFpRDLnxUWEKAk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <72a2f002-23fd-4d06-8c44-3e535533bec2@citrix.com>
Date: Fri, 24 Oct 2025 16:58:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pci: prevent infinite loop for faulty SR-IOV cards
To: Frediano Ziglio <freddy77@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <CAHt6W4dnM1pLMnDVyywc_2d-6nry7pFCYomSvRjyuH7sRm0J4Q@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAHt6W4dnM1pLMnDVyywc_2d-6nry7pFCYomSvRjyuH7sRm0J4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ0PR03MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d512a16-77a8-4f82-f22e-08de13163782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1NFSjJRWlVPOTFrdUZxQWdoeGZ1MENaUjcrdWlnQVJ3L3hSNm85ZFZvNEdI?=
 =?utf-8?B?amhCVC9wN0J1R01zRlVIeXBKUXhsYlp0K0dQRFZxM09Nd0hpTXZrM1liaGpH?=
 =?utf-8?B?aDRheEtycHpxeVlENXk2UCtQMloxOW90WGJBdmJFUU1UVmE1bS9paDYxUlZq?=
 =?utf-8?B?UTlNalZBdWtFUW5lUkRuc25ORWF4OFBhQ1pkV3dBVGVEbERQblNxeWljeWJz?=
 =?utf-8?B?VmNEQ0lNQ1RYS0JLNm90WTc2V2hsZXZGZjlVdEE1YzVjUHd4dnRpd3l4K3hn?=
 =?utf-8?B?Wi9EcFo4SEV4KzE1M3h5ams0cTNjbEg3cC9XMm9BZUgvYVlmMWtDV2NRRmVO?=
 =?utf-8?B?NWpSMWMweGU4MXBvNmkyYUNjUWhFSVlaNGtFcHdvcE96ekJkMVJMZWtuOEdT?=
 =?utf-8?B?elQ3aDBLbjFhUkh4YURFY09QM2xPcjR6Ri9XQ0QvdzRxcFlhMEJNMGdDL0o4?=
 =?utf-8?B?UEFsVEgyT2NmVFV5a3VtWEZOSGxIQmJEYk14TGZYc3AwRGhzVlJ2UnNHY2t2?=
 =?utf-8?B?cUhNNnY3eFpIbENUemgyaTN3UlRMS0owWEtWWHFBTzBhMTFlUEtFTUtmVzZN?=
 =?utf-8?B?L3grVUZuejRrMmdDc0QvelI0Y0taVmhwQTk3eS94cFp6K3NWN05uclVGVzM3?=
 =?utf-8?B?NW5vQ3FQNytVUmEwYU4wYTBJQXNSSnYxQXM3TjNjc3BPT3hkQUlCNHhWakRr?=
 =?utf-8?B?SlNZOG5uSURWYkxENitLQW9GdTVDeEhOZWVyTmRWUHdVcHFMdW5MbDM4ZGZQ?=
 =?utf-8?B?WDlLTFJMNkVRK3lmckNESkljaUFkSVBlMDNwYjVVUzFoZC9oeDd0UWQwNEtn?=
 =?utf-8?B?R0lNdFN1b3p6elJ5YkFUajdFbVB2L1VjNjdzaXEvV3NtUTI3WjMvR2FIM0Vn?=
 =?utf-8?B?eDBkdVNUcyt4cGp6VVhLaXZsM09ucUg3MmNiYlZYTEdVajAwL1BHcU9WYU1a?=
 =?utf-8?B?ZC9aUG9oQWtyVFhad1BIb2xQZE45Q1BBc1RnVWoxY1BOY2dvU2RkVnpXSFdR?=
 =?utf-8?B?clA4akhQV3FydFZ4aUppSWl2NmFab3FyY2NjY3N1eUFPeU52OGFSV0pRQ2tl?=
 =?utf-8?B?SnUxbytVekw1TEhFMmFEWWNEdEwrUjVtc25OMFZLbG5QZnRxUWNWZ3l6RitZ?=
 =?utf-8?B?Y3BsRlVMOUZrcEE1d0dOVHJqMm9KMDI5TzJna3dLVjlzUU9BTUJjejM0REo3?=
 =?utf-8?B?MkJXYVFjSW5QVTNBdHJOa2RrbmVBbmY4OFZIbzk4SVZub0hRdTQzNnBMdHdU?=
 =?utf-8?B?N2dFTUc3a3pRazJzM24rRkhaMEdWanplVVY3YjR2RWVKTXlUdXNVVXV4UVBZ?=
 =?utf-8?B?RjBnNHFOVmpaWEdHb1BNVkg3OC8xTkVaTVI2RStQVmg0enpqUmd3Z2FSQ2N6?=
 =?utf-8?B?V3NUSWQxVnowSi9kS1c1ZlIxay83cnFFK2RsMThlQkxDdTZCUUFHTXBsb2Rj?=
 =?utf-8?B?a0ZXdDVjNFBkbWhDMytOc3JmOVpnKzJzZUpQY2dBOVFVOTdteHVCY1NsV04x?=
 =?utf-8?B?ZDJtYWJhdktwdUc2bjY3ZDlaLytjaEdQK3k5RUxQTFhFMzBGKy9NNlRZZ0li?=
 =?utf-8?B?bENWWml6ajU1L1lMbTg5SXUzSER2U1dGbWFrZzgrSDlBMlRVMnVTUzVlb3gw?=
 =?utf-8?B?a3cvOHdITlpPdXdER3Y2bmdGTHgxbzJqTzZxWWZKU3dha2FabDllZGpzRHp1?=
 =?utf-8?B?OVFDaDNKeTU4ekZlZlFoUDBLUWs0NWZnRVNLQVlZUENPOHdIK1V3OUdGbThI?=
 =?utf-8?B?QkQvYjRDUHM3TGlOa0sxa0xRS3dmQWVIRnZwRlRPUi8zWDl0U3Y4M0lmREhV?=
 =?utf-8?B?bGd2MjFZTmREeGVYbGdkTXB6cmhmSm1RbWlhZHdBOWsyRWtlWDdZUFJwVCtW?=
 =?utf-8?B?eXRtM1hXdzBXNkZjNUlGb0VMbldaOVRWQnV0UjVhQTIzVnNUSEhJZTBGYTVC?=
 =?utf-8?Q?aws3Ml/81dGObadJa3xkfBCogKZ2F9AY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2FrNnVoWWFlV1A2a3l0cHFJeFhiSWdZaXdqdTFYU3EycmJscXFDdW9XMDhY?=
 =?utf-8?B?ZTdBcWtnWWtIUkZwQTF6NUxUelgvUmhPbXYwNUtWQnlGRDM1MTJDRzBXcjRQ?=
 =?utf-8?B?dUNDWlBRL2JDSjNKSFlhT3ptU0NmWGVBa1JiaEZRVytTQmlKZi9VVHl5TC9u?=
 =?utf-8?B?aTg1dU1GSFRyekY2eXBmVndGNzZEdFVYeCtxV05JV0VtMFlqTVJpenNiaGVM?=
 =?utf-8?B?NnplTDJWRjZCT2pVNExTeVpTSUlvV0tKQW9DczNIRzNLZDQ2RkJpS0RkVDQy?=
 =?utf-8?B?dEcyYWFaT2d0Z0FoYVhBSENBOENOdnRSRk8ySVpuc0tielh6dHlML3NHRWlr?=
 =?utf-8?B?Z0NkNEgvZ2xReDIxNmlJc3BmUmZ5Z05Pbk1rbUdjWVArOVp2aEIzditUOW5n?=
 =?utf-8?B?Y3RwdGhEN3dhbnNlc2FFTThvUGdibjhpYSsvMFQxa0RSOEl6QVdWZ1dtSzdX?=
 =?utf-8?B?VENJU20rWHRSR0tXZE1qMzFMc3RrRy9nMGU1RlRpWWRubDcrM205OFJQRVNr?=
 =?utf-8?B?TEQxL1VsMWtwMFpoemhnd2J4RWZKbWcwYVErVCs3TVc0UXVHUjlGcHdER0xB?=
 =?utf-8?B?c3VrSGo2b3A4V2hud2Q5RUZ0dWlRMWs4ZTkvRDVGdUwvbzlZaWlTcmttcEpn?=
 =?utf-8?B?UTEvaU80b1FSZ0ZHQWpOT2JXTjR1NmovcTVkdFpUemhPT2pWR1hSd01TSnB4?=
 =?utf-8?B?NjJiakwyQTI5Q0lUM0JLTC9YNWFDNU9jZThpZlRzYytZbklvMzVQckRzc2Jr?=
 =?utf-8?B?S3NTSlRFa1JXaWZmRFljNTNiVVZXVGlHN1ZRdk1yUit2ZmNwZ0dPOW9zdy80?=
 =?utf-8?B?ekNRTFBwYjhCdjJOSFVHcG1VeDJCWjlEY3lEWFNwV0V2cHZsb24vRkNYaU1N?=
 =?utf-8?B?SnhXNUxudHlZT2xlZkxyZnVhSDlvMUorK1VqbVd1S3I4b2E0WlN6MFVlUGlZ?=
 =?utf-8?B?RndVMTllM3AwQkltdTdMUVF2UmZwWFhhMFA0V3RZMERWS29XTDhTaDBDdEEr?=
 =?utf-8?B?cEp2eS9UZktsVy9NMExsYnZlZDVqeDI4L1BoaW83WnROUUR2ZzllRTJ1T3hS?=
 =?utf-8?B?ZEdjWXRrZW56VlNQUDNCcjU5c2JhZWlyeFhlNVVqOS9VM0hHV0QwVXZHWHNG?=
 =?utf-8?B?bjlZZmhxemJVYzN5bTlGUTA3Q1h6Y0ZsWHEwS3dYVC9DZ1FtRzJiR2Ywbk1W?=
 =?utf-8?B?UVFNMU9QdzFDaThwWW5tYktvRzg0NWNCYkU0Q2ZKc3BQS3ZVQ3FWbWdSd2l3?=
 =?utf-8?B?NFVncTNLNmdkNFZoQmVFN1NUbjAxbU1UcVNYVHVmVXloQjFTRmZXdmlBcUxE?=
 =?utf-8?B?a1J6a0Rodk5qTTdxNElvaEFrN1JxSmZBdXRGMElJcTBpSEJiVDBvMCtwSkV3?=
 =?utf-8?B?dDdDYlRaekRTcDQ0ck8wZnlDUjRZT3krZUthVXp2cElXQWVpR3dmY2ZHb2lG?=
 =?utf-8?B?QVVaNkNvMXR5UGxkSXlGRjJLaldsL1I1eC9vOUV5NnNJeHVqWlRLVkFCVlA2?=
 =?utf-8?B?cGxUQm15RUUyemU3aGZPb2t5M3pOazYyQmo5WGU2enU2ZGRzYzZZZk55Mnl4?=
 =?utf-8?B?RkI4dkNBVnJYckZHSHlUZGdhVUNNNjJ2d04zRlZoTFZldVMvamdkakd2S09s?=
 =?utf-8?B?SzNDSGZJT25rTTJwRC93NE5BTGpRZVljTUYwcFE1ZXBNYkpMdjRmMWVpbVBV?=
 =?utf-8?B?NTJkdjFOZ1dMY0QveG0zS1h1OFh1cEhyRi96OFBSNXYvazYycGF6TXpHdTlH?=
 =?utf-8?B?L045NjVabEhERUxkOVhxamJEYTBMNk1qb0lDTmFPMUdqK3l1Q3VMdXZjVnpK?=
 =?utf-8?B?R2RvWVZQWlU1cE9iUGhmTDBQbUZUOCtTOFJGUzJBTWRiWkxNaEFtNWVMUFV3?=
 =?utf-8?B?Q2JFOUljRnpQbDB4Z0FvWUo1dnlIUklPQzArNEdnajh1a1FEeTh2KytKeXhK?=
 =?utf-8?B?akVLUCtENjRpYjZQcytuMyttSkhXem9tWlBqK3VZUGtzUHdEU01yS25QektP?=
 =?utf-8?B?R2xDRmt6N0wxRmdhR00xTGp3ZEVFaXdFZWxsRVNJWHduQTU0WDJxbGw1R2Rk?=
 =?utf-8?B?M1FxL3EzSmJuTDQ3aGxjWlQybUJVUVpmeVpjNXkwM1V1MXF5WFdqSERvdVQ5?=
 =?utf-8?B?dEpiMGZ3MjJoZjhkZEtZVmNYY0ZFcWxERWV6N25PcGkzQVVsY0I5cjFUelMy?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d512a16-77a8-4f82-f22e-08de13163782
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:58:47.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5L2NbJbTZK4zlN864fmm1cBCviKb0DwD82c3oizUxcdyra2M65Ut8X33hCyMDByD4nxVF2GSwMGn/jr/n+qUQRFsejJwtB+riKgsO0aTek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6534

On 24/10/2025 4:13 pm, Frediano Ziglio wrote:
> If a SR-IOV card presents an I/O space inside a BAR the
> code will continue to loop on the same card.
> This is due to the missing increment of the cycle variable.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Yes, that's buggy.  Was this from a real card, or just code inspection?

~Andrew

