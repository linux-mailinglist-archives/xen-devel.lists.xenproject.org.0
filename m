Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D343BA37E6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 13:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131504.1470570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v26iS-0007Tm-Eq; Fri, 26 Sep 2025 11:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131504.1470570; Fri, 26 Sep 2025 11:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v26iS-0007Rp-Bx; Fri, 26 Sep 2025 11:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1131504;
 Fri, 26 Sep 2025 11:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehmb=4F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v26iR-0007Rj-Bf
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 11:34:19 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba71f541-9acc-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 13:34:14 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9850.eurprd03.prod.outlook.com (2603:10a6:10:449::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 11:34:10 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 11:34:10 +0000
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
X-Inumbo-ID: ba71f541-9acc-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWIpIr+PQdgOuyjL6JXg+wg40RNnQRe9GGLkXc6HalqCsmF6XqDiozbwIuw71DEj4i0La3Ijv8UIdEEbuv2ME+QXmJsPpQIYHWgCojE0ACmPgcBggcigqopfxLEajgxt8CiQKCm5qArfxCN+EYXoahFyisYKh2vnZrSIPXEJzrH0l/Jb7L/7Jcj4WNgENWmhnRWz8ypBrlQeplOBg3KIciA/VbCWd5mDu46EUbBN0ypUi6RfJTKaYg1ReodcFYmjxnzvZv15TnUFPRj6JXWK8XCZ9YZqDElHMFEe0L5fVZvUr4AMUo84wEWl2kzpuI2GEJRDzGzGk15G6Ko4dePfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDveB0z0IWUTiwfsPqeUVIxWy6C0/DR8E2pKH/EZrCw=;
 b=mUkSBOoHcdCeuG4mYEBNGXs2C8Mb62b8ytRUG+azaSXk9cY0jeVAD4pH6zle7RHIIIFXEbxYhAgQcuDebHIHsY1mdIyMoVaWpgvxxmptXoVfoNifdfRYClQVaFn35K75dhNGpG9RkIITDa/E0eaGym/kvYlRF56SJd2MQe+C5aaiz8Ubfl07S21op3UJEguCj1FcpZ+jSNgjAE32terf5FT8EJBeHQXjKI8HJsuj8CLHiogmXl5CHo+oJaj57KNMn/0tsgqTqVfA8V51z9Sos2elWv1vbd/4fmui/ylxb1JK2Ttiw1sqMDiJGuJSxGFPyBioaL3hK2RxcTMBexZeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDveB0z0IWUTiwfsPqeUVIxWy6C0/DR8E2pKH/EZrCw=;
 b=pa2G7ErqNCxLToAOlf1Rb2uIj3i/AigGiWP4b7uhvWoz7+Mz7CU2nxuT3BX7cQVJaxvf0RYfpW463rZpcUBevR3Z3csVzNeV4BgR5YxSXRYU54TlYm/a4mXV5wYfQVOou6bQIY6k28Emuj1DQUtplDJDiEZyVkXFbXMNR0lGBGtMWL2NCDFTXMHDyXjCkou0wYagYxG5sESuSmsKsMR+Rf7HL2gTo1N+4/m+EC68f5vApV4lpBSlxXR7E/mED6T39QnlM0+efIlAfIXC79YzEjSCC/RAbyBpbdM1C8DIjjwxC6cJZNpgWLA26pBVzDAw9TToqF/pmCli2VQ5+8XeZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c3635e2e-3d37-4b29-8ed4-304f9a17cdcf@epam.com>
Date: Fri, 26 Sep 2025 14:34:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250925195558.519568-1-grygorii_strashko@epam.com>
 <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
 <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
 <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0379.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB9850:EE_
X-MS-Office365-Filtering-Correlation-Id: 13117261-a6e2-4269-e3e6-08ddfcf09c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3ZPSW9BWFhxNFZMamZXdHBSTzUrdFlvS29RWThLd0pGV094c1JxazFZTzBM?=
 =?utf-8?B?RHFUNzRWSVY4RU0zMVlUUmNxRWduQkMwWnQ5WlVqaU1IT2h0R2J3emM2Ly9U?=
 =?utf-8?B?dmc3MlJwQk5zMFpMeXVrUHVZUWFYR0w4WTM4ekExa1NZYjBsdDZ5a0JkRUZ4?=
 =?utf-8?B?MUIwRG9xbzBNTXhEOEszQk5hcDJKTkJ4NEV0QWcrcDhWeXkxYnAzZU05Y05R?=
 =?utf-8?B?WmJZU2dEU2pDWGtPMzhldXZkYkxod1VHWXN2dFJaSnIxNnUyWU9iYVl5WHo5?=
 =?utf-8?B?RW5MS3pMTEZIZ2lOYWtDVEhnQ2ROb3dNYytHakxHdDVHYzBNOW4xM3E3VXFq?=
 =?utf-8?B?WVRSclV2NGsxdjBMeWxQV2lib0xtMEtpRHkrRHMrTU4vRWFoS0p5aEhJNzRJ?=
 =?utf-8?B?UFlCNXc5STVlS3RabWtFT2JadCsxendLWDNQRWUrNWNTUSt3MlBKeTlnWFVR?=
 =?utf-8?B?Q1o5MDVKRVlwV05kOVBJd0h1Z3FQRDFaV0VQSW1jTkQvSk1OSU1GUEhuU1V6?=
 =?utf-8?B?YzRGdUFGaVQxTU1rYTZ6V3RtL0JwMm13SUFDcHNvd1pzRWR3VDlEa2gxcVZW?=
 =?utf-8?B?TFBRblU2TzREOHo4L1VsN2Y0NVZaY29peDNzK094NGUvTys2SVorTHhhVnVD?=
 =?utf-8?B?Q2FMTC9TRWJSaHcvV3U3dkRxZzBxZWs2ZGNkTk1yTzU0L0dSaFVSdjQ1YzhO?=
 =?utf-8?B?eWpWbU83ak5qWGtkMGJVYkFNd1NWV1E2citFMlE4VHdkalhSQUJVMkFJNkRu?=
 =?utf-8?B?UmtISGNzazF4Z0ZFM0JBNnN2ZklMUEhXcXd2WmU0QjllNzZvMU9MY3hyWExC?=
 =?utf-8?B?TkF5NzlYV3o0cjhBNmRldEZvZU51NGx0cFYzRnZKS3U5dFh5R25RVk10N3Nh?=
 =?utf-8?B?NjRPUkthbU44SU9mT3FUYUcyVE5Ic1RxS3JMemZsOEFGcHdrNC8zWDNWQS9j?=
 =?utf-8?B?azVvOHF3VnQzVVhTL1huSEMyTTJKVDdzRmUrWXdoeVZsd2dvK2Nzckl2VkJ4?=
 =?utf-8?B?WS9kWlpPSWhmRXVtYVA4UXYrb1c0WHVWcUV5NEtPU1BvVE5EWlBmOHhDR1VI?=
 =?utf-8?B?Sk5GYnY4bUdBQld3YXRaS2ExWW5DRWhySUhPa0hDTXYyVFpsaW5RQUFtWDM3?=
 =?utf-8?B?bjJPRC9UKzZFbG5DWTl0cEtFUThJei9TSk5JcUlGUG9oODFHdG1wVFZzWC9J?=
 =?utf-8?B?UllHVW84OC9yU0kzTHY3TVV1U04zbjdlSlZoWmdpUW40OEdReGMzdFRLT2hS?=
 =?utf-8?B?NFV1aXFnVmk5Wk9RcjZ2VzlqN3ZvSWJOV2tNTmZsSTZXQU1UUHdzTFY2RThp?=
 =?utf-8?B?QjF0QVRKczdhS3pHVThOYkE3THJQdmhhNVZFMTM4aFF0Wk5nWHdMVEUzNDRz?=
 =?utf-8?B?SDJnWUI3WkZ0REp2ZGl6S0x0N2R1Z1Zod0hNOXYxQS9oSTBNOHE4cFlCZWYv?=
 =?utf-8?B?Z0dxUDAxUFF4T09rc2EzZ2pxOE1HZHN4MHFwNElhb3ZSM0R2V0RFZzhSNEtB?=
 =?utf-8?B?MHYwOTllaVBaV0RhRkhDMWRiTHJJeUpYeTlubUc1L2x3STZJUkNhUlRKMGwx?=
 =?utf-8?B?UWJxYTVSMEZZMHdjQk01RGlRSTc3T3FQV01NWFNITHJ3UElmWHNKWm1hTkc3?=
 =?utf-8?B?VFUvSi9rWUVUZXR2Ykc3bHMxUXJzMHVPSmxzbitBaXU5dTFMbUZFTnMwRTVQ?=
 =?utf-8?B?aE1JS3A2TmFQald6MXRsbjBmMFRqdjRkV1luM01PREZISmpBQ3JMbjk5ck1W?=
 =?utf-8?B?L0VRbTE3ZkxvclFWaGlybUU2Uk1mTHNjWWZ6Slk4QlFtemJoTnB5OVJzMERi?=
 =?utf-8?B?OXA3NFpmWWluaUVyYWFZZUczZXZpNURRMHhkMjY5dEkyekU4dXdlazgzQmJm?=
 =?utf-8?B?ajdzNlhkRFVnVFR3cVNoWld3WmVuU3QwY1FPeFFFdENhZkdWOXNsVnB2cWpj?=
 =?utf-8?Q?5heGnYg7awM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUZYNVRWV1M4cWJoOWhFb1ZWQnRLK3VOOFNLam80Y3NYaDgrOWd5ZXRKSFI4?=
 =?utf-8?B?anVNMHpzTnZMb1pvWjRTY1dyOUpHU05VSCtCOGhaOG9QOHB2MmhTeFp0MU1D?=
 =?utf-8?B?QzUwT1RJRVVsZllGV0MxMmlWK0xFeXRJN1M2Y0VYWWlhTy9NM0t2K3BZWk9C?=
 =?utf-8?B?MTJ3blRzZHA3TThnZHBXcjFjb0xJblI4aGNXM3JzTUtPWW9TWWxWaWdORDVG?=
 =?utf-8?B?aFN2RjVyUHh4bVZvUFhnejBSSHhTRGFWYjYreldrZTh1enRRY04vcGhVRGRp?=
 =?utf-8?B?MGM2QXFvN0xydERHMXZGMjNIR3BjRGM2QWNzZGF5bjExZDliWlY1UDM5YThK?=
 =?utf-8?B?T2E5T3kvNUFFMkcvRVB4dWJ1bHZxVVhqUkpGRVJ1NUFEUitEaGlSMUlvekdK?=
 =?utf-8?B?VUZsS3JUQWpNTnFRRnZITlRlcDNVVElkbGl1aWRLYXdKZmVmNS9KdlBFRFlD?=
 =?utf-8?B?dFRVdHg3OVd2NEtEZllIZFlyTlhScEZ6TWlhZVR3MmJwUld1NWR0RzhDTHNV?=
 =?utf-8?B?WU8rdlZ6dDdpY1FWZFFobHQyLy9nbVlic09JZWgzczdEanhuWXY5V0RBcVZh?=
 =?utf-8?B?OGUzUU5mT1RaZldLc1pLUGhwSDVmMmI1WldjTGZwV3NEdXM0Zjl6U2orQ2FU?=
 =?utf-8?B?MzJpREc3bE5kZnZsbW1RR2R5ZzlZRVhzcTV2UDZwdTRvS2I2STh0K1hsSWl0?=
 =?utf-8?B?K1Y2eTNYVzhrcFdtbk1VeUNCSDhrWjQza2xwTEoweVEwVHU0VDBxV3hSdlE5?=
 =?utf-8?B?V3JSOXVpeWNEWXhXUFJhdlZtamRmUE9IQStreE9ZcVF4K1lMeTUxSkFwWGxW?=
 =?utf-8?B?aC9XUGFNS3Q3dFlLNjZ5UVlQQWlLSDh3Z0Flcy8wTWFlU21vUEt6MEdpd0gy?=
 =?utf-8?B?QXJSclluNUZkSHBYZ1ZNSll5MURqMDhVUnF1OFpHNE9ITlQvNklCMDJTVlZE?=
 =?utf-8?B?azlpRUJaVk5iOHA4dEE4TGprcFdLY0lZejVRTUlkWWNDckN3bjlRbjhWQWRt?=
 =?utf-8?B?YW9ZNGRWeGVMRDM3RlZFeStpVlBUSTl0bEpRZFFjNkNMejhLdjMzcGU2VS9F?=
 =?utf-8?B?MTRDa0YwdXdjcERZSWFNaGd5TkswS0tTN0tsWFFvbFcrQTVGQmdKV0N0MFJw?=
 =?utf-8?B?Nld5YUt3b0pRc2ZMSWhTWURLVCtKYWFhZ201bFJhSVQyTE4xaHZtajVtOVNo?=
 =?utf-8?B?NDlPQTAzVVdFemlkaU42YWFMSmJQN0oxSzB0M0NhbXBEVThKdmRKNDV0NjJl?=
 =?utf-8?B?NTV3SmEyTUxaRDkxUEM4dW4rbThZZDhaK0phK1BjamRRdGQxSldiOWZ0RG5I?=
 =?utf-8?B?aDhhS0g0cjlHWFl2TStpZHJ3d3FmUlV1YmdoYSsyVzNWeGYzOFF3V3FTNk84?=
 =?utf-8?B?bEdaNFh6clNnMEhycWVhL3gvQVBsOTNCaEg4Y2x3ZkVCdGVwKzlrVWpvbGtQ?=
 =?utf-8?B?dVRwUGJldG5BRmhqOEtwOUVINWxtN3A2ZlBRK3VvV1ZjK3JwcytPZGxiM0tM?=
 =?utf-8?B?ODI3dDlMQWU1K1N2ZFVkM3E0MDJrcGRBb1N3eVBZTWNYeDlPM2ZqS09mcGlp?=
 =?utf-8?B?Tjl6QkJ3cFpQb0V5eEJXOS9wT0tYK0dVSUJPWklvRmdYWk8rMGNCVSs5YVZP?=
 =?utf-8?B?WUdjaE1rdklnamxRTXBGZjJ1T1NOUVJoSTRFaGF0Q1ZzNVZnL05LaFIrSmcz?=
 =?utf-8?B?NThNUlRRaUdzeW5XakFGdnE0TWViUkNpcXBKamRTYWhTa2lueGhjR1ByaUdX?=
 =?utf-8?B?OVhrUFd0SnNkSnE5cUt2LzUzMjJtdXJSWWVDN0NPTnpaQml3ZzB0ZWg1U2Vw?=
 =?utf-8?B?eCtreTRpYW95dmw4RTBkYW1jUjVpVnQrcGFaNU1zejFZSFRlVElKSGJyZ3Jl?=
 =?utf-8?B?eE4xSjhTOElxbUIyMWNFd3VJamprWWtjMUNsSENBbGdLc1phTnRKUmRjNXZp?=
 =?utf-8?B?MExSODlvM3NRbEoycUpEbElYOXlOOGFKRDJaMmV2ZmY5bW1MSTIvNFMvazhw?=
 =?utf-8?B?bWFvR0FKNERxN05tbXdFWmZMZ1VxTzJoMUtxMFdZdit1bUFnTkVZQjdlM002?=
 =?utf-8?B?Ni9EQjg3UE9GT08rVkRCUVRGWEY2NndmcHJIb1c5Q0V3SmdzejBXMy9IR1dz?=
 =?utf-8?B?MmU1VnY0NjZSb1hKWWZCZW9VSEo2WkZ4OGllN2tneEJqdmJ5NUoxcWtMWkVj?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13117261-a6e2-4269-e3e6-08ddfcf09c57
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 11:34:10.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzvT+IuG0dkyUs4BvccZusGm/uqND+2Ex2teSuLYm75IbhbWXzT+Q/VQR44nswKbX5jFOi6qkzryLqQB0es2jgFQWZsqE4kl8zuzzpFjXZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9850



On 26.09.25 13:52, Jan Beulich wrote:
> On 26.09.2025 12:38, Grygorii Strashko wrote:
>> On 26.09.25 11:17, Jan Beulich wrote:
>>> On 25.09.2025 21:55, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> The LAPIC LVTx registers have two RO bits:
>>>> - all: Delivery Status (DS) bit 12
>>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>>     This bit is reserved for other LVTx regs with RAZ/WI access type (MMIO), while
>>>>     WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bits
>>>>     (MBZ access type).
>>>
>>> Question is what the behavior is for writing the r/o (but not reserved) bits.
>>> I wasn't able to find any statement in the SDM.
>>
>> Me too. Usually RO/WI on most HW.
>> For example, LAPIC MMIO "Write" will be ignored (WRMSR will trigger exception).

Sorry, ignore ^ sentence.

> 
> My remark was specifically about WRMSR, and what you say here contradicts ...

> 
>>>> --- a/xen/arch/x86/hvm/vlapic.c
>>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>>> @@ -880,6 +880,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
>>>>            if ( vlapic_sw_disabled(vlapic) )
>>>>                val |= APIC_LVT_MASKED;
>>>>            val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
>>>> +        val &= ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING);
>>>
>>> There shouldn't be a 2nd &= here; what needs adding should imo be added to
>>> (really: removed from) vlapic_lvt_mask[].
>>
>> I'll try it.
>>
>>    (Orthogonal to this I wonder whether
>>> guest_wrmsr_x2apic() wouldn't better use that array, too.)
>>
>> WRMSR checks for MBZ. RO bits are not MBZ, so masks are different.
> 
> ... what you say here.

Above reflects current code - guest_wrmsr_x2apic() allows valid RO bits,
then vlapic_reg_write() ignores (W/I) them.
That's why masks are different between guest_wrmsr_x2apic and vlapic_reg_write.

> 
>>> While looking at this, don't we have an issue with CMCI as well?
>>
>> I see no APIC_CMCI write emulation. only read.
> 
> guest_wrmsr_x2apic() has
> 
>      case APIC_CMCI:

it will end up calling vlapic_reg_write() which doesn't have case statement for
APIC_CMCI - write ignored.

> 
>>> guest_{rd,wr}msr_x2apic() handle it, but vlapic_reg_write() doesn't. I.e. on
>>> AMD we would fail to deliver #GP when the guest accesses it, while on Intel
>>> we would lose the value written. And we also don't set its mask bit in
>>> vlapic_do_init(). I guess I need to make a patch ...
>>
>> Is'n it depends on CMCI capability exposing to guest?
> 
> Yes, that's part of what I was (effectively) saying.
> 
>> (have no idea what's CMCI :)
> 
> Corrected Machine Check Interrupt.

Looking at:

  #define VLAPIC_VERSION                  0x00050014

which means "Max LVT Entries" = 6 (5+1)

Looking at linux kernel apic.c:
#ifdef CONFIG_X86_MCE_INTEL
	if (maxlvt >= 6) {
		v = apic_read(APIC_LVTCMCI);
		if (!(v & APIC_LVT_MASKED))
			apic_write(APIC_LVTCMCI, v | APIC_LVT_MASKED);
	}
#endif

Which means Xen never really emulated APIC_CMCI, so wouldn't it be correct to just drop APIC_CMCI?
Also, taking into account that it's Intel specific.

-- 
Best regards,
-grygorii


