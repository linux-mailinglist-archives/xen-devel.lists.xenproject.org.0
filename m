Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKlrHa07l2l2vwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:34:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8589160B7F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236592.1539265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6z6-0001cQ-Th; Thu, 19 Feb 2026 16:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236592.1539265; Thu, 19 Feb 2026 16:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6z6-0001aF-Ql; Thu, 19 Feb 2026 16:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1236592;
 Thu, 19 Feb 2026 16:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=erNG=AX=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vt6z5-0001a9-99
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 16:34:35 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe2d5f3-0db0-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 17:34:30 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DM6PR03MB5273.namprd03.prod.outlook.com (2603:10b6:5:240::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 16:34:21 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 16:34:21 +0000
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
X-Inumbo-ID: dbe2d5f3-0db0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIhof0Mdo5snoMvr/m8l2X49lHkv7Oozw4sZtJtFPlOTnwkJWSYJvEcCSJOPZlWMUER8S5NoIXCB6KvBJPpZvFzWwlQ8FudeLzXVRCXDNV2wMU0GwonkPjmeKUvy6PvXTOMaEX/g025QgxD58aJ3kQ4eoc71Q0FHuwZm/eBhJzpCnuXh0vIRoC3QaBgy40rQ6cKMJZq/uhcjZ+dhP/qRG+Wne0h/pxFW0+Tx18ksxhziz60Y3MNMRWcDj3gz3qFPv4mmoqxQVW/L9UU0c6joa3jjo4pcIMTfEfCRSXylFzY9ri/eXLgGqf7Ui9nEWPszpKzGWjM97SneP3FvLgx7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFlvpKpYZ5wOfRey52gvC90Yc7wbRWfMPrLqgbfVZw0=;
 b=kddUZa+ci6Uwc9h64cW8Ec2DzXsEy2tafvzD1wNuejYIRVjUC3KrRuxG5Fwy3VjJeEfnhgcMJu+6c8pC7STtsmCpC+sNmJRHn1bYtPVV4W1fkdUQXosm5a+iLDUNE4D+gwbM+x0q2NG7xlJNtTBI7JiPdrPu+pMZto2sCsnufgyHG5ronMy2udVKuCf/xwjSrV4fCcaNA1zY1qRv0pxZxrLljxGC7ALLwtTA8y1tOop4DJ+5s2M1VlL/pmdiF4Z131iekb3nH+FywJ+2Vinu4N30k90sxD8fQPb71VHL3nsoqyCDfCaYUp/Q0DH16IyxZkbPx0D4R878LQO98VuUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFlvpKpYZ5wOfRey52gvC90Yc7wbRWfMPrLqgbfVZw0=;
 b=yw3Z0wlxB5I6FolQAJN4MRzbMg1gVma+BIcXR20eAQbWOdLuGeVPZtLFlEdWSCIkolzj3MNxB+Pf7MeeFOIITufg9h3HyUTPiKqLdbhn/a/vBmd6XLJ4A7QN2eAyHwvHN3BMk8ODhkYz0wfol56tRRpeZCcKN80zoDdKaJCRzrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bc783b8c-0133-43a3-954d-76c8c33da423@citrix.com>
Date: Thu, 19 Feb 2026 16:34:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 teddy.astie@vates.tech, jason.andryuk@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] x86/svm: Use the virtual NMI when available
To: Jan Beulich <jbeulich@suse.com>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
References: <cover.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
 <b4c0009eeee03b855321954135a37ef08290f640.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
 <3989d531-00fc-4a78-b236-1693fda61b62@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3989d531-00fc-4a78-b236-1693fda61b62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::6) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DM6PR03MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e50864-a194-46c8-e62a-08de6fd4bc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0lGVnhLRjlQRmNVdWhKU3VDcDBURTVDNUJKNGJPRVF4ajAzRVBOdDFMaEFz?=
 =?utf-8?B?Tm1ETnhDNDBkK3NDMGtsMWsyK3crZmlpR0d5Q054MzFEYlNuV2tFRUJUR2dS?=
 =?utf-8?B?cmMyZTRLWGFWdlVjMWdLVlB4QTRMYmhRUHB1ajdUQ3J5ekJSNWRUYmtDLzJI?=
 =?utf-8?B?Q3F6UEJYVTNlQVMyRU5vS0YvMDM0K0liNHFDaCtscnpxZExnU29haFVodzJK?=
 =?utf-8?B?bHhYTGhTRTdUVEVTVCs5ZzdWU2pvUDdva2pDTUFjcmlWcnJKSEFQbjhFYnZB?=
 =?utf-8?B?N2R3ODU3QUVjN2Q0enEvT1pLM1dQSnNUSlhZTHBiTDBjM1VHZ3FMNmZxcnJI?=
 =?utf-8?B?Q2wxL1lKOWlMQ3NqUHJMWmtTQ2pHUnpyKzJHazNFVFNLVTJkZW55U3RXajRz?=
 =?utf-8?B?QXYwYmRkS2VpWWNuOHVFcFZtaTFtUXNlL2NrMmFSdG1QbDZ5NSt0ZytXMlNY?=
 =?utf-8?B?RFFDTStzTUJrSlEyWTBISnlWM2dZQzcrQmVkcDVpNm5FSlFrTUVHdEhuRERi?=
 =?utf-8?B?QWlTaFFoUTl1U0cyVmcyU3ZRUlpqdmVCdEwrbHhOdW9Pb0xneHg0eGJZY2JS?=
 =?utf-8?B?QlM5WVM5TVFqbXF1YW9WNjN6Ti9BQ0RwZGRDdCtyZExVZlpVNHk0cnUrdHhI?=
 =?utf-8?B?N1Y0QjlhZjVEWWxSS2dBbGRuWjJvQkFsTjVFSVhPSjhacWJab25FVjZRdENG?=
 =?utf-8?B?VzdBTTFKS3R0N1FNTytFaEF5anFZVWx3QmRHUUpES1o1WVhqei92Zm1xZkdJ?=
 =?utf-8?B?aFVWNEZTa3JIeEVGemdxTDdXUjdFbFpHZk51djlUUXBlcDBHallLK2p2cThx?=
 =?utf-8?B?K3pFa0Rxbmt5Nk9tOHVGb3lPT2M1RmNQdExxbVE2M2NZVjVuZy9nVGVxZER2?=
 =?utf-8?B?aE1jNTZRQU10KzIzbklTRHhrbENhSStFcmlZdGJjUnhweENqN1lzTXYwUTYv?=
 =?utf-8?B?VzRwSnRQTTAwY0YrL0dUaVlWQnNkeFVBUDJhcWpSWUJzamt1bnNqM3RST3Iy?=
 =?utf-8?B?UE1iRXh5NW9LQi9DaDB4eFZzWnQweTZGYXFhNTRhWUJaOWM5dTUyTzQ2WldN?=
 =?utf-8?B?QTk3U0xWYkdsSlZlWFBXTTJxMnhZeUdRa3FHN0hyOTFPZUxvckY1Q0loeldm?=
 =?utf-8?B?VVRYYVMzRlVIdUlPY0tsTXM2L25DbkZ6SmxhajVaYjgwTGNJYi8xQVRJRHFl?=
 =?utf-8?B?R2kvMWZWRDQxQXVXSndyOGN1TkhPem5sbUtvWGVnSDdGa2x4L1huRzE0amZr?=
 =?utf-8?B?d3JDZVVCMnNkNmxUVEN0anJzS2NxY0xId3BFcTNUZFRjUlBhR3l3UjFxWEdW?=
 =?utf-8?B?QVFQOTIway96dWxiWnU4VEhNWEZ0c3hUKy9vT2NWeklYa3lBcStaY0daZ3pt?=
 =?utf-8?B?aCsrVDNKVnd4Z2poZlRNenRCRzIyeCtzZzUwbjhKR2h6QVEvRWQwamh3U0NO?=
 =?utf-8?B?UnR5d2JTSVBSTnltT3puUEZzM3dDL21Ubjc4anFpeFlLc1Babmdpa1BpUEp5?=
 =?utf-8?B?TGIwNnpsRThMd0locFo2ZmpEUnVNajdOVEh0ZlBveS8zL0dUL3NRWmsxaW9R?=
 =?utf-8?B?ZFd4aisyZnpES2N1VkFpaFZnMHZBZ3NubmFXYVIrcEVUSWY2aFp0elVqR0RS?=
 =?utf-8?B?Ym85N05zRHp0YnV1OE5VdTNWT3FQSFJnZ3dUazdyNXhTKzRtV0hHcnFzLzUy?=
 =?utf-8?B?bllzNDBNK0xmZ1FMbkN4aHFvcGtjdTQwaUk1SmlYMjRzbVVXbTVsWU1pOWRp?=
 =?utf-8?B?UkdGNDBFTVNmUU9ETkhFK2E3MkJMc2FjT0JTRElWK2N3RktqQndTbDNQWVAx?=
 =?utf-8?B?eGZBTDVna3V2NDVwYzFRSHBPWmtXNnNKU016MHJqZ3Y0N0VCQ0Q1ekFKMHJZ?=
 =?utf-8?B?bjQyRkdqcXM2YXFrcmpiT2h6NE1ZT0J5TXh0d3Jwdm4xUXpsQmtad2VRTDZP?=
 =?utf-8?B?RHlZQVUvY3lTZk9YUmNrdmxpbW15d2JueTFaTWZzdEI3U1VVYlVPQ2cwNjF0?=
 =?utf-8?B?bFlqSmwxajRpNCtOMHlFYkJLL0VVTm1VMS9MYms0Z002bU9jbXNiRWVLWDd5?=
 =?utf-8?B?cXlKeWlja0FjdmtYUXpBR3VrSjB3Mk5YbGx1REpqUFNuQVY4UVc1ZWhVc1NK?=
 =?utf-8?Q?rUQk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VuOSsrTlpyeGIxTXBRckl4K0R2SDdZRHJQQ3QrUElDckRUVE83OEdnTWJJ?=
 =?utf-8?B?bHNEVC8vcXVOSkpiNEwwL2ZBL1BXTzNlK1JpRUROU2tNN2Y3di9IbkpUcm1p?=
 =?utf-8?B?RTRDT2FUZEg5MHlkL3NqcWdMaFBQRHJZUGw2VGdqTml2ZzNiKzQ3RS9QK0g2?=
 =?utf-8?B?Q2ZNZ0d6N3RjdHhpRldmSjJZNVN0Y0htalJhL0lJd2RyeUYxNWRoVENmZXNh?=
 =?utf-8?B?b1k1RlFOd3MvcVBGcksyT21Uc1BvUERPekJrZW1MT0hRNkdyenNOcVp3cGlM?=
 =?utf-8?B?YjNXNzJiN1h1eEVnZTJPNCtPd2RLVW9qTDVBdnE5Z1RlenVyWklZVG1LampR?=
 =?utf-8?B?UkQ1dGJVMEZRVFdZd01CaSsrYXd3QklWdS91U043Q0tVL1Vtb0N0d0dWZlVP?=
 =?utf-8?B?MGx1UldpN0hIMkV2aG5QZGJOTE1LM2NaN0dNWXRObkN4TUMzK1FsdFArUURm?=
 =?utf-8?B?WmlHYlZ0ZjJpcjVXeUJjWEJIMEVVTEVEdkpsY0xMRmkrUC9SM3k2SEdyWHBv?=
 =?utf-8?B?VFZadlVZTGg1MDJBaEx0QzhrMGFoZ0VPWTJGcVZOWWMvWXdlR1RRYkpZaHJM?=
 =?utf-8?B?M3JZK1ZpSDlTY2o4MUdpYUFaYmdneEFUSkJ3Skx6RDZ6TUR3NXh0RUJVTStH?=
 =?utf-8?B?QVMzOUs2VEJkc2M3WXArdFJKUEpYZjFZSXh1TXBTcXNvRTA4ZkRKc0NibS9T?=
 =?utf-8?B?YUZqT3IzTnVNUnN6MTErcVh1aWJUeHMwWmpCY2I4OE1GLzJRc1NzWmcxd0hI?=
 =?utf-8?B?dVk1TEZQUU8rdnpUZkRSR1l5QVpzUldtVnFZdGZ6eGlDLzBDU0NuTU1raER4?=
 =?utf-8?B?OU9jM3VHRkpwalJ3QTBNYWF5ZFA4eWdSRm02ME5WOWZzRS9uQlpyK0RJNWJ5?=
 =?utf-8?B?d0k4NWRGYW1rcWE5Q2I0UHh0S0QwMjR4ZWhac0FyYVVQUVVabVhhMjJhS3ZV?=
 =?utf-8?B?V3VRVFNaVnFraVNwYnd3ek5TQ1U2TDFzT0t0dVdoSmFIY2Y1MFVMYkNMakUw?=
 =?utf-8?B?ZlFDeXpFRThRR1lLL0F5Yi8zRmNmV2M3WExMTDM5dFFHdmx3OXFwc1YvK0VC?=
 =?utf-8?B?c2FucWlqT1gxMEc4RXlpWGc4OVg5QUtBVHlKbkE4K1YwOTViT2dydUMveERX?=
 =?utf-8?B?cXhwOTRvUjc4OFpja2sycTVzOThwZmJGMGVmNjFhcUpPdjAzVFJmdFo3MXc0?=
 =?utf-8?B?a01hNEVlbjZrcEMySHlCMzhFV3Q4YmtkOXZEazZsVlNYRVBKR2xhakFVdHly?=
 =?utf-8?B?NkxKVjhRM1ZtOUc0OUxsbGRFSFdoTExjSmdid1YvN2I4ZWREeUk5VE56d2Vq?=
 =?utf-8?B?dkFsMVAvS2d0Z3VXdlNib2Q5aFpCNzc5UzM3VnFOeVdNQ250K2x4TEJXTnpr?=
 =?utf-8?B?WnRYemhjZy90ZXdPOFlocTZZbDdVSHlMOWFOd3Q2eGZoTE1JT0RoVHZpUjJW?=
 =?utf-8?B?TDV3U3dlUGVnQ0V1RWEwZnN3NkJmblVuUEJVVnpWQzNvbFVkUmw1eXo1NUxo?=
 =?utf-8?B?eTFZbTIxb3c2VUhWUWNjYnJuMGNxcERFalZJSkhFaWJhSmxyVU5YYVFNS09s?=
 =?utf-8?B?YW1YSWg5S2ZOb3d2QW5Yd2RBWCtRVENtMXN4OGNtUzZJRDBNQmFySFJDVDFV?=
 =?utf-8?B?UERsQmFLUGdKVk1CcHBSd0QrSjNnNTlWUXJ0VWwwcVRPaXJOenk3V1VNZGNF?=
 =?utf-8?B?R3E5eHJsMkxzQ0dHbUEzQTNqMXorMDcya3MzKzZnbVEvM3lRc3BtMHJaRklK?=
 =?utf-8?B?dFk4Z3hYNmhBZlhZMUJVT3JRQms2UlJCakJnRmV5clMrTFVUbmE5TVkyTC9h?=
 =?utf-8?B?azRYRDFvZ2RabDZwMk5adGtUdHVqcUM5YXFpbXcvUzN1a2JPV1VGNmJHMGk4?=
 =?utf-8?B?d3ROZ0xBZituNlFUdy9oY0pYaHplRXgraVFRSEJRTVE0QlBvZmFYZXFxWVFO?=
 =?utf-8?B?OVJZc1V6SXh1bHdNbHdidFpiWVBxN2lsYVdPUXI4cjF3ZUNQSnRudlVQR3Nq?=
 =?utf-8?B?MHRXazZlaU9KMzBIUjVNdkU5Y2F6S2VUR2ZaV3Z2ZzNCWkpSNktaTTBjQWRZ?=
 =?utf-8?B?SWY1MzZzUXg3RXgzYWsyVkdjNkZkTHhJQ0c1VU1ld0VUK2pyVVU1ekRWSVd4?=
 =?utf-8?B?M1VrZ0lpTktQUEl5MVZpMkNwTENzajN0Y0xQS2VNc0MrRmtGWmxiVGo1Tzcx?=
 =?utf-8?B?QnVwQXV3QzFxN3haRmpxS3VxN2doNUlSenB4TjA0dVZOZDBjaUFwZnJMRkNH?=
 =?utf-8?B?b0g1UlVUdTVkKzJoaWhmck0yeUdHYlhhSnFrcllDTFRZRDBlanZ5ODN2d2Z3?=
 =?utf-8?B?R1BVRVlpK0RwZHFmcnFsbGU2bUUrRWtTUkRLUEJJVHpLTi8wTDhXdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e50864-a194-46c8-e62a-08de6fd4bc45
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 16:34:21.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i9Mc1MFhcpQX3YYB3jkfkNugx0GSDSH5+9Ho5IOeM7tSqzSbygwEwFaJQTJBJW3vPVPR/lzHgIRMK1HV+tlTe1aBQrnSEBIt+lC410o2ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:abdelkareem.abdelsaamad@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C8589160B7F
X-Rspamd-Action: no action

On 19/02/2026 4:26 pm, Jan Beulich wrote:
> On 18.02.2026 15:48, Abdelkareem Abdelsaamad wrote:
>> --- a/xen/arch/x86/hvm/svm/intr.c
>> +++ b/xen/arch/x86/hvm/svm/intr.c
>> @@ -33,6 +33,14 @@ static void svm_inject_nmi(struct vcpu *v)
>>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>      intinfo_t event;
>>  
>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>> +    {
>> +        if ( !vmcb->_vintr.fields.vnmi_pending )
>> +            vmcb->_vintr.fields.vnmi_pending = 1;
> Why the (inner) conditional?
>
> Also, as I think Teddy had already indicated before, might we better not use
> the _vintr field directly, but rather use the vmcb_[gs]et_vintr() wrappers?

vNMI is not covered by the TPR cleanbit, and needs to avoid that
setter.  This register is a complete mess, given how it's grown over the
generations.

Leave it opencoded for now, and I'll see about cleaning things up when
getting properly into the nested virt work.

~Andrew

