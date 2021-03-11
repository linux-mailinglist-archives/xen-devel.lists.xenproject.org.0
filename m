Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19342337658
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 16:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96651.183093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMnG-0001k5-GX; Thu, 11 Mar 2021 15:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96651.183093; Thu, 11 Mar 2021 15:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMnG-0001jg-Cj; Thu, 11 Mar 2021 15:00:06 +0000
Received: by outflank-mailman (input) for mailman id 96651;
 Thu, 11 Mar 2021 15:00:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKMnE-0001Ut-TX
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 15:00:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebc9a2e0-e92f-4542-8278-b95502d94cd4;
 Thu, 11 Mar 2021 15:00:03 +0000 (UTC)
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
X-Inumbo-ID: ebc9a2e0-e92f-4542-8278-b95502d94cd4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615474803;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6vpo9DnhA7VyoWa4VZy2cWEDVSr8WIu6yX+xQUHxhgE=;
  b=BROq123OM3MCKJ1dXUbXzaTfc1ZuH3s3rIG2NYu3e2vXw6WE44pt3DJH
   6F7GQM9SKLct+h2CU4g+Dz/BR1M4RSbMXtm1uywaZAxfdEk6n6W0wAA40
   YFgAsxrh6KNNjxux7sOf29hmQMbOzaXyvRNfWVBOeJ36mRlk+9iyR671L
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M2STuQlVDud+4ryrtlSg+CF/bo3A9d1DBuyxZlbvbwPEql4xVaAFnzYweifdib9ij1+EwD2bGq
 PI9FMuKBo2RzXTCadUBkUfQENYLGgGhzsgzYcjn6rl+hv6J0J8kYTQZneISxJCT5kH4fZSKDOE
 5e0aU96NE5Ei/qTY8tarL83cM2b/feFFMLMIqIYNRf/sQefMGdjbFxdbK/j4GRSBgkG/u+G2ax
 R6CJuzuUDwB3Warl2gPetNTm48Kpu0ynK1wr6fW0t8QzMSvP5nY2kcGSANl4Ac5oWhG/sMhPUA
 REg=
X-SBRS: 5.2
X-MesageID: 40479554
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DbNMI6MQ1+kVP8BcTxv155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEq+GXH/a6NpJ8ZAcVI3SOTXOlUmJCMVZ7YXkyyD9ACGWzIRg/I
 ppbqQWMrLNJHdgi8KS2meFOvIB5PXCz6yyn+fZyB5WPGNXQoVt9R1wBAreMmAefml7LKE0Hp
 ad+cZLzgDIERgqR/+2G2UfWKz7r8DL/aiMXTc9GxUl5AOS5AnYi4LSLh7w5HYjegIK+5gO2y
 zvkwv15qKs2svLsCP05ivowLl93PfkwttHLsSQhsYSMSWEsHfUWK1RH4eskRpwjOaz6Es7sN
 SkmWZdA+1Dr0n/U0vwgRzx1xLu2DwjgkWStmOwsD/YjuHSABcZYvAx4b5xQ1/ixGcL+OxY6u
 Zt2VmUspJGZCmw5BjV1pzzeDxB0navrWFKq591s1VvFbEwRZV2toIl8EZcAP47bVnHwbFiKu
 VoAc3GjcwmF2+yXjTctmlr9tSmQm4+KBeAWlQDocyYyVFt7QlE83c=
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="40479554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAtZjd9lFFhTfkcer7mfB1Z9lfQVE+wTiUp17sNhF1a4/3/f6YZabIJNpPDTLHMbktzX7L2JK2XyNeaM4ot6MZVC6/IB6sfJ5cr0RXMJ5C9UvofkVZSAeEeZg+6EjmzdQVYWkeGyjnQQunDkQ+B/sm5Uexa8D4N4G0soOjNKJi83KT/PXmIH040PIoDFJ0MbRZjVaYDenlxxHV8LNNh38Hmxv55sC/GQICXihM9vPMVYExYAsraWCIhd9MSNLJWxzFOta8CD1cnfgCWCje8zJ5FspS0wezbgZyKQA4ykMLt8gMWE7/0pbZFawfwVgKMKkFT7SBZA7da92FPT7k0szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUG1TdsHe0NYVPn6jvX3nYhLe9Ns/zMy6s34wcH4tI0=;
 b=Wlmv9cH3DOe/0xsN0T7iHt6Y8DZOnnfdW0hm587TWSgNXzC7HlqTqQsR4ldvyeT512QgHarJlGQO+bJzWjVoaVHMMu89Ya/rOP7Kc2gtx47JsPx53dhwzyUK9ZsnFnyWcX//gJhQ7XURRZqKTNuw+YrM8YV4mztzxShJgrWm0NUwCIOTiS40QH9PO4nqahBUWBN8S7fYbv8edye4Yf5utxRC1Dj+WcScnKyfBW7M7zCTRUS7cvPK1+uc6HaCCU4LQwI6SqfjC6dX0n8eimYs9hs7Thx9WA9UJ+Qx1EQ+RJDh2TCuEWuBlgtJDpSd+2B1Qacy7vND6d3yhAxR0fjBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUG1TdsHe0NYVPn6jvX3nYhLe9Ns/zMy6s34wcH4tI0=;
 b=UH1VQLnagtSFwEfj3uenAZa7XNdMgL83BtcwP5QZEaVuF+dao2sv6EuszNypi6pXIBkTJ+hBzxMkr2JFRBp/+X2pr379pPY/IwIinkSiZl8kNDZYzERfB+70a0w5CZf8u2rJQB2IPa9BasLbeJQ61qwSNOCsgpSGZRrGaS3wUDU=
Date: Thu, 11 Mar 2021 15:59:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <YEowW4iX3J8pE9oF@Air-de-Roger>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
 <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
 <9a248354-f68b-8cba-f18c-f4a26473f9bf@suse.com>
 <586f5bcc-9d96-dc37-2aa1-aed0bf11117c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <586f5bcc-9d96-dc37-2aa1-aed0bf11117c@citrix.com>
X-ClientProxiedBy: AM6PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fbe9428-cfae-4b60-f7a9-08d8e49e4dfb
X-MS-TrafficTypeDiagnostic: DM5PR03MB3210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32105BB93E9B13126C9ED0768F909@DM5PR03MB3210.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZuVy9x8Az1V5SmuX0UmzK3nxiuuyYDFHm3hDRGZpGd/GBJwIucnFWQvUpTDBU0d29lz26iI1Rag2SvPPuY9Tz7J7ZPcItsp1UZXeuH+9bzKbLDrV5Wot50BWcqizQK4E876nSUUAtVCn9RB/G3WqOzMDWVZAvsGlhbMicHw7uwT/lIUxiqM+Oh6nAm66T6iAXVDdL6jYFlhsF9wu34kwaRbA1eVdZOgfXle0DDvWI/HkoOBJtEtW6esGJHHtPEiW139fA1B4+eQ0sfkO3eqKUuxnuShXIICptLkYD573s+5KYoLPnwD8Ne2vnSHq1gMlOMjoBnuHzLmggmAtgImrXJOCV/jhkgKXZvxY0k0tlcXqKckvokZiYiPI69w2Ze6bAH3nHEqPGYimK5X8rRqYS9zu+KGrN+rf5ECcAUNLfAVYomT3KB1jDgFqDTNQPRsxctU4ka2jfgG8QzyX7IoSr8EQLiuiHGYqfeI254Xm691lyKiHAvC838ViS1dYY0cBzdif9AJv3JUW2sBnhWi1YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(396003)(366004)(346002)(39860400002)(86362001)(6666004)(6636002)(5660300002)(4326008)(53546011)(2906002)(83380400001)(85182001)(316002)(8676002)(33716001)(54906003)(956004)(6496006)(8936002)(66946007)(66476007)(6486002)(16526019)(26005)(186003)(478600001)(9686003)(6862004)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NytOYTJrVXJNMmVIbmtZVzZNYzZvSTJyWWNUOG9UZTNVVVZnTlhKS1ZPc1k5?=
 =?utf-8?B?Q3lqYW15VjlCdDhtVUI4dWdUUFRZUkJWNDZidGZTTmVXZjMvNTlYZnhPbldL?=
 =?utf-8?B?bERXWDk0WnVjWGVnWnNLS3Y2QVg1QVB0ZGVqYzNkeUZ5UG03L1lmVzZLOGdQ?=
 =?utf-8?B?TGpSdStFSG5iWEhpZlo5cCtBckNqRHFFNUxTVjdqNkpLVURUUVVHN2lIdmw0?=
 =?utf-8?B?RGIxaHArZDJEVllxMThBN05sK2dieXRQTXF1VFpJTXQzTEYrbVd1VFAvbHJN?=
 =?utf-8?B?Z0xCNHRDeGVlbmxuOWV0Rm1kS3lQSkJrQ3MyeFY1MzRSdWFucHY4eGVaRSs0?=
 =?utf-8?B?VDBhZUQ5YUtnWlNTaWVDMEdXZHBFR1RoUnlqRlorVzlEUmpkY0tQalBoSWZI?=
 =?utf-8?B?VGkzVktWdmxuVVlYZC9XdDJwWGROZzJiOWhNWDdlUG96UVZMSzBWdGhFMWEx?=
 =?utf-8?B?R2pqNjl1STgzR0ZaZ0hQbUwwdDBIVUJDaFhCemxnVWhWQzVkaEIxcUJrOGJK?=
 =?utf-8?B?aE1NejlSRmg4cU9DOUQwRmJRVlRQN3lTbk9YdE0vVEFLcTFpcHJFY2tQeTJr?=
 =?utf-8?B?c0xDQnU3VjNsSUs5d2JWT0paTCtKTVA5ZVA0RTY2SE9laWo2Q2RtOG5HN2dR?=
 =?utf-8?B?R2JnZjFWU1FqZE54R09qWEFmU0pGS3c1TVpveHlENElmTVpsKzdmSHRzK0xH?=
 =?utf-8?B?NlBDNWZPOUl6VWdtd0pwZVZNTHZBZXpXY2VDaWdreGdXMUdWSFJOT1pUT1E5?=
 =?utf-8?B?cGZBK2p0YmdYQjNMK2Z4cTE2TExDbTBqdUQ2UHdBaTBxVEhzOXR0MEpJR3BW?=
 =?utf-8?B?aERxaXprVUtXSzR0K08zN2cydEs2TWYvQ1NseW9uYzUxaWxWeXJXV2VUbUhp?=
 =?utf-8?B?aFhQSlpTazU5M2tJTkZIYUFBRlNGcHFUMkxlVFNZdi9rcm5PbnBXdGU3RHhP?=
 =?utf-8?B?ZEFFb1FkVTBtSlgzOWxkVzJMcy9PRDVVWER6SkdKTE5wS01JQTd1NWRDOUJN?=
 =?utf-8?B?RTF2TUoyeTc0d1Eyc0F4VzBySGRXdHFsbmFicXVCejFESklRUDdTQi8rOTVG?=
 =?utf-8?B?Z21ScUx3ME5Ickc3ak0rWXc3eUlWWVFMMFRzZzA3L1VidVJ2MkhoYWhSbHRQ?=
 =?utf-8?B?S0VmaGFwQkZma3VXQlJ0cjR4NHhsYUdKSmRSNk1UVXRZOElTSDQ2ZkRHcVhR?=
 =?utf-8?B?SjVqRk9taEtGMDlkRStiUkt5VFFibDJiUVN2L2JtSEpIc1ZyUVgwVXFsMEJ6?=
 =?utf-8?B?S2U4TUdjUW51dGRpMGNuOWZuaWN6N0h2eFA5QzVUZXJ5V0NYS01QeWRWSC94?=
 =?utf-8?B?ZFhpSVAyaGdGWmVUSGc4MWR4NzhxVVFVT0ZQbWMzWFlUSVVmdWxiNXQ1bDVu?=
 =?utf-8?B?R0lmS3k0WkJJNG9JQTZTbENVVzBpaklHeE56VWF4Zm1SVmlHWE9jYVF2RllV?=
 =?utf-8?B?K0VMUDRDZStlb2dDMHlpOHFwVnQ2ZDVjREplYzVjL1VKYURWc0I4SVhSejNj?=
 =?utf-8?B?a3BaL2NmeXNDV3dJSXZMR2gybGJlQXVaWmRLUDRHaHEzdHFra2xEK1dsZW5V?=
 =?utf-8?B?d3RsSCtxQzZaOG1nU0h0bHhSVDF6b2hYVGh2Z1NrNnFqeEc4a1pQUTJjNlU1?=
 =?utf-8?B?WHZGenk3R09QdWlQNi9vRlNVUUFEUnZaR3B1enhyZ20rVUV5cFFTTUZLaUlj?=
 =?utf-8?B?K0VSdzEyYzIrNkJEeWZHVUhIWWpDQ1E5QzIvVjJlY1AvaTNWT1plNjEyRS84?=
 =?utf-8?Q?dof7cC+GmpYSjRlN4aTRj8OUk6B0vB5PfFMOT/q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbe9428-cfae-4b60-f7a9-08d8e49e4dfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 14:59:43.9131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhrlnpiC/YRAawoT0iQPE4OVKbA9CT1CdBoGwltaPa5l3fpR2RRt36BKGrIM6vQLoWlHrFJsQq08V3G4OTs9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3210
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 01:43:05PM +0000, Andrew Cooper wrote:
> On 11/03/2021 13:28, Jan Beulich wrote:
> > On 11.03.2021 14:00, Andrew Cooper wrote:
> >> However, having laid things out in this way today, it occurs to me that
> >> we should consider further cleanup as well.
> >>
> >> I do agree that code wanting to use the libxendevicemodel.h API almost
> >> certainly don't want/need the dmop ABI.  (i.e. an individual consumer
> >> will want one, or the other, but almost certainly not both together).
> >>
> >> Should libxendevicemodel.h really be including dm_op.h?

FTR, this is xendevicemodel.h. Just saying because it took me a bit to
find the header. I'm dense today.

> > I was indeed wondering.
> >
> >>   AFAICT, it is
> >> only the ioserverid_t typedef which is API shared between the two
> >> contexts, and we can trivially typedef that locally.
> > Hmm, a local typedef isn't nice - there should be one central point.
> > Granted there's no risk for this to change in anywhere halfway
> > foreseeable future, but still. Also neither C89 nor C99 allow a
> > typedef to be repeated - in those versions we'd then rely on an
> > extension.
> 
> I wonder if we're depending on that extension elsewhere.  As far as the
> stable libraries go, we are dependent on a Linux or BSD environment
> currently.
> 
> Alternatively we can drop the typedef and use uint16_t instead without
> breaking things in practice.  (As long as we make the change in 4.15 and
> we lose the wiggle room afforded us by the entire interface being behind
> __XEN_TOOLS__ previously).
> 
> Thoughts?  I can't think of any ifdefary which would help, and swapping
> to uint16_t would reduce the use of an improperly namespaced identifier.

I don't see much problem in switching to uint16_t, it's likely what
should have been used from the start in order to avoid bits of dm_op.h
leaking into xendevicemodel.h. Or alternatively a new type that maps
to uint16_t if we think that would be more descriptive from a header
PoV: server_t or some such.

At the end of day it should be an opaque handler from the caller PoV,
or is it expected that the ioserverid_t obtained from xendevicemodel
will be used as a parameter to other libraries?

If you end up changing the type to uint16_t it might help to expand
the parameter name to server_id or some such, as an id parameter with
type uint16_t is kind of ambiguous. We already have some comment
blocks to describe the purpose of the parameters, so I don't think
it's a big deal if you also leave then as 'id'.

Thanks, Roger.

