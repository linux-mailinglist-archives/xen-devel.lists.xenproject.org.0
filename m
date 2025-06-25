Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113DAE7DE2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024573.1400401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMjI-00048c-Dz; Wed, 25 Jun 2025 09:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024573.1400401; Wed, 25 Jun 2025 09:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMjI-00045k-AP; Wed, 25 Jun 2025 09:47:44 +0000
Received: by outflank-mailman (input) for mailman id 1024573;
 Wed, 25 Jun 2025 09:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEPZ=ZI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUMjG-00045e-3u
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:47:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dc682d6-51a9-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 11:47:39 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS4PR12MB9771.namprd12.prod.outlook.com (2603:10b6:8:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 09:47:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 09:47:33 +0000
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
X-Inumbo-ID: 6dc682d6-51a9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qG1u5Dm0/BbUuBMzfotPeTpl0+fjZ17OsmcTIHW9HvC/tb53nD4qU0z4TAbdlSJavjOiPtIrZVhjh3+DRdKPYmVTGlmBWwMGTuMdH3T0wo95iPWRSaXEnRL8OJ7X8jTtMMPQNc6ceqFMy3L5u2CVcwq5PvOGFbDdOZoyi1V07WYK0qXG+FogcNegXnjhG0i8eN6kTX9mjtdceDGp8JmIUjmOvwTP9MFye3nHfk7Qzrjx4/HF2AxGTfCNnZ0ajGTbIoh0e/RLkeKI/Iiuz6hjZy81/PPoeFqX29Rqx9GgJhTLFJKqCxJ/jOB6TeVDm2eQcORkJMTPIoW5wMWkxL5eQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CprJL6e30ubqpLtgzxrXcJF5KCl+aapxkW/fPW/kgtg=;
 b=MVhqiNjyM7F/TQEz0RPoDmgjG925F5wRPzhV/BQK4Um7CXm5C2zgBtey3Kl1vzi58My6aaHBx5g/lAxh9TJ1+bBiSi6j+uNhZQRR6tlZ0WeNRx2vwfRJnu2kyvwrvt2Ks9aIept/1SEsHi3v8i84ULesR/Tyf3Kkh87uCVXZOr8PqCUrHn6rjY44ERmnUU5UyhJJe34MzjWAeks9iDF0K8iKyH2FnLhbB8Bmd0YpKc4WxaMsb9loP+i3SZdCEyf0aYXSV9TLjGcRlDTEZ6w8Rg3VqLRGORhKAbaggmpjXYd7yzJ1rQEAR5u5k4bYdRAx1TR36PYyMUAl+I6Gg0elrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CprJL6e30ubqpLtgzxrXcJF5KCl+aapxkW/fPW/kgtg=;
 b=00PV7O4a2KBauLT+ppubfTkBTYFJM7T6pdG0xeKOJa7ec837i+j4W9Rx5/tIbgtqW6/O5LEbGFcMMvxLNFZk/4f41oVP2CPCvwfanafW/P7yUBObrXBIsv90Y2KSO1wLBcIrraVrlPI9QD6cwbdBMhAvDJI2PDlX/zS1uFStUOU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index:
 AQHb23yeMT8YFCMR3kaLDqQP1+DTK7QJCD4AgAme+gD//4QlAIAB4iSA//+e0YCAAIz0gA==
Date: Wed, 25 Jun 2025 09:47:33 +0000
Message-ID:
 <BL1PR12MB58491B943176F970AA61F310E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
 <773c448a-d814-458f-ad83-e9740e724408@suse.com>
 <BL1PR12MB584989B1F9DF290C15CD2F9EE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c9cdbb69-4b68-4b77-bcca-feacc800e3d6@suse.com>
 <BL1PR12MB58499585BA47004587A34C93E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f03f33a9-4073-4a28-9c33-884baa098e29@suse.com>
In-Reply-To: <f03f33a9-4073-4a28-9c33-884baa098e29@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS4PR12MB9771:EE_
x-ms-office365-filtering-correlation-id: aa544dfc-aad5-4eb5-da3d-08ddb3cd4f50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VE9Td1Z1L0lUWDV5NjQwazNHUVZVdnZTV2lUR3Myd1F4NHNXcnZQQXNNT2d6?=
 =?utf-8?B?VkpKWVFEdWVqbUc1Z2prNG9PcFgvTUJpU3hwejd0aEJzRCttamN3R1RYQjdk?=
 =?utf-8?B?T3BlS0FVTU5rbUR6U3RkREhBRm5jK1hrVisvaGI2aERCUGxRaGFLZllLQ1Jt?=
 =?utf-8?B?NDB0THl5UVV6ajM4NnlRcFJwNlVneHZkQm5UVTJUTmlTUmcycEs4NjdRZXlz?=
 =?utf-8?B?eDF6bDJ3TG1VL2hZbU4rZkdYOVFkV25RQmlmd1pQYWRmVzZYVnlkS2RNbkt6?=
 =?utf-8?B?UTdicVlzY1VreE9RN2d3RC8zVS9mUkY1OEI3ZjNYR0ppODU0aWo5SWNnZFVx?=
 =?utf-8?B?blNRaCtRai9lTU5qbGpsQ2U1NXNmMXRodWJLSnprWXMxZFNZMnV2dVYvRlI0?=
 =?utf-8?B?S1JadXlQTDczUjRNbkZaOXdYSnRJS3J6bGJlVXdIZEhLVkhGSnNHTFpMYU0y?=
 =?utf-8?B?K20waWc3MnpubFRTTXhRL04zcTV6bHEyZ3RVNFFSM25wS0J4MVpoNS8rOWxF?=
 =?utf-8?B?c1YvaDdadVJ0UGtJcDVvN0VJRHRRODlrZTZMNnhSSG9NbXlHVTNZMGFSNU9m?=
 =?utf-8?B?ZytJUHJuMkxFazNVbW9pdk1IRFdIZm5LU2dEcVkyckE3TVViYVVhSmtFbHFh?=
 =?utf-8?B?RXhLNUtmZ012aFFEK2s1aEpUb2N2STZBMXl1MXFlY1ZKbTdoQmpJOHprWDQ0?=
 =?utf-8?B?MVZ1Q0piSU00dUJRMWowL1B0Sy91NngvTjZ4MFRFUElYTmhuVTdCa3JqUWRV?=
 =?utf-8?B?ZEVxVmZkZThCWlNvRDhLRDNVbGdpZ1l1NWlnK3prQURBMGxlR1JDYW45MWZU?=
 =?utf-8?B?ZjB6UWduUjZkek5rdHNmUXA2MGY4NVFWcFVZY1B4emRqZ3RnOHZZVDFuYnNN?=
 =?utf-8?B?UDh2b2dPVkJsUXlmUVlReFlUTml4U0dpUm5RaUVjemVaYlBZY0wxYW5jeDlu?=
 =?utf-8?B?YzZuOWxtZ1RkOTNvMVdJV1lHRUNhd3VwZ2V2Q2FweFArWjlpK3pzRGMxK0Zk?=
 =?utf-8?B?NkZGdmx1V2lIeWNsWjdwalo1YlVyR0pnZGwxano0R2NoQW52L3p0M09jamo2?=
 =?utf-8?B?WnNpTGlNR1J4UHdYS2pLS3JMejRMRW5OVndpc3RULzQwZVczN01JcnNOdG4w?=
 =?utf-8?B?N25IREJiR1FXWjB4ZGRsSW1aaVc4cC9zd1lENmxsN1RBUVdqcXI1bTk5YlFS?=
 =?utf-8?B?dmpDd3NuTmNTTDRYMGNoOXZVdmRDdGdJQ0VHN3JVYzFCWmRnMUVBV29ZdStq?=
 =?utf-8?B?UjZEVmtXRElQMTNMTy9DdDhlWVl4Qjhza2VuM0wyZmJ1dVU4Ym5iRmE3QWl0?=
 =?utf-8?B?UzBkaXFDY2lHcFJ4bmsvdVNNN0k2aDhQWDBwbHE5TW9leDdYbFcrcjVRZ1Zs?=
 =?utf-8?B?dlI2MDZqeFpobGh0Ukl5TUlKNm9qZE5SVDdJTDdXMXdJSWNuaCtWVk5TZmdZ?=
 =?utf-8?B?anp4T3BjYVE3a1pMQXBJT20rQjZveHh4K051WXB5SEVxWFpUa2JndFNmVnB2?=
 =?utf-8?B?M01pRVdlZDA2Qkw3R3JKdEI4ZTdVMlBqU2FMZmRPdTVsemp4V2NUZWdMQkFv?=
 =?utf-8?B?clpURW5Tb2U0N3RuaExyNTdIeXFlRnNPMU4yVG8wSEhadkd5dEIrU2tDZTFJ?=
 =?utf-8?B?eHl0VjJ1U2ZvOUU2Y0ZzSmFoNTVPT3FPS0x4bytGVytsZTl6SldnVzFCVWt6?=
 =?utf-8?B?cE83cEFyQjA4ZlFFS2FxRWxpeHJ1Q2pPWldScnF1TDZNOU95eGhRVGRDVzcy?=
 =?utf-8?B?aE90UFBMcmU4MkRqblhvRmEwUnRCbkNZcm53NGVTNmZwQ21mUEtIdzBtMWZC?=
 =?utf-8?B?RS9UVW1hOUttU0pQcXhQVkNRSU8zazVmdkJ0dHkzY0Vxcytnc2VuSmF1UjMv?=
 =?utf-8?B?S1R1ZEM4dUs5blFZc3FGYUZZOWxvN0JmR2NhcmZVK01rVlRtazFuTkVIVE9U?=
 =?utf-8?B?cEI5QTczNEhjOURTR2F4cVdnMGoyYzNqcCtBVDBFalVEWkkwU2lWZWgvZnFt?=
 =?utf-8?Q?QJLlqgu3sD9+Gtd7ATNjvxue7lkmiw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2RLSHR6WmZKdWdwMlhxcDR0Tk9xL0QveWthd1NRK0VESG9aU2NHcURVcWoy?=
 =?utf-8?B?MXQrNDhCMVRVcGI0cTdhWUJNS1lSS0xFeVVIZjRkU2JabTJFd1B4WVdoeGhm?=
 =?utf-8?B?WUZPTTNTMjhtTGtFb294bEdyVCs1ajlxNG9mQVdoMDlxYjdwOEJRV09DeE1B?=
 =?utf-8?B?dHVETlFWZVJmQTFJcVRlZ05GM1RwWTZxTnJSR2hzQkliTThZL2MzNXRKUS8w?=
 =?utf-8?B?bVEwUGYrTmUwanFDMW9tOENSWkNFSVJ1V1FmTzF3c3ZjMVZjcFNWenBOeDNS?=
 =?utf-8?B?ZS9UZlg0Z3NCRWlxVmN4VEZXLzVZeFk3UWJiT1dUazl4WnlaeHpZL0ZHREZv?=
 =?utf-8?B?dHhOM2dPU3plRS9BNnNpdUZOMFRYYWhiWGc4bjlFbFlKOEhVdFN4WVRPbGlV?=
 =?utf-8?B?SjFJS3pISDBEaDgwZnMvOFhaU3h4UVJGanhZeW5NWm9pRGFxNmNlNVJ3cmZ6?=
 =?utf-8?B?dk9LRndMeS9URTd2dXZXNkJSRGFsT3JLNGFkZlBUTHJmaXdOcXdJUlNZd0F0?=
 =?utf-8?B?Vlo2N29KbnBXQnMrejBGNXM0QnZhUjhvalJ3RkxkRzY3Z2g3YXp4ODkrZE5T?=
 =?utf-8?B?ejRvb0xiVVk0U3diSXRUcEdrRGlmWS9uNTloQ2lldjdmSURKc3BocWYzRkM2?=
 =?utf-8?B?OG9wVGtQNDhQMDdnNFpmblU2QWI1K3U3SXoxNkphNS91YXoyeHV5ZTdNN1dB?=
 =?utf-8?B?Sy9INjhGeVNyekZFVTJZemdWczllOVE2UTRoTDBWMnV5Um9DVXlURWx4bHZ1?=
 =?utf-8?B?aC9vOFJQV1piQWcyTUZlOUZXK2pqMnc1UjlSVlVXOUxNL2U4N21ta2VrQlo4?=
 =?utf-8?B?ZmRMbkVJUG5oT0M1OXd0NmVTcmxaZDVxMnNoTWVTYWxsUVMrMjRSd3dLUnRS?=
 =?utf-8?B?cFJFQjlMeC95TEdHOGEzdW8wS0pCNnl0L0RQdzJIVHlhV1Z1cFpYOGs3dFlr?=
 =?utf-8?B?T2xFSkFrblRnUStQYW9ReEgxME5TQnBZdmpha0s3UXRhMHVZQjBZUU82SlFP?=
 =?utf-8?B?N21RVTZhWGtQT285VnpHVjJ3MmxiR21tdDMzUFY2eitCZDBHeU9xUnNaQ2di?=
 =?utf-8?B?TXFKSkx2L0ZVUkg3MXlsQld0T1Bmcm1pb0dMbkdlZWN4a3V4VFo4ZDF1ci9R?=
 =?utf-8?B?TDB1RjlaTzI0aFhmckpoU1hKazhnV0pwd24xVGxmRFRRZUpjMU1GTkFZSC9O?=
 =?utf-8?B?NmJNSGxjdjNjM29pVklFVjlRbWVpZlpkK09mNjRkeDl0ZndZRWUybUFiSjZx?=
 =?utf-8?B?aThTN0NoMHk3SXB4RlVtQ1h4eXJ1S2pTZlg1Y09kNk5LR0JUSVRtMnBsRzJp?=
 =?utf-8?B?anBqV050dVZOdGdHZk54NUVGeDhxa3JtVjNuWmVuSE5SdXNyT291M1hieU1v?=
 =?utf-8?B?c2xzSWcrUjRqZ0NsRmhCK1RXUUQ2TGk3dk1DSjFWMSsrUDc3cGl3ZUsyRUdG?=
 =?utf-8?B?a3Jna2o3SG5MUkhHdERsa2hvS092azE0VlNZQm9yYjBUR3ZIZmp2OUJJbDM3?=
 =?utf-8?B?NGFkb3pOM01rb2xHeS9MOXJOVDZ1SWlBWFBIVjdWallxWm1NRnB6ZHB3Ymho?=
 =?utf-8?B?blJlRmF1NGdPRUJxQ3I2RG52TXVBbVZyazBIWUxlbUZ6MUFmVkVyTS9ObGpM?=
 =?utf-8?B?WWQvNTJPVWw2KzJCeHRTZDNQRTlEQVpDR0QzSzFqbUZjN204Q3d0djBLVjNL?=
 =?utf-8?B?OFV1ZjRQUmN5K3g2Y1cwQU5vSUM4WFF0S0tUVjFwZWhqUkZmRjJlOVhxbE0r?=
 =?utf-8?B?blRnTENjdEtydnM1QVNKMTd3UzNkY09CemVoTXVqQ1F6dVAvYWJjVGJ0WUds?=
 =?utf-8?B?MzhZWUJjSmhYVmo3ZFh4YytxMzJINFNGK3ZTcmI3UVM3Q3puRnM1clJJZWV0?=
 =?utf-8?B?RHRVWE8yTVNVRGZ3OFF0OUh1WTVDN1ZNV0N6cFI3bEpWdEJNMko2QUljY0dS?=
 =?utf-8?B?Zm9oc1kwbGdCcGRBL2lqK1BUbUhQSnVXN29IRXNyTHI5U0R0RkFiSDU0V3lx?=
 =?utf-8?B?YVZKWWpCYWt1Z21jOFFOTlNvVGw4cHdCZVI1Snl6UWdwTGF6YjhJM0pveU9y?=
 =?utf-8?B?Nm1ST3kyRU1BOFNEL1AxOGJtQmxEdlJPL2lGMWhwdGFpWTVMaGFTaXlYZysw?=
 =?utf-8?Q?/erI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3532033AEC47A64BA97956E2B65EA74D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa544dfc-aad5-4eb5-da3d-08ddb3cd4f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 09:47:33.6709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3APFK8600uUUdxQ1r8GuD3Kvi09SUl7otAL5tNxAggD4uND+3Fp4vxZS+ZKSnfn0wQ8jbNiMxXHbCUz9odNcKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9771

T24gMjAyNS82LzI1IDE3OjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMDYuMjAyNSAw
OToxNiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI0IDE4OjE3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wNi4yMDI1IDExOjQ5LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8xOCAyMjo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Mi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJp
dmVycy92cGNpL21zaS5jDQo+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4+
Pj4+IEBAIC0xOTMsNiArMTkzLDMzIEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIG1hc2tfd3JpdGUo
DQo+Pj4+Pj4gICAgICBtc2ktPm1hc2sgPSB2YWw7DQo+Pj4+Pj4gIH0NCj4+Pj4+PiAgDQo+Pj4+
Pj4gK3N0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIGludCByYzsNCj4+Pj4+PiArICAgIHVuc2lnbmVkIGlu
dCBlbmQsIHNpemU7DQo+Pj4+Pj4gKyAgICBzdHJ1Y3QgdnBjaSAqdnBjaSA9IHBkZXYtPnZwY2k7
DQo+Pj4+Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgbXNpX3BvcyA9IHBkZXYtPm1zaV9wb3M7
DQo+Pj4+Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3RybCA9IG1zaV9jb250cm9sX3JlZyht
c2lfcG9zKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBpZiAoICFtc2lfcG9zIHx8ICF2cGNpLT5t
c2kgKQ0KPj4+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGlm
ICggdnBjaS0+bXNpLT5tYXNraW5nICkNCj4+Pj4+PiArICAgICAgICBlbmQgPSBtc2lfcGVuZGlu
Z19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5tc2ktPmFkZHJlc3M2NCk7DQo+Pj4+Pj4gKyAgICBl
bHNlDQo+Pj4+Pj4gKyAgICAgICAgZW5kID0gbXNpX21hc2tfYml0c19yZWcobXNpX3BvcywgdnBj
aS0+bXNpLT5hZGRyZXNzNjQpIC0gMjsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBzaXplID0gZW5k
IC0gY3RybDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICByYyA9IHZwY2lfcmVtb3ZlX3JlZ2lzdGVy
cyh2cGNpLCBjdHJsLCBzaXplKTsNCj4+Pj4+PiArICAgIGlmICggcmMgKQ0KPj4+Pj4+ICsgICAg
ICAgIHJldHVybiByYzsNCj4+Pj4+DQo+Pj4+PiBUaGlzIGlzIGEgZGlmZmljdWx0IG9uZTogSXQn
cyBub3QgYSBnb29kIGlkZWEgdG8gc2ltcGx5IHJldHVybiBoZXJlLCB5ZXQNCj4+Pj4+IGF0IHRo
ZSBzYW1lIHRpbWUgdGhlIGhhbmRsaW5nIG9mIHRoZSByZWdpc3RlciB3ZSdyZSB1bmFibGUgdG8g
cmVtb3ZlIG1heQ0KPj4+Pj4gc3RpbGwgcmVxdWlyZSBlLmcuIC4uLg0KPj4+Pj4NCj4+Pj4+PiAr
ICAgIFhGUkVFKHZwY2ktPm1zaSk7DQo+Pj4+Pg0KPj4+Pj4gLi4uIHRoaXMuIFRoZXJlIG1heSB0
aGVyZWZvcmUgYmUgbW9yZSB3b3JrIHJlcXVpcmVkLCBzdWNoIHRoYXQgaW4gdGhlDQo+Pj4+PiBl
bmQgd2UncmUgYWJsZSB0byAuLi4NCj4+Pj4+DQo+Pj4+Pj4gKyAgICByZXR1cm4gdnBjaV9hZGRf
cmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEwsIGN0cmwsIDIsIE5VTEwp
Ow0KPj4+Pj4NCj4+Pj4+IC4uLiB0cnkgdGhpcyBhdCBsZWFzdCBvbiBhIGJlc3QgZWZmb3J0IGJh
c2lzLg0KPj4+Pj4NCj4+Pj4+IE1vcmUgZ2VuZXJhbGx5OiBJIGRvbid0IHRoaW5rIGZhaWx1cmUg
aGVyZSAob3IgaW4gb3RoZXIgLmNsZWFudXAgaG9vaw0KPj4+Pj4gZnVuY3Rpb25zKSBtYXkgZ28g
ZW50aXJlbHkgc2lsZW50bHkuDQo+Pj4+IERvZXMgYmVsb3cgbWVldCB5b3VyIG1vZGlmaWNhdGlv
biBleHBlY3RhdGlvbnM/DQo+Pj4NCj4+PiBOb3Qgc3VyZSwgc29ycnkuIEJ5ICJtb3JlIiBJIHJl
YWxseSBtZWFudCAibW9yZSIgKHdoaWNoIG1heSBqdXN0IGJlIGNvZGUNCj4+PiBhdWRpdGluZywg
cmVzdWx0cyBvZiB3aGljaCB3b3VsZCBuZWVkIHdyaXRpbmcgZG93biwgYnV0IHdoaWNoIG1heSBh
bHNvDQo+Pj4gaW52b2x2ZSBmdXJ0aGVyIGNvZGUgY2hhbmdlczsgc2VlIGJlbG93KS4NCj4+Pg0K
Pj4+PiAgICAgcmMgPSB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgY3RybCwgc2l6ZSk7DQo+
Pj4+ICAgICBpZiAoIHJjICkNCj4+Pj4gICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVw
cDogcmVtb3ZlIG1zaSBoYW5kbGVycyBmYWlsIHJjPSVkXG4iLA0KPj4+PiAgICAgICAgICAgICAg
ICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCByYyk7DQo+Pj4+DQo+Pj4+ICAgICBYRlJFRSh2
cGNpLT5tc2kpOw0KPj4+DQo+Pj4gQXMgSSB0cmllZCB0byBpbmRpY2F0ZSBpbiBteSBlYXJsaWVy
IHJlcGx5LCB0aGUgZnJlZWluZyBvZiB0aGlzIHN0cnVjdCBpcw0KPj4+IHNhZmUgb25seSBpZiB0
aGUgZmFpbHVyZSBhYm92ZSB3b3VsZCBub3QgbGVhdmUgYW55IHJlZ2lzdGVyIGhhbmRsZXJzIGlu
DQo+Pj4gcGxhY2Ugd2hpY2ggc3RpbGwgKHdpdGhvdXQgYXBwcm9wcmlhdGUgY2hlY2tpbmcpIHVz
ZSB0aGlzIHN0cnVjdC4NCj4+IEhtbSwgYnV0IGFsbCBoYW5kbGVycyBhZGRlZCBpbiBpbml0X21z
aSgpIHVzZSB0aGlzIHN0cnVjdC4NCj4+IFNvIGl0IGRvZXNuJ3QgZXhpc3QgdGhlIGNhc2UgdGhh
dCB3aGVuIGFib3ZlIHVuYWJsZSB0byByZW1vdmUgYWxsIGhhbmRsZXJzIGFuZCBzdGlsbCByZXF1
aXJlIHhmcmVlIHRoaXMgc3RydWN0Lg0KPiANCj4gV2VsbCwgaW4gdGhlIGVuZCB5b3Ugc2F5IGlu
IGRpZmZlcmVudCB3b3JkcyB3aGF0IEkgZGlkIHNheSwgaWYgSSB1bmRlcnN0YW5kDQo+IGNvcnJl
Y3RseS4gVGhlcmUgYXJlIHNldmVyYWwgb3B0aW9ucyBob3cgdG8gZGVhbCB3aXRoIHRoYXQuIE9u
ZSBtaWdodCBiZSB0bw0KPiBoYXZlIHRob3NlIGhhbmRsZXJzIHJlY29nbml6ZSB0aGUgbGFjayBv
ZiB0aGF0IHBvaW50ZXIsIGFuZCBiZWhhdmUgbGlrZSAuLi4NCj4gDQo+Pj4+ICAgICAvKg0KPj4+
PiAgICAgICogVGhlIGRyaXZlciBtYXkgbm90IHRyYXZlcnNlIHRoZSBjYXBhYmlsaXR5IGxpc3Qg
YW5kIHRoaW5rIGRldmljZQ0KPj4+PiAgICAgICogc3VwcG9ydHMgTVNJIGJ5IGRlZmF1bHQuIFNv
IGhlcmUgbGV0IHRoZSBjb250cm9sIHJlZ2lzdGVyIG9mIE1TSQ0KPj4+PiAgICAgICogYmUgUmVh
ZC1Pbmx5IGlzIHRvIGVuc3VyZSBNU0kgZGlzYWJsZWQuDQo+Pj4+ICAgICAgKi8NCj4+Pj4gICAg
IHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIodnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEwsIGN0cmws
IDIsIE5VTEwpOw0KPiANCj4gLi4uIHdoYXQgaXMgdHJpZWQgdG8gYmUgcHV0IGluIHBsYWNlIGhl
cmUgKGFuZCBsaWtlICJubyBoYW5kbGVyIGluc3RhbGxlZCINCj4gZm9yIG90aGVyIHJlZ2lzdGVy
cykuDQpBY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0LiBXaGF0IEkgY2FuIHRoaW5rIG9mIGlzIHdo
ZW4gdnBjaV9yZW1vdmVfcmVnaXN0ZXJzKCkgZmFpbHMsDQp0aGVuIGxvb2t1cCB0aGUgTVNJIHJl
bGF0ZWQgaGFuZGxlcnMsDQphbmQgc2V0IHRoZSByZWFkL3dyaXRlIGhvb2sgdG8gYmUgdnBjaV9p
Z25vcmVkX3JlYWQoKS92cGNpX2lnbm9yZWRfd3JpdGUoKSwNCmFuZCBzZXQgdGhlIHByaXZhdGUg
ZGF0YSB0byBiZSBOVUxMLg0KSXMgaXQgYWNjZXB0YWJsZT8NCg0KPiANCj4+PiBZb3UncmUgbG9z
aW5nIHRoZSBlYXJsaWVyIGVycm9yIGhlcmUsIGlmIHRoZXJlIHdhcyBvbmUuIElmIHRoaXMgb25l
DQo+Pj4gc3VjY2VlZHMsIC4uLg0KPj4gQnV0IGlmIHJldHVybiB0aGUgZWFybGllciBlcnJvciB0
byB0aGUgY2FsbGVyLCB0aGlzIGRldmljZSB3aWxsIGJlIHVudXNhYmxlLCB0aGVuIHN0aWxsIGFk
ZGluZyB0aGlzIGhhbmRsZXIgd2hlbiBhYm92ZSBmYWlsaW5nIHRvIHJlbW92ZSBoYW5kbGVycyBp
cyB1c2VsZXNzLg0KPiANCj4gVHJ1ZSwgeWV0IHRoYXQncyB0aGUgY2FzZSBhbHNvIHdpdGggeW91
ciBjb2RlIGlmIHJlbW92aW5nIHRoZSBjdHJsIGhhbmRsZXINCj4gZmFpbGVkLCBhcyB0aGVuIHRo
ZSBhdHRlbXB0IGFib3ZlIHRvIGFkZCBhbm90aGVyIGhhbmRsZXIgd291bGQgYWxzbyBmYWlsLg0K
PiANCj4gSSBkb24ndCBrbm93IHdoYXQgdGhlIGJlc3QgYXBwcm9hY2ggaXMgKEkgZGlkIHN1Z2dl
c3Qgb25lIGFib3ZlLCBhbGJlaXQNCj4gdGhhdCdzIG5vdCBxdWl0ZSBjb21wbGV0ZSB5ZXQgYXMg
dG8gdGhlIGJlaGF2aW9yIGhlcmUpOyBJIG1lcmVseSBvYnNlcnZlZA0KPiB0aGF0IHRoZSBiZWhh
dmlvciBhcyB5b3UgaGF2ZSBpdCBkb2Vzbid0IGxvb2sgcXVpdGUgcmlnaHQgLyBjb25zaXN0ZW50
Lg0KPiANCj4gSmFuDQo+IA0KPj4+PiAgICAgaWYgKCByYyApDQo+Pj4+ICAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgIiVwZCAlcHA6IGFkZCBkdW1teSBtc2kgY3RybCBoYW5kbGVyIGZhaWwgcmM9
JWRcbiIsDQo+Pj4+ICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIHJj
KTsNCj4+Pj4NCj4+Pj4gICAgIHJldHVybiByYzsNCj4+Pg0KPj4+IC4uLiB0aGUgY2FsbGVyIHdv
dWxkICh3cm9uZ2x5KSBnZXQgc3VjY2VzcyBiYWNrLg0KPj4+DQo+Pj4gSmFuDQo+Pg0KPiANCg0K
LS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

