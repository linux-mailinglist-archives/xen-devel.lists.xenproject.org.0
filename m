Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C5B41D47
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 13:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108158.1458259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utlvz-0005MB-FU; Wed, 03 Sep 2025 11:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108158.1458259; Wed, 03 Sep 2025 11:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utlvz-0005Ka-CK; Wed, 03 Sep 2025 11:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1108158;
 Wed, 03 Sep 2025 11:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utlvx-0005KS-2s
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 11:45:49 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 884260f0-88bb-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 13:45:48 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7752.eurprd03.prod.outlook.com (2603:10a6:20b:407::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 11:45:44 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 11:45:44 +0000
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
X-Inumbo-ID: 884260f0-88bb-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxGm7j77DhcAzbWIFGpwNs6FMQBLwNqjYQCxXmUALc8P0JL4dbMo7cOqobWSnxNxG7FN+WWfB8DLZZ11EpHGs90NrAO3FjYk3vxJkOYB1VbUT1E5ro1PutYXbnwKYuVIhCFF3MH4RmSAJIV0MHPyfAjJ0elN0wZOsNNJJ47Q0AbI7Qerz7jawsT+4eWIVAQhuKzdyp5c5aBaUO/E1m5nh8DSY65sI0z4+jAmGfKEFXsld1W4MDXvGoHHm61s6Jx/Ukngg73/NMEDT/K7R7XBKlYavgChkjusIAucnttNmHArYd4UnKhCpyFOJ2CK4j53IpBOrfX7mnrYlMFgbiAphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOAh6ENdaUu54mP+IplBGvMSUQEl52ifOWUQyedUCxE=;
 b=f91etOVgmxJGFqZahFvdwaIcDw5OGqKw8wYw4/y8cKvUOIrE1G1vpEX98h4x+K5/uZjSsmgUdAEFfcy0uxbWsC0jvMCEIIC5GMTOYF4SzIhqEuRZ/UTwkH95fkkgvo21WNzyw6vHz3K5DozFRYuZlNaf3GJRoUSPw/0SOkAVFX7ScbkiUf5Y6CThPd41QB8H1ynOjtVlj+wFjZYMWRRgv5ACrTnKhzrMV3CKteu83BTzfykCDzFoP2Y/de87WTYazA/IXSXHW+6mrKXNf5ye5QQTkNYWfPbA7wwkOo72ifPZs/Gm0DJmN9HJ4IAEDL+vhqxxyddloWoe1LhvAg80Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOAh6ENdaUu54mP+IplBGvMSUQEl52ifOWUQyedUCxE=;
 b=ko0VeR9+oUf6p8+ma+mFhUHFxJpDK+DmzX9oezHrEuSKI7yDTP0vDcY692bqLEAmE7fKY1NpSnDtfx1WBAvgzi4fJ0pX0HWw+ai+Ofr7AMuKYy5XHMDNmWN0BMmflH162eKBbG6NIXRZ7BSQNdX/f1TbePQmSYWaEzXQ85ioi6GV/o09IDYUPDYtvY/ZJQ6vekqyj1BnV0ETddYhtHCKCsxkQp7Ka4l+9sCEIZNyNffta5GGsflc7SiCv315sjAdGnsCJ08+7Wy6EoaGOj39gUvOEm7j9bv0rgy2PS3KYSMOr3YLIEfAyOilbKZVWEDySjyZ29OVLS33s8kH0oPhfA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index:
 AQHcGP7lSnKp01vKiUyg8GCh+goOA7SAIt4AgAAIk4CAADCcAIAACbGAgADzZICAAAVugA==
Date: Wed, 3 Sep 2025 11:45:44 +0000
Message-ID: <6af234f5-6a47-4687-94c7-b9d2b715d234@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
 <06ff285f-39d5-4ffd-b842-6d776bb793ac@xen.org>
 <a10ae626-126d-4afc-acce-1e699a9d68e2@epam.com>
 <fac231ba-3d79-4eaa-9a23-4ae7aebc62f3@xen.org>
 <9d784bea-7ae8-4b0d-aa54-155dccd3f533@epam.com>
 <6c2cfffa-b36e-4094-be55-88c6a32234ce@xen.org>
In-Reply-To: <6c2cfffa-b36e-4094-be55-88c6a32234ce@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7752:EE_
x-ms-office365-filtering-correlation-id: aa575c9f-8df8-41cc-61ac-08ddeadf6ab6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bDIvUUtCTlBURk5JOFg3UE5tbHRLVm1pU3R4R1dxNWgzNFZZaU1qTStGOHN0?=
 =?utf-8?B?RFI5SlluNXJxSUt3aThOcno0VXdYcGtMMGROWTdiSmtuRDRvM0pYOTIyVFUr?=
 =?utf-8?B?SzBzZnpGc0ViOVNzeldiMkJSRTV0TzRqSjNiWUlEVXNVbGlUZjhuOE9sVlBW?=
 =?utf-8?B?TEdLdmJ6TmNOb1A4K0hranplTmZBbnRLY0x3ajhhaFZZVFU1WUlKM2lORC9v?=
 =?utf-8?B?cU9Bcjd4Sk1TQ001WG1Oa04wV25kNlhiUkNHdlMwck4zdWZhU0JtV1FwRW5j?=
 =?utf-8?B?bXBJeGVjRnMyNnR2bjJOQnA0YnE1ZzEwdmM0VS9rVWp5elhUd0xxc281MnBU?=
 =?utf-8?B?enBFemtqeG0rWVJCUEFxcHhEbnk4WnlNMDJnTUJCME40Z2JDMDNveGpuMmk0?=
 =?utf-8?B?SVNFWTVhM0hTS25pUmtyVnhQNnMzd0JWQWYwajNiS1JkMFVxWXNTSG8yZnJG?=
 =?utf-8?B?NVFoZm1vV1ZXVEV0Zm52czErdCtWL3RFMW5rTGJZMmRDbVBGSFVsQUt2dGNE?=
 =?utf-8?B?UTJiNy9IQThLRnNTOFdhblY1TGpLcnRHV3QybDllQkdHSEtITWo5SERzZkp6?=
 =?utf-8?B?d0FpUkdzcXZpOXptQ2p5N0JGY2dqb091R3RCalNydWlNd3IrODRRMGZaRU92?=
 =?utf-8?B?SGc5T0ozdC9tejJFbEJLL21jakVyZnFCNkZaWThRb1VyNHNaV05sUmppOERu?=
 =?utf-8?B?UGpTRzNVcmYvdjFvMHVRdkFEaDhOTFlndDNoSjZ3cVY3UlhaUHdYMkZMSnFp?=
 =?utf-8?B?L29tcXVyWEdCUC90K0EwZDNRNzMwTTI3d3RxT1JPZFdpQmlsaThMbHg1dUdG?=
 =?utf-8?B?bmRVcWNOZ3JzN3VnYVhNaWN3MFlvVTROMGdvTW9neXlKUDJEekgzclF4TEJw?=
 =?utf-8?B?VTI2N0VsY0xGa1BNTlBEbTIxR09qdTFQTG94OUZlVU5oVDFvem96QUp0S1NF?=
 =?utf-8?B?N3A4bFFML3JWUVdLYmdxUUNrcTFSUXR0WDVqcFBySnljaitpWE5ZS21ZRUxM?=
 =?utf-8?B?Q3hnUlZ5MUhMZTRYUzVkK2s4emU5YnlkMWVKWjQ3YW1NSzJ4UTdDR25mVjJT?=
 =?utf-8?B?V3FyaWRqVUVudWwvYit6cCs0UjJ4OUl2aHRvTlNsM2U1bkMzSHB6bkd4MFVC?=
 =?utf-8?B?MUNsdGJUOFRqWHlSVTU0ZVI1RGFEUFZVWEhtRmk4UDc4WCswamxXVTZYRisy?=
 =?utf-8?B?VTdHL2Y2RVhxVmowemFrcHNOUkcrNFk1Ri8wNkV4RWVRcEtldDJPZ0FpVkpx?=
 =?utf-8?B?bmpUNUh4T0xJUTZsb0VsNUxwYVoxZjZJNDNJR1FZOVF1bEJUdk5QcUN6T25R?=
 =?utf-8?B?aW5pbEJNSzVqaHljNXV2cFlOdmJ6eTd5NklJMVRrbGRzUVJwdXA3UHdKajhq?=
 =?utf-8?B?dGU3VXUyR3l1U3MzWXd0VFJQNUNHNUtDUUJpeSsrdTlhb25zTE9SeXZFMldR?=
 =?utf-8?B?dFhqVGlPZlhjekpFK09vNmtmenloSW0ySDJrcS9QVWFmL2s1UE1KeUhBZnJI?=
 =?utf-8?B?aVlhbW16MXpac0l0NHNxalgvVGhncDFSeE9pOGgwblh0RWlTV2hFR1pvVkJR?=
 =?utf-8?B?YkZ5aGNSb2UyUEJuWW9QYkdoZnZWREpFRSsxYldIN1ZwNWo5YWl6S08xNXFP?=
 =?utf-8?B?ZUtkQVQzUEVZZGd0WWxROURJZERDUk9WZlF1cEV0aFllQXdNeVhxSW9kVHpZ?=
 =?utf-8?B?Sy9nRUFEbWFXWFhWVVErcVN6TlVtdDJZV3p6d005K0xQRFJhS0V3NzJIMFlI?=
 =?utf-8?B?NmNZNWhEYTRHMEFQTjBTbnRITm8rSEpRaFhGbUNaM29HQmhzNzlENHVEaDVp?=
 =?utf-8?B?VjJMbFA1azFTTHN2REhETHkrZEt1UDNxT0kzNElUaWorc29Qc3lnb1ZqdXdu?=
 =?utf-8?B?by9ibUMvaXEyeFVJMmhidkF0ZmhSeXNSQUJ0a2FDVmFXeTgvcVJTdE1VS3dN?=
 =?utf-8?B?N2hRY3B6ZkJSeENVZHh3c3lvTXJXQkZxdTlNd3ByNWUxOVduVTh4MUdYb0I5?=
 =?utf-8?B?OGlUWjN4czJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eU4rV3BHMEIrNGtwc3dNVGdkdTFjR2lPdlVVTWwwM00vMEhzMlVYZ1F1RVp0?=
 =?utf-8?B?a1U1S2toRHhPeDRLZGdNTlZORHB6RkJtVldrRkRaT1JmQjYya20vVVljV2hE?=
 =?utf-8?B?NGdkcGl2LzdGWkxaM0RWQmh1RmxYWm5OVG81NmpkWHhrNjV4REt4dUhNdi9x?=
 =?utf-8?B?NEhsNkFlRzk0M29SMktjcUFaaUlabERQQlprUnorSm9VNzhiUVViNTFYdHoz?=
 =?utf-8?B?N0Y1em9HRFVVajJnRDZpaDU5a3JjVDV5cXBKaUdhRDZWQStNc1hJb1VrZkp0?=
 =?utf-8?B?MEMxMmwxNXlxZUtIdnM5MHBLb3RjUkNNZEMwVWxVdEhGN1BiQkh2YzNodTB6?=
 =?utf-8?B?M2g3Zko0ZkxEUm1rbmZPQmEwazdPdktwWGV6Sm1ENyt5UkRTVzRkMVFjODl0?=
 =?utf-8?B?ZVRmWVF5NWhJT2JMMFhYaUVMdnkrMGdKUVA0T29jcVYrUFNId0xlYmRhTGlI?=
 =?utf-8?B?eFcrcC9UNG0zTE9GZEtHcS8vU3d4aXRuOFBabDNlQXdvTExKWTJmcmsvTkEv?=
 =?utf-8?B?dEFBOWtoR3diV0ExTWZpbDREd1Rtcm11aFRGa0dCeXlHNWFUKzA3ZCtSMEw3?=
 =?utf-8?B?STlwcEZWQUQySFhzd01CWkx2aU5MQnkzVm1kUkpHV0s4QmpWaWkzVkVHTHQy?=
 =?utf-8?B?M0FkbGVCREQ0Z1FlanQ4NjdQdHVYbnQ1TW12ZjZ2MmRGWUVSbjVXQmUzeERX?=
 =?utf-8?B?VnNIMEVwRnJ4VXVmcXdpN1Vxdnk3bzE4SVk5U2JzbUJiS0o3WHhvcXpUU0hj?=
 =?utf-8?B?MlExUXBGL0lhNkRvY3E5TExWYlg4ZFpqM2hrZ1B3dHlCc1BHZmlEZGxlbkQ1?=
 =?utf-8?B?bEJHdEZqQnNKSTQ1ZHhjUmZjMXBubXRxbUxqaFdDenVneTB5VTBwT2haV0Fj?=
 =?utf-8?B?SmZPd1NqUzlqbkRKOFVRZytZRVk1QlJYSTNNVUVXU0x2RC9OeTB6dVNKdEZH?=
 =?utf-8?B?TDhWZEtFTG9uVmp4czRPM1JRTkt3a21kY1RzQVBIdWFQcUhNUTNhUlErYUp6?=
 =?utf-8?B?R2cvSEE5dzdXV2tlcUNKaWlKTFN5Z200QU1rcVIyQmM3dUNUOXJESXRiODFW?=
 =?utf-8?B?Wk5QMFRYN3NtMk1lNS9kbDlUVFlzVmpkTGdMeUVKa28zZ1M1Y3AvakJ6cWow?=
 =?utf-8?B?dkdXR3V0V0Q4ZlZObTB2ZE0zSTF4YXZ3eTdaTHhsNEZOSnYvaWdDYThrRWRy?=
 =?utf-8?B?QWxVOVVhNkM1STZiSjEzZ3RoRWllNW4wZ3dYMS90L29UenpXMGNsR1NtVTlP?=
 =?utf-8?B?SitoYW5Ia0lCU0ZYRzlSNkozSFFMbnZPOXptN2xESktndGFBam1oejZReGpC?=
 =?utf-8?B?Q0xJK1F6eTIwNERqODFqd3VtK29HU2FXTTlOMHRrR1NwOW9ianhVaDBza2Jk?=
 =?utf-8?B?VDRwM1QvUWFzZEVmTHhHUEtEd1puWGthWkJnYTFPdEpsaHVPYkk0TDBiNWtI?=
 =?utf-8?B?eXZSTDVSUmRRdi8rZ0dzTFBMZWRBUE5vMk9RQ3hUOElOMnF6VHBjVFRVZHVo?=
 =?utf-8?B?dkY0VGpXU3JhSUxsRWZIRGZ4eUZYdU8zTVdHRnhWNjRac0FpTE9qSmpBUE5E?=
 =?utf-8?B?QWRhVTVoWXEzQzRoRDFwanVtSFprUkR5eUVlRXU1NWJwT0FQbUpzcUlTMnNF?=
 =?utf-8?B?eVhhaW9GNVRLSm4wQ3N4QmxBS08wMmsrLzJhQkQ5MjlReVJ5Vm5PRlZQWDY4?=
 =?utf-8?B?YmUzMVl1dXFabU5GY0NiVnNibkg4V0YxVnl2MFlNT1dtZlhIYlgxTlFuV2Vn?=
 =?utf-8?B?WE5CcStacVJ5VnlxcElDM09hUE5tTnVhdzRzdFAyWGRxMlNGWmMyTUl2UzBR?=
 =?utf-8?B?OTNJQTJwNFhXRDJLWkIrYmtPWkdhNGZhZXFaOUp6aVh3dmJYZVM3VnM2YjNs?=
 =?utf-8?B?eFBxblRtZURLNEQ5eUdqN1FSU0k1clRWWENuVUpiUzZ2VW1zc1lGWTluYS9o?=
 =?utf-8?B?cDc3VWthZExIOFFhN0JsYWVnNlcrK28vRU5pU2h5WFBLdS9CTnR3Sy9PY3JG?=
 =?utf-8?B?cTFIcW4rK1U2UG0xZ1Z4VFNJRm0wMDdzUjBtT2lMM2xJZ1lZbWsxbktDUnY0?=
 =?utf-8?B?TWgvcU1VS2xaZ2JyR0NyMHVFM0VEUGNyRnd5WEJDQzVnNTJwbHp5UEU4emg3?=
 =?utf-8?B?K1hXNklmQmZ2cFBQL1BnbWJORFhpU0lMelJ3cnlNNVhxTndJV3IzWHJSZkVI?=
 =?utf-8?Q?pHwWIbcf0MB02SfYbGRLV5E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07D42F41FAF0E245AA857F724D31A8B7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa575c9f-8df8-41cc-61ac-08ddeadf6ab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 11:45:44.5209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19s8PATiBTnyGp+Aj03ecLaNq9Z1Gl1EyJkWdEVVpQp+gNAAbZ2x86CD/fFD83OjAo5gYY6wUGn5L6Ej63NV940Wtn0ZFdeDSYuFBjftyW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7752

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KT24gMDMuMDku
MjUgMTQ6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTGVvbmlkLA0KPiANCj4gT24gMDIv
MDkvMjAyNSAyMTo1NSwgTGVvbmlkIEtvbWFyaWFuc2t5aSB3cm90ZToNCj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICggcmFuayA9PSBOVUxMICkgZ290byB3cml0ZV9pZ25vcmU7DQo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2Z2ljX2xvY2tfcmFuayh2LCByYW5rLCBmbGFn
cyk7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ciA9IHJhbmstPmllbmFibGU7DQo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cmVnX3JlZzMyX3NldGJpdHMoJnJhbmstPmll
bmFibGUsIHIsIGluZm8pOw0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB2Z2ljX2VuYWJsZV9pcnFz
KHYsIChyYW5rLT5pZW5hYmxlKSAmICh+dHIpLCByYW5rLT5pbmRleCk7DQo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmICggcmVnID49IEdJQ0RfSVNFTkFCTEVSbkUgKQ0KPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZnaWNfZW5hYmxlX2lycXModiwgKHJhbmstPmllbmFibGUpICYgKH50
ciksDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEVYVF9SQU5LX0lEWDJOVU0ocmFuay0+aW5kZXgpKTsNCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgZWxzZQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZnaWNfZW5h
YmxlX2lycXModiwgKHJhbmstPmllbmFibGUpICYgKH50ciksIHJhbmstIA0KPj4+Pj4+ID5pbmRl
eCk7DQo+Pj4+Pg0KPj4+Pj4gLi4uIHlvdSBub3cgaGF2ZSB0byBrZWVwIGJvdGggImlmIiB0aGUg
c2FtZS4gVW5sZXNzIHdlIGNhbiBoYXZlIGENCj4+Pj4+IHZlcnNpb24gdG8gYXZvaWQgImlmcyIg
ZXZlcnl3aGVyZSAobWF5YmUgdXNpbmcgbWFjcm9zKSwgSSB3b3VsZCByYXRoZXINCj4+Pj4+IGNy
ZWF0ZSBhIHNlcGFyYXRlIGZ1bmNpdG9uIHRvIGhhbmRsZSBlU1BJcy4NCj4+Pj4+DQo+Pj4+PiBD
aGVlcnMsDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBUaGUgbWFpbiBpZGVhIG9mIFY1IG9mIHRoaXMgcGF0
Y2ggaXMgdG8gY29uc29saWRhdGUgc2ltaWxhciBjb2RlIGFuZA0KPj4+PiBrZWVwIHRoZSBwYWly
cyBvZiByZWd1bGFyIFNQSXMgYW5kIHRoZWlyIGVTUEkgY291bnRlcnBhcnRzIGluIHRoZSBzYW1l
DQo+Pj4+IHBsYWNlIHRvIHNpbXBsaWZ5IGFueSBmdXR1cmUgbW9kaWZpY2F0aW9ucyBvZiB0aGVz
ZSBwYWlycy4gSWYNCj4+Pj4gZVNQSS1zcGVjaWZpYyByZWdpc3RlcnMgYXJlIG1vdmVkIHRvIGEg
c2VwYXJhdGUgZnVuY3Rpb24sIGl0IHdvdWxkDQo+Pj4+IHJlc3VsdCBpbiBjb2RlIGR1cGxpY2F0
aW9uLiBBZGRpdGlvbmFsbHksIEkgdGhpbmsgaXQgd291bGQgYmUgZWFzaWVyIHRvDQo+Pj4+IG1p
c3MgdXBkYXRpbmcgdGhlIGNvZGUgZm9yIG9uZSByZWdpc3RlciBvZiB0aGUgU1BJL2VTUEkgcGFp
ciB3aGlsZQ0KPj4+PiBtb2RpZnlpbmcgdGhlIGNvZGUgZm9yIHRoZSBvdGhlci4uDQo+Pj4NCj4+
PiBJIHVuZGVyc3RhbmQgeW91ciByZWFzb25pbmcsIGJ1dCBpbiB0aGlzIGNhc2UsIHdlIG5lZWQg
dG8gdHJ5IHRvIGtlZXANCj4+PiB0aGUgY29kZSBhcyBjb21tb24gYXMgcG9zc2libGUgYW5kIHJl
ZHVjZSB0aGUgbnVtYmVyIG9mIGlmcy4gTG9va2luZyBhdA0KPj4+IHRoZSBwYXRjaCBhZ2Fpbiwg
d2Ugc2VlbSB0byBvZnRlbiB1c2UgIkVYVF9SQU5LX0lEWDJOVU0ocmFuay0+aW5kZXgpIg0KPj4+
IGFuZCB0aGlzIGlzIHdoeSB3ZSBoYXZlIHRoZSBzZWNvbmQgImlmIiwgZm9yIGluc3RhbmNlIGhl
cmUuIEkgdGhpbmsgaXQNCj4+PiB3b3VsZCBiZSBwcmVmZXJhYmxlIGlmICJpbmRleCIgc3RvcmUg
dGhlIHByb3BlciB2YWx1ZS4NCj4+Pg0KPj4NCj4+IEFjdHVhbGx5LCB0aGVyZSBhcmUgNCBzcGVj
aWZpYyBjYXNlcyB3aGVyZSBJIG5lZWQgdG8gdXNlIA0KPj4gRVhUX1JBTktfSURYMk5VTToNCj4+
IHZnaWNfZW5hYmxlX2lycXMsIHZnaWNfZGlzYWJsZV9pcnFzLCB2Z2ljX3NldF9pcnFzX3BlbmRp
bmcsIGFuZA0KPj4gdmdpY19jaGVja19pbmZsaWdodF9pcnFzX3BlbmRpbmcuIFRoZSByZWFzb24g
SSBtYWRlIHRoaXMgdHJhbnNmb3JtYXRpb24NCj4+IGlzIHRoYXQgdGhlc2UgZnVuY3Rpb25zIGFy
ZSBnZW5lcmljIGFuZCBjYWxjdWxhdGUgdGhlIHZpcnEgYmFzZWQgb24gdGhlDQo+PiByYW5rIG51
bWJlciwgZS5nLiB2Z2ljX2NoZWNrX2luZmxpZ2h0X2lycXNfcGVuZGluZygpOg0KPj4NCj4+IHVu
c2lnbmVkIGludCBpcnEgPSBpICsgMzIgKiByYW5rOw0KPj4NCj4+IEFzIGEgcmVzdWx0LCBJIGRl
Y2lkZWQgdG8gaW50cm9kdWNlIEVYVF9SQU5LX0lEWDJOVU0gd2l0aCBpZnMgcmF0aGVyDQo+PiB0
aGFuIG1vZGlmeWluZyB2ZXJ5IGdlbmVyaWMgY29kZSB0aGF0IHdvdWxkIGFsc28gYWZmZWN0IHZH
SUN2MiBhbmQgYmUNCj4+IG1vcmUgZGlmZmljdWx0IHRvIHVwc3RyZWFtLi4NCj4gDQo+IEkgd2Fz
bid0IGFza2luZyB0byBtb2RpZnkgdGhlIGNvZGUgaW4gdmdpY19lbmFibGVfaXJxcygpICYgY28u
IEJ1dCANCj4gcmF0aGVyIGhvdyBpdCBpcyBjYWxsZWQuDQo+IA0KPiBSaWdodCBub3csIHJhbmst
PmluZGV4IGZvciBlU1BJLCB3aWxsIGJlIHN0YXJ0aW5nIGF0IDAuIEJ1dCB3aGF0IGlmIA0KPiBp
bnN0ZWFkLCBpdCBpcyBzdGFydGluZyBhdCAxMjggKGkuZS4gRVhUX1JBTktfTUlOKT8NCj4gDQo+
IEVmZmVjdGl2ZWx5LCByYXRoZXIgdGhhbiBpbml0aWFsaXphdGluZyB0aGUgZVNQSSByYW5rcyB3
aXRoOg0KPiANCj4gIMKgwqDCoCBmb3IgKCBpID0gMDsgaSA8IERPTUFJTl9OUl9FWFRfUkFOS1Mo
ZCk7IGkrKyApDQo+ICDCoMKgwqDCoMKgwqDCoCB2Z2ljX3JhbmtfaW5pdCgmZC0+YXJjaC52Z2lj
LmV4dF9zaGFyZWRfaXJxc1tpXSwgaSwgMCk7DQo+IA0KPiBZb3UgY291bGQgZG86DQo+IA0KPiAg
wqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgRE9NQUlOX05SX0VYVF9SQU5LUyhkKTsgaSsrICkNCj4g
IMKgwqDCoMKgwqDCoMKgIHZnaWNfcmFua19pbml0KCZkLT5hcmNoLnZnaWMuZXh0X3NoYXJlZF9p
cnFzW2ldLCANCj4gRVhUX1JBTktfSURYMk5VTShpKSwgMCk7DQo+IA0KPiBUaGlzIHdvdWxkIHJl
bW92ZSBhbGwgdGhlICJpZiJzIGFuZCB0aGUgIkVYVF9SQU5LX0lEWDJOVU0ocmFuay0+aW5kZXgp
Ii4NCj4gDQo+IENoZWVycywNCj4gDQoNClllc3RlcmRheSBldmVuaW5nLCBJIHJlYWxpemVkIHRo
ZSBzYW1lIDopIEkgZml4ZWQgdGhpcyB3aGlsZSBwcmVwYXJpbmcgDQp0aGUgbmV4dCB2ZXJzaW9u
IG9mIHRoZSBwYXRjaCBzZXJpZXMuIEFsc28sIEkgZm91bmQgYSB3YXkgdG8gcmVtb3ZlIG1hbnkg
DQppZnMgaW4gdGhpcyBwYXRjaCBieSBpbnRyb2R1Y2luZyBqdXN0IDIgaGVscGVyIGZ1bmN0aW9u
cy4gSSB3aWxsIHB1c2ggdjYgDQpzb29uIHdpdGggdGhlc2UgdXBkYXRlcy4gSSBob3BlIGl0IHdp
bGwgbG9vayBtdWNoIGJldHRlci4NCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkDQo=

