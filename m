Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FCC3FD5EC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176114.320557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLxb-0006py-Cu; Wed, 01 Sep 2021 08:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176114.320557; Wed, 01 Sep 2021 08:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLxb-0006n0-8Q; Wed, 01 Sep 2021 08:51:07 +0000
Received: by outflank-mailman (input) for mailman id 176114;
 Wed, 01 Sep 2021 08:51:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2BIO=NX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mLLxa-0006ms-Ba
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:51:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdaf1fd8-0b01-11ec-adba-12813bfff9fa;
 Wed, 01 Sep 2021 08:51:05 +0000 (UTC)
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
X-Inumbo-ID: bdaf1fd8-0b01-11ec-adba-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630486265;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=c5BPbbgDzXeGsbVpJsVVbJNoVdDurBT7ZZTxaMMGzIc=;
  b=L7kO4sILxYSXL55X0OiPDgnBiFC1HRH7AORZgeg3Ldi5Tql+Y12QUQ2p
   ToKulxVnmVOzp7kzSDMV58Lv9usBvqeoB/cHfLAFio1Apuj6RQuIVb3rT
   Rbx/oVuOva6OzcUTME1eQAwFlGSZWakuBDmF4lPj9oc6R/eGsryCeB/Xz
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lgfB78udmYi6OtbUqX306EOhJxFENfODhTtu2W5RrgqhwIDVpIkwcZ5i0F9BhawhweG2BQ9ER5
 fTCoqURUoT9+APor9ZoeVdOS1hh+bzAUWIaomuleZgwbbQsj4Tx2Hy/rNafYGbRTVD3tOjN1n4
 /1FBLOOk2g439cJfPN55RHnz7kRgMt4VSazqR5/ZAA/0wVFu8VIKMdxrOHkmPsPYOLQnJRSFPK
 jYsiWniuTbOKGrFxr9KReIknXXbNMuqOVuT1ZvBCVhT1zOOI2ylZo7+7chAr7QR3cOwr0Vo4P4
 JE505lO4P5szXlesGlih4fMQ
X-SBRS: 5.1
X-MesageID: 51745793
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:08NuUKD+Jn1i6JflHemV55DYdb4zR+YMi2TDtnoBMCC9F/bzqy
 nApoV/6faZskdyZJhko6HiBEDiexLhHPxOkO0s1N6ZNWGMhILrFuFfBODZslrd8kPFh4hgPG
 RbH5SWyuecMbG3t6nHCcCDfeod/A==
X-IronPort-AV: E=Sophos;i="5.84,368,1620705600"; 
   d="scan'208";a="51745793"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgXrF9bGjjjNkBdYvOBcL7jyF58lasdR/IR/CWctvywq8YtpkdNGUpJHRDqBaZ+fuc8u2PvEOgm6OoyLGdPGA6UALRGwWi3pdT329954L/weVkLqGelvGoFa2yqgsQz5IO+rqwpC/sq+wlHgN4u76SSeasjC17TegLo1utt8RmA7mQoXbXWwi4CE6V1uww+gGIp1qvfuIiLfhGJ6SOd0Rr3YJHdRb5znZa8H3oQBeCoxTL/s1hbM76GD8nlUpjCJbSwZ5rKm1xbuiKZzRLnESWXVT0PjgTULyLHHZv6hAPN3MTxMvmhxt9faXdP4jHY6PHd6zkXs6ee5ApLUxVYc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e4RLCQgFsrNS291skH1nHoOEX+XScfAtKaNRaZxFwoU=;
 b=PyKHCnG0INawMV6wHy37ClZw6lei8xXJGZV/8Bt6HfUJIeeqjgPh+IGMIxBTnNfhsYicgXe6NgDXMRMvb0hcLvTButqlBYVSD6AbsJFAlJq4/4/zWCs5raEPEzsvFwrFXAGv9mWoKkWzrADqTDkG135OvmQ47p8JVcBNfYbmScv4BtjdTWu+TDwkhi36kv59GAqfAz2Q/05kWIKqrtUBNzYnBUwSzjLCt09E+QB8zG9ush0EhcGk04e/e8uB8s71VeaI+rsZbQcrEbYZcHFugK2vZYBSr723/Bxllx2TVtChUUfxqtL9hizFfm9l2iNo1EJdmG/N5iwswjAI6vLhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4RLCQgFsrNS291skH1nHoOEX+XScfAtKaNRaZxFwoU=;
 b=wUy4beXJniV/LrimrjE7RQfJMclVhlrN1zNMmT9ebFcqPcrorCcDhVXMdEAzDHOJv1RGIW7XX45d/IdC5IVUeAwvBnNquIRYs4dJuSVsfbMZOhrScjgdHeMWvlPjtYSRXYmjd30bc+eoNQLdRNeYVKgycdGNRDbzUks6th/09T4=
Date: Wed, 1 Sep 2021 10:50:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
Message-ID: <YS8+72EY4FrvSSIx@Air-de-Roger>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
X-ClientProxiedBy: MR1P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e507f84-7da4-4c92-8d50-08d96d259f47
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53401376433CE66242268F668FCD9@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Xi1t4ey2SfWP5qDX/83sCaQBR0uWj5q+08rnJZLTDj9kRl1f+SZ4f/mytSD2kwvXGKbU35LM75c3MQHC+/a7OFdBrvl6uV5uZoCgY6LlMqvG58M4TbE49FwJfhh7sCnaR+C8X+V+iCFZWIABIBTRaWZldDytZ9YPuesYW2Wj6JhvAE6ofd0Y5JLHGqDsm/oeLot0+tdCXG/V7QvuCp+TMPDp6qWHVNueniwtVfJt1Zm2YaKaVZuGEeLOaT4MgooGiaq1RtVTGswikKqt9Zgn3lb3eoQVWWPmbKa/tfdYypfFP5jxK8KEMkvRU9+ItqqgGzi7WfHMyXe4Z2SDtEpj9loH7E0OyXc6H7TKwcm7jLWw8HTMYjn2A7gM/TXhMZsV3O1EWWiX3PwjPAYhDWHPDOZcCW+3Vf9rDpBcTnZZ8yODj9sjtpKVLvzxAzU444f90IR5bNom1xiSpE7i9n1hdbJVHcDoVr/tvuEImORqtjKa8T8H2hPdD8ffcjqYcRJlgWK/XWROM5ol6NbwTKtxVGgH4An7i3Ob06PVbHXzLvcmQbSxVCrKZd1sB0Z70E94JTyplf1TMhP4K4cQR+7X/pUuGYgFhkYZNwRmpi1tnAQIhivXqzy+iptHimkkmBWLlbagFC5mNEAuZ4R1MMgDt8KuRAdJde8QZx0NcmyWNrdV3ATW9lpJaKg+x+gN+NWEg5lc5yRMW0mtD8403ACmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(26005)(54906003)(66476007)(66946007)(66556008)(85182001)(5660300002)(316002)(9686003)(186003)(83380400001)(6666004)(6496006)(38100700002)(53546011)(8676002)(33716001)(956004)(2906002)(478600001)(8936002)(6486002)(86362001)(4326008)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE81eTZYTSszcHozazRGcSt2cjhRbmRjVFloeUhEUjNZVUZ0TnlvbWlVcDVU?=
 =?utf-8?B?SG0xNXhIbGJtYzBzTmJyNmJld0E4YzNqeUdBeVg2ejJkZ2Z6TWpIdFY3Z2kr?=
 =?utf-8?B?bjlBclRWK1R3Tm1Jc1FOeEtzV05ySWptQWY2Mkd4U3g5c01PdUtKTEJVak9o?=
 =?utf-8?B?eVhYZmdLUllvaG9rZERaSlVSb3lpQWVMcGV5RUcvNG1ORGRCV29PTGpiU2ty?=
 =?utf-8?B?VitKTFZuUnVadHFoZWlubFRWV05tb0ZTVXBzQ0tETEVqQ3B5eTRlMWFoc2M0?=
 =?utf-8?B?R1pvQjJWOHlDWFlLSjVHcFFwOW40NEgrYS9aU1ZmZFBFUXEvSzg0ai9OeVZu?=
 =?utf-8?B?OWMwUEJBeEtGT2lheXR3RU5zYXVYYnlBSnBBYnk3WGlyb3l3T2xGY1ZNK1BX?=
 =?utf-8?B?YVFBTlY1L2V3dnJNWmVFazZ2bUlxUmRpeGlneCtlRFdVV2xWYXg5TnFyeEQ1?=
 =?utf-8?B?OURVRXpCbVo3aE5YREZ6blhoV3RXeWdQMXk1bm9GYUpoSW13VmRBMmt3b2RV?=
 =?utf-8?B?czA4d0xqUmlDdUFtMXoyYlJ0QWtZMkg3NWF3aFZLUFhreEUzaTdCZUtqUlhX?=
 =?utf-8?B?N01EOGxtamcvdzlEaENCaGxuK28wemJzOUhFMnJLYUNZVHFkZ0tYV1lKaFNp?=
 =?utf-8?B?bUFVdnpPN0M1Sk9vQ0ZJV3hzUnVBQkREeXRQUW4xQkJJeUU1MW5wdWxMS2xO?=
 =?utf-8?B?SG1jUWFhbWE3ZXFFYVN4a3hzNG0zYVVNalBDSlhiTHJ3cmJHbXhIU1lTZ2No?=
 =?utf-8?B?K2MvRjEvYWZTR0NrMXFGVFNmNEtSMk5QMnQ5eGtBRTV6Z2dsbUdLNUZDQVhH?=
 =?utf-8?B?NWdhUnpGZXMxRk12cFdFOUtYK25sR2JVZkVGOGkvWHJENG1FNU9qMDdMck5K?=
 =?utf-8?B?OVRKOSsrOVMySVNvS1BKODNZL0pzUWhLb0NObXhWNDNCK29QSGdjbGQ3dFp5?=
 =?utf-8?B?WEVmYUw0WFNlNnZzaWlGb3hHb3hyaDJldFNzcW5OckxsQkpFbzBrYmc3cDZw?=
 =?utf-8?B?a3Arb29lZGZiZG9KV2ZXSnJWRHdabnEyWTVQdHg0VGg0YWlXNWU4Zy9vWk8v?=
 =?utf-8?B?Y0IvbkdWVlVFYTcxU00wM2VXNGhGZWxmdmhRZmhxMERnMWtEQzBCTm1XYkFR?=
 =?utf-8?B?YjJFY2Z4VHF4OS9lNmdnRGhNTTZ1eU1LTmFHVlJyellGQ0pwdFBEa3NqRTdj?=
 =?utf-8?B?eUJ1V21uYThhdXJrME1CR0h4SFA0b21yTU0yNGFxWWE5b0ZtVG5WOTZ2RUVw?=
 =?utf-8?B?TzlDZG40cDdBU3llTzFlUkFFUzRpZWRaV3VDODFpQk9nZWg3TzhLQnVtQ1da?=
 =?utf-8?B?QmJXZi83c1p5ZllxVU9jQzd6NFpmZDFHRGM5Rjd0VVBhU3VKLzViUk11S3lB?=
 =?utf-8?B?bUpvUU5LalJNL3huN0cwNkVpbG9mQnoxbXcveEVVcjlSUG5iNFZqVXl5TVFv?=
 =?utf-8?B?bm9NNnA2TXhhc0NVeFBaZW9vY2JyRTBOUE8yQWsvVzd1V2tHQTVDVVRkY0hG?=
 =?utf-8?B?Ym5mNDBjSVFVZFBTR0NUaFA1V2ppWm5PbEM0alN0L1ZreVN0MHp4RmVZTUNo?=
 =?utf-8?B?QVNYWTJIVVFTVlRWTGxGdG80aWh1Uk91TVEwd3dtZ21pTTdQWmZ0RXN5VWZW?=
 =?utf-8?B?VDIwV3RwZEtkY3h1QVV6dmsxQzAvNGd5cGllUXpFQ1B4MUVDTllxb0JMM01J?=
 =?utf-8?B?SVFsTWpVSHVZK3JpbUUxYnJCWlgrRWUrOVVxVnVDZnczT3ByYm5MSGk5MWsw?=
 =?utf-8?Q?UOJDg1V5OnEB1MU5/ODUtFR+Lf3X5AYflEGqNA+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e507f84-7da4-4c92-8d50-08d96d259f47
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:51:00.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T45VGRtlXO/btqlM1/amhcL/yWWc5kq5OpllMPih6nAjE7mKAq+HeQwJIkxXRuKW6bIl4AssSoo9pJQ10mqXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Tue, Aug 31, 2021 at 05:38:49PM +0200, Jan Beulich wrote:
> On 31.08.2021 17:25, Andrew Cooper wrote:
> > On 31/08/2021 14:26, Jan Beulich wrote:
> >> On 31.08.2021 15:16, Andrew Cooper wrote:
> >>> On 30/08/2021 14:02, Jan Beulich wrote:
> >>>> Further permit "access" to differ in the "executable" attribute. While
> >>>> ideally only ROM regions would get mapped with X set, getting there is
> >>>> quite a bit of work. Therefore, as a temporary measure, permit X to
> >>>> vary. For Dom0 the more permissive of the types will be used, while for
> >>>> DomU it'll be the more restrictive one.
> >>> Split behaviour between dom0 and domU based on types alone cannot
> >>> possibly be correct.
> >> True, but what do you do.
> >>
> >>> DomU's need to execute ROMs too, and this looks like will malfunction if
> >>> a ROM ends up in the region that HVMLoader relocated RAM from.
> >>>
> >>> As this is a temporary bodge emergency bugfix, don't try to be clever -
> >>> just take the latest access.
> >> And how do we know that that's what is going to work?
> > 
> > Because it's the pre-existing behaviour.
> 
> Valid point. But for the DomU case there simply has not been any
> pre-existing behavior. Hence my desire to be restrictive initially
> there.
> 
> >>  We should
> >> strictly accumulate for Dom0. And what we do for DomU is moot for
> >> the moment, until PCI passthrough becomes a thing for PVH. Hence
> >> I've opted to be restrictive there - I'd rather see things break
> >> (and getting adjusted) when this future work actually gets carried
> >> out, than leave things permissive for no-one to notice that it's
> >> too permissive, leading to an XSA.
> > 
> > Restricting execute permissions is something unique to virt.  It doesn't
> > exist in a non-virtualised system, as I and D side reads are
> > indistinguishable outside of the core.
> > 
> > Furthermore, it is inexpressible on some systems/configurations.
> > 
> > Introspection is the only technology which should be restricting execute
> > permissions in the p2m, and only when it takes responsibility for
> > dealing with the fallout.
> 
> IOW are you saying that the calls to set_identity_p2m_entry()
> (pre-dating XSA-378) were wrong to use p2m_access_rw? Because that's
> what's getting the way here.

I did wonder this before, because I saw some messages on a couple of
systems about mappings override, and I'm not sure why we need to use
p2m_access_rw. My first thought was to suggest to switch to use the
default access type for the domain, like set_mmio_p2m_entry does.

I have to admit I'm not sure I see the point of preventing execution,
but it's possible I'm missing something.

Thanks, Roger.

