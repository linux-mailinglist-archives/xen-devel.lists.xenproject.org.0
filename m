Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9BB9E4B6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 11:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130263.1469826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1iBq-0001wD-B3; Thu, 25 Sep 2025 09:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130263.1469826; Thu, 25 Sep 2025 09:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1iBq-0001uA-7T; Thu, 25 Sep 2025 09:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1130263;
 Thu, 25 Sep 2025 09:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jamk=4E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1iBn-0001u4-U2
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 09:23:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37fc059a-99f1-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 11:22:55 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by AS8PR03MB7703.eurprd03.prod.outlook.com (2603:10a6:20b:402::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 09:22:52 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:22:52 +0000
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
X-Inumbo-ID: 37fc059a-99f1-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a86yOlctfUdQLlfs05XKHyPYKxLkxYr/oupQ4jgkDrE27a31w+lI3aI7Tf8kGNkZFkLSC8GgPvcTEdt62kYqwvv8ojEDKTuCBSqfACqpsGYAc9ID3T18/IKEStSzvEHh4Vx4B5NIUVoIN5VMUkkZy7kgRmSF40Jfw1l/IytHmFMb15OjWEXL/6tF0PpowyCKjnowZUyjN9ZFVs78zY6PdDt+zQaXqrcWiSBiS/8fdgthzU/sozaMt7KmBE/AHV1YNj5psVskDiRXa5Mav5xrZoRUz3Og4PMYxF73BL/8JzF0Mg7U395ab89u5B5iiY0MeeQ+h5FebhtSCPHqXu/ORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7TvybvwjUfYCGoxuWlBmuojT+Oy4LB42lpufqmkQJ4=;
 b=O2qBMk7jd6MQ9PPoFdRKCU7+nq6legI8cWgvyWvRZjumGDhMRMkHQxmFlkw45P0j79fZ8RCKKN8ipk/+q4C7SrBtfylFAOlGB4qE3Zx60VmVS/FMwkv4rFreRYnvk8rAyFcax5+hk+xt7qPgie+Kus8l7chQe9w8JP7POx4Y72tEvAgVlC+jgwpno4uatiBLOmRWVMdKSra+OyhiLToqDhpfXhsLqU7xAKbsaTjqaScASoWuvgZWTmyT2AL/HE8aW1duTeIEUdtayxV6whVF6uOJ07R0oRGNoI0NHfMcXho6aaPLvnkVyI28dYmMpPCFO1kfktkyP5Ak9jgwXtUOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7TvybvwjUfYCGoxuWlBmuojT+Oy4LB42lpufqmkQJ4=;
 b=tfsH7QIOieb7sliBAE2O6BdCeMGVTwe/oLyAzstO9w3sgWNNnizNg51YTjRQFcW5nCLqDoCQ5iZlOahTTP8KCVcT/CeoSB26yRZ2W/jAjJpogx6ZtjsZvKOTinmJ8s4P9d0BKvAeoVJc0r32VeKHQaY0J1FPeck/xU8z9wciRXB83vGLhOCVSmrZe1+dAMqmAch22XHNDS8dT9Gz1Haf3hqFugj9yyp8cN3d/9LenTHji419sIZTkjAukUb/0LqNRQke/f28AR+xvBBV63E/tMi/06/+B7uP5/rX6OPzTbK+zX1qEZql82mPv1q1S3mkiwcS2kqSuaXiQg7GWhjfVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2954ab89-cf30-4b00-87c5-37449a571fdd@epam.com>
Date: Thu, 25 Sep 2025 12:22:50 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0360.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::13) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|AS8PR03MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 69dc6496-2e8f-4792-a95b-08ddfc151a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU1BTVFsYWpUbFZrOW84NEpPcTZ1THFVQ3h1ZjV3TDVHZVBoZnJ2cnJFUFli?=
 =?utf-8?B?MzdGenhlNE9TZlJJU3JSNTNlZ28zRHpsKzJiRVR6Smo5Y2IrQzFOSURuNmZG?=
 =?utf-8?B?enc5OW4wRElGYU9iZGNKQTJvdlhZMlZUanlnbnU2K0xFQlR4bkR1WjdhcXpa?=
 =?utf-8?B?RXBmeURoMU9ZT3NkY0xqZmNFUmlEbVk5cWR4eHdKaExpZWZhc0dyaFVzVjVU?=
 =?utf-8?B?NVg3SE1GT1FESmpOMUx0bGhOeEVNSEFpTjZ6NUZPcUlXSWxtRHgySWFSc2J4?=
 =?utf-8?B?RTQyT1BLbGR6SjkrTEl6S3k3c0l1VEFUbHE3RHhMcC9KZ0t4dWwxTU5Qclhz?=
 =?utf-8?B?UGgyTUEvNjZGNmRwcWdEWGw2K3NSSWRPRTRQbGg3ZUtwR2VSOWdSeGRpYjdl?=
 =?utf-8?B?eDJvSWVzc3Ivb2Nsd1VuUExwT05ZL0psWFJrcHRKS1dTWjZwMWtRWldmVU4x?=
 =?utf-8?B?RUUyS0JvcE9sWkhFUmovbDQ3aWxXSldMS1NwZGZucGg4bzZiR2YzNDVyM200?=
 =?utf-8?B?TFBKV2pyT2RIcXY2c1BnZDhSREloZFdjb2p4WlVrNVNrcXJ4VmNpYWpxclJZ?=
 =?utf-8?B?R3ZPWlRDUTNtOWJyZXVRSUsvL0pzcW42VTBVK0JNRmpKb05lSzhPa3FXQk1U?=
 =?utf-8?B?SlhhcTF2WXNFMnB1MVN1QkpnUytqcWQyRVU5QnRiTVMrVmkyRmdGSFYxQm9z?=
 =?utf-8?B?NnZ4dmQ0REoxczJvNW1BaEtFUU9TUXV0V1VZb1lRbDM3UWtZendDdmg4VEVx?=
 =?utf-8?B?eVk4VlN5cGpFWUJRY0hnclgyckNXOElqb21TOFIrOFdTK2NPOFVYSnBheThG?=
 =?utf-8?B?NHV0NXBNL2xWS0Z3U2VvaGtPeVBKSGJKaElnellZcy9VWE9zdWVoNzh6dktH?=
 =?utf-8?B?NDVLQVY1ZEJzQllxMTllclNPUlF0c2xlVThsTXV2NWhyQUp6VUExS2tOQUwx?=
 =?utf-8?B?QXgwNXUzdDlNVFVOaUo5VlFPaHRLZjFhcVR4RkRzY3pwN09vclQyYjRYa1BM?=
 =?utf-8?B?NXlXYkFDSEtQbW4wRnZHTkZHOHhFNFk5NUc4eDgyWXBFSTZzLzNBUTRFUy9T?=
 =?utf-8?B?TTFTa3B6UmFsaXBoVHpTbktZd1hqQTZtbE45UDdkeFlMK3lUVE40RkJudEtu?=
 =?utf-8?B?Q1JzaXFDa0tXbDIzcUdVd29VdENCR1p4WVp6bmZDUldGQXkybHEwd0xzVXgv?=
 =?utf-8?B?QVNJN3dQNXlFL2NWcVh3K0IwYTM4K2ljOVBleDVHOEd2NW5CbnJPckVnVFVu?=
 =?utf-8?B?bGN4aHRxVGh1b0RMZXJJckh3bGxlVG0wM2xhUktDUEY0eUJmSTh4N2dGZGdo?=
 =?utf-8?B?QXJOMTB5QXZnQ09wUERrMlUvVXZrcWJqTHBNaHQwa3JVYnVLbUxjOEJ6elpT?=
 =?utf-8?B?WjJ3bFdKMWs3OUxwY09LSFZja1cwbk1KcEVLSCtCczZSMHJLY3RLU0ZmZGZ2?=
 =?utf-8?B?N0g3cEgxeHR4OHJ6KzByWmRKZURZUE9yQVBxQk9QUDFpWGZHTW1Ic3NRWjNi?=
 =?utf-8?B?Qld5Uk9TYTNrR09KbmM5cnBuWFdxOFJqZnYwWFlaM0UzQzY5dkwrRkswSERP?=
 =?utf-8?B?Ky9aMUxwcWp5ZVhSL040bG1BREFEVnA3ZURqY1lwc3MxYTZ6Z1laY2xQYzVO?=
 =?utf-8?B?VTEyWkprYlJydHJOOGRIc1NIREdiSDArTUJueVJZcUFIUHJMeFJzVEw4MmZa?=
 =?utf-8?B?UkFScjNvbFVmbi8wRm40aDBiZXlyRDl4Zmk2djdhcEJQN0V1eDNjZU1GUjZ2?=
 =?utf-8?B?N2wwYVJNWnVsd3k4TElIZmpVMW5ZV2taeDZZUDgwbW5NVWh1VFdrL3ptc05u?=
 =?utf-8?B?bFRueWFxV0RGeDhLeVR3WGNUU2xJQnNuSXRiZHVObTJhMzd5emtKUGt3KzZM?=
 =?utf-8?B?ZlkwVmRVY1hlUTRUSTF1dzNHNkUzVnNPRUdPMEUrQitNTUJ6K0lra05DTm5Z?=
 =?utf-8?Q?yOZl+/qPHTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di9heGpKR3h3STFvTFgvV0w1VDZlV1NVZ3cxdWM4MlFwQjdwczdybHo4ZEJN?=
 =?utf-8?B?ZVkrMUFsSGMrd0VaTUhlTjh6dWJ3THgvekczSWM0QU14bTllZ3pkTG1zcERV?=
 =?utf-8?B?elZCY3hna2MzUUlVa1ZLOTFqUlRzTFpPUVcvYTV3emFQVDZTSjFzK1BsUE9v?=
 =?utf-8?B?MnB5bnA0Ri8xNUd2S3R1T09HOVFJUU8zek1OQis4RVc5MnprT3dGaVBndDJu?=
 =?utf-8?B?SlZwbFpzcEVaZC9KUHlQU2kwZWJhVkh2bWttcW5GOUFBQzhOZDJ1UFA1MS80?=
 =?utf-8?B?cHloVm54VUhxWS9MS0ttdWxydERjL3hkTFRhVEZkY2JiQVRtZ1krOWVKTzJk?=
 =?utf-8?B?WjhqaFE3dFZpU0hGQ2VNenA3M1g5bjlQcERJaWtFVEdyeTB3eHBPek9tUFVr?=
 =?utf-8?B?ZGNKRHZldkFYK213bW5WcE5LM1d1Z2JVeFh0dWNjaVVZNW1sVmJuLzQzTE5u?=
 =?utf-8?B?NnlOOXNzSWpSL2RwN1loOGs2VFJIT29MOURSN3d2a29FSy9EUWgyTXVBbFdp?=
 =?utf-8?B?cUFMYklJNFFDTXVzTW5zVkJvVmlud0Z1QVI4Z2dsOVBWTVZSRWFZeGhkQTFQ?=
 =?utf-8?B?LzFuQXU2K3QwbXBOSEJaQjdHeGpGeE8yL0U3MVlpYmJTZVBzWVZJWkFhbE9m?=
 =?utf-8?B?YlY1bDhlNzEzVUJrUUhzb1dQcE9VTm1kZXcrTXJ5eWRXTXJBdkxwcE00SlpL?=
 =?utf-8?B?cmpGQ1BmY1JEcjhWU3BiNXFUYXBhVURsTGY2YzVyVk0yNzJTYm1qL3lKNzdk?=
 =?utf-8?B?c01EeG01L1dWSW92aTcwcjQ3MXFlSDIreTB0eUlWLzkwUWdSRWh4aldBU3hh?=
 =?utf-8?B?aS9PNE5KdkpkMkZ3eXA1RzEzRlJQTEV1ZFMzVnNRRTNPNU1yMTU4VHRBYkhw?=
 =?utf-8?B?RlJvWFFOUk03cE8rb1BDenpuZ01rbnMvVHBXM0tkaWlGTkJUdGFNOVVOck11?=
 =?utf-8?B?QWlSY0I1V2JRaUNUd3g4U2NiOThwRmNtWWcwZDFSL0tFSFBJV3kzVEVzR2d1?=
 =?utf-8?B?Z2c5M3FhdW1tMEZsZENGd2FvcHVKR1FTL0FwcE5EelJ4aXdVZ0N2dTNXaFhm?=
 =?utf-8?B?ZGFVMWllZmlxb1c2bFlaZFl0bWFnaUZ4dmFzS05mK2NmYUl6MVFsSWdyam9z?=
 =?utf-8?B?RzR3ZmxOcmg4QVB6cnNUdXdRbVVwZzFmRjlaSi9RMDlLWTJ0OE9KeGZ5Rk0y?=
 =?utf-8?B?cmF2dXcybWxoV1B6Wjd4aGFUUGJOdFNlWW52eHRvTTZRZ3dsQjdvRi9qRlhk?=
 =?utf-8?B?U3JQa0tSU1VVQkxYY0dtc0cxazZ5a0cwWU55em1ZVTlFQVNTQm0wZDFkSkNv?=
 =?utf-8?B?ZzF5Q0IvSUJKUEFOelZhOGk2NWR1WUhGRG4vb2U2aVlDcWdpU3hxa1k5cWJE?=
 =?utf-8?B?RzA0QS9LNER0ZVpPT0tKbVpOdHhwakhyd0ZJSUk4MHVQWDJNRHVpcGN6SHI3?=
 =?utf-8?B?WGU4T0h1UDROWEpSTS8weGFVYkRWNHRsZnh2UE1Fc3V1VjY2THlWZm1QMUxH?=
 =?utf-8?B?bW1xcjdxdVVrZTNCYnBYTVVqUDdBOEp3ZEVJbWF1VmFFcmNjY1lZbGVIZmUw?=
 =?utf-8?B?dVRtU3I0R2Q3dnd1QWVndmVSV1Vqa0RjdTRzeW15aFdYdnpaMHp1WWc1ekFv?=
 =?utf-8?B?UTUrbUlzOWN1TWE1cnhKUys1NWdubEN4L1hKMDJVdGh4WkRSMjhLTmVFdytX?=
 =?utf-8?B?QWwwSi9HTWRzVGZUMktCRXNTcTZBRDFid21sVzRlRXFiV2srKzFBZzBJOTdo?=
 =?utf-8?B?M0p6Q20zTFY0MnhmY0h1cXlMRTZjM3M5Y1ExNEpKMGd0U0IyTGxZTjdLeTg3?=
 =?utf-8?B?NElRa0NuM0ZSK3h6TStKempPMmlkZWd0eG1seWxNek5jUW92dkZuaUlkR055?=
 =?utf-8?B?OEpCVmhTNmlJWWxvRlM0VGF6KzNDcnJVWEpUbGFSNEdXS2hnK0pZakttRnUy?=
 =?utf-8?B?MzVZWUJEL1dZREliMVg1eXhLNUwxVFpmMTEwTEUyU25RRDE3aFJiZ1B3QlpK?=
 =?utf-8?B?THVtZ0lOdkgxQzduc2hYRWtWdFhzL3oxZkYzcldOajhGaVd4OUcxNmJHNFhU?=
 =?utf-8?B?RUs0Y3BUS1JUQmxoTTJvbmw2S054VmQ0SlVSZzdpeW93bVpLR09TQXlWZ1RP?=
 =?utf-8?B?NVpTQWYwOXZDV0U4akY4YldkMjBtek1xa0dad1ZVb2xseTRqZlBpa3dCamxD?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dc6496-2e8f-4792-a95b-08ddfc151a2e
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 09:22:52.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmDryI2lSaeohPvOzHo9yvFyddc7n0Ru9m2rNCkffdqL/RWQ3JqLV8jSHSZzzeqowovcHR++S+mgAcviDssQabJbLARgthiW//bMR7i5Wio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7703



On 24.09.25 19:00, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> 
> ---
> 
> Changes in v3:
> - rephrase error message when dom0less mode wasn't detected while dom0
> is disabled.
> - rephrase help message for DOM0_BOOT config option
> - update DOM0_BOOT dependencies for X86
> 
> Changes in v2:
> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
> suggested in ML) because in this case HAS_DOM0LESS should be renamed
> either.
> - fix order of HAS_DOM0 config parameter
> - add HAS_DOM0 option to x86 architecture.
> 
> CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
> regular (legacy) domain an optional feature that can be compiled out
> from the Xen hypervisor build.
> 
> The primary motivation for this change is to enhance modularity and
> produce a cleaner, more specialized hypervisor binary when a control
> domain is not needed. In many embedded or dedicated systems, Xen is
> used in a "dom0less" configuration where guests are pre-configured and
> launched directly by the hypervisor. In these scenarios, the entire
> subsystem for booting and managing Dom0 is unnecessary.
> 
> This approach aligns with software quality standards like MISRA C,
> which advocate for the removal of unreachable or unnecessary code to
> improve safety and maintainability. Specifically, this change helps adhere to:
> 
> MISRA C:2012, Rule 2.2: "There shall be no dead code"
> 
> In a build configured for a dom0less environment, the code responsible
> for creating Dom0 would be considered "dead code" as it would never be
> executed. By using the preprocessor to remove it before compilation,
> we ensure that the final executable is free from this unreachable
> code. This simplifies static analysis, reduces the attack surface,
> and makes the codebase easier to verify, which is critical for
> systems requiring high levels of safety and security.
> 
> ---
>   xen/arch/arm/Kconfig        |  1 +
>   xen/arch/arm/domain_build.c |  8 ++++++++
>   xen/arch/arm/setup.c        | 14 ++++++++++----
>   xen/arch/x86/Kconfig        |  1 +
>   xen/common/Kconfig          | 11 +++++++++++
>   5 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..336b2ed242 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM
>   	select GENERIC_UART_INIT
>   	select HAS_ALTERNATIVE if HAS_VMAP
>   	select HAS_DEVICE_TREE_DISCOVERY
> +	select HAS_DOM0

Here HAS_DOM0 is selected and all dependencies also selected ( HAS_DEVICE_TREE_DISCOVERY, DOMAIN_BUILD_HELPERS)

>   	select HAS_DOM0LESS
>   	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>   	select HAS_STACK_PROTECTOR
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index fb8fbb1650..62602afc78 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -42,8 +42,10 @@
>   #include <asm/grant_table.h>
>   #include <xen/serial.h>
>   
> +#ifdef CONFIG_DOM0_BOOT
>   static unsigned int __initdata opt_dom0_max_vcpus;
>   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> +#endif
>   
>   /*
>    * If true, the extended regions support is enabled for dom0 and
> @@ -104,6 +106,7 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>    */
>   #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
>   
> +#ifdef CONFIG_DOM0_BOOT
>   unsigned int __init dom0_max_vcpus(void)
>   {
>       if ( opt_dom0_max_vcpus == 0 )
> @@ -116,6 +119,7 @@ unsigned int __init dom0_max_vcpus(void)
>   
>       return opt_dom0_max_vcpus;
>   }
> +#endif
>   
>   /*
>    * Insert the given pages into a memory bank, banks are ordered by address.
> @@ -1962,6 +1966,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>       return 0;
>   }
>   
> +#ifdef CONFIG_DOM0_BOOT
>   static int __init construct_dom0(struct domain *d)
>   {
>       struct kernel_info kinfo = KERNEL_INFO_INIT;
> @@ -1993,6 +1998,7 @@ static int __init construct_dom0(struct domain *d)
>   
>       return construct_hwdom(&kinfo, NULL);
>   }
> +#endif
>   
>   int __init construct_hwdom(struct kernel_info *kinfo,
>                              const struct dt_device_node *node)
> @@ -2046,6 +2052,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>       return construct_domain(d, kinfo);
>   }
>   
> +#ifdef CONFIG_DOM0_BOOT
>   void __init create_dom0(void)
>   {
>       struct domain *dom0;
> @@ -2103,6 +2110,7 @@ void __init create_dom0(void)
>   
>       set_xs_domain(dom0);
>   }
> +#endif /* CONFIG_DOM0_BOOT */
>   
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7ad870e382..fbb290df60 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -481,12 +481,18 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>       enable_errata_workarounds();
>       enable_cpu_features();
>   
> -    /* Create initial domain 0. */
> -    if ( !is_dom0less_mode() )
> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
> +    {
> +        /* Create initial domain 0. */
>           create_dom0();
> +    }
>       else
> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
> -
> +    {
> +        if ( is_dom0less_mode())
> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +        else
> +            panic("Neither dom0 nor dom0less mode was detected, aborting\n");
> +    }
>       if ( acpi_disabled )
>       {
>           create_domUs();
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 3f0f3a0f3a..2aeb361c63 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -18,6 +18,7 @@ config X86
>   	select HAS_COMPAT
>   	select HAS_CPUFREQ
>   	select HAS_DIT
> +	select HAS_DOM0
>   	select HAS_EHCI
>   	select HAS_EX_TABLE
>   	select HAS_FAST_MULTIPLY
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 76f9ce705f..10a8fc8718 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -26,6 +26,14 @@ config DOM0LESS_BOOT
>   	  Xen boot without the need of a control domain (Dom0), which could be
>   	  present anyway.
>   
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	default y
> +	depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS) || (X86 && HAS_DOM0)

Here you repeat the same dependencies. In general, if you introduce HAS_DOM0,
which is expected to be selected by ARCH, then all you need is

	depends on HAS_DOM0

It's ARCH decision to select HAS_DOM0, or not.

> +	help
> +	  Dom0 boot support enables Xen to boot to the all-powerful domain (Dom0).
> +	  If this isn't enabled Xen is expected to boot in dom0less mode only.

"is expected to boot and launching all domains in dom0less/Hyperlaunch mode only."?

> +
>   config DOMAIN_BUILD_HELPERS
>   	bool
>   
> @@ -125,6 +133,9 @@ config HAS_DEVICE_TREE_DISCOVERY
>   	bool
>   	select DEVICE_TREE_PARSE
>   
> +config HAS_DOM0
> +	bool
> +
>   config HAS_DOM0LESS
>   	bool
>   

-- 
Best regards,
-grygorii


