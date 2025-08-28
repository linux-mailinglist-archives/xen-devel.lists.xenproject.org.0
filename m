Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B666B395FB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097734.1451954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXQq-00059s-8N; Thu, 28 Aug 2025 07:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097734.1451954; Thu, 28 Aug 2025 07:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXQq-00057P-5f; Thu, 28 Aug 2025 07:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1097734;
 Thu, 28 Aug 2025 07:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urXQp-00057J-6k
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:52:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:200a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edce28c0-83e3-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 09:52:24 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Thu, 28 Aug 2025 07:52:14 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 07:52:14 +0000
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
X-Inumbo-ID: edce28c0-83e3-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bas9Xs8U9spsyO/5/87hZhAVhR4AAxfz6tR3q7oVBABzDQ62Nrr9YKUFiy5X5pxTXEBaYBZbtHWRo9k19HOzpE+oU0uHhL16J8O/lwtwfQ9malMIQNYlJVHJtO2SaxPXRS6CfJtbQq9wx4tQ/HQ4dEaF2kIdU+RGB1tAilDSwTSgfLIan777H5NbkVnp5raR0oaZxw5m9SYDS4jxynPHnLfk13dNvr6MYIMzU+lo9MiiGzNMrlZ8Bwi16re2MOoOOq2pE0ZgBch2gbvm+7IxLVl0KP5G8emdUsIwjS/f5mYbm2UNhIPSOWWAAah84Y2Q6jZrgui75KNaNAFdN1HBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhOBOTLX6ttaW+KVs+rgnEKj0WR1O2TRaV0AFdt4qU4=;
 b=AkdjYyzORtS9UhzLTxbptjzwsp87K7unu9lJMofBZl3/E+6V76qWy/ABkTlCw5MfZsGFFqGFeYe8c5Utiz0ajnm3hJTFy1u1lRI87KA5klfh87V6zSScLJW3DoKWTFXLR2domRmvpyiNUC/GblfbNDZ+uYQeM+2cTg8nt6S82Un97Z/isPFT2pf3a19uHgmznlDpUQNstwDRGW8gZbTj0evZEhDV+oI9Y3WJI/kfsV2nZnlSNcM1Dymk+7qoIGGlAIZSJqHsa/hCw2nsWUrEQvec87ajM1yIH1/Pq7gimD2aScUqrDLTAtfVNA3jNkDLx4lJ/wuiw3IuxUP0vp1Dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhOBOTLX6ttaW+KVs+rgnEKj0WR1O2TRaV0AFdt4qU4=;
 b=Cz8/lA0fKnoT5gzJ/x6TDsUbddJ4YRBoY4khTe/lepxp/jDI3KHVlxlMzmNLTZVcNnDBg7z8mMPtjja4zMlfKs0QvZwqzHB7xM5ajSnteIbhULhBRdvfSaVEGJmwz3ZlJH9e/zVdKOmGcAuk95kj4oJoMwYVt9T1k1fLey3upp4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index:
 AQHcE1L0WO8OIJho60KGV8JFR/QspLRzjMCAgAJSvzCAAcXZgIAAAHmAgAACEFCAAAa+gIAAC74w
Date: Thu, 28 Aug 2025 07:52:14 +0000
Message-ID:
 <DM4PR12MB84511AC25786F17F2AB2C2ABE13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com>
 <f27c17e6-8c88-42f3-b0e2-874aa02597c5@suse.com>
 <DM4PR12MB8451CFF93199B96578D96F88E13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a877ad1b-1628-465b-9b38-dce347ba8ba1@suse.com>
 <fa8f951f-610c-484f-a9c4-9b76b8f399cc@suse.com>
 <DM4PR12MB8451BD022E0150D6D784CDBFE13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <8d591b74-5ff0-451a-b8ca-a8c71c0e2871@suse.com>
In-Reply-To: <8d591b74-5ff0-451a-b8ca-a8c71c0e2871@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Enabled=True;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_SetDate=2025-08-28T07:52:07.0000000Z;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Name=Published
 AMD
 Product;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_ContentBits=3;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH0PR12MB8507:EE_
x-ms-office365-filtering-correlation-id: 6146a601-282c-4fe0-1cc4-08dde607cd86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d01WU3hQZDl1US95R2tlY3I1L250ODFWT2QzeSs0K3RKUjQ1ZmdibmdjcXBT?=
 =?utf-8?B?Ry9xczR4ZnNRSXRtaCtjMGNybUdna1AzNnlBN3MxTEc5bm9OMGVocjlqRkJZ?=
 =?utf-8?B?d25JemZWYTd1VkhlaVpwWGpsREt6NEhNcHg0dHM0SEpaZDJVa2hmSUI2Y0tz?=
 =?utf-8?B?TlZpYWpGakFESjlOT2oxZ0QzMG81UllYYUhadW5MZ0FhdmxPZk4yelpEWm9R?=
 =?utf-8?B?c0tYcXVjUUI1Rkp1Rm5nYmtISndnMitvZzM3UzN0Wnk1bkxNaGRkYTBLREc5?=
 =?utf-8?B?cFpKaHZwek0vUFEzVTZ6bGxLVVd1T0VqU0JmeCtTRTl1M2h6MkxPUjRnWmpP?=
 =?utf-8?B?MlNSek9haGtiZkRTUVJlSTFwZkNTaU9qc25hZTFlTkgyT1g2cW5TS3pJMmhD?=
 =?utf-8?B?aEprNm5GUU9kSUlBSVdzMTBxUktlQmxhMW9selBYQnIxVWpuMEVKVHZlRFhW?=
 =?utf-8?B?Y243MmJTNTVHZk1iWjlEY1R5WklWbUVndUlxb21JK3RzbHEwWUNqTUtGdWxo?=
 =?utf-8?B?TDBVVDZ4bnNuNlhTNHpHT0VRZzcwbzlPUGxiK1dzMXExTk5laEFIR3AvNlIr?=
 =?utf-8?B?dFFIa3BGTzhIbmoyTmtxVHNCNFVId1RsNHJlUklqTkdaSlQ4bjVmUWpzUVFH?=
 =?utf-8?B?MS9uc0lySkdWcjVscVhXeXFlalFwOGZZZDROU1JOTDBLOFd1cnRFUVdLTGpV?=
 =?utf-8?B?QVlWUWxhSkczN3orYWRDSklxNzQ2V3VHZGJmVUUzWkFVWVJmejRYMDE3d2FR?=
 =?utf-8?B?dkRIVnBqTGZFcGh3QXFaZlphemlYUTBuR0RJT25UWkVLcEgvcUo0ZkRkMEdT?=
 =?utf-8?B?OFp4ZTB2MEpWckxQYVk2SUFRaVRPSUhpb3pRNHErNVJjcFBWTVJZTVpZOXE0?=
 =?utf-8?B?QlJ4U2YxcDNGTUxIWm5WMU5kRCt2Vk16VWhKbWNuUUtiN2I5OHo4aHNxOXor?=
 =?utf-8?B?REY1UkdUTUl4QVhKbE5Velc0dkFGVkh3a2h3RXdIUzRidUJuZHRXV251SXMy?=
 =?utf-8?B?YzJxNFRMTG1BemFkNmsrUFlCYzh2ckFrZUdESi9KUGxkYTY2cGFId0MzdDBq?=
 =?utf-8?B?U09nQ3ArcWVMSjJhbU1MUUNoMmVBVGFxM2l1Y29PQm9Ob0ZhVW12RHJ5QTBn?=
 =?utf-8?B?Z0tyaTJJS25ER3FnOHRjWloyRTNKRUtBRFVWL21NWFdSZ0hvYlk4Wnl0cmJK?=
 =?utf-8?B?Tno4RDJza050QWJ6eWRkRkQyWWkrd0ZDTTV4M3M2SWFKNm5WNVAzR0dVbUo3?=
 =?utf-8?B?OEVlTHc3b2hqa3VrY21pOHNkQXJIM3k3TXc4TG5BZ1VjRGhmdVB4UktoMWlp?=
 =?utf-8?B?b1lFMXo5UmwyaFZFbnZCc3ZFb0d0Q2Y5Q3NncW93KzlMU3AxWWdXOHFKYmRN?=
 =?utf-8?B?dFk2RXlBeE9sODFGQ2Nld0tQTUpiVmRRK1o5TEoyUE5qcmxsTlptV3NtZEFr?=
 =?utf-8?B?TG82RWswWHhZaG1CdXFiSzlJMjdweUlLUkh6Mld6NUJQWjZTalIyOUpXSUZX?=
 =?utf-8?B?T2ovY0taQmM5T3d2NlVpcmFRZVV4aHVTT1pnSjh5UFRXYVovM3NoOHF4SzFy?=
 =?utf-8?B?YUNlTnRZK1psZ00rLzhmZEI3V1Q2b0JxbWtRUlNBVEZjSXNpR3JJOENoUC9C?=
 =?utf-8?B?LzBaNFluaHd4ZkgyQytrOWFUbHU2dlRzQi9vU0ErRTJUUUFFUGlDMENsN3BP?=
 =?utf-8?B?ZEgzS2NZeGRMU3R5eTdSVklRNUl1b0tuem5pNTFRU3VKcGJzRG01c3MwMEZW?=
 =?utf-8?B?UzVJK0IybVRVcitqZ3BlUnFWQjRRTzNkWi9Qb2RZckJXRXVnc1R6YjRDVjFE?=
 =?utf-8?B?ZVBONkhrNi9WZ2x5MjFDMlY5ZXBJWmozbWc2ZU8wTzBnMUFMaFRndHI3RzNi?=
 =?utf-8?B?MFcwZ1kxNSttaHk2R013UHdvSGVJVkZYaGttK1pleW5SbTF2SDRxK1NCWCtI?=
 =?utf-8?B?TGh4d3FZVXBoUUR6dHFxMEg0YTJXMTgwS200K1JuYXNpTi9Dam1Va2xSSVhZ?=
 =?utf-8?B?bEJTR1pWc2t3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Umt2T0FnV3ZZTWdWLzYxN0libXFSUmhNN0ltc09lS3QrMUROUmlnK0Q2bm1t?=
 =?utf-8?B?WFJrWXJHV0E0ZzVreERCVzQxUHBHWDEvWEFDbUtKTXl6TkNsZ1RkVWdIREdY?=
 =?utf-8?B?NXQzVGsySUt4WWlsK0ZBdjU2R0xkc01DNXN1YUI4cjZrUmEyamRHaFhQN1Fw?=
 =?utf-8?B?K0FseFRxQjVPaVRERlQ5VTdzNHJqNGJhWURQbGY3UzNYM3d0bjY3NmpVNWdM?=
 =?utf-8?B?T09rbEVrTFplbWJYTDUyaEtMaXk1NzJOM3RhN2hhU1ljeXVJM0tINDhoUnNK?=
 =?utf-8?B?NGdJTk40SzQweXFRRkxUK1dodm1iNFBzQUdTL3B5OWk2dk5EMWkyVmZBSytl?=
 =?utf-8?B?WVhwdW5UZmFscHBTRHBjTGVZMVQxR3RyaEk3dnMyK3BYNk1rTEpkcDJEZFls?=
 =?utf-8?B?eldrZmVOa0Q0VkVhd1c3aXE0SXY5VVVWN2RwYXJabStqc0pKWHI0YU02RU5J?=
 =?utf-8?B?b2tLSEdNQWw3ZjlpZVVZbXVMRGx6amFjaytMeTIwN05Xak43RlMwMUNrMDRz?=
 =?utf-8?B?cXR6WWMxWTBKQTM2NVdSaStLUlZKRWJoc040OEdqdHlGTEYyTnI4MFMza2Ey?=
 =?utf-8?B?QkM0L0lEd1dCN3RrNWtSTGNtMGx2QytmTkhoa1lXdXdhbWNCT0JUa3ZjSmlV?=
 =?utf-8?B?aGRrMVRiSXZWN0VMVVB2TXprS3lnVldQMTlVNjJlWHNwTWp6dWlTaWhJV2Jq?=
 =?utf-8?B?ZkExYWROQWF5djIrOFB6UEJBUDZvcmdvRnFYUDhmeDFwMFliekx4U1UvZzN6?=
 =?utf-8?B?bU5SODBrNXlEaHYvRjluY096cEFCZWJHM2E1QVdINytSaXdxaTJoZ3NTN0V1?=
 =?utf-8?B?OXh4WXY0TjhMSWJkMktUK2JDdnpjc3dWOU5YU3RzZFAydHpOSFFIY0IyMUZo?=
 =?utf-8?B?TW5ES3RMRzJtc2tkVXdpUVhIUDhtbmluVHdrSDVOR1RJTWpyYWttVTJ0anVl?=
 =?utf-8?B?NDc4SmtpSHVtRGtkU0ROWTVwT2hUOTlaa0RoZDYzVDdpWVpGU04wcTBCSFox?=
 =?utf-8?B?MWFwY2FJbW9FUEZzdzcxOFdlQ1N2NEJzYUFIS0N4L1FqU25yS01XdnY3aUMx?=
 =?utf-8?B?ZmZKWDdNQjVHRGxvVkMya3BsTFE0U0ovS3ovL1lUcVppL0VVeTllTmxjYzN3?=
 =?utf-8?B?THdqZFhqd0svR2dPUjF3cWdvMU51c0VDMzlqcmwrSjJUODRDVGVjRmpWTUc3?=
 =?utf-8?B?dXVUYTJ5L0NoTE95UER5TlNCd25MSU9GQkpIaUdnNWkrMDRmdzZ3Vkl4TGkx?=
 =?utf-8?B?ZWVrUlFFUlBFVEJNYWVQSnhpYmxwSU02YmFhd2JBUkpCV3FpWlB0OTNYODZu?=
 =?utf-8?B?Z2h3ZUdqOGJNU2JneHR5SEVnUEoxcjV5ZnVrMmpvaEZqRDgwY3JVRjdJbDBC?=
 =?utf-8?B?akZFZjJRY3Y4cE9BQmw2UFdmTzFQWWFEWGREN2NMMjRTUDFFb3VhMHJPRzNJ?=
 =?utf-8?B?Sjh6QlNuVHY5V2gvV2d4R292MUxLdHU0ZUg4NEJXV3N6d1BzU04yWDBxYy8z?=
 =?utf-8?B?QW83eHhUaFROM3o0dk5sdzNzYmc4Z1ptcjFzYkVuRzloVlJ6YkovbU80NXdj?=
 =?utf-8?B?bmZFWWZYOTZ2eUhKVE12cUhYK1hSS1FzSDZQOXBDZzRUZDVWaHdLNzNjazAz?=
 =?utf-8?B?MkV1NWZ4OGNBT3NhUUw2ZWk5T1JWbVpaRDZQUE1UY3dubDBkc2dlWGxGOVJT?=
 =?utf-8?B?SkZtWm8zbk9ic2FiSGNzNzJoME00OE9wdWkrazRkdWpiR01TR2N4MVVpeUp3?=
 =?utf-8?B?bkJOTkVxbFdtNlJ0am5xY01lV1pTRlkwaVlNVGh3Z0FXc0VxTXp1SWt3TU5r?=
 =?utf-8?B?L2ZTQ0ZWUjc4YUZ4T1BVZndlcEsyOEYvbEMza2RCOHF4b2JIV3FsdUJidkZ6?=
 =?utf-8?B?QVVPdnVRK2FNVW5ydUR0V0F0dzdGZWI1MXd6cnJzY3JjRzRpRE44ankwY2pj?=
 =?utf-8?B?WXhXWjBlUW9SOHNBRVVjR0NuaFZDeXFKWWFzRFNmZDU3am8ydkZ4WkRNYUZp?=
 =?utf-8?B?UGJzV2hENzUwZERMMlp5bzJUdDlGb0ZkZWRLbGJTT1A0Qk8yaUswTUhOSmg4?=
 =?utf-8?B?YU1tcHo1c2p1VTNiQ1lFOUJ5SVZWZmdHQTlzUjdYSEtpbSt2S1I3WGpYUHh3?=
 =?utf-8?Q?tMus=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6146a601-282c-4fe0-1cc4-08dde607cd86
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 07:52:14.3713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cUYEbVhYLEQMDIPuae7bg3csVIoqtqjGTbSL2aXBvRJvj/3IQ5o9VPiwhK9rEGaazVavXs+Kmf3hSRY0ewccHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIw
MjUgMzowOSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NyAxMy8xM10geGVuL2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDDQo+IHhl
bl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAyOC4wOC4yMDI1IDA4
OjU0LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIwMjUgMjozOCBQTQ0KPiA+
PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+PiBDYzogSHVhbmcs
IFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA+PiA8YW50aG9ueS5w
ZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+ID4+IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+ID4+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47DQo+ID4+IHhlbi0gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NyAxMy8xM10geGVuL2NwdWZyZXE6IEFkYXB0DQo+IFNFVC9HRVRfQ1BV
RlJFUV9DUFBDDQo+ID4+IHhlbl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPiA+
Pg0KPiA+PiBPbiAyOC4wOC4yMDI1IDA4OjM1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+IE9u
IDI4LjA4LjIwMjUgMDY6MDYsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiA+Pj4+PiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjYsIDIwMjUgMTI6MDMgQU0N
Cj4gPj4+Pj4NCj4gPj4+Pj4gT24gMjIuMDguMjAyNSAxMjo1MiwgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgNCj4gPj4+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaA0KPiA+Pj4+Pj4gQEAgLTMzNiw4ICszMzYs
MTQgQEAgc3RydWN0IHhlbl9vbmRlbWFuZCB7DQo+ID4+Pj4+PiAgICAgIHVpbnQzMl90IHVwX3Ro
cmVzaG9sZDsNCj4gPj4+Pj4+ICB9Ow0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICsjZGVmaW5lIENQVUZS
RVFfUE9MSUNZX1VOS05PV04gICAgICAwDQo+ID4+Pj4+PiArI2RlZmluZSBDUFVGUkVRX1BPTElD
WV9QT1dFUlNBVkUgICAgMQ0KPiA+Pj4+Pj4gKyNkZWZpbmUgQ1BVRlJFUV9QT0xJQ1lfUEVSRk9S
TUFOQ0UgIDINCj4gPj4+Pj4+ICsjZGVmaW5lIENQVUZSRVFfUE9MSUNZX09OREVNQU5EICAgICAz
DQo+ID4+Pj4+DQo+ID4+Pj4+IFdpdGhvdXQgWEVOXyBwcmVmaXhlcyB0aGV5IHNob3VsZG4ndCBh
cHBlYXIgaW4gYSBwdWJsaWMgaGVhZGVyLg0KPiA+Pj4+PiBCdXQgZG8gd2UgbmVlZCAuLi4NCj4g
Pj4+Pj4NCj4gPj4+Pj4+ICBzdHJ1Y3QgeGVuX2dldF9jcHBjX3BhcmEgew0KPiA+Pj4+Pj4gICAg
ICAvKiBPVVQgKi8NCj4gPj4+Pj4+ICsgICAgdWludDMyX3QgcG9saWN5OyAvKiBDUFVGUkVRX1BP
TElDWV94eHggKi8NCj4gPj4+Pj4NCj4gPj4+Pj4gLi4uIHRoZSBuZXcgZmllbGQgYXQgYWxsPyBD
YW4ndCB5b3Ugc3ludGhlc2l6ZSB0aGUNCj4gPj4+Pj4ga2luZC1vZi1nb3Zlcm5vciBpbnRvIHN0
cnVjdCB4ZW5fZ2V0X2NwdWZyZXFfcGFyYSdzIHJlc3BlY3RpdmUNCj4gPj4+Pj4gZmllbGQ/IFlv
dSBpbnZva2UgYm90aCBzdWItb3BzIGZyb20geGVucG0gbm93IGFueXdheSAuLi4NCj4gPj4+Pj4N
Cj4gPj4+Pg0KPiA+Pj4+IE1heWJlIEkgY291bGQgYm9ycm93IGdvdmVybm9yIGZpZWxkIHRvIGlu
ZGljYXRlIHBvbGljeSBpbmZvLCBsaWtlDQo+ID4+Pj4gdGhlIGZvbGxvd2luZyBpbg0KPiA+PiBw
cmludF9jcHVmcmVxX3BhcmEoKSwgdGhlbiB3ZSBkb24ndCBuZWVkIHRvIGFkZCB0aGUgbmV3IGZp
bGVkICJwb2xpY3kiDQo+ID4+Pj4gYGBgDQo+ID4+Pj4gKyAgICAvKiBUcmFuc2xhdGUgZ292ZXJu
b3IgaW5mbyB0byBwb2xpY3kgaW5mbyBpbiBDUFBDIGFjdGl2ZSBtb2RlICovDQo+ID4+Pj4gKyAg
ICBpZiAoIGlzX2NwcGNfYWN0aXZlICkNCj4gPj4+PiArICAgIHsNCj4gPj4+PiArICAgICAgICBp
ZiAoICFzdHJuY21wKHBfY3B1ZnJlcS0+dS5zLnNjYWxpbmdfZ292ZXJub3IsDQo+ID4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAib25kZW1hbmQiLCBDUFVGUkVRX05BTUVfTEVOKSApDQo+ID4+
Pj4gKyAgICAgICAgICAgIHByaW50ZigiY3BwYyBwb2xpY3kgICAgICAgICAgIDogb25kZW1hbmRc
biIpOw0KPiA+Pj4+ICsgICAgICAgIGVsc2UgaWYgKCAhc3RybmNtcChwX2NwdWZyZXEtPnUucy5z
Y2FsaW5nX2dvdmVybm9yLA0KPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAicGVy
Zm9ybWFuY2UiLCBDUFVGUkVRX05BTUVfTEVOKSApDQo+ID4+Pj4gKyAgICAgICAgICAgIHByaW50
ZigiY3BwYyBwb2xpY3kgICAgICAgICAgIDogcGVyZm9ybWFuY2VcbiIpOw0KPiA+Pj4+ICsNCj4g
Pj4+PiArICAgICAgICBlbHNlIGlmICggIXN0cm5jbXAocF9jcHVmcmVxLT51LnMuc2NhbGluZ19n
b3Zlcm5vciwNCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgInBvd2Vyc2F2ZSIs
IENQVUZSRVFfTkFNRV9MRU4pICkNCj4gPj4+PiArICAgICAgICAgICAgcHJpbnRmKCJjcHBjIHBv
bGljeSAgICAgICAgICAgOiBwb3dlcnNhdmVcbiIpOw0KPiA+Pj4+ICsgICAgICAgIGVsc2UNCj4g
Pj4+PiArICAgICAgICAgICAgcHJpbnRmKCJjcHBjIHBvbGljeSAgICAgICAgICAgOiB1bmtub3du
XG4iKTsNCj4gPj4+PiArICAgIH0NCj4gPj4+PiArDQo+ID4+Pj4gYGBgDQo+ID4+Pg0KPiA+Pj4g
U29tZXRoaW5nIGxpa2UgdGhpcyBpcyB3aGF0IEkgd2FzIHRoaW5raW5nIG9mLCB5ZXMuDQo+ID4+
DQo+ID4+IEFsYmVpdCAtIHdoeSB0aGUgY29tcGxpY2F0ZWQgaWYvZWxzZSBzZXF1ZW5jZT8gV2h5
IG5vdCBzaW1wbHkgcHJpbnQNCj4gPj4gdGhlIGZpZWxkIHRoZSBoeXBlcmNhbGwgcmV0dXJuZWQ/
DQo+ID4NCj4gPiB1c2Vyc3BhY2UgZ292ZXJub3IgZG9lc24ndCBoYXZlIGFjY29yZGluZyBwb2xp
Y3kuIEkgY291bGQgc2ltcGxpZnkgaXQNCj4gPiB0byBgYGANCj4gPiAgICAgICAgIGlmICggIXN0
cm5jbXAocF9jcHVmcmVxLT51LnMuc2NhbGluZ19nb3Zlcm5vciwNCj4gPiAgICAgICAgICAgICAg
InVzZXJzcGFjZSIsIENQVUZSRVFfTkFNRV9MRU4pICkNCj4gPiAgICAgICAgICAgICAgICAgcHJp
bnRmKCJwb2xpY3kgICAgICAgICAgICAgICA6IHVua25vd25cbiIpOw0KPiA+ICAgICAgICAgZWxz
ZQ0KPiA+ICAgICAgICAgICAgICAgICBwcmludGYoInBvbGljeSAgICAgICAgICAgICAgIDogJXNc
biIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBwX2NwdWZyZXEtPnUucy5zY2FsaW5n
X2dvdmVybm9yKTsgYGBgDQo+DQo+IEJ1dCB0aGUgaHlwZXJ2aXNvciBzaG91bGRuJ3QgcmVwb3J0
IGJhY2sgInVzZXJzcGFjZSIgd2hlbiB0aGUgQ1BQQyBkcml2ZXIgaXMgaW4NCj4gdXNlLiBBTmQg
SSB0aGluayB0aGUgdG9vbCBpcyBva2F5IHRvIHRydXN0IHRoZSBoeXBlcnZpc29yLg0KDQpUcnVl
LCB3ZSBzaGFsbCBtYWtlIHN1cmUgZ292ZXJub3IgaXMgc2V0IHByb3Blcmx5IGluIGh5cGVydmlz
b3Igc2lkZSBldmVuIGluIGNwcGMgbW9kZQ0KDQo+DQo+IEphbg0K

