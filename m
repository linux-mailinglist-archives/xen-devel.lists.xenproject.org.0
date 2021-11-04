Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55344543D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 14:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221534.383288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mid7C-0007tm-TB; Thu, 04 Nov 2021 13:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221534.383288; Thu, 04 Nov 2021 13:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mid7C-0007r7-Pd; Thu, 04 Nov 2021 13:49:14 +0000
Received: by outflank-mailman (input) for mailman id 221534;
 Thu, 04 Nov 2021 13:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mid7A-0007ql-Gg
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 13:49:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa5eedb7-3d75-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 14:49:08 +0100 (CET)
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
X-Inumbo-ID: fa5eedb7-3d75-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636033748;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lIvtllifk+xmK9ZMVg9mPwCt/ZLi/3zQDXCkzr0+E/w=;
  b=Tm3ms7SrO+sLddsk6eVjeVmbZdLK8pmiiJosezz16wdaacyrAx3ySzGj
   38j7Ctpw4SGlHBa++Pg4XcgLJ8Hqry9Q0RvVIa1JrZcYBO9yvZBc0NnbM
   gq+5S3wIvxB1uNnGn/cS2qFrqeEhquWQTvFo/F8D8G4dJJtuQX3Ibl7C6
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5lnaiZB6zW4rd4l3ui4DZe6ddU1XPsNhpy78nfpSoQ7URSX9Qnw5BsAgFTDdtAMZjvp3n7/Usb
 PCU+f86x3hb6jNbT7ubxUr/0agScTwqrr7o88X+QNH6hzb6U7O2w8seSpckMKOdsc23qWHT6Pi
 fhboL2h7Z9/lgjtvgCRPpBTXUEfXvAHyNDKuuHzpTXKT574jrmLwl+xsSRTfNKh1k2ANGxHceY
 qpBncunFojydnYhVHnwxumPNWm0G7ZajAxd+4jlXM04LP1t+qhAM9kxWt636KFlTL+seFu0ReY
 30Pmcn9Q4vlMzHIx9BN9NaK6
X-SBRS: 5.1
X-MesageID: 59016528
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:U0zBnqsu28UUTvsUET/aOlBrG+fnVAZYMUV32f8akzHdYApBsoF/q
 tZmKW3UPfePMWWjL9kka9yx/UkDvZ/WyIM3Gldt/31nEShG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6rOrd1k7OrD3nt8eDCEJCyx3ZJFa5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25EWRKiDP
 ZpxhTxHayz4TCcTAWssLqkAw+nwmH7nfiNbpwfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3sBthFqf12kCEio8XFGwoeS6okOmUtcZI
 EsRkgIipLY/3FamRd78W1u/unHslhwBX9tdFcUq5QfLzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAKKUcSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTNGKfLL2+1zG1vB7L9mhH0GMt
 SE4h9fLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsIvMcLVEZGe5ObdG5Y5y4C6aH7XeroWfnPBjalSsggLVTXlM2CiKP54owMrKTOuf1gU
 Xt4WZz1ZZr/NUiB5GDmLwv6+eV6rh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BbJbblUgHCb2kOni/HWsvwbYidyhT6Xfe8Z0/SwJ+ClA+RDFJ5wH5mOtJl3NZc1R9yb6To
 yDVtr5ww1vjn3zXQThmmVg4AI4Dqa1X9CphVQR1ZA7A8yF6Pe6HsfdOH7NqLOJP3LEykpZJo
 wwtJpzo7gJnEW+cpVzwrPDV8eRfSfhcrVjRY3r7O2VmIMMIqs6g0oaMQzYDPRImV0KfncA/v
 6ehxkXcR58CTB5lF8HYdLSkyFbZgJTXsLsas5LgLoYBdUPy3pJtLiCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXl1w2HHjCY1mxJKlnJ32KgZtGuqFXn+cLsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRyjtiFt/beBXUFDBDW2iXRQfOlvLYco4
 eY9o8pKuQaxvQUnb4SdhSdO+mXScnFZC/c7tosXCZPAgxYwzg0QeoTVDyL77c3da9hINUV2c
 DaYiLCb2uZZz0vGNXEyCWLMzaxWgpFX4EJGy1oLJlKonNvZh6BogE0NoGpvFgkFnA9a1+9TO
 3RwMxwnLKqDyD5kmcxfUj3+AApGHhCYphT8xlZheLc1lKV0urgh9FEABNs=
IronPort-HdrOrdr: A9a23:NXLQk60KtY6dXVethVS7kwqjBVRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyAMbEZt7eD3ODQKb9Jq7PrgcPY55av854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="59016528"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jekYKNhgO4DV/Nmr/yAg4ZJ/T79XInwbY6ebzfiiALG8asJqbUb5xkoSFNBjUzAruHwFMI9WbQJx+72J+vv/uUqrk4V1DR+gBE2nyOfICwTNf2n4n/U/527h19OFRNp2eOJPPBe5PvWcCEsNWtwk7fIHusNCVKp4ntCz+Db9MTKyYIQ9XFfwbsVf29EUo1KOokUYnCp+KgvB40jFViCXSMm9uFKjzA276j22RjQAWc7cPCYc3XuRJfa4EPXKTeazgrc+25FDw7mq693Sm+13VYyiPVfiDN9JMmWL82Zo4OVAMA5Z+aqp80btRd7f0tvWmUqHbgxReYBPS37rggj5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7IdaPAf2jJ7QOUmRRBkAHEm3RXcsFbubNZC17kL7o4=;
 b=oA0/tR1aBMkwOWSQM++f8LPmYOlO5GtM3moh/EnkHXjrR+OD56GqZMyI9WPtNeCVWq0ZVtZ/H2SglmDdc4oSU4527pH7Vov3tgHMKzWmF4VNxc7fansnomg90E7TXW0ahYDBeYYIzCHsf8fHFXc1K2+rygLojw6Ya9/wsaYr7HeVvK798qo8qjIKZvKVzRSi0CGT0GRgNml5OetkIEvcVd0kBWAY6rg3qlGnzvPb5pW111cuwAKrZemzQ/ry6NegGoORxwYt0gxfA860JZbQ4dt++KnSYy/qJXPyCsxqM/DxFbPkqC1NTajfYVNGEgDs4G6d4LNwwySpT0Q+CV/aOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7IdaPAf2jJ7QOUmRRBkAHEm3RXcsFbubNZC17kL7o4=;
 b=ai6fvbqrhrfO0rjdVjwUewfP0RmsbFz6m2CBws+ksUh0/FhD1JnCH2AAXmuhZTBiblfbZj7ncJpzDky5OCZ1Emk18XBi0P9sGZZhwWcSOqkGEQBIMTIAqKeTzoinC/uWdCx1anjBUZpbbZZ2FKYbuMesYhzq5rOIfA77Q6hv50k=
Date: Thu, 4 Nov 2021 14:48:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>, "Wei
 Liu" <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Message-ID: <YYPkx7148Ive/352@Air-de-Roger>
References: <20211104104834.10977-1-roger.pau@citrix.com>
 <24963.52610.316896.770905@mariner.uk.xensource.com>
 <8ae2c1ac-b220-a5ab-920b-244590ae3ef0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ae2c1ac-b220-a5ab-920b-244590ae3ef0@suse.com>
X-ClientProxiedBy: MRXP264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0281ece5-e1f5-426b-432d-08d99f99dae3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2778:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27789C0E9FACE6B4E91694BB8F8D9@DM5PR03MB2778.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mymN445joHBJ4f7JiOfE22ctfeKHQ3Lh/UqZF4vaIWqjpmAiwj1ZkkgG89/gPsryGSWOkXGP0q8dVhUjC/T5Lspf6LYqCXSx4KYZAaydc8KllDi4vLtNupc3JarrbBv/yr662mZMmNVz/9ehJSW/Pz3OivNbUWTLT1ROZzcA+Q8Mh9kHu/Y4K6GhZ26dgfx6ShlPKkxbe4NMhMytIYTgYeywcvXIXE9C86t9q9sSEzwRTqWfpsJoO3zU3tUAFjYHQ++WBBpPZhQS2QUyXZEJfIIZ6sIJTLNGN3JYMpMo5ay7FrIY0aOQ2txlcEA7B7XUICDLMqMtEqkfQYylrGSSQYvRlyo+O0onuT+tog70aDNEXALOVRk5YCxBCorGUmM40W/UR3C2wm3bW9597w+icC7SkQfu2cVaHt8vTbHonUc5bDFtH939xTtKjh00TsIxYbeDxShEN8L2aW6tlGVWF1xxiA9bzkzEQMjVoA8U1qIyGwhewXTMuswJOBpweS9COjYU5ZEE/MdumuidtTwINfDXBrTavjHOflzviI3n06L3bw4WyCr8hb/WnmuWDR+oFmyhdO9h+O0Mgyhd/nN3Y/EQTKmjOmjkwbh9uBGCjzy3/DlfmmFda2cnSJppjj2s/hXIcunomO1v2DT3upd+9QkmJ3gw2gEZgWJ0FlU2ENBOq9PQnO+sm4AAMXw7Q/Q/f4JsxoVn5EdbBKyCxnCuvcISKW/ZeinFBgkVho3e2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(6496006)(6486002)(956004)(9686003)(2906002)(54906003)(86362001)(316002)(5660300002)(6916009)(966005)(8676002)(38100700002)(66476007)(66946007)(8936002)(66556008)(6666004)(53546011)(186003)(508600001)(26005)(85182001)(33716001)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUxndnZ3Z0Y0UDBtNFVIc0ZvZHBHSWtYaEI0Zk5KRzZqSlk0UzdWNlFvMUNR?=
 =?utf-8?B?ZndqdUZHMzVRUS91ZmRwVEZiU3VTb1FKY1doOG01N2NCZFNKVkZrczFFVEtz?=
 =?utf-8?B?a2pFYmVEQXFPS1lSblZKVnhCa3F0QjRrd2dvc2Z0bC8rUndRNUxkejQyS3NH?=
 =?utf-8?B?SjE5VHpvL0t4UExzNHl6VUI0RzQ2U09yUTQ3OTE4QVc0MUFScVRZQXdkT3U5?=
 =?utf-8?B?STdlaWVGMmhpeEhENVlTRHZqekE4NnJnZEVVa2pINmdlS0l4NFY5bTJ5bGdy?=
 =?utf-8?B?b0s0NjlFa2VMbXlkNlBWc1dxYzEvbG96QXdqSUdVa09oSkdYOTFKZ1JDWTlY?=
 =?utf-8?B?ekdKdXpsR3FJNXFoV2daV0J0OU5tMW5OaDBCdE12QVRVZ0U4WDFPc1VUa25p?=
 =?utf-8?B?c3VBMDFXUUVGZmlmSUl5VWROUkJiTS9YMTJnay9YS0xNVEZGalZxT1hKRVNU?=
 =?utf-8?B?UStlbGNsaU9zNVpRbW16L296eFh1THBJV0c5WS9oZFdzUWlEN1lwQXFxTGgw?=
 =?utf-8?B?dnFLa3pIRG1Ubm9SZkZCL3NjWFdkejVtY3cySG9uVEtoa21STWlBZjk0a1E4?=
 =?utf-8?B?R3NQeGI2a293Q0pOWHpna00vcTRXTGpOUzZ5cnRWV2c2R3JzZW5NR1JGYk41?=
 =?utf-8?B?SlYrZnQwemJuZWpRRkNoTmpzMkdtUmVmeDZ4OWRuTFJKeHRaamtUWHB5dENI?=
 =?utf-8?B?UkRoM25xSXcxZTI4U3BTdG5pb0JWUGlIeUNZNFk0c0x4NjhNNHB6UjBrMm9l?=
 =?utf-8?B?U1FRNzBPSmhNRkxRRGhNM3R3WUpsZmplMlduTHhyem9IK3JMVlJUaXN1UUlk?=
 =?utf-8?B?VFkwM285bklpRlpTRElQK0ZZT1crT0JyZFRkTVhUL200K2RyUkVWYUJBdHFY?=
 =?utf-8?B?dm0yS05VWWxuL3V6Y1BjMjQ1VzdJbkswUXFkME03TkRIRnVyNHN3MmRvcGVs?=
 =?utf-8?B?b2pPOTB2WmJkdzVqT2o3OVZmWTJ5Y0Yxem1LTjlMbWRkalBnVUI2a29NSU9h?=
 =?utf-8?B?QjBselFPSzhncnBvZGIxbUxubGJtWnVyTVJxM2lnVkJiQ2FMcGFBUjBYZHZq?=
 =?utf-8?B?ZTZpdmxBdDVaUXd4M3VHdVJJb3IxOFZ6UHdpWGJNMCtSN0NCN2ZWZngzTGZM?=
 =?utf-8?B?bFBLMXcvRkQ2QlVPa2Y2d1VQckg0R0piekdkdDJ2dklSVjFlaThVL2UyczFo?=
 =?utf-8?B?TE1lY21rMURSUFN0N2YreXg2dmVkekZuRzFvc2FsTEtLZjhiMWpxWDhzWlhS?=
 =?utf-8?B?WUgwWlF1ZGFxa2s4SmtoSWtRVmhvY3JFaHYxYXVsdzBIYkJKMTRpa3JOdjYy?=
 =?utf-8?B?QUpNbXJlL1BHemd5MGM0YnExWGZZVkJRYVczN1hHcnp1R2cwOGRPTzdTdTJD?=
 =?utf-8?B?YTQ1UFMvR0tJR2RSbGpLRFNzMjFuSll6K1BuSlppTmN1dVJITkU5Z1B3UUow?=
 =?utf-8?B?WTBpY3I3bkZaK3JKK08wZ0hjbXZBWEVQejAzdFNEeFJGVWNYdFhBZEF6QmV2?=
 =?utf-8?B?ZzVxVTV2eCt3bzBhcDBPSnhMd1dwWm40c2xzdDBPL2wvZUp3R2ZRQVNBTlEv?=
 =?utf-8?B?WEZVaTd5UlFHQ2wraXRBUG5LRzgwQWMvMVhCZzhwNnFQRW0vZkFDRHREQzlP?=
 =?utf-8?B?NStaUmdMazhDOXdJemtRM0hDd3c5ZXhDZTlDYVJWbDFrbm9TRDg4cFJMRjYz?=
 =?utf-8?B?M2JNTG4zdFc4c2xDVGtZZjlsOTZTQlZKUks5azhVZ05IdGFLeVE5VHRmcXNU?=
 =?utf-8?B?cjdXaHJoVFVBYkRqU2ZCd0Z0WjJWN2FGMEZYNEpXMzU5TzZUSnc2eVcrQ2sx?=
 =?utf-8?B?NDlkZ09tS2xoUEpBcFNWNHhrMmVFVzNCWGkrMzMzR2EzU05JdzRtWXNRN0Y2?=
 =?utf-8?B?eTZlWEJyK0lIMXVNSWFGcFhvTUpGMndkV25rVjEvK1VIL2g5bXBCakk3WFBo?=
 =?utf-8?B?UnJzRjArdlowV0VZTUluRHg3VTc4b1haS2FEVjQzY2REVTVzTnA0WjIxSWhH?=
 =?utf-8?B?cUlKZWlJVFlWZVp0cDlHRUI1TUh3MzZmOVh2VDZTeENHbmkraVBHZVhLck9t?=
 =?utf-8?B?Z1VFR2lWNStPK2pqWE4yWVEvcVlwVVppVGU2OWNFdDFVL0pHYUw1cUl6ZkVa?=
 =?utf-8?B?S2xkOHloYnJOa21RVThkaGJrVTZnU1pKd3YwTWt6QllxeXRsR0w3MHEzRTNG?=
 =?utf-8?Q?tV+oTeO71dgBD39Rc/+1uUE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0281ece5-e1f5-426b-432d-08d99f99dae3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 13:49:00.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qI7UkjHNd3cw35KsN5/Fd5zNHlQqg+S2Av8aarjuxHSCoU4SP5D9JNHeY2/j/vK6AKo5LGTWUKW0Hr6epPe7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2778
X-OriginatorOrg: citrix.com

On Thu, Nov 04, 2021 at 01:25:31PM +0100, Jan Beulich wrote:
> On 04.11.2021 13:09, Ian Jackson wrote:
> > Roger Pau Monne writes ("[PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> >> Introduce a new domain create field so that toolstack can specify the
> >> maximum grant table version usable by the domain. This is plumbed into
> >> xl and settable by the user as max_grant_version.
> >>
> >> Previously this was only settable on a per host basis using the
> >> gnttab command line option.
> >>
> >> Note the version is specified using 4 bits, which leaves room to
> >> specify up to grant table version 15. Given that we only have 2 grant
> >> table versions right now, and a new version is unlikely in the near
> >> future using 4 bits seems more than enough.
> >>
> >> xenstored stubdomains are limited to grant table v1 because the
> >> current MiniOS code used to build them only has support for grants v1.
> >> There are existing limits set for xenstored stubdomains at creation
> >> time that already match the defaults in MiniOS.
> > ...
> >> This needs to be applied on top of Andrew's:
> >>
> >> xen: Report grant table v1/v2 capabilities to the toolstack
> >> https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/
> > 
> > Thanks.
> > 
> > We have discussed this wrt 4.16.  I am minded to grant a release ack
> > for this.  If anyone has a contrary opinion please speak now.
> > 
> > (I think committing both of these would be subject to maintainer acks
> > for "Report grant table v1/v2 capabilities", which I didn't see but
> > perhaps I am missing.)
> 
> Afaic that patch looks okay (albeit not really a scalable way to express
> things, if we were to consider further versions to appear), but it wasn't
> clear to me whether Roger's reply was meant as an objection, a direction
> towards doing things differently, or merely a benign comment. Hence it
> didn't feel appropriate to give an A-b just yet.

I think it's fine, let me reply there. Overall I think it's best to
express supported grant versions independently, and we might wish to
also allow to select a discrete set of grant versions that a domain
supports. IMO it might be sensible in the future if a new grant
version appears (v3), to select to expose grant v1 and v3 only to the
domain, and avoid v2. This would require some changes here, but we can
see about those when the time comes.

Thanks, Roger.

