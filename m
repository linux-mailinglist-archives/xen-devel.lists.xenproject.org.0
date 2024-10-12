Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF58799B01B
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2024 04:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817442.1231464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szRza-0005tE-3O; Sat, 12 Oct 2024 02:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817442.1231464; Sat, 12 Oct 2024 02:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szRza-0005qL-0c; Sat, 12 Oct 2024 02:36:30 +0000
Received: by outflank-mailman (input) for mailman id 817442;
 Sat, 12 Oct 2024 02:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A068=RI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1szRzY-0005kF-EU
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2024 02:36:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c666cb77-8842-11ef-99a2-01e77a169b0f;
 Sat, 12 Oct 2024 04:36:26 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Sat, 12 Oct
 2024 02:36:21 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:36:21 +0000
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
X-Inumbo-ID: c666cb77-8842-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZDTgVgckltjUSY5jGDHjmgu1B2bHy2i72g8Sh2B1B8gKb+i2BzFSBmEXEyUCmFWxwmS9O+AkcGdxL9L5c3mKKOqT5vnjoXE8gDj6eeVCHmt8muoib4OTyNjWBNWWHVTUQRtBU8dtzm3BAmS8fb+B8MPKLANXg7Kb5h9bheWwsBAEusH9V+cJ1lrui5OUnpEhi4oR12/7ZIKZrTIf7fOhd3XKI/pLSXX74TqOwiOmoRZ+3q8ToS9VoWyDFmdYgkz1acNdLda83nG7Dho53e4Sz96Ftwc5psauDpXXDpHkfDTxVdJOjrziT3rWicfzssOubK/0Bmk8cj7GQo9lRQQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay5MIbHfFoEOtxEXCqhqFFWWtIN1AFtm6El0SI6AA7o=;
 b=ufVrhudh1RoilO2aJ4ZHCpMjldbArfdSPsrd7eMpc+v1CfpUmt4J9BQ2j2l6jeb5tzv58F/wxcyqQU9dX4fE3yYFxHXij4SrrpZR9MhFKelgBuppolYjOkMVSDirGZKLa7U20A0+zNLunO1eL1i7yg99Fazasi3MJZaadZCmNDD0y0ISPkELv0A7Wyiou1L2zZvICsKnzUqToONrB+UxtnQfeYUJDHVcIz4w2WstqL2quhX27w7nhjkwyCmk0MBiSRInvVgf8YYom7DHT3qcKPom3rKt5vCclk8Znwg/luAoccasbqpA1jMOjgj/VRuDL7ITJuG76/m/8asDji/ikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay5MIbHfFoEOtxEXCqhqFFWWtIN1AFtm6El0SI6AA7o=;
 b=t5lEzAEOgkSDy22+xV9SqM3jk6ALyjLoVQs0xwvWJBPu1wF5r59aF3h5fJwKaYodWCNHP5ei8IegoONs+kdG+N/5zV0C7MRRmfYm1g7Vao1Wed4ud8IgnFqKB+/LIYmTJTfBCLjdMZjCp/VbEcDpHUEzuyChYc/+ftWFwhYrM78=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbG4+3Lfp3cJlJ4UuqoaLQId+ES7KBdNAAgAF0qICAAAQHAA==
Date: Sat, 12 Oct 2024 02:36:21 +0000
Message-ID:
 <BL1PR12MB5849C20650902FE3935BEC2AE77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <e6938fd7-2cb8-412f-b3e3-1943eeb271d8@suse.com>
 <BL1PR12MB58499172314E76D9A9278746E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB58499172314E76D9A9278746E77A2@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8048.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8546:EE_
x-ms-office365-filtering-correlation-id: f4329e83-131e-496a-a34b-08dcea66a8b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1VCTERzQWZtZ3Ayc2NwT1R4V2lyL1dmaWdxaURxVnFQVEtmdFZMRDFYbXpU?=
 =?utf-8?B?ZkdoYWc5YjZHb0xlTW8rSHllYTYzRE5mRUlaTXVTTk0yeU5LRkNZTW85YWUy?=
 =?utf-8?B?ZnQ5YXBuYU5OTDNzWmhTSFd3Z2ptUjdUNjBQVHh2RCtWZHFyWm8zZXlPUlJV?=
 =?utf-8?B?QTEzL1hjbnpBVVYyN2o5ajlDVnlWa25UME41aWowYzVHaG9ZTEkwUmJwNElF?=
 =?utf-8?B?QVVEclV6UFNkMXlsOE9JdzQ5ZDJKQ3RPRmg3WG5la3BKMG12bStPRlJYdmpl?=
 =?utf-8?B?U3UvUk9RN1ZhaGtVRVlSajU2YW1PVHd6SUt5Z21nRE9laGRXb1pkbGNZVkJU?=
 =?utf-8?B?U3VpaHZsT2ZseXYvaVBMYVFCekpHaWxFano0YlVMODB4bkEzdytPdTFyeFE1?=
 =?utf-8?B?Nk1NejFmcGdzWkdxbUgrVEVubTViMUs0UU1ob3VsK3ozZ1o4czFSK0dsME9i?=
 =?utf-8?B?Y29qK0tCd0tlSTluRGsyMUdCR2lTWjRvTWI0Z1p5bzYvWVZNVm4rYVBmZEFl?=
 =?utf-8?B?YTNRVUdsUnc3L2xRTkkzMTMrQWk1TDBHOW5tUVN4MEd3NldTZld1YVV1QnMw?=
 =?utf-8?B?NlBtYkNXemgrNE1OYkpGUFQyd2FvdXRUSk9Jbld5THNOQjZ6amR3QVJRakFi?=
 =?utf-8?B?K29zam8rOFJudHpKQ2ZiTmdCNFhMbllrelRwaVJpT3hGeGlRcTg3QmxOV0Rh?=
 =?utf-8?B?VGIrNHNRUmphTU5kQ3RNcU5nbW0yd29ta0ZlYXVVNklPWndvL2V5YzJScUZH?=
 =?utf-8?B?VHBTdmxSbFpIT3QrdTU1VXBUWG1TY2FaaFBEUzdiQksvTHlhS3dVQjNXaEM3?=
 =?utf-8?B?MDJEMjJPRFZicXNwQVN0bmJmVzVXU1hqalNTT3l5T1BHazU5aEtXU0UvS3lB?=
 =?utf-8?B?SFJmblVaUno1SGw1dzJoUDR5czlUQXJJNExZczkyNWNEaGZKSGM3a21xdFE0?=
 =?utf-8?B?Q1pvU0FvM24yeFc2VXVrV25KMWRhNWczUVpIQU1SQmFxcnVCTXNGVC9MZFdu?=
 =?utf-8?B?UmltRHNHcW9lVVA5eTNUM1V2OEtsTnBFVUZUV0NqNEhucXNJZkttbUwreVBC?=
 =?utf-8?B?NXlrVmhtQkRRN2o5U2xUanJQaWxSUTQzZWJlMkhlMDlocXFBZ1JyUFZxWjky?=
 =?utf-8?B?dmU4cXhEZHdxZ0tlTldKMlZJUUErSzA5VUVabU43cEgwMjE0a2xVd2hQWEF2?=
 =?utf-8?B?dnlnWnRKUisrempvell4YU9kNk9CaEk1R0RlQ0RrOFBabVJpcGVZUmJNVkVh?=
 =?utf-8?B?OHptMDgwMjhxN05TVlc2T1R2dlM1aGM1eWl5dmNHMnpOYmZ2S1F2NGRwUDl4?=
 =?utf-8?B?SmRidjkxcmtFV0ZxUXBJTXRqQmFMS2QzWUdjSXgrNUl0UHRXSFlsR1cyTENS?=
 =?utf-8?B?QncyUkswOGdmQlFzRFhQUEhydXp3Rmo2ZWdTRlNpbG82MENkdy9qcnVTUVB3?=
 =?utf-8?B?RXlmcDVwbHJidXpqMjBrN002d1crNVJIZS9ZVzBjOTBBNHdsUkdJUFQrRHZE?=
 =?utf-8?B?RTU0T1FHL2hqVVBLK1dvYzkwRU1lNjNRTjJDTjg2bHpHWlhhS2U0cDFjQXNQ?=
 =?utf-8?B?ZlI5U1I2N1lNeldYWDFoQ3hRdkZxQmpmZEJRV2psMzRQbWNpMTVwQ29GL1hS?=
 =?utf-8?B?THphTDFhRmMwSnNDcFZwSWNvbk9qUVR0ajZlSTRYOGNxT1NWZVRJMUg2K1Ro?=
 =?utf-8?B?WTFRc0RTOU8rU1liYzE1OEZCU2YwQ0o0UDBhdVVjNVR6VGtkVUJHNmw2eHhG?=
 =?utf-8?B?R3pMUm5aZkYxUzVJSzJzTzdGd1c5OEVFbzR2a0diY2lETnJTNmRmenBIcEdX?=
 =?utf-8?B?cFVYSE1YcE90RWZXT3BUUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHNIWmFMcnhKVDlMMktseW9FSFlKTFllV3RqVnAwSG8vTEpiSlBISW5od245?=
 =?utf-8?B?Uk9zWHdUVUtNbEhwWXBvRndwQ3FMQjA3SDVKQkxydjJaL21tWUxXNk1hMTdu?=
 =?utf-8?B?MXdwdDRBbEFzUWhPRUc0QkRNTk5pRXFJY210bGlYYUVwZWRxZHhZZk9pSlJo?=
 =?utf-8?B?d1UwTThMMTgwdHgvYVU1Yi96elVMQ21lR1dwYVVJRmFDaitUbkxaRUFLL0Q5?=
 =?utf-8?B?MGEwMTRzN0dUOFo1SjRPbFBVb3ZiU3JIY01TaUNkUDdxaEhXY0ErWWdMRklw?=
 =?utf-8?B?V0pRV2MvVkFuWEJFTE1KWkF1Q0hQRDFVN0lHRDNDOUIxQnVoazV0N1cvUXhU?=
 =?utf-8?B?VGljTHlOV01NSXN5aFB0SEM4RlEwRTYxYWdCMjZHYWJRbHFVajJ6VjhRWXNp?=
 =?utf-8?B?d2xKVFh0S1NBL1lJQVh5aStmVFFzQUo2Z2h0WVNvcSsxUnZoTEgyZnpBUHRw?=
 =?utf-8?B?MDNsZUJydjVzdlZiVFMrOUgrVEtySTFBUDMxcDgrWmpsbDJXYWtvZkZaRGNP?=
 =?utf-8?B?TDY2bVhhcHUwRTZrc3hYdVVRT21jbGJacDA0NFh3dTJFcitGMktsVFAyeFNN?=
 =?utf-8?B?QnNqaEFUd1NzenBaVmdFYUl0TXhkUWwybkZnVzZhWTNHWERuSzJDekR6bzhS?=
 =?utf-8?B?RlR4aDR3elY0NnFud0JWc01kSkpYYmRHY2FkTDdWRTdHTjFhMDE0bjZpeVBE?=
 =?utf-8?B?ZWZjRFlqOFIyckhEbURmd0VvNGtrRm1nTDFick5sSTUyZlhJYTdaODJtNUF6?=
 =?utf-8?B?M3BLM3g3QnM1TEtsb0xUcXNWSU1Na3RGRlp6TEdPa2phc1RYZkRqd2hYOHRQ?=
 =?utf-8?B?NU1NYkkzZy9zYkIwQWxKVWJNcGpjRW5haDB6QkRkUTFJSDU1cnJZcmJpZTVQ?=
 =?utf-8?B?M05DVlA3MHZGOGQ4czkyUlV2NWc4UXVkT2ZEK3paZ1B5RHV4aFYvMXd6YVI1?=
 =?utf-8?B?MDI4LzZCZ2N6ZnFUWnZjdzRMU3ZCRm5ncXU4ZFIyVEVYdlhTeUlLbHoyVlpw?=
 =?utf-8?B?dXZpbDRXcVMrVFhPR1YxdXZEVHpQdXZNWDR2V3lkNlFvK0FPTi90Q1dWV3VP?=
 =?utf-8?B?VlFZRUpzVjhQS2JFVURmRHozcUtDWjBuWWhobi8vbXVaVUJmVXdMdlpYK0JL?=
 =?utf-8?B?dEhJVElHQTgvM3FpRmFwWU5iaDgrSzhidlRMR0p2L3ZQUEZYQVhxY3FidVN5?=
 =?utf-8?B?QjVjSUlJN2ZUYkNBemhvaVV4eVB5ZUtRYUIrU2piY0kzVWROTlduQVVTajB5?=
 =?utf-8?B?QlRMWlRYQ3pRMFIyaFR3T2ZWYTJXZ1dSem1HQkprYXRNK0JROWowSEpwY3k5?=
 =?utf-8?B?Q3NwWnptUXN1dnRuTURWeUllaFZXMXFFSkk4Qm1VTnhhbWUvQjR0dWFJZS9S?=
 =?utf-8?B?V0dVOTljN2JJc2FPWW1meTQwZDMvOVM1bEd2bldtaE5jdjVtNlpsNVNDbnI3?=
 =?utf-8?B?dHgzQUo5YVErejNHNEFVZXpkdjZkYjdrNmY4YlVwdVNyNS9iN2tjY0thZDgy?=
 =?utf-8?B?UXRSLzM1TFJQWkdSYy9RUHlnWmt5d3FZc2hMSlRNblJ6ZHkvYnlYQWlpUE5x?=
 =?utf-8?B?K3dYdkVHaXFZak50a2ZJM0xNeGJ6ZFBJTkhQYURZdkgydFJ0dUVrNVRjU0Qr?=
 =?utf-8?B?aWplQW1kY0crOGUrQ0JQd3Y3ZHdmcjZGU2ZFeSt6RExORlByMnY1MDhYUG1q?=
 =?utf-8?B?eDJ5NW1XaVcrWnJnbGVOUG12UWlKR3NBV29sWTN0cVQ1STBnenl1VkVPZ1Nv?=
 =?utf-8?B?dVFITy9sL2RzZXdpS0hiVTlQZkppWWt3eWxROC9lYUN2MHRSN3pwTlY1NDhr?=
 =?utf-8?B?VmZHUDRUUTd3cEQvUzhXNk1sSWJoSUg1N01TcTNLeEpCMkJDak9IWVJTWGxY?=
 =?utf-8?B?eUprcnZuRWRwdGN2TXFlNzhtdTQxbDlSQW5rTm5iVWM3Qnp5T1BoWWdQTW5W?=
 =?utf-8?B?b0F4LzErRmlvdTY0SzdtRnZKSHhuUFh2QnZ0amxqWVNKTEozZGoxbmV2VTJM?=
 =?utf-8?B?ZGxsSi96V2VkSkVjakM3VHpYT0V3S2ExRmh6YnhWLzRyK2NXTWcxWVVPcnNF?=
 =?utf-8?B?MmlVZGpFS0lLUTROL1dOcVFQSjFPdnM2Um1pQmMzZmpLUkRLZXZKdy9Dc2Mr?=
 =?utf-8?Q?roR4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AA328B342B189428A7C74DCB66CAA2E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4329e83-131e-496a-a34b-08dcea66a8b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 02:36:21.7445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awF7tTtDi/Vxl8Ej4bq0XOfASAqY02BkS8gfNazQmN7c6mBbPU8jAyI7xcGszQJxJ1HRXZ6gy9KB26gdlgANgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546

T24gMjAyNC8xMC8xMiAxMDoyMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPiBPbiAyMDI0LzEwLzEx
IDIwOjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTEuMTAuMjQgMDU6NDIsIEppcWlh
biBDaGVuIHdyb3RlOg0KPj4+IENvbW1pdCAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRk
IG5ldyBzeXNjYWxsIHRvIGdldCBnc2kgZnJvbSBkZXYiKQ0KPj4+IGFkZHMgYSB3ZWFrIHJldmVy
c2UgZGVwZW5kZW5jeSB0byB0aGUgY29uZmlnIFhFTl9QUklWQ01EIGRlZmluaXRpb24sIHRoYXQN
Cj4+PiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4tcHJpdmNtZCBjYW4ndCBiZSBsb2FkZWQgb24gZG9t
VSwgYmVjYXVzZSBkZXBlbmRlbnQNCj4+PiB4ZW4tcGNpYmFjayBpc24ndCBhbHdheXMgYmUgbG9h
ZGVkIHN1Y2Nlc3NmdWxseSBvbiBkb21VLg0KPj4+DQo+Pj4gVG8gc29sdmUgYWJvdmUgcHJvYmxl
bSwgcmVtb3ZlIHRoYXQgZGVwZW5kZW5jeSwgYW5kIGRvIG5vdCBjYWxsDQo+Pj4gcGNpc3R1Yl9n
ZXRfZ3NpX2Zyb21fc2JkZigpIGRpcmVjdGx5LCBpbnN0ZWFkIGFkZCBhIGhvb2sgaW4NCj4+PiBk
cml2ZXJzL3hlbi9hcGNpLmMsIHhlbi1wY2liYWNrIHJlZ2lzdGVyIHRoZSByZWFsIGNhbGwgZnVu
Y3Rpb24sIHRoZW4gaW4NCj4+PiBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3NpIGNhbGwgdGhh
dCBob29rLg0KPj4+DQo+Pj4gRml4ZXM6IDJmYWU2YmI3YmUzMiAoInhlbi9wcml2Y21kOiBBZGQg
bmV3IHN5c2NhbGwgdG8gZ2V0IGdzaSBmcm9tIGRldiIpDQo+Pj4gUmVwb3J0ZWQtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+
DQo+PiBVbmZvcnR1bmF0ZWx5IEknbSBzZWVpbmcgYSBidWlsZCBicmVha2FnZSBmb3IgdGhlIDMy
LWJpdCB4ODYgYnVpbGQuDQpDb3VsZCB5b3UgcGxlYXNlIGF0dGFjaCB0aGUgbGluayBvciBzdGVw
cz8NClRoZW4gSSBjYW4gcmVwcm9kdWNlIGl0LCBhbmQgdmFsaWRhdGUgaXQgbG9jYWxseSB3aXRo
IG5ldyBjaGFuZ2VzLg0KDQo+Pg0KPj4gUmVhc29uIGlzIHRoYXQgZHJpdmVycy94ZW4vYWNwaS5j
IGlzIGJlaW5nIGJ1aWx0IGZvciBEb20wIG9ubHksIHNvIGhhdmluZw0KPj4gQ09ORklHX1hFTl9B
Q1BJIGRlZmluZWQgaXMgbm90IGVub3VnaCBmb3IgZW5zdXJpbmcgdGhlIG5ldyBmdW5jdGlvbnMg
YXJlDQo+PiBwcmVzZW50Lg0KPj4NCj4+IEkgc3VnZ2VzdCB0byBhZGQgYSBuZXcgQ09ORklHIGl0
ZW0gQ09ORklHX1hFTl9ET00wX0FDUEkgbGlrZQ0KPj4NCj4+IGNvbmZpZyBYRU5fRE9NMF9BQ1BJ
DQo+PiDCoMKgwqDCoGRlZl9ib29sIHkNCj4+IMKgwqDCoMKgZGVwZW5kcyBvbiBYRU5fQUNQSSAm
JiBYRU5fRE9NMA0KPj4NCj4+IGFuZCB0aGVuIHJlcGxhY2UgYWxsIENPTkZJR19YRU5fQUNQSSBp
bnN0YW5jZXMgaW4geW91ciBwYXRjaCB3aXRoDQo+PiBDT05GSUdfWEVOX0RPTTBfQUNQSS4gVGhp
cyBpbmNsdWRlcyB0aGUgdXNlIGNhc2UgaW4NCj4+IHByaXZjbWRfaW9jdGxfcGNpZGV2X2dldF9n
c2koKS4NCj4gDQo+IEhvdyBhYm91dCBhZGQgc3R1YnMgZm9yIHhlbl9hY3BpX3JlZ2lzdGVyX2dl
dF9nc2lfZnVuYyBhbmQgeGVuX2FjcGlfZ2V0X2dzaV9mcm9tX3NiZGYgd2hlbiAiIUNPTkZJR19Y
RU5fRE9NMCIgaW4gYWNwaS5oLCBsaWtlIHRoZSBvdGhlciBmdW5jdGlvbnMgaW4gdGhhdCBmaWxl
IGRvLg0KPiANCj4+DQo+Pg0KPj4gSnVlcmdlbg0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg==

