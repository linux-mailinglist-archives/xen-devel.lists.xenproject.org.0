Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29677D105A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619772.965394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpMJ-0005m6-Rd; Fri, 20 Oct 2023 13:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619772.965394; Fri, 20 Oct 2023 13:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpMJ-0005jS-Og; Fri, 20 Oct 2023 13:16:11 +0000
Received: by outflank-mailman (input) for mailman id 619772;
 Fri, 20 Oct 2023 13:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtpMI-0005jM-EF
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:16:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3eacebb-6f4a-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 15:16:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8702.eurprd04.prod.outlook.com (2603:10a6:102:21d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Fri, 20 Oct
 2023 13:16:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 13:16:04 +0000
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
X-Inumbo-ID: d3eacebb-6f4a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsRxev9oE44W1FUxaJUsACa3dChIXJ2bIPtcRBNI51+E7Slgd1/Eh3EucDoPKKiChGwK3FiGqgttAizRZxq3y7LJOTNn9R3yVT1/hQFRr652qIxhpQCGmf2JQUB0/D0Ybt33Tx1mgPz9xWLxjKb8GDbEs5SkHjV9Q9yyDZT7VHzKh2IQ3/Yoq1YHfTKwdImJ/TMn2eJjANLpnGi2yd5zZKlXW8liAbElj4VW4+u/KGTzJhnGTS5IBylXZyYgvCRamXJ85JYH4WWbAhz8EiktqGrL4hK0aNXDKUf8wFMsCrfp0KvPkw65B+ZG7SbQgKFUutxi0in185me9NhaaTQyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOugBdFs7lqZ4RXxUK9odGA+X6jNXX+3XiGo1y1OGtc=;
 b=PyrZ+Of9+bk20TgQmZhcTv0KPZjLORY32YDzOoM82PCopeAqy6QecCXX/KyncPS/vyp9XKxc5dl3wtZgtDLhHZjA+SKH45nh3FTdSnDwN1TPjo9NeHR/iTmu0LTbeL3fABe6tZG8vj/uzNgiu7J3jfQVNotorRfVcm1wZyZigjHi9fRM3TctPQIfrY6C/XdaBQPu8QkC5WfPTOBXM6DN7BEO0epk56DUcEswncnjpLT2WQ3L4E5vGTjGvdYjer6AL19Vcu++CR7Cu5aTLujCWPtACyVtLWBBwveH+H3MGEXe2logoRRnP9xu8KD4vCa9aGVcOPsUTNNuMWTHcdf/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOugBdFs7lqZ4RXxUK9odGA+X6jNXX+3XiGo1y1OGtc=;
 b=HfIOu5eXQOoY5sdzrhkMdDCYrdoqFdM912CxvU+rl7BlIQ0SkgCDekp0Sc29a//T5THtX4AdhJEL1/zTo+10DoQJ13khEtsMNmW7qLOaoIIbZMw9HJIUYzCV3TXAVrr8vTwF0Vc410qmkveqPNd2l9SYhWLg+jvLvQeBgNDPoOkjxF3aD/hN/Tq4zrfnpmRZx4MuOp4fPdhm8X4HGMDgId6pxQ987/BB+z4oYNSO9PGNiNRURWkOjUjN+dIIX9rDR5phZ1sDN+48at46A6FwVXyVIlXVWEkCrC+2ANVierrShkgADLY4LiyCSV+rAZ2uZcMuEVxDU3BGg0CNlHb5Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <985af766-adf6-9e9e-43ad-250fd917a5b8@suse.com>
Date: Fri, 20 Oct 2023 15:16:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <34aefb5f-252d-2992-c561-a73941429c4e@suse.com>
 <ZTJcERG9yD8ejHFR@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTJcERG9yD8ejHFR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5fdc56-40dc-4d1b-35e8-08dbd16eb6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f0/dLS+aiYzU3eZWGTk2NzAjtRz82xVw1pqNYcDIWF8toeaH5/J5K6vZ6CITN8kMta8R2hDtea2cXGACFZtoqHBSsjQgGaUAqpXwMRWATamfJF5uzUvJD/3FXynbP+QYeh5WKqvRrZ0ESogloMx6OGWiox2QoSula/U8JcKTS+eMeTvyG7nXKUoIfxwHh01hnJDWPtBw5RM758kdjrrT3w0sZWa0hfCkiO2nAZjQ/2a6bz6BmFuWciD4rGPQ0Q/NGNbg/T6OR5U5jWIjbFvA8LnNHsRDeYRDU4js/6OwYJU+6zAlV532+y0KZGN0ID24PpXM5YwPQeA6kSR2zT6L+eRBlKmt4/wVFQwcXzHLv5D+4uh9kxDXl1RLnYddTPbn74n3bSMAMZC+UimHCwYvBwsE+/uwieB0+wGd0ZM/i6RCKAe4WzAg4e4zvZhjTyjdiVI+jqMuxUX27o9+sOBBOxlUd6bBDYboWlNIHgGFTv+hiY6EbT5BWoakrsL8NHaiiyYY+LgPsyqumtVOgVQbk44fYRqrwE8WfsYvOy+g/JD296cdnDPmEi3kz56+l0VuaIw5S0lCrr0FwbydrFzWsfYaT/GrK8pqrXwPhMzUdRl39rLIs0ILN1b8p+9l/O3l6RN5FypKjblHHEQQvaNuEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(478600001)(66476007)(66556008)(54906003)(6916009)(8936002)(8676002)(316002)(6486002)(966005)(66946007)(41300700001)(36756003)(86362001)(31696002)(6506007)(38100700002)(6512007)(5660300002)(4326008)(2616005)(53546011)(2906002)(83380400001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlVsY0RkQnRoVGNKR2FLcUZ5ZU9BeURVbjBkMndvUUNUMlB3aWtIS2xGMVF3?=
 =?utf-8?B?ZDJUUExwMjIwWGpTRi9sWlpHQWZJT0dqcFloM3ZoNXhXQnB0b3FYSDRCQXg1?=
 =?utf-8?B?STZmQkJxc0t4VW9Bc24wT0hCcVpmekZOYjlRcFVhbS9uYnVnWS9LZmlZTEJZ?=
 =?utf-8?B?eE1ZZmVJMXdOQStwNllvSEY3VlJBVUJuMFlyN0xIcVBrWWVNYUV6dWNGS3dE?=
 =?utf-8?B?eW1lVy9vZ3dvSnN5ZGdBK25Wei9vVkR1VkZjdzlxK04rd0ZQbzlDd24wNTFF?=
 =?utf-8?B?V2dQUENKSXh5bHZJZWU5VWtsTHN6ZjEwQVh5cFVxam1LT1lQNmQwaE9qMjFl?=
 =?utf-8?B?VXVLRFVQeDBCbkR2NTl1RmptR1MrM3ArOHd1bDhORG80Vm1zcjBCVmduaVd5?=
 =?utf-8?B?WWRGVlNBSU9NaURWN0FuRUxkSk5VUHVuLy9LVEJpMWtXM2hKOEdyTHYwOTVG?=
 =?utf-8?B?STRBT1RVYm1wVGFmRnRyNWZ3ZzJpZjM0YU5zRU1YUE8reXF6NDR0c3l6Q1c1?=
 =?utf-8?B?bmFBTnkza01RdUlEMEZIV2EvYjlGOWtmMTEwV3Q3MUp6dFJSQVNwU3M1WWpO?=
 =?utf-8?B?M2lPZkdMRlNOR0V1OGp4aTlmejBXdEd5cVV0cGpFS0NJUGNmRm1VTXFKMm9v?=
 =?utf-8?B?WWJwYm1LeExySTRZamlKSWN4aHFUK2N5Zk0rR3VwK0NEM21xM2sreEI0YmZa?=
 =?utf-8?B?V1BES2hITUZrQ3JXdXhBVkQwNDJwckRBSzV1aVlvaXErbUV3SWxNbmpWZEQ2?=
 =?utf-8?B?eVhVYUhWZ0RQU3VxNUhqc3ZSRXBmbmp1cmhmME5LY3gxY2NhMVhqU05TK3FE?=
 =?utf-8?B?WDhETGNXWHFqUDlaQ1UzUUtxZ1h5RW9lQ3FtUnVHb250K3Q4UERaU3p6YWJt?=
 =?utf-8?B?RnUzeGpqUENacitGbUtjeU9XZUppQ3FVZzlRMXJtUUcvSG5rOUpIdTVDYndE?=
 =?utf-8?B?RXVZRXVMM3o1bFVtQWgwdy91eTEzYlhuU1dFbXRDOCsvd3BTQVl4ZEkxb1JL?=
 =?utf-8?B?UkpoaEhyZGFuY3Ntdk83MTRPU1UzK2RGRnVSREUvWnMvQ3k4TWJyUldkMWtD?=
 =?utf-8?B?bnJONEdJM29iVnhPOENrUDM3TnpiOXBka0JURzNWbSswNUNvTGdka0VsbG9D?=
 =?utf-8?B?NGs4WnoxSmZaK2QzeDRwcmprY016NWtjeWNSNFpHQ2x1b2VFZjJkeXExN0lm?=
 =?utf-8?B?TzhqOGRpQlBHY3hXTGpiOXVSeXc1Ynk2a05wT3VxMFVBS0x0L2hScU1TL2lZ?=
 =?utf-8?B?OGZraUIzcG9UdC9COVpxR3BVSk14WFhWOXcyNlBuaEtoTm9ySWRQaExZYTR4?=
 =?utf-8?B?dXVVY3BoNnVDMlJIMk52NWszNmovY3VDQmFQWTlpUnk1VWtOUWkxa21SZVRB?=
 =?utf-8?B?eGlpRFhCK1hQbVV3K0hXeklUVUp0K1VLVlJYMGgxZFRIaFJmSUhkS2h0YmVQ?=
 =?utf-8?B?S3ZTY2ZjUDh2bVFLUFNqYzlsU2c3b09HZEh5YXJVQ2dqWDBocm5RbjVBbHZz?=
 =?utf-8?B?MFFIYnVQc3dzRFJzYVYyWWpaazVEc1ZGcmk2Ujhjci9QMWVUaGMySlBkM3hx?=
 =?utf-8?B?VFJpRDhoWGZLd0RvYmx5dDgzZnNTYUZ1R0NBckg4cXR5bmtUL0tZclJpUzJ6?=
 =?utf-8?B?S2RmemNCMDN5bzVLNGJoRWxPSzkweWxmT28vbWUvcWVzV3VnUDZ5ZjY2N2FO?=
 =?utf-8?B?ZW0rc01hOXR4MHM3eXpldmtWOXZjMTArQjB4TjFMOGtzZTd6UEpjQ1Z3ejdH?=
 =?utf-8?B?RWV2VGRLWUM3Wkt5dmhuM0NoOG1BdnQ1dUYxdzBld3FVYmFsWllaYjYvZmxh?=
 =?utf-8?B?U25LVGpaSnhnekVzbnpJWjl0ekVhdWgyYmQ4VklsSW4wKzlrRDhqQ2ZPRklj?=
 =?utf-8?B?ajE1Rmw4VDFER3pKTE5IRU5HLzFOL0FoeVZUN1FjcEpERHNObkF2SFRROWlt?=
 =?utf-8?B?eElpbGdCell6d1NiemJadHJDSUNYZzJVL1hKa1hqUlRhMCtFcjhjN3k0RXpE?=
 =?utf-8?B?OVBQeFNQY1ZNZTNGSWxpSHV0UGl5VFJBeEhGWFJuekFCVlN1L0xZWHVUVmtD?=
 =?utf-8?B?RFp0UXBocStOTVFPblpEOWE0WS9KTjlVWTAzQU1XZXd5RlArYk1YSlRvYnlR?=
 =?utf-8?Q?MCqwwTv5c1Mjz2j8Wj+q1gN35?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5fdc56-40dc-4d1b-35e8-08dbd16eb6aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:16:04.5467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5HOgFnBWpT9qV+jhGYrs1IFbIqLgklv8l1bP2EjX1lQ7yTF6qAyyBST4g5m7p8rVlTqE5sfgE1ZKPp7zzWayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8702

On 20.10.2023 12:53, Roger Pau Monné wrote:
> On Fri, Oct 20, 2023 at 07:53:51AM +0200, Jan Beulich wrote:
>> [1] specifies a long list of instructions which are intended to exhibit
>> timing behavior independent of the data they operate on. On certain
>> hardware this independence is optional, controlled by a bit in a new
>> MSR. Provide a command line option to control the mode Xen and its
>> guests are to operate in, with a build time control over the default.
>> Longer term we may want to allow guests to control this.
> 
> Couldn't we just expose DOITM in MSR_ARCH_CAPS (by setting the A flag
> in the feature enumeration) and handle accesses to
> MSR_UARCH_MISC_CTRL?
> 
> The complications would be with the leveling of the feature across a
> pool, as AFAICT the bit needs to be OR'ed rather than AND'ed across
> hosts.
> 
> It would also then need some special handling in order to allow
> reporting DOITM on hardware that doesn't have the feature (and writes
> to MSR_UARCH_MISC_CTRL won't be forwarded to hardware in that case).
> 
> From an implementation PoV we might want to treat this as SSBD, and
> allow Xen to run with the guest selection.
> 
> Anyway, likely much more than what you want to do

Right, I understand that's also the reason why a yet more minimalistic
variant exists in XenServe's patch queue.

>> Since Arm64 supposedly also has such a control, put command line option
>> and Kconfig control in common files.

This, implicitly, ...

>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
>>
>> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> The only concern I have is with the Kconfig and command line options
> being named DIT instead of DOIT, which would be what I would search
> for given the documentation from Intel.  Maybe that's for unification
> with Arm?

... relates to this: Supposedly DIT is the name used there.

Thanks for the ack.

>> @@ -187,6 +190,18 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
>>  
>>  endmenu
>>  
>> +config DIT_DEFAULT
>> +	bool "Data Independent Timing default"
>> +	depends on HAS_DIT
>> +	help
>> +	  Hardware often surfaces instructions the timing of which is dependent
>> +	  on the data they process.  Some of these instructions may be used in
>> +	  timing sensitive environments, e.g. cryptography.  When such
>> +	  instructions exist, hardware may further surface a control allowing
>> +	  to make the behavior of such instructions independent of the data
>> +	  they act upon.  Choose the default here for when no "dit" command line
>> +	  option is present.
> 
> I would word the last sentence as `Note the build time value can be
> changed at runtime using the "dit" command line option.`

Oh, yes, that's quite a bit better.

Jan

