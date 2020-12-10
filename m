Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FC2D5912
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 12:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49077.86800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knJud-0006OH-Gv; Thu, 10 Dec 2020 11:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49077.86800; Thu, 10 Dec 2020 11:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knJud-0006Nv-D7; Thu, 10 Dec 2020 11:15:07 +0000
Received: by outflank-mailman (input) for mailman id 49077;
 Thu, 10 Dec 2020 11:15:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTxL=FO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1knJub-0006Nq-En
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 11:15:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55b8c065-135e-4b01-8edf-b818fc62cd7b;
 Thu, 10 Dec 2020 11:15:04 +0000 (UTC)
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
X-Inumbo-ID: 55b8c065-135e-4b01-8edf-b818fc62cd7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607598903;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=epAsmBLaUkoMUS/pHo0oHFDNdEoq5Gn12bK70AEVopU=;
  b=J58CYYZflj2T3J3TpIteUFx1sZMW7RDGw/FpPA9rFvMVqrZ3nnljJPK8
   Dsn7rBosf2kmxUTAQNWsfFP54plxzcC5UwZUujPleGonX0qR4OKeQdMIT
   a/h8VPuAxrbeWnilLbPwN3E+UQdM9ZXHCHEpxazKbXzrpV6HDsSEHdMh1
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9NgqSnwd4VlKqjLuatlDB3zNY9y58s9JX+m1gdIyzt1Z4F6YRTSQCRsYyAHbjTkZtG76hqVagC
 tHmEy1NYG3xxcPiHjIqooTyWT5JDDm86wttexcVTTMejMsqZ1IO7uUJSGuBxAj45EaRG5IgbCQ
 STHEg55xiAZDGNGA8DO25BbfcFLDq84u4fvy1vsEuo8aQHLWiHEpTNDPESARIY8B4V5n4erfoI
 hX3E5enCurudunLrX94VL75V1UmmI5GnORznbgqjMMuApK5dKQAye30YpRrMSSctZd7S+tKORX
 Ctk=
X-SBRS: 5.2
X-MesageID: 32953073
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,408,1599537600"; 
   d="scan'208";a="32953073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGnlV+5W5OgzxF/zc/YtZt/dDlt6g/Hp1g71iYfvHHF/9SLrRYDjHehkicV6Vk67HuyenVR41wS0EFBDfn2ALUMN7E4DaMvUsA+n4NFxYmasWJ/S2cV1AadKqwunRXvdOQ7D8oGJ+Mn0okmjEpfwc+87Otmmf0JV9XStrhio8z1+JisfNl9Pi3Ibx6/5g8IamVxnBpxWX6FbkogKFetoD8VyFCYf+i+/ABdnYJYKRHL37nWWnY28dITJs7Z4No37t/B88LKLxsQHnkNJaQM98ykULUDYElE3gAHE430BiF3/+mba5Cbs55sYCHHXHf5rCAN8Kkk/jWx+1Rc86C9a9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfbDngfGN+I8AVvETLYbDyAcVrmiGDTjBFcn0q3y5no=;
 b=R+wFTWeBNJRrWjHdVVpCZox/xz+Ng+fix4+4j35KMo8OP0EkZE23PJnAo4FLwZL14e/72NCfzYLjVG1yIuCtRBQmCaiGbSBpM+GANA6vI4cIo/XbF6FQyECVkdznjBQM/8201RrxakWu+01Qrkhqxc/YyNsihm97jEANbegNukvMrJQ1i67XATRvn8gF/R0JJpdTvXKG6dEiGdzUeHS3bBrESxJWnAv9wU1LZG/QK++RgjjjJdvBB3c9qgJnEth6u+larP4W8H+XHDzyqD+BRFC8Mf/DXTcb5cfApalWYQE1Vf89QkJRlJ6sB4ovGKziaWLsJtZZC9kz9HlF/fNGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfbDngfGN+I8AVvETLYbDyAcVrmiGDTjBFcn0q3y5no=;
 b=cxNE6KOI2HGmbCgECrVE7iiCKMmOqW5ogmlaQEo2GwZuHGbmKcGVZvqhTKEFh/uEzld9O5QbilWuAErp+4mBo4EuaV0fNwxdM5MHzO+TBCPFIUMFMNxIO8qtMtI5zg/ItwsCGjhJYfmcqVKHwGFWBD+iAAeVnZWD0JeTE+W1vjA=
Date: Thu, 10 Dec 2020 12:14:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, open list <linux-kernel@vger.kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory
Message-ID: <20201210111454.dxykvyktzwr3fjyk@Air-de-Roger>
References: <20201207133024.16621-1-jgross@suse.com>
 <20201207133024.16621-3-jgross@suse.com>
 <CAKf6xpuqdY=TctOjNsnTTexeBpkV+HMkOHFsAd4vxUudBpxizA@mail.gmail.com>
 <72bc4417-076c-78f0-9c7e-5a9c95e79fb2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72bc4417-076c-78f0-9c7e-5a9c95e79fb2@suse.com>
X-ClientProxiedBy: MR2P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5721cf22-e4be-41bf-f558-08d89cfcd5bc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4395:
X-Microsoft-Antispam-PRVS: <DM6PR03MB43952ABCD326CE1FFF92B5568FCB0@DM6PR03MB4395.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOr1DktL9gMYNhuPMeJnmgxEPdHG5X4HztUtKpGOE8x8gj0zRRUEzFROst3+GFPo6mmIDQ86b6Y+uSI/6MSa9j57OCZwWLiBj0hdnEW63oYyEPCB+929V1W0Eng3vNvOecDAJo8gMkij5gryYvHa+nDh9AozY/UP63o48mtWYHO2jDIgv6tji0dmyX7Mpel+4gpolzHkW2U/3tgFymmAmA1bJ5FZ8koVcVgfWjPh98gNWfpY7mIJklZ2FtSoLxsJLB0rfdSiAwIyzwcMfaw2C9Qe4UscMQDoqOZqCR9720WxXgLiBmm4RokWRY5e+KGvuSyEkP54DC8eHV7/1dv+Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(366004)(376002)(186003)(66946007)(508600001)(2906002)(86362001)(66556008)(8676002)(53546011)(8936002)(6486002)(1076003)(16526019)(6666004)(54906003)(9686003)(6916009)(4326008)(6496006)(956004)(33716001)(66476007)(85182001)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGtidXVZOGpCZURUVi8xRndVSHZZcEJ2YS9IZjlRNEZkUGJjcHh0a0J3OXd6?=
 =?utf-8?B?TXFPdVowVS9wdnJWdUVkcTEzdlVqRXp4dkZqSmtlaGlVd0FyLzVqZFdPdVNz?=
 =?utf-8?B?SE13dzNmQU5MelljNy9CR2piZG5OMDdNQ0NiY3hKZFpEdFJ2NXFwTFlCSUsr?=
 =?utf-8?B?RFZJZkoxVGpyMjFjV1VqSTE5aW54Rm5UT2FwY2pEUHBvZFBwaHlZVFRMZGNq?=
 =?utf-8?B?MzRLc3F0UkxUZ1lVbEFJU3hCQi84OVVlU0txalpsVm10NEhmMmM0SmZnRHFB?=
 =?utf-8?B?TVlUUkRpdnJvOS9Ra1RkQnNDZ1pvZ0t2RnhmM3BIcU1TMFJKTmYxUDl5cnBi?=
 =?utf-8?B?Ty9aWU9wUkNKTTRkeW03MUdqQkI4dUtSbHFwTGt6bzFJS2Y5aFY3QnJLRXZs?=
 =?utf-8?B?M09iSGFsd2Rld2FTOU1aTTRCMkhyQnU2SWtHSk8wZVFqcHNJS3IyLzRuWGdN?=
 =?utf-8?B?U0pkbVNCZ2tZVUdpMzl6RFgra3FiRFFCZHRKV011RGk4bnIzSUZ3Q21lKzk5?=
 =?utf-8?B?VUFiSVZFYTdHV3krMXdJSUN4T05talYwZ1hCbUcxYk5mV0ZXNXkvbzVaU2I0?=
 =?utf-8?B?Z0JJcUkwekFmR3c0M2tTZ2IxaTdwQWU3cFh2OU44eVNrWW9sYVcySTNCZ3N5?=
 =?utf-8?B?VkVsMUw1UzBhWVAxejl0WkJnOG0xbVBRdUNlSVNzRU8vOWN6dGJIdGRnYVBI?=
 =?utf-8?B?OGZLUy9pOEJaK0FnMlZ4NndJeHFxaUVzajd5TnZpOCtrWE1UUFJ3V1NlM2t4?=
 =?utf-8?B?TXJGUmhLaG1BQ3M0TkV1Rjc3MzNROU1tVG5EVlRleGdJeGczbE1ibUtDZURQ?=
 =?utf-8?B?NUhFdG0zRzdJbU1tZEU3SGFPRE9sMWdWZS9QQlpKcVo0OFYyanVCR3RGOXJ5?=
 =?utf-8?B?dXBzdWdsdC83M05GTUlhWEdKS2dSdlNkRlduRGl2TW44QURqNVAzQVZIcDhR?=
 =?utf-8?B?SWZ2cGVWMnJRaks2dVBIWFZGZjBnVVdJazZmVDdrSWYweVlhamxNcld5dlN6?=
 =?utf-8?B?VTlxTVdPVk9pUWJJellqeFIya2V2UjIyV1Jna3Y5cUhZTitpNlBxc0ZiclVk?=
 =?utf-8?B?Zk9DNXdpaDQ4VUg5VFN3bFNkMit1V0d0RFdQS2RhMW5Wajl6REloaWJGazdX?=
 =?utf-8?B?SmxUL0M5N1pqL1BORlltekVyUy9VZzZ4TS9PYndpWnVMbTJMY3BBNEV0MlVw?=
 =?utf-8?B?K0d6cDJ6bm0zdDZHUFljWnZhZTAvSjM4RUt0dHgzWnoxNHYzRnpsV255S1Ev?=
 =?utf-8?B?OU52dVV6WG1TUWNUN0txTVRmY0hzMEFJaUhZRkFwMmdQY0ZjSVYzdEdXRjY4?=
 =?utf-8?Q?9UM9fdbaePq6A6h+lH+zj5eq51csHeITy0?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 11:15:00.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 5721cf22-e4be-41bf-f558-08d89cfcd5bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAUnG4kLrGeB2LO9ZS/JGucIpj1uN+xtxn5atfgddSY2Zt0q4VfI7rXSB2TmQqoXYNeCshZWHjsBmxsBQ+DLTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4395
X-OriginatorOrg: citrix.com

On Tue, Dec 08, 2020 at 07:45:00AM +0100, Jürgen Groß wrote:
> On 07.12.20 21:48, Jason Andryuk wrote:
> > On Mon, Dec 7, 2020 at 8:30 AM Juergen Gross <jgross@suse.com> wrote:
> > > 
> > > Commit 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated
> > > memory") introduced usage of ZONE_DEVICE memory for foreign memory
> > > mappings.
> > > 
> > > Unfortunately this collides with using page->lru for Xen backend
> > > private page caches.
> > > 
> > > Fix that by using page->zone_device_data instead.
> > > 
> > > Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated memory")
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Would it make sense to add BUG_ON(is_zone_device_page(page)) and the
> > opposite as appropriate to cache_enq?
> 
> No, I don't think so. At least in the CONFIG_ZONE_DEVICE case the
> initial list in a PV dom0 is populated from extra memory (basically
> the same, but not marked as zone device memory explicitly).

I assume it's fine for us to then use page->zone_device_data even if
the page is not explicitly marked as ZONE_DEVICE memory?

If that's fine, add my:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

To both patches, and thank you very much for fixing this!

Roger.

