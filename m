Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490957AE746
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 10:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608334.946746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql314-00080c-O3; Tue, 26 Sep 2023 08:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608334.946746; Tue, 26 Sep 2023 08:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql314-0007zo-KF; Tue, 26 Sep 2023 08:01:58 +0000
Received: by outflank-mailman (input) for mailman id 608334;
 Tue, 26 Sep 2023 08:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JCSl=FK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ql313-0007yx-5T
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 08:01:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5bd8c7c-5c42-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 10:01:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7349.eurprd04.prod.outlook.com (2603:10a6:10:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 08:01:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 08:01:26 +0000
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
X-Inumbo-ID: f5bd8c7c-5c42-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czJHwZWHF2Oga8isTfp4YLRbJOq+yMjdB3dgI0ZNbhWMImI7eEQDbJWBCBlljbhD044QSrGousdwUE7yxp8SsxfA7LurT/o8F8vVMuTqoR7RhVPEPRi0B/mz5q1sWjBDj11/VRuQTX3kDGRy54v2La3fmzSxTPoxRr5B1/9pSNSifCCdg2mdCyI6re9CBJSPBbGq3TaUnPz+mNpA7TW9xdyj9INfEEEMlg7tdGHaOPz0BezcDWg2GoZX7NILtUTl2XAVNcn4ifECh/8GF9VqfXdHnn7rYsXoP/b5NnPRSuHBFEb19g/5j1PkM8g5jHsca6LMOUSZQvrA14aOkaBKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FudZQePvgs9CA5NpfnESJTSjbz9cXCSJKiDPyLviroY=;
 b=ed84h5CIAl5vV3A7Q8+VRR407oYKTpiSmneFDdnt28xyG0nKfB2g85K7mWeD6/Gzal3X0JOoMWO5+vzhnfL/l+DMYSDoasBFN63y5ps+kMmlGpgg7zpA9sk1npSmQnS5hVadEWJ+9EuV9lIjLT0et4zp6oTFtTjjUrKTS6IELv6aQnTEULgkZrfv2W0ApRyMeKULO1xXpjuzsxb5WwUp3JXVpmpgQXiXI0ZIAumysHLf32S6mukYGjWtrBDRFD1jMXxv4XJazT0OQxeLx8tj3kNyM8kHuLxejAloR2ozS4vlIomqrL+dWFsnU9HlKbT2FNFhkVNssLhi2n2U5M7H2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FudZQePvgs9CA5NpfnESJTSjbz9cXCSJKiDPyLviroY=;
 b=Cc/JACSqt2V9tmmIt6UbCk53cuhgVrcXp2bbBk8QFP1yImQDGuMkab/6eVDCNZXI4g3BVGwm8e2JVslQYlWlxg6s3YSxMCoFpXvXWNxGKqfZWadxmgXp3mHZGRbEl1X5On1VYOOHHLiqBnV3uodAQ92oK/r3LhLjilAP754s2A8K66zS4zixzYsBZJZxWUCk+WTIz7RLjMGObbX5Ag/FJvkG2sHGOJxsMNoMJxaEYsnmO9xr80PCOzQiamkGIY49YGHUDw5YW8tiqGK84BBoE9iFloCpVWz8SLrNpEzXCsWItGmOMXgjBcd1C1WXdU3Qi1MuQliFIapASL4DVmwh/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <729d4ed8-f33d-f7f4-ddd9-3d8e91671474@suse.com>
Date: Tue, 26 Sep 2023 10:01:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
 <0be1e32f-5600-7b3a-8d72-84297a1ebee0@suse.com>
 <DE6F0412-BF5A-4242-9D08-521034F509FE@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DE6F0412-BF5A-4242-9D08-521034F509FE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: df8d98f9-d70b-4d61-4627-08dbbe66c87e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DToZytHncWuDnKm8A1MIxZWAti41jW18XZdwUHTQemqNA49dRjWh060tfEXow0yCqeUdOg0r2E0uPGWOv9lJ1EZelNmkFf4ZEfhwySi1OJmgrNrwn+keBmDDmgnE8WhqdfUkwuiiTaVSs1/Fecnf1UHfvH16Xi8C+gpJEWAgHy7zMd201UPdj9ERpVHz26QsdycrB6HOtgOoVOxO1r9OcVazDG1ejCnlzs8BAcp1H24iTy58mPz7sF4cXEFOwjrm7UQ76cwxJENawZ38iy47LVDw7Re5rOaDqcZYlp/7sC/4QAeVlWvTuAj/MhbNxr/lbausmFP34Lwkpy8666Qbdt462yKijOMqkAVrlsjNssngZjWPa9KEhQE96+QpgWR+I2ZEZYd7TVAQcMUxOvR9Bb36rZb0CszKZ3ZtcjWQ+zvsW3LEXCA6L0TEf0SOLJ4UG70TxVxFKG66Y42E6Z+xSGtOre0gz5/G3q8tP1A45S86b0nAuQZgyoaQrc7um8GBdWVpwGaAiiTOqBAT0mvxXc6jGDQjzliPbHAXPSmA6rvM8tZNFT4hkBmJ3W1kn1h0iq2fGld8L1bwZrHTtib2D7HRVEUpu4SZ93euePfXO3y+A2rds82/Q64JdwcNBzh+VvsNxxh7K6H/P/SX3/Je0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(230922051799003)(1800799009)(451199024)(186009)(53546011)(478600001)(6916009)(41300700001)(6512007)(38100700002)(316002)(26005)(2616005)(5660300002)(83380400001)(6486002)(66476007)(66556008)(6506007)(966005)(31686004)(54906003)(8676002)(4326008)(8936002)(66946007)(2906002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXYwK2VDcWJpQUhtSGxvczFVWjE1d2RraU1mT0FpeE0yaWcwS3l5V20xUUdw?=
 =?utf-8?B?U2I0T0ZxbDEyZy9WS2ZzOUlVSE1OSWhrTzFTNE1xbGVtWXdIME8vTjN6TlZr?=
 =?utf-8?B?bWk5eGRydzBVQm05UWR4bFRydlZxTzN3R3lkc081cTFFQ1ZMRUlSeUJtY3FC?=
 =?utf-8?B?TWFxTFNrOUpIT2E0NjZKZWlFYVhPNEw3SVNWTHdKZWtEWDAyUEVJSGVZSjFC?=
 =?utf-8?B?U3pnNThESFRNZFlFTWtEYTBobXBralB2L21lVU10Z1JRRGJpMFozNG9WZkNk?=
 =?utf-8?B?UlF3cVlTVkxmRmVLQVU1dVV5ZXJXbXBJalpaN2xNYzQxbUMzcjI1dWRZYmRB?=
 =?utf-8?B?UUdkYU5RYzVnR2UrT2tsRWxZOERRMkduUWJxN1M4QmZWaEx5TXI2ZzFMZU9h?=
 =?utf-8?B?ZG1rcm9Ldmk5VzZBbkdRMmpuZmZFTzdzdk8xclpJMi9mTTE5TEhVTnpBbkZT?=
 =?utf-8?B?a09pVFlBcFVma0ZLR05UdVY2WkF0WXhUV3hqR0RMbDMyRExXY1MyamJkTGhH?=
 =?utf-8?B?YXNrbkJmajVRRVhwQm9OV05qdTdQNjkvZ0RtUkR5R2U5N2J5S2xJeWEvOUhx?=
 =?utf-8?B?YjdHYTMxNlZwSVRpTVp1VFRlSU1XSGZSNmJzZnhiMTdvRzlUMVNmVzhVMUpm?=
 =?utf-8?B?SFo2R2Nma3UwV0h6MVAxNE5zSXFycm9XT1N3QkdrSTlPMGgxZ21DZU13WEpq?=
 =?utf-8?B?WVZFRWcyakV0WkVrRkswMGlOZWpzaTcvcWx4eGhkVUIwalcrcmVBemZ1a1Vy?=
 =?utf-8?B?aVZxK0M2TlBvMmFOeVUyeXVYZTgwbkFENlFnc25oa1N1azZueFJWVVQ2RWhq?=
 =?utf-8?B?RW5hYXlVUXQyckdYcnRCWFZWdkk4Mk5CcC9HcWtrbDVXaEFtRE1HOVVkQys2?=
 =?utf-8?B?ODN0TGxORFpCcXBDd2ZEOW9oT0lFNVpFNmxrWEM1MkhqZ1haazA2OVlTc1lu?=
 =?utf-8?B?djUrdFV3NjBuZHZscmdEeTBQaWR6dXo3a3h4WDZHeXhSeG51YzBoZk50TkYr?=
 =?utf-8?B?MWZyZHEvZGEwWHlCYWFnZzlaSGFBSU41N0pYbFN0VWF1WGYrcC9rSHJVSXFz?=
 =?utf-8?B?TDdsQmllN2t1a3IrNDNERWVnZytONHR0L3NYYXlwZktGVUxFTmhhR1RQSkx3?=
 =?utf-8?B?WmxDM1l0dldzWStjQzRHU0xNdE1TVUs1S3Z2MzgzakJxbENsMkpDVEJGcFUz?=
 =?utf-8?B?RkJkTVpBejdYT2tWT01SWGZSNFNhSk1Nb04xd3Z4QWRTYUYxYXk1RFdYQjZ3?=
 =?utf-8?B?QWJkK05zVWMwaFFvTVFhN1lWK0lyeDFEZnJaamJ3aDk5RWp4WjJIakpKWStQ?=
 =?utf-8?B?ZjF1T01heWx4NHZPdFhLSkRXbE8vL24vMFV3L2JKd3NHZGMzZm1oUlR1M0RC?=
 =?utf-8?B?R1pHdTh3QUdJR3I4MEROYXRNNVpzNkE0VjVHRzM1aVpzaDV1RGZSbFFzNVBt?=
 =?utf-8?B?Mnd1azNVaWRiU1VHS2RxZndIMjV3emptWmVhK3JrMEhQZk4xMG1HWmRIUmdo?=
 =?utf-8?B?WW05RUNrWEI2T2ttSWZrUEdrdUd5bHNJT0d3MGc5QVhqVDhmYk5ha3d2V2Qv?=
 =?utf-8?B?c0VpMHppL25ZU2VNV2JQZEIycjlrMFY2ZXh0WFZuTW1tT1I3dHBYbkxsYjJ4?=
 =?utf-8?B?N0VFWGYzaHJsclVTcy9XWVFudGJMR0hacG5vTkg1RnFaakxvME80SmVOSFNq?=
 =?utf-8?B?aVNzcnZicGZaZjlCaUFKMnFtM2N6SGVmbWRLRHpiMmIzK3c3aW9kT2ZxN0hG?=
 =?utf-8?B?Uk5QZUYzcFJkYzhpci96RndNbkNhOUQvNXN4d2FBejR1VCtWaW05OC8yRmpi?=
 =?utf-8?B?Y3owSFNBdFl5QzFTK0hhamlCSFZYQ3hBakpmejZQb2hqUk9XU1A0a1M4OWRm?=
 =?utf-8?B?Y25NOEpZVENhVDRWMms4UEYwdGhhelpqaG9lejFYRE1DbklzTDh0aVFYNi9X?=
 =?utf-8?B?V3FWNGZPL0R0RjQra2JGc2xSYkw3Zm91Qm83K05OMTg0Q1pzYXVsb250VDVp?=
 =?utf-8?B?UzYrcGhVaU41UzhIQWRIYld3SkRkTGVHZzV3SHRhdFd5N2FKL1R1Zmhub2dv?=
 =?utf-8?B?aVFLOVhoeVhDVmJGZVI4Z2F2RWxUSFVrVG9aVEpjVFhkZThSd0IwbmdmcHo4?=
 =?utf-8?Q?rLDa4XdJ62XW9g1eEhwnHKM8l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8d98f9-d70b-4d61-4627-08dbbe66c87e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 08:01:26.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdEtIW5cdCFdYVgVEKTqRrXSBjYOZIin7qxG/HQdcRRrsd9d1SZqcBY/xLsKd+Ps8bm/ahQuF2xkzxlYFjLqJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7349

On 26.09.2023 09:58, Henry Wang wrote:
>> On Sep 26, 2023, at 15:46, Jan Beulich <jbeulich@suse.com> wrote:
>> Furthermore may I ask that you keep an eye on the physical CPU hotplug
>> situation? It continues to be documented as fully supported, and as long as
>> that's the case 47342d8f490c (" x86/ACPI: Ignore entries with invalid APIC IDs
>> when parsing MADT") would imo need reverting. While I had indicated that I
>> would do the revert, a patch to SUPPORT.md was meanwhile proposed (which
>> would of course further need accompanying by a CHANGELOG.md entry), but didn't
>> really make progress since then. Yet I also didn't want to "needlessly" do the
>> revert ...
> 
> I think you are referring to [1]

Yes, that's the one.

> (and a proper CHANGELOG), I added this to my list
> if all people involved is fine with this patch from Stefano,

Iirc there were comments on the wording already, but no update to the patch.

Jan

> we can commit this one for
> SUPPORT.md and I can probably send a patch for CHANGELOG.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2309111534030.1847660@ubuntu-linux-20-04-desktop/
> 
> Kind regards,
> Henry
> 
>>
>> Jan
> 


