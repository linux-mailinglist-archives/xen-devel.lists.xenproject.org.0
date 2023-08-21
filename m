Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE4B78307E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 20:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587807.919214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYA2K-0005CM-HC; Mon, 21 Aug 2023 18:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587807.919214; Mon, 21 Aug 2023 18:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYA2K-0005AT-DO; Mon, 21 Aug 2023 18:54:00 +0000
Received: by outflank-mailman (input) for mailman id 587807;
 Mon, 21 Aug 2023 18:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tacK=EG=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qYA2I-0005AN-Ko
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 18:53:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eab::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c08d35-4054-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 20:53:56 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DS7PR12MB8204.namprd12.prod.outlook.com (2603:10b6:8:e1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.20; Mon, 21 Aug 2023 18:53:51 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:53:51 +0000
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
X-Inumbo-ID: 13c08d35-4054-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJa/Z53umpXkjwm075EVLYCW3lTkSmX2DBwSLkXqeGZgjRxcMUwIJ6lag/GmrdAe4nrw239rdAsK451QnAPks3rer8l2jFzi84dFi9dvDbkWcWAF9Ry45Gep3kmx6RKnqrFDyD9mPVo0p2kyUq0yLPXv93FavoHcL+eU+zoqfnaD9WIGna10df8MY9pIY6oWtti3t3wKT79Z9IUgN7HNvIIj5et/pVtOKRmNEz+rJgo+YvbR4Jy91yJD/5XEeOBzqpmqGTf4R8NaXltI3PbWdD+9u0K8PD/AIGaw+qCSUIqHrOQ367LuKD1RS1re5hw6D/kIr0PVdpfD5PwxJCfZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XORqzjkRDQRs+gzvQNmWi1nxp8pmHwakTvJuQ53vno=;
 b=DUDZfsteWkToBsCNdacX814UqPd5YLMkCtXWd7Q1yRq65PTqqWzenogqYNsbA+Qzg+qjbvP6k0+xTdhcYbLxt6P7Z65Y+PaKUvrD9f/QmhQeDSS9m/tcr/qU/4t3PT5rofnCNar7IenFS7cpBKUUYGMX4IfqXMVbTtpZ/OdWvIErgnHAz4+IcaR0oLVLrZ5mnaW3uRiIUXiQuKjgDOeFwZVe5t+MEUoFJ2uCwTYCcx3e7ZAuzwyi+JwAKryJrsWG4bXHFdS7DBtZnAJm4UzvIboOfaTk8NHIrppA+G4K4Klri+HePfwe52svjGAM8ZVBDcyuW564PMuyswGJDAObsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XORqzjkRDQRs+gzvQNmWi1nxp8pmHwakTvJuQ53vno=;
 b=PUMCYvalFjLPFYxQ7sbFzenmg+6lq7N/l5ybNifrTfKP3zczBGA+aG+PcMsVg0Zqf8oZ5pUcTmjzxurAXhBkvAWWrICCAN4fdW/HZdzSuUQ78y8CFU/uI0cGZuJgM2SnBMAAi1b5wNErew5k2fWIzV2WVti2lFyCL4U6H8iQKB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 21 Aug 2023 11:53:48 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][PATCH v9 17/19] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <ZOOyvGd51o09agRc@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-18-vikram.garhwal@amd.com>
 <b94a7e3f-8583-4ffc-85ea-cf59e85e1786@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b94a7e3f-8583-4ffc-85ea-cf59e85e1786@perard>
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DS7PR12MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 782e60fa-81cb-483d-40bb-08dba277f5dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gnhbvLLRop98NpWZ+lelHqNsZ6G46FHXrLNDhIIz8x6FExPpuWe/LBPHkrevuhLLTZqCFDMicgJPXlsgFTX1TZb74h6Bx//N0yKkzU9ro7uRaSydqz6IvNuApWunq/AZZZZQH8q6A4cfoCzyL0bo0FMCikq60jqrxJB3xFS6a7tLUDC33KzyTA5KnbYfr4Hu1Md1jCRYbJu8qLKrT/cw2g5otDK9i1MFEPobV4f7auPv0n+CdLf+vshF2d659ZDvc6J8BKX97uHY2ZT/C8N3w3Lt/VLnH7VIPq+9VgkD4VSdKZjlSiyr2UMkSJm6WTekcfyG5CvpKN8JMDDllvoI237NOX+W5duHPbvbhgNrWlGVEkqRLuls4VsA9K5s7e8EfswEBoC7bYIEFgR1C7s0/T/T3txn3aZ1KH0I3wsPNN8/ktALT59qjtg5QmDvFzG7jGLGqhc4nVfzcjJ9DcEFvSm/1FNYdBKzaPIn5WFZN3LsswbuINBi2h+Z36l9KInAV0BclLst8FnkAkC6NLBo4FKmBfZrxQBCnhmrd91VuDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(966005)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXhmTDN1VHB6bkd6SGJ1Nk5KR0g3N0xmTk9JamhjNnB4OHRnNWI1elVYdk1R?=
 =?utf-8?B?cWI1cW9yNjNpOXhmTTRSeW90czVXSlErUUdUdEo5RytqaDZ4L2dOTnhXTHhs?=
 =?utf-8?B?RHQrQTBMWi9jVW5ENHllRGNDd3Y2NUJiaDltUTdPcDU5MzdDeHR4c1ppSFlx?=
 =?utf-8?B?Y3ZXdThibGJsdDdVbWUzcExWUDBSTXJ0akVYTlpOdGI1cFZHbC85UFpNQmxz?=
 =?utf-8?B?V3d0d1o4WnpkVGVUcmNjeDZRanVROWl1TzYyaWF3Sm5qVCt3K3FKV2RxSFF5?=
 =?utf-8?B?cTFXWGtSdjRhaHZvbVlnem81M05SVnd3Zzd3bkc1eWR6MGRHVFdNTWFudVIv?=
 =?utf-8?B?V3FyaG5KT1lPMU5hT05udEMvOXZqZFROTC9nMGoxc0xNNFNzbTBWQlV5NGpp?=
 =?utf-8?B?eGNHR3VsVnE5SUFhUkd0SSszdmxTbWt6ZXc0dmM5bXU2SWdPVDBDT1dwaE5B?=
 =?utf-8?B?d2xRY1dQWktSaDdtZSszakpYS2NxZUk0dnp6NWwrN09kTkdWUG5mRnlDVFNx?=
 =?utf-8?B?VUJqUXozS3I2cEs0V1NaY2VUQW9tZkdoYXBDYnRlbzdQSThQVjZTRXBrVkZ2?=
 =?utf-8?B?WWd4a2R6Y25aaTkwQml0ekMyTUZJd0N1WWtDUm13cUF3MGRGUGkvM3Yxd05W?=
 =?utf-8?B?Z0lYdWYzdkFwbERyQitFZ2F0cjZ5aDN2NFNoV3BJeFJtR25JVHU3MXljYlFV?=
 =?utf-8?B?WHBMa1hzaXpsRVhlVkVJZHdrT3owZVpHQ0JWcVZsUG9MRmZDWjUxWXJSV2Jy?=
 =?utf-8?B?K2FmK0E2SStHQVpmeG9nMC92ek9LcHhXMjhZd3pmYXVDOHh3L3VHVllkelFy?=
 =?utf-8?B?a0hWUVNiUUlBaTFicS96bnhZakFQSHFidyttYnFrZ2N3a3lkMk5pUWFXTTFz?=
 =?utf-8?B?cTc3NXIzMGRKTmZKZGJVS2JnalliVTZERmpVbkxPMCtQTGk2MjRveXFTL1hE?=
 =?utf-8?B?NkNjN3FWUHlLWmVtWHYybFZVbkY0WC9HZzNxeDlyUWxoQmx0ZHBiSkpveWkv?=
 =?utf-8?B?T0VhRTRYMWVybGF6QkY3VTNrdGFac3dHYVFXNmpYaDdhOGR0S2ExblFCQnhX?=
 =?utf-8?B?dVF6alFNV0NyS3I0c0p6K3Rud1FCVHRMQUJVY0x5azFBdEZXd1RrVXZROEJZ?=
 =?utf-8?B?NlpYNW52ak5ldzFBTEFOcmpXSlU1YUtCRkJrZjgxWk9tS1AweFQ1YWlVN0lE?=
 =?utf-8?B?aENsZDZpM09yQ0xSdWxRR2xyQTI5TW82TlMxVlljK3JXWVVsQUFCdzNiVVo2?=
 =?utf-8?B?VFNHcHFISFQ4NG1uT0N0SFgybm1pY0ZWV25heEdxbVhieERDUkxJcXJiZ05x?=
 =?utf-8?B?UW9KYlh2TlRsMFd1QjJralN6eGdjMjRYZUduQTlhNnNsbGJHQW9UUGF2NytN?=
 =?utf-8?B?ZExTSzZDQWlWVFlUdkVUT2tqYjV3b2k1NnlLV0FaQ0cycHRNaDI4dE9UQTll?=
 =?utf-8?B?VGJ3bElzd3U4SXhJQUdJSVlHRXNMV1A2QkdGOC9KUmhwTXd6Rk1UbndxeHpI?=
 =?utf-8?B?YTRLc29VODNMMTNHWDljNkVGWTJQOWFhMnJPenV2L1FPbzEwLysydFZSNGVE?=
 =?utf-8?B?azNoTWt4TGFwNHdmMkFOMVJqNlQ4N1ZmbzRjZDIyRW5ENmY1TXU0cWQyaHQ2?=
 =?utf-8?B?d0JDTzB2dlZJNStxQjJaM3Q5bnVCTXIyL3BkcS9TaG5hZCtCQnB1dnFSemNE?=
 =?utf-8?B?WXpYeCttQ3QzZkZJaHBPdmFxWm9mK2QwSTNacEwrL3dQNGE5R1BiVzBlQ1kv?=
 =?utf-8?B?bGFvWVZyQks3VjFMNmNFWFdiN0FETllWTE1pTFlrNFBxQUtqcDdKVEFWQmRU?=
 =?utf-8?B?MnYxdGlESUZ5emMreFZhcXVtanRqVThWVzJXaGFaSWVFcW9maFhqZWNtdGk2?=
 =?utf-8?B?ck10TnNoYkNuQWpISVNYQmFvR0FmVC9DaUpYWUoxSDhxZDBpSGN6ODFGWG5H?=
 =?utf-8?B?K3dkaytXbUo2NjJoL0haYjJFcnVsUHVWMmg3NGx6LzRuaWszZDh1OGVPZG4x?=
 =?utf-8?B?aHNGVUwveGoxUS9JWDJDN0tsSzV6RnBoOG9nZmdsK1JVc0pHeWRGd0RZSDB2?=
 =?utf-8?B?UUZ2eldPY0JON0VNQzgzaFlGazk5S1ZDL2IxT1cvYXAyUzRmaDJKTi9DOW44?=
 =?utf-8?Q?CuJNPmnlt8ZJCJODhVvhhK/eg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782e60fa-81cb-483d-40bb-08dba277f5dc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:53:51.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkutMMsU+SBs4Az47Y250fWpDUoNnGHFyyOiNO0r8AuCn2alW0gt7JWEHDfRjexcJ6k9VqZEsJMkuwp5ffJ1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8204

Hi Anthony,
On Mon, Aug 21, 2023 at 05:18:27PM +0100, Anthony PERARD wrote:
> On Fri, Aug 18, 2023 at 05:28:48PM -0700, Vikram Garhwal wrote:
> > xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
> > operation type i.e. add or remove to xen.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> Hi Vikram,
> 
> I've given some comments on the v7 of this patch at [1], there's been no reply
> and the patch hasn't changed.
> 
> [1] https://lore.kernel.org/xen-devel/9975f41c-c149-445a-8122-c15cfe5511b0@perard/
> 
> Did this fell through the cracks?
> 
Yes, you are right. It skipped through my update list. Sorry, for missing this.
Will change it in next version.

Thank you!
Vikram
> Cheers,
> 
> -- 
> Anthony PERARD

