Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88858AAB6CC
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 07:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976666.1363826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCBIf-0005sJ-9T; Tue, 06 May 2025 05:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976666.1363826; Tue, 06 May 2025 05:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCBIf-0005q6-6t; Tue, 06 May 2025 05:57:05 +0000
Received: by outflank-mailman (input) for mailman id 976666;
 Tue, 06 May 2025 05:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc8A=XW=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCBId-0005px-Sq
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 05:57:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:200a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edb0662c-2a3e-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 07:57:02 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 05:56:53 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 05:56:52 +0000
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
X-Inumbo-ID: edb0662c-2a3e-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUY/UTHb4nVEXSkyeDqEpuEGfSW06l+0kGqWquyWVeYELp5NUpHsK+XUJ5c427eXRvZ7NEQ1rFpU5K/ScIpvcjmjjFOavTt2ywNOqBDUfeZKKzbScW1zQGpYjTDlboAU8XF09XHZ3StFH5Bp6QTHZ5qnjYGTIwS3oPUuNet7QT8I76syvc5eiTh+GYDHbbXoiKoN0UfPOa5Nn8gydPnd0eAetspEryUjKAyUWXDbChZxRkZGlC4MtohtV7fyZ0o0VfYqAdtrXsDC0QXhBai8DqVn2cl5TnkIbjb1v7oXcMYhcaXigGMjy/ucS8WGPgZ/KCaoyTfX+4QCtB/+OVCVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUBl8Rnqs0qCWPJqYo6r4GSSt71kGKV1pI1VJVeKVAk=;
 b=e89YLewZcDoF1vSA32OgvxlES2NPAtyX3mpRqaW2WtzexOl4Ks61UO+mX1Y4tVoLNEJHbANLUtyj60wOqVLgny2knRxNKuZ8pb7x+qmGtb4FQj5LnupJlPo27+Vcqdgb06j2KEd/Pp5XDS8WLTM35iTqlIC6N/qFv/uVq5v2fYpF4rJa8rHbQ9kH9TjzwvkTKEMCpSetzPHigdQo4nQy3KfcoKBM6Ed1JdGLf4oeVL6A9SUZkD6bKfYXqStuonSaoDKmJV9HPhMbfRDZXcrkTOMcBB5iSQ3Vcggp3c4rZ9XeZ96ay57YN/ekjK7uQGUZ3/N2xBvqVqYLMtDGxGrqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBl8Rnqs0qCWPJqYo6r4GSSt71kGKV1pI1VJVeKVAk=;
 b=Z1dSsogAZwl4qLDpo079o8/sGwtzHzl37d4EOBLTTrwlq9Alu1+eTIFz2o1wrfV8Wxz7yVS4ezn4FQBnmiuYa/Is5SUA+LcmdKliwss2iYDXqkFkE2ZWzCFMXAjSKx4LZl5Dn9cVHnSs2UllEb8ij+meJTn5wO9gFq9mLFocdeA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Topic: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Index: AQHbrRCjQUXzVZg75kKZW3IeVU/v2LO5SzoAgAvud1A=
Date: Tue, 6 May 2025 05:56:52 +0000
Message-ID:
 <DM4PR12MB8451AEBC8D8D1A005A074D5EE1892@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
 <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
In-Reply-To: <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=45b0fe01-60a5-49de-bfe8-30ff36e8e4ae;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-06T05:56:44Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB7236:EE_
x-ms-office365-filtering-correlation-id: 9097dada-adc2-4c39-90eb-08dd8c62cc9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUk0ckxUcHJ4RnVPV1RaM285S29Wc1YrTTBPcUVKcVpDYkRwU2NIVzZUS3lP?=
 =?utf-8?B?dVZZNy9PR0EyQ3c5ZHFWbGdydkVzUFNoWG9WTGxuT1A5R1NOSlBRaW1WOGhF?=
 =?utf-8?B?dnBwTXlacURadjRUeWFZQng1R1RRaFhqNGFpZkpTc1VZc0VTSEdtTGhvQ0lV?=
 =?utf-8?B?S1FaNmJBOS9haDkrYWVPS2d3NTFXWCt4dzN6YVdNQ1o3SUVtVUhOMm9BWWw1?=
 =?utf-8?B?dGVwRWhUWXhkT3RaKzNhK0JmY01CbEpCdGRTQk5RTFJwaFZKNXNOUGVONHMz?=
 =?utf-8?B?dytjSFV2MTV4NVBFakpWT0xsanFWQzRESSttd3I0LzlOV3RiU1BaRWlpc1pF?=
 =?utf-8?B?Y09KcVVnVHBTY09oRzlINHg1a3hUWEIzSGIyQ0lvZ0krZFJxckJyY1hVNXpK?=
 =?utf-8?B?NW54V0JlRHFRYlVmeDYzRkszdVpiRTdPSmJwYmlNcmVVTUEzZ1h4ZE16MjF4?=
 =?utf-8?B?YTZFeXFFcE83TDZOWHdscFFKQjZYcUlMaE84ZWNOd0gweWl0dy90Ulp5NjNy?=
 =?utf-8?B?b1Z4a3RMQlZqc2gvMVJuck9xMEYvSHNTVUxlYm1UOEt2bUxTUksweGZFNXhu?=
 =?utf-8?B?WE55QjRPM1ROaEJKTEl6NGRlcENPSFhLSnhVelBMM2VCOCtlZ3Jjb2doamF4?=
 =?utf-8?B?Mk5HU0VVckxyMmJ4N3Ard0s0UFZoRG1rb3YyMTIxSENIa2dHYTg5c3IzWkUz?=
 =?utf-8?B?d1lLb3F4dk1BQitIZ0VtNjZ6aTFMVnlFcFFUS1dwR21zVWRnRk80aEsveFdr?=
 =?utf-8?B?ZXRtU01Nb3BMYlBTV21wQUZyY2NFTUlxeGZGMVQ1KytHQUJQbmRQa3d2UXJo?=
 =?utf-8?B?Yy9VUW9Sd0NxZ2d1dlNoekhaejYvdDVBL0kzQ2kvQk9CdjN3dXhFbVlsVlNH?=
 =?utf-8?B?bjRvRktSbnFPOGdManUzQ2tWbFV2WFB3SW1XbEgzeVB6aktHK3pyOFRVNC9w?=
 =?utf-8?B?bVY4NHAyQUQ5SkxaOVVUTFpXNGo0bmtlajdzV0NzU0RhR0RhT3FlZ2lEaDI4?=
 =?utf-8?B?dWFwa3YxdDZxYURoU1hTRnBDYXE1alduU2Q0TWs1OW5NTjZPV3oyOWNocENJ?=
 =?utf-8?B?cGlHTFc0MkRyWE11Q3Z6MS9JNUs0d3VsR1M1OFFjekNsazdJMVdpS2dXV2lp?=
 =?utf-8?B?WVZzc1FzazU2Wlh5aEw3YjNWakdLWHlacno3dFl2emF4R0NmVEhnSmZwSDIx?=
 =?utf-8?B?LzBVd1JQZVdqWVJIV1BEMUtQbi9iK2dHNWhXOGNwU2pHR3VBdjR4NTVYZm8x?=
 =?utf-8?B?Yy8vWVJicUE2SjlZTmtFcEhxNnhaSndYZmpxcHFNdVZWNXRKM0RXRWZyK2tR?=
 =?utf-8?B?Y3pyNkNVZHhTUmhtd1FOelJEbDV4dDR5QXVvU1dYcUc5dmtyS1pIdEE0ajBi?=
 =?utf-8?B?ZkovRTJwUnB4NlN3N0tBWWRBZ0VGdlhiNzlPYXMxOE9Hb2h0QS9RTTFEaWsz?=
 =?utf-8?B?eDZwS3JrLzNINmhhZXFlMGlQTlRiNGFpYUR1U1lOSXlQa3pvNXlJdGR6c2ow?=
 =?utf-8?B?ZXJCaW9wMXFBVmVtTVczQlRETi9DLzdPempHSWFlWTB0bVd6NjVYSHY4cUlO?=
 =?utf-8?B?VERzZFlhampZVzlKVXVPT3hOb1N3eFlNVnNHbWZaWlFpZFQxYW5QTVRxUVBL?=
 =?utf-8?B?Q20zenZtVnAycDU1ZWVKYnkxR0hIU21aUlpqVHFMMnB3YlhsU1hLMm9nVXhl?=
 =?utf-8?B?cWt1Mk9Ebmh1Mk0vVzYxM0NRc3YzTkFPblRqUGF1VFZwTGdqQUZHbUxadnZm?=
 =?utf-8?B?VHlRMHJUTXQ4cUo2UEIzeUNSbklITFB6TnlscDExbG1Wa1o5cXlYMnZnL2Iv?=
 =?utf-8?B?TEtmUTRaMFpCNU5BTjlQNnNWaWIvc1MzOXBNdDd0WXBSd3hvVmt0Ni93MGc5?=
 =?utf-8?B?K05lTFpyekZld2ZpbS9xTE9vVmw1Z3cwbU9pbm1weWhNVnprNG4vbG5waEhG?=
 =?utf-8?B?dU01SEF0dHd1ZVFIazZ5c2pKUCtsUVpCbzhVUVplYnFxWFdySDczYnA0Mm1O?=
 =?utf-8?Q?1KN0U9OeFEi2S3hTzr2Le4QRNlduDs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1NvbzZjenRIQVYxaDRQeEtSOXo1YVQyclovek82MCtNSUZBWDF3THZwaUFI?=
 =?utf-8?B?cUZLL21INVdLZ2RUUUJqa2xEL240SXJUY1VPYnVaR0x2TjJ0MzkyaFdKWTlJ?=
 =?utf-8?B?UlpackVZK0d5SHFDZHV0ZC84UGdsTGZlckkwQmYydEZ0Q2ErZ2tlSnY2cHVI?=
 =?utf-8?B?ZWdqZmlickFCN1IrZ2E4TDN0NFFXSlBiVXVLNDQ5WEVwdjM1M2pDTmQ0eSt0?=
 =?utf-8?B?aUtDK1c5MFBsT09GSzYrZXNYZFpnMEcrQmQ3bXJmOTF3NVZzTUhZcVp4N3ZP?=
 =?utf-8?B?WEhXRGE4SlJZTm9pczFiamZhNmJqNFlGczNtTGV0TDNDQ2lzL0VVMkVhaURE?=
 =?utf-8?B?eGx6aU01QnJlbVUwMjFSMGRWb1Y2WWF1WXlWOEtkTUxNYWwwN09iQzgvWEJo?=
 =?utf-8?B?MDFZWStvaEJTeFpTVklEN3BFMUVXTUhMNkpIYlVkRmZ1TDgyQWVlamhhNE5p?=
 =?utf-8?B?VENvYXdqNzNRaG5LZi9IOWZDNXRpM1gzUHZrb1BDNzl6dHRtZ2xTd3FlWkd3?=
 =?utf-8?B?SldwbGlVY20ycERHeUhac3BiWE5JL3VJdzZkMlFQL3dZdmVGeStpWnluUVY5?=
 =?utf-8?B?Q3FKMS9QTXN0VndvRG9tMWZ1aHpZNG90cmYrc3V4SnUyN2IwOVV2VklvNmQy?=
 =?utf-8?B?Mm53VmJuTGFYTWxwSFg4ejYxN2xNS1JzbXFUZ3RpcFg0d2JmUGx4UUkvNzht?=
 =?utf-8?B?RkYrWC85NU9lekpRb3AzZkxINDVJQ0l1K0YwUVMxTTJjZ1pZbVZPMGpsZ0c2?=
 =?utf-8?B?cUFCUzFUZi85UXhLMmlTTkd4bDBPVDBzNWZJcWU5amJDdThFek96WXBFcXpz?=
 =?utf-8?B?K3c5MFMxMHhxZU9GUEpXWnNRWWl5LzVrKzRuOC9ud0F0aDlwWVlGYlhaMG1k?=
 =?utf-8?B?RVUydHkwZGxaUXNCUExTUzRiWldIaGM1R2NGQlRSZkkraDRSTVl3TEFSTFlx?=
 =?utf-8?B?dUxsRmFsS0RMTWdEZkVZMFZzdHVRMGZidFI3OFpRRXdtMXUydEppT0JiRDdC?=
 =?utf-8?B?VU04L040M3U1eHVsM3IwL1Izc0UrNUY4N2YwN3J5Q29Kd1JtWEVjaTlremVN?=
 =?utf-8?B?VWkxT3EvRUF6OVpzbVZkQzJlVy8rS3RYZkYvam5BTW11QzduWmpsSjNuZjFi?=
 =?utf-8?B?WWpqelhKcng2TlJRUkVHQUJIc09OeEREYzNFWENwL3RyeUN2MGZsazh1cTR1?=
 =?utf-8?B?UmRDd0wwNEx6SHNRMzB6NVprU1R5ZGgyV0toZjIrTW9rdDF5dWQ0bEg4anE3?=
 =?utf-8?B?WnJtNmxqcmtobEx2UUV5YjI0UUlTM0lTZUY2dXRMT2FDNnJhZnM4eTVvYkla?=
 =?utf-8?B?emdHYytZa3Bhd0N5a05pZUNVTkRNcGlBcGQxRmVVVDZiK09Sa2ZoZGVWNDh2?=
 =?utf-8?B?dC9CS05mU3hQVndOeG5nckgrZGVmYVZCNzlXRlljWVMrd2x1R2dtR3kwUHZQ?=
 =?utf-8?B?TWpUUjBJVWM5SkpHR2Q4N3RMY0RMZlZienJ3cmdnYTU2MHRjT015UkhUZXdB?=
 =?utf-8?B?elBZejczS0p0a050SEJPZkxidG1VUVVTNHRVU3ZwamhrUlBTc3paSmxtQk55?=
 =?utf-8?B?SWtPMWpGVlVGWGtKQUV3MDZjUGxadkNINnNKQ0toRFZLK1FDNWNYQU9HRWRU?=
 =?utf-8?B?bHlpQm4xeEJoQ1R5cTdqcFlkbnVQcEdybWcwMUxUTHpKNm1QWmxlRFZjME1E?=
 =?utf-8?B?WDNTUXpCc3J6eXprZS8zc3dQVFlRWUFSVEI3VlorVlJRNVV0WE8wZWdrbEhu?=
 =?utf-8?B?N1d5aVY3Z3dNVUdVWVM3OUt5VjIvZ3hwUDhRdjFzaERqcmdicTRKdUtsSTcw?=
 =?utf-8?B?K21ZWkxjM3R3UXpQQ2h1bURSS1crc2JnV0ZaejBjNkpoRldIUDdWTm9vWkFr?=
 =?utf-8?B?aWJxdTBtQ2NDTlY1UjFHUExSa05XZEs5Rit5VUJEM1NaOU9kcDJHTm5XUDRr?=
 =?utf-8?B?YXVoZUJ4N3l1ZENCVlA2NU5HUHhuMnY2SDNjRWVvYy9jUnNoMERld1IxcXRV?=
 =?utf-8?B?aldlem1RWE1FdFU0Ry9mUmx6UllFTFZFWWg3QXJBWlVCYzRRUFJqUEptV05P?=
 =?utf-8?B?STVEWGlzcXJTSkkwSDZSc1ZCdXoxeDMyblY3NEhGUDN3S0wzMUhhcW9LOHJX?=
 =?utf-8?Q?uX8Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9097dada-adc2-4c39-90eb-08dd8c62cc9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 05:56:52.3764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CmLssPtb5iE8r57Ovf+SWqIrwIwgDI/MSbMneH0S5lRSLRi4pCnZEOlCeUjsEgGA3vvPYKxnX6dzDzt0Uq2Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI4
LCAyMDI1IDExOjMyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyDQo+IFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDIvMTVdIHhlbi9jcHVmcmVxOiBleHRyYWN0IF9QU0QgaW5mbyBmcm9tICJzdHJ1
Y3QNCj4geGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSINCj4NCj4gT24gMTQuMDQuMjAyNSAwOTo0
MCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3BsYXRm
b3JtLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvcGxhdGZvcm0uaA0KPiA+IEBAIC00
NDAsNiArNDQwLDExIEBAIHN0cnVjdCB4ZW5fcHNkX3BhY2thZ2Ugew0KPiA+ICAgICAgdWludDY0
X3QgbnVtX3Byb2Nlc3NvcnM7DQo+ID4gIH07DQo+ID4NCj4gPiArLyogQ29vcmRpbmF0aW9uIHR5
cGUgdmFsdWUgKi8NCj4gPiArI2RlZmluZSBYRU5fQ1BVUEVSRl9TSEFSRURfVFlQRV9IVyAgIDEg
LyogSFcgZG9lcyBuZWVkZWQNCj4gY29vcmRpbmF0aW9uICovDQo+ID4gKyNkZWZpbmUgWEVOX0NQ
VVBFUkZfU0hBUkVEX1RZUEVfQUxMICAyIC8qIEFsbCBkZXBlbmRlbnQgQ1BVcw0KPiBzaG91bGQN
Cj4gPiArc2V0IGZyZXEgKi8gI2RlZmluZSBYRU5fQ1BVUEVSRl9TSEFSRURfVFlQRV9BTlkgIDMg
LyogRnJlcSBjYW4gYmUNCj4gc2V0DQo+ID4gK2Zyb20gYW55IGRlcGVuZGVudCBDUFUgKi8NCj4g
PiArDQo+ID4gIHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlIHsNCj4gPiAgICAgIHVp
bnQzMl90IGZsYWdzOyAgICAgLyogZmxhZyBmb3IgUHggc3ViIGluZm8gdHlwZSAqLw0KPiA+ICAg
ICAgdWludDMyX3QgcGxhdGZvcm1fbGltaXQ7ICAvKiBQbGF0Zm9ybSBsaW1pdGF0aW9uIG9uIGZy
ZXEgdXNhZ2UgKi8NCj4gPiBAQCAtNDQ5LDEwICs0NTQsNyBAQCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nv
cl9wZXJmb3JtYW5jZSB7DQo+ID4gICAgICBYRU5fR1VFU1RfSEFORExFKHhlbl9wcm9jZXNzb3Jf
cHhfdCkgc3RhdGVzOw0KPiA+ICAgICAgc3RydWN0IHhlbl9wc2RfcGFja2FnZSBkb21haW5faW5m
bzsNCj4gPiAgICAgIC8qIENvb3JkaW5hdGlvbiB0eXBlIG9mIHRoaXMgcHJvY2Vzc29yICovDQo+
ID4gLSNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVEX1RZUEVfSFcgICAxIC8qIEhXIGRvZXMgbmVl
ZGVkDQo+IGNvb3JkaW5hdGlvbiAqLw0KPiA+IC0jZGVmaW5lIFhFTl9DUFVQRVJGX1NIQVJFRF9U
WVBFX0FMTCAgMiAvKiBBbGwgZGVwZW5kZW50IENQVXMNCj4gc2hvdWxkDQo+ID4gc2V0IGZyZXEg
Ki8gLSNkZWZpbmUgWEVOX0NQVVBFUkZfU0hBUkVEX1RZUEVfQU5ZICAzIC8qIEZyZXEgY2FuIGJl
IHNldA0KPiBmcm9tIGFueSBkZXBlbmRlbnQgQ1BVICovDQo+ID4gLSAgICB1aW50MzJfdCBzaGFy
ZWRfdHlwZTsNCj4gPiArICAgIHVpbnQzMl90IHNoYXJlZF90eXBlOyAvKiBYRU5fQ1BVUEVSRl9T
SEFSRURfVFlQRV94eHggKi8NCj4gPiAgfTsNCj4gPiAgdHlwZWRlZiBzdHJ1Y3QgeGVuX3Byb2Nl
c3Nvcl9wZXJmb3JtYW5jZSB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3Q7DQo+ID4gREVGSU5F
X1hFTl9HVUVTVF9IQU5ETEUoeGVuX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZV90KTsNCj4NCj4gV2hh
dCdzIHRoaXMgbW92ZW1lbnQgYWJvdXQ/IEluIHRoZSBwdWJsaWMgaW50ZXJmYWNlIG5vdGhpbmcg
Y2hhbmdlcz8NCj4NCg0KQXMgd2Ugd2lsbCBoYXZlIHNoYXJlZCB0eXBlIGluICJzdHJ1Y3QgeGVu
X3Byb2Nlc3Nvcl9jcHBjIiB0b28sIG1heWJlIHRoZSBkZWZpbml0aW9uIHdvdWxkIGxpa2UgdG8g
bGl2ZQ0KYXQgbW9yZSBjb21tb24gcGxhY2UsIHRoZW4gaXQgY291bGQgYmUgc2hhcmVkPw0KTGl2
aW5nIGluc2lkZSAic3RydWN0IHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2UiIGxvb2tzIGxpa2Ug
aW50ZXJuYWwgdmFsdWVzIGZvciBpbnRlcm5hbCBmaWVsZC4NCklmIGl0IGJyZWFrcyB0aGUgcHVi
bGljIGludGVyZmFjZSBzb21lIHdheSwgSSdsbCBjaGFuZ2UgaXQgYmFjayBhbmQgZHVwbGljYXRl
IHRoZSBkZWZpbml0aW9uIGluICJzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjIiB0b28NCg0KPiBK
YW4NCg==

