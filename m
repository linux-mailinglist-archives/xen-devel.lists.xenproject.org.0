Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378ED6C657A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:44:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513752.795231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIQV-0008B2-A0; Thu, 23 Mar 2023 10:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513752.795231; Thu, 23 Mar 2023 10:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIQV-00088V-6s; Thu, 23 Mar 2023 10:44:11 +0000
Received: by outflank-mailman (input) for mailman id 513752;
 Thu, 23 Mar 2023 10:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfIQU-00088H-26
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:44:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a204da81-c967-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 11:44:07 +0100 (CET)
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 06:44:03 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB4960.namprd03.prod.outlook.com (2603:10b6:208:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 10:43:59 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 10:43:59 +0000
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
X-Inumbo-ID: a204da81-c967-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679568247;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uec8BW1nbQaI7pM83cKxkZlxJcrNmaWRCMjNs7yNtJw=;
  b=gtMptAJIQWvTGV4ZcLmrDdNPxTSmGFLOKWJ46nHEEP3uvwHLov+Jnz1k
   2omwaNpTlsjEb8icUD8WXPp05oYtDtYqa+YPfedrpCSlZUN47DUZbek9J
   GgwV+x6dzpk8yWT6QX8IJXf3MUWUJPKelXUU86Z2ZpZGYKknkfbIGB8As
   c=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 102415665
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rP5g5qIQsmMBpkesFE+Rv5UlxSXFcZb7ZxGr2PjKsXjdYENS0DdSn
 GccUGrTM6vbYzSgeYp/YN7n90wDvpLUnNUyTwJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5tKE8e+
 /snDwkAdxuCrLqs7PXncNFz05FLwMnDZOvzu1lG5BSBUbMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VrpTSJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr22raSw32mMG4UPO2Cqt0ym2+S+mhJKTQUdHqFi9SHtlHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/cz+UeN16PS7C6QA2RCRTlEAPQPsMImTDom2
 0XPs970DjxiqpWcTH7b/bCRxRuZOTIUNnMDbClCbgwI5djsiIg2glTESdMLOJWpg8L8Ay224
 zGOoCU0nbwVgeYC0qn99lfC6xqmu4LbRwoy6gLIV0qq6wp4YMiuYInAwXjc6/lEIYfACHmct
 X4Ls8Gb4KYFCpTlvA6QROQEWoOp7vCKGDTZjRhkGJxJ3xas4n+qe8Z74Dx4DE5sPoAPfjqBS
 FTIpQpb6ZtXPX2rRax6eYS8D4It16eIPcToULXYY8RDZrB1dRSb52d+aEiIxWfvnUMw16YlN
 v+mnd2ECH8bDeFtymqwTuJFjbsznHhinyXUWIzxyAmh3fyGfnmJRLwZMVyIKOck8KeDpwaT+
 NFaXyeX9yhivCTFSnG/2eYuwZoidBDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:sdck0q7/l5cKV4YWpQPXwamCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJYq
 Z1oaF81kqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBrT8LZyrnLDsqZpWAcjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102415665"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhy2M5cOrQJatl8EXVRkip0B/nTId2ZZdrwc6je5fZ8Q2txZHZDELgKqqMpiD+vfR7XfZN64hN9OVUJi2+sCxFpepZkJJHEJqrBGWQyMgDNyS+Vclg2lvdBywtXin+xsPPPFeNGXGjEJkg4N7ibvPx6qh7L+uzUuVOnUTpzEUYGrFSJBnyg93FOiaew3kbfVrW1aI4mlNQqqANzZpSJhHkP/FBCxBJRmVMR7gqlqDQoYYTBwaI1Rg4mAAmN2v1V4qMqQ6FbpISNYMcy4pDoSx3924zf9SUUaDX0h0muHwJOkQVgdpUONFLjMOuixSbDlrMb64/n6m+gBEq5H3dACvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp53R9mfqA+z4/1nbloJSlzT4BHVq8APQQXPq6ejMFo=;
 b=eUfP9C20UQtJgN/DlbNH5FYIS7SaeEGDbGmdiErGIcoUC2z786hcESKbvDgNqzjZnKZbYT470LPrCaghrp/ypPdQZCS5qJhkX3xPO/1+jcIXlzhVd08mnAl1cgVsDGF10WapojxSkzvb2eAfzjxEr/1YDYRi19qX+oL/KUH3vU200Wc3mlkpOSEeqaEc/djOB4uKrQ4V8kkBpcxhzXZuu8L/FSgeVB70cDZecT0fcQ4ESCERyVe7aan4uh41ku0NZs5W36xqdcsEq9hg0iaL7qsrUtd5fIxFpXZkXYl1z23PkaUtl0/yajNlAZr087lpRJ+u36ETnnXCjU1v/IAOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp53R9mfqA+z4/1nbloJSlzT4BHVq8APQQXPq6ejMFo=;
 b=KQP1Wk57SFvzMwLytNobaGR4ztMUaThiVh91tys/dzYdGZg5MgpuZiF6ackafZk2v/779qHDG+tEc2zOsy/uswgKyT27FzhPwufTm5op6DI8e2eza+zF6z06xyQ8gxH892QeXPrylED/Q3PJjEIf473tualkt+ZhwjOVGnDm3UY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 11:43:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Huang Rui <ray.huang@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBwtaceTNvCYksmR@Air-de-Roger>
References: <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger>
 <ZBr1k/B/ve8NNqaJ@amd.com>
 <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
X-ClientProxiedBy: LO4P123CA0353.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec6b441-9a5e-4fd1-0564-08db2b8b824c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0VLrmPrfV2lU0Xy5c3IxgGeqnTimaFwT7Dkg/CHfHh+QKALSOVlD/e8cVxVJvO/5IaocYJoB35ZA8cJhMj2EfMp9WLe34N12OU5z0D5uq2L9+cHN2NB/LrnfetpEvInOfn79hd4LvAQna4/zodKsMWzeYwPzAazmDgVJHvv3lNqFajA5xNPSN4sfRYTU8kp3liDSRMcIHEpxEcZxUHfao7b+FxhUgs9tcLNR8b2SnbturXjS0vYWBTierhWGO1M6gvsGTEq8nYs1y+ia8TSm0BIaNmVGPgNJD6m2SnxKt3bBKBMOkKTc6VBMnm7mcjqG1ARsuzgTAQNWXISe489FTiN9A2Db8kDZOJxx9wWwzDC5dpdI+uybSf2u/Tjh3vMjmzBt0C0LxE4wPAIbG98q+ulh8vroZ23Jdv8a8kZsqdQZdlZ6M8+pELNUNy4QqEW5xY8NVw9zI2K3hsp3mRILFqKyqXnnyXT/A45b6RppHJ9D23zlteAdEUjTjuG/7x1u1h6vNbZ7vXNZJEPhFRCl12t0KS3beL2VbXxPqi0IBj2Oae/lN2qaToy+egrhPX2HM00OdM49KvJV67YT3eBGiBo9hNlqQlOOBiPNl2loCeJusMgxVlZccEPsTc4WEJ7FhcByn9WNeLiaYy2XnOFecQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199018)(66899018)(41300700001)(66556008)(8676002)(7416002)(5660300002)(4326008)(6916009)(2906002)(86362001)(85182001)(82960400001)(38100700002)(66476007)(26005)(6666004)(6486002)(478600001)(316002)(8936002)(33716001)(66946007)(83380400001)(6512007)(6506007)(54906003)(53546011)(186003)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGNwd0x2b3hsbWp0M3NyN0NVbXk3TUNJVU9tN05qY2VUc3M2QU44V1JYQW1y?=
 =?utf-8?B?RGMyTGRvUkVxcHN6eWdEM0ZUZHd0Z3F3Y1g4UWhWZ0FXc280R1NHbjZrN1Fv?=
 =?utf-8?B?QkJUbXFFUjdTYWZLVEJhcnlsVnB6cVJmR3dHUTdYV2V0WjZ1dm5EaUpxRHZ5?=
 =?utf-8?B?bUNDTGo5M0UwV0ptaCttK3o3YmUxOVlnWEJxczdrd2RLZXVybzVVK1FuMlRl?=
 =?utf-8?B?dFN6dkwxQ1h2R2d6UXlQYW9JWk9nalJIRGxvZWF6Tm1wT0JIWjM4Y3AyQ2Rk?=
 =?utf-8?B?QXI0VHFybkdTalNPS1I1YUhEandJOW1UcWhBc1FCZFpqVFh6WS9ZcEtDWkRY?=
 =?utf-8?B?czA4eEtFSzgrVVVPd3EvTE5lenU5M0NFMFIybWxRMUIzcVBVTzVCM2JPSlZM?=
 =?utf-8?B?RWEzYTFWczVKdWlrQWNZTVlSTldKTk9scjZldll3L0pQQitrZkhFa3gvSzJR?=
 =?utf-8?B?OFA1U1Q2MEJoZW5PNHFHa0kzTHFWR0xDbDhsTmJIcGNsN0w2ODVIVHdTQVpY?=
 =?utf-8?B?ZTlOQWRTaW5TbWRJNC9HZzZvK0Rvc2k2NHl5MEs1OVV2YTVCRnlKd0NDU3lV?=
 =?utf-8?B?MTh5ZE5nNHN1bVVJc2xia1RGbSswWVBYLzIrdUJwWmVpTHJhTjRnTGFYdW4v?=
 =?utf-8?B?blJmTGF5NkIrVHdvcDVOSVJYV2ZqMkp4U0R2Ly9qMzd6TmlVdk5tZGRkZ0xl?=
 =?utf-8?B?YTBNZFo5QS9KTmNCVytoaFNudm10bVBIMWkrcDB6V2RLKzJNZ01qUy9idkd3?=
 =?utf-8?B?TE5oOFBGZWk1cEVsbVFFQ3RBQ3V6dHRiNUxZenhNeUhuMmpyaUg5cFpZNzZ2?=
 =?utf-8?B?MGJWS0tiNmV0elorMzFOemc2bnZWWjJ0MUtjWmlpVW8ySm9VVnVFZlJENS84?=
 =?utf-8?B?UnVuVE5PNzYvTytRdkFHbkk1UWtwYTZLOHhRd1U3K2FFcmR0RnJWZjMyWkYv?=
 =?utf-8?B?UGNya3dWdWIrd1ZrWXM5TDNmM25tQWNYaTdYaHZwZERJQjk2VCtqMkJ6STFr?=
 =?utf-8?B?UkJUSmhIWkh6OWtGRmlJd21ZdUF4SFZoNk9kL1NzZ3oxTENHZWtTQXlTTW8w?=
 =?utf-8?B?emNHQ1VTU0NJVGNYcFJxZmJxOFdIU1R2Y0JidFpIZVNkOERqNk12dkdicmJO?=
 =?utf-8?B?b3FBL1dmME4wNld1UUZKcmUzSUxpa3RtTDlVcVV0elZUZnA5ZHJYZEhnMmRu?=
 =?utf-8?B?ekU3L2hlNkh3Tkl2RE44V1Q3aTZad1BGWUlUakJaR29jN0FBV0pBb3dRUlNS?=
 =?utf-8?B?MHdDdk1leG1YdFRhZnpTaU5ESURiWUx6Ym5oNk5Va09oVzFFR0g1L1dwK1Ur?=
 =?utf-8?B?K3AzcnNTVGJlaFFYRk9JMTZ2V2RqRGlzejNDT284ZlhKVW1FMXI3WXlZM1U4?=
 =?utf-8?B?TU5yQ1M0SmMrNVhVYXBqQ2QxdXg1NE03b3NWY2JUNzl4QkUyOWZIdHB2ZTNu?=
 =?utf-8?B?R0YrTmkza3NhVGV4TVJNTnNFR2V6MjVGTm9NY2xFLzk1TzVjWStvb0NZQ3NZ?=
 =?utf-8?B?Z1Uvbk9zSlNiN25GQmlqcFV1WWJTU3BNTGhDbWJldlFwa0tyb0FPM1k3S1RO?=
 =?utf-8?B?T1V4Q1c0SVo5ZTVmZW9ZSXNuaGl3ZzJFa3ZRdUMzd05xMUczYlljeFZzMUxM?=
 =?utf-8?B?Wi9rdFQySjVzRTJhVHFTMXd0RWpYTkkwYkhxNDN5NTlDY0FheU5KQm9sUzZq?=
 =?utf-8?B?eHlBbEs1OHB0NjVqU0NmOHEvV1NPYnVVTGJNRkROZ3V1QlNCMXYxNTJ3Nk1k?=
 =?utf-8?B?cGlSMHFmV3MxdGtXYXFJc1VDR09sODFwUkpCbDltZUtPOXg1blVHazIzbXU1?=
 =?utf-8?B?dHp2dnhUaXJocGsxYno0RVZhaE9UcTFsdjM5VHQyYWlNdTZJRFhZQm1LampN?=
 =?utf-8?B?YkdQWmUvQnBSbFkyYzFKcm9FNnVnNVF2bmk4d3lJK04yNzlXOUVGZHR0Zk9h?=
 =?utf-8?B?UlpLRmFQOWZuOTh3YnMxeUxaR1hEbjlVTGQvNDZLT1lSaU1VSnFoRk9hOTNX?=
 =?utf-8?B?ZTE5blMxazIyNkcvYXp6NU5rUC9LVURZUGdYZEdUUGtTZUhONCswMG81L3lC?=
 =?utf-8?B?WHpyeWVvTG04NE5RSXNxaEtJZWU1aWtaMEtTR2tWZHBTNnBmZWRIY2ZGVjkw?=
 =?utf-8?B?UUMwTFhZYTZJQ1pUMklqWDZBaVRacjZmS2hHekxRUHRyOEl5b2pGUFlNUFc3?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wmbbyf3UEbZ8d4AUboWVoTslIzh7TyN3J1CbvUj2BHLzmK2t2rOvseQ+SWy4rJ19fBxkGsU1b7U3RyDOZ099z6esJAciVKq6T+NMrhyCfda1FNkZ1umOt4z1mMtFXbB8scUDoavW4JiPfwjDDb2/uZPGRGaK6+BN5lovh1LevH26aMWaHnUB2qA9m/mMvnfSAMyTOYs7KDCgdYa8S9FgxHaZJrCwBivGpqp2+uG3I2WKJ9OGZGzZT9X65mtjllsdZNVfF9A2nLuXqUZ4eT50v62tgcNV3cJujfHOGG/s7ORNVRIDMdZCr1mLVrZa6w/KBdc56chgLB6USK/vnJg98Qniok4ropTTeoF34fMxcI6HI9Y7K5fDRFJJf6i9+67oR4mhxhG+IOH0ZsICGFa7mldAFY0d9V6G9lBy7taxilvMZw9Et7niAPwqKfDlwP1bwpEAmWfvpyxKZsqREqdCA2e3hIgFwU7fE7sAUSOFOX8y74LbB6UjZ2psXu1M7JQdAmQkY7ZPpBITg9zeL31orM4suInYXpKOb1UEZ0jO6s4nggrL6uTTnQR39xrJg7OARRITfzZb65fOuiOOPFZy7SC3cpiiHY4ME4iVVxf9dBPa8JLtBI68MRco/2cwE8NDCI6Kmm+aV5SozWqL+ygYLeW1HTH5ioSTNSHKH0oDV28C1Hbgl3ezA4C6haI8nJnbSaB5/SevKdKn0Pt/u/oKymVWuLp+YFtW8V/E7LS3BpAkiBOSjtp1kCtalbEK8XjjqXxILUF8X1A9DWFF2XtBt25r97EwYB8MAViRAaB1Ar9V3iqS6rgw8HHf3xkCW9iPh50DO8wvUwURkPmScOAWqFTyuVS6XLP/AYV1sOrpF5y4kJBCaq9sDCfHAtX3LyyU
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec6b441-9a5e-4fd1-0564-08db2b8b824c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 10:43:59.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMY7bwx6CsEcw4S+emgUiVwTvjWMBdgsT/QdjxxGIHJASOyrQmWg/Q2nvS9kkwo1MIx/U/thnJRHkLftkZNpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4960

On Wed, Mar 22, 2023 at 01:48:30PM +0100, Jan Beulich wrote:
> On 22.03.2023 13:33, Huang Rui wrote:
> > I traced that while we do pci-assignable-add, we will follow below trace to
> > bind the passthrough device.
> > 
> > pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
> > 
> > Then kernel xen-pciback driver want to add virtual configuration spaces. In
> > this phase, the bar_write() in xen hypervisor will be called. I still need
> > a bit more time to figure the exact reason. May I know where the
> > xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?
> 
> Any config space access would. And I might guess ...
> 
> > [  309.719049] xen_pciback: wants to seize 0000:03:00.0
> > [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
> > [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
> > [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
> > [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
> > [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
> > [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
> > [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
> > [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
> > [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
> > [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
> > [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
> > [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
> > [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
> > [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
> > [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
> > [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
> > [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
> > [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
> > [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
> > [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
> > [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
> > [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
> > [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
> > [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
> > [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
> > [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
> > [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
> > [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
> > [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
> > [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
> > [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
> > [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
> > [  462.911658] Already setup the GSI :28
> > [  462.911668] Already map the GSI :28 and IRQ: 115
> > [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
> > [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
> > [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device
> 
> ... it is actually the reset here, saving and then restoring config space.
> If e.g. that restore was done "blindly" (i.e. simply writing fields low to
> high), then memory decode would be re-enabled before the BARs are written.

The problem is also that we don't tell vPCI that the device has been
reset, so the current cached state in pdev->vpci is all out of date
with the real device state.

I didn't hit this on my test because the device I was using had no
reset support.

I don't think it's feasible for Xen to detect all the possible reset
methods dom0 might use, as some of those are device specific for
example.

We would have to introduce a new hypercall that clears all vPCI device
state, PHYSDEVOP_pci_device_reset for example.  This will involve
adding proper cleanup functions, as the current code in
vpci_remove_device() only deals with allocated memory (because so far
devices where not deassigned) but we now also need to make sure
MSI(-X) interrupts are torn down and freed, and will also require
removing any mappings of BARs into the dom0 physmap.

Thanks, Roger.

