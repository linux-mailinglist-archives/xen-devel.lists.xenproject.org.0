Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434854B09A7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 10:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269715.463796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5tQ-0007PZ-0c; Thu, 10 Feb 2022 09:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269715.463796; Thu, 10 Feb 2022 09:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5tP-0007Nl-TD; Thu, 10 Feb 2022 09:37:35 +0000
Received: by outflank-mailman (input) for mailman id 269715;
 Thu, 10 Feb 2022 09:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9Dk=SZ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nI5tO-0007MQ-9k
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 09:37:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113e9614-8a55-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 10:37:32 +0100 (CET)
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
X-Inumbo-ID: 113e9614-8a55-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644485853;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ts+jAeum077I+4x1/FA3ddloa98U+NxDwblYOZUOJD4=;
  b=cMw1QabvDX8nIBrY9b8u2DLm8Lrf2zr/Bbe9hb1h/QC3mjo9deLVW7nC
   Rs0basCTlP7QAmZcbHddefVJnsbHicYrDAtMAd8QTZgezniMokstnF+vz
   keqGd+IYBI8pvlyVxPZbO97p+YcSEqkRQhahJpEoCcXzpPuPXJcF3Z7+M
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YTp7Djafs6VAQeyqOo0EYxeN6NHtVMMDPMMnOTMKELJyQozdM9gmczyF3boSFQOaNb3RAl14Wv
 nsfhSKN67L0hpmYM8wVNmOOSA/PG6vOfT44iH/CnYj+HaWD7H36sGO3lz3N59rbuYuP65RAjBM
 awyAWMA3lTkQirs3Y0Z3p+qYDxqv6WvwdV9dCpNllxCWep+tE8Umz7zBHH0aXTiQ4E7TedIT8B
 JV1sKjp8gUhYqUwGmcVI33r22KZn2720nhUuD67eZD/hJGDcZpQZppgPT4BB0RPbnWbHpEWYm2
 cNuDP1AYtPxl1kLEkNVZjt9W
X-SBRS: 5.1
X-MesageID: 66128953
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1iEftqIZhHLMtsJwFE+RaZIlxSXFcZb7ZxGr2PjKsXjdYENS3zBVn
 GodCGqPM/uPajb3fo1wbI/n9xwFv8XWz9NkTAdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6w7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Mz9df6
 9tcr6afUAgObqGSg8AcCTtXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uu4YCjGZt3aiiG97nb
 sEZYjdeMy/iQDlXakoWT4oMvLu30yyXnzpw9wvO+PtfD3Lo5BdqzLHnPd7Re9qLbcZYhECVo
 iTB5WuRKhMHMN2SzxKV/3TqgfXA9QvFX4YVGKy95+RdqlSZzWwOCzUbTVK+5/K+jyaWV9tBJ
 mQO9yEprKx081akJvHiWzWorXjCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAXInUFfjQsVhYe7p/op4Rbs/7UZo89Sujv1ISzQGyuh
 WDRxMQju1kNpctb0IuY80HduR21qb+ZQlAuwgSNfG3wu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrTzXLQGY3hCJnsvq/Ya2OE3TaDCrF8r2zFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrISIyNuhP8NIMmjn1NmOmvp3gGiam4hT6FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6nk0j8i+LGPy7KGN/p1WdiiMhitctoRy2Pr
 b5i2zaikU0DAIUSnAGLmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mtscl3het/0NzI/gp
 yjlMmcBkQaXrSCXeG2iNyE4AJuyDMkXkJ7OFXF1Vbpe8yN4OtjHAWZ2X8ZfQITLA8Q9kaAqH
 6NYJ61twJ1nE1z6xtjUVrGkxKRKfxW3nwOeeS2jZTk0ZZl7QALVvNTje2PSGOMmV0JbbOMy/
 O+t0B31W50GS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbKh
 RyLBRo4pPXWp9Nn+tf+mq3Z/ZyiFPFzHxQGEjCDv6q2LyTT4kGq3ZREDLSTZTnYWW6toPeia
 OxZwuvSKvoCmFoW4YNwH6wylfA15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7A
 xvd9MNbNLOFPNLePGQQfAd1PP6e0fw0myXJ6ahnKkvN+yIqrqGMVl9fPkfQhXUFfqd1Ko4s3
 cwopNUSt16kkhMvP9uL0nJU+mCLIiBSWqkrrMhHUoriiw5twVBee53MTCTx5cjXOdlLN0ArJ
 B6ShbbD2OsAlhaTLSJrGCifx/dZiLQPpAtOnQ0LKFm+k9bYguM6gU9K+jMtQwUJlhhK3oqf4
 ISw25GZ8UlWwwpVuQ==
IronPort-HdrOrdr: A9a23:e8lpsqlPJ+HGMwzPhG6EXaXUvXzpDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,358,1635220800"; 
   d="scan'208";a="66128953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5o1kfBUyv3Lmhvfr0dS0hgNSPU0PFI188nmbjDFB3T+TzRxiXzpSmJFy5HHLt07sfew1gFBtO6NE7/tLnZz3pBLQG8W93qq24ML/vbPJSer55X8MHquBNS4gXkonQxqcv0O/kASlUp/Ql5qxv5TH9QU11vTXtL8DVMmpg6rHfR/QcKsvf8HZabDMnkXsHS73mr+b6fAXr7Hdb3ypW7pvZuhCNv+ieVpvY5X3+qaoavp9qPVlf2vbfYdh/a2Ya1CAxFPldgj6ApDnnkuge5o1iXgqnVzvdgLN5yK0zL7QKk4SN1S9LzxCGnyFBOWSryuJdWS0jIdndoXL1t9Kwah3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtpCU4yWwOywKrjRHV4KNx2PomzcJILfNog390sO84I=;
 b=P6V3wNSF6Br7UgTz8ya1et+TvaQCm5GcmUmQMCLEPF5RSrHs004unLrifNe0wYA1wLGglZBVkySkLIn9iGaeYkMFmTec8efwevV9A/D9GekGrLeIZxJHrYyj3oieBRvjIz42AQ9nnkkCwtBd3N0OqRfZwCt5XAoX2PFll8X01wtjfjfQfYf1CYGQY9KraDyzqPhkCVX0pg3DuyDfIxyhsQPkFkhp8y2If4w+V4ZWPob22N5lN35O358sxInWrZ+IL5KWeEATJZuE3GFdQoJcJc3G4ciMCQuxwBwgcS4fzEAFsm6LVP76qhHTpPrWBXOdwcNgFBlk5ze9Mm4qqAeEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtpCU4yWwOywKrjRHV4KNx2PomzcJILfNog390sO84I=;
 b=dE/FMrq3hdtNPMZN2tfAb5K1nyOFMVsSItNTdJpgiUvLd7XTV63zyvjwWfJkpmnhxNg3oI4/wH+NLQFbZhQFhUKjD+8i+Vp7J/AQE/faHctmqHRkBmuSLwh11fFZ4u9nvhDzPCoGWZmpxmOIdi3h8c6iA8IPOx/xiWuCxHBW2SY=
Date: Thu, 10 Feb 2022 10:37:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YgTc0sgui8f80LTS@Air-de-Roger>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-3-jane.malalane@citrix.com>
 <YgKXrZ/U2XuECG3d@Air-de-Roger>
 <76de6f28-f038-7e8f-ce3c-a3686112b1d4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76de6f28-f038-7e8f-ce3c-a3686112b1d4@citrix.com>
X-ClientProxiedBy: LO2P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4299ae34-7d04-453d-baeb-08d9ec78f33a
X-MS-TrafficTypeDiagnostic: BN6PR03MB2722:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2722BAC944A70F98A5D804C88F2F9@BN6PR03MB2722.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJJCHcgbfEIPHeA8lQH9UeEsQKCFdLmvq2gbv5l3jrhuQD4shNEbPFncaQl8rqx3+tyfPz5u4J8wg8xTT/I8zbqHxE2PlQf9TYxLTeAVHGf+fw+o4DQVYGW/pt/kKmSgdkOF3yOnKcPtJJHw/nA9EhAgg81KckpjD/f9yZ9Ae3rL4uGBrPM65ceaxLzyQwUf1iu1Pfz7ClywK2NBlYdd3Igg5xY707ZBwY1bYAVGISj7BhZ8C4O4ViJeqZZRjTFp/qAfApV0vwUIG7Qvmxb4bISjSomLj00g3gco+5NMJ8406NB4e1R+FjGJl/p5NwzNYVmCscn1sxWMvj/C8Qbx0DWFeKNYzdOFmwTnbskZZxfN72QL6X/R+B3Cf7j/IWJkoAbpKd2ri5QWGd3wVabgnJ7GB+52WKYSgXidNGhHtHy6zs7ITHHo0fTClyxBrpsu1aliT/YoVSEBBMft3ReIRolH21BhzE6hGIlihu//fzB9jXOUvD74yWlOsFRLwZiNsr/8Ox8Q6+Xy4n4v2TWw5h9lipl3SnlblWEFwxyk+QM2lEG21GUJsHmW5yb+y0QbDecAXVXxiFjphcUKQpIxD+Rxsf0ay3ztULQm8+mQ6n+Wt7RTzSqyn13f2zfR2/3Eci82TPbUWXVc1PdZLBG2ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(6862004)(4326008)(53546011)(6486002)(8936002)(66946007)(508600001)(5660300002)(66476007)(66556008)(6666004)(38100700002)(6506007)(82960400001)(186003)(26005)(83380400001)(6636002)(316002)(54906003)(9686003)(33716001)(2906002)(6512007)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVUeXVPUC80ajd0SHluVXpVbmthVXQ1Q3JqUnVFeTRNcy9iOGJsb2pFaVZD?=
 =?utf-8?B?NlorWlE5YThiT3dMRnNncG96eGRldCt1ZWZZUlVKN2dLYkhuakd4M0c0L2dF?=
 =?utf-8?B?eXJVQUVVK3FNVmF3c3JPL0JnNEIyN1dxeXhzQ0grTmV6UTBsQ3hRZ3JvSkZi?=
 =?utf-8?B?MmFYRm5zRzZCV1daOFNQNkdoUkViTU0vVjZXWm8vMFc1bWkyUjkrVXcrZXhK?=
 =?utf-8?B?ZzBCVkFvT0dnUG8yU0lQTUxmWUttV2QyZUh4Ui8zVm1pZVh6c2Y5NzZ1YWRs?=
 =?utf-8?B?Q1BvRjZkcUV6YkVDbER6OXlZd1lKU2U4WThOUlRYbkZXaU9lYjZZbHJacUUy?=
 =?utf-8?B?R0l2M2ExZmErQjNUSm5wMmZaNkRiL0ZBeWlTS0RIZnF4S2E0dHFwWUpXSHRj?=
 =?utf-8?B?aHFPa2VqZmg2RnludEU4eFNoaG1yR1JRdllzM2J1UENXN080Z3hIV3FVeU9t?=
 =?utf-8?B?Y2ZJck9XUTJWM1c0WWlVOEpocGRCMWczQllvKzVZWXVuc2kwMWFQeHNURVpu?=
 =?utf-8?B?OFE3QXpJSDZHNUlzVFh2Vk8vOTRTVEZuS0luZk5VZElhNUVwMEFxd3hLeElY?=
 =?utf-8?B?NjgyYmZRZ1YrTGtzbFpkRVZ0SVUxQ0wwVGFHVG9ERDRZUEwxdDJTczM5WG0v?=
 =?utf-8?B?Q2RaTGg1a3NNMmRJbGo3dUdOWUhpSzBSVnJRSkl4dE5WU3ByVVNsaUVDWDMz?=
 =?utf-8?B?WCtwemthZ3hPbC9YTUhUSmF4ZkhjOUQrdXVKdG02L3ZCTnB0eHI4TkhkOGhY?=
 =?utf-8?B?ek0wRUxCVjVyN3pMZkJBdFZ0ZjIycElMU1pjeTl1Z1hsTm5PRmhVUGpvM2JG?=
 =?utf-8?B?VkNNWkYxYVNjcnU3MWd6UUhaSmZkUTRQaHB0WlRPOTQzdWdWUjIzK1JEU1VW?=
 =?utf-8?B?OW9ZRjJxRW1VVGdLRkFOOVhNMUJIempnRzVZb1RxRjZMamlCdHp2ZVVEbjZ0?=
 =?utf-8?B?bEhDbnNpVTBncWJ0WG4xd2ttenRzMGplQ3NkSzhSUGpQREFsTVpwWEJxYTla?=
 =?utf-8?B?ekIxVHErc1ZqTEovb2xzUUtkZXA2dG9TbW52dWtQSzA2Mis0Qm9PNnZSZzhJ?=
 =?utf-8?B?NWNUZWY5N3c1YTZsZytWMFh1cEtZMGMraUpjU1ZRVWJsWGRxRjlHQnYySlJP?=
 =?utf-8?B?dDhVWjZXS0NJRU5wdXB2cTNwMjc5aUlvOWNhbnNBWlhnME5vVzhMT3JZSUh5?=
 =?utf-8?B?RDZVWHZQaDFBODNzRk8xYWlZTklMUzhFY3ZMZFNKSzIvRDJrSjdBdi9PNGJK?=
 =?utf-8?B?cW5EZTRvaiswOFAzRUlVeWU2Y2FtbjM1ZVNQUVNWellpWXJVbXRNY0ZOdmtJ?=
 =?utf-8?B?ZHFaa011ZmdpSmhqYmhMWjJPcUwzOTFoRlBWUFBQUlluT0o0aGIyZGZzbXBR?=
 =?utf-8?B?NCtUNlVjNThPTmxydmhHYUx0bkFuRThIQnIxdVdMNzZYL3FnN1k0U3hZMk9T?=
 =?utf-8?B?WUlsT1B1aEJ1MHJjYWpnMEhaT3E1ZE9QV05oZHFYQ1dHT3pPRTV5SWxueW54?=
 =?utf-8?B?ZVhsOUpmYnBVWGxpT1NWcEhZYSsyWXRnWWcvVjl0VlJubXk1cUlKYnhmSUVT?=
 =?utf-8?B?dU5PUVlQM2FFNUN5LytYYk42VmZ4K2hSRE9kdzhyV3Z3a2k4MklnelhtdGFD?=
 =?utf-8?B?SEt1bnV1cUIrZzh6RExLVzd2MjF4Y2E4TFVheUJoaERrQ0EvczJhRnBUaEVV?=
 =?utf-8?B?b3FVcGduSlljWTJhdzBPL2xvckpQQUtaWkFUNnVnRCswN29TZE15YVdBMmZ4?=
 =?utf-8?B?TzlPSFc2cmdKelR6THFPTjFkZkdWd29jdk9saS9kWktHTk5VaXltTmdnR1dY?=
 =?utf-8?B?T3llWm5HMnBPRjAxTjgrZkE1Vkt6RW9mYVVTbWFQYStadmxGSHhTd1dicTFv?=
 =?utf-8?B?SEVZbVBVZ0dsS2dkVmovRnM3ZDRLS0VJcWdvRklDbTFIeVRWRVpBbFlIeG96?=
 =?utf-8?B?eDZleGs1TzRyNzdIZlg3K096TEFaOVNuTVliYkVMRnZFUFY1ZENRaSsvL1Bk?=
 =?utf-8?B?MGtmMzY2dFQySi9qR3lFcjQ0eXBFeVphVUhORzFkL3ZoWktZdUdtTEtGQkJ3?=
 =?utf-8?B?bVo0MGVHRUhxY0FKZE9OcjRhbDhWbWF5bHNVZUhaOGVZT2YxdjQ5aGRiOU9k?=
 =?utf-8?B?TWpKTzd0T1haR2VyNU1oL050N0RhWnQ3eTNWZ0w2NzBGSHNkclNxUzRoV2c5?=
 =?utf-8?Q?eaq7fK8J9ifozqsrPf82RDQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4299ae34-7d04-453d-baeb-08d9ec78f33a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 09:37:27.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpuZLR6nLANXoFMUic+Ec7f0rCq3meTqedZzFXV1REHOOsPk441c0N8U4ArPT9xLzD54IOGakXoG0MBjMFXI5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2722
X-OriginatorOrg: citrix.com

On Wed, Feb 09, 2022 at 10:57:28AM +0000, Jane Malalane wrote:
> On 08/02/2022 16:17, Roger Pau Monné wrote:
> > On Mon, Feb 07, 2022 at 06:21:01PM +0000, Jane Malalane wrote:
> >> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> >> index 485bd66971..33694acc99 100644
> >> --- a/xen/arch/x86/traps.c
> >> +++ b/xen/arch/x86/traps.c
> >> @@ -1115,7 +1115,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>           if ( !is_hvm_domain(d) || subleaf != 0 )
> >>               break;
> >>   
> >> -        if ( cpu_has_vmx_apic_reg_virt )
> >> +        if ( cpu_has_vmx_apic_reg_virt &&
> > 
> > You can drop the cpu_has_vmx_apic_reg_virt check here, if
> > cpu_has_vmx_apic_reg_virt is false assisted_xapic won't be set to true.
> Oh, but assisted_xapic_available is only set to depend on 
> cpu_has_vmx_virtualize_apic_accesses, unless I should correct this, but 
>   I might be missing something...

No, you are right. We only report hw virtualized xAPIC to guests if
both apic_reg_virt and virtualize_apic_accesses are available.

Thanks, Roger.

