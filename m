Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BD66F4563
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528666.822118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqJ9-0004jF-Ug; Tue, 02 May 2023 13:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528666.822118; Tue, 02 May 2023 13:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqJ9-0004h4-Rf; Tue, 02 May 2023 13:44:43 +0000
Received: by outflank-mailman (input) for mailman id 528666;
 Tue, 02 May 2023 13:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptqJ8-0004gx-Kc
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:44:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c79adbf-e8ef-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:44:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8453.eurprd04.prod.outlook.com (2603:10a6:20b:410::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Tue, 2 May
 2023 13:44:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 13:44:38 +0000
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
X-Inumbo-ID: 7c79adbf-e8ef-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3VkFcEgpEAKuteAIF5KvAkBLHfZLggxHMosc6dwC0PUDGt1YCV0UAUyYUBSGHfHr28lGFHs1gZuW8laH5/ZxOw0WHtl3iqmJI5KHfohz3RXaKEIw5SkQ/wXFmwvJ73US4Zc0SqMxJGjHmugO54ok4Mq8PqJ/KzIcnazQx5CLgUruNmsgpp2IWV3J/UfCXTrzoyVwew8pQyNephczb2IgzAqLkBk2sX/UwwW26xYq6RLtOoxmv8CU6f+HE2toyRt459/TyktoNHbyAO/gvgmlCsJ+gkPVCNxAdyxU0Mqyf6BuUoAru67XBCh25eUr9RyE+6Rcy43WvciLy4rFX9Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K4kVLOLa5gNCtfHtVS0PlZUKf9AIejVzarpWGB+1X4=;
 b=ahBocm5jBzDvIAwssSxE8pmammmzKGIoGjkCXPGFmk2FBdtEuLVjatYdCfCVGN2JKUU0fBEBY5tc4PwCS/cvUaurqGLAB/2xIDFmu0Xbq0AFoh9ocnBFOXJPjH9F/x9eQsn3FD/2P7Hmx4TPN+sjIBUHGmPytQ9hdmKgPio8WT8a4hnJ1czfF9PUkETYZg97kSAhyA4kLpzJugOIwGMkUsc/YSyBaWVMYenCwKBLUjNrSyTjXCBShoBIirQav3V5W2qQuKdThWHNRVSVgaEwUg2EJAk7wvGOCi5oSsEMVGwan3XV19pGh96fH17pax/tBGCPm6Y67HJluCIkeItmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K4kVLOLa5gNCtfHtVS0PlZUKf9AIejVzarpWGB+1X4=;
 b=pLuaQCoBSxTLGBQxW9BPLyrOMEY8+x9KGISYB/WtIZx3zdMKOalzr8SI0PS62YszwfIDm2TEN+yDszzzfJyGTwKoS7cleFr0rpt2Qn/KUoTfIJ5cmy9jW7/fELfUsJSClfx8UItoWcOjfgjXbgDHpnubUNrpuOrBRGv5hFBJkI9U8bDFFe6ag/jmTwhWpcycLwykbCsYw9nQve8hXesmBXlXNrud3Am15qKuYhlCOe6+u9Fi1fhBA6IzABe6TTbiaDgn/QFwfjlHlXQWEyKQXmwv2RjJtAF4JW5ltXsSnliv/+95+fXyOuaIn5kHpFvVVPqW86h1mxngxt9nsQx12Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea9ec814-83b8-5545-2ce3-46192525cf17@suse.com>
Date: Tue, 2 May 2023 15:44:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: HAS_CC_CET_IBT misdetected
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
 <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
 <20230502133313.2192eb99.olaf@aepfle.de>
 <20230502140444.1dacdb33.olaf@aepfle.de>
 <9353d3f3-563b-ff88-0b0b-dfa2bb03522c@suse.com>
 <20230502153612.431dfc08.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502153612.431dfc08.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: da8d63e4-880e-41a9-e4e1-08db4b135fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TS+o+vBavhdO3T9JE22iVBD11mqKajDwea9IyVP3rvoV2IttswwEe1dR+dgb17kd0FypCC/+ON7RQ6jEMi/JnxgDkV+pym3kdFgjTZABvoWb6kGpRiy24tjao9SgGGj0YvMUPBJMvXKK2G7YHd1xdxYvy5uDLzuOxyREIDu6lqn9EeGpEHGKsIbg1G+3ZT2WPxTspLwDlYqQX3HSx6STmUpkpE3/wWhhCCT44KKJMDa79BZ5tfko6DI/3eCqQ1W5MMhX9+k/bMNjT0mPBJRFq3bUF3LLe7upzGrOV1XHjsDLJmZnBvX4fvIVBL+34r9HDIlbxoW4SzIJH4pYO0Vjk2y5exqh4X5mBB7WmFMA2OT5ao7TRl5zVroM71kam1EUWzlIeGn725hoVfAwRLS1jNFx/Z57esaLSPXAlrf5h5C2RO7PkD5JaAO5BlKsBEVHhLNcmoOnQ3ziY7DSJjgiq7t/k/5/g6uPVe/nwQpA4booupd0H88RS+6voatOeFZbKq8RI9/81xq59zn+QZMZRKHpYJF25Z1l7+WODGJyZve5bsFLongN9shlIEZ9RTTsNpo6tB4GSJPbiUJjFx4Aq9ChfuVOXKqso2ZsgS+CHXZ5UeqxSVk6jcHi1PmXbbVriLrSKNKIrXtpLwW6/IlbTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(41300700001)(8936002)(8676002)(53546011)(31686004)(2616005)(83380400001)(6666004)(26005)(86362001)(4744005)(66476007)(478600001)(66556008)(6916009)(31696002)(66946007)(38100700002)(186003)(4326008)(6486002)(316002)(5660300002)(7116003)(36756003)(2906002)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWtWR2hOUElBeWM4Qm52RGRWRXZacExZcVdwZnRKODV2SjNpVFQ5Z3JHNXNN?=
 =?utf-8?B?bzI3Q0UzMWVuTXFhUjh1ckJRYzV2WUUrTUs3S2lXK0tZRE9SUWo4WGsybVgy?=
 =?utf-8?B?N1IyTFYzT2oyQ0M4cnp6enNXQ0MyVFJGOUs2V2hnRXlaNXVmNllGSEJTektX?=
 =?utf-8?B?bk9iMzQ1MERRZ09yVEVCSEN0NVlBTUxVaFR5TUlYaXdhRGw0ZHZjSWkzOE1o?=
 =?utf-8?B?dERoVlBoNE8wNHhGU3REaUwzRWFDM3dSaEdZeWhkWGdmQ0ZYTHVGejJubG8y?=
 =?utf-8?B?eDl2Qk9iSWN4cERsOVMwZXFudTBDNkRWYkhxaDNoNHRNb3RYRlNkQnBQQS9G?=
 =?utf-8?B?QXV5aVgyL1M1ZElWRXcvYndyUitNTHhNWXhwK2tPK05SdGpGeHBrZWFBaGV6?=
 =?utf-8?B?RzEybnAwazF6UDNlTGh1ZXpidmRSbis1SGpidnJnbWdDaTJGK2xNNmxYYXo3?=
 =?utf-8?B?VkhRSnc1d1JycEQwbFVoYnlnSHBIbEhPdTZWSkt4UnpwNFdBTXVldEZmS0tJ?=
 =?utf-8?B?dE9TOTFQSGJRVys4eHBpaFJPLzRPelJGbkZEdjUyVXMxL1AvcW0wM1RWUUkr?=
 =?utf-8?B?ZHNTRzRadFk5T0tRWkNSZGxHWDh6QUoxSFV3NVJVN3pYd293alBBdUpKdWYy?=
 =?utf-8?B?bE9zL1ZFbml5WEo1SzZVQktXd2haOVJOeTdaSmpZdDc3TWxrRDA5RmlDSWRt?=
 =?utf-8?B?ZWFhd0xrek9sTmdnNnk5OEVhemFDK1lwQ0pxSG1HN3JocnhDZUdteWs4RCtH?=
 =?utf-8?B?SFkzd0RyYkttVnFoS1Jrd3dwODc2NXZ6STFmTGc4UEpadkgra1RiaXpCaU83?=
 =?utf-8?B?SHNKY3NKNFl6YzBUUjNrdDNiNjEwLzNnZ1lTZGI3L28yV1NyYUNHbms0Y2sz?=
 =?utf-8?B?N0pxRVNISHR5b3VhSlNxVXVzMTg0eFJzeTQ1eFIrTFlUV3VJeHlTVFhxUGtz?=
 =?utf-8?B?SldET1JvQVdVVkx6RWlnQ3doQ2diaHg0dmpmTUdsVURhMlo1L2NMdnZ3ajJx?=
 =?utf-8?B?WitLVTNZY0pMVGdiYWZWa1dmN3hCZS9FYWhFbHJNUWYzR2pKTUd4REdQY1NZ?=
 =?utf-8?B?YU1JeFVIZDhBOVlDTFFBSjVTZk9hWEw2NkxjL1RiakhxZEpwSWVNWTFBREI5?=
 =?utf-8?B?djFPZlFSS3p2M0FHZld5UjVYcUpCM2MvT2MvVUZzV3l4V1NhS1ExcStiMTFV?=
 =?utf-8?B?MFBqWExyL3FMZkhIdXliaUFDbGkvTFJJKzRmdE8xR20wMDdteHVuanJCells?=
 =?utf-8?B?L25tLzFWeW11bzgzdmtEVkxKckF6T2pERXB6dTFUTDR5ZTA2M3YzeG9pTzVO?=
 =?utf-8?B?M0REa2thbVF1OWNHWUlUdVR2bmhpblRwQWNqSm5aRVNOZDZITERpWWo1Wm10?=
 =?utf-8?B?QUdESUxkNVNPTm56d0JYOVlGL2UydG04U1J4MFhVZXREcGR6OWQ3TUswVThR?=
 =?utf-8?B?UmdFcjBnM0RZUzZiVmJHZGtJQmJ6YTdNbUt5a21iRzBHZ2FTS0VHa2JGWnhT?=
 =?utf-8?B?Z2E5VGlPSHZYRGFwUm1NblRBQmRsYWI3VFEwSGdIU1NQZWZkckZXMVBEb25o?=
 =?utf-8?B?Tk8vbUY1Y0xpbUNjRFpaYm1hN0F5NllkTERuV2owbWV6eU4vd2NRTHhpOGJz?=
 =?utf-8?B?eStCSThjTXBrSE8vTzVCYjBjUFpNZ0t0RzZkck5URDZUTTFnMi9kQnh3VzVC?=
 =?utf-8?B?TUNVS2N1ZjdSSUJNa0JCQ3ZmcHA3SGdHYk4xT1NZOUdrM2NuYnBwSlBzOE10?=
 =?utf-8?B?NUJxRTdyaElQVjBTY2ZHQWMrTUt0SXQ1L1FjQTl1K3BDUHZkQW1LVlNnQjJq?=
 =?utf-8?B?ZlkremY5Q3J3eTZ6UERjbEhneWl4cldKSERJSVZLckZiRGZvQnpaTVVVYnQx?=
 =?utf-8?B?TFAvemZvVWNMUU1EK1orcklFMnJOYS9ZTnpWQUh3QzRYak92NmFKZXlmZHEv?=
 =?utf-8?B?bTVTSEMvVDZkR0lYUHlJRUpXZ0ZoOWFUU0srTDEyWXRYTzNxbnhvYU9KTGhv?=
 =?utf-8?B?ZzkrTEtwbWg0Z3JMRHRGMXc0UXlnNThKUURNQnVRNnVMZUZaSUtqK3BJdnZy?=
 =?utf-8?B?TDVqb2RmVkhBcnlGRGtlSjhSb2hhWjZ4ZGxybThqTjcrWTI3THdRUU9BOG9j?=
 =?utf-8?Q?rgedz8Q2gyO/j+GE1QAbDzN94?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8d63e4-880e-41a9-e4e1-08db4b135fb1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:44:38.6958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh5Pz7PceY9hdqkmySusWqEZKzAPsyrmihAO8vE/2Yp2JCCvlcCD/8HBOrbkpbJ1kToOpwKbFDfeEbdVGxP/Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8453

On 02.05.2023 15:36, Olaf Hering wrote:
> Tue, 2 May 2023 15:29:19 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> Getting this to work automatically is a continued subject of discussion.
> 
> I think the only real solution is an out-of-tree build. Essentially every single component needs to detect a toolchain change. This is unrealistic.

How would an out-of-tree build help (which for the hypervisor we now
have support for)? An incremental build there will hit exactly the same
issue afaict.

Jan

