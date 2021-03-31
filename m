Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666034FF40
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 13:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103888.198167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYgk-0000Bq-0b; Wed, 31 Mar 2021 11:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103888.198167; Wed, 31 Mar 2021 11:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYgj-0000BR-TX; Wed, 31 Mar 2021 11:07:05 +0000
Received: by outflank-mailman (input) for mailman id 103888;
 Wed, 31 Mar 2021 11:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYgi-0000BL-93
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 11:07:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6c11c1f-3f4e-494b-9544-89c743f64102;
 Wed, 31 Mar 2021 11:07:03 +0000 (UTC)
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
X-Inumbo-ID: e6c11c1f-3f4e-494b-9544-89c743f64102
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617188822;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=G6OujAQ3f59/sXEsxC36Xa1ZpCpbAWMHsNApDfmmbVY=;
  b=Zkn5SwAxCplkS9D1C1XhTNHk6m4fxb+L/U8hE/h02vLtDg0v+YrEEnk3
   DfuRvNWQ7f0nxSNuNp+kq5bdlTxkbHQ54syrsY/ziwhbhFKwATV5MXv/v
   7vtGTRTjiaHEgRvF8aruquRf1gAbv9x4HjcAUOxr6JBwJL/NJWxmDzhCm
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EW0XM+Etjzm/mNcjJXvWx4Eo6A7QFTcimtW2+HCUyqDq3VTHRaU5QndplJZZT6Zxe/ULhIhSog
 wUaMKQWu14MIT++EHoq4NuVu+KaEnix1fxBUT58Umqp1gt4Lc6iiwc6A0+s0EkRh/BW5OogxUN
 EMpiJtnvEhNRBN0vlJhoiN/ZteQ92Ra4qERmDnUZt5Is8dz6155yihFNon363OFbKdEw8nx9a3
 waM76+S+B5t5Dwn6lbCxYuUtFhtCTO2HVDHUtNPer2MDyqdYeDdXAAjKWpPySXABGq0Z81OLjg
 b1w=
X-SBRS: 5.2
X-MesageID: 40547868
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:q/+do6xUjh+RvAm/8OqfKrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40547868"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNI9MUX1ji9fRtDGOfDkb5ngKZYHJ2BerSMzhRstnBFnSrIIUHTXt/9KUMTjMIvIKvpIPHd33MkOScUFYU/ku1AKnzEL3r5fl0YvXnQbfMy9cd3FG/xtpUOJbhUlw9pFwnHvCKYDBsqG/Z2Ptmu4pSa52Gm93BZk+HBb9geay+WB9TkhYGhIzgeTdcJVQNUoscWv67mms38l729NPCbDJl++oJZ2BYkJlpvzkCqJTryC9tI3rqQ+EIc816TKi5lW6G4Dzcg2G70g+WAXJw/DJzu8J9Hd8C3lKnebmnBGtqH6t1pl6jS7zX8satygE0WmCHCyqc5uAs5s6B3SmaDl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0ua5x8NrFRnTlHpHqLFMm0gHOAb8Ol8y96wdBm6mDk=;
 b=V+LuPLzjGckNXQX0BLQfKJOMVhSlK0GPC6dJLVzaxXTStcPlkaPe0hoEo7x/2ILuJ8HBNAQzv976g4Xt6UYk5uRjYIBv7krF5/JBeo5vWf1GtQFMzehP85Y/LF23zvGMO27aiY7hm6LryJL0RxmcG0DoKHuWfsyf9fIMn3wy8Qn4DwuNi9sGkQIBKNqGLIcVy//2VbIOMrrvMb7lY/lXLiKNjE1ThNhEu2VPo3F9HwS8depan8NzQxDuwzfJDzPeW70L39noHJdK5ll4uq5s2Ih6qi8Nhf8+WsU9txo7/XMPA6SWyklsxT1hj1n88sx21tI5tlWP843F4sGQmyflNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0ua5x8NrFRnTlHpHqLFMm0gHOAb8Ol8y96wdBm6mDk=;
 b=efkI4j2OXcbROi0koYYhkcsEHYV7wYClNS/jaA7U0E/SDKpeZFFYpYop5Tj2VZDmj4adbiQX0bxgcLzkTpqcDg3ePEDvlE0MnBhHI3MYMPQOebRkcYR6mlyCJyYb6t4vesmRXqdXCTuibume9zigEslEQIO6QjFNRj9+0c2aiMg=
Date: Wed, 31 Mar 2021 13:06:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/21] libs/guest: introduce helper to fetch a domain cpu
 policy
Message-ID: <YGRXzRw+wBP5Gm+w@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-6-roger.pau@citrix.com>
 <87d48996-6b8b-d801-c43b-30b919244fcb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87d48996-6b8b-d801-c43b-30b919244fcb@suse.com>
X-ClientProxiedBy: PR0P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37917828-680f-4bff-5910-08d8f4351a80
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065CE0097F4C0116CFC08E38F7C9@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oUUarReP1EF6xzZ6/jAommj+WpcBh7r66srVOr79ByNWfdeteZxU+I3ev5hdpaea3B6B+royUFYPr1xqMNDYjTsvRGtom5OkBC3thhmny6xfiSdGQZAFnyHuCzzcgst2s6pB192CP8PUWeblJuJCDELpUuxUPr+N1HDHH9qjVO26tVlOXG8Cu4NaqGvB8E/SbgtBqVo1jsUj+P5XEbpN5+aLU1XSO9ocI8nK93pgPk4LY8Ue4cLwEIrBbeILQxaCu5z7ip4SwquWs+C9eJZLATbZAGk8wWMhd/DVAFbxOMfJ27pjpC5+PKQFCKfkMmYdfPej932m04Ba8o6FDLBdz6qypQScx+rtO//P3r2Wb4UzgFCi065J/2eqLlx7h2yyCnPT8DUUrhjXr4hGCMEl43gd+psaFSvQjTsrhmr8zW+qyZGUIS8E9Lx7Smn91040I1yQqeX5QODn95+79TZjVenoqvfzbWDK8LOsCKC2DyJECJYry7iFW1ZUrGAZqWA4e+3OqUyrV/N+pUSqnmIxqV3f048xmK1/BFdnrkDog1AnqA77al5lPH9iaDA13vL/r+Oef/YZPrUTPrtK66mcdU8qZf43MY00fU0JCQT5HTQ5QpDzfOijU47IhCWB2dyzS+wDgU7TTASOzv/f3shSDL5T78jMyBPr7W51A9TI0kQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(38100700001)(6666004)(8936002)(186003)(316002)(478600001)(66946007)(33716001)(956004)(6916009)(66556008)(2906002)(85182001)(86362001)(8676002)(53546011)(16526019)(26005)(66476007)(4326008)(54906003)(6486002)(6496006)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDBLeVR5OW12eENxK0hQNm51dEJnUm1SVHVQUk00NjFMeSt1R1VIc3dnMTFn?=
 =?utf-8?B?UHQvNkI4M2kxeTNtRWhwRzlqc1g1OUZRekpLZnJYWEk1d0lWZHA3dVN1b25B?=
 =?utf-8?B?MUthNHFXanlkTGdkNWtVWHNxWkR2QjNHdms5SG5KRXNHaTZmNVlndXc5MjlW?=
 =?utf-8?B?RzBUL3BtaFF6Q05ZYnpLUURMNXMyUDZKS2lQQ0h2WnMydHJ0MFlCcnVWS1NN?=
 =?utf-8?B?STdEazh5Y3ZxcXJPTEo3S2VYREVSbTZCdlpWT2xNb0ZpelJaRkJtQmFjQXRF?=
 =?utf-8?B?WVRvak9yaldoSk01UEEvMjBIVXltT0wxT3B1aU10YXFKS1BucjdHYmdJbStt?=
 =?utf-8?B?NlhTWCthbmJrZGRGOHQ0SUJBaDZ1NGJzUDZQV0ZlY2NkTEd0VUVJejhBQlFk?=
 =?utf-8?B?WnFLUDJYVWt2SUtrc0FkZFgyYWVVQ0JTc2JaRVZkbXZqM2tWQlhjMDFZNEoy?=
 =?utf-8?B?UEFyRnFCUy9xU1BDNURSOG43c0pyREo4SmJFZHlGNEtjM0syVlFJVmdzRmh0?=
 =?utf-8?B?L29MekNNNlZjV2Ira0g2L3MvMU52R1lCbjZzdXlGLzM4dTAxSjBhLzN5ZUNL?=
 =?utf-8?B?VStSekNJNXYvdm1TazZKUUdQcWwvZTVjTXQ4K25QRlNoemtsaVNZNlJZdkpJ?=
 =?utf-8?B?bWFJN3JNMjZmaVhvSjlOaEdJcEt1Ym8rdXdVVFpRQXVwUnhENVpvVE14ZkVY?=
 =?utf-8?B?TVJFOWFCZGwwMlZRV0FiSmNHM29DL1h6REhrQy82b29XR09hd2psdXRIMkg2?=
 =?utf-8?B?cmQ5czN5enBxMXZuTlJpcGxHYkh6TlhPQzJ4LzZpM1loaXlvbjlVc0htTTFG?=
 =?utf-8?B?aDBiNFU0NXViNDltZUYxV01xQ2Nmd1B6V0xYaDkwTjlEcnM0YVlzVkJKTEgx?=
 =?utf-8?B?S1YvYnNGQTBpL3J5RlZqZXVtaVpHL0VDM1hld0tkbkk2QTBpN3BNQWVLRlF1?=
 =?utf-8?B?NXhnVGhIWjVEZ1I3dFF6azhqekxuMWdIbVpEMlR0bmRTWkZRRGdKQkNSdG9F?=
 =?utf-8?B?bURRaVRRbjZjdG1RQlJ0UEt5NnU4TGdpaUxaM0lCOHhubWRhZHRPYldqd2U2?=
 =?utf-8?B?SC8rdVYrWVgzTDdmdDFnMzhiL1M2RTBFRTROUDRuZGIvMUdFckk2L2Y3SWIr?=
 =?utf-8?B?NU0rUE1EZWtwL0tMa2dGWGdWa0dtVDdhRkJwR2ltWUQzRnNlc25tWXpBT3Vj?=
 =?utf-8?B?bXpRMElVemhDWDVQdkR2SnZsKzFKMmVJd3NSRDB2c3B0K2E3WGpsd0c2S2hj?=
 =?utf-8?B?aW5la2FLSlA5V0tmMWx0WnNrTDgrWm9ZNUtxTlR5WmY2R1g3OUhxU1ZiY2dM?=
 =?utf-8?B?RnpmZXF6TGpaVTcrNEF1UzZUVklGVmo1Ujh3REJtSEkrTXZ1NVdGZjQ2ZnFX?=
 =?utf-8?B?Rm9hSlY2MUg3dmhWeXRRc0xjQXFEbExFSit4RlRjQ1FJNWRITVF3NTIrYXJn?=
 =?utf-8?B?Sk4xRkxvampjVWNDNnBCVWUxMlQxRnYyTzRtV3YyM01QMG1KWXNhcE9qWDlM?=
 =?utf-8?B?K1htZmdITDdXSkJrM29VT1NEdVNKU3RqNlFNS1VUSkFjY1BSdW8zbjMrZVpL?=
 =?utf-8?B?OHhwTlpxSit1akxnTG11MXFPcnlCdVQxZ1hGRkdJMnc1eHF4Z2VKMm9ZaTJY?=
 =?utf-8?B?NTY3VlpzTnlXaW5wSmxYdklLRXgzN0xpMGNvRVFHRUJ5UEU3UTVTTzF6MW1o?=
 =?utf-8?B?N3Bad29kb0JNdFZlOTRVWWhXQVBNUWRHMGRwM2pyRHc2R3VLRWp4MC80cDJr?=
 =?utf-8?B?dU44ZmJTWSswelUyd1VramZleSt5TEZjWmZraE42Ry9wSU9SQUxidTVBRmIz?=
 =?utf-8?B?YWJLTVVueWpnOTlzazZudz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37917828-680f-4bff-5910-08d8f4351a80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:06:59.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSj/IEAluTmKwB+bZ/8c3zOXFxmd/uI6Faf/HSGxX7UwPzsq1HUcgnxIJur9BprZPuQiWobcTxtMtrys5UJtPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Tue, Mar 30, 2021 at 05:37:02PM +0200, Jan Beulich wrote:
> On 23.03.2021 10:58, Roger Pau Monne wrote:
> > Such helper is based on the existing functions to fetch a CPUID and
> > MSR policies, but uses the xc_cpu_policy_t type to return the data to
> > the caller.
> > 
> > No user of the interface introduced on the patch.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with again a minor remark (plus of course the same that I made for
> patch 4):
> 
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2599,6 +2599,8 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
> >  /* Retrieve a system policy, or get/set a domains policy. */
> >  int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
> >                               xc_cpu_policy_t policy);
> > +int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
> > +                             xc_cpu_policy_t policy);
> 
> Generally I'd expect domid_t to be used for domain IDs.

Me too, but xenctrl.h seems to consistently use uint32_t for domain
ids. I'm fine to use domid_t here, but I assumed there was a reason
for using uint32_t uniformly there.

Thanks, Roger.

