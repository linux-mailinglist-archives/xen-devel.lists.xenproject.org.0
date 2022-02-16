Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0DE4B83BA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273817.469089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGMD-0000NA-By; Wed, 16 Feb 2022 09:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273817.469089; Wed, 16 Feb 2022 09:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGMD-0000KB-8g; Wed, 16 Feb 2022 09:12:17 +0000
Received: by outflank-mailman (input) for mailman id 273817;
 Wed, 16 Feb 2022 09:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKGMB-0000K5-CE
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:12:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 863dd229-8f08-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 10:12:13 +0100 (CET)
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
X-Inumbo-ID: 863dd229-8f08-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645002733;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v71hvXgENyt/7i786Sjub7qsSd4F6KSUH5lYS3es2XY=;
  b=HUyN8pcpUW8k3fj7eehhbDilcW0CcM1EREjQvohk0hUnmtMoPJaOGbBT
   eLYKxQx9yCcf/IwQ9V8ayeFYoKlneR7WLiay97c7Ifu+B6HH0ncOLjC8P
   P8mBoYvHStx2ylT9j7DZh3diTBqDhsKLQT4yUUL7GmF6oCHyX2XIm8NJH
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +0WPSXzeeuwHjyTZycKIiISjtvMcc8TXA7SdVxPbUIpH+iLvi08XBFgPhjjDJ0GVcWhf4O/N2C
 MPWDxY+8JTbooyiKikiHAomgFSSTPHJ73Ees7/Uc1rAA2sSOhzDHG4rjyO2+yFh6RlwcUerfnZ
 QkLQjXr1h4GUFTOaDYI28KW7sz9FyATm4GUqwOfdBH3DTRieL7xxjtkvSujM/fiSZHObGmfUuj
 ZvCamqdTew/pokKwG1V7QaAidaHh3cnOb7EsoMGb68KhVLuxUOi3LUGtKxIuD38f+AfNUcakLV
 qINArmYZ2EsDPkKY7xLmeZU5
X-SBRS: 5.1
X-MesageID: 64321649
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Y0bFpqrkXFrDEnTDjyMtXStIA3xeBmL3YhIvgKrLsJaIsI4StFCzt
 garIBmFOP6JYzP1fdggO4W28EkFupeAyt4yTgFoqysxFX5H+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncytcisMIrX2ofkUbTpDQipdG4dk+aCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SRqyHO
 ZZIAdZpRAnyXEdJYwosMYwnrf+XjGjnKz9pg03A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEBUUwVtTcA+jvYrTAIJz
 Q6CvPXDJz1w5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBraL9QdF1Oz6zYWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuMMCYSLwPP4mOtjZ5yEWIU7IT4mNuhf8NIQmX3SMXFXfoHEGibC4gwgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8ZwHLLXSfVA/RQnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZkTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:2PlxAK493KcTOw+2fAPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbq6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsOmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczIgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenEPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tpt+CVQpAZEyHsHceg12w
 3zCNUcqFh/dL5mUUtDPpZzfSKWMB26ffueChPaHbzYfJt3SU4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64321649"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks+qsuwrS6S3xjuNZdnxt6XkVd7lYkd08CHE20Unyp9p8oYUq4h3LEzxfVH4f/gXnrdAr32cMj72fpM8/d4c9uHFFQXlv3EnIGYr7+4XDVJo3ZUIBJM5MfqXjQgcQyOqa5sGNE0rd5a+PM38yQ8cuoGt2cz6x1RT3dcL3t4joRGo/6U3Icu0CduMKU6NjTOMWW3y3TgoKXVG9ENcPIqPm3ObIjQjSn1B31125mtJzMNOzxDDmBo6AYMmKH3MuCe0dfND0dAuDFoxjRvHrJXe0z1n1XSH3FC27xxe3CD8fA5+yFW4MzgjmEsiRP5ERtyidaCJSLcse/TGQjjRvDdNpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udVluXiR1QzWXX/IJsGNlDXZGztfrZ920p1zPk5J7u4=;
 b=EK8sgsqhsFd1AgmUW6+PKzDPTar623Rrvp0nk+Tqbp69NNowGayM5GsitWbgg76P60yUBBP9Si4aDmtSqcZJaqp8LXhDDqpt5VIARKBsP/AgODFdMbeeBjWEyPIVCGgQeIy/E9h6EDXOCsdx0FEbu5Pp7m9USWt0ilNQk+rfaU2Ps6YQkG/MmeAwYXicQHYzvTQrUBfuKsGj1R+jyaF7LDzq7VToOaz8W7VXgG+fRcf2DSpuyZChSZEGrtK/KaBLGICu/itdGQj2sLJqcVmh4cMw/NFIEc3V1pFqLWpkzoIGNKes2ymFCfp/q1vPq0tRsK6QQzn7HP4P4UDpKeb/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udVluXiR1QzWXX/IJsGNlDXZGztfrZ920p1zPk5J7u4=;
 b=YFjlxSbpjj4xyVwq5dz6zA7bl5kiqxUR3lUOkZG/9sU0VvSztQt9n1i1Pega95C1kZvFGMvVDdExAqo2QdrT2renKFP0sXBqWOTzhNkDxdvA1iKJ2qNGbp0pxYynYNJRgAuHpRJIKTRijymDDFXjA9l8kkvHUg8nPMvM+4q39k4=
Date: Wed, 16 Feb 2022 10:12:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] tools/libxl: don't allow IOMMU usage with PoD
Message-ID: <Ygy/4zk8Eo78ECi5@Air-de-Roger>
References: <20220203143211.18967-1-roger.pau@citrix.com>
 <YgvB5UtyC29m8zbo@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgvB5UtyC29m8zbo@perard.uk.xensource.com>
X-ClientProxiedBy: LO2P265CA0443.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::23) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a4ff2c9-3752-414f-ee54-08d9f12c68a4
X-MS-TrafficTypeDiagnostic: BL0PR03MB4131:EE_
X-Microsoft-Antispam-PRVS: <BL0PR03MB41312960EAEC579CDAA97EBC8F359@BL0PR03MB4131.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEc3SHJVzd3hOdmPKLPVfJaL8vhTX3GTbL5Z/LTn9aXIehD2sCd++rqSbdQyKt/t+uRIFM9aqeMTovfei9/uel9YrNc0FXAD2aXytN9oKdHhauPnUzKsZRRruksdxdbTR0SDDm9+VjNEu4Ag5IAjOsvvk9DFyRI/Z/59h7dpnxE8kvEVDak95z8pz/In5aprcKXHoAvDYy5sPLvEZUbzhws25mEAVPvwUdA1SsrPKYUXufZPSEYlDdpuO9QtmUwhtQnzuO3ZcajEhVYpjI46NJodsWKpfGXnkjeJT00qGibTkU63PorgEPyYDt6OoULFw9N/PWmuGtaZ74HG3X3qg9DsGjwNVVTdF9xAfd0Bn2xYgpa3Km5168YsBoZ7JNY/YtCVBFKOaN/RGK7J5vN/4hkW9jhof48nOC4ajsZViZW9sn8FzPU5vFiCudvm5Do79vcIWbXBz99gWZ5uSU2isGjuuLwpTqPNNVXM8kuOVITa2dIOIuh6ZZBaDW1Hqfasy9DbAvnqlpdSxUGlwZgRkDoy3FghOzzvLt65XHA0vo1knSEdBqJOdgBaaS/voOlyRFQUbTiDJb14N6pUPQXTZSZqfPQEfiyaGc/kwGRZXFhK2AhL5m20+V9qWhFRwe4Swmzr/wkgAYqqsm80yX8LDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(33716001)(6636002)(316002)(85182001)(6486002)(4326008)(508600001)(66476007)(86362001)(26005)(66556008)(82960400001)(54906003)(6862004)(66946007)(8676002)(6506007)(2906002)(6666004)(9686003)(38100700002)(6512007)(83380400001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFlMTFiZ3A2QXl3aVdoMEtocWFnelpKcFphbGhMOGtNa3pITUgzbndNWUl4?=
 =?utf-8?B?VXhjL1NYaDE3cDl0TzZmVkxmb3JnRE5PWjJJalB6a3Ryc1ZyYlhBRHFoZmQ4?=
 =?utf-8?B?SVl5YWJFcHZxU2pkU29nQ21hTW9lQlVPcVkxRW9lSUoxbVJlL3ZvdHZPTVlm?=
 =?utf-8?B?dnMwbnMzUlhUcFZwUG80TlJ2U1I2c3VDa2Zxd2tqRVlsamUzaHNEV1B6RURS?=
 =?utf-8?B?TG5lenlFZUlVTWFZelM0UzZqV2dlcFFkazg2cXhhTmdiWkpuRXlGVlF3dlVL?=
 =?utf-8?B?eFFDZVd0V2lFZ2JQTVBQdk9HZzd3NUpqQWZ3cXJvVk1ESXF6YXZoSGtnaE15?=
 =?utf-8?B?MUREOHJpTGZjcVZ3YmlOMGtsSDk0VVlpYnVqQ1lXem5KRC9VenRZQmtUNDJP?=
 =?utf-8?B?N0xwbnFxd1dic3MvTXRPZzdGcjAyOTlyUnpqWVBNblBzSXlpeWNCWFFkS3U2?=
 =?utf-8?B?cWVZMlJ0bGZaS21TWnFzRUprK0xCVDM1amZ1MlRNMFFaNUxVTFpiT3FpNmFu?=
 =?utf-8?B?QlBaS1FYa3JYeDJISWVtLzNWVEw1Wmx6bXhtZTNKRmtLZnB0WGxUT3RLNXhM?=
 =?utf-8?B?bGkwUSt1VzNOMVQzdTIrZ3NJdVNWRDBxZUZRYnV0MGk3T3BTUGR2eDI3YXJQ?=
 =?utf-8?B?VWN4cng0V3hkOG5QZTdzaE8wckozU0FYZEZ0SXdFaCt3cGFVZVoycFpGbEFN?=
 =?utf-8?B?RGpzOWZrZWdEZVFoV0ZaS1NCSUlYeDlJa3VNSGM3ekZGUTArNytaZzdUZXYw?=
 =?utf-8?B?SDJpSWkydnZSa20wZTJCZ3lFQ0w5UlRDSzgzYklkTU9Qb0RQc1JLaWg1ZmlO?=
 =?utf-8?B?alF0ZWtIM0ZCQ0RsdzJDUUdMWHZzUjRsbXVTVGkveEVUOFFBTy9SN3YvdVUz?=
 =?utf-8?B?N3RDcTIrNWtMSC95YnVrR3NzTUtZSmlNUVpPQ1JrTzRyc2s0SEpJTmVvSm50?=
 =?utf-8?B?a2NzRHlFZHhmSC9zd2RzUlg3KytIa0VEQUtZcXkzZzZGR1VuQ294Ui9oT3ZY?=
 =?utf-8?B?WTQ5SWJybjdSb2RyQUw5ZnZjWEtRZ1V3SS9TWkNSd2N0aU4yVk5kT1Zlcnpp?=
 =?utf-8?B?OTZ5Y1ZGOWZGZTcwUTE0TFlkZmlVVzNlSHlXY1NIWlhHRGdldnhPaVZ2YkFl?=
 =?utf-8?B?d2tNaXNLK1I5MWlOK0pDN3k0cXJXNnRmdzJDNHNLV1RSeWdYd1pIMXRCOGFO?=
 =?utf-8?B?OU85ZWNZVVpiTEc2ejFTc0RlQ0pvN2pEd3ljdEhxU2ZSam1hd1pGeGJMdGFL?=
 =?utf-8?B?Vjl5VW1xZzFUY2ZOam40Mll1bXk1MjV5dy84eWJYYU4zT21QTmFLK3hGRFlQ?=
 =?utf-8?B?S1ZNMW9VQjlZcWVYeHNBcG5tbGhGMm1LanVmKzA3UHdiWXhzYXJkMmc0djJt?=
 =?utf-8?B?UmVvaXFVc3VDZi92a0JxbWZuMEF3UjRkb2N0aGFDS2JKRGdyZTJRTEhIdXRi?=
 =?utf-8?B?KzAyenpIY1VlaktGMG0rMG1FWGpXUFVLeXo4azV2azU4UXJ5UEg5emthZXR6?=
 =?utf-8?B?bHFFd3dKcmltNW9wWk53VDRoUDNSZHBweHVMY1lPejZ5QzA2bjEwQittMStU?=
 =?utf-8?B?bXJITHNLdzFsbjhGR0lJaGZKamVEZWdNREFjVGlvTFBsYTZvcWV0aWY3eXJR?=
 =?utf-8?B?Mjk0T0FwK0xHM3FOVDRNTzNWYndoc2lwdERnSWZyckh3NStWRXk4SktyY0N2?=
 =?utf-8?B?OXRoUVdnSE5SYXdadm1KOFlNN1grOVNJcUFQTzJaUXA2OXhYNUk0R1hKNmk2?=
 =?utf-8?B?d3VOMEVZMEJmN0ZLNXBEaVBXaXFPQW5MT0JYYkp0Y2t0Y3ZlYkM5Ny84NUpU?=
 =?utf-8?B?OUpwYnAxenYvRWNiSGppZCtjL0FocFp1YU16QkI0TmdKblhYelo5Tkp1NVBh?=
 =?utf-8?B?QXlRT3ZNNGk4SnBURFh2czk0NHgxbTVpQldqVlZhZTdQY0pKbGoySkdKcDYz?=
 =?utf-8?B?K2ZaeTUxb2tKUUoxYnBQQVZyVVhCNFdvQVExbitKV0hMNDYrdXRtWTgzaTFY?=
 =?utf-8?B?aWhEN2JYT2xQbGFxY20wUnlSckZreGQ3d2xtNmhuVUlsTUU1UVdnQjBrT1R2?=
 =?utf-8?B?ME9xOUtNMlJvVUpVNHZYNDMvWFpyV2FxSUViV3EyZSswUVZXcUN1TkMvTlZt?=
 =?utf-8?B?NGxxUU9MaGQ5bGwzSUVvZjlMcG1uaUhYeUV0ZGpaMHhTZlVmRkpaOTRKN2dw?=
 =?utf-8?Q?h3H0tUIyYCIxmqCeSraC/bk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4ff2c9-3752-414f-ee54-08d9f12c68a4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:12:08.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEpCga5/QqWwHzooRioC5yjUAYPCjxK0r44sueYgXBIgR2lysz0C3h83qoNScsFUDkDx1qgUcZh5jnjdsj+nlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4131
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 03:08:21PM +0000, Anthony PERARD wrote:
> On Thu, Feb 03, 2022 at 03:32:11PM +0100, Roger Pau Monne wrote:
> >      if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
> > -        d_config->num_pcidevs && pod_enabled) {
> > +        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
> > +        pod_enabled) {
> >          ret = ERROR_INVAL;
> > -        LOGD(ERROR, domid,
> > -             "PCI device assignment for HVM guest failed due to PoD enabled");
> > +        LOGD(ERROR, domid, "IOMMU not supported together with PoD");
> 
> I'm not sure that this new error message is going to be good enough to
> point out configuration issue for the guest.
> 
> One is going to set 'pci=["foo"]' or 'dtdev=["bar"]', which will enable
> passthrough. Then they may get en error about IOMMU or PoD.
> Should we maybe write something like this instead?
> 
>    "IOMMU or device passthrough not supported together with PoD"

The "or" seems weird to me: IOMMU is mandatory for device passthrough.
Maybe:

"IOMMU required for device passthrough but not support together with PoD"

Would that be OK?

Thanks, Roger.

