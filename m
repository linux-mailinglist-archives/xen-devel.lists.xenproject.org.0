Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D96D24F86
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 15:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205195.1519574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgOQg-0002WW-Je; Thu, 15 Jan 2026 14:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205195.1519574; Thu, 15 Jan 2026 14:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgOQg-0002Um-Gf; Thu, 15 Jan 2026 14:34:30 +0000
Received: by outflank-mailman (input) for mailman id 1205195;
 Thu, 15 Jan 2026 14:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgOQe-0002Ug-Ta
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 14:34:29 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483f6d3f-f21f-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 15:34:23 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5684.namprd03.prod.outlook.com (2603:10b6:303:95::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 14:34:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 14:34:16 +0000
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
X-Inumbo-ID: 483f6d3f-f21f-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmyOFijCw253KWOe91WaGAJye5leSYS3NoE3VAvJ/1tJVo54w1BB0rPtVrqoLWGwfJJPqtk5jbZUpCnvBNFX51Qh/JHRR9gk6hyFfKDl0QPgzJOJy2DGIQnK32wgEonvGWKR441kaefER/EzW4q+Y1iq95K6u/HzHGPMPEQPCWp8kNZwA1yujD9xCGlI+4E0MWU0tm2RNsdZSQDgdnrHhYZcW5xiJDYXTIVN+QES6a3ChuB9knQCmHFI+d76T2hdjN1u7QNewt1iQEaqi7TMtt5VL3MJREunEhcwVdWmZchYQp/ClJmmlPAHh8/lROvJMIH0bg1nDyd+RII+34Jh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPzH/zU1VTKlM+wBOU58Q2pAmfy/+9lepNcKezU2nlU=;
 b=Dh1sejNf3D8h8vfJDU+vgNPDAUNolgzbnCvAa9nr1B/EKxEz0AHEaaa1wCLg4r4/iBriWGYmwt8bFP3v0piuwqsFLgiRRfD56fYlfLp4uMyP77UkBA1aYlWa1JSG/OSGOT+/0ZprLng3W9J7r15p3PAbhJrM9XeTYn0+DzzYsiQ+CJStFSqeqNIvpxADtciV6gFQlX2TlNnWzoJFaoFPLI6CEIVduap8HkaNzA4rlCpCS/KTK8HAGb/j/cWVz5UKDEF6nKpVhrVTR/nMjQqD3EN/knEPaKhPBWk7h2jNZ4aOoQokuUL7xJlKe/LZbH8E4aDty8qd4R6lfsdpwHgryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPzH/zU1VTKlM+wBOU58Q2pAmfy/+9lepNcKezU2nlU=;
 b=JwBAql3KDj1fdnMEYPegxN5pOX7c4Gy1H1jXSoUDMRm3n5ztL8BqYGw2E0gu0qk9yEcdeC6e1HE5CuZFqeN6AMfVw/3seqIwoIH/RYSgk+Xf4BmlCB7/Yor2x6/C1DdzuUNB1hp7m6W2tBKyu++TYhjHCKsD/AfiiqHi/VhLzAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Jan 2026 15:34:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Victor Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>,
	Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>
Subject: Re: [XEN PATCH v1 1/1] x86/vlapic: match broadcasts for logical
 destination mode
Message-ID: <aWj65HfdFX7k3G0L@Mac.lan>
References: <20260114235548.626696-1-victorm.lira@amd.com>
 <20260114235548.626696-2-victorm.lira@amd.com>
 <95e0e0fb-2978-4c87-b723-fb7c30f36883@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95e0e0fb-2978-4c87-b723-fb7c30f36883@citrix.com>
X-ClientProxiedBy: ZR0P278CA0198.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a61347a-7ee2-4d81-ea26-08de5443291a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU9NamZjcXRtNzJwSHpFSjNoNGM4SENQWFV2ZDBNT3A0ZFJ1L0NiUlFyYkFC?=
 =?utf-8?B?V25WRm1PTW9LRkdwMzh1U2F3U1RPTFZQdVpqUVQyNlp6ekRmV2xPZXNJUE9v?=
 =?utf-8?B?N3B1ZE9RWVBSbzV3NGRhYjNzcFkxS0pYcE5BZjAzRkZ1bUlkMHZva3ZYRTI0?=
 =?utf-8?B?czBBclBRVXdDdHIxbHA1aDlkckdoVnp6TjVldE5kT280NDY4UFJrcFZwaXZI?=
 =?utf-8?B?NGJ3UlFxc0NzbTVNanFWVWw3cnVKT1VaTVEvaHF6YWNGSEZLcElNeEs0bmZw?=
 =?utf-8?B?aHY3MEFOVzdKN3NUaHR4WkNoRmtJQmtSSHMzSWdUcHNiamlDNmk1SkJaSzhR?=
 =?utf-8?B?TFowcWdiSGhwL1NQVWwzL2EzaXhTQk5GTW5oYS9Xc2Focmx1SUhxbXhMN21x?=
 =?utf-8?B?MU12THYwOTBScGNaVkdIY0JCNnkycnJUSGtNank4V004OWhZOUsxck9qdkVL?=
 =?utf-8?B?RTdmdW10enhJbGIvWTdqRWk3NnNVazdpaVg0N09MRTNCcXA3WFlaVHRjZVBP?=
 =?utf-8?B?S1gva28yanBqQWR2YmllZE43NUpEV3lCTzJRRWh0NCtKa3h4M2RvT3Ryd2Rw?=
 =?utf-8?B?dlc3V2RXSHQzT0xnampaU0RzdHZUYTdEc3ZwS1RIYWJBc2J4eXlDZzdPSFR3?=
 =?utf-8?B?RTlMQjdQaXdOU053M2s0Wit1N29RejVxaDZEUnRCQ25CRWg0UkxNbWRZek5Q?=
 =?utf-8?B?NWVuNkIvUTloMDUwTE15cmo1T0t4VU1GcVJ3RUV4RWYvUFZuR2lNVW56VDMr?=
 =?utf-8?B?ZE55di9FY0VuRTlNSWhDaW9lY3hoOHJjNWFsRlZqMWQ1enFUS0NwM201OG9Z?=
 =?utf-8?B?R1BIRlNuWksvNy82Y1h1NUFMdnBXYlRiT3dOSlNvUnhxMGVXREhOTm5mcFM0?=
 =?utf-8?B?VnhoM2J0OTFZSk01SEJEWWFQMERWb2swQUo4RHR6MHlQaWU4SWJEeFN5a3lH?=
 =?utf-8?B?SW42VjExLzlsbm9oMkk4T05PQXlOWS9BWjBielZPNVNWSFlrR05MYi9sMFNY?=
 =?utf-8?B?VTBpS25oV2wzYXNBS1hPUHlDaUozWUlrM3JYS3Z5SE50Q1ZhMEdNTHM3WEZV?=
 =?utf-8?B?OHJMQ1E1TkVtdzJLcmk0OVZIcjNpZGZwWFhqVlNNOFgvMndpTVFwR3kwVUky?=
 =?utf-8?B?cmZGMnh5M1Rvbk1FbHRDNmVXZmVoWkhQZmtqR3JEVm8rVlQ4RWdWVlpuclYr?=
 =?utf-8?B?V2M1dzQyT2FySXdUeFdobGRPYmswRlQ0VFZqSE8yaHAwOFlwNkUySWVGZzVw?=
 =?utf-8?B?NStWS3RINHp1djJleEZZTlVMZDJaeXJVL3NCcndPWDJqVlpBUDJ2UFNjOENu?=
 =?utf-8?B?MDRCbXZpcFRxNm1KQmluQ3BjN0k4SjlMQU85RWVtMFlxM1F0Ulkzd3N3Tzk1?=
 =?utf-8?B?MFRPWkI1WlN1SktIV2NCN04rY0txUkdMdHBYOTJkUHQrYkpDaE95NTU2bVp5?=
 =?utf-8?B?OWdFbUQrWDRlbDUvSmdSVFlwQXc4RVoyT0NsMmZ5RkNRQWU3RkswZlRjMTQz?=
 =?utf-8?B?czh0N3VWYTJYblZGUlVQMUFkVFNNS254TUhpYUQ4Nmg5Q1pOOFBqR0d0U1ZF?=
 =?utf-8?B?L2hKZVJIYUtraCtIVjBLdHJ3ZlN2eFBQNm1kc0VWenhzTld5Ulg5d0pmekow?=
 =?utf-8?B?aWNVdlVTV0hJeWpnZjRUMk5rRzZ4cXpHR1pPNS96WmVOM0pJZFdzczBJYUtq?=
 =?utf-8?B?cm52KzFqMGlUSXlyZUdHV3lLeVhCeVQ2V2ZvZER5L1lUM2E3VkxyNThuNVE3?=
 =?utf-8?B?TGNwYm1hWUp0QWd3Wno4RmIvQjJXb2RmUmJNYlR1d3VyMVpaN21CRzlqSlQz?=
 =?utf-8?B?ZU5uTDlWNzVmTUxTdEliRTBpSmxoR0N1eXM1WUJNZUw2WWg5RGFEaG1mYkhF?=
 =?utf-8?B?VXhLSmxtcEYwdTE1b0pzc0dJVi9BK2twWUpQQWMxSDBXOHNyNGxub1ZkcURq?=
 =?utf-8?B?aUs4dmJ3TFZpSGRObnVMamRURVFHbk1lYjYwTjNwVzFrZkp0R1I4R1JFL3dx?=
 =?utf-8?B?d2EybUd4WFV0YUFEMndxNExscVJEZXZQTVI3WFpxckFTSUp4ZGRKWEhzakkz?=
 =?utf-8?B?aWZwaklDMXhORUQzNVFMWVdvL2R5Zk9aN1ZOQmtOZ05NU0ZueFZJSEFZMitk?=
 =?utf-8?Q?tTp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T05hMHc2dmt4enVtcDltR3JReEdZQzRVeEU1TVVIQzhpcTRGdHZ0dGtUZ0Y2?=
 =?utf-8?B?VUIyQWRCQ0Y5VnQrNGZLZXpUQ0JKbm52V3QvVnYxWWlBV2RUb3JHTXVUY3JY?=
 =?utf-8?B?blRReS8rVG5JK0ttakdiVm1FZTRRUDNIaStUcy9WM2FZTEhxVGlVWXBKNjNq?=
 =?utf-8?B?WURXbEg2TzZFMUhsSWp0ZHlzbXo0MkcxUUd2NjZBSUNld0o4K1pDV0o2aE03?=
 =?utf-8?B?MlUzVFMzSFhFQ2NLUmZkaUhVcE9PcEQ0NWRZMHRFMjdpMXF6cGR0RTBmK21m?=
 =?utf-8?B?cEdEa3pZK1Q5V3dkNWtsd0g4Yjh6ckhKTkhqbHZtSVgvMk5wSzZieEwrK1lr?=
 =?utf-8?B?WEVBWU0ybFhCUFlTa296UDJIczFvMWd4V0hyNTlEYzd1ZklSejVGUUc4cWYz?=
 =?utf-8?B?b2tTb29zS1VoWElGWG1jZGlxRFg5YmVEcXU0QmJ2UU1SNWJPQkR5K3NGYTZq?=
 =?utf-8?B?aDJoSlp5T25UVEp3THcyeVJPc2pBRStic2UySDgwbElaSm1LOXVwRGV6SzY5?=
 =?utf-8?B?TWVQNnQ2dkl6Z1YxeFBBa0RERnd3QmQ2UnZDQXRNK3FybDYycFJld1NUODlK?=
 =?utf-8?B?dTVsd0lCRmpidHNzMnEwR2pvK0wyY2VrOThrUTd5WmJzNXlWRUF5Z3JNR1Bm?=
 =?utf-8?B?RGJNMXRNcVVvU1poUjlPbFRkeVljYmVFQzMvQ2xBT0E1V0daaHk0UFozU3Zu?=
 =?utf-8?B?Zm9YNzd2ZlpXL0Rsb2VFSzdyRnpSN0M0S2p6dWdZREdHeEtNRjY5U1k0QVYz?=
 =?utf-8?B?Kzd1VWc4dmgvMFhLWk1UY2cxWWo0TU1LS01qWitsLy9yU0w5cnBlam96SFZN?=
 =?utf-8?B?d3BWWkZvcXFHblViWWFXWkhHV1dDM0ZmMC9nTzV4UWdCWHgya042NGh5cnBh?=
 =?utf-8?B?a2N5b0VmaWlTdElURG4rZHFjU05lejJYaVFtVDdPV0FVUjR4TXlRR2Q1Mnh5?=
 =?utf-8?B?UGw4VkQ5M09sZHpBWTVCMERNUVpsWXVZRGpDN24vRFJaM2QrbzVWTzlsV2JQ?=
 =?utf-8?B?SHB2dVBpSUtYMjVjVXFrbVZNUGI0NFRhVTN1b1RQUEFBSFNCTjVMOUdpbnVF?=
 =?utf-8?B?QmtrTWdWSUZtemY1cUVHN2V5KzFPU1NBQmxCRGd6ZHZRZnZZK0JVdS9LSWpq?=
 =?utf-8?B?aDhoVk5BUXhOK3J1TlVGemFVTUxGNDVnelZLcWdVWjd4cFBVWkVOek4wMkgx?=
 =?utf-8?B?NDlYUUJpaTdKYU40M0VsZzBtS3ZKd0NTYUJnSDlTMmtPaUtHZmZ2ZnhYLzlX?=
 =?utf-8?B?RWdzdmJRVW5ZN3RoUXFpMXFuZWY0ZDlYb3NGT1NGMU9SS3RJbDdnWDlyd1FR?=
 =?utf-8?B?OEFpVlQyZlE0UjJWN3czL1NqY0theitGVUhtNXljcnNxUGtyM0x5LzN2dk9R?=
 =?utf-8?B?RHlEa3hjRjJVay9FYUtnMFlMRFZPZXBmVmlCS0U3N3pRV2M1UDJlV2o4eXlK?=
 =?utf-8?B?VEJpT1llZzhLQXBxQi9vU29LRENyT0F5QzM0SHZLNllWeHJOR28wd1dwUDFI?=
 =?utf-8?B?WnNtVEhPdkpqaDFvQXM2Zml6WUdyVUlUUzRISTUxSUxFQ1QzVUV1SnJDV1lJ?=
 =?utf-8?B?d3M0Y3h6NHd1bTVPZVBUd2NZclFEYjU3TlFCcG5uYlpKTm50NVNsQUcxbGNW?=
 =?utf-8?B?RGVsK2FISTlMNklIdVZGMmE5Z0VwMHR6WDdqRXFURlRRdXhQUEd5NVdUeWpZ?=
 =?utf-8?B?QXhUTzlGcmROaU50Tmp0bnVWb05aNDFuNVVqR1VTVlM4TFU5Q1FjNHRXYTEz?=
 =?utf-8?B?TGNhZkhXQTF3UUs4WmRUeExHMzFUMHV4d3RNZXVvNXBuRGF1STk2dzRwTCtm?=
 =?utf-8?B?aFJMb0RKenM0QUh6L3JCc0hNWTNneVRCQzg1UDVCUUhIdlRhdWtUVWs1N3RG?=
 =?utf-8?B?dFM1MmJQcUdyY3pSUVNsTXRjNUF6K2FVek90UkVVRFZWZysxTDNaSnNORkFD?=
 =?utf-8?B?Vnl1NzdocUdNTHJ3SUF1R3ZnaGs0ZzBNRWhmZ0h3aGxsVkkvL3hsVFhkc2tR?=
 =?utf-8?B?M1IxU3VubHNaMDBEYVFnaE5lYlN2MXF6ZDdHblo1eUpDcFk4RjdnY2IzWUEv?=
 =?utf-8?B?WEdEcytJU2M0U3c0YlZlei9MMkJ3ZmxkYnZQR2MveFhmS1VnaEtUZVVPWWhS?=
 =?utf-8?B?Q01NcmxZSjhXVzlaT2lyL0R5YnB0NmdEd1VLSE0yYnZ6cGFLNVdQNGg5d2xD?=
 =?utf-8?B?RHRUcWV4TGFCOFBHTG5SL2xXTnhwSEFkVHhOOHR2RVdYVk5PTEhSS2kzOHB1?=
 =?utf-8?B?N1BZYWhRWGVJRWNwZFhxbVRUZjVWSWpLdVNXS2VFWURwdVArN0pjZ1d6NzJK?=
 =?utf-8?B?TUszWVVoRStJZEM3UGFkejBqWkdZNzc5b2xWWU0xM2NEMnp1MWNnQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a61347a-7ee2-4d81-ea26-08de5443291a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:34:16.4669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkCs9lGqJS3krFWyza8+HA5Cu8I9A0pj5tVXbUvW81o20gz+Z0rETXllPUQuvLHf+Ad4hXpOV8sBBLyjr8/Nuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5684

On Thu, Jan 15, 2026 at 02:01:12AM +0000, Andrew Cooper wrote:
> On 14/01/2026 11:55 pm, Victor Lira wrote:
> > amd64 vol 3
> > 16.6.1: "In both the flat model and the cluster model, if the
> > destination field = FFh, the interrupt is accepted by all local APICs."
> > 16.14: "A DEST value of FFFF_FFFFh in the ICR is used to broadcast
> > IPIs to all local APICs."
> >
> > intel 64 vol 3
> > 12.6.2.2: "Broadcast to all local APICs is achieved by setting all
> > destination bits to one."
> > 12.12.9: "A destination ID value of FFFF_FFFFH is used
> > for broadcast of interrupts in both logical destination and physical
> > destination modes."
> 
> The formatting here really needs some work.
> 
> >
> > The specs say 0xFFFFFFFF/0xFF should be a broadcast to all APICs in
> > logical destination mode but it is matched only for cluster 0xFFFF/0xFF
> > (or as flat mode in xAPIC).
> >
> > Add a check in vlapic_match_dest similar to what is done for physical
> > destination mode.
> >

This possibly needs a "Fixes:" tag, I think:

Fixes: 7429bfd50dd7 ("This patch provide local APIC support for vmx guest.")

It's been broken since it was introduced.

> > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> > ---
> >  xen/arch/x86/hvm/vlapic.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 79697487ba..1208cd21f0 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -248,7 +248,8 @@ bool vlapic_match_dest(
> >      {
> >      case APIC_DEST_NOSHORT:
> >          if ( dest_mode )
> > -            return vlapic_match_logical_addr(target, dest);
> > +            return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
> > +                   vlapic_match_logical_addr(target, dest);
> >          return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
> >                 (dest == VLAPIC_ID(target));
> 
> The SDM/APM quotes are clear, but I think this logic has more bugs than
> just this.
> 
> First, you've got a common expression that the compiler cannot optimise
> because of the function calls hidden in VLAPIC_ID().  The appropriate
> rearrangement would be:
> 
>     case APIC_DEST_NOSHORT:
>         return (dest == _VLAPIC_ID(target, 0xffffffffU) ||
>                 dest_mode ? vlapic_match_logical_addr(target, dest)
>                           : dest == VLAPIC_ID(target));
> 
> 
> However, the first clause looking for the broadcast ID is surely wrong.
> 
> Surely it needs checking against the source LAPIC, not the target. 

That would be:

Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")

> Whether 0xff or 0xffffffff is the broadcast address depends on the xAPIC
> vs x2APIC mode of the sending LAPIC only, and it's surely buggy to fail
> to match targets just because they're in the opposite mode.  So, I think
> the correct code is:
> 
>     case APIC_DEST_NOSHORT:
>         return (dest == _VLAPIC_ID(source, 0xffffffffU) ||
>                 dest_mode ? vlapic_match_logical_addr(target, dest)
>                           : dest == VLAPIC_ID(target));
> 
> 
> Thoughts?

LGTM.

Thanks, Roger.

