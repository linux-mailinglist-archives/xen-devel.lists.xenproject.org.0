Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D5736EAEA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 14:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119971.226827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6AP-0007Uh-R0; Thu, 29 Apr 2021 12:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119971.226827; Thu, 29 Apr 2021 12:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6AP-0007UK-Nk; Thu, 29 Apr 2021 12:53:17 +0000
Received: by outflank-mailman (input) for mailman id 119971;
 Thu, 29 Apr 2021 12:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc6AN-0007UF-L2
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 12:53:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2880039-6900-4eed-9b33-a593ea60d022;
 Thu, 29 Apr 2021 12:53:14 +0000 (UTC)
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
X-Inumbo-ID: b2880039-6900-4eed-9b33-a593ea60d022
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619700794;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fl+fG7uBfvFVf1XtVmyXSjirX9il7vv6OxS8eaRcidk=;
  b=TcnYKeOPfvG7kTD5hYFzxkP6KGELYb1ykpszmwbFqSJ0T6W9Ufe4gYYB
   0HUJECX6Fy2ODO/1bmGlGRioYv1JkdSRQwfNmdQftXLk8t6en53lReeZA
   31LCIrMXQh9+P3xn/rWVmOhEfZJcXyrSOwIh7/aelXaNZkTxj64vUBcs2
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hQobtcBtJaxchpyBd1xNS7eLAQQqQiXvOB93XG14OCCHLw4bgKJzWjJFjpy+CahhoDlVhXGCkL
 TCiWmqnw35Dq8pfmzaYoLodPZyI8aRdwnhOWQmxJbe0rNQZv+Gqil55vFes1yNOhK5MPi+LyAK
 OhZjt//0wdzGkSyC5La/iA4C1sz7BMwKVicTav7oIM3bBkfgKD9Qix+wSJ1Q7eNjqZOZ7a8qAl
 ROFKQ7s5YctnYOdK5rIKaMFWdU7N9IuHxuQM6lE/oSwd54XUtnM0IGDg5RmLi04Dyz699DcUUM
 VwU=
X-SBRS: 5.1
X-MesageID: 42512183
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JsJaHK+pF3pERobM/eZuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="42512183"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mePG3VqNxalrbiMylxfRCOopY8Het/9YG4043ihjl57emb0JveYIxETg2b2FvOlXWZSztFu3Kr6lERpB3XLctI37awZqyEi6hKB7uGIeVjW0YroqmNEZoWTzuNnVHIS5yl2eUvc7NFoy9vT7GB/KaEQhJ+HQRZpaCaWalPMk4gv/AVPCmQEI2Ndq/QQsGBjl5dBzGw2WZNZwiS1S6bmkozOpa5Y+esDh/PjpPDCdqkfhhZwvLsllei5/B/s/DxYAPNx1P41htE99aYm2fSZ0yjiSx22X0Aec7Uc/dPr6blrtY7YaNx/J60srMeFtysA/+hNHIQ3yfsil+ci5i5gYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peozl4LdcWYvy7JNYsFHyULLZmOhsGfUGU0UMSPMSkw=;
 b=ARnPb9GwAxGwPdhwZYqADjV7BeaJ9u8seompaADqlIXhEyOm6gi7Pf7UjJBph7ruBYujHup15DkTXQGBMXp/nRg3pkg29HwJrXxr8LpNeFhs91Q4YqLNgAT7b+stynUn+Ye06mmELkgIA1eeUGSch8WmX1c1qYhKxudQv7Dg4JUJwJWYntPvY04ssBSDxoO86adXZAb9mZxCwQ4XEINj0A0IodQoecWX5H7iLHQBGyg0GaQef7M1Say1PUsu4LG4v6mPAwG1XTGFT/MbTFKyozczuIJnPxTK2F4V/69U+3WlzMDfim6rO4N13q7HUM5Q1iHF7nPrezC1YDOgT3vm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peozl4LdcWYvy7JNYsFHyULLZmOhsGfUGU0UMSPMSkw=;
 b=D6XJ5NmHUuE4Zqiqx3fJ8RCIaJ3P2zaRLvqZIE8/wKDaQbYq8MnBBPWniWvGtaTnbU8qYWPr1M2x2VwP1YauHWYCJiGfLeHlnfzVfeB6rsxq4V22czPQ4Z54phkN8KcrkusOivU733atVJ81VVlmvwvzrpjgYaqSmlZJJer98eA=
Date: Thu, 29 Apr 2021 14:53:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
Message-ID: <YIqsMi4kyf3Xohmc@Air-de-Roger>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
X-ClientProxiedBy: MR2P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9731ab2-13d8-4d9e-d550-08d90b0dbeb7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3915A8FE926623B09844A1528F5F9@DM6PR03MB3915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j1E00GRfL2fIaci5OgxX7Sd7rX64A7SFe/GI4eZ1kSxgiGIfKbVYKNsYdx+vQbumwY/PADX58wZKJIFWlGdoioek08qK0QbgOl8wwRkNA1UdxL5AJJLzNpH75f8UvKIBCGQR03m/o6gyMEiIQh7awdQlfN3EA5y5KOS443UC9ZUc6ByaoeVMzrkehoiCkYscZzVp57AKbo+FtgC414nB7x4lTqqBOJgTIcsSyrElm7cbrzb9cYuCfwNE2agER96N3NJe/E/s+zQMV9EGopIp2ANAzxCd3VNf4DalkCfXnSBJ1JSlS8xDxqUrzbkNQ0kCoomMYJUqMirL9anl9kzZ6lcr8P6HaBg7BzpPYwGqpgx8iRqdqGwqHJSiohrIYRZtClduhbAD25hkuVC5FS5QjIaRJOmjhm7FznnQHxYmWUb1ZOrB9b8KDC4qXsGGEgFJJspnAtJ6SIUO1tdvSVpTbtHo0mMVMdkIINk8Dk0FVFHvq/x9F2ATWiKqV1agdzqCkkmserb9pfQxau6/FSyxMKgrtcDHgxSAcOqoWiZrM/lE8u6StWr5IRSjvb6MOKYXQU5xiG4bYGnlPtR5ZuJFQIoPSfMIJd13zetFshcjUxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(366004)(136003)(346002)(39860400002)(83380400001)(4326008)(33716001)(316002)(38100700002)(478600001)(8936002)(6486002)(5660300002)(66556008)(6916009)(66476007)(8676002)(66946007)(2906002)(6666004)(86362001)(85182001)(6496006)(9686003)(54906003)(956004)(186003)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VG5TaE5mN25RaU9xdzhFbStRUy9PQ2hCOHJJRUJKK21HK2lkdTUrTUpweDFv?=
 =?utf-8?B?cHVoenBrcFpBOXp5OWR3NkpBYUhvMExSTzN0OGo5WGk0QkswUE1DTi8zbXd3?=
 =?utf-8?B?K241aWF0ZGI3M0dsK2daUFZQWUJOellGaGgzY2RVR0VidGR2UG5EZUhiQXd1?=
 =?utf-8?B?TEZkWnB4bnUxVXdPNU1IMStWM2R5TFZnam0zaWpjNVBaRitsaWFveDZQeDY3?=
 =?utf-8?B?WjBvVG9pQmhIK2ZJVWhMdmFTRzVrQmt3VTFKUDFyck9mMjZJekV5cDZvSWhk?=
 =?utf-8?B?anlDcUNCWnJneTFwdW10SFllRytPcmNpVTh0UnVIaG5YcnhJM28zWFczTHli?=
 =?utf-8?B?SHEyRzRGRGt5UWR0ZVhWVGl1enkwN1Mxc2FpLzNYVUtYby81YWllTDhISjMy?=
 =?utf-8?B?aVNVQjZhWS9zeFZwaEt3NCtkeHRoSzlTa2ZEVjdyQTZIK3JXVlIxUGhGMTdW?=
 =?utf-8?B?eUozeEFmYzI1ZFNxYy9TSDE5czRkWmtKZDI4czJRNmlJTnRRYjladTF4K05l?=
 =?utf-8?B?Y2F6YkZQNWhaMUg4NzRzNXI1QWNKSjhGMmhFZFovZk44Ynh4eVRhZVo1eDZJ?=
 =?utf-8?B?SlN4cVlnQS8yY2NWMmc4bHQxaTg5VWxzRExSOHdaN1NydWdFQ2hWQ0tCT3l4?=
 =?utf-8?B?YmVEUXZ6a3lwZjArVnE5RGpLcXVDcmRMa08zRnZxa3A0UEJCRXNsUE1NS3FY?=
 =?utf-8?B?ZG9HVHRDV3gwb1FZQ2JRQ01RcFhJdk1ndDhPOHovS3dZclRMaEQvc3hLUGtt?=
 =?utf-8?B?ZWtzK01TL3dpVVRVQkNFRGN1Vk11d0NnWDZjREZVbmI3OWdGOTJ2QktNTHR4?=
 =?utf-8?B?aXFVYzlzNC81dzVJOEtxVVlCdWpBUksyNm11ZHMxTGVpdVQ5cE1qNENFR3du?=
 =?utf-8?B?YjFZK0hTbjl3STgydTZ0RTJvakFIdnVyVnkxbytkNGdrS1paNUp3TGR3MXhU?=
 =?utf-8?B?WGIzdkFZaC83ZVNtZTJSRytqcmI3UEd1dC9SN1NKbFF5Y2xtb3I2T2wxcjl2?=
 =?utf-8?B?VWc5aUtMUzVYZ0FUZjRrQTNrQXF1T1BhZWQ5V0tObEhIb2J4Y05xblFtSElX?=
 =?utf-8?B?TEE3VnpjdDBTZmMwVUloZWJzREMwSFVRc1ZoSG5Vc2JkSWdvblhQaUNWamNw?=
 =?utf-8?B?ZExvaEZyL1ltdG1IbmtNYXZtTkRzSExEYWw4eTRlMXFsN1lkeWdzMjJxZzRw?=
 =?utf-8?B?TTFDYU1nMERrOHk1Q2RvWGwvVlFwbE5mS1pBT21rcEhwVUdoODRBbE05QjRU?=
 =?utf-8?B?K2JiQWRWOFpwejFhZE93QUIxWXh1MG81Qmx1NjJpclpkbm5HR1pTUzFwa3k2?=
 =?utf-8?B?RW9NckVsTDh6S01YLy9OQ2pSL084Qm1Ua2prQkc3bkd5Und2N3lHQ0dPbUlv?=
 =?utf-8?B?Q3NBWmFSYXQ4UUFwWHppbG9TaHRiUnUwdmlmS3pvTEpsaEJVMnViVGxDYjhK?=
 =?utf-8?B?NVhYZ1VTdHV4TjVQem9OMFU0SlhkRm5JV2paNzRUcTFsNzlCVXpTVlM1WnZo?=
 =?utf-8?B?UEFEbnZKZEw0QkpFalM4ZzFrTlRIMTcyRU5DbjJqajhzMXFEMmNpU0MwTjlX?=
 =?utf-8?B?dzdONG8xQlYyZlVuckdCWEdNbEdOb2ZLOWlhdUVUeUVKTVpXcmF2VFNLeUJw?=
 =?utf-8?B?NTNYNm1YSUhMRGxOSWFJejJadXc5QTVhbW1HRlFKN3VWWUpmOTk4c09FY0FX?=
 =?utf-8?B?QmlPN1lmV2swemZyMmpiQjdaTEJ1RlNNcFZHL2VIUnZ4ajQ5blJLSTJMNm4r?=
 =?utf-8?Q?JPdm9fW2c+XQYleEhXIkgKC6pjVFHMP28MbWkHL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9731ab2-13d8-4d9e-d550-08d90b0dbeb7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 12:53:11.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2zdGbnnsfWZWaM/HV9Ib+B5+TSUhnIlgf3F/JewvMAeRvRDFp7buwUTKInBPyOYa0Fv8+BM/308T1H8OHADpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3915
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:55:10AM +0200, Jan Beulich wrote:
> Reading the platform timer isn't cheap, so we'd better avoid it when the
> resulting value is of no interest to anyone.
> 
> The consumer of master_stime, obtained by
> time_calibration_{std,tsc}_rendezvous() and propagated through
> this_cpu(cpu_calibration), is local_time_calibration(). With
> CONSTANT_TSC the latter function uses an early exit path, which doesn't
> explicitly use the field. While this_cpu(cpu_calibration) (including the
> master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
> path, both structures' fields get consumed only by the !CONSTANT_TSC
> logic of the function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit as said on my other email I would prefer performance related
changes like this one to be accompanied with some proof that they
actually make a difference, or else we risk making the code more
complicated for no concrete benefit.

> ---
> v4: New.
> ---
> I realize there's some risk associated with potential new uses of the
> field down the road. What would people think about compiling time.c a
> 2nd time into a dummy object file, with a conditional enabled to force
> assuming CONSTANT_TSC, and with that conditional used to suppress
> presence of the field as well as all audited used of it (i.e. in
> particular that large part of local_time_calibration())? Unexpected new
> users of the field would then cause build time errors.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -52,6 +52,7 @@ unsigned long pit0_ticks;
>  struct cpu_time_stamp {
>      u64 local_tsc;
>      s_time_t local_stime;
> +    /* Next field unconditionally valid only when !CONSTANT_TSC. */

Could you also mention this is only true for the cpu_time_stamp that's
used in cpu_calibration?

For ap_bringup_ref master_stime is valid regardless of CONSTANT_TSC.

Thanks, Roger.

