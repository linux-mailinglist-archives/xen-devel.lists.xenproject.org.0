Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35524A4599B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 10:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896268.1304951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnDRc-00072I-1w; Wed, 26 Feb 2025 09:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896268.1304951; Wed, 26 Feb 2025 09:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnDRb-00070L-V7; Wed, 26 Feb 2025 09:11:07 +0000
Received: by outflank-mailman (input) for mailman id 896268;
 Wed, 26 Feb 2025 09:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NM2=VR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tnDRa-00070F-II
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 09:11:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 997f9b5c-f421-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 10:11:03 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 09:10:59 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 09:10:58 +0000
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
X-Inumbo-ID: 997f9b5c-f421-11ef-9897-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTRhq9ENUK5QE6dSJzAADYCGNJOD+AaxlEKFfinex9ePgz8CXG0JxsDnOpgSAEpF0u+Ys8clVb6pProCpXuVFavI+Q8/oaQLqiBjvzD8tJwTdq0mV4tmF8AeiWhH2HYHfpYA+5OiU8PfHRL4Gx3jo5fLQPyhHnAnsyNmQYz5pU3FPKIod3ijyAqZkRZNMuMgxSCzuukSHpU2Dw5/NsqWiMMDR3XUZx91kmIZQl4Jsfk9QfNQ5oOf5Mk0n/sqNfRyiE7qd1C/yajga0/B8Fl7nouKr1aZyCg+7N1kkaNqyHKejWl8QkoH3DgZg4m4tHxoYVQXw15oIAZhURfhkQUVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aEJfyQLKAKU1WJtNiqE2VDMEQ4xDiI7Z15KpY16Bbo=;
 b=WQuVfcJxbziyer+SV4t3e7yl9Icf3RgxRCdUInQsw8Z9yunp14x0zJlOrI2XaSlkrd72lgf2LaJlUfgNIgmgrqsPBHqPRxCV0XNI/p8dp/JFttQ9nGVbmfhIm5n+MjPtjqemuigondMmATsFXsWJfHH2gPpEpfmpcNFO/G4N76C9dMBftnVWZo4XLFjotfuTEQxiwwE6xLcU0pETnyVATs0RuxjIWQg4gqZhNelu5CGshbrxEc8gRsb1WaBKNWGwfA13MtqTE76eCGyhJWPbKeHxYvORop+b+piMW/CQDM4ASUXMdjHqWUWJYQ2odUaAiKgf0XiuRR5j/GGvciXgGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aEJfyQLKAKU1WJtNiqE2VDMEQ4xDiI7Z15KpY16Bbo=;
 b=mRV7i8w97iyR9Bs7vbGCZMv1tDowcf5lmnFcrYFTz0LqubM4DZYZs4zkJCKfsuMcizL1bXNcCgy+XJptu1FDMkvNzuDEFAUqruwv6FWopX3jCuqgHykm3Cul/o2slJMrpqVOh8QcpQSlRZGnZMOP7Ae/9GVO72uimtHE12YbNf0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"committers@xenproject.org" <committers@xenproject.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
Thread-Topic: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
Thread-Index: AQHbhumTl2am2VijCUqahyE9g+0fwbNZROSAgACPWYA=
Date: Wed, 26 Feb 2025 09:10:58 +0000
Message-ID:
 <BL1PR12MB58496C63F977A8D768D6EB08E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
 <Z77SQ1MRKXzVqJ_z@macbook.local>
In-Reply-To: <Z77SQ1MRKXzVqJ_z@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8489.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ0PR12MB5674:EE_
x-ms-office365-filtering-correlation-id: e42f6ec1-3175-411f-d44b-08dd56457bfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Hr4vosST+zMz0U4Fa5D2iwclgmyJnsXHJSOlU+VBKDHR2pFItX4XGUmkuq?=
 =?iso-8859-1?Q?NJfEoODRa3OCVIQyqk84prC+4Tfoy5aqJCZe4zAtWZCq60FEAxhVIjHQ0f?=
 =?iso-8859-1?Q?COynDaUgCt5vdLkY23tWJLOvonCiMS96z9dZKE89vIB1rX2dcfwDasYJSQ?=
 =?iso-8859-1?Q?WiC+7nv627ADJo05DyhgXNtLPob/3oYBx/zlQobWiWhlaBHd8ydW2qnykX?=
 =?iso-8859-1?Q?7n573spM+99Pxq4OzLhHw4Ri60mgljwaiBWd89LYUoc1gc15Unlaa9MK8o?=
 =?iso-8859-1?Q?a1V4H4vNbwH5wWTPdg++Lzer/a9vjvcn9mTw+4NwB+FApx/VXlmlXXcWCR?=
 =?iso-8859-1?Q?kHTzp7tMFdAGwoUeY8EZXT9eCmffnG+Ck7ljxCFVxyE3jeor3HBjPf1vNO?=
 =?iso-8859-1?Q?kmHlmJzKpqEtd1h4jqBa6oE4ixyYI6xPBzaDnOym7nu0z/T47EHjYet6zX?=
 =?iso-8859-1?Q?8C7R/54ybmtGGzRrVZ+gXErwhHRt4UNVak3EBtyFs4h9g52QYA1DelbCDO?=
 =?iso-8859-1?Q?wDoYHZPqirFCYL3WDts9zo9+lCveVv3WhJCkDoS/W2qdeCwZPFla5tkmdm?=
 =?iso-8859-1?Q?m/+dmHjiCYajgEItLfBmaBurfiDGpnLrzaRg5UoF2jGb5Z9YeHEV1H9ULR?=
 =?iso-8859-1?Q?tNEkXbuWWTJb5kuSx0n/q7JZi0chp6DydaRHt4b7Evd5iAMhpOzGmq6CHv?=
 =?iso-8859-1?Q?oKot8ipEKiJqEyGMy9ArCrdKsTtcercU2c4FFzwuhFBLBVlxv9aNHM0Emh?=
 =?iso-8859-1?Q?sUOU8rgoMW8lISF/5E6E84clpP0nYrFF2Hr6EItL4RMjlWLOpmOfPPSRYQ?=
 =?iso-8859-1?Q?L/+7c0NBQ/0ROHZioBHaC0sHt7NMSQzg+Vbbpmv/mzlsAdHYfWWs3q3O4I?=
 =?iso-8859-1?Q?ff2bD0bOqHMgo8JgiST92cllyUkQquAHEGd443wmpYZVJIEk9u4fMUZeqj?=
 =?iso-8859-1?Q?XZfcbxpd3DLNMNfa5O0HKCbaBtGcmf8JOMRrh7pWEoB/HIYDSUJjF3mdbS?=
 =?iso-8859-1?Q?chwdZGUhcLOUfvaycWp5UwgJ9XIxoOy7sp/LBM26jKatpuzNm5Qyzfb9rh?=
 =?iso-8859-1?Q?af49I7oJ8m+siRRNldVtoikBmxjIW4MGxXGAGsNymOjLzfPoRdcEkc9uKd?=
 =?iso-8859-1?Q?gSzsMflpxPybxuj5CncxkygqAo5oahPn+s3+a08MQCOcADkKKnEettqZda?=
 =?iso-8859-1?Q?PmBiJd8b6nfER6xKHyB0PCCceeIJUeB6UUE++BNLULgaPTsfGTFnYAzSpO?=
 =?iso-8859-1?Q?33fyjVdq9t0U9dE76agapId3KmQH9hatP5T6OV0S5Iv+n57uxUh+37bm/y?=
 =?iso-8859-1?Q?0WYT6RvxoAUjbKMFaoWUH3T5CUKd/KcPNtD21Gr8iKCF/U3H/Svt5vsYjt?=
 =?iso-8859-1?Q?Om8xCh6vFG806mdaEH9XlxTsL8C46t5bhFgZtp9fj+DCJQZ/e4Uo0Llr+q?=
 =?iso-8859-1?Q?+X8d048FMEFavrSW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IyxCdYwV5TgHGNJEuNXRcxS5vH2XAzGXlMEs5GAeWmobSrQYmTxWQtQPyG?=
 =?iso-8859-1?Q?uhKQcnjolUFRbmS+jkb7p6r8PclLo4DfzC6Kqz3OdpLxBjiUc/KTBCutra?=
 =?iso-8859-1?Q?lXr2qwY+r1flepXfThzojN5OFEzdZdqU4Tk/1BFgphxykS5VypfBedYUPB?=
 =?iso-8859-1?Q?Ky0/2znihI22cYg3yvO3FjjFOee3i3piRTCNCKH45TtsBT9xoxyhsDX5/x?=
 =?iso-8859-1?Q?5Dp5tl0bxnnXRTq/gppj5NMY+DPyGGW/o2tX2M2Z99FGiMS97msj1ey5M3?=
 =?iso-8859-1?Q?vc62yGb+wqGg7Zk4PJyviYzum+91iNR3CiNt5BeBaPLjGhY3ZIyNvykQIH?=
 =?iso-8859-1?Q?sknOKT37mhvI9zB/EYVgJuuRic5tAByNRxRWFpP5wZd8YKvQWeGPp8ljs4?=
 =?iso-8859-1?Q?X1bDR8YwaKUxkxDJVueqG7+qdBkfptFuZUNAPNwFlyGdozjDby2CJnmaY5?=
 =?iso-8859-1?Q?pC+DVHe8eyM+mxbNWAXgmAwSOT/AqI4S4Ej8uVTnIonrIR10LcoY7OXit2?=
 =?iso-8859-1?Q?6ozKONWo/Z9HDBszgJNEunJNe9VqshdjZkuXRuvpfX7EaRZWTHS4MG5lOo?=
 =?iso-8859-1?Q?WLEgA3wA8EH+Rd/IuLhqnFLS4aOqaZyL2pTuUD/DbR3ZW1AmfOL1XG3GoP?=
 =?iso-8859-1?Q?+H4h8N7V1A6heOw1XeID6NK1nO9DyWMJR3bspsKs7uEvLBxQMAfLUiAwmP?=
 =?iso-8859-1?Q?E+B3jG7c47GUoyyKvPcJTpyrQnyzAdSMTSQuZlcM86E8mC1WVDatYt0KjM?=
 =?iso-8859-1?Q?U2o8NEsH1/y9V18srz2XJoxZhNBzpTa5rBEYvxGmAyEmdYFZD9TRU8oDAs?=
 =?iso-8859-1?Q?oXAvHvib5/XdspdFUgMPURR3ht01ON8N0Nq1g07q3JlMkWmxSGR7drr7PX?=
 =?iso-8859-1?Q?UrFvug8z5lgT7xoaqm3VDD0UfpBudSzehJUyBb1YPc39gOD0CxBDrdqOrG?=
 =?iso-8859-1?Q?YX8aK+hcn0gMBMbQlrtImrU7dEIMynLJUtPgqGJwH+bV5fhsnD77m3/qfJ?=
 =?iso-8859-1?Q?ZyFlMIeaIPPk00e91O0coSnjTYwKdJ6aoOMQw9sm0at64VzhEr11PHVHTS?=
 =?iso-8859-1?Q?dLQvTzSoHwljXCxJaPrdAHramkOS44b+pl703sJt6lUgmj3O9aobanI28W?=
 =?iso-8859-1?Q?4K7ng95qPcgGvp/GPdTiSeN3/mjqyOsgtemGiJbmdsc8DGjiXrtIpG8yfD?=
 =?iso-8859-1?Q?6G8UQYHU4l2Jxnurb+T5VHHKtxp6ZU9UrJNZzso0T2+GcFGfViH5q8HcRO?=
 =?iso-8859-1?Q?KUv4gTNaceCh//KKGYFZMsI2+Fr8js4J1ajOuJYuJ6Y/SaIlZHiVGtU8i3?=
 =?iso-8859-1?Q?xYXT2hKWjSdnNSM6iV2r71WHlylpwy3W6KtufNAmwF4ZaQtibopcY+57I+?=
 =?iso-8859-1?Q?Nvbmfh1Q+4+4H5XFX9fTaS9jrgbt50pHC7sajoPrSChM1Q7UoQeNw1PcXb?=
 =?iso-8859-1?Q?8Xcg0XYpXPPUwo8Ko3n8I8Tw8Ka0SjCIk2N9WADZbUj/Iz8HcRkt8BRHwS?=
 =?iso-8859-1?Q?aOKsCgdesgjO3xY4fc49qe8mt+/VBEDALESZftuw9aHxKueb58eLouPp/+?=
 =?iso-8859-1?Q?EzTYnI2zvklq26I5UPLoAR1GKWLB0ySirZsK/M73kZKktQpZGEU4btBK4u?=
 =?iso-8859-1?Q?GLGDxrQx0ZB0U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ACA67073C140234AAD6F4AB566E1EC8E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42f6ec1-3175-411f-d44b-08dd56457bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 09:10:58.9238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HipjhjKqbBpkccwKCdijPghzIHfKlH/Z/ALoqL7f/oIwgkVF+U1HdTjIhLY+g23dmCMDmzLcG6wSoC7lmxjQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674

Hi,

On 2025/2/26 16:35, Roger Pau Monn=E9 wrote:
> On Mon, Feb 24, 2025 at 07:25:48PM +0100, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  CHANGELOG.md | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 1979166820..e6c6144ef1 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -18,6 +18,11 @@ The format is based on [Keep a Changelog](https://kee=
pachangelog.com/en/1.0.0/)
>>   - Fixed blkif protocol specification for sector sizes different than 5=
12b.
>>   - The dombuilder in libxenguest no longer un-gzips secondary modules, =
instead
>>     leaving this to the guest kernel to do in guest context.
>> + - Reduce xenstore library dependencies.
>> + - On Arm:
>> +   - Several FF-A support improvements: add indirect messages support, =
transmit
>> +     RXTX buffer to the SPMC, fix version negotication and partition in=
formation
>> +     retrieval.
>>   - On x86:
>>     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>>     - Prefer CMOS over EFI_GET_TIME as time source.
>> @@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>>       interrupts instead of logical destination mode.
>> =20
>>  ### Added
>> + - Support device passthrough when dom0 is PVH on Xen.
>=20
> I've spoken with Jiqian from AMD and the QEMU side is still pending to
> be merged, so I'm not sure I would list it here yet.  Also AFAICT the
> current work just enables passthrough from a PVH dom0 to an HVM domU,
> but not to PV domUs.  This would need to be clarified.
Yes, I only added pci passthrough for HVM domUs when dom0 is PVH.
And the qemu patch isn't merged yet.
https://lore.kernel.org/xen-devel/BL1PR12MB58491271C360CE4345A915AFE7C02@BL=
1PR12MB5849.namprd12.prod.outlook.com/
I think we need to wait qemu patch merged and then you can add an entry lik=
e:
- On x86:
  - Support pci passthrough for HVM domUs when dom0 is PVH.

>=20
> Thanks, Roger.
>=20

--=20
Best regards,
Jiqian Chen.

