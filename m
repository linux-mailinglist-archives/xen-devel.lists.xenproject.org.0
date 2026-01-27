Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NIsNQTjeGkztwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 17:08:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C4976CF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 17:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215059.1525308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklc6-0008OX-Gu; Tue, 27 Jan 2026 16:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215059.1525308; Tue, 27 Jan 2026 16:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklc6-0008LT-Dh; Tue, 27 Jan 2026 16:08:22 +0000
Received: by outflank-mailman (input) for mailman id 1215059;
 Tue, 27 Jan 2026 16:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vklc4-0008LN-PX
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 16:08:20 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 640da576-fb9a-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 17:08:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6065.namprd03.prod.outlook.com (2603:10b6:610:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 16:08:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 16:08:12 +0000
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
X-Inumbo-ID: 640da576-fb9a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph3wXWf/Km5JyW4B9l2zB5nCk9yMMAA7kHh9VlTZZO3xLT0wa0AM/JrF+qI3aGW3t36w8ldPAR738w5Hk9N1eF6xvViNQy2JazJs+xEMPLzDgpR7coqWvmbrRvwX3dauBkV5L+vxO7zINLb/Ssb2dpqxkvim76LHS/e55FDX29xHLBJDSKPrxsc64BcHDtSgRgGbEnLeNIqhJTabZfa9tDJWwbn+11kkkjAPqvqhE/SxeVSOZTu6fQz5ZrXSm5tLVIhsIkPfTFllEc5P66lCJrrGgpBcFJ++GkdSUqlFQ+hgnI+z7auLdyifs9U/+s3UkyUOfugMba8bpdldnIhSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIFjJ0+wSlEkcmh3lwvhi0bhBMLVdMgxBU+zPBmoIFo=;
 b=STjvprOuJMQTkCeKzcO5bUVxJrP+CdsQscjYXRtH+088B6G5VTufLlLgedH/ohORThBnhhkAjIqTyvX8EUQr2x6MHmjggx1eLIuc2GbOIyA6Qio9Gknvy3bwOuA7hYV26CsJ/miIlp3pgGjWlH0aGB0eblg7f8GnzVI5qTQkxA+ApJg+3RIcp/o35S4swksy4agfn3vWk+nWdHO4K5L67IH1Il9WRHG3WVFI4IjZ0Gs+2V3+idMD3SjifD8loiUGa4GWrqS9LNeWbUOiozPqbBj0rmAUC0TtzvIRX85DWr5jMSNi19PXM024Z/02mVXUtr7gmZER6cgdIOWfxTJP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIFjJ0+wSlEkcmh3lwvhi0bhBMLVdMgxBU+zPBmoIFo=;
 b=nX4fdvhTrOSkHL5MQjsO7P7KPtu+3VyFbTEoGzMkCzvfppy4EN4BFjJ+oJOo/XLbZ/VGkpzmDhOBHbdgiAxfw/234csAFTnP/zpFV1Ljd+O4Cqad0sM+vhWLze/sxxdgP/UQINoAO/FrDgz5GoEkTiuDCTyCVmLhVcB3Wssjsvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <639a282d-4b1c-47df-965f-1df8f38df170@citrix.com>
Date: Tue, 27 Jan 2026 16:08:09 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/ucode: Support discrete modules being CPIO archives
To: Jan Beulich <jbeulich@suse.com>
References: <20260127143456.2260369-1-andrew.cooper3@citrix.com>
 <261128f5-1528-4a45-bded-8d18d6682a56@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <261128f5-1528-4a45-bded-8d18d6682a56@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0497.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe42426-07c8-475f-7850-08de5dbe45b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGNpSElwQUZIYjE2OFZaRnZZcXNyOUxZWGhyNEl6aVpkUldYdUg5UlhnMERh?=
 =?utf-8?B?bXd5a1hPRGNqNWFsTk1CT3IrYzhhUlpqOW10RDBPRUJ2NXRsa2NPK0RqZkxJ?=
 =?utf-8?B?RHg0bHF5N1Fvb09QN1JReEwrdUV3UGZBcVlySmlYSEY0L2JHTTBXNVEzRytF?=
 =?utf-8?B?bjRSdElLYXhER0JnRlZlaWhBVjM0YTNrSEpMOVVETXpTb1U4T00rYWQxVW82?=
 =?utf-8?B?NjZnbFE4VzNwR2ZSbGE3MHdnM0FjWDBYYUh4RmlWVUIySFMzSmJvdEZVbk9h?=
 =?utf-8?B?R2prM2NoMUZTc3QvWU9CTkxGQUhOa1c4Z0JtRW9PUW5waGRab0VUbzlqbHY3?=
 =?utf-8?B?QW81bVNxYzdkQ0hkK01Nc2VZd2R4SGw0YS85Vk1lUHRaME4wUE1JR0Z6MG5G?=
 =?utf-8?B?em45eTZrSVpaNUwxN1IwcjR5TkYxVlRZMkpiMDZaNGFMSFh1VTBBaWxnUTJN?=
 =?utf-8?B?SEdKaFRvSFZjRXQwNG55NWYyTWtQTVpUYzJjcS9GT0VsRGpOYmtHSzJvUGR3?=
 =?utf-8?B?UnNBQXdlSlBlN3JZdmJ5VnJEbEwveHRnVlY0a2k2UkM5ZWtEaERRZUd6YTFY?=
 =?utf-8?B?QlE0Z0x3MXRlQzlXbmVjSVBUSWlJQW83bHRyWFhnMFRLb3ZtQjVkZk9RbDlO?=
 =?utf-8?B?aEZOZEduQXhtMkJqallDbUZzd20wYjQ2bjY1Mm5wOHczQmM3ektGVHF6NlVC?=
 =?utf-8?B?dXZodjN2dVp2SHptU2toNDRlS2N2Yi81TnQ1NTVRaFRoSkdLRTZ0VWhVVERM?=
 =?utf-8?B?Q1d6Mk5SNXdaQjJ6L2VvN0tGam10Uk9EeUpGYThSdG1sMGJObi9SSEY0Q00v?=
 =?utf-8?B?bTF5QnNNdXFWTm40Yk5TektKa2N5YWR0cmlheDl4eDV5UEVXaTdhSjRVbEE5?=
 =?utf-8?B?MTdmSjBxS2pxMUFDR0owT2FJSHphcDV2RjRLNlZIaWRid2h6L1lKYjFFZDc0?=
 =?utf-8?B?bkloa2RaZlVIck1mNkZCZHAvZXFjSm94dXlYRW9uYmNYS3VPeWFqQTgyUVdJ?=
 =?utf-8?B?STZ5cWE5bll4WHdZd3BpKzdob1BqeEdvbFZDQklhdDZaTE94OWJHK05OSzlS?=
 =?utf-8?B?S2dKNFlYU0wwWUU5QmF2ODJWUGtNazFaWkxSUFNnL2N1NG5aT2FrSXlGVW5O?=
 =?utf-8?B?NG1UemtkS1BzeU5kejdXc041SmZQVXpSTUZMVWxSSHRndFkxR2hZWkJFc0dr?=
 =?utf-8?B?bkw0eTBrNklkTzI2U3I3S1J1T0ZTdkRKRFoxMHVjVW54V3JZTWlVUDNpTUtD?=
 =?utf-8?B?di9JMlpqZWdQY3N4Z3ZtMHVkOXZVMVZpTUkyZm4zUmJ5VzhPQjI0c3FBazFO?=
 =?utf-8?B?NURMVk93UTZXeGd6bVdQOFNvSUtqajhFRjJlS0JHQVFVY0NwcGhVNC9CNXpQ?=
 =?utf-8?B?Qkd0RlQxZEdrdkJ3QXplZE8ySlFnbllTSVV3Nkc4ZTB2WkRENU1pQ2JXTjUz?=
 =?utf-8?B?NStIOXlXQzR6YVQ3dUdFcy9scjlEVzhmOXFPVlBjKzZ5KzluSTVSRHY3Z3ph?=
 =?utf-8?B?a1NXd2NVcURoNjNRS1V5NlBSMlZqY0x4MGY4cnlXTmlpN2daeVVyZFYzYW5N?=
 =?utf-8?B?T2Z0Vk1sT3lvcXM3QTdCaGtSblk5YkdLa3hZbEJGYThjWjFwbks1V2pEV2Nm?=
 =?utf-8?B?NUdhVWltSkFtc1pRVTJjZEpSOFdNMERSSWs1a2NEZ2JHNlFVaEhialJ5RUdm?=
 =?utf-8?B?WkcxR0FYMUV0dE03ZTAvcThtRlRXM243My9pQkc4QnUzYktoNXo2TmdSRm1S?=
 =?utf-8?B?RGhyRzlwUktUd1cwMHh1Q1lBTTQra3FONjRxY210YU91ZmtFYXFzQjhudGxH?=
 =?utf-8?B?SmlqZGN5NU1Jam9DWFpNYnJCQlYvdGZnUVRzRlJTNVgxMGV0QWZXcU9Cc2dW?=
 =?utf-8?B?NXJpZ2V1S2p0dEcwbjlrQ1FSK2ZJbzRPbWYyYUNFSFlMMWJDdmxsVGQ1eWcy?=
 =?utf-8?B?eVBqSmVCcWJuK2N4Y2JUTGFsZC94ZGFaRmZZaEVSQkNhdWpiY1V1REVuTVVh?=
 =?utf-8?B?THM5MnpOUmw1a25IUFZpTTJNTVBMdnJ5RDRqOGlLeWdTWWRnSlk5YTVLL2h4?=
 =?utf-8?B?VDE4VVNnTUZUZm9PaFdvWUhIdmFYUElJRXZ4bDBlVWsyZWhHRlpKWjA0eGRo?=
 =?utf-8?Q?LSng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVRIZ0Ezb1FnSld1WkEwczY5cmFlSmxJaW9XYU92MHlWS2loY0I2Q2hMS2Mz?=
 =?utf-8?B?dXFmRjJZOFM0K3h2VkJVRldIeHBSbnpRSEt1bXFHcnVtYXN4NDRwemxhWFls?=
 =?utf-8?B?bWNPYzhidE9MSC8xaDNEQWhyL0h1cjFidU9JdWJGRS93bjdja3J6LzRBam85?=
 =?utf-8?B?Qk1NeUpGZ29FOE5qTENoLzREbFBmdyt6ZUhnM25mZGZvRUI4UVFHVWJWZTN0?=
 =?utf-8?B?VjAvaDJWV092MlZyTlY2L2lsN0cyS25na0daU0x6bFpTa0pxT0NNaEdwYW9w?=
 =?utf-8?B?T3lrM2JrRkNBR2Uvc1hKVUJwbngrYXk2V3V3SW81VmJzTmJoTmtOMjlHNW54?=
 =?utf-8?B?eWlZTUtzMGRCTFhHcWsyb3l0S0hSYTZSOUVtUFFCVE82Nm8vcVIzSmNZS0Iz?=
 =?utf-8?B?VEczb2w3c3p2cXBQbWkwL2hNUTB5dEZMeXk1bVZZSjkya3ZKWlRPd29JMVJX?=
 =?utf-8?B?cEk0WWNZWnM3SERabGFFbFhrVjJpSlVzS0dSUWJwVnl0ZEpPQ01uVXlCQkpF?=
 =?utf-8?B?ZHFCdE5NZVYvdGpCWUFPeWxYOXlpT0JPa3draWtCeEdYbVViaDhWOFlUT0E2?=
 =?utf-8?B?YmM1d2tNWVVPcWdObG1FV3QvSHczcjBNaHRDaDkvN1dTWDhRb2J4K0EyL2ZG?=
 =?utf-8?B?Ky9zU0VpU0ZhTHhIRlhyVGZkYXZRQUdEWTI4QWI2ZXpiTzBmeXg3M2xodnBr?=
 =?utf-8?B?U1NCeXBLVmR0cWs2R29BaW9KU2F3L05PK01NbTZoTTBMYTBvU0gzay9TaHBt?=
 =?utf-8?B?cTljb2dMV0c2MmlISE5UbWRtT1FFY1pDeCsrdXFNditaUE5UM0pCVTd6cy9v?=
 =?utf-8?B?OGE2a0ZjVzdOVWJtamRrOUdXY25wK2Z2ZUJibjhtUXdpSGw5andlL0ZDcFFz?=
 =?utf-8?B?N1JkTWhIN0tKd010R0VPMXZNN1E2Z25lVEpIS0dybklOdVpWTVJhbkxIZWhy?=
 =?utf-8?B?Z3Qrc0dpdncwZjJxcko2bTB4ck1YT1NDTFlLQ1JuVklEM3JnSTlXcVNocm5n?=
 =?utf-8?B?YU1sYVp0VC9CcXhremFMWnJtUGUxMWJrZG5iZVptem5QM2JLOWI1RzZTaGUx?=
 =?utf-8?B?RDJnNTk0bmZPMTg3eUs1c1V2amlwbjc3U2UzMnJGdStxWmFjVC9uNS8wQk4r?=
 =?utf-8?B?TnVDM1dBd01NNWlCYVdCYkdDSTJqYkZzSWlCQkczZFFjQkJ1M3hDZGJoa0Zs?=
 =?utf-8?B?dzlNdmQvOUNOV3hOSzlSb3FHTWV0Z25DazhmN3dUNUFhbGlWOGRKVTIyRVNx?=
 =?utf-8?B?MUQ3dG9PZGNuYUxzZEdORHVZbG5xS2U2MlBOQnZWT1FMZko5OUIrTGhOM2lG?=
 =?utf-8?B?ZUtuaDhwRk5uaCsrQUNFTGMzcU9CYjJWZWMybFNoTUtWZUhDWlBpQTloNlZz?=
 =?utf-8?B?Z0dVVDY3bkZWejIwVktBZGk0bFZuUzZJbWdEbGNaeWlnN0pYV29wbHR3a21E?=
 =?utf-8?B?M2c2aERrZ1Nvek0zYU91UkRFcU9HZGJZVCtLeVdYRlJpaGVqR1lhM20wamdU?=
 =?utf-8?B?VHpZTDVJbXppei92bENIeEFybmRXRHQxQ1lEOGFNWDloaDZHMXUwTHBmTjZB?=
 =?utf-8?B?Q0RZTXVYa2VFTzlnRDd0NGdZVzJobUZiU2s5dmNTZTVzdngvQXZPN1VxSmJh?=
 =?utf-8?B?cjdEdW9FN3piQll6UHRLZFlaMzMwMlFOM21uNHpqbmh0Uks4cTBReXk1R2dS?=
 =?utf-8?B?R3ZBek5ON3I5RDdPdWhXOUpKeERVcG04YUZKMmczQjVneStKRkFjZ3lFWTZG?=
 =?utf-8?B?SFR1SHIrSUE1UVVGTzRvN0NSYStoTUM2enhvZW9MZUpXWU5LTHJYeXlaQk5D?=
 =?utf-8?B?V0MwSU82WGJzY21kTlplMGpHaVdLUGRNdjd3V2pMcWthdWE3dVk0QUgvYmJ2?=
 =?utf-8?B?NmQ5VHVzVElGUjJtODRNWFhQV1g4cGc4MWRMRlVQQTRHSmhUZGliNjVFWWM0?=
 =?utf-8?B?eEE1V0l0VzRDb2ltQW5ZTXFwNDZqK1F2THlCbHpnVnpDbXpkS1hMWDlxVGRu?=
 =?utf-8?B?Z3VhR3N0SmhDZWNEcm9rbkk0anR5RkdIWWR1NEgrTjBiSklPUnBHZTdZb0Mz?=
 =?utf-8?B?aEZWaFM1Mm1SRVk1OVFmWE9uWGZ5NTBrajVWUEkwZXlrOG5INkZVNUQxaE0x?=
 =?utf-8?B?NlZTSTRwSUM5UFgrdENva2d1T0dCVWZPUVFsUzNsQ05oKzdsZXltTGhVS28v?=
 =?utf-8?B?d2dYMXpyc0xBUDQzVE0xRHRzTkZCMmcrdTJvOXRvNll3N1NoN2tIb0JlY3pi?=
 =?utf-8?B?SWtzNkJQUFdtT0NvRVJFSXdMaDQzTFFUWnRoT0NaQ1BhNE9lT0ZkTUxLeTJM?=
 =?utf-8?B?dWdUZStjT0xsT0VRc1FmVkJvN1Fib1ViOXZUNlFDU25zNFE4U2xqUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe42426-07c8-475f-7850-08de5dbe45b3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:08:12.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5mk8+I6DdcwMSAHqg/f6lqXHQSyfZblc0GLI002p+DTShOTAduNw1uHcVJSglHaI1AkaS77gUxRMZQ4Eslx32ctaOJn2Y10YzLfedeZ8uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cd.data:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 378C4976CF
X-Rspamd-Action: no action

On 27/01/2026 4:00 pm, Jan Beulich wrote:
> On 27.01.2026 15:34, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -760,6 +760,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>>      void *data = NULL;
>>      size_t size;
>>      struct microcode_patch *patch;
>> +    struct cpio_data cd;
>>      int idx = opt_mod_idx;
>>      int rc;
>>  
>> @@ -776,7 +777,6 @@ static int __init early_microcode_load(struct boot_info *bi)
>>          for ( idx = 0; idx < bi->nr_modules; ++idx )
>>          {
>>              const struct boot_module *bm = &bi->mods[idx];
>> -            struct cpio_data cd;
>>  
>>              /* Search anything unclaimed or likely to be a CPIO archive. */
>>              if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
>> @@ -844,6 +844,18 @@ static int __init early_microcode_load(struct boot_info *bi)
>>                     idx, size);
>>              return -ENODEV;
>>          }
>> +
>> +        /*
>> +         * If this blob appears to be a CPIO archive, try interpreting it as
>> +         * one.  Otherwise treat it as a raw vendor blob.
>> +         */
>> +        cd = find_cpio_data(ucode_ops.cpio_path, data, size);
>> +        if ( cd.data )
>> +        {
>> +            data = cd.data;
>> +            size = cd.size;
>> +        }
>> +
>>          goto found;
>>      }
> Doesn't microcode_init_cache() then need similar adjustment?

Hmm, yes, but we can actually do that by setting opt_scan=1 here and no
other change.

microcode_init_cache() already has the explicit index to look at, so
opt_scan really becomes an "is cpio" flag.

~Andrew

