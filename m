Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68493461B12
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234638.407228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigy-00060D-IA; Mon, 29 Nov 2021 15:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234638.407228; Mon, 29 Nov 2021 15:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrigy-0005x8-Dt; Mon, 29 Nov 2021 15:35:44 +0000
Received: by outflank-mailman (input) for mailman id 234638;
 Mon, 29 Nov 2021 15:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrigw-0004Rj-BF
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:35:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018cf07c-512a-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 16:35:41 +0100 (CET)
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
X-Inumbo-ID: 018cf07c-512a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LhjyiDF5LKmTNDh163h1NmBaoZfFCmFl7Wc/SQikn0I=;
  b=UAM7ph+FJIJSK4oXCjsPHTMMWazyJftZurjhvxReXSQxy3Pc6TSrN7cp
   2NMBPMx2S2sxBPpLzDSkPV3eTruhWF9hAAbyT9svRr6a8jZRXCrQ8QloV
   BxADZN8DhogfeIkKYXab6ukzEbGETNk5MjE1xVy3FI7Cq7gDGe1wlRoav
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xHD3hhj+UiJhUNcAMyQWh+LDAKPr0F4m4CZbU+qxvnr9rkTweD99LLn8BgQ9In7wABF/Q6vFky
 gh5yEG45JDUKV/7omeNXXVW55fxgs2//Bqec4CAGZvvzO/nftgl48mHEuU++fxI0UmYeC3cj+A
 YUFEbuP3lgqjbH9GDcIqKzTlWc2C/6uLkW8+bl3RZr76Pb/pvo5hIKP9eOhpH1DHBadBMKBmxd
 OaqnOrj+KU5B/gwHYQmwVIICpFw7xn9arLHjxWS0iEpLOitA3inUhLvmfIaQQKG4jR7XDsi3GZ
 uZ14+M14+H3en7Anp+hSDotL
X-SBRS: 5.1
X-MesageID: 58333467
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sEYrqaj7KaYYKaZorcB8sEh7X161gxcKZh0ujC45NGQN5FlHY01je
 htvUGmPOv+LZWH1fdl1Ydi/8kgFv8OBx9ZiHgVuqC9jQSwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Mm77pciAJb5HVv/g2Wj1JNh5nMpJZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1psVRqqAO
 KL1bxIwayT+QkZ2Ym0eL8wFrO20tGvaMCxh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDJ5WPiGTkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma/RNB3O
 0ES4jApr6U56AqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLmkqbGd6T/x3iNYRWRcj8
 k6soMrmOiM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1K1ZZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBqaL9TdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3O
 x+K418OvsQKbCfCgUpLj2SZUZ5CIU/IT4qNaxwpRoAWPsgZmPGvoUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacicSJmWMuo8pMPLYZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBP6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:3TrL6K4J4XkQ8uh1OAPXwVKBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbr3gJxAx92utUuFJTsaFZ2IhD0JbTpzfHcGITWvUvECZe
 WhD4d81nCdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn9y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zX0IidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6q9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFL9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc4a+d
 FVfYLhDcttABGnhyizhBgr/DXsZAV9Iv6+eDlDhiTPuAIm2EyQzCMjtboidzk7hdUAoqJ/lp
 b525JT5cZzp/8tHNFA7dg6ML6K4xT2MGrx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58333467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRKdf7KKkrxDGMwsu5FSTEHYAtfqQdnkVt065obFHAna4G2DD7WoQe6BjMdHo3KRNCko9Lq490YvTSElJwVlp2RnzF3cLgE3pElH7XhEYvmT8dDwkttrLEQxykDyLiTKcdwo3P2TBo+PYXkGFhevVSKY+O19rpfqunxtlG2wrO8oA0i6KotvbFKQ7IBdKtai89X6D0LMDf2JDVBttrcaRs3zCYQ/vDaeeiXtUWmuRIr/KqFWLHxhSAs+ULbrjrCpZ9Ue4BRCzuwfLzz9g/G94KlGaTAelYXEDyVYwJTyE3GflOEDuRUocpzY/EvKdXGaiqrUwzkHuo9SHg36i45MUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRaYIUfkMkzZXE8d3moJMkHiUafesA///nNUwZGhtBY=;
 b=BZxhq1icNMM1CoGq/O/DCn/hcTQR1pjO1jIeglGADsUqvHWg3Omi160fA+6TiucuqhwBRmNYBT8CXFD+XsMhDWS5DX1BpPAwk1JUmDwecxsptfVqS4+UeZoaT7lDFnsd69RG0GL3zZzyRbpD8BMy4/O7+64XzJovUDoAWBD74flrj7mc07H4qatuQX8XnttbhLabxEWrCHt9ulaLyVhjvE2LJX/eCw6ncGmLOiVpUd04wpDfgUtz0edtqzBJw4/LKS5fh53+br+NtBiGoIThbOuJihG9kml7ioQQoMfaCP2WFhvzYJnLAyjm7tbSm0MdV5XeaK3RC1Mm1eH1kYEg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRaYIUfkMkzZXE8d3moJMkHiUafesA///nNUwZGhtBY=;
 b=Zl3VgODgX/KHkMVJjwOWxmUPcOkM1NySylF7FVh4sQFggYd7HsiHoW02cHKvTTq9Ppgt0z+9XVc7PGL1m/KZpy74qcTJ21oPsdL436C3gP15sQfjmWeMpG6YPhupYCWIMBKbiVy18L74NfdbUIZuhsnZeAki/i7iapbh2MMYC8g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 06/12] libs/guest: make a cpu policy compatible with older Xen versions
Date: Mon, 29 Nov 2021 16:33:49 +0100
Message-ID: <20211129153355.60338-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d34d6d2-74ea-4534-dd15-08d9b34de3f4
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2842982CB0FA2DDDEFC9A20C8F669@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqLlYHxjwOY6uVrO6MpidNNOA3iK1YoGdzwGYezHdQATvewCg8COK9yHDRcEH5hbY7UrRc0hIpuG3xJr1qzQ8IKCKxVduGj3yQOZWHOjSc5uswIBuEaxLG+9TKmbKRp2NslTL++p7FrgVgWNT3MdSCCBGGbJfeyOTlexb7JhlhDtfSOW3pJ/OSeF1LP7PLcG4WV0B+I1/knzPFVKeidKZ53aKw6hCmF7D5a+joLEAHwnal1cARragB11ffqYgBYJhuEw5lgXbpk2In40fP0fKG+Qq9wbTZK89CHBvnYIAb7XCs7HFB8JfN6eghf82YAzH7GVGqL98le11/Tz/a5grnOBRoRoMUmjP0Iv4eHt70CJE8K8IIErh7NzmJytmwwUNqzW0+jJKWq7+BomBYL28+TvzAmT63/wAkrZRRMokuDvH6N/31VAxltYEi29xgJJOwJuQodik6VTj0dqN48VDV3sl8W+IMlxoE8W10O7nTP+F1KF9J0UJUm43K3HLSG+p8JGTjFVb+z+kAab9TJBeL9c0fw2TNAudgZQhNwjuH9J0OjOzka3t4Uc7BYieZ0kyCMHlI8FuPk76yXOAn0aNcEGhNjEid1WYRW3YGu9+LdP0zaQ0XUz4DKW3cvU2qI03IKAtmNODhnJzD0hS5EBiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(54906003)(8936002)(2906002)(66946007)(6486002)(316002)(8676002)(956004)(6916009)(82960400001)(4326008)(6666004)(66476007)(66556008)(186003)(83380400001)(38100700002)(2616005)(26005)(508600001)(1076003)(36756003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THp5d0VmT01ydXJZS0RqTUkybTVQT244UFJRdFc2c2hLZzVkcHV0cXFTby9v?=
 =?utf-8?B?K3hUZ0ZkZTZsd3NsZEZoSGZKTkZxSmIyckg5OWxlWkNvaE1lUHg2c2dmMm1T?=
 =?utf-8?B?ZjJaODB4VnhsWjQxRlpaZlp6aHJwSkM3UVRZQUhJbXUwNE9HUW9BSWFBL3NC?=
 =?utf-8?B?M0R3WGttWCtpODZ5M0dBQlFDUnFtcEFORFFHdlFoSUZLZFRLRVpuWXQ3bERq?=
 =?utf-8?B?TllkYVBDOXlua2tISmgxSkpTUFpqYkVLRldielF4RExTSlNXUGFlWUwyZm1m?=
 =?utf-8?B?Y0JWVCtOSjhYVXZBTTFIZlhYMFU2SHY5YTZuTWRtYmcwa0VKekN1WDZIRDJr?=
 =?utf-8?B?YXN4cjBBaCtZbm42aDRxM3dqVlpyaVRUR3Z6RktjZTJSZFNrdVdrY2ZKdFR3?=
 =?utf-8?B?T2F2MHhDUlhCNjdHK3ZjS0haZGl0SEFrZ0JhbkpFSUw3UVVuaFN5MmRVMzdW?=
 =?utf-8?B?eDl6REF4aXFCei94NFQ5S1kxMG5LeVFzRlRSWGJ2MmNyWEdEUXY3NCt2czJp?=
 =?utf-8?B?QnBlbUoyeGJYZGtjeitoREF4bVlQTVpIVnpWbjQxOUpoOVZPWmMzZWpwbmYz?=
 =?utf-8?B?RGwvNjFvbHJrbllFMjRJYnBqemFMbEVZL1lycllOdGI4U1VVYUxGNWsvaGlI?=
 =?utf-8?B?WnhFMXdwQzZpU1E5bldIeFVrRXBCNzZvSDlwSGxLdUptc0xtcDZUNG1nRjdT?=
 =?utf-8?B?UDEvMVhwTUtjZXhtaXJkcldDN2Z2Y3pFMFB3OTFOU0dLSDRwRkN6cUVOQXBz?=
 =?utf-8?B?bHBFb2tpejk2T1NGZ20vM2hrL04yVXIvNDd0Y0wxL3JXZ1BjYm5LeXI3YWlL?=
 =?utf-8?B?ZVZGekRXb0NwTlI2ZkU2WVNYV01qdzlIaFR1cFZLSDRwcmg4RTg4azRSMVhO?=
 =?utf-8?B?OXNwamF1RzlUMFJRVVRrb1Z0UUlvU2dlelRJRXk5eFBoeFFmcWg0M1J0NE1E?=
 =?utf-8?B?dmtKTHNWVEpGM1kyODgzaVRscmw2MXp3dWhWY2NqWUdyUkhXMmVUZ2tCSHM1?=
 =?utf-8?B?TlBCcS9obklVRVRXNHpCMWRLNlpkQ1JhY2hKa0Z5VUd0UjZmYXdRT0gyRE5L?=
 =?utf-8?B?V0xWaFhhZDJ3QXNORmEzblNzbk1KQXJQQ3AyOFF6Zy96akJkSUhyRFY4Y0d4?=
 =?utf-8?B?MUJWVFRVNEY4V1JReGN4L2s1WVJRck1RNTZQUW9mZ1FIdS9MOHRNaVlFT09i?=
 =?utf-8?B?NDJORUdITXRSRk1ESVlsbTdKRzlsYzJlVng4M1I2ZlUyL0t5dllXTVdVOUVs?=
 =?utf-8?B?LzNaL3FhMkVzbFB1Mmt6ckoyMU1JVG9JclFSaDJqdnY0NmZwVWhIeWVuTjY4?=
 =?utf-8?B?ck9Hd2ZUdEVMU2pmMWVlQmRUTlRWTXl3YU9wUGM1blhIRXdhejZlYlhQZWRB?=
 =?utf-8?B?VjVYK0VVVXV4dXFpZHdDQXpNMnMwQVQyRzFPK0orU054MzhkR3Q4UTdxSjNZ?=
 =?utf-8?B?WWJjNmlNVGtjQjNROXVZSVpDS1IxQmtjcGluV1d3QmZkVndwSW94SC96S1R0?=
 =?utf-8?B?KzFCamdzNEptb21CV0pBM2FVUWUvbXEzM2NaM1M1QnNjTjF1QnZEbFZCanR3?=
 =?utf-8?B?ajNMYzF1WWh4VDRrUlZvSlNYa3NDUDF2UjcwR3JJalRZbUQ1R09iZy9jcThD?=
 =?utf-8?B?ZXpTYk90dytEZER3M3NjYkhuWFVsblA5aU42RS9YQkRzQkdLczVPa0xFbCth?=
 =?utf-8?B?eWpYUUg0eXhnWWJsNDk5TGkvN3dUSjlTcGcvNDZXSlJSMG9KNmYzbmt1aWh3?=
 =?utf-8?B?b1Zzem50UG9uZWlhajFPb1hwRWlMTWsvN1dKc2YzQzMrL0lXZGMvUDZlTFhh?=
 =?utf-8?B?V1hGckdHV1NKRi8zSW15KzMzdGJjdklwTlFzSGxHb3NxdFMzRkpOTmRHd0pq?=
 =?utf-8?B?RzRHTXJDMEhKaGdqaHVUR3Iwa1ZSTkRTSFVsWGNMY29GL1RaOXZtMExTWkto?=
 =?utf-8?B?NXpQNUhyci9oMGxzWk5CYXBHR1pxUTNsNThBVDlab3g5MUlKcnpjbnZZMUdr?=
 =?utf-8?B?bE5oM29XOTl0ZGMvc05EQmFFQlpkNTlTRmtjdmc2QXlLM3VOODJVeEFHWjNN?=
 =?utf-8?B?NGtucVlCRDUvNm56L0YwcGhWUi9tYWFISklFdDRwakN6WkVSUVNtZWdHOS91?=
 =?utf-8?B?OUlEOXVBTktBNTFpTjl3bHlYanY4UktSakhxU1gvZ0h0dVZYUnlzYmRPSkhq?=
 =?utf-8?Q?F7QGqXFlmmQ0FunAZxIVxfw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d34d6d2-74ea-4534-dd15-08d9b34de3f4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:36.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrFhBO2QQDJEnBWb2kj+0W0Y94+fxmzgwMQv3ks6wVhWSfReDrXdb0v9Ybf2vZSTPrYCPOPfZ8wMZvIgHYDxmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Older Xen versions used to expose some CPUID bits which are no longer
exposed by default. In order to keep a compatible behavior with
guests migrated from versions of Xen that don't encode the CPUID data
on the migration stream introduce a function that sets the same bits
as older Xen versions.

This is pulled out from xc_cpuid_apply_policy which already has this
logic present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Rename function to xc_cpu_policy_make_compat_4_12.

Changes since v1:
 - Move comments and explicitly mention pre-4.13 Xen.
---
 tools/include/xenguest.h        |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 62 ++++++++++++++++++++++++---------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 2672fd043c..281454dc60 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -817,6 +817,10 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
+/* Make a policy compatible with pre-4.13 Xen versions. */
+int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 859c885c15..bcbf9576c4 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -432,6 +432,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -496,23 +497,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( restore )
     {
-        /*
-         * Account for feature which have been disabled by default since Xen 4.13,
-         * so migrated-in VM's don't risk seeing features disappearing.
-         */
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
-        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
-
-        /* Clamp maximum leaves to the ones supported on 4.12. */
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x8000001c);
+        policy.cpuid = *p;
+        xc_cpu_policy_make_compat_4_12(xch, &policy, di.hvm);
+        *p = policy.cpuid;
     }
 
     if ( featureset )
@@ -916,3 +903,44 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 
     return false;
 }
+
+int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   bool hvm)
+{
+    xc_cpu_policy_t *host;
+    int rc;
+
+    host = xc_cpu_policy_init();
+    if ( !host )
+    {
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
+    {
+        ERROR("Failed to get host policy");
+        goto out;
+    }
+
+    /*
+     * Account for features which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    policy->cpuid.basic.rdrand = host->cpuid.basic.rdrand;
+    policy->cpuid.feat.hle = host->cpuid.feat.hle;
+    policy->cpuid.feat.rtm = host->cpuid.feat.rtm;
+
+    if ( hvm )
+        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
+
+    /* Clamp maximum leaves to the ones supported on pre-4.13. */
+    policy->cpuid.basic.max_leaf = min(policy->cpuid.basic.max_leaf, 0xdu);
+    policy->cpuid.feat.max_subleaf = 0;
+    policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x8000001c);
+
+ out:
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
-- 
2.33.0


