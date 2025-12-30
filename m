Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A507DCEA7B3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 19:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194452.1512879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaeYT-0000Nx-33; Tue, 30 Dec 2025 18:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194452.1512879; Tue, 30 Dec 2025 18:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaeYS-0000KX-Vq; Tue, 30 Dec 2025 18:34:48 +0000
Received: by outflank-mailman (input) for mailman id 1194452;
 Tue, 30 Dec 2025 18:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jMxH=7E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vaeYR-0000KR-3F
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 18:34:47 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 358baef5-e5ae-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 19:34:44 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6334.namprd03.prod.outlook.com (2603:10b6:510:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 18:34:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 18:34:40 +0000
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
X-Inumbo-ID: 358baef5-e5ae-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwncIQ0II8rXNestI4op2tdgidrm2+7z000bJCECSxNdBJX4jsTpaxiY5MnZI6lGXMGjWq+wOEKG2/Y8RXlGlm1nqiDWvuZNdk1If/mzV+H1oSfc8XeG/7FQvYZYG19GGNi+fjcdiWMOYBl5k6HdOuZ/2N2kFmV4+t5EDnMGkunZKtys4ioEFxrFctUlNSk4CxU7PF0vUBEXRxN5obSDisftDYnKvIyl9zPUcVFa+l1snG1W/yEfQm1CL3GMBjEXwUnL1RgGtr0f/jpajJen98JJOlLFtAezl40kjADCe9lcEr9pLx/EXwe18CGxH7XnQQnrsmA6vi/Jm9KR1wk48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zum6t0ZxTIiMX+9dFGcYgY+OxR75MgTnLxZOCThGZFM=;
 b=Sf3PYi3AJwOxWoas4MRpP40u/55MV1ANO0HPZJvKmIIBbh9LEwSQ5rGRYgh1j4FrXSOUBb8wLH55SMgZ5hclAez0egVkYHz+F0zX11kTex2Dd0M4y2xpKB70GEeNFlCdo+gNtF30GrZvitP50r576IULCG0qEFT1ZDCbFZh8RuOStXW2D5xCBfaHXMJzZv1qzPnKe91eZkdSoP5rywYVWAcAodVFhHLv27F5rE+27ciL5ao/Hl3RKqTTzx9JU0D9z8kDXZ0rwEWhOka1+w4M1KTNwkwvd7S6kzXKBX6pXsocIAQnHMYMImv2p9ZIHVMIAnHfqeJfoQEhGnmcgvhKkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zum6t0ZxTIiMX+9dFGcYgY+OxR75MgTnLxZOCThGZFM=;
 b=f7TNQt/gOFtjVcL/xym0+CG7nfjo7tQAH2ZaMKsTn8frGr2oTb425FtIOOeiPjhnvjb3aHpdxRJfqs7t74xvuLLRdNl4wgvoY6s5FmAgGuIrUJRF6XMRbJB5Qrya8D6q7F8R7Q8qoyugWI6srwUP9bdbRAfg3MCWRAFWyRRszxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4da8ee06-5c67-46d6-a83c-90729ff9a1ec@citrix.com>
Date: Tue, 30 Dec 2025 18:34:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: Misra R17.1 in Xen
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <191589a4-cb8c-4e92-866e-03d9a194db5f@citrix.com>
 <d87f8fc638192656fa2a44eb9eff7801@bugseng.com>
 <6d065af376df5527dc6a8f0a47054d85@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6d065af376df5527dc6a8f0a47054d85@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: c5eb0904-ebd9-4c44-3396-08de47d21806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVVCRUQrMHRhUSs3Z0RPcmVWMERDd3EySE50dFlrYlR4VHA3ZW13SlJ0WkFP?=
 =?utf-8?B?TVhKdDJqakV3eXZpdU14OUsvVWMvRzBBb09BTU1ZUkc3eHNiNEx0NWFlU2FU?=
 =?utf-8?B?a0dVNTdFM3ozb3BMbnZBQnlobXBvRUxCZ3cybGFXU1E3alBNZWZTdzFkeDRP?=
 =?utf-8?B?RkJLUC8wcXpoQXF3bHRnOWZzSmxrOTVJUExCRnEvKzVPN2Z0UWdibS9LZHV0?=
 =?utf-8?B?eEttQUVkL2cyMjVLSmJCYmVwZWh0Q1ZZSWlvTnpoekR4a0kwTDYzNXFxMnJE?=
 =?utf-8?B?UVZzSllCRU90dk0wRHRIeDlOTlh3bkY5VWlhQmh4R3Z4UlkvaWoxV2dMYmVm?=
 =?utf-8?B?VTRHZ3VobGo2RkRsck9NYnR2b3ZVc2ZtK2tUM2s0ZzhBL2tvY3JxTEU5UWVC?=
 =?utf-8?B?SnRUd0k0VU5JNU5GZ1VpWTdLdlFpNFlHVFMwN0l2ZW9EY21CWXNVTUozeitG?=
 =?utf-8?B?cVBTOFdGazlKNGpsbGcyM2ZoZmdqU25tL1N6bVdKd0Q1d0N1WEtSTXhZK20r?=
 =?utf-8?B?Y09OZDIraytLR3lwUFFhWGIrWmNDQTJnclozTXY5VnRZdE1Wbi9TUkNFWEVF?=
 =?utf-8?B?US9qd1kxMjBmU1l6Qms0ZEJ3cDF6RVZWUjJTNFFMa3hBbVBNTGhqQ1lYNFVS?=
 =?utf-8?B?NzVFMjJpR2wrRmp6Tm5RQ3oxcmJIZGVrV1dmbHZ4N3pCSG1CSVdUREtodjQ4?=
 =?utf-8?B?SExUZ0Joc05BakkyRDJxZ1Jaa2lXZTd5TEZJVlR5QTIzNUE5TWdSMVhaVDJV?=
 =?utf-8?B?NHhoaUpHN1hQWk1yU1FFQVM0RC80NWFJbnorblN5WXovSW02WnprRldMZUtJ?=
 =?utf-8?B?Z1M2U1ZNVnB6UEsxSU85QjhnL2JmVmk5b3p5Y3FJUVZQM2xMc3hqSDVDMVlL?=
 =?utf-8?B?eEhmZEEyWEdNSWI3Q2Z4dmdkQThqR3RKTmU3eTNUbWx3VHNXRWVKMEo3YlQ3?=
 =?utf-8?B?S1I3OTFWTEJ0Sjk3eDhTWEdHZWd6NWZNQ3FnU1M0dXpFVWs5bnRtc3F1ak1i?=
 =?utf-8?B?T3hZSkdHNHY0bDByTFBzWGtqSHVFdllFU3JGY1JoQWZscW05K0ljWXpVNmhp?=
 =?utf-8?B?Vm9kMGlPNHNYZlpFaTMzbHhGS2Fuc0ZQQWY0MmtFVjJiM3diRG5pbTV0c3hl?=
 =?utf-8?B?Yk5sY241QjZPSlZwcERndzhzN0w4TWJFQmJwTThYeU4rWlE3RlhYRGpidzdv?=
 =?utf-8?B?M2lnclIxT2hnMjhEdndBZzlPc2tHRDIybGJnazZlTzgrVitwbnMxa1liUnE3?=
 =?utf-8?B?cTJsWTFrSU9YbDdOdmEzZ010TjhmR0t4NnUxVGpPT01GU2Y2SlU2Wi9zcy9s?=
 =?utf-8?B?WFdVcmhQaU5OZjNuamtlbnJiS25rTVRqMmVzc0lLSmRvMk5vRUx6ZEg5VGdO?=
 =?utf-8?B?YWdSZjFZZjl4aVdVTk0zU0lqenRralp4ZjdDa0tzRHhka1FzcjZ6TUIvTlZJ?=
 =?utf-8?B?M3RFN0tmZGRHbWFNcmZ6ZWtXSy9sOUFqVHk3NnN5S1N2VHNmdkJNb0dDb2xk?=
 =?utf-8?B?Y3hGUU9LMDF3TjRBSlM0ZmxEalFVdlZuTEtsUU1ISVBIWS9KK3RKQkUrL2Yx?=
 =?utf-8?B?TjNpRkIzOXVKWHZONnYyRlV0dXVmUTZUZm9OdytBQzR1OVRRRlhyZUNVRkZJ?=
 =?utf-8?B?NE0va3pPWW80SUNRRFdnUVd4RGROa3AvTnBleXA0eFlJNXdUZTltY0tWenlV?=
 =?utf-8?B?NUFqanpMSlUwTDIvekFZYzg5bTRXSGdNTXlBTmJoZzBGNU1pSGo1R2M3RGgr?=
 =?utf-8?B?Y1BNS3ZwOGdLazJRWlkzWG4zOG5rL2M1OUxCcTRWOVZwaGVQYmgzVjRLamdF?=
 =?utf-8?B?cWNhSE8zSEVDUkNvUmg2S2U4M2hEeE4xOWdCUWN0cWt2d0V2bzlxSUJtWUlo?=
 =?utf-8?B?bFZWZnJyMUhENE92NldvaytJM05PTEp1YmVXZktTWEVMK0NVSHdjWFpGSEtT?=
 =?utf-8?Q?UjVe5Td2OmvYcgY6Cf++jKq99bJXwJlu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDdqZjFsaWlwcXFJL2tzbEY1bmJqUERTRzZnVXQ5T0l6V3lDR2VyRHdnUDVN?=
 =?utf-8?B?VVNCRzhoZEpXcU55U24yUzJ6Umgxc3daL3l4czBtSEErMVgrN2o2ZXJDbDNI?=
 =?utf-8?B?elVwME9MaURCSHB3L2tiM3VpZW1KVmRLVFY5WmxJbkVVeStrUDR5blpGeDZt?=
 =?utf-8?B?d3B0SWwyOW1mTDQ0RFpoNGNVS0ZRbkRaUUxzbktKN09WNWlRWjFYWTZVcGFH?=
 =?utf-8?B?aFh3bFNEdzFMeXkzTTkxTnQwV0k0ZG0zMDRhL2hxL2VkWmFVU1pRZStTb25X?=
 =?utf-8?B?ZnRpSWp4dnlrYTZ4dStsUDJvdHltemphTVh4ODZ6bDY2NWNvV1pCVDhBWGVI?=
 =?utf-8?B?ZjNGOWxKTVBhdTg3NFB3eDVVRXVlWHp0S29lNG9ZdDJiaXNtMXNVdkxnSG9x?=
 =?utf-8?B?cXorQzRMV2NOQ2R4Qmw5d2FmVkdSQXJtZ3FXajVtaUxXWFE3N29RKzVrTUU1?=
 =?utf-8?B?OFJlNXpLWU11cXFFL2RHSGdXa2NsdzJKQXR6ODNMY2U1MEVvUk50QTJKcW9y?=
 =?utf-8?B?aDRuZWVIYml5aXZETGljN2doUjcvZ09yR1dKOHVlMVBCRzVSUGU4NEJydW1O?=
 =?utf-8?B?TGd6TXFVOVBraWFWUHZFbldxOWtRRjZqK2VZS2RUV0Q3T1FWeWZZT2laRDM4?=
 =?utf-8?B?NFRJTVBFVjNsR0U1YUdvUkRwNU5LZVBIQTFNT2dIZGpHRnV4VHBuL3A2TnBR?=
 =?utf-8?B?OGs0NnhaTmVwUXFXdFRCcVh4YVhGUUJIQjRQNUt2RTBkZVY2MnRKU29rNGhO?=
 =?utf-8?B?bTNVamRIZHZOWmJ0MmFNck85UHBqOGpqKzBTZkJEMmtzN0E4QUdqUjlUTjM1?=
 =?utf-8?B?b01DQllRZVArTmN1NFRGVFNuZG5RazBYRlliSjNZSEpVQkZOcmtkeU5zcjBs?=
 =?utf-8?B?ZW4xcXdCRjNFWmRTS2RYS1o5TGEzYVRSNWxmYlBVb3pueUxDblVqcThUOXNS?=
 =?utf-8?B?ZFArR1RacGlNM1ovWm5oRkhRZzFaei92UWVOYzhlMWk3RHZ5V2QvYkdVVmw3?=
 =?utf-8?B?Q1E1d3NFRWxXM3Q0dXpHOVVxM0thYUZ1ZjdwMFozUjNpQ0Y3cmtLWVEva2Qz?=
 =?utf-8?B?dDR4S0c4dllxMVo1T1BselN4UE91VVFoQTFtVHhjRjRGalJLc0FaaTMwU0px?=
 =?utf-8?B?dzl4YjlCbnQ5Q2o3a2pvYVp3MG5LRVhsQVhvZ1RUNU9KYnB4dFJuQ2dHTk0x?=
 =?utf-8?B?bW9PNWhzbitpbUpObC9rd05oZE40TXBTT3ZMbkNSMHB6cVFBUTB6Vzc5R092?=
 =?utf-8?B?NzM1MDRwVURRUTNQRjcyS2JvRkgxMHNLZVZ2S3JNWkJDK25sS09KaDBsbUJm?=
 =?utf-8?B?bkNaWDYyNWlYNVA4Sm5zelRWdG9NdUxleWNwNnI2RzFHaG5uc2RjcFhiNXVJ?=
 =?utf-8?B?dHlPTW9wa2NFbC9XMVU1ZjVtV1JaQ1pHakN1dVZFdDJNZXY4d2RKajVlMHhL?=
 =?utf-8?B?cmJ5eGFaSTBqV1NCT2w4NWRteGxFK1FtVS9OT3VZMU1VWTZjeUdjV2JvL0Jo?=
 =?utf-8?B?UXRISUN5aEpwVmFqUXo5VGcyK0JlcHZKc25mOTVOdTJLQXYvZTA2d3ArSzMr?=
 =?utf-8?B?c2JJanp1QzhMT3JReUdid1c2YThpSDlnMFFsY3RWT2FPU0FrTHBWR2JYNlRp?=
 =?utf-8?B?UkhPdzgvUS9OaUVaeEVyaUJWY2pSczdrRGQwYmxKeFMrM2MrU3hQU1Fsc2h1?=
 =?utf-8?B?clRQWW5ac1plRUpxQk5XSnVKeVhWS0RXOURpc3crSE9nQ29weU5PU2ErY3lm?=
 =?utf-8?B?dVpoZEhpOGZpMFZETitYRHllU2dRUWlNeDJmL0svNHF1RnBtb1c5UHpSNDFm?=
 =?utf-8?B?MnA2TDFvbllXcUNhNFVndDA3TnRIY1FDM2tEYkl4OTBoM0t0Z2pmTHIrRFRJ?=
 =?utf-8?B?U1ZtTGp0S1dSTUNkM2V4czFvZFo0VW5aVmQ5bFNzTHN2Wk9Tbzl4K2Q0TEtG?=
 =?utf-8?B?VXk5R1QwWlBNRjFIZnkzODk5dEhCTW9OeWt6cm5YbW12eXhOMHpMWGxZRHEr?=
 =?utf-8?B?K3JTM0RvYXVQRDJHWkVXenFOcldtRURkRVBjOXRiYUpyeTk2Z0VCcHEzS2lk?=
 =?utf-8?B?Rzl4UUtRQ1lUaXNuaEw1YnlvaG56NW5BQmp0SVIzRy96dHQ3VXVHcnJqQVRN?=
 =?utf-8?B?aTIrTzlBdmcyeDQ0MWkzQ3JaS1gxQ1dlMmJUOWdyMVFic1p3QWh6RjhkQUk0?=
 =?utf-8?B?VXEvU0V5a1pvd3RvZ3JweTlLQ1ZRck83QmNpSGhqMGowdlg3YVRWbjNwZWNr?=
 =?utf-8?B?WXZqMktMNktJM3QwNGd2SmZOZHA3dTEvZytxZmRnZmJMTjR6alc0WitreFVU?=
 =?utf-8?B?NU5wQTh1YjdDUXJWYVp5ZWh4YkxNQnZTdGRVVWVkamgzbDlDaEMrMWtlNnFL?=
 =?utf-8?Q?G5MF1NpQDYBp1Ehg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eb0904-ebd9-4c44-3396-08de47d21806
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 18:34:40.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DAFTb6u7QZyfelBMZIT/BteypnueNepxt09FghFTakReyeQNuODqW89SeHLIUABdgkHxF6ZC//IFygbaGuR0rG8wZi3Fhv9K0ewhiYUNgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6334

On 30/12/2025 6:28 pm, Nicola Vetrini wrote:
> On 2025-12-30 18:34, Nicola Vetrini wrote:
>> On 2025-12-30 18:05, Andrew Cooper wrote:
>>> Hello,
>>>
>>> The x86_64-allcode run highlights one new violation of R17.1,
>>> vmcoreinfo_append_str().  In writing this email, I've found another in
>>> debugtrace_printk() meaning that we're missing some options in the
>>> -allcode configuration.
>>>
>>> In deviations.ecl we have:
>>>
>>> -doc_begin="printf()-like functions are allowed to use the variadic
>>> features provided by stdarg.h."
>>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
>>>
>>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
>>>
>>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>>
>>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>>
>>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>>>
>>> -config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>>> -doc_end
>>>
>>>
>>> First, we have no printf() so that row should be removed.
>>>
>>
>> I think it was for other variants of printf that are present in Xen
>> (e.g. vsnprintf). Perhaps it could be restricted a bit to be more
>> explicit.
>>
>>> But, more importantly this is safe if and only if the function
>>> declaration uses __attribute__((__format__(printf, ...))) to cause the
>>> compiler to perform format typechecking.
>>>
>>> Is it possible to encode this attribute requirement in the Eclair
>>> expression, so that e.g. accidentally dropping the attribute causes a
>>> violation to be reported?  This would also be rather safer than
>>> assuming
>>> that any prefix on printk() is safe.
>>>
>>
>> Well, the UBs associated to that rule (to varargs in general) go
>> beyond the formatting issues, but checking that the function decl has
>> the attribute is a good suggestion to harden these deviations. I'll
>> make some experiments and report back on this thread.
>
> Currently it is possible to match on the presence of the attribute
> "format", not on its arguments. Since "printf" is the only archetype
> used with "format" I don't think this is a big issue currently, but
> I'll let you be the judge on that.

There's scanf as the other option to format, but I suppose for the
specifics of a deviation for va_list, not being able to
match/distinguish format from scanf is fine.

~Andrew

