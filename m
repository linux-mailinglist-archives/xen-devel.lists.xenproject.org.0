Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCA461B1C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234673.407279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiC-0000jt-JQ; Mon, 29 Nov 2021 15:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234673.407279; Mon, 29 Nov 2021 15:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiC-0000dP-Dn; Mon, 29 Nov 2021 15:37:00 +0000
Received: by outflank-mailman (input) for mailman id 234673;
 Mon, 29 Nov 2021 15:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrihK-0003uH-U5
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:36:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e61b719-512a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:36:02 +0100 (CET)
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
X-Inumbo-ID: 0e61b719-512a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oCwcWmwz0BMSkk8m68nr1rFFDTEUeQkIP2DOHyaSqqY=;
  b=UOPK/amGI4bl6TigtKe2Wc82+s6K6sdCukzZtlxEdgqHnOAfJPu+efk8
   XTYfdTpMAKypIoutoa7dqt80P76+7KQfVMiMjo0mJHq4DCWSdkKQ0R2DE
   eiGIjcAcD34La6QnC8LxOQ/XNGoBXD/H6F7X7+9K0b+H/Yog/LWXk/CkV
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Nc6pV2ozzeJq9sLgupWxfTlxJN3B5L5GZH4JcJWV9PwBdluG4h906HYx9lA+OpjZjVItMTSrEs
 EI3gCLfrPSE9tYnjttdbDTJSSg0FHMx0ab34LTcAQgmfozp2BRVf3ErzYScjzRy8N2UPpLz3uA
 CsskYQ7YOMSMZtjzUpEE1tWklGBZ2fPeUTT6j5L9SJYkpp9onH8LdI/Pt8d/w4qYxNC1Aznz91
 Ozm+rlP6+8DlFH6o80mSi9w0H3JWp8KXDtaOupDBq5lO8valL+RGwoF9fURO9NVyO3XHdQPHWb
 HhJP/BCJzp8t2n2afTR2/g5G
X-SBRS: 5.1
X-MesageID: 58773293
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KHAd26gDP79O6m0F4P8QqT+iX161ghcKZh0ujC45NGQN5FlHY01je
 htvCmnTa/6OYGrzfo13bY7k/BsB65LWzYUxHgQ4/ChnES0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1C762+TyAXD5Tjv95efxBkH3kvB4p/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1p8RRqyPP
 KL1bxJuZSTwOSJvHmxUVs95svuXhEjRLjxh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDJ5WPiGTkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma/RNB3O
 0ES4jApr6U56AqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLmdefzBHT+IXjeARf38G3
 2OFx4LTIgU65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1K1ZZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBqaL9TdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3O
 x+K418OvsQKbCfCgUpLj2SZUZ5CIU/IT4qNaxwpRoAWPsgZmPGvoUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacicSJmWMuo8pMPLYZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBMgXQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:JulUNayK5kmym6oIJ+R+KrPxsOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZq6z+8L3WBxB8bfYOCCggqVxe5ZnPLfKlHbakjDH6tmpN
 1dmstFea3N5DpB/L7HCWCDer5KqrT3k9HL9JTjJjVWPHxXgslbnnZE422gYytLrWd9dP4E/M
 323Ls4m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW82/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 guMCjl3ocVTbqmVQGdgoE2q+bcGkjbXy32DHTqg/blkAS/xxtCvgwlLM92pAZIyHtycegD2w
 3+CNUcqFh5dL5hUUtMPpZyfSKJMB24ffu1ChPoHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58773293"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+LWsFvLrUk9aNpWquLFO8l29KeecLikiaA/maBuFVJ4FsCWTLlIEnZvcUSVFYgWpSFf4dGw7bWyM60S3gZ6f8j93tDFcdnV0AMNqSQzNVoXu5lDJBopG24+tUjIGW8GBcw592DkEKWKMScnthp3Cx20XLdXGSnpnhGHHM7++bGXroCi3sqzGi14KqcowRSclzkYJk0CBKnCKBC5+IAtWW2iD72GPjWcLyM7bSurtBmR73nkmdoOKuwBFJInjgjM8O50QjXxuDY8OMxEo7g9fdC5ebPkS6R+1Hj1Fq64NiH6CPYerrIJLFxymsUEh+JMp5TZ7Bkf3n1G78/tGFU+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va2yTS9NdywE+zexh1fxAUbpTOFx27IrcCDyw7x9azc=;
 b=mTmB7GXP8Z1rbKhhdgSK9VgGmDzWbLVglXcbtXfrPVqi+bpLDSjqyu3H0s4p5WqI1pjOOFEAb79uwpKtwliuElBcYTTxH1X4sLmOVuIBtcgaQ+9F5hwdBKUDMVzaiVvww1Rgz6wYCwxLUiIAR6kZuMzDM7Abj5j1CpYkVWZ4dRyFTXpDwq+57YgAPQm/oFfCbwaUeKBu/UC49OB9PiUt4jyhZa6cjOE0VvSNnFAMAXhSWQKlKFEcueboG2jfS2MHlfFp1fqItyWEr3/wUVkAtGmk8ZXQKxP3wQCCnUaLXCNPk652hJmaX5/s8E9Zj2wyQLWbbJOVaGyiYXVKZ0IRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va2yTS9NdywE+zexh1fxAUbpTOFx27IrcCDyw7x9azc=;
 b=L0595hOgURK8N5x1evwrLImUyOg5QfRuMhFCPv2jUMEKxjr5WXtJqHttnRcN4Sq/5dW5wLFJbCheYZe03oD19g1nLpx36e2ChrfiEZYhVduggGz5x/4wa0TwxRPjpDufIjtAB0AfTUEppfTlIU2HL5fiUOCTdztPi5hsFfdnxiE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v5 10/12] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Mon, 29 Nov 2021 16:33:53 +0100
Message-ID: <20211129153355.60338-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d453ff-5b7f-4066-32d2-08d9b34defd7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5340B8BED334385825F875128F669@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uC3OciuAXZ10rxT3FJNQ5cFSlSZ01P7QceDw1T5tMqDCFMLRiNCboFjH5V57S1eL6PmcOOswwjupPwQMxhrvrGnz6GfrlIeoYZ4IKQFF0Z3tsu765ApRbNbPgnWkF9oRjZLUtkE5xYeZzIaeZAM78R+5m6wQqKnlDDidNKECui103wJyKRSH5nCVRFdyW6fMz9OiGi8x8V2jZEZsER0icP7dHkMKdSCKy7iusmzPuaxDAPUNiseMuuR8HkYFztcoiml3OoxLsELISqk31T+RIz/QnwkME77j2MlcDR2XhksgwflPwZLJB3F5+M9+JRdfUtA06GnOmAw7+BAnHmuw9Aj/c85/Mcw3BqULpMRTxJV4pMhmqBG4fbkQz8/U5orNaOrWYlm+X4JqUEdc4PkdZoGmFT8nuEoK7N4FEfGx91qCnYgzDChczF1WS4r+0H0YqGyzDBSw8exgkgVLedartH9y0G6n2uZQ+R7unEDViaSY0JMnZUuUbEWokiFS10z4ZZNTt8z8uarft/9KnNfx/W0WYYntgjwU5GAzoMmkkp8zrT4R69uoumXiUZa5UaiGPAmVOVEgFjCJEUL8EAMPwo3JyjoPvvX8AjMJEErK16XFdcM57dhWTKHxS4YZvGOptETfsxo40OWR/KKJuQOHbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(82960400001)(66946007)(86362001)(1076003)(508600001)(5660300002)(8676002)(107886003)(6486002)(316002)(38100700002)(6496006)(26005)(83380400001)(6916009)(66476007)(2906002)(66556008)(2616005)(956004)(8936002)(54906003)(186003)(36756003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFaazNpbktQVk9vdkt1a3VNYVlJczAwOWhHVnlDV25xYmpMT0Zyam10bWs3?=
 =?utf-8?B?SnRpNTdtMUlzdW5PR2VtRUM1TEdKbjNEV1ZoK2lhblI3akJPZDRmMEp2NDdj?=
 =?utf-8?B?aVhOckl3eEs3NjRKNXQvcGh4QVlMMGlBT1dPUnZ5YnBxalVPV25Nall6YW9v?=
 =?utf-8?B?NGpGY3dCdExSdzlWRWF3RVhIV0tQRGFBSS9wUi9CYzJMVlA4SEFnV1N4eDhr?=
 =?utf-8?B?ZW1CMDVncmd4amQ5QlFIZmRxNlIzNU84MjZJMmRKUUg5SHBtY0dqazlkV1FE?=
 =?utf-8?B?ZEdsV2NtZ2F6MlRGRzRyRnJmSUlYejBTV3h6UzJCR1MrcFBoWUYvdDVEanBR?=
 =?utf-8?B?QmVCQ3FVeXZRMitXb2hUdlhMV1dScHVvbFBlZUF0ZFJKdk9CTmdUdUJzZ1Ex?=
 =?utf-8?B?STQwckkranJBUDV2TXhCVmhpdEx6WVJxclNYaXJ3MVB0NzVQeHh0emEvbExF?=
 =?utf-8?B?WU5nMkhOMm8zNmd2eE1GOEdhUGJ1UUZzYzBMM3EwbVpRc2lNTG9nK0xOWUVa?=
 =?utf-8?B?MXdnY0M0Y1dLYW5Ib0JTNzkrSFRwTXJRMmZSOFdzdHpmcS9TS1VURU45a29p?=
 =?utf-8?B?KytKbGYzZUhvdVdSOFU4bG9KTXpncXJKTEVpRFRSSVBGcGFydmxLQk5NNUlX?=
 =?utf-8?B?K1JHNENrY3VaUmJjSURGNWg2blZ2eGRHYWpBRXhQMmV0N0YrL0g1dk9zZkVB?=
 =?utf-8?B?WGZJSUZINTdyQ1NkVVYyeU5JZ3ZpdTZveFNJRlN4bUpIQnVSanE1R3JiOW1y?=
 =?utf-8?B?RnU0L1UxdDI2T2dXc0Y5OEJ2cGkrc2dURjdLTEpOb1F2dWtUUW9hQjNYbXVz?=
 =?utf-8?B?Qmt0WlR6Sk9jZU5LWTRER3UrTEFtMHpZVCtabENNRHVIbkcyajBkcWhBV3ZK?=
 =?utf-8?B?a293MTVKS2d4SDd5cEF5QnlRVy95eUhpL09JN0RLb1dxYlNJbW12UlVmRUNI?=
 =?utf-8?B?RGZYUXpmVXVDS29vbUFZalJ2SzlEcXNnUFV3MTltMjgrWU9hMlFMdlBhNGlU?=
 =?utf-8?B?ZE0yeU44cmJ4QTZ2TkQ0bzlDY041bWUxNXNqY093NC94YkliOGdnY3ZaSk1P?=
 =?utf-8?B?T0V2RlU1Sys0OGVBdjhEbzFmWWh5WWlWcmJoZVFCSkNOU3ZiTU01Wms2dita?=
 =?utf-8?B?cEpvU2wzMnVxRWxGQ1lURTFUS0pBTjVweE12NjdYTTNsYS9LR0xIUXdnaWRO?=
 =?utf-8?B?aDV1d3pwRU11aExTNWN3bGNPbk5zYXBKRVM2cmsvNkVkZHFUU3JLQ21JK2pL?=
 =?utf-8?B?Ym9KSUwwOHc0V1U4YVBNVUFmYm1Eb0ROV25NczRNOHdqYTBwTVJZMFNvZGxm?=
 =?utf-8?B?dWgxeFdtZXMvaWdJT1dRL2orZ2tnM292YVo5OTRxcGFnK2ZBb0h4OWdmZnZn?=
 =?utf-8?B?L1l5ZWMvUDRHcGxHM2laTk9nS3JQK1VaUFlyOE9LNUpvN3N1d2R0Z0tHTXlI?=
 =?utf-8?B?TlJGOTR0bXZBOS82azVFR25peHZjbVFwemRmVnYrZWltRlpOdjB2bTM0dGhC?=
 =?utf-8?B?VGxOV3YzeUU3clMxelJVa3lscEQvY05UWVFZbXNqQ3YxQVc3TjNNQ1oxYTIx?=
 =?utf-8?B?SHhFbDZuYTdVa3dCbnBiUkV3YzhSUmlEMFNvbDkyWjJ1cDk5YlZPaFc0RUlt?=
 =?utf-8?B?M0ZETFFsV3h1QldRakt0NFAwS2xJdzlwbjYxZE4zYitzLzZSQXlKMW9GN0o0?=
 =?utf-8?B?Nkoybk9BMXc5WWVkQll4Z0JOTDRyeEkvMmttRTBxaEREOHQ3V0VMYXh3RVZF?=
 =?utf-8?B?eWVtMmZRNU0zS3ZzRzhyU2RBVjNVYUEvSjY3Q2I1eDdvaWRNNFk5bG1wMHpp?=
 =?utf-8?B?eHA0L1hKVzFzME1GMnlYUFVYc0dVN1U3eXVUdG0wZ3lSRVIzY2FXNDY1d1Fn?=
 =?utf-8?B?TWdPMEpoTUlBdmdlNnBIMjVnL3pNWTI3S281MElmZW9tSEdmTm5rK2JxRmE4?=
 =?utf-8?B?RWhmWjlUeWVMeWJWeDRTaDFnQ1BERDlvM1hPcU0zMXYzTFpIVjlhaUQ1eUhk?=
 =?utf-8?B?SkxjU2wwQ29oNEw4Q0RRZFpCUDFIV044R3FrWUFNak1YYTA5Q0tIMDNjZzB1?=
 =?utf-8?B?bkxNZ2Rac2xweU5tVWg5YWZhblFGemljZEhhY2MyTGQ2ZVAwdlhYRTg0c2ZL?=
 =?utf-8?B?TnFoU29VZ2hGb1B5WHlnd1Z1QWh5N3kvRzY4TUlSaW1DdVdEVzBuQ3U2SGtW?=
 =?utf-8?Q?aThxpsNmyUKj8lsRh2BDoIo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d453ff-5b7f-4066-32d2-08d9b34defd7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:56.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHo1R7uJIa1uDLufds5/VfFUj/0FDRHGxJs00XJaARB1UwzNmV4Dzgeuv3pxBHYsb9kEc4Tf0/cp1r4eBZ6Yww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v4:
 - Correctly account for PVH guests being HVM in libxl__cpuid_legacy.
 - PAE option is only available to HVM guests (_not_ including PVH).

Changes since v2:
 - Use 'r' for libxc return values.
 - Fix comment about making a cpu policy compatible.
 - Use LOG*D macros.
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 122 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  92 ++++++++++++++++++++++--
 3 files changed, 86 insertions(+), 146 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..745d67c970 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1829,24 +1829,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 41c6e66b6f..f4ed632d60 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -379,128 +379,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    struct xc_cpu_policy policy = { };
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    if ( restore )
-    {
-        policy.cpuid = *p;
-        xc_cpu_policy_make_compat_4_12(xch, &policy, di.hvm);
-        *p = policy.cpuid;
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = *p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-        *p = policy.cpuid;
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy.cpuid = *p;
-    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
-    if ( rc )
-        goto out;
-    *p = policy.cpuid;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 815498d4f3..07d445d9f9 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -441,9 +441,11 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t *policy = NULL;
+    bool hvm = info->type != LIBXL_DOMAIN_TYPE_PV;
     bool pae = true;
     bool itsc;
-    int r;
+    int r, rc = 0;
 
     /*
      * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
@@ -454,6 +456,41 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGED(ERROR, domid, "Failed to init CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to fetch domain CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    if (restore) {
+        /*
+         * Make sure the policy is compatible with pre Xen 4.13. Note that
+         * newer Xen versions will pass policy data on the restore stream, so
+         * any adjustments done here will be superseded.
+         */
+        r = xc_cpu_policy_make_compat_4_12(ctx->xch, policy, hvm);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to setup compatible CPU policy");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    r = xc_cpu_policy_legacy_topology(ctx->xch, policy, hvm);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to setup CPU policy topology");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -466,6 +503,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     if (info->type == LIBXL_DOMAIN_TYPE_HVM)
         pae = libxl_defbool_val(info->u.hvm.pae);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set PAE CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 
     /*
      * Advertising Invariant TSC to a guest means that the TSC frequency won't
@@ -481,14 +525,50 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to set Invariant TSC CPUID flag");
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
-    if (r)
-        LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm) {
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set VMX CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOGD(ERROR, domid, "Failed to set SVM CPUID flag");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    /* Apply the bits from info->cpuid if any. */
+    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    if (r) {
+        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to set domain CPUID policy");
+        rc = ERROR_FAIL;
+    }
 
+ out:
+    xc_cpu_policy_destroy(policy);
     GC_FREE;
-    return r ? ERROR_FAIL : 0;
+    return rc;
 }
 
 static const char *input_names[2] = { "leaf", "subleaf" };
-- 
2.33.0


