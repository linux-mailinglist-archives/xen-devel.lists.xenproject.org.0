Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998DBF017C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 11:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146042.1478527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAlrc-0000of-Qp; Mon, 20 Oct 2025 09:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146042.1478527; Mon, 20 Oct 2025 09:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAlrc-0000lv-Nd; Mon, 20 Oct 2025 09:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1146042;
 Mon, 20 Oct 2025 09:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vAlrb-0000ln-Gv
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 09:07:35 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3634f6a7-ad94-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 11:07:33 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BN8PR03MB5011.namprd03.prod.outlook.com (2603:10b6:408:7d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 09:07:30 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 09:07:30 +0000
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
X-Inumbo-ID: 3634f6a7-ad94-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx+HF7lHfx53jFGDakom7J4D1X5251ZWc0vIFNez0bEmsyBDWc23vJsnIF357lbxcW6dQgzSjBb+EArSrDexjfkBmNLP4ZLtLy8qaavjFUtLWzEickRlt94gA8Mt5Ma0ZN46QgraIqgpzVAUlQABGzygzGXy/PKgCbWVEGQwB9GYVScPo9WWtSNiAXyxldEc0LnX+r6v2EFw0Clb7KrClHwXYPEKxlwi8BZcQEpsoUtnlDy8PTN8hB/ZU2hWXAiqaa0I4Bli8scZpZObYbVaS9h3ZW+qjTe9L4idUhTT7w5JWNDO8lNWs3gmfGsGBJ8ljnbnqSLaZ9L6wOTGbSwJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fq3oPh2Gf2ty83ad98IjOROqdIgyjSf3rcrLzj4Fbu0=;
 b=y1bLDJOjoIcxwlDCULbVtZaP71fSyQwDywTDD89QLHO8xBCJjqRSBsKnY/5y8tOeS6THVF9agXpXFzxM/NBDcF1Xxwn81o/yJe4MgpeGVaxpawQUdm3jPGnR9fWqh+mmcsP/U2Mo+rHUCX7oQYrHycNCigMa/sMloWhBYu/sO6z2binGBZzf+x5vznFhnjow+LoZzCeBLJo5xZmKDQ4CiUctDhpvctAutb2sE6oAFPLzhJCnLD2tXb+/tyOgmYQTkNDzj4NTf5aBQJk3qqDUr+05wwBtOJZnqzobvQ2vYuzul4jc4mT62ikj1KJZW1sakjfTxPfhx+f7XB4KCMtnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq3oPh2Gf2ty83ad98IjOROqdIgyjSf3rcrLzj4Fbu0=;
 b=Q8ZW6R2NaHbF1kuUqXPwKxYpTT/ZXEv6DAm16kWVORSUM4I33l890d2WcuTnmJqCbhzjFv4lurQg5sTiUmV8OsdU/vjpudDW+fjuieGCAI+39+3LFsWertPFDC6HOsQ4WNrEqvJyXMaRr/MND4fYYgKcDHS2UVpx68WQYRY2cJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Oct 2025 10:07:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with
 PCI segments != 0
Message-ID: <aPX7zfet83VZm6wq@Mac.lan>
References: <20251017141434.15205-1-roger.pau@citrix.com>
 <706663d2-61dd-4fb0-b278-d3282dc7b5ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <706663d2-61dd-4fb0-b278-d3282dc7b5ca@suse.com>
X-ClientProxiedBy: MA3P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::10) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BN8PR03MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb3edd5-3857-4168-e42d-08de0fb818a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2F0TGZPNkJwZnJFQmZDMEFsWmxjeXFvNHJ4NmhGczlqY2Y4eVBMeFVUdEdO?=
 =?utf-8?B?a1VHSWR1WW5RL0VsendWS0JEVzAxVnQ5cFNLWTdUL2l4eTI2d0cveVR5cnRC?=
 =?utf-8?B?M3luSFRuYlhidC9HTEtJQmFVMkdjemZMeXdKL3ZhSGg3cWw5UlVrM0hNeUds?=
 =?utf-8?B?bEdWTFNmYk5xaXM4aWtjdWl5ZzRIbGtkcEQwYndEek1VcUlzYmlON3lQSU9Z?=
 =?utf-8?B?ZjRsYTg2RUh4TmtDRzN0eXBkZkF5SWNvZGFwZ3Bnb2R4MWdMMW5ZTWR6N3RS?=
 =?utf-8?B?M0xKRllGSGIxcDJKZ3pZZzRGSVRnNW1kNitzYmc2TFRPY1UzSVlVUG1ZWHBq?=
 =?utf-8?B?c1BMOE9sUnh4cldyS2doaGVxREpwdFJnY1NOZTlpSi9XWlgxUzFRQ2s2bWk1?=
 =?utf-8?B?d2x6T2YwUUkwalFoOStoV2d0NEdJTkdOZkprbVgvbDhQUjRpUjhxSWREUW1T?=
 =?utf-8?B?cCtIUkZ1OTgrbDBxZHlvejVLcXhHeTRENGNKbHNINHRiV2o5NXNza04wKzlE?=
 =?utf-8?B?NVJheFRMTGtpbEsyMVVxbEFmQ2hEQi9PY285bEFmK29kNlhXcFBKTzY3c2pv?=
 =?utf-8?B?dGFkZUpIRWV5MjlxZFdDaHVVYm1FOGlkNEVSWERCR0JNKzBFNElFNjFTa0c0?=
 =?utf-8?B?QjlwY0pHZnhiQ3g0Y2VqTnRvc3V2L3V5MUNDZXJSRDcvVW1zcDQvRThDU0Zx?=
 =?utf-8?B?L2Y2RWR6VElnaEszVFhEWWhxMGVlMWZKbitLUUZwYW9OZTk3S0E1VXZVNTNv?=
 =?utf-8?B?OURITlE0NXkrcUFzSmZsTFBtemV3OFhhVHIwR2VCaUlsemtZV2ZHOHJZMkFB?=
 =?utf-8?B?THFXODhtbUc3MGFUa1NuQUJBREJiRUcvNW41TFRMQ01mVmxWRXdWamRGazFP?=
 =?utf-8?B?NDMyakNvQmJWL2szdHkzOHlSZ3UyLzh6b0VCMU1vcjBVRG9hemFtYzVFeGha?=
 =?utf-8?B?MUY1bWlSeHlUZFc3Qm9ueisva05hcFhuMnhmaFRhMzNDa3lQQkoxdm9vMWVx?=
 =?utf-8?B?S1dkYVdsSkdYSGkzVDFLdU9PdzBoQ0c1aVo0bXV3L0kyUkpCT3FuaGhibDJu?=
 =?utf-8?B?dFVXdm5pdHEyZE14Tnc1a3lOdEFKWHlvMldMVDJ3Z1F6bElWNFBKODZSUW5K?=
 =?utf-8?B?VXZwYUZyQ3hobGpVdVExNWRWZ1Y4eXVqbkV2UXViN09tbE9tL0MwdWZENXRM?=
 =?utf-8?B?UlIrTEpVNVYrOUdSam5aTXBIREJpUzMrSzNoSXJNQWZBd0pXcFFWaDdzRXFh?=
 =?utf-8?B?OW5Wbi9abkhBaVBsMXVLRHJtY1ZnOGdtaWt4MGZSOUNDaGtDOEJESjNRM002?=
 =?utf-8?B?aFI4VGMrNCtGamRGenBEcVZjakdPZmhQVm4yZFBmekpYa2x3YkxkYmp1dzNt?=
 =?utf-8?B?ZDFxY050MG5Bekx6QjlvakxGNWhzN21VZU9Xa0hiaytOR2lNQk9iWE5pN2sr?=
 =?utf-8?B?ejNMczJRUHZIWmhubHpseVRkTFpPZm0vajFLZ05FQkt6ZGowbDV0ZUdUalZs?=
 =?utf-8?B?Sld3SkYvakRBanJPMG5WUit4THVYK3Q2cVE4TkV5S0tjYVd4T3gzYWVWNDIy?=
 =?utf-8?B?NExQMWRBZUp0ZmR2MnY4OTVjT3k4TkxwbW5DSnFGaGN1MER5VVpZWFI4bmFi?=
 =?utf-8?B?bnRRdS9oSE5YZEtQYmlBbjNsTzdDSVFyU1lnd0VSVkpBRFl4Q3RadVNqRi9S?=
 =?utf-8?B?UGl0U1NlZ3dxQnJvVC9veEUzR3NRRkJWOGlKaFB0UXNhWTRiWjhtK1U5b01W?=
 =?utf-8?B?ZlR0ZE5oUWRFK1h0bC9HNGF5bng2WktYRldSb3pLV3FiK3Z0bE94bWoxVXg5?=
 =?utf-8?B?bmJXZnZtMkN0bzFCUFlQVElaU1R6NWI2enNHbzlEZHVkbXVXbFZSeTI3YlRO?=
 =?utf-8?B?aUdvdFVoVXB4RjViMjJGZlZac0ZnL0ZzeTFpY2toRUNRamNHMkhXbUh3UFk5?=
 =?utf-8?Q?G8ZDAa9PuxN3OivumpVFcbItZgN4W6dl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUpTK3M3ZXBuL1phRjN0cTNnNlVvT0hLa3p3aXhxT1hEZTVkelB6L1FPem8r?=
 =?utf-8?B?RVd4eVNFNVhDakw5RElTUFJUR2xpZVQrL212UXN1ZlBUWTcrdVFZbnNsWEtw?=
 =?utf-8?B?MERYZXo1VWpocGNSSGU4SU9CUVZaTVBGdS8vb0F4VnVJQ0MvOFF1SDBvV09T?=
 =?utf-8?B?eXlKV25DbEZseWkwVzNPWXVmNDc2UW1UcFc0SE1ibTRtV25IN3FtWDN2RFlL?=
 =?utf-8?B?VUllZlQ3dmhoQ2Rrc2VHNWhaNGtsK0lQdElGdEZKTk1sMEg4aE1kNUR4bWpM?=
 =?utf-8?B?cXorQ1h4d0xDUlBVNU00S2JrYXJiNGRKOXhJU01FWVd5cU5jV0hFWUMxU3Bh?=
 =?utf-8?B?Z2RqWGNJWmxxaHdleTlSRGtnanYvZDRSbVBTQW5kRmNyWkZMUEYyUDN5UE9r?=
 =?utf-8?B?dE1kdmZGN29BcVlKcGhQL2t1cGd2RkdPd3h1cWY5R21oajRpMXg4Yi9TOFlP?=
 =?utf-8?B?djcxUmliUU9HVjgzbXFiRTJ3Y0hiQm95MnRXRW1VaUh0aU4zN1lSSHFMK0o1?=
 =?utf-8?B?bCtoSmxkVjJocWxrdG5tYUNjR3NzT2tIT0dScmhYaVloL3NpY0pYclQ1ZzNp?=
 =?utf-8?B?UC8wMU1TOE11QmFoYjFwYm40V3hoekM1dzZDTEhRL09vUzBXQURwTUFpZWNs?=
 =?utf-8?B?VzNBK250RXhzb3dYYmVxbFJsM0wvTGdtT29hYW1yU0pNRzRnT2lIVjNhTEhn?=
 =?utf-8?B?S0d6NG1ZYzcwUGY2OUQxc0FxdHo3YzdWK3k4MHp1ay85eEhWbldKL3VFaE51?=
 =?utf-8?B?bXJIZ1lObkg5Vkp4M2c1aDllR2VBZUxVUXdzK3pYYTNHejVHT3lzQ0UrQVQ4?=
 =?utf-8?B?c3VNMXplS1J6NWhxMkxjcWo3MllyLzZqS2c4K3FxU0VMMlRyY0ZpNGNsNjBz?=
 =?utf-8?B?bFcxRjdjT2l1UXF4SVBRRytQWk9WQ0gzdGRaTExaUWJFMUNVLzNLQWJNVXZU?=
 =?utf-8?B?OXRoL2xQczJ0dERxV1hOQXJDNGpsd1M0VDFrMEhQSThZYnZMQzZlQzhlWVdo?=
 =?utf-8?B?azB5YTl4ZUlnUEcvVWJwSmFJTHJKczVTa0t5TG5sU3J4Yy95RUtwbTVGTy9M?=
 =?utf-8?B?Z0txSmgvVHFuYjlTTTN1UExpNHljRlV5M05jSzNYUkRPMFZsZmJoK2xLaGNk?=
 =?utf-8?B?eXlvV2hZbFBkZ3VvK0dGWndtdElhdzlud08ya0VPSmVPRVRlMW5DYlFUTWRK?=
 =?utf-8?B?b0NzNXd2cktNVHQ4Qjh1L0c4RlpIUnVycm82USt3N09hZHYyZlFSeHFYWC9o?=
 =?utf-8?B?V2Z0K04zVFI2emZ2ZFcxYk9uem13ck5SWVlTQTFsYWJta0IxcXd2NEtnR0hM?=
 =?utf-8?B?YjBhM09nNlUyVjNZZVRkNG40a3lkMUROdm9lUk96VG5FT1NwRjd5dzR0YXAv?=
 =?utf-8?B?L0QzK3c3cmtsSyt2VlFCNDZBTjBvWkV6aGkrdEtxam9HSEY3T1BiaW9jOWZx?=
 =?utf-8?B?VW1DWHZxSk40SXBjcERMMmdRbkNZUDd2eGlxRVlRZDNUY0pHTW0zbWVMcVlt?=
 =?utf-8?B?VVpTeEM1b0NNZUNnM3VVWHZjU0lMQ1dFWEJwWjNPcHdoNUI2NExTbkI0dHc0?=
 =?utf-8?B?UVd6RHozOE8xYnhoRVlSOFJldXRRbVR1b1hKVHhXVGJKellxS2JJdEFHT0Fz?=
 =?utf-8?B?UC9VbVVYNWtvRFQwTlc2S01IUDFxaGdsTGtLMC9hSDkrTE56OWZBTGU1cHZj?=
 =?utf-8?B?NnVTM1V5a2ZtR29TY0ZjdVQ2WnVEOGlMTXVwY0RvaEw2VkN2RXk1RSt6Y09p?=
 =?utf-8?B?RzBkbkk1ak1uOTZTYkFNSTlUQzcrQ0pzNWplZWpTMjYzbHhHUTQ0TllkcDRh?=
 =?utf-8?B?NlZ2S3FZYUQvYTJBYnV3NWJ4THEzZktVS2lGaFlyVUNmY3IrQnhCTkx3U3Zh?=
 =?utf-8?B?R0l1dk5RMjdsckZuNGZnWklUNTZaNzJoVnZyUmZWWUpiR09jTVB3cVBadlBn?=
 =?utf-8?B?RTJPYnBrYlRFZXA3dW1XTDlqMFJXZ0U0M1ZiTzlUSjM2WHVkN3p2SVBYb3B5?=
 =?utf-8?B?NFFvU3MrSGhoK2pLOThqTHIvdXlJTGNhT0YraVVsbWk1SEJkZnRxVDNsbmdu?=
 =?utf-8?B?NW1QclhGQnhWeVBRRmxZYXdDU0dwYVNkbFkzRVRHeXdEV2lFTXlKRTVJRGFz?=
 =?utf-8?Q?+4WEs6s43RcVtFr64+2JIQV5H?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb3edd5-3857-4168-e42d-08de0fb818a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 09:07:30.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZcQOezYS7K/wjkO9bPNtMV8szGw0vPK+RNTvQpQtGcF0+3QKDAwb0VQdoSSRftVZPRw2URGjdelhgC9Y5y0aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5011

On Mon, Oct 20, 2025 at 09:46:42AM +0200, Jan Beulich wrote:
> On 17.10.2025 16:14, Roger Pau Monne wrote:
> > Otherwise it's not possible for device models to map IRQs of devices on
> > segments different than 0.  Keep the same function prototype and pass the
> > segment in the high 16bits of the bus parameter, like it's done for the
> > hypercall itself.
> 
> While easiest, that's an odd interface, though. Should, at the very least the
> function parameter then be named e.g. "segbus", along the lines of "devfn"?

I certainly don't mind using segbus instead of plain bus, will adjust
now.

> > Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
> 
> This commit wasn't about tool stack uses of the interfaces at all.

But there should have been a tools side change somewhere to make use
of that interface, at the point that support for multi-segment was
added to Xen?  Otherwise the support feels like half done.

Would you prefer me to use the "Amends:" tag?  Or no tag at all.

Thanks, Roger.

