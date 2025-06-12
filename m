Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC71AD713C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013061.1391590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhhL-0004E0-4a; Thu, 12 Jun 2025 13:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013061.1391590; Thu, 12 Jun 2025 13:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhhL-0004Bl-1a; Thu, 12 Jun 2025 13:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1013061;
 Thu, 12 Jun 2025 13:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQAQ=Y3=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uPhhJ-0003FU-Dv
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:10:25 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a06e064-478e-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 15:10:24 +0200 (CEST)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AS8PR03MB8120.eurprd03.prod.outlook.com
 (2603:10a6:20b:447::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 13:10:21 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%5]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 13:10:21 +0000
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
X-Inumbo-ID: 9a06e064-478e-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdaUYvMslMjs2JLoLr6pX3/+HOzLKLma9tP5QQYmaAFSFyUPxsnFFFFEOaLKRQ/p+4wldiYy48OX7KNhRTE9UhwSSzVRXmGRtdGtTf3d3MCl23/YKqo68u9VijDYklwYjgbRgbjVLzrwi8Fa6qznj5xQ+n/LDrBqu9x0R/EoquswGPkgRJIlwL/x1p1f+9jwoXCMs1+arMpadX2qpP/nbYB5HNsXxkhqSu9/5Co5o91ATzrUuH0aor0G+wH1H6hSMc8bo38o0UWYz7c0MWLb1FnZiJXbxuYRsbHxSRfoy491k8N5WHmORtpj4T7vgdmGGajkwbXPfB5OYbkbWOPzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3H4brutdVrCgt9gPdRVj6jPm80PJ5bj+qF37qrJkLo=;
 b=jLcqgc2CzbdpuFR1nF9jO2m//nK9zQwAqYSrvS1Wr/xOH/thcvDbPu6omyuZnkAM38LUNlorijkHa8UGuY3VV+D3saUHPgK9PP/MXmKOn4+r9s8hLb4nsh07F6Cz1dHVaRGyjh0/X4gYiWiIPLWQryM5NiGH0uiH9EDlRh/Vq+coR3P9KCPXN/LclS+swT65maHQTdu73asLVUaKgZKwvnhTCp1Tbk0quxL3Q4wO1Orw1xdQDJ3FaVbmHW5LrVhf0+GygIRUIdZGbAb9gM8ixkSDBAc1Y5eTCw/os3LjzHtPS2ow4DRBrguww9mdjuAwlReauN1L5sZfdA1jTCfayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3H4brutdVrCgt9gPdRVj6jPm80PJ5bj+qF37qrJkLo=;
 b=dRO4AILzk+2ILMeRMu/PqY/3IX3Zt2wvEOUMS+sCeYR1y4PwCpMXGQZO6PThKkE2+3ROXbEgg0TbYrYCb8KKsB0ouvVtSc9SUmNczr5TB+RswSQhkrap3Y2dciEfBnfSEEzzIQjKKHLDIuuEudreTs2iKIIb0lJt/YqEkFadEBBDkgIfRPOtNqZiVSSFu49E4Ja6nyP6Svrybw2taGMYTefGl17Fyna3s9kovbN97H+W+Jj+XCu4zfrMY0tAcWBIv6Yq3UUpM1gC6CFOWPrVhnpJuWB3YqKD8fgMAwwtDNvkEDnkn/eDIThRHuMISr8SIN14YDKciNDeGPff0zyB4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <584cc496-fb59-4de6-b8fb-32e095e6d5cd@epam.com>
Date: Thu, 12 Jun 2025 16:10:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB8919:EE_|AS8PR03MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 753afd24-5422-4ab1-e599-08dda9b27c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE1zeFNJN1AxbTg5TkYxV1lPOXVpSVBlclFuTVNlSFNIQTd5TEVSbllmOVdz?=
 =?utf-8?B?MTJNemJIckZOaWNDWVE2VjIvbnU2TCt0dElHc3pSdHJHK0VKUmVFWkFPQk1a?=
 =?utf-8?B?ZVJqN01KS1hhSFBpZmNmRlZ0bzVqZzRXQXpvYWhtWVdIaXJjaFVmWmphYWls?=
 =?utf-8?B?KzVROEtwckE0eGRzSlRNZ2M1Sy9ENVN4K2dhRWxaSS82ZGttNk1SUThwd3Bi?=
 =?utf-8?B?aDJyek9SWk9iTzRNVWZucExuQjlLbWVERE9iUEVtT3FNWEI2OXhBZlNoVTVz?=
 =?utf-8?B?M0NRNmtSZWtTWVhNK2FjTDhOTjljRmw5aTZzemxLRDJQNWsvdmtYdU54ZXIr?=
 =?utf-8?B?NjVMYVEwWUJONXM2VjJyZ2wzQVVPdUtDc0dQaXBBRzQ1Vjc3c2lOdUJrdWVl?=
 =?utf-8?B?S3Flb0s5K1FIKyt0cHhVVDVNeFFTWWFSeEQ2OGllUjNLeWt2LzB1UVFWTHFV?=
 =?utf-8?B?MUVXdDJtcEpIVm5iRHMzUkhFbGtrNWtvdG5zYUtYc3Z5K0VEMzBGMUd5S3B0?=
 =?utf-8?B?RFg0L3k1OVVKK1Y1TFlUeUFIYWFVb0FVMkJ2SDNxTFY2Nk1Xd0ZOQUpvUTBW?=
 =?utf-8?B?cS9QaElnaW1Yc2xjL1MvUlNkNEdyaWJxZDNVVnJyZjdkT3JBTWV3aUhwYncx?=
 =?utf-8?B?U0E3USttYnZhYm40UGo5TFVBY3ZOTUU1aFRrd1FLdjdQWVRiMVB1aEx6TENF?=
 =?utf-8?B?RXB2eS9GYlpVK00ybVcxcVh4SmovaTU0VWtXTjlmdkpBWUVHbm1MNXFucHZl?=
 =?utf-8?B?ZUxlVmREZ1prUmJGY1pvY0hxVU9zTEFqK0VpVlF4V016ZmZya3N6TysrajZj?=
 =?utf-8?B?aGY2cEFjcTNhZjhEeHczVlhtVG12ZVJOS0FXNEx3cWJheVJldnpZaHJnNksx?=
 =?utf-8?B?TFlQYjRNbkVXL2l4anhRNDg3NElwZENXTjU2NjJEeXpsRlVaeUVrVlBiaUJN?=
 =?utf-8?B?b08ybndQMVlocWY4bEVXL2dyV0JnRWJaZ1ZTb0gyaVZBTWNPSVZYa250Lzkv?=
 =?utf-8?B?bWxUdVRpeWpNTXNaL0xRRmp2ZnJpVTdCRVowRUtYT2t5SUxvWjlqTzAzcUJK?=
 =?utf-8?B?aXJ6YlY2dElGcjZ0YThiRG82OU9pcmt6RkRaSm9EVVVDTUNNcmdydXZWUEdm?=
 =?utf-8?B?OWIyT3dpR05RbGZUNEhtOVErM2tCUFVKaTN6NjRCUitjSVRwV2UyOWtmdytq?=
 =?utf-8?B?dFFpRjFSV016SnJNbGJjSWdnKzhBQ1VzTkxlMkZuYTAvTWxvRlYwd3B1d3Z1?=
 =?utf-8?B?K0pQNmV6YktPb3hXSEFWYUdWdktVcExtL2l5SDRKcUVDQzZ4TlJPZDFSV2lp?=
 =?utf-8?B?YTg1Z0hxd2JuSTBwSitJODRFdDhyT0IvSUdBbFE0TnhwanQreTlsUUZ0M1ZF?=
 =?utf-8?B?cHdTNm12OHNXRTBwOGV2VUZpOVZ2KzM2YW9GN1Y0YUxtZzJhU2IrckpVbHVm?=
 =?utf-8?B?Z3lGenU3TFhrTWo2NUpaN2VWc1hNeEpSQ3hsdlg5bkMxc2p3QmFwNDMvbzh0?=
 =?utf-8?B?YitqM0xVZDdkSWRUM0wzVlhnSWQzQ1R5cFhnOWtQVXExWEJGaWVqK3VDVDA2?=
 =?utf-8?B?QjJUZ3FuMHRGMXNxOVpTanR5bmovK0s3c3FCQldBVElybjJOV01iVWVZMjBY?=
 =?utf-8?B?dzBrUTlnSVVFQk9JNkx1ZG5mZlJPMEd6NisvdkE1eHhUYkFOZDk3MFl2Mzgz?=
 =?utf-8?B?RTcyQ1M5VDhINkNEaHZieERxTldnWXhPL3BpQjhzbzRCc3FNQ0hmRGhyY003?=
 =?utf-8?B?N1l6SVU2Q2Fna0lOd1gvWllIY2hvc0ZONjZ5cXM1U01FRHdvWk5kWHF6NXhS?=
 =?utf-8?Q?4lEMWmxE13LW9JV5rZKCvS5FibgJ3MXXfSUGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdRQmI0eERkMW1yZTY0SEttVmNtMHkxTTBmQS9zTVlRWVFsbGN5cEJqQ1lL?=
 =?utf-8?B?blZxOUU4U3lsa0NZVy9TQXdMWTgrZnFzUnRkdG9FZE41b2QwNGpnQlpQbDhR?=
 =?utf-8?B?TEZVK1Z4QTQyeTFwamlrYkxKZjE1UGZwSE5TNFZ5TEMzN201Q0lMaXdYMDhJ?=
 =?utf-8?B?T3prR1VsREdOUzBEVEI1WjYxdW0wVXoxTzNyT0ZEWWZLd0RVRHQ4R0xlWmxY?=
 =?utf-8?B?L0R0VTUvZUt6eGRKaWZBbUo0V2JxMHVkLy9hUFNWQ0RpdDI2Q2VpbmhLazJI?=
 =?utf-8?B?d3B3WVVxZC9oUzc4TXlHTVJQTmRSTi96dS85OTdDcUNCQTMzcEs3TzZPM0pE?=
 =?utf-8?B?RERMeDZJNkhOK28xQ0JKeEZoVGlxWGhyTUt6blZ6UG5uRzdRcm9YcEk2YU1o?=
 =?utf-8?B?eFFYNFJVbVc0elJtckZiZHdmREZDQkdJU0MzYlZucC9ZNFd1WFdIb0VWRlkv?=
 =?utf-8?B?OE8xeDlBS2JZMFAwYVJYRDlUc2o5K0xvMkFLcDkxS2dGRVQ4eGhDMzVXaFNZ?=
 =?utf-8?B?WjBzekE4Y2c3QlFGbTdCN0JQNnNhZWFyN1NaTWRJdk9VbS9Xd2VvZ2NnZE53?=
 =?utf-8?B?V0tLMjdhZzd2UisydVMraTFPc0I3Z1RrYS9OWUZzUUU5aWw4RDFyRERyNU5j?=
 =?utf-8?B?L21LdjMxcERYa2sycWNWZFRRZWp0N1lGU3RuMzJnWWpyVlY3RWlZTC9meXpP?=
 =?utf-8?B?ZjJRWlF6d2pXUVRrZGx3SG9xUWNxZ0poM3hvQVdLOFZHdUJrV0ZWdjhXOUV3?=
 =?utf-8?B?MjBVWjZOUzFBdWlwU3J1VHFEV1J3VE9rNmx6b1FkdnFnOGxpemM1RlVENFpt?=
 =?utf-8?B?ZWVTVXdrN2NpczlCTWpHNmc1RlA5cmwvZmtvaGJyZEFBcVExaEhxMG1hQ1Ns?=
 =?utf-8?B?NG5VTytuU0FFOFBZM1FiaGsxQmRsSUw1MFlnNTU3Tng5NWpyQk5FQUd4MU5U?=
 =?utf-8?B?YUVWa2MxblUrdE5TZTdCcFI1RVFNbXV3a1V5MGt6Sm1wY2IyVjFRWTVYMzJr?=
 =?utf-8?B?WmxjejBRU2grK200N3RBR1dSRDU2ZXRHcUNjTVZIYjFadnBZYkEwdElXSE9K?=
 =?utf-8?B?cVJma2xIMXVDR0kyUjBLbzR5VzR1VU9lV2xmZ2FWYnhQTGtnRWgxTzlQd3d1?=
 =?utf-8?B?YTYvTWNQNXlwV25nS282Wk1WVGhiaVEzczloZ1o3NGp4RUpQejFkVzVpbGRm?=
 =?utf-8?B?ZDJSYUNOektUa3ZzK0JTdlU5d1czR2JMQnMzNklkRCt0bDhhNHlpdnp0aUtW?=
 =?utf-8?B?azN5L0QvRGwxcVZoV1FjSlIxR0pibDNFUEF6a0ZqL1NZWDgyQVYyZjRIU3Vy?=
 =?utf-8?B?MW5Nc3FzM1cvRXgyNTBXV1JnbUV2b2JBRHpXUmVCcXRqMlNCTUNmanhtcks0?=
 =?utf-8?B?WWc2QXBFaHVlb09NNThQbmtEL3BmdFl2ZWVzNHVOZlJEYTM1WW5FNXZJazZT?=
 =?utf-8?B?ajhnMVgzekFFdFlObTJOSnJMZGZ6OXhldHhhQzNmeFN3cXlUbUtaSUhRK1Zk?=
 =?utf-8?B?Wm5memNPcjN2U1lCdmEvZ1gxRHlkTm9rdGZEK3Vlc1ZJSitXUWRVajVVTEUy?=
 =?utf-8?B?Y2JSaVl5SjZoS2t1aEtmV09lS1h6aEtJL2IyOFcyQ09OcFc3YXZtTlRVR1Jx?=
 =?utf-8?B?L3VtVjFtOVpHUTFxVU1HcXIwellRcmYwK2h3TVZrQlZyMk1iT2Vsb2JRdTBr?=
 =?utf-8?B?Vkk2V1JTaCtyRjVIZG45bmpma25lMEN2Z0QveXBXZlBTQ1BRL1hmRGMrTEdj?=
 =?utf-8?B?aXMyb0dvSFdZOU1DUGh0cjlJcmNrTEVxQnlRMkRLZnpZYlNoc3Y3U053dTNn?=
 =?utf-8?B?NFZNNmFtVnlzbzVONVVPVCtpUHlaKzJyUW1tbWxLSmY1TFM2bTI3aUNGVmtL?=
 =?utf-8?B?VDVXNmZsNnozMTJtOGFXTVh1bUFhbHpHbTRNTlRjNWF1UVlVWFlYUURpMmMw?=
 =?utf-8?B?ckszczFqbjIvRlhwRDNCY2R3aVlvWkEvYWhQY3V1aXM0SkZtUzU3UkUzZ1FI?=
 =?utf-8?B?UmhpYjVxRWdvM3JHS3BubDFGSFQyM0UxMmllMDNtOGJZeXUwMHM0WE1yQ0Uz?=
 =?utf-8?B?bTVEZHlUdXBvWHZsdU5lZVY4U1BDMGEweDBSMXJtTDdmVVRUUTlCK3JKclRY?=
 =?utf-8?B?em1Ed1hyUDFWYnBwdHNOdXhNb3NZamtoV2t5c3kzdEN6eXh5dCt2SHpiOXpv?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753afd24-5422-4ab1-e599-08dda9b27c42
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:10:21.1798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YN42/9jLC92v3XQiZKaC5PRggnk6eMQAa1a9DFOFZwbk3m2KRteCihDfpiRdpwGHNRklpxMrYg+rVSk/Xh1kGsx7LWdmvOS9cymrWA9OLyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8120



On 12.06.25 14:42, Oleksii Moisieiev wrote:
> Hi Stefano,
> 
> I'm very sorry for a long silence. Please see my answers below:
> 
> On 22/05/2025 03:25, Stefano Stabellini wrote:
>> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
>>> From: Grygorii Strashko<grygorii_strashko@epam.com>
>>>
>>> Add chained handling of assigned DT devices to support access-controller
>>> functionality through SCI framework, so DT device assign request can be
>>> passed to FW for processing and enabling VM access to requested device
>>> (for example, device power management through FW interface like SCMI).
>>>
>>> The SCI access-controller DT device processing is chained after IOMMU
>>> processing and expected to be executed for any DT device regardless of its
>>> protection by IOMMU (or if IOMMU is disabled).
>>>
>>> This allows to pass not only IOMMU protected DT device through
>>> xl.cfg:"dtdev" property for processing:
>>>
>>> dtdev = [
>>>       "/soc/video@e6ef0000", <- IOMMU protected device
>>>       "/soc/i2c@e6508000", <- not IOMMU protected device
>>> ]
>>>
>>> The change is done in two parts:
>>> 1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
>>> not fail if DT device is not protected by IOMMU
>>> 2) add chained call to sci_do_domctl() in do_domctl()
>>>
>>> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
>>> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
>>> ---
>>>
>>>
>>>
>>>    xen/arch/arm/firmware/sci.c             | 37 +++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
>>>    xen/common/domctl.c                     | 19 +++++++++++++
>>>    xen/drivers/passthrough/device_tree.c   |  6 ++++
>>>    4 files changed, 76 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
>>> index e1522e10e2..8efd541c4f 100644
>>> --- a/xen/arch/arm/firmware/sci.c
>>> +++ b/xen/arch/arm/firmware/sci.c
>>> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>>>        return 0;
>>>    }
>>>    
>>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>> +{
>>> +    struct dt_device_node *dev;
>>> +    int ret = 0;
>>> +
>>> +    switch ( domctl->cmd )
>>> +    {
>>> +    case XEN_DOMCTL_assign_device:
>>> +        ret = -EOPNOTSUPP;
>> Are you sure -EOPNOTSUPP is the right error code for the 3 checks below?
> 
> The -EOPNOTSUPP code is used because this is part of a chained call after
> iommu_do_domctl, as stated in xen/common/domctl.c:859. The
> XEN_DOMCTL_assign_device
> call is expected to handle any DT device, regardless of whether the DT
> device is
> protected by an IOMMU or if the IOMMU is disabled.
> The following cases are considered:
> 
> 1. IOMMU Protected Device (Success)
> 
> If the device is protected by the IOMMU and iommu_do_domctl returns 0,
> we continue
> processing the DT device by calling sci_do_domctl.
> 
> 2. IOMMU Disabled (-EOPNOTSUPP from iommu_do_domctl)
> 
> If iommu_do_domctl returns -EOPNOTSUPP, indicating that the IOMMU is
> disabled,
> we still proceed to call sci_do_domctl.
> 
> 3. Error from iommu_do_domctl (Fail State)
> 
> If iommu_do_domctl returns any error, the system enters a fail state, and
> sci_do_domctl is not called.
> 
> 4. -EOPNOTSUPP from sci_do_domctl
> 
> If sci_do_domctl returns -EOPNOTSUPP, this indicates one of the following:
> - The provided device is not a DT device.
> - There is no cur_mediator available (indicating that the SCI subsystem
> is enabled
> in the configuration, but no mediator was provided).
> - The current mediator does not support assign_dt_device (this is
> expected to be changed;
> see below for details).
> In this case, -EOPNOTSUPP is returned but will be ignored, and the
> original return value from iommu_do_domctl will be used as the final result.
> 
> 5. Return Code from sci_do_domctl
> 
> If sci_do_domctl returns 0 (success) or an error code (failure),
> the return value from iommu_do_domctl is overridden, and the result from
> sci_do_domctl is returned.
> Note: -EOPNOTSUPP from iommu_do_domctl will also be overridden since
> step 2 was successfully completed (or failed).
>>> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
>>> +            break;
>> this one
>>
>>> +        if ( !cur_mediator )
>>> +            break;
>> this one
>>
>>> +        if ( !cur_mediator->assign_dt_device )
>>> +            break;
>> and also this one? It seems more like an -EINVAL as the caller used a
>> wrong parameter?
> 
> I think you are right that this case should return -EINVAL because we
> should fail if mediator
> 
> without implemented mandatory features was provided. Will be fixed.
> 
>>> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>>> +                                    domctl->u.assign_device.u.dt.size, &dev);
>>> +        if ( ret )
>>> +            return ret;
>>> +
>>> +        ret = sci_assign_dt_device(d, dev);
>>> +        if ( ret )
>>> +            break;
>>> +
>>> +        break;
>>> +    default:
>>> +        /* do not fail here as call is chained with iommu handling */
>> It looks like this should be an error
>>
>>
>>> +        break;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>    static int __init sci_init(void)
>>>    {
>>>        struct dt_device_node *np;
>>> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
>>> index 71fb54852e..b8d1bc8a62 100644
>>> --- a/xen/arch/arm/include/asm/firmware/sci.h
>>> +++ b/xen/arch/arm/include/asm/firmware/sci.h
>>> @@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
>>>     * control" functionality.
>>>     */
>>>    int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
>>> +
>>> +/*
>>> + * SCI domctl handler
>>> + *
>>> + * Only XEN_DOMCTL_assign_device is handled for now.
>>> + */
>>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>>>    #else
>>>    
>>>    static inline bool sci_domain_is_enabled(struct domain *d)
>>> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
>>>        return 0;
>>>    }
>>>    
>>> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>>    #endif /* CONFIG_ARM_SCI */
>>>    
>>>    #endif /* __ASM_ARM_SCI_H */
>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>>> index 05abb581a0..a74ee92067 100644
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -27,6 +27,7 @@
>>>    #include <xen/vm_event.h>
>>>    #include <xen/monitor.h>
>>>    #include <asm/current.h>
>>> +#include <asm/firmware/sci.h>
>>>    #include <asm/irq.h>
>>>    #include <asm/page.h>
>>>    #include <asm/p2m.h>
>>> @@ -851,6 +852,24 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>        case XEN_DOMCTL_deassign_device:
>>>        case XEN_DOMCTL_get_device_group:
>>>            ret = iommu_do_domctl(op, d, u_domctl);
>>> +
>>> +        if ( !ret || ret == -EOPNOTSUPP )
>> It is better to invert the check:
>>
>> if ( ret < 0 && ret != -EOPNOTSUPP )
>>       return ret;
> +
>>> +        {
>>> +            int ret1;
>>> +            /*
>>> +             * Add chained handling of assigned DT devices to support
>>> +             * access-controller functionality through SCI framework, so
>>> +             * DT device assign request can be passed to FW for processing and
>>> +             * enabling VM access to requested device.
>>> +             * The access-controller DT device processing is chained after IOMMU
>>> +             * processing and expected to be executed for any DT device
>>> +             * regardless if DT device is protected by IOMMU or not (or IOMMU
>>> +             * is disabled).
>>> +             */
>>> +            ret1 = sci_do_domctl(op, d, u_domctl);
>>> +            if ( ret1 != -EOPNOTSUPP )
>>> +                ret = ret1;
>>> +        }
>>>            break;
>>>    
>>>        case XEN_DOMCTL_get_paging_mempool_size:
>>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>>> index 075fb25a37..2624767e51 100644
>>> --- a/xen/drivers/passthrough/device_tree.c
>>> +++ b/xen/drivers/passthrough/device_tree.c
>>> @@ -318,6 +318,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>                break;
>>>            }
>>>    
>>> +        if ( !dt_device_is_protected(dev) )
>>> +        {
>>> +            ret = 0;
>>> +            break;
>>> +        }
>> I am concerned about this: previously we would call
>> iommu_assign_dt_device and the same check at the beginning of
>> iommu_assign_dt_device would return -EINVAL. Now it is a success.
>>
>> I am not sure this is appropriate. I wonder if instead we should:
>>
>> - remove this chunk from the patch
>> - change the return error for !dt_device_is_protected at the top of
>>     iommu_assign_dt_device from -EINVAL to -EOPNOTSUPP
>> - this would fall into the same ret != -EOPNOTSUPP check after
>>     iommu_do_domctl

We need to be careful here :(

The reason for this change, in it's current form is to make this part of
the code to work the same way as other parts [1] and [2] where IOMMU is configured (yep, and get what we need):

[1] xen/arch/arm/device.c handle_device()
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/device.c;h=5e1c1cc326ac04d30e7158905fead9b41c719fc0;hb=HEAD#l287

which is used to create hwdom(dom0) or apply overlays and called for every "own" node (!"xen,passthrough").
The "own" node may not be IOMMU protected.


[2] xen/common/device-tree/dom0less-build.c handle_passthrough_prop()
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/device-tree/dom0less-build.c;h=3d503c697337a4cc6df35403b9a2595b40089dae;hb=HEAD#l224

which is used for "dom0less" devices pass-through (arm/ppc) and called for every node with "xen,path" property,
but this path is intended to perform not only IOMMU, but also IRQs configuration.
The DT node, pointed by "xen,path", may not be IOMMU protected.

In both above cases call pattern is:

     res = iommu_add_dt_device(node);
     if ( res < 0 )
	return res;

     if ( !dt_device_is_protected(node) )
          return 0; //no failure

     res =  iommu_assign_dt_device(domain, node);
     if ( res )
	return res;

And only when XEN_DOMCTL_assign_device (iommu_do_dt_domctl()) is handled the call pattern is
different and there is no check for dt_device_is_protected().

> 
> That's a good point. I think we should do the same for
> 
>   > if ( !is_iommu_enabled(d) )
> 
>   >  return -EINVAL;
> 
> because in this case we should process sci as well. I will do the change

-- 
Best regards,
-grygorii

