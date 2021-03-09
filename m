Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84C332935
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95531.180396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdjq-0004c5-7v; Tue, 09 Mar 2021 14:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95531.180396; Tue, 09 Mar 2021 14:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdjq-0004bg-4n; Tue, 09 Mar 2021 14:53:34 +0000
Received: by outflank-mailman (input) for mailman id 95531;
 Tue, 09 Mar 2021 14:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWC+=IH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJdjn-0004bZ-Lg
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:53:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c82bad2-469c-4b62-9ab8-02426a77ecff;
 Tue, 09 Mar 2021 14:53:30 +0000 (UTC)
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
X-Inumbo-ID: 0c82bad2-469c-4b62-9ab8-02426a77ecff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615301610;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z+wHajFxEbzNL6KY64KVfQnml1PEuPm9/pQSxQTesX0=;
  b=WL63TGdxWIJZL9WrFJyPwjdqyVD/7AZStlaZHHv1y/qIqA+NG160Yx+S
   UJCIEvRZsiuIn3UE6xWb7fUDMfDLZr7Bp8LOnDtDNCUsiIvjTmw6uEobx
   hvPk9DAoNWD+sbwL70UWee1/RS0VLFTkgTJkq/ZguKFM6yDWMHMa+s+/w
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4bTQ8/tKCJ6oiOCLUsM/9OX94C9uASXCc2d7/Ff2Mtbz4AsSIqUi9E9GrXAWV5jCSmoQHPrhFM
 Q/lHOx8cCU5Cy5snWQgDQ/y1UDjOAOHSMm+pK9+8hjZUKoWkswaOgQEn0LEtildFvbYXkoMq+M
 G1IkHXp6WCBZmyynquu6elA/Tb0KQxEin9lF95QNy8nzzKy+c9Ths+oS950MeCroa7nRhsA5Bu
 HXG2dj/sO8b0ClyLo00l5OxocduLjJHchsHoklN7sDPrUTXvghwGL63Jem8uGKZulQUrQkd1ho
 NJw=
X-SBRS: 5.2
X-MesageID: 39232482
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="39232482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUVS2eKQo1Q9Nu13F00pVw7lhKmK3rgvYv8z6gQPVeLpNzxVmWCHT3gBXIsGs3baI1+wBPhik01Fwi7D4BRPcWAuXs5zpmWjx1L0xuKqcuZNvc1eMd9rwjaNCNTDWQ3lRjHAyRrjXie2jdcGQIn0vQuoHe+oPMyWB/xobKJklxqA57KS27S0JlhKn0+hmvbRCAxfYMmaYycXtrx0zmi1NgEsGYyvikgK7gnm/FCzaYh+KsOGAnyYv9gXxw0MNuyXe0wEuNlS7beJy5L60Y36qNWVziqNGQqhWZV5Gijf9aTmrWa0VJHZ9o+kwMiJtbzBXKhA1vU+AUVrr3QI7/abrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAYkZH5Yy+54Ir70154BT3X2UpaA1j72GzEGOdVw/5Y=;
 b=k7LtgMzt76ijCMQMGyF8m3h3EKbaUlrzrTxsjCdym2idxaiiRGmnNC3YcSMeGvcvDCH4Mjcmm4smjvY8VuQ7mwYmL8ahm/8cgmouHuWh7kSdWf9jIsRnUBwEzU0sGiesIO4YZKwA8XmfNetTbGUrlXpIOzAfB/c5FQtFpxe3K24SS4gv9MEsuFV/X7bcKGavjgoFcVCd27/eH8BNJNvSuR6L+vKbr+2mskG0N4w60+/408iFcEa1HNMfHaWnVf9P8pb2p7hRZOyhLP9zcvII/EVMiGICc1oev9SgxeCaRWbv2Q9o8FPYyzwDINgsRroDrLxW/T2ckkSMXeja3CuPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAYkZH5Yy+54Ir70154BT3X2UpaA1j72GzEGOdVw/5Y=;
 b=PLIbHccYTPF/ICzJ953Fo8qVQvnit0mhDJyrNgE3V5+BFq4WNACbMZ19ZKCsqUrMvf35kPHxIXvyWibal/47mNgKjNFkJ3GYAdjsS7V5hRhiaRrepXissxfRNf2IZpx0fy2pf9zgwo1/7kqdiltrnzDi8PHhVEJCswVb3J8RQCs=
Date: Tue, 9 Mar 2021 15:53:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Message-ID: <YEeLz9T1E+wWtXvy@Air-de-Roger>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
 <YEd98T104rrsmn2S@Air-de-Roger>
 <feebc3bc-ae1b-5cf3-8482-422997d810fc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feebc3bc-ae1b-5cf3-8482-422997d810fc@suse.com>
X-ClientProxiedBy: AM5PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:206:1::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a70fd69d-53c9-45dc-712c-08d8e30b0e1a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB36738CCC1F4E0A35D38B8C0D8F929@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/RnrBWJUrUtE4WRIOTRsiHxdE8ZKLWCiXK8FneGm0WUH+cLFEu769vqPTb6bFEHMDF2UWPFT2szAYv5Z69xhm+Zqji4M/n9sY3JgEjgJEskhfnxTO9WSRWAgY34BTZk+hVojOEFZdywbYQ2u5IGlaFq5Hsw1hB2sVZOyUojO3CjZCqdUHfK2fQ6rnNOA7HSdrFSvFNwz/qIcvFrJ2+DaAwvbp2yX0eXIuINgJ0heih4LRhCyvp80PP+EKJ5U34FMJw+fN8PBtma683LO28mFtL/zRmDNiRcS3lvxsC1z2s3RUudTRfiRLijHH1lnU4aSzfCPr3iQvrqgjPNrQ8XWT47zBB1fBykwtlA87oG2lC8spT3LPU+tc5GglBeA1vc19UIrT7udHoDAWQl4vD+LpaTCi3BA2aIhQBIWUJm42N6JMStw5XUWTohy/SKheYJTdJ65HMxCeLwkM3cDOCNB70su5BhjBaPfSuL1v4/RDO9r1vomMrvFafH0TZVxdR16D3fI4HzxSqNsxCoEWlA0Vf755bJGZnBm3LQNjZwIXEZMg5XqZ/R+YaLc10GvzegZV1Bwx60QVHrFrQOwgE1VNfdgwOk34ulDLRGKxrCb3SuuPugbwGgtgbX1zXqCwvYNySpLUSrIVE4HZmGln6Nhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(86362001)(8936002)(478600001)(6666004)(956004)(33716001)(6486002)(9686003)(66556008)(66476007)(7416002)(54906003)(53546011)(8676002)(2906002)(83380400001)(186003)(16526019)(316002)(966005)(85182001)(5660300002)(6916009)(4326008)(26005)(66946007)(6496006)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SldPL25BS2MwNlJQRzJqT1MvcjhLSlgzczh6NWZpS1hFWkVLbm13Q0tCZzEx?=
 =?utf-8?B?QlVTdDl5Z2JPYzd0cnY5OUMyWTdkeStOckdpTFBuc0JmMTNuY3dkQ043ZElx?=
 =?utf-8?B?dFEvQml4dldxQ1ZyOGVTQ0VaKzExbW1hOHBldjZLanlTMlZNa1RSQ1Y3Rm9t?=
 =?utf-8?B?bVlVbXdpWnlnbkh2QzRxWlpScUMwbHBxZmtqQkVzbE9WZ2xwcXRMSnJwK2lY?=
 =?utf-8?B?NnhqMi9RUlY1TktHU1prN05nbEJiSmU5ZmNNY2QzdzNxYldBVnJURlcrc1R1?=
 =?utf-8?B?SEc2dURQRGV4N0k1T3ZBVCt5RXNpSTNCNGU0OEhKQnFtclhmTHlFb1VQdEZn?=
 =?utf-8?B?bW14RG5OOW1qWE5WaFpxWDJRaUR5MENkcTJRUndIbHV3RzM1OVBtd3lJQWI1?=
 =?utf-8?B?cHlTcThSUURUWDlDZS9CcW5MbnZPcWF3VnVQbFJIMWRzMlpXTy8yZkhLQXVK?=
 =?utf-8?B?OWVjUWxMMEwxOGxrOExXUFFuNTNMUjllMHUreGRqYnBlRFVwVUpub01Oa3cv?=
 =?utf-8?B?dmNSZmlwRFYxZmhpOWt2VCtqSHBjbDJTWmtkc3grVTB4a25PSmNYT3JrelA4?=
 =?utf-8?B?eXIzR1NTT2MrQUYydHV1bWFiS1N5V3A3eFFXZnlqSGh6R2x5clRxdzVKUmNZ?=
 =?utf-8?B?M1JxZnRDZDUvdjZQbG1iN1NZS294bGNKRXBDaXkxeTZZVXRiaDI1U04xclZU?=
 =?utf-8?B?bzhhK0k1b1FIQUs1TTcyZTVFR3I5TlRCd2xQbkxNNS9iUS81c2JMV1RUdG44?=
 =?utf-8?B?eVJFZ2l5SElWWmpuMTdPVXlmZkdUM2xodFlQT1doT3FUcGxlbTZ5TlIrR1I0?=
 =?utf-8?B?MktzSkxOdGcveUl5UC96WGxrWWRQaHhPQlArbkhheXZhS3NJcU91MEFXc05D?=
 =?utf-8?B?VC9nSXYyb2VzcGZxZzNqd09CekQyYVVVL1VRK0xyTUlYWDh0V3hOV3FCRjdC?=
 =?utf-8?B?NVhHY3ZDbkU3TVNrYksrTmFaMHR3bUJvS1FmNHhicVBBTVdZQ29UakZJQ0FP?=
 =?utf-8?B?K1Z3b2RoRFA5NFFTVUVRYmUyNGNQdVlaRFN2ZzJ0TUtkMnBma0ZMSWZKWG9O?=
 =?utf-8?B?dnhhMms3TTFMN3NXZmZkK2V1NzdxMVBhTE81Y2JYazlYdkNjSUc2K2ttMXlu?=
 =?utf-8?B?bFF1bUlOZmpBZW5POWFpSTNVVXFSZkMwMnZ0dXBhSUlhdFE0RmErRUlYdmFm?=
 =?utf-8?B?Qlk3VU51TEJBa2xEUTJoNTJmY1dLVjB5R2JLQ2F4bWQxRnhIeWRXY2hzazlm?=
 =?utf-8?B?dnJUb1NYWXdMNnFEZDlHVUF6cnZtQUVuR20xYnVTY1ZYUEltVFZLb2UrZVFl?=
 =?utf-8?B?NGY3TTh5WHppUFU3TzNZUjduWkZIRFVqcENncWsxVzZsNlVTRVRPUzl6NWZh?=
 =?utf-8?B?d3NhRzZCamNCcmFEUHBBMUtCNVMwdlhtckF0c2NGQlNNWE4vZHh4MDdtdmhU?=
 =?utf-8?B?V3poMndudWovcEwzTkZwY3g5NlpZY3lsczIvL285NnRLeExoaGIxYWpSWis3?=
 =?utf-8?B?c3psbWNPSkZ5WHpySG5wNE93TTBUVzdUb25aenpiR0daWlJ0TnZ3Ujg4QUY2?=
 =?utf-8?B?b2JHempUUHg5L1FFNWlKZzRoRGZhSGJJdEdyQ3JmSDhuUmFHT3o5dk9RbDQ2?=
 =?utf-8?B?T2c3TkZSTExvUEdzUm1ld0IvSUFreHhxc1lWOU5lRVBkOTg1SVlObVNmd2cy?=
 =?utf-8?B?Smt4WUU3eEd4cDZBOWJaMm90MzZyUUFpb1cxYzk0c3huMDRndENUUXBMczhS?=
 =?utf-8?B?eFJqckRMa0JTS25GNnJ6VjNRK0xJejVEQmNqcWVUOUdBWUlvRXVWdjRzUjgv?=
 =?utf-8?B?dXFueXgyZ0lHL0MvNlBJQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a70fd69d-53c9-45dc-712c-08d8e30b0e1a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:53:09.4919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxNk1MV9ElZsSitO0ER65rAHXmtgaM1Qpv4YSKe7UbHEKkip1w5dxGf5fZCZ+udOJcGDPoccPrgM5SiNQOHzVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 03:26:07PM +0100, Jan Beulich wrote:
> On 09.03.2021 14:53, Roger Pau Monné wrote:
> > On Tue, Mar 09, 2021 at 12:36:39PM +0100, Jan Beulich wrote:
> >> On 09.03.2021 11:56, Roger Pau Monne wrote:
> >>> @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
> >>>          }
> >>>          /* fall through */
> >>>      default:
> >>> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
> >>> +            return X86EMUL_OKAY;
> >>> +
> >>>          gdprintk(XENLOG_WARNING,
> >>>                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> >>>                   reg, val);
> >>
> >> So what are your thoughts wrt my change to this file? Drop it
> >> altogether and require people to use this new option? Or do you
> >> see both coexist?
> > 
> > I wouldn't be opposed to have both changes co-exist, as long as the PV
> > one is made part of the PV ABI, that is have it properly described in
> > the public headers as part of the PV behavior. I've replied with some
> > details along those lines in your patch.
> > 
> >> In the latter case, since you had suggested
> >> that I drop the write side of my change - does your changing of
> >> the write path indicate you've changed your mind?
> > 
> > Yes, I think we need to provide an option to allow users to revert
> > back to an MSR behavior as close as possible to the previous one for
> > compatibility reasons, and that should include the write side even if
> > we don't know any users requiring it right now.
> > 
> > We would be in a bad position if that use-case gets discovered after
> > the release, so it's IMO best to provide an option that covers both
> > read and write side straight away.
> 
> Well, for your change it's indeed "an option". For my change it's
> not optional behavior (and we also don't mean it to be). Hence I'm
> not sure what I should read out of your reply.

Sorry, maybe my reply wasn't clear. The part of the quote above was my
reply to me re-adding the write side of the change. The reply to
whether I think your PV change is required was in the chunk above.

To clarify:

 - I do think we need the write side of this change, just for the sake
   of providing a behavior as close as possible to the previous
   release.
 - I don't have a strong opinion whether we need two options
   ({rd,wr}msr:relaxed) or just a single one (msr_relaxed). I favor
   a single one because it's likely users will enable both in tandem
   anyway (like you mentioned).
 - I'm fine with your change to PV as long as it's documented in the
   public headers as part of the PV ABI, since it will be enabled
   unconditionally (more about that in a reply [0] to your patch).
 - I think your change to PV should cover the write side also.

Hope that's less confusing.

Thanks, Roger.

[0] https://lore.kernel.org/xen-devel/YEd6GTXJqRIjijl6@Air-de-Roger/

