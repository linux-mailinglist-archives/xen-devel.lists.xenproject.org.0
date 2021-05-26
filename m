Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DF391249
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 10:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132381.246949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llotA-0005Ld-UL; Wed, 26 May 2021 08:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132381.246949; Wed, 26 May 2021 08:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llotA-0005JR-R7; Wed, 26 May 2021 08:27:40 +0000
Received: by outflank-mailman (input) for mailman id 132381;
 Wed, 26 May 2021 08:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1WN=KV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1llot9-0005JL-NY
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 08:27:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47b1e1ff-aff4-4265-9059-ec2f932c92d2;
 Wed, 26 May 2021 08:27:37 +0000 (UTC)
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
X-Inumbo-ID: 47b1e1ff-aff4-4265-9059-ec2f932c92d2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622017657;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aPXm51ioOfNg3iq1pnGlnKn5JyfgPh+sziohno4Pij8=;
  b=Li9aCek3Ug9yH6rkZaoVtW/Id5ZupW64Ajq5RMK/T18bENQM55tzafen
   z+qpio0JLxip3xnQXUShCe4KwyxE32ltgHOGGXwvcBoadnMWjduuEyM3+
   +yDhCuCEjmT1vgUnPlEHHAyIRGzvLhKzJbxlyBT0tKRdgqhTeOlO6KRTZ
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vNrsMMYosXSQaAOWmuugwV85jqyjm8YIygs891IubqenHmPBnLsJFgF1KMluCxduRjUXKA9jAJ
 PC0s/u9wlKdaEf9BgW824FmXiMHOuALPok3+ApCWrNRBBABlF3gx4clJcH8p0T53yWFaJWqsWC
 nvPTQHW8ApoEdCdh6H42BSOC5/5ZOrXHUmBuFUSKsY3OrCu6fb1WgA2t1a4oyKPTv2uOFrOyFM
 ZrxrEi8vYkWXzpIsqTxZ8/GJvFQGC/nk0VYTcn4rWMWsEuhMUlz2llXghxMYbm3kWzhZtUNYpN
 Xpw=
X-SBRS: 5.1
X-MesageID: 45020583
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WhXEZ6iD15l1HIgAWsx/2FcqF3BQX9x13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGZ2IrT0JcjpzencGNTWubqBJcq
 Z0iPA3wwZJLh8sH7qG7zQ+LqT+T7KhruOoXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrGG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRcXee
 H30lUd1vlImjbsljnfm2qo5+Cg6kdh15ba8y7avZO5yvaJAw7TYqF69PFkmhiw0TtqgDgz6t
 MM44o136Aney8opx6Nk+QgYSsa3nZckUBS5NL7sEYvJrf2SIUh57D3r3klXavpIkrBmcka+b
 5Vfb7hDbBtAAqnU0w=
X-IronPort-AV: E=Sophos;i="5.82,331,1613451600"; 
   d="scan'208";a="45020583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcteRxCq5hxo3kCyCVsSPme5Zaem37qLMrQMKZmgcR/H+tFOhxAx0DD74eLFIajlnaS0cBEgGt1IUCsedmTkgWsFgOvI7Ic9fQKDSiP2HAAOt+slUECKTrl+uxHOdahyu48kMNqEWIor19l68hnL3vrrsMWTZpYCTwR57NOnki+DIVU058STv7KOKiEf1ZztObdY9hbktjEbB7MdiAqSQe5d3RIeStg1CEEDLkrY2TGZa+i6JC2qwtyF5Br7bjLaDxly8pvibOko6B3RO72NaNh0QPVkkeb91ilU/z0cXNKzRNnBc69e7Ac2sjUOi1EaYpH9dyVVzXPoxWxpFkTEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ANPmPHPRboAcTnkBdlnMdcKLJEVmTCBN0wk/OrYMX0=;
 b=AH7XWmBn0KbfWsjMtdfW6tUAAW4SiDXbN5UsKldAQnQFvaE3UNbcdtQv9Zz9dapa1JWRtu9GvlyaTkGhSgtOH+apJ5/SbIW6uJmEBVTpWte75KJNLLyyFrTGHnnRldo8OzZbvG1+FtiE3po5SDoCHdj+nSkIHmff0elPh6LigDP9COatkZCbJwdMaF1Qr6/mk6NugbheOOa/ZhdtQKoeoN0+TJiOhf0S90qJhUMwtScDa//2I6e86kPZxxSE/yxy/K+S5me7lCgtQbksI+q+NN/8mmeLlmnjZ1s3ilwNK+8guoWDRQnKGL7ApHTyMbA43+YeIC4q7W5A/jVrCFFoxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ANPmPHPRboAcTnkBdlnMdcKLJEVmTCBN0wk/OrYMX0=;
 b=UjjRPPlDT2oQDtZ38YrlHitUUcpjo5+RiRQ1/Cst+dU8ucA6agBFXxOSXladDs3+6Puobekp9ys9x8lsaorb3FBJvEPa7EZP9mRYnIfUCt/N8uo0Os/V5eOLItMc+63GpJh+31iqZsoURPB6PfwIhEgmY91KvdVwyyd3HrWtuNQ=
Date: Wed, 26 May 2021 10:27:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2] firmware/shim: UNSUPPORTED=n
Message-ID: <YK4Gbz0fat7DRY+o@Air-de-Roger>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
X-ClientProxiedBy: MR2P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 248e7d56-39ea-4933-f282-08d920201c11
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB533936D076E6E7661D5CE3278F249@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8A3Kvlmur2mp/Mtq6MdM/XKT6b29ZehmoNRkP8StLnPw1rNjRPdyTHjjC4J7p1KUcPwSLvL1uIEK3vKoBfJ4aypLGCWYD1uVH6L0dM+z7NmLM9QBlMA/xwMQ6qMicjYBchX1UnfxoAx7GSMXxNastzmn7bDFzRfT+OYsrz8eezWYIYvkjgX+T/VS3zAkrYvb1+p0hMH3McBerLQyhCdOZTb3cZd//eaFTCTWfuetNqGhYXMxWlWxbYXnzxVXWXlezuyrC6I+vm9fXjNB8XZ1a9b6/wvk4nTVRUb5AhgV6R8SitHcA7AECfnwAYOC3xOdwvzFJ86BDSz9iQSznZryuAF1oPrHzSFLiEgBzG53a04wY+b3If/X2Ra+4lode1YONQxD9Qv7x9LpW8/thITwZb66ZejvtED3VsyJABCnkU3wYT6Admwk4KOPyTUeXnR/xz4wi0l+4iKiPDueP004PPGN/OZIi+JwCv53lwOBHs2gPL2ZuKy6GpO5g0k8MDe3o573IEqZsPgsRwrVXbC4mHW1iY+A3/9IRd3PaX92iSkGrWjZZw3cn+ww7qjrunwOdrNF05TYN8g+1bmnemsqVJbLySkUKO7l8/ToFUBcOcUT/UADM61M+r4sTw2dqHrKobheu4hnXwLh181K1TsALQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(39850400004)(396003)(136003)(376002)(478600001)(9686003)(5660300002)(26005)(6666004)(8676002)(54906003)(66476007)(33716001)(6486002)(66946007)(2906002)(85182001)(4326008)(316002)(38100700002)(956004)(6916009)(186003)(16526019)(66556008)(6496006)(8936002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlBhWEZCdk42Z2JBbm5NSm5OT21zNjhsdWRVcnZzMzlrdzl5QXB1Uml4K3Ja?=
 =?utf-8?B?WlZRdE5QcHEwSXFNOTVsUm0yRkorYUxMRGlTQ3ZPaWNURDdkZGw3M0VoSTRM?=
 =?utf-8?B?ZjkzL2Y5RlZsbVB1ZE5qakg4eDN4aVdTeVBFQVJjYldNK2JnZDYzUkwrVDlM?=
 =?utf-8?B?WGtsQ1lIdkp6SjdycUdWZ3JSM2hRZzBHaVJXNndqOUEyTDhFSVd0WkRUVmVj?=
 =?utf-8?B?SmhPQXJpeURHUjFUbi9WQVhnR2MraVVqWmZKQ1lEdjhYbzJuSk83czZBM2g3?=
 =?utf-8?B?d0x6QW5ZdWVodzRiVE1vK1crVUw3ZkMvQ3dWVjFLWlNxRUlhcm4waHlRTGVh?=
 =?utf-8?B?T0FVZmZ2UjlmdjBJZkxuNks5TXIyYk1CcFhOaUh1N2FWc0pic2lQZlhaanQ4?=
 =?utf-8?B?YldSNjFCTTlIeXdXVUpZb05Vd3Qxdlo0MnBKTnI4V2IyOVFRM1dsdDhpRUdE?=
 =?utf-8?B?OFNFYk1RQnlvRytFT2FCRWs5bThXTnZsNWZHc084RS9mVUlvSmtoT0FvQ2Vj?=
 =?utf-8?B?a3pkOERRdHB1Y0xGd2hqS2R6RG55a2M1UEdQb1BCZlRRZU9KTytjOS9oVmRB?=
 =?utf-8?B?dkhSMFhDb0tEL2pXejhUZHhsTXFyTW5CUjdxcVh3QlJvT013VzBTNnJoRE5z?=
 =?utf-8?B?Y0FvUzhrcmxGeXNlSjZEM1lBMHBBVFN3ZUJqOUd4NWM2am8vQXNaQ3FtaHJq?=
 =?utf-8?B?cEpIZHVQd2lTaExBOGp2TmZGcWtPN3FIbTB6SHJYNG9ueDdhZjBVYWZPMzR4?=
 =?utf-8?B?UG1ycWlXNFpxWHhDaEpYZjJxWEc5aFdYdkdoOGFMMzNiSUNFMHkwbFJTb2c2?=
 =?utf-8?B?TnZzbkhPb2Q4dm5oWTJKeG8rZ3J3ajNqOXZ0QStGZ1Yyd0hXSVZRK0dDSjJN?=
 =?utf-8?B?QW9rTGljWTlrb1hwU1pidU9oK3ZDNTUwOEFmdzk4K2Eyd2JyaG9xQ0dPaUJW?=
 =?utf-8?B?MmxIN1NwRTlrRFQ3aytrdkp3QU5zRGVrd2txSE1sQXRWMU5WWHFmZ2hGdFpi?=
 =?utf-8?B?c01RdmlDOTQ3VGZzTjV0dVZYVHVTNFErVE5sWFdtWWJpSW9iTVo3M2ZtODZw?=
 =?utf-8?B?bWlpZFh1QnZnc2ttT3NjUnhBWUNYVlE1UHcyUEdrUXV2QWsvSU1zdUZvSFFx?=
 =?utf-8?B?bHI1ZVVGZTdKVStKYVZpTld3Y21xSHRlVG5iLzR4eTdHUk1LODcvK1h3a3dL?=
 =?utf-8?B?NmN0NnQwNi95WGJJTmljdWVYTUpreGRsMzVxMDFURUJpUWNJWVJpdjQ5K3N1?=
 =?utf-8?B?eEFpUlQ2TS9UZzBLVXhPSDJMVGJHTmNIczhYUDE1S25NNTNsZFZ6NUUvVGlk?=
 =?utf-8?B?cWNHVVU3bWFUMlgwOXV2OEZwME95ZXBOemVIVGJTWmNUTDVFMEp5VGs3ZklO?=
 =?utf-8?B?cXJMcy9FcHB6SHJPYUhmOVVVUXZmZUFvVmhvWXZjN3dXMHc1SWNBM0tGU2xi?=
 =?utf-8?B?dnFKMWM1dEdPajZNMEpUYk1zY0pTOWlneFd4MmJFS0twQ0MrVzB4Zy82eWxV?=
 =?utf-8?B?Qkh5dW5NZ05FVXRQK3FTcTFCaHdKQ3B6UlA3SnI1dGR1bmJCRXZpa3NlNHBC?=
 =?utf-8?B?TmpVUHFWU0MrUFF2dnQyclE1dWJ6dXByK2QwUEhSTHFEd0ZCbDdvSFR1YTJO?=
 =?utf-8?B?ZTVSWUZ4Nm5ZNGRKaXFZTUVzT25lSUdYZFpvY2VlUkxvUnV4dUwvYXNtZ3JW?=
 =?utf-8?B?UEVhcWJxVEVEUWpSL2VKYnVvcnFldmlLSlN6czBpSmttbHRyMk1rWVI2elZn?=
 =?utf-8?Q?vEk4B5m3ZySGUnxGPU3cKe30lAxd49BDbEIxuNi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 248e7d56-39ea-4933-f282-08d920201c11
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 08:27:33.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPVOaojFQuIFsNAe99hPiahCNQKI223U3xDy+6Du+3TJXgUtPrYGClEr2PXpGk//sZDr/yjdfjXipFZafQv6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

On Wed, May 26, 2021 at 09:37:37AM +0200, Jan Beulich wrote:
> We shouldn't default to include any unsupported code in the shim. Mark
> the setting as off, replacing the ARGO specification. This points out
> anomalies with the scheduler configuration: Unsupported schedulers
> better don't default to Y in release builds (like is already the case
> for ARINC653). Without at least the SCHED_NULL adjustments, the shim
> would suddenly build with RTDS as its default scheduler.
> 
> As a result, the SCHED_NULL setting can also be dropped from defconfig.
> 
> Clearly with the shim defaulting to it, SCHED_NULL must be supported at
> least there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> v2: Also drop SCHED_NULL setting from defconfig. Make SCHED_NULL the
>     default when PV_SHIM_EXCLUSIVE.
> ---
> I'm certainly open to consider alterations on the sched/Kconfig
> adjustments, but _something_ needs to be done there. In particular I
> was puzzled to find the NULL scheduler marked unsupported. Clearly with
> the shim defaulting to it, it must be supported at least there.
> 
> In a PV_SHIM (but perhaps !PV_SHIM_EXCLUSIVE) build with the build-time
> default not being SCHED_NULL, when actually running as shim I can't seem
> to see how the null scheduler would get chosen as the default
> nevertheless. Shouldn't this happen (in the absence of a command line
> override)?

I wondered the same yesterday and got to the conclusion that it's
then the duty of the user to add pvshim_extra="sched=null" to the
config file.

I think it would indeed be useful to select the null scheduler at
runtime if booting in shim mode and null is present, but then we would
be ignoring the default scheduler selection made in Kconfig, which
could be confusing.

It's also confusing that the scheduler that gets set as the default
when shim exclusive is selected is not available to enable/disable:

[*] Credit scheduler support (NEW)
[*] Credit2 scheduler support (NEW)
    Default Scheduler? (Null Scheduler)  --->

Thanks, Roger.

