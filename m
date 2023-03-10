Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB06B3876
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 09:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508420.783075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paY1t-0003wL-8y; Fri, 10 Mar 2023 08:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508420.783075; Fri, 10 Mar 2023 08:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paY1t-0003tJ-5s; Fri, 10 Mar 2023 08:23:09 +0000
Received: by outflank-mailman (input) for mailman id 508420;
 Fri, 10 Mar 2023 08:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paY1r-0003tD-AD
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 08:23:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe12::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d40dad-bf1c-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 09:23:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Fri, 10 Mar
 2023 08:22:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:22:58 +0000
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
X-Inumbo-ID: c5d40dad-bf1c-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCWWOIpKsAsCdW7f1m2RU9a6crxROt58tw7qRvEfzo4BRsT/3bdCg2+0B3cufEpkZzjxKgdK3Nkswjm/cOfUkExcUYR7gtU1n9ESO0jHFEh2PnSaiXiCrI0U66FNkR+Eu0E7rMems/Vh5dbjpIM3W8S7Ti3ODs7V84iu9ssFVwx9jPBd/vtc1ZLt3WcQaGR9tqNAij0JwCC4RmQDd9I8NZUuveQUQzkJhz/slTfRhTdh2GGZHJij9xD5baINMuFlMorHWr/k/lXRHvSGTGgSvFIvdiwEynE7SFQrRaJA8erx3TV5BaeeDbN5uI7kLyGmQunAZETventSwsS2oaldbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj3eC8LdQghUT9ACN0oTSYDwDIzoYa85Ha7YmgJG4yw=;
 b=isPQC9OXHb1eUdvbYZIzfJUO432K4uJyng6Xc6SqNuJmFKj+QHxqOD/7wg1C0usVgAy5+UxufDKJLmXUbra6fkv0B7PSZ9TJfIC7vKV2sJVo2+RRFGjZ+5agMF7xm/ibcsNf/cz5tstnlD0wyjHhr+2Zns6SLBmK01rGFEk+Au3auZWavMsTiXOR1BBF2l4PHsXEUfKyBF/fzfGpLQFzwMPT9usDbmADi18nENdNM8aqa6D2iThneXCZs2KiMK1rR45ufPMlFAhVcHDtXHvQQ444u8RMalePmdbSZWjTcGPbBfkXndtIDOJd4OkCC/pwXzi31Yp/Xk0zXyud91tDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj3eC8LdQghUT9ACN0oTSYDwDIzoYa85Ha7YmgJG4yw=;
 b=NqTSm0YS3bnKpVAsPUPQNo269hogsX+MWKWR4DHTVsvP9iU5N71T4xihzNBNqA2RDjFO+NWgwjwWo384XcXIc/6UCr9VxS3BlP9VBg1U4lADRfiyXpOOnoNn4diXeBlFgVUWq2xun6GETaw2BjWfYNwtQm2atHSvR7q7QoD+LBP5vh66JFmwTJyO8PoW40/aejEfrR36KT8GMYiqVtlnPk/iAUWT4AyNe+KKb6XxGmYbv27T+S7hd6OVJcPRqRDaZLSo1Pb6yUthw5FekgdyRXn7MoCROW6U7h9NyDkE0QuGNDNUNQhu/9nKI60zyxW+b+NUmyVDhWG/P8wf2r4oPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1845a2bd-3749-debe-367c-48f310b3cf90@suse.com>
Date: Fri, 10 Mar 2023 09:22:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAqjIwnFtXS80vHQ@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZAqjIwnFtXS80vHQ@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edfc2be-768d-49d0-f07f-08db2140a7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ACabDe6mn8oEqmMQXen8q+viYeDaq9nfqBt9jb1a/KXtcdy9w0IUg1VxeJm95rVfUHNw1kSzbu7W/oLcwYh+E1wVELTBbhoDMSeVYxNRaowMN4lY8ic/r4CN8rNHZgXz/fLEBuDEj+h/7ZKinUOuvG8hXjNb7AIJEGFHbI9PYoD0kBSSHTlA8Tilw1z4nyrdHh0Unm+OOPgPxuUUTL7VO9XJf5K0jL0mbGFvy6hwvPjiswr3uEq63sJmlyOaRTa6qa/n1GHwlxzw/QS4PUOcYsQXIELFFd2UIpFEvFIW1mitkyuOjKvlUY2PT+6SaDKoBfv0MBCkUes7DhYwYfVfeWbbhAqfye1UH0io1fI+u2HURGC+QpRiLyplYTWyZNuX1ib2itaV8bRb/6SKi5LHKoI8eiMMQEftKXasvUPn8za2+qdIirRhz2SmSpL1WNCDuetW8BZgvY4RKx09q3h4dNrupNmFtte/PeqxHvNGF5Un01otGsN04Bx7PAcwdWW1ksSgzl5dDNan7xGwRwCLSLYMxdThmr7OKFsWDo95stnOwXkCDqYj7wN4XBUGMaCT78MtRs3yKcRecUJCmjTskjkTlA88NK9x2H5s09B4wl6r8lGjV40dwc6O1ylLXqJb6jINA6khNP6RIEklZI3rZWR6sN4XxmkaCVsrzD7fDdTT+iXqRaGxG1y7Z2TajXsA7bE8uE+0JjsDxqzfIK1JXifFDnbpDzYVLErYdqFb28U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(8936002)(86362001)(38100700002)(31696002)(66476007)(5660300002)(4326008)(66556008)(8676002)(41300700001)(36756003)(2906002)(6666004)(66946007)(6506007)(2616005)(186003)(53546011)(83380400001)(6486002)(966005)(478600001)(6512007)(316002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmdaQVdGckk0b0pkNnRuZ1FMMDdKK1kwekx3TXE2NTB6a3A5L0V4cnhSMnNY?=
 =?utf-8?B?eWl3RFh2amFybnNZcy8rUWtJOGFzTDBPK3hCRTNQZTY2OWdwcm13NzJyMTl6?=
 =?utf-8?B?U3R2L2ljVElZVUg4dXA3NWcrMkxKQ1dsZWlhamg4Tk9kM3kvTXpSMERRRTNJ?=
 =?utf-8?B?VGd5T1dqVmlvd2dWb3lweVBueGpPNXhvaTdKVEtiMFVDdEdSaEpGZ1RDWUMw?=
 =?utf-8?B?K2ZNdnJmQ0Z4eDFSUmQzbEtuNmdFS0ZocmhnU2FFUytuWHVrMFphaXFJWVF3?=
 =?utf-8?B?VExTQUhNQTAvbCtnRStPcG04M2d4Y1lBbVdaR3RmdUMxblJzei9WejFVOThT?=
 =?utf-8?B?dlVwV0FzRFoxZjRhSXFxNlFqYkRyb0ovOXMrTFRrNFRoRXlZckkyOGMxVXNC?=
 =?utf-8?B?cjZwdDBSdFlKTmwzcUNoenpzVk5qN2VJMGRybHFBSk53K09KT0F3ZHdtQ0Qw?=
 =?utf-8?B?TkQyV3ozd09yNmYxWHJCckV0TUN2WXZxcjFTbjE1MTIvcVYvQVExSjRZNTd3?=
 =?utf-8?B?NFZsNTlRRG52QWVQWTg5V1Bub2s2d3NNeVVIY2JBdzY0c0lkTFZCL1pmalpn?=
 =?utf-8?B?R3YwbzRiRS9mSHlkWGFnbGxGNUJXdk5TZGEzOFYyQW9iTURkRXErNWg1MGpo?=
 =?utf-8?B?dUZrOVhoM3dSN2ZMcWgrdG1aNUx3Q0t4VW9ZdzR2YUFQV203RC9RWXBXM0JJ?=
 =?utf-8?B?ZHNMa1V6Vm4zcmR5SG9NbktndTR1ZXRDY3c0dG16UTlwVzNQVGJhcnBHVE96?=
 =?utf-8?B?L3M1bmlWekZTdk10M3IzNDJIV21HOC82RGw1Z0QwK1lHU0JrUjR3Wk5MTGdM?=
 =?utf-8?B?eWdNSmcwYVNPaGFJbzlPWnRrdVp5OVNuNnRGYzNnM2FkSlRTQW54b3AyN3ZH?=
 =?utf-8?B?SDdBNldvWUdsQ3lnZHg0RVZnSElQYlZBWWxSVVZveXFDOSs4cEp5RzArVWZn?=
 =?utf-8?B?dHdvZnA3MGlVMHpPaUszRFp2bEQ2cXk0Y2RTOTNLeE5EWUpEYm84VTJqdmty?=
 =?utf-8?B?NC9tVEZGVDlZc0FuVWZSTTVjRlVFb0hvVlFRWnpQTjlhRVlKdjg1dGJUczRU?=
 =?utf-8?B?ZktRK3U0THM5Uzk4a2IyQXAvVU1LMjdOaldTZDJWaE8zM1FvZ1lzU0RiREFZ?=
 =?utf-8?B?ejhXVTltNGs5QVRZZDlaUnNhYXhCSWc5R1FDcGgwUVBJaVU5Y093b3VvbWpk?=
 =?utf-8?B?TFprdWhLTTRQY3JnMzFNSE1LNDNVRXh0ZTY5MVdVQVhsekwxNTBCQndobGx0?=
 =?utf-8?B?aGlGakVueUZNNXNuWnEyK2lsSWN4eDRMNzZvWVFIVFp6bE1ZUmlMN1VRczBk?=
 =?utf-8?B?ZUVQa25vWlhPVjRSN09KWlpzM0hGbFBFcVc5NENrTGNiRVRCQm5rMTJZK3Jp?=
 =?utf-8?B?bjFDUGpMQUgvdmM4SGprb25DN0JRUmI3RmdKT3AyazlKc0dlQ2VkVDZET0pL?=
 =?utf-8?B?TW8wbG9TQXVDQllUQm94M1B5WnlPVVlSMEVhOSs1b1V2eHJlUE1xUDY5Ym5P?=
 =?utf-8?B?M1pQK3pBZU5weXpXSmhZU0E4eXZmam5YdG9DWW5pVHZnOHZqcG5NNzZGUElC?=
 =?utf-8?B?aVcrZm02WTh6ejJOelNZUEt3UC82WWMyblowYldtTXVHMG5hVEhKTWVqQlQ5?=
 =?utf-8?B?OEJFeVRpWVpiVVRxSzFNWHNmZjF1T01WcWRITnU3L1pXNTk4ODFQU1Fybk1V?=
 =?utf-8?B?bEdOWHJwN3FWM0Z2MDdpOHg1cjhTWkh4dkhqTDdaQy9jaFRvRTlXWk5qWkti?=
 =?utf-8?B?V0NXc081RTFoS2JGU3owMUZpeUdNS3RtdHZrc2plSHhrVHVXZkhZcHNnWldB?=
 =?utf-8?B?N3JoamJNT1c3MElMYTZUckxoRU9EdEVkK242ZnNkSGpQcXMxMkdRbzdwVVFM?=
 =?utf-8?B?UVlXekd1Y1NkSWdhc3c4NTVLc2dRSVRvbVUzdHJUMDJETU1aMms4cUdKUyt4?=
 =?utf-8?B?L0NFTlNnY0VSYjhXS0hyY0RXSDFRSDlud2NoeWdxdTNiOGNrKzQwcjk5RGEw?=
 =?utf-8?B?Wk9mOFJDWXNqYTlLb1BBUUNld0VhMXJ0T3RNM0VaRGdpMklKSEliaCs5U2Nt?=
 =?utf-8?B?OGFHZkMvOWNSTXRxczBBcWtrQ1hVeTNwTTMrUmtaZWV3S1RLTnkyOUxYLytS?=
 =?utf-8?Q?f+X4SqtBz+w570uJKbBQ5R4kB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edfc2be-768d-49d0-f07f-08db2140a7a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:22:58.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjIwCEbrFhd02G6tiypGU4ZAIqtQVGTJkI422Q1Beo3ehnrCmaePmkmaaEAvoQFniDB+KI0Vbff87k0t1st0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On 10.03.2023 04:25, Elliott Mitchell wrote:
> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>> On 09.03.2023 00:08, Elliott Mitchell wrote:
>>>
>>> As such I'm less than certain the problem is still in HEAD, though
>>> Neowutran and Co working with 4.16 and the commit log being quiet
>>> suggests there is a good chance.
>>>
>>> More detail, pretty well most things are broken for Domain 0 without
>>> "x2apic=false".  Trying to boot with a 6.1.12 a USB keyboard was
>>> completely unresponsive, on screen the initial ramdisk script output was
>>> indicating problems interacting with storage devices.  Those two together
>>> suggested an interrupt issue and adding "x2apic=false" caused domain 0 to
>>> successfully boot.
>>> A 5.10 kernel similarly requires "x2apic=false" to successfully boot.
>>>
>>> So could be a commit after 4.16 fixed x2apic for current AMD hardware,
>>> but may still be broken.
>>
>> If Dom0 boot is affected, trying a newer hypervisor shouldn't be a problem.
>> You won't need any of the toolstack to match just to see whether Dom0 boots.
>>
>> In any event you will want to collect a serial log at maximum verbosity.
>> It would also be of interest to know whether turning off the IOMMU avoids
>> the issue as well (on the assumption that your system has less than 255
>> CPUs).
> 
> Well, I can now state "x2apic=false" IS required for Xen 4.17.  Since the
> last x2apic commit was about a year ago, I believe this matches HEAD.  I
> missed the logs since the USB-serial adapter decided to bugger when the
> machine rebooted.
> 
> Is it just me or is https://wiki.xenproject.org/wiki/Xen_Serial_Console
> out of date?

Without you being more specific (there are many variants there), from
quickly glancing over it the command line options mentioned look right to
me. There's an oddity like "console=tty0", but that's not affecting serial
(should be "console=vga", if at all - in the specific example the
subsequent "console=com2" overrides the bogus one anyway).

Jan

