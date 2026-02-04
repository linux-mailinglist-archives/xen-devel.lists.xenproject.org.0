Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HHlExw7g2ngjwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 13:27:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6078E5C53
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 13:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220457.1529142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnbxO-0002dm-ST; Wed, 04 Feb 2026 12:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220457.1529142; Wed, 04 Feb 2026 12:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnbxO-0002bb-Ok; Wed, 04 Feb 2026 12:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1220457;
 Wed, 04 Feb 2026 12:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnbxM-0002bV-TN
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 12:26:04 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab803167-01c4-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 13:26:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5627.namprd03.prod.outlook.com (2603:10b6:806:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:26:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 12:25:59 +0000
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
X-Inumbo-ID: ab803167-01c4-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REsPZ1ZnV07KYb0/3UAhK9MV41qWDcxR3KrH7tE2n6RXw4bAIta/r1nc3CjLQZo4k/EsQp7mQKVVX0TFM0xiseh0GtPdrKtkqzN4crbuVeWEiZBUVA+7b6Vma+wwdp0ZzpsHdEESM0dMB2O/5VH6wkAaxmJoW+2RMCtD4snrJOcsX4L0C7ogt1h59cGsYiuaFgE15swILHrNQeDOG/skwBjpc4z+366Lo5iHHae23a385CidqeMv6JuxNKW6EjL9hkpFkloqHQTXDjCeXnubn1txYseLvlcxSj9gGmDGONycNiOu9qHURrLmCuNwYvtc+fXi+5dGMGD94DBLSWIzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NplnYzZ49+HFc7kpIoeOhMDuB2MJKPO8C5g0pi9GxEQ=;
 b=vSAFcHvgaN89iUlIWQ6u70l1a775TFgCGBUSq2bXQdTytbmNaM+uxWiKjl4Cq0S2LH+R0vEFUqCyBM8LaFl/aoayVz8Lchlpvqmjuv59Z0oEPXRMUbFaNTtxi5ysblp3p8zI6yMdmAWUwGOkl+WF6kt1pSdj5+2O1P0+PVDk5vV/5X9n7w1K7Jk0MXhtAFoP8NkPARH0ws5NuS1KC0e1AEclWtI3PEul+0OgfPhF4azrcJ8E00TbYcn6fhlj14/hyljpkgflhqixuQTKy5Ur5aHGebI3KkOW0C2s9Vcox1J5aB5RiMMnOM7UWfqjFcnR+Z11obguo3ck12UNPDa+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NplnYzZ49+HFc7kpIoeOhMDuB2MJKPO8C5g0pi9GxEQ=;
 b=q5mWeJgBpDhSATvJaQExvpdiuLzlrUJpcFHHHTp/sw/iKmwvqyJpfBpgOA43etdRGdvXGgpZBafk1taIYM9aPWeRymMP6OJckFAGSVbmAcOTZwATDKYSfF9tgpOeSQrVmWRMKsmmE++G0jvG/k6HcSlM5FAZVBg8yaQKbmIpR60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] x86/domain: adjust limitation on shared_info allocation below 4G
Date: Wed,  4 Feb 2026 13:25:53 +0100
Message-ID: <20260204122553.75711-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1363b7-daef-455f-b472-08de63e88df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VThrVGIrQVFncDF0RmovMndHVzA3MWNTclpid3NGOU51bTFTc2ZuT0lob1lK?=
 =?utf-8?B?TDJMV21IYnV5bzZpNlMybVo5STRPQXZlVmt6QU9tTGlrSFRuTDk0TFVZc3p6?=
 =?utf-8?B?dWxvdFQvRGY4MWJGekJhRGw0LzMrVGlKOTlOUVp4VUhReSthWDAyTGlOZHY5?=
 =?utf-8?B?TmlUaWNFTnFhN3dSSlFVMHBOVm9pQnA5S1lneGVINlZrUitjSS9IQ01UV0hX?=
 =?utf-8?B?QThYL01qV1R3R1NWMjdka0JSUEFSemVNUjA5QmsyM3czQmNHY2RFNGF1bms4?=
 =?utf-8?B?YVkxekNsbmNxN3NONlE2ZDJkL2s3SzYrVnNLSTA5RzN0TUVqTnZJc0JTY1I5?=
 =?utf-8?B?MGJZUCtmRmVyOXZwWXZUY2hzdXlVZEVlTkNGcWxWdkZsY3dBRVc2YVJrWGpp?=
 =?utf-8?B?L3NDN3Zrc2ZwVUxaZkNkTStEdVpRa3lQNHZsQzdGTU1mbHRVN3JqYmtmcWJu?=
 =?utf-8?B?UW5qSERSNDVEYVRlZk5wNGZrL05kQ0x4VkM0WjFzNGVxWVkvWFlwUnNxUVRa?=
 =?utf-8?B?U2JIZThNMlNlVkJnOFVqZGJzYmlOcEdFTCt1eDF2RHJvOVRoYWpUbExVajA2?=
 =?utf-8?B?QTgrRVIxeXltVkFWcURQSUF0bjFCMldEMkVydVh0R2VmN1FicGhrUUUzNk1G?=
 =?utf-8?B?Zkh6RzFGQlpPT09hcUFkOWhSMXRKdWVGd1ZFRkVrNm5QbEQ5VFBqMnA0OSs5?=
 =?utf-8?B?eGo2ZWxuL0Y1V3ZoQlNBRXBhamdhVlliWWNidVMzYW9RM0dtRlE3bjNzUmtY?=
 =?utf-8?B?MWJoOWZRRklMS1hKczRrQzVXc0t5eEM1SE5nRm9SN2Z1Q3h4K1BCZEpZeThn?=
 =?utf-8?B?TjYwRE5pbzd6UjFUTVNPQWZQQ2tFeHBsL0ZQZ1IxeW0xNjhBMVY5bUNEM1dK?=
 =?utf-8?B?VHV2MHg5dEFza1RUbFJPUEhWbVNyWExhUEhTTlh5TDlpZXFGOTFheHhiMHlO?=
 =?utf-8?B?RzM2MXpHa1hmSVo4VERUV1ZUc01HNTdxejM0ZE1mdUxHRmxoMjBtMnRlRXFh?=
 =?utf-8?B?TWUyQTNZb1o3cHpuQkFKcW12M3JDd2lkSE9ENmQ0STlXaktBdGthTzR4ZnI5?=
 =?utf-8?B?KzZWVkkvcldUUTQ1N0NsU1AvZnYrN0owOE90VWlHeE11Vk1vWjhpck9UV1dX?=
 =?utf-8?B?RTMxTzNJK0ZGZU5xKzhBRXNjZU5mS3krenhBZDJVeDltdWg5NzE3R1V1ZkdW?=
 =?utf-8?B?ODBOK3Q2enN5eEZTRGJiUlpaTXRITmNBK3FCVlc3ajdETnVjaGVha2lrUTM4?=
 =?utf-8?B?SzhReVFKZm9sR0dUayswc0VvUU9qandHMlNvZXhvaHRYZ2hRODZZSk5uZzhE?=
 =?utf-8?B?ZmFodXB4QTJMY08rQVB4TWh2RUlLajU0UVNKb0Y1YXdMZEpPVmlQT2hMbDhY?=
 =?utf-8?B?bjcvd3ovUVJPUVpWcUdmankzSFNqeVk1MHc1eTJTN0U0OW9peFYzVS9KSXZU?=
 =?utf-8?B?VUQ0dGpWOHRET1ppYTZ0VDJZY2pSRXQzWkdQdzJPWWdqK0hSSlFpRS9zTm5L?=
 =?utf-8?B?SFZFY0x5NlorYlYxMVVTQ3hFdjBNaTJtUHIvUEJRZlRFS3RvRGlzeERueTQw?=
 =?utf-8?B?MFM3RjFNTlgrQnduM2E1WTB0eEtFTzFJMjlEaFZSWEpSa0ZpMW9wVlRLaUNV?=
 =?utf-8?B?TmhXazVqbVdkUFUyV0x3RnZUNHlpNEE2VU1HV0xHa1hJZWhSdjdmNHZyem0z?=
 =?utf-8?B?Ti9yaDdLWm43azFnR2FmcGl4K01rMnBpUngrSW8vVmxrTGhJRy9EMHRkSHhC?=
 =?utf-8?B?OUFvZWlMMk5oMWI5RXNGRWp4ZjY0MFpoeVBzQ3NtWGpzZXlHZ0J4Z0dEbnUx?=
 =?utf-8?B?Z1QxSHhjTDNQR0hBaTM4RzEzaHlOam1IU0F5QTNQV3lSU0ZwUDNIY1AwRXlM?=
 =?utf-8?B?eTZMTnMvNUY3RUdPQVVUSFNPeUR1Rm9GWCtEMjYyOTBEYmVQU2FOYm5aK3di?=
 =?utf-8?B?ODdzNGFhNFJkbXloRFdCMmh4ZktITWhuL2xTVmFSb2dFL1pzL3BmeldUUHE1?=
 =?utf-8?B?bEhMOWxTVXdkMTZWVXplQmZIYmU4RGo3UW40eUJ5eUpCTUR0bWRNakdRMVdZ?=
 =?utf-8?B?RVU4VEZFOXc0eGhqaTZnRzdMRGlBblVBRzFpa3Z3LzZacjlLeGJ3bzZialBk?=
 =?utf-8?Q?UBkE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2RwWksrdmt6MDBkamNNUnJKdTUwcTZTQzNpZUt1S00xeUhtQWpWVk5ESGZC?=
 =?utf-8?B?Z1c5L3c2T25DZEFWNXpsUlpOOEVzdStWKzRrL1NJekRDZVduSVptZVJuRXBk?=
 =?utf-8?B?RDNRdzUzcGlTbWQ5b1Z1UDAzY0dpNGVsRHBSend4bkFGcHJEWVB3OEYrTDNq?=
 =?utf-8?B?N3lDRUxRZzFQU3Q1TThiMURsREdRbXlseFN5dTg2UG5TcUlLMlZOUHFyODhF?=
 =?utf-8?B?TjlVMGJDWmhrSDQ3aXdCaWpKd2E2MFMrUlhzWlRzWEdhUkNMS1g5QXduRjdJ?=
 =?utf-8?B?NHFYZDBXNU9DNTc3TDdLSFlIdVludTJybUp0SHpVUTZVQTdHVml3QzBBUk94?=
 =?utf-8?B?OTU5dDhQNDlXZDFVeUhWaGkwaWNtWHh6RUZLVXc1UlU1TkZHWTIrY2F2N3BT?=
 =?utf-8?B?VlVxZm5MeUFZVFVUVnNYRFZ3SlF1VmYwdlU4a0hHV1hRNU1MYUE0UkxPQ0R0?=
 =?utf-8?B?RVJuODg4WUZiNGdMajYreVVBY1JDcHk5T05lNDFZMDZjTHRyMlp5ZWZ4WkdV?=
 =?utf-8?B?ajd2MDBPazNKTFJQQWsxakUvclUxVGNTWExhaWhGT25velljeTNuc25MUVQ2?=
 =?utf-8?B?KzByeDNhQ2xQcUNZZXF1WVgzUVBUL3NNM2dYNmV2RW53Ylc2NzErbkdjVlht?=
 =?utf-8?B?SEtMT0VBNmNXMWw1QXVmNnNEQ0tKWTlvMTJhVUdSRFJLdmtBSHptOVJnVUNF?=
 =?utf-8?B?dUxWUXFJR2hzV0k4Q09TL2dZeUR3RkhBQ2gvYVlPdWFKNlY4STBBMTlZMllR?=
 =?utf-8?B?VjFiYWo2anZsSzR2N2NWU1p0eW1RQllZbkxLT2JoRWZ1bWt4ejQ5ZDNRNFBF?=
 =?utf-8?B?ZlgrV2YzNWtQVFJGWFZWS2FrTE1DeW5OZ01wL1NIbzRIdkdxVTZVRkpvL2tZ?=
 =?utf-8?B?YnU2VUFoYjNsS2QvSzAraHhpdXd1TnlkWlgwNHBtZ2hTalJaZS94Vi8rTnA3?=
 =?utf-8?B?dTh0anF2TktmYXB2VFkzdG4xR0dVVTlQbnVvRFlPeEl5ZUJvNExucmxLOHV3?=
 =?utf-8?B?R2t4eGtYQ29pNEZKRHoxUDV5dXFKT0JlSGJOZTZ4R3NpNE5SREJqaVR5aUdK?=
 =?utf-8?B?Z2ZrZ2V2UVRmb2dUZzhCWlRLQmJDWmF4VzdzNVBwTWZUcUk4ZUxpYkUyRTQy?=
 =?utf-8?B?THIzdkxPSXNUNWoxbVRCVEU2TWo1NVJaamRNNDViam9PaDB5eExRMlNqbDdN?=
 =?utf-8?B?bWV6VnIxZDh4NERlMzE2V0lFNGU4TlVobVl0ZEJLMCsrSnFQbUNPbWp4V2Mw?=
 =?utf-8?B?OW12OFZrUTF3V2FhSkw3RnRoRG9jY053a1diUVlUajhvT3ZTb0lqWFJDNnUv?=
 =?utf-8?B?NE5lZUhJTUducEVKK0tkRXJ6WkI1TjRTbVp0K010L054YU45Vy9DSzMycVpO?=
 =?utf-8?B?cXk2RWMrc1BzV1FlZGh6dVVYOUhIdnFWcnBXMXhqZjY2Q1IzelpjTEhrb0E2?=
 =?utf-8?B?QVlGYUJLeHVzK3N5aHU1ZDk1a1VaYkZ1a3FGUkZkNE8xMHhXckk1SlJqVm4r?=
 =?utf-8?B?T0pLdmx1cXpyZGFCOFE4SzRzbFEwZmJjQU9vNnEwYS9iM21lTmFWaHlsQ0dr?=
 =?utf-8?B?M0Z3Q3dHTjdidVg4blZOZVdLLzJMT2JBNXhVSE1RR2pCZFMwelpKb2VuRHc2?=
 =?utf-8?B?WWlOVitiL2pMQnFjOWViZGlEc0tqS3VyOUtuelYvcXVTOHJjOWpwSEVPU2FU?=
 =?utf-8?B?RDhKU0kzaFlZaXQ4cFMrS1BnbGxSbHVvNTg3ay9MaHE4aUNXdlErbG1oUWNT?=
 =?utf-8?B?TGlZZ0lFWGo4dVJLNk5sMkVpRFlVcXpJd0orWDVzd21nVy90bTY0SmVaZER3?=
 =?utf-8?B?NnpjZ0U2Kzd4OUtKZ0t3R3V5Z2taYnk1ZVNrTFVldktPdFVQTXJ4aTJZZXQ4?=
 =?utf-8?B?MWRqOVdtV1E2RmtrN29OYnUrb3BaRFE5QkNIZlRYU1FSbElUdEM0a2N0UTVN?=
 =?utf-8?B?VUdxQUVxWVkrdE9KT3VTZmdrekZidzdhUGNEem1RdVhTZjZXNnp5MUM5UDBN?=
 =?utf-8?B?VFFycWNQZ3ludUd3UnBPOXl4QXpiamoxOERacGZ2TE83WlQ5aVpnR2RBYU9h?=
 =?utf-8?B?WGZkUjI5ZGI1a1k0OURkM2ZVaTZGbkNRSmkxSkxWaTNaTmEwbTNrSnJiQ1hM?=
 =?utf-8?B?Rk1pYndBYjlQSll5VGVsSTFFc1hVSTZUTWFHOEFEbmVJTXFKYnI1bC9IS0V6?=
 =?utf-8?B?cU5weTJsbTVvQ3RPS0VmTDlJZkF4WjJoOXJ6T0N1NjVMaUhRODBqQVpidHlQ?=
 =?utf-8?B?cjU1bFNlaTZjNXNkZm1PaW1LajlUQUh4aHY4SG5IRHVIQzMxb3QrUUVWRnhv?=
 =?utf-8?B?VEdaaWF2WmtEdXZVWjBWeXZUTk5uekJldlpiQTRmeWpocXFPb29HZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1363b7-daef-455f-b472-08de63e88df0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:25:59.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i58PP+pzbkr5n6HXqzOnUtd3OpoTM+rpvbKNqQg/Yn67vzLgXjzVSXQh4XRprotJrPt81iMc80wOP5cfRAZyRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5627
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A6078E5C53
X-Rspamd-Action: no action

The limitation of shared_info being allocated below 4G to fit in the
start_info field only applies to 32bit PV guests.  On 64bit PV guests the
start_info field is 64bits wide.  HVM guests don't use start_info at all.

Drop the restriction in arch_domain_create() and instead free and
re-allocate the page from memory below 4G if needed in switch_compat(),
when the guest is set to run in 32bit PV mode.

Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c    |  7 ++++---
 xen/arch/x86/pv/domain.c | 20 ++++++++++++++++++++
 xen/common/domain.c      |  2 +-
 xen/include/xen/domain.h |  2 ++
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index edb76366b596..3e701f2146c9 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -882,10 +882,11 @@ int arch_domain_create(struct domain *d,
         goto fail;
 
     /*
-     * The shared_info machine address must fit in a 32-bit field within a
-     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
+     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
+     * field within the guest's start_info structure.  We might need to free
+     * and allocate later if the guest turns out to be a 32bit PV one.
      */
-    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
+    if ( (d->shared_info = alloc_xenheap_page()) == NULL )
         goto fail;
 
     clear_page(d->shared_info);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 01499582d2d6..8ced3d70a52f 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -247,6 +247,26 @@ int switch_compat(struct domain *d)
     d->arch.has_32bit_shinfo = 1;
     d->arch.pv.is_32bit = true;
 
+    /* Check whether the shared_info page needs to be moved below 4G. */
+    if ( virt_to_maddr(d->shared_info) >> 32 )
+    {
+        shared_info_t *prev = d->shared_info;
+
+        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
+        if ( !d->shared_info )
+        {
+            d->shared_info = prev;
+            rc = -ENOMEM;
+            goto undo_and_fail;
+        }
+        put_page(virt_to_page(prev));
+        clear_page(d->shared_info);
+        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
+        /* Ensure all references to the old shared_info page are dropped. */
+        for_each_vcpu( d, v )
+            vcpu_info_reset(v);
+    }
+
     for_each_vcpu( d, v )
     {
         if ( (rc = setup_compat_arg_xlat(v)) ||
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 376351b528c9..11fed22455b9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -305,7 +305,7 @@ static void vcpu_check_shutdown(struct vcpu *v)
     spin_unlock(&d->shutdown_lock);
 }
 
-static void vcpu_info_reset(struct vcpu *v)
+void vcpu_info_reset(struct vcpu *v)
 {
     struct domain *d = v->domain;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 273717c31b3f..52cdf012c491 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -83,6 +83,8 @@ void cf_check free_pirq_struct(void *ptr);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
+void vcpu_info_reset(struct vcpu *v);
+
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v));
-- 
2.51.0


