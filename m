Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B4CAEA1BA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026614.1401795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo6H-0008GW-M8; Thu, 26 Jun 2025 15:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026614.1401795; Thu, 26 Jun 2025 15:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo6H-0008DN-Iv; Thu, 26 Jun 2025 15:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1026614;
 Thu, 26 Jun 2025 15:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TH9p=ZJ=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uUo6G-0008DF-5g
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:01:16 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 669b0b41-529e-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:01:13 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR03MB9914.eurprd03.prod.outlook.com (2603:10a6:800:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 15:01:09 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 15:01:09 +0000
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
X-Inumbo-ID: 669b0b41-529e-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVuyXXAivdRnvtQ+NrxcvwhhqdFxlbr1B2Gq0Q7wbhpIlbMl98N3PAf42GZQeAHUUXYCuFwUEfaYZSJB26hN1PiSp4GwJqb8WW9+eSvZltwj+9u8vf0/QMJErmVy6s651fUQxfoVcdS9fBFrkLykUv7hugvLPNUL2GiDJ/5+OeVNh07i8b4isHZjA3w4q/NO2hzkURMw5zc3jMRac3fhpzFQmaM33qR9xqQwZc8dktfkbg6dpMUheb98PbDJiPZ+6oqdvZqU5CsslZmdbqiPHrrmuTQcsrYRl0xmCgGRW8NQ8b0mLDPypKvvaQLB9FWe1vxyMQyJ5E9xV5S2pj1orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw5VFipeQe76nGX70jT6k3y+mNf6TPWpK1jLYyycsDI=;
 b=RVi1a3ZmSGjIWTfkU5P9agMSIhG8XDYE3aO8F+IwJ/hA2IxzyvPaDUJTyLs6D/5o+2rFYdB2PCSp3dJIcvuHsqMZqi239vS8lAKU9EOXX8ittr3U039fHzZMKMMOGdU5FnAojnDph4IODg9mQivNCqytGC+oviTufBPshZK2HST/4rYqA2rkkQfQDMkfZu/v5VPT10ITdSM6+oThw0Pw36eWpHKmGuDOwCcuwomb7YtZvngjs6jbH1orkeGENtKLUlc9hcXA1eGBTPQNO5RTrUzqydGVNelge31+UpqodZOPMDWnAERWsy6DmBzqmKm8cSojq5h5kv9RMSLT4kdgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw5VFipeQe76nGX70jT6k3y+mNf6TPWpK1jLYyycsDI=;
 b=uEr0D/Ghs5mSAz3Tqgtv4SJf5/Lw1AJrd2rxByjmpSHVoIgdx44moPW4lMtuIj3/lTUKetUJFCpucksZC09liKRsm20UbYupoS6BTUTD3G2fZlg/+Yhl52rsCZ/Hrq23HUAWEv4r3/YBy/EJ2VTdFW+vAjc9dx+6T1BprLsytH7s0DOBqAO4SMyKI+HeCPZRkFcHjQytpL27dO21zfQZXk8mjOwrnWdhvglP5whHyimadd7Ht+EV/6L17Wnvmb6YA3Z/OSIo6CGfdMLgcoshK2S3hkx7Klrg/5krqpjijnTaPgQ4UW2sMWscRLOueLt2ozSA5aTsrvH1afk5KdVQdQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index:
 AQHbyNXPDXt2FT3RV02cltfdm/Dd7rPdzmiAgCG+LgCACKrsAIACoXoAgAWykoCAA/lGgIAAq3gAgAB0qoCAABoigIAABYiA
Date: Thu, 26 Jun 2025 15:01:09 +0000
Message-ID: <1c019e95-1b62-4c19-9a5c-bfe541dd5813@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <1e116116-ddf7-4640-9809-2502203abe46@suse.com>
 <3e190e60-74a4-4565-acae-3b8602a4c46e@epam.com>
 <8bb4e188-eb3b-4ee3-88cc-93c826b04ef8@suse.com>
 <0cb693b6-c22c-41e2-b332-7b7e4134d0df@epam.com>
 <d056b589-3327-48c7-a918-5d2290fe7afd@suse.com>
In-Reply-To: <d056b589-3327-48c7-a918-5d2290fe7afd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR03MB9914:EE_
x-ms-office365-filtering-correlation-id: 8774332d-0992-41d3-aa46-08ddb4c248ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?LzlKNEo4enJOVURGQ3RZS0l4ZnJRcElzNzNHY2VaWXkrZUZ2dW9OSWZERGRz?=
 =?utf-8?B?UWl4dDMrTUdYQUhPaDBPQ3A4L3hoRVBFMG5ENDRtSDdDMThYbjZsQ2FoYU1k?=
 =?utf-8?B?QXZvZ2J3Q2VCeGVXdGxKaDc3cGZEczcrUGcrdnZ5ZDF3UzF3ZHh3WWNTS2FI?=
 =?utf-8?B?OXdDdlFWZUpUNzd6anc5a3BTL3F6VlZaTElpQ1g4RDRXeTJsdGdSRDcyZkRJ?=
 =?utf-8?B?WGNnazdkbEFmT2I2ZjBwWWtDYUp1Mk15RHhJSzhkUkhuOXNmZWUySDhGWDBX?=
 =?utf-8?B?N3Y2NDVnWEtkWU9aRkNORVcyYXgxd2VJaW10cVlMeUdSMi9La21wbnNidmtX?=
 =?utf-8?B?N3pHOGtKNGl1UjdYTVFsRTJZVjVGeEo1b1MxZGpSdnNlV0x2R0lkcWVNcFZQ?=
 =?utf-8?B?a3FpNitaeDM4VTZZZzlsS2ZNb2VDVGQ3UWVrcTQ5UFZEL1BTNlJBWUN2UVdK?=
 =?utf-8?B?WEluNGFMMS85akFNWWdmOVdaaDJkY1dCTGxqZWJuRlVTUllmZ1lYT0pTNnd2?=
 =?utf-8?B?bDJXSU5YOHh0bmVGZFZ4TmpEU2F2b01TTnlJL3dsNFZ1WUtFZjVEUHpNd3pt?=
 =?utf-8?B?QzBqSUxOUktMRWJ0ckRnZGVaYjZSekdoc09pRFA4bDdITWFHWDhSanBuNDdz?=
 =?utf-8?B?NlkzTlVWQmZlSHBOV1c2cFJqdk94Q1ExUUdSY2lXZnNmbUg4b1NqVEh4Vm5L?=
 =?utf-8?B?cGs4RjBHWnNIdUFwYWVLQ2k3ZzFwTk1pZUVhaVgxSis0dXNTblJLOTQ5REU0?=
 =?utf-8?B?V01HTzdKN2NqcnZYQm1iL1cxY25BbHgvaEpwdnRWa0MxRktXalBDa01oOUd6?=
 =?utf-8?B?YythajRMeWx3QW5MN1BzQWUyMlh2U25iOE9LZWxKTDhiQWRabW0reWJZWDhR?=
 =?utf-8?B?bG85SDVLdFJqQkZQNHBseGpFZm40cWlLY3BhcUJSczFVVk1zMkcwcnBtemJR?=
 =?utf-8?B?MjVaR3BKQzNZc0FNM3BzcEd4ODVKcE5hdHJ4Nm4yMkRtSzViamk3K01LMmcz?=
 =?utf-8?B?TFhVYlh3T0p2SWs0eFNoYUJxVSs1UHMrVUdCOFAzY25STGYyZDZtTFVLTXB4?=
 =?utf-8?B?Y2R3RVlWUFhlNnZ1clJkUXlzL1Qzek5JTlJPQU1oSFR4OXUxS1pqZVpBU05O?=
 =?utf-8?B?VnRZOFB4WGExb0huWVpmODR0VEpNYW4xYUg5a1VNTEtweGR1SHBTeGtMVFRk?=
 =?utf-8?B?bkZMT0VEVDJTSXBVRE5vemxlR2l5RDR4c2hHRk5VeTcxdWhHVnNkdUtwa1hE?=
 =?utf-8?B?RTJTNW04MVZPZjhZRG5xTXdtOWhIV0NnSVM2cWwwRjJPUEN2MTRPUXJEOXNN?=
 =?utf-8?B?Y1Fxd2lEYVI0eitTT0RzZlo2N0t5YzI5U05BVjhxZzIyWTRHY2pybUR0N3RI?=
 =?utf-8?B?ajZUVE9jZUJRSjVKYnFnTEFDWFM1U0RJQjFJbkdqSk1wcmVSckUvS0xhaXFX?=
 =?utf-8?B?UjRVZkpSblFUelZkUk5adnNFRHZjUnFpa2kzaDYzS1RyTWhsbzc1djVneFdz?=
 =?utf-8?B?TFJra2EvQVp6c1c5Ny8vVThKOG1sZkwyc2J0R29NVGt1T2lJZEdEZ3NpYytX?=
 =?utf-8?B?cWpyaWtMZitPZ0ZQL3hMZnltREE1WkZycUdmUGRaUGhyUGlmdG9mbWc4VjVT?=
 =?utf-8?B?Y3Z6MEp6bDl6RkhqSUMzWUhJQWtvYUFuRU5KZzZwbHQ4OG5GQ0hwajUxVnhL?=
 =?utf-8?B?Z1Z1TE00dTExRjlMSXg4dlg1Q3IrL2EveWMvd29GV1JudVZnM1lPTXRvY1hN?=
 =?utf-8?B?am9zc29oMmV2ZURROWMzTVNrYVlQYW4wYmREay91YStSUEVYVUpjOStXbEUz?=
 =?utf-8?B?azFYbEFhS284NzNxRjg2dnZMT3QyVnFaVDIxVmJySEQ1Z0E2Y1B0UjZJcnRa?=
 =?utf-8?B?RjVTV3cyaEZoMmZCN2RZUWtGdWp2SEt6K1MxaGhucEVMZGNoR0lQRERvR01a?=
 =?utf-8?Q?GAYAwvubRhs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnRTTjIvaXg4QjBjVlNhUDhEZ0tHdTNxYWdMWjlNWTVKV1oyVzJRbmhLcldt?=
 =?utf-8?B?NHFTUyttSmFJWkFSOHViWmp1empFWGsvOElVdHFRMytIUktKZUE2dFNSRzBG?=
 =?utf-8?B?TyttYTlLTXd6L0pWZDdBV2FJWkRpVFZlM2c3U2duVEgxSWh0b1RkdjdjWEs1?=
 =?utf-8?B?a2lMNXdHVS9JL0NzQ0RBTnFRU3JXMWhYNXlOK1I4SmtBLzdzaEJuMWFjUmxS?=
 =?utf-8?B?V1dnODNJUWprMHIvRlRqaUQyWittMkcyRFZYS1VTK2pxd2FObGUyMVBydWRX?=
 =?utf-8?B?YXJtU0hja09QeXJTOHRZWkU2UGJrSDZUSytaZEZDbFpoNkdlN1MwSFJaZXFG?=
 =?utf-8?B?Q0d3cENJUVNhV1k5UExZNlpsd0pyZXoydERDRzJpbUYwNys3MlBFVjZEUW1F?=
 =?utf-8?B?Q1kyUFMwVnZnaWlZQ1ltRVo3MHZ1b203NUkrUTcvbTNzaGtLNHFhNUNFZXdY?=
 =?utf-8?B?U1J5N2pCY0p5b1ZwUFhYdSsxQzRPQnZRVGozY1FIdDhHUlJjbkhqa0ZpZjhh?=
 =?utf-8?B?aXZGOXJRUkRFVG43YVMyVUJjeXROSUkrSEFiQ1kvdWU4Y0ppZWhZTFVkYUVy?=
 =?utf-8?B?TnJCaUhxR1BWWVVwbkxtOXRRZjVNZVFiVjk3aVY4QjdvR0NIM0ZHSVF6U2FY?=
 =?utf-8?B?N1FyUnU0Wm9CZ21rV3BrM28yVVZnd2Q0WUhOQkVRdWFiOWZVV05ycDdaUVl5?=
 =?utf-8?B?VGFiQ3ZlS1NwNFBFWXVJYUZRZ0NyWmFjelQrV2JjSi9HVFNDbVJtZWZmWldr?=
 =?utf-8?B?dGVPWXJqR3NHMW9vS3lmUnA2NzVraDdOaU1xcHZHZ2l3UHNIaUZGRVZjd21H?=
 =?utf-8?B?RmtLQlU2RXBMTWh5bnhsMDdpaXExeHdWNGJGVmp2UWtjUXpFaE55V2dyTy9U?=
 =?utf-8?B?Z0ZuVCs5bzg2NzFVdVFsUytkYWJxbFdnbUd2cGRUeTBnM1JCcEh5WFhMcWR2?=
 =?utf-8?B?aklQSmlBUkZkdHlqaE1FYTZaeG1iNGZFNXlEcUovd0Z5MGxxVFk1ZUR4ODRs?=
 =?utf-8?B?K3dhbVhrWXFaQThJNk9YbUZIUS9aRjMyTE14RURhc2llditoeldtbU9sOTBv?=
 =?utf-8?B?NEQrTmtXOG9nY0tDUUhYOHl2OXlxTTIvZERUZkNhRk5hTDMxL3dsOWhTMU5C?=
 =?utf-8?B?VWhLeUlIVlJhMlhiMUdVWUtDL0x6TjQ3WDVkcGF3NldTNWI5SGxRbG5BOXRF?=
 =?utf-8?B?WTVPRzJ1eFJrZE1FcUdvdFRpU0x4SzQxdjYxTXJJbVB2MlNzVjlMbmM0WGpQ?=
 =?utf-8?B?QjI1U3ptMFEvNGs1Y0Zpb2JvZmpmZmtWK0srV3QzUnh3UGFNQmxXeXJ3ZVM5?=
 =?utf-8?B?UmJKVXNDL2wyTEsvUlZkeXJlM2lrZ050SFlLTDdraVhxTjRrMDZRWWkvY0I3?=
 =?utf-8?B?RHd4QStXVk05eVNTQ2YvQ2x0VmhHb0ovSHF3cnpqMDArM3l4SnFic0E5cExO?=
 =?utf-8?B?NThhbHBXOE1JdlFEM0tuSzFwRzJLRTRvZFBoRHdlckpEdWk1eVlabDZNUnE2?=
 =?utf-8?B?ZURTcnE5VWc1WWJyVEhER2ZoQnlQRHVkVzJZN1RORkJLVlJvUHZ1MkxaWlJK?=
 =?utf-8?B?NldQOG5KQzNtWXdKRlVwVTY3UGxRaEQ2V3p0c0hHM01PVjNycyszUlp5V2ky?=
 =?utf-8?B?em5Fcmw4eDBuSDVYZDZMZktubERsOVdnTEdQdDJGQTJMQUdMT1ZWa25ZVm9E?=
 =?utf-8?B?UEtrdks5ZUpEbkpmblNPOTg0azYrUEZMVHZDa2ZFV1gwQUdxOFZ5NUJ6YitR?=
 =?utf-8?B?U0I0bkI4aU1FYUFOUlNqdEw4aDhtRThPL1pCTHVmeDhTcW5Eb1IrR0dpTHhn?=
 =?utf-8?B?dlh6OC8vSTdnZm1MRE81bW93RFY3bEdzOEhHaWlxQTRTR3lUc3c2ZUNUemV6?=
 =?utf-8?B?TGVRMEJHa2l1cEJZR2RIdWpLZFJLWDNCand6STFFZ0haTFFYbU9JT3EvdEtH?=
 =?utf-8?B?MURLRStCUUZhRkRXL21HeEphZlExNXNWLzFtbUcyVUVNUHI3emc3UjQ1YmNt?=
 =?utf-8?B?RW1OQXlxZ2NpcnJJckZLZGs5YkQxT0pnN05OcGprS2wydE52aTRnSXR4NnZY?=
 =?utf-8?B?d2gvWkNqNDZvWVdVc1JpYWYvdHBESDJEQU9IWlU0QWdXU2dMSUtLMmkzbEMw?=
 =?utf-8?B?bW1paGwvb2tuSkR4TXN3NU95S0FNWHlhazdCaThCL1pRNmp4ZzMrKys0VEh1?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7D8F034AF6A62438F52C7FCD6EB99F8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8774332d-0992-41d3-aa46-08ddb4c248ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 15:01:09.6138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3fiNyaCHqepZsNpgtqe5Su6GD0KU5GuFKDRw5mFf6uheZCDDCQc9LktaNgqr0wZH76AUtAcFLX10XokGSH7Z6NgUB9siO9DTIYWp1VvesvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9914

DQpPbiAyNi8wNi8yMDI1IDE3OjQxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjYuMDYuMjAy
NSAxNTowNywgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBPbiAyNi8wNi8yMDI1IDA5OjEw
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wNi4yMDI1IDIxOjU2LCBPbGVrc2lpIE1v
aXNpZWlldiB3cm90ZToNCj4+Pj4gT24gMjMvMDYvMjAyNSAxMDoxNSwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+PiBPbiAxOS4wNi4yMDI1IDE4OjE1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToN
Cj4+Pj4+PiBPbiAxOC8wNi8yMDI1IDAzOjA0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+
Pj4+Pj4+IE9uIFRodSwgMTIgSnVuIDIwMjUsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jIGIveGVuL2Fy
Y2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+Pj4+Pj4+Pj4+IGluZGV4IGUxNTIyZTEwZTIuLjhlZmQ1
NDFjNGYgMTAwNjQ0DQo+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2ku
Yw0KPj4+Pj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCj4+Pj4+Pj4+
Pj4gQEAgLTEyNiw2ICsxMjYsNDMgQEAgaW50IHNjaV9hc3NpZ25fZHRfZGV2aWNlKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPj4+Pj4+Pj4+PiAgICAgICAg
ICAgcmV0dXJuIDA7DQo+Pj4+Pj4+Pj4+ICAgICAgIH0NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4g
K2ludCBzY2lfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21h
aW4gKmQsDQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQo+Pj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+Pj4+ICsg
ICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXY7DQo+Pj4+Pj4+Pj4+ICsgICAgaW50IHJldCA9
IDA7DQo+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyAgICBzd2l0Y2ggKCBkb21jdGwtPmNtZCAp
DQo+Pj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4+PiArICAgIGNhc2UgWEVOX0RPTUNUTF9hc3Np
Z25fZGV2aWNlOg0KPj4+Pj4+Pj4+PiArICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+Pj4+
Pj4+PiBBcmUgeW91IHN1cmUgLUVPUE5PVFNVUFAgaXMgdGhlIHJpZ2h0IGVycm9yIGNvZGUgZm9y
IHRoZSAzIGNoZWNrcyBiZWxvdz8NCj4+Pj4+Pj4+IFRoZSAtRU9QTk9UU1VQUCBjb2RlIGlzIHVz
ZWQgYmVjYXVzZSB0aGlzIGlzIHBhcnQgb2YgYSBjaGFpbmVkIGNhbGwgYWZ0ZXINCj4+Pj4+Pj4+
IGlvbW11X2RvX2RvbWN0bCwgYXMgc3RhdGVkIGluIHhlbi9jb21tb24vZG9tY3RsLmM6ODU5LiBU
aGUNCj4+Pj4+Pj4+IFhFTl9ET01DVExfYXNzaWduX2RldmljZQ0KPj4+Pj4+Pj4gY2FsbCBpcyBl
eHBlY3RlZCB0byBoYW5kbGUgYW55IERUIGRldmljZSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRo
ZSBEVA0KPj4+Pj4+Pj4gZGV2aWNlIGlzDQo+Pj4+Pj4+PiBwcm90ZWN0ZWQgYnkgYW4gSU9NTVUg
b3IgaWYgdGhlIElPTU1VIGlzIGRpc2FibGVkLg0KPj4+Pj4+Pj4gVGhlIGZvbGxvd2luZyBjYXNl
cyBhcmUgY29uc2lkZXJlZDoNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAxLiBJT01NVSBQcm90ZWN0ZWQg
RGV2aWNlIChTdWNjZXNzKQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IElmIHRoZSBkZXZpY2UgaXMgcHJv
dGVjdGVkIGJ5IHRoZSBJT01NVSBhbmQgaW9tbXVfZG9fZG9tY3RsIHJldHVybnMgMCwNCj4+Pj4+
Pj4+IHdlIGNvbnRpbnVlDQo+Pj4+Pj4+PiBwcm9jZXNzaW5nIHRoZSBEVCBkZXZpY2UgYnkgY2Fs
bGluZyBzY2lfZG9fZG9tY3RsLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IDIuIElPTU1VIERpc2FibGVk
ICgtRU9QTk9UU1VQUCBmcm9tIGlvbW11X2RvX2RvbWN0bCkNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJ
ZiBpb21tdV9kb19kb21jdGwgcmV0dXJucyAtRU9QTk9UU1VQUCwgaW5kaWNhdGluZyB0aGF0IHRo
ZSBJT01NVSBpcw0KPj4+Pj4+Pj4gZGlzYWJsZWQsDQo+Pj4+Pj4+PiB3ZSBzdGlsbCBwcm9jZWVk
IHRvIGNhbGwgc2NpX2RvX2RvbWN0bC4NCj4+Pj4+Pj4gT0sgdGhpcyBtYWtlcyBzZW5zZS4gIEkg
dGhpbmsgaXQgaXMgT0sgdG8gaGF2ZSBhIHNwZWNpYWwgZXJyb3IgY29kZSB0bw0KPj4+Pj4+PiBz
YXkgInRoZSBJT01NVSBpcyBkaXNhYmxlZCIgYnV0IEkgZG9uJ3Qga25vdyBpZiBpdCBpcyBhIGdv
b2QgaWRlYSB0byB0cnkNCj4+Pj4+Pj4gdG8gdXNlIC1FT1BOT1RTVVBQIGZvciB0aGF0LiAtRU9Q
Tk9UU1VQUCBjb3VsZCBtZWFuIGEgaHlwZXJ2aXNvcg0KPj4+Pj4+PiBjb25maWd1cmF0aW9uIHdp
dGggZG9tY3RsIGRpc2FibGVkLCBmb3IgaW5zdGFuY2UuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEl0IG1p
Z2h0IGJlIHdpc2VyIHRvIHVzZSBhIGRpZmZlcmVudCBlcnJvciBjb2RlLiBNYXliZSBFTk9FTlQ/
DQo+Pj4+Pj4+DQo+Pj4+Pj4gSSBzZWUgdGhhdCBpbiB0aGUgZm9sbG93aW5nIGNvbW1pdDoNCj4+
Pj4+Pg0KPj4+Pj4+IDcxZTYxN2E2YjggKHVzZSBpc19pb21tdV9lbmFibGVkKCkgd2hlcmUgYXBw
cm9wcmlhdGUuLi4sIDIwMTktMDktMTcpDQo+Pj4+Pj4NCj4+Pj4+PiAtRU5PU1lTIHJldHVybiBj
b2RlIHdhcyBjaGFuZ2VkIHRvIC1FT1BOT1RTVVBQIGluIGlvbW11X2RvX2RvbWN0bC4NCj4+Pj4+
Pg0KPj4+Pj4+IEl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGlzIHdhcyBkb25lIGZyb20gdGhl
IGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4+Pj4+IFRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIG1hbnkg
dGltZXMgZWxzZXdoZXJlLiBNYW55IG9mIG91ciBFTk9TWVMgdXNlcyBhcmUNCj4+Pj4+IHNpbXBs
eSB3cm9uZy4gRU5PU1lTIGhhcyB2ZXJ5IGxpbWl0ZWQgYXBwbGljYWJpbGl0eTogVW5hdmFpbGFi
aWxpdHkgb2YgYQ0KPj4+Pj4gdG9wLWxldmVsIGh5cGVyY2FsbCAob3JpZ2luYWxseTogc3lzY2Fs
bCkuDQo+Pj4+Pg0KPj4+PiBXaGF0IGlzIHlvdXIgb3BpbmlvbiBhYm91dCBjaGFuZ2luZyBpdCB0
byAtRU5PRU5UIHRvIHNheSAidGhlIElPTU1VIGlzDQo+Pj4+IGRpc2FibGVkIiBhcyBTdGVmYW5v
IHN1Z2dlc3RlZCBpbiBbMF0/DQo+Pj4+DQo+Pj4+IFswXTogaHR0cHM6Ly9saXN0cy54ZW4ub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMDEyMzMuaHRtbA0KPj4+IFRvIG1l
LCBFTk9FTlQgaXMgY2xvc2VyIHRvIEVOT0RFViwgYW5kIGhlbmNlIG5vdCBvdmVybHkgYXBwbGlj
YWJsZSBoZXJlLg0KPj4+IElmIHlvdSB3YW50IHRvIGF2b2lkIEVPUE5PVFNVUFAgZm9yIHdoYXRl
dmVyIHJlYXNvbiwgaG93IGFib3V0IEVOWElPIG9yDQo+Pj4gRUlPPyAoRVBFUk0gbWlnaHQgYWxz
byBiZSBhbiBvcHRpb24sIGJ1dCB3ZSBhc3NpZ24gdGhhdCBhIGRpZmZlcmVudA0KPj4+IG1lYW5p
bmcgZ2VuZXJhbGx5LikNCj4+IE1heWJlIC1FTk9ERVYgaXMgYSBiZXR0ZXIgY2hvaWNlIGJlY2F1
c2UgaW9tbXVfZG9fcGNpX2RvbWN0bCBhbmQNCj4+IGlvbW11X2RvX2R0X2RvbWN0bCByZXR1cm4g
dGhpcw0KPj4NCj4+IGNvZGUgd2hlbiBzb21lIGZlYXR1cmUgaXMgbm90IHN1cHBvcnRlZC4NCj4g
V2hhdCBmZWF0dXJlIGFyZSB5b3UgdGFsa2luZyBhYm91dD8gQWxsIEkgc2VlIGluIHRoZSBmb3Jt
ZXIgaXMNCj4NCj4gICAgICAgICAgcmV0ID0gLUVOT0RFVjsNCj4gICAgICAgICAgaWYgKCBkb21j
dGwtPnUuYXNzaWduX2RldmljZS5kZXYgIT0gWEVOX0RPTUNUTF9ERVZfUENJICkNCj4gICAgICAg
ICAgICAgIGJyZWFrOw0KPg0KPiBhbmQgdGhlcmUgLUVOT0RFViBpcyBxdWl0ZSBhcHByb3ByaWF0
ZS4NCg0KSSB3YXMgdGFsa2luZyBhYm91dCB0aGUgZm9sbG93aW5nIGNvZGUgaW4gaW9tbXVfZG9f
cGNpX2RvbWN0bDoNCg0KICAgICByZXQgPSAtRU5PREVWOw0KICAgICAgICAgaWYgKCBkb21jdGwt
PnUuYXNzaWduX2RldmljZS5kZXYgIT0gWEVOX0RPTUNUTF9ERVZfUENJICkNCiAgICAgICAgICAg
ICBicmVhazsNCg0KU29ycnksIEkgbWlzaW50ZXJwcmV0ZWQgdGhpcy4NCg0KPj4gSSB0aGluayAt
RUlPIG9yIC1FTlhJTyBhcmVu4oCZdCBzdWl0YWJsZSBoZXJlIHNpbmNlIHdl4oCZcmUgcGxhbm5p
bmcgdG8gc2VuZA0KPj4gdGhpcyBtZXNzYWdlIHdoZW4gdGhlIElPTU1VIGlzIGRpc2FibGVkLg0K
PiBXZWxsLCBJIGRvbid0IGxpa2UgdGhvc2UgdHdvIHZlcnkgbXVjaCBlaXRoZXIgZm9yIHRoZSB1
c2UgaGVyZSwgYnV0IEkgc3RpbGwNCj4gdmlldyB0aGVtIGFzIGJldHRlciB0aGFuIEVOT0VOVC4N
Cj4NCkkgdGhpbmsgSSBjb3VsZCB1c2UgLUVOWElPIHNpbmNlIGl0IGhhcyB0aGUgZm9sbG93aW5n
IGNvbW1lbnQ6DQogICAgIC8qIE5vIHN1Y2ggZGV2aWNlIG9yIGFkZHJlc3MgKi8NCkl0IHNlZW1z
IHRvIGJlIHN1aXRhYmxlIGZvciBvdXIgY2FzZS4NCg0KV0JSLA0KDQpPbGVrc2lpLg0K

