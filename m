Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC6B26C80
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082063.1442000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umamR-0006ep-UW; Thu, 14 Aug 2025 16:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082063.1442000; Thu, 14 Aug 2025 16:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umamR-0006dM-Qz; Thu, 14 Aug 2025 16:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1082063;
 Thu, 14 Aug 2025 16:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIeE=22=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1umamQ-0006dB-05
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:26:18 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ffeb630-792b-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 18:26:05 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7876.eurprd03.prod.outlook.com (2603:10a6:20b:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 16:26:02 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 16:26:02 +0000
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
X-Inumbo-ID: 5ffeb630-792b-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3VcG2FLnDBsoqRH3OKIZtNQv3TZeVHln6FeISTNEMNumTT67Mw/3GQyFUulcfCi6lPJJpe4OS2dWmDl2BnX6g8IaBwRR0E5NsWyMO/WBxP12FlAJ3aI17/ntUKw4bxAoyWU0k2P7U3K5DXS3dHxn0l3yTwDa+65Z4pwCWBn8qmBm5ht9+GUHuUq2yRLjy32kfgsd9qMpuhs2gQ1nOiIoSgCzplBqWA9WKgXYMcYno7SJuGgWPGmHTYB0X4jGbnx09GbZRgfs5BszVbwLDz2LzTduWa3i+W8+Lme1cxZO3UDdY8XEktSReBYScQ2KbuFakNdkjsX63EARpQ0H+8CQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F478Q9e3gaDQOqrkaOFUq/H9ZEdGMrm4ZTXBXrpOjv4=;
 b=MK0u9Dy5/7uij+VQbbdLpzEyIVl1uUbRBXp4u8JyknG0AVkm9dBnINJZxgryl0Zngy4r4tKU0chBjBOzD+ej0mzZXKo59T2Kv72m+eXqow4cjS9XE9NhOcH+aPIBymlIqNbTyzx0m4r4s+eKwbJcynanfmgQfaeYd2zPITHDIDp5JRc06emcVqf72MgUJajRCLSnS2pCoAUIi7Xtq5HnWuBOqbNHcVZICVAw0KRORzhJQIRnaRxLQAHRlIqyQ0FpFN1kuSmHkORteNVpnnY8Le+FWUfBBdLy4AmXGmXsRGaOI1kzevREiCIKom8yZyiq8KH9j1++MhV5XL50NHy2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F478Q9e3gaDQOqrkaOFUq/H9ZEdGMrm4ZTXBXrpOjv4=;
 b=M15ZsaTat3rsIVEW4xVBq/Ec2Md0nP/++1icZVHsnZKGXvc44WLUbuLfiKkSRjI+LpJJ0HsBw5qnQp5vcEkDNoEWN5FlfiTv/BTY852W84jLI09xr7pnteI75dXgOR1nlSdBfVJPBgnezDEtoJvMmHj/UeBzMLBiu7WQYTEx6dhXAHr+qilbwvTOjmuF80H8ApVW2uvHLXJ/2f3bjThUQingZvXD7tuLX/XNRd752ohKoCSXbzVtKEUGx5zw38K+bJrCuWB8GdxqhfcJ42n5Hg+CQeTITrXPhQ59pjR/0PqqePligdMZSXnrybKWYDNV1ngIRc6mCr/PsSCrOuf5pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com>
Date: Thu, 14 Aug 2025 18:26:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::26) To PA4PR03MB7136.eurprd03.prod.outlook.com
 (2603:10a6:102:ea::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR03MB7136:EE_|AS8PR03MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 11777d18-8f49-4ef6-9697-08dddb4f42a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm43Zms5aEoyMFpRRDVwMXBCRldodUxHbjVmcFRrMHZ2YjluSS80K2VLWk0r?=
 =?utf-8?B?NnRYSk82YWc0SmppSTVBTVk1Y2xGNkxVUDhTL29nTm1la3lIV1VuKzRTY0Q2?=
 =?utf-8?B?dUt5U1dCQmpVZGlaMTc5cG5PVE9PSVFadEplR1ZCWjN4aXRGdXlQSGhENnpk?=
 =?utf-8?B?SFMrclRVSnBibzVkSGRwbENxUmNrUWsxNmlmZlRvdEZ1a2xpc2pYdGFVSWFm?=
 =?utf-8?B?MmJra04yb3VGam8xajBlT3V2bUFaclFpcGt0MGJxNkVYVmlnK0ttRlA1QXIy?=
 =?utf-8?B?Uy9lSzQ4SG01S3BxdEJXVnNRY0RlUTA1TkhHZDB5dGZGOE9xa1d3ZUsyQ2lz?=
 =?utf-8?B?ejNDdUk4QkpNVGxRbkRYVE1rUU81UjZ5OFZZRldVNTNzazd2d2ZDM081aHQ0?=
 =?utf-8?B?bVFaMUdCZ29KcGU3VmVoMjh2RzNpNHQyelZHZDBRVngrTFBUaEZySmpSUUxB?=
 =?utf-8?B?UWZBMm16YkJqNTNDaVN5Q0NEZmtEZis2dFgrMWUzUlNneGtzcDAwNEN2QTRj?=
 =?utf-8?B?eklBZjdtQTBNdlArVmpndlpmeEd1ZEJNazRGZ3FpMkJZc2daRVlTdSswT2Mr?=
 =?utf-8?B?c08zSTk5bE5VeEUzOWNuOFdnanl6N2R2TFMxMkdYZGNyT1RjRUp3SmNlajNr?=
 =?utf-8?B?ZVBkYXFCZWkrdW5qQmdUUk43TXFESzZtRUcxamE3WFpQTDVJeXZMeWN4V05v?=
 =?utf-8?B?aWxQNlJiVU5GMVpDTStsTTc2R2d2cVA2dnp2Q3pIQWFkWTVJSzdKSlNaMHY3?=
 =?utf-8?B?cXJ5QmdaVUdiRERTdjZGWmkyVUlyRTVzYnZ5MnBBTG9aL3NSS0NqRFFpeTd0?=
 =?utf-8?B?SkU4UWVKMEVXYlJnV0dhUWpvVldGa1ZOUmJDNTlIc0lzUWNianJJbEF6K3c2?=
 =?utf-8?B?M2RFczVKRUo2SXNrZFdCYVVGcjVxdjF1VzV6Y2ZvblYrZDN0Ri9FY2lSTlFI?=
 =?utf-8?B?b1UvQ3c5YTNrazlGSGNPYUZyMXFrdjhTUU5QNFhPalp1SVdTY1JpcVFmTDZE?=
 =?utf-8?B?YnE0K3NxMjd4bVRnbzhDTVZHeU13SDc0WDZ3azREeHI4QTFpT2VPbktvS3pY?=
 =?utf-8?B?NXBzc0lockFwaWVrNERoNmVOc2RPZzBra05ISlcrWUNudjBWNUZhWnlUejVQ?=
 =?utf-8?B?MHJNS3k1WU9RdmthKzZzNlBIQzhWRE1Udk1HRW1uNTZDQnVmWjVRVUxjdVpL?=
 =?utf-8?B?VG9oeGpwaUd1SHRjS2RHa2tZSVE5NlY0cFRidHN1YjViYlpLMjhCbjArRjJt?=
 =?utf-8?B?dHlLNm9LdnZNWUhjc1VxMjZOOGMxdWoxbXdFZ1habFd1b29HcTJzRHFWVnJy?=
 =?utf-8?B?NnNHVEdYVWM3dTlSVk9DaTRrTVBzTnVzbnpGWWJVdzJDZmxPczYvdE9MYlZv?=
 =?utf-8?B?T1NuckN0d21sMWtsUW1oaVRYdnVSNHJ0UC9vckJ0eTVPcThyQVNPMEZ2VEVV?=
 =?utf-8?B?VFBpb2N3RlB6bHN3bnZCc1RBbHFrUGM0OXlKb1dveEtHd1BLR2tYdlQyVHcy?=
 =?utf-8?B?ZUI5QldZbVlkZlJHZWVnbnlaUmVyWFZyUkhEUjg1VEhVelByaDdWZnNzMXVT?=
 =?utf-8?B?OElacngyZVV2OGpYQllnUTh1S3ZzUkVGMnJHRjVoNzR6OFMxMW9mMU0vN0Ir?=
 =?utf-8?B?bTQzUm9QRE5KYVhaQlQwa3Q1UDRpMjNRZEs1N1IyeHFud095blJHUURyTWVW?=
 =?utf-8?B?bXg2MS9GR0h5Zk4rNTRlTSswdDlVTkZQOCtnSVNRSE12L3NQc0swcW5OTDgz?=
 =?utf-8?B?c3liTnRUOGo4UzZRb2d3akoydnkzbU53L2p6NFY3WjJVSFBuRTc5L3h1S3Va?=
 =?utf-8?B?aDZCQ3dvTzQzQU91VHFIc29zMDYyWHBVTHRVRHhUc3BhV1Rqa2trNkIyMGxI?=
 =?utf-8?B?bis5NWo5cXl1bVRDdkhoWThCNHFrUDIwUUVNczVwV2dYdnJWamRSUk1OeWEw?=
 =?utf-8?Q?UouL+qVVjOM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0Z6T2VDQmszak1hVHhuaHdXaUYrTnVWVXBndUlnTG0zSzJCMkdCeFM4Rk5j?=
 =?utf-8?B?aE1kRDhhMHhZUmQzbi9LUHBOM3k4SUcwZDdhMGlTYnZOcUxlK21mUk5zUTIz?=
 =?utf-8?B?YitWZHZNT0dzeGJTNllBQ3NaRjRaT2cvckhudjUwcmlMc2RlZHA3d0gyd0xl?=
 =?utf-8?B?L2pIWDgrejlvaWlVS1Q0YXZxbmU0TUJHN3phWW9nYWFwUFkzZTlMZzU0dHVv?=
 =?utf-8?B?Q3Evc0o3dUovS002Vng0ZEpXcElGdG52Mi8rRzVWNXhNenJ2QVIxOW5GZ0sr?=
 =?utf-8?B?ell4TFlMNkZBWTMyUFhOSGRKSzN4eTBJa2ZkUFFoeUN4WlZoRmdOOUl3dEVN?=
 =?utf-8?B?MDhDN1VockUxeGtGRVh1dWZMaW81a1o3RjVpa3VFNFFhcXdxNlh3a2x0Ni9K?=
 =?utf-8?B?TGgrZGFtaXVWSzR2aFFnRGJLcHVmS09STmNJYmhVcGhwVWt1c0o3L2d3MXNK?=
 =?utf-8?B?Mk5UeFNJZ1pjNEUxUG53cEtha3dHMSs2QWRiVGlZS29oZDdnS0o3UFR5Qmcy?=
 =?utf-8?B?azBLTGxya1pMRyt5OXEyNzRWbG4ycFlmUlNZemdiRU9QUHhuVHZBYTJyclJL?=
 =?utf-8?B?ejNWRHlkSXYvTmpBTFFSaUhsMlQ2UE5xK3VJTWkyYjEzMnlzQVUzUkZFTk4r?=
 =?utf-8?B?dWNZTnpnMGVicFFVdnFjeWZMS1FOSEZXRmV3QWZOUVlxNGtxa3RUVnNCL2Ju?=
 =?utf-8?B?ZndUVWFhbEFRUUVYblhLZ05aK3Vuazh2dHFHeEJERjZPRTBmbDZxQVJnbkZy?=
 =?utf-8?B?MXZLWnZLU2ovdTFFMS9OVG5KTnQ5TkZ6UFgramNGblF5ckNXZHJzaXFrNVg2?=
 =?utf-8?B?ek1RVjhtRkVmYndFak5xdVgvcFFMcDVsUEhJOUloTHJpeVJxSHp5U004dzBv?=
 =?utf-8?B?UVowQ2VaRXZhdXprTmhLVnJ6R3p0Q2l5ZE9vL21tTFVaSmNJRURNQnQ0VjR5?=
 =?utf-8?B?Qnp0bHd5UDV2YS84c0NtZVJ2Rk9EeW11UWVLR1RoV2k4VEJkRUVvcWJDYTdD?=
 =?utf-8?B?SkY0UzZJV1FZY20rNTlDZ2psVTIvMXVLWGFFWkhDUk1ZTW03elRQMnhIaVk3?=
 =?utf-8?B?MFE3c2s1NkI4N2lRakNrL2tMemU0Z2ZDSWlKRHpVUi9OeWpEYVR4NG5yVllk?=
 =?utf-8?B?bVhYdzhQbHdrUzk0aTVHbDR2cXdHd21oZ1JGcTNZcE9sQWQ3ZFdmZTRJZmdq?=
 =?utf-8?B?dkN6Zk9JNWhYUlpkSVpEUVNIUTJydFZndXg3TzhDV3IvVWpSalR5bmlydFpJ?=
 =?utf-8?B?MENmSjhSRGxPeEZ6TG5ydWR3Rzd6K1Z2NXM1d2dEYlZTNFp3UVhsZmYzODlq?=
 =?utf-8?B?ZHk0ZDRYQU5qZS9lZU9DOWJGVGNBRk5hd0pXZThoK3lydDF4cURMQW5Uc042?=
 =?utf-8?B?ZHVITVVWRU1wVkdnTENwNGdGUTd3K0drSFdYRlY2STJLRXJkeHRleWVoeWtD?=
 =?utf-8?B?QWFDTHlwL1BoQ2M5TjRmTHBlajliZ0JHbUpOTUh4Z2N5dC9EUTFibTU0RFFy?=
 =?utf-8?B?Y21sMitqc0o3UExNQmxQZE9PVjkraFo3TlBTcDY5dVU1SWxQdW1CTytMMnRw?=
 =?utf-8?B?V21lQmNnK3YzN1BrUTVub1c2d0VDWW1BWkN1ZXlDTW85cDVMdEdmcG00dWMx?=
 =?utf-8?B?cDRTQm16UWJBdEhNQjVTUnlkY2dScExBSnFvTDBNbExMZnFFdGN4Qm5CZDJq?=
 =?utf-8?B?MW5HU1pjTVF1Q2ZWWmNjaDM0TVFVYVl6ejVodVRLaUdTbWlOZWVKUEYvWXNU?=
 =?utf-8?B?K2s1TXJ1OWg1YUpob3dEMWZmQ1lPMzdnbVg2VUVlL1ZEdU84TXM4UHN5a05y?=
 =?utf-8?B?Z3ZOOUpXYjU2b2t1a0t1UlJBaGNPSmlIelV6WXFpTXVQUEJVQmlCTlB3VUlX?=
 =?utf-8?B?MFdMWFhOT3BqRzZjY2ZVRmlDZXNZWjNjaHRUWFRLck5Pd0M2NGdISWx2OWhm?=
 =?utf-8?B?NkdOY1hmelpXaU4yU0tENzVLeXU2bE9zYjZ1clo1b2t6SWo3cS9JU000a1Nz?=
 =?utf-8?B?VHJWUGJqdjRxUUpJSW1XZHR4TTlVcXBsaERTV3ArbzlPSitNWno2SmRXWkhT?=
 =?utf-8?B?OGJsVnhlTENKa3hmWk5hVG1BcDNvVU8zTld3RDg4Nml0VU1NWUovMGtZZmRt?=
 =?utf-8?Q?1vkSO35VcCQeZlqig2Z7bPVio?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11777d18-8f49-4ef6-9697-08dddb4f42a0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:26:02.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/HpHG36y7wtpA4jlFshJ9r8Mp0/VSXAxbHeitTuW9LqEa54+dqjPLEe4lP8kGAsZkZWLqnlGv3Uicep5Nn+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7876

Hello Julien,

On 8/13/25 14:11, Julien Grall wrote:
> On 13/08/2025 11:04, Milan Djokic wrote:
>> Hello Julien,
> 
> Hi Milan,
> 
>>
>> We have prepared a design document and it will be part of the updated
>> patch series (added in docs/design). I'll also extend cover letter with
>> details on implementation structure to make review easier.
> 
> I would suggest to just iterate on the design document for now.
> 
>> Following is the design document content which will be provided in
>> updated patch series:
>>
>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>> ==========================================================
>>
>> Author: Milan Djokic <milan_djokic@epam.com>
>> Date:   2025-08-07
>> Status: Draft
>>
>> Introduction
>> ------------
>>
>> The SMMUv3 supports two stages of translation. Each stage of translation
>> can be independently enabled. An incoming address is logically
>> translated from VA to IPA in stage 1, then the IPA is input to stage 2
>> which translates the IPA to the output PA. Stage 1 translation support
>> is required to provide isolation between different devices within the OS.
>>
>> Xen already supports Stage 2 translation but there is no support for
>> Stage 1 translation. This design proposal outlines the introduction of
>> Stage-1 SMMUv3 support in Xen for ARM guests.
>>
>> Motivation
>> ----------
>>
>> ARM systems utilizing SMMUv3 require Stage-1 address translation to
>> ensure correct and secure DMA behavior inside guests.
> 
> Can you clarify what you mean by "correct"? DMA would still work without
> stage-1.

Correct in terms of working with guest managed I/O space. I'll rephrase 
this statement, it seems ambiguous.

>>
>> This feature enables:
>> - Stage-1 translation in guest domain
>> - Safe device passthrough under secure memory translation
>>
>> Design Overview
>> ---------------
>>
>> These changes provide emulated SMMUv3 support:
>>
>> - SMMUv3 Stage-1 Translation: stage-1 and nested translation support in
>>     SMMUv3 driver
>> - vIOMMU Abstraction: virtual IOMMU framework for guest Stage-1 handling
> 
> So what are you planning to expose to a guest? Is it one vIOMMU per
> pIOMMU? Or a single one?

Single vIOMMU model is used in this design.

> 
> Have you considered the pros/cons for both?
>> - Register/Command Emulation: SMMUv3 register emulation and command
>>     queue handling
> 

That's a point for consideration.
single vIOMMU prevails in terms of less complex implementation and a 
simple guest iommmu model - single vIOMMU node, one interrupt path, 
event queue, single set of trap handlers for emulation, etc.
Cons for a single vIOMMU model could be less accurate hw representation 
and a potential bottleneck with one emulated queue and interrupt path.
On the other hand, vIOMMU per pIOMMU provides more accurate hw modeling 
and offers better scalability in case of many IOMMUs in the system, but 
this comes with more complex emulation logic and device tree, also 
handling multiple vIOMMUs on guest side.
IMO, single vIOMMU model seems like a better option mostly because it's 
less complex, easier to maintain and debug. Of course, this decision can 
and should be discussed.

> For each pSMMU, we have a single command queue that will receive command
> from all the guests. How do you plan to prevent a guest hogging the
> command queue?
> 
> In addition to that, AFAIU, the size of the virtual command queue is
> fixed by the guest rather than Xen. If a guest is filling up the queue
> with commands before notifying Xen, how do you plan to ensure we don't
> spend too much time in Xen (which is not preemptible)?
> 

We'll have to do a detailed analysis on these scenarios, they are not 
covered by the design (as well as some others which is clear after your 
comments). I'll come back with an updated design.

> Lastly, what do you plan to expose? Is it a full vIOMMU (including event
> forwarding)?
> 

Yes, implementation provides full vIOMMU functionality, with stage-1 
event forwarding to guest.

>> - Device Tree Extensions: adds iommus and virtual SMMUv3 nodes to
>>     device trees for dom0 and dom0less scenarios
>> - Runtime Configuration: introduces a 'viommu' boot parameter for
>>     dynamic enablement
>>
>> Security Considerations
>> ------------------------
>>
>> viommu security benefits:
>> - Stage-1 translation ensures guest devices cannot perform unauthorized
>>     DMA
>> - Emulated SMMUv3 for domains removes dependency on host hardware while
>>     maintaining isolation
> 
> I don't understand this sentence.
> 

Current implementation emulates IOMMU with predefined capabilities, 
exposed as a single vIOMMU to guest. That's where "removes dependency on 
host hardware" came from. I'll rephrase this part to be more clear.


>>
>> Observations and Potential Risks
>> --------------------------------
>>
>> 1. Observation:
>> Support for Stage-1 translation introduces new data structures
>> (s1_cfg and s2_cfg) and logic to write both Stage-1 and Stage-2 entries
>> in the Stream Table Entry (STE), including an abort field for partial
>> config states.
>>
>> Risk:
>> A partially applied Stage-1 configuration might leave guest DMA
>> mappings in an inconsistent state, enabling unauthorized access or
>> cross-domain interference.
> 
> I don't understand how a misconfigured stage-1 could lead to
> cross-domain interference. Can you clarify?
> 

For stage-1 support, SID-to-device mapping and per device  io_domain 
allocation is introduced in Xen smmu driver, and we have to take care 
that these mappings are valid all the time. If these are not properly 
managed, structures and SIDs could be mapped to wrong device (and 
consequentially wrong guest) in some extreme cases.
This is covered by the design, but listed as a risc anyway for eventual 
future updates in this area.


>>
>> Mitigation (Handled by design):
>> Both s1_cfg and s2_cfg are written atomically. The abort field ensures
>> Stage-1 config is only used when fully applied. Incomplete configs are
>> ignored by the hypervisor.
>>
>> 2. Observation:
>> Guests can now issue Stage-1 cache invalidations.
>>
>> Risk:
>> Failure to propagate invalidations could leave stale mappings, enabling
>> data leakage or misrouting.
> 
> This is a risk from the guest PoV, right? IOW, this would not open up a
> security hole in Xen.
> 

Yes, this is guest PoV, although still related to vIOMMU.

>>
>> Mitigation (Handled by design):
>> Guest invalidations are forwarded to the hardware to ensure IOMMU
>> coherency.
>>
>> 3. Observation:
>> The feature introduces large functional changes including the vIOMMU
>> framework, vsmmuv3 devices, command queues, event queues, domain
>> handling, and Device Tree modifications.
>>
>> Risk:
>> Increased attack surface with risk of race conditions, malformed
>> commands, or misconfiguration via the device tree.
>>
>> Mitigation:
>> - Improved sanity checks and error handling
>> - Feature is marked as Tech Preview and self-contained to reduce risk
>>     to unrelated code
> 
> Surely, you will want to use the code in production... No?
> 

Yes, it is planned for production usage. At the moment, it is optionally 
enabled (grouped under unsupported features), needs community feedback, 
complete security analysis and performance benchmarking/optimization. 
That's the reason it's marked as a Tech Preview at this point.


>>
>> 4. Observation:
>> The implementation supports nested and standard translation modes,
>> using guest command queues (e.g. CMD_CFGI_STE) and events.
>>
>> Risk:
>> Malicious commands could bypass validation and corrupt SMMUv3 state or
>> destabilize dom0.
>>
>> Mitigation (Handled by design):
>> Command queues are validated, and only permitted configuration changes
>> are accepted. Handled in vsmmuv3 and cmdqueue logic.
> 
> I didn't mention anything in obversation 1 but now I have to say it...
> The observations you wrote are what I would expect to be handled in any
> submission to our code base. This is the bare minimum to have the code
> secure. But you don't seem to address the more subttle ones which are
> more related to scheduling issue (see some above). They require some
> design and discussion.
> 

Yes, it's clear to me after your comments that some important 
observations are missing. We'll do additional analysis and come back 
with a more complete design.

>>
>> 5. Observation:
>> Device Tree changes inject iommus and vsmmuv3 nodes via libxl.
>>
>> Risk:
>> Malicious or incorrect DT fragments could result in wrong device
>> assignments or hardware access.
>>
>> Mitigation:
>> Only vetted and sanitized DT fragments are allowed. libxl limits what
>> guests can inject.
> 
> Today, libxl doesn't do any sanitisation on the DT. In fact, this is
> pretty much impossible because libfdt expects trusted DT. Is this
> something you are planning to change?

I've referred to libxl parsing only supported fragments/nodes from DT, 
but yes, that's not actual sanitization. I'll update these statements.

>>
>> 6. Observation:
>> The feature is enabled per-guest via viommu setting.
>>
>> Risk:
>> Guests without viommu may behave differently, potentially causing
>> confusion, privilege drift, or accidental exposure.
>>
>> Mitigation:
>> Ensure downgrade paths are safe. Perform isolation audits in
>> multi-guest environments to ensure correct behavior.
>>
>> Performance Impact
>> ------------------
>>
>> Hardware-managed translations are expected to have minimal overhead.
>> Emulated vIOMMU may introduce some latency during initialization or
>> event processing.
> 
> Latency to who? We still expect isolation between guests and a guest
> will not go over its time slice.
> 

This is more related to comparison of emulated vs hw translation, and 
overall overhead introduced with these mechanisms. I'll rephrase this 
part to be more clear.

> For the guest itself, the main performance impact will be TLB flushes
> because they are commands that will end up to be emulated by Xen.
> Depending on your Linux configuration (I haven't checked other), this
> will either happen every unmap operation or they will be batch. The
> performance of the latter will be the worse one.
> 
> Have you done any benchmark to confirm the impact? Just to note, I would
> not gate the work for virtual SMMUv3 based on the performance. I think
> it is ok to offer the support if the user want extra security and
> doesn't care about performance. But it would be good to outline them as
> I expect them to be pretty bad...
> 

We haven't performed detailed benchmarking, just a measurement of boot 
time and our domU application execution rate with and without viommu. We 
could perform some measurements for viommu operations and add results in 
this section.

Thank you for your feedback, I'll come back with an updated design 
document for further review.

BR,
Milan

