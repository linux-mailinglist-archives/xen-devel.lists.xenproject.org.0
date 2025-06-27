Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57FAEAF12
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 08:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027296.1401995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV2ip-0007oE-H0; Fri, 27 Jun 2025 06:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027296.1401995; Fri, 27 Jun 2025 06:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV2ip-0007mH-Ct; Fri, 27 Jun 2025 06:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1027296;
 Fri, 27 Jun 2025 06:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Eu8=ZK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uV2in-0007mB-Et
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 06:38:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40190b44-5321-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 08:37:53 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 27 Jun
 2025 06:37:49 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 06:37:48 +0000
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
X-Inumbo-ID: 40190b44-5321-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pORaVjFfO+DKZ80JcbX8GWwwYABptLCR3gVnkMeoMEhPwLNNiILVaANzjwVQARLemzRCSq7Fb0EgBld1fvxtoH+oI16bYqliRDCskup47+7vI4PngRiPVnoA0oQjSzGVVUdRVfLXGqELWOhZY9rfZ5roKyHGgCYjUdlr6NKn5UlhddEiRudlDnehv5nVpvNtZG/RxmmvEiUvgG80Xa0lqLbh8OnR70zVJE5LFmBfjC7Z19vGLX0p1u9LEffezjWKLR3WzSiz9+g64FP+xOKale4QnRWQR8puKFIPHByw+mtsa2sh4EfyE/qQK/ri3k3NYnuCmp/n74A9V6fQyptlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR0zseXZk2bUXzqXRG9P5SSPPrGx3g90Zcg/c0ZFAg8=;
 b=AoesZZwmWQ7TQ6idgp8Q+glhmQZPwuL8Ax+MR3w6A5hKQvaH8C2c4/aOLS13zQqKTZG0TFeV+uaZNjRAfBUUJg4/rDyI18z+I3AmCSdtMj41Rrz6bn+vImvHWRYeWWdlf4i2hA3ea0j5g3Xb5cRs/KAS+nr78LwYlweShKx4hD0G20ih+BnFqDyHClhHsP+K1StVTtZvbGcYa/LWcMjNXDnd6Y7iHhREYzEpkIwrgCIiPU/eTu5cSmR8KoV0uvVXi/4Nn5i3uhSVLoydzJR9TxkYyf5OpUeV4bnTV170lPCVWrXzjq0K72O81qtHFWbIdeBNTW6XkpmgNUzGS8PW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR0zseXZk2bUXzqXRG9P5SSPPrGx3g90Zcg/c0ZFAg8=;
 b=ymSfVkqA1v06PG0x73fCRSbua5KU6Rz1KEf9tgYxvBnbONjUDRQOV9zf4lBj3QD5EK1FSxDrCMa4Bb6s/TncARj6W2xmjH7SXT0yR8vvo966LHkjRNGeuxFyXq8c5qZQowMCIpAD0oOONURYYFhXP2w9GWjl0ZvFqUl5i7e/Z/E=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Topic: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Index:
 AQHb23yZHYwoBN0glE68BnOedByoqrQI+ZKAgAFXGYCAAVGyAIAG16sA//+EZICABSptAA==
Date: Fri, 27 Jun 2025 06:37:48 +0000
Message-ID:
 <BL1PR12MB58499CC1A26FA82D70857876E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-2-Jiqian.Chen@amd.com>
 <669877f5-ef34-4552-9cfc-e097d40d444a@suse.com>
 <BL1PR12MB58492A07F1E9491B1F8D8E00E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d8095395-fd6b-49a4-86c8-0a3d6c5a1a71@suse.com>
 <BL1PR12MB5849022F40DDD22BABBC27A5E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a58d47c8-4763-4448-a97b-0021c5c95917@suse.com>
In-Reply-To: <a58d47c8-4763-4448-a97b-0021c5c95917@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SN7PR12MB6929:EE_
x-ms-office365-filtering-correlation-id: f0bc20a6-719d-4216-3472-08ddb5452245
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N0xQQ3I2OHFHazFBRG5UdUZXQ0JsZ0tyY0JuL3Rkc1JwRTNTWUl6Yk5hSUph?=
 =?utf-8?B?amNsbmYwc3NwZFBvVXJ5UmR4T00xSnBOMTF5TERjN21uMFZyby84UlZHMVps?=
 =?utf-8?B?dkMzMGhadUFKYlFseDNZNWxXUmkyUEpvMk5oN3duRjBxVFdtZzNtYjZTZkJR?=
 =?utf-8?B?aEZ3TkhiblBEZDJSWlNPeW9oeWhuWFpIRkczUlBBay8rL3dnZ3RIaExNUzB4?=
 =?utf-8?B?RWptM242TlhWRjQzMU54N1AremVieTFZSlNQT2ptVjZhb0hhdndjMzZxV2dL?=
 =?utf-8?B?bXgyeXZheGdyYWh5V1ROTU1SaC93STNDMENzZWpkWW41WDJQSVdEdHc2RDk2?=
 =?utf-8?B?YWVHQ1dTN1gvZ1JlQXQzTWtUVXp4U0lsNDZpWXRhNjRMalp6Q1Vnak1nRVBy?=
 =?utf-8?B?OFEyTWF3NDUwRElJTW5HanBHdmdCS1B6K0JsUm5uZXRtYXlMcXNxaHptT2h5?=
 =?utf-8?B?Q0s5TjFHOXpLanpRU25lcWdQN0hQZFkwTW5QejlteEtueUVvRit6NG5sbHBx?=
 =?utf-8?B?cjJhUDdaUW5Cc05ZNVArODlES0tBaEFES21MSy8xWStZWnk0VjFsbmMyMU1q?=
 =?utf-8?B?QTBWR2pvMlBtbFNDNEhxQlZXYXhIY2lmSjJTMzN6d0pNM2hRRG5QSGx5MFky?=
 =?utf-8?B?N3VUd2p6dnhGZDRXSFM5Yy83dmtpbHRFcWpxeElFbUxEdG82eWxoRUlKbWdt?=
 =?utf-8?B?Q0ZrMXFaUGZ2ZlBodEU4cFRlVXVmdFRLa1h2WDdNZmoxck1HbjhuZGcyMlJt?=
 =?utf-8?B?WjU1L3ltWXNKMlhTb3ZQeFVOWnVmZS9PNG5GTFV4a3pxRFVsM1E0ZE1zZUk0?=
 =?utf-8?B?a052OHFIaW1UQ08vVGRkMEFZUGhLM1JtYXpvOTAzTDBxeDhzNk9icmttUmNN?=
 =?utf-8?B?NHBHYWsrbHZQZnAwUmNtbURMcVQwZHlyU1VwMXIzV1ozZEdWb0ptQmdCaHJj?=
 =?utf-8?B?K1pwbEpWb0gzNlVYS3B2b2pVMTVsempIVjRFSW9WYmZSbGhxQVJ5T09rNC9j?=
 =?utf-8?B?bGdZR1FIVnF5SEl3cjNiUXhVQm9tMThlbUVHQWJ5Tk0zMEhQbGZHM0hlQjE0?=
 =?utf-8?B?SlI2cGl2c084VUNKYUtnMVpoTG5CaFlONGJma1llaW0rdlRJNytKd3JZTFRD?=
 =?utf-8?B?c0Y0eTh0Z3FaczN0ZjdCc0I3TTM5blM3dUJ6eTZtMlpwTVkwUnN1a0hIcUFP?=
 =?utf-8?B?ZWJhNlNKdll2eTRWYzBySnc3NjIrK05nK1VSZWdiRUo1S2hEWFdVMGZkY1hm?=
 =?utf-8?B?WWxjVzdIVFZoNVZyT1MwVE8wdWpJWjgzSGl3VUhvMEZIUXprT3E0LzZaRmtD?=
 =?utf-8?B?UkltSTRyZDRaczNvd0VySHA1UnlWZ1o0WDNkYisxOEpuNk96clFDNmtvMVNj?=
 =?utf-8?B?c2h3YnAzWjBWdm9HVHlxSjVzVHpjMXVpQis4SjI4bDg3TmNvZDlvSmRjUlhL?=
 =?utf-8?B?SnRqckRyK1BNcXM0NzEzckVJclRCWlBhblNLeHBRZkpwRmNXZnE1Q1QwOXlv?=
 =?utf-8?B?YkNGMTNQZkszZG44MWJ0Qm5IQnhBNUt5YWU3U1ptZlhZQmpXS2ZjTTgzYjht?=
 =?utf-8?B?UDZCeVBWdm1KRGFhdWMvVmhFaDZPVG4vbllTVURxaFVzRmdTNVgzcCtZT3BK?=
 =?utf-8?B?RThZTjFoT0QrbVE3U0hqdUcwbk94OUhPdjRZM25DUTcvRGdscmNBRDlsZkNX?=
 =?utf-8?B?SDdJUkZRV3J5azkzT0RKSUpPTFJMbHhiU01GOUdqUWxoc0xUaUtvWnpPNU1M?=
 =?utf-8?B?SXdKN0F1QVpMMU1Wa05NcHRGbWhYTi81dlZKeHBoL3lPSlBqRFN3eFhRcGh6?=
 =?utf-8?B?cFZ2RkNJcW9RNUtvWStXSmtnZXRaSk5kVEpPbWVWWlRBNHpFaENYUWlHNjE3?=
 =?utf-8?B?VG51N21Ea0dadGFXcllXdUJNTEZNSGZTSGlmUzNuVmgzREZzbFlSYkVjWHpi?=
 =?utf-8?B?ZmRJaUdKbXI2TkJyZzFyZ0UrUzNUQThVbVE0MmdVdm00QmIvSFlNanZ6MGdC?=
 =?utf-8?Q?l+ZvZjnsKnQtd/xC501+ZEUlGjsOjA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amZ3Z2U5M2FPK2pZeEF3ZncwWURuWDV3WDQzR2hod0M5U2I4aFQzZ2xrSUpU?=
 =?utf-8?B?MXM4UkRVRGpaQmJycURmMys4V2ZUZnRQQUVJOFY0eEtDRmdSTnZaVHk2M2dM?=
 =?utf-8?B?eXA2Sy8rRlFTb09pSFZyWkpZMDBZUWo2OG93RHRBR1ZicmdXV3RibU43NU51?=
 =?utf-8?B?RXFpZzBheUdGWW1IYzBWUDFxWUZpcm1zbnA0d0I3NU1ZYnBmemhKcEFHc2sr?=
 =?utf-8?B?T0RrR3JkeHNQbmpEc1cyMWpkSVZ1T0RhZU1KMzFzS2VJblRDQnNTZHpEcE5K?=
 =?utf-8?B?VU9JWUJBMVpPa2VTTTZNWlcxRnZCdlZYcURBN1dObWpMWUFnRzJNR0lGcHpk?=
 =?utf-8?B?cnllUXh1ZWp3UytUTEJhRkx3VmZxTzBGaTZ6U2RzNVRGMlM5WUpEa1VRZ1Nn?=
 =?utf-8?B?NEtmbnkvYVpyaU9WT1pyZFlyYUN0RHNJRXlqVTRTTkEzQWJVeko0citwT2pM?=
 =?utf-8?B?QzQ5LzRqM0RObHV2YjQybHFXSXlOdUtNYzNOSkpIZ1V5WFhCZWhBOUFackp1?=
 =?utf-8?B?ank2aDNiMXAzUjJhVVVDdmVGYmxwNUw5NnNMU3c2eUlSMGRkbDRXL2ZMZGVV?=
 =?utf-8?B?NmowbmtGKzRPdDZqUmhTZ1JPTHZjQzZ4QkR2VTZPZjVmWGxyWjNJQktlTGdv?=
 =?utf-8?B?NjVqbnpHQ3ZTS2NEemh0dWRtK0FJNElvbTY5MkI2c3IvdUxWUmhSS2lGeGRh?=
 =?utf-8?B?emh1L2wvQXZ5K25lRmFjeWo2RGdGVHJ5b0pENlRiYUtYSzN2RmFIZlJEZHI4?=
 =?utf-8?B?QWpjUTk0M2txMC9kNFF0Qk5rWnFDeVVWWVNFYXVnNEcrR1N6UUduajdCVFJB?=
 =?utf-8?B?emVXa1lVekVvaWJrVHVFMVB4Mm9qaGtvNS92RDUvcmdYTWgza005OE9hZk5p?=
 =?utf-8?B?V1E4SnQxTGFEbkM0eWw2Zk1DdE9tZm16YkpNSnRZRlo5dEpKUzZybFRKS3Z4?=
 =?utf-8?B?TGFUajdYemxaQnMyV3NqZ01icnVPSzJsZ1dUR0JzTnlRSHBYN3EyTC9iZUhP?=
 =?utf-8?B?RlFkYmdZaGpqeEtMRmR3dnJHYkR5VzU3WG5ET2xJRERPUGFSc2JOZmIwbWk0?=
 =?utf-8?B?aml0MElnaEVWRWlhcXBWNTJmeEFCVHMxZGdLSWdwUHpFN043MDNrbVRkRlh3?=
 =?utf-8?B?MnJsa1kvZjNyUEN4ck5Za0tWT2ZiUjZISmMyQ2FIcWN6UzV0aTBrT1I5WFpX?=
 =?utf-8?B?SkxBM0RYZ2E5ZXlFS0xkNVltNXBFQ2cvMFE2STZkdVhBVyttL3cxU1N3YTg2?=
 =?utf-8?B?RGVNaGlkZUZEdGtMeUFha0pCNHpZa1hGdnZnQ1BTUUluRlg2aTB6cXRWNjdl?=
 =?utf-8?B?aEtjMS9BWTh1SGpOOVpKbnVLS1FPek12VHVYakxlcERKdTNIcHJCUHc0WWw0?=
 =?utf-8?B?US9UREdNdGpFaS82RnJEWkt2MDJMbG1DZUVsTUgzYlhDOUF4K254SU5ITUNt?=
 =?utf-8?B?WGt5TkM0QSt1Um5GUGZIUE1JY1VUY1AxYTRhbGJBN214S2hVb0pkMUl6K2x3?=
 =?utf-8?B?MThnQXJuL1EzZU1UTDByOXJOcVlsK2RxdDBJZUt0RENLYWE4bWczOVJWQU5i?=
 =?utf-8?B?WDdyTm94b2gwdmdiVGRybXFqN0VDNThBb1E0WVVlRFhKK1FQajZnaUhScUI3?=
 =?utf-8?B?SkR3ekpTK2NibEZFSEpNR1ZieExRTnlFbGcwWm4wRkgrRWh6T1Y0TEZoWDdQ?=
 =?utf-8?B?b2V6WXpxY3FOQjFBbk1ORnozdUZyRWtxMzlicmc1bVBOd0htb2RmUS9IcTNt?=
 =?utf-8?B?ckI2SjBYeGV1MmpuL2xJbk9nUU96dktSL2VoZ0d6UElmVFRzemFNMElDckt4?=
 =?utf-8?B?aHc2WFp6SjI2dXpJRlFZZkVSV2RxRTBGQk44akJEN05xV3V1YTBCSGpTaDBU?=
 =?utf-8?B?WnRJVHpDL2toNmdkUVdjOU16UklLVlZQSUs1VGtlSncvQVVEWi83ZnNpZlFm?=
 =?utf-8?B?dTJ2aEVqbVVpUjlWdWxhbDhVNi9nQ2dhdE91MWJZOEdrV0ZrWGFka1J0U3d0?=
 =?utf-8?B?MEsyMTJUOEFqS3VNKzluWUxrcEdQbE81R2Fzby91Y2VKUW9KVnRTS3BIWVJo?=
 =?utf-8?B?WFVmT1ZGNGFwU0tEelVmdDVQZnJvYjN1MHRSRDBZNFhNUzM2L0ErbS9BRXgx?=
 =?utf-8?Q?HgIQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <847A666388A22F429BF0846B6961BB5A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bc20a6-719d-4216-3472-08ddb5452245
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 06:37:48.8282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHAbr/iYTRHJAKwoPSYhTpg7alUEaJlt0CwPy/34R5issKZym/xxv0iBCrvTd4wvKIWdwSVDC1kjU4bBx4qPaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929

SGkgUm9nZXIsDQoNCk9uIDIwMjUvNi8yNCAxNTozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9u
IDI0LjA2LjIwMjUgMDk6MDEsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjUvNi8yMCAx
NDoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMDYuMjAyNSAwNDoyOSwgQ2hlbiwg
SmlxaWFuIHdyb3RlOg0KPj4+PiBPbiAyMDI1LzYvMTggMjE6NTIsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4gT24gMTIuMDYuMjAyNSAxMToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3ZwY2kvaGVhZGVyLmMNCj4+Pj4+PiBAQCAtODM2LDYgKzgzNiw0MiBAQCBzdGF0aWMgaW50IHZw
Y2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfU1RBVFVTX1JTVkRaX01BU0spOw0K
Pj4+Pj4+ICB9DQo+Pj4+Pj4gIA0KPj4+Pj4+ICtzdGF0aWMgaW50IHZwY2lfaW5pdF9leHRfY2Fw
YWJpbGl0eV9saXN0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAg
ICB1bnNpZ25lZCBpbnQgcG9zID0gUENJX0NGR19TUEFDRV9TSVpFOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4+Pj4+PiAr
ICAgICAgICAvKiBFeHRlbmRlZCBjYXBhYmlsaXRpZXMgcmVhZCBhcyB6ZXJvLCB3cml0ZSBpZ25v
cmUgZm9yIGd1ZXN0ICovDQo+Pj4+Pg0KPj4+Pj4gcy9ndWVzdC9Eb21VLyA/DQo+Pj4+IFdpbGwg
ZG8uDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4+ICsgICAgICAgIHJldHVybiB2cGNpX2FkZF9yZWdpc3Rl
cihwZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBOVUxMLA0KPj4+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwb3MsIDQsICh2b2lkICopMCk7DQo+Pj4+Pj4gKw0KPj4+Pj4+
ICsgICAgd2hpbGUgKCBwb3MgPj0gUENJX0NGR19TUEFDRV9TSVpFICkNCj4+Pj4+PiArICAgIHsN
Cj4+Pj4+PiArICAgICAgICB1aW50MzJfdCBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+
c2JkZiwgcG9zKTsNCj4+Pj4+PiArICAgICAgICBpbnQgcmM7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsg
ICAgICAgIGlmICggIWhlYWRlciApDQo+Pj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAwOw0KPj4+
Pj4NCj4+Pj4+IElzIHRoaXMgYSB2YWxpZCBjaGVjayB0byBtYWtlIGZvciBhbnl0aGluZyBvdGhl
ciB0aGFuIHRoZSBmaXJzdCByZWFkPyBBbmQgZXZlbg0KPj4+Pj4gaWYgdmFsaWQgZm9yIHRoZSBm
aXJzdCBvbmUsIHNob3VsZG4ndCB0aGF0IGFsc28gZ28gdGhyb3VnaCAuLi4NCj4+Pj4+DQo+Pj4+
Pj4gKyAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3JlYWRf
dmFsLCB2cGNpX2h3X3dyaXRlMzIsDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwb3MsIDQsICh2b2lkICopKHVpbnRwdHJfdCloZWFkZXIpOw0KPj4+Pj4NCj4+Pj4+IC4u
LiBoZXJlPw0KPj4+PiBJZiBoZWFkZXIgb2YgZmlyc3QgaXMgemVyby4gVGhlcmUgaXMgbm8gbmVl
ZCB0byBhZGQgYSByZWdpc3RlciBJIHRoaW5rLCBzaW5jZSB0aGUgZG9tMCBjYW4gcmVhZC93cml0
ZSBkaXJlY3RseS4NCj4+Pg0KPj4+IFdlbGwsIG15IHJlbWFyayBvZiBjb3Vyc2UgZGlkIGdvIGFs
b25nIHdpdGggdGhhdCBmdXJ0aGVyIGRvd24uIFBsdXMgSSB3b25kZXINCj4+PiB3aHkgdGhlIGVu
dGlyZSBmaWVsZCBiZWluZyB6ZXJvIGlzIHNwZWNpYWwsIGJ1dCB0aGUgZmllbGQgaG9sZGluZywg
c2F5LA0KPj4+IDB4MDAwMTAwMDAgaXNuJ3QuIFllcywgdGhlIHNwZWMgY2FsbHMgb3V0IHplcm9l
cyBpbiBhbGwgZmllbGRzIHNwZWNpYWxseSwNCj4+PiB5ZXQgYXQgdGhlIHNhbWUgdGltZSBpdCBk
b2VzIHNheSBub3RoaW5nIGFib3V0IGNlcnRhaW4gb3RoZXIgc3BlY2lhbCB2YWx1ZXMuDQo+PiBJ
ZiB3YW50IHRvIGNvdmVyIHRoZXNlIHNwZWNpYWwgdmFsdWVzLg0KPj4gU2hvdWxkIEkgbmVlZCB0
byBjaGFuZ2UgdGhlIGNoZWNrIGZyb20gIiFoZWFkZXIiIHRvICIhIFBDSV9FWFRfQ0FQX0lEKGhl
YWRlcikiID8NCj4gDQo+IEFzIGluZGljYXRlZCAtIG15IHRha2UgaXMgdGhhdCB0aGUgY2hlY2sg
bWF5IGJlc3QgYmUgZHJvcHBlZC4gUm9nZXI/DQpNYXkgSSBnZXQgeW91ciBmZWVkYmFjaz8gU2lu
Y2Ugc29tZSBkaXNjdXNzaW9ucyBuZWVkIHlvdXIgaW5wdXQuDQpBbHNvIGRpc2N1c3Npb24gaW4g
cGF0Y2ggMiBhbmQgcGF0Y2ggNCBhcyBJIHJlbWVtYmVyZWQuDQoNCj4gDQo+IEphbg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

