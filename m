Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F9372D0C
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 17:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122525.231080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldx47-0007rR-JQ; Tue, 04 May 2021 15:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122525.231080; Tue, 04 May 2021 15:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldx47-0007r4-GU; Tue, 04 May 2021 15:34:27 +0000
Received: by outflank-mailman (input) for mailman id 122525;
 Tue, 04 May 2021 15:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldx46-0007qz-Cs
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 15:34:26 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be18ebcb-b508-4eef-833f-7de75807f3bf;
 Tue, 04 May 2021 15:34:25 +0000 (UTC)
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
X-Inumbo-ID: be18ebcb-b508-4eef-833f-7de75807f3bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620142465;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HzHSvazUdwKik3KTEArmLtv0RwWlOUMR2DQAn06LRXo=;
  b=g9imxbUlGk4ScxN8rh2QS8FbCnh3addNQcEmL9jXGldV9TjNUsb7klcO
   dy4WjfU125h+gL9fSsCpSE7A2ulObYdwTydOhXPFbz8uJo/ly0WDSCFiR
   455WiU/3FkWzM3PSjhwZytpWC+CTKU//NnG48CBGU34+1BY6YbFDZRLxK
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dPk1cbQX7YxhnjBTxDCZloHj9Y83NEOynDkfKcb5+lZyVwH6puZu43swMSLISVaAChOxVUaVc8
 Qjyr/CAojXM73HD6x2aHngu6uuPZ3j4a7tPDZr1mrxNvIAp89DnHKE/yYaOojIPmCXdCIdNnFE
 Hz1MHMk7R/bGpM8ffCfSFEHRuyucf2P5LSS9upU1SFGCKaiJFcYSw3hFflAgP0OGea8PLkO8bv
 QIlthxLGQzfzKBSGXMkfC85e7rc3ayNDWWrOI/4aH0+dehh3DrgEjBV/Ce3LNS6Go8BOKFJa4I
 k/4=
X-SBRS: 5.1
X-MesageID: 43049069
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ByxlH69KRr3arzgwz3Nuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43049069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F55LPs8Bq1hb/PTsu3CesJMqu6GeuE3RBHH9tTeSUwJMHjOSbeaVzTqwweQcwJuX+g07YPwpR27xZVzbzfzyqfeeEf/0ppE2qF9/yMweeOTmXz2FBTkkMk2m1qmkz0TE6VXo1R+RmkkZrC4k1qZKYuFH+IHbWMsGZD0VQx8sHjabAkeVOuMtY3I8PR0p18zZiKws9mSodnAA1X8tbvd+tb3xqn7dfSZ3iy16Pm7mh8PV/FdXalYSLtQoahQ5JdLCsmIAgIDj4LppUclODiP2lxCOZgu0EHS829EJrRhbbgLf4Iz7Ia8SJAdkKZM0X0LFonsqFfErh/zdjTgb9R5x+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcAE8UgSzLbxpyNcyOQZBf9t9rCKnTuTyD+W4zDbFJw=;
 b=L4I1U3CjDZvR+krKJ9rUjbFHqPf/mtalHQPUHBczMKo5BWHqPY3f6xXFPZWGdeXBD4PcG6Dd9vsQwfeH1cdbqk5dLeKl9+0VAGNg1r/IzGF+tN6jvd6tgmxaLmcM9UPu12+vkR3zIzUV/TssRVJUE7TfGHfjc52p3TLMMSjpbkBKtIIZGUItr7RHYFhKMDxINDJPDThVCrHRpk10L15U4TVV0tRyUsbAzj2g/k4h/O4Jbj5ctv4dRnDTpIYNfu7oTQgMuO4MWrMJ4J7p35KdROMAz+9C1HCLFk2JrSa+EQ6dqjxfJPJh+p/GHNYA4P3jr1Xk9Uy9iyY03SkJ9Ad6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcAE8UgSzLbxpyNcyOQZBf9t9rCKnTuTyD+W4zDbFJw=;
 b=nSceOhUCqj+PdUJM4igYhmLZWtIOIZhDuasxXNJv5fuH6OW/clWdxUlh/xB/hRiA7DB493eHGC2fRPR2ccdorbc+xpr0xevkA4Upx+LWLAEDT9ZxyF0h5kcVmUQzGUK2mutxCirgdj0VHsPbIkK3iugIEgpK81juQNKc9bjjiz4=
Date: Tue, 4 May 2021 17:34:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 08/13] libs/guest: make a cpu policy compatible with
 older Xen versions
Message-ID: <YJFpdA8qmYca9bUO@Air-de-Roger>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-9-roger.pau@citrix.com>
 <51ee228a-2d53-2dd4-55cf-233d81ba4958@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51ee228a-2d53-2dd4-55cf-233d81ba4958@suse.com>
X-ClientProxiedBy: MR2P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::25)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e7cb121-9de3-4198-88a9-08d90f1216ea
X-MS-TrafficTypeDiagnostic: DM5PR03MB3289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32893B4FFD40224CC16F530E8F5A9@DM5PR03MB3289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtMIOgedyZRRzY0V9zzi8lSb9kb6YO46B6yuK8jK3QUpuhf4HngJyNs6e7MKM0Ey1Jvva9L9bIMhWyNdYEjquQYnL5TlWRaF8Wmz4n100x7J79NId7RTneJX0wj0kkwhwRstzSt9GICI1Gb43iLwdw+wBQYytE9Zr2e4edjbPiMSiQyl+7XcfDt3d9O2OFyi+mxeK8PsHYUdJ7H2Lt+RQEebOWj4UMREjflmHu4/RBBgl4iuI4GiJI1cRRxeSLLflepJU6t9Z8m3RstWDnkmfcpVaFrjsxCG+qeH84py22vx5uPgJlSATGFNrt51IPSeNwXM47tumXAAXZoj7y+YVl7xwzFe66reft81qBaBs12kpTXFfhFh9K6jYliw0tESsIi7G5J3o/+8OPrX5E0NbEdR4dqeJmhNHg6QaIQfWY1QIaMP+X4iPh8CdL5KmD5Eo5IKyEzaT/9ZRR8o4hPrivE0yZY39DRVKL4kPVO4RbL5W0dCVonAgoR01qVqT8DS9R+1Yf6Mg1IvGA/E7jGhzTTXpGOUQXNhi0MlWMTsypqqEVScyAoLQ8JvNng08uLS/0pEIR9hfqbLUrE76/umBxNMhOmPV+6tfbbUtuw8ngU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(136003)(366004)(39860400002)(376002)(478600001)(6486002)(6916009)(6496006)(9686003)(956004)(8676002)(5660300002)(4744005)(33716001)(16526019)(85182001)(66946007)(8936002)(38100700002)(316002)(53546011)(26005)(54906003)(86362001)(2906002)(186003)(66556008)(4326008)(66476007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlFWYjR4VDdaTFVIZmUra2F6bEFBTFM4dHVxMGV6bE8vTHBJQytNc3pIK2tp?=
 =?utf-8?B?UTlSbzZCR3dHWjl5WDBlWE42NTlrd3ZVTnN1YUp1TkpwSGEzZWJ4bXJKMGI3?=
 =?utf-8?B?dVJpdXBoSmdPK3BaaVk2L0RTQjdMcDJLTHA2VnVvQy9ENDBLd0NlNGplQURp?=
 =?utf-8?B?ZGVhMzdXN1E3TkZ6NVZFcitWSkR1VU9yRXEvTkNsU3lZNXVCbjlKR1Rma2ZN?=
 =?utf-8?B?b29vTXNYTUNOTnhkZG0zSFRqUnBWVjlCeGNIYm5ldjdTS0FLWXBrQjluaENs?=
 =?utf-8?B?SWFRN0dpRnJLWEhvSGk2eUh0YXdGTWVBY3NURDBsVXNRL1NkT0VPQVIvQlZo?=
 =?utf-8?B?UlVzc1NUUU9KamZVV01UelNPb1VHcENhdFpIS1NyaS9VWWo4aGVhQ1J4TUda?=
 =?utf-8?B?WHpYL3AwdG5SMmM0NUtnV2dWWkQ4eFFDWEJqMitKTi9HU0swRFR1NjZOWXcx?=
 =?utf-8?B?ME1iZmt3S2VkUVMxU2lsMGZmRXZKU3o2ampzc01WNkd4WU1Ja1FoM1V1SzRN?=
 =?utf-8?B?MzJiM0p2ZWFEYXh2c0RWYkJhMkpldS9XOGE4WkpHWFhnUjhObjNnWnZ5T1Qw?=
 =?utf-8?B?Y0VDZ1lPYWpOYnhDNTV5cHJxNTZzUTZsbVVkUUpUWEt1YUNGWGhwOE1yWE5D?=
 =?utf-8?B?YjRET2NrTDU3YkkxbHRreldFS1pydjlJUERBczRyZ1JUU0dSbWdyZjY2enBC?=
 =?utf-8?B?MmVKRzRRM1lIeDRiRGk4WnU5ekFWd3lpRHRERXVWVitNbXhmczIrWmRLS1dl?=
 =?utf-8?B?aGgxZXc1MVZVdmJnQmJyanNBQU9YUWlMMmxWbEZubEhKMm5PcHNTV2RwUmV4?=
 =?utf-8?B?emlXL2ROM1pzME9FQ1BMVndPUjdLWHFtQlhSSFdWN3FaQWJzeUdIa0RuY05w?=
 =?utf-8?B?OXR3aDN5WlhOT2tqY2E4MzZac2lpbjNVQUVMamZlcU8vZ3c1c0lndXVJV3Nn?=
 =?utf-8?B?TjVBYytUWUp1QUR6T3pqR0g4b3haZ3RWMU5rdVZ5bmlqZnlDajdNV3ZQS0sx?=
 =?utf-8?B?NVdkWm1wbkZtMDBrNHV1RVV4bS92bXM0QUZGT0dEazhJMTZMUU1vY0Q4cW11?=
 =?utf-8?B?QXNyWEt6MUdqbjF5RDhnbCtSMXMwMkpxaVRjV3lhQythcUg3cEFVQk1hSWdU?=
 =?utf-8?B?SG1aK1pmc2lFVFlsL2lZT3plVlI5Rk4xcFBiZG81Tk1VaTNML20wWmZwaGZr?=
 =?utf-8?B?alpjbHF4U09ybnZCdDhYRXNkYldhRDlBNWtjVTM2MGdCNnVYUEFBWVlyMnRq?=
 =?utf-8?B?TUNoL3NmaHFaTjdwUEMzTUxyNmhiMWMrUXZsWHM3dHFZN1ltckRReWNLVGtB?=
 =?utf-8?B?a2VCQ3o4UzRCNHlNSjVqUFgvdkdPZHBJdGdZN3V3Z1JqVmpwdXk3YjR6Rndy?=
 =?utf-8?B?a0xiRzZWZURUSy9VMy9JNFAxYnpFd2IvTFp4V1VRTlNBN3FraWc5TWlLclhB?=
 =?utf-8?B?ZTJFbjBxUTJ2Rk5DUWszMGhKZTFBRktaY3lTazQ0cXlBWFdGNnYyTkRmOWtY?=
 =?utf-8?B?U29FT0tlVjFzYWwvSDJ6aW9wWmRmNHlPQ0tGcCtGbitvU01lV1dIc0hZOEw4?=
 =?utf-8?B?cS96MkJxTmRXMEx6T0lmR2FoQ1RwWFB5TVoreFJNWGZBakxuTUN5RFVsTWNo?=
 =?utf-8?B?Wm45dFdBVTJBQldUNExXTWU2YW53YzhBaVp5ZG94NDQ4cjJZSXlMU0tjMld5?=
 =?utf-8?B?RWgvTS9rODZOUEJ2WlJpbkV4R2xzOTV3WmVzNDdWS3N0VzVMYnJBdWd3SGJj?=
 =?utf-8?Q?tDrHCml214vzFvRaQVdCk60gy6N9Fo+Ffu95uMW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7cb121-9de3-4198-88a9-08d90f1216ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:34:21.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzafeisyVSZgimm+kK2JU8jKS3OZjOB2Q/3o1ciTNitOoIM6+Zzs7Xs5aBycMUvKGdMjLWeD7h5DXIUNVpi8Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3289
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 01:09:41PM +0200, Jan Beulich wrote:
> On 30.04.2021 17:52, Roger Pau Monne wrote:
> > @@ -1086,3 +1075,42 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
> >  
> >      return rc;
> >  }
> > +
> > +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
> > +                                  bool hvm)
> 
> I'm concerned of the naming, and in particular the two very different
> meanings of "compatible" for xc_cpu_policy_calc_compatible() and this
> new one. I'm afraid I don't have a good suggestion though, short of
> making the name even longer and inserting "backwards".

Would xc_cpu_policy_make_compat_412 be acceptable?

That's the more concise one I can think of.

Thanks, Roger.

