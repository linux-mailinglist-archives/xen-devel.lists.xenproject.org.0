Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838FD4A99B9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265528.458921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyLe-0004jL-4x; Fri, 04 Feb 2022 13:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265528.458921; Fri, 04 Feb 2022 13:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyLe-0004g5-1J; Fri, 04 Feb 2022 13:09:58 +0000
Received: by outflank-mailman (input) for mailman id 265528;
 Fri, 04 Feb 2022 13:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFyLc-0004fz-GZ
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:09:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf01a4db-85bb-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 14:09:55 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-t_tc7tIqPcOvapuNuRFIAg-1; Fri, 04 Feb 2022 14:09:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5862.eurprd04.prod.outlook.com (2603:10a6:20b:a0::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 13:09:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 13:09:46 +0000
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
X-Inumbo-ID: bf01a4db-85bb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643980195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNAzDebrtrUti65iUmF01QOluoTqxRHy34ABZA/n8L8=;
	b=Ne/KJxHj36++63jI7C27eY3m0wLXDoRT6mYqPGnGprSQkeKtqCxOB/9dDqSOogVIzkTIU5
	XbV1quBw7XUo402hdMI+EczJpWO6PG/vAyeCkTqYIuEUfF7mEKtHZPKKZigwx8wIQ75hxC
	nSu0qLQCahoKDwS8uPvkO4fnazOjp2s=
X-MC-Unique: t_tc7tIqPcOvapuNuRFIAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O117QMWMloPIRVcFD8x+r8OCu75G8Xp3eSuVP6P2K72NLShhbMldIkTJ5H4sp7kxbB5AS+u+F5JQKZsxPCfSN82dPclHyVXVipRsjYZ/gtY41M2MxKtR7g82sa5nBYGiGZlL17Utn+R/h5KBlzXrW/mNUXgTwrxtnqAMc8t5F9NUPNlPlnWT+ehVOBJFJlHz0Wu5+UGjlltAAExeGp4fSlfB/uB7ps4FrJIKpYz0g9PzvvqrxVQAz1S5C+liSQCsgtcHMThpGDyDUDV/X4c+/8aTdgEqmgrUOLlCG7W/2Z0jXuvd0TEXNqkCKKWXuhHexg84APLA9CZbz54q8gAMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNAzDebrtrUti65iUmF01QOluoTqxRHy34ABZA/n8L8=;
 b=F3cWA/10Nduk6fVsYv6jWZ8uOr/7raveWSSFz3P3PlW9BUbTAc+ZhjuHGuaL2bQKZpjBnOLDtEl3mNGjA1BhjbPkugw5vLVoezVXhxik5LMmZC6n/NjJxrwoBTKcx+u8ZZagP+6FUT/XfFTAzYfbJE3XxIrkTn8jEYFtPYk2f8jRLFOlcNaRW82Tez0cs8z2XjHOqWCnHVjbEPQrQLJha7uz1gA0Hxn7A78g115tCFPktZmncOq5AILVDlKOVKkExU1xiuY6PmdZkOS12aD0zZ7C6pN+Uz5A4stGtTKfrfORj97pIilKlJkaYSvxfnD7mtkzkXtifIWA0O6J7vyj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1333696d-d3c2-15a8-1dd5-7cb0a17ef023@suse.com>
Date: Fri, 4 Feb 2022 14:09:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
 <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
 <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0379.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddf1ef78-9600-43ca-cbb0-08d9e7df9e3d
X-MS-TrafficTypeDiagnostic: AM6PR04MB5862:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5862452114D11C80FD96BE63B3299@AM6PR04MB5862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xn4874H4T9NEPLteO3MMnU8jclAJ4SIV8kfYymeqiy29dARaTyVnFGv69B8q2v6l8doepzGHXXBvNBJnF6ZLzjEQ4VWkyDbdxap5q5HgF90WqsCXvv4j1QbiEhLwslTyckmbRsUgBLiZInDG3TXWj/q4Ctq4RpHSFVToiqeOofj1m6hgpqCFh32URrp51tnjgqvZjoltMKRG69jAIN88h/1X6ouMtFhFSxgr+vXMPbglwrFe8wVWbMbpWs98vSBDyEmif/b4XhUDKBTWpFIhWY/TEGS7TKuS9oCqpPLgckgT2XMD2ltaHgsvg5yfvPVNFkeQtnKgms621fDvWJdU1K4NmQOM+/zjwWcC6qnVCBOhPLkt6eMZXHpumT3ioVqM/whtDIVEFPthO75bDNVQ39WvlJXICNvfaLKZcRYZRFqeGOAILbFo8pr29T+xJfRm+VlbC3YTxX5sfy/qyLsLZRPxas3fG3xo/EYA7aydlyx84B+SzNLLzpNvJBrYTAUNCuydwlgx8dJlOjuiWjEXa2xLAs1QN3kS+cczLagyA1vICeBIzzxvgBGAFUJGFlC2NuvgW0tkm1IXIt6XxMJgp+8MTeL9naF/GKpNKdBcio0RLxPuBCJm2nYVo+EPoTd9lRiAwjC8vmNuh5Emh+c/v/AwC7ll/PRdcj3pd8yDilbIqNI82pE2rfUk7LeDt9wS6oKoY/iwnHgIaPAWbnvlosMuSoVwP7WHmhKX/PotSws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66556008)(8936002)(8676002)(83380400001)(2906002)(66476007)(5660300002)(66946007)(186003)(26005)(2616005)(31686004)(36756003)(53546011)(6506007)(6512007)(508600001)(86362001)(31696002)(316002)(6916009)(6486002)(38100700002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVdwZFUzMjBnclZvQkdaOWR4RmM0aWxPZ3IxRjdhNHQ1L1hOWTZpZXAwU0hX?=
 =?utf-8?B?cXp2dHQxK1ltMW1DQ0NhdGcwcFpnZE5Jc041QWxpNjRKZFQ5RlcxTEo3bWNY?=
 =?utf-8?B?dEdhQzcwbUg1ZWlIbVUwYTBicElNVllxOWN6THBPWWtPM2VtMTVuelhMQi9B?=
 =?utf-8?B?YnRaWkM4Rk04eU9wUnloWVk5cDJqRGl0M0ljVFVzVUF1ckZlTEdsQmlOak5w?=
 =?utf-8?B?RExDK1NndkNHZThvN2xuemVNSkIrbXZxTkRpSnJ6aXppeXJLOU1DTlkrdnd0?=
 =?utf-8?B?OVhRbnJHMFY1TDBJRzFDcFJkTU5PWTZkOTR1c25Rcm1YS0lZZzlHdGtXcGhw?=
 =?utf-8?B?LzdlOEtGOWVEZGlBUGRlSWhMYTNORU1TbWozOEc4bkZHeE42T2gxbVBGNVJO?=
 =?utf-8?B?OVd0Nzg2WnRxZnZ4Mmp3L1hPZGUxc3ZkanluZGNIMUpxUW1LakZzREt6ajRz?=
 =?utf-8?B?allYSzdFWHZFU3BZMjgrUjFsZEM1N3lZdTlnZWN3bkhhbE5HNkc5UHEyN2JY?=
 =?utf-8?B?Z1hVcUN2Sy9ocDNXVnh4VG91ZG5VREs4QVZTenVNYjExZXNqbmY2Q1dkbng0?=
 =?utf-8?B?T3FTaEZUVnRzVGN1cjlnT3AwaEk0V21ZUmhvYWx6cldReENraTZaNmdGcnhH?=
 =?utf-8?B?SkZTNldrUW5veTluaWxPU2pWRGhqT09xbkR0NTdsOWE4TjA5eEZjLzg2SVk3?=
 =?utf-8?B?b283dlNFSHhkZUVGd0UyR0hmU3Qwa3dXRm5JZm5ielNaMEhDakVHRkdEZzJG?=
 =?utf-8?B?YjBzd1J6NHJHZ29RWDNwVUFkTHJVZk10VXN0SUlFM2d1aDJQVmxITUYweS93?=
 =?utf-8?B?MUU0NnpMREhRTUtxYklHaXhCTk51cGJXUCtRUHljamFoTG9BS0lZMHN6LzJV?=
 =?utf-8?B?WXN2RWdWUWtoa0srdy9WR1FhZXZVWXB6Y3FWQzZuemlUNytMTlJrLzNSRFhl?=
 =?utf-8?B?RFZVdS9CK05hYU5GVTNscW1IMlhHWUU3TStpSyt2S3NYWHF6b2FJT294Q2Vh?=
 =?utf-8?B?akpRK0xLZ0RraDBKcjROTUtSN0IxQlI1YXVySUk0SlVpYWZDQXJaM0p1dmM1?=
 =?utf-8?B?UHpneUV4ODh3VnY0WlJrbUxQTHZzU0M0bFZHdVpDZzNyVmg3S3ZOd3VJalpl?=
 =?utf-8?B?ZVB0bUJKUDUvbEFTbDVUMXpZbjV5UDFkejhKdkl5SUJvSDZkbFRUb1EwWHo4?=
 =?utf-8?B?VWtLcFd3Qy9ic0Z4N2c0M1FXMlcrWDc3OUpwbGw1RUxtMzl4SjltaEJUeklm?=
 =?utf-8?B?Uk02ZmU4dUNqbVZ6ZU0rbEVkMnB0aS9jSldZR2lQSXh2NzFtNXlFbWsyY0hu?=
 =?utf-8?B?aXpNQVlHODRSOVMwSy9HOHU5NUd6ZHJod1kwTm1mMGJpQU43Rk1RMlRJZGVW?=
 =?utf-8?B?UGFrZm1FUXAyajRzS3BxcWhKVUVIVDlJSDdnb0xTbUs1TlRLeEJqV3NubWlp?=
 =?utf-8?B?dE83OC9BUmxFM0hTeFFIKzZQenFrZHMrcTFsOURPTnl5cUdKbjJzS2NCV0hT?=
 =?utf-8?B?Q3cwcVVmMnRHdHF2R3laOCt3NjZtdm9vclVEZHZzRjRlL1YwcXNtQ1poY0Ix?=
 =?utf-8?B?cHN2L1cxQkZ6amwxSE80OGxOc2JTYmJqN0FwVm9pWXU0UlNMNFBkZDVScUIr?=
 =?utf-8?B?SU41N2F0d0VDNGFzb3pvb2FCb2gwcXlUUkVaVGNFWUNVWC9tbVVXdkNyRVN4?=
 =?utf-8?B?M2s2QllhVGRoamZsNy9SWjQxdUlxeXR0d29zWGdMUGgrbzRlMXBXdTc3RUJt?=
 =?utf-8?B?SjF0TVl4SERScitjOGxyOW53MHQxc1V3QVBmem1SOFRlMmN1NnNSeGFEQzVk?=
 =?utf-8?B?MjZ0a1Q0cWxRUnI5RCt3cW9LVWMwYzFmN2RnY0FIbE5lZmVSMHlHMGVpZDVI?=
 =?utf-8?B?cWlyR3lrY1dTUm9ZeWZCbGF4ZHI1YjdEdWJHNnFEcFRuSERMZURMYzVvcGF4?=
 =?utf-8?B?Z2hlL29MY2FaeTFCM0Z2dU4rYitBUjZaSVA5dHlkaUkwMXZyT2FaNnNvUlll?=
 =?utf-8?B?MWY4MVFtNG5hdVJlR3NENXhBMVE0Uml2TEtTVHg5VytoUk5YcnQ1WXlHLzRQ?=
 =?utf-8?B?WGJoSjQ0RHdOeFBYQjdLS3RzUUR2SWZML2dGZ0h6VVBGaFVqYVZFU2ZJM3RH?=
 =?utf-8?B?b1U4YXR0bllraDhucXB1Qkw1eWZnamtpTCtnME42NzdVOHdJS0Foam5Dd00r?=
 =?utf-8?Q?pdLf6QJ6VsUCvVDXp85DK+U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf1ef78-9600-43ca-cbb0-08d9e7df9e3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:09:46.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzNTlFtTY19FuscGhlIOvehREzEDV/rnP7UZ1W6h9eKAUkWh7YEdOOIsWNGuV3oOvX3RS2FCI7U/+eQ/wbdC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5862

On 04.02.2022 13:12, Andrew Cooper wrote:
> On 04/02/2022 08:31, Jan Beulich wrote:
>> On 03.02.2022 19:10, Andrew Cooper wrote:
>>> It was Xen 4.14 where CPUID data was added to the migration stream, and 4.13
>>> that we need to worry about with regards to compatibility.  Xen 4.12 isn't
>>> relevant.
>>>
>>> Expand and correct the commentary.
>>>
>>> Fixes: 111c8c33a8a1 ("x86/cpuid: do not expand max leaves on restore")
>> But doesn't this commit amend 685e922d6f30 ("tools/libxc: Rework
>> xc_cpuid_apply_policy() to use {get,set}_cpu_policy()"), which is
>> where DEF_MAX_* disappeared?
> 
> No. All that happened in that change was that we switched to using
> 
> cpuid.h:89:#define CPUID_GUEST_NR_EXTD_AMD
> 
> instead, which remained the same size until Xen 4.15 when e9b4fe26364
> bumped it.

Oh, right. I did try to look for a replacement, but managed to miss
this. But then, as much as 4.12 isn't relevant, isn't it the case
that the fact that CPUID data was added to the stream in 4.14 isn't
relevant here either, and it's instead the bumping in 4.15 which is?
IOW while I've been fine with the comment adjustment anyway, there
would still want to be an adjustment to the description.

>> While looking at this, wasn't Roger's change incomplete, in that
>> for Intel the extended leaf upper bound was 0x80000008 in 4.12?
> 
> CPUID_GUEST_NR_EXTD_INTEL is still 8, so this is all fine.

Again, somehow I did manage to miss the replacement defines.

Jan


