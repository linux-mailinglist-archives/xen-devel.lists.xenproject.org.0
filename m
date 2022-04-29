Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23095145E3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317125.536307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNGx-0003FE-Mq; Fri, 29 Apr 2022 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317125.536307; Fri, 29 Apr 2022 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNGx-0003DE-Jh; Fri, 29 Apr 2022 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 317125;
 Fri, 29 Apr 2022 09:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkNGw-0003D4-7B
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:50:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6a7e690-c7a1-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 11:50:45 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-t5uktGsUPYqYNkYjb90KZQ-1; Fri, 29 Apr 2022 11:50:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0402MB2726.eurprd04.prod.outlook.com (2603:10a6:4:94::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 09:50:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 09:50:40 +0000
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
X-Inumbo-ID: d6a7e690-c7a1-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651225844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2uInj1+3QL4S8VeHriMl/dzGQBL/14Nyl7gywqKjc4=;
	b=N19uwOLJf52/G8DSSr1J2bw4+gujjD5WYV2sC6jTln5jstkFrQ8Bu1PeA8KSgDXtrnlhD0
	kAW9de+dv5WT4vuY9n+oj6/zi+nHp3uUURgwK7WV4Ye/BAQmYs4MMvW8psj+ZtvP9BHEo/
	64xRgiOOU00lVIHnGZ8h/qS9y57gzro=
X-MC-Unique: t5uktGsUPYqYNkYjb90KZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYJtM1Oene1LbHKoY4coXuK42anuu3a+dl29ZkfKTOB+c3IGWM51N1/1tAtAqzj41lWZTFQtx21VdSnCEKwCu0zEJStMErT/Ze0w6D7F6L+hKyV9L6j9lPGbqEPJjj+UZDhDRYMUBgVNrzP5Y7yuBrWeqKZ90kMncm2pmkfezFYC4tdSeJsisVLH45FAbr2IoVc4ibCF9PDLl+WcG5HDcxiZUEtTU1idNnzEEPphk98GUllq4fSPiNnC1roh6HFrjmCbum1J5mWGy/LolDc7a8C23rHh9tk6zOPKY1rGgEn2wffu/b6eQ7muNgQrdqK+areaQxpgZz5rujZ1fPvgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2uInj1+3QL4S8VeHriMl/dzGQBL/14Nyl7gywqKjc4=;
 b=Ii0X1dEbdDS5b2QCbQa5jQFJubg8BwceHt2aCnezwpcgAxHO5HEau1vyM0zu+dFPbXdGpW+/8PTjS5cP2SmxYNk48xCcJwNZ1jMhJ0LZIu7KEscC6+j6mWBZThpqoK3HI+hZYm2DF0Qp6tXJcMg6kCz+rsMqfY/7Db/0seduQoIRh0GXjFHxEpKpf8WEoGjl+dkXX4k4/Fat784yiFtuoviT4oKbV4Kg5X7w4WaWrGwfyGijDro7aUrVo/gHlXop2dBhpm6vBje/5qMNv/MAKUCWHUXqdxHEe1pyz8hZW+zVLJid+FznitYses37iNCaQN47bGmPmaWto5e9GFdXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8432d9b6-0aad-01b7-9ffb-e38ade602719@suse.com>
Date: Fri, 29 Apr 2022 11:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: x86/PV: (lack of) MTRR exposure
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <309bea05-2247-d451-3548-c824333a83f9@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <309bea05-2247-d451-3548-c824333a83f9@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0023.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::36) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 645a9364-3ef5-4f69-8f18-08da29c5b837
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2726:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB2726AF8E76429A0EA40C5A53B3FC9@DB6PR0402MB2726.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/IbiDbLfDYRAhbuyLWdu48FwozliX0jo8L0YEQkNjeLCE7h9xu5GFqst29rKZu2r1fJdCXBUT+Q/XgJ/3q08HEJbQ8oMYf7xcx0JhFvFT2SL/GtZIBik4UvIqHz16dWxkqkH6OFW67FC2Scbjd6H5VHDR6gIM8ldmZ4pFFpaA0o1Ny/AP6dnQcwPE+WTaxq+VjzDyW89wwrqEqc+9lloAWhR7N3XMZquq6vuQmsJRxVVZQEvNu361yTUq/aKsZqdVeHCiJY1Wvb398R1z7d4vDy1q0rD0eGLGr/6Hs1IpUW9RfL7A0Tw9qVcAIGnJWnRRV0X3zESUMcM3SrgGcYXLudYTGg+R0xm/33Bk7SYaQlgDG4oUUyibd/xGVJH20AzXUyKZqwXSs0e8BMHG6NE2qLbcLpgPX45UQfoPKte+OYi2SpESZLJzfS/exHt4ywgEaIjxQgRlfxNQmHzgY/nAcXKNoZgciBpf2Hy+smAo9QPHL7qSBZmLKKnFf59sDat6Y32b7rSc1gFZg18YD5ZqnQ4vqcNQkJP9SfWGRRop8U3jTVE2GYkG1rvwvYKsi+yu8Smn2pJAGmcPomWmFo4Se/TdYOypEpG2mOkgWL4D8V8cAqsEpC0NDXX6C2Oa/Flv4AxbRt0wRY1Gsj145vijmZHn9htwVvELH324z1SxMUZ7oBl/KAAyOSfTw5mjiSd+K2vIg+xzgrIjTmQd2DWtqFLT2Cg6pY8DdldUzy8wXG1eHrsScume3Tl8OoO2ilSZ3xQOhmK2qXwEglwOfM51XqhfXCGq9pxVXwSfgMChSIfq4Xxu/wa6RPIdknqyVpgHsGnjmpNW4UhydslqwnyLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(31696002)(966005)(6486002)(2906002)(36756003)(508600001)(38100700002)(83380400001)(66946007)(66476007)(66556008)(4326008)(8676002)(316002)(186003)(53546011)(6506007)(54906003)(6916009)(2616005)(6512007)(26005)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3hhaDUwUEZkTGg0OUpCQXRnZWhYR2N1ZXJLSC9WbW9jN0hhZ2U0eWJRd0pH?=
 =?utf-8?B?ekg0QzlGVFFhYkNCSWp3aTF1MHNlNW9HQkdOcU9QZkVuYm1OT0JiYXZTdkN4?=
 =?utf-8?B?YjI5cmNqMGZ0UmRzeGxxUVpESEJKS2YyckxXcWNDeXZSRElFdG8yTFNIb0dp?=
 =?utf-8?B?T0owWHd3TjVSZTF1U1A2MFkyV1R0SStmZm1yVWcrV256QXhjL0dhT1psVTNZ?=
 =?utf-8?B?aGNYMGhJT1laMmxMY1ZJbS9NRmZRSUVjUGZPQmJqMXBjblNPTytvMkJ6VEx4?=
 =?utf-8?B?UFVaU0RkSnFOQ2RTa0VMTUo1dGVXNHNHRVdSdTVCUnM4OWdwclVsNnZ6UHVC?=
 =?utf-8?B?cytpQXNYVHpJQ3d5QVRqTU9pWlJPSEVNUktqVWM4Q3ltQ2xIWnUyNStBVitF?=
 =?utf-8?B?aFc2RFdtbUJsOTFlTVFNTWVTUjJUMFpqVG9ZTkJaN0Q2d0Z4SFZ6YW54c1pa?=
 =?utf-8?B?N0laYjhGZWYrNW9rcExYTWJYT3N0TWtlcDBkMmNSTWY5TEVBOUxHdmVueGV0?=
 =?utf-8?B?Qk8vTEZhSy96ODd1K0ZVZ0VZWWEzb3I2c2U5RnVOdldWaGNZMVdzZ3pnVFYv?=
 =?utf-8?B?Zms5a3Z5WTRZWklqV0tCbGc2NWQwU29IaHZmamdZdmR3MjM1UE5xWnk2MnBZ?=
 =?utf-8?B?ZXVLYXl2YnpKVDdhdE5nNkk0MGRFTGJFWFAyejluRzVhK01PdnRhSFp2cENH?=
 =?utf-8?B?RG5GK3IyRXdZL0U2WUpPQ2MxblhuY3YzNmZKL2UyT3FBNE8rOFRSc0hQWGdz?=
 =?utf-8?B?bDdoNXM2M3R6MVRMR2JXUlVCeGpSYXhlZENtMHIvQ0NycHJzVktEaCtIOXQ0?=
 =?utf-8?B?ck5Fay9FZldTN0lRT2tOT3BkcTlkZHQwSDBsV2xDTFlyV3MxSHB1emNPZUZY?=
 =?utf-8?B?T1VIa2diT1lUMmR5a1BCQ3cvRWp6VTFaNTJNSWlvUlBtWk9rMHppOWc0aCsw?=
 =?utf-8?B?bU1LYWpZdlBoOUl3eDhQeXRrNHVvTDdxZ2dQOWpuVEgzdzFtdnIxWXlsbVNK?=
 =?utf-8?B?cXpleXFMYU13RVZRUHFQbUExMFl1ZStJampzdVBVc0pzTHVib2dEVUlWWTFz?=
 =?utf-8?B?Q29BWnpRYVJsQ0RKTUFNdHVmdXFtOUN5Rkwzd1N0NXZ1eFg0ZUlDOUx5VUpp?=
 =?utf-8?B?MDRmVnlHekl0SUUzUjRDQ3RZVVdtQXBjcEZ0dzBoR0RaWGVNUm5aeTdUbHYr?=
 =?utf-8?B?WmY4NFdDaXVyZnJWcUFnOTJyVXRHRzhFVFN3UU50WlNpbi9nRkhQSUZqbDla?=
 =?utf-8?B?M0RxaXh1akVCcXlaZ2JDcXZYejZHUlQvNnhMOTlKN01DdytseThTeFZFOWdT?=
 =?utf-8?B?cmd1a21Pb1pMTXo5b3FLNUVSL0ZCUElvZjNwMWtoK3VFRjFhVlZSSXZCajA2?=
 =?utf-8?B?RVV3SXNNZ1QxWkp2dVR2a3BMOHJIVmUzSTNyc0hxOTFubDdUYTEydE5vTHhM?=
 =?utf-8?B?Smg2SGpSQVJablRFL203cExqYVBoSktYVk9La0l1Z0pUcFR3VjhNT3BuTmc3?=
 =?utf-8?B?K05ra3NCTUQxNGlzdWhLNDNjZjcyRkkzOXpCNmFJT1pnODQxc3I3RXpoMlJC?=
 =?utf-8?B?YVp4dHNmMXZKWlM5eVpUNWlpcnZVQkhYZlpQUzBqWG4yK0VRdDdTRmtNSUhY?=
 =?utf-8?B?WjcwWFJOby9GRkZURERXZHhKQUNIUlZ4Q2Y1NTByQkFMZ1p2ZnlYcTAxNmM4?=
 =?utf-8?B?WS8wK01GNCtVN0M0b00wSy9FUHZvOWdoYjVja0NaSDQrVHJidU9QeGRZYWxy?=
 =?utf-8?B?V3EyMGJaUllIS1I3d2JJVzNBVmNOclZqSWJjaE5UMDFMeFdtQ2JlVUN0bVNS?=
 =?utf-8?B?TnRkRWJYY09aOVhzTWV0aEVmYTM4aEtKSGxkY2NwYTl3K2NJWXVBVjlaOVRO?=
 =?utf-8?B?N3FzdVptTllpa2NyUjZ1amlnanBWblJBYllTeHl6UWxzckF0QnhKZWRtY3Jr?=
 =?utf-8?B?MzNXdnJFL2hHZGNTL3ZoSVNSRVgxRnVHSDYwVS9qSWpGaDR3V21Sc0Npck5m?=
 =?utf-8?B?bXVoN2RsSm5pb3hIY0FZNmFpdmlaZkZGOFNTSkJBN1JuK2x1RVIyZEU5RGhW?=
 =?utf-8?B?cDB6ZVorMDJoZklRSE9qRXJ5dDczRm1haVJ2V2IxNGw1dE5zVmJxT29sR2ZU?=
 =?utf-8?B?dWh5MVlDdkhrRDJac2RvRzZFbktvWUhlb1dqbGhzTzRhNVVnVjlPbnkrWDBa?=
 =?utf-8?B?WTNrc3U0M2pJbHZSZzJEeW43Umd1ZXh6MkhNZDE4cnV0cnF3RUdUdnBCZ1BS?=
 =?utf-8?B?cytCQUExTENHdUpnZjEyUWhpL0cyd1FYVDB2YUVsVk1ISkM0Y3prcHMvQjVZ?=
 =?utf-8?B?VE1jV2lKb0lWaWpYOHdleUxSRWpmWHdpb2dCdTMwaDFCM1psNWF6dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645a9364-3ef5-4f69-8f18-08da29c5b837
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 09:50:40.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9O634hNXLOZ/lKDIXa3Kc/MadQ0G7tcp4J7CBi6nqJUaG2h6eyTPlNDJvSiyCXXsiozsmHNZGg/N3hrmKpyEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2726

On 28.04.2022 23:30, Boris Ostrovsky wrote:
> 
> On 4/28/22 11:53 AM, Jan Beulich wrote:
>> Hello,
>>
>> in the course of analyzing the i915 driver causing boot to fail in
>> Linux 5.18 I found that Linux, for all the years, has been running
>> in PV mode as if PAT was (mostly) disabled. This is a result of
>> them tying PAT initialization to MTRR initialization, while we
>> offer PAT but not MTRR in CPUID output. This was different before
>> our moving to CPU featuresets, and as such one could view this
>> behavior as a regression from that change.
>>
>> The first question here is whether not exposing MTRR as a feature
>> was really intended, in particular also for PV Dom0. The XenoLinux
>> kernel and its forward ports did make use of XENPF_*_memtype to
>> deal with MTRRs. That's functionality which (maybe for a good
>> reason) never made it into the pvops kernel. Note that PVH Dom0
>> does have access to the original settings, as the host values are
>> used as initial state there.
> 
> 
> Initially MTRR was supposed to be supported but it was shot down by x86 maintainers who strongly suggested to use PAT.
> 
> 
> https://lists.xen.org/archives/html/xen-devel/2010-09/msg01634.html

I recall Ingo's dislike, yes. But them suggesting to use PAT when
PAT depends on MTRR internally is, well, odd. Plus there continues
to be the question why PVH Dom0 should see (and be able to play
with) MTRRs, when PV Dom0 can't even learn their values.

Jan


