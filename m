Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7D15B5EC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 01:37:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j22Rq-00061X-4b; Thu, 13 Feb 2020 00:33:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hkrL=4B=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1j22Ro-00061S-B6
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 00:33:40 +0000
X-Inumbo-ID: 7871d018-4df8-11ea-b0fd-bc764e2007e4
Received: from m9a0013g.houston.softwaregrp.com (unknown [15.124.64.91])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7871d018-4df8-11ea-b0fd-bc764e2007e4;
 Thu, 13 Feb 2020 00:33:36 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP
 FOR xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 00:32:56 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 13 Feb 2020 00:32:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 13 Feb 2020 00:32:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSfX4jLU5f3+LY2ffDy3RYxerCosn72S/+3RLwqodgvVY6gtPsYeC6PWcGpsuumlSMLHqgfb0r1BmG8JTq2kDJbhe/V24/GJfjKpE6vc2a1+9Epi34s2E7WVcuC9rVvJCx87B05Qn57323jCK2/L24wtDTXAVsubeVErXqWmewyp650a9PWVVD9Q0jGeh5tn/SWvTxOV8a0EpukM1kx3Opafu3w/efu08s7dmbPSBs3l6RR7t0Ijg9xEB+JxptGp/tQOQgjZl4lEKXYR1xNFeZszngXXxE2Q5eehcScdIbQlugAm4D/4pfk6NzQw+UdfFaJzVcP2DEwAp8m3cYCWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inyXM8yP7f/Ph4+UpRKUWr5aDwsbv96o5jGNFlS0YuA=;
 b=lN59bbVEXcfxsvdApQdUVu/hvlhyH/IYVY/PXpf01RRGs+q7p7xSFHKVTg5z4SX4B74XrPV5mRfC5PC505/goAIHZfRAl+IIOiJ9dKWQ+LP562bbswStMLcdIx+t8ql2ss/Ah5qqb3IgFIvvr43tiS45i9Iv3ecME3mjgKuZQlDNNBjo5yMpzHM7ldTQhnjGce8ADnjAWZ07egdwtuThGT5rK8Qx9znb7rLsegptCBIStx1FW9mB/ZUun7EUebeOoF9U4ELFFB5hGXUnY/2qIPk2VSESuF9+am8etJnmXBNdbF1pjcIuPSn3bf/ZPy0xM++8XfDK8m6QMyT/Jp2eSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3220.namprd18.prod.outlook.com (10.255.136.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Thu, 13 Feb 2020 00:32:28 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4%7]) with mapi id 15.20.2707.030; Thu, 13 Feb 2020
 00:32:28 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 17:31:59 -0700
Message-ID: <20200213003159.7060-1-jfehlig@suse.com>
X-Mailer: git-send-email 2.25.0
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
MIME-Version: 1.0
Received: from linux-tbji.provo.novell.com
 (2620:113:8044:4009:ffff:ffff:ffff:fd3e) by
 BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Thu, 13 Feb 2020 00:32:27 +0000
X-Mailer: git-send-email 2.25.0
X-Originating-IP: [2620:113:8044:4009:ffff:ffff:ffff:fd3e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae4d33b7-af96-4178-e7b6-08d7b01c3452
X-MS-TrafficTypeDiagnostic: BY5PR18MB3220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR18MB3220EA86498C998ACCA692D7C61A0@BY5PR18MB3220.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(316002)(2616005)(6666004)(86362001)(4326008)(2906002)(107886003)(36756003)(1076003)(6916009)(66556008)(6512007)(66946007)(66476007)(81166006)(81156014)(6486002)(8936002)(6506007)(5660300002)(478600001)(16526019)(966005)(186003)(52116002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3220;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OouXwsviD75V+CxRra2rwOyTzQ/RjsPKKMMC+RkzGBybt4rOgt8TS1mNLT1PYKm13wYlVfm1YZUqBIQd7hp52xgVnmI+r5r6OWhvplXTKNwfruDlwT0IdKWSDBroSvHe7TwGcnIAKJDVCtMo15Zhiw2KezkOUfvg+tV7aZfA1E81nzuhvOenfCdXz1dwX3qJMHFw39TlsyOpgKaQaOOow64PKc83PRxRXDz7O16NeLJliYqpe8yJ+CJ5CS17fpaD14yxNriK6JTQsZQwfuk8J06uBK7Vxlj1/RP6zpu6dESGKippfYHfJkVO3aZrUu/oLDNcFt+ZF+KdQ00jwoLNswezXjdZQHSEZ2sqIRQXnA/FGIRp0vVTzXOVv/HK+hCwEgyW/JJJSsDcTOOWgzMnRCiElEofWV/2shjLvJBPVvORqyu1gBJrC7oPanwQw1e0TqUmgh7XBDEJxAoda11iA+U0XcGnvFYvgmAUF4VFbBloMOM3yUK8pe+73iX5uV9hGP9X9w3hyjhEFbptOftj0Q==
X-MS-Exchange-AntiSpam-MessageData: TlY+7yfrFZxuUGh3jwC/c64G2LEHsvueMvXwngFw5h2EjEFRA3So+ZYHYZAjqx7ajSXfDT6cLj7PWr82e1NMNJILzGHcSpHkQIA3i7ShbRwz1P54bfrEXUTB+SKodOlAto6hdN20GIlNDGJm/RDEAkUIW1K0apZiGfXSEwpEao8fkrWZVSDtkZ8npayLW0c0BhdMpzD11d9PAwsbbPGLwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4d33b7-af96-4178-e7b6-08d7b01c3452
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 00:32:28.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vm/p5TvC01JhimuOR2I8VmsrTzySeCLK9jhkGc+NPuE0F6kOLRZ1kYUMvQnX+BabOFRf4Y1jVeRlIOXXHrP6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3220
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [OSSTEST PATCH] build: fix configuration of libvirt
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jim Fehlig <jfehlig@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlidmlydC5naXQgY29tbWl0IDI2MjFkNDhmMDAgcmVtb3ZlZCB0aGUgbGFzdCB0cmFjZXMgb2Yg
Z251bGliLCB3aGljaAphbHNvIHJlbW92ZWQgdGhlICctLW5vLWdpdCcgb3B0aW9uIGZyb20gYXV0
b2dlbi5zaC4gVW5rbm93biBvcHRpb25zIGFyZQpub3cgcGFzc2VkIHRvIHRoZSBjb25maWd1cmUg
c2NyaXB0LCB3aGljaCBxdWlja2x5IGZhaWxzIHdpdGgKCiAgY29uZmlndXJlOiBlcnJvcjogdW5y
ZWNvZ25pemVkIG9wdGlvbjogYC0tbm8tZ2l0JwoKUmVtb3ZlIHRoZSBnbnVsaWIgaGFuZGxpbmcg
ZnJvbSB0cy1saWJ2aXJ0LWJ1aWxkLCBpbmNsdWRpbmcgdGhlICctLW5vLWdpdCcKb3B0aW9uIHRv
IGF1dG9nZW4uc2guIFdoaWxlIGF0IGl0IHJlbW92ZSBjb25maWd1cmUgb3B0aW9ucyBubyBsb25n
ZXIKc3VwcG9ydGVkIGJ5IHRoZSBsaWJ2aXJ0IGNvbmZpZ3VyZSBzY3JpcHQuCgpTaWduZWQtb2Zm
LWJ5OiBKaW0gRmVobGlnIDxqZmVobGlnQHN1c2UuY29tPgotLS0KCkkgaGF2ZSBwb29yIHBlcmwg
c2tpbGxzLCBidXQgaG9wZWZ1bGx5IHRoaXMgZml4ZXMgdGhlIGxhdGVzdCBidWlsZApmYWlsdXJl
cyBvZiB0aGUgbGlidmlydCB0ZXN0IHByb2plY3QsIGUuZy4KCmh0dHA6Ly9sb2dzLnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY5MjEvYnVpbGQtYW1kNjQtbGlidmlydC82
LnRzLWxpYnZpcnQtYnVpbGQubG9nCgoKIHRzLWxpYnZpcnQtYnVpbGQgfCAxNiArKysrLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90cy1saWJ2aXJ0LWJ1aWxkIGIvdHMtbGlidmlydC1idWlsZAppbmRleCBl
Nzk5ZjAwMy4uYWM1YWZjZjIgMTAwNzU1Ci0tLSBhL3RzLWxpYnZpcnQtYnVpbGQKKysrIGIvdHMt
bGlidmlydC1idWlsZApAQCAtMjYsOCArMjYsNyBAQCB0c3JlYWRjb25maWcoKTsKIHNlbGVjdGJ1
aWxkaG9zdChcQEFSR1YpOwogYnVpbGRkaXJzcHJvcHMoKTsKIAotb3VyICVzdWJtb2RtYXAgPSBx
dyhnbnVsaWIgZ251bGliCi0gICAgICAgICAgICAgICAgICAgIGtleWNvZGVtYXBkYiBrZXljb2Rl
bWFwZGIpOworb3VyICVzdWJtb2RtYXAgPSBxdyhrZXljb2RlbWFwZGIga2V5Y29kZW1hcGRiKTsK
IG91ciAkc3VibW9kdWxlczsKIAogc3ViIGxpYnZpcnRkX2luaXQgKCk7CkBAIC01MCwxMiArNDks
NiBAQCBzdWIgY29uZmlnKCkgewogICAgIH0KICAgICBkaWUgIm5vIHhlbiBwcmVmaXgiIHVubGVz
cyAkeGVucHJlZml4OwogCi0gICAgIyBVc2VzIC0tbm8tZ2l0IGJlY2F1c2Ugb3RoZXJ3aXNlIGF1
dG9nZW4uc2ggd2lsbCB1bmRvCi0gICAgIyBzdWJtb2R1bGVmaXh1cCdzIGF0dGVtcHRzIHRvIGhv
bm91cgotICAgICMgcmV2aXNpb25fbGlidmlydF9nbnVsaWIuIFRoaXMgaW4gdHVybiByZXF1aXJl
cyB0aGF0IHdlIHNwZWNpZnkKLSAgICAjIC0tZ251bGliLXNyY2RpciwgYnV0IC4vYXV0b2dlbi5z
aCBkb2Vzbid0IHByb3BhZ2F0ZQotICAgICMgLS1nbnVsaWItc3JjZGlyIHRvIC4vYm9vdHN0YXAg
c28gd2UgdXNlIEdOVUxJQl9TUkNESVIgZGlyZWN0bHkuCi0gICAgbXkgJGdudWxpYiA9IHN1Ym1v
ZHVsZV9maW5kKCRzdWJtb2R1bGVzLCAiZ251bGliIik7CiAgICAgdGFyZ2V0X2NtZF9idWlsZCgk
aG8sIDM2MDAsICRidWlsZGRpciwgPDxFTkQpOwogICAgICAgICBjZCBsaWJ2aXJ0CiAJbWtkaXIg
YnVpbGQKQEAgLTYzLDEwICs1Niw5IEBAIHN1YiBjb25maWcoKSB7CiAgICAgICAgIENGTEFHUz0i
LWcgLUkkeGVucHJlZml4L2luY2x1ZGUvIiBcXAogICAgICAgICBMREZMQUdTPSItZyAtTCR4ZW5w
cmVmaXgvbGliLyAtV2wsLXJwYXRoLWxpbms9JHhlbnByZWZpeC9saWIvIiBcXAogICAgICAgICBQ
S0dfQ09ORklHX1BBVEg9IiR4ZW5wcmVmaXgvbGliL3BrZ2NvbmZpZy8iIFxcCi0gICAgICAgIEdO
VUxJQl9TUkNESVI9JGJ1aWxkZGlyL2xpYnZpcnQvJGdudWxpYi0+e1BhdGh9IFxcCi0gICAgICAg
ICAgICAuLi9hdXRvZ2VuLnNoIC0tbm8tZ2l0IFxcCi0gICAgICAgICAgICAgICAgICAgICAgICAg
LS13aXRoLWxpYnhsIC0td2l0aG91dC14ZW4gLS13aXRob3V0LXhlbmFwaSAtLXdpdGhvdXQtc2Vs
aW51eCBcXAotICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aG91dC1seGMgLS13aXRob3V0
LXZib3ggLS13aXRob3V0LXVtbCBcXAorICAgICAgICAgICAgLi4vYXV0b2dlbi5zaCBcXAorICAg
ICAgICAgICAgICAgICAgICAgICAgIC0td2l0aC1saWJ4bCAtLXdpdGhvdXQtc2VsaW51eCBcXAor
ICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aG91dC1seGMgLS13aXRob3V0LXZib3ggXFwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLXdpdGhvdXQtcWVtdSAtLXdpdGhvdXQtb3BlbnZ6
IC0td2l0aG91dC12bXdhcmUgXFwKICAgICAgICAgICAgICAgICAgICAgICAgICAtLXN5c2NvbmZk
aXI9L2V0YyAtLWxvY2Fsc3RhdGVkaXI9L3ZhciAjLwogRU5ECi0tIAoyLjI1LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
