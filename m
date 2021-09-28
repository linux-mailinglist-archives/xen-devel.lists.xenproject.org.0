Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43941B2E3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 17:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198090.351407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVExt-0004kd-TO; Tue, 28 Sep 2021 15:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198090.351407; Tue, 28 Sep 2021 15:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVExt-0004ha-PG; Tue, 28 Sep 2021 15:24:17 +0000
Received: by outflank-mailman (input) for mailman id 198090;
 Tue, 28 Sep 2021 15:24:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVExr-0004hU-Nt
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:24:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2318f366-2070-11ec-bca5-12813bfff9fa;
 Tue, 28 Sep 2021 15:24:14 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-d1uoH8ElNwOgqGdskh5hrg-1; Tue, 28 Sep 2021 17:24:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Tue, 28 Sep
 2021 15:24:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 15:24:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10 via Frontend Transport; Tue, 28 Sep 2021 15:24:09 +0000
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
X-Inumbo-ID: 2318f366-2070-11ec-bca5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632842653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bVjcc+lf5Xi6q3iAJ2+J5FXpDka7fe4/UpOPtnl/kho=;
	b=foO1090//iD8mA+pd59VmRM80SodVjO0PYSHH1JSkg42W04uX9TPHU2sI21OomndO0z1BE
	sHSoYTqRtsfIXaxFQvBLmqpyiijmwGdwJoInNyMKisECRkFl8Ybc+MuL1XNOHcNqPy87mm
	hU0uqN76d3EoPsijYgEV2Nq+3ZkDtmk=
X-MC-Unique: d1uoH8ElNwOgqGdskh5hrg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt/LdWA9YFNTp8PeQJNjaeV5hlkUovoXTqCJLuNXIx8sVCLLg1Ap4FF0ErMCABSkfVkAvpV4ZzuIMSsT/X8DbgiLXspG6KNMzhxSaBgnqnttuPtubxuCq+cCA6+r/+Iq5Vkt1CDhcBZS9XjxrWQMYgfWb4rGWpOxTApchZ6fOvpYZqRNwm7PsdT59sn9h0ivpsaN9n1HqGCj3+Luy9Nu/dOfDBMc6Dn8OhDNuSLP+0c9Q7I0mpx4G60YB6hwDys98wC62a/8kwAOrxfV8rN6zEuVQ4i2OEcA94yVKATvyK0eGXLKVa5bKk1YDqBAIuL05r/ZinxSYS1KTAvjA1i7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bVjcc+lf5Xi6q3iAJ2+J5FXpDka7fe4/UpOPtnl/kho=;
 b=cL46ktlba3N+/Mp3Li4EmErijdScFf3pTb/tjV+8xC2f6MiBbc97U34oofO/idPk/soYsLi0Xow2VRGJNk730qS45MiEJsBvs1dOT28J89Vvc+7KcS/mbpNGC3huWHJ6zPUEXrLxZ4AoAp3jWNPvZ4ugSFuQIrxGb9+bHLhfUDWg4zh+PpOnkUOQJBBo5S9xByN13AHvtCRfzuYlyHJFFd+t2xZb1n8GgYMiN/NVw1K3wAb6FtgNmSAYMGHOgxh0GJzaXviLFtu4Dh22trr1JPEAQfucvVhsB1jNdyuXaeavGgQ9T/PtMq5e1Z7bXjUb5HU4JlSV1JB86dFJ4xAt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Julien Grall <julien.grall.oss@gmail.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, dpsmith@apertussolutions.com
References: <osstest-164996-mainreport@xen.org>
 <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
 <19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
 <alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1W9BqeOGFu3F2+qbXM6UNo8ZO=0y-zYsnK01MNSNdbkw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dda286dc-1edc-4505-a049-e82047b44590@suse.com>
Date: Tue, 28 Sep 2021 17:24:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAJ=z9a1W9BqeOGFu3F2+qbXM6UNo8ZO=0y-zYsnK01MNSNdbkw@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------AA895F193E45FFD3D63817C7"
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5bf7880-c2d8-4174-b737-08d9829404f1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37754BD5CEA03BB9A1041CEAB3A89@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rsHwtHMII1rnux4huVEuOd6PCxVqp1fzDdkqXf2RN0IX18uQNgfQgwmmkkdW+Jfbrlf8GiugjwQVwO/uifZKZCM8hCQqNT17EGjzub7JuTSe0RLVMqvQy/Ns/yG0MVyP3YAQRhhjF+4DgkSA1tGL44Y3SpgooL5AbML+lWDIia8gLJQmR4ASphMOXWCKB/amVIU1lCu9i13oRBoj3Ap8kC92j5ML/ftqmejr2XCkQBbVO8fyYClP2F5MYaJwMaJ+tWW+HHmdWj9entCjstKP1zGAm3mfnJwQjQvHyGH4DuCy2XRt/7JmHXPd28ReUICHatGsLqn+3apdX5kT91hIXITUfowQXQMn0ct0zWm+SScSj5rjW0rYXYmEimH+tpfC32WwWQkNzqDV8c+J0qLI0oi8NmlzZ1OvpnD8eJ9o9d+hBMmJqgYZosAVYwd8YfzymveR/C48ycmAZjimyzFJ7yLOCVuM6klF78w3D9Os2utzorrSRMTzm1XV+woyxd0asQVoa0rwJky9fhIXoWpo/LBwKXT0uUbT1752fDXeeVuhORj3dEjYuGY+yxrfT7fQIZ3XZh7kE6F0lnNXqtQNWlZ6WfTIMtU9C4wJUL9VRrczybvZx40tXQUNMZsnMjkTyaXyDiodiN1eBejGwoiw6nNuESHWgsHWJH3ohhoyKBFVrwwAqk+El4Ac/eYxEUtVzB3BKniKj2PVRrzXDTGHPE2RPvlYoulPKaZhGICapvst5j6tAqx6W2NoqM6Xqrj6cjMmeMhI/xt9KrMVBCAx4H6Hva9nWDK829ch8SucTftnjeV/L5ErVO//p1HGsOSN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(8936002)(8676002)(83380400001)(186003)(36756003)(2616005)(956004)(66946007)(66476007)(66616009)(86362001)(38100700002)(66556008)(53546011)(31696002)(54906003)(6486002)(33964004)(2906002)(316002)(16576012)(508600001)(235185007)(110136005)(26005)(966005)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC95Z1AvK0o5Ymlpd3VDcWx6bmFmS3laalpoRmZMMzVUMUk0c2gxZDMzNWNM?=
 =?utf-8?B?R0tldHVVSWcyaUZ5ZTF6eGxONmVKeHJNaTIyODc3aldxQ3E1U3JuOFU4RkE3?=
 =?utf-8?B?UW5TTHlMQ1JHVWZCSGtYU1hDd0wvSnE2eWpzK0VNQTAydkgvdnpFUTB5d2gz?=
 =?utf-8?B?OVJneXFzbTAydUdkdGd4b1FQUVovZTlLZXBjcytackJZUjk3ZVI4OFNrMEhY?=
 =?utf-8?B?bXFKSzFoWUh3VW9yclFCK2cyM1ZvdWxhaFdEYTJJelNhd1ZBU0NkTFpuL0c4?=
 =?utf-8?B?d2JlekIrS3duditVdWxPR3I0MUxLTlNGQXB6WkRPVW1lVVlNR0NqWjVwYjdr?=
 =?utf-8?B?eFZwLzZvOFkwUEt2eVBRUll3Yk1aSU5zL0EyaFI1ZWg5YS9LQzMvU0RBSTRK?=
 =?utf-8?B?ZHdtVE84bFZoS0taVjJXYkZuY1ZQei9RMDM3YStFemVnSGpVcXFZV21veERw?=
 =?utf-8?B?N1huQmIxbUVPaWpjbjluUGpvSnQ3MUg0TWZTbDBVZWorUlp1eFFzT0VHSHdE?=
 =?utf-8?B?RXNnWnhQRFpoelJVMHlmR214b3k4d04wUDdBQTRuc0lOUzZ5a2o3S2tJSS8v?=
 =?utf-8?B?NkFVWVlkM1hMMmE4dE5BTkJEV013dDFuY3JNUHAwc0lLSG1HTTBTYjlDNU12?=
 =?utf-8?B?YjlwNlVqM2FkWm9iNFZmams0MjhMeWt2aFY3QTBqSDZCWmhtNWdsS1hndlhZ?=
 =?utf-8?B?TkI5VUFJQU5qWEp3ZTE3eExEbGNJd1VMemQwTHA4ejlMazEwVU93U1pqOTVy?=
 =?utf-8?B?V0FPdlM1ZS9XcnBZNWcvcGFlN3ZOajdrOGNmRk9BZXhCSlQvd3puTlRNZUdV?=
 =?utf-8?B?MGtYUXdhbDdqYkN0REh5bk5lcU5DaCtRckQ0UE4vTldFeHlENktuSUtOYTMy?=
 =?utf-8?B?a0Z2bE9LbjN5dlVXRndPUHFYd2crT21iNDNDN2tRb0phNWNrTjg4VU5JckU4?=
 =?utf-8?B?TE1obC9IeHBwNS9CenRpODZGUG9xeHowOFA3UWRaUkszczJsdTIvdU56bHJH?=
 =?utf-8?B?VG9waERiTUQ3b0g2cmY2SUJmOS8xdzhWd3JlVkxyK3pEZ2FVdjBCTWFxYUFP?=
 =?utf-8?B?MUNTdm1FMzFQSDdHUHlMUlpkN1E0RjU3d3ZCSTN6VDJSRXl6ZTc3clVkRFlS?=
 =?utf-8?B?VW9ROHYyVG5NRWxOOHRWYkM0clhhaXJZMUg5L1ZrUmxTQTNlbWxMbnN1UFBv?=
 =?utf-8?B?OEptNnNsYUZXbXF4MFovTGpyTkE0SithYncvS0FHYURGakMyb1VySEh1bUN3?=
 =?utf-8?B?VEJ3Q1Z0UC9LSExORGZIYzNxTlRBR1BkeWh6M0EvZ2R6UVY0cTgzZDM0ZlQy?=
 =?utf-8?B?YlZXbThUSTZGMnRWQmI3VFRONmFHeGlyN1RXN0EydzRCaW85Z0Q5NlN5NHp2?=
 =?utf-8?B?SEVkYUpQMlJMa2dSdzR6c2lUNzd1VHlwK0lnKzFMVGlUZUh6dGRNeXBqQ0kr?=
 =?utf-8?B?MHNnMFZ6dXRRWWRYZFg5T1JZK0UrUnc3RzBOWEtXWnRoKzgxKy9qUFNUQXVa?=
 =?utf-8?B?MFpCbjJZeTRVQU04NWh1V21Ca0ovMFR0MklIVGVoSjNrV3IwZGhLd3pGK0xz?=
 =?utf-8?B?bmxxWkNHU3d1MGFZaHB2SFZ4a3VYd1lrV1BuSnI4a05XUzl6dDBhZ25nOHlW?=
 =?utf-8?B?ckRlZW1ML3ZkdGtySFI0MUlMcCs4QjVJcnhaTG9WZWtVU3NOaEx3UXZxYjhy?=
 =?utf-8?B?ODE4WGVDUFIyUUpLb2hscHlvdGVHY2NXR0hacS9tUVdMUEtCN2UrS3RZbysx?=
 =?utf-8?Q?/l/xbNoXuX56Ya9vR9iOucacOq2kYCvEjeYEG+e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bf7880-c2d8-4174-b737-08d9829404f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 15:24:10.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQUNkmJDulU+tGvS4ZqY2shBrTgQLZTxsmvsrGv7svn7oIXHK7isuTb6rTsl7a+3tF6acOk0NfO+WPPNmd6/zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

--------------AA895F193E45FFD3D63817C7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 23.09.2021 04:56, Julien Grall wrote:
> We could push the patch in the branch we have. However the Linux we use is
> not fairly old (I think I did a push last year) and not even the latest
> stable.

I don't think that's a problem here - this looks to be 5.4.17-ish, which
the patch should be good for (and it does apply cleanly to plain 5.4.0).

Ian, for your setting up of a one-off flight (as just talked about),
you can find the patch at
https://lists.xen.org/archives/html/xen-devel/2021-09/msg01691.html
(and perhaps in your mailbox). In case that's easier I've also attached
it here.

Jan

--------------AA895F193E45FFD3D63817C7
Content-Type: text/plain; charset=UTF-8;
 name="linux-5.15-rc2-xen-privcmd-mmap-kvcalloc.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="linux-5.15-rc2-xen-privcmd-mmap-kvcalloc.patch"

eGVuL3ByaXZjbWQ6IHJlcGxhY2Uga2NhbGxvYygpIGJ5IGt2Y2FsbG9jKCkgd2hlbiBhbGxvY2F0
aW5nIGVtcHR5IHBhZ2VzCgpPc3N0ZXN0IGhhcyBiZWVuIHN1ZmZlcmluZyB0ZXN0IGZhaWx1cmVz
IGZvciBhIGxpdHRsZSB3aGlsZSBmcm9tIG9yZGVyLTQKYWxsb2NhdGlvbiBmYWlsdXJlcywgcmVz
dWx0aW5nIGZyb20gYWxsb2NfZW1wdHlfcGFnZXMoKSBjYWxsaW5nCmtjYWxsb2MoKS4gQXMgdGhl
cmUncyBubyBuZWVkIGZvciBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMgc3BhY2UgaGVyZSwKc3dpdGNo
IHRvIGt2Y2FsbG9jKCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpSRkM6IEkgY2Fubm90IHJlYWxseSB0ZXN0IHRoaXMs
IGFzIGFsbG9jX2VtcHR5X3BhZ2VzKCkgb25seSBnZXRzIHVzZWQgaW4KICAgICB0aGUgYXV0by10
cmFuc2xhdGVkIGNhc2UgKGkuZS4gb24gQXJtIG9yIFBWSCBEb20wLCB0aGUgbGF0dGVyIG9mCiAg
ICAgd2hpY2ggSSdtIG5vdCB0cnVzdGluZyBlbm91Z2ggeWV0IHRvIGFjdHVhbGx5IHN0YXJ0IHBs
YXlpbmcgd2l0aAogICAgIGd1ZXN0cykuCgpUaGVyZSBhcmUgcXVpdGUgYSBmZXcgbW9yZSBrY2Fs
bG9jKCkgd2hlcmUgaXQncyBub3QgaW1tZWRpYXRlbHkgY2xlYXIKaG93IGxhcmdlIHRoZSBlbGVt
ZW50IGNvdW50cyBjb3VsZCBwb3NzaWJseSBncm93IG5vciB3aGV0aGVyIGl0IHdvdWxkIGJlCmZp
bmUgdG8gcmVwbGFjZSB0aGVtIChpLmUuIHBoeXNpY2FsbHkgY29udGlndW91cyBzcGFjZSBub3Qg
cmVxdWlyZWQpLgoKSSB3YXNuJ3Qgc3VyZSB3aGV0aGVyIHRvIENjIHN0YWJsZUAgaGVyZTsgdGhl
IGlzc3VlIGNlcnRhaW5seSBoYXMgYmVlbgpwcmVzZW50IGZvciBxdWl0ZSBzb21lIHRpbWUuIEJ1
dCBpdCBkaWRuJ3QgbG9vayB0byBjYXVzZSBpc3N1ZXMgdW50aWwKcmVjZW50bHkuCgotLS0gYS9k
cml2ZXJzL3hlbi9wcml2Y21kLmMKKysrIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jCkBAIC00MjAs
NyArNDIwLDcgQEAgc3RhdGljIGludCBhbGxvY19lbXB0eV9wYWdlcyhzdHJ1Y3Qgdm1fYQogCWlu
dCByYzsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOwogCi0JcGFnZXMgPSBrY2FsbG9jKG51bXBncywg
c2l6ZW9mKHBhZ2VzWzBdKSwgR0ZQX0tFUk5FTCk7CisJcGFnZXMgPSBrdmNhbGxvYyhudW1wZ3Ms
IHNpemVvZihwYWdlc1swXSksIEdGUF9LRVJORUwpOwogCWlmIChwYWdlcyA9PSBOVUxMKQogCQly
ZXR1cm4gLUVOT01FTTsKIApAQCAtNDI4LDcgKzQyOCw3IEBAIHN0YXRpYyBpbnQgYWxsb2NfZW1w
dHlfcGFnZXMoc3RydWN0IHZtX2EKIAlpZiAocmMgIT0gMCkgewogCQlwcl93YXJuKCIlcyBDb3Vs
ZCBub3QgYWxsb2MgJWQgcGZucyByYzolZFxuIiwgX19mdW5jX18sCiAJCQludW1wZ3MsIHJjKTsK
LQkJa2ZyZWUocGFnZXMpOworCQlrdmZyZWUocGFnZXMpOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9
CiAJQlVHX09OKHZtYS0+dm1fcHJpdmF0ZV9kYXRhICE9IE5VTEwpOwpAQCAtOTEyLDcgKzkxMiw3
IEBAIHN0YXRpYyB2b2lkIHByaXZjbWRfY2xvc2Uoc3RydWN0IHZtX2FyZWEKIAllbHNlCiAJCXBy
X2NyaXQoInVuYWJsZSB0byB1bm1hcCBNRk4gcmFuZ2U6IGxlYWtpbmcgJWQgcGFnZXMuIHJjPSVk
XG4iLAogCQkJbnVtcGdzLCByYyk7Ci0Ja2ZyZWUocGFnZXMpOworCWt2ZnJlZShwYWdlcyk7CiB9
CiAKIHN0YXRpYyB2bV9mYXVsdF90IHByaXZjbWRfZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYp
Cg==

--------------AA895F193E45FFD3D63817C7--


