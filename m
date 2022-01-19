Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2500493681
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258775.446068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6c6-0002la-Aa; Wed, 19 Jan 2022 08:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258775.446068; Wed, 19 Jan 2022 08:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6c6-0002iz-5x; Wed, 19 Jan 2022 08:46:42 +0000
Received: by outflank-mailman (input) for mailman id 258775;
 Wed, 19 Jan 2022 08:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXRn=SD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nA6c4-0002io-3C
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:46:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f735d6a-7904-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 09:46:38 +0100 (CET)
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
X-Inumbo-ID: 4f735d6a-7904-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642581997;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7/rYP3S/GTuHtnWE/vpk0E/tpwCH17y5ZhjylmZ3/9U=;
  b=F8bAX2Gdqb5bExYPrnIDSGOW8PLoGn7GWVRpSxx/aMNHB+V+nytFB/vM
   /T9FC+/cv13JL2PmvpvD8KG1G3/Z2luG1mRbCXWyn6rU6ShCCRIchGKV5
   UvxtRGGz2C5NmykoHhsOiFIcWGnDxU7/CH/RtiGCI/vNoftz5rSJ1WzzO
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1zgF++htwVn4p8NMbXFpxH/6FLFHfETlW3zL4sbV9ffkDY8WddiBR7UqYdjWR7aoRqzYX5gCV/
 zEn0ZedqjE7bSFN6dxbVLFwEQ1jpj7usOAJfBhnX2pSVYpZ10juRKsA15S3IoLYZtoy+7LqKAG
 jvWnZgjPCeqvGfzVpDxn+rNkaLagQ4ReKzr+8i0fmUe9hjEhZcv2nVwhlF9nt3ncgWIQcTj1i+
 CDMquik7meD7KaGsxpWu0ptn7jvAtGZdYOegbgpYw8i8kNejmP7YKZctK7usj0C/ST5rvbV4ow
 PORbKSUsIc79CiI4Z+XzCWQZ
X-SBRS: 5.2
X-MesageID: 62294697
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1BF9zKrXnqQrtQDKUwBK+tO4AXBeBmL5YhIvgKrLsJaIsI4StFCzt
 garIBmFM/iOMDDyedAiPIq0oUICsMCAx4M1TlA/qy83EX8S8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHoW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZWreyMRDK3eousiYT9hFQNUOIYb6rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UR6eCO
 ZtGAdZpRBjAPidFJVtOM4AZgNWMm2e8LzAEsWvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0UsFiN9UI6BO3xZXmxT+fJEIBZWNTZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO93ABbvzt68owGOlor+p5
 ihsdy+2trFmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifhoya5peJmGzO
 Sc/XD+9ArcJbBNGioctMuqM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidilkVcuo+p0OJoZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHB/6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:4bzBvKuTQm1v2MY0/aAMq1G07skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,299,1635220800"; 
   d="scan'208";a="62294697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWdBsWd8fmZov+220hplsvyJSLqQrkvQVuYj5zWnCcQsvOHgiJUou4Rv2/WE6bQvJzvcOQh6FGVbg33D9oWrp0drnDoqH14gB1ySwSsExjU/Ce/thfHfkRnJ6jy/ZLZhA/mQelA9vzFC/rrEVqhnQbKjZQvTmIJLPJkSUR/wVwt90tJVEFQBTRp4CAYyE8WLPIIauFg/b0Ja1tdqqMjIEDCd67lNPVv/UTgUBBaJUZLBH7X+bBHZL6weRsS9Z3ltv04k8Yne8RYhAPNGFWMQa9zMkKnZl0jpqw4qtU4bTdtDMivVCkUZ4bOqrWhL9wvNPdtCgGKDljSf1qirbfp+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeLSh4Yg6b3fmZr3jFmOSIw8LngkfrgTdBlog1LrqeM=;
 b=JrbkuqnmMX/BtHBdHF0T5QMmVCdkuAdEB585WeOCK97wfzojo50qEBLi2hj8u/xUfv7k3I7svYrzpyYbrK9JVB3Cc34CE+SfnYEMdXwneuWdAJb13gHBqg86F4ViUy+UIHwUPrdqWLoWElescXB2yxsxfFhRqoZXZaxy5/i0qnBPCW9F9/IszWIqBQ/RNs6Muf+XOg1+nbHZNxJVGOE8lv1LGhoebhGnNi6XbM1E20NPj9pbJ/nrY8E/h+owHnsdHxZZbvO5iolH/owkLLsUpn493/Bam8w5EtQRK2LdJ4sXc0ANBcubvhKpea4xnxeP7UWrdfbdz7Qx6BzCrYa8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeLSh4Yg6b3fmZr3jFmOSIw8LngkfrgTdBlog1LrqeM=;
 b=F+cwpsqB95Ej8sRpZd7il6Ijdo4K6VYzVoybsIbEdkaUEwKKbK70yude96ksv99FeIKJ4Wq8eK3W/qxaIitkLYrDZv2MsctKKvDe8oYjfAkKL2oB8KxF1d9YimMChw5T1JenWcXoyw0Yl50JSaoKyMpOT2s/l4gfofDfCFsAdk8=
Date: Wed, 19 Jan 2022 09:46:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
Message-ID: <YefP4if57LzJGr45@Air-de-Roger>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
 <Yea2XRrFn7qCIx/h@Air-de-Roger>
 <4bc4e379-fc9c-581a-3b03-9025e9fd92cc@suse.com>
 <YebJPd62a7rB+KTw@Air-de-Roger>
 <1bc72631-6d76-d25c-bbab-6a7ae6f8260d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bc72631-6d76-d25c-bbab-6a7ae6f8260d@suse.com>
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba23a8e2-a300-43ea-48a6-08d9db283184
X-MS-TrafficTypeDiagnostic: PH0PR03MB6365:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6365BFC86B35A4E71A01D63F8F599@PH0PR03MB6365.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JP2VIQpBgNPDIcoMiI0Wl5pTE02d5JpcF6kEE0/0j1wX21GWOXMT52gyetxs6bFb8I+AIWwbEJ9Spax1cxLav1z0Ui0+QJfrO0/pBWmB7ZGGmWPiTaPI+mjZwa+XcQJz23y9t59qi5QAzkwvbPvGuQVu2+iJ+k9ClqxDibmkDi4mg9E9eiXZqTZOcwymV9vJvRLoJx85qLlSQc3DWGdWp/o8a1GHKZ9kbn0Uo9P/X/nlIBRzR8zZnothKvd9K2jZsYbASoEDU93lcjxnKyWZg8MOvldHovitOxQTU18EV2ghzJSNXQR3rwQez7DyD6cgxx0cC0SaIxoRTHAzPauEu62LvaoXxYPyyMfHc0MESLajYrAfp6z7XMCOsi8KoSHLdpvIlH2+b50ZR6lDwJbp6FYAPi4PM6AKii8tLKuGS8AUPQuSSWvzxlkfMdZF3OOfZCCidCLMx12gWpKHEHOvvN41ZD5d2w8U6iVt3kuY6CxMEhvxt8kg1r31txWsOmJTVBmEsFMaCtcz35s0OXkMyDEthtr9n305zLUbgy1ilwez2znVrQ7xdnzvJGk+hz2t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(186003)(38100700002)(6486002)(6916009)(6512007)(53546011)(6506007)(9686003)(26005)(86362001)(82960400001)(66556008)(66476007)(6666004)(2906002)(66946007)(54906003)(5660300002)(8676002)(33716001)(316002)(508600001)(85182001)(4326008)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 35AQVS1qf8UkjBT1Bdm/kz/1+3DsWp67ypGY7D6UUtr9mBwnlFx6xyPF+ZAUs4POSQlqRHTY7/V42kiIqAJWnocFTPdCC3ICEAFWuO0po/jfJo964MC3qIKiqb/mxnQTYuFy/fwFGieaRTaYcfn7GNzrh8SK6WBQLznsbFk6BwZQCVJFI9DMSLig/u8ynfBWwjyHg0z12SNmkN/jsSnaIy8Zy8bQFgDsnEMxTM5s3EYbWHHCMAXou/Ab8BeaMzA9BICmJNKVq9IEpTHYi8nBnhNBG76+lGmBvPeS7DfLrci/aOm9xxr7ffysOwVZXtoWEE3jAl6jX4/VOSHBdQe9RVzcATImCDh9S2nu2yF1gDAYgFKreccFhrrg0/LeingEGopAZ+aLrFZ2W6IPFyb2JEIKD26nVqPIThSuHn0oKXlElsuJf62xVjjzKL7fbH9+
X-MS-Exchange-CrossTenant-Network-Message-Id: ba23a8e2-a300-43ea-48a6-08d9db283184
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:46:32.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA/MCqFbOG7E/m8d6Q9VVwAkLOyzz4c9cILl6HhNnM8bfLcLDYBmRlHW8scTax2E2CLIJUFtaSOJ6RrvQDyvdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6365
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 03:26:36PM +0100, Jan Beulich wrote:
> On 18.01.2022 15:05, Roger Pau Monné wrote:
> > On Tue, Jan 18, 2022 at 02:39:03PM +0100, Jan Beulich wrote:
> >> On 18.01.2022 13:45, Roger Pau Monné wrote:
> >>> On Thu, Jan 13, 2022 at 02:41:31PM +0100, Jan Beulich wrote:
> >>>> Calibration logic assumes that the platform timer (HPET or ACPI PM
> >>>> timer) and the TSC are read at about the same time. This assumption may
> >>>> not hold when a long latency event (e.g. SMI or NMI) occurs between the
> >>>> two reads. Reduce the risk of reading uncorrelated values by doing at
> >>>> least four pairs of reads, using the tuple where the delta between the
> >>>> enclosing TSC reads was smallest. From the fourth iteration onwards bail
> >>>> if the new TSC delta isn't better (smaller) than the best earlier one.
> >>>
> >>> Do you have some measurements as to whether this makes the frequency
> >>> detection any more accurate?
> >>
> >> In the normal case (no SMI or alike) I haven't observed any further
> >> improvement on top of the earlier patch.
> >>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc()
> >>>> the calibration logic could be folded between HPET and PMTMR, at the
> >>>
> >>> As an intermediate solution you could have a read_counter_and_tsc I
> >>> would think?
> >>
> >> Not sure in which way you view this as "intermediate".
> > 
> > As in not unifying both calibration logic into a single function, but
> > rather just use a generic function to read the counter and TSC.
> > 
> > With your original remark I assumed that you wanted to unify all the
> > calibration code in init_hpet and init_pmtimer into a generic
> > function, but maybe I've misunderstood.
> 
> Oh, I see. I have to admit that I see little value (at this point) to
> break out just the pair-read logic. While I did say we have similar
> issues elsewhere, my initial analysis has left me with the impression
> that those other cases are sufficiently different for such a helper to
> be of no use there.
> 
> >>>> expense of a couple more indirect calls (which may not be that much of a
> >>>> problem as this is all boot-time only). Really such folding would have
> >>>> been possible already before, just that the amount of duplicate code
> >>>> hasn't been this large so far. IOW if so desired, then perhaps the
> >>>> folding should be a separate prereq patch.
> >>>
> >>> You could even pass a platform_timesource as a parameter to that
> >>> generic read counter and TSC helper.
> >>
> >> This was the plan, yes, in case I was asked to follow that route (or
> >> if I decided myself that I'd prefer that significantly over the
> >> redundancy).
> > 
> > I think having a generic read_counter_and_tsc would be better than
> > having read_{hpet,pmtmr}_and_tsc.
> > 
> >>
> >>>> --- a/xen/arch/x86/time.c
> >>>> +++ b/xen/arch/x86/time.c
> >>>> @@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
> >>>>      return hpet_read32(HPET_COUNTER);
> >>>>  }
> >>>>  
> >>>> +static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
> >>>> +{
> >>>> +    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
> >>>> +    uint32_t best = best;
> >>>> +    unsigned int i;
> >>>> +
> >>>> +    for ( i = 0; ; ++i )
> >>>> +    {
> >>>> +        uint32_t hpet = hpet_read32(HPET_COUNTER);
> >>>> +        uint64_t tsc_cur = rdtsc_ordered();
> >>>> +        uint64_t tsc_delta = tsc_cur - tsc_prev;
> >>>> +
> >>>> +        if ( tsc_delta < tsc_min )
> >>>> +        {
> >>>> +            tsc_min = tsc_delta;
> >>>> +            *tsc = tsc_cur;
> >>>> +            best = hpet;
> >>>> +        }
> >>>> +        else if ( i > 2 )
> >>>> +            break;
> >>>> +
> >>>> +        tsc_prev = tsc_cur;
> >>>
> >>> Would it be better to set tsc_prev to the current TSC value here in
> >>> order to minimize the window you are measuring? Or else tsc_delta will
> >>> also account for the time in the loop code, and there's more
> >>> likeliness from being interrupted?
> >>
> >> I did consider this (or some variant thereof), but did for the moment
> >> conclude that it wouldn't make enough of a difference. If you think
> >> it would be meaningfully better that way, I'll switch.
> >>
> >> Both here and for the aspect above, please express you preference (i.e.
> >> not in the form of a question).
> > 
> > Let's leave it as-is (just one TSC read per loop iteration).
> > 
> >>> I guess being interrupted four times so that all loops are bad is very
> >>> unlikely.
> >>>
> >>> Since this loop could in theory run multiple times, do we need to
> >>> check that the counter doesn't overflow? Or else the elapsed counter
> >>> value would be miscalculated.
> >>
> >> I don't think I see any issue with overflow here. It's the callers
> >> who need to care about that. And I don't think this function will run
> >> for long enough such that a counter would not only wrap, but also
> >> reach its initial count again.
> > 
> > Right, I haven't expressed myself correctly. It's not overflowing the
> > issue, but rather wrapping to the start count value. Limiting the
> > iterations to some fixed value (10?) in order to remove that
> > possibility completely would be OK for me.
> 
> Hmm, I was in fact hoping (and trying) to get away without any arbitrarily
> chosen numbers. The loop cannot be infinite in any event ... Please let me
> know how strong you feel about putting in place such an arbitrary limit.

It was mostly for safety reasons, I wouldn't expect that loop to need
more than 4 iterations really (which is also an arbitrary chosen
number). Let's leave it without any limit then for the time being.

Roger.

