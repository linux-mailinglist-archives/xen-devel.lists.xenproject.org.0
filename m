Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD55EF690
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413783.657672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtaZ-00047l-MR; Thu, 29 Sep 2022 13:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413783.657672; Thu, 29 Sep 2022 13:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtaZ-00045k-Jp; Thu, 29 Sep 2022 13:28:31 +0000
Received: by outflank-mailman (input) for mailman id 413783;
 Thu, 29 Sep 2022 13:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odtaY-00045e-J2
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:28:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a6851a4-3ffa-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 15:28:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 13:28:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 13:28:26 +0000
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
X-Inumbo-ID: 9a6851a4-3ffa-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU1VjUGyM+BFKosLL2/szadoDW7tvBmUW3Z7YhPNpq/9ombWJnXYnAD3tOWxsepDO9IjJ04AuZj6iZE5U+H6sdMrS9AEKvhPFT3GMADUKtf6XXKUPqWDzvXrTfHY2fwLKefPHzotJqhpdf7p5W6sevYO80BgAtTEQ6WWqw63EfeIAJfwf/13PPuaNlezNOAqyHP4fJvYVhYhAy1Degtg2ZL9I/f3xXf/MP+3Tx3JB/YvPfFHmV4+mhqSYKvDwfFcygqOqttlIiCOOOXtRTxEgu+h/QxwRZagdzCst87UFlnEAw47L12gD5XJFsh2dZPT7PPIGPAEQ+/zcwUJ/Slk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz5ivruGwQ7eYnIntAddcPznpIkbdaPX6SM0pE+4IHo=;
 b=kcVgtXOsAqwMVLPkVfRRqTQ+tiE3Xa9q4htv30Y3/r8dgKuMvyyNyEb1+yEe717Iu/i4n5fXoVehGisoFL0akOgjiQfh8xVWQY1VnKDBYYHMhcrl5iUzsM15YxbT+FMd/wTWjEFWmHq8r+li5Lc7o7DIiON41nEIoabGf9jCwfVi807UBjH+Pm83S3hQAwpUxwZ1gDNgsDR0u+0NlcBVFtAmHFQ1S41A5TMnXMccCvSi9BOwdiBw2AvIbNB/hMjbivHz8RyGk54vOIZMyxz6DjSKXp/LJXCh90r4LEq/aB2EAONTpo1f3vysNdUNBeW/rBCUXnxCpThMYT6hAkIbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz5ivruGwQ7eYnIntAddcPznpIkbdaPX6SM0pE+4IHo=;
 b=0PoLODgE1G8DlBG65+3CzGHGwIyneBSFw07KWYcvxZbuMl6NjhiwfZpXyc4pzIKwVxCpNuP/K4bN4dVIkzzSvXVIhcWbVM6VaPfzRx8ODcUWHxajgMzaPcfzRh+vi1izDW48+9XtoQDiaLkemiZGL6lmdk/BGwRSrrj3//Rj73XedX/hmM9LbjJjYMIzrEiNgfWiCLiuMr9hXAQcm0+9JXcvoAQI0erD4UnuBGb/9ohZyM9YW5TP0JRJx8k+FZOFdH21y2qI1py/JAzQqbh6r2lQ7lbA3iuFH9QC3TQfqm9Y4YEovPuwkBrRm/d/+2GnX9WKin8e9T3Ip0P13mvdeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfad5752-221d-dd53-7847-90d79da08962@suse.com>
Date: Thu, 29 Sep 2022 15:28:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: Proposal for consistent Kconfig usage by the hypervisor build system
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0057.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba79a6d-88ee-4f91-1a25-08daa21e7d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ti+sL+gzFykRBnI3F6xJmDS5WBDNGiUwltMbuRPr7MAnNYy5ESvxGL0pAtq4wnLw7HS0uli0eGp8tcqnvyGxZdIzUcxSHpFuF1lHOPViAsAHercOFcHK50uHGgF5XwxueIqs5qU2Ka5Na993AllTojQWpWJXrG2XMmUFnLiuhCPqQpJJLXW6l6Lo0wGMECKmOjsfIAOXay3Foy3pEOnqillrIYhG+saBFwGM9TpBe+Diitx/KvXNADnLX/Y06nJ4zm5d9Foxdzy59TpiMmR8sT0ln5T8AqrUS8R6bUZbxbEmY8Bhn8C6IrSeSLK5ZEw+1ZwgtbxlMCThIYwo3nMZge69hKe9fpFtnZr/bpmcbM7G8ymzXkEZA7XBuLBQekSQWfHdP2hrDPDTUWhzGgmzBQ3G16IAUcRjCUM/DblT35JElmAE3SQP9+K2Peng+MyeOjpPovXJDrV8TCqD023Cf/cSbgCEbTEzT8IY1FhbKlk9SnIM/7hSpD4yxvp5XrkHTuC4hXq8MvCW6QUDXc2QPXLPhU5pVnlJzKrVYWQ3dNvUY20MJ2XTrLAFRq9dcGHJgXpjMPW6KjTW3UzSvcby3WmjjaVxtIOamnjIZl23GPZI6BZAF3P0++1z3/Y57Qr5GLPa7OBtfb8dp+L3hRoPeOxo9G0umf/KWlPSPSqk1DrJXnvOgkDrSL6rnyZoNg8JtirsOUpa2bJGR7pKqdtM/KREj7YYrV+8cucIVGZXizRLOUKRHRkzBsZHwTodaWOysqR2XWlMBdZTq8M/IlkgAwI2y4NNi2K7C0DedQbFDkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199015)(31686004)(66899015)(36756003)(5660300002)(8676002)(6506007)(41300700001)(86362001)(31696002)(38100700002)(83380400001)(2616005)(186003)(478600001)(6486002)(6916009)(26005)(66556008)(6512007)(66476007)(8936002)(2906002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzdCdlhtYUo1c3ltV3VPWVlGRG1OdElIdFRua0ZaMndTamw4UFVkeUc2NnU2?=
 =?utf-8?B?Y2R1bTJMK3A3bzlyOFBhNk9jdzlNOE9ybm9rZ0d4cmttaFJpVWhDVVMrN1BW?=
 =?utf-8?B?Rm9PVFhUZGNZdkZRRlFIcDNWWlZjTW8rQ0F2MmIwV1Rya0gySFRiUkpPam5G?=
 =?utf-8?B?eXZMMVphS1AyZXJYODdJY25ES2tTam9XMmFaVjY0R2h1dU03R0RPbTVyazlH?=
 =?utf-8?B?c2RoV2tHL2NsamQxS0xWdnk4dE5HRHdRTVZrdktoZjNWTHp0aExKeVJmVys4?=
 =?utf-8?B?THY4NmdMZ3ZWRHE2NU9tT1lLRklxQlZxQ0tWL1VTR2Q4SU8yQkVaemNTTG80?=
 =?utf-8?B?WUgxME5QYzZ2UHVRQzdQalJvSzhQNzA5cXNDVkJMdk9mYVF1SE1VWU83bFVl?=
 =?utf-8?B?NllMUXJMUGVxSmVUZit1NFNmWmhRMTlEYUgzdVlkOTB5bktILzltaXQrbVFR?=
 =?utf-8?B?ZTNWbDVPNDFUeW8wMGFabWcwOW1GUnhnbk9xUkJNNWZaNkVIL05Ia05DUnJv?=
 =?utf-8?B?dUhqRjl3ZGVDQ1hEQ3JjcDU5RGlsNXhZZXFrb3pDM1dyMURhZ3dGQWF2TS9s?=
 =?utf-8?B?TFBWUGpPWlRQYllTakF4TVVIeWlaZmZKUnIzQlNPS25RMWYvWG9KRElRbTZh?=
 =?utf-8?B?S2F2Y3NsTTM1dWFwclJDaVl5S2NnNkFyZTNMclNub1ErUFNXbWh6K0JCVFND?=
 =?utf-8?B?LzV5TlgwTC82T2ZGcTlPNVVVZmhLNlpuU1BweUVIUXpXSTZXanBjS2V5bkJQ?=
 =?utf-8?B?bDBoQ0l4R0h0M3M5MklEZlhFUm9QckhVNHBxMkRpK0ZLOWd5WnZJZWQ4cmd5?=
 =?utf-8?B?QTZJblliU094cmEzeDRRRHRSQmJhY2pOMjRRdmVrbTlPamZCbHN1eXVva29h?=
 =?utf-8?B?QVhsTSs5TFJISHdjQTFjNDFWMTErRWFFQitYYzF2elppaDNrOVBOUEdyN2px?=
 =?utf-8?B?bFhCa3Z6dUxQQmVVbk5GZVF6ZDhrOTBLTHNUemVRa3krVmh4azJLa2JrTlNx?=
 =?utf-8?B?SWJ0Q0hzUWpzdlhiY3RsamI5L2Q2bGZwMU5HWmVLYXgwUHVBRkhMK0srMUhw?=
 =?utf-8?B?MFdVY21Dc1BLSzBvenN6eHpKZVNZeTBuRW1UR1p4S2VMUWE2M0Erdk9qNXNs?=
 =?utf-8?B?VkpXdEJZMlFPaDRCZFN5eUMybkUxT2lnWURRcDlZa1ZndEwwdFUzYWhxUEhL?=
 =?utf-8?B?U3ZteURBRlQ1WTcwbjIxRzlaZHNuQW9TYzlwcDRUcElJc1FlTEtOaWY4WjND?=
 =?utf-8?B?S0ZrZjhaWHlXckFwbVpiK1JHd0plV3FTVERRcFk4TjM0MUo1MElMSGlCYUpB?=
 =?utf-8?B?bVlIY2RHWFZHUk5LNFVDU3FmV0Rwem4xWXFkMUh3UzY2cEo3blZnSytnaWRR?=
 =?utf-8?B?S0pneDRSdUxjWGdoWlJYVDFBcWlPc1V0eU1QZWkyQWdMSTNVR0M4ZGVzWUU4?=
 =?utf-8?B?dU5qK1NJaUcrQldkSkEydWo3NE1CQzZXMjA3bkVHbHdsV25nb3FMVDZ1bFJS?=
 =?utf-8?B?T0VTV3dxUERVR2tVSTNmMHo3bGY3MXZEWXZnZ0VDVFgzTG83UEFGSER1Vi9O?=
 =?utf-8?B?YVNaS2NVMldTY3JzMisvbGMyOTcvTyt0cnRKUENBMVpqU0I4WFprMkw5ZmJH?=
 =?utf-8?B?dHdYZk1QT1c0bDh1TnJiNU9PR1ZMdEU4WHk3VlFSZnJad05uMWdOVVIxQnkw?=
 =?utf-8?B?dE1jYkhDd0J1OUxsZHlLVTBMWFZGbDZYUTR1aFo0VE9wTE56UTZwUmxYUFBS?=
 =?utf-8?B?b29NcXVzM3hxRmJBS3hzUjJGdWhzSUJESEhVNXBQaC9jWUhSbkVjTmtkWWFk?=
 =?utf-8?B?eVphU1oybjFwRGRvU0M0VU5WalE5UkIxMUVhazM1dU9SVVlVeDlhcUpKbUxI?=
 =?utf-8?B?UG5FYmNsTVlGMTBKeCszWUFVWGM3aEFJb0RPN2F5RW1aMjZPZ3UvRVRDQ1ZT?=
 =?utf-8?B?ZGZGQ043S0h5WENBR1VDdGdDRG12cm9GVFBJa2xpQ2tzbDAyaEZ6WnVXaldn?=
 =?utf-8?B?SHR2Q0NpSS9jV2ZGZFRoUzhuOWE4a2c4bmxHVXp5QzZXbk0xYTFvMVlDMWVO?=
 =?utf-8?B?cHBzQ0wvcnNuM3c0NzcrRitaMkxaV2NMdU1ZOE1mWkdGLzVUZ0lHVTZ3b1Vw?=
 =?utf-8?Q?F6kkcvmTP3mmzcvviE3eq1aA5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba79a6d-88ee-4f91-1a25-08daa21e7d7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:28:26.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfpr/xna2DGCpu06QPglGiH5sw06/zalicUL6gwSQwQPHOqtAhp8Tw2D1NFuUkmAKzwK4H1Qq3dB7Dmr4G7DSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781

At present we use a mix of Makefile and Kconfig driven capability checks for
tool chain components involved in the building of the hypervisor.  What approach
is used where is in some part a result of the relatively late introduction of
Kconfig into the build system, but in other places also simply a result of
different taste of different contributors.  Switching to a uniform model,
however, has drawbacks as well:
 - A uniformly Makefile based model is not in line with Linux, where Kconfig is
   actually coming from (at least as far as we're concerned; there may be
   earlier origins).  This model is also being disliked by some community
   members.
 - A uniformly Kconfig based model suffers from a weakness of Kconfig in that
   dependent options are silently turned off when dependencies aren't met.  This
   has the undesirable effect that a carefully crafted .config may be silently
   converted to one with features turned off which were intended to be on.
   While this could be deemed expected behavior when a dependency is also an
   option which was selected by the person configuring the hypervisor, it
   certainly can be surprising when the dependency is an auto-detected tool
   chain capability.  Furthermore there's no automatic re-running of kconfig if
   any part of the tool chain changed.  (Despite knowing of this in principle,
   I've still been hit by this more than once in the past: If one rebuilds a
   tree which wasn't touched for a while, and if some time has already passed
   since the updating to the newer component, one may not immediately make the
   connection.)

Therefore I'd like to propose that we use an intermediate model: Detected tool
chain capabilities (and alike) may only be used to control optimization (i.e.
including their use as dependencies for optimization controls) and to establish
the defaults of options.  They may not be used to control functionality, i.e.
they may in particular not be specified as a dependency of an option controlling
functionality.  This way unless defaults were overridden things will build, and
non-default settings will be honored (albeit potentially resulting in a build
failure).

For example

config AS_VMX
	def_bool $(as-instr,vmcall)

would be okay (as long as we have fallback code to deal with the case of too
old an assembler; raising the baseline there is a separate topic), but instead
of what we have currently

config XEN_SHSTK
	bool "Supervisor Shadow Stacks"
	default HAS_AS_CET_SS

would be the way to go.

It was additionally suggested that, for a better user experience, unmet
dependencies which are known to result in build failures (which at times may be
hard to associate back with the original cause) would be re-checked by Makefile
based logic, leading to an early build failure with a comprehensible error
message.  Personally I'd prefer this to be just warnings (first and foremost to
avoid failing the build just because of a broken or stale check), but I can see
that they might be overlooked when there's a lot of other output.  In any event
we may want to try to figure an approach which would make sufficiently sure that
Makefile and Kconfig checks don't go out of sync.

Jan

