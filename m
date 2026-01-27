Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gID0FDm/eGn6sgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:35:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27194F6D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214731.1524974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjEN-0005MO-6N; Tue, 27 Jan 2026 13:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214731.1524974; Tue, 27 Jan 2026 13:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjEN-0005K4-2j; Tue, 27 Jan 2026 13:35:43 +0000
Received: by outflank-mailman (input) for mailman id 1214731;
 Tue, 27 Jan 2026 13:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkjEL-0005Jy-NR
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:35:41 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f142f8-fb85-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 14:35:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5219.namprd03.prod.outlook.com (2603:10b6:a03:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 27 Jan
 2026 13:35:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 13:35:35 +0000
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
X-Inumbo-ID: 10f142f8-fb85-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmqNm7IU6nj0IuoIZWC8J/CxcFw9ewN4iEyZK4D1xCKXBpr0XUxUiMMxt2TwKtSNrSlNtHEr+6Zs7gDkOq1yeGAKhg/pkBKsxbPkanXmP09QpufB+R+2hnIY+5XYjA0C3dr6ggH4qwWd+2A9PwugiPlOnjokYJBp0O5wcb3PqROrBbukZMzqDEQ+Wk85riOXP1Y118OQnsJlz9LNJTnq6KRiM+WdxxcLvhI0sYDe6zgikxJlnGRUyhKZ5hw8VRrzPbs2NcKbFukXHb9+S7rYmHqXS/59tDeX1UJ06aLLlsfE6l1dbZXVhs3Y7WfzJaciwYfnj6hHoXKTh7Q89jmNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYu0fLbMD46CRHBOk/DythtbDqFmMQu0j9bHWiw+JnY=;
 b=u2q0FbTR4O8bSBrNjro0aNgZowR+JL3odjlGA65Vzhn7J+rNqBzscSAa4BNcvjx0g7entvXobkcusjkdtzVObbu6WkSafRxusSH+fUc71z0Nch175AUAemK5+IVL0lhIfJpklAy3RT/Bdi394N/tid255gAAue7pbnp0zl351CrJqcIQlUnS6JokCnj/1b7ijAGpnIqtoQ1NqE9hny4lBBXzIM9GVxBLwXXUlBB775s6GGZDFA2/GqTTkHApKzPYh66xn6spf93ZZLIy6jzPhWeY//pTCal4yQgJrVnSEJq4drR3128GvmQauUxtRpdYj9dtdP2Akgxun3B5Xjtdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYu0fLbMD46CRHBOk/DythtbDqFmMQu0j9bHWiw+JnY=;
 b=veYtUSItoPKZrIPhAx9DJ9zUp1pWGtJGRnso1xKtjh2vI4W8M3VWpWgViIXpLX7msLFqHwZBLyiMXQHikPKOz3qrJp6PmIiUAE1Mwf3dZVRJFCGZHbbMdpKUEFSUSerPguMcyMj+lRGZWqgxsg/IQ+oPmkp0uWX0M3guFMSjYDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cb85e258-e17a-459b-9e20-34612ab17cb4@citrix.com>
Date: Tue, 27 Jan 2026 13:35:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>, Kevin Lampis <kevin.lampis@citrix.com>
Subject: Re: [PATCH 03/16] x86/intel: Drop the paddr_bits workaround for P4
 Nocona/Prescott CPUs
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260126175345.2078371-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0444.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a0a9f4-8acb-436d-b980-08de5da8f342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjhlM3hENHF2NlFEZllWMk9uRGpYSk1zRlFsY0xCcGV2VTd6dGE4eWRIVkEx?=
 =?utf-8?B?RDRmc1MvbG5WRzJXVTFFUTZRdytsS2tSbURvYlpPdGtTQ25HMzVGcGRrOHEz?=
 =?utf-8?B?T0Nnbzg4ckcvZDZiUXJTM1hxd0dJU0s3RGY3dWZidVlUSjFKNmlycHkxa2lT?=
 =?utf-8?B?b0VKa2xLaDlvTW1qRFhHd05wYzg4bDY4eTVjd1Z2RUtremtRN3lObE1GTnBp?=
 =?utf-8?B?elRWWHdsUTZTcE9LR2gzU2I0Ulh5Qlh3Yzd2bDBZQzEyak9OWi9TOTRlUnlT?=
 =?utf-8?B?OG1BVWg3OGgxdDNTaTE2TE1iUjNNcUJiYmJHUUhHWXV1cjBFL3RCSWdRbzhF?=
 =?utf-8?B?T2RlTlhBNEN0SDBiYlBYWFFGNWZ2YnFrbTlsYnFWN1VPUWhBeEMxeHFMSGZk?=
 =?utf-8?B?ZlU3R1o0bUhHNy9VcmNESVFQdVhwS2RHMFEwTmR1blV4bk8xbkVJNUowL3RN?=
 =?utf-8?B?QVV3ZHYrOWhtYkZuaW5iRnFnUytGeU5zSTFPMXg0M3BDNkhvVzJCcjBYdDRZ?=
 =?utf-8?B?bytSbys1ZEg4eWs3anZJeFRLczI3NzVmZ3k2OXJUdVl1VGl2TWl3RTZxMkJ0?=
 =?utf-8?B?cnBRb0VIYm1aL0lRVThSL0FQMVI3bk1vanlyZUVmLzBVNGc5N1NhTTFFeW0v?=
 =?utf-8?B?TmQ0SWh4U3hnalJBdGo0R1crSDRYKy8rVTN4ZVJoU2hSNzhHY0xYTTd5ck1q?=
 =?utf-8?B?TzVnRzVyR3ZubHBuYXRBVVYwaEsyYjdmejExVmJJNDFpRzRtbnN6OUFzOHVO?=
 =?utf-8?B?VExScGJ4MUNaK1hFVmhDL2V5NEZIcDVrTjNYcW0zR2srOVNGOXFOR2RIOURq?=
 =?utf-8?B?VytMOGhZb25PZklObGpmQTZTUTFHS0p5MENxdjh3amN5TzE0ZFJQaWV3bm5G?=
 =?utf-8?B?am5MN2lGSmpoRVVmUytJL1d1QkdSOGF2amxNMSswQ1I2Y3BxSkpzZDJpSkh4?=
 =?utf-8?B?RFZTdDBMTlpZb09DVjRTNHVJQ2ZsS3h3WVR3aTJaK09CS2d4cGtHUlh2VGdK?=
 =?utf-8?B?Slhmc0k3UWVoaFBBVm0yUitzdUF4OWxJNWpUYms3ZCtKYk45RzhkbDd6b1F1?=
 =?utf-8?B?bCtvaTNiRWwrS0d3am85cS9xMWNTOTgrVHMrZVd1ZU8rQkYwUFA0WVRuWEZr?=
 =?utf-8?B?d1ZoK0h5WjZBTERGMkI0RGxzcGNWdzd5dk9lSUZZZWhocHFZbXVWRk1uaEY5?=
 =?utf-8?B?ZUNJUTl6Y1BvV0EyZ0dUSGlZUlUzZFpMa2ZKOHMvNWtlTjV4blVSTThPcUI2?=
 =?utf-8?B?QWlxQks0R1I0SHBTZjgrNS8wQmx6cTFXMHhFOG85OGRYSGFickdyeW1FN3F6?=
 =?utf-8?B?NnRaR3hRdDdDdVB6SHg1NldRSTFwY1ExVDdpMzN1bGVZSkdWWnNsaVVlTVhR?=
 =?utf-8?B?N0F5RnpudFNLOTRRNGpDT2xQKzB0RDFPVjJvbm1udklWN09qbWp5eERWK3Va?=
 =?utf-8?B?V0dyV1pYQ21EMnhNcmpSUTJSenAvcElYK1pWQTI4MWNUcmlVbVpOYTlDQWxw?=
 =?utf-8?B?TlVhZDBqZHU5OThzZzVSOVIxTDd6Y3ErT3ZWZlBpNFhlQVVsSDU0dnJqQ3Nx?=
 =?utf-8?B?R3lvdkh4TVR5bXlUTitNTDhKNFdTQzhLN2N1NVdRYlY5U2ZmZk5KMWJIZXlY?=
 =?utf-8?B?aXNHSlFvUFhBT2Z6US83aTRzQmJDMjRXencxcm5oQS90bnBiaCt6cFkyTUZy?=
 =?utf-8?B?eHMycm5UdnFYZGpORXNFRFJ2K1F4NmlYNUJiRWw2Z2J3cHJGcTU2T0k5RHNR?=
 =?utf-8?B?OXVIWndNVysramJxSHdScmYwRTJNc29mUkxsMU81LzdZOGhycTl2d2FyM0dH?=
 =?utf-8?B?ZkdsaDRUVWdOS1lOY0Mxc2h2cXJOZEpzL1NRSHlzTjJsQ1FxVXdkbmdacHd6?=
 =?utf-8?B?RFptYXUvaU5lRmtKL1l3WGFYTnlMejBTb213RW1YYitiaWxScUZPdkk1em50?=
 =?utf-8?B?S2EyWStyWkdtaXZQbFJUUVlIbHFxQ25WRGM4OVdJbFBzTUlNYkFhamRHeC9a?=
 =?utf-8?B?YXlObmRUd0ZDemsyRVFhejVNNm5zNlFxUmlCb3Facm5pMTZrcHJTOHRVNTY1?=
 =?utf-8?B?UmtXVzEyay9DejJTajhkb2Y0WlB2bUt4U3hsVVJYUURHd1BOdmNaaWtlaXV4?=
 =?utf-8?Q?oqOc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjFJS0RDZHd6d2Q3NDJsOFFmMTFibWJVOXFONUsxRDJlSDJ4VUdBdHRVTmps?=
 =?utf-8?B?Nk0xY0VqWTRyWlA2U0tXWXJWenJBOWlLdVloZEZ4bmlUa2NNOGc3OFdOdk91?=
 =?utf-8?B?dmhHY1BpL05YZlZWa2hhYjh4UVlWRkpRQ3lnMUwvenhVaDRJclk3ajIzRFJp?=
 =?utf-8?B?aHJSQThJT0EyZXFwby96amdwVWN5cW41NkhQMTU4OE9qc0JRc2pLTEwzVXNv?=
 =?utf-8?B?YWt4N2dRTmxJU0NLdktVeWs0NFpDNXBCTkJGUHJ3WW82aTZqQXBwRnRiaVZC?=
 =?utf-8?B?NU9raHdRYlBuWGFZdGJsajJ5Z0kxalRUOXdXckh5Ry9xdm1KUlJmRmR6amk1?=
 =?utf-8?B?TVU4ZHoxY2s5T3pkVXRoT1BCYVU4WUJPVXVINzdGUXROQzZPUSsvSVpDd2lJ?=
 =?utf-8?B?bFNZbEVWS09nN1ZGNHJFeGZ0dnFyNTI4Y203bnBGL1ZpVFhFSzdXZXp1cCtZ?=
 =?utf-8?B?ODVadTVQTFNjTDQ4OXZ4OXlQZWMyZ3lKdDVZejVzVFREeDR6clhmYXZYaWNS?=
 =?utf-8?B?YWF6aUs5TUVIOVZxMmV2VGdyWUtkMlJndzNxazJGcjRGeWJ5NjFnbm9tN2dV?=
 =?utf-8?B?d1hUdjJ6elBxL0U3OThDcWlVS21HSzJNRllaN0J2WFUyOHphVk9PTmE3KzNM?=
 =?utf-8?B?TEpUWjl1RFZJYVZqYWQ4KzVGa0gwTm1idndPTEZkeVFKVHZKY3crSjg3bURn?=
 =?utf-8?B?VkZ2SVFjdDlsaUlNaHE5RzhNN21uKzVweE1RTmk1RC9ydGhHSHpsV09ZS3Fk?=
 =?utf-8?B?d1NBUHh6SVlkWlNRYWpiTFpwZkRBd3FZamJITW45MHFqU2p4WncvOXRHY0My?=
 =?utf-8?B?VEM1MG9kd0ZJcVpDWG9Ub2crQ3BtaEJqTU9SWVM4T3dWS3N6ME52c3pVTEpB?=
 =?utf-8?B?bWYzQzF3YVR2QThJWW16SEx0cTRXL0w4QXY3UHpKbmpwSG1aUzhBQVRWNTNS?=
 =?utf-8?B?Y010cXMrekk1NmIxb3RZVmwrY2RlMU85QjJ1WllsYk1PTFNiUTBta1c5a1d6?=
 =?utf-8?B?cFZLa2JnUGV3dXh3NkdGRFRFVzJ5Y2N6TExXeE5zcFNLZDBkTXVKaUVnek9T?=
 =?utf-8?B?WDVVMHJyTVpaWVI3V1oyM2JxaFBSR3EyQnNtT3NMWlE2OExpZUd4eVYwRktZ?=
 =?utf-8?B?Q2xFZmZIUHBFcmFOSGcxL1djMzFITHlmdGRQQ1pkdlltL0tTR29SaTk5Nno3?=
 =?utf-8?B?RzBXVXd1NzlBUXVlQ0hGWEdSMStJM1pQWm9UN053S1A0ZElmeEpwOVJ6cFJm?=
 =?utf-8?B?aE9iSGt4aHNNeGY1V1RKcXF5R1JtY3ZUZldEejVqVDl6Q0VocFZhQVJWWlhF?=
 =?utf-8?B?L2RTMkRvaDJvZithajVCVm1QdThHN0tWMXViU1FPajkza2F6MVMwaVRaSnF0?=
 =?utf-8?B?bG9ZaXJlbjJ0c0piUGlUd1lEbEcwYUVpUW1QUXkzbForUUJZcG5yaXdkb2gr?=
 =?utf-8?B?Z1VNb29TUTVsVTlWZTZkNEM5MXJJYXQrSmM4RXFtTTdUS0wvL0VHNzZHbmRQ?=
 =?utf-8?B?dE80V01ZRGFGSFhOUS91N01mMkpaMm1NMUNXOFl5bVVnekpQR1k1eGROMVgx?=
 =?utf-8?B?aTljUk92Sk9ERDFlbG83czJabjlOTTRTd0JPbEo0NEpML0xsa3EzMDh5bzEz?=
 =?utf-8?B?MzFJSUl6TmJMY2VjVWhFa0RLdkdpZlZCZ3BHYWxBVHJ4SHd5bjhFd0oyTGFP?=
 =?utf-8?B?MWdXZ3dwRFRDblFqREtKU0FRL005b3N1ZVhhamlMbUo3VG5GNURTNW9YQmR5?=
 =?utf-8?B?MWprRUxaNmVkTVVoa0t6bDQ0bVRoZ2srMFdBQ3l6c2R2clhGalg5QWFMWFVC?=
 =?utf-8?B?OVRhRmUyK2V0MWZVZXdKVnVEWXg4R09UbnZRbTNvQ2JyaGFDYUl5VXBUdWdi?=
 =?utf-8?B?bDUxUkhES0ZuMXVZcUxYT1BsN0crWnZwcXB5VjU3WFlqQlVtWUY5QWxuYkht?=
 =?utf-8?B?THI1Rkxwa1h1ME1mUENRWFVPOGlGYVo0MXpDeUlJSkVMRG5QRVhFemVVa1Nz?=
 =?utf-8?B?YW5wUUpqbnRrWWdJTUdvZGRXbG1kd2h2RFFyMTF5a3BFZHRObXJGVWI3aGRn?=
 =?utf-8?B?NjhTZWZKM0orSVJnVXZ5YWsyQUJQbGJGZE9yelpkSmpMczdrQ2NrOVpHUUJH?=
 =?utf-8?B?enNzNk8xdm9sd0ZWUzQ1SjF0MkhKNHRWdlp4eVZLL0QyS0ZPZlBrQW16WXE5?=
 =?utf-8?B?UEU3bU9qN1FXenhDbGhMZHhaWHAyRUZkY2ZpalA3K2t4WXc4Mm0zWXkyTyto?=
 =?utf-8?B?WCtzTmJuc01NNTRYc0oveVJDMFpTWFV2SHBEY3pZR3M3bnJKS1ZyZ0ROQTVl?=
 =?utf-8?B?T0xham5pMUNJREJwcWQ3VXpFc3VxVE1sQS95aTN3OHc5UUdpYS9sdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a0a9f4-8acb-436d-b980-08de5da8f342
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:35:35.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OrYH9Ruv0uO1IwC74Lx/ARmS0NEBkBaap3IURI1BEAgVOhAHqpNceZtlPBGds1RMS6duvrIaMJ73qiHixqUc9AISX8rLQWRKDfd+LH0XLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5219
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB27194F6D
X-Rspamd-Action: no action

On 26/01/2026 5:53 pm, Andrew Cooper wrote:
> These are 32bit CPUs only.  64bit support started with model 4 (Prescott-256).

It turns out that this isn't true.  These CPUs did have Long Mode.

I'll need to rework this patch into a later one.

~Andrew

