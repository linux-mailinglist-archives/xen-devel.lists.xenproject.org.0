Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF5B5FEA07
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422516.668588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFfX-0007kp-Py; Fri, 14 Oct 2022 08:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422516.668588; Fri, 14 Oct 2022 08:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFfX-0007im-N9; Fri, 14 Oct 2022 08:03:47 +0000
Received: by outflank-mailman (input) for mailman id 422516;
 Fri, 14 Oct 2022 08:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaRP=2P=citrix.com=prvs=27923c854=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ojFfW-0007ig-9Q
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:03:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7dca0c8-4b96-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 10:03:44 +0200 (CEST)
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 04:03:41 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB5999.namprd03.prod.outlook.com (2603:10b6:5:38a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 08:03:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 08:03:36 +0000
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
X-Inumbo-ID: b7dca0c8-4b96-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665734624;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NI4x89Xi/2TBGkfScpxZmNkhe/Q3gyNLVSLr5yiOAGk=;
  b=IX8+gi+32OKAJa+eOmG+TJwEc2R/DDnje0o4Okjsmmt3DZ5WHLIqygjg
   1RWB/3efdv8sAIxt/dZ6y3CMue3KHx0IYz8KYC+sa9gLQL8I9vqtHpNYX
   dhEAf2spkvFh4KHDYkXQejOX2pB/MRMjPNm7nGY7/j3PdQYUXAorHzhQ1
   A=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 82734330
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Ab5vil6/Cy1IwklMwbPjWDrVtTnXE+AQUBUUsX?=
 =?us-ascii?q?f3Cpuox9vdTzo0SJWKXQww3xtKpvFycd/pdrF8U6HfgqX9rwR6pjUk4BYJen?=
 =?us-ascii?q?BXZgbeA2AY+f/LqHPO7FUIptKp4mmJ9IXoGkdpOwkJNaImnSNg8UnzzxMjFk?=
 =?us-ascii?q?EWfXhf+HC/HLh6XaA1v0rgsl3S3Er4TZ8haNlKW4lGcYUPamvKcBgNvE9HgF?=
 =?us-ascii?q?KNAbilWs6q/7s7kCmhaMj9lYhppNIr+L8YIB9Z9DBEr3fprrLFoYuVy2CH6f?=
 =?us-ascii?q?EBbmCEcR5UyJvkdGanj8yVOffuwt/caEx5SZO1zrj6Hk8UYnVV/64ktnoNEm?=
 =?us-ascii?q?GQx3SQjbxF7fdl5i0+CZam6j2W6I5F7ANJ7G2ISY/WQuYsLYBYx4ww/MSpbz?=
 =?us-ascii?q?q27HswBGmWn+zFnxufjpt2pCXJdlDk1Ao9OGMsx7bgxH8p44n0OtdjFJ+8al?=
 =?us-ascii?q?5xPfGYd9xn4rAIT0x5fsg1rlppSLqKMVQXSpdN7RWx+p6Jd3h85w5WZSQ0bk?=
 =?us-ascii?q?tHXcUC+pIZ1q4BdVAkJVm5ZL6chdDeTLueRyPhkKVZZAWA6t5nYNo3qN6Vwn?=
 =?us-ascii?q?AMu4kGYP7LC35F2L9wl6C+dyYLII/jT4w7JfJ+Q12ThE0rfFE3SEIdGq9YfO?=
 =?us-ascii?q?K/vtz4KnYrB0HYWteOb8pSte735Uu6CFtyX88nijPHOEe4g269qoehlJCiFB?=
 =?us-ascii?q?2viKhB4+hA+xjsWO7Nplyigtz8PHhEt7FKpThH5e7JyF94EcDyk3h2ICIZbT?=
 =?us-ascii?q?0Huc7LKrBE3vXIbqXpQIld2GV85D2yQPDgvTJkMfG/dm2m9hRoEW/rdusQh6?=
 =?us-ascii?q?HL9lss9F/Xo7z/JAKb2nHV/29gx97jYmXN598t3aK7fgS8FxokowU4MN3gQj?=
 =?us-ascii?q?wnBZAzcX58pCwzK5/yxu4PdubToz+jXx7bLv7Aan3hyJS4NnQpKLI+9/PUWo?=
 =?us-ascii?q?YxW/f/hBGj9Vsfcs5J1A9ykTPmuv3CbZGH8/v3QOYC+gSgmCr03fnTkryPqv?=
 =?us-ascii?q?HsMG7L+OLUZbHCJgQgsTK8wvuRLthfsiSuI36Y9Ur0A5w7CQ9RHi317SgHZE?=
 =?us-ascii?q?fhWbGJfmv05XrsL7dyuKaMOQ9kkop990lWaxUAWhzCdklmyUzNIey5+JgIAG?=
 =?us-ascii?q?UxYcoV5lvgDdn8MT2sw8lF0EuT19A65j3FksQGGYHRL+3M4CQ7E2VJRpWr8j?=
 =?us-ascii?q?zMV1eM5Ivzbk9oUzehAPxayNPeI0q1BvY/BoEB6dQQUU/IGD81TE2xNDIMB/?=
 =?us-ascii?q?orvMFeSzl5YeAeI2mTdr/xaMsR2J2l3qSfRLXQvk4G0dSGt0zxG0ZaaSQ+bz?=
 =?us-ascii?q?sE7/ikwGeJAxQvlEixhj6X71yW3NCH9UbjTgFNwo/pGP1hp4OAfIhHmAAGzm?=
 =?us-ascii?q?vxVBlFWE1gpkQjCbZMRCIb7fKDOUaJzmiQ+ZvrqaptwK9orfs9B4nmaK+sjs?=
 =?us-ascii?q?i29GCw9WZHoD6Bggae5c/aCBJbNiUMtlDweDmHDTaAYThKYm1uV3QXuhYdFN?=
 =?us-ascii?q?mxCL6EjVPOsMKgbuw/2I0mjut2ML2oLN5oAdbr72CtqApijl4Wb2lt0vppjj?=
 =?us-ascii?q?bZ+H/n0VfkKdoGjH8CdE5sNa0GtVgRuIeuhmJucjIMCRV5r2Mo8AMJzLZ+37?=
 =?us-ascii?q?SorK+qSo3EIKIjSJ4/VpWq/llClihamlxV7QyIZDqXYLjwQW6Bt9j57JIcD0?=
 =?us-ascii?q?7GAcyjQcnQnn5BFT9ZKUNboz/HAA4klbov/54idGLbBepfOtX/wgp8WEFm26?=
 =?us-ascii?q?iBRBBeQ07SdyEMPfI7oycsqUidmz4gjgmhSvsA+blYUqce/LgrjLHdaa1Gpr?=
 =?us-ascii?q?oUY1WQsaPTWx+g9f18uSjrTzMPPLa9Lok7PXtYcBzurNNM2hDTHLJFwQ7XR0?=
 =?us-ascii?q?GmP5HYQzfugnkBAHuji61mLJgcNsucn4imuO9OZCmrHk2gbOb00x5LxlQQRC?=
 =?us-ascii?q?uVNseajeLx7hlbtyh2D9EZQiqltDJN7KUIIUvyZX0A93qWMliUfuOSnZmmvn?=
 =?us-ascii?q?r21sMO/uT2R7awXoPdEqlTPKthxgnsmBEN9vzMaffc/rJQG3Z1tgehBDDTZ5?=
 =?us-ascii?q?n7TEYxJkGezE6pM95f0Zzm6uQl2DXFqcMZVCe26eMPp4T1Kb55Mg6zV6JnJ0?=
 =?us-ascii?q?/LLXgL9gp0mTg2XQYFUigIGLK9sytSwgT7JMrAcY9SDoi0AP8zUht3Tr2kyt?=
 =?us-ascii?q?0IBB5sUtccaPNNFuDSZdr32gOXF8+5eFWD2BzGh59wYaGiIGe0dw0ZXMDO49?=
 =?us-ascii?q?ufPN1VWAEM1ujur+Z5JrMikJd2EXp8JOWvt53Vo6Rpv36st0eWnc6mc5BtFg?=
 =?us-ascii?q?XQS4OorePEyyLw3bs6DL6G+YhNQekmEYbk7m9Pm3LJp3rMcJnKgmh4gm3Hme?=
 =?us-ascii?q?LuHkvbskEx/mtp0XvRSwDyyqKnJr/3ed5hvSkffpnecwnRg5f0jB6vkAwZLA?=
 =?us-ascii?q?i/BHbLBm269Bofdiyqat28Wdi//hs7RRY7PT2Uvafk8?=
X-IronPort-AV: E=Sophos;i="5.95,182,1661832000"; 
   d="scan'208";a="82734330"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfdpqsAYHyc+vfXd4yQrZTJuqvO5c7v+wxBGCPSy6ItbqFBLK9GnPeEqESdZK3+LILfN79I42cmnuh3AJKmu+R6nPq0XUGgUomPzYdGWNjn529LqmMtNTit9trO3SaZwq6TFl5VCOXSUT5+7vaiSiEowIMoR8P1yB1gavJLA/4qSR1dVq/aYop4ULZN7aa2R2jb4bSvgtyTHYsBdh/45fLT2ltrde9lcJYCjgB0vFHC0aMaFHtpovaJxYDm8fo4sZ2hI7oMr8UvJXNEh9bvK5Qz9Rsot08mnkDtKxn9I1+tw1nOPkuahhFJ90eKeCF2i7thijoIKCX2GbJ8GOSDa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Mt/24a6Tr+BU7pmDHNjy49cBDJ7c1U4GVoTq1Sp9fY=;
 b=LbOFcFFk59n8WHZniVBjP0xT9N7rKnDh/A57F2rmZhjP5lbWfnEvjNbSbEeU2yM08jUbiognF1+LJJE6/qlDTIogPkUcVoTeGkmivdRLiMxUcGww2H8PzBXD/vvyT9xhbGNY6Iuphc06n3rpghksg2C1/7VkJ6r9P252PjpIxG839QT0lbZVozF3kMqCo++b9UCnwYaE/D6Ur+lu/NnCzMu5/lSsmCVN3gY56oOBajUAqJR704Wzm6s2cLAFDmA7bY7tliHGp/1kKUfrFtx/pRLkP7RSkf/J2XLPPiR7XgCkBf5svVCY9Vq20WKz0P9/dHvoHg1BVqYjgWWrqbuQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Mt/24a6Tr+BU7pmDHNjy49cBDJ7c1U4GVoTq1Sp9fY=;
 b=i+PIHCcfPMjd1nuTzSFYVKsnxmhr4yDEJjEnJvFIGez9JazrCYpooNoEnqqP9NnYfHdpup28/OCyMq1GNHfwJ+Vf9NztZauoxv4OT+T9a4ayH7+K09bwHG+lKJ66NZUEQ+JksHDYOocY/gMDX9vkw+daIBhao2gWWoVtPINpxgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Oct 2022 10:03:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Message-ID: <Y0ggOLWa7onsacmb@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
 <Y0f+gL1PfB5lzlDj@Air-de-Roger>
 <1867142e-ee46-daa7-c05c-04045460ba52@suse.com>
 <Y0gOOcbw2bebsKAJ@Air-de-Roger>
 <dd2ca7b9-f7a3-208d-f757-cf47f37de1ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd2ca7b9-f7a3-208d-f757-cf47f37de1ab@suse.com>
X-ClientProxiedBy: LO2P265CA0388.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e10911-72f9-42d9-dedd-08daadba9851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e6mZvY12GeQ4RbmSIh1sIp9a/s6ghIy6RpcfFztnxIaaYqOoaul8HkBp+cXVikzv+OI64JYF0N8KR+DEsm5085JuRAZh8vT9AL0GE0/Z0GY4r5xPrqumkH3sircqdDItM9xML4Z8wD58Dj56SIkma19cA3wi7NPIn+4LD5AIQcjK28dzc0jir++5hB5kviJO4zf27wT1Ve/HHb0A81zWLVnwm+8RmbNZyVwb4GkM5TtoKxTFIChrNMXO43sVo6tHpEFt8IOuCcL8PjCUgSD4Cje+zFjEaQvncIvKypqgA8bDVDz+6DruX5JaNSkRnvkq2bnTQypWEdoYP934vWngobICLXxIwC26B3o8kiJjl1CEdkKvbSjDfCwajDyIBHnShKwgtmveRRrwBtPNMMZ+lnzMS/dPYEXLch0PPoR02U4bQECiWNd2Cxo4WG3OvGimdVtHHwDqytBfnh2p2EDDfeS9JPV5dBMPbpi79lDxtO68xUmXelCCp/cdrXZlt53oX74DsGRpbP4rex3YW7xkCG81sEm+5eaEqoDfOxNpAMo8viRwU9vurZhD//k7Fi+OPFUDJZKPa1CjzE8/6MdL6YZLUb/JQ453Tu4YuMt/bwML61+vGWC0enfdhfSFAcIxiOVnqlTSVkqblvnS91RrQvpQITjLNs7rUnJScBfxvVvIlky2RfJD3mli7CMkz1M4NjAirc44bqo9i+QgCh2Yrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(33716001)(2906002)(6486002)(478600001)(83380400001)(6666004)(82960400001)(8936002)(53546011)(6506007)(5660300002)(86362001)(186003)(54906003)(41300700001)(316002)(26005)(38100700002)(6512007)(4326008)(9686003)(8676002)(6916009)(66476007)(66946007)(66556008)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDl2K0FkdU16OUlCUjlLWExHbEdvTUhjdHQwbSs0YzFyVTViWitQY2lFU1Zx?=
 =?utf-8?B?ejY5WnhwWWtNVXVQcmZTUWczdWtBaFZXT1hCMDBBZkJmNlJ3bmVIVUszanBq?=
 =?utf-8?B?MkQrVzZqMzF4aW1jM1FGd3RobEJ3UjhwNjd4OUVhVVJiV3ozTmdCUDkyd1dN?=
 =?utf-8?B?R0tjMGNLb0EzQXcxaGVoUHpXZ0VoRzdFd1dZMGhLeEhJMDF0N0hRMmw1V0d5?=
 =?utf-8?B?Tm44L0J2dlJiR1dXY1B2WlVncFNBQkphUjVDQkEydVk1d0hYMlJsMkFXT09x?=
 =?utf-8?B?SmpKOW5oZWMzZXZaOFcrWTlROEh5UjVHOVpDanhmNkttYlpJaEdGNTMzb0Vi?=
 =?utf-8?B?bUVTblVnTDg0dzY0eGtjM1dCbnNxbkZJeThndWh4RXNITWdRREJ4UzJObGJB?=
 =?utf-8?B?enRWSFZFR0RrT2NNMmE0bXZyd2pKVk1sUC8yNzRtQm0yOVhwNS8vejRZait6?=
 =?utf-8?B?M1ZFcDFwN09VeEZnQWZtY0dkOGUrc1U3OHJER1JlcUpsMjRqS3A1a1N3M0lV?=
 =?utf-8?B?Wk1MKzRPS1JWYm1WZXJ1b25LSU1BYVJjbEl5cUV3WmZ3SFoycmRoRHY1YTd2?=
 =?utf-8?B?Z21JcTRMSHFLMkYrMDNOSGp3NWhkOVlWYUUwT2YzeG5UbXpTL2NSR28xQ2ZY?=
 =?utf-8?B?azZ6SHZsaVF2YUtPSVMrSnU4M3lGZGh3WTIxT3I3c1JJVlhtdS9ibHJvck04?=
 =?utf-8?B?ajltZE9FdEV3TmdCK25hVExBL3BqUGlUWE9BYWRDc0dzQ0ZuaWljd2JSYmxM?=
 =?utf-8?B?Zm1hZGd5TFp0N0JJbnVqU2MrcG5sYXlmU2VTbWQrUFUreTVGQmFjZ0srZDdH?=
 =?utf-8?B?VXdYNGpQbWdscm9yNlFkMUFPS3lMa3ArUVoybXgreS8vVjI2bnlJOWtBcVFv?=
 =?utf-8?B?RVlyZHdXRkZNeHpabjMrU3Z1amNSdDFvKzVmVkhGZ2VuajJOYmtVNE9rZHRi?=
 =?utf-8?B?OXZYem5Ob3hGY2FJRjFXWGVvaUtoQmk5ZDQ0Y0liS0lRaXpLSUN6RnBHL0c5?=
 =?utf-8?B?UlA5bks0T0xuVzQwdld6RS9OM2FzOS92elRvM0MzakRBOXF0cEFHV0tPcXRC?=
 =?utf-8?B?bUd3VW5MZXZ4ZDA1U3BEeldHcUhZL3ZoL0hBZWtkaVhtbXA4bUswV3dMTG5Q?=
 =?utf-8?B?WCtIMktNWU14aXBuQjVKNkVaMjdSd1ZiaU9xcHh6T0JWUTVNSjNxREM2R3VE?=
 =?utf-8?B?MmgxOGF5YXAzSUs2bzZOVDVBUVo4ZURZdDFxSVVxeDM5blJiTGpNU3FrbHZm?=
 =?utf-8?B?bGJvMTVLejRURDA2WXgxbWx4THJwbVNHRzRERVZoWXM2S3JHZHJTUUNoR1li?=
 =?utf-8?B?RFNNdFNSZjJBcjhQQVFZL1pocmFvV0cyRzR0K2Y3QUw1U3ZmQWVjcnFOREdS?=
 =?utf-8?B?SThyVGZ4QVR2RGo3TTdPMzNhZjdwb05NUTgvb2k3WWZaQXNCdTVFVnhSRlBn?=
 =?utf-8?B?VUpHUkVEZHB4NjBKWjh6WFpVM2JITk5jU045ZHFqbS9jcHowMVNMMStmVHBH?=
 =?utf-8?B?Y1ZYbytObkJ4OWFPYXV1QjBNZDJ5RUhOYyt6TVVGRlBXdVVpSW5tenFKSnVP?=
 =?utf-8?B?aGdjazZzaGhWV1kzRm8wcWVxUnpZaVdpUXpncC9RME1JeTAyZHVCcE9BdXZD?=
 =?utf-8?B?TDVXZWVOWnJISDI4S0FpM2lDR2RzY2pCL0JiaUE5elROSGF5TW1UOEdnMFZs?=
 =?utf-8?B?SEw2UVk5a08vQmRiS3FHcitUVkhoRVkvSnhrS01DSWFKb2RBRm95ZXNsOGlV?=
 =?utf-8?B?S1IxVkZUUUk1cExkNVVEcGVoNUxCNVlUWkcyV0RpNnZBTFZKR216WjRQMWhm?=
 =?utf-8?B?cWp5bUxGa0lkRno2N0xRL2g3SlRMQVh6WDE5QVF2NHpLbTBhNWtBWTd6YXJT?=
 =?utf-8?B?bDFSdFhMcFZWRVRIbU5tUEhhOTRmYjlVWnF3ZlV0dzFZa1J1YjN6T3VKT3RG?=
 =?utf-8?B?UGQ5dkJ6TFFBU0R4cjdOT21WOFowUElPNktFN2VoSW9rQ1Z3VVJWY0pMRFp1?=
 =?utf-8?B?WU4xVDdtL3BzRXVUc3ZQcVJxTVBwZEdDSjRGNGFyd1dEdUZMaHdZcHh5WXhQ?=
 =?utf-8?B?R1lxcFVtRklPMmExY09mSjJ5U3hqWUFCVXlZRFIzK3JzNXFKRks1cXBBREtS?=
 =?utf-8?Q?adD7G5uWLfxZyg7UznYjd94ZC?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e10911-72f9-42d9-dedd-08daadba9851
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:03:36.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Fo+i+AvXoagyCK4hhTOtbAWX2Zc+ggBPhYldzIf9iOsPEZZfm2PCNH0PNBLGUwd87V5lxqGuQUrP9SD6CsUCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999

On Thu, Oct 13, 2022 at 04:15:04PM +0200, Jan Beulich wrote:
> On 13.10.2022 15:10, Roger Pau Monné wrote:
> > On Thu, Oct 13, 2022 at 02:17:54PM +0200, Jan Beulich wrote:
> >> On 13.10.2022 14:03, Roger Pau Monné wrote:
> >>> On Thu, Aug 18, 2022 at 03:04:51PM +0200, Jan Beulich wrote:
> >>>> From: Peter Zijlstra <peterz@infradead.org>
> >>>>
> >>>> Having IBRS enabled while the SMT sibling is idle unnecessarily slows
> >>>> down the running sibling. OTOH, disabling IBRS around idle takes two
> >>>> MSR writes, which will increase the idle latency.
> >>>>
> >>>> Therefore, only disable IBRS around deeper idle states. Shallow idle
> >>>> states are bounded by the tick in duration, since NOHZ is not allowed
> >>>> for them by virtue of their short target residency.
> >>>>
> >>>> Only do this for mwait-driven idle, since that keeps interrupts disabled
> >>>> across idle, which makes disabling IBRS vs IRQ-entry a non-issue.
> >>>>
> >>>> Note: C6 is a random threshold, most importantly C1 probably shouldn't
> >>>> disable IBRS, benchmarking needed.
> >>>>
> >>>> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >>>> Signed-off-by: Borislav Petkov <bp@suse.de>
> >>>> Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
> >>>> Signed-off-by: Borislav Petkov <bp@suse.de>
> >>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Thanks.
> >>
> >>> One unrelated comment below.
> >>> [...]
> >>>> @@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
> >>>>  			pm_idle_save();
> >>>>  		else
> >>>>  		{
> >>>> -			struct cpu_info *info = get_cpu_info();
> >>>> -
> >>>>  			spec_ctrl_enter_idle(info);
> >>>>  			safe_halt();
> >>>>  			spec_ctrl_exit_idle(info);
> >>>
> >>> Do we need to disable speculation just for the hlt if there's no
> >>> C state change?
> >>>
> >>> It would seem to me like the MSR writes could add a lot of latency
> >>> when there's no C state change.
> >>
> >> HLT enters (at least) C1, so is a C-state change to me as well. Plus
> >> we may remain there for a while, and during that time we'd like to
> >> not unduly impact the other thread.
> > 
> > OK, but it's not a "deeper C state" as mentioned in the commit
> > message.
> 
> Correct. But it's also code not being altered by this commit.

Indeed, that's why it's an unrelated comment.  I was just wondering
whether we should drop those or not in a separate patch.  I'm
concerned over hitting that path on a virtualized environment, where
changing the spec controls is likely not that cheap.

Thanks, Roger.

