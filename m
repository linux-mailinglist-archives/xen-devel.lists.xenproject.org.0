Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6EBA71605
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927691.1330425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txPD7-0000Rg-0c; Wed, 26 Mar 2025 11:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927691.1330425; Wed, 26 Mar 2025 11:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txPD6-0000Oa-To; Wed, 26 Mar 2025 11:46:16 +0000
Received: by outflank-mailman (input) for mailman id 927691;
 Wed, 26 Mar 2025 11:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2wGD=WN=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1txPD5-0000OU-Av
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:46:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2613::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4658522-0a37-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:46:02 +0100 (CET)
Received: from VI1PR03MB6413.eurprd03.prod.outlook.com (2603:10a6:800:19d::8)
 by GV1PR03MB8662.eurprd03.prod.outlook.com (2603:10a6:150:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 11:45:56 +0000
Received: from VI1PR03MB6413.eurprd03.prod.outlook.com
 ([fe80::8799:8ad4:d837:51ab]) by VI1PR03MB6413.eurprd03.prod.outlook.com
 ([fe80::8799:8ad4:d837:51ab%7]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 11:45:56 +0000
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
X-Inumbo-ID: e4658522-0a37-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qX4ANDx6Q7ssUHkOjoRnFsal0J+Npk5p0SbPjXP4YauHS+Fko7JvnhOCUB8IXCTrEEcIbLppyiI+LJd5Vr/JiEN97TTL43p+JxDWZukx1DxbTOQ3BFGrF475vQlTgH0vk6ixxoDTZNBr3t/EJzZwwTPJYHr1OZbyS3R+i0L1WA1bEiWmC+0B8xOIis3fhKpOqd720vGVkANYwhtwYboTG3PrCJFltfdiaMScEQ4ST2y744U5IhFAcVE5rGKjxZGX5vJtKmn0MK/tMTXfQAbKLkzpqRMLp0+youf5NOPtPTrR+xg3ARLlcJ9ZZUnhiwd7TxzXfcBRErTUWAdw62pTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1YUpt57fT7TYs3uXEs+hlQyk5/EOg3dmLEdJn+TmKw=;
 b=bCEGw3Fb/+A62xG1FUGWWDMeZw9jdVg8h2Lcw2vtUzVZiQyrC6dVtnoLwt+Oq7VdEI+BMF65UvBOPd6DETdkWoYWcjyKuTVFwlejv5N9gLVNzYnw6NsvPjImohfdtqCZXP+sGo27z1nMuhhcGNLxzLdId3Vxo0PtMN9jj4SZbZY9lBMi0fTH/f6hEkTxcjQTS+3CcE6CVUJCRxlMpkHBLxDdZRcZmFd8DJ+TYjbginqqduD9ikQ8qyOgLjQS+E3gVaMuxfZaU3UP+Pk6E9teDSgsyOOoDl61I2inYdIhfQ1ejMpBBhg0LEDHTFG44VBVJVtMFpSzlQMoZZFqJrTyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1YUpt57fT7TYs3uXEs+hlQyk5/EOg3dmLEdJn+TmKw=;
 b=ltZZ8D+k8XzchJt9+A6PIv61fh05vxhbdYa+GwCpTxknEvlFK4VWr1Yca8KTQ+MnpqqwdhAPn64ojzhfC9UZcEf86ioUwgSgETTTBLr1F6ESrvgJ5JJs/sjtwZ2GtFz76G1cHNl/jZYy1DOpQzX/pkpypIFzmx+hHwgX0sZ0GT4DR/QtWOMjPxAuAkbcBynQbkhD8GobGmoy3qxbbZfTryA/adpPTZm/ELWfEyOrmbD4NnEPhKjwUJqkZaKuTNa7DMjt1M6G/kw+XdVCQwWjgpCVuHgWn8jnCliNruKe7JZp1ukRdymaDlAxycbZW4min+r5209n+JHbyh/Djy5y+g==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Topic: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Index:
 AQHbnZfMrs+h0o/uEkuTNWO41qxIcLOD+IUAgAADaoCAAAM8AIAABQEAgAABHgCAAAyVAIABDTwAgAAu+YA=
Date: Wed, 26 Mar 2025 11:45:56 +0000
Message-ID: <b3a91dc6-0133-4b9a-bc15-7f1e1272f940@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
 <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
 <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
In-Reply-To: <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB6413:EE_|GV1PR03MB8662:EE_
x-ms-office365-filtering-correlation-id: 421bed86-bb3b-4b07-e828-08dd6c5bc535
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGJ3UWxKa2VhTGU0VjFKenJUdHJkNmgxcVlvWkZrS0RnUkMxWkR4UzFjUVB1?=
 =?utf-8?B?SzA5eDFGU2JCQm5EWld6WjRsSEZ2Z3dFa2pLK3VlT3U3Zk40VHNyMHRBVTQx?=
 =?utf-8?B?SnhiQk1ZZEQ4TldBUG5FbmUvd0E5UDFIenpzTFR1TXJrTWdHYm9ZQWozOUFi?=
 =?utf-8?B?K2pCVDNRSk9hK2FianA0NXdMN1pvZm12UFpYL1A1amxJZEFIK3lWRlVyeDJ4?=
 =?utf-8?B?eVZwUmR2ZEs4MHcyL0IwMDlYa2lIcFMrOVZjYTVpTVd4RDMyZEsxR3ZwQUlk?=
 =?utf-8?B?RXdDaE9Ma04zcWo4aElEMnhUdGhCY3FmZEIwZVd5UGI2NDlyN3EybjErbmhm?=
 =?utf-8?B?OUdtWHd4d1YzenIwZkZTY0xHdFo5UWx2cXd4LzYzUFludm8vN3dGZHplem44?=
 =?utf-8?B?Qy9WMFFwWmJXUUVUMWE0M3diazE4cW8rTklMSDZxRXh4NjZIUXI2NlByTlNq?=
 =?utf-8?B?V0htcUN1ak1MNi9RWU92cWk4YzZvdFRNUXFlMm5waGUrd2lybTZ2bFJzRmxi?=
 =?utf-8?B?VFgvQ1RPbUFCaFZjY1NMc29xdGRaV0hONWg0NUZDRjl2a2x0VGhNc2ZvSVdR?=
 =?utf-8?B?bmFFcEoxTWJLL0VOSUljM3o4SHN6Ukppck5JZmRaNG1uTnM4L3k0a1J3NWVY?=
 =?utf-8?B?ei84OVQ0cnVuVTdRZEp0cjkrZlFsWjZMckhEdStyU2hEN0MvcjNQcGRNSVFH?=
 =?utf-8?B?dUNSWDBRek96eERqRUlydFF1aGsrSkxjSExyOXhrRG9xWkF1Qm85SWNBZ2E3?=
 =?utf-8?B?ZEpibWM4eTNGblJYUHh6UUJ4V1FZOW1XQ0JSQk1GcExUeU9lWG5iQ2JVNnFO?=
 =?utf-8?B?dDBQYnhxc3VsTTJ0N0c3WkJSTnpEbzgrN0hoRGMzYjN3dTRsQUJHYWxCY21E?=
 =?utf-8?B?MTV6clIwbEE2MmJoT2lJZlNoNWlZM1NvZ290T01nNEpQZFBlZ25Zc0xGY2xX?=
 =?utf-8?B?dHg1VWE2RHFaa05JYlpkem4vRnJ6S2M4R0I2VWlqTzRxMUxGa2lDMHV2bENi?=
 =?utf-8?B?VnBUZ1VoN3pJUGJGUE5qdG1SOVFXNVpCVTNYTExaK1FKbldJWW9CSjFUblg5?=
 =?utf-8?B?aGw1UXlrOGJsUW5oNkNLVWwzVDlsQmw0V3hnbzYrcEZNckkzbDk0YkJYUXJj?=
 =?utf-8?B?TWlqVFhNU1FHczRxazBpZlJJRzNwcWQ5ZmtUdzdSdjllZlprVTMrNUEveVds?=
 =?utf-8?B?MkR2OUFia0xrcGpmNXFDS0VxWmIzN1pmZFhvb2tJV243bkxXQWsxQTFZd2pZ?=
 =?utf-8?B?Sm1xdytaRERrdm10Y1NVVkwzUjhnU1cxbFJhZDZTd2p5V2x0ME9xU3VwbC91?=
 =?utf-8?B?TlhIZ3AxRlprSTNFK0pPazI0SDAzNER2R3lSTHdCYzR3OHdQWkhrbVZPRVJS?=
 =?utf-8?B?aVpzNTFkSmhMd3BXVWEvUGhBMVkxdlNhLzNFaVV0K2EzdGF2M3MrODNkZ0h6?=
 =?utf-8?B?Nkd1VVJQSE9ab2xkZm13OG45aGVIWlpGNTN4QUVTQXYzd1M3ckNjVUJlUHJV?=
 =?utf-8?B?RnJJcVNPVEEzWGFnaEtyNTRxTHRFbzZSVjJQRkJoQUpVSmxYQksrYkl3cjVW?=
 =?utf-8?B?V3kvMEpZM2ZFZitTOTg3aUJSNVRMSnFaOG42S3V0cWRQZFpQbG50aUorMzhY?=
 =?utf-8?B?aUNyV0M4QWRETlVDVUlUSlVjMktGckJtWEIwSHVnRVFoZWhKQzdaWTRNSHF1?=
 =?utf-8?B?K1NXZlZBQ3ZwZnBnMjRwN1BRSFhEaW5zM0hOT21xVmc5VWZ5SVpmSFFuZjgw?=
 =?utf-8?B?L2xqdFQxRTRScXpjMmQ5YW50WTdJY0diMkRtN01aOVBiSlJ1Wm9lZVhoSkp0?=
 =?utf-8?B?YlVOdkhBamZSaWNMbjdSWGV5V01zZnlWeWtibkJTeXcwN0IxVE0vaFIydmNz?=
 =?utf-8?B?Vlg2STl3dEQyUnVMWk1jeXNyU29lTzkvU1JhYW1wUWM1NzQ4YVpid0pOOXow?=
 =?utf-8?Q?NP0MfW75yYvT++c40s/SrDf0vpdIsb1j?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6413.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anVFY3RkYW93MkJYeDFpTEFyM0xlY0ZmWW5PY25DTkhNYVVoUVdjTjJuTnpl?=
 =?utf-8?B?cmhCVkdUWGZ1R1hmd1dxVUUzb0xoUkJKOWVHbTNEd0VVa0s1LzJWNUhmWk1x?=
 =?utf-8?B?TmxMM1dybVhEcFJ5ZWw2Y0QwZndySHpCOE9uMlRkMm96Ync3Z0dPMkQzMGd5?=
 =?utf-8?B?c0p5U2JvUU1iYnBKQ3UwZjZOcFdiWHVueHF1NGJzMWJHZ0lIS3VMRGduL0F5?=
 =?utf-8?B?V2NlS0NBUXlvNFZuRTJUMTZ0cmZSa1FRc1ZqZWZndUdrZkc1WXYrczBBR2ls?=
 =?utf-8?B?ZjVhMHEwYTVJRTl3V20rLy9aMWhtdS85RHpFYWRBQlFaS3dYeFJQUTBIbTlJ?=
 =?utf-8?B?ZnloM0NxM1RCd2JCOTFuN1dZL015MFNGVmkwYlFuS1R0YVhWM0VUU0d2aXJ6?=
 =?utf-8?B?TmtFcE45Nm45S2JGVEpmT0g1Wm0vMUFKeDl3NkNnU1Ard2F0dmxrY1VPWGRM?=
 =?utf-8?B?Ukw3dDdneWRzalEzMGZreXZJa0lTLy9SeDljQlA2cXQ2TXY1VWtQVVgvYXIv?=
 =?utf-8?B?YUJ0b0lteEdRZGRQUlhLM0RDNFhGVkRVSkdOVW9YVVhyV3VRRk9pUUdUbUJX?=
 =?utf-8?B?ZTJXdFZsdUdVS1ZWUFEvYU54UWdleWFNMExQUThOMmFzYUpIZVZpQjBLRVB1?=
 =?utf-8?B?RnFoaVRBamtEdmM2RHhCa3dHVkRKOU5GZ1gxUlIvVVlNZ2psMmZCTmlJZEgw?=
 =?utf-8?B?anZvY1hVbVRnZXFic3NpeXZhdGYrTWgwVFhtRUprSHFPaG01T3U3TUEwMDBY?=
 =?utf-8?B?c05pdmFiajdETGlwU3RzeTV0c0lycUk2ajRsSnY1WnovY3NqL25qWGNyQ3p2?=
 =?utf-8?B?dDYyQWNraXI2K2NFTS9xVGJ4TEZhQi9IY2h4TEZrekxpTXl5bGx3ajhPK0VB?=
 =?utf-8?B?Zm8rYVhRTms5QUFabXRoUWVrQk1xUzk2bThZdUF3eWVGQTFIZWlMMjRuQWJW?=
 =?utf-8?B?WkcyS0V6OFhhd2xxRzFhUTF4NENtNVVnQ1hucENxTndxS3Azb3V6L2dPcUhD?=
 =?utf-8?B?T0pXZFRRZmhFR0tFenQ5N004dXQvSHQwTFRtTFhJVVZZUWRmaGlQRDVaaS9P?=
 =?utf-8?B?MG13UEkrRWt1NGhJL1huaEd6cXZOZHFNdElhVVJldjQrS2FMSmFLUExxSDNK?=
 =?utf-8?B?V3JJaWVQc01tZVFSV3BxR2oyNXJWSkptRzlhcWxXdDgzWnhvVXBzRjVBNGtT?=
 =?utf-8?B?cFJBa2tJaUI4dmFWRWhuN2Y4NDNMTzI3QTlDMXhPdGhuelJFMGZDeStLNzhY?=
 =?utf-8?B?VnFTYkhDekZ6dDdvY3NiaCtFMFk2Z0VTb1F6MENZVGwvRnJNZFlQRWw2ZFBC?=
 =?utf-8?B?VWxmT00vRC9rSmZNWkJpaTdGUk9WU1JvejI3MWdSVXMvOGFyZUdvb1A1RWQw?=
 =?utf-8?B?cVRwaDRiMWNmR1R0dVlMQ2JySnFDTzBpdWVMNjAxeC9lVGtZS3RURnBTSkkw?=
 =?utf-8?B?TytoK09WNWFScDBJM01tdzFrWUJJdjNCZnBlUG1CY1c4bkRNQ3FhMTRmSi9J?=
 =?utf-8?B?R1NybDZ4TG5teFZVY0xLM0JXR2xOejBTc09uTmsxTHFya3JCUnd5TUNxZkw4?=
 =?utf-8?B?NnAzcVMrWk1XSEhBN0VwNm5XMmVDcmZDdElVRUNvdkVnbFFUbWkvY0ZuM3Bw?=
 =?utf-8?B?WlJyMkVQMXlOeWFkWUtRWnpka08vWjRLSmJGaEcwUlBFL3phTTlHRlRIMkN0?=
 =?utf-8?B?S0FNdWUvSVhaZ1RzNHNCRjZVczRUdks4cSt6Mk03QVNNaERFSXBucmVFVnZL?=
 =?utf-8?B?aUkxYzAvTGhxbG16Q0Z2b3k3TzJ6ekxyNFhtL1pGWFVvRmVkSUJndzBOekNu?=
 =?utf-8?B?dW5lUTFqTnRoV0VjYllDS253amxaYVVkejl0YUpxWVJWeUFFS29kUmM4NVhh?=
 =?utf-8?B?LzZ1dTk5cHllM1lUaDVvSC9xZHNTTWlvRTl3Q1o3ODQ0Rm92WElUWE5FQTBu?=
 =?utf-8?B?TGVYRGJkN3dnZ0Z5bTdGQTZSZE5DcC9DVGVhZEtHNER1QXFSOXpJaEZoVG5R?=
 =?utf-8?B?VG9saWxYRVdMbWI3cXpDc2l4NGVBb0ZSblZ2WDFZbkROTFRtd0ZYZi9pRm55?=
 =?utf-8?B?YWdFQnhZNW1RTStzdWJBRUlxbytPenk1SmM4eVlJRHM3NlpxYWc0U1BTUkg2?=
 =?utf-8?B?cmJ4bjVBeDJQK21Od254dndFYU4xS1EwaXVFSzRtTGRyWmgrdm5HZUYyS1Jt?=
 =?utf-8?Q?JjSXV3yVT7hSmvvBcnMVN5s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A2323026FE43D47A01CC4905791B32F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6413.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421bed86-bb3b-4b07-e828-08dd6c5bc535
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 11:45:56.2373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qKm2ZtgpY+EultyftY/SyHrNMMbn4HC03h9pqDjBouXmKMgzHssqKiOKyOiu0AtWUi7RvrB5UruaLWJp0HccMOTSb4Md4bO6jGOrroTDwdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8662

DQoNCk9uIDI2LjAzLjI1IDEwOjU3LCBPcnplbCwgTWljaGFsIHdyb3RlOg0KDQpIZWxsbyBNaWNo
YWwsIEp1bGllbg0KDQoNCj4gDQo+IA0KPiBPbiAyNS8wMy8yMDI1IDE3OjU0LCBPbGVrc2FuZHIg
VHlzaGNoZW5rbyB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMjUuMDMuMjUgMTg6MDksIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4+DQo+Pg0KPj4+IEhpIE9sZWtzYW5kciwNCj4+DQo+PiBIZWxsbyBKdWxp
ZW4NCj4+DQo+Pj4NCj4+PiBPbiAyNS8wMy8yMDI1IDE2OjA1LCBPbGVrc2FuZHIgVHlzaGNoZW5r
byB3cm90ZToNCj4+Pj4+Pj4gRnVydGhlcm1vcmUsIHdoYXQgaGFwcGVuIGlmIHdlIGRlY2lkZSB0
byB1c2UgQUNQSSBhZnRlcndhcmRzPyBXb3VsZG4ndA0KPj4+Pj4+PiB0aGlzIG1lYW4gdGhhdCB0
aGUgc3RhdGljIHJlZ2lvbnMgd291bGQgYmUgcmVzZXJ2ZWQgZXZlbiBpZiBBQ1BJDQo+Pj4+Pj4+
IGRvZXNuJ3QNCj4+Pj4+Pj4gdXNlIHN0YXRpYyBtZW1vcnkgKGFsbCB0aGUgbWVtb3J5IGlzIGV4
cGVjdGVkIHRvIGJlIGdpdmVuIHRvIHRoZQ0KPj4+Pj4+PiBhbGxvY2F0b3IpPw0KPj4+Pj4+IEkg
ZG9uJ3QgdGhpbmsgc3VjaCBoeWJyaWQgY29uZmlndXJhdGlvbiBpcyB2YWxpZCAoYm9vdGluZyB3
aXRoIEFDUEkgeWV0DQo+Pj4+Pj4gZGVjbGFyaW5nIHJlc2VydmVkIHJlZ2lvbnMgaW4gRFQpLiBT
ZWUgY29tbWl0Og0KPj4+Pj4+IDljMmJjMGYyNGIyYmE3MDgyZGY0MDhiM2MzM2VjOWE4NmJmMjBj
ZjANCj4+Pj4+DQo+Pj4+PiBJIGRvbid0IHRoaW5rIHRoZSBjb21taXQgaXMgcHJldmVudGluZyBo
eWJyaWQgY29uZmlndXJhdGlvbi4gSXQgaXMganVzdA0KPj4+Pj4gc2F5aW5nIHRoYXQgdGhlIHJl
Z2lvbiAod2hpY2ggY291bGQgYmUgYSBzdGF0aWMgcmVnaW9uIGJlY2F1c2UgdGhpcyBpcw0KPj4+
Pj4gbm90IHN1cHBvcnRlZCkgd2lsbCBiZSB1bnJlc2VydmVkLg0KPj4+Pj4NCj4+Pj4+IElPVywg
d2hlbiBib290aW5nIHdpdGggRGV2aWNlLVRyZWUgeW91IG1heSBiZSBhYmxlIHRvIHVzZSBzdGF0
aWMgbWVtb3J5Lg0KPj4+Pj4gQnV0IGlmIHlvdSB3ZXJlIGJvb3Rpbmcgd2l0aCBBQ1BJLCBzdGF0
aWMgbWVtb3J5IGlzIG5vdCBzdXBwb3J0ZWQgYW5kDQo+Pj4+PiB0aGVyZWZvcmUgdGhlIHJlZ2lv
bnMgc2hvdWxkIGJlIGZyZWUgZm9yIG90aGVyIHB1cnBvc2UuDQo+Pj4+DQo+Pj4+DQo+Pj4+IEp1
bGllbiwgSSBzZWUgeW91ciBwb2ludHMsIGJ1dCB0aGUgY3VycmVudCBwYXRjaCBkb2VzIG5vdCBh
dHRlbXB0IHRvDQo+Pj4+IG1ha2Ugc3RhdGljIChyZXNlcnZlZCkgbWVtb3J5IHByb3Blcmx5IHdv
cmsgb24gQUNQSS1iYXNlZCBzeXN0ZW0gKGlmIGl0DQo+Pj4+IGlzIGF2YWlsYWJsZSB0aGVyZSks
IGN1cnJlbnQgcGF0Y2ggdHJpZXMgdG8gc29sdmUgdGhlIHJlYWwgaXNzdWUgb24NCj4+Pj4gZGV2
aWNlLXRyZWUtYmFzZWQgc3lzdGVtIHdpdGggWGVuIGNvbXBpbGVkIHdpdGggQ09ORklHX0FDUEk9
eSAoYXQgbGVhc3QNCj4+Pj4gdW5pbnRlbnRpb25hbGx5KS4NCj4+Pg0KPj4+IEkgYW0gbm90IGFz
a2luZyB0byBtYWtlIEFDUEkgd29yayB3aXRoIHN0YXRpYyBtZW1vcnkuIEkgYW0gYXNraW5nIHRv
IG5vdA0KPj4+IGJyZWFrIEFDUEkgaWYgdGhlIERldmljZS1UcmVlIGlzIHNwZWNpZnlpbmcgc3Rh
dGljIG1lbW9yeSByZWdpb24uDQo+Pj4NCj4+Pj4gSG93ZXZlciwgSSB3b25kZXIsIHdoeSBpdCBo
YXMgbm90IGJlZW4gbm90aWNlZCBzbyBmYXIuDQo+Pj4NCj4+PiBBQ1BJIGlzIG5vdCBhIHN1cHBv
cnRlZCBmZWF0dXJlIGFuZCBnYXRlZCBieSBVTlNVUFBPUlRFRC4gU28gdGhlDQo+Pj4gaW1wbGlj
YXRpb24gaXMgeW91IGhhdmUgZW5hYmxlZCBVTlNVUFBPUlRFRCBhbmQgYW55dGhpbmcgY2FuIGhh
cHBlbg0KPj4+IHJlYWxseSA7KS4NCj4+DQo+PiBJbmRlZWQsIHRoaXMgYW5zd2VycyB0aGUgcXVl
c3Rpb24uDQo+Pg0KPj4NCj4+Pg0KPj4+Pg0KPj4+PiBJdCB0b29rIHNvbWUgdGltZSB0byB1bmRl
cnN0YW5kIHdoeSBqdXN0IGVuYWJsaW5nIENPTkZJR19TVEFUSUNfTUVNT1JZPXkNCj4+Pj4gdHJp
Z2dlcmVkIGEgQlVHIGluIGNvbW1vbiBjb2RlLiBBbmQgaXQgdHVybmVkIG91dCB0aGF0IGl0IHdh
cw0KPj4+PiBDT05GSUdfQUNQST15IGluIG15IFhlbidzIC5jb25maWcgdGhhdCBjYXVzZWQgdGhh
dCBjb25zZXF1ZW5jZSAoSQ0KPj4+PiBzcGVjaWFsbHkgd3JvdGUgc28gbG9uZyBkZXNjcmlwdGlv
biB0byBwcm92aWRlIGZ1bGwgY29udGV4dCkuDQo+Pj4NCj4+PiBBcyBJIHdyb3RlIGFib3ZlLCB0
aGUgb25seSB0aGluZyBJIGFtIGFza2luZyBpcyB0aGF0IG1lbW9yeSBmb3Igc3RhdGljDQo+Pj4g
cmVnaW9ucyBzaG91bGQgYmUgdW5yZXNlcnZlZCB3aGVuIEFDUEkgaXMgZW5hYmxlZCBsaWtlIGl0
IGlzIGFscmVhZHkgdGhlDQo+Pj4gY2FzZSB0b2RheS4NCj4+DQo+PiBTbyB0aGUgY29uY2VybiBp
cyB0aGF0IG5vdCByZXNlcnZpbmcgcHJvdmlkZWQgYnkgdGhlIGRldmljZSB0cmVlIHN0YXRpYw0K
Pj4gbWVtb3J5IHJlZ2lvbiBpcyBnb2luZyB0byBiZSBhIHBvdGVudGlhbCB3YXN0ZSBvZiB0aGUg
bWVtb3J5IG9uIHRoZSByZWFsDQo+PiBBQ1BJIHN5c3RlbT8gT3IgSSBtaXNzZWQgc29tZXRoaW5n
Pw0KPj4NCj4+IEkgc2VlIHR3byBvcHRpb25zIHdpdGggdW5yZXNlcnZpbmcgdGhlIHN0YXRpYyBt
ZW1vcnkgcmVnaW9ucyBvbiB0aGUgcmVhbA0KPj4gQUNQSSBzeXN0ZW0uIEkgYXNzdW1lLCB0aGF0
IHdlIHNob3VsZCB1bnJlc2VydmUgb25seSBhZnRlciB3ZSBkZWZpbml0ZWx5DQo+PiBrbm93IHRo
YXQgd2UgYXJlIHJ1bm5pbmcgd2l0aCBBQ1BJIChpLmUuIGFmdGVyIGFjcGlfYm9vdF90YWJsZV9p
bml0KCkNCj4+IGNvbXBsZXRlcyBhbmQgYWNwaV9kaXNhYmxlZCByZWZsZWN0cyB0aGUgcmVhbCBz
dGF0ZSBvZiB0aGluZ3MpLCByaWdodD8NCj4+DQo+PiAxLiBlaXRoZXIgY2FsbCBhY3BpX2Jvb3Rf
dGFibGVfaW5pdCgpIGJlZm9yZSBzZXR1cF9tbSgpIGluIEFybTY0J3MNCj4+IHN0YXJ0X3hlbigp
Lg0KPiBUaGlzIGNhbm5vdCBiZSBkb25lLiBhY3BpX2Jvb3RfdGFibGVfaW5pdCgpIGNhbGxzIEFD
UEkgZnVuY3Rpb25zIHRoYXQgbWFrZSB1c2UNCj4gb2YgVk1BUCBhbmQgYWxsb2NfYm9vdF9wYWdl
cywgc28gdGhlIGJvb3QgYWxsb2NhdG9yIGlzIGV4cGVjdGVkIHRvIGJlIHBvcHVsYXRlZA0KPiBh
dCB0aGlzIHBvaW50Lg0KDQpobW0sIEkgZ290IGl0Lg0KDQo+IA0KPj4gMi4gb3IgZ28gdGhyb3Vn
aCByZXNlcnZlZF9tZW0tPm5yX2JhbmtzIGFuZCB1bnJlc2VydmUgZXZlcnl0aGluZyBtYXJrZWQN
Cj4+IHdpdGggTUVNQkFOS19TVEFUSUNfRE9NQUlOIGFmdGVyIGFjcGlfYm9vdF90YWJsZV9pbml0
KCkgY29tcGxldGVzDQo+IFdoYXQgaWYgd2Ugc3BsaXQgYWNwaV9ib290X3RhYmxlX2luaXQoKSBp
bnRvIDIgcGFydHMsIHdoZXJlIGZpcnN0IGlzIHVzZWQgdG8NCj4gZGV0ZXJtaW5lIHRoZSByZWFs
ICJhY3BpX2Rpc2FibGVkIiB2YWx1ZSwgY2FsbGVkIGJlZm9yZSBzZXR1cF9tbSBhbmQgc2Vjb25k
IHVzZWQNCj4gdG8gcGFyc2UgdGhlIHRhYmxlcz8gVGhlcmUncyBvbmUgaXNzdWUgd2l0aCB0aGlz
IGFwcHJvYWNoLiBUb2RheSwgZXZlbiBhZnRlciB3ZQ0KPiBldmFsdWF0ZSB0aGF0IHdlIHNob3Vs
ZCBydW4gd2l0aCBBQ1BJIGVuYWJsZWQgWypdLCBlcnJvciBpbiBBQ1BJIHRhYmxlIHBhcnNpbmcN
Cj4gaXMgaWdub3JlZCBhbmQgQUNQSSBpcyBzZXQgdG8gZGlzYWJsZWQuIFRoYXQncyBub3QgcmVh
bGx5IGluIHRoZSBzcGlyaXQgb2Ygb3VyDQo+IGN1cnJlbnQgbWV0aG9kb2xvZ3ksIHdoZXJlIHdl
IHNob3VsZCBwYW5pYyBpZiB1c2VyIHJlcXVlc3RlZCBzb21ldGhpbmcgdGhhdCBkb2VzDQo+IG5v
dCB3b3JrLiBFeGFtcGxlOiB0b2RheSwgZXZlbiBhZnRlciBzcGVjaWZ5aW5nICJhY3BpPWZvcmNl
IiwgZXJyb3IgaW4gdGFibGUNCj4gcGFyc2luZyBiYWlscyBvdXQgdG8gRFQgYXBwcm9hY2ggd2hp
Y2ggaXMgbm90IHdoYXQgdXNlciB3YW50ZWQuDQoNCk1pY2hhbCwgaW50ZXJlc3Rpbmcgc3VnZ2Vz
dGlvbiwgdGhhbmtzLiBMZXQncyBzYXkgYWNwaV9wcmVpbml0KCkgYW5kIA0KYWNwaV9ib290X3Rh
YmxlX2luaXQoKS4gSSBzZWUgdGhhdCB0aGVyZSBpcyBhbHJlYWR5IHNwbGl0IGZvciBzb21lIA0K
Y29tcG9uZW50cyAoZS5nLiB0aW1lLCBnaWMpLiBJIGFncmVlIHdpdGggd2hhdCB5b3Ugd3JpdGUs
IHllcywgbG9va3MgDQpsaWtlIGl0IHNob3VsZCB3b3JrIGlmIHdlIGNvbnZlcnQgZXJyb3JzIGlu
IEFDUEkgdGFibGUgcGFyc2luZyBpbnRvIA0KcGFuaWNzIChub3RlLCB0aGlzIGlzIGNoYW5nZSB0
byBhbiBleGlzdGluZyBiZWhhdmlvcikuDQoNCkFsc28gaXQgaXMgbm90IGVudGlyZWx5IGNsZWFy
IHdoYXQgd2Ugc2hvdWxkIGRvIHdpdGggYWNwaV9kaXNhYmxlZD10cnVlIA0KZHVyaW5nIGRlY2xh
cmF0aW9uICh3aGF0IGN1cnJlbnQgcGF0Y2ggZG9lcyksIGV2ZW4gaWYgd2UgZGVjaWRlZCB0byBn
byANCndpdGggc3BsaXR0aW5nIHNob3VsZCB3ZSByZXRhaW4gdGhhdCBjaGFuZ2U/DQoNCj4gDQo+
IH5NaWNoYWwNCj4g

