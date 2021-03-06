Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62B832F921
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 10:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94198.177697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lITBP-0005CZ-Uj; Sat, 06 Mar 2021 09:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94198.177697; Sat, 06 Mar 2021 09:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lITBP-0005C9-RD; Sat, 06 Mar 2021 09:25:11 +0000
Received: by outflank-mailman (input) for mailman id 94198;
 Sat, 06 Mar 2021 09:25:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0Tq=IE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lITBO-0005C4-D6
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 09:25:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9e5029a-7617-45f8-8ae1-84811b23834d;
 Sat, 06 Mar 2021 09:25:09 +0000 (UTC)
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
X-Inumbo-ID: b9e5029a-7617-45f8-8ae1-84811b23834d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615022709;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8Unpw/YcfVZpRM2zp4qu9cutioGPCHmpH63sKv7fI5U=;
  b=cXcbuVzR/U0SaTn1FvOWzFIX1cn3ajKDLSrUdOX/7I/HX3Rg+ZTryuoP
   /WNXwFlY0pYiWNKkpU1P0cDvxpdVxs11oEff0tb9s8u7jzYW6WuwxO56L
   m+xrpg7c7yw6bDC1effulr0kdv+o563M7t1sJ9xOvyNMsS9Jvi7MN57HY
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s4q4wmAUkryzz6IvL5ao19LMxCo0q6imb2tSHlp9203EhEdv5+s5GOWSrD4hhiVFCclqI51hlW
 SkEDIhhJiNZyQisizD0/lvRtmSfNColN3L43vU+0dwGGazGHLLDWVJuoc2ny/aK2Tjy8xmDWO5
 o9QLFQUGeOP+Tus9AGwaZUm7cfKhf64MYpB568OidkS8A2FQnuAwvTMFGaH3nR0cmwIHBjLObg
 lQSJt7N2I8E374GVJ1d8VDt6/KyFOVHwSdxO73mmNycpyWhXfybxg5jw2f4z2kuOi3x6FdpRzz
 j7c=
X-SBRS: 5.2
X-MesageID: 38704442
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,227,1610427600"; 
   d="scan'208";a="38704442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGr/8tKDE49qWeKQJoaG/Pehr/CjQ2bf67wsjGR/s+RSrL3mtzylSv1BhAT8kc0qxxS0ARnUqFhX+0/IM2ehVAgpDz/9SWz+4v8VyywSB0Dy8Vfm7q72It6vTU/ngaMGV0zpK1CKrcIHM+qOap6grgkI4u7RS1ZaYkUbOKqc7PTYcRwTTvsDq7JAfUeHY5cwKfQOQ48CJ8jwokDdCMDkVSSEN3GltO5uhydP1bsmQVd9RhnrpOC0M5e3SOlTd1annwFmU5GDN3aKubtosZTMpOaDOmaZm9/GltHE5X1HZFo2/jI2x5uM1SCOumNsBJL7YQRQH0c8Wd9NpHtn6HE48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOtbAJrnahx6I+kOFRApaW5B36Z+rn4YKWhh/raHCZE=;
 b=IVfUjIGXdiUzxl894NISzZ2JLK2KmpU0hQbxaBPLvDGQQI6EXlVaNwvCgJWq5PC5FF0IGICbAzFchOJQlvhVQrlVy43xvz4dtc0dKY6svx4/xZtEimSAK9+rtD8MWQPRkH+SaW0SVzjmO/8ZOGK4PtrwCuv25X4+5veOTPV+dorjPQ2J1ZlQAkgvNQMNGXEHq/shr21mbBoxg5EACUvjnoNAd7LzNtPPetp+FKCab3iqKT58Gq0ZyUMdwjhd233graiq8cb3nnEhmyfN39wD7/7FDqa5aYnKdFLgwWKSZCSSE4ByyCxnBtn1nlyp5gDH+EJvH+AmHbHj56VSVdSh4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOtbAJrnahx6I+kOFRApaW5B36Z+rn4YKWhh/raHCZE=;
 b=C79t+cvA285kyJ3HsKoIFDBE6mSKPV5dJDNfI/ag2r7bkCD3fPFYWPT3DEDg05VcWWgr4XZlYR02+OeMltd/CfUshYQ2uGe7kFH1+uuJJyofACuYWe1JCFvGwtZpk3IdqwGjS+qLzrdt/SDuLrqe/lCl7eDEnDvwm2/Q12IPLcc=
Date: Sat, 6 Mar 2021 10:24:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH for-4.15] automation: Fix the Alpine clang builds to use
 clang
Message-ID: <YENKQ6/QA6igk1Ff@Air-de-Roger>
References: <20210226110233.27991-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210226110233.27991-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AS8PR04CA0225.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f2::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26c43a8c-c56d-4f9b-3e23-08d8e081a227
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3738AE4AC17B45577C8AB3438F959@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:234;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IgeYkCBOzAMOL7F04jbKghd1ekHbuqK18aCh/UatUV0HcnTZnQzLyN+cw8k0jKQm3ygPZufex4y241MbG75IaEVcB4/TAiUlzNc/nmfq0vhUDDAlLQ2HLfQ3SptmXHedT8m3N1euKFFe4tqRJ25nzUDmX1gYDM39sD2IUCnCwye1SAKB2FlNB605WBCvnSYJ/HfL4qfFFqMc16t/3m3p+Cghx3yrgsQ9IpueMoP3B8bAFjjN+turUJvdUz7NgXDyhWQjoOnF9z3QYRXBYRMhHpIjQqU/YlXLlsix9C8p0JpvA3JusnpOVkzQ1zi4MvGCAWArJxlr0TuH4E0GeeeVW39CfHUBS3sQMuJPggZZA7vdZX4m2bfk1vrlOATmtI28WjzAcFg6h2W/NYMs17759zjhByfkgwV/d7GmSF4xA8lPPih1RlZ1HQjsPbIvRRJn/2MB3R/kUM/MI+BAySuaEFWpoF2SVMRZD2NhBf0z6SRovEeY7WxwyAUwIzziK7tj/lVHEf7HTU3Swsn7OhBvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(33716001)(186003)(2906002)(26005)(9686003)(8676002)(316002)(54906003)(558084003)(16526019)(5660300002)(956004)(66556008)(86362001)(6862004)(66476007)(6636002)(66946007)(6486002)(6666004)(4326008)(85182001)(6496006)(8936002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dy9xcmgyQ294QVZmWWFQekIvUDFWZ25sSng5V3QyZTFSUjlGVTF1clRuZFZY?=
 =?utf-8?B?dkoyYkdzaDBaRGNCTldyU1JTK3dybFdVWTA4cFJhcXJxQ0FlUnZHS2h0STlq?=
 =?utf-8?B?aGR3cFoybHB4KzJWNEFtVE4rWkxWZXRHejJaTC9ua2VzN0haMFZUbzl1S1Rk?=
 =?utf-8?B?RExHQ2M0bC9PbXlJWU1oMzNsdFlWc1NKUlNGa0YrNEthVGowOWZQNS9DMFAy?=
 =?utf-8?B?Q2lxMmxvUFU3ZFdLMlN0QkN2NXBPUDIyY2FXV2xCK3ZsNFlaTlRVZlRQQUZp?=
 =?utf-8?B?cFdqOUZVa0RpZWcyWCs1TEtVWmVxdjU0OTVLVXcvQUUzbHk2L0dmUU1zekVP?=
 =?utf-8?B?VjBubWFXQ3Z2b3RqQjBDM3R0T0o1d2JJci9LR3BQZmM4dmVtOHM0Sm5jeDVC?=
 =?utf-8?B?bFkxWm1Na1VHaCttRm5xUFBXZ29DZ2IyZ0tySWNSZmdiYU5UL0loalF5bWhx?=
 =?utf-8?B?V2xid3ZVUHpua0lIR2lIMjE4Um02VFlZcFFsRkdTMUh3WHNqOW5qZ3EvY3ow?=
 =?utf-8?B?SGxrSGZkVzNtL2RBQ05GMVhjTjhRcko2R0Jxb1crNGlibzJTMWxOL3VVNmFW?=
 =?utf-8?B?RlFBbzZzUDV4YUw4U0loNk5aT0RvMjZnYjJ6ZmlmT2trWTJTbUd1SGhwQUtx?=
 =?utf-8?B?VDVrYjY1eERCRkZKUlh2TmJwSzlIOXF6T0c5TDVXQUIvTlZvZGx5d1BZTlRR?=
 =?utf-8?B?Mmd1S0ZWNllpalpkc1JlbmVuQUtlLzZuaUpYWWh6NFBoQ3BvWkdTSFBMOVpn?=
 =?utf-8?B?UTBiWmFhb1BUdG1YYXZ4R3h5akdNRU9TU1JhWDh3dlp4WDZCTHN6TjNVVmZF?=
 =?utf-8?B?UkJER3JYeDRJUnNVM2ovdy9EMitvK0JaUWcybk10TVRkZnNrUHR2eWh3cEdj?=
 =?utf-8?B?YnlyRk82YXNCS0FPSERUSndRckFNNkNpQzUvZERhb0FUMy94UVRHTHZSUzl3?=
 =?utf-8?B?R0dKZzJvS2hlODYvUTJJSzJXMWFLL2UwVlFFUGx1UE1HbGIzQVpzT1pnWlh4?=
 =?utf-8?B?MTBrMzU4cUpDb243a0pYNW14OXIwbWg4V21kR2dQVGd1T3pKdEltbnRrOUcz?=
 =?utf-8?B?Wm9mSzlmWTZlSjh1NG5QZTFDa1pjNDRGS0VmVnJJS1ZJYldTaFljQ2FwaTdr?=
 =?utf-8?B?T3NwUkFFSmpjcXNDcjNMd1JkM1NMbEJybXhhSjhWdmxCSGEzUGhpWU9rWmxm?=
 =?utf-8?B?SEZ3MDNzUUJEUG1Td0ZMdi9LT0xvQXFuU0J4NlhyOUF5RmJZa1V6L0dodlVJ?=
 =?utf-8?B?MFJsU0J5Zit1TTZEMWFSQVZOeG1aeGNTOEpPZENBRmxGeVJPc3RuYlYrZ08r?=
 =?utf-8?B?K1ZiUjU0eG5rOWFtMTRKOERoMVE3dWEwZ2xlWklVRnBCSFZTMXFkWUFNVlZQ?=
 =?utf-8?B?bHdJUVRRb20wMlgrd3JFdGZNRldWaWRDOGdVcWEydnErcUR6YnBSSVpaSFpj?=
 =?utf-8?B?cTBCMlNVVVRtRGpQNElsN3hBdUJwc3BmN3ZweEFLekM0SlZCU2lRUDh2emtO?=
 =?utf-8?B?SDRwRXh2dk8vR1d3OFhqZUpNNmNRaVBnTzJZZzVYdGZUdjE4Vmh1K1FlbThO?=
 =?utf-8?B?UWVJMDJhdnExbk05aFl6aWJzeGZYd201WWRvaEVjTWRHVk56VWx5UnNMYVBX?=
 =?utf-8?B?VVNDNHpOOG9lMU9Bbm9OU1ZSbmkxa0RqOXEvWWR6TEFodnJjaFU4WVlvTTVp?=
 =?utf-8?B?emNzaFRha1pVT2IxRHprdWFETVFBc3Izc3h4THFYM2FMekd4VFlZaXliYVoz?=
 =?utf-8?Q?VNFO3ZJBnm4VCxTQZvp7mh5kgLgVzjUvYEhTxod?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c43a8c-c56d-4f9b-3e23-08d8e081a227
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 09:24:25.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tI4SFPeStks8l0FKdUSIBLormo83yk/ZvvHqjgGXO/wikc/kd59L0/Jm3mL77tSC7ACVfsE6ZXTOVwwYKaaqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Fri, Feb 26, 2021 at 11:02:33AM +0000, Andrew Cooper wrote:
> Looks like a copy&paste error.
> 
> Fixes: f6e1d8515d7 ("automation: add alpine linux x86 build jobs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

