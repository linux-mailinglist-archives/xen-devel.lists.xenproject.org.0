Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC25FD8BA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421926.667640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwvy-0004yx-Pd; Thu, 13 Oct 2022 12:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421926.667640; Thu, 13 Oct 2022 12:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwvy-0004w3-Lh; Thu, 13 Oct 2022 12:03:30 +0000
Received: by outflank-mailman (input) for mailman id 421926;
 Thu, 13 Oct 2022 12:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiwvx-0004vx-8h
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:03:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 089cb19f-4aef-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 14:03:25 +0200 (CEST)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 08:03:21 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6086.namprd03.prod.outlook.com (2603:10b6:208:31c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 13 Oct
 2022 12:03:18 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 12:03:18 +0000
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
X-Inumbo-ID: 089cb19f-4aef-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665662605;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IZu7kORVbAw5KrgckG6GFBCC3blYhRh80B1pT8pN3TQ=;
  b=DAFkepTz21D3YpASz94cLamLLMhHtlEyyA/KM6W8ibJ5CTkAjW4BnX9m
   cEalxbjIDNfTkhz3YcXxpQGqF/ExkWn0Xr/8yw1W2w8YMCV1NlLATvolY
   BwYI3MlwLwim442rNRwSmnjHzotKRwcquBYOXHqh3ei6FeLMLz8BiAJGo
   U=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 82630622
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7Utp4a4QEWH9OYbiYwBaQQxRtCDGchMFZxGqfqrLsTDasY5as4F+v
 mRLXTyAaKvYMWH8c9F0Poni8ktXsZbQnddiG1c9/3o3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gVlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5VPH8X+
 uMiGgtTRU+S2N7x2pCgcOlV05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toijy3beRx3mTtIQ6SrTj/71Igl6p61czEjkdZ0Dim+mlsxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHPikNSFNf58G5+N1iyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:kPSUkqu4Gt3VCaAgvT0kTE2E7skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUZqFh/dL5pUUtDPpZxfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82630622"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBnWdcMYrKnOCKuepe6BlRH+DIBKGqQ2SL7A+8E2h8utoa8ca++qGIJ1qy6a7xmqMbJEm3BQQwcn8Onjf2EHbkfi9lpje+3vT6BhX+tiRGvOIEJyvMQ+ojfPuQ0XaWIUVGdb/XkQOwBJ4wBj/kUVav6QxAfB81sYzmNspwhQrilCn58uv+Bfna0hZsQLN47Gaan72KKncP4V1r7hKGjc5RsNrvQg6yiwMHfbqJoN7lOjKDpz5t3IVlecM79FcZVDgMLYt6no/2DH+qrGc3q4HGerjWIpoNWyPG7ZLC/+OkXAf+eLxftvTm4HkzQA9xfR2YTddFXoY47yjhtZNfuFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slvnrnLNONI7rxqmZwiFBSS2wgx8kaPTR+IWnPIqHYY=;
 b=KbYuVofjyjqbvtMzSHqewakpUSeCO8Gpgl8E1/y6x6sDT0MlZevqLJ2XYrjUVHT/Wc37IDu0YEOXz9afApiuxOCpciahdsu/1CUBbMBskSfsP6hkuhRiZ+CHiKrrAo9emKzE2z0crBaJ4lVBW9rfAwDUUV4C7QJqRMu2HUQ+bR6gqyR9XYxeTuk1WOJ4x8HdNmKSauZLIV2U9tqdE/ii8LS0VNOa/PKlIlUuqptd+7ydIsta/7rgCQWsZcnRBCYWqgVRC1HpTYXVm3Z0XRv3Ja0tcnWAPAVkeVuC2XxMTOCmsSH0QorMucSiKqJQdHgEcMTmdw7I8uwx3jbkSJBnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slvnrnLNONI7rxqmZwiFBSS2wgx8kaPTR+IWnPIqHYY=;
 b=gtJeOJCPQz5CzqwuuhaszQrtlO7J7nNI1XEgJs+EiLYfkihbgyLJV5wg/ux6QWA9UiQM2Dvm/nAU1LYc92PCPQALTmqTFc+LcrDWeoydLm+bYo7++zaaVd7cwa/GRMVE82quDhKnKYPkvtFyCLtEpcBk7XEXNPFpXZNBNPViwcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 14:03:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Message-ID: <Y0f+gL1PfB5lzlDj@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cac7fc-8231-409f-1ac9-08daad12ea3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9xs0Ih/unT4m4ICqxydKt1bMiatrAtmIG5wiPI1NRWrpG+ulm3IbPZ+XPYvt56NSs0wakdfXGHeS1y1/NrhgAgycA0hu4J9jp5r9T1OvXoERJKqOWeRLtWLDFM7G99koo+7G8kCbwoA9Zsg0j4lqc2Fr1vn0JOzTbFldabDNe/WEAzkaa855UnSI1kImo3ZgB1GMUG2wzgfkxKYU5h0f8XG148FAHHuRnmNcUvhjY0utsKoba5Ti05bGhDNEIJ9qnM7uGeNo43OaG4zKlXDPzlN1dS6UvMCQohJDK0avXBGYFJRe8IaWSlThDdKAfIO1l7znEupaNYeR4pysq/UuTdc3R1E6x4EnXotJxt/4KGYTAa6NuMoqd82B58Mv6Ggu8LF9AOcvad6BwLRCHq9h3aW7Mx18MslKLs5R34gcDVDIWSmzK2JVcV9Nr/Hj/ZmkBOEZYpzecItF/neaXNpxG4CYFAhS0CBXx20vtNZbxpOBDhP7ziIr6LAAXlDcuxbQoieQhcGxSwu1noXCd5A+SnG5JEE38BfHm7+3mM2UNpfNaIIIU7D8rgECayeIyR7PM+TwE0A3xGqyW7RE2Y9TOITaK/u0jsI1YGDc4j8t6dIa8OLYO2GKcVWr9tG/PmTx1eSGBSE4gsmp2YWbEJGe65DkiAKyzKaJ9lC0EoFfwR8zVB0q8xm5RQPJtcP17VBVXpi9sC2TYJWOnTsPL03gXw1ecdI+vcM8aPl49MVMZdkgc+juVQTP2o9HdvFSAKQUC8y2pBRLUgWHCK9R4092dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199015)(2906002)(316002)(85182001)(54906003)(6916009)(66556008)(66946007)(41300700001)(8936002)(8676002)(6486002)(4326008)(478600001)(82960400001)(83380400001)(6666004)(66476007)(5660300002)(186003)(6506007)(33716001)(86362001)(9686003)(6512007)(38100700002)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxPNVdrK2JJanNvOTd5UStiMEhkMXdkMkwxazNUVTk2MVpQdGRWYnJiOURZ?=
 =?utf-8?B?MDRIeUdXMTg2MzIydVJmeDBUbCthWEdodVlnN29mVlZ5UGp1eG9lZ3JwcW9z?=
 =?utf-8?B?MUh0UmxPRDF4a3F5aERMZW1Pekx4bmVFU1pGaEltQVN2Nm4zWEtQTGd2Snc3?=
 =?utf-8?B?VWJjTU95d3lrOTlwUDZlWkoxS3RDS0NxYUE2aTdXREpEQXhMbFM1UTZQbDdJ?=
 =?utf-8?B?TlFvVGNWb0M3eHE2d0IzOFJLQ2t3dXJGWGVBNUhmdk1Ua1c1Q0ZXelFMR1V2?=
 =?utf-8?B?d2lLdjF4YStCSHQ1NHNCTEpJdHRLbXFYSDZ4SStyMExISU93Q0Z6STNPZyts?=
 =?utf-8?B?MHpsSzBPbnNjUGJWM285SVh6WHJkd29FYzJXMzhIeEJ3VkhlUm15TjU3WHFv?=
 =?utf-8?B?RTRJSGdZbFp0SUlkWnRGU2pab1lnaENRb0JkQittTy9VQWRkU09hbkppMnBa?=
 =?utf-8?B?WFRFSndrTzJZV1NzZUJjazVoVEdhR0xCbEE1cU5hNWp4VFROOFMxSWwyN1lQ?=
 =?utf-8?B?REVzQ3pKMERadXBHd0g1a1FhVmZDRnl3V3FxU1ltalRqeXdMb2w3S3k5bity?=
 =?utf-8?B?dEZiMkoyMlg0OXVSVkFBWXRuQW01VzhyTFVRUVltWU8rLzY1RkRMVElzZG4r?=
 =?utf-8?B?YW1nT1pGSFUrc0RTR25TajdzWnVTb1ZHOUNDVWZtWDVqWW90ZVNsWVBtQmlx?=
 =?utf-8?B?SkR5bmgvNS9JZ3ZxbDI5ai8yeG9YckQyMkowTG9MblVUT21pSHBaVy9sQkN2?=
 =?utf-8?B?cEdWWTBvRi8rUFlrZnlEMDJ5QzlqRkJBZEoyTVdERVdreTRXeGpLVXV3akdt?=
 =?utf-8?B?cGRGYkw2NlF3dWxhWWFxak9CTFIrVVpkWURHakN0S1hYZTQ5OHlUWDJvTVBB?=
 =?utf-8?B?a0VKZVBodTlJeDJmUjdvY0xNNGlmS0ZTRjJHQ0wzUllRb2cwTUJMRTJwSnZh?=
 =?utf-8?B?aDFMcjB6Q0dHYUp3bVdZWEJlWHJ5blY4RFNWODBBVE5LY2FqOXkwYStGck04?=
 =?utf-8?B?RUdqVHF6MzZMcUJ0Yk5idXBiMUFtZlNhanlSM2dzNHJaK09jL0hHZzk5MWx2?=
 =?utf-8?B?dGtOSU0xS0FHdWx6RE54T3Fpa0JFNWtqUkR3bWxSZDB0aktxQlFtUFh3V0FE?=
 =?utf-8?B?M21RTmZlNStyeUlGclFoVGVCUHhtQy8vNWpoakZDMFBSVS9oNFNNRnFYdDl4?=
 =?utf-8?B?SWdWVlVNR2FWdzhRRzJnN3BDa3prMEhIK0dzMENsS0dIeUQ1MWMxTk81UEYr?=
 =?utf-8?B?bHNPNENpVlVVVlhiYjF2UERTWURiWXhCVG15Tk1aVmJjMFhYaFRmQnZXK2VU?=
 =?utf-8?B?MitaZHA5VHFtUG9COS96VWVLaWc2MFBETUZtQVU3bU1EbmVOVm1PaXJvRTJV?=
 =?utf-8?B?RlpkOHNtcTVJa0xtTDNRb2YvYmVocHJmcGM0cTNnaG9EOW1ZMnFzdndnd3Va?=
 =?utf-8?B?eFJUaG0xck1SUTN3Wm8yRU1SL3MydHBrY0dZWTE0SFV5K1BMSlJWOWdGYmtB?=
 =?utf-8?B?eHEzTnVpTVpXM1A0MEd2UzZkTW5SZ2tnWFlPeW1TdE1wTFFhalJsRjBaZkFN?=
 =?utf-8?B?SUJOcWVzdjVtWlJuZmdtWWFWaDFMdTY5aGtQRlRaOExFOHJDTzNwbXo3dFdv?=
 =?utf-8?B?NWdSQVgrV0pjcmE5RWNJemhoZjg0K0M2QzhYR0ZrZFRRMzBkdWF0R2MxYWFS?=
 =?utf-8?B?TmRxSERWQnBPLzJ4L3JhTzEwZ3M2T2UzVmN6YW50WnFsemtDdzNNellKUEFp?=
 =?utf-8?B?Wk9YVzIvKzhNVmhMVnc3Njk1ZkFxcm5aajhaQTRpdCtOb09sazBQVXhZUm40?=
 =?utf-8?B?Mjk3cHJoMHAwaExpNm8xYUlRRzJyQVVaM1ZraVRFY3FML3NDTnI5eXRiVUNo?=
 =?utf-8?B?MkhHaW9XVlhPc2NzUmpSTm5sQi92bGtTb21SbUY3QXFqNjhzVHVBNStBSWtD?=
 =?utf-8?B?c1F0bFhWaEdwTmM4SFhKTnkzOERZRHJVNWF3ai9PZkRzVHR4cThNQWtTeGV6?=
 =?utf-8?B?ZkQrV2U1U09EeHVmQ3hyanRqZ1IzajhaMDkycGIxNmRya3F4bkxFYXZUbDg1?=
 =?utf-8?B?S0prc294d1ozV2hCM0VIQnlvOERSeURpZW8zWU90TWgyMHJEZG56Tkg1N0Rq?=
 =?utf-8?Q?16r2o61Ii8w2SeFhm2qKgBGis?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cac7fc-8231-409f-1ac9-08daad12ea3d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:03:17.9261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLWH6tR0XUD/1jJ3r+judK2kZbvSVjOEy7m8z9ovheOoNyKz3pW8MHhMhDBZEwEDULUtjhFlVpZmFh4l2z419A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6086

On Thu, Aug 18, 2022 at 03:04:51PM +0200, Jan Beulich wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Having IBRS enabled while the SMT sibling is idle unnecessarily slows
> down the running sibling. OTOH, disabling IBRS around idle takes two
> MSR writes, which will increase the idle latency.
> 
> Therefore, only disable IBRS around deeper idle states. Shallow idle
> states are bounded by the tick in duration, since NOHZ is not allowed
> for them by virtue of their short target residency.
> 
> Only do this for mwait-driven idle, since that keeps interrupts disabled
> across idle, which makes disabling IBRS vs IRQ-entry a non-issue.
> 
> Note: C6 is a random threshold, most importantly C1 probably shouldn't
> disable IBRS, benchmarking needed.
> 
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One unrelated comment below.

> ---
> v3: New.
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -141,6 +141,12 @@ static const struct cpuidle_state {
>  #define CPUIDLE_FLAG_TLB_FLUSHED	0x10000
>  
>  /*
> + * Disable IBRS across idle (when KERNEL_IBRS), is exclusive vs IRQ_ENABLE
> + * above.
> + */
> +#define CPUIDLE_FLAG_IBRS		0x20000
> +
> +/*
>   * MWAIT takes an 8-bit "hint" in EAX "suggesting"
>   * the C-state (top nibble) and sub-state (bottom nibble)
>   * 0x00 means "MWAIT(C1)", 0x10 means "MWAIT(C2)" etc.
> @@ -530,31 +536,31 @@ static struct cpuidle_state __read_mostl
>  	},
>  	{
>  		.name = "C6",
> -		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
>  		.exit_latency = 85,
>  		.target_residency = 200,
>  	},
>  	{
>  		.name = "C7s",
> -		.flags = MWAIT2flg(0x33) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.flags = MWAIT2flg(0x33) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
>  		.exit_latency = 124,
>  		.target_residency = 800,
>  	},
>  	{
>  		.name = "C8",
> -		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
>  		.exit_latency = 200,
>  		.target_residency = 800,
>  	},
>  	{
>  		.name = "C9",
> -		.flags = MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.flags = MWAIT2flg(0x50) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
>  		.exit_latency = 480,
>  		.target_residency = 5000,
>  	},
>  	{
>  		.name = "C10",
> -		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
>  		.exit_latency = 890,
>  		.target_residency = 5000,
>  	},
> @@ -576,7 +582,7 @@ static struct cpuidle_state __read_mostl
>  	},
>  	{
>  		.name = "C6",
> -		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED | CPUIDLE_FLAG_IBRS,
>  		.exit_latency = 133,
>  		.target_residency = 600,
>  	},
> @@ -906,6 +912,7 @@ static const struct cpuidle_state snr_cs
>  static void cf_check mwait_idle(void)
>  {
>  	unsigned int cpu = smp_processor_id();
> +	struct cpu_info *info = get_cpu_info();
>  	struct acpi_processor_power *power = processor_powers[cpu];
>  	struct acpi_processor_cx *cx = NULL;
>  	unsigned int next_state;
> @@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
>  			pm_idle_save();
>  		else
>  		{
> -			struct cpu_info *info = get_cpu_info();
> -
>  			spec_ctrl_enter_idle(info);
>  			safe_halt();
>  			spec_ctrl_exit_idle(info);

Do we need to disable speculation just for the hlt if there's no
C state change?

It would seem to me like the MSR writes could add a lot of latency
when there's no C state change.

Maybe I'm confused.

Thanks, Roger.

