Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2306C9844BB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 13:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802646.1212954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3mj-00067a-Jc; Tue, 24 Sep 2024 11:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802646.1212954; Tue, 24 Sep 2024 11:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st3mj-00064v-G4; Tue, 24 Sep 2024 11:32:49 +0000
Received: by outflank-mailman (input) for mailman id 802646;
 Tue, 24 Sep 2024 11:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Xj2=QW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1st3mi-00064p-I9
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 11:32:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2417::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b86f8342-7a68-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 13:32:47 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB8074.namprd12.prod.outlook.com (2603:10b6:610:12b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Tue, 24 Sep
 2024 11:32:43 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 11:32:43 +0000
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
X-Inumbo-ID: b86f8342-7a68-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0uxJthOFKggyikP3ppLiizbRx2SmCaHJcVxy9Of1Pgrw3NViAOais7x7nTTRGXxpyYoDT6MVrtdcdWd4CYSV+uzAdY+HNcek9tkyVt/nsik3YBTHsLrn83kZ3TnV20tWD16j7x0hjuwiEEzZcpLkzGPkBY4cwwKlHYJUtuU9IGKtxscKdUnIxwOeYYmjSl29BRrtDryhIpM+xlX8zdVw+JhCp5aFcVSB7HUn7LoRT8Xi/kU+AHVp2YZedvqbBaEMbovwPkYD0aWAxwFKONZmth8O1hl2AvfCCc4x1UWIg0NMt9i+zSJYy1hKNKQq8C72tCh0N2+IzKL75vG2LS03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUSZKLjS3LypqSfU7f1QfZ+kUMm2Pzgia1ljLcJof74=;
 b=XbN8yyYuu+kLrIwvHGrEeuPAXkbCyCWkhpzOEq6rM9HFQDJo7ta2l1tEjXo3XtmysO6Y6tDEc1agaxmxaOB2Es1yVkM6N7GjnzgrIciECjZtlLtYRuAN2vx8TUJMd9ZfEHpfA8Gn65Ls+rBYlsq9NMIUjPszOrRs+LQ1nQS8JABEP+pGZ+w8+1RHFC/ComJ6F6hQ0JYDpLZ3HcSe28R5qNsULEJnQ+PPuPeWTIE+q5+oGRYSW0Z/yR+FfoO3sDRKhcnFDkLWLbmRYdukY3Nl0LM5EQXKTdEKQdBZWq6SJokju3QgJa2uSUE+yTr3PK+IkJwRRTnpCdYfUTpq6CU02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUSZKLjS3LypqSfU7f1QfZ+kUMm2Pzgia1ljLcJof74=;
 b=cojqtEUcInw5HI/1ilOlPMb65MHbslHm8K1SBJyvKBm4/melmnpR3BCw1JEf0DJ+pvvIyWRbTR7BoItwNVnsxCfuoUWp00Q5T8eResrqh3itS18nR6zJo+nkRVWyVFtcnPceY0+WAosMNRgQ4b+rmtB7YdpJef5w3olMpPwjvkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <04bcb27f-8139-43ed-839c-1febe2eb5a13@amd.com>
Date: Tue, 24 Sep 2024 12:32:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-4-ayan.kumar.halder@amd.com>
 <e515dfb1-efb6-41a5-85a4-65ec7e9c60a6@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e515dfb1-efb6-41a5-85a4-65ec7e9c60a6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f5946d-26b1-4594-1eba-08dcdc8c9aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aldwcStFSTQ0VUdWTmR0eHJnS2hhUkJXZEdxZzNJZm5hc1dYanNTYThDenJW?=
 =?utf-8?B?VFlzVTZsOHBNSG9TM2ZKTVFvckxncmk4QWVEczlRdFB4bjVuZmtkK2I3VSsv?=
 =?utf-8?B?QUtZQmJTaG9DejZHenRmeXBaelNIVHZNcmE3TGlEWnZ5K0cyUWE2L3FHdVE3?=
 =?utf-8?B?YTdseWdCb1RrVEJQZGtlMTM1bG9Jc013bmR1OTM5OUhmUnpsYXVlMEwzbnlH?=
 =?utf-8?B?N1c2aElMOWtWcUZmM0ZWMGN3MVp2aVBQeHNjTm9OUG1wSnkzaUZLTGNhcHp6?=
 =?utf-8?B?L2M4VDZPcm8vYjc1dkJudkRQQ3JwRC9TVGZ0cGYwOGVFK1hZMFYwNndaVi9r?=
 =?utf-8?B?QVYzMUExd0xodExFYU9Bdjd3eUZncEUvK1ZSMTgyajlJUmJtZzdxeDUyK3Z1?=
 =?utf-8?B?eWZjZE80aWRKUkw2WGdZaWVVNURIVUQwbmwyOWFxbFhWdWc4bWtuWXZQUFRp?=
 =?utf-8?B?dmgvd1BEd3VtSDVramZZTXBBKy9KSVJYT0FodGw3YmR0MFBlS2V2QmR6MlZk?=
 =?utf-8?B?T2VwaExDUHJ5WUJZKytLblovZG5jWnd4TzVteXVSejVsSzZqOCtDcExlT1lt?=
 =?utf-8?B?SXc0S2hLOU55VWpHTGZXdEVCbi8vOHNTWTllOU5ia0k4RHBJVG1JcGxHdThu?=
 =?utf-8?B?TUxsRndnWWxlbEQxQm8ydG8wVmN5VUIyYTczUG1yQi9weVp6Y0F6WkVqWksz?=
 =?utf-8?B?TS82WVhNZjJyMlA1cU5zU1hqMHBMeGY3NzZGNFNsWU43V0gvRExqcnNuRFJJ?=
 =?utf-8?B?NHI0Q2dnWmNmZS9iMGF4THhkM0JRVHpvRU5hcnNIS2FmbjlGRjRLTUxsRUVk?=
 =?utf-8?B?TlVZdjJQV2YyWnU1c1JHTHNPQ2Q2SnBhZ08zUjVaVWtRQWhaTjVKUjJoVzI4?=
 =?utf-8?B?MFZqNVRYanJHN2ZQZlM3MG5PNEZxSDJzWTV3OGo2dTBqMW84eHIwMnJuVzdF?=
 =?utf-8?B?SHNpTFYyZ1NucG14TnAyM1FGd0NXRFdxdjZMdm9Kb2N0ekZFeTRZUU1TSHlJ?=
 =?utf-8?B?aXVmYkViTUUyOVZFNFp4OEZpeS8zSEVIaENtWlNqUVFBdElXdFkrZlozT0gw?=
 =?utf-8?B?Qk1YMnJMelB1VkE4ZnAwVHNvcW1UdjlRblc3ejh3ZEdscldGNC9SczI1eWVj?=
 =?utf-8?B?NTVWWm5NNzFObUkybm9IUzlOVGxlcndsVVlkTGNpeTI0WkpzcFpNNEJqVW1D?=
 =?utf-8?B?cHBWT0NyeFFpeWlkaHc2QnUzUHZXOGJqalUrcWdWTGNacWhFbzJ0K0NZRjR2?=
 =?utf-8?B?Q3drWndMUmJvOUF0T3VGRkJPZTYwYWdZWU9IOGpoNHcva3J3VFFTRUJobXZs?=
 =?utf-8?B?VUt1UGNQMllmeGgwRElKMENVYk9aWE82NXorZEV6eW5MZitkV0RzcHNrT3VU?=
 =?utf-8?B?VitINS9jTWJ4MkZscnNmSlpzeHErWm9qTHgxWTVkUXdJdzAwRmM4bFd2L2F6?=
 =?utf-8?B?UHhyOThoZUdIV21sQXFYbEtyWmJvekI3RXlBaG9wV012VStQRzZLaXFvK0Z2?=
 =?utf-8?B?eExwMEk5RjVLdmtMYXUreEVuNWV6cmdTQ2V5R1k4MG9ZZWVTY2dRT0s0SDhu?=
 =?utf-8?B?a2daclhWcGZ6bWxZS0VmZTRiVXNqR2NvQ200cmFuanNGbnM4YjZGY1NoM3VK?=
 =?utf-8?B?UmZSMkp0MFJ5aHZpMFdVV2dqL3ZBbyt1TlVzN0ZIWkxVZ3k2NWdGWkZxZ2dS?=
 =?utf-8?B?UlNWQTBSWGV0VjFHekhpY2tzK2NNNEpKOTlURnFzTlVPZCtpY0tNOUxMOThV?=
 =?utf-8?B?QmRHY2k3aG5FVVdsdEVxdFlSZzUvMW9PUWlKUnZldTVIamZBVFRXNFd3TXZr?=
 =?utf-8?Q?QvPEQPENaXm+5bIBoUcatSAPRlFh88PWku7dY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDRxOFBpQUhjcHVDUDA1SEpBSldRcHBXbTJqUG1pN1ZVZTQ0ZWhiY2o5YlhY?=
 =?utf-8?B?aVFtdjNKcXl2elhiQkhPNHVEajVEZDBCSG94MXFzM1NGemNRaE9oek1ZTU12?=
 =?utf-8?B?V2NzMmVhZGRBMC9Xd2ZPeWFOWDkwczhCaDBXb0FhdFNZajZqNWJvdHRRSUtN?=
 =?utf-8?B?d0ZIMEFyTmc2Rm0wRVRlUXM0SEVhSEdIVFNKVjhlWnFVNkt3SzNwV2d3Q0hD?=
 =?utf-8?B?OTl5U1F1T2pGclUrS3Z1V2EzYkNZeThvQmVHWk9EbllEYmRXWXVlUU1rZ2Yy?=
 =?utf-8?B?VHZVNDFOajBDUUdPbEV5NUZDa0NiUUJlV0lja1Y0OHVWcGtXY2xKZ1RjZTA3?=
 =?utf-8?B?TUNTMm9JdWt0VURMSElmWEFDeXlnaVh0RW8za21FYWgvNVNla1hGTnNXS3NT?=
 =?utf-8?B?U1ZuUXdHOVdKelJFY3EzMERIU3g4L2JzSWdzdHQ3YXZYMjlFV2lHTEZkS2I1?=
 =?utf-8?B?M0VaUjArMkprR3NDU3NCQTRTVlJYRURsOEYvb0JORmVUNW1jcDliamE4anhB?=
 =?utf-8?B?eVFxVXo1aUxnK2NMQjVHOGN4ZGpwUk1xZSt4cTNZOTMyWnJsUmM2amxlOVBQ?=
 =?utf-8?B?cVh6NDVUcE9yQ3gxakNtRzRPc3lzS29jS0p3b3hsQzF5QjJBNzFXa3djR1J2?=
 =?utf-8?B?VlFSSjE5K0kyNDgwMW1tQnRNYlBCWVI5Uk15VXA2dDlRa0NXY2lNOWNXQnFJ?=
 =?utf-8?B?cTNpeitUT1ZjNm9HNVBSNE41NkF0Y24vN2JoeXprWi9jdDVrZkJWTHc4ZUJC?=
 =?utf-8?B?c1dLc0s4SnZab2xxMU5PazNvVndFdHRXRE9qRVZ6WDRnTGNnRDFjbVI4aC9x?=
 =?utf-8?B?NEkrYW9MTW1mQklXZ1pLSnFuQWc0RHc1Z1JraFpTTGlIdzBhdGZxTjR5NkR5?=
 =?utf-8?B?ck5ZN0t4Vm1sVW5LVTJrclVTK2RnQlNsT0I4RWZWbDVUelBKNXJ6U0hrSHcy?=
 =?utf-8?B?ZUYvUzJ5d3h0aXVYRHRkaW5BK1llVW1xK2FyRS9IUVpvQ1ZWQ1VZQ2psOWFL?=
 =?utf-8?B?M1RTZTc5ZCtTMEl4QUxyZjBNMVRoT09raFBQQkZPTkVNaUdFU1c0MkhTRXhl?=
 =?utf-8?B?TWdOcFhjVVNJNWE1YXNMcVM4SVh2OUdoOHgyREhrcVQ3YWdERWpmSGI4bFda?=
 =?utf-8?B?WUdZS3JHTzhhbDFMckh4Nk85akJVTWQydW83cmJJa3JpQXczcmRPZW42SG9t?=
 =?utf-8?B?SldJeXQ5T0t6NmtUQzljZHN3NWhYdEJtOGlkRDNEMEhmVDA3aTVrWU9KSkNM?=
 =?utf-8?B?cC9SMGVpRXVYUit3aTZMMEhxbG1YeHp5TTBwWTVieVYxNldjUlVnTHBIdExv?=
 =?utf-8?B?ZXJOODFvYTQ4a042NTA3UUdWZDhldVVuMTFaejg1dWk4clpxOWcvd2hSRlk4?=
 =?utf-8?B?WmNJZU5lYWEycEZVTnMrLzVNVTY2WkJ4M203ajVwbEJXZVJicjUzSDlNeS9Y?=
 =?utf-8?B?dkR6NVRraWU3ZUxlOXBvNEdDNVdFQlJEUFN5ZEQ0VndEMGJxWVdEdkhEZ0Nk?=
 =?utf-8?B?WWx6TGUxLzlaYU9tQkh2RFhmdWo2K0phaWJ4ZUxwRUxzZkFidWJHQkJvTEF4?=
 =?utf-8?B?L0NvbHlTL1YrbGJKbEE0d0lMOHVxemZPdTFIR21GbVRJTHFQWkQ1VDlDMVAz?=
 =?utf-8?B?WXcrWlIvdW10WkNiRVVhRUU3YXU3SmlidFBraHRqVERpK0lkTk5kbTdQWFVZ?=
 =?utf-8?B?b0tGbUpwTXdOM2pNSHNRSWFMSzNCbTYyUnM4Zmx2SmxHb3NmZXVRZkpSTUNn?=
 =?utf-8?B?Zk1iOTRCWDNNQlVEaWNPUjlDUStxa2ExZVJOejR1enBDYUZPNFlmUzhNamgv?=
 =?utf-8?B?ZWFnVzVFSmNReEpWOGtKUCtXV29MYTdJQnFrWnlESUxkN3NWcmpjdGhLaE1k?=
 =?utf-8?B?L0tNd1B2ZHBEQmU3Nk10Rm1MWitBS05UMHg1SjFCSHZWN1hGMTRtaER4WXBJ?=
 =?utf-8?B?RzVUY1hyNEhDTk5XWWRRWjljNXFIQkRyZ1Vmb1RPZy96ZGYrTEMySWFBSHIz?=
 =?utf-8?B?WG11L0Fqb2c4UWhqSXpLNmZDVVhHbjY1UmlKWUhyc0JUeVhnM3FITlBNOUJt?=
 =?utf-8?B?MjU2ckNkVXRuOVM0TFN6dDBpb1haZy9FdVF6WTJqa1RBTzViL2p3NDVlUVA3?=
 =?utf-8?Q?fDZ5o2QFe0sEz9EUXvR5vdTq2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f5946d-26b1-4594-1eba-08dcdc8c9aa1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:32:43.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrRMK91M36WQmsnBO6mUahg13N3PqYW666xxAEg5ZOqiUTWlFn5qT49BHqxn/y1/5/zVian16rci2xX3iHpCMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8074


On 19/09/2024 14:16, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need some clarifications.

>
> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>>
>> Like boot-time page table in MMU system, we need a boot-time MPU
>> protection region configuration in MPU system so Xen can fetch code and
>> data from normal memory.
>>
>> To do this, Xen maps the following sections of the binary as separate
>> regions (with permissions) :-
>> 1. Text (Read only at EL2, execution is permitted)
>> 2. RO data (Read only at EL2)
>> 3. RO after init data (Read/Write at EL2 as the data is RW during init)
>> 4. RW data (Read/Write at EL2)
>> 5. BSS (Read/Write at EL2)
>> 6. Init Text (Read only at EL2, execution is permitted)
>> 7. Init data (Read/Write at EL2)
>>
>> If the number of MPU regions created is greater than the count defined
>> in  MPUIR_EL2, then the boot fails.
>>
>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
>> Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
>> PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
>> registers", the following
>>
>> ```
>> The MPU provides two register interfaces to program the MPU regions:
>>   - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>> PRLAR<n>_ELx.
>> ```
>> We use the above mechanism to configure the MPU memory regions.
>>
>> MPU specific registers are defined in
>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single 
>> MPU region,
>> we have separate MPU regions for different parts of the Xen binary. 
>> The reason
>> being different regions will nned different permissions (as mentioned 
>> in the
>> linker script).
>>
>> 2. Introduced a label (__init_data_begin) to mark the beginning of 
>> the init data
>> section.
>>
>> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>>
>> 4. Fixed coding style issues.
>>
>> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
>> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
>> (Outstanding comment not addressed).
>>
>>   xen/arch/arm/Makefile                        |   1 +
>>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>>   xen/arch/arm/arm64/mpu/head.S                | 176 +++++++++++++++++++
>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
>>   xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
>>   xen/arch/arm/include/asm/mm.h                |   2 +
>>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
>>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>>   xen/arch/arm/xen.lds.S                       |   1 +
>>   9 files changed, 253 insertions(+)
>>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7792bff597..aebccec63a 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -1,6 +1,7 @@
>>   obj-$(CONFIG_ARM_32) += arm32/
>>   obj-$(CONFIG_ARM_64) += arm64/
>>   obj-$(CONFIG_MMU) += mmu/
>> +obj-$(CONFIG_MPU) += mpu/
>>   obj-$(CONFIG_ACPI) += acpi/
>>   obj-$(CONFIG_HAS_PCI) += pci/
>>   ifneq ($(CONFIG_NO_PLAT),y)
>> diff --git a/xen/arch/arm/arm64/mpu/Makefile 
>> b/xen/arch/arm/arm64/mpu/Makefile
>> new file mode 100644
>> index 0000000000..3340058c08
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += head.o
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> new file mode 100644
>> index 0000000000..ef55c8765c
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -0,0 +1,176 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/mm.h>
>> +#include <asm/page.h>
>> +
>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +
>> +/*
>> + * Macro to round up the section address to be PAGE_SIZE aligned
>> + * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
>> + * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
>> + * or in the end
>> + */
>> +.macro roundup_section, xb
>> +        add   \xb, \xb, #(PAGE_SIZE-1)
>> +        and   \xb, \xb, #PAGE_MASK
>> +.endm
>
> Can you explain why we need the region to be page-aligned? Would not 
> 64-bytes alignment (IIRC this is the minimum by the MPU sufficient)
We are aligning the limit address only (not the base address). However ...
>
> And more importantly, if those regions were effectively not aligned, 
> would not this mean we would could configure the MPU with two clashing 
> regions? IOW, this round up looks harmful to me.

you are correct that there is chance that limit address might overlap 
between 2 regions. Also (thinking again), the limit address is 0x3f 
extended when is programmed into PRLAR. So, we might not need alignment 
at all for the limit address.

>
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * Inputs:
>> + * sel:         region selector
>> + * base:        reg storing base address (should be page-aligned)
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + *
>> + * Clobber \tmp1, \tmp2
>> + *
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, tmp1, 
>> tmp2, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
>> +    /* Round up limit address to be PAGE_SIZE aligned */
>> +    roundup_section \limit
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +
>> +    msr   PRSELR_EL2, \sel
>> +    isb
>> +    msr   PRBAR_EL2, \prbar
>> +    msr   PRLAR_EL2, \prlar
>> +    dsb
>
> Please use "dsb sy". This has the same meaning as "dsb" but more 
> explicit for the reader.
Ack
>
>> +    isb
>> +.endm
>> +
>> +/* Load the physical address of a symbol into xb */
>> +.macro load_paddr xb, sym
>> +    ldr \xb, =\sym
>> +    add \xb, \xb, x20       /* x20 - Phys offset */
>> +.endm
>> +
>> +.section .text.header, "ax", %progbits
>
> Does the code below actually need to be in .text.header?

I can remove this altogether.  As I understand, the code should be in 
.text section.

>
>> +
>> +/*
>> + * Enable EL2 MPU and data cache
>> + * If the Background region is enabled, then the MPU uses the 
>> default memory
>> + * map as the Background region for generating the memory
>> + * attributes when MPU is disabled.
>> + * Since the default memory map of the Armv8-R AArch64 architecture is
>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background 
>> region here.
>
> Based on this sentence, I was expecting an instruction to clear 
> SCTRL_EL2.BR. What did I miss?

Sorry, based on 
https://developer.arm.com/documentation/102670/0300/AArch64-registers/AArch64-register-descriptions/AArch64-other-register-description/SCTLR-EL2--System-Control-Register--EL2- 
, SCTLR_EL2.BR == 0 (reset value). Thus, the background region is 
disabled by default.

Should I still set SCTLR_EL2.BR = 0 ? Or do I update the description 
with this info.

>
>> + *
>> + * Clobbers x0
>> + *
>> + */
>> +FUNC_LOCAL(enable_mpu)
>> +    mrs   x0, SCTLR_EL2
>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>> +    dsb   sy
>
> There is no memory access in enable_mpu. So what is this dsb for?

We need to ensure that the outstanding memory accesses are completed 
before the MPU is enabled. I think the same rationale applies here as

enable_mmu()

{

...

"dsb   sy                     /* Flush PTE writes and finish reads */"

..

}

In the case of MPU, we need the reads to be completed.

>
>> +    msr   SCTLR_EL2, x0
>> +    isb
>> +
>> +    ret
>> +END(enable_mpu)
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>> different MPU
>> + * regions. Some of these regions will be marked read only while the 
>> others will
>> + * be read write or execute.
>
> And some in the future may need to be memory region (e.g. to use the 
> UART early) :). So how about just dropping it?
Yes.
>
> > + *> + * Inputs:
>> + *   lr : Address to return to.
>> + *
>> + * Clobbers x0 - x7
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
> > +    mov   x7, lr> +
>> +    /* x0: region sel */
>> +    mov   x0, xzr
>> +    /* Xen text section. */
>> +    load_paddr x1, _stext
>> +    load_paddr x2, _etext
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    add   x0, x0, #1
>> +    /* Xen read-only data section. */
>> +    load_paddr x1, _srodata
>> +    load_paddr x2, _erodata
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>> attr_prbar=REGION_RO_PRBAR
>> +
>> +    add   x0, x0, #1
>> +    /* Xen read-only after init data section. */
>> +    load_paddr x1, __ro_after_init_start
>> +    load_paddr x2, __ro_after_init_end
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>
> Is it necessary to have a section for the ro-after-init? IOW, could we 
> just fold into...
>
>> +
>> +    add   x0, x0, #1
>> +    /* Xen read-write data section. */
>> +    load_paddr x1, __ro_after_init_end
>> +    load_paddr x2, __init_begin
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>
> ... this one during boot 

This makes sense. So what you are saying is that there should be a 
single RW data region from __ro_after_init_start to _eteemediator  (not 
__init_begin as it would overlap with the next).

Followed by a text region from __init_begin to _einittext. However 
_eteemediator is same as __init_begin, so should we be inserting a dummy 
page in between ?

A RW data region from __init_data_begin to __bss_end. Can we combine the 
BSS section and init data section into one region ?

> and then fold the ro-after-init to the read-only region? 

This I did not understand.

> This would possibly reduce the number of used by Xen and also avoid 
> reshfulling the MPU section.
>
> Another possibility would be to move the ro-after-init MPU region at 
> the end.
>
> > +> +    add   x0, x0, #1
>> +    /* Xen BSS section. */
>> +    load_paddr x1, __bss_start
>> +    load_paddr x2, __bss_end
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>> +
>> +    add   x0, x0, #1
>> +    /* Xen init text section. */
>> +    load_paddr x1, __init_begin
>> +    load_paddr x2, __init_data_begin
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    add   x0, x0, #1
>> +    /* Xen init data section. */
>> +    load_paddr x1, __init_data_begin
>> +    load_paddr x2, __init_end
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>> +
>> +    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>> +    mrs   x1, MPUIR_EL2
>> +    cmp   x0, x1
>> +    bgt   1f
>> +    bl    enable_mpu
>
> It seems to be a bit odd to check *after* we wrote. It would be useful 
> to explain why this is fine.
Sorry, it needs to be checked each time we create a new region. I will 
fix this.
>
>> +
>> +    mov   lr, x7
>> +    ret
>> +
>> +1:
>> +    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
>> +    wfe
>> +    b   1b
>> +END(enable_boot_cpu_mm)
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> new file mode 100644
>> index 0000000000..b0c31a58ec
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_ARM_ARM64_MPU_SYSREGS_H
>> +#define __ASM_ARM_ARM64_MPU_SYSREGS_H
>> +
>> +/* Number of EL2 MPU regions */
>> +#define MPUIR_EL2   S3_4_C0_C0_4
>> +
>> +/* EL2 MPU Protection Region Base Address Register encode */
>> +#define PRBAR_EL2   S3_4_C6_C8_0
>> +
>> +/* EL2 MPU Protection Region Limit Address Register encode */
>> +#define PRLAR_EL2   S3_4_C6_C8_1
>> +
>> +/* MPU Protection Region Selection Register encode */
>> +#define PRSELR_EL2  S3_4_C6_C2_1
>> +
>> +#endif /* __ASM_ARM_ARM64_MPU_SYSREGS_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index b593e4028b..8b6b373ce9 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -2,6 +2,9 @@
>>   #define __ASM_ARM_ARM64_SYSREGS_H
>>     #include <xen/stringify.h>
>> +#if defined(CONFIG_MPU)
>> +#include <asm/arm64/mpu/sysregs.h>
>> +#endif
>
> I would expect the number of user for the MPU sysregs to be limited. 
> So can we include the header only when it is necessary?

ok.

- Ayan

>
> Cheers,
>

