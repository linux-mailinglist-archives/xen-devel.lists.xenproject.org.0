Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E235110C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104177.198940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRswZ-0006L4-R2; Thu, 01 Apr 2021 08:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104177.198940; Thu, 01 Apr 2021 08:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRswZ-0006KW-MR; Thu, 01 Apr 2021 08:44:47 +0000
Received: by outflank-mailman (input) for mailman id 104177;
 Thu, 01 Apr 2021 08:44:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRswY-0006K7-Bo
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:44:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37dcbb4c-1df8-41ec-904b-e7ff9b163d65;
 Thu, 01 Apr 2021 08:44:45 +0000 (UTC)
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
X-Inumbo-ID: 37dcbb4c-1df8-41ec-904b-e7ff9b163d65
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617266684;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5D2x9xvQ/eqIpLFUni7fwPs6RISj+bxDXQyNeALKiBI=;
  b=gBkXEO0pRcgWHx75pR8tF5/VszA6iYJ6UMw0F9UDLQqdf+XbVIyub5Kq
   v6LtKG3LNewYzfkfokcjGAs+zYISbvDd8mEv+KNnS5kSscCJWIs/hnhkQ
   rrDSWMhG/h1Oqgv5+wKLqNJJhZ9Q3jp4IvSwQaGZVeOqBTMZXt3uim3hx
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EjYvMt54dSf9UVCTBP3+3sEKziGZjVJRq96QRgRkySvFy9GvuIqxvOcYgMWFEheGAUqT3vqs5w
 PMzN/0O5Wn3LJ8cSExYB4Gmy5z8fsCTX1jzvzximR2jPhCvjGOjJn+vFzLZ3lGtFMKTHAcLIyz
 llpuGQ8BlmTgDN45t/LaPoRP+0B9R237gdmysMasUrdmIzO/XZxcr9kKPP71y61nHBUUg0QXlc
 nkMqpNCsUBNuuYEqcLVEEWNbpX0QhLd4SiqZJaamb2AMOIB9Cjk+XSE01SdP6jsRrzZxhcJgOx
 aA8=
X-SBRS: 5.2
X-MesageID: 40530448
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 vecHzy+dZSx9A4aZM=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40530448"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgI8oVoJ8Qx9zfyla7K0DFuPHxOady6KSYceNYbCofeLVtFMlcyWNytp2Oy/6Fo0biqTtEmsHPztrv2OUwB3lQnkd5QK9Mf1WmWIf684YUvQFqeNZXrWXk0JguBnOCitket03vkHsU8L3aTJz7s8COgX2fXh++3iuX66Hrg6O6ecQ20YMaAYhdu0uUdSe5CptBvtV3JqRwY+i6f1Fb8bfPT+NVphGa7CT8jMK9ELJX/z/apPpBqbCVMB4i6yZr4aoXKO2DczvAZixkjOqZXB36g2h1JG0OVnzLWedoo3SLExsCFUofPj+s+IpfoMBc1VXwnTIUzqw3+yW+GN7DSz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPEZlh9KDUoP9LgRoP8WHL37awvqHitPtHVi0D9l44I=;
 b=PhZccKvPxSb6mAQGWhRRx7K+kc4CqMvznJGw9xnMGmvrJsp/xRhITbWSmxbij0axGxCZlx19Cv6ciKJ+gEv+lRvJqbyxL1KuXSORMeBtFPNkrLBBjZ9fo0e8w6k7XPDwrHui+z8h6VmhCXS+5qASZLPW3+Zch8Ge3It+7DlF/V/J0RwLAUgD3k6CFnjIriLo7U/eu8P7XiC1nKiCTquYZOPnlgZHQJajdUqYSVOeYSHPhOAQF0/5grF0dRslUhuBQV2Mcl5z/ZNTmKtxN25/V0DpA/CAkew008nLp+ZGPbtHCkMfmEtK3XcS08by9dBZ2rSFpGfqbpWg3JCdVqY22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPEZlh9KDUoP9LgRoP8WHL37awvqHitPtHVi0D9l44I=;
 b=pIAdggDbe7WYg/+eZLag0EkhAzH1WgEC50Qu6a9KV7Dg6dO1lfCGutGp9yfcyLCJqZq7PGRg1MGuHdydQWfIM50Ek8ZDcyxt5700f81LOYLIr4hc728WNhvrfj9d1vI4ASOrLXW8iKm/imEvPHkc84rhrLq1QOms6M6KgQUW+Ro=
Date: Thu, 1 Apr 2021 10:44:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roman Shaposhnik <roman@zededa.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, <grub-devel@gnu.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <YGWH89ubVe104Tnl@Air-de-Roger>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39967864-c3f9-4760-5dab-08d8f4ea63d9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37399BE3AEAAAA93992C0BCC8F7B9@DM6PR03MB3739.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Xk8bu+m2JPu6yluVb/mwwC6okgToCPLrEDtexn/UJWF+Hc90MaXgKh2Nm5L45jMkojwoAmBOS5RMybaTO4NNZM4Ap9RCjBXlPltgAzKh47mnB0TVB4qGmUKetqsK4fLxEyKlRRqtjVEQP5NI62p8TE2mqzLNVmIe2ccji/jAry4UAX1rVP03/QKwkgfV8dIhI6ocISEqC84B+lEYFDDXZbLrYe3RvOYyStjSEmSGmJTA0LafvJsdZiJjgZ31F4iD6BoKeHvQDrY/cILUzHymn4qskomVxNSu2K8AT68CnzxEUfAUcyzg/xl9ZT1RV7YDmKdjk14VDDcdR+ZcE9BEIJAyO88YNOpCb4RNS2pKwAPnknADrwHr86vSy4rwapFNKujjS/XX8HZQWx8nAgTV2b2qy+QJY8o/p4DcElc9JyDCGk45GUBVZT/zdi0VkzAPvYNr0BuD2f7aaFJUoSTQSbqRHf28G52pm9ye2GwkuYDvMmjxbVMQEATzu9DZTzcSPMPWAr5gnmknpOrliZMNZdVnCjJE1S5D1/BNfE6uiXqNZWNILrKfJ9rdNq1gsEcb0+WKIzUCjOmg117/d42zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(396003)(376002)(39850400004)(366004)(8936002)(9686003)(107886003)(66556008)(33716001)(38100700001)(54906003)(478600001)(956004)(86362001)(4326008)(26005)(6666004)(66476007)(2906002)(66946007)(5660300002)(6486002)(316002)(8676002)(6496006)(53546011)(186003)(4744005)(16526019)(85182001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzdZQm0vK09aU1JvR2xYcGhidGgxTEI1ZWRBMXMvWWI5b0R6ai9lb0NGWjdL?=
 =?utf-8?B?aHhGT1VvVXJpeWNlODFvR0Vrb2pXUXZBeE1PUXkxd3p2RklUTUU2Y0gzNWY5?=
 =?utf-8?B?Z2M0TUZ2TjdaZXRQa2JzakMrVVRzWjR5b0RSUi90eWl3aThBNUJPS1dINnhI?=
 =?utf-8?B?Wld5ZjV4YWpOL3lldysydk9Uc1dMakIza0FRR0pFTjRIWUl6YVVZaW5yZmRw?=
 =?utf-8?B?ZHptcEpXQXNCa1phL2UvaUR0YW9LUFRoMzQyZHpmS0xiQnpKVFE1eGY3NW5D?=
 =?utf-8?B?MWJrTXdHTmV6YUY2ejFUTmt6K1paQlFhZkV4K1h1RTBHOFIzVk5Sb2NLZzMw?=
 =?utf-8?B?dmM1TmZNTFY4WHltaUVaZ1hTTTROTmNHMmpWVGdKM0svakFTTE51Z1UzNVd6?=
 =?utf-8?B?S1hYQi9KTWpDYW9Fb1d5cFpFSmN0Nyt5MnB3ZGhUbkgwK0NHajFvZ0YvR1FM?=
 =?utf-8?B?NFpXVjF5MW5zbXE2Mnh1UTU2Sk80UUp4WmVYYVN3dld3dWJ6eTA1WWxMc2Fn?=
 =?utf-8?B?OEdYbEtiaWExeVZQeERmVUR6eGhDelRvcXVvYS9RRXNNSitsaWJvVTIwTGZk?=
 =?utf-8?B?N2Y4NS81Uko3dWtOd0lGbkJva0RqQ0RUNzY1dWlyaDh0NTU0emlsVnlubE5s?=
 =?utf-8?B?UFNNRmt2ZW9RbUFZelRSN2ZsMUo1ems2WEttaWw1VFZSK2lNT0lMbUlLNmho?=
 =?utf-8?B?MlU3WFovWS9EWW1NZkM1ZkdTMkR1MTJzZ3lmNVBwUml3NVc5dHpXNlpJcmNU?=
 =?utf-8?B?MENSKzVVeWNIdjRUUFpXaHJMN2JKa0JGUUZncDhQYSt0YUNvSFFVZmswTnJr?=
 =?utf-8?B?TDlVSmNMNGx6dFVzeGRFY0prTWR4WEREQW85UWRXenVOa2NGU3h1bTdSNEpJ?=
 =?utf-8?B?cjdZYzZheWVKK3QwamU4eWRLKzhkV0o0Qm9JQmVIMVpsV1NEVFlEczBFYjZV?=
 =?utf-8?B?QlVmS3JFVjRORG9seCtURnR1cjhZV1Fna3VwQnBYZC9VK2hjR00vT3RHVWo4?=
 =?utf-8?B?OW9SSk5weVJoai9wM0lROHkxQ05VZXhyNm9OYWtLSVl0WUlCeXNMbWcrN2to?=
 =?utf-8?B?SW1RL2VseTJESk1qdmdPRFAyakJXNnllZG5nOG5CdmZJMktZeE9yV0Rnc25i?=
 =?utf-8?B?RkVHd3pWYWpoK2x5UzRJTjF1encvTjdjQ2lVUXkvM0NIS0l2MWw1enZVamJa?=
 =?utf-8?B?cXRmR0tKcEgzeldNeElzMVloNjhxL1hoWkMzaUFLcEZiVUQ5YlBIUW9FSkNI?=
 =?utf-8?B?SjlMaDE4UC80TVcxcWhsZGdYanZKSWhNZ3dSMTcrU2JJY2p5OXBVMmtMNmZ5?=
 =?utf-8?B?VWIrbi9jS05WSElNZ0FBSnBvb1phYUxheVVFdTNQa25nVFFWRTlBRVNPcjZs?=
 =?utf-8?B?dEdpUW5xbzFiNlo0SkVQOSsvU21tUVZWN2ZIMjJwWmJieitrTGVHT3FtVTZl?=
 =?utf-8?B?SmJ5cjZFMDF3LzcrNHVJMHNYcDJUYzNranZFckgxNTc5aHFqMWhESEt5NURX?=
 =?utf-8?B?U2RoNlUrem5Pc3A3U09tRHhMdmNDenAyZ0k2YU5yeEVDVHNzK040YlVCL1Bk?=
 =?utf-8?B?eWFEck9FdUlRdFhDSlc2YlY1OWhzN3hmSVA1Q0NTMVRGTVRkUHB6OG5iM0hT?=
 =?utf-8?B?OEZxU2JpVUdrTzNWb3pyb1ptWEZTVEJLVXYyQVNCbkVKUk9rbzdwV01GaUpH?=
 =?utf-8?B?ZDN0NFlMam9McCtrdU9PTUhuY2RqWGtkQld4emp4dEIzaDdYVXB1ZlJVQ1dx?=
 =?utf-8?B?KzNTOW0rd2ZwTTVaM052czhHcEVzb3ljUXArN0NuVUJBRjg2NWFkQlRXUmdC?=
 =?utf-8?B?dGc4d1JISVB5UitQUnJhZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39967864-c3f9-4760-5dab-08d8f4ea63d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 08:44:40.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e52TnFDO9K3G5XbPdCr/iHkdvYW9tV6i4PWyJebbBC14oXn4WCM0I7INbYaP9kVWDF8dhMJ6V9CUEMZJ5Rs68w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3739
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
> On 01.04.2021 03:06, Roman Shaposhnik wrote:
> > And the obvious next question: is my EVE usecase esoteric enough that
> > I should just go ahead and do a custom GRUB patch or is there a more
> > general interest in this?
> 
> Not sure if it ought to be a grub patch - the issue could as well
> be dealt with in Xen, by concatenating modules to form a monolithic
> initrd.

I would rather have it done in the loader than Xen, mostly because
it's a Linux boot specific format, and hence I don't think Xen should
have any knowledge about it.

If it turns out to be impossible to implement on the loader side we
should consider doing it in Xen, but that's not my first option.

Thanks, Roger.

