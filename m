Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A91770EA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 09:16:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j92fk-0006Yw-G7; Tue, 03 Mar 2020 08:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5UWX=4U=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1j92fi-0006Yr-G8
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 08:12:58 +0000
X-Inumbo-ID: c7185330-5d26-11ea-a0a1-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.98]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7185330-5d26-11ea-a0a1-12813bfff9fa;
 Tue, 03 Mar 2020 08:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpjk7gZTrYOiox0HwCmOW2ZJv13N9INM7cEt5G1O1AHSqYoEtIK91bNxXsR4X3iV7PgjG1XlckZewpRHVsbckFCEcsnUSmlh95048evXIyRU0cfhoP8L8rEI4CQQn8Ie85N8O34X47LVbwOy125P2wK58Nf5DyhUK/ZzfyQ8U4XNrjGX6ShVRvhcfFflWTocCd9i64Ys0cAShZeYBDktXhzk54CDM3kUjtZf5F3d5OkjEvnTFLQkSVE4MOpAVrA7DpgTJac1f7PZsjkPRPCYjLKmVUOq55NrYyozGB0A/Io/6M2BLyW93KXg+FDYPnu7MIuhJmYK2HCbrtqVAZ4kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=469FiHZuZry8HBY8cmslj/6UeoVwRhHUEw0zxLSxSrs=;
 b=M6KkgsjvTGkVvtsDSN2eEw0EX2bZwofMCZ5H4egR26HIjTHGM9LtsuMCvh2wBD7zb7c/C52utwV81lbqbjBciYJA+UxjNYOSfdt4o0rV/QW55G6UJ5zCEwyKkU7epfB5t59GLsORWlxT79T5m4/GPPR+dx858RzGPcoIpGL6QyB5T7/wtZddE7uYinLFtNQwZuos8Vp5LvE0+QqeZNFlKwITjlLJrZdniOcKcmpPhYrP7hr87PwTUhrbspP8CP4rJZQkpnxIllgl4sxj2fVIcLhtD2jZ+6yKlcDnM65eymoe5qt+c+jHiR8XdI9ukqwL25AprvAT3L9vydLjwfdauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=469FiHZuZry8HBY8cmslj/6UeoVwRhHUEw0zxLSxSrs=;
 b=hA8VFpSldK0AokXbCFB0kAYNKqTx5t9dy8dwo5bK8RhancPWLQHFq1jV1M+yKVMUrElpAjmILjo2Zz7ZwAFK+Ilkxfl7ZcCOIdEqTgCQbXNJA83JiPHT7h3960rVCYNmJBPSq+znbj3dt+BH25C+Y2mJMr3eMgapxdMWK89+Hvc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3287.eurprd08.prod.outlook.com (52.135.161.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 3 Mar 2020 08:12:49 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 08:12:49 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <87y2shdg00.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200303111246391
Message-ID: <87abeabb-c8ee-ed6f-6b3a-b3fc24d07b89@virtuozzo.com>
Date: Tue, 3 Mar 2020 11:12:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87y2shdg00.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Tue, 3 Mar 2020 08:12:48 +0000
X-Tagtoolbar-Keys: D20200303111246391
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6451adb3-e14e-4ca2-66b5-08d7bf4aa989
X-MS-TrafficTypeDiagnostic: AM6PR08MB3287:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3287FE441B1DA4DAFD75BE7CC1E40@AM6PR08MB3287.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03319F6FEF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(136003)(39850400004)(366004)(189003)(199004)(16526019)(81156014)(36756003)(86362001)(6916009)(6486002)(7416002)(54906003)(478600001)(16576012)(52116002)(81166006)(8676002)(8936002)(186003)(66946007)(31696002)(66556008)(66476007)(4744005)(4326008)(2616005)(5660300002)(26005)(2906002)(31686004)(316002)(956004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3287;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+fhlR43Eb8qE71knmAwcIdZfEYV+HMReDGVbQzJhIyfaP6N5th+aMZZKzCMn0xj6g9GDpcOtr3JSxyJRsuRrlum++6ZDAmH56E3Z3ZVoQ16sK9nr1wxbKw43trO3L/5Oi5/hR/Ql7DmQwKQBhxKi45swGwLA1nSgR6Yf4LtD//+9sAl+1HdrmreMN2PY4njlqg0lK2bOOsLLDDT63LjfZfUh3DOmVVLNCkzJyYAHONVd5RKyfgWoGwPsTGlodyyO3+BPmwqhc46dVYHgNefazxXnipu3EbMtOCFjSgQzlXdRUKUobTPf7wc29NKmFGbYoPqVh0rzdWqNx9jHxAYwMd4XV2P74EW3DMDqpL7BRiTmIiYxLWflnBy1lgWcJocww6M/+qqL7qcqSzDV1NYMwNIqd0RpEXV3P6i/ceJ6d1ztUmpoujW9OlYtw+UOUAN
X-MS-Exchange-AntiSpam-MessageData: gNY935rUtjuY+dLqkQAG2EomnVrdof9fV2ZE8NJPWI/84lkFti0/p3UDeThaiEihHbgO6kDAS2tgYeTvseXHAi0MH6YLt7VFEyiCksj/Mpb4pjaNOcxq0SEeOhueGsgjq+OjLyX/u3qBeDLLLKXVnA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6451adb3-e14e-4ca2-66b5-08d7bf4aa989
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2020 08:12:49.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xs/SFqutS1jlJmj54CFKn+LXdWeRmPK1P2PYuMlAZ1iNZ1VGqy10o5/wM+yz4gAyFuox+D+praoIySRrD7aZfsVr9Zmaj+xKegrAGunkZkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3287
Subject: Re: [Xen-devel] [PATCH v7 00/11] error: auto propagated local_err
 part I
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MDMuMDMuMjAyMCAxMTowMSwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gSGkgVmxhZGltaXIs
Cj4gCj4gSSd2ZSBjb21lIHRvIHJhdGhlciBsaWtlIHlvdXIgRVJSUF9BVVRPX1BST1BBR0FURSgp
IGlkZWEuICBXaGF0IEkKPiB3b3VsZG4ndCBsaWtlIGlzIGEgcHJvdHJhY3RlZCBjb252ZXJzaW9u
Lgo+IAo+IE9uY2Ugd2UncmUgaGFwcHkgd2l0aCBQQVRDSCAxLTMsIGl0J3MgYSBtYXR0ZXIgb2Yg
cnVubmluZyBDb2NjaW5lbGxlIGFuZAo+IHJldmlld2luZyBpdHMgb3V0cHV0LiAgSSdtIGNvbmZp
ZGVudCB3ZSBjYW4gY29udmVyZ2Ugb24gUEFUQ0ggMS0zLgo+IAo+IEl0J3MgdHdvIHdlZWtzIHVu
dGlsIHNvZnQgZnJlZXplLiAgV2UgbmVlZCB0byBkZWNpZGUgd2hldGhlciB0byBwdXJzdWUgYQo+
IHBhcnRpYWwgY29udmVyc2lvbiBmb3IgNS4wIChiYXNpY2FsbHkgdGhpcyBzZXJpZXMgcGx1cyB0
aGUgdHdvIHBhdGNoZXMKPiB3ZSBpZGVudGlmaWVkIGluIHJldmlldyBvZiBQQVRDSCAxKSwgb3Ig
ZGVsYXkgdW50aWwgNS4xLiAgSW4gZWl0aGVyCj4gY2FzZSwgSSB3YW50IHRoZSBjb252ZXJzaW9u
IHRvIGJlIGZpbmlzaGVkIGluIDUuMS4KPiAKPiBQbGVhc2UgZG8gbm90IGZlZWwgcHJlc3N1cmVk
IHRvIG1ha2UgdGhlIDUuMCBkZWFkbGluZS4KPiAKPiBJIGNhbiBxdWV1ZSB1cCBwYXRjaGVzIGZv
ciA1LjEgZHVyaW5nIHRoZSBmcmVlemUuCj4gCj4gSG93IHdvdWxkIHlvdSBsaWtlIHRvIHByb2Nl
ZWQ/Cj4gCgpIaSBNYXJrdXMhIEZ1bm55IGNvaW5jaWRlbmNlOiBleGFjdGx5IG5vdyAobGVzcyB0
aGFuIDEgaG91ciBhZ28pLCBJJ3ZlCnN0YXJ0ZWQgd29ya2luZyBmb3IgdGhlIG5leHQgdmVyc2lv
biBmb3IgdGhlc2Ugc2VyaWVzLiBTbywgSSdtIGdvaW5nIHRvCnJlc2VuZCB0b2RheS4gT2YgY291
cnNlLCBJJ2QgcHJlZmVyIHRvIG1lcmdlIHNvbWV0aGluZyB0byA1LjAgaWYgYXQgYWxsCnBvc3Np
YmxlLgoKCi0tIApCZXN0IHJlZ2FyZHMsClZsYWRpbWlyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
