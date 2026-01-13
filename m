Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0539D19BCB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201903.1517529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfg0z-0003SB-PQ; Tue, 13 Jan 2026 15:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201903.1517529; Tue, 13 Jan 2026 15:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfg0z-0003QD-Mm; Tue, 13 Jan 2026 15:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1201903;
 Tue, 13 Jan 2026 15:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfg0x-0003Q7-Vl
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:09:00 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7ee8454-f091-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 16:08:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8440.namprd03.prod.outlook.com (2603:10b6:408:377::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:08:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:08:53 +0000
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
X-Inumbo-ID: c7ee8454-f091-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgUJex87QsX2qpzJooBkB7xxKpKr9TZDXuTbzSUWLNEiOCT131Lbv6STmrbk0VUSnR9WLDhph1mV9NDaGvpLdBCXkPp1MKW4lVbwxC73Dh/tfcGJ2li61M/CiCrrvarPgjSExEEx/y43DCZsLeZ7ina2a8aSGpfKp648Ndodk7lxkbxGzdRMlTrDOqmWNqWUBoOeee9JZYaFhcoSGdgJ8+P+Ros3qPn7EJAnbGno+wv/JBXAcKkHRyklKoiu4wG0qCiUmsk4K+/K4SnhfiwNeu1OJZViODyq1Lb5/dir4fkbFGItC7K8e4SQ9LO3xc4LkwQ7YLTptOerTCxzPU+nJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMDPfp7rSO2Fl2qHgPd3JWOZBGjaTGgH7mazWOQEVE4=;
 b=N+FRfslUr0wRTsV2EqH+oR4WYv+j9g+ggCdrVvQBNW7DFpAMYTGI8WrtokufQLe2a1HoXcunPcmkgvss1fTxv3dyxQx1KnEru8E8YFnroVrdXZm2kQeQTP1293HM4ikvtUAo+yiDgGy1dtyOJG+8p2Ajqd+nG0aFg4aRXUL+PVanoOTB2zvBS5HtbSQk/QrMd0Plad9zFaBIPKM92L8In3qeF3cQaHR/2Dk2XDxlx73i8Q3Qp8rOcjDrfQsU6JJ4VgeZm/fKKJ8sFS9rYaD/5xHMJN2Zm7bvq9Ezx7fE0Hkw/DSmhSeg8E89ek+eHJX21aKEvZQmxlYhsRh4fP7Kkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMDPfp7rSO2Fl2qHgPd3JWOZBGjaTGgH7mazWOQEVE4=;
 b=u5nYlCGZVgUvcXOEBX7dfCZGw6ZvDRkCD4UibTSuoaxPdwjL2WA9bKNwsKkttVQ3r/ihPFf9LiTCvZe+KXpcxhtK1ooRZN+QGSOm4og8EFdTAdZDQVzU/zZNvLbXorOKmO5+jKQOZam3z2afY4VGP7T/ieMJS2FVc7Aj+tk78GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4353bfa1-6fb6-4755-a922-d0330e61fb4c@citrix.com>
Date: Tue, 13 Jan 2026 15:08:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 4/4] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-5-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260113122109.62399-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: df12d1fa-ee0c-4111-f2ac-08de52b5aa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXBWRnA0UGpqeWJuSU80b3doalZlYmJzR2pxdmRQSTJiUlBGQlFIZXpHeXhQ?=
 =?utf-8?B?K2RzMUhPVHFYSzlnczQyUU5LTjhiWHFSWTJiTUp6VW1DblpuK3lnOVl3RGRU?=
 =?utf-8?B?SlZpeDB3dnVkK0llK2JFeEh1QnhiL21DNC9xSlk1NE8zVmJsN1ZpVzVpalBW?=
 =?utf-8?B?emZMb2JNZEtQaENOc1dSL1MzYStvTUtOcW5KMTl2SFFibzJtRUk4Zy8zS0NY?=
 =?utf-8?B?TitHOFdNWjN5Zy9rQnhnaUpOWnRTY3VmSTlzMllmWVFDNXp3clMrQjFPRm85?=
 =?utf-8?B?VnFKbkp0bVlaaS8zOHM0R3pVOXZlQVRmM0Vzdk9ZVGhLRVpOcWZZZDhyQTJS?=
 =?utf-8?B?eHRFYkdCRTBwVGF0ZjM0bnNJRFJFaXB5K0UzRnp4TE9ELzNxdncwTUdiRXpE?=
 =?utf-8?B?SjB0SEtyMDFXVWRmeWdES3p0WWl6TS9SMmw1VEdUbXN1QlJsa1JMa040NFNT?=
 =?utf-8?B?WWptbzRHY3ZVa0FxYXVNbnBaM1E4ZmY0SFF2OG01RmRibUU0T0ZkeE1QV0FT?=
 =?utf-8?B?WG1ZbVJIM2NNT3RuOUdxTlJ6WDgwSGhiNlgzb3lkOFMwWGFEUUhKNHNla1hm?=
 =?utf-8?B?SG11NzZCTm95L1diSFhXQzAxY3MxTE1LSDJJOTJJcGRkN3RaU2JFc3E4QnNQ?=
 =?utf-8?B?S0t6eUQxQlpVbjVXT01YZzI1bG4xTTMzMzlTSDZwT1F4THp5TkRhSzJWMGxH?=
 =?utf-8?B?TjFmOFVVQVVkUERXSlB5dWFYeVlsQjM3ZXZBRlluZEVoWW84bCsxYU9GRldN?=
 =?utf-8?B?SE92MWV2Rk10THBPTVBOOHRudWoveTFhTHNvSEprQTk5U0NGVkpGM00rTlIz?=
 =?utf-8?B?bWZyN0ZEdldGSC8yMU12bU51c3BUR1RlNFRtNGw2YTdNNkpRRmtVbkF3ZHJv?=
 =?utf-8?B?Z0E1aFhvWnNoSCsvc2ZSZ2dkUkd1bS9qMHdoSzMvWFEwZE1kZ1IxZHZTV1ZC?=
 =?utf-8?B?emwraWQ0bGQvZ1VWTzFWY3dkcVdpZWdYaWFmSHEyUTRxWjd2bldMemxLUDdR?=
 =?utf-8?B?ajVCNGlXMUFBSlErSWhDNndQV3VaNUcvdWxuMEZ6V3dscHRLNkt0b2kyYjdn?=
 =?utf-8?B?VzRPZHdhVitITmU1VFYwN1poWjlaejd3cHQ5ZDZCYjlVUnhla2x3OFpRc0dM?=
 =?utf-8?B?a0pjRm4zS1VmOUhWMDBLcjl1TlM1eHhFdFAwVko1OE5oRkk3dmk4ZnJuQzF6?=
 =?utf-8?B?VnozUzg5U1NLNUNMYjFRV1lzcmtDUlBNdjJJUHYyMXNGSldZbXk5ZnRFRkNG?=
 =?utf-8?B?Qk1saER5Y2NXNE5ibVdFdk9VcGFjeEt0WXdkOWhOVG1pVitmU3MxK3ZNRG9X?=
 =?utf-8?B?dUJIQnNGbGliQ200MEFVOTRCaXQ5MUtLTTJ2S0VkL1dKSGlzcXZtY3JxbTFj?=
 =?utf-8?B?UUV6WmtVMzJuRk1aemZLRTVUak54MmpCYUwreWFjOW5VUm5lYVBnOERYM2V5?=
 =?utf-8?B?SmJVMzAxbzdjMS8zeUFldEE5enQ1RWwxeFh5NGUvU2FkNlRMY21rdklLbmxX?=
 =?utf-8?B?cUxwV1VMVCs3Y0dPVStRYWxiNSsvT3c3VUZpZjQ0SXpsZHB4cFpXZXJvaksw?=
 =?utf-8?B?MTNoQ3Zsd3h4K2pEQmQwNDdoVFRTaFRTcjNBRXNXV2RoMVZQcmxvUEg2eEc2?=
 =?utf-8?B?Qm5wbVB5bENBUmJkT3dBVnNrdGVYR21zdG5kTXB1UzE4WUdKREd4MEhxSElD?=
 =?utf-8?B?bDRZVXRzTk5Dc1dPN0ZjVmJkakprRnhudytZQUNadFZseXBRRVU3T2V2Qkt4?=
 =?utf-8?B?bzJHTTVRTmQzbzhCM3JFU0duWExQUEw1cEtFbzRBeERuc1ZVUG5pSE95cTlY?=
 =?utf-8?B?ejR2MzA4VENtUDVjdFM5MkJVQlJUVmRvSjM4TUVxRllkb2lYclNDN0Frcm1Z?=
 =?utf-8?B?Z2hoNzVGd2VxZWt3ZlJVL0tRWUFkZEdYN1c5Z2t0ODEwR2RBTG55elFYaXNj?=
 =?utf-8?Q?RZc1Rpn5Puqfz880CNFeBEWhgntZ4RAN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdvUTNpM0NoSWY2TE1kZzR1MnBBcnZ4aEtJZkRyM0RQS0pJbW1aL1F5eU1T?=
 =?utf-8?B?bHcyLzYxbXhxNVdqNG9vY1VQd1ZLZVVzd2FXVFZNa2dXdDl2dXlDamliT3dx?=
 =?utf-8?B?YVQrQzZDM3J2TmVDeDYwT2dYTGZOcFpWRGJydW9ocFVpMnhIMmRPalhkUFNZ?=
 =?utf-8?B?cGRsaWNHNXljV3M2RDMwTkk3VlBvd2tlRHI0czBHTDA1NGNlb0RyK21VYUhR?=
 =?utf-8?B?blNXdURHOGNDRHVZNnB5c3hYNXhpZGpyL3hSTnpzeVcvTFYvckViUmxDNURy?=
 =?utf-8?B?eGVoSU5wR3FmeUs1UjJFb1pOQW5wMjVLTkVKREhzbXNqODJFaCt3dnVjZFRJ?=
 =?utf-8?B?aGl0YVcySG1MbXg0dFJWRjhYOFBWN1lQeDdzMmhBUUdkdmhCMGU5RVVOZXI4?=
 =?utf-8?B?Rlp5SkIyb0luU0pGWkRsQVdPcVNVbVU3K1AxeEJXTU9KV1JvcTZCRk05UlM4?=
 =?utf-8?B?eW5UNDluOThjSU93S3lLdVRTbHlaOVZoL0FRS0NERTEyazVKdGI2T1l3Wnlt?=
 =?utf-8?B?ekZTWmx4UW1DY01IeGFaLzczZm5qYjdxUzQzMVZZU0J1am91blZLL1ZBQkVJ?=
 =?utf-8?B?L3YxaG0zY3BPS1QzZllzRFRTa2VhYTJtdVJuTVlTRUd5OVZ2ZkVGbHpNNFpX?=
 =?utf-8?B?ZldRNDdPbzVNL3BCS1V2UE1QWjRaQUlDSW5GWWRYdTJPOW1jTUNKam1NZFow?=
 =?utf-8?B?TUY2YUNMODA1TXZDbTlmU09ZN2pPdnNIdWh3NHo0VEdkemREcnhFL0gvUzMw?=
 =?utf-8?B?c2RFMEIwV1k0RG1qcHhNS3BsSDNoWDZvaFhBMWw5S3JnM3dKRXFKOHg2bjIr?=
 =?utf-8?B?K3hUS2ZrTXdrR1NoWkNkRzJuRlBUZkVCQ3Fud3ZsbEFiek01ZktiU3RkMmhl?=
 =?utf-8?B?K2lCM09KTjcxSk9IbFhkMVdFdXlmQ3hzSXZjKzM5bi9GbmZ6OHFhTTd3NmVY?=
 =?utf-8?B?RVhlem1ycS9YQ2N2di8zYTNFSXJkdDAzTWhnYThyOHUwRjdrQzZVSTlOeUFl?=
 =?utf-8?B?RWlNOWtrN0FUY28xVjR3S0hRTnplTkRrR01CVWxzTE4xZVJJUUhCYUNqbms0?=
 =?utf-8?B?eE55NGkzWjV3SjZaYVA1bWR5Wk12SnZkS0pmWE1pUnorbXQ4c29oSnZOSlZy?=
 =?utf-8?B?MGNxUWk1R1RodWFCZ2tCTWpGR0w4aStmdUZVMS9pQ3krc2d3ZnFHQ2twRm15?=
 =?utf-8?B?ZXRvaUU4U20wcXBnUVpzSHJJeU1udDJIOVRtcWxXYzRXbExwMkRwNFlBVlJN?=
 =?utf-8?B?dHltT2dRMXk2RGN4Ris5Nm9aVTVqRTlDWGVoTncxbmZnZTFEdnNHVUlSY3R1?=
 =?utf-8?B?VERLWDM0WkUyTjdHODZyQitVK3FBdzQ0MDh1UnN0SEpOUWltUjg4cnNlNDBn?=
 =?utf-8?B?WWU5dkc1WEdBb05IY0htZnJmekg1b0tCL01zYVlyWU1ZMUlKWDVON2Z4bmVQ?=
 =?utf-8?B?NzNGN2xPY1pib1Y5ODU1eWFGSnZxeHVhV1ZHSWxjVTBVQTZxWmNpQlMvTUhL?=
 =?utf-8?B?WkRTWnMwaGVXQW9YdldjME9tWkdjWkNkaERTOEhiQ1FyWm5pN3pPejVHMEVW?=
 =?utf-8?B?dXB1THhERFY5Z0Z1MVorNDlmdjR3Y1FuZGE2dDZaSVVkT083R29nMGIzejhm?=
 =?utf-8?B?TytJdHdFemFjZFJPMUVqNFdxMnppeTd1UW44dmg1UmdaWk4zVXgyOWw4eWxt?=
 =?utf-8?B?UEl0RnRzRGJhQzNYUTg4RVg1a05xWitTaGxTUWI1WUhzYVF2aGYwanRXd3Zn?=
 =?utf-8?B?TktWL3RYci81YndkcHpTMTQ2UWVDNERtNFo2TkhUQzBtdjJ3NnplODVqWlZx?=
 =?utf-8?B?Y0dJYkEvYnFYSSsxeEh4bU1zRHRlWHRub0dmMlBUUUV4M1pLK05vem1WUXJE?=
 =?utf-8?B?MnYxS0ZkUDRoU3BEcXVpS1RobDdHMVV5a3loTlVUWlJ3bkhmM29yUktBYTJX?=
 =?utf-8?B?VDh0cmZEWHgrNXBlNFN6dGlYbTVjSjhBalFoaXU1MVU2K1ZqSTd0aHJ2WDE4?=
 =?utf-8?B?MmdibHNHMDk0YXptUklyODZhcWg0LzRJbDlsQUJwdXg2eG5iaG1sbzVITWI4?=
 =?utf-8?B?dU5BdUdGenVPeG83YnZYT0RKbWYzZ1dpYThVa1cwY1kzRFNiem9sNVp2M3hs?=
 =?utf-8?B?d3JaOENObGliYUJvVHFrL3R0L0hVV0k2TzIweFdJWU83eG9GcG82OEh6SElN?=
 =?utf-8?B?Vld2bE1wTDk5V255M0VDQWo0c2pTLzRPYWpMZ1pBVWV6MVpudTBSY0FFMWN5?=
 =?utf-8?B?ZFdxbmR4ZjJJK0Vxc1Q2MDFJVGpQRVRPbm5PUlRlVFdESmM3N2pVd0hnMEtQ?=
 =?utf-8?B?MmRPUGlEZWdtV1lhYWIrKzhJUUxUdnI0L2pmYUY1Z29nV2lZeWtndz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df12d1fa-ee0c-4111-f2ac-08de52b5aa71
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:08:53.6253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZdehVhL8pNfXX31EpuI9pu+DqdIOOVcy/IGM44bC+OaGXT+/B6Lq353Bbn0q86+RPQ7vF7nGGeDU4lkpDvTCTA8LuLVr3oS9IJv1QlMovY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8440

On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
> Amend docs to reflect ucode= command/stanza depend on MICROCODE_LOADING
> being set.
>
> The new MICROCODE_OP() is a conditional setter for the microcode_ops
> struct. By using IS_ENABLED() there ratehr than ifdef we allow DCE to

rather

> remove all statics no longer used when microcode loading is disabled
> without tagging them with __maybe_unused.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> with a couple
more minor points, all of which I can fix on commit.

AFAICT, this can be reordered with the earlycpuio patch 3 ?

> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c3fb1f3a30 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -104,6 +104,8 @@ Specifies an XSM module to load.
>  
>  Specifies a CPU microcode blob to load. (x86 only)
>  
> +Only available when Xen is compiled with CONFIG_MICROCODE_LOADING.

enabled.

> +
>  ###`dtb=<filename>`
>  
>  Specifies a device tree file to load.  The platform firmware may provide a
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 15f7a315a4..866fa2f951 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2748,7 +2748,7 @@ performance.
>  ### ucode
>  > `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>  
> -    Applicability: x86
> +    Applicability: x86 with CONFIG_MICROCODE_LOADING active
>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`

This isn't actually how we provide such information.  It's usually a
sentence in the first paragraph.

diff --git a/docs/misc/xen-command-line.pandoc
b/docs/misc/xen-command-line.pandoc
index 50d7edb2488e..5b6ff94f441a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2751,9 +2751,10 @@ performance.
     Applicability: x86
     Default: `scan` is selectable via Kconfig, `nmi,digest-check`
 
-Controls for CPU microcode loading. For early loading, this parameter can
-specify how and where to find the microcode update blob. For late loading,
-this parameter specifies if the update happens within a NMI handler.
+Controls for CPU microcode loading, available when
`CONFIG_MICROCODE_LOADING`
+is enabled.  For early loading, this parameter can specify how and where to
+find the microcode update blob. For late loading, this parameter
specifies if
+the update happens within a NMI handler.
 
 'integer' specifies the CPU microcode update blob module index. When
positive,
 this specifies the n-th module (in the GrUB entry, zero based) to be used


which is the re-wrapped version of inserting ', available when
`CONFIG_MICROCODE_LOADING` is enabled'.

> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index 71b041c84b..86706a21a6 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -561,11 +561,11 @@ static const char __initconst amd_cpio_path[] =
>      "kernel/x86/microcode/AuthenticAMD.bin";
>  
>  static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
> -    .cpu_request_microcode            = cpu_request_microcode,
> +    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
>      .collect_cpu_info                 = collect_cpu_info,
> -    .apply_microcode                  = apply_microcode,
> -    .compare                          = amd_compare,
> -    .cpio_path                        = amd_cpio_path,
> +    .apply_microcode                  = MICROCODE_OP(apply_microcode),
> +    .compare                          = MICROCODE_OP(amd_compare),
> +    .cpio_path                        = MICROCODE_OP(amd_cpio_path),
>  };

Reordering cpu_request_microcode and collect_cpu_info like before makes
this easier to read.

> diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
> index e6c965dc99..1167b79db1 100644
> --- a/xen/arch/x86/cpu/microcode/private.h
> +++ b/xen/arch/x86/cpu/microcode/private.h
> @@ -93,4 +93,6 @@ void ucode_probe_intel(struct microcode_ops *ops);
>  static inline void ucode_probe_intel(struct microcode_ops *ops) {}
>  #endif
>  
> +#define MICROCODE_OP(x) (IS_ENABLED(CONFIG_MICROCODE_LOADING) ? (x) : NULL)
> +

This wants /* Aids dead-code elimination of the static hooks */

and wants to be up beside struct microcode_ops.

> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index 79bb99e0b6..a55060e662 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -309,22 +309,30 @@ ret_t do_platform_op(
>  
>      case XENPF_microcode_update:
>      {
> -        XEN_GUEST_HANDLE(const_void) data;
> +        ret = -EOPNOTSUPP;
> +        if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) )
> +        {
> +            XEN_GUEST_HANDLE(const_void) data;
>  
> -        guest_from_compat_handle(data, op->u.microcode.data);
> +            guest_from_compat_handle(data, op->u.microcode.data);
> +            ret = ucode_update_hcall(data, op->u.microcode.length, 0);
> +        }
>  
> -        ret = ucode_update_hcall(data, op->u.microcode.length, 0);
>          break;
>      }
>  
>      case XENPF_microcode_update2:
>      {
> -        XEN_GUEST_HANDLE(const_void) data;
> +        ret = -EOPNOTSUPP;
> +        if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) )
> +        {
> +            XEN_GUEST_HANDLE(const_void) data;
>  
> -        guest_from_compat_handle(data, op->u.microcode2.data);
> +            guest_from_compat_handle(data, op->u.microcode2.data);
> +            ret = ucode_update_hcall(data, op->u.microcode2.length,
> +                                     op->u.microcode2.flags);
> +        }
>  
> -        ret = ucode_update_hcall(data, op->u.microcode2.length,
> -                                 op->u.microcode2.flags);
>          break;
>      }
>  


Both these hunks will be smaller as:

    ret = -EOPNOTSUPP;
    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
        break;

and that's the preferred style too.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and I
can fix all of these con commit.

AFAICT, this can be reordered with the earlycpio patch 3 ?

~Andrew

