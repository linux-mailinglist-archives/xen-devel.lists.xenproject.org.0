Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0518954E5E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 18:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778673.1188694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sezO6-0001fZ-4R; Fri, 16 Aug 2024 16:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778673.1188694; Fri, 16 Aug 2024 16:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sezO6-0001bx-1Z; Fri, 16 Aug 2024 16:01:14 +0000
Received: by outflank-mailman (input) for mailman id 778673;
 Fri, 16 Aug 2024 16:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mcFh=PP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sezO4-0001br-IX
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 16:01:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2415::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bee23389-5be8-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 18:01:07 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 16:01:03 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 16:01:03 +0000
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
X-Inumbo-ID: bee23389-5be8-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gue+l80SKepldVdFtOkjLspbrWdiKLBMGO88Z1Pz5K7k68BxwPP2LvesRqgiJ1qZK7lkEm6izRziid2WkezJZDrJVIfDyCu4LO+N9w6UcTUv/fVZw2hzhu09oukj6PCXJsWPi0bmNeVYF0bb130rSH2ZuMFeCO/mdGNafrXfwwnLChiDrIPnF2VY4Ma1zeSjO8gRtqcRty/3IWLvOpNQzxks5mnOuPFVmDWrJynvMFu7/UQMJur6RpIKYKAMYJ26ltzg+5D5jaBvDksOUdSnKfl4JXeSsPNnpvDhKqimfhVC+L8kCazPB28/eLHSgS+pSkJgeyMBLP3kNqzBTPkhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SHU9WNyOkSYSpHfKUEpB0REoIKC3j2WHA2NzXdmE/Q=;
 b=DpZNr26FWMZfxGZNQsgN/bP38MX1lCRemkbemAghyDPmqSpNQHq5aRuQ31yTH0Z3Jx6mP+vx4AEC6KP6JsocM6Kav3MOdn0i2AUnDxs3ZuqvIebnm4clMpHNjoE4+RSwM/z3wUHv3ZLIGkWTLjuKXf7Amf1X1t0KIbCONIboM7vGYjKduy0+e9a8KSFsOchY/nc3UaaBzyvPW6cH0vRDJw2Y7HnqDQUmAuG/8vOJJN3+qxQC0V9+tCV+xCqwbOtSOmbJajHOVKNYByV2V2h8++ESN2gPIz6oM5fD3odfSjhmWht10JGFV6S5aSEQu/xPs8GemZfWbjIYk8PttwQlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SHU9WNyOkSYSpHfKUEpB0REoIKC3j2WHA2NzXdmE/Q=;
 b=Kw7E0vfkRhKzCNddzHDr38nfFVyluAZQGHsl0AYrxhYYf7EI2OL9LqLAsm6TsNBnW+Vr1dhWX8Pcnn0gY5Cgvr6EMsQXENncGjoQjRV+L+RSYXJ3vD4NNwoLVN8bgX16pO2PZeP99jNAvLoQuGI8BbUcBLdsTqoW5Vl1G8dGnC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <12e89d43-09bd-45de-9f44-80819ccaab18@amd.com>
Date: Fri, 16 Aug 2024 17:00:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, julien@xen.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <03682a1f-f4d1-4d07-ba86-8e9fc6ed044c@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <03682a1f-f4d1-4d07-ba86-8e9fc6ed044c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea34b6f-5611-48c7-59b2-08dcbe0ca11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzY2Z0NqcVVKSzR0RFI2a1pJL0dncmtyY1ljZytTenduM2lPYXd0UlVENm5H?=
 =?utf-8?B?RGUyblZTV2pka1RsZ0pNaUNVQnppcnUrUUsreGQyUWM5NDNjWlMyTHllZERu?=
 =?utf-8?B?Y0V5Si9EY1U5N1JNTlZIZmlSL0MxTmlBZHhKR1NoOTZvT0ZHRlJHVGM3QzUv?=
 =?utf-8?B?QWhDMG9iNUVwdExwMmVHbWNUUG9qaGlKc0w4OFQxZWtySVlscXRxaURuYm1j?=
 =?utf-8?B?aHpEcUZXb2JJa1kxdUlsMlY0S2VYY3JVeDFRTzFJMUFrTWdqeCtPK0ppdlZK?=
 =?utf-8?B?cHNidFF3Zy9oM25NUnNQcWlERzZSTFQvR2paeFBzUUpuZDlOMjYzMUpLSlI2?=
 =?utf-8?B?ckVoZEpZQjc0SVdBdUlUM3gwWE10bE1GY09XR0YvMW5oTHdGdWc0c2JBaXVJ?=
 =?utf-8?B?MmZkU3RRcUxKenBGQ0FmcE5NWVBKUUhxNXdzUEM0ZjlRTXY1SysyOVpBdUZK?=
 =?utf-8?B?VTBlYnV4ZXZDZmRCTlY4MjE5ZXBvZWcvWStWUGMyVGR1T242eGdxdWh3ZTcr?=
 =?utf-8?B?MmRpUTUyWVpRMEM1WEt6dzJLeEhISzRqenhrT2pwbHgyNElCajFnTE9VS0pn?=
 =?utf-8?B?clBEK09TWUQvSFVxeC9KZk56bXM3ek02NFRvUGNFMU1yNnk2K2VrMitqMjhW?=
 =?utf-8?B?Zk9BWGF6SE1LV0w5UGpqZ0V4ajlXbjdkZDFjRk5vVzJUVUxhbFdFNy9Bd2dE?=
 =?utf-8?B?L2xOMmNGbTE4Nm5SaU50ZmpCSTY5Z1RQdmV2SDB5eGxZN2w5VGpSRloxdWVJ?=
 =?utf-8?B?WlA3QVdTZGM0dmdESXVqNk0zQk04M3lBSnVacERRQ1VUZWp6M3hHMjZlblFm?=
 =?utf-8?B?V08xRVByeDZGNTFxQ2JoL25FeE43M0NXTlZQeGxLMWxlY2FNMXV5aHVpZEhJ?=
 =?utf-8?B?RHBObmx6UlVwVi92dnNXc0UvYmlMTEphejJxcmhBc3l5Y3FUK29XN0Z0ZVVx?=
 =?utf-8?B?bE0yYi9kYnpsSVhnREVLT1I2ZnNzdVFYZnozaHEydkFwN0J3aUIrdDhRQzRE?=
 =?utf-8?B?VGo0ek5GbjJJUFZRL3ZKVURKeFJBYWs4d0E1UWZmK1hSaTd2L0dqSmNpdm9F?=
 =?utf-8?B?TEN6clRPVkpKUDRUM1dOYkdLY1dMTTNRSUtzSURuREtDaW9aTzBxUG12U201?=
 =?utf-8?B?VDBLUU1WOFZuTkNNeDNUSGNUeEQ5VmFoVDBLU21VOGV5S1JpTXA4MEkxa2l3?=
 =?utf-8?B?YkIvNmxLVnNoUGd2emV1RjV1d0M4OUZTL2duUzBTOTZqelZTdU1jbmhhWWdR?=
 =?utf-8?B?ckdPR0NrUWJjelY5SW5vZHI5eTdGekFkR3hoZTZNbXNzYWdRNEVBWFlwbmMw?=
 =?utf-8?B?M2xIS0NSNnhDUmgzRUc2VnFwcUVQRy8yT1FQZlZMMjBFamNOTVdqUnlTemUv?=
 =?utf-8?B?cVZETFNWRHVXdFNGZmFnWGpBUVdHWU9wSEZmcXNSQXExOXJ2elRXQXhOeXlr?=
 =?utf-8?B?NzduS09RV1R0K29DZWIveWhDQlpkL2lmMkpPaCtNY0ppUHhsVWFSWkhUdWFN?=
 =?utf-8?B?dnRSME12c2xTU0JQOG5RTG5ELzNMelJDN0F2K1JESUZLWEU4R29pV2pGTzVm?=
 =?utf-8?B?QU9JdW9NVzRrVi9vRmNmamN6Q2dFMVhuOEhIbWd1SW5jR1JSRjJmV2dya0FC?=
 =?utf-8?B?L1BGNlBEM3hxUjd6dnROSVBKQ1hjK3pyVDlFNFF6ajRKZitDUjE4eHpxWS9N?=
 =?utf-8?B?T0F1MW4veEMyTnZ6L1JnVytXOHJDb1BLRCt6RE9XZzdzSkVUNzZJSno3cXp1?=
 =?utf-8?Q?3zbk1IjUi6NmFYG0Y4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2dPcDJoU21qL2hwNUpCZHhXRVZJNnBzNGJ5dFdjQml3WkxzUFEvbHNONllk?=
 =?utf-8?B?c1d5UGxHbGNFY1NIdmJZR2VRODJXdDE5clByU1N3VTdZSWJpOHF5M1k4d0p3?=
 =?utf-8?B?OVBCdDVDeDQwKzl0WS95ZEZPVlJXMkxEbEhQTXRmbUxOZTJRSWcwNC8rU3Er?=
 =?utf-8?B?MGh4Z2dzeVVLcmoxL3hzb3Y1bElxMXBvTDFwT1JoeURlcEpzdDhSMThZODlF?=
 =?utf-8?B?OU5vcDNnWnFXVHJEdHdwYmQwU0Ruc1NXcStqNlc2dFljbTRkb1pERWUyaU5F?=
 =?utf-8?B?TDM5Zlc4elNEY0JhTjNCeG9keWxMTmJobkluS0podTdxeS8zMnc5QVR0bDRI?=
 =?utf-8?B?eGk1M2RqM3RHOVhaUnQ1U3NzSUp3OWYyQy9zcmtBYXV2TmV6TTFUYWx6ME1v?=
 =?utf-8?B?TzhpRzNHVWhFbTNEOS9yMkNzanBNWndUMHlHZi9jdDhKT1B0ZVNCaTRCTGVG?=
 =?utf-8?B?M1NYak5jcjVuL3d0SFoxRlVUM2VWVTF5eVlxNmp3TDhxMVZLbUlxdVlZQUk5?=
 =?utf-8?B?cU1WZXdZeG9mZTc5dlZCZkZpQTd0clpDelUxaWFPMjZWWHEyR1hBUkttS2lO?=
 =?utf-8?B?eTFlUTdqYUZXVDVuZnZtZFl1MzhGWWQ1QU1oeTNoOXROVnBVa2VheC9NYTFS?=
 =?utf-8?B?ak4xSmNSQWVkeDJMaVJxMWI3SjdMeE0yeWlUN2RlMzdENjBkSzUvNTFxdU1Y?=
 =?utf-8?B?a3RZSmpmb1dQb2liek5hZk1tWUZuelJTUGY4SUNyUm9HRFRKTHFxTDRmQ1Vy?=
 =?utf-8?B?UmxTMTNaQXZUSDJlWmFLSmlWbmpBbXFPVTdTT1k5eVo1YkZOU0VLUitaRldw?=
 =?utf-8?B?VTYwck9kYk5sZVlaTXJNTnQvL0ZkbDRpQWxKdDd3V0xHQ0VRbHl6UHZQdG1m?=
 =?utf-8?B?dFlUcEptK3VnblVrOFZzZTFTYWZMOGw4NElMNzA2R1dYQUcvOTN2dzBFUnN2?=
 =?utf-8?B?cU9hL3gxamtkMEpDNVhtV1AwWnJMQnlLSEErc0FuRkRmdnlKMjdzK281M1k0?=
 =?utf-8?B?UGt2VkVBckZDMVNHNzV5UHk1RlQydU1RR0VMbWo0dFRyMTZTNER5dXBvNmpi?=
 =?utf-8?B?aGpUaFpiSTg5S0lpU09ocjJMQ1pYbEt1SnFNU0FsOUxMSzNDa3pwSXZsbzNu?=
 =?utf-8?B?WXkyYmdQZVVEYktxK3RNc0xOdlgrNjZ1YlV5c1ZpUHNiRXR4SnJrak1hNjd0?=
 =?utf-8?B?dnNZL1YxcE1oYVhHanEzaW4rRGpUcmovcWdROVUvaWpUdGU2THEza0hER2NU?=
 =?utf-8?B?cW5aR1pMVDFkTnExNU9PZkZSZEhreGxTZjNId0dGSXNnajFONUJ1RVdpZDhZ?=
 =?utf-8?B?NUpLUjZEQkluWjBBOGNDeDNHYTE4YU1ISmFWZ21RaldzOEV4Y0Y4TUx5RXc3?=
 =?utf-8?B?QW16T0dmd3hBSUFlOS9BOUFQd2M2bmpVd1VWTDZRMVJPSlc2alFva1RvSWVW?=
 =?utf-8?B?djBaRE1qRkxueXkxWkVzTFVPdzZ5dWZRa0tTM1ZYZVpTY05wVGRrS2o5WEhT?=
 =?utf-8?B?TjltaXlWa01nTmZ6TWx6RThzYkRHNXBLR2hrY3VtVldSeWl1WnRhQnEvMktI?=
 =?utf-8?B?aVFtOUNSdW4wMkJHcDErZm9nQ3h1NmNRWVdRc1ZVd2JlNUZiUUtTYVdCUTNP?=
 =?utf-8?B?RnY1ZDArSVNvWDlsSVRkZEQ5ZVBHaFVjYnQxYXQzaUZteUROTTcyOFFtN2ky?=
 =?utf-8?B?aVJDcGlxYWlLZXZ1Z3FndkdreGgrM1R2b29mTjRyZUx1VHhHOXAweFFnUm5G?=
 =?utf-8?B?VTNGQWlKNENZZ3ZTcy90QTZsUWQwNzltL3VmRWN3QjY3bEhaempRZW5HSlBs?=
 =?utf-8?B?MXczaGhFMG9ZeTBqR0RuZWQxSkZQQjRtQ1ZWVkJwbmU3cHZ3amR0WitiRGNs?=
 =?utf-8?B?MjdqUDBremt4YVdmSEZqd0w0eFR0b1VaVEdLMUFibk5QZExZcWYra1pBWlg0?=
 =?utf-8?B?UGRJelV5WndKdlhhNCszNE51MlF3NUNXQTJ5ZHpZOWVZTTUyekQzS2pwVEJi?=
 =?utf-8?B?dnk2WmRWbE4zd04wT0p4bk9PTk9jTDEzbktBcXJYTjk3QUxQMVFNbWVyMDNP?=
 =?utf-8?B?VlZMWVRwak5Sd2NtRUoxeWJRNnUxaThpa1d1clkydXlTUzZRL055VTNSVUEy?=
 =?utf-8?Q?5wU+sqLNG5CICA8iQ79hzDbAv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea34b6f-5611-48c7-59b2-08dcbe0ca11e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 16:01:03.3154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyLVBiJqMdmdJOi9xzVevL7/rPlz8KGWLnoD3zFkI3CrPSBGvvjxPBZ/NxipFjfNeJM9EeWr72qaK79WfnQ+0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377


On 16/08/2024 10:28, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 14/08/2024 14:33, Ayan Kumar Halder wrote:
>> Hi Jan,
>>
>> On 14/08/2024 12:35, Jan Beulich wrote:
>>> On 14.08.2024 12:55, Ayan Kumar Halder wrote:
>>>> Hi Jan,
>>>>
>>>> On 14/08/2024 07:37, Jan Beulich wrote:
>>>>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>>>
>>>>>> Introduced CONFIG_VMAP which is selected by the architectures that use
>>>>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>>>>
>>>>>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>>>>>> with new memory attributes. Since this is highly dependent on virtual
>>>>>> address translation, we choose to fold VMAP in MMU system.
>>>>>>
>>>>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>>>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>>>>> depends on VMAP.
>>>>>>
>>>>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>>>>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>>>>>> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
>>>>> While I'm not an Arm expert and hence I'm likely missing aspects, I question
>>>>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>>>>> conclusion towards the usefulness of branch hardening. I would advise
>>>>> against encoding such a connection in the Kconfig dependencies.
>>>> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was
>>>> added.
>>>>
>>>> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk-PC.armlinux.org.uk/
>>>>
>>>> And from
>>>> https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
>>>>
>>>> Spectre is valid on MMU based systems.
>>> Since then various other issues / flavors were found. I've been focusing
>>> on the x86 side of things, but I'd be very surprised if some didn't
>>> affect other architectures as well.
>> We are talking about Arm here as "HARDEN_BRANCH_PREDICTOR" is specific
>> to Arm.
>>
>> https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability
>> covers all the flavours and it does not include Cortex-R82 or R52.
>>
>> It says the following :-
>>
>> "Cortex-R cores typically use a closed software stack. In those
>> environments, applications or processes are strictly controlled, and
>> therefore not exploitable"
>>
>>> Plus branch hardening can be a pre-
>>> cautionary measure, too, I think.
>> The first two Arm non MMU cores that we wish to support in the
>> forthcoming series is Cortex-R82 and R52.
>>
>> As seen in https://developer.arm.com/documentation/ka005109/latest/, it
>> explicitly states the following about R82
>>
>> The Cortex-R82 implements the faulting feature (FEAT_FPAC) but is not
>> vulnerable. The Cortex-R82 behaves differently than vulnerable A-class
>> CPUs when speculatively executing past an instruction that authenticates
>> PAC, and that behavior does not allow the attack software to create the
>> "oracle".
>>
>> We can re-enable branch hardening if we know there is a valid non MMU
>> Arm core which is vulnerable.
>>
>> Let me know if you are ok with the rationale.
> I'm ok with your rationale.
>
> I have one question for this patch. Why can't we use CONFIG_HAS_VMAP to conditionally compile vmap.c, like:
> obj-$(CONFIG_HAS_VMAP) += vmap.o
> and get rid of VMAP_VIRT_START guard on an entire file?
> With this config in place, it seems strange to use VMAP_VIRT_START as a guard.

I am fine with your suggestion.

However, this implies HAS_VMAP needs to be selected by "config PPC" as 
well (as it defines VMAP_VIRT_START in xen/arch/ppc/include/asm/config.h ).

This is fine as I could see PPC uses MMU as well.

- Ayan


