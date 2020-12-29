Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821992E6EE0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 09:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59673.104734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuAEX-0000dT-HQ; Tue, 29 Dec 2020 08:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59673.104734; Tue, 29 Dec 2020 08:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuAEX-0000d3-E1; Tue, 29 Dec 2020 08:19:57 +0000
Received: by outflank-mailman (input) for mailman id 59673;
 Tue, 29 Dec 2020 08:19:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuAEV-0000cv-RM
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 08:19:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc252133-797d-4141-a5fd-a29eed8b0cdd;
 Tue, 29 Dec 2020 08:19:52 +0000 (UTC)
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
X-Inumbo-ID: fc252133-797d-4141-a5fd-a29eed8b0cdd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609229992;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=p8lOTV0CXKq0eKIcNZnVSoVYI5dY8LQVCykj/8NncIo=;
  b=KBYZW54QNeYPpr6vbNcFmPXIXxvWSQH/gduyq/jdA6BLZFqQ6RZaHl5S
   9b84I65EMhrf8zZbaYbSmS951dmki52FJ0CUZV9ouydp+sXZKDWGzP/d+
   yoaeFMPmWSWwAhKJU/S5kzjBvJzeg+hfV71WGBdrumHrxLefZIgZF2+XI
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YrJrCgl4JcdgMGkukCWodkpyjFpAGdnZdrfljVwa4Z799zX4uZmjuhPTvIE9olV5mQxCSs2kDN
 CvnWZjFvBfomWwBd6Ja68Fp+375c3Mmt2StqgY6zQ6kBkV/2zDn04hyY2Urq5i2AKC4U/ROapb
 /+GdOwAqHr0Yx7LnFXKzLKDf34vg5jOTjtkvgmI5Qxsrbud2OSjz/rhPff/jMGBN0L18kAstgz
 EclX/qIXEZSQLsORXx4ppjAx1E72xfqryVD+1iPmU6l/jPEuDPaRUVWdMplaDJ1SD95IyPrw2r
 9kY=
X-SBRS: 5.2
X-MesageID: 34112817
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34112817"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD7cq5cYTIK/rSX3MCQDZrf2HKrhBDZpddvB5bHwVk+Esq3Xe5InnEqdJbW/jelaJkGEve3n3RodObBJyu4NSD9LntkUTuZs3QKY0kbbFY4UnBFENTE1KGA9dhRgw8uEqAgolbOPfgKZZ8CP6/8gv2Sz0K3r2GpkhxmH7C3BXsPwLKYMXsh/1Gv62yd/UDlT3kfUeqmks74jWnKNfnIOKVs9vPWLPnooU1bTrvsN/vWVKPIlNwcASinKIMcc0DvwMqw4YJ4uClohBAEBYdUIVovT6h4A23mUwEE07ZtK40XJGaJVVo8LVABRyWhi3/ZT9NGCn+ota9lFGvTjaMBYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFtCWXusGSZLwegGok4/Xca75EBq+gUFJNUd0+a5ZA0=;
 b=Go7n7QW8/20k+vqqj4KWZxpxotTUzJcL4HzVkmrAijlvGCqFbXbl3LzO9aOYQUowAkJESuJ+6rpjJaK9Exhg6yjrG3woz1EZeobOsuZvFQgcxakmY4F5dAYCqwKDzpJnqLRomeGjsKLUlvM8L/2aBOLrU45Kql7dQVrvGgwBsJOXqSxlwTS4ly49Ai/+OGs3Wo12OgyHAtx4nT5YhuZJvMp2dEuWqXK6vomLp/5wCilUbrJ+zKC2U9o9IknVLJzVnAZnSRLts/wgp68v8zAFfYabwKBBSngO+VrPrRGsbM5CwaoPVwPp0qcGdQnCHta9ydPTXnn6UWmtDEI+J8yLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFtCWXusGSZLwegGok4/Xca75EBq+gUFJNUd0+a5ZA0=;
 b=I8tfH4d3EC4Vu9WKbghYGVuN3hI2kBa/sriEa/BIWCFQ/yi1RDmGhZQBVzVDEyrmpqwvR608nZVNjn79zD5U3rGalcjURx+7ImELL5baMsNAkX1XHfcHDx3bXjx56EsM09IaIVpZrlHUQyETbCnAeuPbyYqmsydI+FfQU0jjSkM=
Date: Tue, 29 Dec 2020 09:19:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: PVH mode PCI passthrough status
Message-ID: <20201229081943.ifaiwrqyj5ojwufn@Air-de-Roger>
References: <943136031.5051796.1609179068383.ref@mail.yahoo.com>
 <943136031.5051796.1609179068383@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <943136031.5051796.1609179068383@mail.yahoo.com>
X-ClientProxiedBy: MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6232fe5d-5945-4611-4c4b-08d8abd28265
X-MS-TrafficTypeDiagnostic: DM6PR03MB4393:
X-Microsoft-Antispam-PRVS: <DM6PR03MB43935A40150C4FD4453A576F8FD80@DM6PR03MB4393.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7x7JvCwGEsdI1zbE+l3MmoTjrKPrFbR8xijj8MFLaCAC41hrS29GEJ6gSzt9hpcI6lJSlDWlguR8OB+WxvB3a/40CnilCBlzcxQlKzNlGY87vnM3UX4FBrirJWDxYLHrcbM9/tcSXm5TJEe1nqLm6Mu0cuCkT5V1oPkgjEEuuiaGwY+mg4meisaHnUPWf2uc22vn660wpSKTA8rLV06WNZN/QmrCikPKDK88yIR89ekqfD2WL1Gtr9LCsAMuyuSX0Q9h6D+q91L8n25EadHM2tc+i6onAAyZoaCFm4TRt2nWzNQml/FSyVTXI4/seHmxE0aY2m9VHbpsZ6epbQraQ+W9L1xavg1JDxebYE0JmbJBKgUrkjF+we+/+3MidvKcRB4sMG6a/a0cnd6sDALalGepghbR1RsEbYpoerUMA6PL1rf3PKwXBD5wYWpu8VF65mwgm+XEuNALzRm9jqwug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(6666004)(4326008)(66946007)(8936002)(6496006)(5660300002)(66556008)(86362001)(478600001)(2906002)(956004)(1076003)(186003)(66476007)(4744005)(8676002)(6486002)(85182001)(316002)(966005)(6916009)(9686003)(33716001)(16526019)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGJaUVQ0MGZmQ2tyTmtFbm1kVHBDU2V6N1J4SHhCUEZBeXRrdGtUV2xhYk56?=
 =?utf-8?B?WUhCLzlib2JaVDRCSSt4dWRzQjJhWHRod1lzN082Z3VxbjRpNG5TUCswYWQv?=
 =?utf-8?B?blNjTFJYMlRGdU5Ta2JyS3poUTlFMW9ldlZTS1I1c2prV2NXSHlqdkNYanZ4?=
 =?utf-8?B?SjR5Q2Y2R3ZxL0FTeUdWQ3hUWXhxZnhRY28rTGx5b3Z2TlMzN3piM0Q5dmU2?=
 =?utf-8?B?RkozK1FSR2VQdnphVFlrMmlsdDdXVnJGM1lSRFQ5YTdkY2owMFNBM1NGWUNU?=
 =?utf-8?B?b0ZpTk52V21mbWZQWkFMWWNmUUNYQjFyNmZtcjMyeTBCMFkwU1o3Wk9tcUJu?=
 =?utf-8?B?WDBtK1dqNmVsc0lpdFBiRm5DaFRtVTBCUmI1bmxvbGtDMEt2aW4vR0lreHVE?=
 =?utf-8?B?anptdXJtalJhaUxCZEpHN3J5eC9CeFlmN0tJRlVHZW9LNkFXN1VtL3Qxc0tN?=
 =?utf-8?B?Yk1DYzBYOW9neENYMXZBdlN2WS84ZUZCdXpZcXhuSkoyK0RpS04xV0didThO?=
 =?utf-8?B?eXFtdjBybkxCSTR1NExOU1NLK0xIQVpiS21zOUp0bVRqRXVFM0o5dXFXdUpo?=
 =?utf-8?B?MEpMZXpnR1NQK0lsMUc2bzRsR05ncHlrRkg1Y1ViRHpiMmdXa2VONEltZEgy?=
 =?utf-8?B?VXU2a3dtR1Q2QkpWQ0k3azRQcFlKMWU5SnFXNExXYUdkaU12R2JQV2VsbThh?=
 =?utf-8?B?OXY4aHlEQWZ3RHdMcmxKelpWV2hlbmR6UUVkTTlOdlNqTURjUEpSRVJ6NVNm?=
 =?utf-8?B?cWk5aW1ENTQ2K3orajBDaHFoWHdXcExMcDRqeXVNT1NOTFlWYUlVSzJWc2lM?=
 =?utf-8?B?S2tYS2lFZnAxOUM2SXVyRkpMMGJZL3pvd2pWL05RYy9iV1pNQnB2UmVHdkZt?=
 =?utf-8?B?S1YzMHMrYVlhR3ZZOGFpTDVidjRIazhFcUtHRXhqVWNvZ1B2STc0UFdrdE01?=
 =?utf-8?B?SFdrOW1VRVAwcTk0TlA1Y3M3enFwYkw2ZHoxSllVa2FpVk9JUjNUWmxLclNm?=
 =?utf-8?B?YTJDUFJvUEZoWXh0aE9FQThZY01MUzJtb0Y1dUUvVXNMZ0tZdTBrMnIwOXpR?=
 =?utf-8?B?T05jVnBza1k5aExNQ1pST3cxQXZhR1NnL2dkUEtUR1lpN0FIblpjS0JCcWty?=
 =?utf-8?B?N3BnZHBEc21xVktCZEhENVdkOE1tYjJOc2R2Y2hob0ExQVd3UmFQd2ZjQ2Vk?=
 =?utf-8?B?RUxKaGpuUkNKWlkzemdLd3phSWpIMlBhc2dyN0JCMEgwWjQrQ253NE1INk5o?=
 =?utf-8?B?dmV2VEw3ZGlxTG01MCt1VEljSFRmOXlwMDRINTFIMStsSHl6QmZMMFFSZFJI?=
 =?utf-8?Q?ZXvv3VmOdSZiKZfhAJukndXODYgVJI8s0G?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 08:19:49.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 6232fe5d-5945-4611-4c4b-08d8abd28265
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTqRTWtAcvvsjqUG1/RsnmwO+izx8UetCbAsn3zPEJwT5332G1mhj/LoHOFLqxwPcjgXner7KwzfArmpr/t9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4393
X-OriginatorOrg: citrix.com

On Mon, Dec 28, 2020 at 06:11:08PM +0000, tosher 1 wrote:
> Hi,
> 
> As of Xen 4.10, PCI passthrough support was not available in PVH mode. I was wondering if the PCI passthrough support was added in a later version.
> 
> It would be great to know the latest status of the PCI passthrough support for the Xen PVM mode. Please let me know if you have any updates on this.

I think you meant PVH mode in the sentence above instead of PVM?

Sadly status is still the same, there's no support for PVH and PCI
passthrough on domUs yet.

Arm folks are working on using vPCI for domUs, which could easily be
picked up by x86 once ready. There's also the option to import xenpt
[0] from Paul Durrant and use it with PVH, but it will likely require
some work.

Roger.

[0] http://xenbits.xen.org/gitweb/?p=people/pauldu/xenpt.git;a=summary

