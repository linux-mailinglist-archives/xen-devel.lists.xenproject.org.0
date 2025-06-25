Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB0BAE8EF5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 21:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025510.1401049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUW5w-00010f-Hg; Wed, 25 Jun 2025 19:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025510.1401049; Wed, 25 Jun 2025 19:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUW5w-0000zA-DS; Wed, 25 Jun 2025 19:47:44 +0000
Received: by outflank-mailman (input) for mailman id 1025510;
 Wed, 25 Jun 2025 19:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzS6=ZI=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uUW5u-0000Z0-OU
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 19:47:42 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4121320b-51fd-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 21:47:41 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GVXPR03MB10803.eurprd03.prod.outlook.com (2603:10a6:150:221::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 19:47:38 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 19:47:38 +0000
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
X-Inumbo-ID: 4121320b-51fd-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZiN0OFOY5nxg2y61QeIORF4AUtkMVEaJDBvnqXP+JAeoXhWSbSbn4XlrXqVT2tqaWP1V7FwxxbrzNtVViCI2qI/FY81fEUKDPnFA9QqVByo64jJ3Uqi7xQaBZMtr00953kAzQ+setQn9m8YdTET+o+BmpvPtpgtuDzWH4rmyuIGzIZb7YEL6NL00VNWd+Aon1hxSR9h1Re0bs+xxGalz40z3+xTQEqbfypl3lqTZBaE0Ub6BK5JyQI6OKF4tGNhap+2iHwvt7VkPE4VNlbPkhHWm/JTlFdY/wkj3uCyvDB8LqRvKaXEkJsa9kJltmyI9N+ZhadfDaTwoZPbJsbS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+ImBwAG3nv9PtIK6NLMZYGR3Q1CHLpmGvC3XPvbaS0=;
 b=dke8apB+N5UYRRxeADJUh/kXQvogWNFXD/EcN9qv6LoMMnakoJhxPnhVRnZcNdzCRF4vEVDykqITe8oT86nr/BTvwljZUifCASSux4YmXBHOQ7kyC8b0ahJlCLbW0No7geNkDa5PQ8e6dWgc4naKeTxkGe4MpmMqSHRN49sPczHstCo17ZVd5boOGa6LxGr7JjbDnk+B+1bLSfgjuKvikOJ79ip3t9f70W30MxvixN9pNWEAaojLzugkvJxRp0S3fvJSFNDH1C4X7AOhAsLrTx95uarF0G2N4+5Z1cW7WEWftf5S3hXNatg0+vlI0nrO7Sy4dx9cIZcHZUoGAsBTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+ImBwAG3nv9PtIK6NLMZYGR3Q1CHLpmGvC3XPvbaS0=;
 b=vj7KLOfAPpIU2RFgibGmnw+PlXJEtPkaQqHMUbkCNEM+0qPm0dkwmrxqxL1mvgszSpjf9NgB9vPxDAPv2tkdDtUqOP/f/sPn+W2oP8tK/B0qNXXjvCwncjrGxj9roI7apOpD6ZkdXIeDRtD7vInBAnBidPA4wS5geT4M51dn2+5GMIaAltpqd8L/BlE+yPGxugsh8HSdNQxuyPx8bOVXOR3j5rlt+WRartkaBDbk3QQ95wmjwWGE8DbhYXh3iAX9t2R/eAoBIkiKkSZQLe2MvMmr7b9l8OyCPuikcYh4XJG7M8siE48LeQPlzNx3BWwE2CqGYH7cBnREu/WhucHgkw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Thread-Topic: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Thread-Index: AQHb4TVhOpwmaSC7dkC7oLLOKyrberQPvwGAgACpCACAA+mNgA==
Date: Wed, 25 Jun 2025 19:47:38 +0000
Message-ID: <df2ee229-ec98-4097-a6bb-b16910c540e9@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop>
 <e5e8b7b3-a9c3-4e1a-9241-6776990b6e11@epam.com>
 <alpine.DEB.2.22.394.2506171720390.1780597@ubuntu-linux-20-04-desktop>
 <e4bf11e1-5bf5-4428-bd73-4fd2cb2029fb@epam.com>
 <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop>
 <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
In-Reply-To: <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GVXPR03MB10803:EE_
x-ms-office365-filtering-correlation-id: 1eca9613-82d7-4346-e0bf-08ddb42123a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWtXOTdsMmJkUENUb0x1WXBkZGF1RUlNdVV3Q2FnRDUwK1NZRzZTTURqcDFm?=
 =?utf-8?B?UnZ6YlJMTWlWdFVWdDNNbFhYK2trSFdYa2RuWnMxOFh5d1NTcEZOVzYzYURH?=
 =?utf-8?B?T1hGckUxNDVvL29hVngzMDhYM1ZTbytmaVZEeUdNeFdFdkNaandobkNOSmkr?=
 =?utf-8?B?YXNBSWNzRlVOU3JkR0wzd3c3UVBuZStmbHFBeUNRZWpsTm5CS2w3QVZhdHZv?=
 =?utf-8?B?UDR3UjFYOVFKN0tLc3A1VDNkNEJqZjlQWEJhV3c2YU5CTDRlRktwTFNuMU5F?=
 =?utf-8?B?Q0VDNnVsVEZSQ3NyMDZiTC83TDUrTUVkRkoxUkVoSXRPZ2pNa0htRzdqdWxz?=
 =?utf-8?B?RkJyd3hRZ3l1NGlNQjVTRm1YVXJPYnB5MmNmeW1wbjQvdVBvTU11QmU1Vyt6?=
 =?utf-8?B?cjZudnZsRURIeENGM1VIYUZmTUJaVU40M3o3eHJuRnhYS0YyMDg1aWQ4TzhP?=
 =?utf-8?B?RnVIL3BMWUpKODZnV0JWcnhEb1BRZ2RvKzlieU41cnAzTmFVN2JCTlpPVkJw?=
 =?utf-8?B?eVpEd2FPdVJhb2FSUXMwQm9tcnZuMVhLcVlidUZYbHFZcEpvalhlb0pZUTFK?=
 =?utf-8?B?S3phLy9YUXdtd0Nrb0JYOEVLdU1BQy9ZaUtEV3VONUJ0ZCsvQ2IwOUEyT0I4?=
 =?utf-8?B?cUxLajBnOExFSDhaWjZBSi9KOHBQeHdqcTBBMklSYjBQTjc4SHl6NVZ0Nmc1?=
 =?utf-8?B?SjlVWEtoTUVFM0FIODZvQndUdm5qT2M3dDd2VFA2UDFvbHRaU2RIQzVPdzBw?=
 =?utf-8?B?VEVBeENnRUhlZ2tkK3FJakRYdGd4QXE5WGlCOSttNU8yZlNtMVdJK2FYV0xr?=
 =?utf-8?B?L2F0U3ZzQ2x3RktjSGhUN0hsblRCQUVZa0lkZEEwMHBtVlQvd3JUc01QWWRC?=
 =?utf-8?B?bGY1MXRLc3pUcnI1czhjcytJVERwNEZzaUdLNjZXYUI2L0VEVW9hRi8zR3JQ?=
 =?utf-8?B?WTFwQVMva0tGSkxtcTdOc1JjVEZpanF1d2swQXlscFVxVC9WOUlqVTA3ZWI0?=
 =?utf-8?B?ejU5am9qdXFPRm9Ud2M2dGVTWFVaZjIxNitTdmdqTFFiY1ZwaFoxNUhwa2pr?=
 =?utf-8?B?U1lZWUJVRm9OVjlGWTNPMHFzUmFLOC93MjljeldsQTFsN1I4RHVMblFUakty?=
 =?utf-8?B?MkpTeDB1VlNrTElYMHNxaEdKWWJFVDVDTkN0ZWFLeEphMjc1aDJEeEFrZS9v?=
 =?utf-8?B?cWE1TFpvYXFoUG5hazBObkRDR2RsbWVudGtRMWczMzZ6RHduMzRPQmp3VjBI?=
 =?utf-8?B?Wm5OODJ4OEg1QXVRTWxsUitwOXpSamJ6a1pEaFRaVXNocE1QTk5lOGdEcUxR?=
 =?utf-8?B?cEVEak8vLy9sZFhOamQ4TW5XWkVxUUdrVWc5a2xGV1NGeWlEUVNDZVhNUGtl?=
 =?utf-8?B?ODNPUzlNMU5mUWRHa3N0T052WEFKZDJ0S090Rm1kUUdwZjF4Z3I4THRjYzlF?=
 =?utf-8?B?VnJsbDBtT2Y3d2N2ZDhydFRsV3BoaEh2UVBNdi9Sa3h6cXdkb3J6bE1wa3lY?=
 =?utf-8?B?MmxxVXR1ams4YXlqaXdMTzViVnJXN2dtQXBRU0NmMWR2TkR1aW5pa2JGeVlk?=
 =?utf-8?B?NkQ0U1V5RmsvYWJOcHEvM2xCOWJjZDZEOS85QWtEdTc4cHNlMjBFRktMSzJk?=
 =?utf-8?B?UkRWZGIxbmVUVWVENWVRSlhMSzJTUkNGVnFSaTYyZzVtQmVrRGs3dlp3Tk9C?=
 =?utf-8?B?WTBiemp5SnlSQWw1SFFpOEFwZmFRKzZWbVlmbXF6VEFVWHgveUEzYVA3cnEw?=
 =?utf-8?B?UExQeENIUUN4NG5nNlNjY3FGS0d0Q2tPUE9TZjZwRWpOUGJKT2gwbG1EUDAw?=
 =?utf-8?B?R2hJdVRjd1p3cVRVZG1ibWVQbGRwdTZENjQvc05LeGF1YVNNOUhWUXEzUXVm?=
 =?utf-8?B?TVRhcUlsaDl5bnlidXpOWVkySW90RjkwOXpoUGNxbU8xUnQ4emQ3eXUvanh1?=
 =?utf-8?B?UFduZk1WbmxtaGJZVHpKOE96bnNhTXkrSWpEZS9kWUd4TFZXNDdnV2lCbnU0?=
 =?utf-8?Q?wRhVlUZaqfKI3i9qW0qP3Ayd/9R2OQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGl3SW93U01jWjh5aklsNFlzZ0gvRS9SdFhVdFJxRXRhbk0zMnB0ODY0aGkz?=
 =?utf-8?B?RDBrd3B0YVZ4WmU1RUhISFNQdHBmODFRd3RMU1IxYUNvK3lHeEthQ0NWMDJs?=
 =?utf-8?B?eDVpUWhPcUFJMWdwbjVqbVdsTVNWZTFDa25QUVNkUTdXaGJ6MjJQSTRUMDlm?=
 =?utf-8?B?QXg0V29NYVQwbWxwY2dEVDVaMGVrZUNkU3c1dXRMT2JNR2ZzSGxUZHdnWmhK?=
 =?utf-8?B?RjJ1RU8wdHB5bjEvOHEzdVpqaDVzNXN5L2xFaVJhSzNWcGMrQ2YvRmdHZFJO?=
 =?utf-8?B?bHlnNFpGamVIdUppQUlpNEVMYzlwaWQyeC81SVpWQW9kNTB5aStBRXZ5QW1z?=
 =?utf-8?B?SHlheUd1M0dxVk96RmNCTXF4NHIxM2xyKzdJN3R6MnZVQVRBVWxKdStaRkpu?=
 =?utf-8?B?NjVSYytoczJ4eGVqMlRjR3owdlV2Uzh4bmRKM3RtV3ZncFNZbCtjaTJzUkov?=
 =?utf-8?B?bndMeVRkRGtXcjlhLyt5TDZYVEo1WmVHTmNsbVp5aGZsa3dxYkEwNXlSQkFP?=
 =?utf-8?B?RFBDSVlFOFRFVGphS1RIQWNtT2xERmRUT3BHYTVrUDVndE9uRHhZUmRDQjAz?=
 =?utf-8?B?L0RWTzhBWXYxM25jQWdXM05CdHZ4MFBjbEIrUFovMWQvbTJmQ1loZloyaDN1?=
 =?utf-8?B?eGNTOU9iSGhrVDExeVZYb0pkSUoxSmdWOEExWlo0N2l0SHFGMSsyWmJ4Vlc5?=
 =?utf-8?B?NnhYUnB5KzRRekRhbTlMWnBaVndhMVlVaVFyZDVTVWtXTDU2OVViRU9CbXhC?=
 =?utf-8?B?ajE5cUNGWmRtK0NRZXVSbXRGOWplS1lxV2dOUDNnWmR4Wll5cll6R245UVVn?=
 =?utf-8?B?QnpWSFBqY252ekxvTmRmWFh3cHN4NE8wNDYrY3ZwRU44UWhKSWdyNWJTZE1t?=
 =?utf-8?B?c2FVaU1UenlweXh6akk1eHdDdTFpMFJ1alhmRnl6eG5NUFNtR3F2TjE3V0ds?=
 =?utf-8?B?RVpabzBNUHkvQW1qM3I1cFdDWnJmOVdEcU0za2JBNi93d0dvcEhkd0dRRTUy?=
 =?utf-8?B?UW16bjlHU2ZJc08zTFh3eml2S2lHV1d2OFQyWHlZUk9iZG12ZTV5aWJUc3Mr?=
 =?utf-8?B?UlB3WXNjcTYvK3dtR09nWUJRNFRuN2FtMW90OUJCdnZmcmlDWGRaVTB4TnFm?=
 =?utf-8?B?K1pvc25QVTJkTFEvTGsrTmFKRHFLVlgyQVQ3djRUSHFSWWNjMUsvRUU5Y2kr?=
 =?utf-8?B?bjlqM2dBUVFFVDdHWnZ2WHE4ZGpiYW14eEhFek11dlRZSjZFZnJqclcvQlFh?=
 =?utf-8?B?SjBJMGo2TDB3QW9jM3hzWUZvWS96VFgxb2d1S2NKcm80TEZBVjJLMUhrcFpi?=
 =?utf-8?B?SldBWjUyWjVIcW5NTkNMUzJ5NDQ4WTlQaExRWmp4QTJ1T2JYQUE4OHdYUFRK?=
 =?utf-8?B?b0dUQzE2WmcwdlBjc2tXNmZBVTlnNW1oam1KcGMwREU5Q3hYQ2h0d003YmNW?=
 =?utf-8?B?b0pwaEkyMEhYUDljRFdLcDdDWmtCa2pwQ0tXRVZ3Z1d1eHBOTk9WYS9OelZa?=
 =?utf-8?B?TEdqaW1YbWlkbUszU09OKzF0ZTFyZXBpYjY0QWc0d3VUbzMwTDJwWE1UWnZo?=
 =?utf-8?B?RzVHczd6dUZTaGh3UFQvU3FxMVRsc0ZtakZDWWdhcFh1M2svbXRuUWNvb2sz?=
 =?utf-8?B?eW9xMWZrVVl3MWppc256T2szbm1QYWRJLzd4VmlVcm00RFhrcFh4b0tva1N5?=
 =?utf-8?B?VE9PSmlTaXloS01CaXRIM0JNa1NHWGx1Wk5xUmppWjVNTkhUOXk1ZmZmWE9X?=
 =?utf-8?B?OCtDb2xmcWRudmFLMDRkUXRTWWMxSnNnZWNtZ3dnb2FSZTVEbTlDMkxFeEVG?=
 =?utf-8?B?V0JsaXpkTUFwSDVhUExHZGJMU1N3L3FPVmF5OFRvOUZwV1ZIWUNkRjBmS3lO?=
 =?utf-8?B?MTZuMFdERWk5NU9yMnN0MFZyS0J3RFlDT0g2aTgyK25laDRWeVpMeU1scjc0?=
 =?utf-8?B?TXFNb0FheHJRU2FhRDNNSmp0VG1KWUJXQ3JWZ2k1REFoSWNrTS82aE0wOVZ0?=
 =?utf-8?B?UUVySDRmdHI2eXdIWTNkaFZPSFpVNzN5b2hiRTRrQzdBbTRkSUdIUkc1YXd4?=
 =?utf-8?B?akgxUzZ6eDkwWHFFd01odWRZNlBsUEFBL2FNUkY2cE5lNHRLZXVHSG12S2Zz?=
 =?utf-8?B?RXJmRWtTTzFtcWVtQlZKN3RiZ2NpV2FyelpjVGhxSWc2VzdJYzQzRXhEU3ZI?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <956E71C92EF55E4BBFE06C2A3664DEA2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eca9613-82d7-4346-e0bf-08ddb42123a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 19:47:38.1179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUeLYlvxwGQqUkUo6eTVjMYP7+kGZj1dA+k7Uljo/+TSzERDssH7vX+s852JquxUbTLtXx5qmCUuBDfFGwqYOLNjlbU2x3OoZImYXAo7csQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10803

DQpPbiAyMy8wNi8yMDI1IDExOjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIFN0ZWZhbm8g
YW5kIE9sZWtzaWksDQo+DQo+IExldCBtZSBzdGFydCB3aXRoIGEgYml0IG9mIHByb2Nlc3MuIFRo
aXMgaXMgZGlzY3Vzc2lvbiBpcyBnZXR0aW5nIA0KPiBmYWlybHkgZGlmZmljdWx0IHRvIGZvbGxv
dy4uLi7CoENhbiB5b3UgcGxlYXNlIHRyaW0gdW5yZWxldmFudCBiaXRzIA0KPiB3aGVuIHJlcGx5
aW5nPw0KPg0KPiBPbiAyMi8wNi8yMDI1IDIyOjU3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
DQo+PiBPbiBUaHUsIDE5IEp1biAyMDI1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+PiBP
biAxOC8wNi8yMDI1IDAzOjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IE9uIFRo
dSwgMTIgSnVuIDIwMjUsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4+Pj4gT24gMjMvMDUv
MjAyNSAyMzoxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+IE9uIE1vbiwgMTkg
TWF5IDIwMjUsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4+Pj4+PiBGcm9tOiBHcnlnb3Jp
aSBTdHJhc2hrbzxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+PiB0aGUgc2FtZSAoc21j
LWlkIGFuZCBzaG1lbSkgZm9yIGJvdGggdGhlIEJTUCBjYXNlIChubyBYZW4pIGFuZCB0aGUgWGVu
DQo+Pj4gY2FzZSAoRG9tMCBkb21haW4pLg0KPj4+DQo+Pj4gTWVhbndoaWxlLCB0aGUgWGVuIG1h
bmFnZW1lbnQgYWdlbnQncyBTQ01JIG5vZGUgYW5kIGNvbmZpZ3VyYXRpb24gYXJlDQo+Pj4gZXhw
ZWN0ZWQgdG8gYmUgcGxhY2VkIHVuZGVyIC9jaG9zZW4uDQo+Pj4NCj4+PiBUaGlzIGFwcHJvYWNo
IGVuc3VyZXMgdGhhdCB0aGUgSG9zdCBEVCByZW1haW5zIGFzIHVuY2hhbmdlZCBhcyANCj4+PiBw
b3NzaWJsZS4NCj4+DQo+PiBZZXMsIG15IG1haW4gcG9pbnQgaXMgdGhhdCBhbGwgdGhlIGRldmlj
ZSB0cmVlIGluZm9ybWF0aW9uLCBleGNlcHQgZm9yDQo+PiB3aGF0IGlzIHVuZGVyIC9jaG9zZW4s
IHNob3VsZCBiZSBsZWZ0IHVuY2hhbmdlZCBiZXR3ZWVuIHRoZSBCU1AgY2FzZSAobm8NCj4+IFhl
bikgYW5kIHRoZSBYZW4gY2FzZS4NCj4+DQo+PiBXZSBoYXZlIGZyZWVkb20gdG8gZGVjaWRlOg0K
Pj4gLSB0aGUgaW5mb3JtYXRpb24gd2UgcHV0IHVuZGVyIC9jaG9zZW4gYW5kIGhvdyB0byBpbnRl
cnByZXQgaXQNCj4+IC0gaG93IHRvIHVzZSB0aGUgaW5mb3JtYXRpb24gdW5kZXIgL2Zpcm13YXJl
L3NjbWkgd2hlbiBYZW4gaXMgcHJlc2VudA0KPj4NCj4+DQo+Pj4gQ3VycmVudGx5Og0KPj4+DQo+
Pj4gVGhlIEhvc3QgRFQgL2Zpcm13YXJlL3NjbWkgbm9kZSByZXF1aXJlcyBtb2RpZmljYXRpb24g
dG8gcG9pbnQgdG8gdGhlDQo+Pj4gWGVuIG1hbmFnZW1lbnQgYWdlbnQgYnkgY2hhbmdpbmcNCj4+
Pg0KPj4+IHRoZSBzbWMtaWQgYW5kIHNobWVtIHZhbHVlcy4NCj4+DQo+PiBJIGRvbid0IHRoaW5r
IHdlIHNob3VsZCByZXF1aXJlIGNoYW5nZXMgdG8gL2Zpcm13YXJlL3NjbWkgaW4gdGhlIGhvc3Qg
RFQNCj4+IHdoZW4gWGVuIGlzIHByZXNlbnQuDQo+Pg0KPj4gT2Z0ZW4sIHBlb3BsZSBkb24ndCBr
bm93IHdoZW4gb3IgaWYgWGVuIGlzIHByZXNlbnQgYXQgdGhlIHRpbWUgdGhlDQo+PiBEZXZpY2Ug
VHJlZSBpcyBnZW5lcmF0ZWQuIFNvIGl0IGlzIGJlc3QgdG8gYXZvaWQgbW9kaWZpY2F0aW9uIChv
dXRzaWRlDQo+PiBvZiAvY2hvc2VuKS4NCj4NCj4gSSBhbSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0
aGluZy4gQnV0IGl0IGxvb2tzIGxpa2UgVEYtQSByZXF1aXJlcyB0byANCj4gc3Vwb3J0IG11bHRp
LWFnZW50IHNvIFhlbiBjYW4gdXNlIGl0LiBBbSBJIGNvcnJlY3Q/DQo+DQo+IEZ1cnRoZXJtb3Jl
LCBJIGNhbid0IHRlbGwgd2h5IHRoZSBtdWx0aS1hZ2VudCBzdXBwb3J0IGlzIFhlbiBzcGVjaWZp
Yy4gDQo+IFN1cmVseSwgeW91IG1heSB3YW50IHNvbWV0aGluZyBzaW1pbGFyIHdpdGggb3RoZXIg
aHlwZXJ2aXNvcnM/IElmIG5vdCwgDQo+IHRoZW4gbXkgbmV4dCBxdWVzdGlvbiBpcyB3aHkgZG9l
cyBYZW4gbmVlZHMgdG8gZG8gdGhpbmdzIGRpZmZlcmVudGx5Pw0KPg0KPiBDaGVlcnMsDQo+DQoN
ClllcywgbXVsdGktYWdlbnQgc3VwcG9ydCBpcyByZXF1aXJlZCBpbiBURi1BIGZvciBYZW4sIGJ1
dCB0aGlzIGlzIG5vdCANCnNwZWNpZmljIHRvIFhlbi4NCg0KDQpUaGUgaW1wbGVtZW50YXRpb24g
aXMgYmFzZWQgb24gdGhlIHNjZW5hcmlvIGRlc2NyaWJlZCBpbiB0aGUgbGFzdCANCnBhcmFncmFw
aCBvZg0KDQpzZWN0aW9uIDQuMi4xIG9mIERFTjAwNTYgWzBdLg0KDQoNClRoZSBrZXkgcG9pbnRz
IGFyZSBhcyBmb2xsb3dzOg0KDQotIGEgVmlydHVhbCBNYWNoaW5lIChWTSkgc2VydmVzIGFzIGEg
bm9uLXRydXN0ZWQgYWdlbnQgaW4gdGhlDQoNCk5vbi1zZWN1cmUgU2VjdXJpdHkgc3RhdGUuDQoN
Ci0gYSBoeXBlcnZpc29yIGFjdHMgYXMgYSB0cnVzdGVkIGFnZW50IGluIHRoZSBOb24tc2VjdXJl
DQoNClNlY3VyaXR5IHN0YXRlLg0KDQotIHRoZSBoeXBlcnZpc29yIGNhbiBjb25maWd1cmUgZmlu
ZS1ncmFpbmVkIE5vbi1zZWN1cmUgcmVzb3VyY2UgYWNjZXNzIA0KcGVybWlzc2lvbnMgZm9yDQoN
ClZpcnR1YWwgTWFjaGluZXMuDQoNCi0gdGhlIGh5cGVydmlzb3Igc2V0cyByZXNvdXJjZSBhY2Nl
c3MgcGVybWlzc2lvbnMgZm9yIHRoZSBhZ2VudCANCmlkZW50aWZpZXIgYXNzb2NpYXRlZCB3aXRo
DQoNCnRoZSBjaGFubmVsIGFuZCBhc3NpZ25zIHRoZSBjaGFubmVsIHRvIHRoZSBWTS4NCg0KDQpU
aGVyZWZvcmUsIHdlIGNhbiBleHBlY3Qgb3RoZXIgaHlwZXJ2aXNvcnMgdG8gZm9sbG93IHRoaXMg
c3BlY2lmaWNhdGlvbi4NCg0KDQpbMF06IGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9jdW1l
bnRhdGlvbi9kZW4wMDU2L2xhdGVzdC8NCg0K

