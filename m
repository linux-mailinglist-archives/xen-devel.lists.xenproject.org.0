Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4090A2A5B5
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 11:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882703.1292802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfyzX-0007Jf-O6; Thu, 06 Feb 2025 10:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882703.1292802; Thu, 06 Feb 2025 10:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfyzX-0007GX-Kr; Thu, 06 Feb 2025 10:20:15 +0000
Received: by outflank-mailman (input) for mailman id 882703;
 Thu, 06 Feb 2025 10:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaX0=U5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tfyzW-0007GR-D7
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 10:20:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2413::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c6512b-e473-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 11:20:11 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 10:20:07 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 10:20:07 +0000
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
X-Inumbo-ID: f2c6512b-e473-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTR2dVIT+yHxc8Do2l7MoRK8a+EbyTqL71oofDQdERd7boTW5v2QHBmWPK+FFj51afvTPuc7AP8lMuFtuLyP4yq5tg4RRuomlaQtYACiSvKsL932Ghaza4tkQEA6sXTKaQQLiDwd9iSZ3Cm/IS6Jd3+Rwm0LgWCjX+9j8JRB0j/yj9MndLujQCKoMukv8+ZM8/oDiFmvZJ4YP1QIECxmXtmDXUyu4LMpUuyfFIIAj9mJS7Po8IWh7T3bXcq8M8ofTmwJ93mPud2gaamDmtGpZfT9/QGY1CXBzj3syHOX7aONLAv84TNMC9KJUBQZNsJNkptCXGeYqm0iwZunovjR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDEeEPhI0HjLxX7IulM25FPNd2KQZ5GWOMURNUwUzLc=;
 b=STbW/T2O/X9/1vWU/1+wk4Sm9T38IJTCfFKK/Yx891rzcnJ/U/wZRZuoxG9n375rZzVt8GISP0Rbh7w8JbTMR9QyKa4dS7Kuc9q8Kqm24j1YmFz3oGXD2dXmDiBWe1JrEwbhpTP3V/lV95Wa1QB/MQpFRNRJwIVR6U5CSdpQRLPrW4oGttPryw8McnDMhN8i3MA3YsNBOLfnnL6icTcwHhQumrOVmsmb+5hg+lGsT8vpPHQEm2zvxT/58YjfI5qhHfildMK7L7a7oYzM/JYzVIUdQziY3xx+VPDLzuhdsXVsY7vcuDmviCjXPJOs3wn6olgF92dAqgKXhlIjNpD7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDEeEPhI0HjLxX7IulM25FPNd2KQZ5GWOMURNUwUzLc=;
 b=sNC6GRG6LTzATmSy51s9tHmK1XNclox20z9lLiPxidoB4TRukOHiD02ojDdNPe9mU7trG3iE5rRfjoIV/Gu6iIuuCitUt9hF1/r5b2ebu0Zowwx/eNUN/0rzFoaYA7l3VFynST8IT3Eq+Fi4BoQzUUVChNpgybsWT7kuHdOI5Fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b59a3ea2-3b2a-41e2-8bd7-ad2beda414da@amd.com>
Date: Thu, 6 Feb 2025 11:20:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
 <20250206010843.618280-3-stefano.stabellini@amd.com>
Content-Language: en-US
From: "Orzel, Michal" <michal.orzel@amd.com>
In-Reply-To: <20250206010843.618280-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de7cc40-9a4c-4f29-3f11-08dd4697d457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1UrK2t1WWRZeTJYd0JIQ2JMQnBCRW1uMUtHdUhpRFdBY2Jhcno1M0V0dkYz?=
 =?utf-8?B?TkE4YTdqZUdWOHo1S2FnekFOcjlEcEttakZDV3ZYT2VKY0JYQVIvbzVUUWMw?=
 =?utf-8?B?eng1L1QyT1dQb2Y3dEZZRFNjM3Zqc0lIMmIva0VHUXRCdmloNm15aFBYOEVw?=
 =?utf-8?B?cUZQeHROd1ZPeVNUZTVPY1YveXhJNnIrdWRxSGp5SUtsUkZxRHJLdEhqVFhV?=
 =?utf-8?B?RGo4SmV5Vnl1UWZWQ1RVSXN5blcvMW9mSDJqeUtEUjdzcUpXRGlwaGpScWpB?=
 =?utf-8?B?SCtaSXZWc0pkdmZtdWtWYXp4aTJzYVg1NFV2SGtvT2pxbEp1UnVNcHR2bUFG?=
 =?utf-8?B?NUwrYTJDazhqN2p1UHc2Ui8vM0NsYldhdzMxaUZYS2IrVmp6ZmVOQ1lzbjBq?=
 =?utf-8?B?ckppdUIrNTdkQThrdFRwWDAvNHVsYWd3UVA5aUlpd1JDWFZSb2xMVXFkNWhW?=
 =?utf-8?B?dnV2ekdoTFo4cFcrRVFVakkxL083K1R4cUJDZmR6bExBdnlpbURneUVTeTFN?=
 =?utf-8?B?MGlMRWJDaUVPcjdWR1EzMk1SUitUWVlQLy9vNll4cytDcFF1eEJOTFVGWGhs?=
 =?utf-8?B?YlBaQytqbklFdUZCMWExNjhXUlJjREJQMlZBYmxQN0lwWEMzak5pNU83TzJw?=
 =?utf-8?B?RXY4M1lYUTc4ZWZHT0dkeHVBRlExbEdXS3NML3d5RCtyM05kVFN0R2VsYTdu?=
 =?utf-8?B?SEkycTNBNlJwSnl2K1JQdmlibVY2N1gwWXNTMHRFazA5VWJZWDdHS1VIblM1?=
 =?utf-8?B?R0ltS1BpZlJMTGdWVkF3endzTWV0Q0kvQ2xKWXFpRStyTzh2Ti8weXpSTld6?=
 =?utf-8?B?ZmdCWUR2Wmx0ZjduNHIvcW4zQWxQQlJxQ2t5MzZYeFdLalI3alo1TXAyZWtL?=
 =?utf-8?B?VWd1S2tRS3VNdjBIRlBJbXl2YlczeEpQWXEyTnFudTNLbVRLMjNtNlZkd2xB?=
 =?utf-8?B?Z1pHUHZLWVh3dUR6UlczWUlxTTY2N0h0LzFQdysxWXZrS0Y3TlNvUGl4WGhQ?=
 =?utf-8?B?UWczUFJyVE9td25WZWRZd1ZXT1VPa2lWbWxPdU1QMzRNSVZQcXh4amxnSXlV?=
 =?utf-8?B?THFKNlJ1bzBodXFpejN6VmM3SkIwenl2OFI4KzVKeDFjQisvcFdHaVJiRDBl?=
 =?utf-8?B?YmFaVTRkakFFNHNhVWNFYlZrVlFsM2VnelZCNmNzRDY4cW1ralpucE5hT1Ri?=
 =?utf-8?B?MjJJOCtkRWM0SXdKaUhza1lMT2JpVkhDK1lFa01lU3IxNWhCVHNlRTRKck1T?=
 =?utf-8?B?NGt1NXpUUjJLQjRENUVxcXpvYjA4YXVQalRuL3h3UWphTXJLcC9kZFF4L21z?=
 =?utf-8?B?d2tMUllLMjFBYkFLb0NxRWtzbGRyYmdaMUc5OThoTnAvZ0Z6bjBEeFVqeW5Z?=
 =?utf-8?B?anFJUkVuaEpPc3cxeURIZVU2Q2RwbzFyVTYrbnhGZVFNNkRDNmVaK1NhdXAw?=
 =?utf-8?B?TjdhNTZ5bEpqcWVhZkdQN01ydkUxZ0x0V0VOWHJHVGhUTGZRK3Yya2dQanRI?=
 =?utf-8?B?MjJSVnVaQVhZYWtYL3o2Q0RiS1BGemszamJFclRHY1VYWXA4ZzJJc2ZGUi9i?=
 =?utf-8?B?OVdxMDBGYlRob2VvWTErZWtBM29XRGFZb3NRQzNUUUdzRmZTUmJVcTU0YW1h?=
 =?utf-8?B?ank5ZllidnJreUgrUjA5b21xK2FETkdDN2VHdDBSaHdZd2pqTTQrS1R1QjFh?=
 =?utf-8?B?TGxPNTJhcVh5MzhsaUdXSGY2N3lwbnEyV3huZnkwRlpYUDdldmJZcWtZNnBx?=
 =?utf-8?B?T3JPS01LQ0xxZGV1WEYvaFNQZ3pTU3hyR1B4WWxaaUlhTlkxTysvcDhyL0J4?=
 =?utf-8?B?MFlzSUdVR2k1T05QVHlqNTlvaXg1a2pkd0tYV3V4WXl6d2hkSDFUQXVjUGtB?=
 =?utf-8?Q?SufOCue7pEkMc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm5GNWl3Yk52enVZQXZNaENoNDhSaHh6UzFhUWF4Mlk4d1BpaVkzK0xxcW1j?=
 =?utf-8?B?QXk1eFRCRmJRRnY3eXJmWTJQYnB4V3R0RVdldEljUnd1b1VFZzE4eC9WZjlP?=
 =?utf-8?B?WXhMZEJqaFNwNVpFVUZMTGwrZFcrNDNjRVQvYUlFTEdTNW0vK0p3MGIzeW9O?=
 =?utf-8?B?SzRETFgwS0MrVjd3Zzk3VlhWRWZQeWFjMXA1K05LZXZ0ZWlscllUN2JBQzQ0?=
 =?utf-8?B?RExqV3oyUkk2a0tDcjVsaGRWaHAydS9rTTh4dmN3alppY1JBcjRIN3dEUXN6?=
 =?utf-8?B?QUk3dDBDR3JCYVNHVC9FK3VxMHJRV1dqUU9TeHhCVm1xM21IU0VRcXVTK0to?=
 =?utf-8?B?N1NJeXNKZjZvdVMzbnZXSjE5YTdTbkgrVjRES2VHVTJpM29BdkVBV21Ka0ho?=
 =?utf-8?B?TERhZlVDOFQrMEdXaXlnSnJJK3E5OHpnVy9nNCtCeE1nNkNPTDZUT0RaMTdT?=
 =?utf-8?B?Uys3Q0NQWVpoQTZ4emh1RUxHZXFmd0ZDRDMzbVFnVE9nblpUWHQrcWNxUnN1?=
 =?utf-8?B?bXV6RkJINUt6bSt3QzhMREdHVzd3RDRoaEJjQVpmWFJyUUY4aVMrUHJQeVM1?=
 =?utf-8?B?eUFFaW55VVJNd1ZxNWZnQm5VUUpvaS9ZNVdQRnROeXViMm55NUxNcnB2R3Iy?=
 =?utf-8?B?OXp3cXJQOVRuclF6amRBNDdJQUNYMXQxZ253YStZeG5KSmQ4a3oyUHZrM2U1?=
 =?utf-8?B?eTBXWVpMbW5YRU8yblJjdENlbzhheGx3bFRWa3ZpOFFHN0c0eVBFdXNscDdM?=
 =?utf-8?B?bHVBNnQ2dlIrTnRZRDlpTjNyanRkU1M1eXRSMjF1ZDF3bXRvS0h0c1YvOGlV?=
 =?utf-8?B?WDNpZFQ3VVdwWTJaR2k0bEQxSkZDaDlrTUdMdkR3cXd0YnRDbGMrRmh5Zm5u?=
 =?utf-8?B?c3E5VzlaVWJlQVZiZHZLRGFPVktDUGtRcDNXU0NaL1dlLzZvMy9RWDM3Zklv?=
 =?utf-8?B?dWRWejBRdzlHVnZmNWM3M2VNdkNLK0FmOW9DRUpMaVpjQlR3Z0lqYUxPbGFl?=
 =?utf-8?B?ekdCMlpzc2NBQXkvS2M2ZHJUdjhNcnBBbEJwdFZ0bWZHRGlnVWxTQzg0SXA0?=
 =?utf-8?B?cElTRDJrTUFzM1B2NEhKZy9lRzlhRjg1aUx0NloyRHFwdTJNejdrOTI0U1Nn?=
 =?utf-8?B?Q0JmWDRYSXR2MGZVN2NFcndNVVdYZDdKdDlNNmhWV3ZVeVNMVmJmS3cwTEJZ?=
 =?utf-8?B?OW0zRDhlZDdiY21iK1QrVHovQnd3TlpDSGZvRFNMdGUrcFZSUXBLWVlKT1dN?=
 =?utf-8?B?KzZwQkVPN043Tjcray93d0RkVkM5bTJnSThJU0dOZnZUQzEzNXEzYy80Z1VB?=
 =?utf-8?B?YTVnOWlrZjlDTUZscVNqeUNBZTV4M1FrbGpqU1VNTlBDUXFSNldXTDh4L0Zh?=
 =?utf-8?B?NnlNbnpwdFJDZ21mdGxTU0xpSHh6clBJOW9Pb0YwVkFrVnp4RDNSQkpmSEgy?=
 =?utf-8?B?Zy9tZkNuR3cxc1dnZ0JFekxZVVZzRlVBYlVoZllwWEVqTjF0aXRidnFxWVgr?=
 =?utf-8?B?azVDSjBrR0RyNkhaRGlmdjN4K3RKOTBRa3I1OWg2MVFJeE5DY0U0UlVBbjdL?=
 =?utf-8?B?cE81dG1SRVd0ajBrY3FQbDZLeFFmWW02MVZoaE9BUGpXSmNkMWtJU004Z040?=
 =?utf-8?B?YU9VOVhIcC9yNVJIVEJMTkRZVjdiTXBTMjY3TVNZdUpXMGFjSWgySHZIUGxJ?=
 =?utf-8?B?SytXSzVxZCs0MW5kUW1CTjJaV2FtaU9RdTQrVzJ1NXkrb2Y4bWpVL2x2MVRF?=
 =?utf-8?B?NTJtTVJtaDJ6RXhHRkxudFpmdkhHKzFJRFl4REcvcFpXL2YwcVBZMzVvbVNC?=
 =?utf-8?B?d2VIR1E4TXlTT1VLOWpCd0lpZGdtVTZ2TzkwUGQyZWIrTzJuNVZXK2h3ZHhO?=
 =?utf-8?B?WGpRaXpuRzhRS3hnbEZPV1o3RFdQOEIwckNhcndDTFNEQWNNeUxNenpLUDhp?=
 =?utf-8?B?V093TUdTWDRiNm1oTmxIMkxlZDRlTXd4TG5tNkowSmsrc2EzaHEvVm5vVXdG?=
 =?utf-8?B?YitYSFVYQU1JSkkxcU9NV0c2aXB1c1NmZngrYjdWcTNKMVNFbzRzc2YwS0pZ?=
 =?utf-8?B?c1RXNTBPQ0ZoQUQxSkVJL3VpUzg0WEEyMDBRS3diazl5eHZwZlJySitQaDdF?=
 =?utf-8?Q?rVGLcBbj2Hpx4LJRbrgmgyFW8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de7cc40-9a4c-4f29-3f11-08dd4697d457
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 10:20:07.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55KSWonABrw7XTFtLM42357O/32WnKKa3f0RyY2pniR1ZjDYCEdzq9s3wtYUjJY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081



On 06/02/2025 02:08, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> There are use cases (for example using the PV driver) in Dom0less
> setup that require Dom0less DomUs start immediately with Dom0, but
> initialize XenStore later after Dom0's successful boot and call to
> the init-dom0less application.
> 
> An error message can seen from the init-dom0less application on
> 1:1 direct-mapped domains:
> ```
> Allocating magic pages
> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> Error on alloc magic pages
> ```
> 
> The "magic page" is a terminology used in the toolstack as reserved
> pages for the VM to have access to virtual platform capabilities.
> Currently the magic pages for Dom0less DomUs are populated by the
> init-dom0less app through populate_physmap(), and populate_physmap()
> automatically assumes gfn == mfn for 1:1 direct mapped domains. This
> cannot be true for the magic pages that are allocated later from the
> init-dom0less application executed in Dom0. For domain using statically
> allocated memory but not 1:1 direct-mapped, similar error "failed to
> retrieve a reserved page" can be seen as the reserved memory list is
> empty at that time.
> 
> Since for init-dom0less, the magic page region is only for XenStore.
> To solve above issue, this commit allocates the XenStore page for
> Dom0less DomUs at the domain construction time. The PFN will be
> noted and communicated to the init-dom0less application executed
> from Dom0. To keep the XenStore late init protocol, set the connection
> status to XENSTORE_RECONNECT.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c | 55 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 49d1f14d65..046439eb87 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <xen/device_tree.h>
> +#include <xen/domain_page.h>
>  #include <xen/err.h>
>  #include <xen/event.h>
>  #include <xen/grant_table.h>
> @@ -11,6 +12,8 @@
>  #include <xen/sizes.h>
>  #include <xen/vmap.h>
>  
> +#include <public/io/xs_wire.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/dom0less-build.h>
>  #include <asm/domain_build.h>
> @@ -704,6 +707,53 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
>      return 0;
>  }
>  
> +#define XENSTORE_PFN_OFFSET 1
> +static int __init alloc_xenstore_page(struct domain *d)
> +{
> +    struct page_info *xenstore_pg;
> +    struct xenstore_domain_interface *interface;
> +    mfn_t mfn;
> +    gfn_t gfn;
> +    int rc;
> +
> +    if ( (UINT_MAX - d->max_pages) < 1 )
> +    {
> +        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
> +               d);
> +        return -EINVAL;
> +    }
empty line here

> +    d->max_pages += 1;
If this patch is separate from modifying init-dom0less, max_pages will be bumped twice. Here and in init-dom0less.
Shouldn't we fold it in? The rest is ok.

~Michal


