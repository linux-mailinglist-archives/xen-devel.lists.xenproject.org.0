Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67C2E361C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 11:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59418.104326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktqAI-0006VK-Jn; Mon, 28 Dec 2020 10:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59418.104326; Mon, 28 Dec 2020 10:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktqAI-0006Uv-GE; Mon, 28 Dec 2020 10:54:14 +0000
Received: by outflank-mailman (input) for mailman id 59418;
 Mon, 28 Dec 2020 10:54:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktqAG-0006Uq-He
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 10:54:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15ac3c75-fed2-48a7-b466-e3eb44c44394;
 Mon, 28 Dec 2020 10:54:10 +0000 (UTC)
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
X-Inumbo-ID: 15ac3c75-fed2-48a7-b466-e3eb44c44394
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609152850;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=15KdEg+1noTa8Zqv7+ylw7xZRYfdyr4g+5oOm6fKagk=;
  b=Lfi9xgXGMX4WcRPGPaLsf4HUPOnYbeGhyQiKaJn1oh20fPc63LFix/xd
   E3k4kcg3tefy9vdT5AGcxwQxz/CYOhHNar7mk9B5Ian1Yuo3Oj5726Pcv
   2SSjO3E+zNECUaECbMqqzl8IBpB7VUycUiCL+rble1/BGzDG0tncf8tiv
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j0SnspgokMNyiUXbVAkvyighxuOgX38Jdnyaf65/CzS4t3JkzduUJ2GVkJdqn8IoAex6m1Fv+N
 W1yOZ9EbauAmScnHGmhLG22bLJ8rdge4qEBhsTaQ3eOGJ9BPXwFNivsBzAXXqMIgaQV3IVCGIh
 J58rwmwnP7aquJeVp6C9uL/6SJWp2wQsNfp+3sYMEtWlDyskuMWug9PA2sPfqDqZUvIJKsnvap
 uDFsIjLZlqA+rQ4yzt30dAnIqXeeNE9w4sXcZVDiHaTyeB+JmOeF9RYNpsC4xgndxgnmUdFWhp
 FfE=
X-SBRS: 5.2
X-MesageID: 34015123
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34015123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gvo0CMeCINwcxrrdSAQKWx7A4tkR5U+e7W7WJ6uF+aH5CR4cEPKbPyQbvUBKi/jrQMMyuO2bkuwTdKUPBwq9ZAxG4UBspMKtkEw8ww0PT4RsthqtWtf5VFlm0X4SaIEF1QkR49/tTRUDD4XMUW49iLPTHt5cX9xtkMyv7+K/wumy/ylREDaYngFKGYYMwPTe4u9IhDpe0CWw9GCQpIauzltf4mhJwao5PsWTRSwf8QitrEcVRqDXkxSNl1I67Z29K1QVWDcVQ/huMcZhb2W3lEsKbHureSFZRdq/jvWVvERUNW7ewOyxFTyXtcaPVszftv6+YEZG09nw56oWtpRx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpM7rJsbNXNZkIwxZw9lTa3osUmNvyJ5S5GGOfBGHKI=;
 b=Tz643cahIC0OHowudSHfPmwJWT+6hyVK3GFkqmWHrjlN5pae8/ntbFbB8X9M6Ld/OdHs8RhMHaUp6OicIkRVJLq07KDTq+3cGAcUgji/PEwsdQ00RRpdLAvR/iv9sl/mxKoCNsMXj0axQktPZYztfvOKhyvuRPzM1AmUg2Nf5+VUsbZUXj4meZ3saJVJxLGgHUIp2bDT5+HIpZUl+wI6LTYQFyL0dTIqtYzEg4xvZHjQ4K1VkHy42F4AwQQg/6hXnq+Sq1Ao1O1r2iPCrWRNxdIHHBWO9HQxUmxzmOUJODnmf5YMeKgWvZRaPlQhI5ol+3LD/5QNezhHkmpc9kvH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpM7rJsbNXNZkIwxZw9lTa3osUmNvyJ5S5GGOfBGHKI=;
 b=v1mlC/j9MdzjP1ziLm8236MGUT2w1EJVZ9gYyNb2Fs0i62ckq7fCCfIn0hTuFx0xv4b8NyjDJN1exyACcJR4RtCbJgCBqOUh6ZgeLeFZfrSobaiU7aUecd7LVOB3lf9dRIyg9AXg+9pI/UEAFrnt5A1+wnvxLdauSoDmLA6osmw=
Date: Mon, 28 Dec 2020 11:54:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
Message-ID: <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8e96545-7254-4575-9407-08d8ab1ee598
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55253819C834BC960B49E6C08FD90@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JcEHleMeE6tVY6lPElRM6gxvpUXATfHS0YuhQi05tfEBa2Wo93+YCF2etsN33gyM1WSiuUsTLVl92SNuwRJaiOZSQVX0WH8NwpDTD3Tgw261Ko6OjWBQhJO9ml9qjghs+mplBI4c3uk6RiefwRhDVT7dQfwO4d62DeaOF+Y+p7QgWmpsuy7Z/AV+DmLZFiUbzhRZscvEcWvcq/Avsbh/ZF+2sfzJWshzbMx+9tZ8I43QrTmxQo8qYHCbSpD6FJipgJQAfXsOIaDybsBKTkG92YyxcmjoWEKGnACkqoeGo+ZF2MTOQULnFQoIBcTTwnP6P+jeZkKDD5o1ZKNyKOJXfLtku4Di3Gu+cJbHkBQfH4WEJLZ2Gnbuae3MAwpDbe8dxCiWiFXG5EqdYV0sxMZZhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(6496006)(5660300002)(33716001)(186003)(16526019)(85182001)(26005)(6666004)(2906002)(6486002)(86362001)(3716004)(8936002)(4744005)(54906003)(6916009)(1076003)(8676002)(66476007)(478600001)(316002)(9686003)(66556008)(66946007)(83380400001)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWlQZlp3bE43Zk1uam92SG9pcFJONElvSFVTMDZWOHYrS21NWVY4ODNNVlRi?=
 =?utf-8?B?RCtoWlk2TWFsZys3MFdNRWQ2UjNJYzZXSmwvT29EKzY0d3FwZGxvelovUlEx?=
 =?utf-8?B?cUhuclVZKzhNL3N3dzErdmJDaVNHODQ3Y0UzQnBmdHUvNkdkVVhWb3AwU3pq?=
 =?utf-8?B?ZW1NR0drbEp1QXVodXpYVTBjalRXYzRqay95Wk9TL05IL3VaSit4QzIvMDlx?=
 =?utf-8?B?VTR4dnJtN0paSy9NL2drRDNWNDdxcUE5OFhPaGpSd2FDU2pCYXN3RzdkY2Nt?=
 =?utf-8?B?OTNrSHp2TFNzSXZiMU1RMTBpemEybUtRYU5oRld3c3oxTzgrUE5zWDdtTXBo?=
 =?utf-8?B?TGN1clU4U3JMZ3hUMy8wNkdZSGRvb0s4ZWZtVWEyTk5Nazd0RnFXYUwvV2Ns?=
 =?utf-8?B?cDVNK0lqREtvSWtnTkxHVUtRaGRjYkFmR05Pajd2cFlhM0ptd1p0ZlNCTThP?=
 =?utf-8?B?YzhpZStScmk4YlFma05LSTRqZzJXRXNjcHBHZmFOMHJNWkZya1FhNE8rbVhj?=
 =?utf-8?B?Y0J1cE1MSjE0M2xKTjBqYUFhZitTZHVremhHbDE0ZTJVc1MxM01wV2czMFJm?=
 =?utf-8?B?cDNQcDZQdFJUbmFVdzc0ckxGdkwwZUwvK0pUZUFSaDN2Nlk4NDJ5L0ZiK09B?=
 =?utf-8?B?dTJOajM0RmdoTTJMenIzeVlnbnRaRXpjRkY2UEtFL1JXSUJWUU41V21wWGJy?=
 =?utf-8?B?ZUtVVkpSV1ZxMDVoY0EzY0V0QmJUUGYzTmNTL1o2Smk5aURqMHJ6cXBXRFB1?=
 =?utf-8?B?QTdGaDdmc1BrM3JEZ1R1N1VoOEU2OThxcHo2T0ZPOUpCRzRaSkFrcERrNTNZ?=
 =?utf-8?B?YmQ5ZEkwTFN3RnRFWUFVVTV3Q3NKQW1qUGZPaC9ENEJ1clduQWc5STRTR3kw?=
 =?utf-8?B?M3FyUFFwVUhmTm8rQjluY05YdytaNTREYTgyVWRRQWtTR1k1OHNOOEVFNWd4?=
 =?utf-8?B?cVlKWlZOZjZPT0kwQThHVmwxSW5JN3MvYThTdDR5cHk1SllmRlZaU0c5Skpi?=
 =?utf-8?B?ZWp5bHJmbWw2Z2tDVDhzV1ZVb25UY2NDRThiR3RsdVJSWnEzUEpGRGovajl0?=
 =?utf-8?B?K0N1UUR3c1poRi9sUHIrcmpIVHMvd2xONlE5ajlWVWR4UG1ZK0FRM1FNUUtD?=
 =?utf-8?B?Q3ZVdDlaYmZBTjB4cXFLV3dHSVQyYUtWT2VjZkhNYURRUFU3WDhXNnZrUmI2?=
 =?utf-8?B?TVdXMmxhVGFXcDFXdlEwV1UyUm4wZFVsRVQzejNZTUFmcU4rZE1xdlNIQVBp?=
 =?utf-8?B?QnpBL3diMGx4aGptUG1nV25NdWg0dEh3aFA0RnJ0UW4wOEpkb0lxUzN2VjdQ?=
 =?utf-8?Q?KJ7CUw3UOusUskQE/gDDf62p79XGKcvv65?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 10:54:05.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e96545-7254-4575-9407-08d8ab1ee598
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXZBbQR2+2Pf2VXvK4pn7dvdKpAMKjkt1ys94DapeV/aAP0kRHVF7VBB4LyGD1TijcFPTu3lL216rrGKomCAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
> Now that the IOMMU for guests can't be enabled "on demand" anymore,
> there's also no reason to expose the related CPUID bit "just in case".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm not sure this is helpful from a guest PoV.

How does the guest know whether it has pass through devices, and thus
whether it needs to check if this flag is present or not in order to
safely pass foreign mapped pages (or grants) to the underlying devices?

Ie: prior to this change I would just check whether the flag is
present in CPUID to know whether FreeBSD needs to use a bounce buffer
in blkback and netback when running as a domU. If this is now
conditionally set only when the IOMMU is enabled for the guest I
also need to figure a way to know whether the domU has any passed
through device or not, which doesn't seem trivial.

Roger.

