Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E2B35621
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 09:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094012.1449361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoUf-0004aS-VA; Tue, 26 Aug 2025 07:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094012.1449361; Tue, 26 Aug 2025 07:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoUf-0004YC-SH; Tue, 26 Aug 2025 07:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1094012;
 Tue, 26 Aug 2025 07:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZJD=3G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqoUe-0004Y6-Us
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 07:53:25 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bda9b427-8251-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 09:53:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV2PR03MB8656.eurprd03.prod.outlook.com (2603:10a6:150:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 07:53:18 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 07:53:18 +0000
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
X-Inumbo-ID: bda9b427-8251-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRI5D9hbieRQQU6BPpFQnOPB2WpcqzAj62JVsbBlSKIBZSLfk4vtXcDnTI0a5cVGnvuxyAhZ159ockF4E+6ctoYrwi2fbM1ko3SIe1KBrHjrObGnLDhXIL6+ozKCUJwBl+/A3YNFQkiuS0dOBDttCc3ow9ede75u7IFUAm2tvDOUt4rqzDHKoBRGS/UyTsjQ93nw3mF3s00HO4fXG9Tqktnkl8JXaqh9t6MgbitBn3a4i1pJRQuCeGW8X2o8hkk+kHCkQVNuT3KFR2m2RysoBc4RQymhxiAzDLNG//SrdQ8P37gF5AKXD68VYvD9fzPfRR/U543ruKPjwqVGk6gJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfzjJA1ldnUwm9meDMQznQW8Kv97zgxFXIvpL3JLImY=;
 b=TerBe5rWnZkpJiS3M28qalRz/9RrBZDY2neMAhinrDJOiDA+wLCaiHjKyM2wYPW0wxXfEF+gCb9YwUVauw+R7ILsYbFLxA/tirCmqRftv6lR9ynBHfiv8mI+mfLF5nED5IuAmAykRgjZiFU4wo4Vr6zym6fPKinMd4GKSeKaUJrQlpxk4joJ0ulBktVjPvyJ3b7IO/1NJ+P0lbha+G8X4dbqOjiwamK3yIA1xRvUWeUmYm5WMJkFgh+AHVxz20bj5RgBAdqTYnirqMaxPyzErTTxyhsWxPuiH5BvJnxaxdSl2L2GcymNBYrLTL5jeHGxKhJJC5fZAdEHMPaybTt0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfzjJA1ldnUwm9meDMQznQW8Kv97zgxFXIvpL3JLImY=;
 b=RDL/dLlttCGA57/USckj8omkAUf5qVSM2mtM6x3MlMxyttRKukYdfjVyxWcYQpaaPcc+B+AiUQVmyUhox3DS47Cs7LXvx24QCs5J8WSYhZ6il3KTEaIQEma5TekFf5d1UoF/8OL8TDw9NuvoqsJj2EAGq6g4eVK4Cdb3f+M1MusfqZFMAItVOxBk80TX7BnbmtpCXu9v229IU3U3rpZ30NIpxDpSyTzNP0J/nNu242yQnF2o2LPx/0GVx1o2LyWwM2zHQuE3vIOO7eJ6C68Q6EoGs8V5jn/F4Xax87W/RhWtQ0DPQMT2Xq+WGL/emAWg3HUjU9xmnZPgiP4C3Sp8rQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH v2] misra: add deviation of Rule 17.7
Thread-Index: AQHcFlwdO9JZfbniJ0qkcPaDWppdx7R0jhQAgAACKoA=
Date: Tue, 26 Aug 2025 07:53:18 +0000
Message-ID: <94b937aa-b27d-4a11-a260-4ef73e1cb4a8@epam.com>
References:
 <812b78119cee801662a31d39b556cb453aa69508.1756192362.git.dmytro_prokopchuk1@epam.com>
 <204a1526-7e3f-4b91-b1ee-95f3d89ff756@suse.com>
In-Reply-To: <204a1526-7e3f-4b91-b1ee-95f3d89ff756@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV2PR03MB8656:EE_
x-ms-office365-filtering-correlation-id: 4989036e-42de-4fe2-e344-08dde4759ed5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDFXTGg0VU12RTMxZGVucGpVL01tdjJwRWJRSGk3MHVrUm9WOW1uckNuY01Y?=
 =?utf-8?B?RVlVanE4bWMrK3kwMUJ0Wll5WGNXVC82NUQ4Sy92Wm5qRWtWR2FXRTU4a1ZF?=
 =?utf-8?B?RjJoVWZ4cndleHkrTjRMVVpvb212VVpLVEd3TDdHM3hOVTZpVitlbFhMc2FK?=
 =?utf-8?B?eDlKWk04WmJ0V0xtTGE3ZzlaUXY5MjZHdnFGZW9rNW94V1VpT0trUDhWdnEw?=
 =?utf-8?B?R0pGRWZsRnB3Mm45MkJIR0ZTNllRRm5tUEZQQVhQOXptRTRiQzlLdmhIZGds?=
 =?utf-8?B?eGlWaFVXS0g3cFJhSW9PaHV3YXdnVDdSSERXbzhOT3Irdjdkelpmb2pqUnNy?=
 =?utf-8?B?M2orYXl5YnFYeElDM1QxVW9BeXdEWGlHRTlMdzlybkNTZTY1N0JHR0NUNHlX?=
 =?utf-8?B?c0VQWXNieFJONXdMYklwWXJzeDVJNnE5a3AxclZsZVRtYnNYaE1TMlNBOXI1?=
 =?utf-8?B?bWhDZk1BSE5YZ1I4VDBtTi8vUFdyeUFSZGlqZzdwZnNPS1IyTVNCeDVQTng1?=
 =?utf-8?B?NjEralFjWmQrRDRyaklUN2VmQlBRUnZMS2oyc2JvUC9UY0s5eHZlZTc2SHl2?=
 =?utf-8?B?V2UvNGQ0OTBpNGd5TlF1c0U2bCtubWVyY0VJbWFMOUZ6OHlma3l6aTZzSnhu?=
 =?utf-8?B?VU1SOHY0eTJjM3NpeHFIMUQ3S0NqaTNNL0lVRWV0Y2ZqNjMrcGZhd2liVTJ2?=
 =?utf-8?B?R3FaUXVQYUtSbnJaWVc5ZFdPeDk0S0tZS0RQWDBsU1JqRVdVOGxZSHJoa0dt?=
 =?utf-8?B?b2JZSnA0UldhSlprcVhGQ01CbklrdUhmSkN6R3dPMGFyTnNnY01PR0E1TXRr?=
 =?utf-8?B?aEdhNXcrQ1JKNy8vdWpzZWxZMzZ4U2ZpQ3FBcmNSTndVZlYrbzRmY1pYV1Av?=
 =?utf-8?B?VjlKUHJCKzVrM0toMjBaR3JrQURSWm5HT2xSOEp5MEZpWHIrSng2UWFYRC9X?=
 =?utf-8?B?eG5idGhxVFo4MEo1NmVBbEV2NGcyelRyRk0zUlFEaTRocWRZaXhGOW5FVm9L?=
 =?utf-8?B?N2paN2ZSVmtzQ2pBTkdIRDlyMExFOFFrSjF3eENmazNDbzZNaUZQZFpDNjV2?=
 =?utf-8?B?cldJa3V0OXJKWGo0dENhQTZzV0ZvQ3lDMnJxQVNwSG1MZ2k2Y0hSRkJyZ1da?=
 =?utf-8?B?L29aVzV1T1NiamxUMllsendzeFlxM3lDU0dnZXdmaUhPSGk0UnhJeG9lUlFO?=
 =?utf-8?B?R2lIMHRVSmtQUlhTaHAxWlptNU5VMWtOTFlXK2pxNDdUUFVJVWpOOVpoR2F2?=
 =?utf-8?B?cTVKSUtzZk5PR0M0WHdGUGUxa3pFSTFZY1pETjhJN3hHbC9SdDdxY1Z5dXFk?=
 =?utf-8?B?MUJrejJWM2h5ZHdiaDViYWxMQUtJZDNhb2hCbnlBeWN3RFFraG1pL3B4MjNK?=
 =?utf-8?B?ZGhCdit6Mkg1RGllU2N5SForTTRHSC80dU5TUStsWnJDTEdVS2xJS0hCNjAz?=
 =?utf-8?B?WDg4WlVxSEdPVU8wMkpEZWxVZDhhYXhnanhRWnczY01GVlZDUXBUQjZlVUNt?=
 =?utf-8?B?MXM4enpoVEtpSzZUWmhTdlowcVRIOUR0dGoxdTBESmUyaXVvbWwycDFhR0sz?=
 =?utf-8?B?cURpUHpXL0pyNlh6QXp0SU01NUt4aHRNRXhzV05pMFVuWnMza3RQeC9OakRz?=
 =?utf-8?B?REJReVF2ODd1b2FmNnFhZlZRSm9mTVRvVTV6aitYSmF4TGFrK3FxcU9mMHJZ?=
 =?utf-8?B?bGtJUWdJR2VlZGpGVTMzN3Nuc2JUdFhNakoxM2NPTXYyS2J0UE5JRWdQOGdY?=
 =?utf-8?B?QjBiM2lCa21rNk81UmdsWmxZR2lxa3FRNTB4OWNRMjh6akhPQnRMaER1bjFt?=
 =?utf-8?B?WktXSkxRaXVWbWErdTBrcmpUYXVsQ2Z2bjc0WEIyblBEaCt2TWhQWnZhejE5?=
 =?utf-8?B?aFhXemk1R1c0aDhsUVFTTDU4ZW1QRGt5R2hJWWNCRXJHN2s5eFcxYWtPOUkv?=
 =?utf-8?B?RGJVZkNqNVR1TTRVN25XVWdJS0xHZG1rNld4WWpXYTByWU5hSzcwUHNETHk5?=
 =?utf-8?B?Q2ZXYkpUNEt3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFpsbHpjTTRGRmliWU9uMEhmTE5CK3huWlB6SEtJbXUyWE5nczh6b0V0RGJS?=
 =?utf-8?B?N1h1VTVaM2w2bXhnbU9kb29NSmtVMEkyYnU2QXNsbjlIL1IxQ3BiUFlPdFlh?=
 =?utf-8?B?STQrRjgxWndLSmQxcVpXcjc1elliSW9LdUovMTN4eEJKa1lEb0I2YWg5Umlh?=
 =?utf-8?B?OXk4a2Y4emxQMUJGRU9iRGJNUEErYjVoQUExdittY2dFeWYycnpucUVqMmc3?=
 =?utf-8?B?RzhPZkMrRkRRY2FzYmlkdGpoT21JbXlxSzNBNk56Y3pRU1JNM2piWXREcmJD?=
 =?utf-8?B?RWpPZzdwYmlwaGo5RmZzWnc1Rjlyc0NkTHhoRnR1SFRiY3pkRmZYMCt0cFVC?=
 =?utf-8?B?Y1ZiN21IV09Bdm1lZHY1ZHg5RjhFV1pOTkR4Sko4bWUyRTNaNkVQd0FCUVdE?=
 =?utf-8?B?RHRCUVdLa2RIZWl6YS85SjVzY2ZxYVBOVml0T1h0eDh5NVR3M0NXNXJSQTdJ?=
 =?utf-8?B?NVlzaEpiSTV5SCtTVXFiOUR2clNpbGgxTTJxS3VMc2NNcFhldjMwbnU0UGp6?=
 =?utf-8?B?bW9pTWs0SG1NTllsbkNxS1hKZmdvNFVIaStLMWVxV0VKTG5WVW9PMXBnbnFZ?=
 =?utf-8?B?a1ZkeEhTcXBZRDBFeWxCOVZ1eEdHQzVubGEwWnZXNU5XY3d3RjMvcDlna1JG?=
 =?utf-8?B?M0J4eHJiLzZaajhaV29kekpMT3dWQ3UwckJ5K1NEa3dJRFJxalkydkZMTmZj?=
 =?utf-8?B?ZWp3Y0h1c0tPUFU4K2R0WlRHZ2REMVhrZzlUelNWYkhreDJjcW1yUGpVczJl?=
 =?utf-8?B?dTNLUXZnMldFOTJ5K0FwUllCQlFNRitldUFkZVo5SkJaZURhbUExOWJUdThu?=
 =?utf-8?B?eGtNRmhUL3dWL2lIU0ZLTVBBRGNWZ1FIY2tGcHVDN3pHMzdDWW4vOGxvazNF?=
 =?utf-8?B?cnkwTDBSSlZxTGNJZlNrSHNKRU9Mc2Zxc2VMWS9TQ212dEdsVmtiWTN4TXRG?=
 =?utf-8?B?NDA2eWR2RE1kMThKYzgvek15ZHIrTkgxa2dabmtXOWpIcFUyMVcydFVyUFpX?=
 =?utf-8?B?TnJFdFV4UEt5czlZM3hPdUVBS2RkK3Izbjl0UERTVERCaTdRbFc4ZzZ0SWRK?=
 =?utf-8?B?WDBNTlBZeTRYaHlzVHU5aG1jNUt5WjJKVjBweWRNMXRmZmtocGZqUTc2TldB?=
 =?utf-8?B?NGtZNnZtVnJlRnBiNVhJRFd4R2xudjdZTnk4N3Y5TFRJWmFFMG0xd2tVZmFB?=
 =?utf-8?B?Z01Fb0I1R0prcUkzQUtQWWRZQnNxd3d1WHV0Z1IyaElkWG0zbUZaOE1FSmRO?=
 =?utf-8?B?aUxENWJzM0FnT2o1YldXK1dWdXVvUWJXd0pHa3k3aWhBVDl6dEdpajNiT08w?=
 =?utf-8?B?TVh0bW85bGU5MnhzLys3SmpjZzhETGRMaHNsbGJ4dko4dW94K2ZMN3NaUXlK?=
 =?utf-8?B?a1RsNVVVNG82ekRSUUViME56dlBCVS8wT1NtOS9JSkNGTmpmMU1wT1pTQnox?=
 =?utf-8?B?aERsN0cxRW9BeFpZSWk1ZlMwK2dsMndlUGxJUGpBdmxlcGFBVWJFQWNqcWUy?=
 =?utf-8?B?Znl2aVArK2VwaURzeG5Zamk3b1o4bXhRcWQ5Y0oweFgzWnh1Yk5WRHR1QmtM?=
 =?utf-8?B?UDBRNXc2QVBTYmZnUStNK205a3dPYUtHTjExRVhMeVg4YnRqQkhCUnNEOXhO?=
 =?utf-8?B?YllFcEhlV2pSVkdNMWpXQ2xlZzdrdllybHpFa1NWN0l4NmRiZllCZHZLRkV3?=
 =?utf-8?B?UGFlcU9RcC96dzY1MzJyYUdDdm5JR0U5OEpRRllGWmlMT0NycGpTeVFuSzR1?=
 =?utf-8?B?Y3lVWHB3N2NSaWJzMlJ2ZDlSeFBMdWtJZW9PUFRSRk1rK0g5dldWWFV0Ym5O?=
 =?utf-8?B?OUVKQlZxWEFXd0d4L3daVEJ0TjRHMzJZNTN1cGdXMFNvemVJMzQ5cytPVDk5?=
 =?utf-8?B?akxHd1E5Qll6aGlVQnl1eW0wUHJ4UjhRTzQ5Sk5ZQU9QN0JiRlBjczNoTXVz?=
 =?utf-8?B?dnV5Qm1Jb0M3QlBmNUd1a0p1aWJqZHI3ekRJL01zV0tJb1RPS1Zsc25KdkNn?=
 =?utf-8?B?aElPVGRuOTZ4TWtBNFVscjQrU3JuZVA5NExNOE90VVl3eFlXZGxpUitUd2Ux?=
 =?utf-8?B?WlNMcERrVDN4SlpQSjVPZ0hWVDhVdHoxaDMrTEprL0VVc25STmJnYzM0cWF3?=
 =?utf-8?B?VkdvemlYSGxGcDJINGJkQURZTm1kaGNsU1ZHNUUrZ2ViSGtxa205aFA1K0RS?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F6F0656003B014AB627229947E55D86@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4989036e-42de-4fe2-e344-08dde4759ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 07:53:18.3094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tccPr4Gf0pwLlGfrZjOr3L3F4lamegOTgWR6fFiaAEVreeSgPLUcODqIPttajVf0BMWIUDNJSJrDv6En2K9pQCND8aky39+xiwNTfUF5eo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8656

DQoNCk9uIDgvMjYvMjUgMTA6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wOC4yMDI1
IDA5OjM2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9hdXRvbWF0aW9uL2Vj
bGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+ICsrKyBiL2F1dG9tYXRpb24v
ZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4gQEAgLTU3NSw2ICs1NzUs
MTEgQEAgc2FmZS4iDQo+PiAgIC1jb25maWc9TUMzQTIuUjE3LjcsY2FsbHMrPXtzYWZlLCAiYW55
KCkiLCAiZGVjbChuYW1lKF9fYnVpbHRpbl9tZW1jcHl8fF9fYnVpbHRpbl9tZW1tb3ZlfHxfX2J1
aWx0aW5fbWVtc2V0fHxjcHVtYXNrX2NoZWNrKSkifQ0KPj4gICAtZG9jX2VuZA0KPj4gICANCj4+
ICstZG9jX2JlZ2luPSJJdCBpcyBzYWZlIHRvIGRldmlhdGUgZnVuY3Rpb25zIGxpa2UgJ21lbWNw
eSgpJywgJ21lbXNldCgpJywgJ21lbW1vdmUoKScsIGFzIHRoZXkgcmV0dXJuIGEgdmFsdWUgcHVy
ZWx5IGZvciBjb252ZW5pZW5jZSwNCj4+ICt0aGVpciBwcmltYXJ5IGZ1bmN0aW9uYWxpdHkgKG1l
bW9yeSBtYW5pcHVsYXRpb24pIHJlbWFpbnMgdW5hZmZlY3RlZCwgYW5kIHRoZWlyIHJldHVybiB2
YWx1ZXMgYXJlIGdlbmVyYWxseSBub24tY3JpdGljYWwgYW5kIHNlbGRvbSByZWxpZWQgdXBvbi4i
DQo+PiArLWNvbmZpZz1NQzNBMi5SMTcuNyxjYWxscys9e3NhZmUsICJhbnkoKSIsICJkZWNsKG5h
bWUobWVtY3B5fHxtZW1zZXR8fG1lbW1vdmUpKSJ9DQo+PiArLWRvY19lbmQNCj4+ICsNCj4+ICAg
Iw0KPj4gICAjIFNlcmllcyAxOC4NCj4+ICAgIw0KPj4gLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRp
b25zLnJzdA0KPj4gKysrIGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPj4gQEAgLTU3Niw2
ICs1NzYsMTMgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+
ICAgICAgICAgICAgLSBfX2J1aWx0aW5fbWVtc2V0KCkNCj4+ICAgICAgICAgICAgLSBjcHVtYXNr
X2NoZWNrKCkNCj4+ICAgDQo+PiArICAgKiAtIFIxNy43DQo+PiArICAgICAtIEl0IGlzIHNhZmUg
dG8gZGV2aWF0ZSBmdW5jdGlvbnMgbGlrZSAnbWVtY3B5KCknLCAnbWVtc2V0KCknLCAnbWVtbW92
ZSgpJywNCj4+ICsgICAgICAgYXMgdGhleSByZXR1cm4gYSB2YWx1ZSBwdXJlbHkgZm9yIGNvbnZl
bmllbmNlLCB0aGVpciBwcmltYXJ5IGZ1bmN0aW9uYWxpdHkNCj4+ICsgICAgICAgKG1lbW9yeSBt
YW5pcHVsYXRpb24pIHJlbWFpbnMgdW5hZmZlY3RlZCwgYW5kIHRoZWlyIHJldHVybiB2YWx1ZXMg
YXJlDQo+PiArICAgICAgIGdlbmVyYWxseSBub24tY3JpdGljYWwgYW5kIHNlbGRvbSByZWxpZWQg
dXBvbi4NCj4+ICsgICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBmb3IgRUNMQUlSLg0KPiANCj4gSSBy
ZWFsaXplIEkgbWF5IGJlIG92ZXJseSBuaXRwaWNreSBoZXJlLCBidXQgaW4gZmlsZXMgbmFtZWQg
ZGV2aWF0aW9ucy4qIEkgZmluZCBpdA0KPiBvZGQgdG8gcmVhZCAiSXQgaXMgc2FmZSB0byBkZXZp
YXRlIC4uLiIuIEkgZnVydGhlciBmaW5kIHRoZSB1c2Ugb2YgImxpa2UiIG9kZCB3aGVuDQo+IHlv
dSBlbnVtZXJhdGUgdGhlIGNvbXBsZXRlIHNldCBhbnl3YXkuDQo+IA0KPiBJIHdvbmRlciB3aGV0
aGVyIHRoZSBkZXZpYXRpb24gd2FudHMgZ2VuZXJhbGl6aW5nIGFueXdheTogSW5mb3JtYXRpb25h
bCByZXR1cm4NCj4gdmFsdWVzIGFyZSBnZW5lcmFsbHkgb2theSB0byBpZ25vcmUuIFRoYXQgaXMs
IHRoZSBFY2xhaXIgY29uZmlndXJhdGlvbiB3b3VsZCBiZQ0KPiBsaW1pdGVkIHRvIHRoZSB0aHJl
ZSBmdW5jdGlvbnMgZm9yIG5vdywgYnV0IHRoZSB0ZXh0IC8gY29tbWVudCBjb3VsZCBhbHJlYWR5
IGJlDQo+IGJyb2FkZXIuIFRoZW4sIGZvciBleGFtcGxlLCBvcGVuLWNvZGVkIHVzZXMgb2YgdGhl
IGNvcnJlc3BvbmRpbmcgYnVpbHRpbiBmdW5jdGlvbnMNCj4gd291bGQgYWxzbyBiZSBjb3ZlcmVk
IHJpZ2h0IGF3YXkuDQo+IA0KPiBKYW4NCg0KWWVzLCBmdWxseSBhZ3JlZSB3aXRoIHlvdS4NCkkn
bGwgdXBkYXRlIGl0Lg0KVGhhbmtzLg0KDQpEbXl0cm8u

