Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2B578712
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 18:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369931.601562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTMr-00034e-5A; Mon, 18 Jul 2022 16:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369931.601562; Mon, 18 Jul 2022 16:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTMr-00031F-14; Mon, 18 Jul 2022 16:13:09 +0000
Received: by outflank-mailman (input) for mailman id 369931;
 Mon, 18 Jul 2022 16:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDTMp-0002yg-0D
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 16:13:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81834379-06b4-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 18:13:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3398.eurprd04.prod.outlook.com (2603:10a6:209:6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 16:13:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:13:01 +0000
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
X-Inumbo-ID: 81834379-06b4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6ChofG5De/JoOQ5vkuYj5B2FlArpBojsrG+w4v0AkciorWhom0zpWu3Hqe3chcoJk2Pc/ENrr7LxejxLAicCtuc371c66srkNX22y/liRG8xy6o5Wa2adACvJFp8eMEBBZ5q12G49I2CkxIfOuhC1zuOoVV3Y73Hnpd5MtOIpDXcnLFzL5ZSw4ruakty+eWz2Q4rBe86RAJEKPXX7Xno6ih5PoNQKoX2QUWLP8UKl/GCCGiJHlvJLe8vjgvyR1VMbAdWHk6hE2Wwtmns4JOhUapoGu9eUGUgsDv4qVNCo77qh8Sdw/T1lffP+zqm9Zc7Bc6IGsKlmnpzTxSgneSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdA7qoWakb6S4xGsnExcBDM5U822zaUdQ7MyGu7PNrY=;
 b=f/QJBQpRE8zXleFVu9228Liv8J1pOeaDgtu7NmkzEXNHdqGRpfoA+rf5DwiIiHYkPlQ+6SM8USD5T+P10REXUm61qbsDo4HaE/70JpaIq/EL0KWDyVT062wZxKsgppz1DuEAir8F0Hr+CsngyMPd1/s1hHY8I1pSFsGBo614FoPngcCBr/h/CgfGVEExaL/9LPfkgZBCtH/jOStx/+vXyYh1hBx6iZ6IeCW8Is2zSv8EocBgzt9xsJE6HLiXcd8ZXX8KEDFETfzoDByP7/WTVRggugH3lt/UIFk8bw9llWfGEvtVmoj5C6irkPlt5giy4UlcJ4EbYzoh/JY4UO8Hog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdA7qoWakb6S4xGsnExcBDM5U822zaUdQ7MyGu7PNrY=;
 b=cab58g64W1cIXsCbXBjLjVlXpm8zlvih+XWEb3HcjbarUsLJbXudO2tIeW1aD5kluW5yxuvRVhvNR9qHv3pYkFxMHgKSLxuEQxtvcoftjaue5VBEcSBRqzq1ycJPJt0ZLSWztj3Mz1fSkCsfIRwh9ySjp9Hi7qZgSXGKJ77T/tWsFEQU+J0HyO66DodLPEa6NAM2MOpL0R/6tXH1RzI9PmJk8mDsLW6lxpUGT4/qPCIgky3WYLrIzMCZddqg4wBewsOStoQYfqPqCUCqMbY7YQUjX0fTuWn5eXz848tNrq0dkFp8UuddnGWDYuo5TMLXy7W5nA1urZmITl+qQFGbZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e12a7ee-8526-2214-8beb-f0f3d8ad3e83@suse.com>
Date: Mon, 18 Jul 2022 18:12:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220527072427.20327-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220527072427.20327-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5230eeff-9c6d-4654-cf2e-08da68d86356
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3398:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZB/lm0MjOVHRAt+1xTXp5WuZ1+URCHgKd/zPdd19zkqOf+OGMIPGmL5O5T8qEZ0YNJDU4p1OknC941rBfO1zcyFaBdYJ5CVZQvv5+palIf7MZ+Ck5aqadx/qf6IZ3DgMX9YDLeA1j9DbmX2A88zgT/MCuBEk+deAtIK4reKrFMWfGtVmOZPBne5D/TpTb0pife3MQkZgROUkMAE+H3K2fWEs68FS3sUCgDe2qoJpCB9PCrSXGKvwHjd5jF1RZJAjOcR94Qf25qYkDR103YYpEip9ylHQ3wFHHRkTlxJlBoN820mrln1G4Zm09uLjGiJMAjJrbl0uvcM4HT8WZ4VIxvaSs/Iy0VeIvFLt51dJsFjOeLh06/95eTCcRXRuni06yBBMiJQ7OEOmqm+15LXkoDEM002y9srhAhS8nkinjDtgfEX8aPzAq2cHuSn3ULArvMyRCP5Xr2Mm9LMgnPvZ+sX/2l58CAJV8ZmKwB7MQ7RVqibnI22LZ/8CpMP+9y/CkBywM6nYGkKtR5ez+bIgBMy6o9gTIkK+68ovZ7shOmd2iAPOrsJB+JKc5OeAXAVlIiby7rzicWl6PjTnFnOziBM6QgGfvvvandZGKgwmn44VHWwUjlh/aUdPG77GMxiD0/NyfR1+ZeqBJr8yRFEcBEVM0XuB54XHZd6JJ1cMhTKNlbTpwZV1IZ74Y39aCJK0kMK0JBYdkLH/ImXNvzJpoA9F+hxAjOYaPg9nGUYjFdMFgBoPxNbPHK1GXUI9q3Bee4zi9gnXs4bkb/EQBpVu/l/eEeptkgqoqY1YJtXso7Ob7QO8W9aVSETzbsqsWMMrKhCUoHEjWCPHyJnlOdLgki0XfcXuL1Zf8iOxh2KjEHGVQSMEurcA4XfD6YuX9mR/h0Hi0cdQ8/3BCbs1V7iiAn14BWhbN69GOtyEUwI05PE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(2616005)(41300700001)(53546011)(6512007)(26005)(6506007)(186003)(2906002)(6862004)(83380400001)(37006003)(54906003)(38100700002)(316002)(6636002)(8936002)(478600001)(6486002)(966005)(66556008)(66476007)(8676002)(4326008)(66946007)(31686004)(36756003)(86362001)(5660300002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDlPVmVIMTQxVy9GeUdaMzdkSDVkcVJHUlV4ZG9WeXpXVEZFWFN6QjA0b25J?=
 =?utf-8?B?QjhVVm9Wb1lQWllSUkJtbHl0SkxBSUZ0ODFmVlp6dWhoR1JxUzRkS3VDTmlV?=
 =?utf-8?B?cnhORE5VZmpDOVMwaTlySDB2SGNhM0Rzd2hITWxJalZ2QjFGVzJGR1FLUENK?=
 =?utf-8?B?NWJXWUNmRWpPdytNV3EvRW9KN3U1c2oxZXZxQkFSRVJlYTZPenVJdGU1bG4z?=
 =?utf-8?B?bFBHK2VaM29TME9vUlRHQmdOYTRTM1lndnM4TjVLSnBxRWJnYytnc3N4NEQz?=
 =?utf-8?B?YnJjcExQdXRyd1JycVlyZWhBUlFWclRsL0x6US9ZWjcwYVhhRXlvV2pDSkhX?=
 =?utf-8?B?eGZOd1VjUHJ3K3FtZmVlQXlOdGJrRkpaNHZwcFJuNUpVZHpUM3ZKL2UrSXFP?=
 =?utf-8?B?MjgzU3VkV1dON09VYjNzTTBRN1JsSVJiRllUU0dwZ0gzSlpkUERsWXhMUDhs?=
 =?utf-8?B?bTB5bmhTTzlJNDFEUHdUWldJUTg1aVYvaE9VZGtwdS90dHdIQjljc0lhbGZ3?=
 =?utf-8?B?UXpoNDN3Tm9IWm1QWU5saWlwUG5WZXlqOXhoUm9ESlRyb2k1bFhTeTNtelM5?=
 =?utf-8?B?MFJId2ZUZEx1YUJPNGlCWFNLeVQ1K2p4MFdzcEl1T01ZR2tNaDhDODUvSjJY?=
 =?utf-8?B?WFBqVEFBRUw2L3ZUSHRJeElXUzYxR2xOT2FzcmFtUm9Nem1pcEg0eGRHZmlP?=
 =?utf-8?B?TWdCZFB0djJwT1NNZG02Rmkza0kyMi9obFcxaWpneWxxNVVuNVNaRkRYZmZ1?=
 =?utf-8?B?cEQ5dnZnZjhyaEdVeWtpblo1V0kyVEU2cis3TEh1NTNNYTFGWi9oQVF6b1BH?=
 =?utf-8?B?NENuTktLbHFuZlVLcTFQcktSMW5hOTRIN2dmM0NMc29kSytzQ2dzMUJCNFNE?=
 =?utf-8?B?SlBOZVZ0MTZjUVoxYjI0WHVCMDQ1ZWJhQUJLeXFjeC9JV3ZGbmdxM3FTNDdL?=
 =?utf-8?B?NmFpRjkvODVEZElQSTRzVDZucnpmYWVrSkxIVkVCWjU5OGovZVF1OG85YnJK?=
 =?utf-8?B?MzkzTUtaNm9vb2VBTXV5ZU85OER2b1p1SmFBUXRYQnRiZnZhVkQ0U1BpTTZu?=
 =?utf-8?B?UmtkN01iVW02QVFXNE43VlR6ZmtJRDJSMFp0ZDA4MGFaeW9vUldraUNUMnNp?=
 =?utf-8?B?T1FTZ3VUM0RTUGlMN254YVo5a2ZlL2liR1NmOHJkWWJ5SGpEYmpVY28rVGRO?=
 =?utf-8?B?RDhKWlhxQ09XcncvUDdUejhZTG5neUhML3dDVHBENWhuaVU4R1B2aXlJV0xN?=
 =?utf-8?B?ZmNkdGYxOUgwaTF0WGxPdTQ5Vm9rT0M2bDFjQlQxcy9ENDFEODdqMC8vNFRk?=
 =?utf-8?B?dm56Y0FHY2hZS3p3UmFGMGxUbjdPSkhReWVlaDcvQVdLNVpRTDNSL3pubjJp?=
 =?utf-8?B?bHFaVVhPajY2Y2wxVkRFVGo5MTFrY1MzNGx3d0ZicTBveVIrYk9SUk5TOUdH?=
 =?utf-8?B?NlBhOHU3ejRES3NuZitiRWJObmNHWm8xWU5pZ1ZDd3BkSFppMWNyVTZjRGNH?=
 =?utf-8?B?SGhKV0ZwbEJ2ZiswNHhJcVlyVmxjaXZ1WHNmSHVBZGNVSlNYemVXYVFvTXRn?=
 =?utf-8?B?dGRRRGZsOENGNG41c242RlZleTRBQ0V6VUM5U1RvNHNrSmJxZnJkU0xXVXdt?=
 =?utf-8?B?Q2dvSTNvdVhLY1pDN3hmSFBoay9hdVhVZVFXcTRDKzFjdGtVYU80Z1FJbnZW?=
 =?utf-8?B?bWMzWm9YNFRRVEhVdUdHVzBRMWZ1LzMvdERzZTNKdFBBWlJrNlVEN2FURVNh?=
 =?utf-8?B?aVA5OFNDdHVHeVhEUERlUEp6SVB2NXhPRE9FbUZuWFBwUkJCZTk0YlpqQlh1?=
 =?utf-8?B?bW0zb090dlpSRFVrVUlLSVllSTNIMDJXc0JRZVhua2VHZW5pRDRCTzNBR1Vn?=
 =?utf-8?B?NDRSUGRKb2tIY2JpemRuSEdqV0svR1NYdGxMNzByaTRjNWVTREs5bm9La1Nq?=
 =?utf-8?B?eHRUdmVQSGljUDVKb3R1VCt5WTBHQjRyWEdBYjBza01sdC9OWHlyN2ZOdmtZ?=
 =?utf-8?B?YkJ3aUFsbWFRc2RrN2RTUVJ4a0tPTS8zVWZsaWp3Wno4REpwNGdHRGdYcGRk?=
 =?utf-8?B?OFdub1E1MVAwcHpCWCtGRVFFTkNWZW9oVmxBZEZ2MkxJVDB2Sy8yNkNJR1N4?=
 =?utf-8?Q?ftEkDUGg/ak31n0DhAD/F3aWh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5230eeff-9c6d-4654-cf2e-08da68d86356
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 16:13:01.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iS9vFNOiDOE6ZJ2wPS/sIX7cD4xv3NsjLVYnwlxJTavq1qXmWVp7H6nzFwGlG7bxDRyCcZ0HtjSPa4ZKjIElAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3398

On 27.05.2022 09:24, Juergen Gross wrote:
> In the past there have been spotted some shortcomings in the Xenstore
> interface, which should be repaired. Those are in detail:
> 
> - Using driver domains for large number of domains needs per domain
>   Xenstore quota [1]. The feedback sent was rather slim (one reply),
>   but it was preferring a new set of wire commands.
> 
> - XSA-349 [2] has shown that the current definition of watches is not
>   optimal, as it will trigger lots of events when a single one would
>   suffice: for detecting new backend devices the backends in the Linux
>   kernel are registering a watch for e.g. "/local/domain/0/backend"
>   which will fire for ANY sub-node written below this node (on a test
>   machine this added up to 91 watch events for only 3 devices).
>   This can be limited dramatically by extending the XS_WATCH command
>   to take another optional parameter specifying the depth of
>   subdirectories to be considered for sending watch events ("0" would
>   trigger a watch event only if the watched node itself being written).
> 
> - New features like above being added might make migration of guests
>   between hosts with different Xenstore variants harder, so it should
>   be possible to set the available feature set per domain. For socket
>   connections it should be possible to read the available features.
> 
> - The special watches @introduceDomain and @releaseDomain are rather
>   cumbersome to use, as they only tell you that SOME domain has been
>   introduced/released. Any consumer of those watches needs to scan
>   all domains on the host in order to find out the domid, causing
>   significant pressure on the dominfo hypercall (imagine a system
>   with 1000 domains running and one domain dying - there will be more
>   than 1000 watch events triggered and 1000 xl daemons will try to
>   find out whether "their" domain has died). Those watches should be
>   enhanced to optionally be specific to a single domain and to let the
>   event carry the related domid.
> 
> As some of those extensions will need to be considered in the Xenstore
> migration stream, they should be defined in one go (in fact the 4th one
> wouldn't need that, but it can easily be connected to the 2nd one).
> As such extensions need to be flagged in the "features" in the ring
> page anyway, it is fine to implement them independently.
> 
> Add the documentation of the new commands/features.
> 
> [1]: https://lists.xen.org/archives/html/xen-devel/2020-06/msg00291.html
> [2]: http://xenbits.xen.org/xsa/advisory-349.html
> 
> Changes in V2:
> - added new patch 1
> - remove feature bits for dom0-only features
> - get-features without domid returns Xenstore supported features
> - get/set-quota without domid for global quota access
> 
> Juergen Gross (4):
>   tools/xenstore: modify feature bit specification in xenstore-ring.txt
>   tools/xenstore: add documentation for new set/get-feature commands
>   tools/xenstore: add documentation for new set/get-quota commands
>   tools/xenstore: add documentation for extended watch command

Hmm, looks like I did commit v1 of this series, not noticing the v2 _and_
seeing there had been R-b with no other follow-up (leaving aside the v2)
in a long time. Please advise if I should revert the commits. I'm sorry
for the confusion. (I also wonder why the R-b weren't carried over to v2.)

Jan

