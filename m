Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMoYGeWveGlasAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:30:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D094590
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214608.1524838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiCe-0000Jn-4g; Tue, 27 Jan 2026 12:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214608.1524838; Tue, 27 Jan 2026 12:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiCe-0000HC-0W; Tue, 27 Jan 2026 12:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1214608;
 Tue, 27 Jan 2026 12:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkiCc-0000Df-6g
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 12:29:50 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddd4dce7-fb7b-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 13:29:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH8PR03MB7218.namprd03.prod.outlook.com (2603:10b6:510:25a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 12:29:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 12:29:41 +0000
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
X-Inumbo-ID: ddd4dce7-fb7b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYEzkae1r8C2d/f2cV+NgZ938icvnoNZnpHieWBx9vDIUAlQnpAMcOplF4aiEQa8qIZ6NpBDe6NkNYgN2g5sGgdHBdCIUCFiBZ/qRsgQL2F9KpmgNDGQbebip/CEpH/kgzEMlJhNF1BAyEneVrRpKg9nZGihld/8ooLJPRK5QCYzqXcmpoZxYU6V/oTWoE2+EVUnZg+SZtFcc9XD7KroypxhClw/Rq2JXnvgBSk5aMs+m95KnRjR40QcY1Poyuic5MTQjU2hoNtissjIgfVjmrA1dMxMr9N+Xb8rMhXdXmydUy6NoUd0NQJ4Dk9O84R/+gv5gaQvtSVoxXToeLXqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCqeW2PG1CNelc+bIOFyIOxjTQxwbgoeXzGtvuBIEdw=;
 b=ESJx1q5u3puiS8aBZE0Wu1R9OPUTHsDlcaHp5k0TXFLvxDii9Gad7l08+VylvbCOePGTbdtsrNSVhEQokhpCMF6d/Qf17NbYzuvvwWlcGgz2a/uUwmU5JaehOh9wn1neDWRHbGNS2MxFypCz6kOmSgQS3ibXcMRepl7zV1r1b7O0WiGfd28AWy16XGwhpmVK1nsDQbSAPwsvrq8w0LRqXQZXuVmQbhzpFjKqpMxQ5XTZKhKojNok05ZuLAOV8UmjTvAmeMTowXsv2ZyzlU7Tczq6fnN9SXgZIqiCNLFzOTUFe6dT6n4nAaPekEiqyNXe1sDqk7aweTcrdzpJr4+z+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCqeW2PG1CNelc+bIOFyIOxjTQxwbgoeXzGtvuBIEdw=;
 b=RD6hG0OG2L1KFShQPTTxNj5gb4rB4xuyY/SYnlNSLVGJSLycMhg8cY1SeO3HUgtCMmfvcELXcB8uN0MZK0FuasNi63pDA8bi6xB/I5FcjDj7fBrYKV85SiJBkpq4f5GglEVY2yycBaZIspJWsG6W8mqiqnNXE2JE4bxwGF3rmcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <08d9aeaa-d503-4e75-863b-dee3b46c42a0@citrix.com>
Date: Tue, 27 Jan 2026 12:29:37 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH 00/16] x86/cpu: Cleanup for NX adjustments
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
 <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
 <e5f02207-4f9f-467a-8c25-0af42bf81551@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e5f02207-4f9f-467a-8c25-0af42bf81551@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0697.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH8PR03MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: df9f1ca4-a57a-4fcd-6898-08de5d9fbea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1AxSU1EbHpPWWV0bUNyMWhCQmZnQ2dqTWhrN2VJZFJsSDRjK0dvU0d3LzZm?=
 =?utf-8?B?MTREak5Gd3JBV0hwTlI3NWZhenJBWW53TzJ4ZGVUbDBBb0FxbnMwMGViVEtQ?=
 =?utf-8?B?d0Y1ZGlYNkpMNDVaeGJMc2NyOTFiOVpDZ2FoNGthZTBZbnp6d2d5Zjc1RHgx?=
 =?utf-8?B?TDdXT3pFVUtSSEt2TDJQS3JMVmMveUxFeVhUMU9tUmVIalZPOGlUV1puWU1q?=
 =?utf-8?B?WElTRkFoRW95WkVTY3o4cGJnUTRTNUppQjRtMWVjbVh5b3VMUGVrbmJWaGNH?=
 =?utf-8?B?UkI3dG9QS2NmcGJOV0dxc21PNXlaVG05VEFTeUJJcG5TSnJtRzg3UDFmUEZQ?=
 =?utf-8?B?YlhqazVpN1V0ai8xRm5NVXk5QkdleW1uejBSQmZ6RzVxVVVyazhHczRITnhD?=
 =?utf-8?B?MkNwZDBEd0tiRnZqRWF0RnVMUGZBaXFIMmU5dFoyM0Zaeis5bWZTcXVhN0Zv?=
 =?utf-8?B?dXA5WGVVWEc3aTVUNnVHblUyTHo3NlBYWnFacGcvandTUXpTTGdWWE1jWDhq?=
 =?utf-8?B?aEFYZFdIZEcvMm5laWEvRnUzSlNURHRoNU8wK1VQZzVjUzRCSWdHV2N4bHRz?=
 =?utf-8?B?a2pzM2x6K1kzYmtNN2lScC9xa2x2b2NVaUk5NEhPNmU0Q0RGYjU1dzBzVVJr?=
 =?utf-8?B?WTJ2eVlCWWltTU5ydGJWWGtMV2hJeXFWSzIwck1lSHBldW8yQXRpQklBMEcv?=
 =?utf-8?B?dnRxWmhBZm0wNkxiU0lGTEtNbGhGUk5NUW5naGYzUDRkRlo1Z1JMdG5XQjFu?=
 =?utf-8?B?NU1FbHgrNDEvc2R1aVRvQWhkTnhPTWtLZFFXbEwvMStUM29YNXJaM0lWOUZU?=
 =?utf-8?B?d2s3d1BaSXFOSGVIRk53ZXRCSHE3d1JTazhxMVNGRVZLSW9XSHRSMkdMY1hG?=
 =?utf-8?B?K09ZVU51UEx1Sk90ai9EU1B1OFI2WFRrNkNlc2FvVk0wR084TWpwakpwODYz?=
 =?utf-8?B?Z3BCNkd2ajdlRFZhZ2l1ZVdJbWhCMUxWRlhzbTFQWE9ubE9pZFJic291RmZI?=
 =?utf-8?B?M3VIbXRSYVRPeS9NaVp6bWt4cXJUT09QbDdXL3JKS0NSKysyL29ObENtcjNn?=
 =?utf-8?B?UXdCaC9jdzRpcTlPaFNXQmJLVUlIY3RrTmgyWTB0WmJ4ZExmUkNML2FqKzFV?=
 =?utf-8?B?UlJYc1ZhS1BpYjZLV2s5T2tRZHlzY0k3dWNQWWh1R3NxK3Y1VkdFOElhSktx?=
 =?utf-8?B?M2VBUkhOMEI3M2dVd24zQ1NRNzhPWUNRNGt2Q3ZteksrZStqVFF4VzBidHk1?=
 =?utf-8?B?K2hrWVdGU0NmalZLUG9ib1UreHJ4STBMQkNXaENIZUpxTVJQRFFjWXVyKzY4?=
 =?utf-8?B?cStzV0ttdU02RllONmRwR3pOb2g5TlVTUHliNGorZ2pYZ1N3S0Rkc1NQNERw?=
 =?utf-8?B?bFRKNEcwRmh6bDVQbmhsNnprb3VUdEtLQlFPTk95M2VINkZLeEVJOTdaVU16?=
 =?utf-8?B?cUw2Rk81aVRPNUlQdkY3aHJtL1RkR3paME56L3o5RnlTVXNDWGhIOVE3eVVT?=
 =?utf-8?B?dU5hSGkxNjByK3FFeTFHbjdwcGk4T2JDMXpjSmtOM2NkYTNKOG9lKzQzdng5?=
 =?utf-8?B?N1l6cnB2ZVRrSW16bit4TWVib3NDZ203SU1yUGJWUDVRSmFXSmRvNW5PRGp2?=
 =?utf-8?B?Y09pMERTSmoranhvZHg0L080am1kaGplK0krOTFWaWsxM21SVVNVbFZ3bG1E?=
 =?utf-8?B?VVdEenZDM2FWa20zKzRYd1lxeW8zckh4MFlQUjhRZkI1dVljbGVWQkZCU0dI?=
 =?utf-8?B?MkdXRWdMbFQ3d2NsWU1kVkRJRE9MMXNzSWRPeU5yZHF1bzNLYUNYMGRhMFc1?=
 =?utf-8?B?R0hYd3NjR0tDdmtPdkdkTVV6SzlIY3piZXlnak9vcmVJTStORXpTRXQ4Tjhq?=
 =?utf-8?B?ckhLUTQ5TTZLNkYzT0FxZ1g5VlFlMUE2ZTBmMStQWmN2WWFaNFovZFI2eVR2?=
 =?utf-8?B?enVrQWZjL3AxdWdsZDlkTkVvMXhWMno1TkVHbUhpb3lnWTR0b3g4WURYN3Jy?=
 =?utf-8?B?Q1hQdjNSL2lJTEhpb1ljRVJtcVd2cGVhTXFRS2tScEYyS1FEWVhKcG13c2dF?=
 =?utf-8?B?b2F1Vm1IVWEzUXJXcXFaWnR3eGpzZGJkVDYxYStSN2ZSdEVUREhGR3FlNHJw?=
 =?utf-8?Q?flg4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTNuWWxiMkJiQzk3VWV5QzYxclEzbFkwYWtNNEJQcDByTXc1Q3pVcHE1ZlBQ?=
 =?utf-8?B?enM0WHdwNnRFVXEvS0pyVy8zeW42WHRDKzQ2MmhtZXZmd3ZvS1VCbTVXeG9K?=
 =?utf-8?B?ZEdxSGdCYXc1b3k5TDhVMWRHQ29iUXZjT2g2MlhrTzRtVUpTVUZXQVVENkxz?=
 =?utf-8?B?WUVtSmxOcnM0ZS8ySXVuYkFWU0lHbW5qYUU1b0cwcVh2WWsxOEZlNm9JMDNC?=
 =?utf-8?B?SWJBejVPTDU4SXNUY1FYaEFIcFFZbWZNQnpudDlibHFWVXBGNkpyWE5xTHcx?=
 =?utf-8?B?UkRmRW9iOVVMVzNMQU1ZL0xZWUUxSFVOMHI1LzZjelRaM2hYUm5xMElJODR5?=
 =?utf-8?B?ek42eFVlQWZ4cHh0YlRjcFBCbGJWaGkwc000KzJmNlhWWisrdHFhMXNuNTB0?=
 =?utf-8?B?dVNHNUhBWWRsOTRWWVBzR3I2MzJ6cUFidTRSVVF4T2lkb1ZpN0lmUlkzVWZ6?=
 =?utf-8?B?ZUlhNlhhZGtVb3NSbWorWmVpRXh5WW83OWF2K3VMcEs5ZVQ5SjdOdUwxMCtp?=
 =?utf-8?B?Y0taeFJFWS85dFJRREdhSTZ4ejNXckc5UlMwZnFnTUx4NktXdW5tZkl2c1Vp?=
 =?utf-8?B?bkhrMkFpZmsrOGJ2VVo2Q2MyYmJwQ0lzMEtwaUlOS1FrS1h4WHJXOFNkcDQ5?=
 =?utf-8?B?UVJBdnhQUXpZTFFCWVluT09VMGpsZHVTT09GZEVxS1VhMTRHSUpoMFEzMnRj?=
 =?utf-8?B?bkl0Qk4wQ1VuWTNQcklINXJEODlqc3Fyd3JVRXFMNnBFSXRpbzZOenNrdGw3?=
 =?utf-8?B?RUFIUkFYanNpbVlkMjF2bXdUN3pCVjFpTTdlcGJRTkpGbUtXZTJYRW5ReFBM?=
 =?utf-8?B?NGRXTVRtZktwM1hWSmVSTWJSMnZOYWZrWkd0NTEyck5ZMVZEOEJqWnBTZ1NF?=
 =?utf-8?B?dnNlR3IyTklOYURWd0hwbDJiQTBrZENOd1c4UlhpUGk4Nis2bjNTWTNRcWFW?=
 =?utf-8?B?VExNR2NVcjFhNTFvQUI4Tm9LMjcyRXZTTTAwNEk3MU1UTlpLbHJ2QXAxZGJS?=
 =?utf-8?B?aEtBd3FiK3k3WDcvQWU1QkROMHZUYW1tNmt0bGE3QTBpVTh6SGVkaTh3anVJ?=
 =?utf-8?B?RDdTN0pMU2puTEY3dWN5UWJOUEFnQ1VpOUtFTjQ5U3J3REdVbHR5Q0NNZmRJ?=
 =?utf-8?B?ZkQyd3VYZWdqUktMZ1dSMnJ3RCtNK0tXSVpvc2I5Q29KbFFTdWZoZ2pRMmtS?=
 =?utf-8?B?STdXZlFhZnVCRkdEUVUrUmJjZ3pYTUdmR1Z0OCtrTVgvdjYya1BnY25pdmRF?=
 =?utf-8?B?Sm4za0pFeFlCWURwTU16NUZ1QzExcWJqVExTcWtkWUFtL002YTRaWXBpQmxv?=
 =?utf-8?B?cTBhUFhSdThOZ2QyTmFmdWo3M2NyQlZyelhmTlBYY21TMjdoRWR2YkpXTm0z?=
 =?utf-8?B?SVVoUXVmdGxaUXRkVXpFa05JNG50WUVXV1B6bENrbGRxWHI0TktWd2VaZm5k?=
 =?utf-8?B?TDRmQjkwVTNlOFNxRGhyNlhkb3JyWFlXR1hrS0ZnUTQyRzI4TDVVb0F0Q2xG?=
 =?utf-8?B?eUM0S0FoQzBPa3hvbEhOaXR1R21lT3RSRVdoTEI3azdPU28wY0hVcmxNSTZM?=
 =?utf-8?B?YkxKQndYc1VNd1BPd3Z2Z1I2WGFQeWVBd3YxUWd0SkxUd3JxS3NWQnRoZWEv?=
 =?utf-8?B?VkI5UlJmRXYyNDVDWS9RUG4zVVJGYVpNYTRLR2RwQXlMSGd2L0lrRXlNdjJP?=
 =?utf-8?B?NEpJSkRNTHMxSnJXQ3RKR3ZWaUs3SkViV0FRd09nNTRrcm55cDhXK0p3YkJT?=
 =?utf-8?B?VUhTUHFyc0RBaVFmVWlWSjNVVXA0dkhadVQrbURlT29ENFNxTG02T3FNZ083?=
 =?utf-8?B?YjFRZElGeTh5ZmVmcHpCK2RLV1FZREtIS2cvRmpLME53Z3ZFcktJaDhQQTNM?=
 =?utf-8?B?ZlJaaTc3Yk1vVFR1RGsvRnMyS1BMYkY3dzlzbkJPQVZ4ek5SVXEzbzg3QVZS?=
 =?utf-8?B?WVBHaGpmMmE0Wi9ST21ZSVdNZ01seEV0MTNoRHROMEkwNTdDemNFTGxySnJB?=
 =?utf-8?B?RmVZbHJYUnFkWFJsM0lnRjlHUFliZ095TkY3YjlhT2ZVRXpCdWZwTUpXaTRr?=
 =?utf-8?B?U2lmV3ZsQ3dQODZGZ0F3bi8zRnVRdFNXbFE2ajBqT3RLTEMyVHdPdlM0UVNl?=
 =?utf-8?B?bDVxVG1FVGI4NE5Zd3RqbVdPaTM2aEx0UGRXM2dlTFRUbnFrR05WN29Ub2xi?=
 =?utf-8?B?U3ZkVEIyRVh0bng4cThUMHFEbm80UUwvWTUrMUpjdk1pVVU0SjFzbTNqd3Bl?=
 =?utf-8?B?cFcvaTVPekhINTgzcElxZlAyUTlNck4yWHhqeGJmTE03bjArMU96bFY1cjNE?=
 =?utf-8?B?djk1bWsrclh1RGxFaS9GQzJtTFlnRHJ4WmR1RmM0eU5PeFl5aHZUdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9f1ca4-a57a-4fcd-6898-08de5d9fbea9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 12:29:41.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAIqyYbauJaouPf24TrhDIHRpJSUEAo3DCU6tYI7FMuIXhPxy/CQjcwUjkQz5rPvEwGOCwwnFUcmJ6WlTzaSf+j3wvWFApHNbLSGpucYYYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7218
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CA1D094590
X-Rspamd-Action: no action

On 27/01/2026 12:09 pm, Teddy Astie wrote:
> Le 27/01/2026 à 12:39, Andrew Cooper a écrit :
>> On 27/01/2026 11:23 am, Teddy Astie wrote:
>>> Le 26/01/2026 à 18:56, Andrew Cooper a écrit :
>>>> I was hoping this to be a patch or two, but it got out of hand...
>>>>
>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078891
>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
>>>>
>>>> The branch has one extra patch to fake up the firmware settings being set to
>>>> Gitlab CI, not included in this series.
>>>>
>>>> Julien: This ought to suitable to rebase your cleanup on to.  In the end, I
>>>> did the AMD adjustment mostly because I needed it to test the correctness of
>>>> the prior cleanup.
>>>>
>>>> The final 4 patches are tangential cleanup which I've kept out of the prior
>>>> work in case we wish to backport it.  Everything prior is relevant to
>>>> untangling, and mostly for the benefit of the AMD side.
>>>>
>>>> The early patches are hopefully non-controvertial.  Later patches are a little
>>>> more RFC, and in need of further testing.
>>>>
>>>> <snip>
>>>>
>>> Tested on a Intel machine with "DEP" disabled, and "Require NX support"
>>> disabled, I get a pagefault in hpet code
>>  From above:
>>
>>> Julien: This ought to suitable to rebase your cleanup on to.
>> This is cleanup only.  I've not got the bugfixes for EFI boot yet, so
>> the behaviour you see is still expected for now.
>>
>> Although, thinking about it, it might be better if I try to merge the
>> two series, so everyone can test the end result.
>>
>> Thoughts?
>>
> +1
>
>>>> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) 15.2.0) debug=y Tue Jan 27 12:06:46 CET 2026
>>>> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
>>>> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
>>>> (XEN) re-enabled NX (Execute Disable) protection
>>>> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (raw 000306c3)
>>>> (XEN) BSP microcode revision: 0x0000001a
>>>> (XEN) microcode: Bad data in container
>>>> (XEN) Microcode: Parse error -22
>> As a tangent, what's going on here?
>>
>> This is the first time I've seen the error outside of my own testing.
>> Is it a container you expect to be good, or some leftovers on a test
>> machine?
>>
> I'm trying to load a Intel ucode (taken from Alpine Linux intel-ucode 
> package) using `ucode=intel-ucode.img` in xen.cfg (UEFI direct boot).
>
> Many distros ship microcode in a single CPIO image with e.g 
> "kernel/x86/microcode/GenuineIntel.bin" in it.

Ah, that's a known thing that doesn't work and has never been
addressed.  People have been complaining for years, but not on xen-devel.

It's also the subject of a documentation fix that is still pending (and
now needs yet another rebase). 
https://lore.kernel.org/xen-devel/20251215153245.2675388-1-andrew.cooper3@citrix.com

Now that the ucode boot module handling is clean, we can probably try
both a CPIO and raw probe when given a fixed module.

~Andrew

