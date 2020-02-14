Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E615E056
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2dYC-00037H-3h; Fri, 14 Feb 2020 16:10:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=02C0=4C=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1j2dYA-00037C-Gv
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 16:10:42 +0000
X-Inumbo-ID: 884d9448-4f44-11ea-baa7-12813bfff9fa
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 884d9448-4f44-11ea-baa7-12813bfff9fa;
 Fri, 14 Feb 2020 16:10:39 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 14 Feb 2020 16:09:26 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 14 Feb 2020 16:00:09 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 14 Feb 2020 16:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUwkXOJvYX6VEbnyghUO0wDJzmTwL+KELT+vXF3C9xqQsaBnFi+eqIPfMmO86oKXUebpxHtAoaF6UcsoEJK3JBh4Z3JYI4obYRKW3BGYlJsRBsgr3CvED2o9DD9ay6UiMZzZ65SXw9DcYn4eqZ3Qol0P3QI3VbIT4U/cimDh1vCoPMFyKNOCsOPYZrMjrwIk/Lz2IbH0l8WuEFmJ3Oauch6E6XMc0b8NEN2ei1/S9AHeYhhPpJBIGGM5XqHHdKvyTCOavZrABxnPbzDUMZQC6gMTspP8glNgPnhbayVCT/LQt6WCm2Hk0jcnPooGfKVnJVTGbSSr4dbeIKktOzB+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4nmaUuf2ifzUf74DJ+wWLVU+ZaFBleouRnI8gLB2LE=;
 b=DhgcDBKepDN+av/jiM6OD4HvL6eujIMmn4wh9kMqq/ZyRjeknkcCVMhAhRuN3O6rja3YJD8k+wciTfnxnCSOP/DYdKcL1RnW3R6gWg75JlUO9AUlVKywydfHCHb0UbAQ/VcbqUntENLnfM6lYcykvIIbdtTs3xV0Law0vRvZPaNmMhy/TgSMLt6NjsJDyOsBovTq4w+WK4ryTq2ZdOKl+qcN+v2cjVthEZ2KIhCzRS//2NCyf7oVk2M/C/83lnbjjhzvtavUms19aeWqLA74FRthXKwb0IR/Vrq7aph8Uha5slFytfShA/V221ovM9VzuHX77Sra+pLgus+kitLw6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3379.namprd18.prod.outlook.com (10.255.136.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.29; Fri, 14 Feb 2020 16:00:07 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4%7]) with mapi id 15.20.2707.031; Fri, 14 Feb 2020
 16:00:07 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Feb 2020 08:59:33 -0700
Message-ID: <20200214155933.7048-1-jfehlig@suse.com>
X-Mailer: git-send-email 2.25.0
X-ClientProxiedBy: BYAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::43) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
MIME-Version: 1.0
Received: from linux-tbji.provo.novell.com (75.169.19.89) by
 BYAPR03CA0030.namprd03.prod.outlook.com (2603:10b6:a02:a8::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25 via Frontend Transport; Fri, 14 Feb 2020 16:00:07 +0000
X-Mailer: git-send-email 2.25.0
X-Originating-IP: [75.169.19.89]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40f53970-c10c-452e-426c-08d7b166f647
X-MS-TrafficTypeDiagnostic: BY5PR18MB3379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR18MB337923BB5D87383B73095CE2C6150@BY5PR18MB3379.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(189003)(199004)(86362001)(66476007)(6666004)(186003)(66946007)(8936002)(6916009)(5660300002)(478600001)(956004)(2616005)(16526019)(66556008)(107886003)(966005)(26005)(6512007)(2906002)(1076003)(8676002)(81166006)(52116002)(6506007)(81156014)(316002)(4326008)(36756003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3379;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nSA+2UqWB2GoBhUmq5i2h4qufn1lCxYHfcqXK9wV01c5HndCrAeVGnNHAWjUMSI1C76obF8tQN5CKv6DNkBOD0xKupKQj3QzU9TOZXs0Rlkl5q1b33OWXcaLeDLRLv+7hYGSD5vm+JfCO471HhuklEXnZKEkJNLj9KGQsDJz+4RNCTygDGW0MJUWQ6qNvLrUNmXUKlBvQsOE4C3zW3omCE8m1jO7m6UqxuSGGG5ZT8Oqa/F+FBejxRl2FWYXKGP8NZO+G8eERAex6OI0zIkAkm3QCs5yFUnuzvv3H0hGCCe5W2F1a5lOxzWqbPJ4rEDl4JJB/ryTwGH6aMMjEmgikHMVlT3F61j6iAZwKFzoj7hC21cQa/SIbitCy27l/nRc3JtDIk8pk6TWbT9m+e6MeHaBVB4il5Y75VPJOnaVfEynlLf7eemOfgePB/o2wybtOs58F3ATmitxfwjStaTFw8Pg0HaHuYUEgmlRyFvSNEYeGZKBKXmkSypcmF/AXQ9SgISUz627HjaIrBFs9oKjuw==
X-MS-Exchange-AntiSpam-MessageData: sadnmHva+Di7mF/LAG1QJam2BoPABVcD6ZDRYc2AtjRyYtP3YyaBllAan0U/Fc5fDg2pTNy7fLCHK5j/wzrJ6YbH2kBYFQpns6VdmyxL5WkF9g7FqSQfqkQ29aKUqPGwNEikE+tce8Yh2MQ0qvRZhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f53970-c10c-452e-426c-08d7b166f647
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 16:00:07.5039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AD2KcpSILu4upvEu7iYAokfkjmiK0RtqzEcYU+v3fSOwQFx5oSsd24I7fFVW9I5R4AY5f6M4tadt9wRhhT3TUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3379
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [OSSTEST PATCH V2] build: fix configuration of libvirt
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
Cc: Jim Fehlig <jfehlig@suse.com>, ian.jackson@eu.citrix.com
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
LWJ5OiBKaW0gRmVobGlnIDxqZmVobGlnQHN1c2UuY29tPgotLS0KClRoZSBvbmx5IGNoYW5nZSBm
cm9tIFYxIGlzIGFkZGluZyBJYW4gdG8gY2MuCgpJIGhhdmUgcG9vciBwZXJsIHNraWxscywgYnV0
IGhvcGVmdWxseSB0aGlzIGZpeGVzIHRoZSBsYXRlc3QgYnVpbGQKZmFpbHVyZXMgb2YgdGhlIGxp
YnZpcnQgdGVzdCBwcm9qZWN0LCBlLmcuCgpodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ2OTIxL2J1aWxkLWFtZDY0LWxpYnZpcnQvNi50cy1saWJ2aXJ0
LWJ1aWxkLmxvZwoKIHRzLWxpYnZpcnQtYnVpbGQgfCAxNiArKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90cy1saWJ2aXJ0LWJ1aWxkIGIvdHMtbGlidmlydC1idWlsZAppbmRleCBlNzk5ZjAwMy4uYWM1
YWZjZjIgMTAwNzU1Ci0tLSBhL3RzLWxpYnZpcnQtYnVpbGQKKysrIGIvdHMtbGlidmlydC1idWls
ZApAQCAtMjYsOCArMjYsNyBAQCB0c3JlYWRjb25maWcoKTsKIHNlbGVjdGJ1aWxkaG9zdChcQEFS
R1YpOwogYnVpbGRkaXJzcHJvcHMoKTsKIAotb3VyICVzdWJtb2RtYXAgPSBxdyhnbnVsaWIgZ251
bGliCi0gICAgICAgICAgICAgICAgICAgIGtleWNvZGVtYXBkYiBrZXljb2RlbWFwZGIpOworb3Vy
ICVzdWJtb2RtYXAgPSBxdyhrZXljb2RlbWFwZGIga2V5Y29kZW1hcGRiKTsKIG91ciAkc3VibW9k
dWxlczsKIAogc3ViIGxpYnZpcnRkX2luaXQgKCk7CkBAIC01MCwxMiArNDksNiBAQCBzdWIgY29u
ZmlnKCkgewogICAgIH0KICAgICBkaWUgIm5vIHhlbiBwcmVmaXgiIHVubGVzcyAkeGVucHJlZml4
OwogCi0gICAgIyBVc2VzIC0tbm8tZ2l0IGJlY2F1c2Ugb3RoZXJ3aXNlIGF1dG9nZW4uc2ggd2ls
bCB1bmRvCi0gICAgIyBzdWJtb2R1bGVmaXh1cCdzIGF0dGVtcHRzIHRvIGhvbm91cgotICAgICMg
cmV2aXNpb25fbGlidmlydF9nbnVsaWIuIFRoaXMgaW4gdHVybiByZXF1aXJlcyB0aGF0IHdlIHNw
ZWNpZnkKLSAgICAjIC0tZ251bGliLXNyY2RpciwgYnV0IC4vYXV0b2dlbi5zaCBkb2Vzbid0IHBy
b3BhZ2F0ZQotICAgICMgLS1nbnVsaWItc3JjZGlyIHRvIC4vYm9vdHN0YXAgc28gd2UgdXNlIEdO
VUxJQl9TUkNESVIgZGlyZWN0bHkuCi0gICAgbXkgJGdudWxpYiA9IHN1Ym1vZHVsZV9maW5kKCRz
dWJtb2R1bGVzLCAiZ251bGliIik7CiAgICAgdGFyZ2V0X2NtZF9idWlsZCgkaG8sIDM2MDAsICRi
dWlsZGRpciwgPDxFTkQpOwogICAgICAgICBjZCBsaWJ2aXJ0CiAJbWtkaXIgYnVpbGQKQEAgLTYz
LDEwICs1Niw5IEBAIHN1YiBjb25maWcoKSB7CiAgICAgICAgIENGTEFHUz0iLWcgLUkkeGVucHJl
Zml4L2luY2x1ZGUvIiBcXAogICAgICAgICBMREZMQUdTPSItZyAtTCR4ZW5wcmVmaXgvbGliLyAt
V2wsLXJwYXRoLWxpbms9JHhlbnByZWZpeC9saWIvIiBcXAogICAgICAgICBQS0dfQ09ORklHX1BB
VEg9IiR4ZW5wcmVmaXgvbGliL3BrZ2NvbmZpZy8iIFxcCi0gICAgICAgIEdOVUxJQl9TUkNESVI9
JGJ1aWxkZGlyL2xpYnZpcnQvJGdudWxpYi0+e1BhdGh9IFxcCi0gICAgICAgICAgICAuLi9hdXRv
Z2VuLnNoIC0tbm8tZ2l0IFxcCi0gICAgICAgICAgICAgICAgICAgICAgICAgLS13aXRoLWxpYnhs
IC0td2l0aG91dC14ZW4gLS13aXRob3V0LXhlbmFwaSAtLXdpdGhvdXQtc2VsaW51eCBcXAotICAg
ICAgICAgICAgICAgICAgICAgICAgIC0td2l0aG91dC1seGMgLS13aXRob3V0LXZib3ggLS13aXRo
b3V0LXVtbCBcXAorICAgICAgICAgICAgLi4vYXV0b2dlbi5zaCBcXAorICAgICAgICAgICAgICAg
ICAgICAgICAgIC0td2l0aC1saWJ4bCAtLXdpdGhvdXQtc2VsaW51eCBcXAorICAgICAgICAgICAg
ICAgICAgICAgICAgIC0td2l0aG91dC1seGMgLS13aXRob3V0LXZib3ggXFwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLXdpdGhvdXQtcWVtdSAtLXdpdGhvdXQtb3BlbnZ6IC0td2l0aG91dC12
bXdhcmUgXFwKICAgICAgICAgICAgICAgICAgICAgICAgICAtLXN5c2NvbmZkaXI9L2V0YyAtLWxv
Y2Fsc3RhdGVkaXI9L3ZhciAjLwogRU5ECi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
