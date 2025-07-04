Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65646AF8F1E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033247.1406728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd4a-0005eV-6A; Fri, 04 Jul 2025 09:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033247.1406728; Fri, 04 Jul 2025 09:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd4a-0005ci-1r; Fri, 04 Jul 2025 09:51:12 +0000
Received: by outflank-mailman (input) for mailman id 1033247;
 Fri, 04 Jul 2025 09:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXd4Z-0005bE-4R
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:51:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2414::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64487e82-58bc-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:51:01 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.30; Fri, 4 Jul 2025 09:50:57 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:50:57 +0000
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
X-Inumbo-ID: 64487e82-58bc-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJWIOhwIX7mEWvr4UsY7FJqu1uUmuZxCBBN6ng3+r3JhUMrORXmO/GrO6CIlu8yKt+S4siNJDPyJRB1oFlCGjGxhtWJPtgcN/2G6S0kEFT4H38EFVCt4bqYE2bifLtqcY024FavYZb+oJ5ERal81VMqz9xhQOsVKN+SFGJs+XZcqVrx2RAqbUELFwZFXw8niPvBMm3aH2WaU97EyrW75SWlbwVwUb95vBsFD1GIGIg6tOG0e76cKVZiW/d++D9MZlCsKLScH8APtfypwiiwv5cKslIFzKMGGfvnf2FWt+7b3sH6XDKMuhSOt90CJu/G4eW3rQ1sUWCPozrgmMvWrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20tMB151f4SDL33lA4xAsIIwFyYpRmL+LwzJttpiT8M=;
 b=vRFSxkqpVAZqYR9BXmpQuern8DZcst68y8k58QVKta46G9CACXj8cmQd/0sjCNPgIentmZDDjAPsyBsfUM6ABS695JrL/oyrHs55P3FcG6V1r36vzA5ts/zmH5uSeYP58DLzx8dia+zg1wjQY4cZVtJQuL2ZlUTiPjeQsRJ/fejeqhFnVX7tDKUOrePYryEH5oH3v0HU/xabgLfmJWkniGQtnkIo9JBoSIHZTKWObmvptTqIHPkZZ1dO+Eqq6f5Er0VEzJxWSuHXPUos/XIiGQNIgshvqmoTMazD04Wo1X1h3JySfrtOlexLrvEcmpYzK17MTtw7QMVEo//KlayVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20tMB151f4SDL33lA4xAsIIwFyYpRmL+LwzJttpiT8M=;
 b=rZYALmvon8DXBDgF9CO2BdjfPPhqXgLr73XYayPMaOmYKlS/XH1oTtW8MQCY6nRrwQthvremIBVr9DLm0KWfNvMMWVuWyQPSKArQ8UQ1Eulocg7a3D1/uvFdf+UBTkW1Zp55RMYMFnTli+7gXZ3L/c5BBhHrstZia857e9cIxAs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-devel@dornerworks.com" <xen-devel@dornerworks.com>
Subject: RE: [PATCH v6 00/18] xen: introduce CONFIG_SYSCTL
Thread-Topic: [PATCH v6 00/18] xen: introduce CONFIG_SYSCTL
Thread-Index: AQHb7MZIDRVJyN4x+0Oz408AFQHe+7QhuAyAgAAAaPA=
Date: Fri, 4 Jul 2025 09:50:57 +0000
Message-ID:
 <DM4PR12MB84511A748117A49D4EF2C830E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
 <41925877-dc7b-46d7-abc4-01b18de27cb6@suse.com>
In-Reply-To: <41925877-dc7b-46d7-abc4-01b18de27cb6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-04T09:50:52.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS7PR12MB9044:EE_
x-ms-office365-filtering-correlation-id: aa1994d1-543e-429f-b0c2-08ddbae0466f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?clNQUit4bGFDbXFwZWZKQUE1SW1ZVGJ3VzlHWnNnUWhwdGN1T2NIMjlmUlNj?=
 =?utf-8?B?RE1VVGt5ZUhiYnNib2k2cUNYbElCV21tbHRVUVVvS2N1TTJxTWZucUxmQTNJ?=
 =?utf-8?B?YVMycjRIRzh4c1F3bzQ0MjlWU0luYTljdzByd0RHRkpVSmZkd2dZQkgzQU5C?=
 =?utf-8?B?ZFZVSndYRmpVZ1NzWTBVcklwa25HbmQ4V1dvaDhtQWJwWGQ2V3hMSmFncjAx?=
 =?utf-8?B?SWlHOGw1eEtpVzZMT0x5STJjb0R0d0s3a2QzV3pCUnJOMEVKN1h1UXBtekNl?=
 =?utf-8?B?ZmQ3VkcxdG9BTHUzVkRlSjRwN21SYlNxSW0xUG5jZWFxWiswb1RrOTNkUFBr?=
 =?utf-8?B?M1VKdWxmZklEbklrUXpMVWRaRVVKc05kZWI3WmxIakFmOHFsM1BtYXJFOCtZ?=
 =?utf-8?B?NkFDdGdQMHRnMTgreGVMdWt0TVE0b2l3emg1QmhGaHVUbTl2Kyt6N0Q2dEVU?=
 =?utf-8?B?aGQ0WmJubi9mTUV1NVpKMzZuSytqV0dkZDZiUmRXbzlJdUFvZGZONkQxUVRM?=
 =?utf-8?B?NGRmcmNFV01vbklqUkZmY252M1d2a0ExblI3QlNXekZFQVN1aEIzK1JmYUVR?=
 =?utf-8?B?K2VKNTlVWCtTTTl5S0NNdHY2Y3NpaVE1NElrd0VrZjcwU2NsT0xvbzJJeFVB?=
 =?utf-8?B?MzIzL3NUYjA3TUFDbnUzRWFZSVdsU1Q2UFdaQmRKcVNhU3ZaOU1lVWlXMWFn?=
 =?utf-8?B?UllJdnV2TDc3a0JTV3BWV3l6Vk1oSk5MUVRyWXE3SE5PNHkrUGNDMm1nbEJt?=
 =?utf-8?B?WjFiazRIQnhkdEFEbm80ejYrTnlZdmZKWEZQM1FPaTIwaFpyemlCdmVhMVNM?=
 =?utf-8?B?Z0I3RGNXZnNHd2VzYzIzdW5Bby8vS2grOGpNb0tSem9NOWZSS3BvdXhtUHhy?=
 =?utf-8?B?US93WjIwQmZtREV0bG9XTXhua0xBQVE5SXZzRjJYMVdVc3RiejhTdmgyUHNu?=
 =?utf-8?B?SnczTmpKeDl0Q2NjbTN3SEpNVm8xUDBFUWNVTGFuaE9RUHZ5SFdnanRlUlhy?=
 =?utf-8?B?b1ZRZFJ5YVdIdTBkVVFJTlVCUlh4YmpkK0x0U0pMKyt6ZUNXc0xKSmxHd0hW?=
 =?utf-8?B?MEJicjN6NDRrcmJlUDdLM05NVFJyUXZtTWE4MnlCZ1Z6QkdGWnVXbm5xQnFj?=
 =?utf-8?B?MFpFbzB5aVdIT3FHRmlsVkFBdU1NQ2k5WFRQOGphRDdVd05qVENrYmlXSWQv?=
 =?utf-8?B?bzNQay9rUEZ2ZzRpZXVyR1lrYWFEMEVpVzRMN01oRGNVc2xpT0J0WjZGV2xZ?=
 =?utf-8?B?Zm1GSkF6S0l0OFRSVnNrelU1dlpiQVg3MmZQMGhSd01CeTZOblliMmtuaE81?=
 =?utf-8?B?emdXUmJXUG0wSmgremI3a0FMMkw2VjRLUCs1akozWldmZGV5cWpVWWd1NVlP?=
 =?utf-8?B?VWNqWngxTEg1MllNZXVyNmxVRXFWUU05YWV6dXUyYjRzbTk1WS9naWdVanNt?=
 =?utf-8?B?eExEVmppT3Z6TnVTQ29malJ2L1NuQUh1Zk4yUzRiYysrNms5U0c3WGN3R09T?=
 =?utf-8?B?amRQdFdHMXpQdkNJdURsdmRhWER5YURGN1pJcnFmVVpMTGxXNWtsWTJrVE5h?=
 =?utf-8?B?cWRocVBmMVZacWZydlE1WFliOFRGcFpHdEtZeXM0cTdQMG8xQkZYNG9TSW9X?=
 =?utf-8?B?Nlg5cDBYckt5WGhhTmszb1VsU0hHUmQ5MTFIdkJsS2t0ekxMSFUwV01NZWZP?=
 =?utf-8?B?ak9GMFYwcUhrU2pPc0d5bUtxZVloYnNsZGpmeG44U1Z0b2ZaVjluZ25ERFJU?=
 =?utf-8?B?ZVoyS1hzZEVTemtJd0tiYVBjczBrdktSSGJoMGpRK1RBVWlaQ1UrYWZKN3RU?=
 =?utf-8?B?T0JkMmNZNHl3TnV3OHdpVkFlOFhVNFBKbWlNMFlZWHNacGNjVktaZG92eGgx?=
 =?utf-8?B?UDc0YnlrY1RTbVljZFl4eGhIK0daeVQxV01pYzNSZEV6WmI2OUMvNUs3Z00r?=
 =?utf-8?B?WU9DSzlPQ2JsWVo2d0cxYzlwWkUrVFN1NVRlT2Yxa3RTam1BWVJJUDVYcDNM?=
 =?utf-8?Q?PEHWm2QBNSR096mX+ku0YUnWQhEPzU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUJpYmR1NFU4Q2VVUnRyVW5oKytJZllIbVBkNlkycnBOS3BNYytQVHdaaVVa?=
 =?utf-8?B?VUJlR3JHU1B1ZHJyd0ZuWXRWdE5NdXpKdHlrWmJrcktlaTlPVzJiVTE2SVIr?=
 =?utf-8?B?cENWZDh3MzcwVFlMb0Y3eTdlVDFnekJpZVcvbjc0cXJwZFdwVUEyTU1ndmhu?=
 =?utf-8?B?MWFQd1ZMUEp5dGx2M25JYkhqdU5pNnowK2h3OG1xN3dIaWMrQ0x5YndIeitH?=
 =?utf-8?B?TVpMUWZYanNob1ZTTno4QmoyMkc0OHBKbHE5ODdVeWdJd0VYbjEwa1dsYy9Z?=
 =?utf-8?B?VVFkeFRQSTJEWWxKYTB3Zmk2ZXJ3cTFEcUZab0FWVkJkbEZiSTVtSzRGeldL?=
 =?utf-8?B?ZktEaVNDQWZUaXg4a2VyZmRtMHBLV2pqWmZ3NWhIdVVXTlZSc3JMWStQd2J2?=
 =?utf-8?B?QkpiMzU0YmNhUGFGbmN6a21IMEdreU1YTEJVaS91TlQ4U243WlcrM0lWSEJG?=
 =?utf-8?B?UGRZdDFjTFBGZHBFK0lCL0dtT2tUSXUzcFgzQTdOT1NyWFhrZmlQZ3NkMFdR?=
 =?utf-8?B?dXg3aVIxQjR1N1E3Mm9LTTNzcjhHMkpZbXdLMTVWL2dHdmVpSWU0aE1FS1Nv?=
 =?utf-8?B?ZC81b0ZJM2V0N01ZZzBpbmhPWHNhczRLcFdva0k2UlZSTTY3aTV0THM1NHg1?=
 =?utf-8?B?K2pncWNKVDhFb000NlRCQUc5Vko0OW9JMllXOVNFdmMzL3VPSU9oUW1IWDVi?=
 =?utf-8?B?a2I4dGlBUy8yQnM3Z2h5Y2RDa3pRT0VOZ0p3UlVtUlVVMm1PRFNDeDJoNzRz?=
 =?utf-8?B?MXFtTXJoOVRXdTBRcklPeVZrTmFaalh4NHF6U2NnMVUrWUNyTWNDQ3Zaem9Z?=
 =?utf-8?B?ekVmVlRkMmtwb0xpMldOQm1WSStLdmxiaU9jT0gwcENjeGN2dmwzRjdLcnU3?=
 =?utf-8?B?YjlRMzZTalVreFpsMlkrN3VneW1UdEdCRkNlRXpRUHVHSWFLZXJpV05zaFpN?=
 =?utf-8?B?N0JjWjBocTRwNEJIaXErV243TXNCbFFiMUp2R3FzTmtHc1JmbytWMUFyeUVy?=
 =?utf-8?B?NFlBN1FnSWRjSk1uVDl4eHQrbm9sMkRXcGxhNlYxK0RIUENOKytleGZxNWJV?=
 =?utf-8?B?N2dZRFdoL2hid2xERzVBV3NiK0o1ZGMwcXp0czlaOE5IRWpTZ004V3NIY0gx?=
 =?utf-8?B?eUFUNUN6M3l3WEQ3Rmpnb0VRUlZmWlYvNHEzNWJpS24wZDNTSXJHWmhTVngz?=
 =?utf-8?B?UklMbUNMSmJTZnpmTnVZbjdHRmZYQUY0MjM5eERicjNzek42b2tIU201K1Nz?=
 =?utf-8?B?b1JFV3NCaG5QcmhPMzNoSDRQYWpCMm40RjdGVm9aa1ZVS0I4bHNmVDZkcW5s?=
 =?utf-8?B?L1lNak53Y3dxTk9Mazl4S1BheTlQeGpkRUVMekhIWmNLOE5nemhZZ1IzMWpW?=
 =?utf-8?B?V0pPS1RrUk84UmtJMHlWRVQxME9oZXVMd292RkVoWU5ZWE84a0h4U1lseGRn?=
 =?utf-8?B?SzRxMTkzNDVOZ1NiZno4d25zQWhyOUlRN3o0bnRCcmNZOEFhbWx2c1VRY3RB?=
 =?utf-8?B?S2NDdytIU09CREMvVzlNUHFHdkM1UkJWYWNick9MaDZJU2FnZkMvWHhLenB3?=
 =?utf-8?B?Q1dSQll6RnMxMDc3eTJNYmVBRHVpREF6SVFyVnc3U09VNHd4dW5zdkVRSzA0?=
 =?utf-8?B?UXFYM29wRmNNdDdHR05abksyNHdqMUtIR09Cc0VTWndCSFdReFFVUFJmUGdw?=
 =?utf-8?B?UTB3a2JCajlUclVGYU93eC9sckZiYjN0ZmVHL0tsR0hBSXlNZ2NiL1ZXUzFp?=
 =?utf-8?B?TW9qZ2ovKytqM1IxTjZmZnl0V1RWRVovNlZyYXFrR0ZKakxRNmJVVFllWEJM?=
 =?utf-8?B?RlFiRldqeXk4bkhiWjlCdXNOWWdjZGd3aDhSM2dCRlZJRFFUNElTb2F0VDhv?=
 =?utf-8?B?b3Z2UGJXTkF5MDU2Vkd3dWUwWlF2WTM3YS9IalpoY0hONmhoT0xtdFVGa3dT?=
 =?utf-8?B?OUFqNnF0VlRKMHZ6bmRDZmFEVlBWS0tPSEQ0T29odXcxSVN5bU42ekxwSDk4?=
 =?utf-8?B?aVl1OUJxS0dFRE1mL2xFeFYwK1YwMFJvTFIwei90Wm9YekwvRllyNWhvTnZt?=
 =?utf-8?B?bHBjVHcyRVZUSTJIMm1ORHRHRS9GNlV1ZWZ6WUpPK1JvR1RUczN3Uk4rZHJ1?=
 =?utf-8?Q?0iIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1994d1-543e-429f-b0c2-08ddbae0466f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 09:50:57.3601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUVm2yQ5ZEH5VyB8ZF9xOAl8zwZ+aSt+QONAR8X7EzAeV2NG9PaS9UydPgQkiLlUKJiMCVz38QpZhx+xzS4Z5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSA0LCAyMDI1IDU6
NDkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6IEh1
YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50
ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBEYW5p
ZWwNCj4gUC4gU21pdGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+OyBEYXJpbyBGYWdn
aW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPjsNCj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjsgR2VvcmdlIER1bmxhcCA8Z3dkQHhlbnByb2plY3Qub3JnPjsNCj4gTmF0aGFuIFN0dWRl
ciA8bmF0aGFuLnN0dWRlckBkb3JuZXJ3b3Jrcy5jb20+OyBTdGV3YXJ0IEhpbGRlYnJhbmQNCj4g
PHN0ZXdhcnRAc3Rldy5kaz47IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJt
LmNvbT47IFZvbG9keW15cg0KPiBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47
IEFsaXN0YWlyIEZyYW5jaXMNCj4gPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47IEJvYiBFc2hs
ZW1hbiA8Ym9iYnllc2hsZW1hbkBnbWFpbC5jb20+Ow0KPiBDb25ub3IgRGF2aXMgPGNvbm5vamRh
dmlzQGdtYWlsLmNvbT47IE9sZWtzaWkgS3Vyb2Noa28NCj4gPG9sZWtzaWkua3Vyb2Noa29AZ21h
aWwuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyB4ZW4tDQo+IGRldmVsQGRv
cm5lcndvcmtzLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAwLzE4XSB4ZW46IGludHJv
ZHVjZSBDT05GSUdfU1lTQ1RMDQo+DQo+IE9uIDA0LjA3LjIwMjUgMTE6MjksIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+IEl0IGNhbiBiZSBiZW5lZmljaWFsIGZvciBzb21lIGRvbTBsZXNzIHN5c3Rl
bXMgdG8gZnVydGhlciByZWR1Y2UgWGVuDQo+ID4gZm9vdHByaW50IHZpYSBkaXNhYmxpbmcgc29t
ZSBoeXBlcmNhbGxzIGhhbmRsaW5nIGNvZGUsIHdoaWNoIG1heSBub3QNCj4gPiB0byBiZSB1c2Vk
ICYgcmVxdWlyZWQgaW4gc3VjaCBzeXN0ZW1zLiBFYWNoIGh5cGVyY2FsbCBoYXMgYSBzZXBhcmF0
ZQ0KPiA+IG9wdGlvbiB0byBrZWVwIGNvbmZpZ3VyYXRpb24gZmxleGlibGUuDQo+ID4NCj4gPiBP
cHRpb25zIHRvIGRpc2FibGUgaHlwZXJjYWxsczoNCj4gPiAtIHN5c2N0bA0KPiA+IC0gZG9tY3Rs
DQo+ID4gLSBodm0NCj4gPiAtIHBoeXNkZXYNCj4gPiAtIHBsYXRmb3JtDQo+ID4NCj4gPiBUaGlz
IHBhdGNoIHNlcmllIGlzIG9ubHkgZm9jdXNpbmcgb24gaW50cm9kdWNpbmcgQ09ORklHX1NZU0NU
TC4NCj4gPiBEaWZmZXJlbnQgb3B0aW9ucyB3aWxsIGJlIGNvdmVyZWQgaW4gZGlmZmVyZW50IHBh
dGNoIHNlcmllLg0KPiA+DQo+ID4gRmVhdHVyZXMsIGxpa2UgTElWRVBBVENILCBPdmVybGF5IERU
Qiwgd2hpY2ggZnVsbHkgcmVseSBvbiBzeXNjdGwgb3AsDQo+ID4gd2lsbCBiZSB3cmFwcGVkIHdp
dGggQ09ORklHX1NZU0NUTCwgdG8gcmVkdWNlIFhlbiBmb290cHJpbnQgYXMgbXVjaCBhcw0KPiBw
b3NzaWJsZS4NCj4gPg0KPiA+IEl0IGlzIGRlcml2ZWQgZnJvbSBTdGVmYW5vIFN0YWJlbGxpbmkn
cyBjb21taXQgInhlbjogaW50cm9kdWNlIGtjb25maWcNCj4gPiBvcHRpb25zIHRvIGRpc2FibGUg
aHlwZXJjYWxscyIoDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjQx
MjE5MDkyOTE3LjMwMDYxNzQtMS1TZXJnaXlfS2licg0KPiA+IGlrQGVwYW0uY29tKQ0KPiA+DQo+
ID4gLS0tDQo+ID4gQ29tbWl0ICJ4ZW4veDg2OiByZW1vdmUgImRlcGVuZHMgb24gIVBWX1NISU1f
RVhDTFVTSVZFIiIgYW5kIGNvbW1pdCAiDQo+ID4geGVuL3N5c2N0bDogd3JhcCBhcm91bmQgc3lz
Y3RsIGh5cGVyY2FsbCIgc2hhbGwgYmUgY29tbWl0ZWQgdG9nZXRoZXIuDQo+ID4gLS0tDQo+ID4g
UGVubnkgWmhlbmcgKDE2KToNCj4gPiAgIHhlbi94c206IHdyYXAgYXJvdW5kIHhzbV9zeXNjdGwg
d2l0aCBDT05GSUdfU1lTQ1RMDQo+ID4gICB4ZW4vc3lzY3RsOiB3cmFwIGFyb3VuZCBYRU5fU1lT
Q1RMX3JlYWRjb25zb2xlDQo+ID4gICB4ZW4vc3lzY3RsOiBtYWtlIENPTkZJR19UUkFDRUJVRkZF
UiBkZXBlbmQgb24gQ09ORklHX1NZU0NUTA0KPiA+ICAgeGVuL3N5c2N0bDogd3JhcCBhcm91bmQg
WEVOX1NZU0NUTF9zY2hlZF9pZA0KPiA+ICAgeGVuL3N5c2N0bDogd3JhcCBhcm91bmQgWEVOX1NZ
U0NUTF9wZXJmY19vcA0KPiA+ICAgeGVuL3N5c2N0bDogd3JhcCBhcm91bmQgWEVOX1NZU0NUTF9s
b2NrcHJvZl9vcA0KPiA+ICAgeGVuL3Btc3RhdDogaW50cm9kdWNlIENPTkZJR19QTV9PUA0KPiA+
ICAgeGVuL3N5c2N0bDogaW50cm9kdWNlIENPTkZJR19QTV9TVEFUUw0KPiA+ICAgeGVuL3N5c2N0
bDogd3JhcCBhcm91bmQgWEVOX1NZU0NUTF9wYWdlX29mZmxpbmVfb3ANCj4gPiAgIHhlbi9zeXNj
dGw6IHdyYXAgYXJvdW5kIFhFTl9TWVNDVExfY3B1cG9vbF9vcA0KPiA+ICAgeGVuL3N5c2N0bDog
d3JhcCBhcm91bmQgWEVOX1NZU0NUTF9zY2hlZHVsZXJfb3ANCj4gPiAgIHhlbi9zeXNjdGw6IHdy
YXAgYXJvdW5kIFhFTl9TWVNDVExfcGh5c2luZm8NCj4gPiAgIHhlbi9zeXNjdGw6IG1ha2UgQ09O
RklHX0NPVkVSQUdFIGRlcGVuZCBvbiBDT05GSUdfU1lTQ1RMDQo+ID4gICB4ZW4vc3lzY3RsOiBt
YWtlIENPTkZJR19MSVZFUEFUQ0ggZGVwZW5kIG9uIENPTkZJR19TWVNDVEwNCj4gPiAgIHhlbi9z
eXNjdGw6IHdyYXAgYXJvdW5kIGFyY2gtc3BlY2lmaWMgYXJjaF9kb19zeXNjdGwNCj4gPiAgIHhl
bi94ODY6IHJlbW92ZSAiZGVwZW5kcyBvbiAhUFZfU0hJTV9FWENMVVNJVkUiDQo+ID4NCj4gPiBT
dGVmYW5vIFN0YWJlbGxpbmkgKDIpOg0KPiA+ICAgeGVuOiBpbnRyb2R1Y2UgQ09ORklHX1NZU0NU
TA0KPiA+ICAgeGVuL3N5c2N0bDogd3JhcCBhcm91bmQgc3lzY3RsIGh5cGVyY2FsbA0KPg0KPiBU
aGlzIGRvZXNuJ3QgbG9vayB0byBiZSBiYXNlZCBvbiBsYXRlc3Qgc3RhZ2luZywgd2hlcmUgc29t
ZSBvZiB0aGUgY2hhbmdlcyBhYm92ZQ0KPiBhcmUgYWxyZWFkeSBwcmVzZW50LiBJIHNwZWNpZmlj
YWxseSB0cmllZCB0byBnZXQgc29tZSBvZiB0aGUgc3R1ZmYgaW4gc28gdGhhdCB0aGUgbmV4dA0K
PiByZS1wb3N0aW5nIHdvdWxkbid0IGJlIGFzIGxhcmdlLg0KDQpTb3JyeSwgSSdsbCByZWJhc2UN
Cg0KPg0KPiBKYW4NCg==

