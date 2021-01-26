Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05A304366
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75254.135448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qtt-0002Q1-Kq; Tue, 26 Jan 2021 16:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75254.135448; Tue, 26 Jan 2021 16:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qtt-0002Pc-H8; Tue, 26 Jan 2021 16:09:05 +0000
Received: by outflank-mailman (input) for mailman id 75254;
 Tue, 26 Jan 2021 16:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Qtr-0002Ol-FF
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:09:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6df3dd85-2a7a-42c9-a69a-9626eb4f6625;
 Tue, 26 Jan 2021 16:09:01 +0000 (UTC)
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
X-Inumbo-ID: 6df3dd85-2a7a-42c9-a69a-9626eb4f6625
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611677341;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sfSoZ+zi3E0dC9gEl0CMZJvNIdQNqROLZDJwiq6axrk=;
  b=UPEzQ34AVaGLf6bw7ddVpPpWYJavtZmVrBVKxKvaX8a0ECyK+DYrp34Z
   fWGrW2eW8p7S0Wc3AhjlEgYQwFdEKVML+q5trNrESSe61pFpB/IOBo7Hp
   bYyGngjYQSD5uwDCEmXJliF/RNblytF8uDCmNgJrXNmZDpPQGbue6QgKA
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XpSQJtUVYHyEFO4zDDqODvuR4uGuMeiGFFY/U7pBXgYSGepOXOJC6rBetiEy9lMc2xFmN0POFV
 V+5/nF+RPMbHZbhhxOKr/6SRGexqnpWfZXVhMdJ/oAxHP51XbmX6S9sYxwOP9bMGFw651uu+Of
 kaFro21hsxEd7L4D/i5L6TdfnXejxrg07vKa9dBXTnuFC3Now4S0QSroI72kuRjtUwUBsDipDw
 z8TnV/v46hIW3V9Pd+D6ewjOo9xj0i8bR8IqNU7VpW2QIdneeXZoxa3Z2BL3huYiJo/uDIbuEI
 o+Y=
X-SBRS: 5.2
X-MesageID: 36087455
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="36087455"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBkWleEn3u5pn1BKFkQhy5y0+xLOtIujCFTMoWTHInVsvHpJSPM//LAY2LdWcFmdFkUAwUVSeKFSq1+qFQ9+N3dMvmQO6abU+mxEvI5brAR/CnA4eWHjS7DpBJbf4uXeFkUBR1EoO9lPVrXi0AjOkfeDO2VpoIMlf/IneWhajM02PGR6K9+vBQVLxVZGcJYvZlR0/WjstZWcrpv5FVkRF8HYwm216QMuTS8zMGZIw36zeuD9dh8fLVowrflcAEoMAKhcq0tpUsDjPe2wuc7C9WAW5bF6fMoY2IgVNDBBZoTdqYiT0jLfty7YR5zxxHJZijLuobJZOZ8Xxqt0boMejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/vQa2NbY/bVuHY04JqJMzn9D44lxaNuRm0/5qoznNk=;
 b=nZARjfuV2S74PAx5mTN+GB0Si+ivUr10fYostRpVkbjCYek7YMMI3ThyfuqLo2jMa+chPz0SAlQ9ok74ZvmSZtk9d5Yem2Xv1oW7wfw+S6iBcp9c2PmEbpSocXcP64jKmYmWrRCAjuLxwdaHLLyAzaL4RGmJpZ30VW/+9aoQ70VJyXAD3/jKlvoDiwfMboI11ExtpMsDZvSg+wdKVL7ypYxYSmj/gw2xYELa04Up+D7Lsj6lJhq4Xl4TgjEdxL393MC0d0b+AyjYoMt7iqZbWUE6+1fckUIEUHuVOO+ZeipuvzGZxAlg2EsUAZvn9xsaAvKRMHn0M1dmvbVSt9i4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/vQa2NbY/bVuHY04JqJMzn9D44lxaNuRm0/5qoznNk=;
 b=AcefBc/xR9jfYOpAXCyfCG6nt9QFD1tH7THB8g7sOJprSEQms94rGmwtDfsx89GNfIN5F3xmSckTygD9PA2drV0HbQ5Ts/rxpgJBbYfLoWx2Sd9mSYRvDCr2CTnoSbh1Gm58nkl35TbjJJAqstglbR3Afqd9ohP8gp7jBssNFNw=
Date: Tue, 26 Jan 2021 17:08:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/irq: remove duplicated clear_domain_irq_pirq
 calls
Message-ID: <20210126160851.3ocxqnkmmxzojrar@Air-de-Roger>
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-2-roger.pau@citrix.com>
 <10af3f2a-6f4f-372c-6d9a-c02fc730af4b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10af3f2a-6f4f-372c-6d9a-c02fc730af4b@suse.com>
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d26f4af-b497-4ac1-4d52-08d8c214af6a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5067:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB506766A99B2DC45AB6C603388FBC9@DM6PR03MB5067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ApWqBe8I6N7DXnW5YGBLU/6YEQT6tUs0kbtR1gSfMA4J7kOVC06cVh0Gw5ZdXQ73tSMeCW8yLGcRTL7CE1urUxLcg1fOAb//UTdYXKydQghSFWkp3Y0Y3cDFj/orhzrnvHzctu0jRjouCx01NFykP8kPOg42mB0ZO3epBpPPv7k3jiFvdxeT+MTy9KM4O+14qvHoiBCpALSxEAJ/R84sT4j8ryzIbWqWAWpLfZ4omLcygw7dKshN3XhByYvqQb1uYaJaRQhjNgVNDlFkJZdhA0ni1ONAeY6mU7Wql/yuqUv2pEu2+wUICKbQGE+m6hiwrj2CBqOZ7QTmHoiI4s3XjpoT0hBkOVuUha510mXt5m+abX9yQJh5eGnRTFuGQR5tJzlhLaXCf1kSyv/up+uhm4YGgui60cFfIqn26xbUs29PuiOuSi+1J89cZz1Ylx8JO2bUxAzFLz1e/g1ybDR34z89FJCazEKsqE34Ztfg74T2JDiXoKCs0R5OeOw3vWOQH01GDPX49fOAZW+tXmeotg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(39860400002)(366004)(396003)(376002)(4326008)(26005)(8936002)(186003)(16526019)(83380400001)(66476007)(316002)(53546011)(6486002)(33716001)(66556008)(6916009)(54906003)(2906002)(9686003)(86362001)(6496006)(85182001)(5660300002)(1076003)(956004)(478600001)(8676002)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TlA4VktGMXl6RjEyMUJwOTl0STgyQy82Y21HZnZ3b2tFS0dxejRRTVl5T1l6?=
 =?utf-8?B?a1RORGNhMmsvaEdFeGMySEg3aXVWZXJQWGxKaUJUeVZMQ0tubzIzSnZvN0Ry?=
 =?utf-8?B?V3h2eDF6eDlHWmJaS21LYm1VNWRRcjJTS0MzYVh6d3FXRm5kV1IrOGVRV2ZT?=
 =?utf-8?B?NDdXUDFaVWE4c3VxeTg2NHNVVnVBSCtKWUZBZCtQOEtGNTBDUSthSmU3SHJk?=
 =?utf-8?B?aTJQaEtCQ3VVS1F1VGY3Y1hJK2liL0t3K0dtSHVBdUZ6SkRqZ2xCd1B3SDF2?=
 =?utf-8?B?M2tGLzYweVVsQzBlcVFZcmtlQTJ0ZG0vWENDNmIrUWYvZzM2T0ZIdGl2MEpZ?=
 =?utf-8?B?ODNhK255Q0djbWZpVVJ0TXFGVFkrbWRkM2x4c093L3RIKzJzSWJLY0RSbHhM?=
 =?utf-8?B?eG9CTHh5dVZFWm1kWWp6NENZVGFGTms2TkFyR1ppK0hGU1RjYWlMNUVzeGJx?=
 =?utf-8?B?ZmoxZmU3TjFSNE9IeGh4OTBlbkFUVEl5MzF0SzV5VFZCVjlncld5NEUyVGJl?=
 =?utf-8?B?UHFsQTdJMXdyY0s1anBNS0wwVXI2Qk9nS21xYTEzOXlqYVRuSG9vYklKSUlh?=
 =?utf-8?B?OFdRMDdUekJ4OFpTamM5NmdZcjYwL0JYTUdkb2wzZXNTWkUwSzVKdzd6T2hJ?=
 =?utf-8?B?M1FuU29yeElTNDZzNW5RY2F3MjhXRmFRSElRbzZndkQ4OEFKN1BBVTRRWjVv?=
 =?utf-8?B?SHlHazJXbHpzQ3lUWFRFWWZmK3N2c3o2eStZZlV4OHVnV3l0eGNTKzZ4aElM?=
 =?utf-8?B?RTZNUkQ5bVFlMUI1MmRHY1ZRLytRcDUwOEhQQkk1RC9tbWtkZk01Y0xGYmh5?=
 =?utf-8?B?WVBMMXMybWovWkROb2J2WjZIRG5CL0w5YTJGekY3ZkV0cC9BRXJKU2h3Szd5?=
 =?utf-8?B?N0U4MGdvcTd0THAxR2hTNHhGT2dkcHhMSWdjaU1ud0VIM0g5RzlVUXpKOTgw?=
 =?utf-8?B?TU1NS0JuZ1QwaTNKVDdsYXBUVnkvelFaeFpiL0U5R3BiOEVCUTN6SUpKOWRn?=
 =?utf-8?B?UStqM0VJdzZwaUp5b09VYmIvN1BoS2J2WGNCM04zVHJ4SHJYZHhvL2ZZYnVh?=
 =?utf-8?B?c2I4WDloVDhmbVBPSmV1c09URU1tUHF0TitEV3UwbjFrRERFZUpBZHFIcG5o?=
 =?utf-8?B?aWVWaXZFOTRuamFvL2drdDJTSXVJeVFZWFJ1Z2NReWh1L1lkekZjTThGbGFS?=
 =?utf-8?B?d2tkazdvc094Y0pCR0kyYSthM0I5aGNQc3ViRUVMbTgwWGNCSW5HQm1uWWxF?=
 =?utf-8?B?TVRKMGovODgxVGgxTitockhISkNvWUJyaWJ5WHhGL3MvYTJMdXhLN2svcmpL?=
 =?utf-8?B?OWgrRzMwcDFXSFp2M1QvN0hvTHZJR1QwOS9tRTR2eHdpVXppbG9ZNStPdXBs?=
 =?utf-8?B?RThUYjRiRUlmZndtbGdTdFlzbjE5L3poTVdxbGZwRTBMZkg3Sk03ZVFXeEh3?=
 =?utf-8?B?ZENib213cHpCQm9pZmFwb1FYWXdTUVZvTWJ2ZXRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d26f4af-b497-4ac1-4d52-08d8c214af6a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 16:08:57.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrysWgUtAqvnrY6y04pgmsWxOHqrn09p13mJpjkOIYgoJJ15+I7hxPvydnERad/7sqJ2v9yV/4+dOOGtgskmVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5067
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 03:38:27PM +0100, Jan Beulich wrote:
> On 26.01.2021 12:06, Roger Pau Monne wrote:
> > There are two duplicated calls to cleanup_domain_irq_pirq in
> > unmap_domain_pirq.
> > 
> > The first one in the for loop will be called with exactly the same
> > arguments as the call placed closer to the loop start.
> 
> I'm having trouble figuring out which two instances you refer
> to: To me "first one" and "closer to the start" are two ways
> of expressing the same thing. You don't refer to the call to
> clear_domain_irq_pirq(), do you, when the two calls you
> remove are to cleanup_domain_irq_pirq()? Admittedly quite
> similar names, but entirely different functions.

Urg, yes, that's impossible to parse sensibly, sorry.

Also the subject is wrong, should be cleanup_domain_irq_pirq, not
clear_domain_irq_pirq.

This should instead be:

"There are two duplicated calls to cleanup_domain_irq_pirq in
unmap_domain_pirq.

The first removed call to cleanup_domain_irq_pirq will be called with
exactly the same arguments as the previous call placed above it."

It's hard to explain this in a commit message.

Do you agree that the removed calls are duplicated though? I might have
as well missed part of the logic here and be wrong about this.

> > The logic used in the loop seems extremely complex to follow IMO,
> > there are several breaks for exiting the loop, and the index (i) is
> > also updated in different places.
> 
> Indeed, and it didn't feel well already back at the time when
> I much extended this to support multi-vector MSI. I simply
> didn't have any good idea how to streamline all of this
> (short of rewriting it altogether, which would have made
> patch review quite difficult). If you have thoughts, I'm all
> ears.

I would just rewrite it altogether. Code like this is very prone to
cause mistakes in the future IMO. If you want I can try to.

I guess the problem with this is that we would lose the history of the
code for no functional change.

Thanks, Roger.

