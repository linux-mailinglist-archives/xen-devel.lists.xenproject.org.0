Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6813CA35D0
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 12:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177537.1501794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR74K-000147-Jh; Thu, 04 Dec 2025 11:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177537.1501794; Thu, 04 Dec 2025 11:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR74K-00011n-Gy; Thu, 04 Dec 2025 11:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1177537;
 Thu, 04 Dec 2025 11:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYI0=6K=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vR74I-00011h-Te
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 11:00:14 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 688e7977-d100-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 12:00:13 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB8PR03MB6153.eurprd03.prod.outlook.com (2603:10a6:10:142::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 11:00:09 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 11:00:09 +0000
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
X-Inumbo-ID: 688e7977-d100-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTUIPvP/4MRD/tU0Zx0cf7OWJ6qdVHbo4ukg+H1C978R5YGrsufMe17yv2oZqUJHiOcm5SAVztJ7OYaX8R5bdj4//yRwAUsiqMSawP7PJ6pkTpIz9ovdKSdPYzp3XOhxJdlr0U90zIjmFo7+pRrK0D1cUbYYBcd4hONeVF4ewLvpV08LQXoRmjLrxyRU4AK59IutcsW9Qyl89kcWqvoZcX7FQY8liNym15w4sqpubXXrEvG4KJhTaosMn0M++yGCjwgku4XoVWxLai8HSjoQFX/+qy93SUVvywZT9GqOkvse1fMbIRXV37fHJyOzEElJaGeUkAbqfJQJfV/4UPY0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgtDeA3zaJ+xMRiXlr+vBIfPXVeV264YSu8ULpZ6lpY=;
 b=SOJUcIvr5MutHpHygcLFamuFVKA6ue03PbKJvuzCjG8FbEVanjkuPFonD76zaFGOT4FIDhbPDrxio+EevID3bU+TBaG+oPMKyMhdQq7AN8C7idf2B3RtbfBwtQFbu24GrKoxS2nGEsZci7NyFze3QSiDtyQKixd1zDw4jedn/2lCiqxdTRjiwPorYQsWKeQ1cuaQdr7HDc6pf04XVaAzSuhpksNooUPAiEeFGeWotMOk8WpGiDt0s/zJu8A+fwtb/Ep7SUOnV9bRRz5HTuVdRn2peoT8pbq2MbhLfNplkj+JcypCz9sCf4vFEG5jcy8L9J7caXd7ha08CQq569Yp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgtDeA3zaJ+xMRiXlr+vBIfPXVeV264YSu8ULpZ6lpY=;
 b=T46KDXPeNKY+JDqtTXlDAoZydnkCc7wgZMeMzwTvNVewa2HB2nA+hrP26hsdlweDqW9ceAEfA3To/Pxmm5VWoF3qOWbslrgc+Jix1X8FPXr5xxaMACwzZH0WckXTC/fYdPVJPOABkcg710lezPKgCK8nFsEbVcIUbCEsDRMRVzaTBa1WWXjKFYVPIao0EkqEFNtEUZy0zOBLabvLum0wtrhI2Gak6XBELWTu0HwUGd8XWN2071pSL174+/oTBYrqkjOOklOFpwoFfGnk6EftgHFrzOVLgsmcqpZ/GDW0FnFZWPt7dbvfGEFg13HEvwTsrXSHrE/L4lxWyY8c3UEjxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7a920fca-8945-41de-ac3d-864ff03d571d@epam.com>
Date: Thu, 4 Dec 2025 13:00:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] coverage: add extended coverage capabilities
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
References: <20251203222436.660044-1-grygorii_strashko@epam.com>
 <d477a21c-b621-46bb-94ce-4775b2b6a90e@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d477a21c-b621-46bb-94ce-4775b2b6a90e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB8PR03MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f58ec8-ebbf-4a54-0003-08de33244a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXFrVGdzRmlyQnBaM0xSM0hXdkdUeHNHRDNucFVLbkFkbUhDQ0FnOEhmN0hu?=
 =?utf-8?B?WDRkb3JyZmI4b0FZSUxPamp1eE1rT0JieUdObm0rbnlsVkRBeWZ3Tjd4Vi9l?=
 =?utf-8?B?VE5wMi94eUhxRWszQVlrWW1Sa2hDdktRbjNlMWRqU01VZmZOaE1GOUpjc08w?=
 =?utf-8?B?RjJ3Y2FQbktRekdERzRJYWhXbm1hS2FMMnl6YVhRQjdCVDBrRVdzc215S01U?=
 =?utf-8?B?ZmdLSmNFdms3VjJENS83TCtDQWZFZHVSWnlPcFc5VHlheGs0WllYWXhhSkNa?=
 =?utf-8?B?aFZ5U2RmOHJSemxCblYwbFI2REJWNkluSWVlT0NVZUV4dUJzS3B6UkVySHhC?=
 =?utf-8?B?b1ZzRnM0Zit6MktPNGlWamVBcnplTlRQZDNHcVFzcUIwOTQwT1phSmwvYlRr?=
 =?utf-8?B?U3dEeDFGcnFhRXppdGNzUlp2T1IzYUFJTi94U2h1UkgzaEx2Tmlld1YrdndY?=
 =?utf-8?B?NTFyaWFOakZMZGx4blVzQUdvcFpha09zNnRyaXJ5SDdwMVBBM1RNdDMxYWdO?=
 =?utf-8?B?QVNPem9GeGVWSFE1K0xQbTBpUnBnMEd0dnlKdlZ3S2Z6OGxFSXJVOHVEU2VR?=
 =?utf-8?B?aXh0QmlWZzd1OXBvRytZWnVWNWpPd3duNVJRaFZraW1rTmlDbW9ZbklpdTE4?=
 =?utf-8?B?QU85L3hwS2pVRzRMN3VDWElHUHVlQ1pNS2FqcHdnMFB6ejliajlEYnBWTzUv?=
 =?utf-8?B?WDN5OWpVZ3JsSGtRa0dqRWozb3FIQVJYOWdSWW1rTHB0L2RkbTQ4dFJHUVh2?=
 =?utf-8?B?dEdFakl5MnBNbmNSdmdUaVg2ZEtudWVGRkRJYmQ3SExhRE1KT3NOWVNmYTJZ?=
 =?utf-8?B?NUJxNkdub3F6NFN3UjNnTEtkVHM5RnJRdXJTVWhRK3VHWFNBSjVTYmFrbU4r?=
 =?utf-8?B?QVp5YlFwSzNaUVdPZVp2MjNtcVloelM5dllYL1M1eXVOQWVoZU1rWjNRaUUw?=
 =?utf-8?B?bEd3MmJoTDhPVmZESU5Gelh1TERsLytqYUUrU0dtbHc2TXRQQUFFOEd6Ull2?=
 =?utf-8?B?QWlUd1FIdlZNa0FLUTFMWlpBMklGalJtZ2Z6bFhVSWtPSS9wbnQwc3RWNXUy?=
 =?utf-8?B?M2NNaTY5Tkpmb0doaVBYV3BLbWo1dHJqWCtnN0ozY0Q4a3gvUmwycVNLSFpp?=
 =?utf-8?B?bFZyUEhjci9QNkp6UE11aHkyNys4Z1RvTXJaZWZ4Nm84bDMyTFZReDBkUnl4?=
 =?utf-8?B?K05MdW5RQk5NZ3JFSkNsUzN3ZCtGVGNXbEtwNlNhYVJiN0hGZi84UHpKd2FK?=
 =?utf-8?B?U210K3dNY2EwbmJta2FpZmtRd0d1U29HZzlNVTVwYml5VGwwNnNUM2JBKy94?=
 =?utf-8?B?a3A3STM2WjhjSHVscjl2TWtYTTN1SS9TM3hNaFJ5bU9JYXlrRFBlLytCeVVp?=
 =?utf-8?B?akJxekdGL2tmbklMSkZXb1YxSllLL2MvRmlIZG5rTjN0TmZFQmNNNENPSGp4?=
 =?utf-8?B?eDdOeWtiSWkycC82ZDh6YlZBRmUyWGxKYXViYWJOOFNnd25oQkZrd3FNdm1T?=
 =?utf-8?B?V3NoU2JTZXNMZnNFM3gxNG1RbEtodXcxbzYydWVPM2xGNFZaaU80SWlVaGRN?=
 =?utf-8?B?c3hUaWVremtaeklXREVWK1VQaytZQmF3SUQrTlFUZUp2bjQwVkxKZzVRM2tU?=
 =?utf-8?B?TGZqOHJFTTdXK1FENnRCbFNLR1cxWjl3cTBCMkluOFRkWk5jQWptSU1wTi8x?=
 =?utf-8?B?VExtelVISmZTaWVHcEd6NW1KVVhvamR4ODZPMmlSc1ZpS1NTVy9vbWlmV2Yv?=
 =?utf-8?B?bUVTZ2FaT1orbm5ya0ZvUFg2UW9aL1F0SWRpZnIwNmx3L0RIeUtFdnVLeWoy?=
 =?utf-8?B?TEFJU0NDUUY2dkZVT0FPeUZNUVZhd21FbkpHNTNxR1N6dnk3MktFZmdXWVQz?=
 =?utf-8?B?Ylh5bnRLWWlXdG5ianNCUTZNNGpzanhpblI2YjBNNGtsTXkvR3FiTGExamdS?=
 =?utf-8?Q?+XVFRwgaIPK/BM6+0H1Xy+8YiEPtUkw4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUVhUEdmY1dkUTNtakpZZThaTkZGWkJyUzk2ZERENlc0cWdmZFY0MGRZRUJ6?=
 =?utf-8?B?R2krQUdZYkpxQkdUaFcwTW9LUzNjZk9iUDNtMnM5VThuTVZaQUh2d2h2dnM2?=
 =?utf-8?B?TXpuNmQ4c1d3WEVxRm0wNGhudkJ0d3RBay9yQm5RSmRmdm91ZlZiMkF6Znd1?=
 =?utf-8?B?VGNnZmQvazhGdFQ0aVlmT0xlRXJIWS9ncTBHcFVuTGFkS1BSdVl4eWdlejNo?=
 =?utf-8?B?TDhFZWlZdi9QUVRNck44aTF0MUxhU0VDSG9LUlFkZjlJS3R4Uk9YdEwvOXQ2?=
 =?utf-8?B?YU9McjRLK0tnajlqekpVOE5XY2I1U3JwSkFpbmxUdHlWbmVGYmNtRzFQY3ho?=
 =?utf-8?B?K05iVWVEWGdyM2czSmRKZHlyU29pb0VCN2FHVC8yRWhXN2Fzc25aYlJWblBq?=
 =?utf-8?B?VG9aTXNZbG5YdkhvV2JuYkZaMllUWEFqWndiaUVrOVVablNEWTZtL0FseE53?=
 =?utf-8?B?T0xlb2o4TXFDVThoZnQyUDZWZUdxQUMrSUlhOXg5UU9XZ2dvTmkyY3pyaWZO?=
 =?utf-8?B?SFJNZEMxUW5kN3ZXNi9lQ0tKaGlydVZDYzRDWnhtNkxDUkEzVXVwaHVtV0Mx?=
 =?utf-8?B?d3JCMnNkMTV6OWQyUDh1VkZjZndMREh2UDhQTk9ld3UzZDRKUEF5YVVja0wv?=
 =?utf-8?B?VVhzTzRXUTc0YUdaYnp6TnNqUTUrYkFwaUFRZHdLSnZNUVB6NjhFTDNxR25l?=
 =?utf-8?B?L0NwV0NOOFo4SllCdktRMEEyanlBRXgrOUhwSmFIdGxPVXp6OTM3Z2wzaGJC?=
 =?utf-8?B?V1pPNGFrdW9iSWZKQUthbGNRQVl5bzZORzlTQ1l4REtCcnVPNVFWeGpwNkp6?=
 =?utf-8?B?cVRIbUpsUkluOTB1SzRtbnJnYXNyYmtxWnVhcXZLeGZLTGtnZmtRcUVzMUNJ?=
 =?utf-8?B?QWVYbGRsSzBneGM5MWQ0S0pyRWRTUmRFMVcxT0tMK1pFOGl2cUgzelNZdFFU?=
 =?utf-8?B?MFFZRWhZOFNnaDA0aDhJdFg0ZUMzbm5WSFl3aUx6eTRYK0s5K0pTdzM1d0dj?=
 =?utf-8?B?M2xUaEpMVUc1R0E3Q0NNODlBYmZ4NEJhU1VscGFRNjhTdWRyMmtBaTJxWlhL?=
 =?utf-8?B?dzk2VFNSMmhWOEl2SWdORWRvdkNEZ2tUSDM4UXNKd2gyVlMvOGMvTjBEb3lk?=
 =?utf-8?B?OElqSW10alVwbWpUcCttR3lNNkZTNzhRNm5sNVVJcExyU1dBUS9DbStyV2hB?=
 =?utf-8?B?TTNYeXRxNWpNTzg5cTRKWUxLd20zdEgvczlCZklPYWR0NEp4dkVBVm1BZW55?=
 =?utf-8?B?QVFYKy9uNVB3cVZoeWpsWktrQm9HTlRCbXJSbU1aWTRUQk5VNDVRSFFWdldi?=
 =?utf-8?B?NFYza2haczAyYlhXL0Y5aEJzQ1ZSTnhmWENYYndSZ20wYUg0Sk1mTGw5c2JX?=
 =?utf-8?B?VnJlblBReE1TUHdXLzRNdDYwdzdCanF6Vm02Tm5DMWZ3U3lGMm5sWVZ4RVli?=
 =?utf-8?B?ck0yTUErcWJLVmM4d2p0M3l0d2hQbVVMVGNwZFYyL2NaVUNOcHNKRXhDbHBO?=
 =?utf-8?B?YWFPLzVNNnYvVEkvVk5wZk1Lb0J0UVhFWEczQ01TQnErZU1Md1ZmUlhuRjF5?=
 =?utf-8?B?emJFTjYvYkxMRDUyY0h4TjNOMisxS0t3Y0hXV3Q5UjlCNXNyYUdSYmhWZ1lq?=
 =?utf-8?B?UFNRdDg5VGdiTDB1bnhaUG5jVnoxZ0VXQjFjditUSmZuV0pLeWpBTE42YTMx?=
 =?utf-8?B?YkYzeDNUbStrRE9aczVNSVNPaEFlMjUvZDlvMzFCeDEvNUlja2kvYis0NSs5?=
 =?utf-8?B?aWVWZXJoOUllMHZTVHVkYmx4ZnJDWUFpM3lLNitMNTFRam1lTWhaVS80dk15?=
 =?utf-8?B?VmlCMFd3RnMyQm15NGVlWGhFamRTQ1Z5c3Fhb0pDd2xiY2l3eGdDL3Z1dnF0?=
 =?utf-8?B?b0RxZ01DUGdjRkJSZ0N6ZnJGdzdUem5lWm4vZlh3VnlreC9xRTlvUzZBVjN4?=
 =?utf-8?B?WFUzeTI1R04weFFIZE9Xdk4rN3RBSXBBcVp1ZUloTmFxdWpnNlV2dHFsZDJY?=
 =?utf-8?B?V2ZWRVcrWUlDYnlYVjFmclVSZ2FUYWk0M1hwamZ5aGtuMFhQVGJwNENPTkNw?=
 =?utf-8?B?UGYzbVpuaFhwMmY3dmJOTHVsR3dyMzgreG1aK2NpNnJSMWJaSkpjUU5UMnNS?=
 =?utf-8?B?ZXNoVWRxS05OanBFdHpUc0JnZlVReDdUMjVnQUhueVc2bERhWjMwalVEMXV2?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f58ec8-ebbf-4a54-0003-08de33244a9c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:00:09.8118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5RJK3iapr0+31MwBcdVqi5SN+rCltwtIldcAZt5Lx0eJdyQyTMhothmbRqw4hsbowkGtokjS0oX4aqU5xRTAfmmt2NUCbLwK7iBt5S54IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6153

Hi Andrew,

On 04.12.25 12:02, Andrew Cooper wrote:
> On 03/12/2025 10:24 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Added CONFIG_COVERAGE_EXTENDED to enable coverage for .init and lib code.
>> When enabled - Xen .init data will not be freed.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   xen/Kconfig.debug          | 10 ++++++++++
>>   xen/Rules.mk               | 13 +++++++++++++
>>   xen/arch/arm/setup.c       |  2 ++
>>   xen/arch/x86/setup.c       |  4 ++++
>>   xen/common/libelf/Makefile |  4 +++-
>>   xen/common/libfdt/Makefile |  4 +++-
>>   6 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>> index d900d926c555..3e04e1a3992b 100644
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -44,6 +44,16 @@ config COVERAGE
>>   
>>   	  If unsure, say N here.
>>   
>> +config COVERAGE_EXTENDED
>> +    bool "Extended Code coverage support"
>> +    depends on COVERAGE
>> +    default y
>> +    help
>> +      Enable Extended code coverage support which include .init and libs code.
>> +      The .init sections are not freed in this case.
>> +
>> +      If unsure, say N here.
> 
> IMO this is unhelpful.  Noone wants to opt for the model we've got right
> now.
> 
> Instead, I think we want:
> 
> config RELAX_INIT_CHECK
>      bool
> 
> and have CONFIG_COVERAGE select it.  There's no need for any user
> visible option here.
> 

So It will be always enabled if CONFIG_COVERAGE=y, Right?



-- 
Best regards,
-grygorii


