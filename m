Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF37548087
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 09:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347780.574104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0eWZ-0005Ja-Jt; Mon, 13 Jun 2022 07:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347780.574104; Mon, 13 Jun 2022 07:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0eWZ-0005GA-G3; Mon, 13 Jun 2022 07:30:11 +0000
Received: by outflank-mailman (input) for mailman id 347780;
 Mon, 13 Jun 2022 07:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0eWY-0005G4-6Y
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 07:30:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe09::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6517cae-eaea-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 09:30:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2666.eurprd04.prod.outlook.com (2603:10a6:3:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 07:30:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 07:30:05 +0000
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
X-Inumbo-ID: a6517cae-eaea-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwvoXFttRnM0fF8kvXZe/Dk8BDzRsn9F7xYzoA0ugbgbek99FowxnpzM3a/2WR/sQmJCUtPH54Y8ap/K2LqX3vlb7IwXtg8lbJN8M7uiogrgCrRq1MHao+T+wg7VthZ5b/Su0s0Z1uQ+qVzT9BOO/5MNnyl20Ic+z09DBykmBIU/TE308ml2WZbAiQyBK4lltnJLgPbEQoXuBRn9m7RQqABQC5KVQa377efw95hizHztMZbQeUXmmIe2qfC1p8PFBOja/1mtRgEuQIu9TsyIXiDx2G1pTP57IIp/PO9ACIbtKzzeebJKsFNdzSbhpVW1PNq6H5v3b/MKHBw2wRYy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3ljZ3sBPZL/Y7cD5kvO4bPzF67C4pFjWnMt881L/ig=;
 b=NsUPk+wspOOU8kIPuaY9CZSyAiNKaJXOcmAZteik3VVT8fOy70CEIpmjm2WlMZ7SvjQC4QlWJLCYD1S96Esg1Es2qWAfTpesWcigYJC9hDQ+/5ZLYZ0U0FqLBAW/2JIC6d1wg8Ii80KpdbDwlMPfXyquh/e2h4HuMhjG+XTnlTV2TJrUjw1Bt38sv4omM4jEnrrXQjVCVH910IyRJa+LaRWACEE1N6hLRpMFuU5OAWX7///fAtPpugTbCmj4nZyTy/5tlhR+dJGI68n3NaEIQet1zrHe70s9fMmFhgSusOOApJmTspkemz73+L5kItmDGl5dOODtAkFlTBnTr4scKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3ljZ3sBPZL/Y7cD5kvO4bPzF67C4pFjWnMt881L/ig=;
 b=MHW5PZXpbToA8Dge+lpReL1KfkiUzJlsQUGyo1D8XA5h/LfMffrhl2Ir0PaqhJ7E73OsOcOjpr97BSGOICekc+qKoBiV7tM8830kMOTmxxBCYUVbcsT+FfBwt7N8XaD25D2K/9QDGbh5o3JoSlRkd0bdPor8BkXxkSFdjAD3xQhLPnC8PAm5mFHNkqqqwqOV2JujbOlPkG4kGejVMVt1xlXL9zVO79EAAfSEm/iagCl03k8s09FU6Pb30Bm4no4sUEg05ZDKJUsBDbAYx2Ah4NkQesJsiA0WpMquKIb9y3yKXltMLDNwKyr2ZAmGBFZncZVYIU9NuudnPlaVVCmGRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
Date: Mon, 13 Jun 2022 09:30:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610150651.29933-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220610150651.29933-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0038.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fdf543b-c5d0-4317-6722-08da4d0e8907
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2666:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB266617A0E59DAFD6B52708DFB3AB9@HE1PR0401MB2666.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yJRzSvrz/fX2bZELwhPrdc1QVkw35WP0ps87iex9CALT9PO2w1eOcCAo97BhVVnzzLF9M/W4aaHp6Rvem+Svyc6ux3YAkNVgbCVfPflY8gfJ50Gsrbzx16RUMj8srwwyy8vVZhPbd+JrMqBhAPWw85gZBmKBap1hI8wwBNYEv8dwpEnaGymW+mvTqdZQfpDd0PpqlZHE84dhU2feJW1P9Ph5BvQY5QM4qXKW0vesc+TtZSZJIruJNwwO2MBliqsU1FLGIj468o1F5GIdoKJ1IOweYZPNKnfhPJ0Dxduu6fqZbwjSNwH2wOaekBF1L2qJaPGwKiCEPTKCIhxjdJsBLoqq/vvSGiskttcPIW/p8cX5FTR9vHXL3iuu/5KU/mCxECUlrryMxnxybcY5ko+vM2ja4n0gk57i5/KH5uI3zMtzIdPAWjbFQ/Pt+yxNh1BQeUXVSaSJXxv3/GVR5ADjWDdbZSHtBOpSeEOHhailVe3lWyY/pjBDvZFJtyfIOBgKVhIkZXy5hWY1dQMJrC74yJegTgQN/bPxWuyQR+Iq3mMB349qmMi5kLbKQeMU0/6EPFJGmERSsQ3JWr9xbrsB8hnCe8+q5vTagB6OkqK695D2LZ2meQqsztF8tMgCifiSZ8MCCjVxzRy4KHb/cfZYHiS/s6LkkX/c+AQOiGnCmyKEP6f4/PoOzDUu/oPXhu8Q3B/boAfvNUU0UI/uluOGkZ3paqJtCD78SAj0UsUUVgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(508600001)(5660300002)(6512007)(36756003)(26005)(66556008)(4326008)(2616005)(8676002)(8936002)(186003)(66476007)(6486002)(83380400001)(66946007)(38100700002)(6506007)(86362001)(31686004)(2906002)(31696002)(316002)(53546011)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1lIZjlINVdaR1pDV3dNdXplYWFRcmNSTUZNTGMySjQrOE1uOHhNa1UwMGVQ?=
 =?utf-8?B?SzEyNTlaUlc4S09oN2h2RmxacnZXSDYrU3crTGRnWUc2RVdRdFNWRGhXVG9G?=
 =?utf-8?B?bkh0VytXNlBPbER2QlE4K1NVa0Jyb1BIR2x2MzhiNkpkTUp5STA4K2Fnbytw?=
 =?utf-8?B?R3AzUFk5TWhkWThhNERRVXhMWi9LTUo0WVExSnI1QnRsWEJmUDFFbkl5czFW?=
 =?utf-8?B?eGZKMko0NkdYQ2FFNGx6RlVrNHg5VEJvNU5CaEQxRGhVNDNFY0dwd0xIeXI1?=
 =?utf-8?B?RUQ0WGF1QUwxTHNNbnZ1WVFXbnJvZTM4SlF2Mng3RlJqMkE5bFJ6VWJ6bXAv?=
 =?utf-8?B?QmtZL21rTXRkTHVHK0g1NHVSa0tBUVpTK2ZSdHFsNll1b2dZZS9UTmdHbUVt?=
 =?utf-8?B?K3JhSjNIc2NkSXVCNFRyMWRSR3FRdXZRcGVIcmN2cGZ1QVNMV0RUd0M3UUtq?=
 =?utf-8?B?N0RzZlF5N08xYldWU3BWaDhrV0cwRkJIOU9hdm1FNm9sVmdOalFrVmllZEY4?=
 =?utf-8?B?RE53VFE5UGFYb2l5MFBVdVFrYTJUVGV3alBMdnRhYlh2Wis1Y0RtRXl3bkVZ?=
 =?utf-8?B?d25RYVJtMEFRL3FKNFVwRy84bFZ6UjlPMEpPQ2VITU94REpXOGUxYTRzMXcy?=
 =?utf-8?B?akFESWs5bVNyb0s5VTdYc1d1anJGYkoxN1hvRkVGZmNld3dLSm1FSXdySFAy?=
 =?utf-8?B?cWU0cEZaYm5lU1NYc0czS1AxNk9mR2k1TGdrdDNhUFR1Y0xXQS9JOHV3NW83?=
 =?utf-8?B?TGxLTG92VWJ6aDRsQXRoelBEbXZkMk1jdURjVlovV2lHVXl2eXdiTDIwYXFz?=
 =?utf-8?B?MFVRQi9iT2FtM0YzWS9GcllWYWs0NTNkUlFSYnJJQ0VsNkdJazZDSm9Gemcv?=
 =?utf-8?B?TVZxcURGZ1ZNWFowWGZrdE16d2F3dkR1KzV6YkdOWnR4R0JhcVUwclZyWSs0?=
 =?utf-8?B?L3lBeUtockZkUjdyQkxIRFErdkR0b3RNbElGZHI3MWZESEVvK3JPZTQ0QUxj?=
 =?utf-8?B?R2pNbEQySEFET09Qcmx5M0tXcDJvK0x1d0R1dGNkNWlhTldaSGxBMEUxRTBI?=
 =?utf-8?B?TXFuM3dXNmY0WVJEbzZyUUxOQzg1WDBTY3owRE5FWkZ3czZodytCdmNFWHVl?=
 =?utf-8?B?OStGcjJ1NVVOQ1EvRFJGbTB4M0lFd01NaXRQR1hCTS85Ym5PL1pOZ0tqRlY0?=
 =?utf-8?B?U2lDZU9BRUo4YlNmZHhjQ2xEb1hvbktqdDFidlVRZVZEKzlmRlAyZkYydTI2?=
 =?utf-8?B?eGlLZHJHbG1VN0E3dWtOeStXQ0RhdWNNNC85NnFVQWVRWG8vOHYrMFYxU3J0?=
 =?utf-8?B?N08zcEUrWmE3RlVVaVdLeGhVbStjNTB3MlgrdFFQdm12R1pTdnBkbmRRWlgz?=
 =?utf-8?B?T1hMbXdaN3BRRUZiQyt2M05mQWFLVEtMZC9QZlY3eDgvMGljUnNlUUtTeDA0?=
 =?utf-8?B?dHNtYnRpZW1uV3ZNL1pwZzVoeUlaN2hiMmxBZG4yNFViVVV3ZXQyaExFYTBt?=
 =?utf-8?B?WEJYRmZJRGdiMXV3Qnp1a2J2TE9nKzFDaXEvMlBRaFd2bnVHUWplRmI2cGtK?=
 =?utf-8?B?b0M0MjBXY2lqbUJkNytmWjNheTFNbXJWdzNWVmd5eU1SdkZSV1dsOVJmdGVI?=
 =?utf-8?B?dGVNTmdxUVdmRzk1S1c1bG1UMXJXUW5pTzMwMWpsV2VGRHl3bFNFM3YydFll?=
 =?utf-8?B?WEZkcE4vWDkxNnAydzFSMXNJMkdsNWl6SFhUdUpISldPcnBsU2orNnhaQ2dK?=
 =?utf-8?B?TkZVTmttUE12cDdTQk5TOURreTQ4UHBzTmJNanFJZUxRbnRVOXNxNWo2MDFN?=
 =?utf-8?B?Z1FkMVJmYVVZWUh2bXhVMElEb0tLRm5tWElPZEhXaE84a1hHQy9vekxpT1kr?=
 =?utf-8?B?c2Z2cmE5QjBpbEJZSWUwSjVlRFFSbWN4YVVubm5qUzk0M0lEYTZidFNNOUZE?=
 =?utf-8?B?clVGTlBieVNyN0lUcTQxaGVKejJCMEo4MTFFc25VV2phZGNLRXlhbXVkRTEv?=
 =?utf-8?B?VjJjZzlFQnMzQVU5Z0M1RmpUTVUwYU9jNE9JVjgwTXFGa09hRlpLdk1ETVlQ?=
 =?utf-8?B?SHJ1cDZNT25SbFBNeHdaME8ycnhaSS9HUW0vcXN2VUUrQ3FaTzhHeXpxazIw?=
 =?utf-8?B?RWhMQ1NJOFU2RG1wcC94QWtpK29zKzlZSXNkWHp6Zmx4bjFzY2tOSzRTWkFm?=
 =?utf-8?B?T1phdGVSVjhXSUxWZm01VVZGcy9WWVZQWkl3NUMyOWQzT21TV1dwYWZIVWUx?=
 =?utf-8?B?ZlNkNmxRc2dlUmswM0pnVFA4RXJEZldiTTlKc3RGZnhzWXZzWEpxWTkwNGVu?=
 =?utf-8?B?cXA3UG1hVzZzcHNVRGJkUW9qTTJWcFZmUWpUd1RWdTlZNkNYbzFndz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdf543b-c5d0-4317-6722-08da4d0e8907
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 07:30:05.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggF55eCxIyOBQuM1cK5uWC5PjEBDZ+sdgJT59ZxjSjuwjrYkRFduxtgE5OhdlRI5y+I3xnNfi5PJR8cvpOwgjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2666

On 10.06.2022 17:06, Roger Pau Monne wrote:
> Prevent dropping console output from the hardware domain, since it's
> likely important to have all the output if the boot fails without
> having to resort to sync_console (which also affects the output from
> other guests).
> 
> Do so by pairing the console_serial_puts() with
> serial_{start,end}_log_everything(), so that no output is dropped.

While I can see the goal, why would Dom0 output be (effectively) more
important than Xen's own one (which isn't "forced")? And with this
aiming at boot output only, wouldn't you want to stop the overriding
once boot has completed (of which, if I'm not mistaken, we don't
really have any signal coming from Dom0)? And even during boot I'm
not convinced we'd want to let through everything, but perhaps just
Dom0's kernel messages?

I'm also a little puzzled by the sync_console argument: If boot
fails, other guests aren't really involved yet, are they?

Finally, what about (if such configured) output from a Xenstore
domain? That's kind of importantish as well, I'd say.

Jan

