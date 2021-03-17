Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B281633F3D5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 16:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98740.187479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXla-0007Ud-OM; Wed, 17 Mar 2021 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98740.187479; Wed, 17 Mar 2021 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXla-0007UE-Kz; Wed, 17 Mar 2021 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 98740;
 Wed, 17 Mar 2021 15:07:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMXlY-0007U9-Lb
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:07:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b0ac4cd-9f40-47f1-b25c-2155bf93ee69;
 Wed, 17 Mar 2021 15:07:19 +0000 (UTC)
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
X-Inumbo-ID: 4b0ac4cd-9f40-47f1-b25c-2155bf93ee69
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615993639;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fwoVPiTMsI7OQJjVUsU8lIr/aJr3effL5BzkN3VeDQs=;
  b=PaRrtb0Y0G4eQZcshsey+T0IpcKe7NiASnDRNlfMqRsv3ZZrrzWqIBZ1
   cnOD5Gkw8ANQlgWfUvu9tqAOIh2zZnWwT9v+EutkKduDajYY9WIxED7lU
   zHKHFUu/2+t3XkYOkRX+L0tVP95aiqhLlK95q8tj/hD/DjhjwBKJzA4WW
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +Ih4W3uqsltdSwFX8LqTCdRL4YYtAUzOvPdTaNA2rHM4kE07YF7uOwOScB/gvGHBgF8RGP3Dj1
 xsA8D8/1TtTnJV5pnnl0BaI02vvMNfl8tMAzjf+SfeEYED4nu4IOCk9IF4k9E2WN50yqQ9uS/I
 7rzunycoJnClLkB1Hlt4eYIHNIF/ZWhRyKOX+NZck6DCYnT6s1bHFfvzos//VhufhcPpRYzwvl
 iOQ3IVCC7aCBTeR5ZKR/UWbBf1+19O4SUf9DNjqpST1+B5Fys+R4oF60IvGaJZ+W+Mni5Yg157
 pZI=
X-SBRS: None
X-MesageID: 39869556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:adv6WK8U8B2UnHEiE85uk+HWdb1zdoIgy1knxilNYDRIb8rdrd
 ykmPQHyBP44QxhP00Is9aGJaWGXDf4/Zl6/YEeMd6ZMjXOkm2uMY1k8M/e0yTtcheTysdx3b
 ptGpISNPTeFl5/5PyQ3CCZFJIazMCD4OSUg47lr0tFaSFPR+Ve4xxiCgCde3cfeCBjCYAiHJ
 SRouprzgDARV0tYs62BmYIUoH4zuHjr57obQULABQq8mC1/FCVwYTnGBuV1Ap2aUIq/Z4e8H
 PImwG8xqKvv+DT8G6460bv7o9bkNak991bBMbksLl2FhzQjG+TDrhJavmppzYuuti15FIrit
 XXghspMshp8VzQe3y4uhfh8Bnb3DEiwXnkzlOTnH35yPaJIg4SOo5kv8Z0YxHZ400vsJVZ3L
 hQ12yU87pMSTTMh03GiOTgZlVNjUS9pnowmfMSiXt/XYMSZKRKlJcS5k9PD5sMdRiKkbwaLA
 ==
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39869556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlM2ym3KGO0CC3vngedBGvtkvUx9i8y46LYumqvkUH/XvAbSXJcmSgpXZ00Nfic38dgVZLdmvitzjICSUW9PQUl1oSSWCnzQTG/c1mwf6n74AqxGHiruk9H8WBAR3MRjaNwdagOZBXoA5TWsEJDePK7Eux/ynxXCq16v/VdI0fnbYMqjMWCx//JKEjrfbRggb5maS5CezNWpv0JznAkbL4DryqM076rIFR+hangAbIUKIq6neGQk85Rc8ptsv/4E0D5Pl5dU6OsDok+e3e8q7Jfx3VwAM2QdkHNLW0kpCJ36QVJhB2vguLUfIsD1knqlaMa0PfXXH5l24ove3ZESuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsOO55P4euXDpj9CtiLi0erl2aPxZQ6WCsK+nCPuPWw=;
 b=QAotuKIVKWz6DrbCrBBioi+pL+Ms6w38o2LhLOoIXsdFdMBtLEgCJrO5fLLkAPprHm1B+MiX+YXhYd6vJWUyw8EA4Jvf4mmJAiZ267vYmRr9A8YaOdgz5j/R1D5yQ5X4VZlyVLMRKgz+F0NWexBalboxeQz/WqEh5cQDRt2UAEyPlOSX31NlbBOeCczCK5MvBAuv1dXQ/2+WtM2Tp7JAuJD7NNfIk9oTS6hyloScyVHq4etQGrl8rxQOHBt66/0D+WGVP8WWfCNrNKwBRZJn/lG6KQeEavACTywgEsnJxZRog0Pn7vo9M/rLbdzJNBPtmBXrMhFSnJTSa4vkGbl/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsOO55P4euXDpj9CtiLi0erl2aPxZQ6WCsK+nCPuPWw=;
 b=SoTJ6lFQ0ZgOctlIXVevUpvb6dfZKzniUJlcAw30DohHIJZveNcrN971RyAMrQbaXbn4hn9LOhUzLq9I4UCARJawQMkLs/DfauAFtRq1EcL9qM2JyTZ4FeulkSPRIHakljPHUsllVS6GlQoR3+SYC23ZJta2GNNoocR7LYiC7tE=
Date: Wed, 17 Mar 2021 16:06:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Wei Liu
	<wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
Message-ID: <YFIbEqh9IhrY0Lwr@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <24658.1583.601613.903527@mariner.uk.xensource.com>
 <4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
 <24658.5692.932979.892439@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24658.5692.932979.892439@mariner.uk.xensource.com>
X-ClientProxiedBy: PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7eb9742-ec15-422e-de2f-08d8e9565378
X-MS-TrafficTypeDiagnostic: DM5PR03MB3211:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3211173FE95904E5D0DC940B8F6A9@DM5PR03MB3211.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YD0I/jivxoPUeWExPFEAYv1HVA70ebsJbXPIMPJJYHwsFLdpGaK5OGmlO2lo9t6ClBDpTqNWzdXiKAC+cVp4DvH8AoWQrsT+IJ/a2JU/YyqUsg5wB23qyALONWzydLFxZVAX0K2Ff6RZBX93/KRiBBt+/t/9Gmo+wCUNQxq9O+JqnfH3SKxiaeIisFLkYKWTVpSvjLxqWkQ8ApXbpRGYRlnHfpOTuIoPwa6UGc5lTKQ3wHlafKbFgaUWGfiDmnMTmYmdcoGCMo22/vM+PoaoANvTdqx4YSrLSgYyG5DAn42lUfI9QugZvpdsQvovc3nCyX8iAfNQsWV2PUvlh2hT3XdL5hPliIUAj+q+vW3PC9s4kiNTZO3helpWZA/+tDdGW9DeQ2f0ej+N9vVPJM9+4U/jtzmob1EjljVMsGiyxzIPXNY1bLdY2AqvK2BI+bzHWQL7r5wha8s/fskhMOzLZ90neM/NuOX3qHEJRunx27Hco8Iau4+bQf3A4nc/amjTfRg99EzbkSzdGDpAy9aWppFmug4cXl/0/A+w22kexixvXaAe6Y0zjnY7DpbBekFW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(9686003)(6486002)(66556008)(26005)(6916009)(33716001)(2906002)(316002)(53546011)(83380400001)(16526019)(85182001)(6496006)(8936002)(478600001)(186003)(956004)(8676002)(54906003)(6666004)(4326008)(86362001)(66946007)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlpJTTRqSGV5cC9DTUdhWEc4K1dWc2ZIemNnVmlhRjQ2dEM2WVVIZ0lBNFJx?=
 =?utf-8?B?Q1pST2FwR0hRQUhEeG44OWFVSExUY3RoTVhnb3V3Mkh2M2VjbHFnZy9xSGQ3?=
 =?utf-8?B?RjdnY3VjejYrV0k5QWlqZFZzRENJV24rQVROK3NFaWRUYnllUDBieXpwT2hP?=
 =?utf-8?B?YmZsaWVlU0xNcFFxcUs4azZiZHVFOFpDQ3NiYTNKalhqS2FyN2s1ZUlXRTgy?=
 =?utf-8?B?blIyTWZVbU5VMFZSU3o5VTZsK0FMMnlDQXZJYlFKR2xwb0p2bmF6a2J1SHR3?=
 =?utf-8?B?c1g5Kzg4RUJwY1JGMGtlSVdyQlBuZ2p2NXhiKzV1cnFmd1NYdW9UUWVDOEc4?=
 =?utf-8?B?NmhtWjhRU2dFVllueVVCcVEwTlhhNTIzVUYrMGNHbnVpM2ozNmV0OGpQVWZY?=
 =?utf-8?B?cmdnSUF4cVJxOFFxNUo2UVBqZkJWblQ0VHY4Nnp4VnpuMjlSV1N1RlFZTVRz?=
 =?utf-8?B?SGtvcHM5c3pQSmhGRTR0bFVpakV6WmN1MFp0dExaNUlQTXZXNG5UT2pNaC9m?=
 =?utf-8?B?VzNUMkFORUlHL29YR0xnSzdlNHkrM2lJb0RFQTlhK1BGVWtOZDF6bFJpemZI?=
 =?utf-8?B?NlJ1ZUF3dzZOV3VNeEV1c1VpbFlQc0NPM3JSMElGbERlR3phZnRPcG5xTytp?=
 =?utf-8?B?Skwwa3ZHZktETGR5TWM5NEM2RGV6REVaOEE1YjRnUERwaHhQVWo2b1Foc1la?=
 =?utf-8?B?M1ZWZXI3UEE1czZhb1paRzJVWGdoVi85Z0I4aWZWY2VyME45Vm9iVG5paEpT?=
 =?utf-8?B?UUxnNlpPb1RNZXpNeFU2bEllOHZMQ1VwSmVGUVR6N05IU2xHNlFhVEkvL1hJ?=
 =?utf-8?B?UitCU3JJK0Q1UjFUVWs0SFArcjlxc2ViK2ZscWdITlV5U1Erc0xGWTVHU1hB?=
 =?utf-8?B?cDFGWnRwdjFicDg2QnlVNHI3dzJOcFlkMjY0a2Ryejc3UHVvcWQ5T0lMRnpH?=
 =?utf-8?B?NWNYU3NVeGk3U2pFV0pkVG84RTNxTnNicTVzRVNrb2wrMTlpWXRCakhjWnFW?=
 =?utf-8?B?MGQ0R1F5TVpVU3Z5bVc4Y1Jicktma1RTZmxBbUdqc1lLVndnU0pYOVlRcEx2?=
 =?utf-8?B?WURHejlJcy8xVmN4UWxMc0Zoam9tNTJFSVFwekhONDJ6R3JJS1hYTTBPUERF?=
 =?utf-8?B?OCthSjREVUxGM0Y3WGFqUEZTT2NVSUpGc0NqUFoyYkNUODdscitwbzRuOWo4?=
 =?utf-8?B?ZzNxRS9zd094ckc2N29YK05ZZmpiSTV0ZEJGem1sdE9BUmZvWmU1TExzTWJ3?=
 =?utf-8?B?aFRwelFBdEVUN1FBZEYxampMN1h5alhCMllFUEdMakRJK2pOUmhBY2RLbzJR?=
 =?utf-8?B?a1BEblpXUzJFdnFhYnNlbElBSHlLVXhCNWxEQ21ZeGFDc1FRRkpVb2RFRHkv?=
 =?utf-8?B?ZXBnei8xZm4xbGNwUDhxbDlwd3ZYaE1xM3VaVmVpRFFPSFNjVkZObldZTSt6?=
 =?utf-8?B?RERDSXFQUTZWYlVvZjVyMDU1Ylh1eWlGRDltQ09XdWZVY2hwVlJsSUR5VWha?=
 =?utf-8?B?UlhqdGNkL2NmUG9ESnBKdFRvNis0SUREa3FiNWRXcGZCWVdrYmZ4YmEycU5R?=
 =?utf-8?B?V2NlZ3BvbCtuMXdwV2tielE1VGNOdW9GUWY2Yy9CbUdRbWtoMkJwNVRiOWVJ?=
 =?utf-8?B?VTdCbnlhL1lYa3NOemJLZ2JKai9RcXFWbmNsRDVMY3d1cDRDalcxamV1aVpK?=
 =?utf-8?B?Y3kraWpXODBnOURrOFdLYlVOWFE1enA2eDhVRHJpNlh3K08wc2lIT0U5QkZs?=
 =?utf-8?Q?pEMyqk4v3MhK0WJ1zU7XiMcrWTdUoTb3b8stBQv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eb9742-ec15-422e-de2f-08d8e9565378
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:07:05.1845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnUvGkCgNOCxEhM5Bczw/t0V/boghEyzSlVLtPq26peuRzdCYfadb3Dupfxblxcl5TJW0yjIjgORE9FLuDAtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3211
X-OriginatorOrg: citrix.com

On Wed, Mar 17, 2021 at 02:46:20PM +0000, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()""):
> > On 17/03/2021 13:37, Ian Jackson wrote:
> > > AFAICT there is no explanation for why patches 1/ and 2/ deserve to go
> > > into 4.15.
> 
> I see now, rereading the thread, that there was a sentence about this
> in each patch betwen the commit message and the diff.  Sorry for
> missing that.  (Although TBH at least one of those messages could
> usefully have gone into the commit message, as useful motivational
> background.)
> 
> > >   We are late in the freeze now, so I would ideally be
> > > looking for a clear and compelling argument.  I'd also like to
> > > understand what the risks are of taking these.  Can someone please
> > > enlighten me ?
> > 
> > To make the code in 4.15 match 4.14, so patch 3 can be written in the
> > first place.
> > 
> > Also, as a side benefit, patches 1 and 2 reduce the quantity of logspew
> > from the impacted MSRs.
> > 
> > We cannot simply take patch 3 as-is, and say "4.14 and earlier" for
> > backport, because that still forces end users to specify msr_relaxed to
> > unbreak their Solaris guests, which is usability regression vs 4.14
> 
> This is plausible and going in the right direction but I still feel
> uncertain.
> 
> Jan, what is your summary opinion about patch 3 ?
> 
> Roger, can I get your opinion about the possible downside risks of
> this patch ?

For patches 1 and 2 the risk is low I think. This is already the same
handling that we do in pre-4.15, so it's unlikely to cause issues.
From a guests PoV they don't change the result of trying to access any
of the modified MSRs, accessing them will still result in a #GP being
injected to the guest.

The main risk for patch 3 would be that reporting 0 for
MSR_RAPL_POWER_UNIT would result in some kind of issue on certain
guests, or that it triggers the poking of other MSRs in the
expectation that they would be available. I think those are quite
unlikely, and the patch fixes a real issue with Solaris guests.

Roger.

