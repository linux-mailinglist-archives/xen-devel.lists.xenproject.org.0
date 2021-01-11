Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32782F1BB4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65077.115171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0ah-00073x-Pl; Mon, 11 Jan 2021 17:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65077.115171; Mon, 11 Jan 2021 17:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0ah-00073X-Ma; Mon, 11 Jan 2021 17:02:51 +0000
Received: by outflank-mailman (input) for mailman id 65077;
 Mon, 11 Jan 2021 17:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kz0ag-00073S-GG
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:02:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 075dca49-4b7d-4ace-98f9-a8ccbf2bf3c0;
 Mon, 11 Jan 2021 17:02:48 +0000 (UTC)
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
X-Inumbo-ID: 075dca49-4b7d-4ace-98f9-a8ccbf2bf3c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610384568;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bT0bd3vqCPze5+OfPfCqP81ByTK1Ap5seR4t2Y0OHsc=;
  b=MfniEN+n0KCv819x2WlZVwTWwCc/QRCSRmftHVu5Uu1EvIta+O3sHhHD
   A9hwIuy6ruFSd2kU9dcNSwV+YXg2gFMiChq1zvf2SX9fGOwvYuKofTv3h
   T6ITfYpwSBGh3Mu0MktsoI0gZ/HtpRwm5KWrqTbJxeDVplNX/rgDwU3pO
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A/YMFE9/M69Toje/uB10rFivlS39IivDA4PidCRiTwijc/OjMMGoyUhksfBgLmZ6u/gEoxXlHH
 epMtw3CKAI2M7FTFze6h8cVJHRgeIp9M2TQbFFPQHP+w/Qad7CfTVjD/ZRnSszwiNFZQma4M9l
 62R5p2mVDO45YUeYD2Lkset4yzbtZLLnYVyyXDVKeSroIyZ6bNPYLruZ4xczVgaQqqNHermasZ
 znQDzF1RUPPhnRDZCA5J4EvehAKxYqMchjOcqT5L6rG9fMw/X2AW2qF26m2id3Re4cG0WodGVJ
 uJs=
X-SBRS: 5.2
X-MesageID: 34885990
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,339,1602561600"; 
   d="scan'208";a="34885990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed8Pq2T2EUbuROyJUwJDszmrcdprO4SLhkpqvhpFF5qN6waHcwcyEQYNqIwLrBtMqISt24pj604LTiPcPYh8tmRL2KQQqFZJkHaDBz1l6H3mlP3JsWaeA1flkPSeGYL3kZmUhEkF0HSvWQWA2F3VVAe22pSh5BBJm4OhlFF77CYzaaN1u98lwnyaT2jBGklJ4lgaFVzZ/HQ858OVz3oQ0LOWI8HqsCGL7ISBKlWjigFDmu4X3ieZRp+1FqXvcyglbYliSRCnUWYsmM/a5DBMbWCbsbAnxOjKkeiE2al8YNB56rGPnrjIeLrrTkUsKQqUpwu9xNhoeqRMpXh8MyhdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMhNtnm/uG+VzLiuXgYasmudyTZnL5bJ1zRba/XTqDk=;
 b=k3rZQ7BCh8P/s+2FlXSzjUhDpOHv2Wc509kwS5y3H4J14gfKTaW2I8LnOkyX3daZVoRfcuaw9QZu/Xta0jgDLIncsAU9SmR6sZhAGm7Re3ubU0smZbquclXRO4i2qGK41vpWUdZI4fZ7VqXrYG7EYuHVQ80UxOIM2QeOU946B7VTCXd2dfgpZkdXZgXDdLwHIaaDjXu6VeR+dO3FVlvNsOII1ZSrzjYZAEo3YwpbX+9m4t/ww3ZaEA1JuWpgcVInBlqn96BqjWiDnVYCgqutxPM67A1qgtk4prAQhO4bvJ8h+BogH/prisWJBQUqdxhXaLuC8ZM+Plq0vgJA2soB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMhNtnm/uG+VzLiuXgYasmudyTZnL5bJ1zRba/XTqDk=;
 b=ZQiaVgC0H61bhpAz8xVbxo2fzHUH7BDOsmVH0iveL19iZf2u6MtqkVMVdjyOUFaErugoQcDv7agsfYEMnIUrGTY3SRWr6jkeVHu6YDfNdvkMsD0mq1VwebaiuLg8v20B0Hg5iAVBmEVBe/LwIpOU9KDdPy7RDIl8uvNSgH/l6j0=
Date: Mon, 11 Jan 2021 18:02:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/acpi: remove dead code
Message-ID: <20210111170237.2eezhybykfejrgp4@Air-de-Roger>
References: <20210111092640.98423-1-roger.pau@citrix.com>
 <fe2bcd17-f51b-4b0c-ff60-4a09d3973ad0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe2bcd17-f51b-4b0c-ff60-4a09d3973ad0@suse.com>
X-ClientProxiedBy: MR2P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0e82374-f086-4f56-2389-08d8b652b610
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53240746EBEE3DED20D8FFB88FAB0@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czaWj5neiGBo9dnDl5rZz4wQIQg/YM7/lBDVV+gwWleCFOAGPFdN2m2f4GvSVBFTed4oifwYRNs6Xq7XTaYNGXyYxKB9CZ1IGr70WtEAGXZ2oysRhtZAtXZgTjYQvxyvWmvkXqToWgwy8taX0SUeGHp+pyN7ZLYo+QS84LShYFL8OZFDLPwQhhQ+gOH6SvChLG8/wmfq9nzgUD49zMcfMbByLajJ93Y/P7NN/VoxIeDitxOri3KY5Uxwtx5F+8amgl5dlple50ay+D+V4kqW/lVkwKfo9+sRahsEslQ8hBe7ueyQA5qlpEyZKU7JPrI5ruT5dqM/QK48Mrn26z2GGLIsGlODdyM3bjN+lyPqUhcLK+qgrq6V1A7iHTrdULyHbeaE1Bc3hP+urJW7pnXopA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(54906003)(53546011)(33716001)(4326008)(6666004)(316002)(66946007)(6496006)(478600001)(956004)(86362001)(66556008)(66476007)(8936002)(6486002)(6916009)(2906002)(83380400001)(186003)(8676002)(26005)(85182001)(9686003)(1076003)(16526019)(4744005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzdYQy9Nb0dZQnA0L2wwQ0N0S1BGSHJEUzdOS3E0UE0zWFZvS1oyNDJUN21Q?=
 =?utf-8?B?T2VpdGsyNjdjU2RNYjEremxTVlQySUZqWHFVVm84Y1ltb3VRazREV3dkKzZ6?=
 =?utf-8?B?aE00dVppMXlnU2FERHlnUXV1MGoxcVJFSlZyam1IYWJFa2ZFczEyZGlzR0Yv?=
 =?utf-8?B?c3V0YlV2S2FOYkRncG04dSs5NUVKNVh1TXdET3huQ2RGUktwK01BUVpNa3BV?=
 =?utf-8?B?NlJvMDJ3NVdiVkdXbVVkcmRWek9wNTRXNEphVE5UUzNTOVc0MlhCQmg0ZitV?=
 =?utf-8?B?VzdGV3RsSWp5SithMGZoTks3THBTL1N2RzBFNVZGU0Uvbys2WWJWMlp4QzFD?=
 =?utf-8?B?YlRRUmhjeW5reUorc1A4TXBEYlhsWHB4aGhGRkdLTlJ1SnZiT0wyU1preTRS?=
 =?utf-8?B?Ukw1NUM4MVVTWEFVdDlqcExsV1hMVTR0Yng2ZjhOcVIzVVE2b0FEcjUxQUtT?=
 =?utf-8?B?RnBHTDk0ZWVCR3IzODFVclI3Q3F1Smd1ckMrYy93SFVTQXpHeDI1SU5pQUN1?=
 =?utf-8?B?eFFkTDdSOWtpR0tPWXVreTYvMFJPTnR2UW5xNm9MU2owQmNLY0pVaTViZFVK?=
 =?utf-8?B?ZzdFV09xZiszR2hlNlFSSjBidU1BMkVxWmZoelgvRTNMZHBIM1hkbFBLLzhn?=
 =?utf-8?B?SXU5OTE3MWNGRFlUeWcrSjdEdkFiWXluUENWbFdWd2xrUzdDK1JJQWlZTkQr?=
 =?utf-8?B?VEF5ZnlxOGFvUVQrc3FIeC9kaHNiMzVYN01NTWRHTVRMbXg0N3haWnJUc0x2?=
 =?utf-8?B?WVp2dS9ydjVVYWhGRFg4UXFhL3hEbDl4UGlBQmxsS21FbTN0Y1FkMVJYSkNr?=
 =?utf-8?B?ZTB0MTdhZnFBZGFFWFFsN3E4WlZPMm9sNDNRc1dQbkUrUFdHSVQ0V0w2Znda?=
 =?utf-8?B?d2pFSkFtV3U0T0RTQnZoVTBjVjZCRXhwWldxeXZqK29SRGZ1ZjdQbmRwekR4?=
 =?utf-8?B?eStKMjBFSFdiSlcxdG9Ca28vWXdpaVJKc2wzdkhaS0VLQmNIZjNXMUJzZjd1?=
 =?utf-8?B?Qm5NUzFRSk5Uei91Tmt1SnczSnVla2xzRFBFVjBDRTYwaElKbDVQTVJWYit6?=
 =?utf-8?B?ZWE0Q0lLeTBNRDBadGtUZ1N2cXQ4SkpqWjl2cmY5L0tUZ0hyL25vSGlLVWxm?=
 =?utf-8?B?NEVWMi9RTTM4SEowSGMwV0NncExkSG9OeXAxR3FTZGovam8wckc1MWcyRkp2?=
 =?utf-8?B?Zys4OFdGVUh5WjU5R29OenNiNHBVNE5GWW5najBuNkYrUVBkVXpMOGJ5bWwx?=
 =?utf-8?B?OVlQN05iaU02ZGd1c2tDc0dLWEJydWZXL0tvcGxlb2pDVHNoaVVRbzREYVpY?=
 =?utf-8?Q?O2NTZM1DZLjS/Q3rxCmztz+1wDxoh3TEZE?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 17:02:42.9536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e82374-f086-4f56-2389-08d8b652b610
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH/dSXQlzIvWBXGzSMHtS32NTWe93cAdTNRAg9pCpjV81Td87ZaAQaL6UXjX2xUQmjM/HyxCFgxG9ux8MsHhog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Mon, Jan 11, 2021 at 10:33:28AM +0100, Jan Beulich wrote:
> On 11.01.2021 10:26, Roger Pau Monne wrote:
> > After the recent changes to acpi_fadt_parse_sleep_info the bad label
> > can never be called with facs mapped, and hence the unmap can be
> > removed.
> > 
> > Additionally remove the whole label, since it was used by a
> > single caller. Move the relevant code from the label.
> > 
> > No functional change intended.
> > 
> > CID: 1471722
> > Fixes: 16ca5b3f873 ('x86/ACPI: don't invalidate S5 data when S3 wakeup vector cannot be determined')
> 
> I kind of consider a "Fixes:" tag contrary to "No functional change
> intended", but I guess Coverity considering this an issue warrants
> the tag at least in a way.

I've just added the tag so that if the original patch was backported
this was also, in order to prevent Coverity complaining again.

Thanks, Roger.

