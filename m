Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630F8CAE06F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 19:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181085.1504193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgJD-0004UX-7k; Mon, 08 Dec 2025 18:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181085.1504193; Mon, 08 Dec 2025 18:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgJD-0004Rz-51; Mon, 08 Dec 2025 18:50:07 +0000
Received: by outflank-mailman (input) for mailman id 1181085;
 Mon, 08 Dec 2025 18:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKnm=6O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSgJB-0004MD-Lk
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 18:50:05 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5240716-d466-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 19:50:04 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by FRWPR03MB11145.eurprd03.prod.outlook.com (2603:10a6:d10:1a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 18:49:33 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 18:49:32 +0000
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
X-Inumbo-ID: b5240716-d466-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK8wPySdPGFQAApDiZIbYXDkaDlynC+yxO6/2mqFqULGQt3Qeu0MAKT7BMGoBGJ1xnyedQtfZDYpSjmxYertXGFAaRZ8o2uhDFssdmNanpyCLBSnrzFDf1RQF7FmpBJPOWt0AnJaZhHYfPFr0uhSW57h5zdKbmBVJtJewBroxpH024DbvgvxfeyKXgCJ/h2FO+0S5vR+JFtU02Vn91Ba4ObwR1MR7aysYfE7Row6t3oopA0xvxOnxJK0WbsiLU5m4Z0mFvhklvgCfdbHdQQaCdpOyObXUNdZmZLfO6leyfMULCxETX8WnHeMaVNeXQWuJawYuMXFjSoq82I3gwWQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD3qdM+cI5WWe4xBURfaC4spk+PsKTDzMNrD2MP3wQM=;
 b=f7Ws6FmO56EEm7rjGJjbhNi75pQnwKbBS+4utHVC5x7MLiCW22tyMJCyJZ6dUPxiUCFeVvKyILmtfMgq7K5nCVa/ulonpjSQAnqPnXba5pOsx3OO9oA7i7yNqv+r29dbCKkqRXQ62aAk9jXeP664ZfSbe0dTOLSUCHDTpzwGbxCYOUQAOucpjUJitbpZnIbjuTMIosqbs+R87w+oqnPF9N3kweupu9Zyzzu3uVuWe5XPTAHBHvEtBEtjVmdK6gVvqO8iL/VN182YcFn+pjH7seuTMM/aBRZQFY5IPH9+x7aXaF6A0fRwjKghlvXil0ZNjiuhCFyijWHjHI+ZlJwMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD3qdM+cI5WWe4xBURfaC4spk+PsKTDzMNrD2MP3wQM=;
 b=kSNhy1zqOPt4lD8LDMAFof7X81FpcJri/C3R0dyslg2C5FtMtC6V9V6WbXQoakiulOnxyo3eCcTsFIR92r3cgClFDYyIOkBtcIHVtY4OmGbuTqCkYpjI6wdIOE0vSv6sy3LbYU6B9BJkN7eBx8MJ4mdtNuZqYTP9d+kZ61vd5W416HssEng/YkUemlC/3i5kbTdP9cSlQUJpn8SEmfXRnQJh+p7v/wd+wv6mB8W5OGmfibHQHsmA22zB5DtkzegI2MO2QTKpwBDbX1JEF3ppZE2LtHY32m9hHEUPm1JIkEdDaS3yyP8aGM/AG+PvQateWRKA2aTJsJ8BCI8GAbxafw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <18ab3734-deb9-4569-ade5-9d96a7bf3c7c@epam.com>
Date: Mon, 8 Dec 2025 20:49:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
 <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|FRWPR03MB11145:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c3d35e-c160-4a66-def5-08de368a86ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MCtsRzhsdFJxZERpODJ4Wk9ZeUxVZGgwMTdNbkdmaGk3Ujh3aDY5Y1JIQ3hh?=
 =?utf-8?B?RzJud2F5VldPbFhnWHg3Qk83bjhydWRucFhYMExjMWVpU3BZUGFSTlVhQys5?=
 =?utf-8?B?ZnZIRnRNOEp6WFhPSjBUU1FsWGRTNjc5Q05HUzZDemdYallMbWdVRmpzT3cz?=
 =?utf-8?B?aEEwcVBoNSs5R2IxcTkyeGlzb3VIdXV3dERkbFVjaHpOUnh0MUlqRm55M0RZ?=
 =?utf-8?B?YlZxUVFrR3kvRVo5YTJHZFZqMG1hWU1VczdsNkNqUnNXQWtOdTFTWGFpZUc4?=
 =?utf-8?B?ay8rSWtrYm1waXZBNGZhODlUcE9IUXA0MHQ1MnlCN0NrWXpTY0tadXpzUi9w?=
 =?utf-8?B?Sy8wV0pTeDQxcjBXMkhRZDVTa3FkUzlUdGVnOUNsQWlYTjlCdTcyamo4Z0tq?=
 =?utf-8?B?QnpaZjV3VDZGSlE4UlFEbXBXb0NucWp5a1ZUcHRWYmc4d2I0MHd3ZUw0L0tJ?=
 =?utf-8?B?Y0R3czdyV2s3b2ZnK1R3OEdEZTFTVUZtR2FadHNZK1hzWjBURXpqSyt6NzBs?=
 =?utf-8?B?S1dhNzhhZGo5eGVoK1lqUnU5YUlzd0dEdlpsTHMvNDcrWDdzM1R5SU85bHRv?=
 =?utf-8?B?M1RKUnl5Zk9GYy9HY2dJSmlGbmw0cWtYSHZmSDhtRVAyejNNWTJGUXpNYzF3?=
 =?utf-8?B?SVZBMnhodnVDaUdpM0hJN3Y0RU5NOFpKS0xtTCtVMjJjei9FRnJEZDRLUnha?=
 =?utf-8?B?RTBPempLK3VzZUtKTVg5Qm15TnNBVk9pYmJiZ05IWjc0M05tTUl3M2NkQzc4?=
 =?utf-8?B?N0k4RWhoK2QvSWhkY3VCZFN1eGR6MVE2V1RsZzBLamRCbUVHRHhiSU0vZFRY?=
 =?utf-8?B?Wk16cFExdVhKYmwySG5BT0s2bzZSelRNVk9rMU1QUm4raWUxN2FCZFcyOHN0?=
 =?utf-8?B?YXNJYkVsYjlnT1VET2d0WGdOVHdod0E0aUROaFdGd2dhaDcxeGlSWTZNMHJI?=
 =?utf-8?B?Z29NOG0vZjZWeTFyUWFISVBLcUNBSFFUUkd2WlUyMk05akYzV0kxTStpVnFH?=
 =?utf-8?B?dEpYK2Vsb0pIK0FwWTlmTmRIUjZGQXQ1U1pLZ05XNU9oK3V4TmRTM3NjVENR?=
 =?utf-8?B?MnhuUmZjVnVrd0QreHhVZnU2U2EzdmtPcy93dWJHNW56YU53Q0dEeVByNlJo?=
 =?utf-8?B?WmtEVnZlRDliZG5yUmlqRkl3c1k1SlZFOHVOMTlTOVRTTEJDdVFCaDRXVENp?=
 =?utf-8?B?djFnWk9HSHRXZU9JZTFwbXBGd1RxKzA3My9BTlpoaHliZW9lZDk3R1QvdEgz?=
 =?utf-8?B?T2MwdVNWYjhSVERnTlJ4NDB3L2pSTmE0T25JbE9ZUnFLQ0Nud1RDdmo4RTJr?=
 =?utf-8?B?MHUwa3dvMjBNeFIzbWZCK1ZiQkdnNnNBOUl0S1BqdHpTMlc2WDNuUkdMbjEz?=
 =?utf-8?B?bEJqL3NyYmIwWUtLMVJNYTZCR1dZcWpaTGlqMm8reHhmaUdGUFBlVzQ5T2xH?=
 =?utf-8?B?TW1ZQjY5NytETWp3NXYrOGVqRWlpdXFBM0d0TkllZWRQeHZtWXdVZEtsenJr?=
 =?utf-8?B?eXl2a3hNM3lDRGtvQzlUcXc2U0xkMzJNUjhJY3dpc0V4OFpRTWt5b2VnSnNm?=
 =?utf-8?B?VHRMWWdCbE5MYmZlMkh3ZWU3UmZoOC9LUVNxYk9NSlBhRFB2S3Y1VmRYODB6?=
 =?utf-8?B?UndVZjU0T1VLcWdjNXlRcytiaHlyNzg0ems4KzIxTDA5OTBWd2tTRzlwWDY4?=
 =?utf-8?B?MjFFMkJ4aHpYVTU3QkxnNnpJZG1RMS9TNWVweXFneDd1VEJCTjltT0g2U0ZG?=
 =?utf-8?B?WVQ4M3BDTUtOOEIzL2J6bXcwUUVoRmUwemhhcmRBTWtud015by9ydll1TlNa?=
 =?utf-8?B?dDR2Z0wzeVQ5VkcraXM0eGJRdVlodk8wVGlNSnhTaWVscHBFdWppK09yTkpZ?=
 =?utf-8?B?d0F1SEQ3N3RjTlVjUVJsTUlFUDFSYkV4UUpncmlMb0ZhK0pnUFJZSElZZkxP?=
 =?utf-8?Q?673pR/MXZcxp2EcwLN5PexB9BU36073G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU96VW9TSGhDejJjbVhaeEF4MDhoQVlzTWRrbDIxZXJVZHBYOTR6MnJGcTFS?=
 =?utf-8?B?UjVEbkxtUlN2WDVBYTQybEkvZnhXYmhTenVkcVJ4ZkZQblVFdUNGbTg1N2R6?=
 =?utf-8?B?bmVHMWZlTmdpVURGZThpTnpjdlptVnR3MDM3Yy9YbzJ4dnVBaFppcGhWdngv?=
 =?utf-8?B?L21uNE5vdTR6TUQxREpJaDJPVFlTbjBzY0I1Ny9MVXBwY1Y2NCsxMWJYOXRC?=
 =?utf-8?B?YVJ1RCt6VVFReW5jNUtEZXk2aDNkWkUyVGkzYk9sR2gxUHYxR0ZxK1V2NCto?=
 =?utf-8?B?WE1YZE1wcTF3WWRlNVJlbS85QmxENGNVbFdKVjQ1ZmVYbFJ1QUQwNGpuTkhi?=
 =?utf-8?B?T1MzMjlwRDRKaVh3dFByUlZobzJqc1Z6czYyaFZVMThhRitNUGpJWVA4aXBN?=
 =?utf-8?B?ZmYwb09BK240TGNGM0VQc0FXNkphSlBWNXBXbVQxdUp1T0EvYTNWV1BuVWha?=
 =?utf-8?B?Nk1ObkdxRk1xMU5KUlJ0K09pbC9xdVhkUjEvbHJqVnJ6bEkzQjZJZFl5TGJ1?=
 =?utf-8?B?VTJIVnZrNWdqN205OTZSajB5MGRqaEptaUt5cnRuZHRZRkFWcE12ZXJZaGE5?=
 =?utf-8?B?N1I4enVsRVlHVkdUdmZpNFNZMHBVWi9FVzZDNDI1bDlQRlYwTDIwaGYraWFQ?=
 =?utf-8?B?Q0t0Y2ZyWnhYamVBNXNlYktSWnl0R0FVMlFWMEdEQWVCOE83bEZXZmQxS0Jy?=
 =?utf-8?B?R2luRTRneE4wWFlvbjVWYXFtN25YbjNPVFF5QW5BS0VzcHA2dWhQOVd4dUth?=
 =?utf-8?B?MVFDWld5a0RJaVhrNktWdzA2bG1ocjkvR1I2bUlsQUszSFo2YkFPUUFrSkxW?=
 =?utf-8?B?Zm40UFdrLzRadmsraDVjeGp5ZHpxZndna2hOQmIvNXAzQ3RsWUR2ZXdkZS8r?=
 =?utf-8?B?bGd3dUd4aE9DZS82L3pDcHZqaFcwZDFGblpkSmR5SDY0K1RRVkRqQkJCNFg3?=
 =?utf-8?B?NWRRUVc1Zk9MT21YdEtQRmgvK1RGL2xxMXp0OHk3aUxRQUVHYWZiSEs4S3Yx?=
 =?utf-8?B?UjBVcHZZT3dFUmRyY09VMUxUUHVKSTBpaFVwRG8wNU1OS01DSEVmUk5nK1Bw?=
 =?utf-8?B?eXE5a3R4M2Jub24yQnF5OEMwQUJkNTY0RmpkZG9qQVovb0xiRU9oY1Y1aG9q?=
 =?utf-8?B?Z2YxTHJTMnJzREN1M1IxQUZWNGRVOXNUdzRQOWtVSGdIdTluRDA0SFRuNkxr?=
 =?utf-8?B?aTBEbXh2ZGpFdlErNXJLL1RVSnRBQ0tmTndZendMMjNLemJ0dTlHbVpySDE4?=
 =?utf-8?B?SW56Q1c1dWVnWFNDWmhoZXZkaEowMnI0M0ZncTZ6bnBPd3dySmNNTGNQSWJy?=
 =?utf-8?B?aHhHeWJHMUttUWlrWlpNaFN6MEs4R2VtUll0RllhSG4rVXdPU3lqcWRuMG1U?=
 =?utf-8?B?OFNvbEh3OGJ2VHlsVEZOcC9uK0hkdUVNZUpaa09ld2NnY0s2Q1pkRlpUajRy?=
 =?utf-8?B?cDAxVHlJZExrLzhXTG8zRG9CMEdRMlk0WmpkM0k1b3h0aTc4cHZKOTc3MzJI?=
 =?utf-8?B?V2hSaW80VjJESUxBNnhPWWdBamV6bHRiT0wySGEwWWVjMTlTS0M0MGxibUJa?=
 =?utf-8?B?N2NyRXMxTTRDUG9zeWxnOW9VVmFvOUNaOEp3RzUrQnEyTDRtNWRucVkvbk0r?=
 =?utf-8?B?MEpNRDVvY3RvekJhTS9yUFVMNDBLKzF5RnhUdU00NlNRbUY0eWNBL3o2V3Zw?=
 =?utf-8?B?SDJpNHgzWHU3WFhKdVozM2k4RkdKbWQwa1RhaHBzSWUxcGhsbmg4VGJsaEFO?=
 =?utf-8?B?OGx0MmVwWUZCbThUQWk3aHMxUDYrN0pzWGwzNzZUYldoZHRqNTFWNCtOaHIv?=
 =?utf-8?B?UVFuYmxHa01IcUFBd083c1JDQmpjVzRGTkw2ZzBldnBEd0ZJdmFTRzRwYjFO?=
 =?utf-8?B?SndEbjFRNitlWkN0RklTM3Z0TDFJVmk2YWM0V0JUVTJGZWRmdlpSNm5ZeGN6?=
 =?utf-8?B?TEJUL1RmTmp6UUo3cnBwR0t3UTJtVTJTRVRkS3pNTTRudW9wUXRDMWszYi9X?=
 =?utf-8?B?dUtzSmpJQTlZTWFocFk3QVA4Snpld05PeEJFb3BPY2dIdnlrVDlGUmU4aU5j?=
 =?utf-8?B?WnloempvSjRNMHZGTUtGNWUwNnpscjBBajZMd3lXdU1wZ0VFWTEwU0hnRXNI?=
 =?utf-8?B?RDZTUUZrZklPY251WGtJaDdSNUFKY1ZZajdIT0hoWnUzMmxheFU2M2YyT21H?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c3d35e-c160-4a66-def5-08de368a86ce
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 18:49:32.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Zv2gPk6hWGJwtx/m3Qf+pSF4KUJVSft1FVeP3m9xKJiJhh+J1oIWAddOcYviWuy9jEijRKPeKZcmp+2Pm/3Fah3T+dWuaMq+ZHbgSPf6mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB11145

Hi Andrew,

On 06.12.25 16:21, Andrew Cooper wrote:
> On 06/12/2025 2:15 pm, Andrew Cooper wrote:
>> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>>
>>> On 05.12.25 22:00, Andrew Cooper wrote:
>>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> Extend coverage support on .init and lib code.
>>>>> Add two hidden Kconfig options:
>>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>>> %.init.o
>>>>> files"
>>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>>> end of
>>>>> Xen boot."
>>>>>
>>>>> Both selected selected when COVERAGE=y, as getting coverage report for
>>>>> ".init" code is required:
>>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>>> - the .init code stay in memory after Xen boot.
>>>>>
>>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
>>>>> features in the future.
>>>>>
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>> changes in v2:
>>>>>    - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>>> different things,
>>>>>      both potentially reusable
>>>>>    - enable coverage for libfdt/libelf always
>>>>>    - enable colverage for .init always
>>>> This is a lot nicer (i.e. more simple).
>>>>
>>>> But, I still don't know why we need to avoid freeing init memory to make
>>>> this work.  What explodes if we dont?
>>>>
>>> It will just crash when coverage data is collected.
>>>
>>> First I made changes in make file to get .init covered
>>> then I hit a crash
>>> then I checked %.init.o
>>> conclusion was obvious.
>>>
>>> For example:
>>> objdump -x bzimage.init.o | grep gcov
>>>
>>> 0000000000000010 l     O .bss    0000000000000028 __gcov0.bzimage_check
>>> 0000000000000040 l     O .bss    0000000000000040
>>> __gcov0.bzimage_headroom
>>> 0000000000000000 l     O .bss    0000000000000008 __gcov0.output_length
>>> 0000000000000080 l     O .bss    0000000000000060 __gcov0.bzimage_parse
>>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>>> __gcov_.bzimage_parse
>>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>>> __gcov_.bzimage_headroom
>>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>>> __gcov_.bzimage_check
>>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>>> __gcov_.output_length
>>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>>> 0000000000000020 R_X86_64_64       __gcov_merge_add
>>>
>> Aah, we should exclude the OJBCOPY too.  That's what's moving
>> .data.rel.local amongst other sections we target with attributes directly.
> 
> we can't target.

I've come up with below diff - seems it's working without DO_NOT_FREE_INIT_MEMORY.
Is this what you have in mind?

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 8fc201d12c2c..16b1a82db46e 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -40,7 +40,6 @@ config COVERAGE
         depends on SYSCTL && !LIVEPATCH
         select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
         select RELAX_INIT_CHECK
-       select DO_NOT_FREE_INIT_MEMORY
         help
           Enable code coverage support.
  
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 8c4861a427e6..47fdcc1d23b5 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -33,11 +33,15 @@ cov-cflags-y :=
  nocov-y :=
  noubsan-y :=
  
+# when coverage is enabled the gcc internal section should stay in memory
+# after Xen boot
+ifneq ($(CONFIG_COVERAGE),y)
  SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                              $(foreach w,1 2 4, \
                                                          rodata.str$(w).$(a)) \
                                              rodata.cst$(a)) \
                           $(foreach r,rel rel.ro,data.$(r).local)
+endif
  
  # The filename build.mk has precedence over Makefile
  include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index 60b3ae40728f..8180c78f1510 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -1,8 +1,10 @@
  obj-bin-y := libelf.o
  libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
  
+ifneq ($(CONFIG_COVERAGE),y)
  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+endif
  
  CFLAGS-y += -Wno-pointer-sign
  
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index ae0f69c01373..fb26e5bff0fd 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -4,7 +4,9 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
  
  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
  ifneq ($(CONFIG_OVERLAY_DTB),y)
-OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+       ifneq ($(CONFIG_COVERAGE),y)
+               OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+       endif
  endif
  
  obj-y += libfdt.o

-- 
Best regards,
-grygorii


