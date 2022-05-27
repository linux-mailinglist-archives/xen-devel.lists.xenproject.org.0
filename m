Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75541535F03
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337933.562643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXrz-0006vm-B3; Fri, 27 May 2022 11:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337933.562643; Fri, 27 May 2022 11:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXrz-0006u1-72; Fri, 27 May 2022 11:11:03 +0000
Received: by outflank-mailman (input) for mailman id 337933;
 Fri, 27 May 2022 11:11:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXrx-0006tv-FF
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:11:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b06d8856-ddad-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 13:11:00 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-gl5RAaT1Np2diHjYQyAzWg-1; Fri, 27 May 2022 13:10:58 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:10:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:10:57 +0000
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
X-Inumbo-ID: b06d8856-ddad-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653649860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kRgdUu7r+CGdFGvK45sc/1oPVXgC4QLEIO84+JJ5ybI=;
	b=gNgDEdaM6iV6bWzCuF44Bv/mOjs+hF2dgLaiKVZVWkMWP4RYaC/31lb5+mRjXOKZCKyI4q
	6fHx0bOdbVrne29A5xRGAFXR0r9PdFOC75sJyI3R8G0pYhED+T87vO6TWUyExcks4lS8w6
	D1uTJMZjl4QhgfXg3ySsqSrFZCLN29g=
X-MC-Unique: gl5RAaT1Np2diHjYQyAzWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWlNZfREXEmi14NSCMcyhBnjjbWBlDZa9m+768rUJTHxNa8/L0k1YXzwxFZ+NROdUfluqIk8zSWFKUF7EuD2icAHq4/9Y+9vCX2tGdwOkZQQtFOfnKXVWcTHpvJq9IyF7LMH7QtBZIB/uU9QP7TMIAquxL2WSIn2ccCYSGcdXXbeNMgexbJV/L9C2h20w6X56+hqRotiW9FtSHBhW02W7ccgpsFg/6x+tvGMF8w2dvbw7rNMhEQjVLx60tXLIwx6fXdSvZVoDn9pB/D+iFvuR6ZiooJyyAWIPy6DtjB28/SWGbg9XJMdDCd124mMQBAER7adstEAOf/ctCR2Ovs2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRgdUu7r+CGdFGvK45sc/1oPVXgC4QLEIO84+JJ5ybI=;
 b=eNcrXuDPXTRNvEmGFdH6EsXX8VD5Jp9EQq5PUINBOL9rOvvpfUAjvw4MxbSttLPfHStUh9FnhhDd1L2OfjRUcwYDwVCUc2gFJcTMEsrJdVW12OACLuhqHkzqMObKetDPGheeSVUmt+er3LSGEKqwhCxvKsB83a7m5Jg+7XFQnbuo1DxiqKo8G1IKEK31Ogj89hRTjZpkyRp7l6ZiVq+niQ1onyzC7qrJP3FBiCJryxwtCGS6Nf0nwYxbygXHsH00gC4xat9fNoBPjFLMdvBQPdVLrvFC3JgAutaeBCGg+GG4xULTCuX2+lB+FYP+MaQHpL9sQCf26h15EpxVEgSZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Date: Fri, 27 May 2022 13:10:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 00/15] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa3e2f9-8a84-4678-c7e5-08da3fd19324
X-MS-TrafficTypeDiagnostic: PR3PR04MB7210:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB721097C7686A95F3469DED6AB3D89@PR3PR04MB7210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jzH2C+1sL14wOrwxOGoGtp27cPNSDvjDENXbCB/K6GpGBdcKKUMweKMik6zUziw5GFCERQcbkqsYjU/NIgemh1vx+ePpOdZQ9Byy6bw2RZ0lK1nthTwGFBGtsWYWZFngVocTygaiU0nY/E9RE2qc7sLMkxKJyC55t98ESoTsFrMyPL49pN8/mBWLWDL5L8xKadXY+apYGSr7rilRv81OwiJ4pd/Alm7b4yNSgfBxBmFDST4kRryOmUTK3WqoKpZFubRItwTIl3dMVzaeVDCaSwJMsJTgloShMsqRDqQLVKOdZV/X+JQvKOwQu4vUYI4kh+o0xxM8Dt8jT3iQ6qhlv7GRlTiQ9ERmoBwu1ru5mSwb+L9TVSc9Hoy6Nu34iOGDQa5O1IQ5hUsVY+wPCze+JlAWCViUpwv9u93E7Ti8vfcE5O7x4j3dDaQqTwL6MbqzvL1LjY2ZM5MUIxbEmeZVcAxSge0DGA4TfrIlPHagsnltG7INyL3b8mMX9dRf6O0YoPfjegdoF8m304SxiZeyz8f5QStBt5FiAwxTJ8Nwi6Ab/VvCdoK++oqWcshKMUBeM+wPA4s0R+YGzpnZYDxfrJ2z7pv8hr3t+xycf/d2yVcY4arNu4HdFyLbE3Xo14QlQkoR5zsbDZ23Y1ZKwmWpj8MRcjPAqg3yBpqSQOiMzePX88I3C6ca4HoANVLBbXWa7nnvxxS9QSesud8I/ySq200iTS8q9GKKGSK5z9NKZrXywDCwBbc2ElukmC/if6Ifj6Vczhyj19vSNMnsCVaAlGCyaKKKEO+ynFNazA0RnC/X+jBltdH2qUnIl95yxU9/3/WKvFih8NnRkQTf2dm2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(8676002)(966005)(66476007)(6512007)(83380400001)(8936002)(508600001)(5660300002)(66946007)(66556008)(26005)(38100700002)(2906002)(86362001)(6506007)(186003)(54906003)(316002)(36756003)(6916009)(31686004)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjAvTEFyd3QweUd3NzFRN1Fzb2lOMG04VFl2cjZMOUtMd0cwd3JTS08wVE5T?=
 =?utf-8?B?bVdFVDNUT2U1T2RsM3VsVHBZdXI0Q0tsZTJtYTM4ZFVSWXJiVXNNMTd4TG4r?=
 =?utf-8?B?TmpDOG4yWVRwOEpBOUtTZENiRzB5bXpQaHJ6Z2JEQ1BFVVQ2TGZDTHdQQ2k4?=
 =?utf-8?B?cUxRbmlmUGFkSnhMUWpoRjBobGtLaExuZ01LcmNhZURvM1FMSEJqYTFSRlpn?=
 =?utf-8?B?emRzbVVwV2JnUDRDUnJ2RnFWRGVXZVd2dlM3ZElld0ZMZFkyaHhWVmJSZTlj?=
 =?utf-8?B?MHF1Zzh3Y1hhSXVaVmgyMzcwU2ExYnJrcjRoaUhWU2tTRCsxM29lbklIN0d6?=
 =?utf-8?B?MnhkdFZYbngxVWNzU216UGFZSWFlemJBblZOWWNZd3haU2NiNFhiaEhyUGly?=
 =?utf-8?B?MTV0dm54ZDBFMGE0YW4vbDhjbFRnVVhNSS9VMUZDWUpYQXlCMlpSYVNKMytx?=
 =?utf-8?B?QnhOT2RJVFljUDRZWjR3OXd3UjhSNFJKbUFFSDZRUVZXSVNOa3MrcFBLMFhy?=
 =?utf-8?B?RkdQZFM1VmtqbHNMaUYzdnVOU3hTZVkvTFRCdDNJUDM2SENXSnV4eXI4UTdK?=
 =?utf-8?B?elRCcjFRYTlyK3NEeldObXA0OWU5bGd2V1RKU3JsYzIwNVVuK2Z0bUhUalQ0?=
 =?utf-8?B?Smt5MGtmdXlEa1ZScnFBYXd5N0hCc2RuemhHRExFMEVRZVQ0cjZSZE1BQXRL?=
 =?utf-8?B?c1RBalE0T290V1RUYlB3dGZjRzJ2RkVvS0JrZ1pnVis1MmowaDAwN2ZCcmF5?=
 =?utf-8?B?ZkFOM0NCSUlUd1dkS2dONGxydU5heVhBclBhL2h5c2lMVU5TYWcyWmozdjUr?=
 =?utf-8?B?ckgvcXVpczg1V1Fydm9JVlZsTUxUUzZiV3BaTVUrM2V1R1E5bHAwZTQ0TmYv?=
 =?utf-8?B?TGlVSVA3OW1TQmFFaTJBVHRNZzJZOU0vdks4aUR4SDNndUN5bXBTUVdsL3dE?=
 =?utf-8?B?N3BwcE8zOVBrckpCdEszNWpqWnVnZFpwZGVqWTNtS3pzZUpaaU5XM2RvWEg2?=
 =?utf-8?B?UHJteHBYZzZhbEgvUFRYS2JtQjJRckw0T0o1R1Ntb1NuR3FNWUNjSjd0d3VL?=
 =?utf-8?B?MElwdWt3VmpDN3VLSGF4T2Jodnhjd0ptNW5PaGRtYTJhRFlubnFFdTJNOU4y?=
 =?utf-8?B?SmVkN3BseDR3NitQZzFsRE5GeEtYR0lIOEpLOVpkY01GVVlZVUtMZDI3WHoy?=
 =?utf-8?B?bmRjcUpNVWNpcWRNYk9iQXRNNUVFSjBaVGpXZi9xSlNGUVBoUXFjREdsYndk?=
 =?utf-8?B?dFBqRHduQllVOWhDVi9LTHlZRHlCWXMySlNWalhWMk1XaWk0WWdsUnB2WmlV?=
 =?utf-8?B?WDdQZXdiTDU4Q2tDL0JSdmxWbGZWbU1DMVBxSC9tY2Uwek5jQzloQm8vend6?=
 =?utf-8?B?M2NHUEJCU0Z6OGhMRlY1NkRMS05uQ3hxS1oraE02QkVjcnBXVHkyclRYdEov?=
 =?utf-8?B?R091NXg1S0VYbjQ5ZW9SY1pTOXFleVJWd3FlbU1uNEZtYVhsMEk5dDEzYUhG?=
 =?utf-8?B?VFV3RzAzcGFpaFdhSmhBdnRRVTFLNmQ4NVN3TzZqQ1dyRTArOGRKaWlKSVVS?=
 =?utf-8?B?VWpZRWxPYjBEbGV3ekJpMnp4L1JnNkZqSFN0U1pIYTBIZWRIeHYxUStITG85?=
 =?utf-8?B?VjBMQ1BsMFFSaVVzNCszWFp1TTROdWR2VnlpRUpoTWJ3YW8ybHBEQUtVaFZ4?=
 =?utf-8?B?dDhjRkthU1p0M3BvVWR4RlhKOGxEUTR1T2I4VGNBRkZjUWhPSzUydFRtazgr?=
 =?utf-8?B?L0FkdDB1LzNJODVrSjBhOE5vZHBQRUVUeHljTVMxamVZalhEUVJuRFR6ODEw?=
 =?utf-8?B?MnNBVEZ6b2FONFpDSlVMQmNRbDRoOTMvK3V0VHNNaFYwYVRHVXRKSDJsaEhG?=
 =?utf-8?B?bzFCK0d2Tml5TTVkemgrTjVVZlRlOG1mVzVLU1d0M0ZEdktMZWM2Qis1ajA3?=
 =?utf-8?B?U1dHa01sQVFTSDRWWGhVUzluci9mOWI0U2NMeGQzbVU1VVpYenRjZEJDNlkz?=
 =?utf-8?B?TEE0MEdGVVdzWVEvclJxbFQySkpqRTVWMGN2WmRUbHpFVWlTbVcrRURwN0tv?=
 =?utf-8?B?ZjRuS1l5UzBZdGFZTUM5Nk5SQmNCaEplbytSaXkzWit3RHNyeFg2OHQ2Rng1?=
 =?utf-8?B?T1RJWjNYS2FOejNvb01zZWY2bVVqS0tRcnIyMC9hQVNaclVTTFk1WWpSRU9k?=
 =?utf-8?B?bnRjdUdCNkY0RUwxZ3RQb25UenZSQWpEVDg5MytKampGV3kwMHZYVGowTlc5?=
 =?utf-8?B?UjQyTE8vcXRSWGt2ZUN6WDdqQXNXYjl2ckpod1ExeTlTQ2R6V0Q0R1Z6SFBU?=
 =?utf-8?B?eDMrTWhNUmYwL0ovK01Pbklmbk9qcDYxdFV5cjVBUWFpNFh0bmFzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa3e2f9-8a84-4678-c7e5-08da3fd19324
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:10:57.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UifLCFnepMQ4LBorh0lmcPF2aT7xf0ScsMZj+oevi7TZyg/NULjpM/Lz5vimH3fbhp3XVfh7irMLUgkMNrQQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 3.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there. Depending
on the amount of memory handed to Dom0 this improves booting time
(latency until Dom0 actually starts) quite a bit; subsequent shattering
of some of the large pages may of course consume some of the saved time.

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

I'm inclined to say "of course" there are also a few seemingly unrelated
changes included here, which I just came to consider necessary or at
least desirable (in part for having been in need of adjustment for a
long time) along the way.

See individual patches for details on the v5 changes.

01: IOMMU/x86: restrict IO-APIC mappings for PV Dom0
02: IOMMU/x86: perform PV Dom0 mappings in batches
03: IOMMU/x86: support freeing of pagetables
04: AMD/IOMMU: allow use of superpage mappings
05: VT-d: allow use of superpage mappings
06: IOMMU: fold flush-all hook into "flush one"
07: x86: introduce helper for recording degree of contiguity in page tables
08: IOMMU/x86: prefill newly allocate page tables
09: AMD/IOMMU: free all-empty page tables
10: VT-d: free all-empty page tables
11: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
12: VT-d: replace all-contiguous page tables by superpage mappings
13: IOMMU/x86: add perf counters for page table splitting / coalescing
14: VT-d: fold iommu_flush_iotlb{,_pages}()
15: VT-d: fold dma_pte_clear_one() into its only caller

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan


